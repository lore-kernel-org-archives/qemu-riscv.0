Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7AAC004C0
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 15:40:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qux1q-0000TP-Pj; Mon, 23 Oct 2023 11:39:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qux1o-0000Sd-ES
 for qemu-riscv@nongnu.org; Mon, 23 Oct 2023 11:39:40 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qux1l-0003pi-JW
 for qemu-riscv@nongnu.org; Mon, 23 Oct 2023 11:39:40 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1ca74e77aecso32290275ad.1
 for <qemu-riscv@nongnu.org>; Mon, 23 Oct 2023 08:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698075576; x=1698680376; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gLrWKPI1LzwoDJH0XSlW9NTV/EG4w62SG/MuOfFrdgA=;
 b=CEC/4xQWVfnMnksQiWorMkrtSXXlotCmQ8y+8djz4JaP1d5eKXfKsRY3/ZTcOUmdxt
 kjWlly1JKFRbJMuUr8fAQBuNZ37A2VcfW73xw2PqCiAeW68CHIL2Vm4kRIJKQk+4r/B3
 30C7xNHG8Uhv9PmNT+A2C6y4HlheFcorvnTZ6wqZnMw7ahdM2X5PC/+xnFDaowXluDr+
 W7M5LTW4DWq4ZKawPxQSOzvuWiasgdFH8/3nXL0nxUFGsFfWjQQpecoBP+gBZ4sOVIn6
 THX6s0g2c5biIkYiWuWB2cF2zVmNLiCx+psqR6ilDDn+506zzJEcNRDGyZNMBGI4NZ9Q
 x9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698075576; x=1698680376;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gLrWKPI1LzwoDJH0XSlW9NTV/EG4w62SG/MuOfFrdgA=;
 b=cxLG/KXeJtqygcLdFHpvHtgD3JsgKDRdOy4y/Qq4BuaFbWdOLmIRWQuSfwVCTTBzMp
 K0RfXlRTXYund1B8GqgFO8INJnKj21rN3Ks9pFOAHqJa5aNcmlcB0NVnzywS/ZUc0SQ/
 xoEvlHJP5aHPCkkUA4Tw6WYcztOS6NXEuRw1g0Dph7mkXpwNfdCl/nDq96jYAR2begQy
 C2XWm3Ooqs1phzrs7OV2Yrxy8d4DtXJkTZnUYVQWSyxod+pSrXnWdbP/CssoMvfT3qeL
 RA4Fh11ZMsl2m+GGfV2AxSVUzHn4USC0AvMKwIz2fkMumbGaId8LkGOjar0zlCEZO9/s
 jCdg==
X-Gm-Message-State: AOJu0Yz3k9zwUoKXeqExYFWpkdq0FFjEItVpXYWe8wQFIU21YbPuKvDi
 Sa2QDtxw4AEAMn1L4q8Cm+GNCg==
X-Google-Smtp-Source: AGHT+IEC5Vp+GltxSHCHC5ULWq9AyfsiERY4mBvzoFBQ5SI2VzJJAHPFZ8YfWcqJ0hmNMCfd8Plb7w==
X-Received: by 2002:a17:902:c949:b0:1c5:7d49:570e with SMTP id
 i9-20020a170902c94900b001c57d49570emr2144126pla.29.1698075575945; 
 Mon, 23 Oct 2023 08:39:35 -0700 (PDT)
Received: from grind.. ([191.255.2.33]) by smtp.gmail.com with ESMTPSA id
 k20-20020a170902ba9400b001b891259eddsm6053063pls.197.2023.10.23.08.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 08:39:35 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 1/4] target/riscv: add zicntr extension flag for TCG
Date: Mon, 23 Oct 2023 12:39:24 -0300
Message-ID: <20231023153927.435083-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231023153927.435083-1-dbarboza@ventanamicro.com>
References: <20231023153927.435083-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62c.google.com
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

QEMU already implements it in TCG way before it was a discrete
extension.  zicntr is part of the RVA22 profile, so let's add it to QEMU
to make the future profile implementation flag complete. Given than it
represents an already existing feature, default it to 'true' for all
CPUs.

