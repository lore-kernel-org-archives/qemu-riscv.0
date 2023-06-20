Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FC6EB64D7
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 11:14:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBZEY-0007WI-BB; Tue, 20 Jun 2023 07:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZES-0007En-Gp
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 07:09:08 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZEO-0004Ze-4H
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 07:09:08 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-987accb4349so525580266b.0
 for <qemu-riscv@nongnu.org>; Tue, 20 Jun 2023 04:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259333; x=1689851333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cwUuX0zKYulHXjb/fOXJ8OD0i/qvC/4E4K0aaRnvYj0=;
 b=YX525etVCKzIK0lq0syYCr1b/EjzfjdQ3JQKKMbrGOVrRUBj9O/thrJoG5baxNutXJ
 kSDSv5ZJKNB8yed55h+LFgTPUe5L9p809aCqLSLbrrXnPHpHyq/MyudLR0wfQkrzu5As
 4mbvXF2nY43SohqJdZhHRbwnpriOjjJ67ItU5plUvBfKLXV1XzWvjKfU5H8d4ZfdL2lt
 iqk5+pbj7LGr5kEg6PCMb3ipToz10vaUVfOMqEZC8+2mcx0pYRs9TY0A98M683uDwDCE
 aI8mHf6DwvauqrAevZKrpy22adLeV69FdpbYaRpBcTlmG3L0xeJj0L5/wW5LHokHtcWb
 U7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259333; x=1689851333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cwUuX0zKYulHXjb/fOXJ8OD0i/qvC/4E4K0aaRnvYj0=;
 b=OracHh8W5CFIc2H+T958qES26/HppTnKnaoV7cCkAFQL8dAPZNwZptmYG3lfsEbiSn
 Xw+CJzzF61DDzPKPO8w8r3zV4ZgWaf4Jhcftz8nTdKqfSo2IX+sQKglJt82q7BMC3+t6
 4FVrJTU0xGweXV3OT7N5ZLU9/nYkI+PeHoOMpR23z1HLXxKdX9Il5DBz1uUy3tmNsOXq
 sZh4BylYTTi+aO2E4wHqP74pMMjowwCICaaU9NKrxI4mFXdzYACgEREcN8EdFBCeE/Da
 G5yThoZtr76WPjbd+IliQNLnY3Q2rXEICXJ9u/jVW/jqQCyOLXxcyDpvT3u1LtRj6c3k
 sOng==
X-Gm-Message-State: AC+VfDyjtWKyrG2lJeNXAX8i70cW2VAZOD2JVWA/VOPEEs5nD/72t3kz
 mFuW90WJZO0Sd+DrON+FUM8JVJa+Atx2dDvRAiKH9f5g
X-Google-Smtp-Source: ACHHUZ79lZOPaa76HPQloPw9HDxDVrSlmyjM4PCxQaIBadaso0FgzaoCLkmwdke6MxVtHKq0bcVALA==
X-Received: by 2002:a17:907:7f1e:b0:989:1f66:e42f with SMTP id
 qf30-20020a1709077f1e00b009891f66e42fmr1612832ejc.62.1687259324041; 
 Tue, 20 Jun 2023 04:08:44 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170906711100b009884f015a44sm1170687ejj.49.2023.06.20.04.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:08:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 33/37] crypto: Remove AES_imc
Date: Tue, 20 Jun 2023 13:07:54 +0200
Message-Id: <20230620110758.787479-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620110758.787479-1-richard.henderson@linaro.org>
References: <20230620110758.787479-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62e.google.com
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

This array is no longer used.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/crypto/aes.h |   7 --
 crypto/aes.c         | 264 -------------------------------------------
 2 files changed, 271 deletions(-)

diff --git a/include/crypto/aes.h b/include/crypto/aes.h
index aa8b54065d..99209f51b9 100644
--- a/include/crypto/aes.h
+++ b/include/crypto/aes.h
@@ -36,13 +36,6 @@ extern const uint32_t AES_mc_rot[256];
 /* AES InvMixColumns, for use with rot32. */
 extern const uint32_t AES_imc_rot[256];
 
