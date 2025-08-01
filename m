Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76286C87FCA
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Aug 2025 23:32:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uhzAE-0000Ps-7S; Fri, 01 Aug 2025 19:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhz8s-0007Ok-HO
 for qemu-riscv@nongnu.org; Fri, 01 Aug 2025 19:26:26 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhz8o-0005vW-FZ
 for qemu-riscv@nongnu.org; Fri, 01 Aug 2025 19:26:26 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-31ec651c2a1so1229811a91.0
 for <qemu-riscv@nongnu.org>; Fri, 01 Aug 2025 16:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754090781; x=1754695581; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cQuwaBAbAuk9qmyrSkI93s39oZy/p5JMj/k+RbBPzVI=;
 b=dtGdeBpDCA4X8KpTilU3yvbwzrUXPo/sH02e6LeBa1PVVw6xfWNmrqDqVWd6K1vNuv
 ZqDZyzGDvgRxojB27+z2qdHXH4d2Kiw8wVPpqF3CNMSL8gvTFh8x+jMfCfCwkxkctbg4
 nEpIv1H915H5L5U9vUY2060ZdapPuNBSZu0ZVw2AG4x2STYWyUtEbIzyBYXQPaElV/sM
 ihlaxPCH09khlg9wpbQoo9JbR8+2z83q+r6dwANOkDaZHD6YnhWLk3KSMSTWB8mIJDN9
 JEBE7KR9LAWGdLbtLeVws0KsTFgAE249xrTNr3w+Tx7BEUGdzV7MVZud+DNu37t6LcWx
 j04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754090781; x=1754695581;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cQuwaBAbAuk9qmyrSkI93s39oZy/p5JMj/k+RbBPzVI=;
 b=INC2fZxgA3V3ByuHzIsIgetjAVyoR+/qEYLhid9+9DqmcB6GB7JaWyyBgEm+B96cdz
 /gjk7sQh13vkhLlRVQm8rqTF/6OUnoit+lE+NEvRxusfHEPhWOFarokpfDtCjHvQ8vx/
 28jElU3D+X3yGZxkuakO9E+HBruxviUP6bs17psl8JN16yk9BkC3+R1qt57k2/gCMwqL
 ysCrn8BuVCt88feP1xRT2BZJ5BHOemJ5Pxl//PfPfdlscdofUWDtqToLqkMfMwoseUfL
 jXJFROFVv+Kq8BtWwfhxUaNx+0hZcKmP5qgYVR0bi7K9+1S2p5tBhlDFeahBnI6xjhjL
 yXGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6Lr9xbZjX1YAnY0WK5Q/1NUNTQNkfPBn/QhJkrAlRR2NzmLlMJkYwEvegjSw8rieWyBZbsjxVGsPf@nongnu.org
X-Gm-Message-State: AOJu0YxKba18o8ASlNNTxFqThavWZ0ieX95QY/mfJjAXYgHwrbp74LXu
 bx/RfYY0rpO7gjuaTSf8cNyWiQySUjAbuaje+TGjYqiqicyOp9i6BhkGqp+w1qagjoc=
X-Gm-Gg: ASbGncvPtydiOktTx9GBVleic8kdd0eO8cxIoPNxx95rq5oPFg+lc0RYJLeUlIwfx8R
 Ag98xpuZYM5+bWptzGbCl+5ReW+VmygLfRVthwar+9fkD1lWGLaJiwnXv9t9HIBMTJs3+o+1nk4
 l3+VGd5mSzVIsABXUoxf5G3dmb/yD+uK0DDB+gn4HjtzGmFZSnBFYJhtZGBinflf0UbGx96sNAI
 DwZttwt5ypUdrlAh7EaFZqFp+EkG//fon0GRXITQmd2btQBzn8FZXQlAzytpyliGILtBm+5ZPwI
 9cgHN+jcrqk3H/Pg72gg5D1LFeutQ92h5jnEybwkzu2rMMCsDWy/DSROedg7gNhOBvf86vCtCi4
 HzIC92sCesnLIsBYIlz3UGg==
X-Google-Smtp-Source: AGHT+IELi1GuD7HN7+e5q+5mGfavDBZrg/CKqKydPsQcMxn5dZq9OuclZrVFJ28z/QXTDCI/9bstqQ==
X-Received: by 2002:a17:90b:3ec2:b0:311:ff02:3fcc with SMTP id
 98e67ed59e1d1-32116210418mr2235579a91.14.1754090780986; 
 Fri, 01 Aug 2025 16:26:20 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3207eca6d3asm5628217a91.23.2025.08.01.16.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 16:26:20 -0700 (PDT)
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
Subject: [PATCH v2 05/11] target/{arm,
 riscv}/common-semi-target: eradicate target_ulong
Date: Fri,  1 Aug 2025 16:26:03 -0700
Message-ID: <20250801232609.2744557-6-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250801232609.2744557-1-pierrick.bouvier@linaro.org>
References: <20250801232609.2744557-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1035.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


