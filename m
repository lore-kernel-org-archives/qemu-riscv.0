Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o3BFZ-0001l3-Ef
	for mharc-qemu-riscv@gnu.org; Mon, 20 Jun 2022 02:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1o3BFU-0001gc-34; Mon, 20 Jun 2022 02:51:01 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:49162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1o3BFQ-0004Gw-Po; Mon, 20 Jun 2022 02:50:59 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id EE40811EF53;
 Mon, 20 Jun 2022 06:50:41 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Subject: [PATCH qemu v6 01/10] target/riscv: rvv: Add mask agnostic for vv
 instructions
Message-ID: <165570784143.17634.35095816584573691-1@git.sr.ht>
X-Mailer: git.sr.ht
Reply-to: ~eopxd <yueh.ting.chen@gmail.com>
In-Reply-To: <165570784143.17634.35095816584573691-0@git.sr.ht>
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>,
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 36
X-Spam_score: 3.6
X-Spam_bar: +++
X-Spam_report: (3.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 FREEMAIL_FORGED_REPLYTO=2.095, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Date: Mon, 20 Jun 2022 06:51:03 -0000
X-Original-Date: Thu, 17 Mar 2022 00:26:23 -0700
X-List-Received-Date: Mon, 20 Jun 2022 06:51:03 -0000

From: Yueh-Ting (eop) Chen <eop.chen@sifive.com>

According to v-spec, mask agnostic behavior can be either kept as
undisturbed or set elements' bits to all 1s. To distinguish the
difference of mask policies, QEMU should be able to simulate the mask
agnostic behavior as "set mask elements' bits to all 1s".

There are multiple possibility for agnostic elements according to
v-spec. The main intent of this patch-set tries to add option that
can distinguish between mask policies. Setting agnostic elements to
all 1s allows QEMU to express this.

This is the first commit regarding the optional mask agnostic
behavior. Follow-up commits will add this optional behavior
for all rvv instructions.

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.h                      | 2 ++
 target/riscv/cpu_helper.c               | 2 ++
 target/riscv/insn_trans/trans_rvv.c.inc | 3 +++
 target/riscv/internals.h                | 5 +++--
 target/riscv/translate.c                | 2 ++
 target/riscv/vector_helper.c            | 8 ++++++++
 6 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7d6397acdf..d53d1caa8b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -413,6 +413,7 @@ struct RISCVCPUConfig {
     bool ext_zve64f;
     bool ext_zmmul;
     bool rvv_ta_all_1s;
+    bool rvv_ma_all_1s;
=20
     uint32_t mvendorid;
     uint64_t marchid;
@@ -569,6 +570,7 @@ FIELD(TB_FLAGS, XL, 20, 2)
 FIELD(TB_FLAGS, PM_MASK_ENABLED, 22, 1)
 FIELD(TB_FLAGS, PM_BASE_ENABLED, 23, 1)
 FIELD(TB_FLAGS, VTA, 24, 1)
+FIELD(TB_FLAGS, VMA, 25, 1)
=20
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 4a6700c890..224653f609 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -67,6 +67,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong =
*pc,
         flags =3D FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
         flags =3D FIELD_DP32(flags, TB_FLAGS, VTA,
                     FIELD_EX64(env->vtype, VTYPE, VTA));
+        flags =3D FIELD_DP32(flags, TB_FLAGS, VMA,
+                    FIELD_EX64(env->vtype, VTYPE, VMA));
     } else {
         flags =3D FIELD_DP32(flags, TB_FLAGS, VILL, 1);
     }
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tran=
s/trans_rvv.c.inc
index 6c091824b6..5ec113f6fd 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1247,6 +1247,7 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen3Fn =
*gvec_fn,
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
         data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
+        data =3D FIELD_DP32(data, VDATA, VMA, s->vma);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
                            cpu_env, s->cfg_ptr->vlen / 8,
@@ -1545,6 +1546,7 @@ static bool do_opivv_widen(DisasContext *s, arg_rmrr *a,
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
         data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
+        data =3D FIELD_DP32(data, VDATA, VMA, s->vma);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1),
                            vreg_ofs(s, a->rs2),
@@ -1627,6 +1629,7 @@ static bool do_opiwv_widen(DisasContext *s, arg_rmrr *a,
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
         data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
+        data =3D FIELD_DP32(data, VDATA, VMA, s->vma);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1),
                            vreg_ofs(s, a->rs2),
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 193ce57a6d..5620fbffb6 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -26,8 +26,9 @@ FIELD(VDATA, VM, 0, 1)
 FIELD(VDATA, LMUL, 1, 3)
 FIELD(VDATA, VTA, 4, 1)
 FIELD(VDATA, VTA_ALL_1S, 5, 1)
-FIELD(VDATA, NF, 6, 4)
-FIELD(VDATA, WD, 6, 1)
+FIELD(VDATA, VMA, 6, 1)
+FIELD(VDATA, NF, 7, 4)
+FIELD(VDATA, WD, 7, 1)
=20
 /* float point classify helpers */
 target_ulong fclass_h(uint64_t frs1);
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index b151c20674..b58f32ae93 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -95,6 +95,7 @@ typedef struct DisasContext {
     int8_t lmul;
     uint8_t sew;
     uint8_t vta;
+    uint8_t vma;
     bool cfg_vta_all_1s;
     target_ulong vstart;
     bool vl_eq_vlmax;
@@ -1102,6 +1103,7 @@ static void riscv_tr_init_disas_context(DisasContextBas=
e *dcbase, CPUState *cs)
     ctx->sew =3D FIELD_EX32(tb_flags, TB_FLAGS, SEW);
     ctx->lmul =3D sextract32(FIELD_EX32(tb_flags, TB_FLAGS, LMUL), 0, 3);
     ctx->vta =3D FIELD_EX32(tb_flags, TB_FLAGS, VTA) && cpu->cfg.rvv_ta_all_=
1s;
+    ctx->vma =3D FIELD_EX32(tb_flags, TB_FLAGS, VMA) && cpu->cfg.rvv_ma_all_=
1s;
     ctx->cfg_vta_all_1s =3D cpu->cfg.rvv_ta_all_1s;
     ctx->vstart =3D env->vstart;
     ctx->vl_eq_vlmax =3D FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a96fc49c71..de895050e0 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -127,6 +127,11 @@ static inline uint32_t vext_vta(uint32_t desc)
     return FIELD_EX32(simd_data(desc), VDATA, VTA);
 }
=20
+static inline uint32_t vext_vma(uint32_t desc)
+{
+    return FIELD_EX32(simd_data(desc), VDATA, VMA);
+}
+
 static inline uint32_t vext_vta_all_1s(uint32_t desc)
 {
     return FIELD_EX32(simd_data(desc), VDATA, VTA_ALL_1S);
@@ -812,10 +817,13 @@ static void do_vext_vv(void *vd, void *v0, void *vs1, v=
oid *vs2,
     uint32_t vl =3D env->vl;
     uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);
     uint32_t vta =3D vext_vta(desc);
+    uint32_t vma =3D vext_vma(desc);
     uint32_t i;
=20
     for (i =3D env->vstart; i < vl; i++) {
         if (!vm && !vext_elem_mask(v0, i)) {
+            /* set masked-off elements to 1s */
+            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);
             continue;
         }
         fn(vd, vs1, vs2, i);
--=20
2.34.2


