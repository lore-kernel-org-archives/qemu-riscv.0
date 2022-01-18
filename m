Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9rPn-00087K-Fq
	for mharc-qemu-riscv@gnu.org; Tue, 18 Jan 2022 11:33:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophm30@gmail.com>)
 id 1n9rPl-00083r-OP; Tue, 18 Jan 2022 11:32:58 -0500
Received: from mail-wm1-f49.google.com ([209.85.128.49]:36617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christophm30@gmail.com>)
 id 1n9rPj-00050Z-9N; Tue, 18 Jan 2022 11:32:57 -0500
Received: by mail-wm1-f49.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso5749909wma.1; 
 Tue, 18 Jan 2022 08:32:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FtodSpE7Hsmx1eTcBHQ5UAvFFXOEDusfR/Dm76rKuz8=;
 b=DheKi0EPVgvWF0JuyOoOZmjRDfluDrp7N5DhhohC8cU7MH3BNNxUWmGQ7a+QGtn6Fd
 qmUpnmCUD3mhg6XMlGRROpXMh+rOME0n9GTWl0rcS4U8+c/cFMcgnLEzZ+deql9ZKyqo
 qhS8NJ5IqJFR1KvrGVicKozBzDLVuYucB2aelqosDstITwZdfW1/JrUvKU41JAdTf8j7
 i7K7PTTJICOCSeq8WV9JbltDYT6xnjLGjRyEgfju5CIHR5Y1VyT8F09ZVdsJgiRnkwm1
 KNoUsyhKh0rzsaW3JMpZHfmeDGePmzPmtIJH91MFulCKPn+CTWNRzezjJ6OIsF/5BTiV
 Vl3Q==
X-Gm-Message-State: AOAM530TgEzbXwBfuVTsCvCtDSFDo/FLytcYXlwn3Ok4VV2kIpxy1EEP
 WkI5QrtZKAtWie+OYgztXX0=
X-Google-Smtp-Source: ABdhPJwHkKMLub7Lb7z3NZYL56/S5Cg6BrcWjeZoSHq3DpP6McS2ltQXtPKMbvmME6AUdBNingzbPg==
X-Received: by 2002:a5d:610f:: with SMTP id v15mr2282922wrt.139.1642523573422; 
 Tue, 18 Jan 2022 08:32:53 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172])
 by smtp.gmail.com with ESMTPSA id z5sm3800230wmp.10.2022.01.18.08.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 08:32:53 -0800 (PST)
From: Christoph Muellner <cmuellner@linux.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: Christoph Muellner <cmuellner@linux.com>
Subject: [RESEND] target/riscv: Enable bitmanip Zicbo[m,z,p] instructions
Date: Tue, 18 Jan 2022 17:32:50 +0100
Message-Id: <20220118163250.2596615-1-cmuellner@linux.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.128.49;
 envelope-from=christophm30@gmail.com; helo=mail-wm1-f49.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 18 Jan 2022 16:32:58 -0000

The RISC-V base cache management operation ISA extension has been
ratified [1]. This patch adds support for the defined instructions
and CSRs.

[1] https://wiki.riscv.org/display/TECH/Recently+Ratified+Extensions

Co-developed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Signed-off-by: Christoph Muellner <cmuellner@linux.com>
---
 target/riscv/cpu.c                        |  4 +
 target/riscv/cpu.h                        |  9 +++
 target/riscv/cpu_bits.h                   | 10 +++
 target/riscv/csr.c                        | 47 ++++++++++++
 target/riscv/helper.h                     |  5 ++
 target/riscv/insn32.decode                | 20 ++++-
 target/riscv/insn_trans/trans_zicbo.c.inc | 72 ++++++++++++++++++
 target/riscv/op_helper.c                  | 89 +++++++++++++++++++++++
 target/riscv/translate.c                  |  1 +
 9 files changed, 256 insertions(+), 1 deletion(-)
 create mode 100644 target/riscv/insn_trans/trans_zicbo.c.inc

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9bc25d3055..b4a87cfcdc 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -660,6 +660,10 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
     DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
