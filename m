Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51FDC87FCA
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Aug 2025 23:34:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uhzBx-0003kP-RR; Fri, 01 Aug 2025 19:29:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhz8u-0007Sv-Pw
 for qemu-riscv@nongnu.org; Fri, 01 Aug 2025 19:26:29 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhz8q-0005wF-JF
 for qemu-riscv@nongnu.org; Fri, 01 Aug 2025 19:26:28 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-313910f392dso1268104a91.2
 for <qemu-riscv@nongnu.org>; Fri, 01 Aug 2025 16:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754090782; x=1754695582; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=891inftKOdhey3sFn9UdQanwKebbfZAQKRLupw103tU=;
 b=QL+7DQjgbFxSdgTGjmpHLfi2rWIqmcnNhIOV1LYbwIxrfWJuU3/G2j+MWoFNSv6fuP
 pmNWK6sfL4TpEqNH3XFkce8VQgd+a5GntuTrQ5AGZw7SnRIzd8fGiDmiwoZVa3moRq7e
 bMjhhMGfQvvzC0EieBmz+tPXk9w1J5cP1bFsm5QBvEjGYdwqoAwSUtvj0IGXhIbKkPeW
 zEC9vhaTufKOXWaFNFizI0i0M8XBeDEAlDUl5456Z5O8038s5xZWnBf7an5uta144hMu
 0UjXbsXX0A30P+jbq1ADCGyILMT7tbNtTPogAiwJFEJUxZJjScn4CpNzCWF7o24cLbWL
 rB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754090782; x=1754695582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=891inftKOdhey3sFn9UdQanwKebbfZAQKRLupw103tU=;
 b=XPqEHyKaSYg5SbdUVcvJK7H7OWyNxRq0FM9n4JfgVHRDmxwcEe5UqbSVmTM86Wjikw
 JXntAtPq/1EMELa2VWWA5ysIGawn+YEfs7brEQjqETju+mRs71jQj4o87h5WO3UhbxCU
 XYaGZA4bSYNIz/9fhKZs6ha0t8xBVb4itza9H3FLIHeAigbC3wOufe6eNYCllV8deSGg
 hxHYqXoATtulbeg5aNSV2b99zJ3etiThMTxiGvOB3XiFZQMm2UZQJ1hUF2ET+ZNimsIV
 FnQofv6w/2SRFzt9mIGyp2BJ4Ua8CjA8v7H28D0koWnw1LeVrYSLDx90j5YnvJKX0LEP
 61wQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUn4lg9620PXIo8VCZP8+JdjUG6dtXrjuR6+S97povuC4e+0LA8H1isRnynxRDGYEcNjCxJGzjCxdR2@nongnu.org
X-Gm-Message-State: AOJu0Yya5XgngDGe9FN3u1334HQwF4xhmPh/UHn7GObkKOfZa+ZcMEo3
 wf3OkRiBXp9/oKM5OmOzGDHByY830k12vyG6M0G/z4qTVir7QH0I/d9oPEujAT8d9n/SERtWaJ8
 uGHG6Zu8=
X-Gm-Gg: ASbGncvWhXqVrOnVQfRidlQEc4snZxrTCqg9qeUjViQEXoMjpAXbCq8R8tEzJQiBZNG
 7RlsqwsDlS4/8xWCVqaHY3UolBQAq1xh2wneGq/ZSHCZwrLgio/Ve6R16xZ3bgbCCYM+WlwfIRK
 H2J5P1YBeoo2EWMCaFL0vKhMch8MfQMQxKNxg7IGHHQkYKgBCURni1WVxfLUO5WUe8zfVHaQ+yR
 NuIGWswz5IcqR3CADT3pzJpGglSrn/8gngKRgyNNEX3czGDAwg6/mv1Mz+33yTFGbB9kAgD1CXV
 oAA5MNgZjv5ohx0LgeahRm4zTkCvlXZPedx7+m/tczrFtVawbTtGMEXCRdd0JZF1iUBFg75wI5/
 97mqYrIHBnTE7emBPFg41fs24ODsyl/RA
