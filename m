Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F525C77B75
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 May 2023 13:11:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q15K3-0005dF-0B; Mon, 22 May 2023 09:11:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1q15K1-0005aZ-3j
 for qemu-riscv@nongnu.org; Mon, 22 May 2023 09:11:33 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1q15Jz-0007Yv-1R
 for qemu-riscv@nongnu.org; Mon, 22 May 2023 09:11:32 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6abeffced6fso4255899a34.3
 for <qemu-riscv@nongnu.org>; Mon, 22 May 2023 06:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1684761089; x=1687353089;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hWmVPz0z9TTwL+Konhxs2xIDeoQFsXMnAz2fyQhJZCA=;
 b=AWmklZaJdLHBd1PWYxwWBmHuqRVcbxzG3xSGonRP4R3bDpZdhYDi07an/n1PNa4Qoh
 FDIKX4KDsw450gtlrVRPKzZaXT6eyyk2d/AR0ScrDF10R6pAbAKhQBYbeEhIre0k9bIQ
 FAhTSMQD49+k3nsOajbBcdT5cN/LhSsrocGC4rVaFrlOWBGA5jzPODdLOM31uu8nGkYH
 0j9nCAONI6XS8kDYiJQObXwSx19hXOwIw7sCXWhZqMZcpWM6mQCnKC77Xqt6Q3vUxXew
 SuUKPN9SBzwkxekA+V4Lek6F81wuzQDZ7EdvmYHCXnAXuUP+hS1PQLPt11zlF1DKQylw
 4F+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684761089; x=1687353089;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hWmVPz0z9TTwL+Konhxs2xIDeoQFsXMnAz2fyQhJZCA=;
 b=HZLujzOCKXf8k9M4AgUJcQSdXMdzn0HGIaiJz+s7oDLZzLNbQV8XdCi+FiqvlFTVhp
 3erD2hbv9C7nvFeOIwUm3vbPmCkYr/mhBj1l2jiJTMnnKh8Qtrt37vyM1dVOio6dEreD
 GpIqa+jc8QSwdk/+lYTP2UquMJFawnBzw2hVxpRQOfshupYn3X8LAHGiOYsaKpfwhzCA
 iJMz0GWXU1uV+HbcJJoCSokrdcCbbs/2V6jKsjNIgNkc6fuceVL4+7Nc1Yh4p/TmS33x
 NLAoZE5/fD3UA4cChk5ABWsg2ye157zsO1wJmdkVe7e2cWd9lqloI558U9cj7yfNH2bL
 BXuw==
X-Gm-Message-State: AC+VfDy+FJxhDQptS9YjEiXnwbDGBuyCNs3nc6J/K+RP59cZV9sGRdQB
 Q6vkaMRI6MG/bf0ljS/kv2EFLA==
X-Google-Smtp-Source: ACHHUZ6dwAmDTy6h5SEh6FMnySO30wV2B2Aixfh7IiRwpsW2EtrcKP3cg+VMA071otTHWZp4ha0mIw==
X-Received: by 2002:a9d:734e:0:b0:6af:86c4:fc61 with SMTP id
 l14-20020a9d734e000000b006af86c4fc61mr414200otk.11.1684761089629; 
 Mon, 22 May 2023 06:11:29 -0700 (PDT)
Received: from sw05.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a9d6c83000000b006af731d100fsm1369182otr.75.2023.05.22.06.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 06:11:29 -0700 (PDT)
From: Tommy Wu <tommy.wu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: frank.chang@sifive.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, richard.henderson@linaro.org,
 Tommy Wu <tommy.wu@sifive.com>
Subject: [PATCH v3 1/4] target/riscv: Add Smrnmi cpu extension.
Date: Mon, 22 May 2023 06:11:20 -0700
Message-Id: <20230522131123.3498539-2-tommy.wu@sifive.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230522131123.3498539-1-tommy.wu@sifive.com>
References: <20230522131123.3498539-1-tommy.wu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=tommy.wu@sifive.com; helo=mail-ot1-x334.google.com
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
 target/riscv/cpu.c            | 14 ++++++++++++++
 target/riscv/cpu.h            |  7 +++++++
 target/riscv/cpu_bits.h       | 12 ++++++++++++
 target/riscv/cpu_helper.c     | 24 ++++++++++++++++++++++++
 6 files changed, 82 insertions(+)

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
index db0875fb43..39b74569b1 100644
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
@@ -1404,6 +1405,12 @@ static void riscv_cpu_set_irq(void *opaque, int irq, int level)
         g_assert_not_reached();
     }
 }
+
+static void riscv_cpu_set_nmi(void *opaque, int irq, int level)
+{
+    RISCVCPU *cpu = RISCV_CPU(opaque);
+    riscv_cpu_set_rnmi(cpu, irq, level);
+}
 #endif /* CONFIG_USER_ONLY */
 
 static void riscv_cpu_init(Object *obj)
@@ -1420,6 +1427,8 @@ static void riscv_cpu_init(Object *obj)
 #ifndef CONFIG_USER_ONLY
     qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq,
                       IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
+    qdev_init_gpio_in_named(DEVICE(cpu), riscv_cpu_set_nmi,
+                            "riscv.cpu.rnmi", RNMI_MAX);
 #endif /* CONFIG_USER_ONLY */
 }
 
@@ -1600,6 +1609,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
     DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
     DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
+    DEFINE_PROP_BOOL("x-smrnmi", RISCVCPU, cfg.ext_smrnmi, false),
 
     DEFINE_PROP_BOOL("x-zvfh", RISCVCPU, cfg.ext_zvfh, false),
     DEFINE_PROP_BOOL("x-zvfhmin", RISCVCPU, cfg.ext_zvfhmin, false),
@@ -1644,6 +1654,10 @@ static Property riscv_cpu_properties[] = {
 
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
index 57d04385f1..cc7898f103 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -635,6 +635,30 @@ uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask,
     return old;
 }
 
+void riscv_cpu_set_rnmi(RISCVCPU *cpu, uint32_t irq, bool level)
+{
+    CPURISCVState *env = &cpu->env;
+    CPUState *cs = CPU(cpu);
+    bool locked = false;
+
+    if (!qemu_mutex_iothread_locked()) {
+        locked = true;
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
+    if (locked) {
+        qemu_mutex_unlock_iothread();
+    }
+}
+
 void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void *),
                              void *arg)
 {
-- 
2.31.1


