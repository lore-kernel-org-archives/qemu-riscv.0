Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E265FC5AD59
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 01:34:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wssQL-0000Sz-TR; Sat, 08 Aug 2026 21:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wssQJ-0000Rl-VN
 for qemu-riscv@nongnu.org; Sat, 08 Aug 2026 21:33:59 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wssQH-0002Oh-PZ
 for qemu-riscv@nongnu.org; Sat, 08 Aug 2026 21:33:59 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-3811f512167so1115394a91.3
 for <qemu-riscv@nongnu.org>; Sat, 08 Aug 2026 18:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786239236; x=1786844036; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dWl2kF+BI1wwEWisHRuE5gHiRiAwOOJORcz274ON1PI=;
 b=vzoKRK+TUYMFypegU1M9VojcwQuV6IGY/7NH8vwLL7IrtYxsRqBhJVZXlW1qRMzCPF
 yFZQLnEUY+4bpMCdx5FmVyKgcKhWwqkKbGo67eC4CMIFiHjc3PCSbSA8YALCxoS6VoZf
 8JL30lJ3dzV0Xd+CpoUxOOT1k258FpEiILn7qrPD/mHLvTThuP/eAty3tUigCQpKh2Mh
 UJMnx5pxtRzsiVdB5P/ojT3bN+DYMI0dc8v0eHxLA+Ub7k9gBKgfPHyTaPQUkerGpb3/
 pOBKyprydf4bqDwloknFUo7lQP6a+0x4kSZQEaH/HYodTLPgZdxCZ90wPRXDVUOceAQO
 EQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786239236; x=1786844036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=dWl2kF+BI1wwEWisHRuE5gHiRiAwOOJORcz274ON1PI=;
 b=DvaX0wojBIOfu0zbJbLx0najq3wb4c5A1fFNDocUX6fUETeN23gzsUj4nBpXepsVXz
 Vmu1gJbWwDNXwtNmO2ImhrPIO1ucyydTefixTy8RwfeMc469NBRjL9iONnT1jNbG0Dvr
 CLNQFT7nefoemQ2Oj+NnUn/wf/uWlYno5b9JtJ2Cn+yAufqEBl/lYG75Ms+UhHO9Lwc2
 9SzhXmrG0Bd5sNat6iR+/xMJBgicaC5m87WXviryESqD3+pimaWfOH51+8+xHELzOFDO
 6/ytnpqy0hE6330NWMLup6fxUdP4uZGjNiTO0NyPA6o1CqGUPeCideKZ6kRmoFnU2yKx
 rchQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RriZp95aczs+oa+/5l6cPb21iL29R436s4Nu52jeO3SZ5Q47vqbzyJYvy/9y76mtqHQGtTFnEm8aYUl@nongnu.org
X-Gm-Message-State: AOJu0Yy09YZ8aDyKWvQv5QtsLaPPoCGQnSdWP1u3bJnBs4xAFOiC8FRJ
 nLYUlkU+qQirMOcMthwGv8EW1X/EITpyiEQhxkk6ojkVd8dGD3bu/iPqeAKvcR5rbWA=
X-Gm-Gg: AR+sD11mG4yhNFtHYPIewAkZ+6go8c9qyvxiRY49FyESqZbNLFi3AG2FjgUGotMYvXl
 9ZS+O84y0GzEWAE1lReYs7OmHqVgi0C5vTfbMAQtIGwn0GDbseFT693I8UkxuiLCRrbmV+c1GCq
 BJx6GP8R526TLqlbQm3D+66C61XkLAt2jYXjzQ7bGGrWO9V7hA+7p0M1/8V1EAUudxvj1hYQgQK
 8yeYPYolKzKU+c00WpiK9WRk22e44qq/kBirfrwpe5Senn36m/DwxaUoyxOx3kt9+Mo+uBfA7+V
 KjAbufljBqonk+Ma3Kx9UZCNKWJwYVq38z69wQIoBGtjue3vWTeiJFkfCpyJm+BUPy2c3m0esLE
 FtzVkGLzYke8KDvOllZ5jo7LXMlir9SEjQEI+8FwcVTKlfihVa1DdFpMRdGWZ1VnzrFXBLlFSnJ
 M6C3BGWoHkTTrvrcI0di+kobPezPSYPgPLQN0l3uAUaj4VVAtUrNxc3HSdpFJSzrg9xoi62Folr
 +UVQGDMhkQ+SbbgwvF7
