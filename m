Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6D5CAC598
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 08:44:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uy4mL-0007zF-FQ; Mon, 15 Sep 2025 04:41:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1uy4ly-0007XX-3A
 for qemu-riscv@nongnu.org; Mon, 15 Sep 2025 04:41:19 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1uy4lh-0002PF-IG
 for qemu-riscv@nongnu.org; Mon, 15 Sep 2025 04:41:17 -0400
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-b522fd4d855so2958305a12.1
 for <qemu-riscv@nongnu.org>; Mon, 15 Sep 2025 01:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1757925656; x=1758530456; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NhMmTfFoDwvXS9pekfyE6D9LZ1tYlMgaaUM52Ww6Wx0=;
 b=J2w4lMje8rJJpg7HdFyn+w7y7z77xYCoG7kWHiaam11sGLGOCzf7/8W2YzptdOm+0K
 JDmdOED7ZVN1HEGEUGIBSXgjKd01QYh0yf2j1Gn5G1byOnKbudR0B/yAHGkhW0m2fGWf
 STot+LcA7libLspLQ3+p4Vx7HGn5poYxDvp6oZIwmg3faXjhqcLBtUb0uowCCZBEWRlw
 3ha19Y2ekxrZ/jqZFwkZZr58H5vvFnXjphOA6E/X9lzPwXAe9Yp+NNubQUSrUSQycnlu
 u+Kwd6vhbmMuHHYweNQaAP+IYveoXG4Bldk5Y5OLdMbppqSItLJpktlX7O9JWq0l/JwM
 pdBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757925656; x=1758530456;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NhMmTfFoDwvXS9pekfyE6D9LZ1tYlMgaaUM52Ww6Wx0=;
 b=YrdSQghIKLp0aEBdC0USX+eScrVFDnrdb6s8BBr39hWsWgQReXg7jId+xNhM/a2ixZ
 8XB67ezyFE0tRhaGjiqge7h3LPjctccAJRBy1X76mHsGlSEJ7MMeUyYcOvffEX3/Ss2C
 7ziOH+4YxR9yLeBaOS8OEmbigXEs9AxACM3wkv7NCmcX0+reP91uGzAZIxZbFVGCwQ/p
 togLpy1AvE+YPAy2qFQwX1jbFf+Pi4BQU2aojAS+HdiWkzrpWVLk+epmwKvHCbmn+WPa
 piScJBBO0sbt7HS/inmpqKZyz7a4z9q2cIUQecQvqQqbgCNIf6Kw6jcbKBr0wKkHFeGM
 vHDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6XxLnxpMp/gCLkcZftb9SZq231WPwSTwtT1BpQG6VIHkmeRH9WnykTPXOsCNGNaSG/t3ePepU408J@nongnu.org
X-Gm-Message-State: AOJu0YwPFuy9j3QqQrQpIASuKIfpkLmFhWuRl5BiZRVvADzE4hWcGdq0
 hWeKd/wOE73qbbQCU1vK8d7YV9EggD554wVXlPa/YAlpVdbFuJKdsM2bHHzg5463I1k=
X-Gm-Gg: ASbGncuNIaBDU7uzeNQoRB/sC/dPyxCoHm9mr4+hrjfBfSq+w6jRk0tf9avpLNiqm9D
 QrAyyZlBmA6rwRR7yoFo7uvy7sEx6GkcAxuYfkBRqRqJL7kPpLP6sPPs3wD78WxT/cnqQKIRzFL
 DZ37kNocoeb8c/6qasq+6swGCYBh+I/f2f+cJJLRW2gdzYxgf1Ok0mN5tsPOuzV8H3alDUulTRF
 LkFJ/8Uongf429Xf7lL23NCR+Z8R0JZw6oqGz/8ffFuS+xTx1CNSvsIwTqpGHEizKe7MUIBzNDN
 VSFa9IsVmc83fUD7tTFt+cknaslpHgmCSHMw1xZfZ9DlVxo5rBYlV3KsysqsP9Q5Iwc1OTqMgWS
 1PCcuvXJsP8mit1DGBIZy4EqElj+m84mcF7W3DPGfuZpUJLAxpnN0J3oNZmUCGAwxwqkcrNGZ/r
 vZkQ==
X-Google-Smtp-Source: AGHT+IGxyaYJmgKRu2cjfCccFrzO9nyEurzrGCCFFP3MJMvf6j3jS2v+mkqbjKVpqgcb0Y/nYhXchw==
X-Received: by 2002:a17:903:38cf:b0:25d:df7a:b1a4 with SMTP id
 d9443c01a7336-25ddf7ab55dmr142643985ad.12.1757925655716; 
 Mon, 15 Sep 2025 01:40:55 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26295996ff6sm55852045ad.64.2025.09.15.01.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 01:40:55 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Max Chou <max.chou@sifive.com>
Subject: [RFC PATCH 2/8] target/riscv: Add the Zvfbfa extension implied rule
Date: Mon, 15 Sep 2025 16:40:30 +0800
Message-ID: <20250915084037.1816893-3-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250915084037.1816893-1-max.chou@sifive.com>
References: <20250915084037.1816893-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=max.chou@sifive.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index fc0614dadba..b5c9f9ac586 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2576,6 +2576,15 @@ static RISCVCPUImpliedExtsRule SSCTR_IMPLIED = {
     },
 };
 
+static RISCVCPUImpliedExtsRule ZVFBFA_IMPLIED = {
+    .ext = CPU_CFG_OFFSET(ext_zvfbfa),
+    .implied_multi_exts = {
+        CPU_CFG_OFFSET(ext_zve32f), CPU_CFG_OFFSET(ext_zfbfmin),
+
+        RISCV_IMPLIED_EXTS_RULE_END
+    },
+};
+
 RISCVCPUImpliedExtsRule *riscv_misa_ext_implied_rules[] = {
     &RVA_IMPLIED, &RVD_IMPLIED, &RVF_IMPLIED,
     &RVM_IMPLIED, &RVV_IMPLIED, NULL
@@ -2589,8 +2598,8 @@ RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {
     &ZHINX_IMPLIED, &ZHINXMIN_IMPLIED, &ZICNTR_IMPLIED,
     &ZIHPM_IMPLIED, &ZK_IMPLIED, &ZKN_IMPLIED,
     &ZKS_IMPLIED, &ZVBB_IMPLIED, &ZVE32F_IMPLIED,
-    &ZVE32X_IMPLIED, &ZVE64D_IMPLIED, &ZVE64F_IMPLIED,
-    &ZVE64X_IMPLIED, &ZVFBFMIN_IMPLIED, &ZVFBFWMA_IMPLIED,
+    &ZVE32X_IMPLIED, &ZVE64D_IMPLIED, &ZVE64F_IMPLIED, &ZVE64X_IMPLIED,
+    &ZVFBFA_IMPLIED, &ZVFBFMIN_IMPLIED, &ZVFBFWMA_IMPLIED,
     &ZVFH_IMPLIED, &ZVFHMIN_IMPLIED, &ZVKN_IMPLIED,
     &ZVKNC_IMPLIED, &ZVKNG_IMPLIED, &ZVKNHB_IMPLIED,
     &ZVKS_IMPLIED,  &ZVKSC_IMPLIED, &ZVKSG_IMPLIED, &SSCFG_IMPLIED,
-- 
2.43.0


