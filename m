Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6bA-00016P-4o
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6aT-0006lR-1k
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:41 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6a2-0005iS-OC
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:40 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f19ab99540so46254755e9.2
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097631; x=1685689631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SlwZz/TkkaqpzfKRH/vz8Q4X3wFSx4Ts4VLXAbAY/Hk=;
 b=d5w3fu43/7Y/xej5/yLGS9lqNFyES0yCbEZrxvHIvzXTvmZ2QDreN6B8/U7YQvyPfT
 D2xRNs5/JJjWUgA7IukBGjv2tyFUHX2gyTqNm5HtbxEFm0k4WDrMSMA3pO+fZZ+6DMzb
 GMDNFlOLfTJ+UrazNaKA+Uw4FcJK9GJa1tJnPa4MAzXV//tfxyXUvDqxzmOGKIL3hpv5
 qf4xt9GzqluXra+3KD2Kr752xoafJFVcZFl9dmi/kIMVI/vx/cpV8UAXXdCGacWf6CqJ
 j0Dcts6kz9npVtk3Xx3FnFNryel4T9Fqcn+42/5AB/1OKLSeUZ7Q9Nraaa+hm8Xg000u
 ky4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097631; x=1685689631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SlwZz/TkkaqpzfKRH/vz8Q4X3wFSx4Ts4VLXAbAY/Hk=;
 b=JJZMGpYCabEknboX5eyCNgCj2AbJhkceu5UqP5mgKssqnzmN+Ai3P/Vtj8i/OLU+NC
 dlwvQEGj4rwnT3twyZDxFFHmrL45u264kuWVlvqi+OHBaxvwkj6xfb38RGnLa6UER6Pg
 Sse72k5PCx0RU/Oysgdy9CgyLNwEnL2r/jRdM1a8xDDso/404etaw09ra7mLbKq288Lh
 nmfqVV9SBFB2Rhy1YZeJVZUm2wGqbj8uGbkzdQ57JlE0xMutmnLRsVC9gFLi9cv83kmf
 /HwrOyEdYkUs7pTielDcw0PfMBlhwpco2pN05ww5zHzpC5KC2dY3cRAnSBR5mN4NDLsX
 EdJA==
X-Gm-Message-State: AC+VfDzuJ4D6qT/wPSjW9pTR435H/kmRHKmyu4M0ZT+c7YrXBfnk0UX1
 niOQtHpT6+QgqsuGT0r9sFe9SQ==
X-Google-Smtp-Source: ACHHUZ6BOfKdQn+9WNvyzifZRPjrRruJ/ZT6RyKALgb3mKCazm+IkVXiFDHKn037QkntkEpmmfXg6Q==
X-Received: by 2002:a7b:ce07:0:b0:3f3:fed1:5a45 with SMTP id
 m7-20020a7bce07000000b003f3fed15a45mr193544wmc.38.1683097631393; 
 Wed, 03 May 2023 00:07:11 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 18/57] tcg/aarch64: Detect have_lse, have_lse2 for darwin
Date: Wed,  3 May 2023 08:06:17 +0100
Message-Id: <20230503070656.1746170-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Wed, 03 May 2023 07:07:41 -0000

These features are present for Apple M1.

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index fc551a3d10..3adc5fd3a3 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -16,6 +16,9 @@
 #ifdef __linux__
 #include <asm/hwcap.h>
 #endif
+#ifdef CONFIG_DARWIN
+#include <sys/sysctl.h>
+#endif
 
 /* We're going to re-use TCGType in setting of the SF bit, which controls
    the size of the operation performed.  If we know the values match, it
@@ -2903,6 +2906,27 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     }
 }
 
+#ifdef CONFIG_DARWIN
+static bool sysctl_for_bool(const char *name)
+{
+    int val = 0;
+    size_t len = sizeof(val);
+
+    if (sysctlbyname(name, &val, &len, NULL, 0) == 0) {
+        return val != 0;
+    }
+
+    /*
+     * We might in ask for properties not present in older kernels,
+     * but we're only asking about static properties, all of which
+     * should be 'int'.  So we shouln't see ENOMEM (val too small),
+     * or any of the other more exotic errors.
+     */
+    assert(errno == ENOENT);
+    return false;
+}
+#endif
+
 static void tcg_target_init(TCGContext *s)
 {
 #ifdef __linux__
@@ -2910,6 +2934,10 @@ static void tcg_target_init(TCGContext *s)
     have_lse = hwcap & HWCAP_ATOMICS;
     have_lse2 = hwcap & HWCAP_USCAT;
 #endif
+#ifdef CONFIG_DARWIN
+    have_lse = sysctl_for_bool("hw.optional.arm.FEAT_LSE");
+    have_lse2 = sysctl_for_bool("hw.optional.arm.FEAT_LSE2");
+#endif
 
     tcg_target_available_regs[TCG_TYPE_I32] = 0xffffffffu;
     tcg_target_available_regs[TCG_TYPE_I64] = 0xffffffffu;
-- 
2.34.1


