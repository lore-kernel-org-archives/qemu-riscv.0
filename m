Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o3BFq-0002G3-Gt
	for mharc-qemu-riscv@gnu.org; Mon, 20 Jun 2022 02:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1o3BFe-0001ts-S5; Mon, 20 Jun 2022 02:51:10 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:49170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1o3BFc-0004N9-9C; Mon, 20 Jun 2022 02:51:10 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 885EE11EF83;
 Mon, 20 Jun 2022 06:50:42 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Subject: [PATCH qemu v6 05/10] target/riscv: rvv: Add mask agnostic for vector
 integer comparison instructions
Message-ID: <165570784143.17634.35095816584573691-5@git.sr.ht>
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
Date: Mon, 20 Jun 2022 06:51:12 -0000
X-Original-Date: Thu, 17 Mar 2022 01:46:28 -0700
X-List-Received-Date: Mon, 20 Jun 2022 06:51:12 -0000

From: Yueh-Ting (eop) Chen <eop.chen@sifive.com>

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/insn_trans/trans_rvv.c.inc |  1 +
 target/riscv/vector_helper.c            | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tran=
s/trans_rvv.c.inc
index 83b85bb851..e6aa5295a1 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1718,6 +1718,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a) =
            \
         data =3D FIELD_DP32(data, VDATA, VTA, s->vta);               \
         data =3D                                                     \
             FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);\
+        data =3D FIELD_DP32(data, VDATA, VMA, s->vma);               \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env,           \
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index d1daa764b7..07ce671879 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1404,12 +1404,17 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void=
 *vs2,   \
     uint32_t vl =3D env->vl;                                    \
     uint32_t total_elems =3D env_archcpu(env)->cfg.vlen;        \
     uint32_t vta_all_1s =3D vext_vta_all_1s(desc);              \
+    uint32_t vma =3D vext_vma(desc);                            \
     uint32_t i;                                               \
                                                               \
     for (i =3D env->vstart; i < vl; i++) {                      \
         ETYPE s1 =3D *((ETYPE *)vs1 + H(i));                    \
         ETYPE s2 =3D *((ETYPE *)vs2 + H(i));                    \
         if (!vm && !vext_elem_mask(v0, i)) {                  \
+            /* set masked-off elements to 1s */               \
+            if (vma) {                                        \
+                vext_set_elem_mask(vd, i, 1);                 \
+            }                                                 \
             continue;                                         \
         }                                                     \
         vext_set_elem_mask(vd, i, DO_OP(s2, s1));             \
@@ -1462,11 +1467,16 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1=
, void *vs2,   \
     uint32_t vl =3D env->vl;                                          \
     uint32_t total_elems =3D env_archcpu(env)->cfg.vlen;              \
     uint32_t vta_all_1s =3D vext_vta_all_1s(desc);                    \
+    uint32_t vma =3D vext_vma(desc);                                  \
     uint32_t i;                                                     \
                                                                     \
     for (i =3D env->vstart; i < vl; i++) {                            \
         ETYPE s2 =3D *((ETYPE *)vs2 + H(i));                          \
         if (!vm && !vext_elem_mask(v0, i)) {                        \
+            /* set masked-off elements to 1s */                     \
+            if (vma) {                                              \
+                vext_set_elem_mask(vd, i, 1);                       \
+            }                                                       \
             continue;                                               \
         }                                                           \
         vext_set_elem_mask(vd, i,                                   \
--=20
2.34.2


