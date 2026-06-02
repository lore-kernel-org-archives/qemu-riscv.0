Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75025CD6E61
	for <qemu-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 09:19:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wULH1-0000lt-G6; Tue, 02 Jun 2026 05:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fritchleybohrer@gmail.com>)
 id 1wULGe-0000Se-CW
 for qemu-riscv@nongnu.org; Tue, 02 Jun 2026 05:18:38 -0400
Received: from mail-dy1-x1343.google.com ([2607:f8b0:4864:20::1343])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fritchleybohrer@gmail.com>)
 id 1wULGU-0007VC-9g
 for qemu-riscv@nongnu.org; Tue, 02 Jun 2026 05:18:33 -0400
Received: by mail-dy1-x1343.google.com with SMTP id
 5a478bee46e88-304d7f31215so4949954eec.1
 for <qemu-riscv@nongnu.org>; Tue, 02 Jun 2026 02:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780391901; x=1780996701; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/rinwjcSRYYTEOeCndnzX4y7xW2KViZsSZQDx24Q0ws=;
 b=esg3+laQgJmFm5Z+YCOVwiiVwbtyld4MWWHgYKANmKSexQ633+fd5mRKe1ed8fIDvT
 AtkEXSFe3n85FoXDoFfalcvzXWQD3SKdNf5rU0JNRtBT9wOzMiPwVagbHJaT/qi7B12O
 aU0nQfD97aNtO/XrsjEhLkejWEyngyw9WWIHN5wOlcAotx5zZPKFFWieQpplTgKP63xK
 DQncgYg4bVsCxK1spMrBc5CMIsSUVSaBb4kEwNrwk7IFh9tvpNBG/PdOz58ldXIIY8fd
 VXThfDqIOjXosDcdDmkMsbfVBJ8aSCvmMrFAfT00F71GWo/6s1h8fCNRT16+wDCGCPkI
 FrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780391901; x=1780996701;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/rinwjcSRYYTEOeCndnzX4y7xW2KViZsSZQDx24Q0ws=;
 b=JT0I80EhkydUlxDhrDkGfFS+aKhMYpdSutbsAuplJPJWe537w2YxRG37FVIAnq8ZTU
 c376TsKhvIWbIsda4B4DpS0B393tWZli7FUvaPb3wythzM2i4v9Yr/8VkKVMDRMSQ8Bn
 EqddLrwlO0TUoPtyQgb/KxAHim6TKQQ+4y7WewVRWsfOrvJ4RcS/F9K9733MiNq2j/B8
 AiUMloBXYe+tdJmVVqZ5hLCDfoJ3+YbB3qB3TPkdMdSarCS39/NpYHTNrKozl5H3AtHp
 vOSHjcFXoNBOe0kcICbi0z63lSkvQqwUgZ6NCEis1H1gIBwSVdLY4y+qJP5UgekG/qkl
 hEYw==
X-Gm-Message-State: AOJu0Yy/J2UNSN2bVBLehk5pRv7fYl9PQBOTq62LpC0yMtPo2oTyZryn
 kYg+hjsr+kJsSe8myirgOQ4vgoInwtXMjTQRLD36sVoH0aHvbPpdCmxW
X-Gm-Gg: Acq92OG2SciYdrM970uiFxkeqe1BRMt0PKbqc4ioU8pqwSim8O9PXhY4T/yP0nYNfak
 HMupZaDgi1/l4+NfStD0BK+YW2rpkquOjQ64tKNTgxgB62NhgjNFOxr+4U/FOr2Bven9JWXjTUx
 dNTCnp5rYkpC+INmpwR4i4xYAGNkrWR/AfIEH8p7H33e6comDVRjUnxOQkMJs6+8QmxcnrzcSEt
 /3nrnCYyHF9LLouVbvK8i4pG088/E061IQOPsuXmP/Gsyr7d90ZQRAzwgJeQ3FqdScmhklOXsfm
 rv4wuxrwDv6FLeN7PI3pizl1yBXhhng6KOC0HXdTmqJYGzOxeXDdBeX5hA3Zu0KezvnQPrX/D8J
 SytZpmdcpuUvEP/+l3c07cGJD5llgavguCboHsF2nVKtIwtGIB/Oby+jrwFxefXM9S9DzIdYB/a
 jOYZB2uOGIFLX6Q58ap4GcWKRQ4IFchzjI2aSBHNgtbtVL8ZNHh3znGznPPJWWs/K/4chA9O9ND
 EoTsFvNaSkaTsBzgjtiHdMhaf0=
X-Received: by 2002:a05:7300:2214:b0:2d9:bc8d:f62a with SMTP id
 5a478bee46e88-304fa5e85d3mr7832197eec.16.1780391900736; 
 Tue, 02 Jun 2026 02:18:20 -0700 (PDT)
Received: from openkylin..
 (ec2-54-176-108-193.us-west-1.compute.amazonaws.com. [54.176.108.193])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ed2c3121sm11419146eec.5.2026.06.02.02.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 02:18:20 -0700 (PDT)
From: Zephyr Li <fritchleybohrer@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 alex.bennee@linaro.org, pierrick.bouvier@oss.qualcomm.com,
 philmd@linaro.org, Zephyr Li <fritchleybohrer@gmail.com>
Subject: [PATCH v3 1/6] target/riscv: move extension validation out of
 TCG-only code
Date: Tue,  2 Jun 2026 17:17:48 +0800
Message-ID: <20260602091753.3209261-2-fritchleybohrer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602091753.3209261-1-fritchleybohrer@gmail.com>
References: <20260602091753.3209261-1-fritchleybohrer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1343;
 envelope-from=fritchleybohrer@gmail.com; helo=mail-dy1-x1343.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

riscv_cpu_validate_set_extensions() contains architectural ISA extension
dependency checks and is also used by common CSR code when misa is
written. However, it currently lives in target/riscv/tcg/tcg-cpu.c, which
is not built when TCG is disabled.

Move the extension validation code and its user-option tracking helpers
to a new cpu-validate.c file. Keep TCG-specific finalize and TB state
handling in tcg-cpu.c, and expose the validator through internals.h for
target/riscv internal users.

Keep riscv_cpu_validate_misa_priv() and riscv_cpu_update_cfg() as separate
internal helpers so TCG feature finalization preserves its original order
and CSR write_misa() continues to run only extension consistency checks.

The move also gives the helpers used by tcg-cpu.c a riscv_cpu_ prefix and
adds lazy initialization/NULL guards for the user-option hash tables, so
the validator can be linked from non-TCG builds without relying on TCG CPU
instance initialization.

Signed-off-by: Zephyr Li <fritchleybohrer@gmail.com>
---
 target/riscv/cpu-validate.c | 630 +++++++++++++++++++++++++++++++++++
 target/riscv/csr.c          |   1 -
 target/riscv/internals.h    |  19 ++
 target/riscv/meson.build    |   1 +
 target/riscv/tcg/tcg-cpu.c  | 637 ++----------------------------------
 target/riscv/tcg/tcg-cpu.h  |   1 -
 6 files changed, 672 insertions(+), 617 deletions(-)
 create mode 100644 target/riscv/cpu-validate.c

