Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4956EEB64DB
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 11:14:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBZER-0007CP-Uf; Tue, 20 Jun 2023 07:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZE2-0006b4-O0
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 07:08:42 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDy-0004UR-V7
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 07:08:42 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-988aefaa44eso307774566b.2
 for <qemu-riscv@nongnu.org>; Tue, 20 Jun 2023 04:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259317; x=1689851317;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M7z3XVBK0XuXSTZ82FoV8jlvhCwFhDqWNnV/JcekGnU=;
 b=UNvDFUOcZlKZJCNu9yftaPk4hl/pSvMxYuK8Ew0rbAwGgMztrwd8lq9kM47qR2VX5a
 4olD845dc0K7z9v8oh7FzxeWLVVSit4C2v4fg6vxnHDeeNBS6T3JyL0v9LDaXdxijEJr
 p5XpqlOLAjEhh6XoPENCXGXiO3AFmgBBZWTfQjEOFK7qRDtlF6R5f8hhyYn7lSpf9gmf
 rn2fYUJ3f/dzCExrxF6xkjI/dQMtT2EP9B97gQ47901N1TlPgbeNduC+33mAO4HDg4/6
 pyHcC88rVL8bvKjtQPJetMZZDUQR52OeRtFNIbuUtSUFvK75AW0BZEWnU8E1wnfrtinn
 soWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259317; x=1689851317;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M7z3XVBK0XuXSTZ82FoV8jlvhCwFhDqWNnV/JcekGnU=;
 b=hR6hry9X5Wy/VOqgskTQsu4hr0rDGCQ4kEvnttkawVt0hJdiAbamM6QrI0QllaZwab
 3HHB2R7lKVJNTZlxvbl9VvZNs3J8/Lo79TyeuCW2fAW8koiUkR9AzHGatOdXADooQlai
 IgIuMwn/XOo3qRFEGFcLSgESTHxvJ95TYn7Z5CDi81FpdPDxStJcGgDFzYh9XKyDHkfr
 wk5xH3/cBOkHpLnycP3vqjjRT5mN3ZA0KoGcO+5YEvmv+/CMJMvHgI0sQ4grDX66WGZF
 Vsldr2xBdUGZm5RC11LaNT+fFDeNlT2zvykIF0dtVAfukV7C3PhfhdxrFi4NN9SdHhay
 kbtQ==
X-Gm-Message-State: AC+VfDy08LKgCCcY6WwDSNUmOlxBGDZQgr30YALeB5BUItrcpwTm5nrS
 7T5dpkn0MuEiYbpiJH4RFFlnEA==
X-Google-Smtp-Source: ACHHUZ6bLJwznakuwlvglddYiHaUCBAsxjFcw4EZJSRntxUvmtW0rjhMRb41cbNyqvBx0eKRPo+aIA==
X-Received: by 2002:a17:906:a402:b0:977:eed1:4510 with SMTP id
 l2-20020a170906a40200b00977eed14510mr9021441ejz.21.1687259317625; 
 Tue, 20 Jun 2023 04:08:37 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170906711100b009884f015a44sm1170687ejj.49.2023.06.20.04.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:08:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 28/37] target/riscv: Use aesdec_ISB_ISR_IMC_AK
Date: Tue, 20 Jun 2023 13:07:49 +0200
Message-Id: <20230620110758.787479-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620110758.787479-1-richard.henderson@linaro.org>
References: <20230620110758.787479-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x634.google.com
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

This implements the AES64DSM instruction.  This was the last use
of aes64_operation and its support macros, so remove them all.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/crypto_helper.c | 101 ++++-------------------------------
 1 file changed, 10 insertions(+), 91 deletions(-)

diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
index c036fe8632..99d85a6188 100644
--- a/target/riscv/crypto_helper.c
+++ b/target/riscv/crypto_helper.c
@@ -104,98 +104,8 @@ target_ulong HELPER(aes32dsi)(target_ulong rs1, target_ulong rs2,
     return aes32_operation(shamt, rs1, rs2, false, false);
 }
 
