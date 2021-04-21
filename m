Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZ4GH-0007FQ-CR
	for mharc-qemu-riscv@gnu.org; Wed, 21 Apr 2021 00:14:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4GD-0007D7-Ip
 for qemu-riscv@nongnu.org; Wed, 21 Apr 2021 00:14:45 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:34570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4GB-0003Ds-N7
 for qemu-riscv@nongnu.org; Wed, 21 Apr 2021 00:14:45 -0400
Received: by mail-pf1-x42f.google.com with SMTP id 10so18568509pfl.1
 for <qemu-riscv@nongnu.org>; Tue, 20 Apr 2021 21:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6A4VDIlHHO0tVpmSEJTBH5JNS38LY7kb5mPxw33qasY=;
 b=k8MzTU25WdQWs4K4UMRboqjyCXNxpnuBES/mURFOXhTyqGkLp3d3Xst1Shw4NnoW3D
 npAnVuojZMf8/v9jsemDAEVHGq0qROvX6VjvgNKJpWVDYscTHOdokpxLb02TcGBjKtN3
 a4WgKNFU8tiFyonHIMMdqyBj79Q200FnvnxYBIkjWqFwP0mA3JbujDZ0c60FjrMIBfPv
 SI3r/fdUGXMzPa16mINXKs0hqLwdlSTgr95eM31E0XIdpWgywha71wvUURYRF2gSt3E1
 ReMaOa+YL6D20e2KqrXxn0qqqSlWhvNonDTwuDKVqv7G8P38UVCCqhQHALp0j3VFrPJB
 0pJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6A4VDIlHHO0tVpmSEJTBH5JNS38LY7kb5mPxw33qasY=;
 b=YXr3xuOXjTmgEQQFqfvJBJT5SptnWBfR8B1Ix+DJ9HNocLZLmp6XTUFafytsbJ2AKl
 giZMzhJb3VTPNn4dv/Z3y3U9q+AkNJN6LZoa9InJiRNvmnFw1pwtkzf9/jOptCtEnVeR
 r05z0e122cKoyAHRuxtUrpXt5LsdNJX/ysLDt2eBZtsh/1D/B2DWnLf0ERgW3cRvF/8W
 qUr8fd5u0/LsSluTM/Ceze6ZEjcHHgfnmPOJSIOGB9C6ip0/6W0i3B0ouTcPudIvwU/1
 oLWcGe/wJcfdlhlrJ0wQLnt+gXFvS1Y1Fm6WR7LatwrSlq6FYazmAHB2qj6vXa+htiQI
 jfdg==
X-Gm-Message-State: AOAM530++/Qmi2N/YBvNXXxK2KlUDyDEERgQPNZcrmNeCcTmd5MlrCr+
 YdbpsqBp22ANDwD4MKlNby8gkQYFZyN3TWkM
X-Google-Smtp-Source: ABdhPJxvPEKKHlGW7Lg91eiVhNuXOE8gkbT09SOUk6bfYbbTy0sRyiSCEOIEc0eObyLGxSG17ajQUg==
X-Received: by 2002:a63:cf55:: with SMTP id b21mr20896374pgj.126.1618978482464; 
 Tue, 20 Apr 2021 21:14:42 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id jx20sm551465pjb.41.2021.04.20.21.14.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 21:14:42 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v5 11/17] target/riscv: rvb: rotate (left/right)
Date: Wed, 21 Apr 2021 12:13:53 +0800
Message-Id: <20210421041400.22243-12-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210421041400.22243-1-frank.chang@sifive.com>
References: <20210421041400.22243-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42f.google.com
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
X-List-Received-Date: Wed, 21 Apr 2021 04:14:46 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32-64.decode           |  3 +++
 target/riscv/insn32.decode              |  3 +++
 target/riscv/insn_trans/trans_rvb.c.inc | 36 +++++++++++++++++++++++++
 target/riscv/translate.c                | 36 +++++++++++++++++++++++++
 4 files changed, 78 insertions(+)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 8c3ed33077e..8f9ba21b352 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -100,9 +100,12 @@ binvw      0110100 .......... 001 ..... 0111011 @r
 bextw      0100100 .......... 101 ..... 0111011 @r
 slow       0010000 .......... 001 ..... 0111011 @r
 srow       0010000 .......... 101 ..... 0111011 @r
