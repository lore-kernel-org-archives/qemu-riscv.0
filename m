Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7977E8181E
	for <qemu-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 19:50:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qlE4L-0003ps-MB; Tue, 26 Sep 2023 15:50:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qlE4K-0003pU-GO
 for qemu-riscv@nongnu.org; Tue, 26 Sep 2023 15:50:04 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qlE4I-0001In-Nk
 for qemu-riscv@nongnu.org; Tue, 26 Sep 2023 15:50:04 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1c724577e1fso14555ad.0
 for <qemu-riscv@nongnu.org>; Tue, 26 Sep 2023 12:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695757801; x=1696362601; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uJTj/yG05+kNxL5qN2Z68Ih6ZRkTJzsbo+tX9aImP4Q=;
 b=SALLpOS3aCNOpKq52a5B2TPRCFIk7SNmZy/KG52tv1lVYqSA2tBL1IhoHPpL2lHyys
 mgzjmJPDOHkh9Tex+xFsSsA9OsdD5UdY9+yNu6NZbRmxBSdLBBiwiPHC6d/EDyzSTx6u
 Y9t2AB2WRoYnouews96EGtNlWL8OOY4OIGe/9YwHfEJ/ZBzZOSRAJ4RQzn/jfdtEZyve
 vrGK9aYfaHQoqz94svSIfuuRPBQ79iEfo+XxxxDkWZzaIqXzJfDufWDjXbMPVqU9yy7G
 YQFHzPRSgSfcMfokuzsQjssgHmRhf6VlHxFL6y75d7dXcIoO1bpqAy0xh5MQjxo7eU5X
 4Yzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695757801; x=1696362601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uJTj/yG05+kNxL5qN2Z68Ih6ZRkTJzsbo+tX9aImP4Q=;
 b=g2cVum3wk4pMyj1ALfK8qg2Wqa1/0BAwaKgCBYuJMqpPbJqjM8FETmScllqZIhKdIz
 bmgXZ4eelZNZ3UWUw2fQG8xDMg/2ApGJTIJkVGrI6htVNLBtRDy1yHXh1HG3xqnndBA1
 n4CDNzThcWTyNDooy6mLvIaAAqu8meciO4YQvYUTqUiYKz4nlkmffLyHbOLP8NeFbr0v
 MPQlPUXCRabLfg25rEuBNhSfYjIiSsiN28IFj34DJDZcfPad0WMnjEYfe+53oDcMb5N5
 kjSfTLzNUU+ksXFpKHlx3m7w5c4TO5t8QMeEAtmhvxSilxUCTDNf+svWfgE3VQxACS1h
 qOaw==
X-Gm-Message-State: AOJu0YweZnZeoVUqn5378y+ur2I2Os10kyiaf+2cPeZfVzbRDZ+OfVAV
 Zy37jZDFRjv/qtJQM4g47rru7A==
X-Google-Smtp-Source: AGHT+IFzvAAydcNlqALCblWijRPuPjEyYaJ93BTyHW1tJFMx6r5iowFi9SHz6io+sysr2eJENYwRiw==
X-Received: by 2002:a17:902:a988:b0:1c5:d8a3:8781 with SMTP id
 bh8-20020a170902a98800b001c5d8a38781mr10768899plb.55.1695757801054; 
 Tue, 26 Sep 2023 12:50:01 -0700 (PDT)
Received: from grind.. ([177.94.42.59]) by smtp.gmail.com with ESMTPSA id
 l6-20020a170902f68600b001c41e1e9ca7sm11386010plg.215.2023.09.26.12.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Sep 2023 12:50:00 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 1/6] target/riscv/cpu.c: add zicntr extension flag
Date: Tue, 26 Sep 2023 16:49:45 -0300
Message-ID: <20230926194951.183767-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230926194951.183767-1-dbarboza@ventanamicro.com>
References: <20230926194951.183767-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

zicntr is the Base Counters and Timers extension described in chapter 12
of the unprivileged spec. It describes support for RDCYCLE, RDTIME and
RDINSTRET.

QEMU already implements it way before it was a discrete extension.
zicntr is part of the RVA22 profile, so let's add it to QEMU to make the
future profile implementation flag complete.

Given than it represents an already existing feature, default it to
'true'. Change the realize() time validation to disable it in case its
dependency (icsr) isn't present.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c         | 7 +++++++
 target/riscv/cpu_cfg.h     | 1 +
 target/riscv/tcg/tcg-cpu.c | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 521bb88538..8783a415b1 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -79,6 +79,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zicbom, PRIV_VERSION_1_12_0, ext_icbom),
     ISA_EXT_DATA_ENTRY(zicboz, PRIV_VERSION_1_12_0, ext_icboz),
     ISA_EXT_DATA_ENTRY(zicond, PRIV_VERSION_1_12_0, ext_zicond),
+    ISA_EXT_DATA_ENTRY(zicntr, PRIV_VERSION_1_12_0, ext_icntr),
     ISA_EXT_DATA_ENTRY(zicsr, PRIV_VERSION_1_10_0, ext_icsr),
     ISA_EXT_DATA_ENTRY(zifencei, PRIV_VERSION_1_10_0, ext_ifencei),
     ISA_EXT_DATA_ENTRY(zihintntl, PRIV_VERSION_1_10_0, ext_zihintntl),
@@ -1265,6 +1266,12 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("svnapot", ext_svnapot, false),
     MULTI_EXT_CFG_BOOL("svpbmt", ext_svpbmt, false),
 
+    /*
+     * Always default true - we'll disable it during
+     * realize() if needed.
+     */
+    MULTI_EXT_CFG_BOOL("zicntr", ext_icntr, true),
+
     MULTI_EXT_CFG_BOOL("zba", ext_zba, true),
     MULTI_EXT_CFG_BOOL("zbb", ext_zbb, true),
     MULTI_EXT_CFG_BOOL("zbc", ext_zbc, true),
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 0e6a0f245c..671b8c7cb8 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -62,6 +62,7 @@ struct RISCVCPUConfig {
     bool ext_zksh;
     bool ext_zkt;
     bool ext_ifencei;
+    bool ext_icntr;
     bool ext_icsr;
     bool ext_icbom;
     bool ext_icboz;
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index a90ee63b06..ce0fde0f5d 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -542,6 +542,10 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zksh), true);
     }
 
+    if (cpu->cfg.ext_icntr && !cpu->cfg.ext_icsr) {
+        cpu->cfg.ext_icntr = false;
+    }
+
     /*
      * Disable isa extensions based on priv spec after we
      * validated and set everything we need.
-- 
2.41.0


