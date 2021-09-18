Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mRVbn-0002xr-8f
	for mharc-qemu-riscv@gnu.org; Sat, 18 Sep 2021 04:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tangxingxin1008@gmail.com>)
 id 1mRTqc-0002tF-Mf; Sat, 18 Sep 2021 02:29:14 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:41739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tangxingxin1008@gmail.com>)
 id 1mRTqb-0003VQ-2u; Sat, 18 Sep 2021 02:29:14 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 m21-20020a17090a859500b00197688449c4so8991062pjn.0; 
 Fri, 17 Sep 2021 23:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8q194n3OcHIu6kJw6qzrVE2FyEddlwDvVh+pktzSnos=;
 b=NYO6K+XQ3TXOra9cpxFMgIgag3Mv8CGxdKAQ5nUa6O48abCJ0NWCLgzn7wQE3R7Bso
 5gAkbjMqqkuSiJ2YJpRI2eTGMU3xlrbJdEQzeEZljugtYvNmrn9Aa5WbvAlUlT9CG/9l
 RyhpXuSmAcPILxmuZFXo9vXIo4+LTFyxe+mPwn/f1LaEyWIWa4VdWtTG4z15xPUFA4YS
 cmuurZYzoBoegXSxPwKv3SulP4Afcdv7zgUVW8QF2G6Dsj75YIqwkR+vw4fDj1kf89sa
 tUuDQxaKNmd1Wr7bfYrMbtZDcmwMH3E8HwOJmurygwSS8pCb8zrlkiA1tbLoGh3r3DtI
 5EXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8q194n3OcHIu6kJw6qzrVE2FyEddlwDvVh+pktzSnos=;
 b=tgIoIg6KX23WbpwspDvdK2lHE72qTCtcCeE0gykIVzd+65MvY7nj0pQUmFIUH5NGRb
 okpsyz6MQxkj0OvAexxGJR0gyNdzW4sfdQRrxB2VEeGWRedPt6AsgJfrpePZ5yiNuVd6
 EGwquSAxB4bJSi5EQFRlgiXmByeRJU3plmivFMXWzKEf5/RuLelbnw6J/7WepTPNZqRA
 6ZZd5AxF8LRqeSALo9+BLaW0duJzl9j9qpRDnhCSEcwS0EiDRnOyQJhEdaGL7fJhvAX5
 dXWfeioHBXJp3XBsHhkRjde8SYRZ8BKPBmTJ0CHcp4igjf8ZtoSNqpku/jldgEtEdL+1
 f9rA==
X-Gm-Message-State: AOAM531Z3JPa3BEKHPTV0vCPveWuDjYuldC2O+wvtpbyb/Mz6UoJ1GSz
 9Y3k8PJgS6ZKcSGzKUAJomhLa9AjNMQDwe8k
X-Google-Smtp-Source: ABdhPJxHRPvhs7QTWcTDBg7kGepHfC1DvmpFdDwbYMzU7jfDpWxvoNwMhS8D4ZDThYYVokKX5WDQog==
X-Received: by 2002:a17:90a:eac4:: with SMTP id
 ev4mr16530553pjb.244.1631946551137; 
 Fri, 17 Sep 2021 23:29:11 -0700 (PDT)
Received: from eric-OptiPlex-7080.starfivetech.com (ip164.ip-51-195-37.eu.
 [51.195.37.164])
 by smtp.gmail.com with ESMTPSA id f27sm8126432pfq.78.2021.09.17.23.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 23:29:10 -0700 (PDT)
From: Eric Tang <tangxingxin1008@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com,
	alistair.francis@wdc.com,
	bin.meng@windriver.com
Subject: [RFC 05/10] target/riscv: rvb: add crossbar permutation instructions
Date: Sat, 18 Sep 2021 14:28:11 +0800
Message-Id: <20210918062816.7546-6-tangxingxin1008@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210918062816.7546-1-tangxingxin1008@gmail.com>
References: <20210918062816.7546-1-tangxingxin1008@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=tangxingxin1008@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 18 Sep 2021 04:21:54 -0400
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
X-List-Received-Date: Sat, 18 Sep 2021 06:29:15 -0000

Signed-off-by: Eric Tang <tangxingxin1008@gmail.com>

diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
index 19c64756c5..fa4597b44b 100644
--- a/target/riscv/bitmanip_helper.c
+++ b/target/riscv/bitmanip_helper.c
@@ -205,3 +205,43 @@ target_ulong HELPER(unshflw)(target_ulong rs1, target_ulong rs2)
 {
     return do_unshfl(rs1, rs2, 32);
 }
+
+static target_ulong do_xperm(target_ulong rs1,
+                             target_ulong rs2,
+                             int sz_log2,
+                             int bits)
+{
+    target_ulong pos = 0;
+    target_ulong r = 0;
+    target_ulong sz = 1LL << sz_log2;
+    target_ulong mask = (1LL << sz) - 1;
+    int i;
+    for (i = 0; i < bits; i += sz) {
+        pos = ((rs2 >> i) & mask) << sz_log2;
+        if (pos < bits) {
+            r |= ((rs1 >> pos) & mask) << i;
+        }
+    }
+
+    return r;
+}
+
+target_ulong HELPER(xperm_n)(target_ulong rs1, target_ulong rs2)
+{
+    return do_xperm(rs1, rs2, 2, TARGET_LONG_BITS);
+}
+
+target_ulong HELPER(xperm_b)(target_ulong rs1, target_ulong rs2)
+{
+    return do_xperm(rs1, rs2, 3, TARGET_LONG_BITS);
+}
+
+target_ulong HELPER(xperm_h)(target_ulong rs1, target_ulong rs2)
+{
+    return do_xperm(rs1, rs2, 4, TARGET_LONG_BITS);
+}
+
+target_ulong HELPER(xperm_w)(target_ulong rs1, target_ulong rs2)
+{
+    return do_xperm(rs1, rs2, 5, TARGET_LONG_BITS);
+}
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 015526faf0..ac57982e4f 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -70,6 +70,10 @@ DEF_HELPER_FLAGS_2(shfl, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(unshfl, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(shflw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(unshflw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(xperm_n, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(xperm_b, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(xperm_h, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(xperm_w, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 
 /* Special functions */
 DEF_HELPER_2(csrr, tl, env, int)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index e70a38a5c6..60b56dbf95 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -699,6 +699,9 @@ clmulh     0000101 .......... 011 ..... 0110011 @r
 clmulr     0000101 .......... 010 ..... 0110011 @r
 shfl       0000100 .......... 001 ..... 0110011 @r
 unshfl     0000100 .......... 101 ..... 0110011 @r
+xperm_n    0010100 .......... 010 ..... 0110011 @r
+xperm_b    0010100 .......... 100 ..... 0110011 @r
+xperm_h    0010100 .......... 110 ..... 0110011 @r
 cmix       .....11 .......... 001 ..... 0110011 @r4
 cmov       .....11 .......... 101 ..... 0110011 @r4
 
@@ -737,6 +740,7 @@ sh3add_uw  0010000 .......... 110 ..... 0111011 @r
 add_uw     0000100 .......... 000 ..... 0111011 @r
 shflw      0000100 .......... 001 ..... 0111011 @r
 unshflw    0000100 .......... 101 ..... 0111011 @r
+xperm_w    0010100 .......... 000 ..... 0110011 @r
 
 bsetiw     0010100 .......... 001 ..... 0011011 @sh5
 bclriw     0100100 .......... 001 ..... 0011011 @sh5
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index cbd48b4c8c..e869d82c8f 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -351,6 +351,24 @@ static bool trans_unshfli(DisasContext *ctx, arg_unshfli *a)
     return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_helper_unshfl);
 }
 
+static bool trans_xperm_n(DisasContext *ctx, arg_xperm_n *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_xperm_n);
+}
+
+static bool trans_xperm_b(DisasContext *ctx, arg_xperm_b *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_xperm_b);
+}
+
+static bool trans_xperm_h(DisasContext *ctx, arg_xperm_h *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_xperm_h);
+}
+
 #define GEN_TRANS_CLMUL(NAME)                               \
 static bool trans_##NAME(DisasContext *ctx, arg_##NAME * a) \
 {                                                           \
@@ -749,3 +767,11 @@ static bool trans_unshflw(DisasContext *ctx, arg_unshflw *a)
     ctx->w = true;
     return gen_arith(ctx, a, EXT_ZERO, gen_helper_unshflw);
 }
+
+static bool trans_xperm_w(DisasContext *ctx, arg_xperm_w *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    ctx->w = true;
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_xperm_w);
+}
-- 
2.17.1