+    DEFINE_PROP_BOOL("Zicbom", RISCVCPU, cfg.ext_zicbom, false),
+    DEFINE_PROP_BOOL("Zicbop", RISCVCPU, cfg.ext_zicbop, false),
+    DEFINE_PROP_BOOL("Zicboz", RISCVCPU, cfg.ext_zicboz, false),
+    DEFINE_PROP_UINT16("cbolen", RISCVCPU, cfg.cbolen, 64),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 4d63086765..acfe21cb75 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -263,6 +263,11 @@ struct CPURISCVState {
     target_ulong spmbase;
     target_ulong upmmask;
     target_ulong upmbase;
+
+    /* [mhs]envcfg CSRs */
+    target_ulong menvcfg;
+    target_ulong henvcfg;
+    target_ulong senvcfg;
 #endif
 
     float_status fp_status;
@@ -329,6 +334,9 @@ struct RISCVCPU {
         bool ext_icsr;
         bool ext_zfh;
         bool ext_zfhmin;
+        bool ext_zicbom;
+        bool ext_zicbop;
+        bool ext_zicboz;
 
         char *priv_spec;
         char *user_spec;
@@ -336,6 +344,7 @@ struct RISCVCPU {
         char *vext_spec;
         uint16_t vlen;
         uint16_t elen;
+        uint16_t cbolen;
         bool mmu;
         bool pmp;
         bool epmp;
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 5a6d49aa64..38c529b493 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -217,6 +217,11 @@
 #define CSR_MTINST          0x34a
 #define CSR_MTVAL2          0x34b
 
+/* Environment configuration */
+#define CSR_SENVCFG         0x10a
+#define CSR_MENVCFG         0x30a
+#define CSR_HENVCFG         0x60a
+
 /* Enhanced Physical Memory Protection (ePMP) */
 #define CSR_MSECCFG         0x747
 #define CSR_MSECCFGH        0x757
@@ -449,6 +454,11 @@ typedef enum {
 #define COUNTEREN_IR         (1 << 2)
 #define COUNTEREN_HPM3       (1 << 3)
 
+/* [msh]envcfg CSR bits */
+#define ENVCFG_CBIE          (0b11 << 4)
+#define ENVCFG_CBCFE         (1 << 6)
+#define ENVCFG_CBZE          (1 << 7)
+
 /* Privilege modes */
 #define PRV_U 0
 #define PRV_S 1
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index adb3d4381d..6693f695e4 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1478,6 +1478,48 @@ static RISCVException write_mtinst(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException read_menvcfg(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
+{
+    *val = env->menvcfg;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
+                                    target_ulong val)
+{
+    env->menvcfg = val;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
+{
+    *val = env->henvcfg;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
+                                    target_ulong val)
+{
+    env->henvcfg = val;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
+{
+    *val = env->senvcfg;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_senvcfg(CPURISCVState *env, int csrno,
+                                    target_ulong val)
+{
+    env->senvcfg = val;
+    return RISCV_EXCP_NONE;
+}
+
 /* Physical Memory Protection */
 static RISCVException read_mseccfg(CPURISCVState *env, int csrno,
                                    target_ulong *val)
@@ -2091,6 +2133,11 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTVAL2]      = { "mtval2",      hmode,   read_mtval2,      write_mtval2      },
     [CSR_MTINST]      = { "mtinst",      hmode,   read_mtinst,      write_mtinst      },
 
+    /* Environment configuration */
+    [CSR_MENVCFG]     = { "menvcfg",     any,     read_menvcfg,     write_menvcfg     },
+    [CSR_HENVCFG]     = { "henvcfg",     hmode,   read_henvcfg,     write_henvcfg     },
+    [CSR_SENVCFG]     = { "senvcfg",     smode,   read_senvcfg,     write_senvcfg     },
+
     /* Physical Memory Protection */
     [CSR_MSECCFG]    = { "mseccfg",  epmp, read_mseccfg, write_mseccfg },
     [CSR_PMPCFG0]    = { "pmpcfg0",   pmp, read_pmpcfg,  write_pmpcfg  },
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 6cf6d6ce98..4a2ebdabbd 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -92,6 +92,11 @@ DEF_HELPER_FLAGS_2(fcvt_h_l, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_h_lu, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_1(fclass_h, TCG_CALL_NO_RWG_SE, tl, i64)
 
+/* Cache-block operations */
+DEF_HELPER_2(cbo_inval, void, env, tl)
+DEF_HELPER_2(cbo_clean, void, env, tl)
+DEF_HELPER_2(cbo_zero, void, env, tl)
+
 /* Special functions */
 DEF_HELPER_2(csrr, tl, env, int)
 DEF_HELPER_3(csrw, void, env, int, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index d3f798ca10..1dca5bf346 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -89,6 +89,8 @@
 @sfence_vma ....... ..... .....   ... ..... ....... %rs2 %rs1
 @sfence_vm  ....... ..... .....   ... ..... ....... %rs1
 
+@cbo_pref   simm:7 ..... .....   ... ..... ....... %rs1
+
 # Formats 64:
 @sh5     .......  ..... .....  ... ..... ....... &shift  shamt=%sh5      %rs1 %rd
 
@@ -128,7 +130,15 @@ addi     ............     ..... 000 ..... 0010011 @i
 slti     ............     ..... 010 ..... 0010011 @i
 sltiu    ............     ..... 011 ..... 0010011 @i
 xori     ............     ..... 100 ..... 0010011 @i
-ori      ............     ..... 110 ..... 0010011 @i
+{
+  {
+    # *** RV32 Zicbop Sandard Extension (hints in the ori-space) ***
+    prefetch_i  ....... 00000 ..... 110 00000 0010011 @cbo_pref
+    prefetch_r  ....... 00001 ..... 110 00000 0010011 @cbo_pref
+    prefetch_w  ....... 00011 ..... 110 00000 0010011 @cbo_pref
+  }
+  ori      ............     ..... 110 ..... 0010011 @i
+}
 andi     ............     ..... 111 ..... 0010011 @i
 slli     00000. ......    ..... 001 ..... 0010011 @sh
 srli     00000. ......    ..... 101 ..... 0010011 @sh
@@ -804,6 +814,14 @@ fcvt_h_w   1101010  00000 ..... ... ..... 1010011 @r2_rm
 fcvt_h_wu  1101010  00001 ..... ... ..... 1010011 @r2_rm
 fmv_h_x    1111010  00000 ..... 000 ..... 1010011 @r2
 
+# *** RV32 Zicbom Standard Extension ***
+cbo_clean  0000000 00001 ..... 010 00000 0001111 @sfence_vm
+cbo_flush  0000000 00010 ..... 010 00000 0001111 @sfence_vm
+cbo_inval  0000000 00000 ..... 010 00000 0001111 @sfence_vm
+
+# *** RV32 Zicboz Standard Extension ***
+cbo_zero   0000000 00100 ..... 010 00000 0001111 @sfence_vm
+
 # *** RV64 Zfh Extension (in addition to RV32 Zfh) ***
 fcvt_l_h   1100010  00010 ..... ... ..... 1010011 @r2_rm
 fcvt_lu_h  1100010  00011 ..... ... ..... 1010011 @r2_rm
diff --git a/target/riscv/insn_trans/trans_zicbo.c.inc b/target/riscv/insn_trans/trans_zicbo.c.inc
new file mode 100644
index 0000000000..e75f7d99e3
--- /dev/null
+++ b/target/riscv/insn_trans/trans_zicbo.c.inc
@@ -0,0 +1,72 @@
+/*
+ * RISC-V translation routines for the RISC-V CBO Extension.
+ *
+ * Copyright (c) 2021 Philipp Tomsich, philipp.tomsich@vrull.eu
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#define REQUIRE_ZICBOM(ctx) do {                 \
+    if (!RISCV_CPU(ctx->cs)->cfg.ext_zicbom) {   \
+        return false;                            \
+    }                                            \
+} while (0)
+
+#define REQUIRE_ZICBOZ(ctx) do {                 \
+    if (!RISCV_CPU(ctx->cs)->cfg.ext_zicboz) {   \
+        return false;                            \
+    }                                            \
+} while (0)
+
+static bool trans_cbo_clean(DisasContext *ctx, arg_cbo_clean *a)
+{
+    REQUIRE_ZICBOM(ctx);
+    gen_helper_cbo_clean(cpu_env, cpu_gpr[a->rs1]);
+    return true;
+}
+
+static bool trans_cbo_flush(DisasContext *ctx, arg_cbo_flush *a)
+{
+    REQUIRE_ZICBOM(ctx);
+    gen_helper_cbo_clean(cpu_env, cpu_gpr[a->rs1]);
+    return true;
+}
+
+static bool trans_cbo_inval(DisasContext *ctx, arg_cbo_inval *a)
+{
+    REQUIRE_ZICBOM(ctx);
+    gen_helper_cbo_inval(cpu_env, cpu_gpr[a->rs1]);
+    return true;
+}
+
+static bool trans_cbo_zero(DisasContext *ctx, arg_cbo_zero *a)
+{
+    REQUIRE_ZICBOZ(ctx);
+    gen_helper_cbo_zero(cpu_env, cpu_gpr[a->rs1]);
+    return true;
+}
+
+static bool trans_prefetch_i(DisasContext *ctx, arg_prefetch_i *a)
+{
+    return true;
+}
+
+static bool trans_prefetch_r(DisasContext *ctx, arg_prefetch_i *a)
+{
+    return true;
+}
+
+static bool trans_prefetch_w(DisasContext *ctx, arg_prefetch_i *a)
+{
+    return true;
+}
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 6f040f2fb9..06919abd49 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -3,6 +3,7 @@
  *
  * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
  * Copyright (c) 2017-2018 SiFive, Inc.
+ * Copyright (c) 2021      VRULL GmbH
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -69,6 +70,33 @@ target_ulong helper_csrrw(CPURISCVState *env, int csr,
     return val;
 }
 
+/* helper_zicbo_envcfg
+ *
+ * Raise virtual exceptions and illegal instruction exceptions for
+ * Zicbo[mz] instructions based on the settings of [mhs]envcfg.
+ */
+static void helper_zicbo_envcfg(CPURISCVState *env, target_ulong envbits)
+{
+#ifndef CONFIG_USER_ONLY
+    target_ulong ra = GETPC();
+
+    /* Check for virtual instruction exceptions first, as we don't see
+     * VU and VS reflected in env->priv (these are just the translated
+     * U and S stated with virtualisation enabled.
+     */
+    if (riscv_cpu_virt_enabled(env) &&
+        (((env->priv < PRV_H) && !get_field(env->henvcfg, envbits)) ||
+         ((env->priv < PRV_S) && !get_field(env->senvcfg, envbits)))) {
+        riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, ra);
+    }
+
+    if (((env->priv < PRV_M) && !get_field(env->menvcfg, envbits)) ||
+        ((env->priv < PRV_S) && !get_field(env->senvcfg, envbits))) {
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
+    }
+#endif
+}
+
 target_ulong helper_csrr_i128(CPURISCVState *env, int csr)
 {
     Int128 rv = int128_zero();
@@ -113,6 +141,67 @@ target_ulong helper_csrrw_i128(CPURISCVState *env, int csr,
     return int128_getlo(rv);
 }
 
+/* helper_zicbom_access
+ *
+ * Check access permissions (LOAD or STORE or FETCH) for Zicbom,
+ * raising either store page-fault (non-virtualised) or store
+ * guest-page fault (virtualised).
+ */
+static void helper_zicbom_access(CPURISCVState *env, target_ulong address)
+{
+    void* phost;
+    int ret = TLB_INVALID_MASK;
+    MMUAccessType access_type = MMU_DATA_LOAD;
+    target_ulong ra = GETPC();
+
+    while (ret == TLB_INVALID_MASK && access_type <= MMU_INST_FETCH) {
+        ret = probe_access_flags(env, address, access_type++,
+                                 cpu_mmu_index(env, false),
+                                 true, &phost, ra);
+    }
+
+    if (ret == TLB_INVALID_MASK) {
+        uint32_t exc = RISCV_EXCP_STORE_PAGE_FAULT;
+
+#ifndef CONFIG_USER_ONLY
+        /* User-mode emulation does not have virtualisation... */
+        if (riscv_cpu_virt_enabled(env)) {
+            exc = RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT;
+        }
+#endif
+        riscv_raise_exception(env, exc, ra);
+    }
+}
+
+void helper_cbo_inval(CPURISCVState *env, target_ulong address)
+{
+    helper_zicbo_envcfg(env, ENVCFG_CBIE);
+    helper_zicbom_access(env, address);
+
+    /* We don't emulate the cache-hierarchy, so we're done. */
+}
+
+void helper_cbo_clean(CPURISCVState *env, target_ulong address)
+{
+    helper_zicbo_envcfg(env, ENVCFG_CBCFE);
+    helper_zicbom_access(env, address);
+
+    /* We don't emulate the cache-hierarchy, so we're done. */
+}
+
+void helper_cbo_zero(CPURISCVState *env, target_ulong address)
+{
+    helper_zicbo_envcfg(env, ENVCFG_CBZE);
+
+    /* mask off low-bits to align-down to the cache-block */
+    address &= ~(RISCV_CPU(env)->cfg.cbolen - 1);
+    void* mem = probe_access(env, address, 4, MMU_DATA_STORE,
+                             cpu_mmu_index(env, false), GETPC());
+
+    /* Zeroize the block */
+    memset(mem, 0, RISCV_CPU(env)->cfg.cbolen);
+}
+
 #ifndef CONFIG_USER_ONLY
 
 target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 615048ec87..d3203a1f2f 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -837,6 +837,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvv.c.inc"
 #include "insn_trans/trans_rvb.c.inc"
 #include "insn_trans/trans_rvzfh.c.inc"
+#include "insn_trans/trans_zicbo.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
 
 /* Include the auto-generated decoder for 16 bit insn */
-- 
2.34.1


