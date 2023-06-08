Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3935DC7EE23
	for <qemu-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 13:33:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7Fk1-0001hu-FK; Thu, 08 Jun 2023 09:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q7Fjs-0001aw-EA
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 09:31:45 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q7Fjp-0005rj-JM
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 09:31:44 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-30e3caa6aa7so655057f8f.1
 for <qemu-riscv@nongnu.org>; Thu, 08 Jun 2023 06:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686231100; x=1688823100;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ka4gQMrNU71yCnx4mXC3BxyVl7nhdDcW2Dl9VUPw4qk=;
 b=gxzkP64cYDC9HsGjAS596ukOQFPFPt/vAv2leGpR1jZDzdrTrIYWTbFfujjOtlv4Nk
 ASyvgFdrZeajoltKQuLO94/Bn6PR3euSM3zQzBYZF40/lu6VbUlDUnacnBjfS2pFxl5d
 +OOejzs4JZx1TknB5c+OveRolhgvWP4hvsGJvDyHed/+kjFsLao2KUpiM1kicc6wrEu2
 tZxO0GUciaBat/6Je200K3AgFFFAkOB/zB6D898AlSykQnN3Br7AJABGxMtde5aioFvC
 RQUFBXtw7s/663aP6e+9xe8b+CSJSmWG0ADNpZ5k8R7f4QumW2NVvgbnB7fb8ZzTluCK
 nuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686231100; x=1688823100;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ka4gQMrNU71yCnx4mXC3BxyVl7nhdDcW2Dl9VUPw4qk=;
 b=bfeZ47whtzCQc1FwCIy5kmj15OAungqjCZEDz1cAQAeUcqM197kF4SC9Hyu3ZM8cbM
 2b7wZ2k5y2ipn4YJzRnKsw8is7wgBVBdLpFe+uUG4xhQZHHFgj5/6L7FXoA+GqNwkxwt
 /jW3XFtJHvx+RzlaW5ru3BKJHNC/y6EaQ0dEg7sC70gLJn7YgtCbvHJKyA/tL2nVkedP
 gpgCKizoFJ4mz5GorQnJkwlibE8BqoEQDxSPvX2/wFMVRSa5Y4dRjucIir+/5faSU+t5
 wL5nJBZHcmDIl915UDCDKmHbnbLRmS4I9wgRf68AVjyAStaRCHTwFevOVofL6UNkk0di
 5Fiw==
X-Gm-Message-State: AC+VfDzZ1KPOjiyDOvyKqFiriA7tqrndSwgReVhMbjyXsPrVMU2uyPzp
 cXhcXjMLvdUkUZaz0MxRHdupUf/GTqJPcIVCiV0=
X-Google-Smtp-Source: ACHHUZ5aDBbI3SlmtQsfxX/aKoQ36/DRlOJH8aS6ztus02z8+TdoLgvQkf+NjSZapjYoIT+k1cIxpw==
X-Received: by 2002:a5d:4538:0:b0:30a:eda0:71c5 with SMTP id
 j24-20020a5d4538000000b0030aeda071c5mr7055600wra.16.1686231100033; 
 Thu, 08 Jun 2023 06:31:40 -0700 (PDT)
Received: from localhost.localdomain ([176.176.169.168])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a1c7417000000b003f60eb72cf5sm5348708wmc.2.2023.06.08.06.31.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 08 Jun 2023 06:31:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 5/5] target: Bulk rename 'helper.h' -> 'helper.h.inc' for
 all targets
Date: Thu,  8 Jun 2023 15:31:08 +0200
Message-Id: <20230608133108.72655-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230608133108.72655-1-philmd@linaro.org>
References: <20230608133108.72655-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Unfortunately since the HELPER_H path definition is used by all
targets, we have to do all changes in a single bulk commit.

