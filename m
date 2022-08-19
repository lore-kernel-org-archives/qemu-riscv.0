Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oOwU7-0003hz-0X
	for mharc-qemu-riscv@gnu.org; Fri, 19 Aug 2022 03:32:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1oOwU5-0003hi-Ur
 for qemu-riscv@nongnu.org; Fri, 19 Aug 2022 03:32:02 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:42708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1oOwU3-0004RU-Kw
 for qemu-riscv@nongnu.org; Fri, 19 Aug 2022 03:32:01 -0400
Received: by mail-oi1-x229.google.com with SMTP id p128so3957009oif.9
 for <qemu-riscv@nongnu.org>; Fri, 19 Aug 2022 00:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=OmyVGadg35kSt1UySothODIfnZ7CrMCfLaI/0wlCtqI=;
 b=Il72Y7XE1uXbakwjSagfosEG7ttd+m2iYOtJo3RST36mdP9eTqfj351eDXzTwA+j7s
 u7f0vJGp6ihZ4T2o77YbFEPGiE8+2jyQIQWVOjejzmZCBULeFCugg85drC5ultRwKbY4
 i2WK+EOEMNJ/mXF/Wl2D78Rn/Ex11vCVFUsN/7yTxHJa7ykNCPjWtAgUhiPb1qEpl7Ag
 Uc3OzbV7zj1GxW7pPcp3f5uCKL/baCnyKEdbsiSLJB/KQd1kOfgVlOlO6QXF7eDh0fnO
 gJuWCRgJYsMLlCGM7Ti4zWMGQ5kVc01ht9t+qkAPwCQE+Kz8ibwBBbt/3Xr6KJsOSEi4
 /xEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=OmyVGadg35kSt1UySothODIfnZ7CrMCfLaI/0wlCtqI=;
 b=a+WUADP/U1qKRnBeehJsKDBKRmgGPQsP7qKpZ/QDMwxCdadu2Wz1oiUDqq4kThwG7z
 cm/ZO1ADVoB2qfP2A9oBGwGKjN2EfvSLqXix7P21X8N+O80fE5T15et7pzy/wo5cpqM3
 AL4Strr8i5rZLXJqx8k+shKanzE4z7mvxpxfd4qdsftf4VMi0lkJ4TpdjU1BF+G/x63Q
 pnCR/Jlx4ejjx2tQHrj57MMmI1vKk0FGVLhREqe64mYOqgXJO8TQTp3AfA6zKeCOkyEI
 93b28WlKDXXyo/jtT9nxKdtMlJtmr2gtnmTUjmJjycdsFeu8lQQVxLBV/lsRSQbg4zyI
 oapw==
X-Gm-Message-State: ACgBeo30W5YCjp4gudkXPc0vfuAFSNjfCS9jBAKeMZHTi6fUnU+yiNsv
 N0Rmk2sZazXbHkAnS9ia9R++rA==
X-Google-Smtp-Source: AA6agR6AphitAA4WWuXIzYe83/p44akyRdamNFHpmt08A15ThoZsGCnrMITfMK/aM5x3cJPzUfO0Dg==
X-Received: by 2002:aca:2418:0:b0:342:f3e8:4d7b with SMTP id
 n24-20020aca2418000000b00342f3e84d7bmr5103694oic.43.1660894318049; 
 Fri, 19 Aug 2022 00:31:58 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.80.76])
 by smtp.gmail.com with ESMTPSA id
 bj10-20020a056808198a00b00344aa3f17d9sm875197oib.10.2022.08.19.00.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 00:31:57 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v2] target/riscv: Use official extension names for AIA CSRs
Date: Fri, 19 Aug 2022 13:01:47 +0530
Message-Id: <20220819073147.174790-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=apatel@ventanamicro.com; helo=mail-oi1-x229.google.com
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
X-List-Received-Date: Fri, 19 Aug 2022 07:32:02 -0000

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
Changes since v1:
 - Remove redundant "has_aia" parameter from riscv_cpu_pending_to_irq()
---
 hw/intc/riscv_imsic.c     |  4 +++-
 hw/riscv/virt.c           | 13 ++-----------
 target/riscv/cpu.c        |  9 ++++-----
 target/riscv/cpu.h        |  4 ++--
 target/riscv/cpu_helper.c |  4 +++-
 target/riscv/csr.c        | 30 ++++++++++++++++++++++++------
 6 files changed, 38 insertions(+), 26 deletions(-)

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
index 81948b37dd..137988808b 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -309,6 +309,8 @@ static int riscv_cpu_pending_to_irq(CPURISCVState *env,
                                     int extirq, unsigned int extirq_def_prio,
                                     uint64_t pending, uint8_t *iprio)
 {
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
     int irq, best_irq = RISCV_EXCP_NONE;
     unsigned int prio, best_prio = UINT_MAX;
 
@@ -317,7 +319,7 @@ static int riscv_cpu_pending_to_irq(CPURISCVState *env,
     }
 
     irq = ctz64(pending);
-    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+    if (!((extirq == IRQ_M_EXT) ? cpu->cfg.ext_smaia : cpu->cfg.ext_ssaia)) {
         return irq;
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


