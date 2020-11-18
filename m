Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfItW-0001qG-LD
	for mharc-qemu-riscv@gnu.org; Wed, 18 Nov 2020 03:32:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfItV-0001lc-1M
 for qemu-riscv@nongnu.org; Wed, 18 Nov 2020 03:32:49 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:43352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfItS-0004pF-Pr
 for qemu-riscv@nongnu.org; Wed, 18 Nov 2020 03:32:48 -0500
Received: by mail-pf1-x436.google.com with SMTP id i8so939799pfk.10
 for <qemu-riscv@nongnu.org>; Wed, 18 Nov 2020 00:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QAaoUJ75vmbJYxfN/64qLUxzeWb8lRPwE3N/AKXkZfw=;
 b=FWlNxAiMLPOD4CLeN0wNeQlSphyaWEIeqRw+Z4/XgeeU3FCI3uAD3ZVNYl7cKpw0xc
 KHKE5tch9/XhGU2yrIfmC3hOUax9fKMWDx8+u0Fud/ZADb1hkHaaGF3CFA1Qwb/qgabM
 gGdFSxK7UAcIth2SKRuN7j58Y8vDiRFUdebuIcvYRI1VVwTZKPxCiEpk0oC7WXB6qfea
 IFpTL9KYpRfBClfvTfnPoVNvwKxRZtryZ7tjsvTlrwmXd+bxrXmtf3wSzAwVmf1ZoHrk
 1swmqhrSI70LD0jFpfk6szpi3vCDwTt2Ss/M8cvMaKh9RnHt0o/Z/82dkY/aT4y6PkKS
 vfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QAaoUJ75vmbJYxfN/64qLUxzeWb8lRPwE3N/AKXkZfw=;
 b=LmwDtnhnpfn2DoIvvwxGbY+6ewByHqsJ5s/BH9hX666954RBvFShWhKrW/o2G71vRP
 d1qvchjLrA+Z1w0Ud4H90EpHpGXfOO6e3ngmmUd9dDnfxAK82vQvd1vZyRKoOdU4eF3L
 jMVnkVuLqgGaGxndiLD2dpTI+SiQXnYwLy7KjLKxOanChFkfOrcM08eWFvJ/aU9OUx/X
 y+h+B8NtRi1ekKIVisYko26ig4ltzkNPdSGw2FvPl/JU9hGGnZ2f4KlwQWp9sYuT5U+D
 ZBE/LuM/jJwkRCYAfltrL7zz7KqesQjZTkjfos166ZKrS2/irF61v6omW4epo6U3cRDs
 u3/A==
X-Gm-Message-State: AOAM533yNh9EgDUEsGiwiey9pjCAFBpZGgC1zABbKK+QVmyl4A7bVEZg
 fJR51rpEJw97nIiGTCJ1mcqKAg==
X-Google-Smtp-Source: ABdhPJyhECiOidoOf7jY0uBwPC6yPdFv6Qim9yP4V03Vd7jBrlo6Y2jlF4Iajmxq9VoegwDDSIPMOQ==
X-Received: by 2002:a63:cc50:: with SMTP id q16mr7555128pgi.246.1605688365557; 
 Wed, 18 Nov 2020 00:32:45 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id y10sm1618407pjm.34.2020.11.18.00.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:32:45 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Frank Chang <frank.chang@sifive.com>
Subject: [RFC 08/15] target/riscv: rvb: single-bit instructions
Date: Wed, 18 Nov 2020 16:29:46 +0800
Message-Id: <20201118083044.13992-9-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201118083044.13992-1-frank.chang@sifive.com>
References: <20201118083044.13992-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x436.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Wed, 18 Nov 2020 08:32:49 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
---
 target/riscv/insn32-64.decode           |   8 ++
 target/riscv/insn32.decode              |   9 ++
 target/riscv/insn_trans/trans_rvb.c.inc |  90 ++++++++++++++
 target/riscv/translate.c                | 155 ++++++++++++++++++++++++
 4 files changed, 262 insertions(+)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 2f00f96e36b..92f3aaac3b6 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -94,3 +94,11 @@ pcntw      011000000010 ..... 001 ..... 0011011 @r2
 
 packw      0000100 .......... 100 ..... 0111011 @r
 packuw     0100100 .......... 100 ..... 0111011 @r
