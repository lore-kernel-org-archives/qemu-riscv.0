Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0176AEB64DB
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 11:13:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBZES-0007GC-J8; Tue, 20 Jun 2023 07:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZE5-0006eD-29
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 07:08:45 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZE2-0004Wi-Ua
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 07:08:44 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-986d871a9beso591191466b.1
 for <qemu-riscv@nongnu.org>; Tue, 20 Jun 2023 04:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259321; x=1689851321;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pgBAxhQFeKhLP03OUtk50UQNjg0nvOfEcQqaZaYFTpk=;
 b=ZkfN037y/+U2htybBOOvy/v3rCEnN9UKqdSt/X+C2ZCIVev89oHc/+f/Koj5JocIRf
 bbCOPyNaXWk+9HyVC4vgtjIVo8X7bwTUc+S+5kecJ6XFZTzmU/SLQwp/4lMpUNOiZ3dm
 cw+8Zm1bzCZBwDEHJp5gELfwN/BkA3fa7rVAaR7DKwPopEJWoBpZItSRBPiaqvbcRsfb
 QyrJTe2uorG2B3pMNoKRbWtXp+sgtrytiqX364nx6Lkr1octUFkGxEwsxg7/zTIzVanj
 9E5hfcgdALjsOBgUxSin5nm9yUdZlauGVxZKSNBxuianbliv47coRwAVcebcQmm8wUSQ
 2mBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259321; x=1689851321;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pgBAxhQFeKhLP03OUtk50UQNjg0nvOfEcQqaZaYFTpk=;
 b=la4HkatZWatrFKXiBcSxRsbtFeCXOGNiiCS3oPbDf0DT/YjxNjtwoQ2/Hdl7dH7A3O
 epbIHWM3qlVLXVnN/yriJI1EG4ed0mI0R6L/jPNFmmfA5ftEqcGiScCkr2Ucfsf49kVX
 87v4QSDw49LC7Z/Rje2iKHFqEbleYGlaBYbQGSt6exbsgfV0Dc+CNu5ZajeRpL3OlKM8
 BCHtAS0dPFPnkPrsLe38kHv8++vmHKLPgcrBH2vpxANCNsdUSzOVNPLK/BA0RS5b/w8k
 88ssgP7A9l/qnk7slFEsUTUCXKQ/J1nZ2VPflbl8vMKaBxhhUwLL+JNEb7JdmadcK20H
 sXnw==
X-Gm-Message-State: AC+VfDztKzZzK45ovuKyZEIaRibsVxzO6xwzWN5VlnxxvcSo/Q3+iip0
 EHKQRLS/S0Reg+EBkw2ZwYGZHQ==
X-Google-Smtp-Source: ACHHUZ54pg/+tS08ugMuNrocMNITgTP01Czy1tejHFer2C6uFO4tUig84eaDoRlziK2xk9vpy3wbJg==
X-Received: by 2002:a17:907:7b96:b0:973:9f60:c57e with SMTP id
 ne22-20020a1709077b9600b009739f60c57emr13116579ejc.2.1687259321619; 
 Tue, 20 Jun 2023 04:08:41 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170906711100b009884f015a44sm1170687ejj.49.2023.06.20.04.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:08:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 31/37] crypto: Remove AES_shifts, AES_ishifts
Date: Tue, 20 Jun 2023 13:07:52 +0200
Message-Id: <20230620110758.787479-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620110758.787479-1-richard.henderson@linaro.org>
References: <20230620110758.787479-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x634.google.com
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

These arrays are no longer used, replaced by AES_SH_*, AES_ISH_*.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/crypto/aes.h |  4 ----
 crypto/aes.c         | 14 --------------
 2 files changed, 18 deletions(-)

diff --git a/include/crypto/aes.h b/include/crypto/aes.h
index 24b073d569..aa8b54065d 100644
--- a/include/crypto/aes.h
+++ b/include/crypto/aes.h
@@ -30,10 +30,6 @@ void AES_decrypt(const unsigned char *in, unsigned char *out,
 extern const uint8_t AES_sbox[256];
 extern const uint8_t AES_isbox[256];
 
-/* AES ShiftRows and InvShiftRows */
-extern const uint8_t AES_shifts[16];
-extern const uint8_t AES_ishifts[16];
-
 /* AES MixColumns, for use with rot32. */
 extern const uint32_t AES_mc_rot[256];
 
diff --git a/crypto/aes.c b/crypto/aes.c
index 2676faa962..9795ae8614 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -131,13 +131,6 @@ enum {
     AES_SH_F = 0xb,
 };
 
-const uint8_t AES_shifts[16] = {
-    AES_SH_0, AES_SH_1, AES_SH_2, AES_SH_3,
-    AES_SH_4, AES_SH_5, AES_SH_6, AES_SH_7,
-    AES_SH_8, AES_SH_9, AES_SH_A, AES_SH_B,
-    AES_SH_C, AES_SH_D, AES_SH_E, AES_SH_F,
-};
-
 /* AES InvShiftRows, for complete unrolling. */
 enum {
     AES_ISH_0 = 0x0,
@@ -158,13 +151,6 @@ enum {
     AES_ISH_F = 0x3,
 };
 
-const uint8_t AES_ishifts[16] = {
-    AES_ISH_0, AES_ISH_1, AES_ISH_2, AES_ISH_3,
-    AES_ISH_4, AES_ISH_5, AES_ISH_6, AES_ISH_7,
-    AES_ISH_8, AES_ISH_9, AES_ISH_A, AES_ISH_B,
-    AES_ISH_C, AES_ISH_D, AES_ISH_E, AES_ISH_F,
-};
-
 /*
  * MixColumns lookup table, for use with rot32.
  */
-- 
2.34.1