+rorw       0110000 .......... 101 ..... 0111011 @r
+rolw       0110000 .......... 001 ..... 0111011 @r
 
 bsetiw     0010100 .......... 001 ..... 0011011 @sh5
 bclriw     0100100 .......... 001 ..... 0011011 @sh5
 binviw     0110100 .......... 001 ..... 0011011 @sh5
 sloiw      0010000 .......... 001 ..... 0011011 @sh5
 sroiw      0010000 .......... 101 ..... 0011011 @sh5
+roriw      0110000 .......... 101 ..... 0011011 @sh5
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 0ea92312372..6d1b604c800 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -617,6 +617,8 @@ binv       0110100 .......... 001 ..... 0110011 @r
 bext       0100100 .......... 101 ..... 0110011 @r
 slo        0010000 .......... 001 ..... 0110011 @r
 sro        0010000 .......... 101 ..... 0110011 @r
+ror        0110000 .......... 101 ..... 0110011 @r
+rol        0110000 .......... 001 ..... 0110011 @r
 
 bseti      00101. ........... 001 ..... 0010011 @sh
 bclri      01001. ........... 001 ..... 0010011 @sh
@@ -624,3 +626,4 @@ binvi      01101. ........... 001 ..... 0010011 @sh
 bexti      01001. ........... 101 ..... 0010011 @sh
 sloi       00100. ........... 001 ..... 0010011 @sh
 sroi       00100. ........... 101 ..... 0010011 @sh
+rori       01100. ........... 101 ..... 0010011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 44f9f639240..8a46fde4767 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -179,6 +179,24 @@ static bool trans_sroi(DisasContext *ctx, arg_sroi *a)
     return gen_shifti(ctx, a, gen_sro);
 }
 
+static bool trans_ror(DisasContext *ctx, arg_ror *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, tcg_gen_rotr_tl);
+}
+
+static bool trans_rori(DisasContext *ctx, arg_rori *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shifti(ctx, a, tcg_gen_rotr_tl);
+}
+
+static bool trans_rol(DisasContext *ctx, arg_rol *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, tcg_gen_rotl_tl);
+}
+
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
@@ -278,4 +296,22 @@ static bool trans_sroiw(DisasContext *ctx, arg_sroiw *a)
     return gen_shiftiw(ctx, a, gen_sro);
 }
 
+static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, gen_rorw);
+}
+
+static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftiw(ctx, a, gen_rorw);
+}
+
+static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, gen_rolw);
+}
+
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index c7457553673..5f62fbb6964 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -653,6 +653,42 @@ static void gen_packuw(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_temp_free(t);
 }
 
+static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv_i32 t1 = tcg_temp_new_i32();
+    TCGv_i32 t2 = tcg_temp_new_i32();
+
+    /* truncate to 32-bits */
+    tcg_gen_trunc_tl_i32(t1, arg1);
+    tcg_gen_trunc_tl_i32(t2, arg2);
+
+    tcg_gen_rotr_i32(t1, t1, t2);
+
+    /* sign-extend 64-bits */
+    tcg_gen_ext_i32_tl(ret, t1);
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
+}
+
+static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv_i32 t1 = tcg_temp_new_i32();
+    TCGv_i32 t2 = tcg_temp_new_i32();
+
+    /* truncate to 32-bits */
+    tcg_gen_trunc_tl_i32(t1, arg1);
+    tcg_gen_trunc_tl_i32(t2, arg2);
+
+    tcg_gen_rotl_i32(t1, t1, t2);
+
+    /* sign-extend 64-bits */
+    tcg_gen_ext_i32_tl(ret, t1);
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
+}
+
 #endif
 
 static bool gen_arith(DisasContext *ctx, arg_r *a,
-- 
2.17.1


