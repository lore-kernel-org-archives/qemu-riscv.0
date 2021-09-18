Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mRVbr-0003Cs-Nr
	for mharc-qemu-riscv@gnu.org; Sat, 18 Sep 2021 04:22:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tangxingxin1008@gmail.com>)
 id 1mRTqw-0002yb-01; Sat, 18 Sep 2021 02:29:34 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:35839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tangxingxin1008@gmail.com>)
 id 1mRTqu-0003og-Bc; Sat, 18 Sep 2021 02:29:33 -0400
Received: by mail-pf1-x433.google.com with SMTP id w14so731480pfu.2;
 Fri, 17 Sep 2021 23:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=omX1JGg85tCDhPDd5VPa5EKEfYGoEVKZzUYKSpnDRzI=;
 b=Fr7toKcg8RHhXpUNkExSPZqtgxlb8XdUszfGpHzX2ZtMqqL9EoM3ZLTQH5d+hWlX0l
 bIYCKw4nggDcBIXZYQmFtDSeTK5i6LHa82OOSR/b8j8J9xrRDZqF+CVJPhhm8tUVSdmN
 D1zMwL1y7lsdFxhScGw4NWgQb2L6OZH9VhKq5hiVJQMWyA/RKN24w3cO84BlXKBPx2rF
 GJwkiFP3ciDif9eGXZs3348U7OtYyPoV0amg2Bs5vO/iIq9AKScamY8GTU2bTVBqL4Hb
 ofL/zHljEW/Gl4wBj/WF49ttBPPHfckbhxcwjHW4qa3weDkESQawK5wbQv99PqqwomqE
 ofJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=omX1JGg85tCDhPDd5VPa5EKEfYGoEVKZzUYKSpnDRzI=;
 b=FRSgisBGZ3So3nvaYomF1qA40Iq4ctzpWcIH1c7B1xCv6DDDZck/SPUWYrLq+7dQoU
 SI71Akv3vQyCTbaGTV3nUOIUrMakDo0PAia6GgWP+2RSbcxWnpZx6ZtrntpxmQPEAtaB
 bH+CFU022FOsLkahq+P1va798kLOKYlfNcTOTcfzD9n0geP278Uti61kUMUrnsoyXFC4
 aKKueSyGrqko9wobDN1IYO1iy3LAnCLD6WP6h61H7TS7IMfJ9qEp/ok+CDM0NFf/uK7I
 c8elCBr/SaVTVCPq5ooslNH6EDeyiXHta73wtRamQSEkcUxqbkJZli3odbLsbrG+wgrE
 /2IQ==
X-Gm-Message-State: AOAM530WRgmug3TtOQtdiNZgBBmHW+sO6nehIzMU09CDx/DkXdeBxwJL
 NGGP7fxu9DyZ+18xuvG58iBOzzl7R7NU0Xz5
X-Google-Smtp-Source: ABdhPJy8RUM2oI/kfKkj+POZuSCmaMz9IN1ZUfu/GTx0IyyMXSPD9ITA8+ggWNSSZJa/Ds2wiXewVA==
X-Received: by 2002:a62:52d4:0:b0:43d:fe6a:b51d with SMTP id
 g203-20020a6252d4000000b0043dfe6ab51dmr14487711pfb.49.1631946570448; 
 Fri, 17 Sep 2021 23:29:30 -0700 (PDT)
Received: from eric-OptiPlex-7080.starfivetech.com (ip164.ip-51-195-37.eu.
 [51.195.37.164])
 by smtp.gmail.com with ESMTPSA id f27sm8126432pfq.78.2021.09.17.23.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 23:29:30 -0700 (PDT)
From: Eric Tang <tangxingxin1008@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com,
	alistair.francis@wdc.com,
	bin.meng@windriver.com
Subject: [RFC 08/10] target/riscv: rvb:  add bit-matrix instructions
Date: Sat, 18 Sep 2021 14:28:14 +0800
Message-Id: <20210918062816.7546-9-tangxingxin1008@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210918062816.7546-1-tangxingxin1008@gmail.com>
References: <20210918062816.7546-1-tangxingxin1008@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=tangxingxin1008@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 18 Sep 2021 04:22:07 -0400
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
X-List-Received-Date: Sat, 18 Sep 2021 06:29:34 -0000

Signed-off-by: Eric Tang <tangxingxin1008@gmail.com>

diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
index 469145ffa9..e936444c12 100644
--- a/target/riscv/bitmanip_helper.c
+++ b/target/riscv/bitmanip_helper.c
@@ -327,3 +327,78 @@ target_ulong HELPER(crc32c_d)(target_ulong rs1)
 {
     return do_crc32c(rs1, 64);
 }
+
+static target_ulong do_bmatflip(target_ulong rs1,
+                                int bits)
+{
+    target_ulong x = rs1;
+    for (int i = 0; i < 3; i++) {
+        x = do_shfl(x, 31, bits);
+    }
+    return x;
+}
+
+static target_ulong do_bmatxor(target_ulong rs1,
+                               target_ulong rs2,
+                               int bits)
+{
+    int i;
+    uint8_t u[8];
+    uint8_t v[8];
+    uint64_t x = 0;
+
+    target_ulong rs2t = do_bmatflip(rs2, bits);
+
+    for (i = 0; i < 8; i++) {
+        u[i] = rs1 >> (i * 8);
+        v[i] = rs2t >> (i * 8);
+    }
+
+    for (int i = 0; i < 64; i++) {
+        if (__builtin_popcount(u[i / 8] & v[i % 8]) & 1) {
+            x |= 1LL << i;
+        }
+    }
+
+    return x;
+}
+
+static target_ulong do_bmator(target_ulong rs1,
+                              target_ulong rs2,
+                              int bits)
+{
+    int i;
+    uint8_t u[8];
+    uint8_t v[8];
+    uint64_t x = 0;
+
+    target_ulong rs2t = do_bmatflip(rs2, bits);
+
+    for (i = 0; i < 8; i++) {
+        u[i] = rs1 >> (i * 8);
+        v[i] = rs2t >> (i * 8);
+    }
+
+    for (int i = 0; i < 64; i++) {
+        if ((u[i / 8] & v[i % 8]) != 0) {
+            x |= 1LL << i;
+        }
+    }
+
+    return x;
+}
+
+target_ulong HELPER(bmatflip)(target_ulong rs1)
+{
+    return do_bmatflip(rs1, TARGET_LONG_BITS);
+}
+
+target_ulong HELPER(bmatxor)(target_ulong rs1, target_ulong rs2)
+{
+    return do_bmatxor(rs1, rs2, TARGET_LONG_BITS);
+}
+
+target_ulong HELPER(bmator)(target_ulong rs1, target_ulong rs2)
+{
+    return do_bmator(rs1, rs2, TARGET_LONG_BITS);
+}
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 9654d6f7a7..8c8fb71bb4 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -84,6 +84,9 @@ DEF_HELPER_FLAGS_1(crc32c_b, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_1(crc32c_h, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_1(crc32c_w, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_1(crc32c_d, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_2(bmatxor, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(bmator, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_1(bmatflip, TCG_CALL_NO_RWG_SE, tl, tl)
 
 /* Special functions */
 DEF_HELPER_2(csrr, tl, env, int)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index b08e38823b..73f956486b 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -730,6 +730,7 @@ unshfli    000010 ........... 101 ..... 0010011 @sh6
 clzw       0110000 00000 ..... 001 ..... 0011011 @r2
 ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
 cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
+bmatflip   0110000 00011 ..... 001 ..... 0010011 @r2
 
 packw      0000100 .......... 100 ..... 0111011 @r
 packuw     0100100 .......... 100 ..... 0111011 @r
@@ -751,6 +752,8 @@ shflw      0000100 .......... 001 ..... 0111011 @r
 unshflw    0000100 .......... 101 ..... 0111011 @r
 xperm_w    0010100 .......... 000 ..... 0110011 @r
 bfpw       0100100 .......... 111 ..... 0111011 @r
+bmator     0000100 .......... 011 ..... 0110011 @r
+bmatxor    0100100 .......... 011 ..... 0110011 @r
 
 bsetiw     0010100 .......... 001 ..... 0011011 @sh5
 bclriw     0100100 .......... 001 ..... 0011011 @sh5
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 0d734bfd10..39ca5a573f 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -805,3 +805,24 @@ static bool trans_bfpw(DisasContext *ctx, arg_bfpw *a)
     ctx->w = true;
     return gen_arith(ctx, a, EXT_NONE, gen_helper_bfpw);
 }
+
+static bool trans_bmatflip(DisasContext *ctx, arg_bmatflip *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, EXT_NONE, gen_helper_bmatflip);
+}
+
+static bool trans_bmatxor(DisasContext *ctx, arg_bmatxor *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_bmatxor);
+}
+
+static bool trans_bmator(DisasContext *ctx, arg_bmator *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_bmator);
+}
-- 
2.17.1