diff --git a/target/riscv/cpu-validate.c b/target/riscv/cpu-validate.c
new file mode 100644
index 0000000000..2a92c94cdc
--- /dev/null
+++ b/target/riscv/cpu-validate.c
@@ -0,0 +1,630 @@
+/*
+ * RISC-V CPU extension validation
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internals.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+
+/* Hash that stores user set extensions */
+static GHashTable *multi_ext_user_opts;
+static GHashTable *misa_ext_user_opts;
+
+void riscv_cpu_ext_user_opts_init(void)
+{
+    g_clear_pointer(&multi_ext_user_opts, g_hash_table_unref);
+    g_clear_pointer(&misa_ext_user_opts, g_hash_table_unref);
+
+    multi_ext_user_opts = g_hash_table_new(NULL, g_direct_equal);
+    misa_ext_user_opts = g_hash_table_new(NULL, g_direct_equal);
+}
+
+static bool cpu_cfg_ext_is_user_set(uint32_t ext_offset)
+{
+    if (!multi_ext_user_opts) {
+        return false;
+    }
+
+    return g_hash_table_contains(multi_ext_user_opts,
+                                 GUINT_TO_POINTER(ext_offset));
+}
+
+bool riscv_cpu_misa_ext_is_user_set(uint32_t misa_bit)
+{
+    if (!misa_ext_user_opts) {
+        return false;
+    }
+
+    return g_hash_table_contains(misa_ext_user_opts,
+                                 GUINT_TO_POINTER(misa_bit));
+}
+
+void riscv_cpu_cfg_ext_add_user_opt(uint32_t ext_offset, bool value)
+{
+    if (!multi_ext_user_opts) {
+        riscv_cpu_ext_user_opts_init();
+    }
+
+    g_hash_table_insert(multi_ext_user_opts,
+                        GUINT_TO_POINTER(ext_offset),
+                        (gpointer)value);
+}
+
+void riscv_cpu_misa_ext_add_user_opt(uint32_t bit, bool value)
+{
+    if (!misa_ext_user_opts) {
+        riscv_cpu_ext_user_opts_init();
+    }
+
+    g_hash_table_insert(misa_ext_user_opts,
+                        GUINT_TO_POINTER(bit),
+                        (gpointer)value);
+}
+
+void riscv_cpu_write_misa_bit(RISCVCPU *cpu, uint32_t bit,
+                              bool enabled)
+{
+    CPURISCVState *env = &cpu->env;
+
+    if (enabled) {
+        env->misa_ext |= bit;
+        env->misa_ext_mask |= bit;
+    } else {
+        env->misa_ext &= ~bit;
+        env->misa_ext_mask &= ~bit;
+    }
+}
+
+static int cpu_cfg_ext_get_min_version(uint32_t ext_offset)
+{
+    const RISCVIsaExtData *edata;
+
+    for (edata = isa_edata_arr; edata && edata->name; edata++) {
+        if (edata->ext_enable_offset != ext_offset) {
+            continue;
+        }
+
+        return edata->min_version;
+    }
+
+    g_assert_not_reached();
+}
+
+const char *riscv_cpu_cfg_ext_get_name(uint32_t ext_offset)
+{
+    const RISCVIsaExtData *edata;
+
+    for (edata = isa_edata_arr; edata->name != NULL; edata++) {
+        if (edata->ext_enable_offset == ext_offset) {
+            return edata->name;
+        }
+    }
+
+    g_assert_not_reached();
+}
+
+void riscv_cpu_bump_multi_ext_priv_ver(CPURISCVState *env,
+                                       uint32_t ext_offset)
+{
+    int ext_priv_ver;
+
+    if (env->priv_ver == PRIV_VERSION_LATEST) {
+        return;
+    }
+
+    ext_priv_ver = cpu_cfg_ext_get_min_version(ext_offset);
+
+    if (env->priv_ver < ext_priv_ver) {
+        /*
+         * Note: the 'priv_spec' command line option, if present,
+         * will take precedence over this priv_ver bump.
+         */
+        env->priv_ver = ext_priv_ver;
+    }
+}
+
+void riscv_cpu_cfg_ext_auto_update(RISCVCPU *cpu, uint32_t ext_offset,
+                                   bool value)
+{
+    CPURISCVState *env = &cpu->env;
+    bool prev_val = isa_ext_is_enabled(cpu, ext_offset);
+    int min_version;
+
+    if (prev_val == value) {
+        return;
+    }
+
+    if (cpu_cfg_ext_is_user_set(ext_offset)) {
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
+void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **errp)
+{
+    if (riscv_has_ext(env, RVH) && env->priv_ver < PRIV_VERSION_1_12_0) {
+        error_setg(errp, "H extension requires priv spec 1.12.0");
+        return;
+    }
+}
+
+static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
+                                 Error **errp)
+{
+    uint32_t min_vlen;
+    uint32_t vlen = cfg->vlenb << 3;
+
+    if (riscv_has_ext(env, RVV)) {
+        min_vlen = 128;
+    } else if (cfg->ext_zve64x) {
+        min_vlen = 64;
+    } else if (cfg->ext_zve32x) {
+        min_vlen = 32;
+    } else {
+        return;
+    }
+
+    if (vlen > RV_VLEN_MAX || vlen < min_vlen) {
+        error_setg(errp,
+                   "Vector extension implementation only supports VLEN "
+                   "in the range [%d, %d]", min_vlen, RV_VLEN_MAX);
+        return;
+    }
+
+    if (cfg->elen > 64 || cfg->elen < 8) {
+        error_setg(errp,
+                   "Vector extension implementation only supports ELEN "
+                   "in the range [8, 64]");
+        return;
+    }
+
+    if (vlen < cfg->elen) {
+        error_setg(errp, "Vector extension implementation requires VLEN "
+                         "to be greater than or equal to ELEN");
+        return;
+    }
+}
+
+static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
+{
+    CPURISCVState *env = &cpu->env;
+    const RISCVIsaExtData *edata;
+
+    /* Force disable extensions if priv spec version does not match */
+    for (edata = isa_edata_arr; edata && edata->name; edata++) {
+        if (isa_ext_is_enabled(cpu, edata->ext_enable_offset) &&
+            (env->priv_ver < edata->min_version)) {
+            /*
+             * These two extensions are always enabled as they were supported
+             * by QEMU before they were added as extensions in the ISA.
+             */
+            if (!strcmp(edata->name, "zicntr") ||
+                !strcmp(edata->name, "zihpm")) {
+                continue;
+            }
+
+            /*
+             * cpu.debug = true is marked as 'sdtrig', priv spec 1.12.
+             * Skip this warning since existing CPUs with older priv
+             * spec and debug = true will be impacted.
+             */
+            if (!strcmp(edata->name, "sdtrig")) {
+                continue;
+            }
+
+            isa_ext_update_enabled(cpu, edata->ext_enable_offset, false);
+#ifndef CONFIG_USER_ONLY
+            warn_report("disabling %s extension for hart 0x%" PRIx64
+                        " because privilege spec version does not match",
+                        edata->name, env->mhartid);
+#else
+            warn_report("disabling %s extension because "
+                        "privilege spec version does not match",
+                        edata->name);
+#endif
+        }
+    }
+}
+
+void riscv_cpu_update_cfg(RISCVCPU *cpu)
+{
+    if (cpu->env.priv_ver >= PRIV_VERSION_1_11_0) {
+        cpu->cfg.has_priv_1_11 = true;
+    }
+
+    if (cpu->env.priv_ver >= PRIV_VERSION_1_12_0) {
+        cpu->cfg.has_priv_1_12 = true;
+    }
+
+    if (cpu->env.priv_ver >= PRIV_VERSION_1_13_0) {
+        cpu->cfg.has_priv_1_13 = true;
+    }
+
+    /* zic64b is 1.12 or later */
+    cpu->cfg.ext_zic64b = cpu->cfg.cbom_blocksize == 64 &&
+                          cpu->cfg.cbop_blocksize == 64 &&
+                          cpu->cfg.cboz_blocksize == 64 &&
+                          cpu->cfg.has_priv_1_12;
+
+    cpu->cfg.ext_ssstateen = cpu->cfg.ext_smstateen;
+
+    cpu->cfg.ext_sha = riscv_has_ext(&cpu->env, RVH) &&
+                       cpu->cfg.ext_ssstateen;
+
+    cpu->cfg.ext_ziccrse = cpu->cfg.has_priv_1_11;
+}
+
+static void riscv_cpu_validate_g(RISCVCPU *cpu)
+{
+    const char *warn_msg = "RVG mandates disabled extension %s";
+    uint32_t g_misa_bits[] = {RVI, RVM, RVA, RVF, RVD};
+    bool send_warn = riscv_cpu_misa_ext_is_user_set(RVG);
+
+    for (int i = 0; i < ARRAY_SIZE(g_misa_bits); i++) {
+        uint32_t bit = g_misa_bits[i];
+
+        if (riscv_has_ext(&cpu->env, bit)) {
+            continue;
+        }
+
+        if (!riscv_cpu_misa_ext_is_user_set(bit)) {
+            riscv_cpu_write_misa_bit(cpu, bit, true);
+            continue;
+        }
+
+        if (send_warn) {
+            warn_report(warn_msg, riscv_get_misa_ext_name(bit));
+        }
+    }
+
+    if (!cpu->cfg.ext_zicsr) {
+        if (!cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zicsr))) {
+            cpu->cfg.ext_zicsr = true;
+        } else if (send_warn) {
+            warn_report(warn_msg, "zicsr");
+        }
+    }
+
+    if (!cpu->cfg.ext_zifencei) {
+        if (!cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zifencei))) {
+            cpu->cfg.ext_zifencei = true;
+        } else if (send_warn) {
+            warn_report(warn_msg, "zifencei");
+        }
+    }
+}
+
+static void riscv_cpu_validate_b(RISCVCPU *cpu)
+{
+    const char *warn_msg = "RVB mandates disabled extension %s";
+
+    if (!cpu->cfg.ext_zba) {
+        if (!cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zba))) {
+            cpu->cfg.ext_zba = true;
+        } else {
+            warn_report(warn_msg, "zba");
+        }
+    }
+
+    if (!cpu->cfg.ext_zbb) {
+        if (!cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zbb))) {
+            cpu->cfg.ext_zbb = true;
+        } else {
+            warn_report(warn_msg, "zbb");
+        }
+    }
+
+    if (!cpu->cfg.ext_zbs) {
+        if (!cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zbs))) {
+            cpu->cfg.ext_zbs = true;
+        } else {
+            warn_report(warn_msg, "zbs");
+        }
+    }
+}
+
+/*
+ * Check consistency between chosen extensions while setting
+ * cpu->cfg accordingly.
+ */
+void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
+{
+    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
+    CPURISCVState *env = &cpu->env;
+    Error *local_err = NULL;
+
+    if (riscv_has_ext(env, RVG)) {
+        riscv_cpu_validate_g(cpu);
+    }
+
+    if (riscv_has_ext(env, RVB)) {
+        riscv_cpu_validate_b(cpu);
+    }
+
+    if (riscv_has_ext(env, RVI) && riscv_has_ext(env, RVE)) {
+        error_setg(errp,
+                   "I and E extensions are incompatible");
+        return;
+    }
+
+    if (!riscv_has_ext(env, RVI) && !riscv_has_ext(env, RVE)) {
+        error_setg(errp,
+                   "Either I or E extension must be set");
+        return;
+    }
+
+    if (riscv_has_ext(env, RVS) && !riscv_has_ext(env, RVU)) {
+        error_setg(errp,
+                   "Setting S extension without U extension is illegal");
+        return;
+    }
+
+    if (riscv_has_ext(env, RVH) && !riscv_has_ext(env, RVI)) {
+        error_setg(errp,
+                   "H depends on an I base integer ISA with 32 x registers");
+        return;
+    }
+
+    if (riscv_has_ext(env, RVH) && !riscv_has_ext(env, RVS)) {
+        error_setg(errp, "H extension implicitly requires S-mode");
+        return;
+    }
+
+    if (riscv_has_ext(env, RVF) && !cpu->cfg.ext_zicsr) {
+        error_setg(errp, "F extension requires Zicsr");
+        return;
+    }
+
+    if ((cpu->cfg.ext_zacas) && !riscv_has_ext(env, RVA)) {
+        error_setg(errp, "Zacas extension requires A extension");
+        return;
+    }
+
+    if ((cpu->cfg.ext_zawrs) && !riscv_has_ext(env, RVA)) {
+        error_setg(errp, "Zawrs extension requires A extension");
+        return;
+    }
+
+    if (cpu->cfg.ext_zfa && !riscv_has_ext(env, RVF)) {
+        error_setg(errp, "Zfa extension requires F extension");
+        return;
+    }
+
+    if (cpu->cfg.ext_zfhmin && !riscv_has_ext(env, RVF)) {
+        error_setg(errp, "Zfh/Zfhmin extensions require F extension");
+        return;
+    }
+
+    if (cpu->cfg.ext_zfbfmin && !riscv_has_ext(env, RVF)) {
+        error_setg(errp, "Zfbfmin extension depends on F extension");
+        return;
+    }
+
+    if (riscv_has_ext(env, RVD) && !riscv_has_ext(env, RVF)) {
+        error_setg(errp, "D extension requires F extension");
+        return;
+    }
+
+    riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    /* The Zve64d extension depends on the Zve64f extension */
+    if (cpu->cfg.ext_zve64d) {
+        if (!riscv_has_ext(env, RVD)) {
+            error_setg(errp, "Zve64d/V extensions require D extension");
+            return;
+        }
+    }
+
+    /* The Zve32f extension depends on the Zve32x extension */
+    if (cpu->cfg.ext_zve32f) {
+        if (!riscv_has_ext(env, RVF)) {
+            error_setg(errp, "Zve32f/Zve64f extensions require F extension");
+            return;
+        }
+    }
+
+    if (cpu->cfg.ext_zvfhmin && !cpu->cfg.ext_zve32f) {
+        error_setg(errp, "Zvfh/Zvfhmin extensions require Zve32f extension");
+        return;
+    }
+
+    if (cpu->cfg.ext_zvfh && !cpu->cfg.ext_zfhmin) {
+        error_setg(errp, "Zvfh extensions requires Zfhmin extension");
+        return;
+    }
+
+    if (cpu->cfg.ext_zvfbfmin && !cpu->cfg.ext_zve32f) {
+        error_setg(errp, "Zvfbfmin extension depends on Zve32f extension");
+        return;
+    }
+
+    if (cpu->cfg.ext_zvfbfwma && !cpu->cfg.ext_zvfbfmin) {
+        error_setg(errp, "Zvfbfwma extension depends on Zvfbfmin extension");
+        return;
+    }
+
+    if (cpu->cfg.ext_zvfbfa) {
+        if (!cpu->cfg.ext_zve32f || !cpu->cfg.ext_zfbfmin) {
+            error_setg(errp, "Zvfbfa extension requires Zve32f extension "
+                             "and Zfbfmin extension");
+            return;
+        }
+    }
+
+    if ((cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinxmin) && !cpu->cfg.ext_zfinx) {
+        error_setg(errp, "Zdinx/Zhinx/Zhinxmin extensions require Zfinx");
+        return;
+    }
+
+    if (cpu->cfg.ext_zfinx) {
+        if (!cpu->cfg.ext_zicsr) {
+            error_setg(errp, "Zfinx extension requires Zicsr");
+            return;
+        }
+        if (riscv_has_ext(env, RVF)) {
+            error_setg(errp,
+                       "Zfinx cannot be supported together with F extension");
+            return;
+        }
+    }
+
+    if (cpu->cfg.ext_zcmop && !cpu->cfg.ext_zca) {
+        error_setg(errp, "Zcmop extensions require Zca");
+        return;
+    }
+
+    if (mcc->def->misa_mxl_max != MXL_RV32 && cpu->cfg.ext_zcf) {
+        error_setg(errp, "Zcf extension is only relevant to RV32");
+        return;
+    }
+
+    if (!riscv_has_ext(env, RVF) && cpu->cfg.ext_zcf) {
+        error_setg(errp, "Zcf extension requires F extension");
+        return;
+    }
+
+    if (!riscv_has_ext(env, RVD) && cpu->cfg.ext_zcd) {
+        error_setg(errp, "Zcd extension requires D extension");
+        return;
+    }
+
+    if ((cpu->cfg.ext_zcf || cpu->cfg.ext_zcd || cpu->cfg.ext_zcb ||
+         cpu->cfg.ext_zcmp || cpu->cfg.ext_zcmt) && !cpu->cfg.ext_zca) {
+        error_setg(errp, "Zcf/Zcd/Zcb/Zcmp/Zcmt extensions require Zca "
+                         "extension");
+        return;
+    }
+
+    if (cpu->cfg.ext_zcd && (cpu->cfg.ext_zcmp || cpu->cfg.ext_zcmt)) {
+        error_setg(errp, "Zcmp/Zcmt extensions are incompatible with "
+                         "Zcd extension");
+        return;
+    }
+
+    if (cpu->cfg.ext_zcmt && !cpu->cfg.ext_zicsr) {
+        error_setg(errp, "Zcmt extension requires Zicsr extension");
+        return;
+    }
+
+    if ((cpu->cfg.ext_zvbb || cpu->cfg.ext_zvkb || cpu->cfg.ext_zvkg ||
+         cpu->cfg.ext_zvkned || cpu->cfg.ext_zvknha || cpu->cfg.ext_zvksed ||
+         cpu->cfg.ext_zvksh) && !cpu->cfg.ext_zve32x) {
+        error_setg(errp,
+                   "Vector crypto extensions require V or Zve* extensions");
+        return;
+    }
+
+    if ((cpu->cfg.ext_zvbc || cpu->cfg.ext_zvknhb) && !cpu->cfg.ext_zve64x) {
+        error_setg(
+            errp,
+            "Zvbc and Zvknhb extensions require V or Zve64x extensions");
+        return;
+    }
+
+    if (cpu->cfg.ext_zicntr && !cpu->cfg.ext_zicsr) {
+        if (cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zicntr))) {
+            error_setg(errp, "zicntr requires zicsr");
+            return;
+        }
+        cpu->cfg.ext_zicntr = false;
+    }
+
+    if (cpu->cfg.ext_zihpm && !cpu->cfg.ext_zicsr) {
+        if (cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zihpm))) {
+            error_setg(errp, "zihpm requires zicsr");
+            return;
+        }
+        cpu->cfg.ext_zihpm = false;
+    }
+
+    if (cpu->cfg.ext_zicfiss) {
+        if (!cpu->cfg.ext_zicsr) {
+            error_setg(errp, "zicfiss extension requires zicsr extension");
+            return;
+        }
+        if (!riscv_has_ext(env, RVA)) {
+            error_setg(errp, "zicfiss extension requires A extension");
+            return;
+        }
+        if (!riscv_has_ext(env, RVS)) {
+            error_setg(errp, "zicfiss extension requires S");
+            return;
+        }
+        if (!cpu->cfg.ext_zimop) {
+            error_setg(errp, "zicfiss extension requires zimop extension");
+            return;
+        }
+        if (cpu->cfg.ext_zca && !cpu->cfg.ext_zcmop) {
+            error_setg(errp, "zicfiss with zca requires zcmop extension");
+            return;
+        }
+    }
+
+    if (!cpu->cfg.ext_zihpm) {
+        cpu->cfg.pmu_mask = 0;
+        cpu->pmu_avail_ctrs = 0;
+    }
+
+    if (cpu->cfg.ext_zclsd) {
+        if (riscv_has_ext(env, RVC) && riscv_has_ext(env, RVF)) {
+            error_setg(errp,
+                    "Zclsd cannot be supported together with C and F extension");
+            return;
+        }
+        if (cpu->cfg.ext_zcf) {
+            error_setg(errp,
+                    "Zclsd cannot be supported together with Zcf extension");
+            return;
+        }
+    }
+
+    if (cpu->cfg.ext_zicfilp && !cpu->cfg.ext_zicsr) {
+        error_setg(errp, "zicfilp extension requires zicsr extension");
+        return;
+    }
+
+    if (mcc->def->misa_mxl_max == MXL_RV32 && cpu->cfg.ext_svukte) {
+        error_setg(errp, "svukte is not supported for RV32");
+        return;
+    }
+
+    if ((cpu->cfg.ext_smctr || cpu->cfg.ext_ssctr) &&
+        (!riscv_has_ext(env, RVS) || !cpu->cfg.ext_sscsrind)) {
+        if (cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_smctr)) ||
+            cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_ssctr))) {
+            error_setg(errp, "Smctr and Ssctr require S-mode and Sscsrind");
+            return;
+        }
+        cpu->cfg.ext_smctr = false;
+        cpu->cfg.ext_ssctr = false;
+    }
+
+    if (cpu->cfg.ext_svrsw60t59b &&
+        (!cpu->cfg.mmu || mcc->def->misa_mxl_max == MXL_RV32)) {
+        error_setg(errp, "svrsw60t59b is not supported on RV32 and MMU-less platforms");
+        return;
+    }
+
+    /*
+     * Disable isa extensions based on priv spec after we
+     * validated and set everything we need.
+     */
+    riscv_cpu_disable_priv_spec_isa_exts(cpu);
+}
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 5514e0f455..186d32fca8 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -21,7 +21,6 @@
 #include "qemu/log.h"
 #include "qemu/timer.h"
 #include "cpu.h"
