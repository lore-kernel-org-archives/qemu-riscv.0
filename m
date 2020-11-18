Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfItf-0002Dm-8m
	for mharc-qemu-riscv@gnu.org; Wed, 18 Nov 2020 03:32:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfItd-000294-7x
 for qemu-riscv@nongnu.org; Wed, 18 Nov 2020 03:32:57 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:51949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfItb-0004qI-2U
 for qemu-riscv@nongnu.org; Wed, 18 Nov 2020 03:32:56 -0500
Received: by mail-pj1-x102a.google.com with SMTP id r6so671784pjd.1
 for <qemu-riscv@nongnu.org>; Wed, 18 Nov 2020 00:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=veRygLEh+ZMTL9IPwGFw2549Ey6aVX1s6xT0idS+Iow=;
 b=eb7i3oGzGTxGpDw7pJzfc5iDZB3L6kmoPPgf1VtSlXhk5aRJEU0965ASUWtCt7rUJV
 9Ep2m+MzhpV8LHQtoPLCr84ioOojOO8WWyLLUAR3831JNw/N4fXvOY5rRb821KZxnxu0
 ezxoh+dzWzhjubBahOnIa9eN6bINTxSSFZOshoDl0/UhvczssqMCAyZj7ZWEwfv3K39d
 rwCPQMTEfW+PQgAQ1HsDcIsv65kwbzBu13ToZn1L4smOTI7RCqh2ue/pATPnpSVCSlZg
 gMQrk78WmWrB9QnIxVFci3sCCAUOKbwt3Mdoy8axvppDtmiKeovHFad9Oe/cC02ocblv
 66+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=veRygLEh+ZMTL9IPwGFw2549Ey6aVX1s6xT0idS+Iow=;
 b=n5RqHdOVYGiGKVNO2NHnPpFGZgrL0XXXUVR9pRDoZrLcOXnV0oq12SnF2nbJEecu2+
 74zu5f/pDXqztzOv7nA3b+Jij0DzeS5jAwE1mG+kVCKSGfZ/1Aq6G22y3Xur7pFpkVgs
 7klwNzU/NHKy/WmRBZ52M8WBEFkq4cSuJlELlymU3vLvR/3WmhZlqPwbRkN03BN6yHVP
 RC1rl118quw66QEL19SXOvLl3jZkwCwOCOQqrK1cFA+2PcKvOFkWvVeuKa/ebgHYzefl
 hMF4r00hER9fcwwFreAs/MHNl7uoY45tEfz+QPC6DfZlVfI9ChvUNHuqk7Si2BmYiKKZ
 W0+Q==
X-Gm-Message-State: AOAM530ed54V8/ExxRCVVK2YIUDR3tyAaxix0QeyDei1m8rxbtX1K14N
 34Zx65b+/r9FIO3xfTiofXp+UQ==
X-Google-Smtp-Source: ABdhPJyX6dCtcP5Xv+k5zXptwc+g8RYrXFPU9ETSC/NhoCF2ImR93eksGK9jHLtbPxVybI06evZsQQ==
X-Received: by 2002:a17:90a:de86:: with SMTP id
 n6mr2914597pjv.214.1605688373938; 
 Wed, 18 Nov 2020 00:32:53 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id y10sm1618407pjm.34.2020.11.18.00.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:32:53 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC 10/15] target/riscv: rvb: rotate (left/right)
Date: Wed, 18 Nov 2020 16:29:48 +0800
Message-Id: <20201118083044.13992-11-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201118083044.13992-1-frank.chang@sifive.com>
References: <20201118083044.13992-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102a.google.com
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
X-List-Received-Date: Wed, 18 Nov 2020 08:32:57 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32-64.decode           |  3 ++
 target/riscv/insn32.decode              |  3 ++
 target/riscv/insn_trans/trans_rvb.c.inc | 54 +++++++++++++++++++++++++
 target/riscv/translate.c                | 48 ++++++++++++++++++++++
 4 files changed, 108 insertions(+)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index cc6b7d63774..a1a4b12f7ca 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -100,9 +100,12 @@ sbinvw     0110100 .......... 001 ..... 0111011 @r
 sbextw     0100100 .......... 101 ..... 0111011 @r
 slow       0010000 .......... 001 ..... 0111011 @r
 srow       0010000 .......... 101 ..... 0111011 @r
