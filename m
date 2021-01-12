Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kz9Iw-0001A3-Ns
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jan 2021 21:21:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9Is-00010D-Qs
 for qemu-riscv@nongnu.org; Mon, 11 Jan 2021 21:21:02 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:34472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9Im-0002DG-2N
 for qemu-riscv@nongnu.org; Mon, 11 Jan 2021 21:21:01 -0500
Received: by mail-pg1-x52f.google.com with SMTP id i5so436219pgo.1
 for <qemu-riscv@nongnu.org>; Mon, 11 Jan 2021 18:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XsEEF3QSfQ82F3+3Tm9lvYmtLrlTq3rt/jF6UEMZ7VE=;
 b=imdqP5NMGxdJpzihxz+m0ukYR5fID+kQhTVqN2ibEax+Z2VExXBdbNQsNEWSdjzdhP
 9TLh8tOLbL1wPADDWbwn6O1MEj2ot0MLG+pSNY8waYTsBRTw9CW+SiwJXmQFDsSdtAVD
 /+2PN33XIJRcvdwOHzlhKyW9+pnTTGSj9p6u8tHRdMcGuxY1CQ9+/ZWhgnanbuFo8gZh
 XWjxOgEpRARLPktHxDW8FDtDhU0ZoQnm22nkkqG1uEHHgak/t2hy0EyjRexUxoNWAp7w
 97Y97qeME/ppWmalVao+oM1bdOb3umBnj+TjOjx9Sv6OD9aNzj/RAbjkg7o7VDZ1rbWb
 oxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XsEEF3QSfQ82F3+3Tm9lvYmtLrlTq3rt/jF6UEMZ7VE=;
 b=VrXZ4vpHZLkQoGeLS1MTg/7WH3qahl+KF/OLdSPHSHec9qdVSPRJkTBXiA45h/uQyC
 J7NoZZo1Io0TPDgWJVHyE2U7nI3g6+VhHA2aQhKJGj1O6sJXPX5Z8MUUMtikbqeUxujK
 9ejJP6FtZWJdjwT5hSrYUn1cHQPtDR3pBxG/vjTzZgoMV+Mqo3QdIA1Rc73ipUKXHxeh
 /J+IUSxDm03KvXk7uUJ9jVPxcXzQrFdZa3ZshefcWBvOdY4Pp3q2gWf/h1J3Gqo7ZUwD
 Fy+GlT/oMftQZnpDbztZxPgXZ6mpwbR8AoeTd5gHGyvbcK086aF3UbE1NJXnYxhZCPvl
 LDug==
X-Gm-Message-State: AOAM530w+wCZdtYzm1NIa+/QDpGInKtNhWSyfOS0+yzM+xytbHhvrKyF
 aebpg+g0fUh5m7cpfv7yUYX8jQ==
X-Google-Smtp-Source: ABdhPJycdT255Et//V50ajVjG2tnYL5pbTukSOiPjNklP9dvnhLcNlrs13wXkEhVoh5ABTmE7dcgBQ==
X-Received: by 2002:a62:8205:0:b029:19e:717c:d647 with SMTP id
 w5-20020a6282050000b029019e717cd647mr2308636pfd.50.1610418053863; 
 Mon, 11 Jan 2021 18:20:53 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id x14sm981326pfp.77.2021.01.11.18.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 18:20:53 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v3 09/16] target/riscv: rvb: single-bit instructions
Date: Tue, 12 Jan 2021 10:19:50 +0800
Message-Id: <20210112022001.20521-10-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112022001.20521-1-frank.chang@sifive.com>
References: <20210112022001.20521-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 12 Jan 2021 02:21:03 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32-64.decode           |  8 +++
 target/riscv/insn32.decode              |  9 +++
 target/riscv/insn_trans/trans_rvb.c.inc | 90 +++++++++++++++++++++++++
 target/riscv/translate.c                | 61 +++++++++++++++++
 4 files changed, 168 insertions(+)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index d28c0bcf2c1..f6c63c31b03 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -94,3 +94,11 @@ cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
 
 packw      0000100 .......... 100 ..... 0111011 @r
 packuw     0100100 .......... 100 ..... 0111011 @r
+bsetw      0010100 .......... 001 ..... 0111011 @r
+bclrw      0100100 .......... 001 ..... 0111011 @r
+binvw      0110100 .......... 001 ..... 0111011 @r
+bextw      0100100 .......... 101 ..... 0111011 @r
+
+bsetiw     0010100 .......... 001 ..... 0011011 @sh5
+bclriw     0100100 .......... 001 ..... 0011011 @sh5
+binviw     0110100 .......... 001 ..... 0011011 @sh5
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 938c23088eb..64d2b057764 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -611,3 +611,12 @@ min        0000101 .......... 100 ..... 0110011 @r
 minu       0000101 .......... 101 ..... 0110011 @r
 max        0000101 .......... 110 ..... 0110011 @r
 maxu       0000101 .......... 111 ..... 0110011 @r
