Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtwtr-0002T4-2g
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 10:56:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60207)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwtl-0002NX-Jv
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwtO-00031i-0Z
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:25 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:38357)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtwtN-00027g-KP
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:09 -0500
Received: by mail-pg1-x543.google.com with SMTP id g189so1313422pgc.5
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 07:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=vGqcLZcWy8M7gcfc5+aPr3Kyg9z93+oUQq4GgyjOQYc=;
	b=kCyMiT6ZKCOoLOoE26uq3pojG1Z08e+ZIxUydDFx5q7WeG2MIEwMarUa7Y3CLhKFH4
	LKabHxyIFrAlbJNdaG+VdfuXNKAhHRsMV+7k4wUHQ731uSrwti+Awl5Zx4gJpiazw4yE
	S7eSJsojony5p7nzJb+rzmEe+B6YQ/gGX0dNu9Lez4nkmOJWv0uSOkdRPCZZEFOkx3mn
	42Avl3o/zOMQ4tvFDu18AdNfTp/ZlbS4gGY4eoG74P87h75zxOdz4BmDqR9MMndjIDer
	BxtuPGLnFK6mA2BMqPSS+WuWNlrwySZBGam01BoyMEEvOAWcjNJRDJOzmypWfz3QITfQ
	VuBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=vGqcLZcWy8M7gcfc5+aPr3Kyg9z93+oUQq4GgyjOQYc=;
	b=p0wYA7GKBTT2BAYLrIDgS93PzDEY+cspctzt47A/5WiLuP2ZCHrGkqmWaq3KcP47gn
	2ijtmcy0QO4zET9lvIYHklK9UubthnvSpY+IYNhtwZtm02YVRGacpfgAWChHn6ElFgFS
	db7PxH97xNu6wNYyQBANzykVQCOC86MhqNGrS2lflYOiiw/lBkmHdUjKEzH0MaYGYR5F
	B8oOpDy5JERh6ZG4/gmKHU1Z98Rl7z1xrvACozmuijMw6lEHEW0I7/K75ZHVMCRL8hwd
	zo7QCTeSknJPUP2i7APaCets6/K/ruksjq2HtAzUuBwuIF6k+Om+1QBhnluBzZLaGhJy
	hGwA==
X-Gm-Message-State: AHQUAuY2WquEgrsvFJJPFTGVaEu8QCLVpPR8EDgZTKYV2fto/5FhKpXt
	Xte6wMHyjWnRJfO6lFFYhI4vpA==
X-Google-Smtp-Source: AHgI3IayuWCSmVgZCR20QQ1Qtxy16FLj6igoNPIcu60OGzd2KqX7vnPGgt6lZ1E1HFwPni1eAgqoWQ==
X-Received: by 2002:a63:6a07:: with SMTP id f7mr1083588pgc.118.1550073331232; 
	Wed, 13 Feb 2019 07:55:31 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	i71sm40227285pfi.170.2019.02.13.07.55.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 07:55:30 -0800 (PST)
Date: Wed, 13 Feb 2019 07:54:13 -0800
Message-Id: <20190213155414.22285-35-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190213155414.22285-1-palmer@sifive.com>
References: <20190213155414.22285-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-riscv] [PATCH v7 34/35] target/riscv: Splice remaining
 compressed insn pairs for riscv32 vs riscv64
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
X-List-Received-Date: Wed, 13 Feb 2019 15:56:36 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

it splices flwsp_ldsp, fswsp_sdsp, and jal_addiw and makes each of them
reuse the code generator used for the non compressed insns.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 target/riscv/insn16-32.decode           |  7 +++++
 target/riscv/insn16-64.decode           |  5 ++++
 target/riscv/insn16.decode              | 12 ++------
 target/riscv/insn32.decode              |  3 +-
 target/riscv/insn_trans/trans_rvc.inc.c | 40 -------------------------
 5 files changed, 16 insertions(+), 51 deletions(-)

diff --git a/target/riscv/insn16-32.decode b/target/riscv/insn16-32.decode
index e21a701056f1..978b8d5834ee 100644
--- a/target/riscv/insn16-32.decode
+++ b/target/riscv/insn16-32.decode
@@ -22,3 +22,10 @@
 # *** RV32C Standard Extension (Quadrant 0) ***
 flw     011 ... ... .. ... 00   @cl_w
 fsw     111 ... ... .. ... 00   @cs_w
