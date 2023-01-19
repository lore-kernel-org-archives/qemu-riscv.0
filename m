Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIW2T-000825-RO
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 09:37:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pIW1U-0007A7-6o
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 09:36:15 -0500
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pIW1M-0006zG-KZ
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 09:36:10 -0500
Received: from [167.98.27.226] (helo=lawrence-thinkpad.office.codethink.co.uk)
 by imap4.hz.codethink.co.uk with esmtpsa (Exim 4.94.2 #2 (Debian))
 id 1pIW1E-007gSL-4N; Thu, 19 Jan 2023 14:35:57 +0000
From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
To: qemu-riscv@nongnu.org
Cc: dickon.hood@codethink.co.uk, frank.chang@sifive.com,
 Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
Subject: [RFC PATCH 06/39] target/riscv: Add vrol.[vv, vx] and vror.[vv, vx,
 vi] decoding, translation and execution support
Date: Thu, 19 Jan 2023 14:34:55 +0000
Message-Id: <20230119143528.1290950-7-lawrence.hunter@codethink.co.uk>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230119143528.1290950-1-lawrence.hunter@codethink.co.uk>
References: <20230119143528.1290950-1-lawrence.hunter@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.40.203.114;
 envelope-from=lawrence.hunter@codethink.co.uk; helo=imap4.hz.codethink.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Thu, 19 Jan 2023 14:36:16 -0000

From: Dickon Hood <dickon.hood@codethink.co.uk>

Add an initial implementation of the vrol.* and vror.* instructions,
with mappings between the RISC-V instructions and their internal TCG
accelerated implmentations.

There are some missing ror helpers, so I've bodged it by converting them
to rols.

Co-authored-by: Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
Signed-off-by: Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
Signed-off-by: Dickon Hood <dickon.hood@codethink.co.uk>
---
 target/riscv/helper.h                      | 20 ++++++++
 target/riscv/insn32.decode                 |  6 +++
 target/riscv/insn_trans/trans_rvzvkb.c.inc | 20 ++++++++
 target/riscv/vcrypto_helper.c              | 58 ++++++++++++++++++++++
 target/riscv/vector_helper.c               | 45 -----------------
 target/riscv/vector_internals.h            | 52 +++++++++++++++++++
 6 files changed, 156 insertions(+), 45 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 32f1179e29..e5b6b3360f 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1142,3 +1142,23 @@ DEF_HELPER_6(vclmul_vv, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vclmul_vx, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vclmulh_vv, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vclmulh_vx, void, ptr, ptr, tl, ptr, env, i32)
+
+DEF_HELPER_6(vror_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vror_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vror_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vror_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_6(vror_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vror_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vror_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vror_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+
+DEF_HELPER_6(vrol_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vrol_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vrol_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vrol_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_6(vrol_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vrol_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vrol_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vrol_vx_d, void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index b4d88dd1cb..725f907ad1 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -896,3 +896,9 @@ vclmul_vv       001100 . ..... ..... 010 ..... 1010111 @r_vm
 vclmul_vx       001100 . ..... ..... 110 ..... 1010111 @r_vm
 vclmulh_vv      001101 . ..... ..... 010 ..... 1010111 @r_vm
 vclmulh_vx      001101 . ..... ..... 110 ..... 1010111 @r_vm
+vrol_vv         010101 . ..... ..... 000 ..... 1010111 @r_vm
+vrol_vx         010101 . ..... ..... 100 ..... 1010111 @r_vm
+vror_vv         010100 . ..... ..... 000 ..... 1010111 @r_vm
+vror_vx         010100 . ..... ..... 100 ..... 1010111 @r_vm
+vror_vi         010100 . ..... ..... 011 ..... 1010111 @r_vm
+vror_vi2        010101 . ..... ..... 011 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvzvkb.c.inc b/target/riscv/insn_trans/trans_rvzvkb.c.inc
index 533141e559..d2a7a92d42 100644
--- a/target/riscv/insn_trans/trans_rvzvkb.c.inc
+++ b/target/riscv/insn_trans/trans_rvzvkb.c.inc
@@ -95,3 +95,23 @@ static bool vclmul_vx_check(DisasContext *s, arg_rmrr *a)
 
 GEN_VX_MASKED_TRANS(vclmul_vx, vclmul_vx_check)
 GEN_VX_MASKED_TRANS(vclmulh_vx, vclmul_vx_check)
+
+GEN_OPIVV_TRANS(vror_vv, zvkb_vv_check)
+GEN_OPIVX_TRANS(vror_vx, zvkb_vx_check)
+GEN_OPIVV_TRANS(vrol_vv, zvkb_vv_check)
+GEN_OPIVX_TRANS(vrol_vx, zvkb_vx_check)
+
+GEN_OPIVI_TRANS(vror_vi, IMM_TRUNC_SEW, vror_vx, zvkb_vx_check)
+
+/*
+ * Immediates are 5b long, and we need six for the rotate-immediate.  The
+ * decision has been taken to remove the vrol.vi instruction -- you can
+ * emulate it with a ror, after all -- and use the bottom bit of the funct6
+ * part of the opcode to encode the extra bit.  I've chosen to implement it
+ * like this because it's easy and reasonably clean.
+ */
+static bool trans_vror_vi2(DisasContext *s, arg_rmrr *a)
+{
+    a->rs1 += 32;
+    return trans_vror_vi(s, a);
+}
diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.c
index 46e2e510c5..7ec75c5589 100644
--- a/target/riscv/vcrypto_helper.c
+++ b/target/riscv/vcrypto_helper.c
@@ -57,3 +57,61 @@ GEN_VEXT_VV(vclmul_vv, 8)
 GEN_VEXT_VX(vclmul_vx, 8)
 GEN_VEXT_VV(vclmulh_vv, 8)
 GEN_VEXT_VX(vclmulh_vx, 8)
+
+/*
+ *  Looks a mess, but produces reasonable (aarch32) code on clang:
+ * https://godbolt.org/z/jchjsTda8
+ */
+#define DO_ROR(x, n)                       \
+    ((x >> (n & ((sizeof(x) << 3) - 1))) | \
+     (x << ((sizeof(x) << 3) - (n & ((sizeof(x) << 3) - 1)))))
+#define DO_ROL(x, n)                       \
+    ((x << (n & ((sizeof(x) << 3) - 1))) | \
+     (x >> ((sizeof(x) << 3) - (n & ((sizeof(x) << 3) - 1)))))
+
+RVVCALL(OPIVV2, vror_vv_b, OP_UUU_B, H1, H1, H1, DO_ROR)
+RVVCALL(OPIVV2, vror_vv_h, OP_UUU_H, H2, H2, H2, DO_ROR)
+RVVCALL(OPIVV2, vror_vv_w, OP_UUU_W, H4, H4, H4, DO_ROR)
+RVVCALL(OPIVV2, vror_vv_d, OP_UUU_D, H8, H8, H8, DO_ROR)
+GEN_VEXT_VV(vror_vv_b, 1)
+GEN_VEXT_VV(vror_vv_h, 2)
+GEN_VEXT_VV(vror_vv_w, 4)
+GEN_VEXT_VV(vror_vv_d, 8)
+
+/*
+ * There's a missing tcg_gen_gvec_rotrs() helper function.
+ */
+#define GEN_VEXT_VX_RTOL(NAME, ESZ)                                      \
+void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,        \
+                  CPURISCVState *env, uint32_t desc)                     \
+{                                                                        \
+    do_vext_vx(vd, v0, (ESZ << 3) - s1, vs2, env, desc, do_##NAME, ESZ); \
+}
+
+/* DO_ROL because GEN_VEXT_VX_RTOL() converts from R to L */
+RVVCALL(OPIVX2, vror_vx_b, OP_UUU_B, H1, H1, DO_ROL)
+RVVCALL(OPIVX2, vror_vx_h, OP_UUU_H, H2, H2, DO_ROL)
+RVVCALL(OPIVX2, vror_vx_w, OP_UUU_W, H4, H4, DO_ROL)
+RVVCALL(OPIVX2, vror_vx_d, OP_UUU_D, H8, H8, DO_ROL)
+GEN_VEXT_VX_RTOL(vror_vx_b, 1)
+GEN_VEXT_VX_RTOL(vror_vx_h, 2)
+GEN_VEXT_VX_RTOL(vror_vx_w, 4)
+GEN_VEXT_VX_RTOL(vror_vx_d, 8)
+
+RVVCALL(OPIVV2, vrol_vv_b, OP_UUU_B, H1, H1, H1, DO_ROL)
+RVVCALL(OPIVV2, vrol_vv_h, OP_UUU_H, H2, H2, H2, DO_ROL)
+RVVCALL(OPIVV2, vrol_vv_w, OP_UUU_W, H4, H4, H4, DO_ROL)
+RVVCALL(OPIVV2, vrol_vv_d, OP_UUU_D, H8, H8, H8, DO_ROL)
+GEN_VEXT_VV(vrol_vv_b, 1)
+GEN_VEXT_VV(vrol_vv_h, 2)
+GEN_VEXT_VV(vrol_vv_w, 4)
+GEN_VEXT_VV(vrol_vv_d, 8)
+
+RVVCALL(OPIVX2, vrol_vx_b, OP_UUU_B, H1, H1, DO_ROL)
+RVVCALL(OPIVX2, vrol_vx_h, OP_UUU_H, H2, H2, DO_ROL)
+RVVCALL(OPIVX2, vrol_vx_w, OP_UUU_W, H4, H4, DO_ROL)
+RVVCALL(OPIVX2, vrol_vx_d, OP_UUU_D, H8, H8, DO_ROL)
+GEN_VEXT_VX(vrol_vx_b, 1)
+GEN_VEXT_VX(vrol_vx_h, 2)
+GEN_VEXT_VX(vrol_vx_w, 4)
+GEN_VEXT_VX(vrol_vx_d, 8)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index ab470092f6..ff7b03cbe3 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -76,26 +76,6 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
     return vl;
 }
 
-/*
- * Note that vector data is stored in host-endian 64-bit chunks,
- * so addressing units smaller than that needs a host-endian fixup.
- */
-#if HOST_BIG_ENDIAN
-#define H1(x)   ((x) ^ 7)
-#define H1_2(x) ((x) ^ 6)
-#define H1_4(x) ((x) ^ 4)
-#define H2(x)   ((x) ^ 3)
-#define H4(x)   ((x) ^ 1)
-#define H8(x)   ((x))
-#else
-#define H1(x)   (x)
-#define H1_2(x) (x)
-#define H1_4(x) (x)
-#define H2(x)   (x)
-#define H4(x)   (x)
-#define H8(x)   (x)
-#endif
-
 /*
  * Get the maximum number of elements can be operated.
  *
@@ -683,18 +663,11 @@ GEN_VEXT_ST_WHOLE(vs8r_v, int8_t, ste_b)
  *** Vector Integer Arithmetic Instructions
  */
 
-/* expand macro args before macro */
-#define RVVCALL(macro, ...)  macro(__VA_ARGS__)
-
 /* (TD, T1, T2, TX1, TX2) */
 #define OP_SSS_B int8_t, int8_t, int8_t, int8_t, int8_t
 #define OP_SSS_H int16_t, int16_t, int16_t, int16_t, int16_t
 #define OP_SSS_W int32_t, int32_t, int32_t, int32_t, int32_t
 #define OP_SSS_D int64_t, int64_t, int64_t, int64_t, int64_t
-#define OP_UUU_B uint8_t, uint8_t, uint8_t, uint8_t, uint8_t
-#define OP_UUU_H uint16_t, uint16_t, uint16_t, uint16_t, uint16_t
-#define OP_UUU_W uint32_t, uint32_t, uint32_t, uint32_t, uint32_t
-#define OP_UUU_D uint64_t, uint64_t, uint64_t, uint64_t, uint64_t
 #define OP_SUS_B int8_t, uint8_t, int8_t, uint8_t, int8_t
 #define OP_SUS_H int16_t, uint16_t, int16_t, uint16_t, int16_t
 #define OP_SUS_W int32_t, uint32_t, int32_t, uint32_t, int32_t
@@ -718,14 +691,6 @@ GEN_VEXT_ST_WHOLE(vs8r_v, int8_t, ste_b)
 #define NOP_UUU_H uint16_t, uint16_t, uint32_t, uint16_t, uint32_t
 #define NOP_UUU_W uint32_t, uint32_t, uint64_t, uint32_t, uint64_t
 
-
-#define OPIVV2(NAME, TD, T1, T2, TX1, TX2, HD, HS1, HS2, OP)    \
-static void do_##NAME(void *vd, void *vs1, void *vs2, int i)    \
-{                                                               \
-    TX1 s1 = *((T1 *)vs1 + HS1(i));                             \
-    TX2 s2 = *((T2 *)vs2 + HS2(i));                             \
-    *((TD *)vd + HD(i)) = OP(s2, s1);                           \
-}
 #define DO_SUB(N, M) (N - M)
 #define DO_RSUB(N, M) (M - N)
 
@@ -747,16 +712,6 @@ GEN_VEXT_VV(vsub_vv_h, 2)
 GEN_VEXT_VV(vsub_vv_w, 4)
 GEN_VEXT_VV(vsub_vv_d, 8)
 
-/*
- * (T1)s1 gives the real operator type.
- * (TX1)(T1)s1 expands the operator type of widen or narrow operations.
- */
-#define OPIVX2(NAME, TD, T1, T2, TX1, TX2, HD, HS2, OP)             \
-static void do_##NAME(void *vd, target_long s1, void *vs2, int i)   \
-{                                                                   \
-    TX2 s2 = *((T2 *)vs2 + HS2(i));                                 \
-    *((TD *)vd + HD(i)) = OP(s2, (TX1)(T1)s1);                      \
-}
 
 RVVCALL(OPIVX2, vadd_vx_b, OP_SSS_B, H1, H1, DO_ADD)
 RVVCALL(OPIVX2, vadd_vx_h, OP_SSS_H, H2, H2, DO_ADD)
diff --git a/target/riscv/vector_internals.h b/target/riscv/vector_internals.h
index 49529d2379..a0fbac7bf3 100644
--- a/target/riscv/vector_internals.h
+++ b/target/riscv/vector_internals.h
@@ -28,6 +28,26 @@ static inline uint32_t vext_nf(uint32_t desc)
     return FIELD_EX32(simd_data(desc), VDATA, NF);
 }
 
+/*
+ * Note that vector data is stored in host-endian 64-bit chunks,
+ * so addressing units smaller than that needs a host-endian fixup.
+ */
+#if HOST_BIG_ENDIAN
+#define H1(x)   ((x) ^ 7)
+#define H1_2(x) ((x) ^ 6)
+#define H1_4(x) ((x) ^ 4)
+#define H2(x)   ((x) ^ 3)
+#define H4(x)   ((x) ^ 1)
+#define H8(x)   ((x))
+#else
+#define H1(x)   (x)
+#define H1_2(x) (x)
+#define H1_4(x) (x)
+#define H2(x)   (x)
+#define H4(x)   (x)
+#define H8(x)   (x)
+#endif
+
 /*
  * Encode LMUL to lmul as following:
  *     LMUL    vlmul    lmul
@@ -96,9 +116,30 @@ static inline uint32_t vext_get_total_elems(CPURISCVState *env, uint32_t desc,
 void vext_set_elems_1s(void *base, uint32_t is_agnostic, uint32_t cnt,
                        uint32_t tot);
 
+/*
+ *** Vector Integer Arithmetic Instructions
+ */
+
+/* expand macro args before macro */
+#define RVVCALL(macro, ...)  macro(__VA_ARGS__)
+
+/* (TD, T1, T2, TX1, TX2) */
+#define OP_UUU_B uint8_t, uint8_t, uint8_t, uint8_t, uint8_t
+#define OP_UUU_H uint16_t, uint16_t, uint16_t, uint16_t, uint16_t
+#define OP_UUU_W uint32_t, uint32_t, uint32_t, uint32_t, uint32_t
+#define OP_UUU_D uint64_t, uint64_t, uint64_t, uint64_t, uint64_t
+
 /* operation of two vector elements */
 typedef void opivv2_fn(void *vd, void *vs1, void *vs2, int i);
 
+#define OPIVV2(NAME, TD, T1, T2, TX1, TX2, HD, HS1, HS2, OP)    \
+static void do_##NAME(void *vd, void *vs1, void *vs2, int i)    \
+{                                                               \
+    TX1 s1 = *((T1 *)vs1 + HS1(i));                             \
+    TX2 s2 = *((T2 *)vs2 + HS2(i));                             \
+    *((TD *)vd + HD(i)) = OP(s2, s1);                           \
+}
+
 void do_vext_vv(void *vd, void *v0, void *vs1, void *vs2,
                 CPURISCVState *env, uint32_t desc,
                 opivv2_fn *fn, uint32_t esz);
@@ -115,6 +156,17 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
 
 typedef void opivx2_fn(void *vd, target_long s1, void *vs2, int i);
 
+/*
+ * (T1)s1 gives the real operator type.
+ * (TX1)(T1)s1 expands the operator type of widen or narrow operations.
+ */
+#define OPIVX2(NAME, TD, T1, T2, TX1, TX2, HD, HS2, OP)             \
+static void do_##NAME(void *vd, target_long s1, void *vs2, int i)   \
+{                                                                   \
+    TX2 s2 = *((T2 *)vs2 + HS2(i));                                 \
+    *((TD *)vd + HD(i)) = OP(s2, (TX1)(T1)s1);                      \
+}
+
 void do_vext_vx(void *vd, void *v0, target_long s1, void *vs2,
                 CPURISCVState *env, uint32_t desc,
                 opivx2_fn fn, uint32_t esz);
-- 
2.39.1


