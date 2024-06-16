Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96094C27C4F
	for <qemu-riscv@archiver.kernel.org>; Sun, 16 Jun 2024 02:48:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sIfvM-0007Qw-1A; Sat, 15 Jun 2024 22:47:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1sIfvG-0007NY-Uh
 for qemu-riscv@nongnu.org; Sat, 15 Jun 2024 22:47:17 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1sIfvF-0001hg-EQ
 for qemu-riscv@nongnu.org; Sat, 15 Jun 2024 22:47:14 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-6819d785528so2545070a12.3
 for <qemu-riscv@nongnu.org>; Sat, 15 Jun 2024 19:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1718506032; x=1719110832; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wqwE76CQo0Svp3wf95GRe/VgtMvrGF7qfdx6aXlVV2E=;
 b=Efh1i7C4cSBV4MPDdzwdG56GvezwwzE/fSFBV7obh5FpY6ZfLs5VXyFYFmgYnTSAnE
 uBKXzoIE/2RUYMD4QbH/0/NWHzY9LbR6GhK6jQ+gkMEjwMlgHKIy8K9ImFEAV3NZap7k
 C2LgPApF0ww/szZ8oaFZMVLZNrtr9nawCTTJKn+DH3axCIkDrePERBd7fg2+hwrjcRE4
 uoihCIV/wa/KwQTYyqfM6oNS6E8O+ki0AQPZ3fR717ZIZ8uFK6u9WOLdpyWIJsOLN4kl
 WbPyv0Y/xVAAH8byIWnoHRKV99IR2tIY+fkrjOCHths6vq709T389PI+NkSp2DEtiDji
 jldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718506032; x=1719110832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wqwE76CQo0Svp3wf95GRe/VgtMvrGF7qfdx6aXlVV2E=;
 b=qR2/jpz69E0TBsFTy19QBFsTs5EXCT9W9SyiXFRlPvf1seBaWFD2u00UjjAq60pTcC
 aJcYqCsF3bqAdQmq1uOqzdWrI/2IjjLlTiKHnIokFojkXhh3oyEKhHjVJelPh4YSor5G
 E/mjhw2Stsgzwp4XXAtRvlgcChYdvmor/GgbB4uVAQJjdjMX/d4MK9hx9X/1dTXnGfck
 WfkIfG2gIS09xmHYWbLiG9f2Aw8/qBy+gbmXz/InDfXZ95hxYdkdqfzsU0sHLQeB+BFD
 rbkPeZwIGvm+hFyhDXZbUMWEmkQ/M6UWw8/2tqOTM9gl3Z1vUlbRhWHvyBtep6lj0aWX
 agqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQnyiEZt0yY7ozzAe1Lx6TA0JxG19bRxI5DQm8jkCjgSQraVbACjyEcJkXmu7U7jJAHsW1yqw4QYpe1rMRfOFr4X2Mvhk=
X-Gm-Message-State: AOJu0YwqboTKMli6PScHM5FTNjXQ0rnB3LbHfcOcDlia9jygPr0DkPT7
 58HGcpHheXrkkIbw4rSKQv+EmMzcs6Qgg0vulv+Lp5m/lMRBsno79I+G0E13dRo=
X-Google-Smtp-Source: AGHT+IHXX137WNtDA7G1jtTkWSmPNDhh34VM5ttJo/6kxH2m14azQysbNIxhtDWcM7atKf4QUe+ocg==
X-Received: by 2002:a17:902:c94d:b0:1f7:1688:9e36 with SMTP id
 d9443c01a7336-1f86290073cmr72887745ad.48.1718506031945; 
 Sat, 15 Jun 2024 19:47:11 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855e7ca78sm56258705ad.106.2024.06.15.19.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jun 2024 19:47:11 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 Frank Chang <frank.chang@sifive.com>,
 Jerry Zhang Jian <jerry.zhangjian@sifive.com>,
 Max Chou <max.chou@sifive.com>
Subject: [PATCH v2 3/6] target/riscv: Add MISA implied rules
Date: Sun, 16 Jun 2024 10:46:54 +0800
Message-ID: <20240616024657.17948-4-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240616024657.17948-1-frank.chang@sifive.com>
References: <20240616024657.17948-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Frank Chang <frank.chang@sifive.com>

Add MISA extension implied rules to enable the implied extensions
of MISA recursively.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Jerry Zhang Jian <jerry.zhangjian@sifive.com>
Tested-by: Max Chou <max.chou@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 50 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index bacbb32120..d09b5e9e62 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2250,8 +2250,56 @@ RISCVCPUProfile *riscv_profiles[] = {
     NULL,
 };
 
+static RISCVCPUImpliedExtsRule RVA_IMPLIED = {
+    .is_misa = true,
+    .ext = RVA,
+    .implied_exts = {
+        CPU_CFG_OFFSET(ext_zalrsc), CPU_CFG_OFFSET(ext_zaamo),
+
+        RISCV_IMPLIED_EXTS_RULE_END
+    },
+};
+
+static RISCVCPUImpliedExtsRule RVD_IMPLIED = {
+    .is_misa = true,
+    .ext = RVD,
+    .implied_misas = RVF,
+    .implied_exts = { RISCV_IMPLIED_EXTS_RULE_END },
+};
+
+static RISCVCPUImpliedExtsRule RVF_IMPLIED = {
+    .is_misa = true,
+    .ext = RVF,
+    .implied_exts = {
+        CPU_CFG_OFFSET(ext_zicsr),
+
+        RISCV_IMPLIED_EXTS_RULE_END
+    },
+};
+
+static RISCVCPUImpliedExtsRule RVM_IMPLIED = {
+    .is_misa = true,
+    .ext = RVM,
+    .implied_exts = {
+        CPU_CFG_OFFSET(ext_zmmul),
+
+        RISCV_IMPLIED_EXTS_RULE_END
+    },
+};
+
+static RISCVCPUImpliedExtsRule RVV_IMPLIED = {
+    .is_misa = true,
+    .ext = RVV,
+    .implied_exts = {
+        CPU_CFG_OFFSET(ext_zve64d),
+
+        RISCV_IMPLIED_EXTS_RULE_END
+    },
+};
+
 RISCVCPUImpliedExtsRule *riscv_misa_implied_rules[] = {
-    NULL
+    &RVA_IMPLIED, &RVD_IMPLIED, &RVF_IMPLIED,
+    &RVM_IMPLIED, &RVV_IMPLIED, NULL
 };
 
 RISCVCPUImpliedExtsRule *riscv_ext_implied_rules[] = {
-- 
2.43.2


