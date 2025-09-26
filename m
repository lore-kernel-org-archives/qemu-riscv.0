Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69FACAC5BC
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Sep 2025 13:22:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v28LO-00087S-8U; Fri, 26 Sep 2025 09:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v28LL-00085g-1Q
 for qemu-riscv@nongnu.org; Fri, 26 Sep 2025 09:18:36 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v28Kw-00043V-04
 for qemu-riscv@nongnu.org; Fri, 26 Sep 2025 09:18:34 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-46e3cdc1a6aso5171605e9.1
 for <qemu-riscv@nongnu.org>; Fri, 26 Sep 2025 06:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758892676; x=1759497476; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y9d5BP7lns2PVAN5IYXcTxZLAWv4Unp9pZLQ6Ob5dbg=;
 b=t47cemEPBneKMQi5o6Lo94nnrGs/0dzsJqSaxK+4ZqC04jfXh1ZwYDfE/NjCO5la74
 +upLJju9/8CuuvY/lSo3i3T9BY6mufTH/so/y0xsz3GGLNNtAgY234NDSzUXRE0mF6uK
 5lzVoPFxHgoXQJGjxV9kE9FfkMDde1neryxDDUvFPzKvQcfHsAx/EwCqhzuNgRLle9AQ
 y1zlqNhAI7LsNulNQ9qvU9sTPQquRNQ+d7wUI75ah+GhLBYS95YWurSJchkC1sI4kCLt
 HcPBdhgl/kkk1LKWX8TylgakyjPUp2D+BIpUlZg29BnmyOxSuqDMDt/WyOwmV3UYPMOS
 T1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758892676; x=1759497476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y9d5BP7lns2PVAN5IYXcTxZLAWv4Unp9pZLQ6Ob5dbg=;
 b=ErlL8ejrzLZCmT2kdywYKt4WCKx8dkwN2EsuiJOWHZe+ozjwwa1nlvBlCjVtgZw6/H
 G3h/S2vI82bPK7mZjB+fj8/8Fo/rPkmDcsvAfgRN6vOY+XjaxQEQQrFEtUi+3OH27VVE
 00F5JimzVjajMvBf2LAG74iV515sPC3xPrC8EZW2prt1ktk/wJwDwPeB6XEL4aj0Svj1
 BI/1wi4pwWgV/ha9pmLceiV0jNpdsPlq0fldNvT61s4HFPKcyprguGeOFw80XXdd7fh5
 EQsPIDtyM2uMeZ5Izxw96iibToyXwwp5PZz2QyoQmAd8JkSS48tUTESAqt+vqxuyqcYk
 8ZAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGnNM5xsXR979gLQTViAzLSdIitmjGW9Fx8QVoEdZG0pEwu0exC6kFfbqd2aQ9Gkh7OoJJbKP8H8xt@nongnu.org
X-Gm-Message-State: AOJu0Ywo4HNW+/gA+B9pomZmhVfb7vikBl9aupgluEy1h5thoubfvPxd
 60//Gj4doeexo9GTqDiAmn0167b/4McDMBXa8tSiFv/yATsjGzhGpu+wuNBq7GVaQXs=
X-Gm-Gg: ASbGnctvzSUa0FW5UltQ4otL+I69j8wDkT0qaB5rJyEbVNcxprxp56zpKSRV1gYo6HT
 avrca0gpIkMhxKuK5UZCeXXRcOrmsqikmvPMBrxTil2Wp75r5qKqzfl+nNrVtPIRa80Dkuq7Toi
 yxOC+fnS2m3XfJPwBng8ROPdg/6qWKX4dRVe07L8YCLoxg3EWCwh/WaafPUHwQGlzDPEv/07P4d
 RR2NTHZdWnFSeatd1+uAXOs0ubVPGPuyvXmRfpZudoUUTlCgCWAjfM8j7I0EvJXaI1oBo852PEe
 c021jXgd2XGCoC9+/Hh3f4W0Vlbp491ICg2sV9RTtMRIvBIul05c5jTm4GwbWIJyAAWg1I2B5yg
 6O6hbc0IKncv9r3gajsslNoI=
X-Google-Smtp-Source: AGHT+IFwNCoKqYkvjcluvDzTRuZ7pHZpM0OcM0pWV5vpgzZePXa2ycPhSZfvL+o2DIY995dN+bIoBQ==
X-Received: by 2002:a05:600c:8b23:b0:458:b8b0:6338 with SMTP id
 5b1f17b1804b1-46e33c4bd45mr75387065e9.6.1758892675569; 
 Fri, 26 Sep 2025 06:17:55 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e42eee0b6sm6427805e9.10.2025.09.26.06.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 06:17:50 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7AE815F8E0;
 Fri, 26 Sep 2025 14:17:45 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs),
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PULL 08/24] target/{arm,
 riscv}/common-semi-target: eradicate target_ulong
Date: Fri, 26 Sep 2025 14:17:27 +0100
Message-ID: <20250926131744.432185-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250926131744.432185-1-alex.bennee@linaro.org>
References: <20250926131744.432185-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

We replace mechanically with uint64_t.
There is no semantic change, and allows us to extract a proper API from
this set of functions.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-ID: <20250822150058.18692-7-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-ID: <20250922093711.2768983-10-alex.bennee@linaro.org>

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


