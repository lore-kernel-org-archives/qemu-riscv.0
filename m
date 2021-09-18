Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mRVbW-0002ee-HD
	for mharc-qemu-riscv@gnu.org; Sat, 18 Sep 2021 04:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tangxingxin1008@gmail.com>)
 id 1mRTqJ-0002i6-4e; Sat, 18 Sep 2021 02:28:55 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:40826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tangxingxin1008@gmail.com>)
 id 1mRTqH-0003Es-JQ; Sat, 18 Sep 2021 02:28:54 -0400
Received: by mail-pf1-x431.google.com with SMTP id y8so11205569pfa.7;
 Fri, 17 Sep 2021 23:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rFoqqvN0CrtpEo+tl8a+Opb0h4GrOuZq3kv55mR/xyk=;
 b=otdpNdYbX+jDxVwlRFR3QbS2k/ftbI3nTXwl5L4XZyM6FXj7h39YOSIsqlEbXYlXT0
 NHaTVL6WpQOzySQpLN4Naw2CGXLijVv/Kd7EwbLn247qpW+BZWt7gRmURPHb/FkdOjg+
 YMvU/RsImXrph/C544f6CN0ZN0Nvy+pMFUU6CGAUxHbEI9b8GjBNkA66BkfM21zG/AE5
 Phj+7JjgzPD4mgWVy7JyUCUPoppwInsmCsfAGyCMvzohAYkzR/7Qjb7Grc5kvbenBvGd
 sgHBx9tXY1itLqXZue35F+lcRLdJvAtLSQGLSBx4vLJn1cplejsakcuzTEyx/K+lQiNT
 bwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=rFoqqvN0CrtpEo+tl8a+Opb0h4GrOuZq3kv55mR/xyk=;
 b=H+ojwKf3W/rplQdyBxnYScJkR2T3HAzlejbsannVBqXipBIDNKjW5VUFTKUfW8fFDv
 YVuro6qXOIujl7CRgq4VFG/Bbn2lKNK7xzW9K7xG7pdVpabdRwwi5b4KJf4SsoX5IL3/
 j9WvAtCdDl3b4YEcyddZGc19W5c+TPg3psq3HEke3Ku6ibAKu3+kiQKUcQ2YAEmEwwuY
 QUoSCkTeZNPcsjtPJcUQAG/mKW8QS6jNB7g3rK1DpmxyMH6UpLXWi806xrgUs0lwZlVL
 XlEKjMAOxulzmGuom7sfjH9XlRW3gzfw0rmwYmdyAo7jATmDV0JN+ycUHSgW6JbRXzTZ
 ZYrw==
X-Gm-Message-State: AOAM530TEJBBdbv/FOa+qBbbN6jtpskhzei4HWrvcS31mGsKTApPy3p+
 OMZDl3laxbPlLC1WMXfXEUK1e9MJ7G5z4gaY
X-Google-Smtp-Source: ABdhPJwza0ofM+D56dyABx3c24Zz22rCdlN2IUjvnayW6RZufrM5kdNogPeOWJxXXywKW5kain8Beg==
X-Received: by 2002:a65:6554:: with SMTP id a20mr13342565pgw.107.1631946531747; 
 Fri, 17 Sep 2021 23:28:51 -0700 (PDT)
Received: from eric-OptiPlex-7080.starfivetech.com (ip164.ip-51-195-37.eu.
 [51.195.37.164])
 by smtp.gmail.com with ESMTPSA id f27sm8126432pfq.78.2021.09.17.23.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 23:28:51 -0700 (PDT)
From: Eric Tang <tangxingxin1008@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com,
	alistair.francis@wdc.com,
	bin.meng@windriver.com
