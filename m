Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzq3a-0003c0-Ts
	for mharc-qemu-riscv@gnu.org; Fri, 01 Mar 2019 16:51:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50291)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq3T-0003SC-EM
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq3L-0002td-85
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:55 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:35472)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gzq3J-0002hM-NP
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:46 -0500
Received: by mail-pf1-x431.google.com with SMTP id j5so12035094pfa.2
	for <qemu-riscv@nongnu.org>; Fri, 01 Mar 2019 13:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=tbe7PM50lssu9TGx1Sx0XdbAl4/zlVOVk+U1lnS0b0g=;
	b=FmgkOjx6cJdLB6zzk3yLwWEaQL3/sB5BgpyItX5r2fBGblI/Ng4T9BuvLQYA8tElHo
	ki66CAQzBMSRDw+dr4Pza6ChVQV1OKrST0oCe5YD0nRSkB8qGkA/LOvPcYAWQE+SgV8i
	lUOurSvCju2WJ4jlAbuVUTB+Kn8HBv7/IWg8FsUOyP00oHIEI8bN6kxdU7rLM0VQRZWN
	dC3hmgT8mEH8p71FmtMl+YAzsUov5pRAsBMvU7YDSbq/P4k6NrCXonrHo6abMSF4RBSp
	jPBqmZBh+2rxG4YCpEqovSScxmAWTCPhaWPZQkrJ5UCi0rOQZtiEt06lAG+rwD5d/p3j
	vKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=tbe7PM50lssu9TGx1Sx0XdbAl4/zlVOVk+U1lnS0b0g=;
	b=TvN2RbmM8QgNVLe2NYAklFkqTY/5rAdcdCxrgjQn4y4qeLBqNHhxPzsx1gIcrjb0HC
	702I/xN4osyWj65SwSQT0olgruMJSilSH2Y8RjniwUtXOW8ZiFGaVX8lG4aydlk4l3sr
	bO391P7d6hTc084rpEKPp7NXXnR5yYUeAyPMGfLMcHr4GIljbLlbiiceZh4xvV6T7Ue2
	tS7t75WEkVAq8TYf8UtthbvkFarWGYLzKhfDrwCwIT1piBf6/2vOjzJNeyRp8w5AdCRw
	y/7rxRzaiZLbZGbhuFg5ebkLACYpellsaaIcZRU9T6uGDNFJrg/dHA+eiwCjnRC7oEhr
	SyFw==
X-Gm-Message-State: APjAAAVdg7dqtq9YzDe4JgLeQbWg3WPQbeFauQc2RZVzloyoNHg6q+4g
	E2vJNflgxKqzoJfE1IkxByXoWg==
X-Google-Smtp-Source: APXvYqwjhEqgnyrG45lKgqafgyz5WDNLAAoo9IF9TGQFaZNz7xqyh1dtD/IPLTMtckXbZtaVlWnWpg==
X-Received: by 2002:a63:1c02:: with SMTP id c2mr7014153pgc.351.1551477040353; 
	Fri, 01 Mar 2019 13:50:40 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	z12sm27081750pgv.0.2019.03.01.13.50.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Mar 2019 13:50:39 -0800 (PST)
Date: Fri,  1 Mar 2019 13:49:37 -0800
Message-Id: <20190301214945.4353-27-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::431
Subject: [Qemu-riscv] [PULL 26/34] target/riscv: Remove manual decoding of
 RV32/64M insn
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
X-List-Received-Date: Fri, 01 Mar 2019 21:50:58 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/insn_trans/trans_rvm.inc.c |  55 ++--
 target/riscv/translate.c                | 320 ++++++++++--------------
 2 files changed, 164 insertions(+), 211 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvm.inc.c b/target/riscv/insn_trans/trans_rvm.inc.c
index 69631c9e3783..d2bf2f171904 100644
--- a/target/riscv/insn_trans/trans_rvm.inc.c
+++ b/target/riscv/insn_trans/trans_rvm.inc.c
@@ -22,92 +22,99 @@
 static bool trans_mul(DisasContext *ctx, arg_mul *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    gen_arith(ctx, OPC_RISC_MUL, a->rd, a->rs1, a->rs2);
-    return true;
+    return trans_arith(ctx, a, &tcg_gen_mul_tl);
 }
 
 static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    gen_arith(ctx, OPC_RISC_MULH, a->rd, a->rs1, a->rs2);
