Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EC3C7EE29
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 02:26:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7Rni-0002gF-QG; Thu, 08 Jun 2023 22:24:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rna-0002bX-2r
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:24:22 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RnQ-0005Zz-1o
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:24:21 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-662f0feafb2so985672b3a.1
 for <qemu-riscv@nongnu.org>; Thu, 08 Jun 2023 19:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277450; x=1688869450;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wav2LlfUYrH6X3G/qJ3+1S+s5uXr/vPS9iK8dstF4cA=;
 b=d7Z7rt1yBU2Oms30p8qvGSbbn6f+Ww44BiNw0UX3DYKUDrYL3+g58FqHjrUUTeHiiC
 UOegR/NR2nmYKpV5pbR2STSEoViLfRdivn+QnblU0PF8QRHoruL8HdOCEvOULe7mSXli
 4GRmBWgOrDPDuIqJ+MzY/BklP+iB6iLJpzVGJRgy34vTlj6glrDtHtLZXTRsCkFPNeuT
 zZMfBSRuGXjBQR2z2XHJnISiwDpNXsVmMs+b590odiZZz5AaW80UX3hFR6lgnjmdmayQ
 r9itHGAvtWBGELoiAxWp1o9SkU7eIH4pWkXGur1NGuqAbtgpYchBxLYGaQLLo5jslDHG
 4htA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277450; x=1688869450;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wav2LlfUYrH6X3G/qJ3+1S+s5uXr/vPS9iK8dstF4cA=;
 b=NOkOk2YfpZ9ZEAxyvCOFuULc7ZMFDVX8iSOvxWTb/GVvpWgP6Xvq1sFPf7qiRO8h2b
 kmxeRJe3820t6jgvEdXZEB1nPJFytt0zu69qLsP4+GdkouSUpoT2tqwHbLGE5ZmBuKwm
 RZ7uzz3a4CBBXMa0JJQ+ctO3q6ZQvFCxyoGeQz3L/hMI/SV7cvZTT9ELycUcAQSC7vow
 Wp4/JQEy9tlQqB8Fb9J9VSyAEeXoHJwJ6m5IMhDxyyIYOeS6Ax35VL7SbQWS4kBwEkAL
 y2FdtcQIvCdzasg911I7Xe/JzD431p6Gf3KMwQBaMnnGGmZaovVIH3C34hKoLn7HgNY7
 S+qg==
X-Gm-Message-State: AC+VfDw/rC0BZKxOrhBU8VnH3qFC481PwXsP4Sflwh47x20HaR9lWMS2
 UeAEJgqbQeKa2sCC7DrNZFJOEg==
X-Google-Smtp-Source: ACHHUZ69M3wr/Y4IQOE3Inzjl9Qi2v+KEmCWoryEc1bSYq1K7Rawf0lI8GNFplEjD345BxHoXDSmQQ==
X-Received: by 2002:a05:6a00:17a0:b0:656:c971:951 with SMTP id
 s32-20020a056a0017a000b00656c9710951mr5103171pfg.8.1686277450692; 
 Thu, 08 Jun 2023 19:24:10 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 08/38] target/arm: Demultiplex AESE and AESMC
Date: Thu,  8 Jun 2023 19:23:31 -0700
Message-Id: <20230609022401.684157-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
index aa93f37e21..8b7337ad01 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -13566,7 +13566,6 @@ static void disas_crypto_aes(DisasContext *s, uint32_t insn)
     int opcode = extract32(insn, 12, 5);
     int rn = extract32(insn, 5, 5);
     int rd = extract32(insn, 0, 5);
-    int decrypt;
     gen_helper_gvec_2 *genfn2 = NULL;
     gen_helper_gvec_3 *genfn3 = NULL;
 
@@ -13577,20 +13576,16 @@ static void disas_crypto_aes(DisasContext *s, uint32_t insn)
 
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
@@ -13601,9 +13596,9 @@ static void disas_crypto_aes(DisasContext *s, uint32_t insn)
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
index 03913de047..8de4ceb203 100644
--- a/target/arm/tcg/translate-neon.c
+++ b/target/arm/tcg/translate-neon.c
@@ -3451,9 +3451,9 @@ static bool trans_VMVN(DisasContext *s, arg_2misc *a)
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
index ff050626e6..b98f469cb1 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -7151,12 +7151,14 @@ TRANS_FEAT(USDOT_zzzz, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
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


