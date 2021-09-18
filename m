Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mRVbq-00036y-G9
	for mharc-qemu-riscv@gnu.org; Sat, 18 Sep 2021 04:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tangxingxin1008@gmail.com>)
 id 1mRTqp-0002xZ-BD; Sat, 18 Sep 2021 02:29:27 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:39431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tangxingxin1008@gmail.com>)
 id 1mRTqn-0003jj-Or; Sat, 18 Sep 2021 02:29:27 -0400
Received: by mail-pg1-x533.google.com with SMTP id g184so11773521pgc.6;
 Fri, 17 Sep 2021 23:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6yeG1jevblBNSzFCV5ZdGYMIIFAHWbiTojLMnc7vGoU=;
 b=ekhFT1FDbhx/PzMuW8ZH4/y01oFRHdsvDVnhCRdHUo7CpeWQDLlr2Oh7VwDatiCBCl
 dEOx0rqWJZMJfw9i6OMNaJgZdKHF6IODSOXhSc/wXol8U0ScBMND1IyxD86WkmEgm04d
 iMp6KdkywOiplsF5F3QkWVVza/CsSgX2c4aqkzFZR79RF9D7QC7pY4WZPYVpW+udETmq
 kvrNpOWiauoGMw+FDXbnNojyIqNWJR4gi6cPXS33qBTfAaX7QXSPizJw3uDxgkYIwa2D
 JmZIgGzH5Mhd/ZgZhF0As+oWKGzkGvE6s2P/WiCWmljcq7pLz/wbP/FzHEZnmzzKMN9x
 ZWAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6yeG1jevblBNSzFCV5ZdGYMIIFAHWbiTojLMnc7vGoU=;
 b=mI0rqQzoer3+qv239ykY8iIWAI//4AGUVTtzkhkYjy37iNw1RPzS0E4y3p1s/PivqV
 tEeuIs+sUYCPpe8bvFc278kLw2uEc59RrtB3e7tbw57cWKE9Gii7h16IBp1n9UsEzeCk
 dDwILDYAS348yTdyiRfNcUh5v9SPCSWHGFItP//6GxmdhVGYPCY65opxF3KYBoJzDkLt
 0tnMo/w3eCUFrlrBxUBXL77XwwH8oUuG+Ex3N+gz98GLRU5rljATo9dn9f4KJDUeQRFT
 yPjF3H8vJ4hyQTdniB/GQX6XM00VYPrhIiGmd3pQS3BOv95LoRSTVAIaE9KGqzKSI077
 bQvQ==
X-Gm-Message-State: AOAM532Dp5+fRDSKnmyDwLDkQTmenz46fR5TR+PdJWfs4z0W+3EWQvCu
 QUOrJAvS6yjQfk5W6zJ94xpoCM6nk2Ja3Nn8
X-Google-Smtp-Source: ABdhPJwBJ6eyOtg1YYGKi3g/G0uUzrk0UPnb7Zj/Wh1FrqD87FStG5zieshcOxvCcV057PNY+1xfyA==
X-Received: by 2002:a63:ef01:: with SMTP id u1mr13473289pgh.336.1631946564047; 
 Fri, 17 Sep 2021 23:29:24 -0700 (PDT)
Received: from eric-OptiPlex-7080.starfivetech.com (ip164.ip-51-195-37.eu.
 [51.195.37.164])
 by smtp.gmail.com with ESMTPSA id f27sm8126432pfq.78.2021.09.17.23.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 23:29:23 -0700 (PDT)
From: Eric Tang <tangxingxin1008@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com,
	alistair.francis@wdc.com,
	bin.meng@windriver.com
Subject: [RFC 07/10] target/riscv: rvb: add CRC instructions
Date: Sat, 18 Sep 2021 14:28:13 +0800
Message-Id: <20210918062816.7546-8-tangxingxin1008@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210918062816.7546-1-tangxingxin1008@gmail.com>
References: <20210918062816.7546-1-tangxingxin1008@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=tangxingxin1008@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 18 Sep 2021 04:22:04 -0400
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
X-List-Received-Date: Sat, 18 Sep 2021 06:29:27 -0000

Signed-off-by: Eric Tang <tangxingxin1008@gmail.com>

diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
index 35f7b0926b..469145ffa9 100644
--- a/target/riscv/bitmanip_helper.c
+++ b/target/riscv/bitmanip_helper.c
@@ -272,3 +272,58 @@ target_ulong HELPER(bfpw)(target_ulong rs1, target_ulong rs2)
 {
     return do_bfp(rs1, rs2, 32);
 }
