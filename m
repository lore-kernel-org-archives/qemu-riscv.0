Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzaN7-0007cV-9c
	for mharc-qemu-riscv@gnu.org; Wed, 13 Jan 2021 02:15:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzaMy-0007ak-Rz
 for qemu-riscv@nongnu.org; Wed, 13 Jan 2021 02:15:07 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:51202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzaMs-00048X-DZ
 for qemu-riscv@nongnu.org; Wed, 13 Jan 2021 02:15:01 -0500
Received: by mail-pj1-x1033.google.com with SMTP id y12so564711pji.1
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 23:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+veWa2+gUSeuM0qwhIL58trHSNg04F73bO4068dp1Ko=;
 b=TQYO38eaDLFi8pfEED168at21pGJ/JjdYjsJDo69yHdj0h5LgJ54Jth15oEFJziDUX
 gqc5Zd1IqB9Hdo7d5YX+/5w8tqz2RqN2taWZX/M8AhQRPUoYLWIpPmRQt36WXeCbT1f1
 l/P3DRHHJL7Tvs95ZnoDL7264TI/Q48b7gEN5SE9mWlhlOmLS1FdPr1biKtxAGFqmx9K
 rZkOEN6oCERASVf17ROW3xDqfeW/eIHi/UTIzsqJIV5+MaMDGMWD6mSN+2dRrPYyt2yn
 S+W3ON3EL4O/V3ZJQk4n0hQgR+nvq0XdDYvj5pUbA2GsCvGn/SoifT6qdTDHApK9SVfv
 VkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+veWa2+gUSeuM0qwhIL58trHSNg04F73bO4068dp1Ko=;
 b=DQi+bzLUGczwJZ3vfbg9jG2WmQJ5Ve6d//mSZoaWfLQSnrsjKc8SiNg3U6IlsvzFXm
 YEJSFLcYZhKBEt8hX+0qWFiqHHsDGL9to67HUIwcdkGGjYsceNzQ1V2ZRxFEBOJFVDr2
 NwbTjJqZQoGvJMBnr6UksAwo/KP3O9xkGa+6TvUaKu83Z8kdL+m2loW2EwvuaHO6b6EB
 kD+zpGNOs2droFt9fkBP6Kvmt2/iBcebnHXZ591Qm67djQ53Uar1iHsDUf0clU4iVfgJ
 n0erISFLxBvtg3IeEElTXVzP7AMo96HvFRQWtH0fNNH4ItMPjYmtiW9Etma4VK90lIUE
 WfEg==
X-Gm-Message-State: AOAM530tFeJDPJ1VCeP8PjBIeTYy3HIQBkWv8Zdeo/lmOIwZ2g5A7niC
 C5Rjyi4AY+QAbIfjjItk9nd6Qg==
X-Google-Smtp-Source: ABdhPJzjsZMUFeESv1H8Z/lavUw8hwUpRp8SZRMOH2dgrL1xzfpLB6EIRf/f+KHEIL7+EweFz39WBQ==
X-Received: by 2002:a17:90a:8801:: with SMTP id s1mr828960pjn.69.1610522097173; 
 Tue, 12 Jan 2021 23:14:57 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id l7sm1361888pjy.29.2021.01.12.23.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 23:14:56 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v4 10/16] target/riscv: rvb: shift ones
Date: Wed, 13 Jan 2021 15:13:42 +0800
Message-Id: <20210113071350.24852-11-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210113071350.24852-1-frank.chang@sifive.com>
References: <20210113071350.24852-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1033.google.com
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
X-List-Received-Date: Wed, 13 Jan 2021 07:15:08 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32-64.decode           |  4 +++
 target/riscv/insn32.decode              |  4 +++
 target/riscv/insn_trans/trans_rvb.c.inc | 48 +++++++++++++++++++++++++
 target/riscv/translate.c                | 14 ++++++++
 4 files changed, 70 insertions(+)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index f6c63c31b03..8c3ed33077e 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -98,7 +98,11 @@ bsetw      0010100 .......... 001 ..... 0111011 @r
 bclrw      0100100 .......... 001 ..... 0111011 @r
 binvw      0110100 .......... 001 ..... 0111011 @r
 bextw      0100100 .......... 101 ..... 0111011 @r
+slow       0010000 .......... 001 ..... 0111011 @r
+srow       0010000 .......... 101 ..... 0111011 @r
 
 bsetiw     0010100 .......... 001 ..... 0011011 @sh5
 bclriw     0100100 .......... 001 ..... 0011011 @sh5
 binviw     0110100 .......... 001 ..... 0011011 @sh5
+sloiw      0010000 .......... 001 ..... 0011011 @sh5
+sroiw      0010000 .......... 101 ..... 0011011 @sh5
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 64d2b057764..0ea92312372 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -615,8 +615,12 @@ bset       0010100 .......... 001 ..... 0110011 @r
 bclr       0100100 .......... 001 ..... 0110011 @r
 binv       0110100 .......... 001 ..... 0110011 @r
 bext       0100100 .......... 101 ..... 0110011 @r
+slo        0010000 .......... 001 ..... 0110011 @r
+sro        0010000 .......... 101 ..... 0110011 @r
 
 bseti      00101. ........... 001 ..... 0010011 @sh
 bclri      01001. ........... 001 ..... 0010011 @sh
 binvi      01101. ........... 001 ..... 0010011 @sh
 bexti      01001. ........... 101 ..... 0010011 @sh
+sloi       00100. ........... 001 ..... 0010011 @sh
+sroi       00100. ........... 101 ..... 0010011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 0c41f135dc6..44f9f639240 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -155,6 +155,30 @@ static bool trans_bexti(DisasContext *ctx, arg_bexti *a)
     return gen_shifti(ctx, a, gen_bext);
 }
 
+static bool trans_slo(DisasContext *ctx, arg_slo *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, gen_slo);
+}
+
+static bool trans_sloi(DisasContext *ctx, arg_sloi *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shifti(ctx, a, gen_slo);
+}
+
+static bool trans_sro(DisasContext *ctx, arg_sro *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, gen_sro);
+}
+
+static bool trans_sroi(DisasContext *ctx, arg_sroi *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shifti(ctx, a, gen_sro);
+}
+
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
@@ -230,4 +254,28 @@ static bool trans_bextw(DisasContext *ctx, arg_bextw *a)
     return gen_shiftw(ctx, a, gen_bext);
 }
 
+static bool trans_slow(DisasContext *ctx, arg_slow *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, gen_slo);
+}
+
+static bool trans_sloiw(DisasContext *ctx, arg_sloiw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftiw(ctx, a, gen_slo);
+}
+
+static bool trans_srow(DisasContext *ctx, arg_srow *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, gen_sro);
+}
+
+static bool trans_sroiw(DisasContext *ctx, arg_sroiw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftiw(ctx, a, gen_sro);
+}
+
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 7ea434ffa8d..678c3dca81f 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -776,6 +776,20 @@ static void gen_bext(TCGv ret, TCGv arg1, TCGv shamt)
     tcg_gen_andi_tl(ret, ret, 1);
 }
 
+static void gen_slo(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_not_tl(ret, arg1);
+    tcg_gen_shl_tl(ret, ret, arg2);
+    tcg_gen_not_tl(ret, ret);
+}
+
+static void gen_sro(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_not_tl(ret, arg1);
+    tcg_gen_shr_tl(ret, ret, arg2);
+    tcg_gen_not_tl(ret, ret);
+}
+
 #ifdef TARGET_RISCV64
 
 static void gen_ctzw(TCGv ret, TCGv arg1)
-- 
2.17.1