X-Received: by 2002:a17:90b:5683:b0:38e:6aa7:68ad with SMTP id
 98e67ed59e1d1-3903c54fbc4mr33971012a91.5.1786239236257; 
 Sat, 08 Aug 2026 18:33:56 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39085de8ddcsm10067927a91.6.2026.08.08.18.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Aug 2026 18:33:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: 17746591750@163.com, laurent@vivier.eu, philmd@mailo.com,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH 9/9] target/mips: Enable disassembly via capstone
Date: Sat,  8 Aug 2026 18:33:43 -0700
Message-ID: <20260809013343.664966-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809013343.664966-1-richard.henderson@linaro.org>
References: <20260809013343.664966-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/disas/capstone.h | 24 ++++++++++++++--
 target/mips/cpu.c        | 60 +++++++++++++++++++++++++++++++++++++---
 2 files changed, 77 insertions(+), 7 deletions(-)

diff --git a/include/disas/capstone.h b/include/disas/capstone.h
index 3d6f90d816..e72faf8179 100644
--- a/include/disas/capstone.h
+++ b/include/disas/capstone.h
@@ -29,6 +29,7 @@
 #define CS_MODE_THUMB            0
 #define CS_MODE_MCLASS           0
 #define CS_MODE_V8               0
+#define CS_MODE_V9               0
 #define CS_MODE_M68K_000         0
 #define CS_MODE_M68K_010         0
 #define CS_MODE_M68K_020         0
@@ -36,11 +37,10 @@
 #define CS_MODE_M68K_040         0
 #define CS_MODE_M68K_060         0
 #define CS_MODE_MICRO            0
+#define CS_MODE_MIPS2            0
 #define CS_MODE_MIPS3            0
-#define CS_MODE_MIPS32R6         0
-#define CS_MODE_MIPSGP64         0
-#define CS_MODE_V9               0
 #define CS_MODE_MIPS32           0
+#define CS_MODE_MIPS32R6         0
 #define CS_MODE_MIPS64           0
 
 #endif /* CONFIG_CAPSTONE */
@@ -64,6 +64,24 @@
 #define CS_MODE_M68K_CF_FPU      0
 #endif
 
+#if CS_API_MAJOR < 6
+#define CS_MODE_MIPS16           0
+#define CS_MODE_MIPS1            0
+#define CS_MODE_MIPS32R2         0
+#define CS_MODE_MIPS32R3         0
+#define CS_MODE_MIPS32R5         0
+#define CS_MODE_MIPS4            0
+#define CS_MODE_MIPS5            0
+#define CS_MODE_MIPS64R2         0
+#define CS_MODE_MIPS64R3         0
+#define CS_MODE_MIPS64R5         0
+#define CS_MODE_MIPS64R6         0
+#define CS_MODE_OCTEON           0
+#define CS_MODE_OCTEONP          0
+#define CS_MODE_NANOMIPS         0
+#define CS_MODE_MIPS_PTR64       0
+#endif
+
 #if CS_API_MAJOR < 5
 #define CS_ARCH_RISCV           -1
 #define CS_MODE_RISCV32          0
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index d72044aef6..7c1e4827b9 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -30,6 +30,7 @@
 #include "system/qtest.h"
 #include "hw/core/qdev-properties.h"
 #include "hw/core/qdev-clock.h"