+    TCGv source1 = tcg_temp_new();
+    TCGv source2 = tcg_temp_new();
+    gen_get_gpr(source1, a->rs1);
+    gen_get_gpr(source2, a->rs2);
+
+    tcg_gen_muls2_tl(source2, source1, source1, source2);
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    tcg_temp_free(source2);
     return true;
 }
 
 static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    gen_arith(ctx, OPC_RISC_MULHSU, a->rd, a->rs1, a->rs2);
-    return true;
+    return trans_arith(ctx, a, &gen_mulhsu);
 }
 
 static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    gen_arith(ctx, OPC_RISC_MULHU, a->rd, a->rs1, a->rs2);
+    TCGv source1 = tcg_temp_new();
+    TCGv source2 = tcg_temp_new();
+    gen_get_gpr(source1, a->rs1);
+    gen_get_gpr(source2, a->rs2);
+
+    tcg_gen_mulu2_tl(source2, source1, source1, source2);
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    tcg_temp_free(source2);
     return true;
 }
 
 static bool trans_div(DisasContext *ctx, arg_div *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    gen_arith(ctx, OPC_RISC_DIV, a->rd, a->rs1, a->rs2);
-    return true;
+    return trans_arith(ctx, a, &gen_div);
 }
 
 static bool trans_divu(DisasContext *ctx, arg_divu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    gen_arith(ctx, OPC_RISC_DIVU, a->rd, a->rs1, a->rs2);
-    return true;
+    return trans_arith(ctx, a, &gen_divu);
 }
 
 static bool trans_rem(DisasContext *ctx, arg_rem *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    gen_arith(ctx, OPC_RISC_REM, a->rd, a->rs1, a->rs2);
-    return true;
+    return trans_arith(ctx, a, &gen_rem);
 }
 
 static bool trans_remu(DisasContext *ctx, arg_remu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    gen_arith(ctx, OPC_RISC_REMU, a->rd, a->rs1, a->rs2);
-    return true;
+    return trans_arith(ctx, a, &gen_remu);
 }
 
 #ifdef TARGET_RISCV64
 static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    gen_arith(ctx, OPC_RISC_MULW, a->rd, a->rs1, a->rs2);
-    return true;
+    return trans_arith(ctx, a, &gen_mulw);
 }
 
 static bool trans_divw(DisasContext *ctx, arg_divw *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    gen_arith(ctx, OPC_RISC_DIVW, a->rd, a->rs1, a->rs2);
-    return true;
+    return gen_arith_div_w(ctx, a, &gen_div);
 }
 
 static bool trans_divuw(DisasContext *ctx, arg_divuw *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    gen_arith(ctx, OPC_RISC_DIVUW, a->rd, a->rs1, a->rs2);
-    return true;
+    return gen_arith_div_w(ctx, a, &gen_divu);
 }
 
 static bool trans_remw(DisasContext *ctx, arg_remw *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    gen_arith(ctx, OPC_RISC_REMW, a->rd, a->rs1, a->rs2);
-    return true;
+    return gen_arith_div_w(ctx, a, &gen_rem);
 }
 
 static bool trans_remuw(DisasContext *ctx, arg_remuw *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    gen_arith(ctx, OPC_RISC_REMUW, a->rd, a->rs1, a->rs2);
-    return true;
+    return gen_arith_div_w(ctx, a, &gen_remu);
 }
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 9ae40f65096f..3cd7e16c63cf 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -188,193 +188,112 @@ static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_temp_free(rh);
 }
 