-#include "tcg/tcg-cpu.h"
 #include "pmu.h"
 #include "time_helper.h"
 #include "exec/cputlb.h"
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 8c24af0d85..4e1bb8849a 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -193,6 +193,25 @@ static inline target_ulong get_xepc_mask(CPURISCVState *env)
 bool riscv_cpu_has_work(CPUState *cs);
 #endif
 
+void riscv_cpu_ext_user_opts_init(void);
+void riscv_cpu_cfg_ext_add_user_opt(uint32_t ext_offset, bool value);
+void riscv_cpu_misa_ext_add_user_opt(uint32_t bit, bool value);
+bool riscv_cpu_misa_ext_is_user_set(uint32_t bit);
+
+void riscv_cpu_write_misa_bit(RISCVCPU *cpu, uint32_t bit, bool enabled);
+
+void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **errp);
+void riscv_cpu_update_cfg(RISCVCPU *cpu);
+
+void riscv_cpu_bump_multi_ext_priv_ver(CPURISCVState *env,
+                                       uint32_t ext_offset);
+void riscv_cpu_cfg_ext_auto_update(RISCVCPU *cpu,
+                                   uint32_t ext_offset,
+                                   bool value);
+const char *riscv_cpu_cfg_ext_get_name(uint32_t ext_offset);
+
+void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp);
+
 /* Zjpm addr masking routine */
 static inline target_ulong adjust_addr_body(CPURISCVState *env,
                                             target_ulong addr,
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 79f36abd63..4c99f2b802 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -16,6 +16,7 @@ riscv_ss.add(when: 'CONFIG_ARM_COMPATIBLE_SEMIHOSTING',
 
 riscv_ss.add(files(
   'cpu.c',
+  'cpu-validate.c',
   'cpu_helper.c',
   'csr.c',
   'fpu_helper.c',
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 3e22e7ed53..13810f303d 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -39,51 +39,9 @@
 #include "exec/icount.h"
 #endif
 
-/* Hash that stores user set extensions */
-static GHashTable *multi_ext_user_opts;
-static GHashTable *misa_ext_user_opts;
-
 static GHashTable *multi_ext_implied_rules;
 static GHashTable *misa_ext_implied_rules;
 
-static bool cpu_cfg_ext_is_user_set(uint32_t ext_offset)
-{
-    return g_hash_table_contains(multi_ext_user_opts,
-                                 GUINT_TO_POINTER(ext_offset));
-}
-
-static bool cpu_misa_ext_is_user_set(uint32_t misa_bit)
-{
-    return g_hash_table_contains(misa_ext_user_opts,
-                                 GUINT_TO_POINTER(misa_bit));
-}
-
-static void cpu_cfg_ext_add_user_opt(uint32_t ext_offset, bool value)
-{
-    g_hash_table_insert(multi_ext_user_opts, GUINT_TO_POINTER(ext_offset),
-                        (gpointer)value);
-}
-
-static void cpu_misa_ext_add_user_opt(uint32_t bit, bool value)
-{
-    g_hash_table_insert(misa_ext_user_opts, GUINT_TO_POINTER(bit),
-                        (gpointer)value);
-}
-
-static void riscv_cpu_write_misa_bit(RISCVCPU *cpu, uint32_t bit,
-                                     bool enabled)
-{
-    CPURISCVState *env = &cpu->env;
-
-    if (enabled) {
-        env->misa_ext |= bit;
-        env->misa_ext_mask |= bit;
-    } else {
-        env->misa_ext &= ~bit;
-        env->misa_ext_mask &= ~bit;
-    }
-}
-
 static const char *cpu_priv_ver_to_str(int priv_ver)
 {
     const char *priv_spec_str = priv_spec_to_str(priv_ver);
@@ -294,556 +252,6 @@ const TCGCPUOps riscv_tcg_ops = {
 #endif /* !CONFIG_USER_ONLY */
 };
 
-static int cpu_cfg_ext_get_min_version(uint32_t ext_offset)
-{
-    const RISCVIsaExtData *edata;
-
-    for (edata = isa_edata_arr; edata && edata->name; edata++) {
-        if (edata->ext_enable_offset != ext_offset) {
-            continue;
-        }
-
-        return edata->min_version;
-    }
-
-    g_assert_not_reached();
-}
-
-static const char *cpu_cfg_ext_get_name(uint32_t ext_offset)
-{
-    const RISCVIsaExtData *edata;
-
-    for (edata = isa_edata_arr; edata->name != NULL; edata++) {
-        if (edata->ext_enable_offset == ext_offset) {
-            return edata->name;
-        }
-    }
-
-    g_assert_not_reached();
-}
-
-static void cpu_bump_multi_ext_priv_ver(CPURISCVState *env,
-                                        uint32_t ext_offset)
-{
-    int ext_priv_ver;
-
-    if (env->priv_ver == PRIV_VERSION_LATEST) {
-        return;
-    }
-
-    ext_priv_ver = cpu_cfg_ext_get_min_version(ext_offset);
-
-    if (env->priv_ver < ext_priv_ver) {
-        /*
-         * Note: the 'priv_spec' command line option, if present,
-         * will take precedence over this priv_ver bump.
-         */
-        env->priv_ver = ext_priv_ver;
-    }
-}
-
-static void cpu_cfg_ext_auto_update(RISCVCPU *cpu, uint32_t ext_offset,
-                                    bool value)
-{
-    CPURISCVState *env = &cpu->env;
-    bool prev_val = isa_ext_is_enabled(cpu, ext_offset);
-    int min_version;
-
-    if (prev_val == value) {
-        return;
-    }
-
-    if (cpu_cfg_ext_is_user_set(ext_offset)) {
-        return;
-    }
-
-    if (value && env->priv_ver != PRIV_VERSION_LATEST) {
-        /* Do not enable it if priv_ver is older than min_version */
-        min_version = cpu_cfg_ext_get_min_version(ext_offset);
-        if (env->priv_ver < min_version) {
-            return;
-        }
-    }
-
-    isa_ext_update_enabled(cpu, ext_offset, value);
-}
-
-static void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **errp)
-{
-    if (riscv_has_ext(env, RVH) && env->priv_ver < PRIV_VERSION_1_12_0) {
-        error_setg(errp, "H extension requires priv spec 1.12.0");
-        return;
-    }
-}
-
-static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
-                                 Error **errp)
-{
-    uint32_t min_vlen;
-    uint32_t vlen = cfg->vlenb << 3;
-
-    if (riscv_has_ext(env, RVV)) {
-        min_vlen = 128;
-    } else if (cfg->ext_zve64x) {
-        min_vlen = 64;
-    } else if (cfg->ext_zve32x) {
-        min_vlen = 32;
-    } else {
-        return;
-    }
-
-    if (vlen > RV_VLEN_MAX || vlen < min_vlen) {
-        error_setg(errp,
-                   "Vector extension implementation only supports VLEN "
-                   "in the range [%d, %d]", min_vlen, RV_VLEN_MAX);
-        return;
-    }
-
-    if (cfg->elen > 64 || cfg->elen < 8) {
-        error_setg(errp,
-                   "Vector extension implementation only supports ELEN "
-                   "in the range [8, 64]");
-        return;
-    }
-
-    if (vlen < cfg->elen) {
-        error_setg(errp, "Vector extension implementation requires VLEN "
-                         "to be greater than or equal to ELEN");
-        return;
-    }
-}
-
-static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
-{
-    CPURISCVState *env = &cpu->env;
-    const RISCVIsaExtData *edata;
-
-    /* Force disable extensions if priv spec version does not match */
-    for (edata = isa_edata_arr; edata && edata->name; edata++) {
-        if (isa_ext_is_enabled(cpu, edata->ext_enable_offset) &&
-            (env->priv_ver < edata->min_version)) {
-            /*
-             * These two extensions are always enabled as they were supported
-             * by QEMU before they were added as extensions in the ISA.
-             */
-            if (!strcmp(edata->name, "zicntr") ||
-                !strcmp(edata->name, "zihpm")) {
-                continue;
-            }
-
-            /*
-             * cpu.debug = true is marked as 'sdtrig', priv spec 1.12.
-             * Skip this warning since existing CPUs with older priv
-             * spec and debug = true will be impacted.
-             */
-            if (!strcmp(edata->name, "sdtrig")) {
-                continue;
-            }
-
-            isa_ext_update_enabled(cpu, edata->ext_enable_offset, false);
-#ifndef CONFIG_USER_ONLY
-            warn_report("disabling %s extension for hart 0x%" PRIx64
-                        " because privilege spec version does not match",
-                        edata->name, env->mhartid);
-#else
-            warn_report("disabling %s extension because "
-                        "privilege spec version does not match",
-                        edata->name);
-#endif
-        }
-    }
-}
-
-static void riscv_cpu_update_cfg(RISCVCPU *cpu)
-{
-    if (cpu->env.priv_ver >= PRIV_VERSION_1_11_0) {
-        cpu->cfg.has_priv_1_11 = true;
-    }
-
-    if (cpu->env.priv_ver >= PRIV_VERSION_1_12_0) {
-        cpu->cfg.has_priv_1_12 = true;
-    }
-
-    if (cpu->env.priv_ver >= PRIV_VERSION_1_13_0) {
-        cpu->cfg.has_priv_1_13 = true;
-    }
-
-    /* zic64b is 1.12 or later */
-    cpu->cfg.ext_zic64b = cpu->cfg.cbom_blocksize == 64 &&
-                          cpu->cfg.cbop_blocksize == 64 &&
-                          cpu->cfg.cboz_blocksize == 64 &&
-                          cpu->cfg.has_priv_1_12;
-
-    cpu->cfg.ext_ssstateen = cpu->cfg.ext_smstateen;
-
-    cpu->cfg.ext_sha = riscv_has_ext(&cpu->env, RVH) &&
-                       cpu->cfg.ext_ssstateen;
-
-    cpu->cfg.ext_ziccrse = cpu->cfg.has_priv_1_11;
-}
-
-static void riscv_cpu_validate_g(RISCVCPU *cpu)
-{
-    const char *warn_msg = "RVG mandates disabled extension %s";
-    uint32_t g_misa_bits[] = {RVI, RVM, RVA, RVF, RVD};
-    bool send_warn = cpu_misa_ext_is_user_set(RVG);
-
-    for (int i = 0; i < ARRAY_SIZE(g_misa_bits); i++) {
-        uint32_t bit = g_misa_bits[i];
-
-        if (riscv_has_ext(&cpu->env, bit)) {
-            continue;
-        }
-
-        if (!cpu_misa_ext_is_user_set(bit)) {
-            riscv_cpu_write_misa_bit(cpu, bit, true);
-            continue;
-        }
-
-        if (send_warn) {
-            warn_report(warn_msg, riscv_get_misa_ext_name(bit));
-        }
-    }
-
-    if (!cpu->cfg.ext_zicsr) {
-        if (!cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zicsr))) {
-            cpu->cfg.ext_zicsr = true;
-        } else if (send_warn) {
-            warn_report(warn_msg, "zicsr");
-        }
-    }
-
-    if (!cpu->cfg.ext_zifencei) {
-        if (!cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zifencei))) {
-            cpu->cfg.ext_zifencei = true;
-        } else if (send_warn) {
-            warn_report(warn_msg, "zifencei");
-        }
-    }
-}
-
-static void riscv_cpu_validate_b(RISCVCPU *cpu)
-{
-    const char *warn_msg = "RVB mandates disabled extension %s";
-
-    if (!cpu->cfg.ext_zba) {
-        if (!cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zba))) {
-            cpu->cfg.ext_zba = true;
-        } else {
-            warn_report(warn_msg, "zba");
-        }
-    }
-
-    if (!cpu->cfg.ext_zbb) {
-        if (!cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zbb))) {
-            cpu->cfg.ext_zbb = true;
-        } else {
-            warn_report(warn_msg, "zbb");
-        }
-    }
-
-    if (!cpu->cfg.ext_zbs) {
-        if (!cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zbs))) {
-            cpu->cfg.ext_zbs = true;
-        } else {
-            warn_report(warn_msg, "zbs");
-        }
-    }
-}
-
-/*
- * Check consistency between chosen extensions while setting
- * cpu->cfg accordingly.
- */
-void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
-{
-    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
-    CPURISCVState *env = &cpu->env;
-    Error *local_err = NULL;
-
-    if (riscv_has_ext(env, RVG)) {
-        riscv_cpu_validate_g(cpu);
-    }
-
-    if (riscv_has_ext(env, RVB)) {
-        riscv_cpu_validate_b(cpu);
-    }
-
-    if (riscv_has_ext(env, RVI) && riscv_has_ext(env, RVE)) {
-        error_setg(errp,
-                   "I and E extensions are incompatible");
-        return;
-    }
-
-    if (!riscv_has_ext(env, RVI) && !riscv_has_ext(env, RVE)) {
-        error_setg(errp,
-                   "Either I or E extension must be set");
-        return;
-    }
-
-    if (riscv_has_ext(env, RVS) && !riscv_has_ext(env, RVU)) {
-        error_setg(errp,
-                   "Setting S extension without U extension is illegal");
-        return;
-    }
-
-    if (riscv_has_ext(env, RVH) && !riscv_has_ext(env, RVI)) {
-        error_setg(errp,
-                   "H depends on an I base integer ISA with 32 x registers");
-        return;
-    }
-
-    if (riscv_has_ext(env, RVH) && !riscv_has_ext(env, RVS)) {
-        error_setg(errp, "H extension implicitly requires S-mode");
-        return;
-    }
-
-    if (riscv_has_ext(env, RVF) && !cpu->cfg.ext_zicsr) {
-        error_setg(errp, "F extension requires Zicsr");
-        return;
-    }
-
-    if ((cpu->cfg.ext_zacas) && !riscv_has_ext(env, RVA)) {
-        error_setg(errp, "Zacas extension requires A extension");
-        return;
-    }
-
-    if ((cpu->cfg.ext_zawrs) && !riscv_has_ext(env, RVA)) {
-        error_setg(errp, "Zawrs extension requires A extension");
-        return;
-    }
-
-    if (cpu->cfg.ext_zfa && !riscv_has_ext(env, RVF)) {
-        error_setg(errp, "Zfa extension requires F extension");
-        return;
-    }
-
-    if (cpu->cfg.ext_zfhmin && !riscv_has_ext(env, RVF)) {
-        error_setg(errp, "Zfh/Zfhmin extensions require F extension");
-        return;
-    }
-
-    if (cpu->cfg.ext_zfbfmin && !riscv_has_ext(env, RVF)) {
-        error_setg(errp, "Zfbfmin extension depends on F extension");
-        return;
-    }
-
-    if (riscv_has_ext(env, RVD) && !riscv_has_ext(env, RVF)) {
-        error_setg(errp, "D extension requires F extension");
-        return;
-    }
-
-    riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
-    if (local_err != NULL) {
-        error_propagate(errp, local_err);
-        return;
-    }
-
-    /* The Zve64d extension depends on the Zve64f extension */
-    if (cpu->cfg.ext_zve64d) {
-        if (!riscv_has_ext(env, RVD)) {
-            error_setg(errp, "Zve64d/V extensions require D extension");
-            return;
-        }
-    }
-
-    /* The Zve32f extension depends on the Zve32x extension */
-    if (cpu->cfg.ext_zve32f) {
-        if (!riscv_has_ext(env, RVF)) {
-            error_setg(errp, "Zve32f/Zve64f extensions require F extension");
-            return;
-        }
-    }
-
-    if (cpu->cfg.ext_zvfhmin && !cpu->cfg.ext_zve32f) {
-        error_setg(errp, "Zvfh/Zvfhmin extensions require Zve32f extension");
-        return;
-    }
-
-    if (cpu->cfg.ext_zvfh && !cpu->cfg.ext_zfhmin) {
-        error_setg(errp, "Zvfh extensions requires Zfhmin extension");
-        return;
-    }
-
-    if (cpu->cfg.ext_zvfbfmin && !cpu->cfg.ext_zve32f) {
-        error_setg(errp, "Zvfbfmin extension depends on Zve32f extension");
-        return;
-    }
-
-    if (cpu->cfg.ext_zvfbfwma && !cpu->cfg.ext_zvfbfmin) {
-        error_setg(errp, "Zvfbfwma extension depends on Zvfbfmin extension");
-        return;
-    }
-
-    if (cpu->cfg.ext_zvfbfa) {
-        if (!cpu->cfg.ext_zve32f || !cpu->cfg.ext_zfbfmin) {
-            error_setg(errp, "Zvfbfa extension requires Zve32f extension "
-                             "and Zfbfmin extension");
-            return;
-        }
-    }
-
-    if ((cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinxmin) && !cpu->cfg.ext_zfinx) {
-        error_setg(errp, "Zdinx/Zhinx/Zhinxmin extensions require Zfinx");
-        return;
-    }
-
-    if (cpu->cfg.ext_zfinx) {
-        if (!cpu->cfg.ext_zicsr) {
-            error_setg(errp, "Zfinx extension requires Zicsr");
-            return;
-        }
-        if (riscv_has_ext(env, RVF)) {
-            error_setg(errp,
-                       "Zfinx cannot be supported together with F extension");
-            return;
-        }
-    }
-
-    if (cpu->cfg.ext_zcmop && !cpu->cfg.ext_zca) {
-        error_setg(errp, "Zcmop extensions require Zca");
-        return;
-    }
-
-    if (mcc->def->misa_mxl_max != MXL_RV32 && cpu->cfg.ext_zcf) {
-        error_setg(errp, "Zcf extension is only relevant to RV32");
-        return;
-    }
-
-    if (!riscv_has_ext(env, RVF) && cpu->cfg.ext_zcf) {
-        error_setg(errp, "Zcf extension requires F extension");
-        return;
-    }
-
-    if (!riscv_has_ext(env, RVD) && cpu->cfg.ext_zcd) {
-        error_setg(errp, "Zcd extension requires D extension");
-        return;
-    }
-
-    if ((cpu->cfg.ext_zcf || cpu->cfg.ext_zcd || cpu->cfg.ext_zcb ||
-         cpu->cfg.ext_zcmp || cpu->cfg.ext_zcmt) && !cpu->cfg.ext_zca) {
-        error_setg(errp, "Zcf/Zcd/Zcb/Zcmp/Zcmt extensions require Zca "
-                         "extension");
-        return;
-    }
-
-    if (cpu->cfg.ext_zcd && (cpu->cfg.ext_zcmp || cpu->cfg.ext_zcmt)) {
-        error_setg(errp, "Zcmp/Zcmt extensions are incompatible with "
-                         "Zcd extension");
-        return;
-    }
-
-    if (cpu->cfg.ext_zcmt && !cpu->cfg.ext_zicsr) {
-        error_setg(errp, "Zcmt extension requires Zicsr extension");
-        return;
-    }
-
-    if ((cpu->cfg.ext_zvbb || cpu->cfg.ext_zvkb || cpu->cfg.ext_zvkg ||
-         cpu->cfg.ext_zvkned || cpu->cfg.ext_zvknha || cpu->cfg.ext_zvksed ||
-         cpu->cfg.ext_zvksh) && !cpu->cfg.ext_zve32x) {
-        error_setg(errp,
-                   "Vector crypto extensions require V or Zve* extensions");
-        return;
-    }
-
-    if ((cpu->cfg.ext_zvbc || cpu->cfg.ext_zvknhb) && !cpu->cfg.ext_zve64x) {
-        error_setg(
-            errp,
-            "Zvbc and Zvknhb extensions require V or Zve64x extensions");
-        return;
-    }
-
-    if (cpu->cfg.ext_zicntr && !cpu->cfg.ext_zicsr) {
-        if (cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zicntr))) {
-            error_setg(errp, "zicntr requires zicsr");
-            return;
-        }
-        cpu->cfg.ext_zicntr = false;
-    }
-
-    if (cpu->cfg.ext_zihpm && !cpu->cfg.ext_zicsr) {
-        if (cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zihpm))) {
-            error_setg(errp, "zihpm requires zicsr");
-            return;
-        }
-        cpu->cfg.ext_zihpm = false;
-    }
-
-    if (cpu->cfg.ext_zicfiss) {
-        if (!cpu->cfg.ext_zicsr) {
-            error_setg(errp, "zicfiss extension requires zicsr extension");
-            return;
-        }
-        if (!riscv_has_ext(env, RVA)) {
-            error_setg(errp, "zicfiss extension requires A extension");
-            return;
-        }
-        if (!riscv_has_ext(env, RVS)) {
-            error_setg(errp, "zicfiss extension requires S");
-            return;
-        }
-        if (!cpu->cfg.ext_zimop) {
-            error_setg(errp, "zicfiss extension requires zimop extension");
-            return;
-        }
-        if (cpu->cfg.ext_zca && !cpu->cfg.ext_zcmop) {
-            error_setg(errp, "zicfiss with zca requires zcmop extension");
-            return;
-        }
-    }
-
-    if (!cpu->cfg.ext_zihpm) {
-        cpu->cfg.pmu_mask = 0;
-        cpu->pmu_avail_ctrs = 0;
-    }
-
-    if (cpu->cfg.ext_zclsd) {
-        if (riscv_has_ext(env, RVC) && riscv_has_ext(env, RVF)) {
-            error_setg(errp,
-                    "Zclsd cannot be supported together with C and F extension");
-            return;
-        }
-        if (cpu->cfg.ext_zcf) {
-            error_setg(errp,
-                    "Zclsd cannot be supported together with Zcf extension");
-            return;
-        }
-    }
-
-    if (cpu->cfg.ext_zicfilp && !cpu->cfg.ext_zicsr) {
-        error_setg(errp, "zicfilp extension requires zicsr extension");
-        return;
-    }
-
-    if (mcc->def->misa_mxl_max == MXL_RV32 && cpu->cfg.ext_svukte) {
-        error_setg(errp, "svukte is not supported for RV32");
-        return;
-    }
-
-    if ((cpu->cfg.ext_smctr || cpu->cfg.ext_ssctr) &&
-        (!riscv_has_ext(env, RVS) || !cpu->cfg.ext_sscsrind)) {
-        if (cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_smctr)) ||
-            cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_ssctr))) {
-            error_setg(errp, "Smctr and Ssctr require S-mode and Sscsrind");
-            return;
-        }
-        cpu->cfg.ext_smctr = false;
-        cpu->cfg.ext_ssctr = false;
-    }
-
-    if (cpu->cfg.ext_svrsw60t59b &&
-        (!cpu->cfg.mmu || mcc->def->misa_mxl_max == MXL_RV32)) {
-        error_setg(errp, "svrsw60t59b is not supported on RV32 and MMU-less platforms");
-        return;
-    }
-
-    /*
-     * Disable isa extensions based on priv spec after we
-     * validated and set everything we need.
-     */
-    riscv_cpu_disable_priv_spec_isa_exts(cpu);
-}
-
 #ifndef CONFIG_USER_ONLY
 static bool riscv_cpu_validate_profile_satp(RISCVCPU *cpu,
                                             RISCVCPUProfile *profile,
@@ -934,7 +342,7 @@ static void riscv_cpu_validate_profile(RISCVCPU *cpu,
 
             if (send_warn) {
                 warn_report(warn_msg, profile->name,
-                            cpu_cfg_ext_get_name(ext_offset));
+                            riscv_cpu_cfg_ext_get_name(ext_offset));
             }
         }
     }
