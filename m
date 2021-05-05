Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1leK31-0005Xq-VM
	for mharc-qemu-riscv@gnu.org; Wed, 05 May 2021 12:06:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK30-0005VK-FD
 for qemu-riscv@nongnu.org; Wed, 05 May 2021 12:06:50 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:38407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK2w-0002LK-F1
 for qemu-riscv@nongnu.org; Wed, 05 May 2021 12:06:50 -0400
Received: by mail-pg1-x532.google.com with SMTP id i14so2115906pgk.5
 for <qemu-riscv@nongnu.org>; Wed, 05 May 2021 09:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Cd3nD/3o8xuYoLpJtl91/Qp6UGraN4G7RifutxRhX1I=;
 b=mym+xAf4QkI0Qw1EpH93AB0CC2zm5LLduFSxYR1kocehyNEnuDa/SrvDvzO+LM+fAE
 AFfPGOF0UFjyfv/zowQG3109nffNzP3HhMkajddLf7itKXzDn+4+rwZ03jKUvvKiyosK
 PZTaNGqN/dRlRn9Phj+p5WVIQfSN9fS5QvKG7o/y0pGLzKCH2/Qf5d2u6A86Ym2PB+gA
 iif0FO+U7MWZhlndnGl96as0x3QB49eLRkBCJ/ebQ9A2qMdFDWC9xWfpCAIkVn7EdJuN
 fFaM0iOLxpJn7bLcgTk/2gMHhvKBvb+aZITC3IQNriWs4ncYLWOcypNZG/abcSbqg1QO
 m+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Cd3nD/3o8xuYoLpJtl91/Qp6UGraN4G7RifutxRhX1I=;
 b=MRNa9Cqt34EwKuBFZZCW6hOqie5D7pJjJQ3xE2S7ewMDPpRn/mVw9d4Wn94KRwa96f
 RIrxUtlz2dryO64o3szG5SRsa4K+XoueTVfn+LhUX14xuyi2I4HMuszQVY4tzcxcZW/e
 N6maovCewoua2fTUCT+VDmgeCRhW84zrLrJqtQQQ6qDrzYmju/saumRgBTiC0xYk0Sf4
 FveFNAGxCS+EKi87bJ6WMTUJbEJOkT33qH+dqZcGkiBJMseHyW4lCXrHUPNu3y9U2SoB
 PoD1hpu5GUOBHAddZHD2YR+zKrKmfG8LtQfWNedzRa+2y39vnPgUvSfgpKfbrPl5pLkj
 nK3Q==
X-Gm-Message-State: AOAM533G8wYXq+JhIDj5k9k7f9+914tVQAz7E2gW1x0cfne+aw53C+wq
 XcyQh8rhDQ5pck4jnuzK4p6g5Q==
X-Google-Smtp-Source: ABdhPJyQ/2K+metsgYRz4sI4xFZ0RlntfyxFJrkKaS9VT/3HHlcMVGybZhDjRzW7C1T2j5liZ8d+6g==
X-Received: by 2002:a62:3003:0:b029:28e:74d9:1e16 with SMTP id
 w3-20020a6230030000b029028e74d91e16mr19945967pfw.21.1620230804282; 
 Wed, 05 May 2021 09:06:44 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id js6sm35877977pjb.0.2021.05.05.09.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 09:06:43 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v6 05/17] target/riscv: rvb: pack two words into one register
Date: Thu,  6 May 2021 00:06:06 +0800
Message-Id: <20210505160620.15723-6-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210505160620.15723-1-frank.chang@sifive.com>
References: <20210505160620.15723-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x532.google.com
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
X-List-Received-Date: Wed, 05 May 2021 16:06:50 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |  6 ++++
 target/riscv/insn_trans/trans_rvb.c.inc | 32 ++++++++++++++++++++
 target/riscv/translate.c                | 40 +++++++++++++++++++++++++
 3 files changed, 78 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index a4d95ea6217..9b2fd4b6fe8 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -666,8 +666,14 @@ cpop       011000 000010 ..... 001 ..... 0010011 @r2
 andn       0100000 .......... 111 ..... 0110011 @r
 orn        0100000 .......... 110 ..... 0110011 @r
 xnor       0100000 .......... 100 ..... 0110011 @r
+pack       0000100 .......... 100 ..... 0110011 @r
+packu      0100100 .......... 100 ..... 0110011 @r
+packh      0000100 .......... 111 ..... 0110011 @r
 
 # *** RV64B Standard Extension (in addition to RV32B) ***
 clzw       0110000 00000 ..... 001 ..... 0011011 @r2
 ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
 cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
+
+packw      0000100 .......... 100 ..... 0111011 @r
+packuw     0100100 .......... 100 ..... 0111011 @r
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index b8676785c6f..770205f96f7 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -53,6 +53,24 @@ static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
     return gen_arith(ctx, a, tcg_gen_eqv_tl);
 }
 
+static bool trans_pack(DisasContext *ctx, arg_pack *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, gen_pack);
+}
+
+static bool trans_packu(DisasContext *ctx, arg_packu *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, gen_packu);
+}
+
+static bool trans_packh(DisasContext *ctx, arg_packh *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, gen_packh);
+}
+
 static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -73,3 +91,17 @@ static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
     REQUIRE_EXT(ctx, RVB);
     return gen_unary(ctx, a, gen_cpopw);
 }
+
+static bool trans_packw(DisasContext *ctx, arg_packw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, gen_packw);
+}
+
+static bool trans_packuw(DisasContext *ctx, arg_packuw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, gen_packuw);
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index c1a30c21723..5f1a3c694fe 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -548,6 +548,29 @@ static bool gen_arith_div_uw(DisasContext *ctx, arg_r *a,
     return true;
 }
 
+static void gen_pack(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_deposit_tl(ret, arg1, arg2,
+                       TARGET_LONG_BITS / 2,
+                       TARGET_LONG_BITS / 2);
+}
+
+static void gen_packu(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t = tcg_temp_new();
+    tcg_gen_shri_tl(t, arg1, TARGET_LONG_BITS / 2);
+    tcg_gen_deposit_tl(ret, arg2, t, 0, TARGET_LONG_BITS / 2);
+    tcg_temp_free(t);
+}
+
+static void gen_packh(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t = tcg_temp_new();
+    tcg_gen_ext8u_tl(t, arg2);
+    tcg_gen_deposit_tl(ret, arg1, t, 8, TARGET_LONG_BITS - 8);
+    tcg_temp_free(t);
+}
+
 static void gen_ctzw(TCGv ret, TCGv arg1)
 {
     tcg_gen_ori_tl(ret, arg1, (target_ulong)MAKE_64BIT_MASK(32, 32));
@@ -567,6 +590,23 @@ static void gen_cpopw(TCGv ret, TCGv arg1)
     tcg_gen_ctpop_tl(ret, arg1);
 }
 
+static void gen_packw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t = tcg_temp_new();
+    tcg_gen_ext16s_tl(t, arg2);
+    tcg_gen_deposit_tl(ret, arg1, t, 16, 48);
+    tcg_temp_free(t);
+}
+
+static void gen_packuw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t = tcg_temp_new();
+    tcg_gen_shri_tl(t, arg1, 16);
+    tcg_gen_deposit_tl(ret, arg2, t, 0, 16);
+    tcg_gen_ext32s_tl(ret, ret);
+    tcg_temp_free(t);
+}
+
 static bool gen_arith(DisasContext *ctx, arg_r *a,
                       void(*func)(TCGv, TCGv, TCGv))
 {
-- 
2.17.1


