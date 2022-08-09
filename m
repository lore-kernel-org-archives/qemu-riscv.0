Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oLGft-0006mT-Nd
	for mharc-qemu-riscv@gnu.org; Tue, 09 Aug 2022 00:17:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oLGfs-0006kC-7k
 for qemu-riscv@nongnu.org; Tue, 09 Aug 2022 00:17:00 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:46025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oLGfp-0004Zh-QM
 for qemu-riscv@nongnu.org; Tue, 09 Aug 2022 00:16:59 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 l5-20020a05683004a500b0063707ff8244so1280419otd.12
 for <qemu-riscv@nongnu.org>; Mon, 08 Aug 2022 21:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=gHX3AQgs74fUz96oz6+lxFeZi05SpyH8+P6/Mg5Op8I=;
 b=nf9tTOCeMObUUguOWDqkrAdqsK73Yu6jmM6bLiBrgLF57d+OGDvXAkjrSrIZTgtsKJ
 QNP2dE9+43rYmF0mvguHI0kvMu0wLb0UFSiiZm0JwQTP+NLxS9QLrr2lIEDinisZXZ3M
 RzNELwnuUmo4t4gCPxsh1zIMel3lICWuXmqlRjD/aPujd4vVMTkcNT1wHshVCggyt2cH
 NyeppxaPHlsWm+moVRpCOO67BKQCxKfU91T6BiQ4OOPeuAPFwFD0bwiy8KCM3x1ji+C8
 rfYAgXhh3hZgxLZE3KXjLY12Pn5ifJRqAhttcNIUSiHbwAU5KHphtamiSmz1Qdbe2vi/
 nGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=gHX3AQgs74fUz96oz6+lxFeZi05SpyH8+P6/Mg5Op8I=;
 b=BpROj1kW5poEfKVu3bl3MT4UpGiAvcn5irz/GHGTsN9dOkKUWwgRLw8h+d7InYEMfJ
 1gDQwgBEBMLRKxaKaOmQv8Fb+LP4fwNDIlZRDGNKr1UXFg7Wiuar0rAKUpsDi/xJCO+T
 vl3m21p/Tvpb526FTXiJei0BpjFBJ8Q00ADnvmhyd2Lt3Ohz2FXYY1Cgl6S47CcRil/g
 R9zmVdstBE/0PXQMltJsmeXUmBEi/JK9bbu8G+gPO1THyHFVDk+lKt27LuYbEIJE+JGE
 AI9asV5D9L6Zs3VAa29OrRLTo3wVVTkBtbvNp6dMdN7x3537nEFbQRklmGTyBnSZq2VD
 WCaA==
X-Gm-Message-State: ACgBeo2qq6C3EVFfN0SmRIUMlKLL2TMg6mXwt4e98dDU906sai95mQxv
 audjvTNij/IOb/kFDQiN1CzS9A==
X-Google-Smtp-Source: AA6agR6cft/07ELn90QPmr2Zku34ul3+yI1Gp+yEN0ra8pHy2M8OOoRzm3X8sYJnCKnxKC+DWfqFJA==
X-Received: by 2002:a05:6830:43a0:b0:61c:c25b:eb88 with SMTP id
 s32-20020a05683043a000b0061cc25beb88mr8088646otv.111.1660018616613; 
 Mon, 08 Aug 2022 21:16:56 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 g15-20020a9d648f000000b0061c9ccb051bsm2712738otl.37.2022.08.08.21.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 21:16:55 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [PATCH v8 1/4] target/riscv: Add smstateen support
Date: Tue,  9 Aug 2022 09:46:40 +0530
Message-Id: <20220809041643.124888-2-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220809041643.124888-1-mchitale@ventanamicro.com>
References: <20220809041643.124888-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=mchitale@ventanamicro.com; helo=mail-ot1-x332.google.com
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
X-List-Received-Date: Tue, 09 Aug 2022 04:17:00 -0000

Smstateen extension specifies a mechanism to close
the potential covert channels that could cause security issues.

