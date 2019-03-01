Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzq40-00045r-Sp
	for mharc-qemu-riscv@gnu.org; Fri, 01 Mar 2019 16:51:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51032)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq3u-00042b-1g
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:51:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq3q-00040e-Nz
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:51:21 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:37225)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gzq3T-0003Cv-8Y
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:51:17 -0500
Received: by mail-pf1-x434.google.com with SMTP id s22so12032943pfh.4
	for <qemu-riscv@nongnu.org>; Fri, 01 Mar 2019 13:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=RbCAZaEk1X3e/ZCtnohSJummsARjE94GDcfCz0EFe+A=;
	b=lPv1Ekd+yoMjNf/fdnYX6/6BIZnHiP8JM+szEJbCuMM0ag4XovO262szPyLEjfq0Kc
	tBJL+4YbLGztFC86fiEC2NnoZE5dHVZlPsiaAjxWoOOZfBJvTu8RB7QQaUOg/qdgjQa7
	gyICQDiY1ps4TFK8yby76HEYf1LJLqbV+m+7OxHZpK78VW98eeM7ghYpJABniBD61KhQ
	bcgXRnkX3FmN6If9gn5N3P1Y/AZElXnjU2bwPqqbBOsT+IKFqlFPaDLL8HOnycHhvIUg
	Kk0Lmv9z65Eq3UL8Z/l5tepvmtWoLd724kWRKCra2b9m+yXQ4wIJm2Xgl69MQyfsXI45
	U0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=RbCAZaEk1X3e/ZCtnohSJummsARjE94GDcfCz0EFe+A=;
	b=USS9Lwl5g2K0Lg7FQPsMe1HnocT7Xism+eufk2LA1vcNax6zVzZ6uvyxP7V8pUnx/V
	TgTXQfO/uByDUJUmwZl0c5qFZD/wI3d/An8KfTfoKaLtWSpT/yW96PR8FN4ATTwIOFff
	QMUCY9AWDVgncZgpAXll0ESf6QMFCMEMMA1iWiCksrHkrG5ydjaLTRsmsn6r7QIoO3sW
	U7blWQ3Jla2s8Fp/vmSzE5gORxx9Ah0Groet4u5KL6Pui7E1Y7r4dqU93v9dAQOcJk66
	mEue86+6zrHQuDyNTZ4jPtqJigaTJKY+dSfMf7cghjY6Lj794heTSMlapOBUZ/uh1Mig
	etig==
X-Gm-Message-State: AHQUAuYWxZBsR0Dg9F3qJhK8mA6c5jyxPrKvIRNkXTlVKhDsVZz0Q/g2
	IYdVUJr5jpzvqPXquumc2VH+yA==
X-Google-Smtp-Source: AHgI3IaoMSPUzltQ3+J7DmQaM/TzSKZDFz9TLgyIX/bdBb71DNe43qizC2nhOM3UQCIig0g46L7STw==
X-Received: by 2002:a62:ea08:: with SMTP id t8mr7804649pfh.60.1551477053739;
	Fri, 01 Mar 2019 13:50:53 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	m6sm23120755pfa.115.2019.03.01.13.50.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Mar 2019 13:50:53 -0800 (PST)
Date: Fri,  1 Mar 2019 13:49:45 -0800
Message-Id: <20190301214945.4353-35-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190301214945.4353-1-palmer@sifive.com>
References: <20190301214945.4353-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::434
Subject: [Qemu-riscv] [PULL 34/34] target/riscv: Remaining rvc insn reuse 32
 bit translators
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
X-List-Received-Date: Fri, 01 Mar 2019 21:51:26 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

only one translate functions of rvc needs to handle special cases. For
the other rvc insns we can remove the extra layer of indirection.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/insn16.decode              | 37 +++++++++----------
 target/riscv/insn_trans/trans_rvc.inc.c | 48 -------------------------
 2 files changed, 17 insertions(+), 68 deletions(-)

diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index 98dd672c7f59..d88a0c78ab5d 100644
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
index db9119ec9b17..631e72c8b585 100644
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
2.18.1


