Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzq3h-0003kb-4e
	for mharc-qemu-riscv@gnu.org; Fri, 01 Mar 2019 16:51:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50511)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq3b-0003dL-N0
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:51:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq3V-0003K6-Vi
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:51:01 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:35286)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gzq3L-0002g6-HL
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:57 -0500
Received: by mail-pl1-x634.google.com with SMTP id p19so12093673plo.2
	for <qemu-riscv@nongnu.org>; Fri, 01 Mar 2019 13:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=8Kl2uhuRCkCvrFH2cyfUDVuaxaMUeEl5eWDvkVlYLGQ=;
	b=CeZfL5vwVMQ7kqfT/7Dx0SUyOfj+fSAGHI/WfaP6cSzpibBWx4HXtTBe1JSZiY1Yre
	FcrftJZvNr9mD6ZCnQoCKbto4VF278YQ+HFWXUAQA8zOumxr8VN/2Edsckig/+YhWxJN
	y06h1jKn1qHYfLxc+GKRApOqixZaTTTLAl3C04exbMv2rdBOlPkumKWwW09PgDvFznTC
	wTk/M9165djrmf0qAJtq72wBca8rqaD0mrt584APm8WYqwekmXjYMHAjiHkb8zrOJSGL
	FlB9Az4RS4d8L83XfEThk7J9XLnvYemrPk3LHROcJrq4wsjID6oZBl42mCNyuFSJaec1
	PQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=8Kl2uhuRCkCvrFH2cyfUDVuaxaMUeEl5eWDvkVlYLGQ=;
	b=E0hAyNWgT/LSTkZ4Jq0oYaYmdfGd/GEziB9oDsxYx9jvzNquL0jnYKRQ6HJHgjekL6
	Z+LMlugHsxRRY+NVzQohA5dRFafNb3zFQhK5ZcqVLWbChD842MSQ84iuKmqiw4NOVqko
	qPCkX7Sc3Beef9o72Pgbk5JQdYq75kBvI88AW4L1VLgC8HDRP2x8nDqIGqi+N+ZJqidM
	2eQzDMxMHCPrQW4MCMObQqGLIFbZQQJKgLiAxbI2Wtqvybhp9OOpQ0pkDSSJLMLYkZrE
	SPyeCnnwcB6Ujh44NgJHuX2eVTig/eT+H6tRplzAGVpoiXy1ni3Zvspwl12vDcxyK5cE
	gFSQ==
X-Gm-Message-State: APjAAAUUyk3HlhFsDaXnaxbIgTlrzfOCYW5bEJ9pmRDWiu6QNS9lyniO
	v6Ps9yEhL5gwqjOrAwcdic1fmA==
X-Google-Smtp-Source: APXvYqxeL4kzuqB2A273DM1pXIzBh6+ZdVTemBA1UuMIHUP7q3p2RyWnW29HrkKOgavWiMH6P2dTPQ==
X-Received: by 2002:a17:902:74cb:: with SMTP id
	f11mr7888252plt.180.1551477038646; 
	Fri, 01 Mar 2019 13:50:38 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	e8sm21673719pfn.103.2019.03.01.13.50.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Mar 2019 13:50:38 -0800 (PST)
Date: Fri,  1 Mar 2019 13:49:36 -0800
Message-Id: <20190301214945.4353-26-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190301214945.4353-1-palmer@sifive.com>
References: <20190301214945.4353-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::634
Subject: [Qemu-riscv] [PULL 25/34] target/riscv: Remove shift and slt insn
 manual decoding
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
X-List-Received-Date: Fri, 01 Mar 2019 21:51:06 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/insn_trans/trans_rvi.inc.c | 93 +++++++++++++++++--------
 target/riscv/translate.c                | 59 +++++-----------
 2 files changed, 81 insertions(+), 71 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
index 8879f2da35c7..88ef0003ec17 100644
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
index 8eb883463322..9ae40f65096f 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -198,47 +198,6 @@ static void gen_arith(DisasContext *ctx, uint32_t opc, int rd, int rs1,
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
@@ -742,6 +701,24 @@ static bool trans_arith(DisasContext *ctx, arg_r *a,
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


