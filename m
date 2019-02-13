Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtwtj-0002Kx-Gy
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 10:56:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59923)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwtT-00023n-Mm
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwtM-0002xp-H0
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:15 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:41150)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtwtM-0001l9-3q
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:08 -0500
Received: by mail-pf1-x42b.google.com with SMTP id b7so1318445pfi.8
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 07:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=7hitZAdNP8BAYwP0p+ZtyRfXKOl/UWiFfCkfFWxlZN4=;
	b=dg11tFS6bvsO2LVllMKrwVnOfuVgMJxHpZZF7YKW9GQij1l8dsfVGY529gTrUzIHek
	DYT9WmavIk8FwqJsfFKl4+N2RjihSQulTom99YrkY4d3UpEZBVsxW5cNEh5fxmqyLvKm
	t7XzHPEzqLfH2gFteL95+qcjxjh3ZHPKDUDET2rr5BduSY5tEpjy58cgJwJeLAvZml4X
	l9Xi6/tBl3pgKRx0Ve49nYei8XsKjqOzt5aPtaAiqTXhYFDPifeETSgpLso6s3eJGwoi
	TPAuSICWQpwv4yzYga4q0tyZtjkgOPw09nm++d0RArit1DsI1fh5QbTz04ZcuqZdeoz2
	vkow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=7hitZAdNP8BAYwP0p+ZtyRfXKOl/UWiFfCkfFWxlZN4=;
	b=mcm0h2X4aXR8VXMiXgRj/Log5ENSWY4TXqI32nikxr9wvqw3BOkLxqmkTlaSLq3Y3/
	YqQDtG40+CRdSybRZ9TqLOR/q30Q/Sx+XAAjRlQUmyv3N4fhHSQbtBq6ZQk6V3c8owuO
	7l3usKND1CyRUe4uVuf+UDFcqvxTpPPtHDH1D5jSLux68k4GGywLlmFRUDEeJQQrgE4b
	xr4WHBk5UUad3LfEY1O8ccbmw9NfSd5YP8sH4pCDToIS59yjz4jF3/+PYLp3RDO9KxGi
	JXdp1kSJrNDFD/HQ27hHJ8FEnb2zKB+Gv0qVwrS4QUB/py6hP/dvy3oxJeDyVcG0NLav
	jong==
X-Gm-Message-State: AHQUAua59yPjc4ft0cVpt1Iqyp1KZduvHKKGICRTjFKUYMLMSZbCyIIl
	iRGNxHpKuwO26cBzjMlzjNd0oxGETxU=
X-Google-Smtp-Source: AHgI3IbwkFw77vD9h4VWFgm5fu3hfJMDHIZZoa7gDXvIUobhQgWiBiRPavnW8Vk87FifAdMhmLFTbQ==
X-Received: by 2002:a63:f74c:: with SMTP id f12mr1041137pgk.195.1550073318714; 
	Wed, 13 Feb 2019 07:55:18 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	p6sm12871634pfp.15.2019.02.13.07.55.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 07:55:18 -0800 (PST)
Date: Wed, 13 Feb 2019 07:54:05 -0800
Message-Id: <20190213155414.22285-27-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190213155414.22285-1-palmer@sifive.com>
References: <20190213155414.22285-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::42b
Subject: [Qemu-riscv] [PATCH v7 26/35] target/riscv: Remove shift and slt
 insn manual decoding
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
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
---
 target/riscv/insn_trans/trans_rvi.inc.c | 93 +++++++++++++++++--------
 target/riscv/translate.c                | 59 +++++-----------
 2 files changed, 81 insertions(+), 71 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
index d322ddf7fc21..d94b371b4d00 100644
--- a/target/riscv/insn_trans/trans_rvi.inc.c
+++ b/target/riscv/insn_trans/trans_rvi.inc.c
@@ -220,30 +220,25 @@ static bool trans_addi(DisasContext *ctx, arg_addi *a)
     return gen_arith_imm(ctx, a, &tcg_gen_add_tl);
 }
 
-static bool trans_slti(DisasContext *ctx, arg_slti *a)
+static void gen_slt(TCGv ret, TCGv s1, TCGv s2)
 {
-    TCGv source1;
-    source1 = tcg_temp_new();
-    gen_get_gpr(source1, a->rs1);
+    tcg_gen_setcond_tl(TCG_COND_LT, ret, s1, s2);
+}
+
+static void gen_sltu(TCGv ret, TCGv s1, TCGv s2)
+{
+    tcg_gen_setcond_tl(TCG_COND_LTU, ret, s1, s2);
+}
 
