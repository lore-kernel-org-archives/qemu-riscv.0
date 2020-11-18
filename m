Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfIta-00022h-Qz
	for mharc-qemu-riscv@gnu.org; Wed, 18 Nov 2020 03:32:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfItZ-0001y8-2G
 for qemu-riscv@nongnu.org; Wed, 18 Nov 2020 03:32:53 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:44247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfItW-0004pj-Tk
 for qemu-riscv@nongnu.org; Wed, 18 Nov 2020 03:32:52 -0500
Received: by mail-pf1-x436.google.com with SMTP id y7so938133pfq.11
 for <qemu-riscv@nongnu.org>; Wed, 18 Nov 2020 00:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8WgPOMvIYA8WQYk2ETSP+srnhoP9f3kVLNePdnV3BMU=;
 b=K3VSgtryiKbXa2auQtRJbUKZkHkHTq7+NtFHLOyHfDAotWwG59ThrbDYywOth6xxlz
 rTLzSCV5rsZNn7TUtRWkQoEm3ZZn6KFmE3+ICJZib9hG5yI4495WAd5WN2j4nPa/Ni6I
 dKzEhZwFV5PacVdcfUfs0CslAqlJEsGyRqeUNeK54K6KDlMdMkZqQq5z5CeqypK3kkT3
 O7HOtz0S8mWEuyyrCxoG2WB1aD+/670QmuDA0hWL0wPreIjDf4VRiW1GD1qvTPTkA4yn
 flYEwwEk3EBvYRxa7Mvpt5dX4c1cS6OYAdqF/rkLJjiQdh/93y3ww72AtsRa2ZdSgOq6
 00ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8WgPOMvIYA8WQYk2ETSP+srnhoP9f3kVLNePdnV3BMU=;
 b=KbEozNmRybW+VGfmEOiuCFKxfFlL80aqDKNy+f1USuHing0Wuaq59MVmtOJqZLqE8B
 FsybfcWUD1Hi8uAed/7oK171JPqNRv+4BEmpcIPaizp4WhITG/dqboVoqs2Trhs4kuWI
 Ve2eMfDgBvttIBg0JIOfVL9Qlqklv8TbEZngG2ElMSUh/Wj06dWRVlVsiVx5z1UN1bfz
 cC0BvEODsg48ntSJngxb34FT+hHH3IoTbC1qx13dl65WXTh6m1umFG0aUVewFf4vXn0s
 Kvw7HkpZGAEIDYtDL5X+z27y9QnbZtf2d/1SHDh0odzuTqyxv502K9miTPXi2rSuErjd
 nwAA==
X-Gm-Message-State: AOAM5307qYpWd+e8o2QJHEIzatoBeEKVp/LKrhPYuhMHCGsU+CdgrI+U
 A4aJSMWAlp6DXFvXY6n4VZO9gg==
X-Google-Smtp-Source: ABdhPJwcJbp8uzLhLWCKjji+QqUMhkH3WLhlcMOErSOZueuowOd76eVlHu3ED3xk2hoR2VNR4PGT9w==
X-Received: by 2002:a63:1026:: with SMTP id f38mr7039986pgl.181.1605688369766; 
 Wed, 18 Nov 2020 00:32:49 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id y10sm1618407pjm.34.2020.11.18.00.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:32:49 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Frank Chang <frank.chang@sifive.com>
Subject: [RFC 09/15] target/riscv: rvb: shift ones
Date: Wed, 18 Nov 2020 16:29:47 +0800
Message-Id: <20201118083044.13992-10-frank.chang@sifive.com>
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
X-List-Received-Date: Wed, 18 Nov 2020 08:32:53 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
---
 target/riscv/insn32-64.decode           |  4 ++
 target/riscv/insn32.decode              |  4 ++
 target/riscv/insn_trans/trans_rvb.c.inc | 58 ++++++++++++++++++++
 target/riscv/translate.c                | 70 +++++++++++++++++++++++++
 4 files changed, 136 insertions(+)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 92f3aaac3b6..cc6b7d63774 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -98,7 +98,11 @@ sbsetw     0010100 .......... 001 ..... 0111011 @r
 sbclrw     0100100 .......... 001 ..... 0111011 @r
 sbinvw     0110100 .......... 001 ..... 0111011 @r
 sbextw     0100100 .......... 101 ..... 0111011 @r
+slow       0010000 .......... 001 ..... 0111011 @r
+srow       0010000 .......... 101 ..... 0111011 @r
 
 sbsetiw    0010100 .......... 001 ..... 0011011 @sh5
 sbclriw    0100100 .......... 001 ..... 0011011 @sh5
 sbinviw    0110100 .......... 001 ..... 0011011 @sh5
