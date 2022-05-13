Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1npTwG-0000dK-4R
	for mharc-qemu-riscv@gnu.org; Fri, 13 May 2022 07:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1npTvy-0000MK-Sd; Fri, 13 May 2022 07:58:17 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:45434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1npTvv-00028F-1x; Fri, 13 May 2022 07:58:13 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 0D79011F113;
 Fri, 13 May 2022 11:58:10 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Subject: [PATCH qemu v4 04/10] target/riscv: rvv: Add mask agnostic for vector
 integer shift instructions
Message-ID: <165244308918.21805.1094821418229175817-4@git.sr.ht>
X-Mailer: git.sr.ht
Reply-to: ~eopxd <yueh.ting.chen@gmail.com>
In-Reply-To: <165244308918.21805.1094821418229175817-0@git.sr.ht>
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
Date: Fri, 13 May 2022 11:58:22 -0000
X-Original-Date: Thu, 17 Mar 2022 01:43:10 -0700
X-List-Received-Date: Fri, 13 May 2022 11:58:22 -0000

From: Yueh-Ting (eop) Chen <eop.chen@sifive.com>

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 1 +
 target/riscv/vector_helper.c            | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tran=
s/trans_rvv.c.inc
index a0ffb86974..22f8dc6f0e 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1897,6 +1897,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a) =
            \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         data =3D FIELD_DP32(data, VDATA, VTA, s->vta);               \
+        data =3D FIELD_DP32(data, VDATA, VMA, s->vma);               \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env,           \
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 7da3938905..667a66afa3 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1297,10 +1297,13 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,     =
                     \
     uint32_t esz =3D sizeof(TS1);                                           \
     uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);          \
     uint32_t vta =3D vext_vta(desc);                                        \
+    uint32_t vma =3D vext_vma(desc);                                        \
     uint32_t i;                                                           \
                                                                           \
     for (i =3D env->vstart; i < vl; i++) {                                  \
         if (!vm && !vext_elem_mask(v0, i)) {                              \
+            /* set masked-off elements to 1s */                           \
+            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);           \
             continue;                                                     \
         }                                                                 \
         TS1 s1 =3D *((TS1 *)vs1 + HS1(i));                                  \
@@ -1338,10 +1341,14 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1=
,      \
     uint32_t total_elems =3D                                  \
         vext_get_total_elems(env, desc, esz);               \
     uint32_t vta =3D vext_vta(desc);                          \
+    uint32_t vma =3D vext_vma(desc);                          \
     uint32_t i;                                             \
                                                             \
     for (i =3D env->vstart; i < vl; i++) {                    \
         if (!vm && !vext_elem_mask(v0, i)) {                \
+            /* set masked-off elements to 1s */             \
+            vext_set_elems_1s(vd, vma, i * esz,             \
+                              (i + 1) * esz);               \
             continue;                                       \
         }                                                   \
         TS2 s2 =3D *((TS2 *)vs2 + HS2(i));                    \
--=20
2.34.2


