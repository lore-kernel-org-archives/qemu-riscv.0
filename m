Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mRVbn-0002x2-1h
	for mharc-qemu-riscv@gnu.org; Sat, 18 Sep 2021 04:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tangxingxin1008@gmail.com>)
 id 1mRTqW-0002o5-Rw; Sat, 18 Sep 2021 02:29:09 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:43723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tangxingxin1008@gmail.com>)
 id 1mRTqU-0003Q8-Bu; Sat, 18 Sep 2021 02:29:08 -0400
Received: by mail-pf1-x432.google.com with SMTP id c1so8310920pfp.10;
 Fri, 17 Sep 2021 23:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tCkNuygnDGFJb1Lm71vzIjKT5IRddjT0664w09UF1Xw=;
 b=aBwsrK+3ykDOc206ho3At978NInFmbZ48Z+hn88XSlerGBZNP75/lqBtyUF0vSjb88
 ZfZ0LltFV0Q3XY01PPdEd35rd1aUpBxSKVCO3pMh45PXlCIsu0c6jRRcrBF3ozuV8Ari
 sTMhpysWkbsVq/CvBdMAiPrIlzi05NLchSYI7r1TNHmjW8CBCASAoxB7Pb5EH9HQVCZj
 3PpSwPJzLUlLDY84muP2nGz4GLvCePeigrT5RE7zMpFmolV/SsHLd7BbYnGFGGejFR40
 1kR95f/FSZW/p8l3VmtQ0mDfPq+INDe4zCfiUcG3AZWtccLn1L4pmxbYvOBNiTE4gBH2
 3dLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tCkNuygnDGFJb1Lm71vzIjKT5IRddjT0664w09UF1Xw=;
 b=vK5BvE5ysT5M6L9Tjt8agiO+VB1GIWYHYlcJotFe7ko8rEyLMN1OctsFmbUXpMeJVZ
 RMNfktwSnKj4+9wYJPInr4969KRGYLo3Rl7NnscttBTG3HWDBAe9KqhtR2Akdnh6ym7V
 LvSLJlhLYxJun42g6h8lRuob4+ynjzoeioWCTBd4n4AjiD+e3/PPfHLrHnhgqJxCK4Qk
 nOHbXsS4wu0MGp2aVne6yw2nWD9EOa1JBd7vUzU96UWUJCmirnBsc2hj3Z8q1bxZwdJ8
 amA/wmHbeWr15mv0w8r4I84d3ltKRO2YgWbVaD3e//XfTcpBb37SV75kakmoSRE2YO7B
 j3XQ==
X-Gm-Message-State: AOAM530lm/47GMkWpzY5mmkHTz8VSwtXpuva4kArmbFsvdV/1vYe6vag
 brr/QHjDu1brtdPS4/6Pe0jOxP2UUBMdvfln
X-Google-Smtp-Source: ABdhPJykjFMNNJZzc7AsUp+GsgtJhZAEpcVvXFyW2JH8Y6j2MCFvFH+hMPVYXXSKORFU4DpPfTXFgg==
X-Received: by 2002:a63:69c6:: with SMTP id e189mr4894167pgc.187.1631946544632; 
 Fri, 17 Sep 2021 23:29:04 -0700 (PDT)
Received: from eric-OptiPlex-7080.starfivetech.com (ip164.ip-51-195-37.eu.
 [51.195.37.164])
 by smtp.gmail.com with ESMTPSA id f27sm8126432pfq.78.2021.09.17.23.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 23:29:04 -0700 (PDT)
From: Eric Tang <tangxingxin1008@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com,
	alistair.francis@wdc.com,
	bin.meng@windriver.com
Subject: [RFC 04/10] target/riscv: rvb: add generalized shuffle instructions
Date: Sat, 18 Sep 2021 14:28:10 +0800
Message-Id: <20210918062816.7546-5-tangxingxin1008@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210918062816.7546-1-tangxingxin1008@gmail.com>
References: <20210918062816.7546-1-tangxingxin1008@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=tangxingxin1008@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 18 Sep 2021 04:21:51 -0400
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 18 Sep 2021 06:29:09 -0000

