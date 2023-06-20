Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1CFEB64DB
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 11:19:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBZEX-0007Ul-Go; Tue, 20 Jun 2023 07:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZEN-00071Q-Qj
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 07:09:04 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZEH-0004aU-Vj
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 07:09:03 -0400
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b46cad2fd9so40951861fa.1
 for <qemu-riscv@nongnu.org>; Tue, 20 Jun 2023 04:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259334; x=1689851334;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5fV4OH2+18aXYcOc6vzuDdaAN0nZgBSsc3xuSrFTnRA=;
 b=rFE2MwXvQa1681uCCUizvlhZLz4Mp13N+6vtUJ1lC8hahpydw6Kb65HCQUELfNjEYu
 kSrkNMp5WYys9HSF64qyJ77VUOk54KV8QvlntgANHm5LlnaWiJenXAZ5Var0RBpuxtwc
 4mLIyOsmvFyxF4nbQ6n4TYIjpTUk0ggYmZU34LaW1ZtUg48OqVwxbXAxT8K9yhJG3oWu
 Vi0TAMliZ+UDHekFa1/mJwJCYi6iRLUqImfKzmwJfKfKKzai+Ag513SB4nAKL4O8rNJT
 7VrXKg2sYHQ2ZiInrGMhXi42QrerRgRuaKz0O2dRuWEnBNwQKgmNTYBfXjTs2a85mGlO
 JAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259334; x=1689851334;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5fV4OH2+18aXYcOc6vzuDdaAN0nZgBSsc3xuSrFTnRA=;
 b=T5oEay6F5/3hupp7n/TckItCS6QCpx2fsOVYrm6DREMYBSjN+aM/8Goz6ShdwDXncM
 f8OxTD/H+FU6ZYGzbtywaTXn+6vryPa+7t4pSu9fW/uFg7GlgGkj++jOn4m9PRS2p3wP
 1ln5YygxhnPniZW2oUpDbL/A5isRudp1ak/+l13N4o+MLI/+Xyqq3R2Y/fVGkLeBiAo8
 RidOQk2Ao/vcwu9UbmE51BuGflReGR66/6w9/y2T/Egk9eFffAcmcdc78t9umHyTjU7C
 LhJkZdmO4c5qyuUmo0RLga/BWV3Uory61CwF3HbYX8u2xzCr22O0rxOTAEkNxsK11kdF
 GrUA==
X-Gm-Message-State: AC+VfDxAFkig7TLSvqtylg0v1l0SAsRcHZWrdC6MSzro1ODpw/rj7iFX
 WpnjKxghriT5NKqMAvaurlRTGQ==
X-Google-Smtp-Source: ACHHUZ6qBtGU5Zsj8uGjmDtToQUCvq7lW7c6jQzm0/w/ELVn7AoYol2qi/iJSz6+zQVbqFIsyPTqnw==
X-Received: by 2002:a2e:95c2:0:b0:2b3:43e6:4335 with SMTP id
 y2-20020a2e95c2000000b002b343e64335mr7661164ljh.11.1687259333925; 
 Tue, 20 Jun 2023 04:08:53 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170906711100b009884f015a44sm1170687ejj.49.2023.06.20.04.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:08:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 34/37] crypto: Unexport AES_*_rot, AES_TeN, AES_TdN
Date: Tue, 20 Jun 2023 13:07:55 +0200
Message-Id: <20230620110758.787479-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620110758.787479-1-richard.henderson@linaro.org>
References: <20230620110758.787479-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x236.google.com
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

These arrays are no longer used outside of aes.c.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/crypto/aes.h | 25 -------------------------
 crypto/aes.c         | 33 +++++++++++++++++++++------------
 2 files changed, 21 insertions(+), 37 deletions(-)

