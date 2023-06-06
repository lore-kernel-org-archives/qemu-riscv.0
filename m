Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEADC77B73
	for <qemu-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 14:14:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6XR9-00042N-9J; Tue, 06 Jun 2023 10:13:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6XR7-00041f-Iy
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 10:13:25 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6XR2-0005Va-24
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 10:13:25 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f7378a74faso23866695e9.0
 for <qemu-riscv@nongnu.org>; Tue, 06 Jun 2023 07:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686060799; x=1688652799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8UQAuFP30266AN4qnHJPcBraOFHFZpQqvUy0mONI7XQ=;
 b=aQhtZ/VW0S9+eY6cAy1aj8hGuZ+UDrJsPnpKCfEuEH9G9qe1sHiFEnaZ3d8O/cwqS5
 XyLasJA4JTUp1JDJyIaGF8lWI9Dv+GM5w/ufEGA1Ctkzg9gg8tVl4/aOqu3wzIfJnVOQ
 fZvk3r0JMAwwPv7PtdyfVbiBBoGRzdYsYoJ1QP/IQzV57Rweg1domcbJMdHH8Q6OX/6Y
 HTpcNEAK4H1cBQlmo19FmCcVJSLAiUsCpfByqlRpSK5QKnkgLZNeNRsBHagh5HgFAWgM
 3jCQ4ezFPw36XnamwrQHBJl/RqevfBJRpiG14AhTWjHysrj/hPxiGtc8MkmKiZZXFHnE
 67bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686060799; x=1688652799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8UQAuFP30266AN4qnHJPcBraOFHFZpQqvUy0mONI7XQ=;
 b=WRlP8r3zFXE06z1zBH7vNawt93j4sBXc48fMSAHZQOTuwAmKJwnN0s30QzOknUzRc0
 K7XFM2/XxJZt+1AsYrzQdBOi9K+Ll7cnTvfqwD7zA2QOl+Knz8yzorl9Krun9yrplK8w
 wphNgUvqxvPM8V0ySVoylbjM9//gddlQNk8Gvo9sv3XhLS6wbJi28LfShcms8PvS1sHL
 /uvaTE6q07fL1h+VBNAwMxL4g7i6fPuGBmFrqMvbEdTpuGlr8Gneu5K3jl6u9PZlo33v
 50PlJ12atOgepAHW6agnxdRtb1Axubm9mMVk33vx/rNRLTh2qzzn7WdH8itNXY2aAlHI
 uAgA==
X-Gm-Message-State: AC+VfDyC0l1W/G7yjayyk3JRSAw9glFvi+sEs8rabxVU8bRG26+8igsG
 Ae9wc8bm15ZXmZGJIexGCzmOcw==
X-Google-Smtp-Source: ACHHUZ7EyV1jXzA+PrCW2tOt/YlWsTavmgbtSJzkyybu/hSTnva6LlLDLIDutr4W3I3JWz4H8qRdVA==
X-Received: by 2002:a7b:cd08:0:b0:3f7:e4d7:4469 with SMTP id
 f8-20020a7bcd08000000b003f7e4d74469mr2220729wmj.41.1686060799304; 
 Tue, 06 Jun 2023 07:13:19 -0700 (PDT)
Received: from localhost.localdomain
 (vbo91-h01-176-184-50-104.dsl.sta.abo.bbox.fr. [176.184.50.104])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a1c7405000000b003f6f6a6e769sm14204324wmc.17.2023.06.06.07.13.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 06 Jun 2023 07:13:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 4/5] target: Rename per-target 'helper.h' -> 'helper.h.inc'
Date: Tue,  6 Jun 2023 16:12:51 +0200
Message-Id: <20230606141252.95032-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230606141252.95032-1-philmd@linaro.org>
References: <20230606141252.95032-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

