Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nBzts-0006A8-HS
	for mharc-qemu-riscv@gnu.org; Mon, 24 Jan 2022 09:00:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophm30@gmail.com>)
 id 1nBztd-00068v-4d; Mon, 24 Jan 2022 09:00:41 -0500
Received: from mail-wm1-f50.google.com ([209.85.128.50]:43689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christophm30@gmail.com>)
 id 1nBztV-0002Ft-RK; Mon, 24 Jan 2022 09:00:32 -0500
Received: by mail-wm1-f50.google.com with SMTP id
 r2-20020a1c2b02000000b0034f7b261169so2586705wmr.2; 
 Mon, 24 Jan 2022 06:00:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+hJsOWIlXq8TaPESz5SISBnaVsroCtzW+wi4EyCZUuw=;
 b=A+A/WStGy2NyQwCvnoip5AM6+KFgPK37BnZpCSNhg2u8RjvuRo5jmEVfbTXiYe7fCu
 mc1j8mwQeOmDSJaCXmGC2cilIinG+jAqhFM0w716/hFVtSMrlPppe4M0iG0+yr9zKEeP
 J/08PukSc462Ul3TCGxtxUx+BjxIPob9nAwKgpOjv95hXizPkIzg6qJ/4cTG4bAv9XvH
 D8FA9kLjcydWx7TiXAD/jKv50Trq3MtXsTcU/aVR2P1oWxxl1k7Mx+E72XDPZNoajqGp
 WPdTCD0nmzpBPbWH0uD1sb/sD4n8aP+F+6DcMEWhU95pbNzHpdmanJplVmVjLcE+Cspi
 5VfQ==
X-Gm-Message-State: AOAM530v1LFC1tlgIgp37hz78JDSBcNhYVgzybJ6soMETR7fKxC1atWF
 tzMu7TsQay4a7NncfQOhl3U=
X-Google-Smtp-Source: ABdhPJyBIhEK2KvUnwRvl8RNBpF1dElscA28MYfCixcBAeWaswW1TFh9U8sVDumYsgm6vGApjHjq+Q==
X-Received: by 2002:a05:600c:21d6:: with SMTP id
 x22mr1962353wmj.65.1643032827170; 
 Mon, 24 Jan 2022 06:00:27 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172])
 by smtp.gmail.com with ESMTPSA id t17sm14282392wrs.10.2022.01.24.06.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 06:00:26 -0800 (PST)
From: Christoph Muellner <cmuellner@linux.com>
To: Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: Christoph Muellner <cmuellner@linux.com>
Subject: [PATCH v2] target/riscv: Enable bitmanip Zicbo[m,z,p] instructions
Date: Mon, 24 Jan 2022 15:00:23 +0100
Message-Id: <20220124140023.1165850-1-cmuellner@linux.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.128.50;
 envelope-from=christophm30@gmail.com; helo=mail-wm1-f50.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
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
X-List-Received-Date: Mon, 24 Jan 2022 14:00:42 -0000

The RISC-V base cache management operation ISA extension has been
ratified [1]. This patch adds support for the defined instructions.
Overlap groups are used to resolve the overlapping patterns
of the prefetch*/ori and cbo_*/lq instructions.

This patch depends on a patchset that introduces the Priv 1.12 CSRs:
https://lists.nongnu.org/archive/html/qemu-devel/2022-01/msg04478.html

[1] https://wiki.riscv.org/display/TECH/Recently+Ratified+Extensions

v2:
- Fix overlapping instruction encoding with LQ instructions
- Drop CSR related changes and rebase on Priv 1.12 patchset

https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg04213.html

Co-developed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Signed-off-by: Christoph Muellner <cmuellner@linux.com>
---
 target/riscv/cpu.c                        |  4 +
 target/riscv/cpu.h                        |  4 +
 target/riscv/cpu_bits.h                   |  5 ++
 target/riscv/helper.h                     |  5 ++
 target/riscv/insn32.decode                | 29 +++++++-
 target/riscv/insn_trans/trans_zicbo.c.inc | 72 ++++++++++++++++++
 target/riscv/op_helper.c                  | 89 +++++++++++++++++++++++
 target/riscv/translate.c                  |  1 +
 8 files changed, 207 insertions(+), 2 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_zicbo.c.inc

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3cba82e560..0deed67497 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -721,6 +721,10 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
     DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