+rorw       0110000 .......... 101 ..... 0111011 @r
+rolw       0110000 .......... 001 ..... 0111011 @r
 
 sbsetiw    0010100 .......... 001 ..... 0011011 @sh5
 sbclriw    0100100 .......... 001 ..... 0011011 @sh5
 sbinviw    0110100 .......... 001 ..... 0011011 @sh5
 sloiw      0010000 .......... 001 ..... 0011011 @sh5
 sroiw      0010000 .......... 101 ..... 0011011 @sh5
+roriw      0110000 .......... 101 ..... 0011011 @sh5
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 6e3eef84144..01b8ebc4bee 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -617,6 +617,8 @@ sbinv      0110100 .......... 001 ..... 0110011 @r
 sbext      0100100 .......... 101 ..... 0110011 @r
 slo        0010000 .......... 001 ..... 0110011 @r
 sro        0010000 .......... 101 ..... 0110011 @r
+ror        0110000 .......... 101 ..... 0110011 @r
+rol        0110000 .......... 001 ..... 0110011 @r
 
 sbseti     001010 ........... 001 ..... 0010011 @sh
 sbclri     010010 ........... 001 ..... 0010011 @sh
@@ -624,3 +626,4 @@ sbinvi     011010 ........... 001 ..... 0010011 @sh
 sbexti     010010 ........... 101 ..... 0010011 @sh
 sloi       001000 ........... 001 ..... 0010011 @sh
 sroi       001000 ........... 101 ..... 0010011 @sh
+rori       011000 ........... 101 ..... 0010011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 4c93c5aab8b..ba8734203ac 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -189,7 +189,29 @@ static bool trans_sroi(DisasContext *ctx, arg_sroi *a)
     return gen_arith_shamt_tl(ctx, a, &gen_sro);
 }
 
+static bool trans_ror(DisasContext *ctx, arg_ror *a)
 {
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &tcg_gen_rotr_tl);
+}
+
+static bool trans_rori(DisasContext *ctx, arg_rori *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+
+    if (a->shamt >= TARGET_LONG_BITS) {
+        return false;
+    }
+
+    return gen_arith_shamt_tl(ctx, a, &tcg_gen_rotr_tl);
+}
+
+static bool trans_rol(DisasContext *ctx, arg_rol *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &tcg_gen_rotl_tl);
+}
+
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
@@ -289,4 +311,36 @@ static bool trans_sroiw(DisasContext *ctx, arg_sroiw *a)
     return gen_arith_shamt_tl(ctx, a, &gen_srow);
 }
 
+static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_rorw);
+}
+
+static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+
+    if (a->shamt >= 32) {
+        return false;
+    }
+
+    if (a->shamt == 0) {
+        TCGv t = tcg_temp_new();
+        gen_get_gpr(t, a->rs1);
+        tcg_gen_ext32s_tl(t, t);
+        gen_set_gpr(a->rd, t);
+        tcg_temp_free(t);
+        return true;
+    }
+
+    return gen_arith_shamt_tl(ctx, a, &gen_rorw);
+}
+
+static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_rolw);
+}
+
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 8972e247bd7..68870bd9202 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1092,6 +1092,54 @@ static void gen_srow(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_temp_free(t);
 }
 
+static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv shamt;
+    TCGv_i32 t1, t2;
+    shamt = tcg_temp_new();
+    t1 = tcg_temp_new_i32();
+    t2 = tcg_temp_new_i32();
+
+    gen_sbopw_shamt(shamt, arg2);
+
+    /* truncate to 32-bits */
+    tcg_gen_trunc_tl_i32(t1, arg1);
+    tcg_gen_trunc_tl_i32(t2, shamt);
+
+    tcg_gen_rotr_i32(t1, t1, t2);
+
+    /* sign-extend 64-bits */
+    tcg_gen_ext_i32_tl(ret, t1);
+
+    tcg_temp_free(shamt);
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
+}
+
+static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv shamt;
+    TCGv_i32 t1, t2;
+    shamt = tcg_temp_new();
+    t1 = tcg_temp_new_i32();
+    t2 = tcg_temp_new_i32();
+
+    gen_sbopw_shamt(shamt, arg2);
+
+    /* truncate to 32-bits */
+    tcg_gen_trunc_tl_i32(t1, arg1);
+    tcg_gen_trunc_tl_i32(t2, shamt);
+
+    tcg_gen_rotl_i32(t1, t1, t2);
+
+    /* sign-extend 64-bits */
+    tcg_gen_ext_i32_tl(ret, t1);
+
+    tcg_temp_free(shamt);
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
+}
+
 #endif
 
 static bool gen_arith(DisasContext *ctx, arg_r *a,
-- 
2.17.1


