Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2A7C77B7A
	for <qemu-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 02:37:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q5H72-0000ze-DD; Fri, 02 Jun 2023 22:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6J-0000N9-UN
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:34:44 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6C-0004j5-3X
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:34:43 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-6af6b5cf489so2492777a34.3
 for <qemu-riscv@nongnu.org>; Fri, 02 Jun 2023 19:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759673; x=1688351673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oe26BuCyJMyrdOPsjHo9JPVC3OcUjCngbFzXRSOAiwY=;
 b=l7xGIS2KHsPo4GDujafSMdei50jKLFDvYFnqDWrQUHBGNFadUvTaey/ZO/oaROcdou
 r3eGT9isMHt/9KXeEEGft3FQrjprKE9iC89Qi+Lqf+VIKQ0mMzOrNW7HJYxhD5dL5UWE
 KNioY4D+EmIOLgiJwwnxxqZTqn2Yv5ca6J6ZAehrosf7h0qONhXi7vWZW/lJNRaO+PWm
 vqIaDQF+8OYNfwsUtP5YNUQejlvjKJIRCCaVzCUx3U9hRacaqBUkGYGWPi1veuJ/Uk6f
 2YmNo2iG3R2KwdJjJFKaEru9zGY1Y3srwQMeGQsMZ3L2H3wpIdrG2EOSb1vRlv8jEdGg
 Brpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759673; x=1688351673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oe26BuCyJMyrdOPsjHo9JPVC3OcUjCngbFzXRSOAiwY=;
 b=apYcPHuLnroV3c2Vp7XM4+bftJyaLkHiDWCezxj8sGFPOn0JK8ilC6oQBCw3O4NWMv
 ZMCIJxE+FDcYdNFo8xyIuUPF8ffPTxHlXrNnIrpYf7w06v5jXg9fv1ED0PQFqD2rBm6C
 IVGoTPp1OcfR9vB8mI+JNSpsNYhDLEeLi63XwJQPfpNNkT/TWVJb45rF/VDwr7iAxKg/
 5VX621kSPgkLqLcugBkV4ZWKUkO6axD2hqZD3wFvPwhnVgqgZUtzVlw1J4cSBhIQekDw
 xbwFEUxPsMZEtW6IN7Pej2jpzNM3pp3o8Xn5WIVYb1kRJDhJqicxw+bxOnEBNX+pF3Rm
 xUlQ==
X-Gm-Message-State: AC+VfDx95yKnZGrrGZCWjx2sZxW2zky+DWtwhligcQ52T2dTn53fsMqv
 0jrNlGRcCmWmZAJHBommxbmqUiDlyfKs2h8U2l0=
X-Google-Smtp-Source: ACHHUZ6evDR0QRS8MuUgroSYKWS04S8PCcMRAIwczmsJGQFUr/cFD4DD9342n95zYd3NrLpqcpwk2Q==
X-Received: by 2002:a05:6358:ce1a:b0:127:d8c1:b829 with SMTP id
 gt26-20020a056358ce1a00b00127d8c1b829mr7254454rwb.27.1685759673153; 
 Fri, 02 Jun 2023 19:34:33 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 06/35] target/arm: Demultiplex AESE and AESMC
