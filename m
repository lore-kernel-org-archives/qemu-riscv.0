Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1glsVM-0006IO-Fy
	for mharc-qemu-riscv@gnu.org; Tue, 22 Jan 2019 04:38:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58945)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1glsVJ-00068S-PW
	for qemu-riscv@nongnu.org; Tue, 22 Jan 2019 04:37:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1glsOd-00063Z-RC
	for qemu-riscv@nongnu.org; Tue, 22 Jan 2019 04:31:06 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:54012)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1glsOX-0005XU-OU; Tue, 22 Jan 2019 04:30:57 -0500
Received: from wormulon.uni-paderborn.de ([131.234.189.22]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 zuban)
	id 1glsO4-0004ru-Ke; Tue, 22 Jan 2019 10:30:28 +0100
Received: from mail.uni-paderborn.de by wormulon with queue id 3100918-5;
	Tue, 22 Jan 2019 09:30:27 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: sagark@eecs.berkeley.edu, palmer@sifive.com, kbastian@mail.uni-paderborn.de
Cc: richard.henderson@linaro.org, peer.adelt@hni.uni-paderborn.de,
	qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Date: Tue, 22 Jan 2019 10:29:06 +0100
Message-Id: <20190122092909.5341-33-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190122092909.5341-1-kbastian@mail.uni-paderborn.de>
References: <20190122092909.5341-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2019.1.22.92116, AntiVirus-Engine: 5.56.1,
	AntiVirus-Data: 2019.1.18.5561000
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: 
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: [Qemu-riscv] [PATCH v5 32/35] target/riscv: Convert @cl_d, @cl_w,
 @cs_d, @cs_w insns
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
X-List-Received-Date: Tue, 22 Jan 2019 09:37:58 -0000

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 target/riscv/insn16.decode              | 20 ++++++++++----------
 target/riscv/insn32.decode              |  3 ++-
 target/riscv/insn_trans/trans_rvc.inc.c | 24 ------------------------
 3 files changed, 12 insertions(+), 35 deletions(-)

diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index c7a58d80e5..c215867ff9 100644
--- a/target/riscv/insn16.decode
+++ b/target/riscv/insn16.decode
@@ -43,14 +43,14 @@
 
 # Argument sets imported from insn32.decode:
 &r         rd rs1 rs2   !extern
+&i         imm rs1 rd   !extern
+&s         imm rs1 rs2  !extern
 
 # Argument sets:
 &cl               rs1 rd
-&cl_dw     uimm   rs1 rd
 &ci        imm        rd
 &ciw       nzuimm     rd
 &cs               rs1 rs2
-&cs_dw     uimm   rs1 rs2
 &cb        imm    rs1
 &cr               rd  rs2
 &c_j       imm
@@ -67,13 +67,13 @@
 @cr        ....  ..... .....  .. &cr                      rs2=%rs2_5  %rd
 @ci        ... . ..... .....  .. &ci     imm=%imm_ci                  %rd
 @ciw       ...   ........ ... .. &ciw    nzuimm=%nzuimm_ciw           rd=%rs2_3
-@cl_d      ... ... ... .. ... .. &cl_dw  uimm=%uimm_cl_d  rs1=%rs1_3  rd=%rs2_3
-@cl_w      ... ... ... .. ... .. &cl_dw  uimm=%uimm_cl_w  rs1=%rs1_3  rd=%rs2_3
+@cl_d      ... ... ... .. ... .. &i  imm=%uimm_cl_d  rs1=%rs1_3  rd=%rs2_3
+@cl_w      ... ... ... .. ... .. &i  imm=%uimm_cl_w  rs1=%rs1_3  rd=%rs2_3
 @cl        ... ... ... .. ... .. &cl                      rs1=%rs1_3  rd=%rs2_3
 @cs        ... ... ... .. ... .. &cs                      rs1=%rs1_3  rs2=%rs2_3
 @cs_2      ... ... ... .. ... .. &r      rd=%rs1_3 rs1=%rs1_3 rs2=%rs2_3