+
+# *** RV32C Standard Extension (Quadrant 1) ***
+jal     001 ......   ..... 01   &j imm=%imm_cj rd=1
+
+# *** RV32C Standard Extension (Quadrant 2) ***
+flw     011 . .....  ..... 10   &i imm=%uimm_6bit_lw %rd rs1=2
+fsw     111 ......   ..... 10   &s imm=%uimm_6bit_sw rs2=2 rs1=%rs2_5
diff --git a/target/riscv/insn16-64.decode b/target/riscv/insn16-64.decode
index de97a45acf4b..d43055837a79 100644
--- a/target/riscv/insn16-64.decode
+++ b/target/riscv/insn16-64.decode
@@ -24,5 +24,10 @@ ld      011  ... ... .. ... 00 @cl_d
 sd      111  ... ... .. ... 00 @cs_d
 
 # *** RV64C Standard Extension (Quadrant 1) ***
+addiw             001 .  .....  ..... 01 @ci
 subw              100 1 11 ... 00 ... 01 @cs_2
 addw              100 1 11 ... 01 ... 01 @cs_2
+
+# *** RV64C Standard Extension (Quadrant 2) ***
+ld      011 .  .....  ..... 10 &i imm=%uimm_6bit_ld %rd rs1=2
+sd      111 ......    ..... 10 &s imm=%uimm_6bit_sd rs2=%rs2_5 rs1=2
diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index b0753360626b..98dd672c7f59 100644
--- a/target/riscv/insn16.decode
+++ b/target/riscv/insn16.decode
@@ -45,6 +45,7 @@
 &r         rd rs1 rs2   !extern
 &i         imm rs1 rd   !extern
 &s         imm rs1 rs2  !extern
+&j         imm rd       !extern
 
 # Argument sets:
 &ci        imm        rd
@@ -59,12 +60,10 @@
 &c_sd      uimm  rs2
 
 &c_addi16sp_lui  imm_lui imm_addi16sp rd
-&c_flwsp_ldsp    uimm_flwsp uimm_ldsp rd
-&c_fswsp_sdsp    uimm_fswsp uimm_sdsp rs2
 
 # Formats 16:
 @cr        ....  ..... .....  .. &cr                      rs2=%rs2_5  %rd
-@ci        ... . ..... .....  .. &ci     imm=%imm_ci                  %rd
+@ci        ... . ..... .....  .. &i  imm=%imm_ci %rd rs1=%rd
 @ciw       ...   ........ ... .. &ciw    nzuimm=%nzuimm_ciw           rd=%rs2_3
 @cl_d      ... ... ... .. ... .. &i  imm=%uimm_cl_d  rs1=%rs1_3  rd=%rs2_3
 @cl_w      ... ... ... .. ... .. &i  imm=%uimm_cl_w  rs1=%rs1_3  rd=%rs2_3
@@ -80,10 +79,6 @@
 @c_sw      ... . .....  ..... .. &c_sd     uimm=%uimm_6bit_sw  rs2=%rs2_5
 
 @c_addi16sp_lui ... .  ..... ..... .. &c_addi16sp_lui %imm_lui %imm_addi16sp %rd
-@c_flwsp_ldsp   ... .  ..... ..... .. &c_flwsp_ldsp uimm_flwsp=%uimm_6bit_lw \
-    uimm_ldsp=%uimm_6bit_ld %rd
-@c_fswsp_sdsp   ... .  ..... ..... .. &c_fswsp_sdsp uimm_fswsp=%uimm_6bit_sw \
-    uimm_sdsp=%uimm_6bit_sd rs2=%rs2_5
 
 @c_shift        ... . .. ... ..... .. &c_shift rd=%rs1_3 shamt=%nzuimm_6bit
 @c_shift2       ... . .. ... ..... .. &c_shift rd=%rd    shamt=%nzuimm_6bit
@@ -99,7 +94,6 @@ sw                110  ... ... .. ... 00 @cs_w
 
 # *** RV64C Standard Extension (Quadrant 1) ***
 c_addi            000 .  .....  ..... 01 @ci
-c_jal_addiw       001 .  .....  ..... 01 @ci #Note: parse rd and/or imm manually
 c_li              010 .  .....  ..... 01 @ci
 c_addi16sp_lui    011 .  .....  ..... 01 @c_addi16sp_lui # shares opc with C.LUI
 c_srli            100 . 00 ...  ..... 01 @c_shift
@@ -117,9 +111,7 @@ c_bnez            111  ... ...  ..... 01 @cb
 c_slli            000 .  .....  ..... 10 @c_shift2
 c_fldsp           001 .  .....  ..... 10 @c_ld
 c_lwsp            010 .  .....  ..... 10 @c_lw
