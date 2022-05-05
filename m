Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nmqJg-0002KC-QR
	for mharc-qemu-riscv@gnu.org; Fri, 06 May 2022 01:15:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nmqJe-0002HZ-Uz; Fri, 06 May 2022 01:15:46 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:44278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nmqJd-0007hs-32; Fri, 06 May 2022 01:15:46 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id CDD6511EE05;
 Fri,  6 May 2022 05:15:40 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Date: Thu, 05 May 2022 02:42:17 -0700
Subject: [PATCH qemu] target/riscv: rvv: Fix early exit condition for whole
 register load/store
Message-ID: <165181414065.18540.14828125053334599921-0@git.sr.ht>
X-Mailer: git.sr.ht
Reply-to: ~eopxd <yueh.ting.chen@gmail.com>
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
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
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
X-List-Received-Date: Fri, 06 May 2022 05:15:47 -0000

From: eopXD <eop.chen@sifive.com>

Vector whole register load instructions have EEW encoded in the opcode,
so we shouldn't take SEW here. Vector whole register store instructions
are always EEW=3D8.

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 58 +++++++++++++------------
 1 file changed, 31 insertions(+), 27 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tran=
s/trans_rvv.c.inc
index 90327509f7..391c61fe93 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1118,10 +1118,10 @@ GEN_VEXT_TRANS(vle64ff_v, MO_64, r2nfvm, ldff_op, ld_=
us_check)
 typedef void gen_helper_ldst_whole(TCGv_ptr, TCGv, TCGv_env, TCGv_i32);
=20
 static bool ldst_whole_trans(uint32_t vd, uint32_t rs1, uint32_t nf,
-                             gen_helper_ldst_whole *fn, DisasContext *s,
-                             bool is_store)
+                             uint32_t width, gen_helper_ldst_whole *fn,
+                             DisasContext *s, bool is_store)
 {
-    uint32_t evl =3D (s->cfg_ptr->vlen / 8) * nf / (1 << s->sew);
+    uint32_t evl =3D (s->cfg_ptr->vlen / 8) * nf / width;
     TCGLabel *over =3D gen_new_label();
     tcg_gen_brcondi_tl(TCG_COND_GEU, cpu_vstart, evl, over);
=20
@@ -1153,38 +1153,42 @@ static bool ldst_whole_trans(uint32_t vd, uint32_t rs=
1, uint32_t nf,
  * load and store whole register instructions ignore vtype and vl setting.
  * Thus, we don't need to check vill bit. (Section 7.9)
  */
-#define GEN_LDST_WHOLE_TRANS(NAME, ARG_NF, IS_STORE)                      \
+#define GEN_LDST_WHOLE_TRANS(NAME, ARG_NF, WIDTH, IS_STORE)               \
 static bool trans_##NAME(DisasContext *s, arg_##NAME * a)                 \
 {                                                                         \
     if (require_rvv(s) &&                                                 \
         QEMU_IS_ALIGNED(a->rd, ARG_NF)) {                                 \
-        return ldst_whole_trans(a->rd, a->rs1, ARG_NF, gen_helper_##NAME, \
-                                s, IS_STORE);                             \
+        return ldst_whole_trans(a->rd, a->rs1, ARG_NF, WIDTH,             \
+                                gen_helper_##NAME, s, IS_STORE);          \
     }                                                                     \
     return false;                                                         \
 }
=20
-GEN_LDST_WHOLE_TRANS(vl1re8_v,  1, false)
-GEN_LDST_WHOLE_TRANS(vl1re16_v, 1, false)
-GEN_LDST_WHOLE_TRANS(vl1re32_v, 1, false)
-GEN_LDST_WHOLE_TRANS(vl1re64_v, 1, false)
-GEN_LDST_WHOLE_TRANS(vl2re8_v,  2, false)
-GEN_LDST_WHOLE_TRANS(vl2re16_v, 2, false)
-GEN_LDST_WHOLE_TRANS(vl2re32_v, 2, false)
-GEN_LDST_WHOLE_TRANS(vl2re64_v, 2, false)
-GEN_LDST_WHOLE_TRANS(vl4re8_v,  4, false)
-GEN_LDST_WHOLE_TRANS(vl4re16_v, 4, false)
-GEN_LDST_WHOLE_TRANS(vl4re32_v, 4, false)
-GEN_LDST_WHOLE_TRANS(vl4re64_v, 4, false)
-GEN_LDST_WHOLE_TRANS(vl8re8_v,  8, false)
-GEN_LDST_WHOLE_TRANS(vl8re16_v, 8, false)
-GEN_LDST_WHOLE_TRANS(vl8re32_v, 8, false)
-GEN_LDST_WHOLE_TRANS(vl8re64_v, 8, false)
-
-GEN_LDST_WHOLE_TRANS(vs1r_v, 1, true)
-GEN_LDST_WHOLE_TRANS(vs2r_v, 2, true)
-GEN_LDST_WHOLE_TRANS(vs4r_v, 4, true)
-GEN_LDST_WHOLE_TRANS(vs8r_v, 8, true)
+GEN_LDST_WHOLE_TRANS(vl1re8_v,  1, 1, false)
+GEN_LDST_WHOLE_TRANS(vl1re16_v, 1, 2, false)
+GEN_LDST_WHOLE_TRANS(vl1re32_v, 1, 4, false)
+GEN_LDST_WHOLE_TRANS(vl1re64_v, 1, 8, false)
+GEN_LDST_WHOLE_TRANS(vl2re8_v,  2, 1, false)
+GEN_LDST_WHOLE_TRANS(vl2re16_v, 2, 2, false)
+GEN_LDST_WHOLE_TRANS(vl2re32_v, 2, 4, false)
+GEN_LDST_WHOLE_TRANS(vl2re64_v, 2, 8, false)
+GEN_LDST_WHOLE_TRANS(vl4re8_v,  4, 1, false)
+GEN_LDST_WHOLE_TRANS(vl4re16_v, 4, 2, false)
+GEN_LDST_WHOLE_TRANS(vl4re32_v, 4, 4, false)
+GEN_LDST_WHOLE_TRANS(vl4re64_v, 4, 8, false)
+GEN_LDST_WHOLE_TRANS(vl8re8_v,  8, 1, false)
+GEN_LDST_WHOLE_TRANS(vl8re16_v, 8, 2, false)
+GEN_LDST_WHOLE_TRANS(vl8re32_v, 8, 4, false)
+GEN_LDST_WHOLE_TRANS(vl8re64_v, 8, 8, false)
+
+/*
+ * The vector whole register store instructions are encoded similar to
+ * unmasked unit-stride store of elements with EEW=3D8.
+ */
+GEN_LDST_WHOLE_TRANS(vs1r_v, 1, 1, true)
+GEN_LDST_WHOLE_TRANS(vs2r_v, 2, 1, true)
+GEN_LDST_WHOLE_TRANS(vs4r_v, 4, 1, true)
+GEN_LDST_WHOLE_TRANS(vs8r_v, 8, 1, true)
=20
 /*
  *** Vector Integer Arithmetic Instructions
--=20
2.34.2

