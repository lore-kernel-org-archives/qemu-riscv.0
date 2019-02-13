Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtwtj-0002KR-7E
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 10:56:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwtT-00023v-PV
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwtM-0002yC-JH
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:15 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:42333)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtwtM-00023N-6y
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:08 -0500
Received: by mail-pl1-x644.google.com with SMTP id s1so1338887plp.9
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 07:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=GCwODxabK0PbeSCReaoo7dPPIpLzYb/KtB1t0NwFt4U=;
	b=e49oNbLUI6qdoObg0VNPEAnAc567hESPNiERpgxAAsv281d4GXXmA5qvOkburs88xD
	OmHZJg9hMiJz9I6nTJ/oLhYQrElLmey7MFdLvXwAY3lz5l70lDbxjZggiSvc9YX8xB1M
	fWnnVp1I2Ifx3BcYYPgTo3wToM1hJLTkN2DoBzAzHmuhCh7Z0nE/KZbJ3/N+v699Vx3u
	9r9mWzDhfKDKG7IzV9F7r5cQXazAcZMF+kgre6rW8QFKrS2lJuRf/jS6JR8vdjwtuB+G
	911dNnH+VRor1mWDhM8ozfgbytF+ulJg1IvlZEhuehfyananW7jKU9n3jrE7nXMkTiit
	cmpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=GCwODxabK0PbeSCReaoo7dPPIpLzYb/KtB1t0NwFt4U=;
	b=fdnQA1DA7e/HUu80Snxz0s2S70iuh1a0RsGyXrsgEDw4PokfufJpPSLPOF/Hw6U2nT
	OeY2Eabj0k66QXX1tIWe9yO/1z+YJRM/ilW2XyB2bNTzaMpxU52tkDAqEqChd4rjC0/u
	3TwvrBif4MawJMJ0SBXfGeyBfbBpO+bp42uddum+rJLeLi7yxLC9T3RQHbLk2KxvCPUR
	lWq7rMARSM/66GuVi7Wo+EJ9ez5jFN0U+sRFYlTp1K/eFo9fobsfJjNBMUTpMUj+jTsg
	UhvYsgGQLDSkwgYqVBV9vax8yatCemZhSAPgjR7+mO+pW2qMQjuuU6YTa5TcKt6tltgu
	C6Dg==
X-Gm-Message-State: AHQUAuZAalRDGXDeZLevzDwBL/Bk8++bFPWQXn2wA64dDP9irb3dVfF3
	9OVGHCxvWrXOSkZVLMwgcpOBZWVUlpc=
X-Google-Smtp-Source: AHgI3IYmjzq+CWBwWIwh6YP1fslT+MjAS/7PQhhe6Sn36+I40Bwq0IiDVZgM70qW0NPNN3xi6PguOA==
X-Received: by 2002:a17:902:e287:: with SMTP id
	cf7mr1196494plb.51.1550073328159; 
	Wed, 13 Feb 2019 07:55:28 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	f6sm27517477pfc.88.2019.02.13.07.55.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 07:55:27 -0800 (PST)
Date: Wed, 13 Feb 2019 07:54:11 -0800
Message-Id: <20190213155414.22285-33-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190213155414.22285-1-palmer@sifive.com>
References: <20190213155414.22285-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-riscv] [PATCH v7 32/35] target/riscv: Convert @cl_d, @cl_w,
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
X-List-Received-Date: Wed, 13 Feb 2019 15:56:26 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 target/riscv/insn16.decode              | 20 ++++++++++----------
 target/riscv/insn32.decode              |  3 ++-
 target/riscv/insn_trans/trans_rvc.inc.c | 24 ------------------------
 3 files changed, 12 insertions(+), 35 deletions(-)

diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index c7a58d80e5ae..c215867ff947 100644
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
index 6f3ab7aa52d3..b59a00cc429f 100644
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
index 639c381edfc0..d932bfd3e0cc 100644
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
2.18.1


