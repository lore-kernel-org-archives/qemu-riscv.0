Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4F4C7EE25
	for <qemu-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 07:24:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q79zR-0002ES-GT; Thu, 08 Jun 2023 03:23:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1q79zR-0002ED-28
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 03:23:25 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1q79zP-0006d8-6i
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 03:23:24 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-19f30256921so305820fac.1
 for <qemu-riscv@nongnu.org>; Thu, 08 Jun 2023 00:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1686209002; x=1688801002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/a9+HZ4wzLqdGtQZUCV5pjACT5MRVawLjtUjcNhMK3Q=;
 b=G/L3yJCsm9dnKHWgx0QBdqZ0vElnjz6bXp6wjJ47DfGGBlxLhJxGnUVmGMfefZaHm7
 JU4pD0HeTJ3vUrv/Z2hMgaNlzM46+idDv9wcar4QHS4GiIGjHmFsQBYN1jQsnlii9yiQ
 fmqwPXzqGVQu+ozyxFce7zVPe9BnU4PLw+8MSFjnVp6f/Elz/MNZ5qQ5UgmAuhhANhN8
 042szaq4jOgH3SoiUScd7hTRfupqzhRI5rE6+IS+f1l+rWDYed9eNBbWZ3SDT2YBZMaa
 9RoCYNanPKnGA5enlokgwlrj0ltJUZltwTBXc2rl651fL+HkNegud1BtXo8gsnJ7wJU0
 /PMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686209002; x=1688801002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/a9+HZ4wzLqdGtQZUCV5pjACT5MRVawLjtUjcNhMK3Q=;
 b=UcDmitkyScv3IXIkYbPrYG5NhL3Dzk8AWwOe+gmxlcM8l/xyGZWTBMsZ2GO7jogABl
 GbzZ5LyXYnzBvJg59JAgd8imtFADvSmRo0BcOtcjFLq/j5BD1o7d0F4TKWikQEMmpwXq
 Pob0XHnA4BWoBs5Em8BHIoI16fQ4XWUrQLidOfqPlQd9bKcMGZHFxH0rph8dY7Ok1Nbz
 vNHVuhS5klerPT/4QRBirW293SgvAhxnaRxNTaHNoi27pvKpl4FyEqYnG20RHeNjyvx2
 9jAMWgR1pq2g8aF3OqrapXNvHM9yo3boDjr6roJm38/uoho4M+V+Zs9S0aJ2Zlgejqfi
 iH0A==
X-Gm-Message-State: AC+VfDzM1hufQF68XpV/saNjXrltkDAXlgaqa3JRwGJ8hZqwx9tbuSTq
 7kv6nJjKjBoU2KgXC4ZCiy9DYg==
X-Google-Smtp-Source: ACHHUZ4/ciYp+pJ1cm60GRsFahlzHs1FPvm2MxoKTJOOmVzw+fL2bOGtTEur9lkDXhDHQbfbTaeqVg==
X-Received: by 2002:a05:6870:9204:b0:191:89b3:6f46 with SMTP id
 e4-20020a056870920400b0019189b36f46mr6340245oaf.38.1686209000590; 
 Thu, 08 Jun 2023 00:23:20 -0700 (PDT)
Received: from sw05.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id
 x144-20020a4a4196000000b0051134f333d3sm274293ooa.16.2023.06.08.00.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 00:23:20 -0700 (PDT)
From: Tommy Wu <tommy.wu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: frank.chang@sifive.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, richard.henderson@linaro.org,
 Tommy Wu <tommy.wu@sifive.com>
Subject: [PATCH v4 1/4] target/riscv: Add Smrnmi cpu extension.
Date: Thu,  8 Jun 2023 00:23:11 -0700
Message-Id: <20230608072314.3561109-2-tommy.wu@sifive.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230608072314.3561109-1-tommy.wu@sifive.com>
References: <20230608072314.3561109-1-tommy.wu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=tommy.wu@sifive.com; helo=mail-oa1-x29.google.com
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

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
---
 hw/riscv/riscv_hart.c         | 21 +++++++++++++++++++++
 include/hw/riscv/riscv_hart.h |  4 ++++
 target/riscv/cpu.c            | 13 +++++++++++++
 target/riscv/cpu.h            |  7 +++++++
 target/riscv/cpu_bits.h       | 12 ++++++++++++
 target/riscv/cpu_helper.c     | 24 ++++++++++++++++++++++++
 6 files changed, 81 insertions(+)

diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
index 613ea2aaa0..eac18f8c29 100644
--- a/hw/riscv/riscv_hart.c
+++ b/hw/riscv/riscv_hart.c
@@ -33,6 +33,12 @@ static Property riscv_harts_props[] = {
     DEFINE_PROP_STRING("cpu-type", RISCVHartArrayState, cpu_type),
     DEFINE_PROP_UINT64("resetvec", RISCVHartArrayState, resetvec,
                        DEFAULT_RSTVEC),
+    DEFINE_PROP_ARRAY("rnmi-interrupt-vector", RISCVHartArrayState,
+                      num_rnmi_irqvec, rnmi_irqvec, qdev_prop_uint64,
+                      uint64_t),
+    DEFINE_PROP_ARRAY("rnmi-exception-vector", RISCVHartArrayState,
+                      num_rnmi_excpvec, rnmi_excpvec, qdev_prop_uint64,
+                      uint64_t),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -47,6 +53,21 @@ static bool riscv_hart_realize(RISCVHartArrayState *s, int idx,
 {
     object_initialize_child(OBJECT(s), "harts[*]", &s->harts[idx], cpu_type);
     qdev_prop_set_uint64(DEVICE(&s->harts[idx]), "resetvec", s->resetvec);
+
+    if (s->harts[idx].cfg.ext_smrnmi) {
+        if (s->rnmi_irqvec) {
+            qdev_prop_set_uint64(DEVICE(&s->harts[idx]),
+                                 "rnmi-interrupt-vector",
+                                 s->rnmi_irqvec[idx]);
+        }
+
+        if (s->rnmi_excpvec) {
+            qdev_prop_set_uint64(DEVICE(&s->harts[idx]),
+                                 "rnmi-exception-vector",
+                                 s->rnmi_excpvec[idx]);
+        }
+    }
+
     s->harts[idx].env.mhartid = s->hartid_base + idx;
     qemu_register_reset(riscv_harts_cpu_reset, &s->harts[idx]);
     return qdev_realize(DEVICE(&s->harts[idx]), NULL, errp);
diff --git a/include/hw/riscv/riscv_hart.h b/include/hw/riscv/riscv_hart.h
index bbc21cdc9a..99c0ac5009 100644
--- a/include/hw/riscv/riscv_hart.h
+++ b/include/hw/riscv/riscv_hart.h
@@ -38,6 +38,10 @@ struct RISCVHartArrayState {
     uint32_t hartid_base;
     char *cpu_type;
     uint64_t resetvec;
+    uint32_t num_rnmi_irqvec;
+    uint64_t *rnmi_irqvec;
+    uint32_t num_rnmi_excpvec;
+    uint64_t *rnmi_excpvec;
     RISCVCPU *harts;
 };
 
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index db0875fb43..c8dc0eaa87 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -119,6 +119,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
+    ISA_EXT_DATA_ENTRY(smrnmi, PRIV_VERSION_1_12_0, ext_smrnmi),
     ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
     ISA_EXT_DATA_ENTRY(sscofpmf, PRIV_VERSION_1_12_0, ext_sscofpmf),
     ISA_EXT_DATA_ENTRY(sstc, PRIV_VERSION_1_12_0, ext_sstc),
@@ -1404,6 +1405,11 @@ static void riscv_cpu_set_irq(void *opaque, int irq, int level)
         g_assert_not_reached();
     }
 }
+
+static void riscv_cpu_set_nmi(void *opaque, int irq, int level)
+{
+    riscv_cpu_set_rnmi(RISCV_CPU(opaque), irq, level);
+}
 #endif /* CONFIG_USER_ONLY */
 
 static void riscv_cpu_init(Object *obj)
@@ -1420,6 +1426,8 @@ static void riscv_cpu_init(Object *obj)
 #ifndef CONFIG_USER_ONLY
     qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq,
                       IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
+    qdev_init_gpio_in_named(DEVICE(cpu), riscv_cpu_set_nmi,
+                            "riscv.cpu.rnmi", RNMI_MAX);
 #endif /* CONFIG_USER_ONLY */
 }
 
@@ -1600,6 +1608,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
     DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
     DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
