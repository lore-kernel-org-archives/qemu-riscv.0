Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1leK3V-0006LZ-0T
	for mharc-qemu-riscv@gnu.org; Wed, 05 May 2021 12:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK3S-0006He-TU
 for qemu-riscv@nongnu.org; Wed, 05 May 2021 12:07:18 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:38859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK3Q-0002c9-Np
 for qemu-riscv@nongnu.org; Wed, 05 May 2021 12:07:18 -0400
Received: by mail-pf1-x42b.google.com with SMTP id k19so2344162pfu.5
 for <qemu-riscv@nongnu.org>; Wed, 05 May 2021 09:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4j8f+BqvngWfv7vww8HE4PFn7DVDPAFt9j8qj4IGu3w=;
 b=YxeF0nMYO0F/LrXmcU+19MOZti/sQrsbWqWDX6GGGbzECgCSt8e5JodBsh+xJkkFwm
 nRlBL9DasyqVNx+3G2w5kzy2BDoar17R2RgWxsU6EDSHREG1ITWPtfh6+8ofLbiTGR56
 lhgN+cnDqmWLCkFdpUtaspGrYJnoJ8BQPAJA8hHhZWQ272+gk5nqKwRQT/rGJnGr9wdT
 TeUUQ4Oy6vzM7B+HU2uPtMmW2/KI1aD17J8QOuai2iFUXO2YHcUXWXEBOWTImH5au/wW
 Pz3pKdSQjYy97X2I7NFdSD/vQOVep06UXLFlfdFXFayfE1ffqYdogI8UDfBTZ/Ra2Gyk
 zhLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4j8f+BqvngWfv7vww8HE4PFn7DVDPAFt9j8qj4IGu3w=;
 b=rtuf9LHFEOWy0UqxcLEgvt9sb4zPdXAJuS9ppvC7VbaXub6+jAJwS5clKHJYOhSl+u
 7yfRORROLHhR3lP531RrkQIwuWxSy9jBQ/vbuGkU/tyYHsTqJhgVS8wUpcYzrSRHyt6f
 RHmjtQWlaYXBeH+J1VJSIbQhtb3rKnWtzy/NbBJksJ/Y6I1l1lAZBZiD/W10T+eb8Fq2
 SXn76FKUqIxeZ6ZsJESNE84oZN9ShTS1YhETZlb/STn7jilR3HYRXrFhWHBJlvInPvvg
 CRaHprJrzsuwbQQcMc+RxuKTxwbew/XGBetxWDtej0dBAFrl+8471/BbzUmou50TtZNo
 W4rQ==
X-Gm-Message-State: AOAM530wBZFiUPHSY+iTNfwVkn26O9a5yvS/0HcLVQrKfBa+wAIIenka
 Lpy/OXZQa3Me6YYhTGKI+fT8Dw==
X-Google-Smtp-Source: ABdhPJydK+b3KH3fFWFA6rJ2wLmQkbBOmLFuMCKHAahiSjCvKykH3Z33G4PY3XPfhuwDDeRgVMckOQ==
X-Received: by 2002:a63:4423:: with SMTP id r35mr30000366pga.13.1620230835306; 
 Wed, 05 May 2021 09:07:15 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id js6sm35877977pjb.0.2021.05.05.09.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 09:07:14 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>
Subject: [PATCH v6 13/17] target/riscv: rvb: generalized or-combine
Date: Thu,  6 May 2021 00:06:14 +0800
Message-Id: <20210505160620.15723-14-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210505160620.15723-1-frank.chang@sifive.com>
References: <20210505160620.15723-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42b.google.com
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
X-List-Received-Date: Wed, 05 May 2021 16:07:19 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/bitmanip_helper.c          | 26 +++++++++++++++++++++++++
 target/riscv/helper.h                   |  2 ++
 target/riscv/insn32.decode              |  4 ++++
 target/riscv/insn_trans/trans_rvb.c.inc | 26 +++++++++++++++++++++++++
 target/riscv/translate.c                |  6 ++++++
 5 files changed, 64 insertions(+)

diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
index c625adaded5..5b2f795d03a 100644
--- a/target/riscv/bitmanip_helper.c
+++ b/target/riscv/bitmanip_helper.c
@@ -62,3 +62,29 @@ target_ulong HELPER(grevw)(target_ulong rs1, target_ulong rs2)
 {
     return do_grev(rs1, rs2, 32);
 }