X-Google-Smtp-Source: AGHT+IGmYipqmpxEtASa/avLaJh40RAU9aY60Z7HLO5dSmByyj2neLGqTYGsncyN1sDyCRHVP5BLlg==
X-Received: by 2002:a17:90b:53cf:b0:31f:ca:63cd with SMTP id
 98e67ed59e1d1-321161d9cfamr2006709a91.2.1754090781912; 
 Fri, 01 Aug 2025 16:26:21 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3207eca6d3asm5628217a91.23.2025.08.01.16.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 16:26:21 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, richard.henderson@linaro.org,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 06/11] include/semihosting/common-semi: extract common_semi
 API
Date: Fri,  1 Aug 2025 16:26:04 -0700
Message-ID: <20250801232609.2744557-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250801232609.2744557-1-pierrick.bouvier@linaro.org>
References: <20250801232609.2744557-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We transform target/{arm,riscv}/common-semi-target.h headers to proper
compilation units, and use them in arm-compat-semi.c.

This way, we can include only the declaration header (which is target
agnostic), and selectively link the appropriate implementation based on
current target.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/semihosting/common-semi.h              |  5 +++++
 semihosting/arm-compat-semi.c                  |  3 +--
 ...mmon-semi-target.h => common-semi-target.c} | 18 ++++++++----------
 ...mmon-semi-target.h => common-semi-target.c} | 17 ++++++++---------
 target/arm/meson.build                         |  4 ++++
 target/riscv/meson.build                       |  4 ++++
 6 files changed, 30 insertions(+), 21 deletions(-)
 rename target/arm/{common-semi-target.h => common-semi-target.c} (66%)
 rename target/riscv/{common-semi-target.h => common-semi-target.c} (60%)

diff --git a/include/semihosting/common-semi.h b/include/semihosting/common-semi.h
index 0a91db7c414..9b8524dca13 100644
--- a/include/semihosting/common-semi.h
+++ b/include/semihosting/common-semi.h
@@ -35,5 +35,10 @@
 #define COMMON_SEMI_H
 
 void do_common_semihosting(CPUState *cs);
+uint64_t common_semi_arg(CPUState *cs, int argno);
+void common_semi_set_ret(CPUState *cs, uint64_t ret);
+bool is_64bit_semihosting(CPUArchState *env);
+uint64_t common_semi_stack_bottom(CPUState *cs);
+bool common_semi_has_synccache(CPUArchState *env);
 
 #endif /* COMMON_SEMI_H */
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index ef57d7205c8..e44e910696b 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -174,8 +174,7 @@ static LayoutInfo common_semi_find_bases(CPUState *cs)
 
 #endif
 
-#include "cpu.h"
-#include "common-semi-target.h"
+#include "semihosting/common-semi.h"
 
 /*
  * Read the input value from the argument block; fail the semihosting
diff --git a/target/arm/common-semi-target.h b/target/arm/common-semi-target.c
similarity index 66%
rename from target/arm/common-semi-target.h
rename to target/arm/common-semi-target.c
index b900121272c..bad33a711d7 100644
--- a/target/arm/common-semi-target.h
+++ b/target/arm/common-semi-target.c
@@ -7,12 +7,12 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
-#ifndef TARGET_ARM_COMMON_SEMI_TARGET_H
-#define TARGET_ARM_COMMON_SEMI_TARGET_H
-
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "semihosting/common-semi.h"
 #include "target/arm/cpu-qom.h"
 
-static inline uint64_t common_semi_arg(CPUState *cs, int argno)
+uint64_t common_semi_arg(CPUState *cs, int argno)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -23,7 +23,7 @@ static inline uint64_t common_semi_arg(CPUState *cs, int argno)
     }
 }
 
-static inline void common_semi_set_ret(CPUState *cs, uint64_t ret)
+void common_semi_set_ret(CPUState *cs, uint64_t ret)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -34,22 +34,20 @@ static inline void common_semi_set_ret(CPUState *cs, uint64_t ret)
     }
 }
 
-static inline bool is_64bit_semihosting(CPUArchState *env)
+bool is_64bit_semihosting(CPUArchState *env)
 {
     return is_a64(env);
 }
 
-static inline uint64_t common_semi_stack_bottom(CPUState *cs)
+uint64_t common_semi_stack_bottom(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
     return is_a64(env) ? env->xregs[31] : env->regs[13];
 }
 
-static inline bool common_semi_has_synccache(CPUArchState *env)
+bool common_semi_has_synccache(CPUArchState *env)
 {
     /* Ok for A64, invalid for A32/T32 */
     return is_a64(env);
 }