+    DEFINE_PROP_BOOL("x-smrnmi", RISCVCPU, cfg.ext_smrnmi, false),
 
     DEFINE_PROP_BOOL("x-zvfh", RISCVCPU, cfg.ext_zvfh, false),
     DEFINE_PROP_BOOL("x-zvfhmin", RISCVCPU, cfg.ext_zvfhmin, false),
@@ -1644,6 +1653,10 @@ static Property riscv_cpu_properties[] = {
 
     DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
     DEFINE_PROP_BOOL("rvv_ma_all_1s", RISCVCPU, cfg.rvv_ma_all_1s, false),
+    DEFINE_PROP_UINT64("rnmi-interrupt-vector", RISCVCPU, env.rnmi_irqvec,
+                       DEFAULT_RNMI_IRQVEC),
+    DEFINE_PROP_UINT64("rnmi-exception-vector", RISCVCPU, env.rnmi_excpvec,
+                       DEFAULT_RNMI_EXCPVEC),
 
     /*
      * write_misa() is marked as experimental for now so mark
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index de7e43126a..6c14b93cb5 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -366,6 +366,11 @@ struct CPUArchState {
     uint64_t kvm_timer_compare;
     uint64_t kvm_timer_state;
     uint64_t kvm_timer_frequency;
+
+    /* RNMI */
+    target_ulong rnmip;
+    uint64_t rnmi_irqvec;
+    uint64_t rnmi_excpvec;
 };
 
 /*
@@ -436,6 +441,7 @@ struct RISCVCPUConfig {
     bool ext_smaia;
     bool ext_ssaia;
     bool ext_sscofpmf;
+    bool ext_smrnmi;
     bool rvv_ta_all_1s;
     bool rvv_ma_all_1s;
 
@@ -562,6 +568,7 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts);
 uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask,
                               uint64_t value);
+void riscv_cpu_set_rnmi(RISCVCPU *cpu, uint32_t irq, bool level);
 #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
 void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void *),
                              void *arg);
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 59f0ffd9e1..7cb43b88f3 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -659,6 +659,12 @@ typedef enum {
 /* Default Reset Vector adress */
 #define DEFAULT_RSTVEC      0x1000
 
+/* Default RNMI Interrupt Vector address */
+#define DEFAULT_RNMI_IRQVEC     0x0
+
+/* Default RNMI Exception Vector address */
+#define DEFAULT_RNMI_EXCPVEC    0x0
+
 /* Exception causes */
 typedef enum RISCVException {
     RISCV_EXCP_NONE = -1, /* sentinel value */
@@ -705,6 +711,9 @@ typedef enum RISCVException {
 #define IRQ_LOCAL_MAX                      16
 #define IRQ_LOCAL_GUEST_MAX                (TARGET_LONG_BITS - 1)
 
+/* RNMI causes */
+#define RNMI_MAX                           16
+
 /* mip masks */
 #define MIP_USIP                           (1 << IRQ_U_SOFT)
 #define MIP_SSIP                           (1 << IRQ_S_SOFT)
@@ -896,6 +905,9 @@ typedef enum RISCVException {
 #define MHPMEVENT_IDX_MASK                 0xFFFFF
 #define MHPMEVENT_SSCOF_RESVD              16
 
+/* RISC-V-specific interrupt pending bits. */
+#define CPU_INTERRUPT_RNMI                 CPU_INTERRUPT_TGT_EXT_0
+
 /* JVT CSR bits */
 #define JVT_MODE                           0x3F
 #define JVT_BASE                           (~0x3F)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 56381aaf26..da477b6c99 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -636,6 +636,30 @@ uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask,
     return old;
 }
 
+void riscv_cpu_set_rnmi(RISCVCPU *cpu, uint32_t irq, bool level)
+{
+    CPURISCVState *env = &cpu->env;
+    CPUState *cs = CPU(cpu);
+    bool release_lock = false;
+
+    if (!qemu_mutex_iothread_locked()) {
+        release_lock = true;
+        qemu_mutex_lock_iothread();
+    }
+
+    if (level) {
+        env->rnmip |= 1 << irq;
+        cpu_interrupt(cs, CPU_INTERRUPT_RNMI);
+    } else {
+        env->rnmip &= ~(1 << irq);
+        cpu_reset_interrupt(cs, CPU_INTERRUPT_RNMI);
+    }
+
+    if (release_lock) {
+        qemu_mutex_unlock_iothread();
+    }
+}
+
 void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void *),
                              void *arg)
 {
-- 
2.31.1


