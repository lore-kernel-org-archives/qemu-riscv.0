Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfItp-0002WP-J5
	for mharc-qemu-riscv@gnu.org; Wed, 18 Nov 2020 03:33:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfItn-0002RZ-P6
 for qemu-riscv@nongnu.org; Wed, 18 Nov 2020 03:33:07 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:35850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfItl-0004rR-Lf
 for qemu-riscv@nongnu.org; Wed, 18 Nov 2020 03:33:07 -0500
Received: by mail-pj1-x102a.google.com with SMTP id x92so344514pjj.1
 for <qemu-riscv@nongnu.org>; Wed, 18 Nov 2020 00:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WXeYBWfi6TQh9v1NUXecFEoRBOEh7RLR0t7hbLVubDI=;
 b=W9T2WvEEKwquyqB3mdC/6FVZAfzbRdluPU7VK4uoNUC39n2UPb4BzheE/A3DZb4ZGz
 UKI/9xhmmcaJbREgvazns+IvoIL0/vNST58OsY/OnKpckJorsILPuexyQccZLDfjOMDE
 zqW3BNMDKwAllS1/lhKueKykfIpHQp0QLXeZw8jro0/6C0Yc/88ueG5xxazr2M9lEzgJ
 QQWGKxcoreWTlik4EK9McgoZWHyWhx4yfOuZEL2Pb1qBj+ziz6+SmRohdrOlc8a8iysF
 Wbwz54Bmfw/rE6ByPZdnQuXYzt5WO3h96FBgrKenfaUSbX9zSdu4+FQiQsijYf4hGCgW
 7Adw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WXeYBWfi6TQh9v1NUXecFEoRBOEh7RLR0t7hbLVubDI=;
 b=D9lhRRBibis7+Qm7Mq6CU7maW5TyGPHaD80mU9G5A62a1SJlpAtVvBzyomWJSPTRon
 iTlY8E+UBKk+wiy8uWKTUloWXWqYSt7+0f0oXQrnWVzEaIGydc5uXhy9YcqAeC7nG2gt
 1CFq8DItJ7e8KuEaqvBOc6D8dr6pyYHOI5ceTpaXVa7kBWCblimKjA1GDovgZmoBu+BH
 HbckX3DYr21X3Gu2odh+49pYps5Kwq4MIAgfJuiRgGpaJ3bnfXkrjLLEWwKE6lD2ygqX
 ie9szBAq1pv8uZLD3XXO7Nb4l2eSDH41hLYWTVNeeF5ysoBJkaDhpaCqI/lH68plFw8D
 1qcA==
X-Gm-Message-State: AOAM531YK5GKJVup80ZVxBF3QDl3IfUhcf49gBLVBsytyqTaXGH+69Mp
 V9Lhy/tid2nvdC45A7Y1y0M0Ow==
X-Google-Smtp-Source: ABdhPJwVw1QwrRlpOqaXZ0bXC+kAXNxh6s6o4QKbyzwZhVrA0lTT9TC6D6y6R2e+vvt2nscoE7iiLQ==
X-Received: by 2002:a17:90a:ad46:: with SMTP id w6mr118336pjv.90.1605688384210; 
 Wed, 18 Nov 2020 00:33:04 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id y10sm1618407pjm.34.2020.11.18.00.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:33:03 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Kito Cheng <kito.cheng@sifive.com>
Subject: [RFC 12/15] target/riscv: rvb: generalized or-combine
Date: Wed, 18 Nov 2020 16:29:50 +0800
Message-Id: <20201118083044.13992-13-frank.chang@sifive.com>
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
X-List-Received-Date: Wed, 18 Nov 2020 08:33:08 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/bitmanip_helper.c          | 49 +++++++++++++++++++++++++
 target/riscv/helper.h                   |  2 +
 target/riscv/insn32-64.decode           |  2 +
 target/riscv/insn32.decode              |  2 +
 target/riscv/insn_trans/trans_rvb.c.inc | 34 +++++++++++++++++
 target/riscv/translate.c                | 26 +++++++++++++
 6 files changed, 115 insertions(+)

diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
index 1d133db1552..83c4ac8e960 100644
--- a/target/riscv/bitmanip_helper.c
+++ b/target/riscv/bitmanip_helper.c
@@ -77,3 +77,52 @@ target_ulong HELPER(grevw)(target_ulong rs1, target_ulong rs2)
 
 #endif
 
