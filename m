Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ny63x-0002Cn-MB
	for mharc-qemu-riscv@gnu.org; Mon, 06 Jun 2022 02:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1ny62V-0001jb-LN; Mon, 06 Jun 2022 02:16:41 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:48014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1ny62U-0000il-6t; Mon, 06 Jun 2022 02:16:35 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 0421211EFDB;
 Mon,  6 Jun 2022 06:15:47 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Subject: [PATCH qemu v19 09/16] target/riscv: rvv: Add tail agnostic for
 vector integer comparison instructions
Message-ID: <165449614532.19704.7000832880482980398-9@git.sr.ht>
X-Mailer: git.sr.ht
Reply-to: ~eopxd <yueh.ting.chen@gmail.com>
In-Reply-To: <165449614532.19704.7000832880482980398-0@git.sr.ht>
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
Date: Mon, 06 Jun 2022 06:17:04 -0000
X-Original-Date: Mon, 07 Mar 2022 01:43:53 -0800
X-List-Received-Date: Mon, 06 Jun 2022 06:17:04 -0000

From: eopXD <yueh.ting.chen@gmail.com>

Compares write mask registers, and so always operate under a tail-
agnostic policy.

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 9738c50222..b964b01a15 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1370,6 +1370,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *=
vs2,   \
 {                                                             \
     uint32_t vm =3D vext_vm(desc);                              \
     uint32_t vl =3D env->vl;                                    \
+    uint32_t total_elems =3D env_archcpu(env)->cfg.vlen;        \
+    uint32_t vta_all_1s =3D vext_vta_all_1s(desc);              \
     uint32_t i;                                               \
                                                               \
     for (i =3D env->vstart; i < vl; i++) {                      \
@@ -1381,6 +1383,13 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void =
*vs2,   \
         vext_set_elem_mask(vd, i, DO_OP(s2, s1));             \
     }                                                         \
     env->vstart =3D 0;                                          \
+    /* mask destination register are always tail-agnostic */  \
+    /* set tail elements to 1s */                             \
+    if (vta_all_1s) {                                         \
+        for (; i < total_elems; i++) {                        \
+            vext_set_elem_mask(vd, i, 1);                     \
+        }                                                     \
+    }                                                         \
 }
=20
 GEN_VEXT_CMP_VV(vmseq_vv_b, uint8_t,  H1, DO_MSEQ)
@@ -1419,6 +1428,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, =
void *vs2,   \
 {                                                                   \
     uint32_t vm =3D vext_vm(desc);                                    \
     uint32_t vl =3D env->vl;                                          \
+    uint32_t total_elems =3D env_archcpu(env)->cfg.vlen;              \
+    uint32_t vta_all_1s =3D vext_vta_all_1s(desc);                    \
     uint32_t i;                                                     \
                                                                     \
     for (i =3D env->vstart; i < vl; i++) {                            \
@@ -1430,6 +1441,13 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,=
 void *vs2,   \
                 DO_OP(s2, (ETYPE)(target_long)s1));                 \
     }                                                               \
     env->vstart =3D 0;                                                \
+    /* mask destination register are always tail-agnostic */        \
+    /* set tail elements to 1s */                                   \
+    if (vta_all_1s) {                                               \
+        for (; i < total_elems; i++) {                              \
+            vext_set_elem_mask(vd, i, 1);                           \
+        }                                                           \
+    }                                                               \
 }
=20
 GEN_VEXT_CMP_VX(vmseq_vx_b, uint8_t,  H1, DO_MSEQ)
--=20
2.34.2