-@cs_d      ... ... ... .. ... .. &cs_dw  uimm=%uimm_cl_d  rs1=%rs1_3  rs2=%rs2_3
-@cs_w      ... ... ... .. ... .. &cs_dw  uimm=%uimm_cl_w  rs1=%rs1_3  rs2=%rs2_3
+@cs_d      ... ... ... .. ... .. &s  imm=%uimm_cl_d  rs1=%rs1_3  rs2=%rs2_3
+@cs_w      ... ... ... .. ... .. &s  imm=%uimm_cl_w  rs1=%rs1_3  rs2=%rs2_3
 @cb        ... ... ... .. ... .. &cb     imm=%imm_cb      rs1=%rs1_3
 @cj        ...    ........... .. &c_j    imm=%imm_cj
 
@@ -95,11 +95,11 @@
 
 # *** RV64C Standard Extension (Quadrant 0) ***
 c_addi4spn        000    ........ ... 00 @ciw
-c_fld             001  ... ... .. ... 00 @cl_d
-c_lw              010  ... ... .. ... 00 @cl_w
+fld               001  ... ... .. ... 00 @cl_d
+lw                010  ... ... .. ... 00 @cl_w
 c_flw_ld          011  --- ... -- ... 00 @cl    #Note: Must parse uimm manually
-c_fsd             101  ... ... .. ... 00 @cs_d
-c_sw              110  ... ... .. ... 00 @cs_w
+fsd               101  ... ... .. ... 00 @cs_d
+sw                110  ... ... .. ... 00 @cs_w
 c_fsw_sd          111  --- ... -- ... 00 @cs    #Note: Must parse uimm manually
 
 # *** RV64C Standard Extension (Quadrant 1) ***
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 6f3ab7aa52..b59a00cc42 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -37,6 +37,7 @@
 &b    imm rs2 rs1
 &i    imm rs1 rd
 &r    rd rs1 rs2
+&s    imm rs2 rs1
 &shift     shamt rs1 rd
 &atomic    aq rl rs2 rs1 rd
 
@@ -44,7 +45,7 @@
 @r       .......   ..... ..... ... ..... ....... &r                %rs2 %rs1 %rd
 @i       ............    ..... ... ..... ....... &i      imm=%imm_i     %rs1 %rd
 @b       .......   ..... ..... ... ..... ....... &b      imm=%imm_b %rs2 %rs1
-@s       .......   ..... ..... ... ..... .......         imm=%imm_s %rs2 %rs1
+@s       .......   ..... ..... ... ..... ....... &s      imm=%imm_s %rs2 %rs1
 @u       ....................      ..... .......         imm=%imm_u          %rd
 @j       ....................      ..... .......         imm=%imm_j          %rd
 
diff --git a/target/riscv/insn_trans/trans_rvc.inc.c b/target/riscv/insn_trans/trans_rvc.inc.c
index 639c381edf..d932bfd3e0 100644
--- a/target/riscv/insn_trans/trans_rvc.inc.c
+++ b/target/riscv/insn_trans/trans_rvc.inc.c
@@ -28,18 +28,6 @@ static bool trans_c_addi4spn(DisasContext *ctx, arg_c_addi4spn *a)
     return trans_addi(ctx, &arg);
 }
 
-static bool trans_c_fld(DisasContext *ctx, arg_c_fld *a)
-{
-    arg_fld arg = { .rd = a->rd, .rs1 = a->rs1, .imm = a->uimm };
-    return trans_fld(ctx, &arg);
-}
-
-static bool trans_c_lw(DisasContext *ctx, arg_c_lw *a)
-{
-    arg_lw arg = { .rd = a->rd, .rs1 = a->rs1, .imm = a->uimm };
-    return trans_lw(ctx, &arg);
-}
-
 static bool trans_c_flw_ld(DisasContext *ctx, arg_c_flw_ld *a)
 {
 #ifdef TARGET_RISCV32
@@ -51,18 +39,6 @@ static bool trans_c_flw_ld(DisasContext *ctx, arg_c_flw_ld *a)
 #endif
 }
 
-static bool trans_c_fsd(DisasContext *ctx, arg_c_fsd *a)
-{
-    arg_fsd arg = { .rs1 = a->rs1, .rs2 = a->rs2, .imm = a->uimm };
-    return trans_fsd(ctx, &arg);
-}
-
-static bool trans_c_sw(DisasContext *ctx, arg_c_sw *a)
-{
-    arg_sw arg = { .rs1 = a->rs1, .rs2 = a->rs2, .imm = a->uimm };
-    return trans_sw(ctx, &arg);
-}
-
 static bool trans_c_fsw_sd(DisasContext *ctx, arg_c_fsw_sd *a)
 {
 #ifdef TARGET_RISCV32
-- 
2.20.1