@@ -1006,7 +414,7 @@ static void cpu_enable_implied_rule(RISCVCPU *cpu,
                      * If the user disabled the misa_bit do not re-enable it
                      * and do not apply any implied rules related to it.
                      */
-                    if (cpu_misa_ext_is_user_set(misa_bits[i]) &&
+                    if (riscv_cpu_misa_ext_is_user_set(misa_bits[i]) &&
                         !(env->misa_ext & misa_bits[i])) {
                         continue;
                     }
@@ -1025,7 +433,7 @@ static void cpu_enable_implied_rule(RISCVCPU *cpu,
         /* Enable the implied extensions. */
         for (i = 0;
              rule->implied_multi_exts[i] != RISCV_IMPLIED_EXTS_RULE_END; i++) {
-            cpu_cfg_ext_auto_update(cpu, rule->implied_multi_exts[i], true);
+            riscv_cpu_cfg_ext_auto_update(cpu, rule->implied_multi_exts[i], true);
 
             ir = g_hash_table_lookup(multi_ext_implied_rules,
                                      GUINT_TO_POINTER(
@@ -1049,26 +457,26 @@ static void cpu_enable_zc_implied_rules(RISCVCPU *cpu)
     CPURISCVState *env = &cpu->env;
 
     if (cpu->cfg.ext_zce) {
-        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zca), true);
-        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcb), true);
-        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcmp), true);
-        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcmt), true);
+        riscv_cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zca), true);
+        riscv_cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcb), true);
+        riscv_cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcmp), true);
+        riscv_cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcmt), true);
 
         if (riscv_has_ext(env, RVF) && mcc->def->misa_mxl_max == MXL_RV32) {
-            cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcf), true);
+            riscv_cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcf), true);
         }
     }
 
     /* Zca, Zcd and Zcf has a PRIV 1.12.0 restriction */
     if (riscv_has_ext(env, RVC) && env->priv_ver >= PRIV_VERSION_1_12_0) {
-        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zca), true);
+        riscv_cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zca), true);
 
         if (riscv_has_ext(env, RVF) && mcc->def->misa_mxl_max == MXL_RV32) {
-            cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcf), true);
+            riscv_cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcf), true);
         }
 
         if (riscv_has_ext(env, RVD)) {
-            cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcd), true);
+            riscv_cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcd), true);
         }
     }
 }
