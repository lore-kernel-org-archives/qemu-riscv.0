Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prOS1-0005sW-UF
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 15:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prORr-0005gp-Et
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:35:35 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prORR-00054A-La
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:35:33 -0400
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4eff055d4d3so3380817e87.3
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 12:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451306; x=1685043306;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g0XhypHJuKT2RLCHGyOOS8cpna/MQwPu76GFexENMHE=;
 b=Bn0+AmargC1oRsIsg6nNQ0EV/wFtd9+gB1yWazhCWUtfmiADR56//YCztrKDoFw4RO
 JshwqBSVmg9LGumuhGv+IafuTDJJRRWBmR+s/HLPiUnza1WhahGK4ei5k6KWNybVu179
 l65CzWAAX+fDt93wey/u/5r0GmpFFev7/48MPrydvYiO3WbGhiiEXyXM5l0OJMC8fCTC
 XS8/MpyWjPpqP4HDDrNFshDhj9l1iHfh8PEHT94oDBT68y07Ql3ISsSuoCfsBRfVGNC0
 wjMS3Bf4tN1u2y7hDo66S8iroV/y7ZxE2OUH2rdQs7Wo3T6gvbM0g2gaWaVPcJSw0uPb
 hdWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451307; x=1685043307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g0XhypHJuKT2RLCHGyOOS8cpna/MQwPu76GFexENMHE=;
 b=Rrel5g+K/pDGTrMcqA7HWwIqxvDLNUCaQ+d0rDJk0n15fphHKxGmhDaEyzzyMADjJw
 yO91tJjs1EApfWogYgTjDuFKAnN9GOqKbpbq6QyuGXhQU3JG3513dgnIAnIczJu3yMGV
 iNi+/kBLerdTOYTz5V93peOv/HieYtqeSqcdb0rQOr6TvJfySrkBR9jiqgDEItBvqXhT
 xgW0ZF1eomvByKj8dQvpxs8014jtl1CY/QZtdODz8iUvSY0q7ONSNkq/jq9scgWCP8EG
 +ntgaJu8UPob0g/bD8w0uMEWVTs2fJJVCVaVvY++GQvJ54I3QsFOGc46ZVdjWmaSpUx/
 zp8g==
X-Gm-Message-State: AAQBX9fdnVtHJAecrPL6KFDjpWKG3uRKrMR7DLXDkdeftCxBuNB7CVT2
 xDLUvoT1XfVmMI8wWkHIrbzduw==
X-Google-Smtp-Source: AKy350YPrehHUXPXHEjvpL2FMdBnGNQmAeyLxVg8Sc5adLt+GKa+vkAVxzota+Ws4+ms0Ctw4yAUKA==
X-Received: by 2002:a05:6512:374b:b0:4b6:eca8:f6ca with SMTP id
 a11-20020a056512374b00b004b6eca8f6camr5131335lfs.67.1682451306802; 
 Tue, 25 Apr 2023 12:35:06 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:35:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 36/57] tcg/loongarch64: Assert the host supports unaligned
 accesses
Date: Tue, 25 Apr 2023 20:31:25 +0100
Message-Id: <20230425193146.2106111-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x12f.google.com
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
X-List-Received-Date: Tue, 25 Apr 2023 19:35:35 -0000

This should be true of all server class loongarch64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index e651ec5c71..ccc13ffdb4 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -30,6 +30,7 @@
  */
 
 #include "../tcg-ldst.c.inc"
+#include <asm/hwcap.h>
 
 #ifdef CONFIG_DEBUG_TCG
 static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
@@ -1674,6 +1675,11 @@ static void tcg_target_qemu_prologue(TCGContext *s)
 
 static void tcg_target_init(TCGContext *s)
 {
+    unsigned long hwcap = qemu_getauxval(AT_HWCAP);
+
+    /* All server class loongarch have UAL; only embedded do not. */
+    assert(hwcap & HWCAP_LOONGARCH_UAL);
+
     tcg_target_available_regs[TCG_TYPE_I32] = ALL_GENERAL_REGS;
     tcg_target_available_regs[TCG_TYPE_I64] = ALL_GENERAL_REGS;
 
-- 
2.34.1