+bset       0010100 .......... 001 ..... 0110011 @r
+bclr       0100100 .......... 001 ..... 0110011 @r
+binv       0110100 .......... 001 ..... 0110011 @r
+bext       0100100 .......... 101 ..... 0110011 @r
+
+bseti      00101. ........... 001 ..... 0010011 @sh
+bclri      01001. ........... 001 ..... 0010011 @sh
+binvi      01101. ........... 001 ..... 0010011 @sh
+bexti      01001. ........... 101 ..... 0010011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 1496996a660..0c41f135dc6 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -107,6 +107,54 @@ static bool trans_sext_h(DisasContext *ctx, arg_sext_h *a)
     return gen_unary(ctx, a, tcg_gen_ext16s_tl);
 }
 
+static bool trans_bset(DisasContext *ctx, arg_bset *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, gen_bset);
+}
+
+static bool trans_bseti(DisasContext *ctx, arg_bseti *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shifti(ctx, a, gen_bset);
+}
+
+static bool trans_bclr(DisasContext *ctx, arg_bclr *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, gen_bclr);
+}
+
+static bool trans_bclri(DisasContext *ctx, arg_bclri *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shifti(ctx, a, gen_bclr);
+}
+
+static bool trans_binv(DisasContext *ctx, arg_binv *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, gen_binv);
+}
+
+static bool trans_binvi(DisasContext *ctx, arg_binvi *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shifti(ctx, a, gen_binv);
+}
+
+static bool trans_bext(DisasContext *ctx, arg_bext *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, gen_bext);
+}
+
+static bool trans_bexti(DisasContext *ctx, arg_bexti *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shifti(ctx, a, gen_bext);
+}
+
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
@@ -140,4 +188,46 @@ static bool trans_packuw(DisasContext *ctx, arg_packuw *a)
     return gen_arith(ctx, a, gen_packuw);
 }
 
+static bool trans_bsetw(DisasContext *ctx, arg_bsetw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, gen_bset);
+}
+
+static bool trans_bsetiw(DisasContext *ctx, arg_bsetiw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftiw(ctx, a, gen_bset);
+}
+
+static bool trans_bclrw(DisasContext *ctx, arg_bclrw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, gen_bclr);
+}
+
+static bool trans_bclriw(DisasContext *ctx, arg_bclriw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftiw(ctx, a, gen_bclr);
+}
+
+static bool trans_binvw(DisasContext *ctx, arg_binvw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, gen_binv);
+}
+
+static bool trans_binviw(DisasContext *ctx, arg_binviw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftiw(ctx, a, gen_binv);
+}
+
+static bool trans_bextw(DisasContext *ctx, arg_bextw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, gen_bext);
+}
+
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 8459b6bcf54..7ea434ffa8d 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -734,6 +734,48 @@ static void gen_packh(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_temp_free(t);
 }
 
+static void gen_sbop_mask(TCGv ret, TCGv shamt)
+{
+    tcg_gen_movi_tl(ret, 1);
+    tcg_gen_shl_tl(ret, ret, shamt);
+}
+
+static void gen_bset(TCGv ret, TCGv arg1, TCGv shamt)
+{
+    TCGv t = tcg_temp_new();
+
+    gen_sbop_mask(t, shamt);
+    tcg_gen_or_tl(ret, arg1, t);
+
+    tcg_temp_free(t);
+}
+
+static void gen_bclr(TCGv ret, TCGv arg1, TCGv shamt)
+{
+    TCGv t = tcg_temp_new();
+
+    gen_sbop_mask(t, shamt);
+    tcg_gen_andc_tl(ret, arg1, t);
+
+    tcg_temp_free(t);
+}
+
+static void gen_binv(TCGv ret, TCGv arg1, TCGv shamt)
+{
+    TCGv t = tcg_temp_new();
+
+    gen_sbop_mask(t, shamt);
+    tcg_gen_xor_tl(ret, arg1, t);
+
+    tcg_temp_free(t);
+}
+
+static void gen_bext(TCGv ret, TCGv arg1, TCGv shamt)
+{
+    tcg_gen_shr_tl(ret, arg1, shamt);
+    tcg_gen_andi_tl(ret, ret, 1);
+}
+
 #ifdef TARGET_RISCV64
 
 static void gen_ctzw(TCGv ret, TCGv arg1)
@@ -833,6 +875,25 @@ static bool gen_shifti(DisasContext *ctx, arg_shift *a,
 
 #ifdef TARGET_RISCV64
 
+static bool gen_shiftw(DisasContext *ctx, arg_r *a,
+                       void(*func)(TCGv, TCGv, TCGv))
+{
+    TCGv source1 = tcg_temp_new();
+    TCGv source2 = tcg_temp_new();
+
+    gen_get_gpr(source1, a->rs1);
+    gen_get_gpr(source2, a->rs2);
+
+    tcg_gen_andi_tl(source2, source2, 31);
+    (*func)(source1, source1, source2);
+    tcg_gen_ext32s_tl(source1, source1);
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    tcg_temp_free(source2);
+    return true;
+}
+
 static bool gen_shiftiw(DisasContext *ctx, arg_shift *a,
                         void(*func)(TCGv, TCGv, TCGv))
 {
-- 
2.17.1


