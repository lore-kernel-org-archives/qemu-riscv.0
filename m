Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pvCGd-00063F-3d
	for mharc-qemu-riscv@gnu.org; Sat, 06 May 2023 03:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCGV-0005ef-Ql
 for qemu-riscv@nongnu.org; Sat, 06 May 2023 03:23:35 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFu-0004X9-No
 for qemu-riscv@nongnu.org; Sat, 06 May 2023 03:23:35 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-2fe3fb8e25fso1737091f8f.0
 for <qemu-riscv@nongnu.org>; Sat, 06 May 2023 00:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683357777; x=1685949777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O4O2YAeN9cb5anbyImPMVEQOY1pM7UmSuOPh7iKYeY4=;
 b=UUB9heQZK2dk3DkWZJ+PK33dPI7Dph7mEO7jvS0vPMU8y9q1tDHSw34jXYSyBh/bkI
 WXx12h1YirRPxICSp07nqIEzO2XTR+uwCb7FBvVQAHX1RiWLsXXrVxxngrkpE0Xu+ngr
 SkURFJ42IBa8diQRAj3UDBtGVizvWUJhr/Sou20BFDD5yPj63M1yPTWYwubG6BSta6+h
 5m9b344tcSxJLs7I2Iczm8jZBuSVGQ9jJ8ILU4WuF/PPTXAlTj6qEqwVAAg9UOQZ5E1z
 bZPTXzMBhF9XDDehj1s8wbZHHyGWy2UDyrJ8X8Yf4qtolVvRixtnQIZJ8IvztY4eZQXX
 fsng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683357777; x=1685949777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O4O2YAeN9cb5anbyImPMVEQOY1pM7UmSuOPh7iKYeY4=;
 b=jPlaIOdnyQH+cZOMv386Sytq29CIXbDBjbiOWPum79zIZ7Wdj1uFpiJA/Ofzi6yQhv
 VF1R58QSgs14ngQX09LYdcg1Fj6u6BxGh4UM5qy474zvXO5khPuQFa710avDmb7qpWQD
 +OG+7zi/tQfLVtdBggW3hjy/Zu+Mztk7zbprNyoea1CBDRziGzlh0Ib8uXPL7otxTQlr
 PPUdBBwE4byxg27NvXUI7wcUcI3P/4m8Xt/kLrwPEQWYF/Lnj5sUMZ1CSMb7CbaOFSsO
 o85fJ0Z7XdzhwczJxpHstB5WFH0W7VBWFk1sZ9ohxXjnZhH0VeqMn5Ob59ec+SPTvnQb
 rk7w==
X-Gm-Message-State: AC+VfDz0xqGa7gYZ70tpdA9GsG98bYa+GRXVNKMsQelWnbSy85/3lJnO
 0Oj0JB0KRnyLDdonQXaDlX09zQ==
X-Google-Smtp-Source: ACHHUZ4/P0AFvJ7GR9ZcslfSm5QnkTPYJwrb9+Id3AaB1BrqbrITgvME3z/xb5GqyLldhpbAn2b3ZQ==
X-Received: by 2002:a5d:6b86:0:b0:306:2fd1:a91f with SMTP id
 n6-20020a5d6b86000000b003062fd1a91fmr2458522wrx.61.1683357777330; 
 Sat, 06 May 2023 00:22:57 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 x9-20020adfec09000000b002faaa9a1721sm4481223wrn.58.2023.05.06.00.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 00:22:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v5 27/30] tcg/ppc: Remove unused constraint J
Date: Sat,  6 May 2023 08:22:32 +0100
Message-Id: <20230506072235.597467-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230506072235.597467-1-richard.henderson@linaro.org>
References: <20230506072235.597467-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
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
X-List-Received-Date: Sat, 06 May 2023 07:23:36 -0000

Never used since its introduction.

Fixes: 3d582c6179c ("tcg-ppc64: Rearrange integer constant constraints")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target-con-str.h | 1 -
 tcg/ppc/tcg-target.c.inc     | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/tcg/ppc/tcg-target-con-str.h b/tcg/ppc/tcg-target-con-str.h
index 9dcbc3df50..094613cbcb 100644
--- a/tcg/ppc/tcg-target-con-str.h
+++ b/tcg/ppc/tcg-target-con-str.h
@@ -16,7 +16,6 @@ REGS('v', ALL_VECTOR_REGS)
  * CONST(letter, TCG_CT_CONST_* bit set)
  */
 CONST('I', TCG_CT_CONST_S16)
-CONST('J', TCG_CT_CONST_U16)
 CONST('M', TCG_CT_CONST_MONE)
 CONST('T', TCG_CT_CONST_S32)
 CONST('U', TCG_CT_CONST_U32)
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 5a4ec0470a..0a14c3e997 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -83,7 +83,6 @@
 #define SZR  (TCG_TARGET_REG_BITS / 8)
 
 #define TCG_CT_CONST_S16  0x100
-#define TCG_CT_CONST_U16  0x200
 #define TCG_CT_CONST_S32  0x400
 #define TCG_CT_CONST_U32  0x800
 #define TCG_CT_CONST_ZERO 0x1000
@@ -270,8 +269,6 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 
     if ((ct & TCG_CT_CONST_S16) && val == (int16_t)val) {
         return 1;
-    } else if ((ct & TCG_CT_CONST_U16) && val == (uint16_t)val) {
-        return 1;
     } else if ((ct & TCG_CT_CONST_S32) && val == (int32_t)val) {
         return 1;
     } else if ((ct & TCG_CT_CONST_U32) && val == (uint32_t)val) {
-- 
2.34.1