@@ -1078,12 +486,12 @@ static void cpu_enable_zilsd_implied_rules(RISCVCPU *cpu)
     CPURISCVState *env = &cpu->env;
 
     if (cpu->cfg.ext_zilsd && riscv_has_ext(env, RVC)) {
-        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zclsd), true);
+        riscv_cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zclsd), true);
     }
 
     if (cpu->cfg.ext_zclsd) {
-        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zca), true);
-        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zilsd), true);
+        riscv_cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zca), true);
+        riscv_cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zilsd), true);
     }
 }
 
@@ -1142,7 +550,7 @@ static void riscv_cpu_update_misa_c(RISCVCPU *cpu)
     }
 
     if (set_misa_c) {
-        if (cpu_misa_ext_is_user_set(RVC)) {
+        if (riscv_cpu_misa_ext_is_user_set(RVC)) {
             warn_report("RVC mandated by Zca/Zcf/Zcd extensions");
             return;
         }
@@ -1284,7 +692,7 @@ static void riscv_cpu_set_profile(RISCVCPU *cpu,
             continue;
         }
 
-        cpu_misa_ext_add_user_opt(bit, profile->enabled);
+        riscv_cpu_misa_ext_add_user_opt(bit, profile->enabled);
         riscv_cpu_write_misa_bit(cpu, bit, profile->enabled);
     }
 
@@ -1292,10 +700,10 @@ static void riscv_cpu_set_profile(RISCVCPU *cpu,
         ext_offset = profile->ext_offsets[i];
 
         if (profile->enabled) {
-            cpu_bump_multi_ext_priv_ver(&cpu->env, ext_offset);
+            riscv_cpu_bump_multi_ext_priv_ver(&cpu->env, ext_offset);
         }
 
-        cpu_cfg_ext_add_user_opt(ext_offset, profile->enabled);
+        riscv_cpu_cfg_ext_add_user_opt(ext_offset, profile->enabled);
         isa_ext_update_enabled(cpu, ext_offset, profile->enabled);
     }
 }
