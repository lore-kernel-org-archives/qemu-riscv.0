Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ok33m-0005pm-RP
	for mharc-qemu-riscv@gnu.org; Sun, 16 Oct 2022 08:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1ok33a-0005kh-05
 for qemu-riscv@nongnu.org; Sun, 16 Oct 2022 08:47:55 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:36642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1ok33W-0003Q9-BE
 for qemu-riscv@nongnu.org; Sun, 16 Oct 2022 08:47:52 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 d7-20020a17090a2a4700b0020d268b1f02so11943300pjg.1
 for <qemu-riscv@nongnu.org>; Sun, 16 Oct 2022 05:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VshPcNNf0o6KkejA5yHn9UOmkPkcmamy++egPKzsUL8=;
 b=QQUzc364GVPOuvVqPntDfHSHb/MWvq2oOf1oOBgo9luvV81Fkf4emhQSJeP6HABoPw
 NDYmXu2qXr1TceTk/3OYF4NCL3IiIVDPZrIkIzYJKUzCw5KUbnckzubOTIXNidjTl+Up
 vT90R0u8sij7WCuxE4uR2vGtDvgNaF8PeXVEpo3IRQphz8ha+cV7rdhNGJZAbeLrMKxR
 oCnm5D2M1qSanxeABf+O4vTluiawiNLNceOtXi9sazCJtnqN1O7/KuKv4mxupGRi1q6O
 YwLQPVxKINGUje/1S4cKNOrfo7ihDIkc077X0U0AE9ex+PeN8/JZtsuvJNr5TWpA7Q9e
 SKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VshPcNNf0o6KkejA5yHn9UOmkPkcmamy++egPKzsUL8=;
 b=plGflMXl5RZgL0kjlWdvYndMKL8LwMfmLxRwEx2VYHb3jK4W7IS/x4UaAFqcBwLsqV
 VAa3IXxQxXklIjgDKaJsgwu5Haz2C2HlQgonmMDW6dZyXsygt++P8O18s8RwCsTYIW0e
 AJavU6fw7ZabN5yFwt8Gu3d44r0tN4JDYuMD+ZlmngHX8CPKmpWPKqI/13MjX2YBNowl
 K2lzq6CzCYoJcR9Nb1yJMUtjSfiRUJavr+3Y0ipkJARAwG+jfbySnkexuTi6hngnBAO+
 S/NC14OMcXjCVmtspPWge7y4GXGjloFwlKg/VqmFn44XoXIIuN73JShX+Me6yxYRjZt8
 9+zw==
X-Gm-Message-State: ACrzQf05hRNIvnNxdLQCNyR44PN8Y9jdf8gJpP0dsijuWQywhXjDMBws
 cSSASezLnIl0MKYP8rz1RtywLQ==
X-Google-Smtp-Source: AMsMyM6hOTARjsNaBvAZTqTRwp769STmIU0h9RkRSOK1mzEzABQCGoMOPDhJ6HZzuaRI0PQsnfIg2w==
X-Received: by 2002:a17:902:db0f:b0:176:e70f:6277 with SMTP id
 m15-20020a170902db0f00b00176e70f6277mr6954692plx.13.1665924465377; 
 Sun, 16 Oct 2022 05:47:45 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com
 ([2401:4900:57ef:25d:3187:d4f6:127:22d3])
 by smtp.googlemail.com with ESMTPSA id
 v18-20020a634812000000b0043b565cb57csm4444894pga.73.2022.10.16.05.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 05:47:44 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>, alistair.francis@wdc.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v11 1/5] target/riscv: Add smstateen support
Date: Sun, 16 Oct 2022 18:17:22 +0530
Message-Id: <20221016124726.102129-2-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221016124726.102129-1-mchitale@ventanamicro.com>
References: <20221016124726.102129-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pj1-x1029.google.com
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
X-List-Received-Date: Sun, 16 Oct 2022 12:47:55 -0000

Smstateen extension specifies a mechanism to close
the potential covert channels that could cause security issues.

