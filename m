Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcljq-0000oA-71
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 05:48:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mcljV-0000S6-UH; Tue, 19 Oct 2021 05:48:35 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:54584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mcljO-0006Pe-6O; Tue, 19 Oct 2021 05:48:32 -0400
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 32EA541F91;
 Tue, 19 Oct 2021 11:48:22 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 19C03601D5;
 Tue, 19 Oct 2021 11:48:22 +0200 (CEST)
Received: from palmier.u-ga.fr (palmier.tima.u-ga.fr [147.171.132.208])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id E910614005D;
 Tue, 19 Oct 2021 11:48:21 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v3 01/21] memory: change define name for consistency
Date: Tue, 19 Oct 2021 11:47:52 +0200
Message-Id: <20211019094812.614056-2-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Oct 2021 09:48:38 -0000

Changed MO_Q into MO_UQ so as to avoid confusion, as suggested by
Philippe Mathieu-Daudé.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
---
 include/exec/memop.h                       |  8 ++++----
 target/arm/translate-a32.h                 |  4 ++--
 target/arm/translate-a64.c                 |  8 ++++----
 target/arm/translate-neon.c                |  6 +++---
 target/arm/translate-sve.c                 |  2 +-
 target/arm/translate-vfp.c                 |  8 ++++----
 target/arm/translate.c                     |  2 +-
 target/ppc/translate.c                     | 24 +++++++++++-----------
 target/sparc/translate.c                   |  4 ++--
 target/ppc/translate/fixedpoint-impl.c.inc | 20 +++++++++---------
 target/ppc/translate/fp-impl.c.inc         |  4 ++--
 target/ppc/translate/vsx-impl.c.inc        |  4 ++--
 tcg/aarch64/tcg-target.c.inc               |  2 +-
 tcg/arm/tcg-target.c.inc                   | 10 ++++-----
 tcg/i386/tcg-target.c.inc                  |  4 ++--
 tcg/mips/tcg-target.c.inc                  |  4 ++--
 tcg/ppc/tcg-target.c.inc                   |  8 ++++----
 tcg/riscv/tcg-target.c.inc                 |  6 +++---
 tcg/s390x/tcg-target.c.inc                 | 10 ++++-----
 19 files changed, 69 insertions(+), 69 deletions(-)

