Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrFdX-0008Cc-5k
	for mharc-qemu-riscv@gnu.org; Thu, 10 Jun 2021 04:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrFdS-00087x-Ev; Thu, 10 Jun 2021 04:01:54 -0400
Received: from out28-217.mail.aliyun.com ([115.124.28.217]:51464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrFdP-0007Ne-4V; Thu, 10 Jun 2021 04:01:54 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.387086-0.000726307-0.612188;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047202; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KQMTrU3_1623312106; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KQMTrU3_1623312106)
 by smtp.aliyun-inc.com(10.147.44.129);
 Thu, 10 Jun 2021 16:01:46 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v2 05/37] target/riscv: SIMD 16-bit Shift Instructions
Date: Thu, 10 Jun 2021 15:58:36 +0800
Message-Id: <20210610075908.3305506-6-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
References: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.217; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-217.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 10 Jun 2021 08:01:55 -0000

Instructions include right arithmetic shift, right logic shift,
and left shift.

The shift can be an immediate or a register scalar. The
right shift has rounding operation. And the left shift
has saturation operation.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 include/tcg/tcg-op-gvec.h               |   9 ++
 target/riscv/helper.h                   |   9 ++
 target/riscv/insn32.decode              |  17 ++++
 target/riscv/insn_trans/trans_rvp.c.inc |  59 ++++++++++++++
 target/riscv/packed_helper.c            | 104 ++++++++++++++++++++++++
 tcg/tcg-op-gvec.c                       |  28 +++++++
 6 files changed, 226 insertions(+)

diff --git a/include/tcg/tcg-op-gvec.h b/include/tcg/tcg-op-gvec.h
index 392c0f95a4..72cf697646 100644
--- a/include/tcg/tcg-op-gvec.h
+++ b/include/tcg/tcg-op-gvec.h
@@ -398,10 +398,13 @@ void tcg_gen_vec_sub32_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b);
 
 void tcg_gen_vec_shl8i_i64(TCGv_i64 d, TCGv_i64 a, int64_t);
 void tcg_gen_vec_shl16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t);
+void tcg_gen_vec_shl16i_i32(TCGv_i32 d, TCGv_i32 a, int32_t);
 void tcg_gen_vec_shr8i_i64(TCGv_i64 d, TCGv_i64 a, int64_t);
 void tcg_gen_vec_shr16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t);
+void tcg_gen_vec_shr16i_i32(TCGv_i32 d, TCGv_i32 a, int32_t);
 void tcg_gen_vec_sar8i_i64(TCGv_i64 d, TCGv_i64 a, int64_t);
 void tcg_gen_vec_sar16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t);
+void tcg_gen_vec_sar16i_i32(TCGv_i32 d, TCGv_i32 a, int32_t);
 void tcg_gen_vec_rotl8i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c);
 void tcg_gen_vec_rotl16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c);
 
@@ -410,11 +413,17 @@ void tcg_gen_vec_rotl16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c);
 #define tcg_gen_vec_sub16_tl tcg_gen_vec_sub16_i64
 #define tcg_gen_vec_add8_tl  tcg_gen_vec_add8_i64
 #define tcg_gen_vec_sub8_tl  tcg_gen_vec_sub8_i64
+#define tcg_gen_vec_shl16i_tl tcg_gen_vec_shl16i_i64
+#define tcg_gen_vec_shr16i_tl tcg_gen_vec_shr16i_i64
+#define tcg_gen_vec_sar16i_tl tcg_gen_vec_sar16i_i64
 #else
 #define tcg_gen_vec_add16_tl tcg_gen_vec_add16_i32
 #define tcg_gen_vec_sub16_tl tcg_gen_vec_sub16_i32
 #define tcg_gen_vec_add8_tl  tcg_gen_vec_add8_i32
 #define tcg_gen_vec_sub8_tl  tcg_gen_vec_sub8_i32