-static void gen_arith(DisasContext *ctx, uint32_t opc, int rd, int rs1,
-        int rs2)
-{
-    TCGv source1, source2, cond1, cond2, zeroreg, resultopt1;
-    source1 = tcg_temp_new();
-    source2 = tcg_temp_new();
-    gen_get_gpr(source1, rs1);
-    gen_get_gpr(source2, rs2);
-
-    switch (opc) {
-    CASE_OP_32_64(OPC_RISC_MUL):
-        if (!has_ext(ctx, RVM)) {
-            goto do_illegal;
-        }
-        tcg_gen_mul_tl(source1, source1, source2);
-        break;
-    case OPC_RISC_MULH:
-        if (!has_ext(ctx, RVM)) {
-            goto do_illegal;
-        }
-        tcg_gen_muls2_tl(source2, source1, source1, source2);
-        break;
-    case OPC_RISC_MULHSU:
-        if (!has_ext(ctx, RVM)) {
-            goto do_illegal;
-        }
-        gen_mulhsu(source1, source1, source2);
-        break;
-    case OPC_RISC_MULHU:
-        if (!has_ext(ctx, RVM)) {
-            goto do_illegal;
-        }
-        tcg_gen_mulu2_tl(source2, source1, source1, source2);
-        break;
-#if defined(TARGET_RISCV64)
-    case OPC_RISC_DIVW:
-        if (!has_ext(ctx, RVM)) {
-            goto do_illegal;
-        }
-        tcg_gen_ext32s_tl(source1, source1);
-        tcg_gen_ext32s_tl(source2, source2);
-        /* fall through to DIV */
-#endif
-    case OPC_RISC_DIV:
-        if (!has_ext(ctx, RVM)) {
-            goto do_illegal;
-        }
-        /* Handle by altering args to tcg_gen_div to produce req'd results:
-         * For overflow: want source1 in source1 and 1 in source2
-         * For div by zero: want -1 in source1 and 1 in source2 -> -1 result */
-        cond1 = tcg_temp_new();
-        cond2 = tcg_temp_new();
-        zeroreg = tcg_const_tl(0);
-        resultopt1 = tcg_temp_new();
-
-        tcg_gen_movi_tl(resultopt1, (target_ulong)-1);
-        tcg_gen_setcondi_tl(TCG_COND_EQ, cond2, source2, (target_ulong)(~0L));
-        tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source1,
-                            ((target_ulong)1) << (TARGET_LONG_BITS - 1));
-        tcg_gen_and_tl(cond1, cond1, cond2); /* cond1 = overflow */
-        tcg_gen_setcondi_tl(TCG_COND_EQ, cond2, source2, 0); /* cond2 = div 0 */
-        /* if div by zero, set source1 to -1, otherwise don't change */
-        tcg_gen_movcond_tl(TCG_COND_EQ, source1, cond2, zeroreg, source1,
-                resultopt1);
-        /* if overflow or div by zero, set source2 to 1, else don't change */
-        tcg_gen_or_tl(cond1, cond1, cond2);
-        tcg_gen_movi_tl(resultopt1, (target_ulong)1);
-        tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond1, zeroreg, source2,
-                resultopt1);
-        tcg_gen_div_tl(source1, source1, source2);
-
-        tcg_temp_free(cond1);
-        tcg_temp_free(cond2);
-        tcg_temp_free(zeroreg);
-        tcg_temp_free(resultopt1);
-        break;
-#if defined(TARGET_RISCV64)
-    case OPC_RISC_DIVUW:
-        if (!has_ext(ctx, RVM)) {
-            goto do_illegal;
-        }
-        tcg_gen_ext32u_tl(source1, source1);
-        tcg_gen_ext32u_tl(source2, source2);
-        /* fall through to DIVU */
-#endif
-    case OPC_RISC_DIVU:
-        if (!has_ext(ctx, RVM)) {
-            goto do_illegal;
-        }
-        cond1 = tcg_temp_new();
-        zeroreg = tcg_const_tl(0);
-        resultopt1 = tcg_temp_new();
-
-        tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source2, 0);
-        tcg_gen_movi_tl(resultopt1, (target_ulong)-1);
-        tcg_gen_movcond_tl(TCG_COND_EQ, source1, cond1, zeroreg, source1,
-                resultopt1);
-        tcg_gen_movi_tl(resultopt1, (target_ulong)1);
-        tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond1, zeroreg, source2,
-                resultopt1);
-        tcg_gen_divu_tl(source1, source1, source2);
-
-        tcg_temp_free(cond1);
-        tcg_temp_free(zeroreg);
-        tcg_temp_free(resultopt1);
-        break;
-#if defined(TARGET_RISCV64)
-    case OPC_RISC_REMW:
-        if (!has_ext(ctx, RVM)) {
-            goto do_illegal;
-        }
-        tcg_gen_ext32s_tl(source1, source1);
-        tcg_gen_ext32s_tl(source2, source2);
-        /* fall through to REM */
-#endif
-    case OPC_RISC_REM:
-        if (!has_ext(ctx, RVM)) {
-            goto do_illegal;
-        }
-        cond1 = tcg_temp_new();
-        cond2 = tcg_temp_new();
-        zeroreg = tcg_const_tl(0);
-        resultopt1 = tcg_temp_new();
-
-        tcg_gen_movi_tl(resultopt1, 1L);
-        tcg_gen_setcondi_tl(TCG_COND_EQ, cond2, source2, (target_ulong)-1);
-        tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source1,
-                            (target_ulong)1 << (TARGET_LONG_BITS - 1));
-        tcg_gen_and_tl(cond2, cond1, cond2); /* cond1 = overflow */
-        tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source2, 0); /* cond2 = div 0 */
-        /* if overflow or div by zero, set source2 to 1, else don't change */
-        tcg_gen_or_tl(cond2, cond1, cond2);
-        tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond2, zeroreg, source2,
-                resultopt1);
-        tcg_gen_rem_tl(resultopt1, source1, source2);
-        /* if div by zero, just return the original dividend */
-        tcg_gen_movcond_tl(TCG_COND_EQ, source1, cond1, zeroreg, resultopt1,
-                source1);
-
-        tcg_temp_free(cond1);
-        tcg_temp_free(cond2);
-        tcg_temp_free(zeroreg);
-        tcg_temp_free(resultopt1);
-        break;
-#if defined(TARGET_RISCV64)
-    case OPC_RISC_REMUW:
-        if (!has_ext(ctx, RVM)) {
-            goto do_illegal;
-        }
-        tcg_gen_ext32u_tl(source1, source1);
-        tcg_gen_ext32u_tl(source2, source2);
-        /* fall through to REMU */
-#endif
-    case OPC_RISC_REMU:
-        if (!has_ext(ctx, RVM)) {
-            goto do_illegal;
-        }
-        cond1 = tcg_temp_new();
-        zeroreg = tcg_const_tl(0);
-        resultopt1 = tcg_temp_new();
-
-        tcg_gen_movi_tl(resultopt1, (target_ulong)1);
-        tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source2, 0);
-        tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond1, zeroreg, source2,
-                resultopt1);
-        tcg_gen_remu_tl(resultopt1, source1, source2);
-        /* if div by zero, just return the original dividend */
-        tcg_gen_movcond_tl(TCG_COND_EQ, source1, cond1, zeroreg, resultopt1,
-                source1);
-
-        tcg_temp_free(cond1);
-        tcg_temp_free(zeroreg);
-        tcg_temp_free(resultopt1);
-        break;
-    do_illegal:
-    default:
-        gen_exception_illegal(ctx);
-        return;
-    }
-
-    if (opc & 0x8) { /* sign extend for W instructions */
-        tcg_gen_ext32s_tl(source1, source1);
-    }
-
-    gen_set_gpr(rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
+static void gen_div(TCGv ret, TCGv source1, TCGv source2)
+{
+    TCGv cond1, cond2, zeroreg, resultopt1;
+    /*
+     * Handle by altering args to tcg_gen_div to produce req'd results:
+     * For overflow: want source1 in source1 and 1 in source2
+     * For div by zero: want -1 in source1 and 1 in source2 -> -1 result
+     */
+    cond1 = tcg_temp_new();
+    cond2 = tcg_temp_new();
+    zeroreg = tcg_const_tl(0);
+    resultopt1 = tcg_temp_new();
+
+    tcg_gen_movi_tl(resultopt1, (target_ulong)-1);
+    tcg_gen_setcondi_tl(TCG_COND_EQ, cond2, source2, (target_ulong)(~0L));
+    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source1,
+                        ((target_ulong)1) << (TARGET_LONG_BITS - 1));
+    tcg_gen_and_tl(cond1, cond1, cond2); /* cond1 = overflow */
+    tcg_gen_setcondi_tl(TCG_COND_EQ, cond2, source2, 0); /* cond2 = div 0 */
+    /* if div by zero, set source1 to -1, otherwise don't change */
+    tcg_gen_movcond_tl(TCG_COND_EQ, source1, cond2, zeroreg, source1,
+            resultopt1);
+    /* if overflow or div by zero, set source2 to 1, else don't change */
+    tcg_gen_or_tl(cond1, cond1, cond2);
+    tcg_gen_movi_tl(resultopt1, (target_ulong)1);
+    tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond1, zeroreg, source2,
+            resultopt1);
+    tcg_gen_div_tl(ret, source1, source2);
+
+    tcg_temp_free(cond1);
+    tcg_temp_free(cond2);
+    tcg_temp_free(zeroreg);
+    tcg_temp_free(resultopt1);
+}
+
+static void gen_divu(TCGv ret, TCGv source1, TCGv source2)
+{
+    TCGv cond1, zeroreg, resultopt1;
+    cond1 = tcg_temp_new();
+
+    zeroreg = tcg_const_tl(0);
+    resultopt1 = tcg_temp_new();
+
+    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source2, 0);
+    tcg_gen_movi_tl(resultopt1, (target_ulong)-1);
+    tcg_gen_movcond_tl(TCG_COND_EQ, source1, cond1, zeroreg, source1,
+            resultopt1);
+    tcg_gen_movi_tl(resultopt1, (target_ulong)1);
+    tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond1, zeroreg, source2,
+            resultopt1);
+    tcg_gen_divu_tl(ret, source1, source2);
+
+    tcg_temp_free(cond1);
+    tcg_temp_free(zeroreg);
+    tcg_temp_free(resultopt1);
+}
+
+static void gen_rem(TCGv ret, TCGv source1, TCGv source2)
+{
+    TCGv cond1, cond2, zeroreg, resultopt1;
+
+    cond1 = tcg_temp_new();
+    cond2 = tcg_temp_new();
+    zeroreg = tcg_const_tl(0);
+    resultopt1 = tcg_temp_new();
+
+    tcg_gen_movi_tl(resultopt1, 1L);
+    tcg_gen_setcondi_tl(TCG_COND_EQ, cond2, source2, (target_ulong)-1);
+    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source1,
+                        (target_ulong)1 << (TARGET_LONG_BITS - 1));
+    tcg_gen_and_tl(cond2, cond1, cond2); /* cond1 = overflow */
+    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source2, 0); /* cond2 = div 0 */
+    /* if overflow or div by zero, set source2 to 1, else don't change */
+    tcg_gen_or_tl(cond2, cond1, cond2);
+    tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond2, zeroreg, source2,
+            resultopt1);
+    tcg_gen_rem_tl(resultopt1, source1, source2);
+    /* if div by zero, just return the original dividend */
+    tcg_gen_movcond_tl(TCG_COND_EQ, ret, cond1, zeroreg, resultopt1,
+            source1);
+
+    tcg_temp_free(cond1);
+    tcg_temp_free(cond2);
+    tcg_temp_free(zeroreg);
+    tcg_temp_free(resultopt1);
+}
+
+static void gen_remu(TCGv ret, TCGv source1, TCGv source2)
+{
+    TCGv cond1, zeroreg, resultopt1;
+    cond1 = tcg_temp_new();
+    zeroreg = tcg_const_tl(0);
+    resultopt1 = tcg_temp_new();
+
+    tcg_gen_movi_tl(resultopt1, (target_ulong)1);
+    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source2, 0);
+    tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond1, zeroreg, source2,
+            resultopt1);
+    tcg_gen_remu_tl(resultopt1, source1, source2);
+    /* if div by zero, just return the original dividend */
+    tcg_gen_movcond_tl(TCG_COND_EQ, ret, cond1, zeroreg, resultopt1,
+            source1);
+
+    tcg_temp_free(cond1);
+    tcg_temp_free(zeroreg);
+    tcg_temp_free(resultopt1);
 }
 
 static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
@@ -681,6 +600,33 @@ static void gen_subw(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_gen_ext32s_tl(ret, ret);
 }
 
+static void gen_mulw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_mul_tl(ret, arg1, arg2);
+    tcg_gen_ext32s_tl(ret, ret);
+}
+
+static bool gen_arith_div_w(DisasContext *ctx, arg_r *a,
+                            void(*func)(TCGv, TCGv, TCGv))
+{
+    TCGv source1, source2;
+    source1 = tcg_temp_new();
+    source2 = tcg_temp_new();
+
+    gen_get_gpr(source1, a->rs1);
+    gen_get_gpr(source2, a->rs2);
+    tcg_gen_ext32s_tl(source1, source1);
+    tcg_gen_ext32s_tl(source2, source2);
+
+    (*func)(source1, source1, source2);
+
+    tcg_gen_ext32s_tl(source1, source1);
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    tcg_temp_free(source2);
+    return true;
+}
+
 #endif
 
 static bool trans_arith(DisasContext *ctx, arg_r *a,
-- 
2.18.1