Subject: [RFC 02/10] target/riscv: rvb: add carry-less multiply instructions
Date: Sat, 18 Sep 2021 14:28:08 +0800
Message-Id: <20210918062816.7546-3-tangxingxin1008@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210918062816.7546-1-tangxingxin1008@gmail.com>
References: <20210918062816.7546-1-tangxingxin1008@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=tangxingxin1008@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 18 Sep 2021 04:21:44 -0400
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
X-List-Received-Date: Sat, 18 Sep 2021 06:28:55 -0000

Signed-off-by: Eric Tang <tangxingxin1008@gmail.com>

diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
index 5b2f795d03..e31cf582ca 100644
--- a/target/riscv/bitmanip_helper.c
+++ b/target/riscv/bitmanip_helper.c
@@ -88,3 +88,38 @@ target_ulong HELPER(gorcw)(target_ulong rs1, target_ulong rs2)
 {
     return do_gorc(rs1, rs2, 32);
 }
+
+#define DO_CLMULA(NAME, NUM, BODY)                          \
+static target_ulong do_##NAME(target_ulong rs1,             \
+                              target_ulong rs2,             \
+                              int bits)                     \
+{                                                           \
+    target_ulong x = 0;                                     \
+    int i;                                                  \
+                                                            \
+    for (i = NUM; i < bits; i++) {                          \
+        if ((rs2 >> i) & 1) {                               \
+            x ^= BODY;                                      \
+        }                                                   \
+    }                                                       \
+    return x;                                               \
+}
+
+DO_CLMULA(clmul, 0, (rs1 << i))
+DO_CLMULA(clmulh, 1, (rs1 >> (bits - i)))
+DO_CLMULA(clmulr, 0, (rs1 >> (bits - i - 1)))
+
+target_ulong HELPER(clmul)(target_ulong rs1, target_ulong rs2)
+{
+    return do_clmul(rs1, rs2, TARGET_LONG_BITS);
+}
+
+target_ulong HELPER(clmulh)(target_ulong rs1, target_ulong rs2)
+{
+    return do_clmulh(rs1, rs2, TARGET_LONG_BITS);
+}
+
+target_ulong HELPER(clmulr)(target_ulong rs1, target_ulong rs2)
+{
+    return do_clmulr(rs1, rs2, TARGET_LONG_BITS);
+}
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 460eee9988..7cbcee48e6 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -63,6 +63,9 @@ DEF_HELPER_FLAGS_2(grev, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(grevw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(gorc, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(gorcw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(clmul, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(clmulh, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(clmulr, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 
 /* Special functions */
 DEF_HELPER_2(csrr, tl, env, int)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 2cd921d51c..9eff9d5f5c 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -690,6 +690,9 @@ gorc       0010100 .......... 101 ..... 0110011 @r
 sh1add     0010000 .......... 010 ..... 0110011 @r
 sh2add     0010000 .......... 100 ..... 0110011 @r
 sh3add     0010000 .......... 110 ..... 0110011 @r
+clmul      0000101 .......... 001 ..... 0110011 @r
+clmulh     0000101 .......... 011 ..... 0110011 @r
+clmulr     0000101 .......... 010 ..... 0110011 @r
 
 bseti      00101. ........... 001 ..... 0010011 @sh
 bclri      01001. ........... 001 ..... 0010011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 96b6fcb41d..1d999929de 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -321,6 +321,17 @@ static bool trans_gorci(DisasContext *ctx, arg_gorci *a)
     return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_helper_gorc);
 }
 
+#define GEN_TRANS_CLMUL(NAME)                               \
+static bool trans_##NAME(DisasContext *ctx, arg_##NAME * a) \
+{                                                           \
+    REQUIRE_EXT(ctx, RVB);                                  \
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_##NAME);  \
+}
+
+GEN_TRANS_CLMUL(clmul)
+GEN_TRANS_CLMUL(clmulh)
+GEN_TRANS_CLMUL(clmulr)
+
 #define GEN_SHADD(SHAMT)                                       \
 static void gen_sh##SHAMT##add(TCGv ret, TCGv arg1, TCGv arg2) \
 {                                                              \
-- 
2.17.1