+#define tcg_gen_vec_shl16i_tl tcg_gen_vec_shl16i_i32
+#define tcg_gen_vec_shr16i_tl tcg_gen_vec_shr16i_i32
+#define tcg_gen_vec_sar16i_tl tcg_gen_vec_sar16i_i32
 #endif
 
 #endif
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 629ff13402..de7b4fc17d 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1188,3 +1188,12 @@ DEF_HELPER_3(rsub8, tl, env, tl, tl)
 DEF_HELPER_3(ursub8, tl, env, tl, tl)
 DEF_HELPER_3(ksub8, tl, env, tl, tl)
 DEF_HELPER_3(uksub8, tl, env, tl, tl)
+
+DEF_HELPER_3(sra16, tl, env, tl, tl)
+DEF_HELPER_3(sra16_u, tl, env, tl, tl)
+DEF_HELPER_3(srl16, tl, env, tl, tl)
+DEF_HELPER_3(srl16_u, tl, env, tl, tl)
+DEF_HELPER_3(sll16, tl, env, tl, tl)
+DEF_HELPER_3(ksll16, tl, env, tl, tl)
+DEF_HELPER_3(kslra16, tl, env, tl, tl)
+DEF_HELPER_3(kslra16_u, tl, env, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 13e1222296..44c497f28a 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -24,6 +24,7 @@
 %sh5       20:5
 
 %sh7    20:7
+%sh4    20:4
 %csr    20:12
 %rm     12:3
 %nf     29:3                     !function=ex_plus_1
@@ -61,6 +62,7 @@
 @j       ....................      ..... ....... &j      imm=%imm_j          %rd
 
 @sh      ......  ...... .....  ... ..... ....... &shift  shamt=%sh7     %rs1 %rd
+@sh4     ......  ...... .....  ... ..... ....... &shift  shamt=%sh4      %rs1 %rd
 @csr     ............   .....  ... ..... .......               %csr     %rs1 %rd
 
 @atom_ld ..... aq:1 rl:1 ..... ........ ..... ....... &atomic rs2=0     %rs1 %rd
@@ -775,3 +777,18 @@ rsub8      0000101  ..... ..... 000 ..... 1110111 @r
 ursub8     0010101  ..... ..... 000 ..... 1110111 @r
 ksub8      0001101  ..... ..... 000 ..... 1110111 @r
 uksub8     0011101  ..... ..... 000 ..... 1110111 @r
+
+sra16      0101000  ..... ..... 000 ..... 1110111 @r
+sra16_u    0110000  ..... ..... 000 ..... 1110111 @r
+srai16     0111000  0.... ..... 000 ..... 1110111 @sh4
+srai16_u   0111000  1.... ..... 000 ..... 1110111 @sh4
+srl16      0101001  ..... ..... 000 ..... 1110111 @r
+srl16_u    0110001  ..... ..... 000 ..... 1110111 @r
+srli16     0111001  0.... ..... 000 ..... 1110111 @sh4
+srli16_u   0111001  1.... ..... 000 ..... 1110111 @sh4
+sll16      0101010  ..... ..... 000 ..... 1110111 @r
+slli16     0111010  0.... ..... 000 ..... 1110111 @sh4
+ksll16     0110010  ..... ..... 000 ..... 1110111 @r
+kslli16    0111010  1.... ..... 000 ..... 1110111 @sh4
+kslra16    0101011  ..... ..... 000 ..... 1110111 @r
+kslra16_u  0110011  ..... ..... 000 ..... 1110111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 80bec35ac9..afafa49824 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -128,3 +128,62 @@ GEN_RVP_R_OOL(rsub8);
 GEN_RVP_R_OOL(ursub8);
 GEN_RVP_R_OOL(ksub8);
 GEN_RVP_R_OOL(uksub8);
+
+/* 16-bit Shift Instructions */
+GEN_RVP_R_OOL(sra16);
+GEN_RVP_R_OOL(srl16);
+GEN_RVP_R_OOL(sll16);
+GEN_RVP_R_OOL(sra16_u);
+GEN_RVP_R_OOL(srl16_u);
+GEN_RVP_R_OOL(ksll16);
+GEN_RVP_R_OOL(kslra16);
+GEN_RVP_R_OOL(kslra16_u);
+
+static bool
+rvp_shifti_ool(DisasContext *ctx, arg_shift *a,
+               void (* fn)(TCGv, TCGv_ptr, TCGv, TCGv))
+{
+    TCGv src1, dst, shift;
+
+    src1 = tcg_temp_new();
+    dst = tcg_temp_new();
+
+    gen_get_gpr(src1, a->rs1);
+    shift = tcg_const_tl(a->shamt);
+    fn(dst, cpu_env, src1, shift);
+    gen_set_gpr(a->rd, dst);
+
+    tcg_temp_free(src1);
+    tcg_temp_free(dst);
+    tcg_temp_free(shift);
+    return true;
+}
+
+static inline bool
+rvp_shifti(DisasContext *ctx, arg_shift *a,
+           void (* vecop)(TCGv, TCGv, target_long),
+           void (* op)(TCGv, TCGv_ptr, TCGv, TCGv))
+{
+    if (!has_ext(ctx, RVP)) {
+        return false;
+    }
+
+    if (a->rd && a->rs1 && vecop) {
+        vecop(cpu_gpr[a->rd], cpu_gpr[a->rs1], a->shamt);
+        return true;
+    }
+    return rvp_shifti_ool(ctx, a, op);
+}
+
+#define GEN_RVP_SHIFTI(NAME, VECOP, OP)                  \
+static bool trans_##NAME(DisasContext *s, arg_shift *a)  \
+{                                                        \
+    return rvp_shifti(s, a, VECOP, OP);                  \
+}
+
+GEN_RVP_SHIFTI(srai16, tcg_gen_vec_sar16i_tl, gen_helper_sra16);
+GEN_RVP_SHIFTI(srli16, tcg_gen_vec_shr16i_tl, gen_helper_srl16);
+GEN_RVP_SHIFTI(slli16, tcg_gen_vec_shl16i_tl, gen_helper_sll16);
+GEN_RVP_SHIFTI(srai16_u, NULL, gen_helper_sra16_u);
+GEN_RVP_SHIFTI(srli16_u, NULL, gen_helper_srl16_u);
+GEN_RVP_SHIFTI(kslli16, NULL, gen_helper_ksll16);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index 62db072204..7e31c2fe46 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -425,3 +425,107 @@ static inline void do_uksub8(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR(uksub8, 1, 1);
+
+/* 16-bit Shift Instructions */
+static inline void do_sra16(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    int16_t *d = vd, *a = va;
+    uint8_t shift = *(uint8_t *)vb & 0xf;
+    d[i] = a[i] >> shift;
+}
+
+RVPR(sra16, 1, 2);
+
+static inline void do_srl16(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    uint16_t *d = vd, *a = va;
+    uint8_t shift = *(uint8_t *)vb & 0xf;
+    d[i] = a[i] >> shift;
+}
+
+RVPR(srl16, 1, 2);
+
+static inline void do_sll16(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    uint16_t *d = vd, *a = va;
+    uint8_t shift = *(uint8_t *)vb & 0xf;
+    d[i] = a[i] << shift;
+}
+
+RVPR(sll16, 1, 2);
+
+static inline void do_sra16_u(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int16_t *d = vd, *a = va;
+    uint8_t shift = *(uint8_t *)vb & 0xf;
+
+    d[i] = vssra16(env, 0, a[i], shift);
+}
+
+RVPR(sra16_u, 1, 2);
+
+static inline void do_srl16_u(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    uint16_t *d = vd, *a = va;
+    uint8_t shift = *(uint8_t *)vb & 0xf;
+
+    d[i] = vssrl16(env, 0, a[i], shift);
+}
+
+RVPR(srl16_u, 1, 2);
+
+static inline void do_ksll16(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int16_t *d = vd, *a = va, result;
+    uint8_t shift = *(uint8_t *)vb & 0xf;
+
+    result = a[i] << shift;
+    if (shift > (clrsb32(a[i]) - 16)) {
+        env->vxsat = 0x1;
+        d[i] = (a[i] & INT16_MIN) ? INT16_MIN : INT16_MAX;
+    } else {
+        d[i] = result;
+    }
+}
+
+RVPR(ksll16, 1, 2);
+
+static inline void do_kslra16(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int16_t *d = vd, *a = va;
+    int32_t shift = sextract32((*(target_ulong *)vb), 0, 5);
+
+    if (shift >= 0) {
+        do_ksll16(env, vd, va, vb, i);
+    } else {
+        shift = -shift;
+        shift = (shift == 16) ? 15 : shift;
+        d[i] = a[i] >> shift;
+    }
+}
+
+RVPR(kslra16, 1, 2);
+
+static inline void do_kslra16_u(CPURISCVState *env, void *vd, void *va,
+                                void *vb, uint8_t i)
+{
+    int16_t *d = vd, *a = va;
+    int32_t shift = sextract32((*(uint32_t *)vb), 0, 5);
+
+    if (shift >= 0) {
+        do_ksll16(env, vd, va, vb, i);
+    } else {
+        shift = -shift;
+        shift = (shift == 16) ? 15 : shift;
+        d[i] = vssra16(env, 0, a[i], shift);
+    }
+}
+
+RVPR(kslra16_u, 1, 2);
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index 484ced3054..cf1357cee1 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -2687,6 +2687,13 @@ void tcg_gen_vec_shl16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c)
     tcg_gen_andi_i64(d, d, mask);
 }
 