-
-#endif
diff --git a/target/riscv/common-semi-target.h b/target/riscv/common-semi-target.c
similarity index 60%
rename from target/riscv/common-semi-target.h
rename to target/riscv/common-semi-target.c
index 2e6d6a659a3..7ac8b9164ee 100644
--- a/target/riscv/common-semi-target.h
+++ b/target/riscv/common-semi-target.c
@@ -8,38 +8,37 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
-#ifndef TARGET_RISCV_COMMON_SEMI_TARGET_H
-#define TARGET_RISCV_COMMON_SEMI_TARGET_H
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "semihosting/common-semi.h"
 
-static inline uint64_t common_semi_arg(CPUState *cs, int argno)
+uint64_t common_semi_arg(CPUState *cs, int argno)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
     return env->gpr[xA0 + argno];
 }
 
-static inline void common_semi_set_ret(CPUState *cs, uint64_t ret)
+void common_semi_set_ret(CPUState *cs, uint64_t ret)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
     env->gpr[xA0] = ret;
 }
 
-static inline bool is_64bit_semihosting(CPUArchState *env)
+bool is_64bit_semihosting(CPUArchState *env)
 {
     return riscv_cpu_mxl(env) != MXL_RV32;
 }
 
-static inline uint64_t common_semi_stack_bottom(CPUState *cs)
+uint64_t common_semi_stack_bottom(CPUState *cs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
     return env->gpr[xSP];
 }
 
-static inline bool common_semi_has_synccache(CPUArchState *env)
+bool common_semi_has_synccache(CPUArchState *env)
 {
     return true;
 }
-
-#endif
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 07d9271aa4d..688b50a2e26 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -27,12 +27,16 @@ arm_user_ss.add(files(
   'helper.c',
   'vfp_fpscr.c',
 ))
+arm_user_ss.add(when: 'CONFIG_ARM_COMPATIBLE_SEMIHOSTING',
+		        if_true: files('common-semi-target.c'))
 
 arm_common_system_ss.add(files('cpu.c'))
 arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
   'cpu32-stubs.c'))
 arm_common_system_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
 arm_common_system_ss.add(when: 'CONFIG_HVF', if_false: files('hvf-stub.c'))
+arm_common_system_ss.add(when: 'CONFIG_ARM_COMPATIBLE_SEMIHOSTING',
+		                 if_true: files('common-semi-target.c'))
 arm_common_system_ss.add(files(
   'arch_dump.c',
   'arm-powerctl.c',
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index a4bd61e52a9..fdefe88ccdd 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -8,6 +8,10 @@ gen = [
 
 riscv_ss = ss.source_set()
 riscv_ss.add(gen)
+
+riscv_ss.add(when: 'CONFIG_ARM_COMPATIBLE_SEMIHOSTING',
+		     if_true: files('common-semi-target.c'))
+
 riscv_ss.add(files(
   'cpu.c',
   'cpu_helper.c',
-- 
2.47.2


