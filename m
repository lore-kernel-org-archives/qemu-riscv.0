Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6V5-0008Gi-I2
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:02:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6UR-0006Kg-DK
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:01:27 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6UC-0003Dd-KE
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:01:27 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f20215fa70so30982105e9.0
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097270; x=1685689270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O4O2YAeN9cb5anbyImPMVEQOY1pM7UmSuOPh7iKYeY4=;
 b=rmHQ/Lc8SBsyqNr+x4FGgFYmaqoh631aZjTGxKoqX+FLErpESznVcWWH9pjP85ixeI
 4Y6Egsopn7GJOBiTP38Ct3UTIGcSezs0ub1efkEZ5eWJGTOo75vhZL5IJtwh1DzLia3o
 xY0BrRBtbVYYBfkiZdBxTwxkotoj34ONDx8XVAmm0VEGM5Ehmalk/sZQ/KSJvJWw3hAN
 eMTlni+qXTqgx83UxQ4cDTBaHjfUuKVktNDw2wK++cWi/KwWFN7mvQCzVj4dLBx8GxLA
 pXl24Qn8wNO7bFBwYm1uPQEuibKObbC0D5OaWlicGYN8FfsTFo8/OmYT94InBTPhkLmX
 LoMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097270; x=1685689270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O4O2YAeN9cb5anbyImPMVEQOY1pM7UmSuOPh7iKYeY4=;
 b=diZY7pp6ieRKOjxUqVhRmPzc/cRlfnjylTCQ0XUqpkh0EVB0ZTwgjZnwkrURgXmGc7
 Jd/8Tc6YDk5E51WdNZVORl7tbKu3liqFklLejf5RPUIXx/BFrgF4SGNDKKg9ll6htDzZ
 c9SQztIcgSuwgnzLPhwaAL1MC2tQTamCFEc9V84fOzi7hmWO8ZB6t7yeA+z3gfz3tJM0
 vZboyPvEl0tF7nzmv8dkNh8bVC1sB3iYBmMuj0mD8+MoTZCxNTzdJKODzDih+I7i56wb
 7MTkSs+KBsOK3yjplm/0P0y1bVI3615ALyFaopfFNJChRk3ZUkpouxqdJqoghYRfIqp/
 WiWQ==
X-Gm-Message-State: AC+VfDybH0ui60pAAFh5owCvFM1LLEuV3SmckisdHOu2F0JySDr70kV2
 kxsasZ0UMArL1pO52YHW64SBgA==
X-Google-Smtp-Source: ACHHUZ75blxGj6EToHGxb5LMmzIUKTRKQOamU5ft41snZQBZsNz4Dadz3NxrY1SKArhqdsoHwAzXcQ==
X-Received: by 2002:a1c:740f:0:b0:3f2:5641:3d4 with SMTP id
 p15-20020a1c740f000000b003f2564103d4mr13090886wmc.33.1683097269831; 
 Wed, 03 May 2023 00:01:09 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a1ced02000000b003f19b3d89e9sm905035wmh.33.2023.05.03.00.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:01:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 51/54] tcg/ppc: Remove unused constraint J
Date: Wed,  3 May 2023 07:57:26 +0100
Message-Id: <20230503065729.1745843-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
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
X-List-Received-Date: Wed, 03 May 2023 07:01:28 -0000

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