+    DEFINE_PROP_BOOL("Zicbom", RISCVCPU, cfg.ext_zicbom, false),
+    DEFINE_PROP_BOOL("Zicbop", RISCVCPU, cfg.ext_zicbop, false),
+    DEFINE_PROP_BOOL("Zicboz", RISCVCPU, cfg.ext_zicboz, false),
+    DEFINE_PROP_UINT16("cbolen", RISCVCPU, cfg.cbolen, 64),
     DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
     DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 2f678e6c4f..7612a59161 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -354,6 +354,9 @@ struct RISCVCPU {
         bool ext_zfhmin;
         bool ext_zve32f;
         bool ext_zve64f;
+        bool ext_zicbom;
+        bool ext_zicbop;
+        bool ext_zicboz;
 
         char *priv_spec;
         char *user_spec;
@@ -361,6 +364,7 @@ struct RISCVCPU {
         char *vext_spec;
         uint16_t vlen;
         uint16_t elen;
+        uint16_t cbolen;
         bool mmu;
         bool pmp;
         bool epmp;
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 47ed4d6cab..62c38595d7 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -464,6 +464,11 @@ typedef enum {
 /* vsstatus CSR bits */
 #define VSSTATUS64_UXL       0x0000000300000000ULL
 
+/* [msh]envcfg CSR bits */
+#define ENVCFG_CBIE          (0b11 << 4)
+#define ENVCFG_CBCFE         (1 << 6)
+#define ENVCFG_CBZE          (1 << 7)
+
 /* Privilege modes */
 #define PRV_U 0
 #define PRV_S 1
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 72cc2582f4..0e068ac6cd 100644
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
index 5bbedc254c..8d86628784 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -89,6 +89,8 @@
 @sfence_vma ....... ..... .....   ... ..... ....... %rs2 %rs1
 @sfence_vm  ....... ..... .....   ... ..... ....... %rs1
 
+@cbo_pref   simm:7 ..... .....   ... ..... ....... %rs1
+
 # Formats 64:
 @sh5     .......  ..... .....  ... ..... ....... &shift  shamt=%sh5      %rs1 %rd
 
@@ -128,7 +130,17 @@ addi     ............     ..... 000 ..... 0010011 @i
 slti     ............     ..... 010 ..... 0010011 @i
 sltiu    ............     ..... 011 ..... 0010011 @i
 xori     ............     ..... 100 ..... 0010011 @i
-ori      ............     ..... 110 ..... 0010011 @i
+{
+  [
+    # *** RV32 Zicbop Sandard Extension (hints in the ori-space) ***
+    prefetch_i  ....... 00000 ..... 110 00000 0010011 @cbo_pref
+    prefetch_r  ....... 00001 ..... 110 00000 0010011 @cbo_pref
+    prefetch_w  ....... 00011 ..... 110 00000 0010011 @cbo_pref
+  ]
+
+  # *** RV32I ori ***
+  ori      ............     ..... 110 ..... 0010011 @i
+}
 andi     ............     ..... 111 ..... 0010011 @i
 slli     00000. ......    ..... 001 ..... 0010011 @sh
 srli     00000. ......    ..... 101 ..... 0010011 @sh
@@ -168,7 +180,20 @@ sraw     0100000 .....  ..... 101 ..... 0111011 @r
 
 # *** RV128I Base Instruction Set (in addition to RV64I) ***
 ldu      ............   ..... 111 ..... 0000011 @i
-lq       ............   ..... 010 ..... 0001111 @i
+{
+  [
+    # *** RV32 Zicbom Standard Extension ***
+    cbo_clean  0000000 00001 ..... 010 00000 0001111 @sfence_vm
+    cbo_flush  0000000 00010 ..... 010 00000 0001111 @sfence_vm
+    cbo_inval  0000000 00000 ..... 010 00000 0001111 @sfence_vm
+
+    # *** RV32 Zicboz Standard Extension ***
+    cbo_zero   0000000 00100 ..... 010 00000 0001111 @sfence_vm
+  ]
+
+  # *** RVI128 lq ***
+  lq       ............   ..... 010 ..... 0001111 @i
+}
 sq       ............   ..... 100 ..... 0100011 @s
 addid    ............  .....  000 ..... 1011011 @i
 sllid    000000 ......  ..... 001 ..... 1011011 @sh6
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
index 1a75ba11e6..3c410358d4 100644
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
@@ -70,6 +71,33 @@ target_ulong helper_csrrw(CPURISCVState *env, int csr,
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
@@ -114,6 +142,67 @@ target_ulong helper_csrrw_i128(CPURISCVState *env, int csr,
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
 
 target_ulong helper_sret(CPURISCVState *env)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index f0bbe80875..8f25a6d02f 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -854,6 +854,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvv.c.inc"
 #include "insn_trans/trans_rvb.c.inc"
 #include "insn_trans/trans_rvzfh.c.inc"
+#include "insn_trans/trans_zicbo.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
 
 /* Include the auto-generated decoder for 16 bit insn */
-- 
2.34.1