diff --git a/include/exec/memop.h b/include/exec/memop.h
index 04264ffd6b..c554bb0ee8 100644
--- a/include/exec/memop.h
+++ b/include/exec/memop.h
@@ -88,26 +88,26 @@ typedef enum MemOp {
     MO_SB    = MO_SIGN | MO_8,
     MO_SW    = MO_SIGN | MO_16,
     MO_SL    = MO_SIGN | MO_32,
-    MO_Q     = MO_64,
+    MO_UQ     = MO_64,
 
     MO_LEUW  = MO_LE | MO_UW,
     MO_LEUL  = MO_LE | MO_UL,
     MO_LESW  = MO_LE | MO_SW,
     MO_LESL  = MO_LE | MO_SL,
-    MO_LEQ   = MO_LE | MO_Q,
+    MO_LEQ   = MO_LE | MO_UQ,
 
     MO_BEUW  = MO_BE | MO_UW,
     MO_BEUL  = MO_BE | MO_UL,
     MO_BESW  = MO_BE | MO_SW,
     MO_BESL  = MO_BE | MO_SL,
-    MO_BEQ   = MO_BE | MO_Q,
+    MO_BEQ   = MO_BE | MO_UQ,
 
 #ifdef NEED_CPU_H
     MO_TEUW  = MO_TE | MO_UW,
     MO_TEUL  = MO_TE | MO_UL,
     MO_TESW  = MO_TE | MO_SW,
     MO_TESL  = MO_TE | MO_SL,
-    MO_TEQ   = MO_TE | MO_Q,
+    MO_TEQ   = MO_TE | MO_UQ,
 #endif
 
     MO_SSIZE = MO_SIZE | MO_SIGN,
diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index 88f15df60e..ec0330ea0f 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -114,13 +114,13 @@ void gen_aa32_st_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
 static inline void gen_aa32_ld64(DisasContext *s, TCGv_i64 val,
                                  TCGv_i32 a32, int index)
 {
-    gen_aa32_ld_i64(s, val, a32, index, MO_Q);
+    gen_aa32_ld_i64(s, val, a32, index, MO_UQ);
 }
 
 static inline void gen_aa32_st64(DisasContext *s, TCGv_i64 val,
                                  TCGv_i32 a32, int index)
 {
-    gen_aa32_st_i64(s, val, a32, index, MO_Q);
+    gen_aa32_st_i64(s, val, a32, index, MO_UQ);
 }
 
 DO_GEN_LD(8u, MO_UB)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index cec672f229..1411fdfb6f 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -973,7 +973,7 @@ static void do_fp_st(DisasContext *s, int srcidx, TCGv_i64 tcg_addr, int size)
 
         tcg_gen_ld_i64(tmphi, cpu_env, fp_reg_hi_offset(s, srcidx));
 
-        mop = s->be_data | MO_Q;
+        mop = s->be_data | MO_UQ;
         tcg_gen_qemu_st_i64(be ? tmphi : tmplo, tcg_addr, get_mem_index(s),
                             mop | (s->align_mem ? MO_ALIGN_16 : 0));
         tcg_gen_addi_i64(tcg_hiaddr, tcg_addr, 8);
@@ -1007,7 +1007,7 @@ static void do_fp_ld(DisasContext *s, int destidx, TCGv_i64 tcg_addr, int size)
         tmphi = tcg_temp_new_i64();
         tcg_hiaddr = tcg_temp_new_i64();
 
-        mop = s->be_data | MO_Q;
+        mop = s->be_data | MO_UQ;
         tcg_gen_qemu_ld_i64(be ? tmphi : tmplo, tcg_addr, get_mem_index(s),
                             mop | (s->align_mem ? MO_ALIGN_16 : 0));
         tcg_gen_addi_i64(tcg_hiaddr, tcg_addr, 8);
@@ -4099,10 +4099,10 @@ static void disas_ldst_tag(DisasContext *s, uint32_t insn)
         int i, n = (1 + is_pair) << LOG2_TAG_GRANULE;
 
         tcg_gen_qemu_st_i64(tcg_zero, clean_addr, mem_index,
-                            MO_Q | MO_ALIGN_16);
+                            MO_UQ | MO_ALIGN_16);
         for (i = 8; i < n; i += 8) {
             tcg_gen_addi_i64(clean_addr, clean_addr, 8);
-            tcg_gen_qemu_st_i64(tcg_zero, clean_addr, mem_index, MO_Q);
+            tcg_gen_qemu_st_i64(tcg_zero, clean_addr, mem_index, MO_UQ);
         }
         tcg_temp_free_i64(tcg_zero);
     }
diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index dd43de558e..3854dd3516 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -73,7 +73,7 @@ static void neon_load_element64(TCGv_i64 var, int reg, int ele, MemOp mop)
     case MO_UL:
         tcg_gen_ld32u_i64(var, cpu_env, offset);
         break;
-    case MO_Q:
+    case MO_UQ:
         tcg_gen_ld_i64(var, cpu_env, offset);
         break;
     default:
@@ -1830,7 +1830,7 @@ static bool do_prewiden_3d(DisasContext *s, arg_3diff *a,
         return false;
     }
 
-    if ((a->vd & 1) || (src1_mop == MO_Q && (a->vn & 1))) {
+    if ((a->vd & 1) || (src1_mop == MO_UQ && (a->vn & 1))) {
         return false;
     }
 
@@ -1910,7 +1910,7 @@ static bool do_prewiden_3d(DisasContext *s, arg_3diff *a,
         };                                                              \
         int narrow_mop = a->size == MO_32 ? MO_32 | SIGN : -1;          \
         return do_prewiden_3d(s, a, widenfn[a->size], addfn[a->size],   \
-                              SRC1WIDE ? MO_Q : narrow_mop,             \
+                              SRC1WIDE ? MO_UQ : narrow_mop,             \
                               narrow_mop);                              \
     }
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index bc91a64171..86104b857e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5284,7 +5284,7 @@ static const MemOp dtype_mop[16] = {
     MO_UB, MO_UB, MO_UB, MO_UB,
     MO_SL, MO_UW, MO_UW, MO_UW,
     MO_SW, MO_SW, MO_UL, MO_UL,
-    MO_SB, MO_SB, MO_SB, MO_Q
+    MO_SB, MO_SB, MO_SB, MO_UQ
 };
 
 #define dtype_msz(x)  (dtype_mop[x] & MO_SIZE)
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 59bcaec5be..17f796e32a 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -1170,11 +1170,11 @@ static bool trans_VLDR_VSTR_dp(DisasContext *s, arg_VLDR_VSTR_dp *a)
     addr = add_reg_for_lit(s, a->rn, offset);
     tmp = tcg_temp_new_i64();
     if (a->l) {
-        gen_aa32_ld_i64(s, tmp, addr, get_mem_index(s), MO_Q | MO_ALIGN_4);
+        gen_aa32_ld_i64(s, tmp, addr, get_mem_index(s), MO_UQ | MO_ALIGN_4);
         vfp_store_reg64(tmp, a->vd);
     } else {
         vfp_load_reg64(tmp, a->vd);
-        gen_aa32_st_i64(s, tmp, addr, get_mem_index(s), MO_Q | MO_ALIGN_4);
+        gen_aa32_st_i64(s, tmp, addr, get_mem_index(s), MO_UQ | MO_ALIGN_4);
     }
     tcg_temp_free_i64(tmp);
     tcg_temp_free_i32(addr);