-    tcg_gen_setcondi_tl(TCG_COND_LT, source1, source1, a->imm);
 
-    gen_set_gpr(a->rd, source1);
-    tcg_temp_free(source1);
-    return true;
+static bool trans_slti(DisasContext *ctx, arg_slti *a)
+{
+    return gen_arith_imm(ctx, a, &gen_slt);
 }
 
 static bool trans_sltiu(DisasContext *ctx, arg_sltiu *a)
 {
-    TCGv source1;
-    source1 = tcg_temp_new();
-    gen_get_gpr(source1, a->rs1);
-
-    tcg_gen_setcondi_tl(TCG_COND_LTU, source1, source1, a->imm);
-
-    gen_set_gpr(a->rd, source1);
-    tcg_temp_free(source1);
-    return true;
+    return gen_arith_imm(ctx, a, &gen_sltu);
 }
 
 static bool trans_xori(DisasContext *ctx, arg_xori *a)
@@ -322,20 +317,17 @@ static bool trans_sub(DisasContext *ctx, arg_sub *a)
 
 static bool trans_sll(DisasContext *ctx, arg_sll *a)
 {
-    gen_arith(ctx, OPC_RISC_SLL, a->rd, a->rs1, a->rs2);
-    return true;
+    return gen_shift(ctx, a, &tcg_gen_shl_tl);
 }
 
 static bool trans_slt(DisasContext *ctx, arg_slt *a)
 {
-    gen_arith(ctx, OPC_RISC_SLT, a->rd, a->rs1, a->rs2);
-    return true;
+    return trans_arith(ctx, a, &gen_slt);
 }
 
 static bool trans_sltu(DisasContext *ctx, arg_sltu *a)
 {
-    gen_arith(ctx, OPC_RISC_SLTU, a->rd, a->rs1, a->rs2);
-    return true;
+    return trans_arith(ctx, a, &gen_sltu);
 }
 
 static bool trans_xor(DisasContext *ctx, arg_xor *a)
@@ -345,14 +337,12 @@ static bool trans_xor(DisasContext *ctx, arg_xor *a)
 
 static bool trans_srl(DisasContext *ctx, arg_srl *a)
 {
-    gen_arith(ctx, OPC_RISC_SRL, a->rd, a->rs1, a->rs2);
-    return true;
+    return gen_shift(ctx, a, &tcg_gen_shr_tl);
 }
 
 static bool trans_sra(DisasContext *ctx, arg_sra *a)
 {
-    gen_arith(ctx, OPC_RISC_SRA, a->rd, a->rs1, a->rs2);
-    return true;
+    return gen_shift(ctx, a, &tcg_gen_sar_tl);
 }
 
 static bool trans_or(DisasContext *ctx, arg_or *a)