+void tcg_gen_vec_shl16i_i32(TCGv_i32 d, TCGv_i32 a, int32_t c)
+{
+    uint32_t mask = dup_const(MO_16, 0xffff << c);
+    tcg_gen_shli_i32(d, a, c);
+    tcg_gen_andi_i32(d, d, mask);
+}
+
 void tcg_gen_gvec_shli(unsigned vece, uint32_t dofs, uint32_t aofs,
                        int64_t shift, uint32_t oprsz, uint32_t maxsz)
 {
@@ -2738,6 +2745,13 @@ void tcg_gen_vec_shr16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c)
     tcg_gen_andi_i64(d, d, mask);
 }
 
+void tcg_gen_vec_shr16i_i32(TCGv_i32 d, TCGv_i32 a, int32_t c)
+{
+    uint32_t mask = dup_const(MO_16, 0xffff >> c);
+    tcg_gen_shri_i32(d, a, c);
+    tcg_gen_andi_i32(d, d, mask);
+}
+
 void tcg_gen_gvec_shri(unsigned vece, uint32_t dofs, uint32_t aofs,
                        int64_t shift, uint32_t oprsz, uint32_t maxsz)
 {
@@ -2803,6 +2817,20 @@ void tcg_gen_vec_sar16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c)
     tcg_temp_free_i64(s);
 }
 
+void tcg_gen_vec_sar16i_i32(TCGv_i32 d, TCGv_i32 a, int32_t c)
+{
+    uint32_t s_mask = dup_const(MO_16, 0x8000 >> c);
+    uint32_t c_mask = dup_const(MO_16, 0xffff >> c);
+    TCGv_i32 s = tcg_temp_new_i32();
+
+    tcg_gen_shri_i32(d, a, c);
+    tcg_gen_andi_i32(s, d, s_mask);  /* isolate (shifted) sign bit */
+    tcg_gen_andi_i32(d, d, c_mask);  /* clear out bits above sign  */
+    tcg_gen_muli_i32(s, s, (2 << c) - 2); /* replicate isolated signs */
+    tcg_gen_or_i32(d, d, s);         /* include sign extension */
+    tcg_temp_free_i32(s);
+}
+
 void tcg_gen_gvec_sari(unsigned vece, uint32_t dofs, uint32_t aofs,
                        int64_t shift, uint32_t oprsz, uint32_t maxsz)
 {
-- 
2.25.1