Mechanical change doing:

  $ for t_a in target/*; do \
      if test -f ${t_a}/helper.h; then \
        mkdir -p ${t_a}/tcg; \
        git mv ${t_a}/helper.h ${t_a}/tcg/helper.h.inc; \
      fi; \
    done
  $ sed -i \
    -e 's#define HELPER_H "helper.h"#define HELPER_H "tcg/helper.h.inc"#' \
       $(git grep -l 'define HELPER_H')

then manually updating files in include/exec/ and docs/.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/helper-gen.h                        | 2 +-
 include/exec/helper-proto.h                      | 2 +-
 target/alpha/{helper.h => tcg/helper.h.inc}      | 0
 target/arm/{helper.h => tcg/helper.h.inc}        | 0
 target/avr/{helper.h => tcg/helper.h.inc}        | 0
 target/cris/{helper.h => tcg/helper.h.inc}       | 0
 target/hexagon/{helper.h => tcg/helper.h.inc}    | 0
 target/hppa/{helper.h => tcg/helper.h.inc}       | 0
 target/i386/{helper.h => tcg/helper.h.inc}       | 0
 target/loongarch/{helper.h => tcg/helper.h.inc}  | 0
 target/m68k/{helper.h => tcg/helper.h.inc}       | 0
 target/microblaze/{helper.h => tcg/helper.h.inc} | 0
 target/mips/{helper.h => tcg/helper.h.inc}       | 0
 target/nios2/{helper.h => tcg/helper.h.inc}      | 0
 target/openrisc/{helper.h => tcg/helper.h.inc}   | 0
 target/ppc/{helper.h => tcg/helper.h.inc}        | 0
 target/riscv/{helper.h => tcg/helper.h.inc}      | 0
 target/rx/{helper.h => tcg/helper.h.inc}         | 0
 target/s390x/{helper.h => tcg/helper.h.inc}      | 0
 target/sh4/{helper.h => tcg/helper.h.inc}        | 0
 target/sparc/{helper.h => tcg/helper.h.inc}      | 0
 target/tricore/{helper.h => tcg/helper.h.inc}    | 0
 target/xtensa/{helper.h => tcg/helper.h.inc}     | 0
 target/alpha/translate.c                         | 2 +-
 target/arm/tcg/translate.c                       | 2 +-
 target/avr/translate.c                           | 2 +-
 target/cris/translate.c                          | 2 +-
 target/hexagon/translate.c                       | 2 +-
 target/hppa/translate.c                          | 2 +-
 target/i386/tcg/translate.c                      | 2 +-
 target/loongarch/translate.c                     | 2 +-
 target/m68k/translate.c                          | 2 +-
 target/microblaze/translate.c                    | 2 +-
 target/mips/tcg/translate.c                      | 2 +-
 target/nios2/translate.c                         | 2 +-
 target/openrisc/translate.c                      | 2 +-
 target/ppc/translate.c                           | 2 +-
 target/riscv/translate.c                         | 2 +-
 target/rx/translate.c                            | 2 +-
 target/s390x/tcg/translate.c                     | 2 +-
 target/sh4/translate.c                           | 2 +-
 target/sparc/translate.c                         | 2 +-
 target/tricore/translate.c                       | 2 +-
 target/xtensa/translate.c                        | 2 +-
 44 files changed, 23 insertions(+), 23 deletions(-)
 rename target/alpha/{helper.h => tcg/helper.h.inc} (100%)
 rename target/arm/{helper.h => tcg/helper.h.inc} (100%)
 rename target/avr/{helper.h => tcg/helper.h.inc} (100%)
 rename target/cris/{helper.h => tcg/helper.h.inc} (100%)
 rename target/hexagon/{helper.h => tcg/helper.h.inc} (100%)
 rename target/hppa/{helper.h => tcg/helper.h.inc} (100%)
 rename target/i386/{helper.h => tcg/helper.h.inc} (100%)
 rename target/loongarch/{helper.h => tcg/helper.h.inc} (100%)
 rename target/m68k/{helper.h => tcg/helper.h.inc} (100%)
 rename target/microblaze/{helper.h => tcg/helper.h.inc} (100%)
 rename target/mips/{helper.h => tcg/helper.h.inc} (100%)
 rename target/nios2/{helper.h => tcg/helper.h.inc} (100%)
 rename target/openrisc/{helper.h => tcg/helper.h.inc} (100%)
 rename target/ppc/{helper.h => tcg/helper.h.inc} (100%)
 rename target/riscv/{helper.h => tcg/helper.h.inc} (100%)
 rename target/rx/{helper.h => tcg/helper.h.inc} (100%)
 rename target/s390x/{helper.h => tcg/helper.h.inc} (100%)
 rename target/sh4/{helper.h => tcg/helper.h.inc} (100%)
 rename target/sparc/{helper.h => tcg/helper.h.inc} (100%)
 rename target/tricore/{helper.h => tcg/helper.h.inc} (100%)
 rename target/xtensa/{helper.h => tcg/helper.h.inc} (100%)

diff --git a/include/exec/helper-gen.h b/include/exec/helper-gen.h
index f7ec155699..ca8d82d99a 100644
--- a/include/exec/helper-gen.h
+++ b/include/exec/helper-gen.h
@@ -9,7 +9,7 @@
 
 #include "exec/helper-gen-common.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-gen.h.inc"
 #undef  HELPER_H
 
diff --git a/include/exec/helper-proto.h b/include/exec/helper-proto.h
index 6935cb4f16..4d9014e9aa 100644
--- a/include/exec/helper-proto.h
+++ b/include/exec/helper-proto.h
@@ -9,7 +9,7 @@
 
 #include "exec/helper-proto-common.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-proto.h.inc"
 #undef  HELPER_H
 
diff --git a/target/alpha/helper.h b/target/alpha/tcg/helper.h.inc
similarity index 100%
rename from target/alpha/helper.h
rename to target/alpha/tcg/helper.h.inc
diff --git a/target/arm/helper.h b/target/arm/tcg/helper.h.inc
similarity index 100%
rename from target/arm/helper.h
rename to target/arm/tcg/helper.h.inc
diff --git a/target/avr/helper.h b/target/avr/tcg/helper.h.inc
similarity index 100%
rename from target/avr/helper.h
rename to target/avr/tcg/helper.h.inc
diff --git a/target/cris/helper.h b/target/cris/tcg/helper.h.inc
similarity index 100%
rename from target/cris/helper.h
rename to target/cris/tcg/helper.h.inc
diff --git a/target/hexagon/helper.h b/target/hexagon/tcg/helper.h.inc
similarity index 100%
rename from target/hexagon/helper.h
rename to target/hexagon/tcg/helper.h.inc
diff --git a/target/hppa/helper.h b/target/hppa/tcg/helper.h.inc
similarity index 100%
rename from target/hppa/helper.h
rename to target/hppa/tcg/helper.h.inc
diff --git a/target/i386/helper.h b/target/i386/tcg/helper.h.inc
similarity index 100%
rename from target/i386/helper.h
rename to target/i386/tcg/helper.h.inc
diff --git a/target/loongarch/helper.h b/target/loongarch/tcg/helper.h.inc
similarity index 100%
rename from target/loongarch/helper.h
rename to target/loongarch/tcg/helper.h.inc
diff --git a/target/m68k/helper.h b/target/m68k/tcg/helper.h.inc
similarity index 100%
rename from target/m68k/helper.h
rename to target/m68k/tcg/helper.h.inc
diff --git a/target/microblaze/helper.h b/target/microblaze/tcg/helper.h.inc
similarity index 100%
rename from target/microblaze/helper.h
rename to target/microblaze/tcg/helper.h.inc
diff --git a/target/mips/helper.h b/target/mips/tcg/helper.h.inc
similarity index 100%
rename from target/mips/helper.h
rename to target/mips/tcg/helper.h.inc
diff --git a/target/nios2/helper.h b/target/nios2/tcg/helper.h.inc
similarity index 100%
rename from target/nios2/helper.h
rename to target/nios2/tcg/helper.h.inc
diff --git a/target/openrisc/helper.h b/target/openrisc/tcg/helper.h.inc
similarity index 100%
rename from target/openrisc/helper.h
rename to target/openrisc/tcg/helper.h.inc
diff --git a/target/ppc/helper.h b/target/ppc/tcg/helper.h.inc
similarity index 100%
rename from target/ppc/helper.h
rename to target/ppc/tcg/helper.h.inc
diff --git a/target/riscv/helper.h b/target/riscv/tcg/helper.h.inc
similarity index 100%
rename from target/riscv/helper.h
rename to target/riscv/tcg/helper.h.inc
diff --git a/target/rx/helper.h b/target/rx/tcg/helper.h.inc
similarity index 100%
rename from target/rx/helper.h
rename to target/rx/tcg/helper.h.inc
diff --git a/target/s390x/helper.h b/target/s390x/tcg/helper.h.inc
similarity index 100%
rename from target/s390x/helper.h
rename to target/s390x/tcg/helper.h.inc
diff --git a/target/sh4/helper.h b/target/sh4/tcg/helper.h.inc
similarity index 100%
rename from target/sh4/helper.h
rename to target/sh4/tcg/helper.h.inc
diff --git a/target/sparc/helper.h b/target/sparc/tcg/helper.h.inc
similarity index 100%
rename from target/sparc/helper.h
rename to target/sparc/tcg/helper.h.inc
diff --git a/target/tricore/helper.h b/target/tricore/tcg/helper.h.inc
similarity index 100%
rename from target/tricore/helper.h
rename to target/tricore/tcg/helper.h.inc
diff --git a/target/xtensa/helper.h b/target/xtensa/tcg/helper.h.inc
similarity index 100%
rename from target/xtensa/helper.h
rename to target/xtensa/tcg/helper.h.inc
diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 1f7dd078d8..291e09640d 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -30,7 +30,7 @@
 #include "exec/translator.h"
 #include "exec/log.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 13c88ba1b9..75db6960cd 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -29,7 +29,7 @@
 #include "cpregs.h"
 #include "exec/helper-proto.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/avr/translate.c b/target/avr/translate.c
index ef2edd7415..0bfa217d95 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -30,7 +30,7 @@
 #include "exec/log.h"
 #include "exec/translator.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/cris/translate.c b/target/cris/translate.c
index 1445cd8bb5..89e9f3ee36 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -37,7 +37,7 @@
 #include "exec/helper-gen.h"
 #include "exec/log.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index 708339198e..cf95de7314 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -33,7 +33,7 @@
 #include "genptr.h"
 #include "printinsn.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index d33813d173..f6b531166c 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -29,7 +29,7 @@
 #include "exec/translator.h"
 #include "exec/log.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 5cf14311a6..695b88e992 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -34,7 +34,7 @@
 
 #include "exec/log.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 3146a2d4ac..056d20334f 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -23,7 +23,7 @@
 TCGv cpu_gpr[32], cpu_pc;
 static TCGv cpu_lladdr, cpu_llval;
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 551ef9e52a..559cf46920 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -34,7 +34,7 @@
 #include "exec/log.h"
 #include "fpu/softfloat.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 7e7f837c63..564fcda876 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -31,7 +31,7 @@
 
 #include "exec/log.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 74af91e4f5..e884faf22f 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -32,7 +32,7 @@
 #include "disas/disas.h"
 #include "fpu_helper.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index a365ad8293..c9649fc5c8 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -34,7 +34,7 @@
 #include "qemu/qemu-print.h"
 #include "semihosting/semihost.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index 7760329e75..152f93dec5 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -34,7 +34,7 @@
 
 #include "exec/log.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 37fd431870..b20f3316aa 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -41,7 +41,7 @@
 #include "qemu/qemu-print.h"
 #include "qapi/error.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 933b11c50d..a2d25052b3 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -33,7 +33,7 @@
 #include "instmap.h"
 #include "internals.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/rx/translate.c b/target/rx/translate.c
index 08cabbde61..fdc091a2f4 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -28,7 +28,7 @@
 #include "exec/translator.h"
 #include "exec/log.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index a6ee2d4423..b6872ec7d8 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -45,7 +45,7 @@
 #include "exec/log.h"
 #include "qemu/atomic128.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 49c87d7a01..93d038fc93 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -29,7 +29,7 @@
 #include "exec/log.h"
 #include "qemu/qemu-print.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index bad2ec90a0..45dc59f9a8 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -33,7 +33,7 @@
 #include "exec/log.h"
 #include "asi.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 8e4f99478c..165a40c333 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -33,7 +33,7 @@
 #include "exec/translator.h"
 #include "exec/log.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index b7386ff0f0..969b51ac07 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -45,7 +45,7 @@
 
 #include "exec/log.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
 
-- 
2.38.1


