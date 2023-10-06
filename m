Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EF4E81DF4
	for <qemu-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 13:22:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qokmF-0005vh-Ie; Fri, 06 Oct 2023 09:22:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qokm4-0005se-DM
 for qemu-riscv@nongnu.org; Fri, 06 Oct 2023 09:21:48 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qokm1-00037B-Al
 for qemu-riscv@nongnu.org; Fri, 06 Oct 2023 09:21:46 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1bf55a81eeaso16620595ad.0
 for <qemu-riscv@nongnu.org>; Fri, 06 Oct 2023 06:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1696598504; x=1697203304; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NMVHuyiFsO42tjOxhFdYGTRZuQvgsaSYtjyQZSpJNtk=;
 b=Kwib4899l1QuxYp3brFTxtyOUaCVfqYr6uZMb5NuHlXnBsYhdvhtXR3zvotM25OCan
 RHEp0TqROZzE88m+mEG6VLzujifZtg/Y5pekfLE4rJa3eqwwhmrFkWZUBEHu4SR1kYOY
 QGuODtp1j2euKIX8wmqBD0bqTmBR3e425uPkKSP6aDPK6eskjktTRH+eMnP3Q8U9DxO9
 G+tzQ83zOCzFNsxmkjyClXZhvsapEADTYbAzhJ6PE3cAS4Tf0nLSTZn9x/mDWru8YtZ1
 ojkwKTsOQrL5x9nUwsTLykLwgnHhAQstSQ3H8XJz/EtIlU1PAxaktmUmqjy9qSyguoyM
 yxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696598504; x=1697203304;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NMVHuyiFsO42tjOxhFdYGTRZuQvgsaSYtjyQZSpJNtk=;
 b=TDf6S8GVSvRFOyHw+GVbawM4ZRI02SzBPDq9DG0bDdaoSHNSqUWrgrtr5BqxjUj3eu
 sB7IECMPKsE6mB/gN6m/8/yLl1NZizfal++ur7ifdoCKdbWDQHy2oltsEz4SX1nj+YeJ
 aras/su4cwiooZx17wwo8qcznwISHzpvXZEhBPN1nMkZ9LTrzJCzlqRpvQhSzxe5fotl
 LDHNhc1ETpPtCjk+CKRvUknl2nRjFGeljh0/9/X8RpTNqrEBEOXJbZc9rmOaW6tKtsIF
 BNP9qHmy9XIBfX/ZAf4jH0ReGFeGSeG3RZz5y3UrHKiDPO7VtnhJ6dT0vThNqEVr95yX
 RZ4g==
X-Gm-Message-State: AOJu0YzYm0zdDPa0vp7djWoE9y10xRLLsADMssOoO4RRfJakQ81HYLyf
 dgDHZ7X578yAhD5bNbvCRHSf3jVMKiFqbg+cOwk=
X-Google-Smtp-Source: AGHT+IHXubwCsYypi86M5fRc36Q851Bd3TVtsIiIzN7COwCHwcQARNg22kWD/dqiCXKn81TfxJr2aQ==
X-Received: by 2002:a17:902:d485:b0:1c8:791c:d782 with SMTP id
 c5-20020a170902d48500b001c8791cd782mr8151288plg.29.1696598504016; 
 Fri, 06 Oct 2023 06:21:44 -0700 (PDT)
Received: from grind.. ([177.94.42.196]) by smtp.gmail.com with ESMTPSA id
 c12-20020a170902c1cc00b001c60a548331sm3796669plc.304.2023.10.06.06.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 06:21:43 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 01/10] target/riscv/cpu.c: add zicntr extension flag
Date: Fri,  6 Oct 2023 10:21:25 -0300
Message-ID: <20231006132134.1135297-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231006132134.1135297-1-dbarboza@ventanamicro.com>
References: <20231006132134.1135297-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x630.google.com
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
index 08b806dc07..df187bc143 100644
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