+#include "disas/capstone.h"
 #include "fpu_helper.h"
 #ifndef CONFIG_USER_ONLY
 #include "semihosting/semihost.h"
@@ -488,15 +489,66 @@ static void mips_cpu_disas_set_info(const CPUState *cs, disassemble_info *info)
 {
     const MIPSCPU *cpu = MIPS_CPU(cs);
     const CPUMIPSState *env = &cpu->env;
+    bool is64 = env->hflags & MIPS_HFLAG_64;
+    int cap_mode = 0;
 
-    if (!(env->insn_flags & ISA_NANOMIPS32)) {
+    if (env->insn_flags & ISA_NANOMIPS32) {
+        info->print_insn = print_insn_nanomips;
+        info->endian = BFD_ENDIAN_LITTLE;
+        /* nanomips has 16, 32 and 48-bit insns */
+        info->cap_insn_unit = 2;
+        info->cap_insn_split = 6;
+        cap_mode = CS_MODE_NANOMIPS;
+    } else {
         info->endian = TARGET_BIG_ENDIAN ? BFD_ENDIAN_BIG
                                          : BFD_ENDIAN_LITTLE;
         info->print_insn = TARGET_BIG_ENDIAN ? print_insn_big_mips
                                              : print_insn_little_mips;
-    } else {
-        info->print_insn = print_insn_nanomips;
-        info->endian = BFD_ENDIAN_LITTLE;
+
+        if (env->hflags & MIPS_HFLAG_M16) {
+            cap_mode = (env->insn_flags & ASE_MICROMIPS
+                        ? CS_MODE_MICRO : CS_MODE_MIPS16);
+            /* Beware unsupported capstone mode */
+            if (cap_mode == 0) {
+                return;
+            }
+            info->cap_insn_unit = 2;
+        } else {
+            info->cap_insn_unit = 4;
+        }
+        info->cap_insn_split = 4;
+
+        cap_mode |= is64 ? CS_MODE_MIPS64 : CS_MODE_MIPS32;
+        if (env->insn_flags & ISA_MIPS_R6) {
+            cap_mode |= is64 ? CS_MODE_MIPS64R6 : CS_MODE_MIPS32R6;
+        } else if (env->insn_flags & ISA_MIPS_R5) {
+            cap_mode |= is64 ? CS_MODE_MIPS64R5 : CS_MODE_MIPS32R5;
+        } else if (env->insn_flags & ISA_MIPS_R3) {
+            cap_mode |= is64 ? CS_MODE_MIPS64R3 : CS_MODE_MIPS32R3;
+        } else if (env->insn_flags & ISA_MIPS_R2) {
+            cap_mode |= is64 ? CS_MODE_MIPS64R2 : CS_MODE_MIPS32R2;
+        } else if (env->insn_flags & ISA_MIPS5) {
+            cap_mode |= CS_MODE_MIPS5;
+        } else if (env->insn_flags & ISA_MIPS4) {
+            cap_mode |= CS_MODE_MIPS4;
+        } else if (env->insn_flags & ISA_MIPS3) {
+            cap_mode |= CS_MODE_MIPS3;
+        } else if (env->insn_flags & ISA_MIPS2) {
+            cap_mode |= CS_MODE_MIPS2;
+        } else if (env->insn_flags & ISA_MIPS1) {
+            cap_mode |= CS_MODE_MIPS1;
+        }
+        if (env->insn_flags & INSN_OCTEON) {
+            cap_mode |= CS_MODE_OCTEON | CS_MODE_OCTEONP;
+        }
+        if (is64 && !(env->hflags & MIPS_HFLAG_AWRAP)) {
+            cap_mode |= CS_MODE_MIPS_PTR64;
+        }
+    }
+    /* Beware unsupported capstone mode */
+    if (cap_mode) {
+        info->cap_arch = CS_ARCH_MIPS;
+        info->cap_mode = cap_mode;
     }
 }
 
-- 
2.43.0