+static target_ulong do_gorc(target_ulong rs1,
+                            target_ulong rs2,
+                            const target_ulong masks[])
+{
+    target_ulong x = rs1;
+    int shift = 1;
+    int i = 0;
+
+    while (shift < TARGET_LONG_BITS) {
+        if (rs2 & shift) {
+            x |= do_swap(x, masks[i], shift);
+        }
+        shift <<= 1;
+        ++i;
+    }
+
+    return x;
+}
+
+target_ulong HELPER(gorc)(target_ulong rs1, target_ulong rs2)
+{
+    static const target_ulong masks[] = {
+#ifdef TARGET_RISCV32
+        0x55555555, 0x33333333, 0x0f0f0f0f,
+        0x00ff00ff, 0x0000ffff,
+#else
+        0x5555555555555555, 0x3333333333333333, 0x0f0f0f0f0f0f0f0f,
+        0x00ff00ff00ff00ff, 0x0000ffff0000ffff, 0x00000000ffffffff,
+#endif
+    };
+
+    return do_gorc(rs1, rs2, masks);
+}
+
+/* RV64-only instruction */
+#ifdef TARGET_RISCV64
+
+target_ulong HELPER(gorcw)(target_ulong rs1, target_ulong rs2)
+{
+    static const target_ulong masks[] = {
+        0x55555555, 0x33333333, 0x0f0f0f0f,
+        0x00ff00ff, 0x0000ffff,
+    };
+
+    return do_gorc(rs1, rs2, masks);
+}
+
+#endif
+
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 15243a00761..8effa427b1a 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -68,9 +68,11 @@ DEF_HELPER_FLAGS_1(fclass_d, TCG_CALL_NO_RWG_SE, tl, i64)
 
 /* Bitmanip */
 DEF_HELPER_FLAGS_2(grev, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(gorc, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 
 #if defined(TARGET_RISCV64)
 DEF_HELPER_FLAGS_2(grevw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(gorcw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 #endif
 
 /* Special functions */
diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index f2d3b6a5b5d..8e6ec4750f3 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -103,6 +103,7 @@ srow       0010000 .......... 101 ..... 0111011 @r
 rorw       0110000 .......... 101 ..... 0111011 @r
 rolw       0110000 .......... 001 ..... 0111011 @r
 grevw      0110100 .......... 101 ..... 0111011 @r
+gorcw      0010100 .......... 101 ..... 0111011 @r
 
 sbsetiw    0010100 .......... 001 ..... 0011011 @sh5
 sbclriw    0100100 .......... 001 ..... 0011011 @sh5
@@ -111,3 +112,4 @@ sloiw      0010000 .......... 001 ..... 0011011 @sh5
 sroiw      0010000 .......... 101 ..... 0011011 @sh5
 roriw      0110000 .......... 101 ..... 0011011 @sh5
 greviw     0110100 .......... 101 ..... 0011011 @sh5
+gorciw     0010100 .......... 101 ..... 0011011 @sh5
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 60821a16661..76ba0698511 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -620,6 +620,7 @@ sro        0010000 .......... 101 ..... 0110011 @r
 ror        0110000 .......... 101 ..... 0110011 @r
 rol        0110000 .......... 001 ..... 0110011 @r
 grev       0110100 .......... 101 ..... 0110011 @r
+gorc       0010100 .......... 101 ..... 0110011 @r
 
 sbseti     001010 ........... 001 ..... 0010011 @sh
 sbclri     010010 ........... 001 ..... 0010011 @sh
@@ -629,3 +630,4 @@ sloi       001000 ........... 001 ..... 0010011 @sh
 sroi       001000 ........... 101 ..... 0010011 @sh
 rori       011000 ........... 101 ..... 0010011 @sh
 grevi      011010 ........... 101 ..... 0010011 @sh
+gorci      001010 ........... 101 ..... 0010011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 9f1482d313a..eade85125c5 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -229,6 +229,23 @@ static bool trans_grevi(DisasContext *ctx, arg_grevi *a)
     return gen_grevi(ctx, a);
 }
 
+static bool trans_gorc(DisasContext *ctx, arg_gorc *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_gorc);
+}
+
+static bool trans_gorci(DisasContext *ctx, arg_gorci *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+
+    if (a->shamt >= TARGET_LONG_BITS) {
+        return false;
+    }
+
+    return gen_arith_shamt_tl(ctx, a, &gen_gorc);
+}
+
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
@@ -377,4 +394,21 @@ static bool trans_greviw(DisasContext *ctx, arg_greviw *a)
     return gen_arith_shamt_tl(ctx, a, &gen_grevw);
 }
 
+static bool trans_gorcw(DisasContext *ctx, arg_gorcw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_gorcw);
+}
+
+static bool trans_gorciw(DisasContext *ctx, arg_gorciw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+
+    if (a->shamt >= 32) {
+        return false;
+    }
+
+    return gen_arith_shamt_tl(ctx, a, &gen_gorcw);
+}
+
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 80549154d6e..566e60d0d20 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -957,6 +957,17 @@ static bool gen_grevi(DisasContext *ctx, arg_grevi *a)
     return true;
 }
 
+static void gen_gorc(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv shamt;
+    shamt = tcg_temp_new();
+
+    gen_sbop_shamt(shamt, arg2);
+    gen_helper_gorc(ret, arg1, shamt);
+
+    tcg_temp_free(shamt);
+}
+
 
 #ifdef TARGET_RISCV64
 
@@ -1193,6 +1204,21 @@ static void gen_grevw(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_temp_free(shamt);
 }
 
+static void gen_gorcw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv shamt;
+    shamt = tcg_temp_new();
+
+    tcg_gen_ext32u_tl(arg1, arg1);
+
+    gen_sbopw_shamt(shamt, arg2);
+    gen_helper_gorc(ret, arg1, shamt);
+
+    tcg_gen_ext32s_tl(ret, ret);
+
+    tcg_temp_free(shamt);
+}
+
 #endif
 
 static bool gen_arith(DisasContext *ctx, arg_r *a,
-- 
2.17.1