+
+static target_ulong do_gorc(target_ulong rs1,
+                            target_ulong rs2,
+                            int bits)
+{
+    target_ulong x = rs1;
+    int i, shift;
+
+    for (i = 0, shift = 1; shift < bits; i++, shift <<= 1) {
+        if (rs2 & shift) {
+            x |= do_swap(x, adjacent_masks[i], shift);
+        }
+    }
+
+    return x;
+}
+
+target_ulong HELPER(gorc)(target_ulong rs1, target_ulong rs2)
+{
+    return do_gorc(rs1, rs2, TARGET_LONG_BITS);
+}
+
+target_ulong HELPER(gorcw)(target_ulong rs1, target_ulong rs2)
+{
+    return do_gorc(rs1, rs2, 32);
+}
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index f81b8faf3bf..415e37bc37a 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -61,6 +61,8 @@ DEF_HELPER_FLAGS_1(fclass_d, TCG_CALL_NO_RWG_SE, tl, i64)
 /* Bitmanip */
 DEF_HELPER_FLAGS_2(grev, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(grevw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(gorc, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(gorcw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 
 /* Special functions */
 DEF_HELPER_3(csrrw, tl, env, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 6b5e276a9f7..e6dab8dbbc1 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -685,6 +685,7 @@ sro        0010000 .......... 101 ..... 0110011 @r
 ror        0110000 .......... 101 ..... 0110011 @r
 rol        0110000 .......... 001 ..... 0110011 @r
 grev       0110100 .......... 101 ..... 0110011 @r
+gorc       0010100 .......... 101 ..... 0110011 @r
 
 bseti      00101. ........... 001 ..... 0010011 @sh
 bclri      01001. ........... 001 ..... 0010011 @sh
@@ -694,6 +695,7 @@ sloi       00100. ........... 001 ..... 0010011 @sh
 sroi       00100. ........... 101 ..... 0010011 @sh
 rori       01100. ........... 101 ..... 0010011 @sh
 grevi      01101. ........... 101 ..... 0010011 @sh
+gorci      00101. ........... 101 ..... 0010011 @sh
 
 # *** RV64B Standard Extension (in addition to RV32B) ***
 clzw       0110000 00000 ..... 001 ..... 0011011 @r2
@@ -711,6 +713,7 @@ srow       0010000 .......... 101 ..... 0111011 @r
 rorw       0110000 .......... 101 ..... 0111011 @r
 rolw       0110000 .......... 001 ..... 0111011 @r
 grevw      0110100 .......... 101 ..... 0111011 @r
+gorcw      0010100 .......... 101 ..... 0111011 @r
 
 bsetiw     0010100 .......... 001 ..... 0011011 @sh5
 bclriw     0100100 .......... 001 ..... 0011011 @sh5
@@ -719,3 +722,4 @@ sloiw      0010000 .......... 001 ..... 0011011 @sh5
 sroiw      0010000 .......... 101 ..... 0011011 @sh5
 roriw      0110000 .......... 101 ..... 0011011 @sh5
 greviw     0110100 .......... 101 ..... 0011011 @sh5
+gorciw     0010100 .......... 101 ..... 0011011 @sh5
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 281e0ffae9a..ec9f9d2ef24 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -214,6 +214,18 @@ static bool trans_grevi(DisasContext *ctx, arg_grevi *a)
     return gen_grevi(ctx, a);
 }
 
+static bool trans_gorc(DisasContext *ctx, arg_gorc *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, gen_helper_gorc);
+}
+
+static bool trans_gorci(DisasContext *ctx, arg_gorci *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shifti(ctx, a, gen_helper_gorc);
+}
+
 static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -360,3 +372,17 @@ static bool trans_greviw(DisasContext *ctx, arg_greviw *a)
     REQUIRE_EXT(ctx, RVB);
     return gen_shiftiw(ctx, a, gen_grevw);
 }
+
+static bool trans_gorcw(DisasContext *ctx, arg_gorcw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, gen_gorcw);
+}
+
+static bool trans_gorciw(DisasContext *ctx, arg_gorciw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftiw(ctx, a, gen_gorcw);
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 8deb05add42..35d4d36eef8 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -727,6 +727,12 @@ static void gen_grevw(TCGv ret, TCGv arg1, TCGv arg2)
     gen_helper_grev(ret, arg1, arg2);
 }
 
+static void gen_gorcw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_ext32u_tl(arg1, arg1);
+    gen_helper_gorcw(ret, arg1, arg2);
+}
+
 static bool gen_arith(DisasContext *ctx, arg_r *a,
                       void(*func)(TCGv, TCGv, TCGv))
 {
-- 
2.17.1