-#define BY(X, I) ((X >> (8 * I)) & 0xFF)
-
-#define AES_SHIFROWS_LO(RS1, RS2) ( \
-    (((RS1 >> 24) & 0xFF) << 56) | (((RS2 >> 48) & 0xFF) << 48) | \
-    (((RS2 >> 8) & 0xFF) << 40) | (((RS1 >> 32) & 0xFF) << 32) | \
-    (((RS2 >> 56) & 0xFF) << 24) | (((RS2 >> 16) & 0xFF) << 16) | \
-    (((RS1 >> 40) & 0xFF) << 8) | (((RS1 >> 0) & 0xFF) << 0))
-
-#define AES_INVSHIFROWS_LO(RS1, RS2) ( \
-    (((RS2 >> 24) & 0xFF) << 56) | (((RS2 >> 48) & 0xFF) << 48) | \
-    (((RS1 >> 8) & 0xFF) << 40) | (((RS1 >> 32) & 0xFF) << 32) | \
-    (((RS1 >> 56) & 0xFF) << 24) | (((RS2 >> 16) & 0xFF) << 16) | \
-    (((RS2 >> 40) & 0xFF) << 8) | (((RS1 >> 0) & 0xFF) << 0))
-
-#define AES_MIXBYTE(COL, B0, B1, B2, B3) ( \
-    BY(COL, B3) ^ BY(COL, B2) ^ AES_GFMUL(BY(COL, B1), 3) ^ \
-    AES_GFMUL(BY(COL, B0), 2))
-
-#define AES_MIXCOLUMN(COL) ( \
-    AES_MIXBYTE(COL, 3, 0, 1, 2) << 24 | \
-    AES_MIXBYTE(COL, 2, 3, 0, 1) << 16 | \
-    AES_MIXBYTE(COL, 1, 2, 3, 0) << 8 | AES_MIXBYTE(COL, 0, 1, 2, 3) << 0)
-
-#define AES_INVMIXBYTE(COL, B0, B1, B2, B3) ( \
-    AES_GFMUL(BY(COL, B3), 0x9) ^ AES_GFMUL(BY(COL, B2), 0xd) ^ \
-    AES_GFMUL(BY(COL, B1), 0xb) ^ AES_GFMUL(BY(COL, B0), 0xe))
-
-#define AES_INVMIXCOLUMN(COL) ( \
-    AES_INVMIXBYTE(COL, 3, 0, 1, 2) << 24 | \
-    AES_INVMIXBYTE(COL, 2, 3, 0, 1) << 16 | \
-    AES_INVMIXBYTE(COL, 1, 2, 3, 0) << 8 | \
-    AES_INVMIXBYTE(COL, 0, 1, 2, 3) << 0)
-
 static const AESState aes_zero = { };
 
-static inline target_ulong aes64_operation(target_ulong rs1, target_ulong rs2,
-                                           bool enc, bool mix)
-{
-    uint64_t RS1 = rs1;
-    uint64_t RS2 = rs2;
-    uint64_t result;
-    uint64_t temp;
-    uint32_t col_0;
-    uint32_t col_1;
-
-    if (enc) {
-        temp = AES_SHIFROWS_LO(RS1, RS2);
-        temp = (((uint64_t)AES_sbox[(temp >> 0) & 0xFF] << 0) |
-                ((uint64_t)AES_sbox[(temp >> 8) & 0xFF] << 8) |
-                ((uint64_t)AES_sbox[(temp >> 16) & 0xFF] << 16) |
-                ((uint64_t)AES_sbox[(temp >> 24) & 0xFF] << 24) |
-                ((uint64_t)AES_sbox[(temp >> 32) & 0xFF] << 32) |
-                ((uint64_t)AES_sbox[(temp >> 40) & 0xFF] << 40) |
-                ((uint64_t)AES_sbox[(temp >> 48) & 0xFF] << 48) |
-                ((uint64_t)AES_sbox[(temp >> 56) & 0xFF] << 56));
-        if (mix) {
-            col_0 = temp & 0xFFFFFFFF;
-            col_1 = temp >> 32;
-
-            col_0 = AES_MIXCOLUMN(col_0);
-            col_1 = AES_MIXCOLUMN(col_1);
-
-            result = ((uint64_t)col_1 << 32) | col_0;
-        } else {
-            result = temp;
-        }
-    } else {
-        temp = AES_INVSHIFROWS_LO(RS1, RS2);
-        temp = (((uint64_t)AES_isbox[(temp >> 0) & 0xFF] << 0) |
-                ((uint64_t)AES_isbox[(temp >> 8) & 0xFF] << 8) |
-                ((uint64_t)AES_isbox[(temp >> 16) & 0xFF] << 16) |
-                ((uint64_t)AES_isbox[(temp >> 24) & 0xFF] << 24) |
-                ((uint64_t)AES_isbox[(temp >> 32) & 0xFF] << 32) |
-                ((uint64_t)AES_isbox[(temp >> 40) & 0xFF] << 40) |
-                ((uint64_t)AES_isbox[(temp >> 48) & 0xFF] << 48) |
-                ((uint64_t)AES_isbox[(temp >> 56) & 0xFF] << 56));
-        if (mix) {
-            col_0 = temp & 0xFFFFFFFF;
-            col_1 = temp >> 32;
-
-            col_0 = AES_INVMIXCOLUMN(col_0);
-            col_1 = AES_INVMIXCOLUMN(col_1);
-
-            result = ((uint64_t)col_1 << 32) | col_0;
-        } else {
-            result = temp;
-        }
-    }
-
-    return result;
-}
-
 target_ulong HELPER(aes64esm)(target_ulong rs1, target_ulong rs2)
 {
     AESState t;
@@ -228,7 +138,16 @@ target_ulong HELPER(aes64ds)(target_ulong rs1, target_ulong rs2)
 
 target_ulong HELPER(aes64dsm)(target_ulong rs1, target_ulong rs2)
 {
-    return aes64_operation(rs1, rs2, false, true);
+    AESState t, z = { };
+
+    /*
+     * This instruction does not include a round key,
+     * so supply a zero to our primitive.
+     */
+    t.d[HOST_BIG_ENDIAN] = rs1;
+    t.d[!HOST_BIG_ENDIAN] = rs2;
+    aesdec_ISB_ISR_IMC_AK(&t, &t, &z, false);
+    return t.d[HOST_BIG_ENDIAN];
 }
 
 target_ulong HELPER(aes64ks2)(target_ulong rs1, target_ulong rs2)
-- 
2.34.1