Signed-off-by: Eric Tang <tangxingxin1008@gmail.com>

diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
index e31cf582ca..19c64756c5 100644
--- a/target/riscv/bitmanip_helper.c
+++ b/target/riscv/bitmanip_helper.c
@@ -123,3 +123,85 @@ target_ulong HELPER(clmulr)(target_ulong rs1, target_ulong rs2)
 {
     return do_clmulr(rs1, rs2, TARGET_LONG_BITS);
 }
+
+static target_ulong shuffle_stage(target_ulong src,
+                                  uint64_t maskl,
+                                  uint64_t maskr,
+                                  int n)
+{
+    target_ulong x = src & ~(maskl | maskr);
+    x |= ((src << n) & maskl) | ((src >> n) & maskr);
+    return x;
+}
+
+static target_ulong do_shfl(target_ulong rs1,
+                            target_ulong rs2,
+                            int bits)
+{
+    target_ulong x = rs1;
+    int shamt = rs2 & ((bits - 1) >> 1);
+
+    if (shamt & 16) {
+        x = shuffle_stage(x, 0x0000ffff00000000LL, 0x00000000ffff0000LL, 16);
+    }
+    if (shamt & 8) {
+        x = shuffle_stage(x, 0x00ff000000ff0000LL, 0x0000ff000000ff00LL, 8);
+    }
+    if (shamt & 4) {
+        x = shuffle_stage(x, 0x0f000f000f000f00LL, 0x00f000f000f000f0LL, 4);
+    }
+    if (shamt & 2) {
+        x = shuffle_stage(x, 0x3030303030303030LL, 0x0c0c0c0c0c0c0c0cLL, 2);
+    }
+    if (shamt & 1) {
+        x = shuffle_stage(x, 0x4444444444444444LL, 0x2222222222222222LL, 1);
+    }
+
+    return x;
+}
+
+static target_ulong do_unshfl(target_ulong rs1,
+                              target_ulong rs2,
+                              int bits)
+{
+    target_ulong x = rs1;
+    int shamt = rs2 & ((bits - 1) >> 1);
+
+    if (shamt & 1) {
+        x = shuffle_stage(x, 0x4444444444444444LL, 0x2222222222222222LL, 1);
+    }
+    if (shamt & 2) {
+        x = shuffle_stage(x, 0x3030303030303030LL, 0x0c0c0c0c0c0c0c0cLL, 2);
+    }
+    if (shamt & 4) {
+        x = shuffle_stage(x, 0x0f000f000f000f00LL, 0x00f000f000f000f0LL, 4);
+    }
+    if (shamt & 8) {
+        x = shuffle_stage(x, 0x00ff000000ff0000LL, 0x0000ff000000ff00LL, 8);
+    }
+    if (shamt & 16) {
+        x = shuffle_stage(x, 0x0000ffff00000000LL, 0x00000000ffff0000LL, 16);
+    }
+
+    return x;
+}
+
+target_ulong HELPER(shfl)(target_ulong rs1, target_ulong rs2)
+{
+    return do_shfl(rs1, rs2, TARGET_LONG_BITS);
+}
+
+target_ulong HELPER(unshfl)(target_ulong rs1, target_ulong rs2)
+{
+    return do_unshfl(rs1, rs2, TARGET_LONG_BITS);
+}
+
+target_ulong HELPER(shflw)(target_ulong rs1, target_ulong rs2)
+{
+    return do_shfl(rs1, rs2, 32);
+}
+
+target_ulong HELPER(unshflw)(target_ulong rs1, target_ulong rs2)
+{
+    return do_unshfl(rs1, rs2, 32);
+}
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 7cbcee48e6..015526faf0 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -66,6 +66,10 @@ DEF_HELPER_FLAGS_2(gorcw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(clmul, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(clmulh, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(clmulr, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(shfl, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(unshfl, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(shflw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(unshflw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 
 /* Special functions */
 DEF_HELPER_2(csrr, tl, env, int)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 989ea3c602..e70a38a5c6 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -23,6 +23,7 @@
 %rd        7:5
 %sh5       20:5
 
+%sh6    20:6
 %sh7    20:7
 %csr    20:12
 %rm     12:3
@@ -63,6 +64,7 @@
 @j       ....................      ..... ....... &j      imm=%imm_j          %rd
 
 @sh      ......  ...... .....  ... ..... ....... &shift  shamt=%sh7     %rs1 %rd
+@sh6     ......  ...... .....  ... ..... ....... &shift  shamt=%sh6     %rs1 %rd
 @csr     ............   .....  ... ..... .......               %csr     %rs1 %rd
 
 @atom_ld ..... aq:1 rl:1 ..... ........ ..... ....... &atomic rs2=0     %rs1 %rd
@@ -695,6 +697,8 @@ sh3add     0010000 .......... 110 ..... 0110011 @r
 clmul      0000101 .......... 001 ..... 0110011 @r
 clmulh     0000101 .......... 011 ..... 0110011 @r
 clmulr     0000101 .......... 010 ..... 0110011 @r
+shfl       0000100 .......... 001 ..... 0110011 @r
+unshfl     0000100 .......... 101 ..... 0110011 @r
 cmix       .....11 .......... 001 ..... 0110011 @r4
 cmov       .....11 .......... 101 ..... 0110011 @r4
 
@@ -707,6 +711,8 @@ sroi       00100. ........... 101 ..... 0010011 @sh
 rori       01100. ........... 101 ..... 0010011 @sh
 grevi      01101. ........... 101 ..... 0010011 @sh
 gorci      00101. ........... 101 ..... 0010011 @sh
+shfli      000010 ........... 001 ..... 0010011 @sh6
+unshfli    000010 ........... 101 ..... 0010011 @sh6
 
 # *** RV64B Standard Extension (in addition to RV32B) ***
 clzw       0110000 00000 ..... 001 ..... 0011011 @r2
@@ -729,6 +735,8 @@ sh1add_uw  0010000 .......... 010 ..... 0111011 @r
 sh2add_uw  0010000 .......... 100 ..... 0111011 @r
 sh3add_uw  0010000 .......... 110 ..... 0111011 @r
 add_uw     0000100 .......... 000 ..... 0111011 @r
+shflw      0000100 .......... 001 ..... 0111011 @r
+unshflw    0000100 .......... 101 ..... 0111011 @r
 
 bsetiw     0010100 .......... 001 ..... 0011011 @sh5
 bclriw     0100100 .......... 001 ..... 0011011 @sh5
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index ebcbb341cb..cbd48b4c8c 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -321,6 +321,36 @@ static bool trans_gorci(DisasContext *ctx, arg_gorci *a)
     return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_helper_gorc);
 }
 
+static bool trans_shfl(DisasContext *ctx, arg_shfl *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_shfl);
+}
+
+static bool trans_unshfl(DisasContext *ctx, arg_unshfl *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_unshfl);
+}
+
+static bool trans_shfli(DisasContext *ctx, arg_shfli *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    if (a->shamt >= (TARGET_LONG_BITS / 2)) {
+        return false;
+    }
+    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_helper_shfl);
+}
+
+static bool trans_unshfli(DisasContext *ctx, arg_unshfli *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    if (a->shamt >= (TARGET_LONG_BITS / 2)) {
+        return false;
+    }
+    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_helper_unshfl);
+}
+
 #define GEN_TRANS_CLMUL(NAME)                               \
 static bool trans_##NAME(DisasContext *ctx, arg_##NAME * a) \
 {                                                           \
@@ -703,3 +733,19 @@ static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
     REQUIRE_EXT(ctx, RVB);
     return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_slli_uw);
 }
+
+static bool trans_shflw(DisasContext *ctx, arg_shflw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    ctx->w = true;
+    return gen_arith(ctx, a, EXT_ZERO, gen_helper_shflw);
+}
+
+static bool trans_unshflw(DisasContext *ctx, arg_unshflw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    ctx->w = true;
+    return gen_arith(ctx, a, EXT_ZERO, gen_helper_unshflw);
+}
-- 
2.17.1