-c_flwsp_ldsp      011 .  .....  ..... 10 @c_flwsp_ldsp #C.LDSP:RV64;C.FLWSP:RV32
 c_jr_mv           100 0  .....  ..... 10 @cr
 c_ebreak_jalr_add 100 1  .....  ..... 10 @cr
 c_fsdsp           101   ......  ..... 10 @c_sd
 c_swsp            110 .  .....  ..... 10 @c_sw
-c_fswsp_sdsp      111 .  .....  ..... 10 @c_fswsp_sdsp #C.SDSP:RV64;C.FSWSP:RV32
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index b59a00cc429f..0e098e05fe78 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -38,6 +38,7 @@
 &i    imm rs1 rd
 &r    rd rs1 rs2
 &s    imm rs2 rs1
+&j    imm rd
 &shift     shamt rs1 rd
 &atomic    aq rl rs2 rs1 rd
 
@@ -47,7 +48,7 @@
 @b       .......   ..... ..... ... ..... ....... &b      imm=%imm_b %rs2 %rs1
 @s       .......   ..... ..... ... ..... ....... &s      imm=%imm_s %rs2 %rs1
 @u       ....................      ..... .......         imm=%imm_u          %rd
-@j       ....................      ..... .......         imm=%imm_j          %rd
+@j       ....................      ..... ....... &j      imm=%imm_j          %rd
 
 @sh      ......  ...... .....  ... ..... ....... &shift  shamt=%sh10      %rs1 %rd
 @csr     ............   .....  ... ..... .......               %csr     %rs1 %rd
diff --git a/target/riscv/insn_trans/trans_rvc.inc.c b/target/riscv/insn_trans/trans_rvc.inc.c
index f521daf32e55..db9119ec9b17 100644
--- a/target/riscv/insn_trans/trans_rvc.inc.c
+++ b/target/riscv/insn_trans/trans_rvc.inc.c
@@ -38,19 +38,6 @@ static bool trans_c_addi(DisasContext *ctx, arg_c_addi *a)
     return trans_addi(ctx, &arg);
 }
 
-static bool trans_c_jal_addiw(DisasContext *ctx, arg_c_jal_addiw *a)
-{
-#ifdef TARGET_RISCV32
-    /* C.JAL */
-    arg_jal arg = { .rd = 1, .imm = a->imm };
-    return trans_jal(ctx, &arg);
-#else
-    /* C.ADDIW */
-    arg_addiw arg = { .rd = a->rd, .rs1 = a->rd, .imm = a->imm };
-    return trans_addiw(ctx, &arg);
-#endif
-}
-
 static bool trans_c_li(DisasContext *ctx, arg_c_li *a)
 {
     if (a->rd == 0) {
@@ -163,20 +150,6 @@ static bool trans_c_lwsp(DisasContext *ctx, arg_c_lwsp *a)
     return trans_lw(ctx, &arg);
 }
 
-static bool trans_c_flwsp_ldsp(DisasContext *ctx, arg_c_flwsp_ldsp *a)
-{
-#ifdef TARGET_RISCV32
-    /* C.FLWSP */
-    arg_flw arg_flw = { .rd = a->rd, .rs1 = 2, .imm = a->uimm_flwsp };
-    return trans_flw(ctx, &arg_flw);
-#else
-    /* C.LDSP */
-    arg_ld arg_ld = { .rd = a->rd, .rs1 = 2, .imm = a->uimm_ldsp };
-    return trans_ld(ctx, &arg_ld);
-#endif
-    return false;
-}
-
 static bool trans_c_jr_mv(DisasContext *ctx, arg_c_jr_mv *a)
 {
     if (a->rd != 0 && a->rs2 == 0) {
@@ -222,16 +195,3 @@ static bool trans_c_swsp(DisasContext *ctx, arg_c_swsp *a)
     arg_sw arg = { .rs1 = 2, .rs2 = a->rs2, .imm = a->uimm };
     return trans_sw(ctx, &arg);
 }
-
-static bool trans_c_fswsp_sdsp(DisasContext *ctx, arg_c_fswsp_sdsp *a)
-{
-#ifdef TARGET_RISCV32
-    /* C.FSWSP */
-    arg_fsw a_fsw = { .rs1 = a->rs2, .rs2 = 2, .imm = a->uimm_fswsp };
-    return trans_fsw(ctx, &a_fsw);
-#else
-    /* C.SDSP */
-    arg_sd a_sd = { .rs1 = 2, .rs2 = a->rs2, .imm = a->uimm_sdsp };
-    return trans_sd(ctx, &a_sd);
-#endif
-}
-- 
2.18.1