This patch adds the CSRs defined in the specification and
the corresponding predicates and read/write functions.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 target/riscv/cpu.h      |   4 +
 target/riscv/cpu_bits.h |  37 ++++
 target/riscv/csr.c      | 373 ++++++++++++++++++++++++++++++++++++++++
 target/riscv/machine.c  |  21 +++
 4 files changed, 435 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 4be4b82a83..6bff935c57 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -354,6 +354,9 @@ struct CPUArchState {
 
     /* CSRs for execution enviornment configuration */
     uint64_t menvcfg;
+    uint64_t mstateen[SMSTATEEN_MAX_COUNT];
+    uint64_t hstateen[SMSTATEEN_MAX_COUNT];
+    uint64_t sstateen[SMSTATEEN_MAX_COUNT];
     target_ulong senvcfg;
     uint64_t henvcfg;
 #endif
@@ -427,6 +430,7 @@ struct RISCVCPUConfig {
     bool ext_ifencei;
     bool ext_icsr;
     bool ext_zihintpause;
+    bool ext_smstateen;
     bool ext_svinval;
     bool ext_svnapot;
     bool ext_svpbmt;
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 6be5a9e9f0..c773e0d310 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -199,6 +199,12 @@
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
@@ -242,6 +248,16 @@
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
@@ -283,6 +299,27 @@
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
index d81f466c80..d5761996ba 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -346,6 +346,72 @@ static RISCVException umode32(CPURISCVState *env, int csrno)
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
@@ -1706,6 +1772,263 @@ static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static inline void write_smstateen(CPURISCVState *env, uint64_t *reg,
+                                   uint64_t wr_mask, uint64_t new_val)
+{
+    *reg = (*reg & ~wr_mask) | (new_val & wr_mask);
+}
+
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
+    write_smstateen(env, reg, wr_mask, new_val);
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
+static RISCVException write_mstateen1(CPURISCVState *env, int csrno,
+                                      target_ulong new_val)
+{
+    return write_mstateen(env, csrno, SMSTATEEN_STATEEN, new_val);
+}
+
+static RISCVException write_mstateen2(CPURISCVState *env, int csrno,
+                                      target_ulong new_val)
+{
+    return write_mstateen(env, csrno, SMSTATEEN_STATEEN, new_val);
+}
+
+static RISCVException write_mstateen3(CPURISCVState *env, int csrno,
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
+    write_smstateen(env, reg, wr_mask, val);
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
+static RISCVException write_mstateen1h(CPURISCVState *env, int csrno,
+                                      target_ulong new_val)
+{
+    return write_mstateenh(env, csrno, SMSTATEEN_STATEEN, new_val);
+}
+
+static RISCVException write_mstateen2h(CPURISCVState *env, int csrno,
+                                      target_ulong new_val)
+{
+    return write_mstateenh(env, csrno, SMSTATEEN_STATEEN, new_val);
+}
+
+static RISCVException write_mstateen3h(CPURISCVState *env, int csrno,
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
+    write_smstateen(env, reg, wr_mask, new_val);
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
+static RISCVException write_hstateen1(CPURISCVState *env, int csrno,
+                                      target_ulong new_val)
+{
+    return write_hstateen(env, csrno, SMSTATEEN_STATEEN, new_val);
+}
+
+static RISCVException write_hstateen2(CPURISCVState *env, int csrno,
+                                      target_ulong new_val)
+{
+    return write_hstateen(env, csrno, SMSTATEEN_STATEEN, new_val);
+}
+
+static RISCVException write_hstateen3(CPURISCVState *env, int csrno,
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
+    write_smstateen(env, reg, wr_mask, val);
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
+static RISCVException write_hstateen1h(CPURISCVState *env, int csrno,
+                                       target_ulong new_val)
+{
+    return write_hstateenh(env, csrno, SMSTATEEN_STATEEN, new_val);
+}
+
+static RISCVException write_hstateen2h(CPURISCVState *env, int csrno,
+                                       target_ulong new_val)
+{
+    return write_hstateenh(env, csrno, SMSTATEEN_STATEEN, new_val);
+}
+
+static RISCVException write_hstateen3h(CPURISCVState *env, int csrno,
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
+    write_smstateen(env, reg, wr_mask, new_val);
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
+static RISCVException write_sstateen1(CPURISCVState *env, int csrno,
+                                      target_ulong new_val)
+{
+    return write_sstateen(env, csrno, SMSTATEEN_STATEEN, new_val);
+}
+
+static RISCVException write_sstateen2(CPURISCVState *env, int csrno,
+                                      target_ulong new_val)
+{
+    return write_sstateen(env, csrno, SMSTATEEN_STATEEN, new_val);
+}
+
+static RISCVException write_sstateen3(CPURISCVState *env, int csrno,
+                                      target_ulong new_val)
+{
+    return write_sstateen(env, csrno, SMSTATEEN_STATEEN, new_val);
+}
+
 static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
                                 uint64_t *ret_val,
                                 uint64_t new_val, uint64_t wr_mask)
@@ -3575,6 +3898,56 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_HENVCFGH] = { "henvcfgh", hmode32, read_henvcfgh, write_henvcfgh,
                        .min_priv_ver = PRIV_VERSION_1_12_0              },
 
+    /* Smstateen extension CSRs */
+    [CSR_MSTATEEN0] = { "mstateen0", mstateen, read_mstateen, write_mstateen0,
+                        .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_MSTATEEN0H] = { "mstateen0h", mstateen, read_mstateenh,
+                          write_mstateen0h,
+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_MSTATEEN1] = { "mstateen1", mstateen, read_mstateen, write_mstateen1,
+                        .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_MSTATEEN1H] = { "mstateen1h", mstateen, read_mstateenh,
+                          write_mstateen1h,
+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_MSTATEEN2] = { "mstateen2", mstateen, read_mstateen, write_mstateen2,
+                        .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_MSTATEEN2H] = { "mstateen2h", mstateen, read_mstateenh,
+                          write_mstateen2h,
+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_MSTATEEN3] = { "mstateen3", mstateen, read_mstateen, write_mstateen3,
+                        .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_MSTATEEN3H] = { "mstateen3h", mstateen, read_mstateenh,
+                          write_mstateen3h,
+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN0] = { "hstateen0", hstateen, read_hstateen, write_hstateen0,
+                        .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN0H] = { "hstateen0h", hstateenh, read_hstateenh,
+                          write_hstateen0h,
+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN1] = { "hstateen1", hstateen, read_hstateen, write_hstateen1,
+                        .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN1H] = { "hstateen1h", hstateenh, read_hstateenh,
+                          write_hstateen1h,
+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN2] = { "hstateen2", hstateen, read_hstateen, write_hstateen2,
+                        .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN2H] = { "hstateen2h", hstateenh, read_hstateenh,
+                          write_hstateen2h,
+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN3] = { "hstateen3", hstateen, read_hstateen, write_hstateen3,
+                        .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN3H] = { "hstateen3h", hstateenh, read_hstateenh,
+                          write_hstateen3h,
+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_SSTATEEN0] = { "sstateen0", sstateen, read_sstateen, write_sstateen0,
+                        .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_SSTATEEN1] = { "sstateen1", sstateen, read_sstateen, write_sstateen1,
+                        .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_SSTATEEN2] = { "sstateen2", sstateen, read_sstateen, write_sstateen2,
+                        .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_SSTATEEN3] = { "sstateen3", sstateen, read_sstateen, write_sstateen3,
+                        .min_priv_ver = PRIV_VERSION_1_12_0 },
+
     /* Supervisor Trap Setup */
     [CSR_SSTATUS]    = { "sstatus",    smode, read_sstatus,    write_sstatus,
                          NULL,                read_sstatus_i128               },
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index dc182ca811..ef418ac19d 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -262,6 +262,26 @@ static int riscv_cpu_post_load(void *opaque, int version_id)
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
@@ -372,6 +392,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         &vmstate_kvmtimer,
         &vmstate_envcfg,
         &vmstate_debug,
+        &vmstate_smstateen,
         NULL
     }
 };
-- 
2.25.1


