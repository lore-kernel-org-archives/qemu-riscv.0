Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FF7CA0EEB
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 15:07:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1upTI3-0002Cv-HC; Fri, 22 Aug 2025 11:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1upTGr-0001pV-5k
 for qemu-riscv@nongnu.org; Fri, 22 Aug 2025 11:01:37 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1upTGY-00050N-SQ
 for qemu-riscv@nongnu.org; Fri, 22 Aug 2025 11:01:36 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-323267bc0a8so2574886a91.1
 for <qemu-riscv@nongnu.org>; Fri, 22 Aug 2025 08:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755874872; x=1756479672; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/NhduwSVHFJtmbAuoSXf5vp/8JFTbyhJo4xB/s950yU=;
 b=XtUWo35QSklJIjHCCAfytZS0pkBmgudg1gpCM3sLXZGNOrkcahXrHCH6iDERcJitxN
 rhNHzxwJHqWd3rJRBI8Vab/Oaju3G5XhQwNbNb3ohjkqJkCY3XFLNWVYQrK36xIg/tYX
 FsJNHdZJKAYfHfF2OCcRG/BwJ2QT4AezLG3Rf2NzNvaJmXq/Xc9aQlQ53Vi6fxRRR6uj
 OuzAwiDf/KVJpV1hrd/fTscIwJyrm0VJka5fuYEsRv51fHXiGQFZnq/LtFDZPyt+WOm/
 W435d89rWaMp0Srn4/9Fb42zons8eXXjKOXSIGxLXEY50xG0keTlRnm8lNRtrKcCcMol
 ZBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755874872; x=1756479672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/NhduwSVHFJtmbAuoSXf5vp/8JFTbyhJo4xB/s950yU=;
 b=bIwRJCHkmVFR42nXszdBdH4FbUdEI1lH4ntnt1zLIgV0NJ0Jb8bCHCUQkhfq4ZxciX
 5lf4ntUtWIVIxhDHYZn48jPN0/o+20Y3f40bDOBP+ny1+yBP8LL8DJNPqEtTiLn7VnYv
 C+4rcIz78RDLiqTTmBOLt53B4T46rPnCVyVZzHLYsE+FDBPIWlX6BjvooRa+oYMIvzMp
 Us1/KSpT/c84bFt0dUkzTEXSGB9tm+kC3YUrUxkA5W2H1KaY4BnyxZrJ9bMdkcxoS8ov
 yqJmSZanoWgpn/ovge+UdfPU/wUipdNgTONivc5YTwYajaB39AIQwi52gRoisz5ecYGy
 W1TQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVB1/vMBaU05TMi1jsFPgg43RVNol+ng7JwVXAN0HZsGe0EsRm828fThH479X9g+NE93riA+urABiqE@nongnu.org
X-Gm-Message-State: AOJu0YywHd6sk34oVYNWm/KUX1KmoFExsSvAynIFkcOoP6lCm+ELHmGt
 p1c3VcwxQJ3eMlTQEBwvFLl/D4oEj3JsMi1DXoXCuXgVyyoL0w+B8NgphM6CHvK54UA=
X-Gm-Gg: ASbGncuOxAa0G1ieDj56kW7gPUNUsFguaFWSTC9hBMuaEGNCmHLHLZj+l34UlKI9KIk
 DSbVlxCBtuxkBjr4TMzvqSEkWWlsLH3hwlMOOQ6n86Sr4BX9U+JEcZ1oz1fuCMdTo7+K9/SBbZS
 bnykjsZk/MiGsZ/1qcGV64emL5SY315rCDiLdiquABtxNxVRj1QA2G+KInY+28E32hQIo96/bfE
 ZniXEeL6X22jqSJQNOTXBMaCJ63GH+c7wUWUEtRpch6S9VJxHLc60JeuAqYWMqj+t5fDEKVDCNO
 0wmrLKo2RHAF5bhXcgpUQupKS1axoFhEM2f2TR+a6jVGbAQ04bgOke179uWl3NSjVM+go+LEbcv
 WapRB4L4XDagwepupKfb9bT2rPfzutVnQp665ONkMwL8=
X-Google-Smtp-Source: AGHT+IEJzCll6RqVE/5VCuu0Q08A66b23ZFkHXuRy5cswO7+hyICPJ+BAXHiwXuiwU+N+XGfMPopgA==
X-Received: by 2002:a17:903:230f:b0:242:8a7:6a6c with SMTP id
 d9443c01a7336-2462ee59160mr49861175ad.17.1755874871995; 
 Fri, 22 Aug 2025 08:01:11 -0700 (PDT)
Received: from pc.taild8403c.ts.net ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed5406e4sm85929495ad.165.2025.08.22.08.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 08:01:11 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org, richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, philmd@linaro.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 06/12] target/{arm,
 riscv}/common-semi-target: eradicate target_ulong
Date: Fri, 22 Aug 2025 08:00:52 -0700
Message-ID: <20250822150058.18692-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250822150058.18692-1-pierrick.bouvier@linaro.org>
References: <20250822150058.18692-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102a.google.com
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
2.47.2