+sbsetw     0010100 .......... 001 ..... 0111011 @r
+sbclrw     0100100 .......... 001 ..... 0111011 @r
+sbinvw     0110100 .......... 001 ..... 0111011 @r
+sbextw     0100100 .......... 101 ..... 0111011 @r
+
+sbsetiw    0010100 .......... 001 ..... 0011011 @sh5
+sbclriw    0100100 .......... 001 ..... 0011011 @sh5
+sbinviw    0110100 .......... 001 ..... 0011011 @sh5
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 626641333c6..69e542da19c 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -611,3 +611,12 @@ min        0000101 .......... 100 ..... 0110011 @r
 minu       0000101 .......... 101 ..... 0110011 @r
 max        0000101 .......... 110 ..... 0110011 @r
 maxu       0000101 .......... 111 ..... 0110011 @r
+sbset      0010100 .......... 001 ..... 0110011 @r
+sbclr      0100100 .......... 001 ..... 0110011 @r
+sbinv      0110100 .......... 001 ..... 0110011 @r
+sbext      0100100 .......... 101 ..... 0110011 @r
+
+sbseti     001010 ........... 001 ..... 0010011 @sh
+sbclri     010010 ........... 001 ..... 0010011 @sh
+sbinvi     011010 ........... 001 ..... 0010011 @sh
+sbexti     010010 ........... 101 ..... 0010011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index bf15611f85a..dabf8e09c3d 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -107,6 +107,54 @@ static bool trans_sext_h(DisasContext *ctx, arg_sext_h *a)
     return gen_unary(ctx, a, &tcg_gen_ext16s_tl);
 }
 
+static bool trans_sbset(DisasContext *ctx, arg_sbset *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_sbset);
+}
+
+static bool trans_sbseti(DisasContext *ctx, arg_sbseti *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith_shamt_tl(ctx, a, &gen_sbset);
+}
+
+static bool trans_sbclr(DisasContext *ctx, arg_sbclr *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_sbclr);
+}
+
+static bool trans_sbclri(DisasContext *ctx, arg_sbclri *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith_shamt_tl(ctx, a, &gen_sbclr);
+}
+
+static bool trans_sbinv(DisasContext *ctx, arg_sbinv *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_sbinv);
+}
+
+static bool trans_sbinvi(DisasContext *ctx, arg_sbinvi *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith_shamt_tl(ctx, a, &gen_sbinv);
+}
+
+static bool trans_sbext(DisasContext *ctx, arg_sbext *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_sbext);
+}
+
+static bool trans_sbexti(DisasContext *ctx, arg_sbexti *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith_shamt_tl(ctx, a, &gen_sbext);
+}
+
 {
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
@@ -141,4 +189,46 @@ static bool trans_packuw(DisasContext *ctx, arg_packuw *a)
     return gen_arith(ctx, a, &gen_packuw);
 }
 
+static bool trans_sbsetw(DisasContext *ctx, arg_sbsetw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_sbsetw);
+}
+
+static bool trans_sbsetiw(DisasContext *ctx, arg_sbsetiw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith_shamt_tl(ctx, a, &gen_sbsetw);
+}
+
+static bool trans_sbclrw(DisasContext *ctx, arg_sbclrw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_sbclrw);
+}
+
+static bool trans_sbclriw(DisasContext *ctx, arg_sbclriw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith_shamt_tl(ctx, a, &gen_sbclrw);
+}
+
+static bool trans_sbinvw(DisasContext *ctx, arg_sbinvw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_sbinvw);
+}
+
+static bool trans_sbinviw(DisasContext *ctx, arg_sbinviw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith_shamt_tl(ctx, a, &gen_sbinvw);
+}
+
+static bool trans_sbextw(DisasContext *ctx, arg_sbextw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_sbextw);
+}
+
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index fb30ee83aa8..e7d9e4a1abf 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -647,6 +647,24 @@ static bool gen_arith_imm_tl(DisasContext *ctx, arg_i *a,
     return true;
 }
 
