Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzq3b-0003cg-Av
	for mharc-qemu-riscv@gnu.org; Fri, 01 Mar 2019 16:51:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50141)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq3O-0003PM-Op
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq3J-0002pX-P2
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:50 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:42890)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gzq3H-0002ap-3A
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:45 -0500
Received: by mail-pf1-x42c.google.com with SMTP id n74so12019215pfi.9
	for <qemu-riscv@nongnu.org>; Fri, 01 Mar 2019 13:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=KBvyn7/gOiCk6gDslyaXgqLaB4ecv0E0W/dCFJHjZyE=;
	b=ai7Lepg8MoNLd5/p+GHyaBev1GqycTwJrtVw4CHElri8L+YFIZ2la6dvX1+/ZenTlb
	KdfXR9rLIzQFA6rrihgsG4rONm1nrgvC+COrRzY7b5y8VtpK7/eBIle5gplc1iVOr0sy
	k2EdSuxbajH7XzABgsTIR0PIDGUh657xvh4eoy1jASiLtdZSfWP3wo3uZ542/s6morbN
	xzLbGYpwrC57CkdULy84gS2lwzw36toRGfEXq47SOeOUf6nf2dHmzyHd+Cs5N/GyfRMt
	lEbEfmALuNMYnzXbmNZt3tYE5qIrN8xhvmjdQ4HRMbMz2LKD19L5fjrZwFWn2aW93wTW
	eo9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=KBvyn7/gOiCk6gDslyaXgqLaB4ecv0E0W/dCFJHjZyE=;
	b=Fhn2n+nOvUb1sb8NvfqqcI/ZJHUiMYUGYf170HU2RmKloqHw6Wi9GHABktogADeXS+
	JqhscO5hnnQvT2ATBgTSWTQxpMaRmEd5srqmJCttXkuJ0VtKuSBSBh/j9n+DgoqGAtEy
	lBiqSiBjTbtxpppXmSHTxcYNjX1K5vDgfK4RYmf4p3bD68wnVHp+tClaSDwTOK9KJohG
	Ras9+/dhgYWVlmLZ3bhq9ChMB44kSPGKYJdF+UOTu39e4jg0wNDSX6mkLC/+SK6IgtK+
	oqTZdp6XglGP5gLZmGvxDnIebxfcq4by4jQiCyGsj+W1hUz71xG9GEw8Vz2P0aUDLyWb
	4mJw==
X-Gm-Message-State: APjAAAUqhlg97tJul0+B6YgRqSv29KTuXDx6Fz37AP578OqHeFN6AnNg
	6wvHn0fsQb9kloJr64b8aYnweA==
X-Google-Smtp-Source: APXvYqwLtH9ksHieJnAjYHCus8H12lVD9hlAguVUsnJTu3Ux63spruxFkLZA3b5z8k9kf02swvAmtA==
X-Received: by 2002:a63:2bd5:: with SMTP id r204mr7174458pgr.48.1551477035403; 
	Fri, 01 Mar 2019 13:50:35 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	f125sm15300886pfc.91.2019.03.01.13.50.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Mar 2019 13:50:34 -0800 (PST)
Date: Fri,  1 Mar 2019 13:49:34 -0800
Message-Id: <20190301214945.4353-24-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::42c
Subject: [Qemu-riscv] [PULL 23/34] target/riscv: Move gen_arith_imm()
 decoding into trans_* functions
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
X-List-Received-Date: Fri, 01 Mar 2019 21:50:55 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

gen_arith_imm() does a lot of decoding manually, which was hard to read
in case of the shift instructions and is not necessary anymore with
decodetree.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/insn32.decode              |   3 +-
 target/riscv/insn_trans/trans_rvi.inc.c |  98 +++++++++++++++++-----
 target/riscv/translate.c                | 107 ++++++------------------
 3 files changed, 108 insertions(+), 100 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index ecc46a50cc27..d6b4197841f5 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -35,12 +35,13 @@
 
 # Argument sets:
 &b    imm rs2 rs1
+&i    imm rs1 rd
 &shift     shamt rs1 rd
 &atomic    aq rl rs2 rs1 rd
 
 # Formats 32:
 @r       .......   ..... ..... ... ..... .......                   %rs2 %rs1 %rd
-@i       ............    ..... ... ..... .......         imm=%imm_i     %rs1 %rd
+@i       ............    ..... ... ..... ....... &i      imm=%imm_i     %rs1 %rd
 @b       .......   ..... ..... ... ..... ....... &b      imm=%imm_b %rs2 %rs1
 @s       .......   ..... ..... ... ..... .......         imm=%imm_s %rs2 %rs1
 @u       ....................      ..... .......         imm=%imm_u          %rd
diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
index 5a09c6335ae0..0265740bdb69 100644
--- a/target/riscv/insn_trans/trans_rvi.inc.c
+++ b/target/riscv/insn_trans/trans_rvi.inc.c
@@ -217,52 +217,96 @@ static bool trans_sd(DisasContext *ctx, arg_sd *a)
 
 static bool trans_addi(DisasContext *ctx, arg_addi *a)
 {
-    gen_arith_imm(ctx, OPC_RISC_ADDI, a->rd, a->rs1, a->imm);
-    return true;
+    return gen_arith_imm(ctx, a, &tcg_gen_add_tl);
 }
 
 static bool trans_slti(DisasContext *ctx, arg_slti *a)
 {
-    gen_arith_imm(ctx, OPC_RISC_SLTI, a->rd, a->rs1, a->imm);
+    TCGv source1;
+    source1 = tcg_temp_new();
+    gen_get_gpr(source1, a->rs1);
+
+    tcg_gen_setcondi_tl(TCG_COND_LT, source1, source1, a->imm);
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
     return true;
 }
 
 static bool trans_sltiu(DisasContext *ctx, arg_sltiu *a)
 {
-    gen_arith_imm(ctx, OPC_RISC_SLTIU, a->rd, a->rs1, a->imm);
+    TCGv source1;
+    source1 = tcg_temp_new();
+    gen_get_gpr(source1, a->rs1);
+
+    tcg_gen_setcondi_tl(TCG_COND_LTU, source1, source1, a->imm);
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
     return true;
 }
 
 static bool trans_xori(DisasContext *ctx, arg_xori *a)
 {
-    gen_arith_imm(ctx, OPC_RISC_XORI, a->rd, a->rs1, a->imm);
-    return true;
+    return gen_arith_imm(ctx, a, &tcg_gen_xor_tl);
 }
 static bool trans_ori(DisasContext *ctx, arg_ori *a)
 {
-    gen_arith_imm(ctx, OPC_RISC_ORI, a->rd, a->rs1, a->imm);
-    return true;
+    return gen_arith_imm(ctx, a, &tcg_gen_or_tl);
 }
 static bool trans_andi(DisasContext *ctx, arg_andi *a)
 {
-    gen_arith_imm(ctx, OPC_RISC_ANDI, a->rd, a->rs1, a->imm);
-    return true;
+    return gen_arith_imm(ctx, a, &tcg_gen_and_tl);
 }
 static bool trans_slli(DisasContext *ctx, arg_slli *a)
 {
-    gen_arith_imm(ctx, OPC_RISC_SLLI, a->rd, a->rs1, a->shamt);
+    if (a->shamt >= TARGET_LONG_BITS) {
+        return false;
+    }
+
+    if (a->rd != 0) {
+        TCGv t = tcg_temp_new();
+        gen_get_gpr(t, a->rs1);
+
+        tcg_gen_shli_tl(t, t, a->shamt);
+
+        gen_set_gpr(a->rd, t);
+        tcg_temp_free(t);
+    } /* NOP otherwise */
     return true;
 }
 
 static bool trans_srli(DisasContext *ctx, arg_srli *a)
 {
-    gen_arith_imm(ctx, OPC_RISC_SHIFT_RIGHT_I, a->rd, a->rs1, a->shamt);
+    if (a->shamt >= TARGET_LONG_BITS) {
+        return false;
+    }
+
+    if (a->rd != 0) {
+        TCGv t = tcg_temp_new();
+        gen_get_gpr(t, a->rs1);
+
+        tcg_gen_shri_tl(t, t, a->shamt);
+        gen_set_gpr(a->rd, t);
+        tcg_temp_free(t);
+    } /* NOP otherwise */
     return true;
 }
 
 static bool trans_srai(DisasContext *ctx, arg_srai *a)
 {
-    gen_arith_imm(ctx, OPC_RISC_SHIFT_RIGHT_I, a->rd, a->rs1, a->shamt | 0x400);
+    if (a->shamt >= TARGET_LONG_BITS) {
+        return false;
+    }
+
+    if (a->rd != 0) {
+        TCGv t = tcg_temp_new();
+        gen_get_gpr(t, a->rs1);
+
+        tcg_gen_sari_tl(t, t, a->shamt);
+        gen_set_gpr(a->rd, t);
+        tcg_temp_free(t);
+    } /* NOP otherwise */
     return true;
 }
 
