Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oOsOd-0006vF-QI
	for mharc-qemu-riscv@gnu.org; Thu, 18 Aug 2022 23:10:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1oOsOa-0006sm-Uz
 for qemu-riscv@nongnu.org; Thu, 18 Aug 2022 23:10:04 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:37764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1oOsOU-0007cJ-SA
 for qemu-riscv@nongnu.org; Thu, 18 Aug 2022 23:10:01 -0400
Received: by mail-oi1-x230.google.com with SMTP id m6so3545165oib.4
 for <qemu-riscv@nongnu.org>; Thu, 18 Aug 2022 20:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=8r/DVsdQ9Z1jAtpgwSIe7wtgj33LBSoM3OtCS4E6yq4=;
 b=LmI5CJz2eXeeCQraA+RmXBwE96Czeu8fXnqBZiV5Qu6Up9KA5KTffC5qIrn0J4Kz4s
 nCWt9dVSideEN9G41gYrHNS0B8LMEWQWc8lJcJsGNDtY/CpcN8b2DN4uM1SrfxnvQyen
 hPB38MfMzcipZYljNStcqUUVCTEK87KFe6+fcEJrNp48H0ODlCEmC6NSkB98ZacEk6e5
 f0gqMgNEEzX01dpYvuH0HlYCVsYsOhBtqawXbs+r09hm0zj113hKCSIZyQh1J1HRSxyx
 R7dWNLgvhcsq5iHUbagxB7jExjGNJcWqUrwJYC16294v/s6iR4BBV7FAppXPW+7QYRb1
 3eHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=8r/DVsdQ9Z1jAtpgwSIe7wtgj33LBSoM3OtCS4E6yq4=;
 b=DjkapyKMsH/2L0NIVzTazIpiWQS0+aUfK92QYXgeNeH94p+lCFy5WejEE8LnaSnuBJ
 qq0Yr5V5K/RPOxESDZdMGkJnON3Y2QdHtDU2mnTo5IMLmmiQPdGJXy9nAWlujd4zhkPC
 cx2OOf+tcID7sfMl/mklyzwMm54TEGmi9X+xXmvtQFqXsPDbcRFI3iqdzs5gHiVuxQx+
 nX1CIye2x4iTiL9Ak+7nNcxC1vbLxAKoh2EeWpDj0esgpWPqIcTfmN2zDPzbFms/39/V
 s73J8QKRhnmgCi7Ix73urLDh5z6gmg96Ob+fi3pIg3AMxbeWWIUbSIIXCfXS4uH2YzRg
 tk4w==
X-Gm-Message-State: ACgBeo3V4POjFWzkl6w+2puQUQ1NT6524pAy2NhTF2QvQgyFJGGupodX
 CBbMleNDJB1eKWMjanCVNZVMPw==
X-Google-Smtp-Source: AA6agR74QzP1e3Avd4hHxUb5O3LhC2zpobuU5kASxmqALrogv0JGdtvHnsa+Imk3t6N/cHHODQZj2g==
X-Received: by 2002:a05:6808:3098:b0:343:2d83:5978 with SMTP id
 bl24-20020a056808309800b003432d835978mr2480216oib.35.1660878595422; 
 Thu, 18 Aug 2022 20:09:55 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.80.76])
 by smtp.gmail.com with ESMTPSA id
 c127-20020a4a4f85000000b00425806a20f5sm701003oob.3.2022.08.18.20.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 20:09:54 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH] target/riscv: Use official extension names for AIA CSRs
Date: Fri, 19 Aug 2022 08:39:38 +0530
Message-Id: <20220819030938.166196-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=apatel@ventanamicro.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 19 Aug 2022 03:10:05 -0000

The arch review of AIA spec is completed and we now have official
extension names for AIA: Smaia (M-mode AIA CSRs) and Ssaia (S-mode
AIA CSRs).

Refer, section 1.6 of the latest AIA v0.3.1 stable specification at
https://github.com/riscv/riscv-aia/releases/download/0.3.1-draft.32/riscv-interrupts-032.pdf)

Based on above, we update QEMU RISC-V to:
1) Have separate config options for Smaia and Ssaia extensions
   which replace RISCV_FEATURE_AIA in CPU features
2) Not generate AIA INTC compatible string in virt machine

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 hw/intc/riscv_imsic.c     |  4 +++-
 hw/riscv/virt.c           | 13 ++-----------
 target/riscv/cpu.c        |  9 ++++-----
 target/riscv/cpu.h        |  4 ++--
 target/riscv/cpu_helper.c | 30 ++++++++++++++++++++++--------
 target/riscv/csr.c        | 30 ++++++++++++++++++++++++------
 6 files changed, 57 insertions(+), 33 deletions(-)

diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
index 8615e4cc1d..4d4d5b50ca 100644
--- a/hw/intc/riscv_imsic.c
+++ b/hw/intc/riscv_imsic.c
@@ -344,9 +344,11 @@ static void riscv_imsic_realize(DeviceState *dev, Error **errp)
 
     /* Force select AIA feature and setup CSR read-modify-write callback */
     if (env) {
-        riscv_set_feature(env, RISCV_FEATURE_AIA);
         if (!imsic->mmode) {
+            rcpu->cfg.ext_ssaia = true;
             riscv_cpu_set_geilen(env, imsic->num_pages - 1);
+        } else {
+            rcpu->cfg.ext_smaia = true;
         }
         riscv_cpu_set_aia_ireg_rmw_fn(env, (imsic->mmode) ? PRV_M : PRV_S,
                                       riscv_imsic_rmw, imsic);
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index e779d399ae..b041b33afc 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -261,17 +261,8 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
         qemu_fdt_add_subnode(mc->fdt, intc_name);
         qemu_fdt_setprop_cell(mc->fdt, intc_name, "phandle",
             intc_phandles[cpu]);
-        if (riscv_feature(&s->soc[socket].harts[cpu].env,
-                          RISCV_FEATURE_AIA)) {
-            static const char * const compat[2] = {
-                "riscv,cpu-intc-aia", "riscv,cpu-intc"
-            };
-            qemu_fdt_setprop_string_array(mc->fdt, intc_name, "compatible",
-                                      (char **)&compat, ARRAY_SIZE(compat));
-        } else {
-            qemu_fdt_setprop_string(mc->fdt, intc_name, "compatible",
-                "riscv,cpu-intc");
-        }
+        qemu_fdt_setprop_string(mc->fdt, intc_name, "compatible",
+            "riscv,cpu-intc");
         qemu_fdt_setprop(mc->fdt, intc_name, "interrupt-controller", NULL, 0);
         qemu_fdt_setprop_cell(mc->fdt, intc_name, "#interrupt-cells", 1);
 
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d11113fbaa..3cf0c86661 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -101,6 +101,8 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zve64f, true, PRIV_VERSION_1_12_0, ext_zve64f),
     ISA_EXT_DATA_ENTRY(zhinx, true, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, true, PRIV_VERSION_1_12_0, ext_zhinxmin),
+    ISA_EXT_DATA_ENTRY(smaia, true, PRIV_VERSION_1_12_0, ext_smaia),
+    ISA_EXT_DATA_ENTRY(ssaia, true, PRIV_VERSION_1_12_0, ext_ssaia),
     ISA_EXT_DATA_ENTRY(sscofpmf, true, PRIV_VERSION_1_12_0, ext_sscofpmf),
     ISA_EXT_DATA_ENTRY(sstc, true, PRIV_VERSION_1_12_0, ext_sstc),
     ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSION_1_12_0, ext_svinval),
@@ -669,10 +671,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         }
     }
 
-    if (cpu->cfg.aia) {
-        riscv_set_feature(env, RISCV_FEATURE_AIA);
-    }
-
     if (cpu->cfg.debug) {
         riscv_set_feature(env, RISCV_FEATURE_DEBUG);
     }
@@ -1058,7 +1056,8 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
-    DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
+    DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
+    DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
 
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 42edfa4558..15cad73def 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -85,7 +85,6 @@ enum {
     RISCV_FEATURE_PMP,
     RISCV_FEATURE_EPMP,
     RISCV_FEATURE_MISA,
-    RISCV_FEATURE_AIA,
     RISCV_FEATURE_DEBUG
 };
 