+static bool gen_arith_shamt_tl(DisasContext *ctx, arg_shift *a,
+                               void (*func)(TCGv, TCGv, TCGv))
+{
+    TCGv source1, source2;
+    source1 = tcg_temp_new();
+    source2 = tcg_temp_new();
+
+    gen_get_gpr(source1, a->rs1);
+    tcg_gen_movi_tl(source2, a->shamt);
+
+    (*func)(source1, source1, source2);
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    tcg_temp_free(source2);
+    return true;
+}
+
 #ifdef TARGET_RISCV64
 static void gen_addw(TCGv ret, TCGv arg1, TCGv arg2)
 {
@@ -801,6 +819,74 @@ static void gen_packh(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_temp_free(higher);
 }
 
+static void gen_sbop_shamt(TCGv ret, TCGv shamt)
+{
+    tcg_gen_andi_tl(ret, shamt, TARGET_LONG_BITS - 1);
+}
+
+static void gen_sbop_common(TCGv ret, TCGv shamt)
+{
+    TCGv t;
+    t = tcg_temp_new();
+
+    gen_sbop_shamt(ret, shamt);
+
+    tcg_gen_movi_tl(t, 1);
+    tcg_gen_shl_tl(ret, t, ret);
+
+    tcg_temp_free(t);
+}
+
+static void gen_sbset(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv mask;
+    mask = tcg_temp_new();
+
+    gen_sbop_common(mask, arg2);
+
+    tcg_gen_or_tl(ret, arg1, mask);
+
+    tcg_temp_free(mask);
+}
+
+static void gen_sbclr(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv mask;
+    mask = tcg_temp_new();
+
+    gen_sbop_common(mask, arg2);
+
+    tcg_gen_not_tl(mask, mask);
+    tcg_gen_and_tl(ret, arg1, mask);
+
+    tcg_temp_free(mask);
+}
+
+static void gen_sbinv(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv mask;
+    mask = tcg_temp_new();
+
+    gen_sbop_common(mask, arg2);
+
+    tcg_gen_xor_tl(ret, arg1, mask);
+
+    tcg_temp_free(mask);
+}
+
+static void gen_sbext(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv shamt;
+    shamt = tcg_temp_new();
+
+    gen_sbop_shamt(shamt, arg2);
+    tcg_gen_shr_tl(ret, arg1, shamt);
+
+    tcg_gen_andi_tl(ret, ret, 1);
+
+    tcg_temp_free(shamt);
+}
+
 
 #ifdef TARGET_RISCV64
 
@@ -867,6 +953,75 @@ static void gen_packuw(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_temp_free(higher);
 }
 
+static void gen_sbopw_shamt(TCGv ret, TCGv shamt)
+{
+    tcg_gen_andi_tl(ret, shamt, 31);
+}
+
+static void gen_sbopw_common(TCGv ret, TCGv shamt)
+{
+    TCGv t;
+    t = tcg_temp_new();
+
+    gen_sbopw_shamt(ret, shamt);
+    tcg_gen_movi_tl(t, 1);
+    tcg_gen_shl_tl(ret, t, ret);
+
+    tcg_temp_free(t);
+}
+
+static void gen_sbsetw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv mask;
+    mask = tcg_temp_new();
+
+    gen_sbopw_common(mask, arg2);
+    tcg_gen_or_tl(ret, arg1, mask);
+
+    tcg_gen_ext32s_tl(ret, ret);
+
+    tcg_temp_free(mask);
+}
+
+static void gen_sbclrw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv mask;
+    mask = tcg_temp_new();
+
+    gen_sbopw_common(mask, arg2);
+    tcg_gen_not_tl(mask, mask);
+    tcg_gen_and_tl(ret, arg1, mask);
+
+    tcg_gen_ext32s_tl(ret, ret);
+
+    tcg_temp_free(mask);
+}
+
+static void gen_sbinvw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv mask;
+    mask = tcg_temp_new();
+
+    gen_sbopw_common(mask, arg2);
+    tcg_gen_xor_tl(ret, arg1, mask);
+
+    tcg_gen_ext32s_tl(ret, ret);
+
+    tcg_temp_free(mask);
+}
+
+static void gen_sbextw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv shamt;
+    shamt = tcg_temp_new();
+
+    gen_sbopw_shamt(shamt, arg2);
+    tcg_gen_shr_tl(ret, arg1, shamt);
+    tcg_gen_andi_tl(ret, ret, 1);
+
+    tcg_temp_free(shamt);
+}
+
 #endif
 
 static bool gen_arith(DisasContext *ctx, arg_r *a,
-- 
2.17.1