@@ -1355,7 +763,7 @@ static void cpu_set_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    cpu_misa_ext_add_user_opt(misa_bit, value);
+    riscv_cpu_misa_ext_add_user_opt(misa_bit, value);
 
     prev_val = env->misa_ext & misa_bit;
 
@@ -1519,7 +927,7 @@ static void cpu_set_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    cpu_cfg_ext_add_user_opt(cfg_offset, value);
+    riscv_cpu_cfg_ext_add_user_opt(cfg_offset, value);
 
     prev_val = isa_ext_is_enabled(cpu, cfg_offset);
 
@@ -1535,7 +943,7 @@ static void cpu_set_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
     }
 
     if (value) {
-        cpu_bump_multi_ext_priv_ver(&cpu->env, cfg_offset);
+        riscv_cpu_bump_multi_ext_priv_ver(&cpu->env, cfg_offset);
     }
 
     isa_ext_update_enabled(cpu, cfg_offset, value);
@@ -1656,8 +1064,7 @@ static void riscv_tcg_cpu_instance_init(CPUState *cs)
     RISCVCPU *cpu = RISCV_CPU(cs);
     Object *obj = OBJECT(cpu);
 
-    misa_ext_user_opts = g_hash_table_new(NULL, g_direct_equal);
-    multi_ext_user_opts = g_hash_table_new(NULL, g_direct_equal);
+    riscv_cpu_ext_user_opts_init();
 
     if (!misa_ext_implied_rules) {
         misa_ext_implied_rules = g_hash_table_new(NULL, g_direct_equal);
diff --git a/target/riscv/tcg/tcg-cpu.h b/target/riscv/tcg/tcg-cpu.h
index a23716a5ac..ceef3c4df2 100644
--- a/target/riscv/tcg/tcg-cpu.h
+++ b/target/riscv/tcg/tcg-cpu.h
@@ -22,7 +22,6 @@
 
 #include "cpu.h"
 
-void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp);
 void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, Error **errp);
 bool riscv_cpu_tcg_compatible(RISCVCPU *cpu);
 
-- 
2.43.0


