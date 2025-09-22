Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556F4CAC5A7
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 09:39:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v0d0o-0004bZ-U6; Mon, 22 Sep 2025 05:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0czd-0002Qw-V1
 for qemu-riscv@nongnu.org; Mon, 22 Sep 2025 05:38:03 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0cz9-0000f1-5R
 for qemu-riscv@nongnu.org; Mon, 22 Sep 2025 05:37:57 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b9edf4cf6cso3576353f8f.3
 for <qemu-riscv@nongnu.org>; Mon, 22 Sep 2025 02:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758533842; x=1759138642; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rN+UABDX33GElLhpMxpOfn/bxSt0jF+QLakS0yUkPiM=;
 b=csUCUzthCrfiTPGLeshqpcGSNkBzKLAskM6fghiccJrFkm/2d12UAN/TKuD+6FfmAE
 wGBQIpvZIbLrlnzSIpS29OvFn0SAlndx1Pu3sl3MpvfR7ZryuIAhk41MOWo6++snSVm2
 cG0/dWlkaWNYo3/ta0Ys5aF3w4Q8UmGHgrVq+VA2Zhft+fF3P38nt1APUf/jhXnsO+rG
 1Sd3lpL7ld95KphkXHr8OTNmRULKbBPzc0J2ALIvQ5UHB80dAay1hEalskXrmeL5RwH/
 FxGE1ClHbFBCmRJQUfTC6caba333PcbXJrgeOv/VMXMWR3zMQToMmotX65+VSQPzhwUa
 fAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758533842; x=1759138642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rN+UABDX33GElLhpMxpOfn/bxSt0jF+QLakS0yUkPiM=;
 b=FWWGSOtE729htjGxOr2NObecxZYkn/5c5IbSmAJbi5ChYnsAAn0sz5rC7j/WRvDLVk
 mwsghp74vtMDyzVeGQfveTyOeuc4T4iIRfnwVAgQX8+BK4a8NQVpcJb6wty0HqBqLyQE
 /Yb2EmLT8NIgm2QKxiLH7jn5eKAkr0gtB1Oq1050l3iuokwIhhjRlG5VR47sDwnUrvGA
 rn12XRi5JBt57ALxuyB209r3YNLD+arqc91JBZdyUlk6FG8rMhK+6OjYaUZ/knKqvd6u
 Wct1+wAb/rAmi/Yg3salws6SZLKDrifRbMspRvie9aJ/UN777deXTjYuMX3033NhLuur
 B1Cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZNqC1z9AnNnl/wRcRoln0HFmcRsVd6/WpczFLsLG4nytguwpHSuZV2rWqXTSGzELFVKk2IFvxaamH@nongnu.org
X-Gm-Message-State: AOJu0YytP9eEQLQlS8Kh8sEOR/0XH3wSzrzQFzD5/mtnIyJVGdAZtQJj
 qba8nczAyiyFPcDhUwXc2XGTYUvebl7TzXo1isWrqsolRKDmvs22g/GwqUk+LOVWZ6M=
X-Gm-Gg: ASbGncvUkfktmJxw/FfifCVTYdeCBklfcGq2/ec7mPumCYY66WGhTpMQZp6cQI2J6l7
 /m4OOViXspeNkySW1pfDnIrQlSeymDWZIxIPGVVLj+74wpsLBX9EROH/MP8fXBKp1HzLMfQvfaT
 mFwYGRwCtW2MjBbJw/OlojDiJwVfOWlC6IZbW4ju2EEHol4ZQLj6BVmxZsuqNoMLFUdqRnqXCK9
 kDWGxUW821ZdQSJTDQZwwS04ZNI8GqMW1f4KDBGu16Wykx8gZ6CtkfHXD92Q0byeA8ljiC5Keu1
 YxBN6s/KtssWTIC6FZfscyJ8I9/iJvX/nqUZCG4xSqzUVsD0pJFx35cpFHnEGlHxCS517+P97W8
 /4NfZZ3wu2NBTTDqcK/CDs6o=
X-Google-Smtp-Source: AGHT+IGXplVmD3OLqQHoKMQjJiyf0VDSnMaQcgJSVKAaJgaw9ilpZyoJrTJgqViPJpdsOBDUn8fHSA==
X-Received: by 2002:a05:6000:22c7:b0:3eb:df84:62e with SMTP id
 ffacd0b85a97d-3ee7c5535d9mr10926109f8f.3.1758533842377; 
 Mon, 22 Sep 2025 02:37:22 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee0fbd63a2sm19049094f8f.48.2025.09.22.02.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 02:37:17 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 683855F9FF;
 Mon, 22 Sep 2025 10:37:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 09/25] target/{arm,
 riscv}/common-semi-target: eradicate target_ulong
Date: Mon, 22 Sep 2025 10:36:54 +0100
Message-ID: <20250922093711.2768983-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250922093711.2768983-1-alex.bennee@linaro.org>
References: <20250922093711.2768983-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

We replace mechanically with uint64_t.
There is no semantic change, and allows us to extract a proper API from
this set of functions.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-ID: <20250822150058.18692-7-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/common-semi-target.h   | 6 +++---
 target/riscv/common-semi-target.h | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/common-semi-target.h b/target/arm/common-semi-target.h
index 7bb442f24ca..6775a270aaa 100644
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
@@ -44,7 +44,7 @@ static inline bool is_64bit_semihosting(CPUArchState *env)
     return is_a64(env);
 }
 
-static inline target_ulong common_semi_stack_bottom(CPUState *cs)
+static inline uint64_t common_semi_stack_bottom(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
diff --git a/target/riscv/common-semi-target.h b/target/riscv/common-semi-target.h
index 7e6ea8da02c..663dedfdad2 100644
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
@@ -35,7 +35,7 @@ static inline bool common_semi_sys_exit_is_extended(CPUState *cs)
     return is_64bit_semihosting(cpu_env(cs));
 }
 
-static inline target_ulong common_semi_stack_bottom(CPUState *cs)
+static inline uint64_t common_semi_stack_bottom(CPUState *cs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-- 
2.47.3


