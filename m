Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B7FC001DF
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 22:48:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qW2pa-0006m9-K6; Tue, 15 Aug 2023 18:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW2pZ-0006kx-Aq
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 18:48:05 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW2pU-0008G2-Ve
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 18:48:05 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6bd6a34474cso244291a34.3
 for <qemu-riscv@nongnu.org>; Tue, 15 Aug 2023 15:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692139678; x=1692744478;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ptRsaNn0JKdnbBbzTMAAGNdMdbl9qxio1/dFLsmws8=;
 b=MU7MBAiuxuaPJGMrwGGqDk37tAKjkV4T9FPFaxcc1W10s8jsGtljzILvZ2Ciy5fHpI
 NwpzKtcit8p4zHkoHg565M0ndAbR6tWmxH43lgcvV/JldIZZJmNnfhXlvHiEzZbwW22N
 je6ronGQU7UycElEivB6FXXaOg/LZEJVkvf5v6imJIFGG8E9hJMXHgFwZZ7jAeUzoBmF
 6Qt8fWNkrE+URqRyrCj/xATbqnhrgNZWt11t1GwPIAZez86hF9DrsOBbRXNoRcLRLOmp
 uP0skNrSAMbk6HqZs+BuBOBNeluSwYKas9h3hOCXxGw+ipr9tC2AV3mIxTCyQsyiMPnv
 6vcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692139678; x=1692744478;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/ptRsaNn0JKdnbBbzTMAAGNdMdbl9qxio1/dFLsmws8=;
 b=Iv+kaN0R0LKJzd9Pii1Dcsp7/GZXQlXsASHfA53b2A6ocVjJOdndiMdV0j3jwq1HPi
 oWmD/2vkmAYI/v9W6+KnFEiz+3S3c3ZAZKSQB7j8R1PdY6Yg8DbOHZvdpSVvqnEwM3fE
 DpTUH05mSWDi7TtpiXUnEzYbQQLs03Y7rFwMSZeN2cnLoGoE82C3KSSdvj4l6k5FsDIS
 Vg/guXvrF2u4GbvfEuCNiwIXVho/CuaP5BY1+jsuNMBTbFLh6VysttlwHNxvNFQKK3q+
 q9/z/Q2si8BBW4aD0cRAeut5b8Vh/2rTzCBk8L//nkL3egRDhaY0Jv8SV74SuLE/42Ao
 I7iQ==
X-Gm-Message-State: AOJu0YyZv2XZDtWlGnfhhVSpOsVnbR2hV4Q4542a9P0gzeON0D5kklbq
 iDkRNRAz9hhLJpT92OCHJzH47w==
X-Google-Smtp-Source: AGHT+IGYOISG433K+fk/RZF+SelcPw862agP4c1Cp2vfM/oy1TiG4JHfcdi63dKg6CPzyPt1skOxBQ==
X-Received: by 2002:a05:6830:4693:b0:6bc:f5b7:f1d with SMTP id
 ay19-20020a056830469300b006bcf5b70f1dmr42337otb.28.1692139677870; 
 Tue, 15 Aug 2023 15:47:57 -0700 (PDT)
Received: from grind.. (189-69-160-189.dial-up.telesp.net.br. [189.69.160.189])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a9d4b09000000b006b9f26b9b94sm5655668otf.28.2023.08.15.15.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 15:47:57 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 3/8] target/riscv/cpu.c: introduce cpu_cfg_ext_auto_update()
Date: Tue, 15 Aug 2023 19:47:28 -0300
Message-ID: <20230815224733.434682-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230815224733.434682-1-dbarboza@ventanamicro.com>
References: <20230815224733.434682-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

During realize() time we're activating a lot of extensions based on some
criteria, e.g.:

    if (cpu->cfg.ext_zk) {
        cpu->cfg.ext_zkn = true;
        cpu->cfg.ext_zkr = true;
        cpu->cfg.ext_zkt = true;
    }

This practice resulted in at least one case where we ended up enabling
something we shouldn't: RVC enabling zca/zcd/zcf when using a CPU that
has priv_spec older than 1.12.0.

We're also not considering user choice. There's no way of doing it now
but this is about to change in the next few patches.

cpu_cfg_ext_auto_update() will check for priv version mismatches before
enabling extensions. If we have a mismatch between the current priv
version and the extension we want to enable, do not enable it. In the
near future, this same function will also consider user choice when
deciding if we're going to enable/disable an extension or not.

For now let's use it to handle zca/zcd/zcf enablement if RVC is enabled.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 44 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 249673600c..0c1964c853 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -166,6 +166,44 @@ static void isa_ext_update_enabled(RISCVCPU *cpu, uint32_t ext_offset,
     *ext_enabled = en;
 }
 
+static int cpu_cfg_ext_get_min_version(uint32_t ext_offset)
+{
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
+        if (isa_edata_arr[i].ext_enable_offset != ext_offset) {
+            continue;
+        }
+
+        return isa_edata_arr[i].min_version;
+    }
+
+    /* Default to oldest priv spec if no match found */
+    return PRIV_VERSION_1_10_0;
+}
+
+static void cpu_cfg_ext_auto_update(RISCVCPU *cpu, uint32_t ext_offset,
+                                    bool value)
+{
+    CPURISCVState *env = &cpu->env;
+    bool prev_val = isa_ext_is_enabled(cpu, ext_offset);
+    int min_version;
+
+    if (prev_val == value) {
+        return;
+    }
+
+    if (value && env->priv_ver != PRIV_VERSION_LATEST) {
+        /* Do not enable it if priv_ver is older than min_version */
+        min_version = cpu_cfg_ext_get_min_version(ext_offset);
+        if (env->priv_ver < min_version) {
+            return;
+        }
+    }
+
+    isa_ext_update_enabled(cpu, ext_offset, value);
+}
+
 const char * const riscv_int_regnames[] = {
     "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
     "x7/t2",   "x8/s0",  "x9/s1",  "x10/a0", "x11/a1", "x12/a2",  "x13/a3",
@@ -1246,12 +1284,12 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
 
     /* zca, zcd and zcf has a PRIV 1.12.0 restriction */
     if (riscv_has_ext(env, RVC) && env->priv_ver >= PRIV_VERSION_1_12_0) {
-        cpu->cfg.ext_zca = true;
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zca), true);
         if (riscv_has_ext(env, RVF) && env->misa_mxl_max == MXL_RV32) {
-            cpu->cfg.ext_zcf = true;
+            cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcf), true);
         }
         if (riscv_has_ext(env, RVD)) {
-            cpu->cfg.ext_zcd = true;
+            cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcd), true);
         }
     }
 
-- 
2.41.0