-/* AES InvMixColumns */
-/* AES_imc[x][0] = [x].[0e, 09, 0d, 0b]; */
-/* AES_imc[x][1] = [x].[0b, 0e, 09, 0d]; */
-/* AES_imc[x][2] = [x].[0d, 0b, 0e, 09]; */
-/* AES_imc[x][3] = [x].[09, 0d, 0b, 0e]; */
-extern const uint32_t AES_imc[256][4];
-
 /*
 AES_Te0[x] = S [x].[02, 01, 01, 03];
 AES_Te1[x] = S [x].[03, 02, 01, 01];
diff --git a/crypto/aes.c b/crypto/aes.c
index 307c27947c..897d4c8d2b 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -291,270 +291,6 @@ const uint32_t AES_imc_rot[256] = {
     0xbe805d9f, 0xb58d5491, 0xa89a4f83, 0xa397468d,
 };
 
-/* AES_imc[x][0] = [x].[0e, 09, 0d, 0b]; */
-/* AES_imc[x][1] = [x].[0b, 0e, 09, 0d]; */
-/* AES_imc[x][2] = [x].[0d, 0b, 0e, 09]; */
-/* AES_imc[x][3] = [x].[09, 0d, 0b, 0e]; */
-const uint32_t AES_imc[256][4] = {
-    { 0x00000000, 0x00000000, 0x00000000, 0x00000000, }, /* x=00 */
-    { 0x0E090D0B, 0x0B0E090D, 0x0D0B0E09, 0x090D0B0E, }, /* x=01 */
-    { 0x1C121A16, 0x161C121A, 0x1A161C12, 0x121A161C, }, /* x=02 */
-    { 0x121B171D, 0x1D121B17, 0x171D121B, 0x1B171D12, }, /* x=03 */
-    { 0x3824342C, 0x2C382434, 0x342C3824, 0x24342C38, }, /* x=04 */
-    { 0x362D3927, 0x27362D39, 0x3927362D, 0x2D392736, }, /* x=05 */
-    { 0x24362E3A, 0x3A24362E, 0x2E3A2436, 0x362E3A24, }, /* x=06 */
-    { 0x2A3F2331, 0x312A3F23, 0x23312A3F, 0x3F23312A, }, /* x=07 */
-    { 0x70486858, 0x58704868, 0x68587048, 0x48685870, }, /* x=08 */
-    { 0x7E416553, 0x537E4165, 0x65537E41, 0x4165537E, }, /* x=09 */
-    { 0x6C5A724E, 0x4E6C5A72, 0x724E6C5A, 0x5A724E6C, }, /* x=0A */
-    { 0x62537F45, 0x4562537F, 0x7F456253, 0x537F4562, }, /* x=0B */
-    { 0x486C5C74, 0x74486C5C, 0x5C74486C, 0x6C5C7448, }, /* x=0C */
-    { 0x4665517F, 0x7F466551, 0x517F4665, 0x65517F46, }, /* x=0D */
-    { 0x547E4662, 0x62547E46, 0x4662547E, 0x7E466254, }, /* x=0E */
-    { 0x5A774B69, 0x695A774B, 0x4B695A77, 0x774B695A, }, /* x=0F */
-    { 0xE090D0B0, 0xB0E090D0, 0xD0B0E090, 0x90D0B0E0, }, /* x=10 */
-    { 0xEE99DDBB, 0xBBEE99DD, 0xDDBBEE99, 0x99DDBBEE, }, /* x=11 */
-    { 0xFC82CAA6, 0xA6FC82CA, 0xCAA6FC82, 0x82CAA6FC, }, /* x=12 */
-    { 0xF28BC7AD, 0xADF28BC7, 0xC7ADF28B, 0x8BC7ADF2, }, /* x=13 */
-    { 0xD8B4E49C, 0x9CD8B4E4, 0xE49CD8B4, 0xB4E49CD8, }, /* x=14 */
-    { 0xD6BDE997, 0x97D6BDE9, 0xE997D6BD, 0xBDE997D6, }, /* x=15 */
-    { 0xC4A6FE8A, 0x8AC4A6FE, 0xFE8AC4A6, 0xA6FE8AC4, }, /* x=16 */
-    { 0xCAAFF381, 0x81CAAFF3, 0xF381CAAF, 0xAFF381CA, }, /* x=17 */
-    { 0x90D8B8E8, 0xE890D8B8, 0xB8E890D8, 0xD8B8E890, }, /* x=18 */
-    { 0x9ED1B5E3, 0xE39ED1B5, 0xB5E39ED1, 0xD1B5E39E, }, /* x=19 */
-    { 0x8CCAA2FE, 0xFE8CCAA2, 0xA2FE8CCA, 0xCAA2FE8C, }, /* x=1A */
-    { 0x82C3AFF5, 0xF582C3AF, 0xAFF582C3, 0xC3AFF582, }, /* x=1B */
-    { 0xA8FC8CC4, 0xC4A8FC8C, 0x8CC4A8FC, 0xFC8CC4A8, }, /* x=1C */
-    { 0xA6F581CF, 0xCFA6F581, 0x81CFA6F5, 0xF581CFA6, }, /* x=1D */
-    { 0xB4EE96D2, 0xD2B4EE96, 0x96D2B4EE, 0xEE96D2B4, }, /* x=1E */
-    { 0xBAE79BD9, 0xD9BAE79B, 0x9BD9BAE7, 0xE79BD9BA, }, /* x=1F */
-    { 0xDB3BBB7B, 0x7BDB3BBB, 0xBB7BDB3B, 0x3BBB7BDB, }, /* x=20 */
-    { 0xD532B670, 0x70D532B6, 0xB670D532, 0x32B670D5, }, /* x=21 */
-    { 0xC729A16D, 0x6DC729A1, 0xA16DC729, 0x29A16DC7, }, /* x=22 */
-    { 0xC920AC66, 0x66C920AC, 0xAC66C920, 0x20AC66C9, }, /* x=23 */
-    { 0xE31F8F57, 0x57E31F8F, 0x8F57E31F, 0x1F8F57E3, }, /* x=24 */
-    { 0xED16825C, 0x5CED1682, 0x825CED16, 0x16825CED, }, /* x=25 */
-    { 0xFF0D9541, 0x41FF0D95, 0x9541FF0D, 0x0D9541FF, }, /* x=26 */
-    { 0xF104984A, 0x4AF10498, 0x984AF104, 0x04984AF1, }, /* x=27 */
-    { 0xAB73D323, 0x23AB73D3, 0xD323AB73, 0x73D323AB, }, /* x=28 */
-    { 0xA57ADE28, 0x28A57ADE, 0xDE28A57A, 0x7ADE28A5, }, /* x=29 */
-    { 0xB761C935, 0x35B761C9, 0xC935B761, 0x61C935B7, }, /* x=2A */
-    { 0xB968C43E, 0x3EB968C4, 0xC43EB968, 0x68C43EB9, }, /* x=2B */
-    { 0x9357E70F, 0x0F9357E7, 0xE70F9357, 0x57E70F93, }, /* x=2C */
-    { 0x9D5EEA04, 0x049D5EEA, 0xEA049D5E, 0x5EEA049D, }, /* x=2D */
-    { 0x8F45FD19, 0x198F45FD, 0xFD198F45, 0x45FD198F, }, /* x=2E */
-    { 0x814CF012, 0x12814CF0, 0xF012814C, 0x4CF01281, }, /* x=2F */
-    { 0x3BAB6BCB, 0xCB3BAB6B, 0x6BCB3BAB, 0xAB6BCB3B, }, /* x=30 */
-    { 0x35A266C0, 0xC035A266, 0x66C035A2, 0xA266C035, }, /* x=31 */
-    { 0x27B971DD, 0xDD27B971, 0x71DD27B9, 0xB971DD27, }, /* x=32 */
-    { 0x29B07CD6, 0xD629B07C, 0x7CD629B0, 0xB07CD629, }, /* x=33 */
-    { 0x038F5FE7, 0xE7038F5F, 0x5FE7038F, 0x8F5FE703, }, /* x=34 */
-    { 0x0D8652EC, 0xEC0D8652, 0x52EC0D86, 0x8652EC0D, }, /* x=35 */
-    { 0x1F9D45F1, 0xF11F9D45, 0x45F11F9D, 0x9D45F11F, }, /* x=36 */
-    { 0x119448FA, 0xFA119448, 0x48FA1194, 0x9448FA11, }, /* x=37 */
-    { 0x4BE30393, 0x934BE303, 0x03934BE3, 0xE303934B, }, /* x=38 */
-    { 0x45EA0E98, 0x9845EA0E, 0x0E9845EA, 0xEA0E9845, }, /* x=39 */
-    { 0x57F11985, 0x8557F119, 0x198557F1, 0xF1198557, }, /* x=3A */
-    { 0x59F8148E, 0x8E59F814, 0x148E59F8, 0xF8148E59, }, /* x=3B */
-    { 0x73C737BF, 0xBF73C737, 0x37BF73C7, 0xC737BF73, }, /* x=3C */
-    { 0x7DCE3AB4, 0xB47DCE3A, 0x3AB47DCE, 0xCE3AB47D, }, /* x=3D */
-    { 0x6FD52DA9, 0xA96FD52D, 0x2DA96FD5, 0xD52DA96F, }, /* x=3E */
-    { 0x61DC20A2, 0xA261DC20, 0x20A261DC, 0xDC20A261, }, /* x=3F */
-    { 0xAD766DF6, 0xF6AD766D, 0x6DF6AD76, 0x766DF6AD, }, /* x=40 */
-    { 0xA37F60FD, 0xFDA37F60, 0x60FDA37F, 0x7F60FDA3, }, /* x=41 */
-    { 0xB16477E0, 0xE0B16477, 0x77E0B164, 0x6477E0B1, }, /* x=42 */
-    { 0xBF6D7AEB, 0xEBBF6D7A, 0x7AEBBF6D, 0x6D7AEBBF, }, /* x=43 */
-    { 0x955259DA, 0xDA955259, 0x59DA9552, 0x5259DA95, }, /* x=44 */
-    { 0x9B5B54D1, 0xD19B5B54, 0x54D19B5B, 0x5B54D19B, }, /* x=45 */
-    { 0x894043CC, 0xCC894043, 0x43CC8940, 0x4043CC89, }, /* x=46 */
-    { 0x87494EC7, 0xC787494E, 0x4EC78749, 0x494EC787, }, /* x=47 */
-    { 0xDD3E05AE, 0xAEDD3E05, 0x05AEDD3E, 0x3E05AEDD, }, /* x=48 */
-    { 0xD33708A5, 0xA5D33708, 0x08A5D337, 0x3708A5D3, }, /* x=49 */
-    { 0xC12C1FB8, 0xB8C12C1F, 0x1FB8C12C, 0x2C1FB8C1, }, /* x=4A */
-    { 0xCF2512B3, 0xB3CF2512, 0x12B3CF25, 0x2512B3CF, }, /* x=4B */
-    { 0xE51A3182, 0x82E51A31, 0x3182E51A, 0x1A3182E5, }, /* x=4C */
-    { 0xEB133C89, 0x89EB133C, 0x3C89EB13, 0x133C89EB, }, /* x=4D */
-    { 0xF9082B94, 0x94F9082B, 0x2B94F908, 0x082B94F9, }, /* x=4E */
-    { 0xF701269F, 0x9FF70126, 0x269FF701, 0x01269FF7, }, /* x=4F */
-    { 0x4DE6BD46, 0x464DE6BD, 0xBD464DE6, 0xE6BD464D, }, /* x=50 */
-    { 0x43EFB04D, 0x4D43EFB0, 0xB04D43EF, 0xEFB04D43, }, /* x=51 */
-    { 0x51F4A750, 0x5051F4A7, 0xA75051F4, 0xF4A75051, }, /* x=52 */
-    { 0x5FFDAA5B, 0x5B5FFDAA, 0xAA5B5FFD, 0xFDAA5B5F, }, /* x=53 */
-    { 0x75C2896A, 0x6A75C289, 0x896A75C2, 0xC2896A75, }, /* x=54 */
-    { 0x7BCB8461, 0x617BCB84, 0x84617BCB, 0xCB84617B, }, /* x=55 */
-    { 0x69D0937C, 0x7C69D093, 0x937C69D0, 0xD0937C69, }, /* x=56 */
-    { 0x67D99E77, 0x7767D99E, 0x9E7767D9, 0xD99E7767, }, /* x=57 */
-    { 0x3DAED51E, 0x1E3DAED5, 0xD51E3DAE, 0xAED51E3D, }, /* x=58 */
-    { 0x33A7D815, 0x1533A7D8, 0xD81533A7, 0xA7D81533, }, /* x=59 */
-    { 0x21BCCF08, 0x0821BCCF, 0xCF0821BC, 0xBCCF0821, }, /* x=5A */
-    { 0x2FB5C203, 0x032FB5C2, 0xC2032FB5, 0xB5C2032F, }, /* x=5B */
-    { 0x058AE132, 0x32058AE1, 0xE132058A, 0x8AE13205, }, /* x=5C */
-    { 0x0B83EC39, 0x390B83EC, 0xEC390B83, 0x83EC390B, }, /* x=5D */
-    { 0x1998FB24, 0x241998FB, 0xFB241998, 0x98FB2419, }, /* x=5E */
-    { 0x1791F62F, 0x2F1791F6, 0xF62F1791, 0x91F62F17, }, /* x=5F */
-    { 0x764DD68D, 0x8D764DD6, 0xD68D764D, 0x4DD68D76, }, /* x=60 */
-    { 0x7844DB86, 0x867844DB, 0xDB867844, 0x44DB8678, }, /* x=61 */
-    { 0x6A5FCC9B, 0x9B6A5FCC, 0xCC9B6A5F, 0x5FCC9B6A, }, /* x=62 */
-    { 0x6456C190, 0x906456C1, 0xC1906456, 0x56C19064, }, /* x=63 */
-    { 0x4E69E2A1, 0xA14E69E2, 0xE2A14E69, 0x69E2A14E, }, /* x=64 */
-    { 0x4060EFAA, 0xAA4060EF, 0xEFAA4060, 0x60EFAA40, }, /* x=65 */
-    { 0x527BF8B7, 0xB7527BF8, 0xF8B7527B, 0x7BF8B752, }, /* x=66 */
-    { 0x5C72F5BC, 0xBC5C72F5, 0xF5BC5C72, 0x72F5BC5C, }, /* x=67 */
-    { 0x0605BED5, 0xD50605BE, 0xBED50605, 0x05BED506, }, /* x=68 */
-    { 0x080CB3DE, 0xDE080CB3, 0xB3DE080C, 0x0CB3DE08, }, /* x=69 */
-    { 0x1A17A4C3, 0xC31A17A4, 0xA4C31A17, 0x17A4C31A, }, /* x=6A */
-    { 0x141EA9C8, 0xC8141EA9, 0xA9C8141E, 0x1EA9C814, }, /* x=6B */
-    { 0x3E218AF9, 0xF93E218A, 0x8AF93E21, 0x218AF93E, }, /* x=6C */
-    { 0x302887F2, 0xF2302887, 0x87F23028, 0x2887F230, }, /* x=6D */
-    { 0x223390EF, 0xEF223390, 0x90EF2233, 0x3390EF22, }, /* x=6E */
-    { 0x2C3A9DE4, 0xE42C3A9D, 0x9DE42C3A, 0x3A9DE42C, }, /* x=6F */
-    { 0x96DD063D, 0x3D96DD06, 0x063D96DD, 0xDD063D96, }, /* x=70 */
-    { 0x98D40B36, 0x3698D40B, 0x0B3698D4, 0xD40B3698, }, /* x=71 */
-    { 0x8ACF1C2B, 0x2B8ACF1C, 0x1C2B8ACF, 0xCF1C2B8A, }, /* x=72 */
-    { 0x84C61120, 0x2084C611, 0x112084C6, 0xC6112084, }, /* x=73 */
-    { 0xAEF93211, 0x11AEF932, 0x3211AEF9, 0xF93211AE, }, /* x=74 */
-    { 0xA0F03F1A, 0x1AA0F03F, 0x3F1AA0F0, 0xF03F1AA0, }, /* x=75 */
-    { 0xB2EB2807, 0x07B2EB28, 0x2807B2EB, 0xEB2807B2, }, /* x=76 */
-    { 0xBCE2250C, 0x0CBCE225, 0x250CBCE2, 0xE2250CBC, }, /* x=77 */
-    { 0xE6956E65, 0x65E6956E, 0x6E65E695, 0x956E65E6, }, /* x=78 */
-    { 0xE89C636E, 0x6EE89C63, 0x636EE89C, 0x9C636EE8, }, /* x=79 */
-    { 0xFA877473, 0x73FA8774, 0x7473FA87, 0x877473FA, }, /* x=7A */
-    { 0xF48E7978, 0x78F48E79, 0x7978F48E, 0x8E7978F4, }, /* x=7B */
-    { 0xDEB15A49, 0x49DEB15A, 0x5A49DEB1, 0xB15A49DE, }, /* x=7C */
-    { 0xD0B85742, 0x42D0B857, 0x5742D0B8, 0xB85742D0, }, /* x=7D */
-    { 0xC2A3405F, 0x5FC2A340, 0x405FC2A3, 0xA3405FC2, }, /* x=7E */
-    { 0xCCAA4D54, 0x54CCAA4D, 0x4D54CCAA, 0xAA4D54CC, }, /* x=7F */
-    { 0x41ECDAF7, 0xF741ECDA, 0xDAF741EC, 0xECDAF741, }, /* x=80 */
-    { 0x4FE5D7FC, 0xFC4FE5D7, 0xD7FC4FE5, 0xE5D7FC4F, }, /* x=81 */
-    { 0x5DFEC0E1, 0xE15DFEC0, 0xC0E15DFE, 0xFEC0E15D, }, /* x=82 */
-    { 0x53F7CDEA, 0xEA53F7CD, 0xCDEA53F7, 0xF7CDEA53, }, /* x=83 */
-    { 0x79C8EEDB, 0xDB79C8EE, 0xEEDB79C8, 0xC8EEDB79, }, /* x=84 */
-    { 0x77C1E3D0, 0xD077C1E3, 0xE3D077C1, 0xC1E3D077, }, /* x=85 */
-    { 0x65DAF4CD, 0xCD65DAF4, 0xF4CD65DA, 0xDAF4CD65, }, /* x=86 */
-    { 0x6BD3F9C6, 0xC66BD3F9, 0xF9C66BD3, 0xD3F9C66B, }, /* x=87 */
-    { 0x31A4B2AF, 0xAF31A4B2, 0xB2AF31A4, 0xA4B2AF31, }, /* x=88 */
-    { 0x3FADBFA4, 0xA43FADBF, 0xBFA43FAD, 0xADBFA43F, }, /* x=89 */
-    { 0x2DB6A8B9, 0xB92DB6A8, 0xA8B92DB6, 0xB6A8B92D, }, /* x=8A */
-    { 0x23BFA5B2, 0xB223BFA5, 0xA5B223BF, 0xBFA5B223, }, /* x=8B */
-    { 0x09808683, 0x83098086, 0x86830980, 0x80868309, }, /* x=8C */
-    { 0x07898B88, 0x8807898B, 0x8B880789, 0x898B8807, }, /* x=8D */
-    { 0x15929C95, 0x9515929C, 0x9C951592, 0x929C9515, }, /* x=8E */
-    { 0x1B9B919E, 0x9E1B9B91, 0x919E1B9B, 0x9B919E1B, }, /* x=8F */
-    { 0xA17C0A47, 0x47A17C0A, 0x0A47A17C, 0x7C0A47A1, }, /* x=90 */
-    { 0xAF75074C, 0x4CAF7507, 0x074CAF75, 0x75074CAF, }, /* x=91 */
-    { 0xBD6E1051, 0x51BD6E10, 0x1051BD6E, 0x6E1051BD, }, /* x=92 */
-    { 0xB3671D5A, 0x5AB3671D, 0x1D5AB367, 0x671D5AB3, }, /* x=93 */
-    { 0x99583E6B, 0x6B99583E, 0x3E6B9958, 0x583E6B99, }, /* x=94 */
-    { 0x97513360, 0x60975133, 0x33609751, 0x51336097, }, /* x=95 */
-    { 0x854A247D, 0x7D854A24, 0x247D854A, 0x4A247D85, }, /* x=96 */
-    { 0x8B432976, 0x768B4329, 0x29768B43, 0x4329768B, }, /* x=97 */
-    { 0xD134621F, 0x1FD13462, 0x621FD134, 0x34621FD1, }, /* x=98 */
-    { 0xDF3D6F14, 0x14DF3D6F, 0x6F14DF3D, 0x3D6F14DF, }, /* x=99 */
-    { 0xCD267809, 0x09CD2678, 0x7809CD26, 0x267809CD, }, /* x=9A */
-    { 0xC32F7502, 0x02C32F75, 0x7502C32F, 0x2F7502C3, }, /* x=9B */
-    { 0xE9105633, 0x33E91056, 0x5633E910, 0x105633E9, }, /* x=9C */
-    { 0xE7195B38, 0x38E7195B, 0x5B38E719, 0x195B38E7, }, /* x=9D */
-    { 0xF5024C25, 0x25F5024C, 0x4C25F502, 0x024C25F5, }, /* x=9E */
-    { 0xFB0B412E, 0x2EFB0B41, 0x412EFB0B, 0x0B412EFB, }, /* x=9F */
-    { 0x9AD7618C, 0x8C9AD761, 0x618C9AD7, 0xD7618C9A, }, /* x=A0 */
-    { 0x94DE6C87, 0x8794DE6C, 0x6C8794DE, 0xDE6C8794, }, /* x=A1 */
-    { 0x86C57B9A, 0x9A86C57B, 0x7B9A86C5, 0xC57B9A86, }, /* x=A2 */
-    { 0x88CC7691, 0x9188CC76, 0x769188CC, 0xCC769188, }, /* x=A3 */
-    { 0xA2F355A0, 0xA0A2F355, 0x55A0A2F3, 0xF355A0A2, }, /* x=A4 */
-    { 0xACFA58AB, 0xABACFA58, 0x58ABACFA, 0xFA58ABAC, }, /* x=A5 */
-    { 0xBEE14FB6, 0xB6BEE14F, 0x4FB6BEE1, 0xE14FB6BE, }, /* x=A6 */
-    { 0xB0E842BD, 0xBDB0E842, 0x42BDB0E8, 0xE842BDB0, }, /* x=A7 */
-    { 0xEA9F09D4, 0xD4EA9F09, 0x09D4EA9F, 0x9F09D4EA, }, /* x=A8 */
-    { 0xE49604DF, 0xDFE49604, 0x04DFE496, 0x9604DFE4, }, /* x=A9 */
-    { 0xF68D13C2, 0xC2F68D13, 0x13C2F68D, 0x8D13C2F6, }, /* x=AA */
-    { 0xF8841EC9, 0xC9F8841E, 0x1EC9F884, 0x841EC9F8, }, /* x=AB */
-    { 0xD2BB3DF8, 0xF8D2BB3D, 0x3DF8D2BB, 0xBB3DF8D2, }, /* x=AC */
-    { 0xDCB230F3, 0xF3DCB230, 0x30F3DCB2, 0xB230F3DC, }, /* x=AD */
-    { 0xCEA927EE, 0xEECEA927, 0x27EECEA9, 0xA927EECE, }, /* x=AE */
-    { 0xC0A02AE5, 0xE5C0A02A, 0x2AE5C0A0, 0xA02AE5C0, }, /* x=AF */
-    { 0x7A47B13C, 0x3C7A47B1, 0xB13C7A47, 0x47B13C7A, }, /* x=B0 */
-    { 0x744EBC37, 0x37744EBC, 0xBC37744E, 0x4EBC3774, }, /* x=B1 */
-    { 0x6655AB2A, 0x2A6655AB, 0xAB2A6655, 0x55AB2A66, }, /* x=B2 */
-    { 0x685CA621, 0x21685CA6, 0xA621685C, 0x5CA62168, }, /* x=B3 */
-    { 0x42638510, 0x10426385, 0x85104263, 0x63851042, }, /* x=B4 */
-    { 0x4C6A881B, 0x1B4C6A88, 0x881B4C6A, 0x6A881B4C, }, /* x=B5 */
-    { 0x5E719F06, 0x065E719F, 0x9F065E71, 0x719F065E, }, /* x=B6 */
-    { 0x5078920D, 0x0D507892, 0x920D5078, 0x78920D50, }, /* x=B7 */
-    { 0x0A0FD964, 0x640A0FD9, 0xD9640A0F, 0x0FD9640A, }, /* x=B8 */
-    { 0x0406D46F, 0x6F0406D4, 0xD46F0406, 0x06D46F04, }, /* x=B9 */
-    { 0x161DC372, 0x72161DC3, 0xC372161D, 0x1DC37216, }, /* x=BA */
-    { 0x1814CE79, 0x791814CE, 0xCE791814, 0x14CE7918, }, /* x=BB */
-    { 0x322BED48, 0x48322BED, 0xED48322B, 0x2BED4832, }, /* x=BC */
-    { 0x3C22E043, 0x433C22E0, 0xE0433C22, 0x22E0433C, }, /* x=BD */
-    { 0x2E39F75E, 0x5E2E39F7, 0xF75E2E39, 0x39F75E2E, }, /* x=BE */
-    { 0x2030FA55, 0x552030FA, 0xFA552030, 0x30FA5520, }, /* x=BF */
-    { 0xEC9AB701, 0x01EC9AB7, 0xB701EC9A, 0x9AB701EC, }, /* x=C0 */
-    { 0xE293BA0A, 0x0AE293BA, 0xBA0AE293, 0x93BA0AE2, }, /* x=C1 */
-    { 0xF088AD17, 0x17F088AD, 0xAD17F088, 0x88AD17F0, }, /* x=C2 */
-    { 0xFE81A01C, 0x1CFE81A0, 0xA01CFE81, 0x81A01CFE, }, /* x=C3 */
-    { 0xD4BE832D, 0x2DD4BE83, 0x832DD4BE, 0xBE832DD4, }, /* x=C4 */
-    { 0xDAB78E26, 0x26DAB78E, 0x8E26DAB7, 0xB78E26DA, }, /* x=C5 */
-    { 0xC8AC993B, 0x3BC8AC99, 0x993BC8AC, 0xAC993BC8, }, /* x=C6 */
-    { 0xC6A59430, 0x30C6A594, 0x9430C6A5, 0xA59430C6, }, /* x=C7 */
-    { 0x9CD2DF59, 0x599CD2DF, 0xDF599CD2, 0xD2DF599C, }, /* x=C8 */
-    { 0x92DBD252, 0x5292DBD2, 0xD25292DB, 0xDBD25292, }, /* x=C9 */
-    { 0x80C0C54F, 0x4F80C0C5, 0xC54F80C0, 0xC0C54F80, }, /* x=CA */
-    { 0x8EC9C844, 0x448EC9C8, 0xC8448EC9, 0xC9C8448E, }, /* x=CB */
-    { 0xA4F6EB75, 0x75A4F6EB, 0xEB75A4F6, 0xF6EB75A4, }, /* x=CC */
-    { 0xAAFFE67E, 0x7EAAFFE6, 0xE67EAAFF, 0xFFE67EAA, }, /* x=CD */
-    { 0xB8E4F163, 0x63B8E4F1, 0xF163B8E4, 0xE4F163B8, }, /* x=CE */
-    { 0xB6EDFC68, 0x68B6EDFC, 0xFC68B6ED, 0xEDFC68B6, }, /* x=CF */
-    { 0x0C0A67B1, 0xB10C0A67, 0x67B10C0A, 0x0A67B10C, }, /* x=D0 */
-    { 0x02036ABA, 0xBA02036A, 0x6ABA0203, 0x036ABA02, }, /* x=D1 */
-    { 0x10187DA7, 0xA710187D, 0x7DA71018, 0x187DA710, }, /* x=D2 */
-    { 0x1E1170AC, 0xAC1E1170, 0x70AC1E11, 0x1170AC1E, }, /* x=D3 */
-    { 0x342E539D, 0x9D342E53, 0x539D342E, 0x2E539D34, }, /* x=D4 */
-    { 0x3A275E96, 0x963A275E, 0x5E963A27, 0x275E963A, }, /* x=D5 */
-    { 0x283C498B, 0x8B283C49, 0x498B283C, 0x3C498B28, }, /* x=D6 */
-    { 0x26354480, 0x80263544, 0x44802635, 0x35448026, }, /* x=D7 */
-    { 0x7C420FE9, 0xE97C420F, 0x0FE97C42, 0x420FE97C, }, /* x=D8 */
-    { 0x724B02E2, 0xE2724B02, 0x02E2724B, 0x4B02E272, }, /* x=D9 */
-    { 0x605015FF, 0xFF605015, 0x15FF6050, 0x5015FF60, }, /* x=DA */
-    { 0x6E5918F4, 0xF46E5918, 0x18F46E59, 0x5918F46E, }, /* x=DB */
-    { 0x44663BC5, 0xC544663B, 0x3BC54466, 0x663BC544, }, /* x=DC */
-    { 0x4A6F36CE, 0xCE4A6F36, 0x36CE4A6F, 0x6F36CE4A, }, /* x=DD */
-    { 0x587421D3, 0xD3587421, 0x21D35874, 0x7421D358, }, /* x=DE */
-    { 0x567D2CD8, 0xD8567D2C, 0x2CD8567D, 0x7D2CD856, }, /* x=DF */
-    { 0x37A10C7A, 0x7A37A10C, 0x0C7A37A1, 0xA10C7A37, }, /* x=E0 */
-    { 0x39A80171, 0x7139A801, 0x017139A8, 0xA8017139, }, /* x=E1 */
-    { 0x2BB3166C, 0x6C2BB316, 0x166C2BB3, 0xB3166C2B, }, /* x=E2 */
-    { 0x25BA1B67, 0x6725BA1B, 0x1B6725BA, 0xBA1B6725, }, /* x=E3 */
-    { 0x0F853856, 0x560F8538, 0x38560F85, 0x8538560F, }, /* x=E4 */
-    { 0x018C355D, 0x5D018C35, 0x355D018C, 0x8C355D01, }, /* x=E5 */
-    { 0x13972240, 0x40139722, 0x22401397, 0x97224013, }, /* x=E6 */
-    { 0x1D9E2F4B, 0x4B1D9E2F, 0x2F4B1D9E, 0x9E2F4B1D, }, /* x=E7 */
-    { 0x47E96422, 0x2247E964, 0x642247E9, 0xE9642247, }, /* x=E8 */
-    { 0x49E06929, 0x2949E069, 0x692949E0, 0xE0692949, }, /* x=E9 */
-    { 0x5BFB7E34, 0x345BFB7E, 0x7E345BFB, 0xFB7E345B, }, /* x=EA */
-    { 0x55F2733F, 0x3F55F273, 0x733F55F2, 0xF2733F55, }, /* x=EB */
-    { 0x7FCD500E, 0x0E7FCD50, 0x500E7FCD, 0xCD500E7F, }, /* x=EC */
-    { 0x71C45D05, 0x0571C45D, 0x5D0571C4, 0xC45D0571, }, /* x=ED */
-    { 0x63DF4A18, 0x1863DF4A, 0x4A1863DF, 0xDF4A1863, }, /* x=EE */
-    { 0x6DD64713, 0x136DD647, 0x47136DD6, 0xD647136D, }, /* x=EF */
-    { 0xD731DCCA, 0xCAD731DC, 0xDCCAD731, 0x31DCCAD7, }, /* x=F0 */
-    { 0xD938D1C1, 0xC1D938D1, 0xD1C1D938, 0x38D1C1D9, }, /* x=F1 */
-    { 0xCB23C6DC, 0xDCCB23C6, 0xC6DCCB23, 0x23C6DCCB, }, /* x=F2 */
-    { 0xC52ACBD7, 0xD7C52ACB, 0xCBD7C52A, 0x2ACBD7C5, }, /* x=F3 */
-    { 0xEF15E8E6, 0xE6EF15E8, 0xE8E6EF15, 0x15E8E6EF, }, /* x=F4 */
-    { 0xE11CE5ED, 0xEDE11CE5, 0xE5EDE11C, 0x1CE5EDE1, }, /* x=F5 */
-    { 0xF307F2F0, 0xF0F307F2, 0xF2F0F307, 0x07F2F0F3, }, /* x=F6 */
-    { 0xFD0EFFFB, 0xFBFD0EFF, 0xFFFBFD0E, 0x0EFFFBFD, }, /* x=F7 */
-    { 0xA779B492, 0x92A779B4, 0xB492A779, 0x79B492A7, }, /* x=F8 */
-    { 0xA970B999, 0x99A970B9, 0xB999A970, 0x70B999A9, }, /* x=F9 */
-    { 0xBB6BAE84, 0x84BB6BAE, 0xAE84BB6B, 0x6BAE84BB, }, /* x=FA */
-    { 0xB562A38F, 0x8FB562A3, 0xA38FB562, 0x62A38FB5, }, /* x=FB */
-    { 0x9F5D80BE, 0xBE9F5D80, 0x80BE9F5D, 0x5D80BE9F, }, /* x=FC */
-    { 0x91548DB5, 0xB591548D, 0x8DB59154, 0x548DB591, }, /* x=FD */
-    { 0x834F9AA8, 0xA8834F9A, 0x9AA8834F, 0x4F9AA883, }, /* x=FE */
-    { 0x8D4697A3, 0xA38D4697, 0x97A38D46, 0x4697A38D, }, /* x=FF */
-};
-
-
 
 /*
 AES_Te0[x] = S [x].[02, 01, 01, 03];
-- 
2.34.1