Date: Fri,  2 Jun 2023 19:33:57 -0700
Message-Id: <20230603023426.1064431-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Split these helpers so that we are not passing 'decrypt'
within the simd descriptor.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h             |  2 ++
 target/arm/tcg/sve.decode       |  4 ++--
 target/arm/tcg/crypto_helper.c  | 37 +++++++++++++++++++++++----------
 target/arm/tcg/translate-a64.c  | 13 ++++--------
 target/arm/tcg/translate-neon.c |  4 ++--
 target/arm/tcg/translate-sve.c  |  8 ++++---
 6 files changed, 41 insertions(+), 27 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 3335c2b10b..95e32a697a 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -552,7 +552,9 @@ DEF_HELPER_FLAGS_2(neon_qzip16, TCG_CALL_NO_RWG, void, ptr, ptr)
 DEF_HELPER_FLAGS_2(neon_qzip32, TCG_CALL_NO_RWG, void, ptr, ptr)
 
 DEF_HELPER_FLAGS_4(crypto_aese, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(crypto_aesd, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(crypto_aesmc, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(crypto_aesimc, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(crypto_sha1su0, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(crypto_sha1c, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 14b3a69c36..04b6fcc0cf 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1629,8 +1629,8 @@ STNT1_zprz      1110010 .. 10 ..... 001 ... ..... ..... \
 ### SVE2 Crypto Extensions
 
 # SVE2 crypto unary operations
-# AESMC and AESIMC
-AESMC           01000101 00 10000011100 decrypt:1 00000 rd:5
+AESMC           01000101 00 10000011100 0 00000 rd:5
+AESIMC          01000101 00 10000011100 1 00000 rd:5
 
 # SVE2 crypto destructive binary operations
 AESE            01000101 00 10001 0 11100 0 ..... .....  @rdn_rm_e0
diff --git a/target/arm/tcg/crypto_helper.c b/target/arm/tcg/crypto_helper.c
index 06254939d2..75882d9ea3 100644
--- a/target/arm/tcg/crypto_helper.c
+++ b/target/arm/tcg/crypto_helper.c
@@ -45,11 +45,9 @@ static void clear_tail_16(void *vd, uint32_t desc)
     clear_tail(vd, opr_sz, max_sz);
 }
 
-static void do_crypto_aese(uint64_t *rd, uint64_t *rn,
-                           uint64_t *rm, bool decrypt)
+static void do_crypto_aese(uint64_t *rd, uint64_t *rn, uint64_t *rm,
+                           const uint8_t *sbox, const uint8_t *shift)
 {
-    static uint8_t const * const sbox[2] = { AES_sbox, AES_isbox };
-    static uint8_t const * const shift[2] = { AES_shifts, AES_ishifts };
     union CRYPTO_STATE rk = { .l = { rm[0], rm[1] } };
     union CRYPTO_STATE st = { .l = { rn[0], rn[1] } };
     int i;
@@ -60,7 +58,7 @@ static void do_crypto_aese(uint64_t *rd, uint64_t *rn,
 
     /* combine ShiftRows operation and sbox substitution */
     for (i = 0; i < 16; i++) {
-        CR_ST_BYTE(st, i) = sbox[decrypt][CR_ST_BYTE(rk, shift[decrypt][i])];
+        CR_ST_BYTE(st, i) = sbox[CR_ST_BYTE(rk, shift[i])];
     }
 
     rd[0] = st.l[0];
@@ -70,18 +68,26 @@ static void do_crypto_aese(uint64_t *rd, uint64_t *rn,
 void HELPER(crypto_aese)(void *vd, void *vn, void *vm, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc);
-    bool decrypt = simd_data(desc);
 
     for (i = 0; i < opr_sz; i += 16) {
-        do_crypto_aese(vd + i, vn + i, vm + i, decrypt);
+        do_crypto_aese(vd + i, vn + i, vm + i, AES_sbox, AES_shifts);
     }
     clear_tail(vd, opr_sz, simd_maxsz(desc));
 }
 
-static void do_crypto_aesmc(uint64_t *rd, uint64_t *rm, bool decrypt)
+void HELPER(crypto_aesd)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+
+    for (i = 0; i < opr_sz; i += 16) {
+        do_crypto_aese(vd + i, vn + i, vm + i, AES_isbox, AES_ishifts);
+    }
+    clear_tail(vd, opr_sz, simd_maxsz(desc));
+}
+
+static void do_crypto_aesmc(uint64_t *rd, uint64_t *rm, const uint32_t *mc)
 {
     union CRYPTO_STATE st = { .l = { rm[0], rm[1] } };
-    const uint32_t *mc = decrypt ? AES_imc_rot : AES_mc_rot;
     int i;
 
     for (i = 0; i < 16; i += 4) {
@@ -99,10 +105,19 @@ static void do_crypto_aesmc(uint64_t *rd, uint64_t *rm, bool decrypt)
 void HELPER(crypto_aesmc)(void *vd, void *vm, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc);
-    bool decrypt = simd_data(desc);
 
     for (i = 0; i < opr_sz; i += 16) {
-        do_crypto_aesmc(vd + i, vm + i, decrypt);
+        do_crypto_aesmc(vd + i, vm + i, AES_mc_rot);
+    }
+    clear_tail(vd, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(crypto_aesimc)(void *vd, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+
+    for (i = 0; i < opr_sz; i += 16) {
+        do_crypto_aesmc(vd + i, vm + i, AES_imc_rot);
     }
     clear_tail(vd, opr_sz, simd_maxsz(desc));
 }
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 741a608739..3a97216d9b 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -13416,7 +13416,6 @@ static void disas_crypto_aes(DisasContext *s, uint32_t insn)
     int opcode = extract32(insn, 12, 5);
     int rn = extract32(insn, 5, 5);
     int rd = extract32(insn, 0, 5);
-    int decrypt;
     gen_helper_gvec_2 *genfn2 = NULL;
     gen_helper_gvec_3 *genfn3 = NULL;
 
@@ -13427,20 +13426,16 @@ static void disas_crypto_aes(DisasContext *s, uint32_t insn)
 
     switch (opcode) {
     case 0x4: /* AESE */
-        decrypt = 0;
         genfn3 = gen_helper_crypto_aese;
         break;
     case 0x6: /* AESMC */
-        decrypt = 0;
         genfn2 = gen_helper_crypto_aesmc;
         break;
     case 0x5: /* AESD */
-        decrypt = 1;
-        genfn3 = gen_helper_crypto_aese;
+        genfn3 = gen_helper_crypto_aesd;
         break;
     case 0x7: /* AESIMC */
-        decrypt = 1;
-        genfn2 = gen_helper_crypto_aesmc;
+        genfn2 = gen_helper_crypto_aesimc;
         break;
     default:
         unallocated_encoding(s);
@@ -13451,9 +13446,9 @@ static void disas_crypto_aes(DisasContext *s, uint32_t insn)
         return;
     }
     if (genfn2) {
-        gen_gvec_op2_ool(s, true, rd, rn, decrypt, genfn2);
+        gen_gvec_op2_ool(s, true, rd, rn, 0, genfn2);
     } else {
-        gen_gvec_op3_ool(s, true, rd, rd, rn, decrypt, genfn3);
+        gen_gvec_op3_ool(s, true, rd, rd, rn, 0, genfn3);
     }
 }
 
diff --git a/target/arm/tcg/translate-neon.c b/target/arm/tcg/translate-neon.c
index af8685a4ac..bb92ee411d 100644
--- a/target/arm/tcg/translate-neon.c
+++ b/target/arm/tcg/translate-neon.c
@@ -3455,9 +3455,9 @@ static bool trans_VMVN(DisasContext *s, arg_2misc *a)
     }
 
 WRAP_2M_3_OOL_FN(gen_AESE, gen_helper_crypto_aese, 0)
-WRAP_2M_3_OOL_FN(gen_AESD, gen_helper_crypto_aese, 1)
+WRAP_2M_3_OOL_FN(gen_AESD, gen_helper_crypto_aesd, 0)
 WRAP_2M_2_OOL_FN(gen_AESMC, gen_helper_crypto_aesmc, 0)
-WRAP_2M_2_OOL_FN(gen_AESIMC, gen_helper_crypto_aesmc, 1)
+WRAP_2M_2_OOL_FN(gen_AESIMC, gen_helper_crypto_aesimc, 0)
 WRAP_2M_2_OOL_FN(gen_SHA1H, gen_helper_crypto_sha1h, 0)
 WRAP_2M_2_OOL_FN(gen_SHA1SU1, gen_helper_crypto_sha1su1, 0)
 WRAP_2M_2_OOL_FN(gen_SHA256SU0, gen_helper_crypto_sha256su0, 0)
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 92ab290106..553c79cfe3 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -7116,12 +7116,14 @@ TRANS_FEAT(USDOT_zzzz, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
            a->esz == 2 ? gen_helper_gvec_usdot_b : NULL, a, 0)
 
 TRANS_FEAT_NONSTREAMING(AESMC, aa64_sve2_aes, gen_gvec_ool_zz,
-                        gen_helper_crypto_aesmc, a->rd, a->rd, a->decrypt)
+                        gen_helper_crypto_aesmc, a->rd, a->rd, 0)
+TRANS_FEAT_NONSTREAMING(AESIMC, aa64_sve2_aes, gen_gvec_ool_zz,
+                        gen_helper_crypto_aesimc, a->rd, a->rd, 0)
 
 TRANS_FEAT_NONSTREAMING(AESE, aa64_sve2_aes, gen_gvec_ool_arg_zzz,
-                        gen_helper_crypto_aese, a, false)
+                        gen_helper_crypto_aese, a, 0)
 TRANS_FEAT_NONSTREAMING(AESD, aa64_sve2_aes, gen_gvec_ool_arg_zzz,
-                        gen_helper_crypto_aese, a, true)
+                        gen_helper_crypto_aesd, a, 0)
 
 TRANS_FEAT_NONSTREAMING(SM4E, aa64_sve2_sm4, gen_gvec_ool_arg_zzz,
                         gen_helper_crypto_sm4e, a, 0)
-- 
2.34.1