Since commit 139c1837db ("meson: rename included C source files
to .c.inc"), QEMU standard procedure for included C files is to
use *.c.inc.

Besides, since commit 6a0057aa22 ("docs/devel: make a statement
about includes") this is documented as the Coding Style:

  If you do use template header files they should be named with
  the ``.c.inc`` or ``.h.inc`` suffix to make it clear they are
  being included for expansion.

Therefore rename the included 'helper.h' as 'helper.h.inc' for
all targets (updating the documentation).

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/devel/tcg-ops.rst                       | 2 +-
 include/exec/helper-gen.h                    | 2 +-
 include/exec/helper-proto.h                  | 2 +-
 target/alpha/{helper.h => helper.h.inc}      | 0
 target/arm/{helper.h => helper.h.inc}        | 0
 target/avr/{helper.h => helper.h.inc}        | 0
 target/cris/{helper.h => helper.h.inc}       | 0
 target/hexagon/{helper.h => helper.h.inc}    | 0
 target/hppa/{helper.h => helper.h.inc}       | 0
 target/i386/{helper.h => helper.h.inc}       | 0
 target/loongarch/{helper.h => helper.h.inc}  | 0
 target/m68k/{helper.h => helper.h.inc}       | 0
 target/microblaze/{helper.h => helper.h.inc} | 0
 target/mips/{helper.h => helper.h.inc}       | 0
 target/nios2/{helper.h => helper.h.inc}      | 0
 target/openrisc/{helper.h => helper.h.inc}   | 0
 target/ppc/{helper.h => helper.h.inc}        | 0
 target/riscv/{helper.h => helper.h.inc}      | 0
 target/rx/{helper.h => helper.h.inc}         | 0
 target/s390x/{helper.h => helper.h.inc}      | 0
 target/sh4/{helper.h => helper.h.inc}        | 0
 target/sparc/{helper.h => helper.h.inc}      | 0
 target/tricore/{helper.h => helper.h.inc}    | 0
 target/xtensa/{helper.h => helper.h.inc}     | 0
 target/alpha/translate.c                     | 2 +-
 target/arm/machine.c                         | 2 +-
 target/arm/tcg/translate.c                   | 2 +-
 target/avr/translate.c                       | 2 +-
 target/cris/translate.c                      | 2 +-
 target/hexagon/translate.c                   | 2 +-
 target/hppa/translate.c                      | 2 +-
 target/i386/tcg/translate.c                  | 2 +-
 target/loongarch/translate.c                 | 2 +-
 target/m68k/translate.c                      | 2 +-
 target/microblaze/translate.c                | 2 +-
 target/mips/tcg/translate.c                  | 2 +-
 target/nios2/translate.c                     | 2 +-
 target/openrisc/translate.c                  | 2 +-
 target/ppc/translate.c                       | 2 +-
 target/riscv/translate.c                     | 2 +-
 target/rx/translate.c                        | 2 +-
 target/s390x/tcg/translate.c                 | 2 +-
 target/sh4/translate.c                       | 2 +-
 target/sparc/translate.c                     | 2 +-
 target/tricore/translate.c                   | 2 +-
 target/xtensa/translate.c                    | 2 +-
 46 files changed, 25 insertions(+), 25 deletions(-)
 rename target/alpha/{helper.h => helper.h.inc} (100%)
 rename target/arm/{helper.h => helper.h.inc} (100%)
 rename target/avr/{helper.h => helper.h.inc} (100%)
 rename target/cris/{helper.h => helper.h.inc} (100%)
 rename target/hexagon/{helper.h => helper.h.inc} (100%)
 rename target/hppa/{helper.h => helper.h.inc} (100%)
 rename target/i386/{helper.h => helper.h.inc} (100%)
 rename target/loongarch/{helper.h => helper.h.inc} (100%)
 rename target/m68k/{helper.h => helper.h.inc} (100%)
 rename target/microblaze/{helper.h => helper.h.inc} (100%)
 rename target/mips/{helper.h => helper.h.inc} (100%)
 rename target/nios2/{helper.h => helper.h.inc} (100%)
 rename target/openrisc/{helper.h => helper.h.inc} (100%)
 rename target/ppc/{helper.h => helper.h.inc} (100%)
 rename target/riscv/{helper.h => helper.h.inc} (100%)
 rename target/rx/{helper.h => helper.h.inc} (100%)
 rename target/s390x/{helper.h => helper.h.inc} (100%)
 rename target/sh4/{helper.h => helper.h.inc} (100%)
 rename target/sparc/{helper.h => helper.h.inc} (100%)
 rename target/tricore/{helper.h => helper.h.inc} (100%)
 rename target/xtensa/{helper.h => helper.h.inc} (100%)

diff --git a/docs/devel/tcg-ops.rst b/docs/devel/tcg-ops.rst
index 6a166c5665..c74849a231 100644
--- a/docs/devel/tcg-ops.rst
+++ b/docs/devel/tcg-ops.rst
@@ -151,7 +151,7 @@ Types
 Helpers
 =======
 
-Helpers are registered in a guest-specific ``helper.h``,
+Helpers are registered in a guest-specific ``helper.h.inc``,
 which is processed to generate ``tcg_gen_helper_*`` functions.
 With these functions it is possible to call a function taking
 i32, i64, i128 or pointer types.
diff --git a/include/exec/helper-gen.h b/include/exec/helper-gen.h
index f7ec155699..fdb3ec39f5 100644
--- a/include/exec/helper-gen.h
+++ b/include/exec/helper-gen.h
@@ -9,7 +9,7 @@
 
 #include "exec/helper-gen-common.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-gen.h.inc"
 #undef  HELPER_H
 
diff --git a/include/exec/helper-proto.h b/include/exec/helper-proto.h
index 6935cb4f16..fd061749be 100644
--- a/include/exec/helper-proto.h
+++ b/include/exec/helper-proto.h
@@ -9,7 +9,7 @@
 
 #include "exec/helper-proto-common.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-proto.h.inc"
 #undef  HELPER_H
 
diff --git a/target/alpha/helper.h b/target/alpha/helper.h.inc
similarity index 100%
rename from target/alpha/helper.h
rename to target/alpha/helper.h.inc
diff --git a/target/arm/helper.h b/target/arm/helper.h.inc
similarity index 100%
rename from target/arm/helper.h
rename to target/arm/helper.h.inc
diff --git a/target/avr/helper.h b/target/avr/helper.h.inc
similarity index 100%
rename from target/avr/helper.h
rename to target/avr/helper.h.inc
diff --git a/target/cris/helper.h b/target/cris/helper.h.inc
similarity index 100%
rename from target/cris/helper.h
rename to target/cris/helper.h.inc
diff --git a/target/hexagon/helper.h b/target/hexagon/helper.h.inc
similarity index 100%
rename from target/hexagon/helper.h
rename to target/hexagon/helper.h.inc
diff --git a/target/hppa/helper.h b/target/hppa/helper.h.inc
similarity index 100%
rename from target/hppa/helper.h
rename to target/hppa/helper.h.inc
diff --git a/target/i386/helper.h b/target/i386/helper.h.inc
similarity index 100%
rename from target/i386/helper.h
rename to target/i386/helper.h.inc
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h.inc
similarity index 100%
rename from target/loongarch/helper.h
rename to target/loongarch/helper.h.inc
diff --git a/target/m68k/helper.h b/target/m68k/helper.h.inc
similarity index 100%
rename from target/m68k/helper.h
rename to target/m68k/helper.h.inc
diff --git a/target/microblaze/helper.h b/target/microblaze/helper.h.inc
similarity index 100%
rename from target/microblaze/helper.h
rename to target/microblaze/helper.h.inc
diff --git a/target/mips/helper.h b/target/mips/helper.h.inc
similarity index 100%
rename from target/mips/helper.h
rename to target/mips/helper.h.inc
diff --git a/target/nios2/helper.h b/target/nios2/helper.h.inc
similarity index 100%
rename from target/nios2/helper.h
rename to target/nios2/helper.h.inc
diff --git a/target/openrisc/helper.h b/target/openrisc/helper.h.inc
similarity index 100%
rename from target/openrisc/helper.h
rename to target/openrisc/helper.h.inc
diff --git a/target/ppc/helper.h b/target/ppc/helper.h.inc
similarity index 100%
rename from target/ppc/helper.h
rename to target/ppc/helper.h.inc
diff --git a/target/riscv/helper.h b/target/riscv/helper.h.inc
similarity index 100%
rename from target/riscv/helper.h
rename to target/riscv/helper.h.inc
diff --git a/target/rx/helper.h b/target/rx/helper.h.inc
similarity index 100%
rename from target/rx/helper.h
rename to target/rx/helper.h.inc
diff --git a/target/s390x/helper.h b/target/s390x/helper.h.inc
similarity index 100%
rename from target/s390x/helper.h
rename to target/s390x/helper.h.inc
diff --git a/target/sh4/helper.h b/target/sh4/helper.h.inc
similarity index 100%
rename from target/sh4/helper.h
rename to target/sh4/helper.h.inc
diff --git a/target/sparc/helper.h b/target/sparc/helper.h.inc
similarity index 100%
rename from target/sparc/helper.h
rename to target/sparc/helper.h.inc
diff --git a/target/tricore/helper.h b/target/tricore/helper.h.inc
similarity index 100%
rename from target/tricore/helper.h
rename to target/tricore/helper.h.inc
diff --git a/target/xtensa/helper.h b/target/xtensa/helper.h.inc
similarity index 100%
rename from target/xtensa/helper.h
rename to target/xtensa/helper.h.inc
diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 1f7dd078d8..1fd9c18262 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -30,7 +30,7 @@
 #include "exec/translator.h"
 #include "exec/log.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/arm/machine.c b/target/arm/machine.c
index fc4a4a4064..6d9afc5f00 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -462,7 +462,7 @@ static bool pmsav7_rnr_needed(void *opaque)
     CPUARMState *env = &cpu->env;
 
     /* For R profile cores pmsav7.rnr is migrated via the cpreg
-     * "RGNR" definition in helper.h. For M profile we have to
+     * "RGNR" definition in helper.h.inc. For M profile we have to
      * migrate it separately.
      */
     return arm_feature(env, ARM_FEATURE_M);
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index a68d3c7f6d..308f6a8513 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -29,7 +29,7 @@
 #include "cpregs.h"
 #include "exec/helper-proto.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/avr/translate.c b/target/avr/translate.c
index ef2edd7415..4205bf94b3 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -30,7 +30,7 @@
 #include "exec/log.h"
 #include "exec/translator.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/cris/translate.c b/target/cris/translate.c
index 1445cd8bb5..3b5686cbb0 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -37,7 +37,7 @@
 #include "exec/helper-gen.h"
 #include "exec/log.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index 708339198e..3d5c628885 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -33,7 +33,7 @@
 #include "genptr.h"
 #include "printinsn.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index d33813d173..f2e5ace845 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -29,7 +29,7 @@
 #include "exec/translator.h"
 #include "exec/log.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 5cf14311a6..61fa64efa7 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -34,7 +34,7 @@
 
 #include "exec/log.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 3146a2d4ac..fdbb9d25ea 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -23,7 +23,7 @@
 TCGv cpu_gpr[32], cpu_pc;
 static TCGv cpu_lladdr, cpu_llval;
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 551ef9e52a..8594313e8f 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -34,7 +34,7 @@
 #include "exec/log.h"
 #include "fpu/softfloat.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 7e7f837c63..ffb40421a0 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -31,7 +31,7 @@
 
 #include "exec/log.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 74af91e4f5..1dfffe1c6f 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -32,7 +32,7 @@
 #include "disas/disas.h"
 #include "fpu_helper.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index a365ad8293..6f81efe90b 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -34,7 +34,7 @@
 #include "qemu/qemu-print.h"
 #include "semihosting/semihost.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index 7760329e75..f5e8a25977 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -34,7 +34,7 @@
 
 #include "exec/log.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 37fd431870..598759f813 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -41,7 +41,7 @@
 #include "qemu/qemu-print.h"
 #include "qapi/error.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 933b11c50d..e27df3c9af 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -33,7 +33,7 @@
 #include "instmap.h"
 #include "internals.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/rx/translate.c b/target/rx/translate.c
index 08cabbde61..5b60082749 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -28,7 +28,7 @@
 #include "exec/translator.h"
 #include "exec/log.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 7c549cd8d0..7db663c915 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -45,7 +45,7 @@
 #include "exec/log.h"
 #include "qemu/atomic128.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 49c87d7a01..df4c721cee 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -29,7 +29,7 @@
 #include "exec/log.h"
 #include "qemu/qemu-print.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index bad2ec90a0..99efd3ae87 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -33,7 +33,7 @@
 #include "exec/log.h"
 #include "asi.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 8e4f99478c..ed40a2c8ef 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -33,7 +33,7 @@
 #include "exec/translator.h"
 #include "exec/log.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index b7386ff0f0..68495fc983 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -45,7 +45,7 @@
 
 #include "exec/log.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
-- 
2.38.1


