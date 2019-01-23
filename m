Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmF4T-0002ui-74
	for mharc-qemu-riscv@gnu.org; Wed, 23 Jan 2019 04:43:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47243)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gmF4P-0002FT-Pr
	for qemu-riscv@nongnu.org; Wed, 23 Jan 2019 04:43:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gmEp4-00085I-LO
	for qemu-riscv@nongnu.org; Wed, 23 Jan 2019 04:27:51 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:50568)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1gmEp4-0007b9-Bq; Wed, 23 Jan 2019 04:27:50 -0500
Received: from wormulon.uni-paderborn.de ([131.234.189.22]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 amazonia)
	id 1gmEoO-0006Zw-7R; Wed, 23 Jan 2019 10:27:08 +0100
Received: from mail.uni-paderborn.de by wormulon with queue id 3103321-5;
	Wed, 23 Jan 2019 09:27:07 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: sagark@eecs.berkeley.edu, palmer@sifive.com, kbastian@mail.uni-paderborn.de
Cc: qemu-riscv@nongnu.org, peer.adelt@hni.uni-paderborn.de,
	richard.henderson@linaro.org, qemu-devel@nongnu.org
Date: Wed, 23 Jan 2019 10:25:38 +0100
Message-Id: <20190123092538.8004-36-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190123092538.8004-1-kbastian@mail.uni-paderborn.de>
References: <20190123092538.8004-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2019.1.23.91816, AntiVirus-Engine: 5.56.1,
	AntiVirus-Data: 2019.1.18.5561000
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: 
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: [Qemu-riscv] [PATCH v6 35/35] target/riscv: Remaining rvc insn
 reuse 32 bit translators
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Jan 2019 09:43:43 -0000

only one translate functions of rvc needs to handle special cases. For
the other rvc insns we can remove the extra layer of indirection.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 target/riscv/insn16.decode              | 37 +++++++++----------
 target/riscv/insn_trans/trans_rvc.inc.c | 48 -------------------------
 2 files changed, 17 insertions(+), 68 deletions(-)

diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index 98dd672c7f..d88a0c78ab 100644
--- a/target/riscv/insn16.decode
+++ b/target/riscv/insn16.decode
@@ -46,19 +46,15 @@
 &i         imm rs1 rd   !extern
 &s         imm rs1 rs2  !extern
 &j         imm rd       !extern
+&b         imm rs2 rs1  !extern
 
 # Argument sets:
 &ci        imm        rd
 &ciw       nzuimm     rd
 &cs_dw     uimm   rs1 rs2
-&cb        imm    rs1
 &cr               rd  rs2
-&c_j       imm
 &c_shift   shamt      rd
 
-&c_ld      uimm  rd
-&c_sd      uimm  rs2
-
 &c_addi16sp_lui  imm_lui imm_addi16sp rd
 
 # Formats 16:
@@ -70,20 +66,21 @@
 @cs_2      ... ... ... .. ... .. &r      rd=%rs1_3 rs1=%rs1_3 rs2=%rs2_3
 @cs_d      ... ... ... .. ... .. &s  imm=%uimm_cl_d  rs1=%rs1_3  rs2=%rs2_3
 @cs_w      ... ... ... .. ... .. &s  imm=%uimm_cl_w  rs1=%rs1_3  rs2=%rs2_3
-@cb        ... ... ... .. ... .. &cb     imm=%imm_cb      rs1=%rs1_3
-@cj        ...    ........... .. &c_j    imm=%imm_cj
+@cb        ... ... ... .. ... .. &b  imm=%imm_cb  rs1=%rs1_3 rs2=0
+@cj        ...    ........... .. &j  imm=%imm_cj rd=0
 
-@c_ld      ... . .....  ..... .. &c_ld     uimm=%uimm_6bit_ld  %rd
-@c_lw      ... . .....  ..... .. &c_ld     uimm=%uimm_6bit_lw  %rd
-@c_sd      ... . .....  ..... .. &c_sd     uimm=%uimm_6bit_sd  rs2=%rs2_5
-@c_sw      ... . .....  ..... .. &c_sd     uimm=%uimm_6bit_sw  rs2=%rs2_5
+@c_ld      ... . .....  ..... .. &i  imm=%uimm_6bit_ld  %rd rs1=2
+@c_lw      ... . .....  ..... .. &i  imm=%uimm_6bit_lw  %rd rs1=2
+@c_sd      ... . .....  ..... .. &s  imm=%uimm_6bit_sd  rs1=2 rs2=%rs2_5
+@c_sw      ... . .....  ..... .. &s  imm=%uimm_6bit_sw  rs1=2 rs2=%rs2_5
 
 @c_addi16sp_lui ... .  ..... ..... .. &c_addi16sp_lui %imm_lui %imm_addi16sp %rd
 
 @c_shift        ... . .. ... ..... .. &c_shift rd=%rs1_3 shamt=%nzuimm_6bit
 @c_shift2       ... . .. ... ..... .. &c_shift rd=%rd    shamt=%nzuimm_6bit
 
-@c_andi         ... . .. ... ..... .. &ci imm=%imm_ci rd=%rs1_3
+@c_andi         ... . .. ... ..... .. &i imm=%imm_ci rd=%rs1_3 rs1=%rs1_3
+
 
 # *** RV64C Standard Extension (Quadrant 0) ***
 c_addi4spn        000    ........ ... 00 @ciw