@@ -419,19 +409,62 @@ static bool trans_subw(DisasContext *ctx, arg_subw *a)
 
 static bool trans_sllw(DisasContext *ctx, arg_sllw *a)
 {
-    gen_arith(ctx, OPC_RISC_SLLW, a->rd, a->rs1, a->rs2);
+    TCGv source1 = tcg_temp_new();
+    TCGv source2 = tcg_temp_new();
+
+    gen_get_gpr(source1, a->rs1);
+    gen_get_gpr(source2, a->rs2);
+
+    tcg_gen_andi_tl(source2, source2, 0x1F);
+    tcg_gen_shl_tl(source1, source1, source2);
+
+    tcg_gen_ext32s_tl(source1, source1);
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    tcg_temp_free(source2);
     return true;
 }
 
 static bool trans_srlw(DisasContext *ctx, arg_srlw *a)
 {
-    gen_arith(ctx, OPC_RISC_SRLW, a->rd, a->rs1, a->rs2);
+    TCGv source1 = tcg_temp_new();
+    TCGv source2 = tcg_temp_new();
+
+    gen_get_gpr(source1, a->rs1);
+    gen_get_gpr(source2, a->rs2);
+
+    /* clear upper 32 */
+    tcg_gen_ext32u_tl(source1, source1);
+    tcg_gen_andi_tl(source2, source2, 0x1F);
+    tcg_gen_shr_tl(source1, source1, source2);
+
+    tcg_gen_ext32s_tl(source1, source1);
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    tcg_temp_free(source2);
     return true;
 }
 
 static bool trans_sraw(DisasContext *ctx, arg_sraw *a)
 {
-    gen_arith(ctx, OPC_RISC_SRAW, a->rd, a->rs1, a->rs2);
+    TCGv source1 = tcg_temp_new();
+    TCGv source2 = tcg_temp_new();
+
+    gen_get_gpr(source1, a->rs1);
+    gen_get_gpr(source2, a->rs2);
+
+    /*
+     * first, trick to get it to act like working on 32 bits (get rid of
+     * upper 32, sign extend to fill space)
+     */
+    tcg_gen_ext32s_tl(source1, source1);
+    tcg_gen_andi_tl(source2, source2, 0x1F);
+    tcg_gen_sar_tl(source1, source1, source2);
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    tcg_temp_free(source2);
+
     return true;
 }
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 99ff11778f8a..e707081351cd 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -199,47 +199,6 @@ static void gen_arith(DisasContext *ctx, uint32_t opc, int rd, int rs1,
     gen_get_gpr(source2, rs2);
 
     switch (opc) {
-#if defined(TARGET_RISCV64)
-    case OPC_RISC_SLLW:
-        tcg_gen_andi_tl(source2, source2, 0x1F);
-        tcg_gen_shl_tl(source1, source1, source2);
-        break;
-#endif
-    case OPC_RISC_SLL:
-        tcg_gen_andi_tl(source2, source2, TARGET_LONG_BITS - 1);
-        tcg_gen_shl_tl(source1, source1, source2);
-        break;
-    case OPC_RISC_SLT:
-        tcg_gen_setcond_tl(TCG_COND_LT, source1, source1, source2);
-        break;
-    case OPC_RISC_SLTU:
-        tcg_gen_setcond_tl(TCG_COND_LTU, source1, source1, source2);
-        break;
-#if defined(TARGET_RISCV64)
-    case OPC_RISC_SRLW:
-        /* clear upper 32 */
-        tcg_gen_ext32u_tl(source1, source1);
-        tcg_gen_andi_tl(source2, source2, 0x1F);
-        tcg_gen_shr_tl(source1, source1, source2);
-        break;
-#endif
-    case OPC_RISC_SRL:
-        tcg_gen_andi_tl(source2, source2, TARGET_LONG_BITS - 1);
-        tcg_gen_shr_tl(source1, source1, source2);
-        break;
-#if defined(TARGET_RISCV64)
-    case OPC_RISC_SRAW:
-        /* first, trick to get it to act like working on 32 bits (get rid of
-        upper 32, sign extend to fill space) */
-        tcg_gen_ext32s_tl(source1, source1);
-        tcg_gen_andi_tl(source2, source2, 0x1F);
-        tcg_gen_sar_tl(source1, source1, source2);
-        break;
-#endif
-    case OPC_RISC_SRA:
-        tcg_gen_andi_tl(source2, source2, TARGET_LONG_BITS - 1);
-        tcg_gen_sar_tl(source1, source1, source2);
-        break;
     CASE_OP_32_64(OPC_RISC_MUL):
         if (!has_ext(ctx, RVM)) {
             goto do_illegal;
@@ -737,6 +696,24 @@ static bool trans_arith(DisasContext *ctx, arg_r *a,
     return true;
 }
 
+static bool gen_shift(DisasContext *ctx, arg_r *a,
+                        void(*func)(TCGv, TCGv, TCGv))
+{
+    TCGv source1 = tcg_temp_new();
+    TCGv source2 = tcg_temp_new();
+
+    gen_get_gpr(source1, a->rs1);
+    gen_get_gpr(source2, a->rs2);
+
+    tcg_gen_andi_tl(source2, source2, TARGET_LONG_BITS - 1);
+    (*func)(source1, source1, source2);
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    tcg_temp_free(source2);
+    return true;
+}
+
 /* Include insn module translation function */
 #include "insn_trans/trans_rvi.inc.c"
 #include "insn_trans/trans_rvm.inc.c"
-- 
2.18.1


