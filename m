Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6bZ-0003Un-Dp
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ao-0008Lc-W9
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:08:04 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6aE-0005qK-Ps
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:08:00 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f1cfed93e2so47413265e9.3
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097645; x=1685689645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g0XhypHJuKT2RLCHGyOOS8cpna/MQwPu76GFexENMHE=;
 b=CO0Sw3ltI+LRP4jx8Sqcg7I/yQ9ZmMrVpTIL7MErWesdzwUdYs8CFLkEwMpecXxhgL
 hW6J1wQrEAHyIDwYHd+UMWEqR691ODuMDVugiZTf3v1mz+tU3k46xGq/xsswx8XOTK4s
 F869utksGgjQDdnKRb8HTgml/Dgj+RJnBhcuujUBc7ioIIdeIbm3vsoEapBuWZbnGCu4
 n2C/ln00C+GetzoLzEYzS6FtNT3Q+wgZq3QaLlnBawcL8sTM0XqM7tYcJTlLa/y92ppU
 2Jn8k1tpbmMZeDrJENpog13oTS0wNLcfgaPVRaIBWZohvuD30aw3O8Dg6knSNbsR0taZ
 d7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097645; x=1685689645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g0XhypHJuKT2RLCHGyOOS8cpna/MQwPu76GFexENMHE=;
 b=fyCeZn+Df2tfbd72G40t6V1D4yySUz52cYEif11sOsXh9MxR3THE780xOBt5hn4W85
 kWPn0B3YD4sYXkcAiiPVZhJigi/ztHeuKQ0b+hKxxTzjCbMHiI3ho7wtQhCOUopU0Hec
 TcOLFqdV7rNygq0rHR5RBx/6cK3gYknTd8HnlJBXhRp7yX4Zog7uIRCJzGdzYeADyNtW
 92d+X3uZez+CDVfIOwXkBz6tqxtVYIC25TtnrF+lE4s7eVkieak/YBpJ3ItqpA2gFTzY
 RWTAEpY3+FYvXi+ZirRN82hHdZg8yTs46bQetj3OllYHnc00YMJwPXBYxGCK0OKignDc
 DIOA==
X-Gm-Message-State: AC+VfDwBUtnvhTjk3wGcP5aIeapphv2UCI/n/1ALPV48JNVedP31fAVn
 pzj7pcnZx/Kw3P7QxTn/DQMBGg==
X-Google-Smtp-Source: ACHHUZ5Lh1F4spRWM+Vw5pW9C5t8cVmXQnKsWIk8QzMK7h+Y2I06CIxR0FpD5H6xA/RiAtJT9k8uZA==
X-Received: by 2002:a1c:7502:0:b0:3ee:36f:3485 with SMTP id
 o2-20020a1c7502000000b003ee036f3485mr14848011wmc.8.1683097644870; 
 Wed, 03 May 2023 00:07:24 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 36/57] tcg/loongarch64: Assert the host supports unaligned
 accesses
Date: Wed,  3 May 2023 08:06:35 +0100
Message-Id: <20230503070656.1746170-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
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
X-List-Received-Date: Wed, 03 May 2023 07:08:05 -0000

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