@@ -1322,12 +1322,12 @@ static bool trans_VLDM_VSTM_dp(DisasContext *s, arg_VLDM_VSTM_dp *a)
     for (i = 0; i < n; i++) {
         if (a->l) {
             /* load */
-            gen_aa32_ld_i64(s, tmp, addr, get_mem_index(s), MO_Q | MO_ALIGN_4);
+            gen_aa32_ld_i64(s, tmp, addr, get_mem_index(s), MO_UQ | MO_ALIGN_4);
             vfp_store_reg64(tmp, a->vd + i);
         } else {
             /* store */
             vfp_load_reg64(tmp, a->vd + i);
-            gen_aa32_st_i64(s, tmp, addr, get_mem_index(s), MO_Q | MO_ALIGN_4);
+            gen_aa32_st_i64(s, tmp, addr, get_mem_index(s), MO_UQ | MO_ALIGN_4);
         }
         tcg_gen_addi_i32(addr, addr, offset);
     }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index d6af5b1b03..0390e9d48e 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1220,7 +1220,7 @@ void read_neon_element64(TCGv_i64 dest, int reg, int ele, MemOp memop)
     case MO_UL:
         tcg_gen_ld32u_i64(dest, cpu_env, off);
         break;
-    case MO_Q:
+    case MO_UQ:
         tcg_gen_ld_i64(dest, cpu_env, off);
         break;
     default:
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index c3c6cb9589..8133f7dea0 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -3228,10 +3228,10 @@ GEN_QEMU_LOAD_64(ld8u,  DEF_MEMOP(MO_UB))
 GEN_QEMU_LOAD_64(ld16u, DEF_MEMOP(MO_UW))
 GEN_QEMU_LOAD_64(ld32u, DEF_MEMOP(MO_UL))
 GEN_QEMU_LOAD_64(ld32s, DEF_MEMOP(MO_SL))
-GEN_QEMU_LOAD_64(ld64,  DEF_MEMOP(MO_Q))
+GEN_QEMU_LOAD_64(ld64,  DEF_MEMOP(MO_UQ))
 
 #if defined(TARGET_PPC64)
-GEN_QEMU_LOAD_64(ld64ur, BSWAP_MEMOP(MO_Q))
+GEN_QEMU_LOAD_64(ld64ur, BSWAP_MEMOP(MO_UQ))
 #endif
 
 #define GEN_QEMU_STORE_TL(stop, op)                                     \
