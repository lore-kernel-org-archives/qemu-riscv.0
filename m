Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143D6C7EE25
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 02:27:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7RpF-00064D-NE; Thu, 08 Jun 2023 22:26:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RoN-0003CR-SW
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:25:14 -0400
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rnl-0005mi-Aj
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:25:10 -0400
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-55b171c1e16so857567eaf.1
 for <qemu-riscv@nongnu.org>; Thu, 08 Jun 2023 19:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277471; x=1688869471;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q9vppTZ0kH0Xs3eiJ138RWwvuyXdLrdS2zldn9LG9Ak=;
 b=nJWCZtF3h06Cbsflk7UBEJ53FYknsNeRYR21bA0viRmaMSPCSgLHyjkoEoE2Bf2wYP
 KbzSyfnF3LD/3EUE0ouVmvcrenkgmsoRMPzwy2OIKXOgyZuG0quVryf6LigxPquoubdt
 1hzXyqNsssLr69USbkwjsNilL7DFL3SVTuMyaJMYq5qYeFho/0MZg/QH2EGuPLvZgjr6
 2fpaJ0ZyKZ9ubumQcPkrTXjseaWvy4I0irHsW1cYk79sO3U1Y+LUoRSqo9kFIvGL6MJV
 5rz/8h+iTgQ+kRCeKPEGKga9hocec0MFZT/d2uLqXBgSnacI3YnOEXPNiuh6zsVEBNaz
 0x3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277471; x=1688869471;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q9vppTZ0kH0Xs3eiJ138RWwvuyXdLrdS2zldn9LG9Ak=;
 b=fa6GeFQaJA903XnI4T4nrBS7Ptn5yjThdn9UP9K51oTljmpC2S/eYDhi7DWIjgwAAU
 L6GU2SFyHMCdzej5TdaxJk/QdUfkREz9Va4vdhde5JINf2GNOJjHXE9sTGeyowiEKzhf
 grnpc/sm5dCtgTyspdZoPU7YrmOv1y8403HbU5i0NibobihfBs4Zd9tFhyrU8UA/TW5l
 2Um81pG5dVrNkPgsgW3JtgJMny7BYcpDvdQvNySaG9fi0B6Vs38gMKkw13/oQT2kJwW3
 imFxWgclTeZEwyiX3Du9QdJRmCF/wzmoLJ5lihcIIIcsEz1eLPljHPsbtSoNdoetPmdP
 Iycw==
X-Gm-Message-State: AC+VfDw5s3Cpka7rY1gZ9LzLefNSGKGMFZtCzMNT+HvvsABgeBK5U355
 NOzTAiM7MD/slcidZx3q13S/Ig==
X-Google-Smtp-Source: ACHHUZ5fgCoeyznpj6eTr74WM2ZMhMHV7lcz1mAQveDSkjtjhJqGXStwEB911vmV6YeFqF5hTKVoIg==
X-Received: by 2002:a54:4117:0:b0:39a:a9e9:38cb with SMTP id
 l23-20020a544117000000b0039aa9e938cbmr282605oic.22.1686277471442; 
 Thu, 08 Jun 2023 19:24:31 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 31/38] target/ppc: Use aesdec_ISB_ISR_AK_IMC
Date: Thu,  8 Jun 2023 19:23:54 -0700
Message-Id: <20230609022401.684157-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc34.google.com
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

This implements the VNCIPHER instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/int_helper.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 1e477924b7..834da80fe3 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -2947,22 +2947,11 @@ void helper_vcipherlast(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 
 void helper_vncipher(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
-    /* This differs from what is written in ISA V2.07.  The RTL is */
-    /* incorrect and will be fixed in V2.07B.                      */
-    int i;
-    ppc_avr_t tmp;
+    AESState *ad = (AESState *)r;
+    AESState *st = (AESState *)a;
+    AESState *rk = (AESState *)b;
 
-    VECTOR_FOR_INORDER_I(i, u8) {
-        tmp.VsrB(i) = b->VsrB(i) ^ AES_isbox[a->VsrB(AES_ishifts[i])];
-    }
-
-    VECTOR_FOR_INORDER_I(i, u32) {
-        r->VsrW(i) =
-            AES_imc[tmp.VsrB(4 * i + 0)][0] ^
-            AES_imc[tmp.VsrB(4 * i + 1)][1] ^
-            AES_imc[tmp.VsrB(4 * i + 2)][2] ^
-            AES_imc[tmp.VsrB(4 * i + 3)][3];
-    }
+    aesdec_ISB_ISR_AK_IMC(ad, st, rk, true);
 }
 
 void helper_vncipherlast(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
-- 
2.34.1


