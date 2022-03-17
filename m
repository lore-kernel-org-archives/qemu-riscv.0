Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nVJeu-0007eH-4e
	for mharc-qemu-riscv@gnu.org; Fri, 18 Mar 2022 16:57:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nVH6R-0001My-Bo; Fri, 18 Mar 2022 14:13:31 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:35974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nVH6O-0008NS-3X; Fri, 18 Mar 2022 14:13:31 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 075C811EE5E;
 Fri, 18 Mar 2022 18:13:26 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Date: Thu, 17 Mar 2022 00:09:09 -0700
Subject: [PATCH qemu] target/riscv: rvv: Add missing early exit condition for
 whole register load/store
MIME-Version: 1.0
Message-ID: <164762720573.18409.3931931227997483525-0@git.sr.ht>
X-Mailer: git.sr.ht
Reply-to: ~eopxd <yueh.ting.chen@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 15
X-Spam_score: 1.5
X-Spam_bar: +
X-Spam_report: (1.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_24_48=1.34,
 FREEMAIL_FORGED_REPLYTO=2.095, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 18 Mar 2022 16:57:14 -0400
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
X-List-Received-Date: Fri, 18 Mar 2022 18:13:31 -0000

From: Yueh-Ting (eop) Chen <eop.chen@sifive.com>

According to v-spec (section 7.9):
The instructions operate with an effective vector length, evl=3DNFIELDS*VLEN/=
EEW,
regardless of current settings in vtype and vl. The usual property that no
elements are written if vstart =E2=89=A5 vl does not apply to these instructi=
ons.
Instead, no elements are written if vstart =E2=89=A5 evl.

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tran=
s/trans_rvv.c.inc
index 275fded6e4..4ea7e41e1a 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1121,6 +1121,10 @@ static bool ldst_whole_trans(uint32_t vd, uint32_t rs1=
, uint32_t nf,
                              gen_helper_ldst_whole *fn, DisasContext *s,
                              bool is_store)
 {
+    uint32_t evl =3D (s->cfg_ptr->vlen / 8) * nf / (1 << s->sew);
+    TCGLabel *over =3D gen_new_label();
+    tcg_gen_brcondi_tl(TCG_COND_GEU, cpu_vstart, evl, over);
+
     TCGv_ptr dest;
     TCGv base;
     TCGv_i32 desc;
@@ -1140,6 +1144,7 @@ static bool ldst_whole_trans(uint32_t vd, uint32_t rs1,=
 uint32_t nf,
     if (!is_store) {
         mark_vs_dirty(s);
     }
+    gen_set_label(over);
=20
     return true;
 }
--=20
2.34.1