@@ -329,26 +373,42 @@ static bool trans_and(DisasContext *ctx, arg_and *a)
 #ifdef TARGET_RISCV64
 static bool trans_addiw(DisasContext *ctx, arg_addiw *a)
 {
-    gen_arith_imm(ctx, OPC_RISC_ADDIW, a->rd, a->rs1, a->imm);
-    return true;
+    return gen_arith_imm(ctx, a, &gen_addw);
 }
 
 static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
 {
-    gen_arith_imm(ctx, OPC_RISC_SLLIW, a->rd, a->rs1, a->shamt);
+    TCGv source1;
+    source1 = tcg_temp_new();
+    gen_get_gpr(source1, a->rs1);
+
+    tcg_gen_shli_tl(source1, source1, a->shamt);
+    tcg_gen_ext32s_tl(source1, source1);
+    gen_set_gpr(a->rd, source1);
+
+    tcg_temp_free(source1);
     return true;
 }
 
 static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
 {
-    gen_arith_imm(ctx, OPC_RISC_SHIFT_RIGHT_IW, a->rd, a->rs1, a->shamt);
+    TCGv t = tcg_temp_new();
+    gen_get_gpr(t, a->rs1);
+    tcg_gen_extract_tl(t, t, a->shamt, 32 - a->shamt);
+    /* sign-extend for W instructions */
+    tcg_gen_ext32s_tl(t, t);
+    gen_set_gpr(a->rd, t);
+    tcg_temp_free(t);
     return true;
 }
 
 static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
 {
-    gen_arith_imm(ctx, OPC_RISC_SHIFT_RIGHT_IW , a->rd, a->rs1,
-                  a->shamt | 0x400);
+    TCGv t = tcg_temp_new();
+    gen_get_gpr(t, a->rs1);
+    tcg_gen_sextract_tl(t, t, a->shamt, 32 - a->shamt);
+    gen_set_gpr(a->rd, t);
+    tcg_temp_free(t);
     return true;
 }
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index cdc08b1bff20..0157758a160a 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -433,86 +433,6 @@ static void gen_arith(DisasContext *ctx, uint32_t opc, int rd, int rs1,
     tcg_temp_free(source2);
 }
 
-static void gen_arith_imm(DisasContext *ctx, uint32_t opc, int rd,
-        int rs1, target_long imm)
-{
-    TCGv source1 = tcg_temp_new();
-    int shift_len = TARGET_LONG_BITS;
-    int shift_a;
-
-    gen_get_gpr(source1, rs1);
-
-    switch (opc) {
-    case OPC_RISC_ADDI:
-#if defined(TARGET_RISCV64)
-    case OPC_RISC_ADDIW:
-#endif
-        tcg_gen_addi_tl(source1, source1, imm);
-        break;
-    case OPC_RISC_SLTI:
-        tcg_gen_setcondi_tl(TCG_COND_LT, source1, source1, imm);
-        break;
-    case OPC_RISC_SLTIU:
-        tcg_gen_setcondi_tl(TCG_COND_LTU, source1, source1, imm);
-        break;
-    case OPC_RISC_XORI:
-        tcg_gen_xori_tl(source1, source1, imm);
-        break;
-    case OPC_RISC_ORI:
-        tcg_gen_ori_tl(source1, source1, imm);
-        break;
-    case OPC_RISC_ANDI:
-        tcg_gen_andi_tl(source1, source1, imm);
-        break;
-#if defined(TARGET_RISCV64)
-    case OPC_RISC_SLLIW:
-        shift_len = 32;
-        /* FALLTHRU */
-#endif
-    case OPC_RISC_SLLI:
-        if (imm >= shift_len) {
-            goto do_illegal;
-        }
-        tcg_gen_shli_tl(source1, source1, imm);
-        break;
-#if defined(TARGET_RISCV64)
-    case OPC_RISC_SHIFT_RIGHT_IW:
-        shift_len = 32;
-        /* FALLTHRU */
-#endif
-    case OPC_RISC_SHIFT_RIGHT_I:
-        /* differentiate on IMM */
-        shift_a = imm & 0x400;
-        imm &= 0x3ff;
-        if (imm >= shift_len) {
-            goto do_illegal;
-        }
-        if (imm != 0) {
-            if (shift_a) {
-                /* SRAI[W] */
-                tcg_gen_sextract_tl(source1, source1, imm, shift_len - imm);
-            } else {
-                /* SRLI[W] */
-                tcg_gen_extract_tl(source1, source1, imm, shift_len - imm);
-            }
-            /* No further sign-extension needed for W instructions.  */
-            opc &= ~0x8;
-        }
-        break;
-    default:
-    do_illegal:
-        gen_exception_illegal(ctx);
-        return;
-    }
-
-    if (opc & 0x8) { /* sign-extend for W instructions */
-        tcg_gen_ext32s_tl(source1, source1);
-    }
-
-    gen_set_gpr(rd, source1);
-    tcg_temp_free(source1);
-}
-
 static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 {
     target_ulong next_pc;
@@ -785,6 +705,33 @@ static int ex_rvc_register(int reg)
 bool decode_insn32(DisasContext *ctx, uint32_t insn);
 /* Include the auto-generated decoder for 32 bit insn */
 #include "decode_insn32.inc.c"
+
+static bool gen_arith_imm(DisasContext *ctx, arg_i *a,
+                          void(*func)(TCGv, TCGv, TCGv))
+{
+    TCGv source1, source2;
+    source1 = tcg_temp_new();
+    source2 = tcg_temp_new();
+
+    gen_get_gpr(source1, a->rs1);
+    tcg_gen_movi_tl(source2, a->imm);
+
+    (*func)(source1, source1, source2);
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    tcg_temp_free(source2);
+    return true;
+}
+
+#ifdef TARGET_RISCV64
+static void gen_addw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_add_tl(ret, arg1, arg2);
+    tcg_gen_ext32s_tl(ret, ret);
+}
+#endif
+
 /* Include insn module translation function */
 #include "insn_trans/trans_rvi.inc.c"
 #include "insn_trans/trans_rvm.inc.c"
-- 
2.18.1


