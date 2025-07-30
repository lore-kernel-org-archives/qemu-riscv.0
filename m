Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABD1C87FCB
	for <qemu-riscv@archiver.kernel.org>; Wed, 30 Jul 2025 22:07:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uhExA-0003VZ-PS; Wed, 30 Jul 2025 18:07:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEwY-0001Mi-3V
 for qemu-riscv@nongnu.org; Wed, 30 Jul 2025 18:06:39 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEwT-0002aj-Ar
 for qemu-riscv@nongnu.org; Wed, 30 Jul 2025 18:06:37 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2403c13cac3so11907515ad.0
 for <qemu-riscv@nongnu.org>; Wed, 30 Jul 2025 15:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753913192; x=1754517992; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+PKtO4hBsEfArhj2AB8+qMyobhZraHavtQ6DCILIAZI=;
 b=VVmeZynUli6YLYYyfNFPl88+C8nsIG+PAuASx8K0Wf8jRuebpK9H894p/HlsyILIXL
 GM0IF0fpfUkw0G3KR9BZQgjk08kmC0GKuiRHmbEhsAq7oJ9XsjG6WrRIqDzz/hwBhf4d
 971T130opaPVDd76X6QxIB3fPVJkw4t8tWk6iJyOtVDYNcjLBXGgLe4zOzkiIIFqjxB7
 APw/8dyMUeC8I1z/Gk3cVBNFljoo+M3yg3h0OE8J2k2QHyRnYwgpGkwi7dPmdgOUl/h8
 W/z4IZiOd+L296M98oRjPeK1K2nq659lRCcOu75Fl7MySFOBmHPsKBpZio8x3dKiZHKQ
 ve9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753913192; x=1754517992;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+PKtO4hBsEfArhj2AB8+qMyobhZraHavtQ6DCILIAZI=;
 b=aGjAzlj7UvJp6InagWxvAjGyQtWY0mETpDiqmbXDtgmQCGJwyPKArUXWVZrP6WFT50
 0Dw/sg3QR5o+Buhi2emOxCbmpD5B/H2fLLFU4dB5tI/CecKg9cAzl+OW+/6IrWFfsY+T
 UcKbo88D8uSILxHdi5Sf2MC1Nv/QxNIIFZxkfqbwnkR+X6ve3uaKmLCA8xh+Td4f/bzu
 6YD0UlefZZdgSOiy4cFUM54akaRoN8EbVoci1rDhIStsYgM4WaPwlEv8mXtFUwH8KQ8j
 gHuF+Bixx1SziRNTP2Ny9cBhRoLGuhL7f4FBGjJ8rTGs+QhDutIiEpTVvK450pV869d3
 Ig5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX2iluZbfrJNVlQ/3PTc1Eur3zMyDVebC0CQ+BfZ5etde9ZXPv9zECPMiu7y4xfX1atsiB4S63DvAw@nongnu.org
X-Gm-Message-State: AOJu0YzhPUhJBk3eCD1e3URiAubZk6GW2QkhGPVfuEnEXn95HVH9DXjJ
 Fvug3wwJ9X21JX4hptf+SwKJRa3PKKPFCCjw63RKrhxymSR/wbIkMq+Xt0x877ENK+k=
X-Gm-Gg: ASbGncsae4IUnGBG4m1RPp9/5tB03w+WWHVlGD1sD9djPzsTdN2IZzKFxeaTZ9hNkVA
 kyXH//zbJC+WMTY5P4iVYKHNEMGWYp3McTYwtnE+VygxJMcGFiUSMts2sNrXooeYaM2H1l4/weJ
 FEEjWOSO1/YmkZe46waZ5tkEkPl6hBiT08YnnkJkCV8PI0cGO3LCdAf988zbPCjLhJHOX66leUc
 KOFhaUGsWREIv1Qe65pLN4cK/96qwmf7X7QRsp20XN3a8/PCHBt3YfT1+cp0AlSLbCUA5kIlpff
 wJlv3da7D8F7WI8SVNicPK8v8XuJaLUOBIUw+w8jodM2WMnxKKE6LYOWyLQfbHvBDfht7xnpj4g
 UN8Trk1j4WDuXhO8EZJyR9vwses322gYd
X-Google-Smtp-Source: AGHT+IFvOkNzHTcNTJNkxpuo8280DakC6kEWLw6MgbaZ5HpWxqEasJQg4t762smu2GTOy1q9MomvUA==
X-Received: by 2002:a17:902:c70a:b0:240:72d8:96fa with SMTP id
 d9443c01a7336-24072d89c7cmr79565825ad.20.1753913191749; 
 Wed, 30 Jul 2025 15:06:31 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899d272sm981535ad.135.2025.07.30.15.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 15:06:31 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, philmd@linaro.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, richard.henderson@linaro.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 04/10] target/{arm,
 riscv}/common-semi-target: eradicate target_ulong
Date: Wed, 30 Jul 2025 15:06:15 -0700
Message-ID: <20250730220621.1142496-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250730220621.1142496-1-pierrick.bouvier@linaro.org>
References: <20250730220621.1142496-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We replace mechanically with uint64_t.
There is no semantic change, and allows us to extract a proper API from
this set of functions.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/common-semi-target.h   | 6 +++---
 target/riscv/common-semi-target.h | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/common-semi-target.h b/target/arm/common-semi-target.h
index 7ebd2136d93..b900121272c 100644
--- a/target/arm/common-semi-target.h
+++ b/target/arm/common-semi-target.h
@@ -12,7 +12,7 @@
 
 #include "target/arm/cpu-qom.h"
 
-static inline target_ulong common_semi_arg(CPUState *cs, int argno)
+static inline uint64_t common_semi_arg(CPUState *cs, int argno)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -23,7 +23,7 @@ static inline target_ulong common_semi_arg(CPUState *cs, int argno)
     }
 }
 
-static inline void common_semi_set_ret(CPUState *cs, target_ulong ret)
+static inline void common_semi_set_ret(CPUState *cs, uint64_t ret)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -39,7 +39,7 @@ static inline bool is_64bit_semihosting(CPUArchState *env)
     return is_a64(env);
 }
 
-static inline target_ulong common_semi_stack_bottom(CPUState *cs)
+static inline uint64_t common_semi_stack_bottom(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
diff --git a/target/riscv/common-semi-target.h b/target/riscv/common-semi-target.h
index 63bbcd2d5fa..2e6d6a659a3 100644
--- a/target/riscv/common-semi-target.h
+++ b/target/riscv/common-semi-target.h
@@ -11,14 +11,14 @@
 #ifndef TARGET_RISCV_COMMON_SEMI_TARGET_H
 #define TARGET_RISCV_COMMON_SEMI_TARGET_H
 
-static inline target_ulong common_semi_arg(CPUState *cs, int argno)
+static inline uint64_t common_semi_arg(CPUState *cs, int argno)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
     return env->gpr[xA0 + argno];
 }
 
-static inline void common_semi_set_ret(CPUState *cs, target_ulong ret)
+static inline void common_semi_set_ret(CPUState *cs, uint64_t ret)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
@@ -30,7 +30,7 @@ static inline bool is_64bit_semihosting(CPUArchState *env)
     return riscv_cpu_mxl(env) != MXL_RV32;
 }
 
-static inline target_ulong common_semi_stack_bottom(CPUState *cs)
+static inline uint64_t common_semi_stack_bottom(CPUState *cs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-- 
2.47.2