@@ -98,20 +95,20 @@ c_li              010 .  .....  ..... 01 @ci
 c_addi16sp_lui    011 .  .....  ..... 01 @c_addi16sp_lui # shares opc with C.LUI
 c_srli            100 . 00 ...  ..... 01 @c_shift
 c_srai            100 . 01 ...  ..... 01 @c_shift
-c_andi            100 . 10 ...  ..... 01 @c_andi
+andi              100 . 10 ...  ..... 01 @c_andi
 sub               100 0 11 ... 00 ... 01 @cs_2
 xor               100 0 11 ... 01 ... 01 @cs_2
 or                100 0 11 ... 10 ... 01 @cs_2
 and               100 0 11 ... 11 ... 01 @cs_2
-c_j               101     ........... 01 @cj
-c_beqz            110  ... ...  ..... 01 @cb
-c_bnez            111  ... ...  ..... 01 @cb
+jal               101     ........... 01 @cj # c_j
+beq               110  ... ...  ..... 01 @cb # c_beqz
+bne               111  ... ...  ..... 01 @cb # c_bnez
 
 # *** RV64C Standard Extension (Quadrant 2) ***
 c_slli            000 .  .....  ..... 10 @c_shift2
-c_fldsp           001 .  .....  ..... 10 @c_ld
-c_lwsp            010 .  .....  ..... 10 @c_lw
+fld               001 .  .....  ..... 10 @c_ld # fldsp
+lw                010 .  .....  ..... 10 @c_lw # lwsp
 c_jr_mv           100 0  .....  ..... 10 @cr
 c_ebreak_jalr_add 100 1  .....  ..... 10 @cr
-c_fsdsp           101   ......  ..... 10 @c_sd
-c_swsp            110 .  .....  ..... 10 @c_sw
+fsd               101   ......  ..... 10 @c_sd # fsdsp
+sw                110 .  .....  ..... 10 @c_sw # swsp
diff --git a/target/riscv/insn_trans/trans_rvc.inc.c b/target/riscv/insn_trans/trans_rvc.inc.c
index db9119ec9b..631e72c8b5 100644
--- a/target/riscv/insn_trans/trans_rvc.inc.c
+++ b/target/riscv/insn_trans/trans_rvc.inc.c
@@ -98,30 +98,6 @@ static bool trans_c_srai(DisasContext *ctx, arg_c_srai *a)
     return trans_srai(ctx, &arg);
 }
 
-static bool trans_c_andi(DisasContext *ctx, arg_c_andi *a)
-{
-    arg_andi arg = { .rd = a->rd, .rs1 = a->rd, .imm = a->imm };
-    return trans_andi(ctx, &arg);
-}
-
-static bool trans_c_j(DisasContext *ctx, arg_c_j *a)
-{
-    arg_jal arg = { .rd = 0, .imm = a->imm };
-    return trans_jal(ctx, &arg);
-}
-
-static bool trans_c_beqz(DisasContext *ctx, arg_c_beqz *a)
-{
-    arg_beq arg = { .rs1 = a->rs1, .rs2 = 0, .imm = a->imm };
-    return trans_beq(ctx, &arg);
-}
-
-static bool trans_c_bnez(DisasContext *ctx, arg_c_bnez *a)
-{
-    arg_bne arg = { .rs1 = a->rs1, .rs2 = 0, .imm = a->imm };
-    return trans_bne(ctx, &arg);
-}
-
 static bool trans_c_slli(DisasContext *ctx, arg_c_slli *a)
 {
     int shamt = a->shamt;
@@ -138,18 +114,6 @@ static bool trans_c_slli(DisasContext *ctx, arg_c_slli *a)
     return trans_slli(ctx, &arg);
 }
 
-static bool trans_c_fldsp(DisasContext *ctx, arg_c_fldsp *a)
-{
-    arg_fld arg = { .rd = a->rd, .rs1 = 2, .imm = a->uimm };
-    return trans_fld(ctx, &arg);
-}
-
-static bool trans_c_lwsp(DisasContext *ctx, arg_c_lwsp *a)
-{
-    arg_lw arg = { .rd = a->rd, .rs1 = 2, .imm = a->uimm };
-    return trans_lw(ctx, &arg);
-}
-
 static bool trans_c_jr_mv(DisasContext *ctx, arg_c_jr_mv *a)
 {
     if (a->rd != 0 && a->rs2 == 0) {
@@ -183,15 +147,3 @@ static bool trans_c_ebreak_jalr_add(DisasContext *ctx, arg_c_ebreak_jalr_add *a)
     }
     return false;
 }
-
-static bool trans_c_fsdsp(DisasContext *ctx, arg_c_fsdsp *a)
-{
-    arg_fsd arg = { .rs1 = 2, .rs2 = a->rs2, .imm = a->uimm };
-    return trans_fsd(ctx, &arg);
-}
-
-static bool trans_c_swsp(DisasContext *ctx, arg_c_swsp *a)
-{
-    arg_sw arg = { .rs1 = 2, .rs2 = a->rs2, .imm = a->uimm };
-    return trans_sw(ctx, &arg);
-}
-- 
2.20.1