diff --git a/include/crypto/aes.h b/include/crypto/aes.h
index 99209f51b9..709d4d226b 100644
--- a/include/crypto/aes.h
+++ b/include/crypto/aes.h
@@ -30,29 +30,4 @@ void AES_decrypt(const unsigned char *in, unsigned char *out,
 extern const uint8_t AES_sbox[256];
 extern const uint8_t AES_isbox[256];
 
-/* AES MixColumns, for use with rot32. */
-extern const uint32_t AES_mc_rot[256];
-
-/* AES InvMixColumns, for use with rot32. */
-extern const uint32_t AES_imc_rot[256];
-
-/*
-AES_Te0[x] = S [x].[02, 01, 01, 03];
-AES_Te1[x] = S [x].[03, 02, 01, 01];
-AES_Te2[x] = S [x].[01, 03, 02, 01];
-AES_Te3[x] = S [x].[01, 01, 03, 02];
-AES_Te4[x] = S [x].[01, 01, 01, 01];
-
-AES_Td0[x] = Si[x].[0e, 09, 0d, 0b];
-AES_Td1[x] = Si[x].[0b, 0e, 09, 0d];
-AES_Td2[x] = Si[x].[0d, 0b, 0e, 09];
-AES_Td3[x] = Si[x].[09, 0d, 0b, 0e];
-AES_Td4[x] = Si[x].[01, 01, 01, 01];
-*/
-
-extern const uint32_t AES_Te0[256], AES_Te1[256], AES_Te2[256],
-                      AES_Te3[256], AES_Te4[256];
-extern const uint32_t AES_Td0[256], AES_Td1[256], AES_Td2[256],
-                      AES_Td3[256], AES_Td4[256];
-
 #endif
diff --git a/crypto/aes.c b/crypto/aes.c
index 897d4c8d2b..c63c48db38 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -154,7 +154,7 @@ enum {
 /*
  * MixColumns lookup table, for use with rot32.
  */
-const uint32_t AES_mc_rot[256] = {
+static const uint32_t AES_mc_rot[256] = {
     0x00000000, 0x03010102, 0x06020204, 0x05030306,
     0x0c040408, 0x0f05050a, 0x0a06060c, 0x0907070e,
     0x18080810, 0x1b090912, 0x1e0a0a14, 0x1d0b0b16,
@@ -224,7 +224,7 @@ const uint32_t AES_mc_rot[256] = {
 /*
  * Inverse MixColumns lookup table, for use with rot32.
  */
-const uint32_t AES_imc_rot[256] = {
+static const uint32_t AES_imc_rot[256] = {
     0x00000000, 0x0b0d090e, 0x161a121c, 0x1d171b12,
     0x2c342438, 0x27392d36, 0x3a2e3624, 0x31233f2a,
     0x58684870, 0x5365417e, 0x4e725a6c, 0x457f5362,
@@ -306,7 +306,7 @@ AES_Td3[x] = Si[x].[09, 0d, 0b, 0e];
 AES_Td4[x] = Si[x].[01, 01, 01, 01];
 */
 
-const uint32_t AES_Te0[256] = {
+static const uint32_t AES_Te0[256] = {
     0xc66363a5U, 0xf87c7c84U, 0xee777799U, 0xf67b7b8dU,
     0xfff2f20dU, 0xd66b6bbdU, 0xde6f6fb1U, 0x91c5c554U,
     0x60303050U, 0x02010103U, 0xce6767a9U, 0x562b2b7dU,
@@ -372,7 +372,8 @@ const uint32_t AES_Te0[256] = {
     0x824141c3U, 0x299999b0U, 0x5a2d2d77U, 0x1e0f0f11U,
     0x7bb0b0cbU, 0xa85454fcU, 0x6dbbbbd6U, 0x2c16163aU,
 };
-const uint32_t AES_Te1[256] = {
+
+static const uint32_t AES_Te1[256] = {
     0xa5c66363U, 0x84f87c7cU, 0x99ee7777U, 0x8df67b7bU,
     0x0dfff2f2U, 0xbdd66b6bU, 0xb1de6f6fU, 0x5491c5c5U,
     0x50603030U, 0x03020101U, 0xa9ce6767U, 0x7d562b2bU,
@@ -438,7 +439,8 @@ const uint32_t AES_Te1[256] = {
     0xc3824141U, 0xb0299999U, 0x775a2d2dU, 0x111e0f0fU,
     0xcb7bb0b0U, 0xfca85454U, 0xd66dbbbbU, 0x3a2c1616U,
 };
-const uint32_t AES_Te2[256] = {
+
+static const uint32_t AES_Te2[256] = {
     0x63a5c663U, 0x7c84f87cU, 0x7799ee77U, 0x7b8df67bU,
     0xf20dfff2U, 0x6bbdd66bU, 0x6fb1de6fU, 0xc55491c5U,
     0x30506030U, 0x01030201U, 0x67a9ce67U, 0x2b7d562bU,
@@ -504,8 +506,8 @@ const uint32_t AES_Te2[256] = {
     0x41c38241U, 0x99b02999U, 0x2d775a2dU, 0x0f111e0fU,
     0xb0cb7bb0U, 0x54fca854U, 0xbbd66dbbU, 0x163a2c16U,
 };
-const uint32_t AES_Te3[256] = {
 
+static const uint32_t AES_Te3[256] = {
     0x6363a5c6U, 0x7c7c84f8U, 0x777799eeU, 0x7b7b8df6U,
     0xf2f20dffU, 0x6b6bbdd6U, 0x6f6fb1deU, 0xc5c55491U,
     0x30305060U, 0x01010302U, 0x6767a9ceU, 0x2b2b7d56U,
@@ -571,7 +573,8 @@ const uint32_t AES_Te3[256] = {
     0x4141c382U, 0x9999b029U, 0x2d2d775aU, 0x0f0f111eU,
     0xb0b0cb7bU, 0x5454fca8U, 0xbbbbd66dU, 0x16163a2cU,
 };
-const uint32_t AES_Te4[256] = {
+
+static const uint32_t AES_Te4[256] = {
     0x63636363U, 0x7c7c7c7cU, 0x77777777U, 0x7b7b7b7bU,
     0xf2f2f2f2U, 0x6b6b6b6bU, 0x6f6f6f6fU, 0xc5c5c5c5U,
     0x30303030U, 0x01010101U, 0x67676767U, 0x2b2b2b2bU,
@@ -637,7 +640,8 @@ const uint32_t AES_Te4[256] = {
     0x41414141U, 0x99999999U, 0x2d2d2d2dU, 0x0f0f0f0fU,
     0xb0b0b0b0U, 0x54545454U, 0xbbbbbbbbU, 0x16161616U,
 };
-const uint32_t AES_Td0[256] = {
+
+static const uint32_t AES_Td0[256] = {
     0x51f4a750U, 0x7e416553U, 0x1a17a4c3U, 0x3a275e96U,
     0x3bab6bcbU, 0x1f9d45f1U, 0xacfa58abU, 0x4be30393U,
     0x2030fa55U, 0xad766df6U, 0x88cc7691U, 0xf5024c25U,
@@ -703,7 +707,8 @@ const uint32_t AES_Td0[256] = {
     0x39a80171U, 0x080cb3deU, 0xd8b4e49cU, 0x6456c190U,
     0x7bcb8461U, 0xd532b670U, 0x486c5c74U, 0xd0b85742U,
 };
-const uint32_t AES_Td1[256] = {
+
+static const uint32_t AES_Td1[256] = {
     0x5051f4a7U, 0x537e4165U, 0xc31a17a4U, 0x963a275eU,
     0xcb3bab6bU, 0xf11f9d45U, 0xabacfa58U, 0x934be303U,
     0x552030faU, 0xf6ad766dU, 0x9188cc76U, 0x25f5024cU,
@@ -769,7 +774,8 @@ const uint32_t AES_Td1[256] = {
     0x7139a801U, 0xde080cb3U, 0x9cd8b4e4U, 0x906456c1U,
     0x617bcb84U, 0x70d532b6U, 0x74486c5cU, 0x42d0b857U,
 };
-const uint32_t AES_Td2[256] = {
+
+static const uint32_t AES_Td2[256] = {
     0xa75051f4U, 0x65537e41U, 0xa4c31a17U, 0x5e963a27U,
     0x6bcb3babU, 0x45f11f9dU, 0x58abacfaU, 0x03934be3U,
     0xfa552030U, 0x6df6ad76U, 0x769188ccU, 0x4c25f502U,
@@ -836,7 +842,8 @@ const uint32_t AES_Td2[256] = {
     0x017139a8U, 0xb3de080cU, 0xe49cd8b4U, 0xc1906456U,
     0x84617bcbU, 0xb670d532U, 0x5c74486cU, 0x5742d0b8U,
 };
-const uint32_t AES_Td3[256] = {
+
+static const uint32_t AES_Td3[256] = {
     0xf4a75051U, 0x4165537eU, 0x17a4c31aU, 0x275e963aU,
     0xab6bcb3bU, 0x9d45f11fU, 0xfa58abacU, 0xe303934bU,
     0x30fa5520U, 0x766df6adU, 0xcc769188U, 0x024c25f5U,
@@ -902,7 +909,8 @@ const uint32_t AES_Td3[256] = {
     0xa8017139U, 0x0cb3de08U, 0xb4e49cd8U, 0x56c19064U,
     0xcb84617bU, 0x32b670d5U, 0x6c5c7448U, 0xb85742d0U,
 };
-const uint32_t AES_Td4[256] = {
+
+static const uint32_t AES_Td4[256] = {
     0x52525252U, 0x09090909U, 0x6a6a6a6aU, 0xd5d5d5d5U,
     0x30303030U, 0x36363636U, 0xa5a5a5a5U, 0x38383838U,
     0xbfbfbfbfU, 0x40404040U, 0xa3a3a3a3U, 0x9e9e9e9eU,
@@ -968,6 +976,7 @@ const uint32_t AES_Td4[256] = {
     0xe1e1e1e1U, 0x69696969U, 0x14141414U, 0x63636363U,
     0x55555555U, 0x21212121U, 0x0c0c0c0cU, 0x7d7d7d7dU,
 };
+
 static const u32 rcon[] = {
         0x01000000, 0x02000000, 0x04000000, 0x08000000,
         0x10000000, 0x20000000, 0x40000000, 0x80000000,
-- 
2.34.1