@@ -3262,10 +3262,10 @@ static void glue(gen_qemu_, glue(stop, _i64))(DisasContext *ctx,  \
 GEN_QEMU_STORE_64(st8,  DEF_MEMOP(MO_UB))
 GEN_QEMU_STORE_64(st16, DEF_MEMOP(MO_UW))
 GEN_QEMU_STORE_64(st32, DEF_MEMOP(MO_UL))
-GEN_QEMU_STORE_64(st64, DEF_MEMOP(MO_Q))
+GEN_QEMU_STORE_64(st64, DEF_MEMOP(MO_UQ))
 
 #if defined(TARGET_PPC64)
-GEN_QEMU_STORE_64(st64r, BSWAP_MEMOP(MO_Q))
+GEN_QEMU_STORE_64(st64r, BSWAP_MEMOP(MO_UQ))
 #endif
 
 #define GEN_LDX_E(name, ldop, opc2, opc3, type, type2, chk)                   \
@@ -3302,7 +3302,7 @@ GEN_LDEPX(lb, DEF_MEMOP(MO_UB), 0x1F, 0x02)
 GEN_LDEPX(lh, DEF_MEMOP(MO_UW), 0x1F, 0x08)
 GEN_LDEPX(lw, DEF_MEMOP(MO_UL), 0x1F, 0x00)
 #if defined(TARGET_PPC64)
-GEN_LDEPX(ld, DEF_MEMOP(MO_Q), 0x1D, 0x00)
+GEN_LDEPX(ld, DEF_MEMOP(MO_UQ), 0x1D, 0x00)
 #endif
 
 #if defined(TARGET_PPC64)
@@ -3411,7 +3411,7 @@ GEN_STEPX(stb, DEF_MEMOP(MO_UB), 0x1F, 0x06)
 GEN_STEPX(sth, DEF_MEMOP(MO_UW), 0x1F, 0x0C)
 GEN_STEPX(stw, DEF_MEMOP(MO_UL), 0x1F, 0x04)
 #if defined(TARGET_PPC64)
-GEN_STEPX(std, DEF_MEMOP(MO_Q), 0x1d, 0x04)
+GEN_STEPX(std, DEF_MEMOP(MO_UQ), 0x1d, 0x04)
 #endif
 
 #if defined(TARGET_PPC64)
@@ -3905,7 +3905,7 @@ static void gen_lwat(DisasContext *ctx)
 #ifdef TARGET_PPC64
 static void gen_ldat(DisasContext *ctx)
 {
-    gen_ld_atomic(ctx, DEF_MEMOP(MO_Q));
+    gen_ld_atomic(ctx, DEF_MEMOP(MO_UQ));
 }
 #endif
 
@@ -3988,7 +3988,7 @@ static void gen_stwat(DisasContext *ctx)
 #ifdef TARGET_PPC64
 static void gen_stdat(DisasContext *ctx)
 {
-    gen_st_atomic(ctx, DEF_MEMOP(MO_Q));
+    gen_st_atomic(ctx, DEF_MEMOP(MO_UQ));
 }
 #endif
 
@@ -4040,9 +4040,9 @@ STCX(stwcx_, DEF_MEMOP(MO_UL))
 
 #if defined(TARGET_PPC64)
 /* ldarx */
-LARX(ldarx, DEF_MEMOP(MO_Q))
+LARX(ldarx, DEF_MEMOP(MO_UQ))
 /* stdcx. */
-STCX(stdcx_, DEF_MEMOP(MO_Q))
+STCX(stdcx_, DEF_MEMOP(MO_UQ))
 
 /* lqarx */
 static void gen_lqarx(DisasContext *ctx)
@@ -8050,7 +8050,7 @@ GEN_LDEPX(lb, DEF_MEMOP(MO_UB), 0x1F, 0x02)
 GEN_LDEPX(lh, DEF_MEMOP(MO_UW), 0x1F, 0x08)
 GEN_LDEPX(lw, DEF_MEMOP(MO_UL), 0x1F, 0x00)
 #if defined(TARGET_PPC64)
-GEN_LDEPX(ld, DEF_MEMOP(MO_Q), 0x1D, 0x00)
+GEN_LDEPX(ld, DEF_MEMOP(MO_UQ), 0x1D, 0x00)
 #endif
 
 #undef GEN_STX_E
@@ -8076,7 +8076,7 @@ GEN_STEPX(stb, DEF_MEMOP(MO_UB), 0x1F, 0x06)
 GEN_STEPX(sth, DEF_MEMOP(MO_UW), 0x1F, 0x0C)
 GEN_STEPX(stw, DEF_MEMOP(MO_UL), 0x1F, 0x04)
 #if defined(TARGET_PPC64)
-GEN_STEPX(std, DEF_MEMOP(MO_Q), 0x1D, 0x04)
+GEN_STEPX(std, DEF_MEMOP(MO_UQ), 0x1D, 0x04)
 #endif
 
 #undef GEN_CRLOGIC
diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index fdb8bbe5dc..7dfb33f867 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -2830,7 +2830,7 @@ static void gen_ldda_asi(DisasContext *dc, TCGv addr, int insn, int rd)
     default:
         {
             TCGv_i32 r_asi = tcg_const_i32(da.asi);
-            TCGv_i32 r_mop = tcg_const_i32(MO_Q);
+            TCGv_i32 r_mop = tcg_const_i32(MO_UQ);
 
             save_state(dc);
             gen_helper_ld_asi(t64, cpu_env, addr, r_asi, r_mop);
@@ -2886,7 +2886,7 @@ static void gen_stda_asi(DisasContext *dc, TCGv hi, TCGv addr,
     default:
         {
             TCGv_i32 r_asi = tcg_const_i32(da.asi);
-            TCGv_i32 r_mop = tcg_const_i32(MO_Q);
+            TCGv_i32 r_mop = tcg_const_i32(MO_UQ);
 
             save_state(dc);
             gen_helper_st_asi(cpu_env, addr, t64, r_asi, r_mop);
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 2e2518ee15..33ce041d0b 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -131,11 +131,11 @@ TRANS64(LWAUX, do_ldst_X, true, false, MO_SL)
 TRANS64(PLWA, do_ldst_PLS_D, false, false, MO_SL)
 
 /* Load Doubleword */
-TRANS64(LD, do_ldst_D, false, false, MO_Q)
-TRANS64(LDX, do_ldst_X, false, false, MO_Q)
-TRANS64(LDU, do_ldst_D, true, false, MO_Q)
-TRANS64(LDUX, do_ldst_X, true, false, MO_Q)
-TRANS64(PLD, do_ldst_PLS_D, false, false, MO_Q)
+TRANS64(LD, do_ldst_D, false, false, MO_UQ)
+TRANS64(LDX, do_ldst_X, false, false, MO_UQ)
+TRANS64(LDU, do_ldst_D, true, false, MO_UQ)
+TRANS64(LDUX, do_ldst_X, true, false, MO_UQ)
+TRANS64(PLD, do_ldst_PLS_D, false, false, MO_UQ)
 
 /* Store Byte */
 TRANS(STB, do_ldst_D, false, true, MO_UB)
@@ -159,11 +159,11 @@ TRANS(STWUX, do_ldst_X, true, true, MO_UL)
 TRANS(PSTW, do_ldst_PLS_D, false, true, MO_UL)
 
 /* Store Doubleword */
-TRANS64(STD, do_ldst_D, false, true, MO_Q)
-TRANS64(STDX, do_ldst_X, false, true, MO_Q)
-TRANS64(STDU, do_ldst_D, true, true, MO_Q)
-TRANS64(STDUX, do_ldst_X, true, true, MO_Q)
-TRANS64(PSTD, do_ldst_PLS_D, false, true, MO_Q)
+TRANS64(STD, do_ldst_D, false, true, MO_UQ)
+TRANS64(STDX, do_ldst_X, false, true, MO_UQ)
+TRANS64(STDU, do_ldst_D, true, true, MO_UQ)
+TRANS64(STDUX, do_ldst_X, true, true, MO_UQ)
+TRANS64(PSTD, do_ldst_PLS_D, false, true, MO_UQ)
 
 /*
  * Fixed-Point Compare Instructions
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index 9f7868ee28..01b5c53bf4 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -974,7 +974,7 @@ static void gen_lfdepx(DisasContext *ctx)
     EA = tcg_temp_new();
     t0 = tcg_temp_new_i64();
     gen_addr_reg_index(ctx, EA);
-    tcg_gen_qemu_ld_i64(t0, EA, PPC_TLB_EPID_LOAD, DEF_MEMOP(MO_Q));
+    tcg_gen_qemu_ld_i64(t0, EA, PPC_TLB_EPID_LOAD, DEF_MEMOP(MO_UQ));
     set_fpr(rD(ctx->opcode), t0);
     tcg_temp_free(EA);
     tcg_temp_free_i64(t0);
@@ -1210,7 +1210,7 @@ static void gen_stfdepx(DisasContext *ctx)
     t0 = tcg_temp_new_i64();
     gen_addr_reg_index(ctx, EA);
     get_fpr(t0, rD(ctx->opcode));
-    tcg_gen_qemu_st_i64(t0, EA, PPC_TLB_EPID_STORE, DEF_MEMOP(MO_Q));
+    tcg_gen_qemu_st_i64(t0, EA, PPC_TLB_EPID_STORE, DEF_MEMOP(MO_UQ));
     tcg_temp_free(EA);
     tcg_temp_free_i64(t0);
 }
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 57a7f73bba..c1b1dde01c 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -162,8 +162,8 @@ static void gen_lxvdsx(DisasContext *ctx)
     gen_addr_reg_index(ctx, EA);
 
     data = tcg_temp_new_i64();
-    tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, DEF_MEMOP(MO_Q));
-    tcg_gen_gvec_dup_i64(MO_Q, vsr_full_offset(xT(ctx->opcode)), 16, 16, data);
+    tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, DEF_MEMOP(MO_UQ));
+    tcg_gen_gvec_dup_i64(MO_UQ, vsr_full_offset(xT(ctx->opcode)), 16, 16, data);
 
     tcg_temp_free(EA);
     tcg_temp_free_i64(data);
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 5edca8d44d..a8db553287 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1744,7 +1744,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp memop, TCGType ext,
     case MO_SL:
         tcg_out_ldst_r(s, I3312_LDRSWX, data_r, addr_r, otype, off_r);
         break;
-    case MO_Q:
+    case MO_UQ:
         tcg_out_ldst_r(s, I3312_LDRX, data_r, addr_r, otype, off_r);
         break;
     default:
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 633b8a37ba..e31f454695 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1443,13 +1443,13 @@ static void * const qemu_ld_helpers[MO_SSIZE + 1] = {
 #ifdef HOST_WORDS_BIGENDIAN
     [MO_UW] = helper_be_lduw_mmu,
     [MO_UL] = helper_be_ldul_mmu,
-    [MO_Q]  = helper_be_ldq_mmu,
+    [MO_UQ]  = helper_be_ldq_mmu,
     [MO_SW] = helper_be_ldsw_mmu,
     [MO_SL] = helper_be_ldul_mmu,
 #else
     [MO_UW] = helper_le_lduw_mmu,
     [MO_UL] = helper_le_ldul_mmu,
-    [MO_Q]  = helper_le_ldq_mmu,
+    [MO_UQ]  = helper_le_ldq_mmu,
     [MO_SW] = helper_le_ldsw_mmu,
     [MO_SL] = helper_le_ldul_mmu,
 #endif
@@ -1694,7 +1694,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     default:
         tcg_out_mov_reg(s, COND_AL, datalo, TCG_REG_R0);
         break;
-    case MO_Q:
+    case MO_UQ:
         if (datalo != TCG_REG_R1) {
             tcg_out_mov_reg(s, COND_AL, datalo, TCG_REG_R0);
             tcg_out_mov_reg(s, COND_AL, datahi, TCG_REG_R1);
@@ -1781,7 +1781,7 @@ static void tcg_out_qemu_ld_index(TCGContext *s, MemOp opc,
     case MO_UL:
         tcg_out_ld32_r(s, COND_AL, datalo, addrlo, addend);
         break;
-    case MO_Q:
+    case MO_UQ:
         /* Avoid ldrd for user-only emulation, to handle unaligned.  */
         if (USING_SOFTMMU && use_armv6_instructions
             && (datalo & 1) == 0 && datahi == datalo + 1) {
@@ -1824,7 +1824,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg datalo,
     case MO_UL:
         tcg_out_ld32_12(s, COND_AL, datalo, addrlo, 0);
         break;
-    case MO_Q:
+    case MO_UQ:
         /* Avoid ldrd for user-only emulation, to handle unaligned.  */
         if (USING_SOFTMMU && use_armv6_instructions
             && (datalo & 1) == 0 && datahi == datalo + 1) {
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 84b109bb84..0b5d385ad6 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1827,7 +1827,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     case MO_UL:
         tcg_out_mov(s, TCG_TYPE_I32, data_reg, TCG_REG_EAX);
         break;
-    case MO_Q:
+    case MO_UQ:
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_mov(s, TCG_TYPE_I64, data_reg, TCG_REG_RAX);
         } else if (data_reg == TCG_REG_EDX) {
@@ -2019,7 +2019,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
         }
         break;
 #endif
-    case MO_Q:
+    case MO_UQ:
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_modrm_sib_offset(s, movop + P_REXW + seg, datalo,
                                      base, index, 0, ofs);
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index d8f6914f03..15704c84fa 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1384,7 +1384,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
     case MO_SL:
         tcg_out_opc_imm(s, OPC_LW, lo, base, 0);
         break;
-    case MO_Q | MO_BSWAP:
+    case MO_UQ | MO_BSWAP:
         if (TCG_TARGET_REG_BITS == 64) {
             if (use_mips32r2_instructions) {
                 tcg_out_opc_imm(s, OPC_LD, lo, base, 0);
@@ -1413,7 +1413,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
             tcg_out_mov(s, TCG_TYPE_I32, MIPS_BE ? hi : lo, TCG_TMP3);
         }
         break;
-    case MO_Q:
+    case MO_UQ:
         /* Prefer to load from offset 0 first, but allow for overlap.  */
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_opc_imm(s, OPC_LD, lo, base, 0);
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 3e4ca2be88..6802cb06a3 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -1935,24 +1935,24 @@ static const uint32_t qemu_ldx_opc[(MO_SSIZE + MO_BSWAP) + 1] = {
     [MO_UB] = LBZX,
     [MO_UW] = LHZX,
     [MO_UL] = LWZX,
-    [MO_Q]  = LDX,
+    [MO_UQ]  = LDX,
     [MO_SW] = LHAX,
     [MO_SL] = LWAX,
     [MO_BSWAP | MO_UB] = LBZX,
     [MO_BSWAP | MO_UW] = LHBRX,
     [MO_BSWAP | MO_UL] = LWBRX,
-    [MO_BSWAP | MO_Q]  = LDBRX,
+    [MO_BSWAP | MO_UQ]  = LDBRX,
 };
 
 static const uint32_t qemu_stx_opc[(MO_SIZE + MO_BSWAP) + 1] = {
     [MO_UB] = STBX,
     [MO_UW] = STHX,
     [MO_UL] = STWX,
-    [MO_Q]  = STDX,
+    [MO_UQ]  = STDX,
     [MO_BSWAP | MO_UB] = STBX,
     [MO_BSWAP | MO_UW] = STHBRX,
     [MO_BSWAP | MO_UL] = STWBRX,
-    [MO_BSWAP | MO_Q]  = STDBRX,
+    [MO_BSWAP | MO_UQ]  = STDBRX,
 };
 
 static const uint32_t qemu_exts_opc[4] = {
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 9b13a46fb4..b621694321 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -862,7 +862,7 @@ static void * const qemu_ld_helpers[MO_SSIZE + 1] = {
 #if TCG_TARGET_REG_BITS == 64
     [MO_SL] = helper_be_ldsl_mmu,
 #endif
-    [MO_Q]  = helper_be_ldq_mmu,
+    [MO_UQ]  = helper_be_ldq_mmu,
 #else
     [MO_UW] = helper_le_lduw_mmu,
     [MO_SW] = helper_le_ldsw_mmu,
@@ -870,7 +870,7 @@ static void * const qemu_ld_helpers[MO_SSIZE + 1] = {
 #if TCG_TARGET_REG_BITS == 64
     [MO_SL] = helper_le_ldsl_mmu,
 #endif
-    [MO_Q]  = helper_le_ldq_mmu,
+    [MO_UQ]  = helper_le_ldq_mmu,
 #endif
 };
 
@@ -1083,7 +1083,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
     case MO_SL:
         tcg_out_opc_imm(s, OPC_LW, lo, base, 0);
         break;
-    case MO_Q:
+    case MO_UQ:
         /* Prefer to load from offset 0 first, but allow for overlap.  */
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_opc_imm(s, OPC_LD, lo, base, 0);
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 8938c446c8..61d6694268 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1745,10 +1745,10 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg data,
         tcg_out_insn(s, RXY, LGF, data, base, index, disp);
         break;
 
-    case MO_Q | MO_BSWAP:
+    case MO_UQ | MO_BSWAP:
         tcg_out_insn(s, RXY, LRVG, data, base, index, disp);
         break;
-    case MO_Q:
+    case MO_UQ:
         tcg_out_insn(s, RXY, LG, data, base, index, disp);
         break;
 
@@ -1791,10 +1791,10 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg data,
         }
         break;
 
-    case MO_Q | MO_BSWAP:
+    case MO_UQ | MO_BSWAP:
         tcg_out_insn(s, RXY, STRVG, data, base, index, disp);
         break;
-    case MO_Q:
+    case MO_UQ:
         tcg_out_insn(s, RXY, STG, data, base, index, disp);
         break;
 
@@ -1928,7 +1928,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     case MO_UL:
         tgen_ext32u(s, TCG_REG_R4, data_reg);
         break;
-    case MO_Q:
+    case MO_UQ:
         tcg_out_mov(s, TCG_TYPE_I64, TCG_REG_R4, data_reg);
         break;
     default:
-- 
2.33.0