+sloiw      0010000 .......... 001 ..... 0011011 @sh5
+sroiw      0010000 .......... 101 ..... 0011011 @sh5
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 69e542da19c..6e3eef84144 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -615,8 +615,12 @@ sbset      0010100 .......... 001 ..... 0110011 @r
 sbclr      0100100 .......... 001 ..... 0110011 @r
 sbinv      0110100 .......... 001 ..... 0110011 @r
 sbext      0100100 .......... 101 ..... 0110011 @r
+slo        0010000 .......... 001 ..... 0110011 @r
+sro        0010000 .......... 101 ..... 0110011 @r
 
 sbseti     001010 ........... 001 ..... 0010011 @sh
 sbclri     010010 ........... 001 ..... 0010011 @sh
 sbinvi     011010 ........... 001 ..... 0010011 @sh
 sbexti     010010 ........... 101 ..... 0010011 @sh
+sloi       001000 ........... 001 ..... 0010011 @sh
+sroi       001000 ........... 101 ..... 0010011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index dabf8e09c3d..4c93c5aab8b 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -155,6 +155,40 @@ static bool trans_sbexti(DisasContext *ctx, arg_sbexti *a)
     return gen_arith_shamt_tl(ctx, a, &gen_sbext);
 }
 
+static bool trans_slo(DisasContext *ctx, arg_slo *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_slo);
+}
+
+static bool trans_sloi(DisasContext *ctx, arg_sloi *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+
+    if (a->shamt >= TARGET_LONG_BITS) {
+        return false;
+    }
+
+    return gen_arith_shamt_tl(ctx, a, &gen_slo);
+}
+
+static bool trans_sro(DisasContext *ctx, arg_sro *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_sro);
+}
+
+static bool trans_sroi(DisasContext *ctx, arg_sroi *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+
+    if (a->shamt >= TARGET_LONG_BITS) {
+        return false;
+    }
+
+    return gen_arith_shamt_tl(ctx, a, &gen_sro);
+}
+
 {
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
@@ -231,4 +265,28 @@ static bool trans_sbextw(DisasContext *ctx, arg_sbextw *a)
     return gen_arith(ctx, a, &gen_sbextw);
 }
 
+static bool trans_slow(DisasContext *ctx, arg_slow *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_slow);
+}
+
+static bool trans_sloiw(DisasContext *ctx, arg_sloiw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith_shamt_tl(ctx, a, &gen_slow);
+}
+
+static bool trans_srow(DisasContext *ctx, arg_srow *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_srow);
+}
+
+static bool trans_sroiw(DisasContext *ctx, arg_sroiw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith_shamt_tl(ctx, a, &gen_srow);
+}
+
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index e7d9e4a1abf..8972e247bd7 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -887,6 +887,38 @@ static void gen_sbext(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_temp_free(shamt);
 }
 
+static void gen_slo(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv shamt, t;
+    shamt = tcg_temp_new();
+    t = tcg_temp_new();
+
+    gen_sbop_shamt(shamt, arg2);
+
+    tcg_gen_not_tl(t, arg1);
+    tcg_gen_shl_tl(t, t, arg2);
+    tcg_gen_not_tl(ret, t);
+
+    tcg_temp_free(shamt);
+    tcg_temp_free(t);
+}
+
+static void gen_sro(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv shamt, t;
+    shamt = tcg_temp_new();
+    t = tcg_temp_new();
+
+    gen_sbop_shamt(shamt, arg2);
+
+    tcg_gen_not_tl(t, arg1);
+    tcg_gen_shr_tl(t, t, arg2);
+    tcg_gen_not_tl(ret, t);
+
+    tcg_temp_free(shamt);
+    tcg_temp_free(t);
+}
+
 
 #ifdef TARGET_RISCV64
 
@@ -1022,6 +1054,44 @@ static void gen_sbextw(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_temp_free(shamt);
 }
 
+static void gen_slow(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv shamt, t;
+    shamt = tcg_temp_new();
+    t = tcg_temp_new();
+
+    tcg_gen_ext32u_tl(arg1, arg1);
+
+    gen_sbopw_shamt(shamt, arg2);
+    tcg_gen_not_tl(t, arg1);
+    tcg_gen_shl_tl(t, t, shamt);
+    tcg_gen_not_tl(ret, t);
+
+    tcg_gen_ext32s_tl(ret, ret);
+
+    tcg_temp_free(shamt);
+    tcg_temp_free(t);
+}
+
+static void gen_srow(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv shamt, t;
+    shamt = tcg_temp_new();
+    t = tcg_temp_new();
+
+    tcg_gen_ext32u_tl(arg1, arg1);
+
+    gen_sbopw_shamt(shamt, arg2);
+    tcg_gen_not_tl(t, arg1);
+    tcg_gen_shr_tl(t, t, shamt);
+    tcg_gen_not_tl(ret, t);
+
+    tcg_gen_ext32s_tl(ret, ret);
+
+    tcg_temp_free(shamt);
+    tcg_temp_free(t);
+}
+
 #endif
 
 static bool gen_arith(DisasContext *ctx, arg_r *a,
-- 
2.17.1