+
+#define DO_CRC(NAME, VALUE)                                  \
+static target_ulong do_##NAME(target_ulong rs1,              \
+                              int nbits)                     \
+{                                                            \
+    int i;                                                   \
+    target_ulong x = rs1;                                    \
+    for (i = 0; i < nbits; i++) {                            \
+        x = (x >> 1) ^ ((VALUE) & ~((x & 1) - 1));           \
+    }                                                        \
+    return x;                                                \
+}
+
+DO_CRC(crc32, 0xEDB88320)
+DO_CRC(crc32c, 0x82F63B78)
+
+target_ulong HELPER(crc32_b)(target_ulong rs1)
+{
+    return do_crc32(rs1, 8);
+}
+
+target_ulong HELPER(crc32_h)(target_ulong rs1)
+{
+    return do_crc32(rs1, 16);
+}
+
+target_ulong HELPER(crc32_w)(target_ulong rs1)
+{
+    return do_crc32(rs1, 32);
+}
+
+target_ulong HELPER(crc32_d)(target_ulong rs1)
+{
+    return do_crc32(rs1, 64);
+}
+
+target_ulong HELPER(crc32c_b)(target_ulong rs1)
+{
+    return do_crc32c(rs1, 8);
+}
+
+target_ulong HELPER(crc32c_h)(target_ulong rs1)
+{
+    return do_crc32c(rs1, 16);
+}
+
+target_ulong HELPER(crc32c_w)(target_ulong rs1)
+{
+    return do_crc32c(rs1, 32);
+}
+
+target_ulong HELPER(crc32c_d)(target_ulong rs1)
+{
+    return do_crc32c(rs1, 64);
+}
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 474b1add63..9654d6f7a7 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -76,6 +76,14 @@ DEF_HELPER_FLAGS_2(xperm_h, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(xperm_w, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(bfp, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(bfpw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_1(crc32_b, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_1(crc32_h, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_1(crc32_w, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_1(crc32_d, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_1(crc32c_b, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_1(crc32c_h, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_1(crc32c_w, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_1(crc32c_d, TCG_CALL_NO_RWG_SE, tl, tl)
 
 /* Special functions */
 DEF_HELPER_2(csrr, tl, env, int)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 5d354f63a2..b08e38823b 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -670,6 +670,14 @@ ctz        011000 000001 ..... 001 ..... 0010011 @r2
 cpop       011000 000010 ..... 001 ..... 0010011 @r2
 sext_b     011000 000100 ..... 001 ..... 0010011 @r2
 sext_h     011000 000101 ..... 001 ..... 0010011 @r2
+crc32_b    0110000 10000 ..... 001 ..... 0010011 @r2
+crc32_h    0110000 10001 ..... 001 ..... 0010011 @r2
+crc32_w    0110000 10010 ..... 001 ..... 0010011 @r2
+crc32_d    0110000 10011 ..... 001 ..... 0010011 @r2
+crc32c_b   0110000 11000 ..... 001 ..... 0010011 @r2
+crc32c_h   0110000 11001 ..... 001 ..... 0010011 @r2
+crc32c_w   0110000 11010 ..... 001 ..... 0010011 @r2
+crc32c_d   0110000 11011 ..... 001 ..... 0010011 @r2
 
 andn       0100000 .......... 111 ..... 0110011 @r
 orn        0100000 .......... 110 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 1997d33008..0d734bfd10 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -386,6 +386,22 @@ GEN_TRANS_CLMUL(clmul)
 GEN_TRANS_CLMUL(clmulh)
 GEN_TRANS_CLMUL(clmulr)
 
+#define GEN_TRANS_CRC(NAME)                                 \
+static bool trans_##NAME(DisasContext *ctx, arg_##NAME * a) \
+{                                                           \
+    REQUIRE_EXT(ctx, RVB);                                  \
+    return gen_unary(ctx, a, EXT_NONE, gen_helper_##NAME);  \
+}                                                           \
+
+GEN_TRANS_CRC(crc32_b)
+GEN_TRANS_CRC(crc32_h)
+GEN_TRANS_CRC(crc32_w)
+GEN_TRANS_CRC(crc32_d)
+GEN_TRANS_CRC(crc32c_b)
+GEN_TRANS_CRC(crc32c_h)
+GEN_TRANS_CRC(crc32c_w)
+GEN_TRANS_CRC(crc32c_d)
+
 static void gen_cmix(TCGv ret, TCGv arg1, TCGv arg2, TCGv arg3)
 {
     tcg_gen_and_tl(arg1, arg1, arg2);
-- 
2.17.1