For TCG, we need a way to disable zicntr if the user wants to. This is
done by restricting access to the CYCLE, TIME, and INSTRET counters via
the 'ctr()' predicate when we're about to access them.

Disabling zicntr happens via the command line or if its dependency,
zicsr, happens to be disabled. We'll check for zicsr during realize()
and, in case it's absent, disable zicntr. However, if the user was
explicit about having zicntr support, error out instead of disabling it.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c         | 12 ++++++++++++
 target/riscv/cpu_cfg.h     |  1 +
 target/riscv/csr.c         |  4 ++++
 target/riscv/tcg/tcg-cpu.c |  8 ++++++++
 4 files changed, 25 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a2881bfa38..69d64ec4ca 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -80,6 +80,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zicbom, PRIV_VERSION_1_12_0, ext_zicbom),
     ISA_EXT_DATA_ENTRY(zicboz, PRIV_VERSION_1_12_0, ext_zicboz),
     ISA_EXT_DATA_ENTRY(zicond, PRIV_VERSION_1_12_0, ext_zicond),
+    ISA_EXT_DATA_ENTRY(zicntr, PRIV_VERSION_1_12_0, ext_zicntr),
     ISA_EXT_DATA_ENTRY(zicsr, PRIV_VERSION_1_10_0, ext_zicsr),
     ISA_EXT_DATA_ENTRY(zifencei, PRIV_VERSION_1_10_0, ext_zifencei),
     ISA_EXT_DATA_ENTRY(zihintntl, PRIV_VERSION_1_10_0, ext_zihintntl),
@@ -1208,6 +1209,15 @@ static void riscv_cpu_init(Object *obj)
     qdev_init_gpio_in(DEVICE(obj), riscv_cpu_set_irq,
                       IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
 #endif /* CONFIG_USER_ONLY */
+
+    /*
+     * The timer and performance counters extensions were supported
+     * in QEMU before they were added as discrete extensions in the
+     * ISA. To keep compatibility we'll always default them to 'true'
+     * for all CPUs. Each accelerator will decide what to do when
+     * users disable them.
+     */
+    RISCV_CPU(obj)->cfg.ext_zicntr = true;
 }
 
 typedef struct misa_ext_info {
@@ -1297,6 +1307,8 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("svnapot", ext_svnapot, false),
     MULTI_EXT_CFG_BOOL("svpbmt", ext_svpbmt, false),
 
+    MULTI_EXT_CFG_BOOL("zicntr", ext_zicntr, true),
+
     MULTI_EXT_CFG_BOOL("zba", ext_zba, true),
     MULTI_EXT_CFG_BOOL("zbb", ext_zbb, true),
     MULTI_EXT_CFG_BOOL("zbc", ext_zbc, true),
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index e7ce977189..73fd4b3231 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -62,6 +62,7 @@ struct RISCVCPUConfig {
     bool ext_zksh;
     bool ext_zkt;
     bool ext_zifencei;
+    bool ext_zicntr;
     bool ext_zicsr;
     bool ext_zicbom;
     bool ext_zicboz;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index f4e0a3962f..4ca96ddd1d 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -122,6 +122,10 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
 
     if ((csrno >= CSR_CYCLE && csrno <= CSR_INSTRET) ||
         (csrno >= CSR_CYCLEH && csrno <= CSR_INSTRETH)) {
+        if (!riscv_cpu_cfg(env)->ext_zicntr) {
+            return RISCV_EXCP_ILLEGAL_INST;
+        }
+
         goto skip_ext_pmu_check;
     }
 
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index c5ff03efce..a1e4ed2e24 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -541,6 +541,14 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zksh), true);
     }
 
+    if (cpu->cfg.ext_zicntr && !cpu->cfg.ext_zicsr) {
+        if (cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zicntr))) {
+            error_setg(errp, "zicntr requires zicsr");
+            return;
+        }
+        cpu->cfg.ext_zicntr = false;
+    }
+
     /*
      * Disable isa extensions based on priv spec after we
      * validated and set everything we need.
-- 
2.41.0