@@ -452,6 +451,8 @@ struct RISCVCPUConfig {
     bool ext_zve64f;
     bool ext_zmmul;
     bool ext_sscofpmf;
+    bool ext_smaia;
+    bool ext_ssaia;
     bool rvv_ta_all_1s;
     bool rvv_ma_all_1s;
 
@@ -472,7 +473,6 @@ struct RISCVCPUConfig {
     bool mmu;
     bool pmp;
     bool epmp;
-    bool aia;
     bool debug;
     uint64_t resetvec;
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 81948b37dd..92685947d9 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -305,7 +305,7 @@ uint8_t riscv_cpu_default_priority(int irq)
     return default_iprio[irq] ? default_iprio[irq] : IPRIO_MMAXIPRIO;
 };
 
-static int riscv_cpu_pending_to_irq(CPURISCVState *env,
+static int riscv_cpu_pending_to_irq(CPURISCVState *env, bool has_aia,
                                     int extirq, unsigned int extirq_def_prio,
                                     uint64_t pending, uint8_t *iprio)
 {
@@ -317,7 +317,7 @@ static int riscv_cpu_pending_to_irq(CPURISCVState *env,
     }
 
     irq = ctz64(pending);
-    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+    if (!has_aia) {
         return irq;
     }
 
@@ -354,34 +354,45 @@ uint64_t riscv_cpu_all_pending(CPURISCVState *env)
 
 int riscv_cpu_mirq_pending(CPURISCVState *env)
 {
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
     uint64_t irqs = riscv_cpu_all_pending(env) & ~env->mideleg &
                     ~(MIP_SGEIP | MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
 
-    return riscv_cpu_pending_to_irq(env, IRQ_M_EXT, IPRIO_DEFAULT_M,
+    return riscv_cpu_pending_to_irq(env, cpu->cfg.ext_smaia,
+                                    IRQ_M_EXT, IPRIO_DEFAULT_M,
                                     irqs, env->miprio);
 }
 
 int riscv_cpu_sirq_pending(CPURISCVState *env)
 {
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
     uint64_t irqs = riscv_cpu_all_pending(env) & env->mideleg &
                     ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
 
-    return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
+    return riscv_cpu_pending_to_irq(env, cpu->cfg.ext_ssaia,
+                                    IRQ_S_EXT, IPRIO_DEFAULT_S,
                                     irqs, env->siprio);
 }
 
 int riscv_cpu_vsirq_pending(CPURISCVState *env)
 {
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
     uint64_t irqs = riscv_cpu_all_pending(env) & env->mideleg &
                     (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
 
-    return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
+    return riscv_cpu_pending_to_irq(env, cpu->cfg.ext_ssaia,
+                                    IRQ_S_EXT, IPRIO_DEFAULT_S,
                                     irqs >> 1, env->hviprio);
 }
 
 static int riscv_cpu_local_irq_pending(CPURISCVState *env)
 {
     int virq;
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
     uint64_t irqs, pending, mie, hsie, vsie;
 
     /* Determine interrupt enable state of all privilege modes */
@@ -404,21 +415,24 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *env)
     /* Check M-mode interrupts */
     irqs = pending & ~env->mideleg & -mie;
     if (irqs) {
-        return riscv_cpu_pending_to_irq(env, IRQ_M_EXT, IPRIO_DEFAULT_M,
+        return riscv_cpu_pending_to_irq(env, cpu->cfg.ext_smaia,
+                                        IRQ_M_EXT, IPRIO_DEFAULT_M,
                                         irqs, env->miprio);
     }
 
     /* Check HS-mode interrupts */
     irqs = pending & env->mideleg & ~env->hideleg & -hsie;
     if (irqs) {
-        return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
+        return riscv_cpu_pending_to_irq(env, cpu->cfg.ext_ssaia,
+                                        IRQ_S_EXT, IPRIO_DEFAULT_S,
                                         irqs, env->siprio);
     }
 
     /* Check VS-mode interrupts */
     irqs = pending & env->mideleg & env->hideleg & -vsie;
     if (irqs) {
-        virq = riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
+        virq = riscv_cpu_pending_to_irq(env, cpu->cfg.ext_ssaia,
+                                        IRQ_S_EXT, IPRIO_DEFAULT_S,
                                         irqs >> 1, env->hviprio);
         return (virq <= 0) ? virq : virq + 1;
     }
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 2dcd4e5b2d..b9bce9821f 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -181,7 +181,10 @@ static RISCVException any32(CPURISCVState *env, int csrno)
 
 static int aia_any(CPURISCVState *env, int csrno)
 {
-    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
+    if (!cpu->cfg.ext_smaia) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -190,7 +193,10 @@ static int aia_any(CPURISCVState *env, int csrno)
 
 static int aia_any32(CPURISCVState *env, int csrno)
 {
-    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
+    if (!cpu->cfg.ext_smaia) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -217,7 +223,10 @@ static int smode32(CPURISCVState *env, int csrno)
 
 static int aia_smode(CPURISCVState *env, int csrno)
 {
-    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
+    if (!cpu->cfg.ext_ssaia) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -226,7 +235,10 @@ static int aia_smode(CPURISCVState *env, int csrno)
 
 static int aia_smode32(CPURISCVState *env, int csrno)
 {
-    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
+    if (!cpu->cfg.ext_ssaia) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -282,7 +294,10 @@ static RISCVException pointer_masking(CPURISCVState *env, int csrno)
 
 static int aia_hmode(CPURISCVState *env, int csrno)
 {
-    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
+    if (!cpu->cfg.ext_ssaia) {
         return RISCV_EXCP_ILLEGAL_INST;
      }
 
@@ -291,7 +306,10 @@ static int aia_hmode(CPURISCVState *env, int csrno)
 
 static int aia_hmode32(CPURISCVState *env, int csrno)
 {
-    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
+    if (!cpu->cfg.ext_ssaia) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
-- 
2.34.1


