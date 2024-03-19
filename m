Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247E4CD11DB
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 15:47:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rmbcl-0005TJ-CJ; Tue, 19 Mar 2024 11:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbch-0005RJ-RH
 for qemu-riscv@nongnu.org; Tue, 19 Mar 2024 11:43:31 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbcg-0004q5-2J
 for qemu-riscv@nongnu.org; Tue, 19 Mar 2024 11:43:31 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-414612cfd82so10849775e9.2
 for <qemu-riscv@nongnu.org>; Tue, 19 Mar 2024 08:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710863006; x=1711467806; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NgNkzc9TKRqSufr7q2jowH4Mnpr7+ZnLD1X9Wx4INOA=;
 b=r+Ok3maluSmr1kXNeSb6q+w2dnmADv5ccASjV8CDE+7/CC0JR+4XYf5Wx+pJsVAp5G
 7ycRFblmI+65NJGgSyctH+3RikgJPieiGOFOMC92Rw9oUVWGha3O8RK1fuT1+MhHcuil
 6BCvp1qe6w46x3+BfR8B0KmeOQFJ/NCYDnDcqwe/jdQC1S0X4O8ilL+WDKWdSN2P1FmW
 LVDW92fCzYsfUiiU0uJ3uxS2BZNHAFzDfkwDm2/Vv4yuQBGgmWGD3QUz0WB7neve9JSl
 aTJToG/YN9JQWmXigoStSc8u8eEI5rNtdzNgpNQjpn1IeAQvPeCzOo2F1mfR0i1sDIjb
 iHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710863006; x=1711467806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NgNkzc9TKRqSufr7q2jowH4Mnpr7+ZnLD1X9Wx4INOA=;
 b=YwHif6YTncJpDWdc6oLLMyrPxkA6aImK97RK8oM697QkWMBajAA/5cgBgGB5ecz4Gw
 UWgeNEl/T//p3ci1rCj361eXBomVefLO95Rp60cfYE4naCInl1035zYs+VfmSBiROKHf
 RTJujC9R3EYZdCmZ1p+zz603LxbqGiz/E+09Wuf2xCK+rY/MU9seTfI6LUgF9k+hQyUX
 jYVdENHBbKoFOBMKuZz7kf3lq5sjGlOYBU+Sp2zfCS5vJCYKiHrSbm29J2I+4HAgdlox
 aftkAY5/Db6FdHsGMv+LC14C96hh+r4Gp/FvvqOVMtbvJw6cNEkHyAbZai4z2Ra2QNoK
 9KIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+Ll5UluToSQYN9ic3a1gOhYRSmF7cUqgjw0uz7CyEgPKHzNZ93A3hKcEkVJLAndCjJFUqwatWBKuKcbRiKAHbE4N97sA=
X-Gm-Message-State: AOJu0YzhUUZ4l3h9yYkkAkFiBQbVH3CjRIQ8bLzf0YCsJ6QK5ipoqtaJ
 HTIAz9HgULmw2cMAvD6wt+bzP+ROw0UF7ow8hPyO1mHado7akqDemEPbvJEXXAY=
X-Google-Smtp-Source: AGHT+IE2A7Ne3Xv+NPuqwzhX6UCkG2MVJhIzcibLnCHb64ZEjijUDn77Dk2/i+vTzbH7t1AHT+wu1Q==
X-Received: by 2002:a05:600c:4f11:b0:414:1eb:3010 with SMTP id
 l17-20020a05600c4f1100b0041401eb3010mr2169239wmq.17.1710863006089; 
 Tue, 19 Mar 2024 08:43:26 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.129])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a05600c474900b0041408af4b34sm11116488wmo.10.2024.03.19.08.43.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 Mar 2024 08:43:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH-for-9.1 04/27] target/arm: Restrict TCG-specific declarations
Date: Tue, 19 Mar 2024 16:42:33 +0100
Message-ID: <20240319154258.71206-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240319154258.71206-1-philmd@linaro.org>
References: <20240319154258.71206-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/internals.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index dd3da211a3..087caaf2bd 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -346,13 +346,13 @@ void register_cp_regs_for_features(ARMCPU *cpu);
 void init_cpreg_list(ARMCPU *cpu);
 
 void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu);
+
+#ifdef CONFIG_TCG
 void arm_translate_init(void);
 
 void arm_restore_state_to_opc(CPUState *cs,
                               const TranslationBlock *tb,
                               const uint64_t *data);
-
-#ifdef CONFIG_TCG
 void arm_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
 #endif /* CONFIG_TCG */
 
-- 
2.41.0


