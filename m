Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njjFz-0000z9-Mc
	for mharc-qemu-riscv@gnu.org; Wed, 27 Apr 2022 11:07:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1njjFp-0000XH-G4; Wed, 27 Apr 2022 11:06:57 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:42214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1njjFn-0005M3-Mo; Wed, 27 Apr 2022 11:06:57 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 4904611EFFE;
 Wed, 27 Apr 2022 15:06:31 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Subject: [PATCH qemu v10 12/14] target/riscv: rvv: Add tail agnostic for
 vector reduction instructions
Message-ID: <165107198903.23549.13907705840662008250-12@git.sr.ht>
X-Mailer: git.sr.ht
Reply-to: ~eopxd <yueh.ting.chen@gmail.com>
In-Reply-To: <165107198903.23549.13907705840662008250-0@git.sr.ht>
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
Date: Wed, 27 Apr 2022 15:06:58 -0000
X-Original-Date: Mon, 07 Mar 2022 04:21:37 -0800
X-List-Received-Date: Wed, 27 Apr 2022 15:06:58 -0000

From: eopXD <eop.chen@sifive.com>

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/vector_helper.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 21e20d47e5..e0fd0e62b3 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4515,6 +4515,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,       =
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
@@ -4527,6 +4530,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,       =
   \
     }                                                     \
     *((TD *)vd + HD(0)) =3D s1;                             \
     env->vstart =3D 0;                                      \
+    /* set tail elements to 1s */                         \
+    vext_set_elems_1s(vd, vta, esz, vlenb);               \
 }
=20
 /* vd[0] =3D sum(vs1[0], vs2[*]) */
@@ -4596,6 +4601,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,       =
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
@@ -4608,6 +4616,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,       =
    \
     }                                                      \
     *((TD *)vd + HD(0)) =3D s1;                              \
     env->vstart =3D 0;                                       \
+    /* set tail elements to 1s */                          \
+    vext_set_elems_1s(vd, vta, esz, vlenb);                \
 }
=20
 /* Unordered sum */
@@ -4632,6 +4642,9 @@ void HELPER(vfwredsum_vs_h)(void *vd, void *v0, void *v=
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
@@ -4645,6 +4658,8 @@ void HELPER(vfwredsum_vs_h)(void *vd, void *v0, void *v=
s1,
     }
     *((uint32_t *)vd + H4(0)) =3D s1;
     env->vstart =3D 0;
+    /* set tail elements to 1s */
+    vext_set_elems_1s(vd, vta, esz, vlenb);
 }
=20
 void HELPER(vfwredsum_vs_w)(void *vd, void *v0, void *vs1,
@@ -4652,6 +4667,9 @@ void HELPER(vfwredsum_vs_w)(void *vd, void *v0, void *v=
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
@@ -4665,6 +4683,8 @@ void HELPER(vfwredsum_vs_w)(void *vd, void *v0, void *v=
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