This patch adds the CSRs defined in the specification and
the corresponding predicates and read/write functions.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.h      |   4 +
 target/riscv/cpu_bits.h |  37 +++++
 target/riscv/csr.c      | 316 ++++++++++++++++++++++++++++++++++++++++
 target/riscv/machine.c  |  21 +++
 4 files changed, 378 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 3a9e25053f..040ed13675 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -366,6 +366,9 @@ struct CPUArchState {
 
     /* CSRs for execution enviornment configuration */
     uint64_t menvcfg;
+    uint64_t mstateen[SMSTATEEN_MAX_COUNT];
+    uint64_t hstateen[SMSTATEEN_MAX_COUNT];
+    uint64_t sstateen[SMSTATEEN_MAX_COUNT];
     target_ulong senvcfg;
     uint64_t henvcfg;
 #endif
@@ -441,6 +444,7 @@ struct RISCVCPUConfig {
     bool ext_ifencei;
     bool ext_icsr;
     bool ext_zihintpause;
+    bool ext_smstateen;
     bool ext_sstc;
     bool ext_svinval;
     bool ext_svnapot;
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index d8f5f0abed..8b0d7e20ea 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -197,6 +197,12 @@
 /* Supervisor Configuration CSRs */
 #define CSR_SENVCFG         0x10A
 
+/* Supervisor state CSRs */
+#define CSR_SSTATEEN0       0x10C
+#define CSR_SSTATEEN1       0x10D
+#define CSR_SSTATEEN2       0x10E
+#define CSR_SSTATEEN3       0x10F
+
 /* Supervisor Trap Handling */
 #define CSR_SSCRATCH        0x140
 #define CSR_SEPC            0x141
@@ -244,6 +250,16 @@
 #define CSR_HENVCFG         0x60A
 #define CSR_HENVCFGH        0x61A
 
+/* Hypervisor state CSRs */
+#define CSR_HSTATEEN0       0x60C
+#define CSR_HSTATEEN0H      0x61C
+#define CSR_HSTATEEN1       0x60D
+#define CSR_HSTATEEN1H      0x61D
+#define CSR_HSTATEEN2       0x60E
+#define CSR_HSTATEEN2H      0x61E
+#define CSR_HSTATEEN3       0x60F
+#define CSR_HSTATEEN3H      0x61F
+
 /* Virtual CSRs */
 #define CSR_VSSTATUS        0x200
 #define CSR_VSIE            0x204
@@ -289,6 +305,27 @@
 #define CSR_MENVCFG         0x30A
 #define CSR_MENVCFGH        0x31A
 
+/* Machine state CSRs */
+#define CSR_MSTATEEN0       0x30C
+#define CSR_MSTATEEN0H      0x31C
+#define CSR_MSTATEEN1       0x30D
+#define CSR_MSTATEEN1H      0x31D
+#define CSR_MSTATEEN2       0x30E
+#define CSR_MSTATEEN2H      0x31E
+#define CSR_MSTATEEN3       0x30F
+#define CSR_MSTATEEN3H      0x31F
+
+/* Common defines for all smstateen */
+#define SMSTATEEN_MAX_COUNT 4
+#define SMSTATEEN0_CS       (1ULL << 0)
+#define SMSTATEEN0_FCSR     (1ULL << 1)
+#define SMSTATEEN0_HSCONTXT (1ULL << 57)
+#define SMSTATEEN0_IMSIC    (1ULL << 58)
+#define SMSTATEEN0_AIA      (1ULL << 59)
+#define SMSTATEEN0_SVSLCT   (1ULL << 60)
+#define SMSTATEEN0_HSENVCFG (1ULL << 62)
+#define SMSTATEEN_STATEEN   (1ULL << 63)
+
 /* Enhanced Physical Memory Protection (ePMP) */
 #define CSR_MSECCFG         0x747
 #define CSR_MSECCFGH        0x757
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 5c9a7ee287..c861424e85 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -283,6 +283,72 @@ static RISCVException umode32(CPURISCVState *env, int csrno)
     return umode(env, csrno);
 }
 
+static RISCVException mstateen(CPURISCVState *env, int csrno)
+{
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
+    if (!cpu->cfg.ext_smstateen) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return any(env, csrno);
+}
+
+static RISCVException hstateen_pred(CPURISCVState *env, int csrno, int base)
+{
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
+    if (!cpu->cfg.ext_smstateen) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    if (env->priv < PRV_M) {
+        if (!(env->mstateen[csrno - base] & SMSTATEEN_STATEEN)) {
+            return RISCV_EXCP_ILLEGAL_INST;
+        }
+    }
+
+    return hmode(env, csrno);
+}
+
+static RISCVException hstateen(CPURISCVState *env, int csrno)
+{
+    return hstateen_pred(env, csrno, CSR_HSTATEEN0);
+}
+
+static RISCVException hstateenh(CPURISCVState *env, int csrno)
+{
+    return hstateen_pred(env, csrno, CSR_HSTATEEN0H);
+}
+
+static RISCVException sstateen(CPURISCVState *env, int csrno)
+{
+    bool virt = riscv_cpu_virt_enabled(env);
+    int index = csrno - CSR_SSTATEEN0;
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
+    if (!cpu->cfg.ext_smstateen) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    if (env->priv < PRV_M) {
+        if (!(env->mstateen[index] & SMSTATEEN_STATEEN)) {
+            return RISCV_EXCP_ILLEGAL_INST;
+        }
+
+        if (virt) {
+            if (!(env->hstateen[index] & SMSTATEEN_STATEEN)) {
+                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+            }
+        }
+    }
+
+    return smode(env, csrno);
+}
+
 /* Checks if PointerMasking registers could be accessed */
 static RISCVException pointer_masking(CPURISCVState *env, int csrno)
 {
@@ -1861,6 +1927,197 @@ static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException read_mstateen(CPURISCVState *env, int csrno,
+                                    target_ulong *val)
+{
+    *val = env->mstateen[csrno - CSR_MSTATEEN0];
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mstateen(CPURISCVState *env, int csrno,
+                                     uint64_t wr_mask, target_ulong new_val)
+{
+    uint64_t *reg;
+
+    reg = &env->mstateen[csrno - CSR_MSTATEEN0];
+    *reg = (*reg & ~wr_mask) | (new_val & wr_mask);
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
+                                      target_ulong new_val)
+{
+    uint64_t wr_mask = SMSTATEEN_STATEEN;
+
+    return write_mstateen(env, csrno, wr_mask, new_val);
+}
+
+static RISCVException write_mstateen_1_3(CPURISCVState *env, int csrno,
+                                      target_ulong new_val)
+{
+    return write_mstateen(env, csrno, SMSTATEEN_STATEEN, new_val);
+}
+
+static RISCVException read_mstateenh(CPURISCVState *env, int csrno,
+                                      target_ulong *val)
+{
+    *val = env->mstateen[csrno - CSR_MSTATEEN0H] >> 32;
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mstateenh(CPURISCVState *env, int csrno,
+                                      uint64_t wr_mask, target_ulong new_val)
+{
+    uint64_t *reg, val;
+
+    reg = &env->mstateen[csrno - CSR_MSTATEEN0H];
+    val = (uint64_t)new_val << 32;
+    val |= *reg & 0xFFFFFFFF;
+    *reg = (*reg & ~wr_mask) | (val & wr_mask);
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mstateen0h(CPURISCVState *env, int csrno,
+                                      target_ulong new_val)
+{
+    uint64_t wr_mask = SMSTATEEN_STATEEN;
+
+    return write_mstateenh(env, csrno, wr_mask, new_val);
+}
+
+static RISCVException write_mstateenh_1_3(CPURISCVState *env, int csrno,
+                                      target_ulong new_val)
+{
+    return write_mstateenh(env, csrno, SMSTATEEN_STATEEN, new_val);
+}
+
+static RISCVException read_hstateen(CPURISCVState *env, int csrno,
+                                    target_ulong *val)
+{
+    int index = csrno - CSR_HSTATEEN0;
+
+    *val = env->hstateen[index] & env->mstateen[index];
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_hstateen(CPURISCVState *env, int csrno,
+                                     uint64_t mask, target_ulong new_val)
+{
+    int index = csrno - CSR_HSTATEEN0;
+    uint64_t *reg, wr_mask;
+
+    reg = &env->hstateen[index];
+    wr_mask = env->mstateen[index] & mask;
+    *reg = (*reg & ~wr_mask) | (new_val & wr_mask);
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_hstateen0(CPURISCVState *env, int csrno,
+                                      target_ulong new_val)
+{
+    uint64_t wr_mask = SMSTATEEN_STATEEN;
+
+    return write_hstateen(env, csrno, wr_mask, new_val);
+}
+
+static RISCVException write_hstateen_1_3(CPURISCVState *env, int csrno,
+                                      target_ulong new_val)
+{
+    return write_hstateen(env, csrno, SMSTATEEN_STATEEN, new_val);
+}
+
+static RISCVException read_hstateenh(CPURISCVState *env, int csrno,
+                                     target_ulong *val)
+{
+    int index = csrno - CSR_HSTATEEN0H;
+
+    *val = (env->hstateen[index] >> 32) & (env->mstateen[index] >> 32);
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_hstateenh(CPURISCVState *env, int csrno,
+                                      uint64_t mask, target_ulong new_val)
+{
+    int index = csrno - CSR_HSTATEEN0H;
+    uint64_t *reg, wr_mask, val;
+
+    reg = &env->hstateen[index];
+    val = (uint64_t)new_val << 32;
+    val |= *reg & 0xFFFFFFFF;
+    wr_mask = env->mstateen[index] & mask;
+    *reg = (*reg & ~wr_mask) | (val & wr_mask);
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_hstateen0h(CPURISCVState *env, int csrno,
+                                       target_ulong new_val)
+{
+    uint64_t wr_mask = SMSTATEEN_STATEEN;
+
+    return write_hstateenh(env, csrno, wr_mask, new_val);
+}
+
+static RISCVException write_hstateenh_1_3(CPURISCVState *env, int csrno,
+                                       target_ulong new_val)
+{
+    return write_hstateenh(env, csrno, SMSTATEEN_STATEEN, new_val);
+}
+
+static RISCVException read_sstateen(CPURISCVState *env, int csrno,
+                                    target_ulong *val)
+{
+    bool virt = riscv_cpu_virt_enabled(env);
+    int index = csrno - CSR_SSTATEEN0;
+
+    *val = env->sstateen[index] & env->mstateen[index];
+    if (virt) {
+        *val &= env->hstateen[index];
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_sstateen(CPURISCVState *env, int csrno,
+                                     uint64_t mask, target_ulong new_val)
+{
+    bool virt = riscv_cpu_virt_enabled(env);
+    int index = csrno - CSR_SSTATEEN0;
+    uint64_t wr_mask;
+    uint64_t *reg;
+
+    wr_mask = env->mstateen[index] & mask;
+    if (virt) {
+        wr_mask &= env->hstateen[index];
+    }
+
+    reg = &env->sstateen[index];
+    *reg = (*reg & ~wr_mask) | (new_val & wr_mask);
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_sstateen0(CPURISCVState *env, int csrno,
+                                      target_ulong new_val)
+{
+    uint64_t wr_mask = SMSTATEEN_STATEEN;
+
+    return write_sstateen(env, csrno, wr_mask, new_val);
+}
+
+static RISCVException write_sstateen_1_3(CPURISCVState *env, int csrno,
+                                      target_ulong new_val)
+{
+    return write_sstateen(env, csrno, SMSTATEEN_STATEEN, new_val);
+}
+
 static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
                                 uint64_t *ret_val,
                                 uint64_t new_val, uint64_t wr_mask)
@@ -3744,6 +4001,65 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_HENVCFGH] = { "henvcfgh", hmode32, read_henvcfgh, write_henvcfgh,
                        .min_priv_ver = PRIV_VERSION_1_12_0              },
 
+    /* Smstateen extension CSRs */
+    [CSR_MSTATEEN0] = { "mstateen0", mstateen, read_mstateen, write_mstateen0,
+                        .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_MSTATEEN0H] = { "mstateen0h", mstateen, read_mstateenh,
+                          write_mstateen0h,
+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_MSTATEEN1] = { "mstateen1", mstateen, read_mstateen,
+                        write_mstateen_1_3,
+                        .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_MSTATEEN1H] = { "mstateen1h", mstateen, read_mstateenh,
+                         write_mstateenh_1_3,
+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_MSTATEEN2] = { "mstateen2", mstateen, read_mstateen,
+                        write_mstateen_1_3,
+                        .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_MSTATEEN2H] = { "mstateen2h", mstateen, read_mstateenh,
+                         write_mstateenh_1_3,
+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_MSTATEEN3] = { "mstateen3", mstateen, read_mstateen,
+                        write_mstateen_1_3,
+                        .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_MSTATEEN3H] = { "mstateen3h", mstateen, read_mstateenh,
+                         write_mstateenh_1_3,
+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN0] = { "hstateen0", hstateen, read_hstateen, write_hstateen0,
+                        .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN0H] = { "hstateen0h", hstateenh, read_hstateenh,
+                         write_hstateen0h,
+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN1] = { "hstateen1", hstateen, read_hstateen,
+                        write_hstateen_1_3,
+                        .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN1H] = { "hstateen1h", hstateenh, read_hstateenh,
+                         write_hstateenh_1_3,
+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN2] = { "hstateen2", hstateen, read_hstateen,
+                        write_hstateen_1_3,
+                        .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN2H] = { "hstateen2h", hstateenh, read_hstateenh,
+                         write_hstateenh_1_3,
+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN3] = { "hstateen3", hstateen, read_hstateen,
+                        write_hstateen_1_3,
+                        .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN3H] = { "hstateen3h", hstateenh, read_hstateenh,
+                         write_hstateenh_1_3,
+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_SSTATEEN0] = { "sstateen0", sstateen, read_sstateen, write_sstateen0,
+                        .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_SSTATEEN1] = { "sstateen1", sstateen, read_sstateen,
+                        write_sstateen_1_3,
+                        .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_SSTATEEN2] = { "sstateen2", sstateen, read_sstateen,
+                        write_sstateen_1_3,
+                        .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_SSTATEEN3] = { "sstateen3", sstateen, read_sstateen,
+                        write_sstateen_1_3,
+                        .min_priv_ver = PRIV_VERSION_1_12_0 },
+
     /* Supervisor Trap Setup */
     [CSR_SSTATUS]    = { "sstatus",    smode, read_sstatus,    write_sstatus,
                          NULL,                read_sstatus_i128               },
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index c2a94a82b3..e687f9fce0 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -253,6 +253,26 @@ static int riscv_cpu_post_load(void *opaque, int version_id)
     return 0;
 }
 
+static bool smstateen_needed(void *opaque)
+{
+    RISCVCPU *cpu = opaque;
+
+    return cpu->cfg.ext_smstateen;
+}
+
+static const VMStateDescription vmstate_smstateen = {
+    .name = "cpu/smtateen",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = smstateen_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64_ARRAY(env.mstateen, RISCVCPU, 4),
+        VMSTATE_UINT64_ARRAY(env.hstateen, RISCVCPU, 4),
+        VMSTATE_UINT64_ARRAY(env.sstateen, RISCVCPU, 4),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static bool envcfg_needed(void *opaque)
 {
     RISCVCPU *cpu = opaque;
@@ -364,6 +384,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         &vmstate_kvmtimer,
         &vmstate_envcfg,
         &vmstate_debug,
+        &vmstate_smstateen,
         NULL
     }
 };
-- 
2.25.1


