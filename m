Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1noT3y-0008HX-1y
	for mharc-qemu-riscv@gnu.org; Tue, 10 May 2022 12:50:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1noT3q-00086N-9J; Tue, 10 May 2022 12:50:10 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:44954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1noT3n-0005Ja-4h; Tue, 10 May 2022 12:50:09 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 2CC1E11F100;
 Tue, 10 May 2022 16:49:40 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Subject: [PATCH qemu v15 12/15] target/riscv: rvv: Add tail agnostic for
 vector reduction instructions
Message-ID: <165220137795.17881.11560413809338015947-12@git.sr.ht>
X-Mailer: git.sr.ht
Reply-to: ~eopxd <yueh.ting.chen@gmail.com>
In-Reply-To: <165220137795.17881.11560413809338015947-0@git.sr.ht>
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
Date: Tue, 10 May 2022 16:50:11 -0000
X-Original-Date: Mon, 07 Mar 2022 04:21:37 -0800
X-List-Received-Date: Tue, 10 May 2022 16:50:11 -0000

From: eopXD <eop.chen@sifive.com>

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 5acbe68b9b..a86b4a7771 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4537,6 +4537,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,       =
   \
 {                                                         \
     uint32_t vm =3D vext_vm(desc);                          \
     uint32_t vl =3D env->vl;                                \
+    uint32_t esz =3D sizeof(TD);                            \
+    uint32_t vlenb =3D simd_maxsz(desc);                    \
+    uint32_t vta =3D vext_vta(desc);                        \
     uint32_t i;                                           \
     TD s1 =3D  *((TD *)vs1 + HD(0));                        \
                                                           \
@@ -4549,6 +4552,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,       =
   \
     }                                                     \
     *((TD *)vd + HD(0)) =3D s1;                             \
     env->vstart =3D 0;                                      \
+    /* set tail elements to 1s */                         \
+    vext_set_elems_1s(vd, vta, esz, vlenb);               \
 }
=20
 /* vd[0] =3D sum(vs1[0], vs2[*]) */
@@ -4618,6 +4623,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,       =
    \
 {                                                          \
     uint32_t vm =3D vext_vm(desc);                           \
     uint32_t vl =3D env->vl;                                 \
+    uint32_t esz =3D sizeof(TD);                             \
+    uint32_t vlenb =3D simd_maxsz(desc);                     \
+    uint32_t vta =3D vext_vta(desc);                         \
     uint32_t i;                                            \
     TD s1 =3D  *((TD *)vs1 + HD(0));                         \
                                                            \
@@ -4630,6 +4638,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,       =
    \
     }                                                      \
     *((TD *)vd + HD(0)) =3D s1;                              \
     env->vstart =3D 0;                                       \
+    /* set tail elements to 1s */                          \
+    vext_set_elems_1s(vd, vta, esz, vlenb);                \
 }
=20
 /* Unordered sum */
@@ -4654,6 +4664,9 @@ void HELPER(vfwredsum_vs_h)(void *vd, void *v0, void *v=
s1,
 {
     uint32_t vm =3D vext_vm(desc);
     uint32_t vl =3D env->vl;
+    uint32_t esz =3D sizeof(uint32_t);
+    uint32_t vlenb =3D simd_maxsz(desc);
+    uint32_t vta =3D vext_vta(desc);
     uint32_t i;
     uint32_t s1 =3D  *((uint32_t *)vs1 + H4(0));
=20
@@ -4667,6 +4680,8 @@ void HELPER(vfwredsum_vs_h)(void *vd, void *v0, void *v=
s1,
     }
     *((uint32_t *)vd + H4(0)) =3D s1;
     env->vstart =3D 0;
+    /* set tail elements to 1s */
+    vext_set_elems_1s(vd, vta, esz, vlenb);
 }
=20
 void HELPER(vfwredsum_vs_w)(void *vd, void *v0, void *vs1,
@@ -4674,6 +4689,9 @@ void HELPER(vfwredsum_vs_w)(void *vd, void *v0, void *v=
s1,
 {
     uint32_t vm =3D vext_vm(desc);
     uint32_t vl =3D env->vl;
+    uint32_t esz =3D sizeof(uint64_t);
+    uint32_t vlenb =3D simd_maxsz(desc);
+    uint32_t vta =3D vext_vta(desc);
     uint32_t i;
     uint64_t s1 =3D  *((uint64_t *)vs1);
=20
@@ -4687,6 +4705,8 @@ void HELPER(vfwredsum_vs_w)(void *vd, void *v0, void *v=
s1,
     }
     *((uint64_t *)vd) =3D s1;
     env->vstart =3D 0;
+    /* set tail elements to 1s */
+    vext_set_elems_1s(vd, vta, esz, vlenb);
 }
=20
 /*
--=20
2.34.2


