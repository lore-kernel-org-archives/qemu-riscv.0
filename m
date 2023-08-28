Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B32C83F11
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 22:15:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qakUa-000606-Ie; Mon, 28 Aug 2023 18:13:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qakUW-0005yL-0q
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 18:13:48 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qakUR-0004Ay-WD
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 18:13:47 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4018af1038cso35606115e9.0
 for <qemu-riscv@nongnu.org>; Mon, 28 Aug 2023 15:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693260822; x=1693865622;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IN4el0RliSrzkh7KHsSv/rXBGURrc4tnh8maqpcPsQs=;
 b=SoA0P07CJHcoBlo+OVKtKcmWcbeJo1xzdqqXYAbEldUmDBslirlyE15F+kOrbIhktr
 Gflu+46j1WuzxmYHOp1Mgl4mI2USNeEIhrrKTWMrXDslSm3wnooQbhJBsHb0QvQ9Cd6m
 zHRy75mKmNSCG6sy6Mbxsx+PP8+fGNqSV+bZ/1fBC1WzFpdiNtuJxcyP6Bzu8xWcMRDM
 iiZoi/HFdFMiLFPG58trqNbUiBWLSeDOTbJkHNNWxXwrGNr5ApCgnU3idCINPGrXk0h4
 3/8XXlYVQo4YplvWath/3L4nWe98JcUCVOuVCoZXHu9x1FvVkEA7W9zA4rkV4lPlGs1k
 pH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693260822; x=1693865622;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IN4el0RliSrzkh7KHsSv/rXBGURrc4tnh8maqpcPsQs=;
 b=au9kmuzYH5SBhKCYQWXG4aG0XXo4owv+8lPEHLEdsCawMldx1J9FKa3ktabrdU9n7Z
 Ejl44258uZN66Iv+6o9e2dcxiuQcihZR+dC3nW0pA2BkXuKuW6/G3M/k0ZwNcfM08mCs
 O4y0Os6gxtuQlX/nl/qLldqFrsUuNJtJH0SzmuetGqdJxBkhmjZODZwBeFVCacoEIZCL
 AhWKgX/Y7VOCtODHVZCnKTnmzbTgB5yQrutHv+b9ThOV/hrg/vGUlrYjMKAdMZMpMnJh
 vwY+d1DZipUYZG+k7EhwjSdtlIVz3ZaS9OIUKxPtRkCBxMPVJ8gPk2B8ORhQVeUX/zjD
 lPSw==
X-Gm-Message-State: AOJu0YyKt/+hEQToly8XjfF3oTKYCZCJ1xMcD84OvPPfWW3XgJBjMi7e
 io5dHhOvaTMOwZZpH5gqqnFDuw==
X-Google-Smtp-Source: AGHT+IEqvZIiiwwYg0XXkYowBiYWiOGHnRZJ1b/6O+1rWqxKPxx3Q9uBxmEWRWhzNfO+y4uWu4ahcQ==
X-Received: by 2002:adf:cd0e:0:b0:317:67bf:3376 with SMTP id
 w14-20020adfcd0e000000b0031767bf3376mr20406896wrm.57.1693260822226; 
 Mon, 28 Aug 2023 15:13:42 -0700 (PDT)
Received: from m1x-phil.lan ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 y3-20020adfe6c3000000b0031c5ce91ad6sm11720207wrm.97.2023.08.28.15.13.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Aug 2023 15:13:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 04/11] target/translate: Remove unnecessary
 'exec/cpu_ldst.h' header
Date: Tue, 29 Aug 2023 00:13:07 +0200
Message-ID: <20230828221314.18435-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828221314.18435-1-philmd@linaro.org>
References: <20230828221314.18435-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

All these files only access the translator_ld/st API declared
in "exec/translator.h". The CPU ld/st API from declared in
"exec/cpu_ldst.h" is not used, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/translate.c      | 1 -
 target/hexagon/translate.c    | 1 -
 target/hppa/translate.c       | 1 -
 target/m68k/translate.c       | 1 -
 target/microblaze/translate.c | 1 -
 target/nios2/translate.c      | 1 -
 target/openrisc/translate.c   | 1 -
 target/ppc/translate.c        | 1 -
 target/sh4/translate.c        | 1 -
 target/sparc/translate.c      | 1 -
 10 files changed, 10 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 0839182a1f..9be912c50c 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -24,7 +24,6 @@
 #include "qemu/host-utils.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
-#include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 #include "exec/translator.h"
diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index 708339198e..c00254e4d5 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -23,7 +23,6 @@
 #include "exec/helper-gen.h"
 #include "exec/helper-proto.h"
 #include "exec/translation-block.h"
-#include "exec/cpu_ldst.h"
 #include "exec/log.h"
 #include "internal.h"
 #include "attribs.h"
diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index e3af668252..c04dc15228 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -23,7 +23,6 @@
 #include "qemu/host-utils.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
-#include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 #include "exec/translator.h"
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 15b3701b8f..9e224fe796 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -25,7 +25,6 @@
 #include "tcg/tcg-op.h"
 #include "qemu/log.h"
 #include "qemu/qemu-print.h"
-#include "exec/cpu_ldst.h"
 #include "exec/translator.h"
 
 #include "exec/helper-proto.h"
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 7e7f837c63..d02c16296a 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -24,7 +24,6 @@
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
 #include "exec/helper-proto.h"
-#include "exec/cpu_ldst.h"
 #include "exec/helper-gen.h"
 #include "exec/translator.h"
 #include "qemu/qemu-print.h"
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 4264c7ec6b..dfc546d3bb 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -29,7 +29,6 @@
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 #include "exec/log.h"
-#include "exec/cpu_ldst.h"
 #include "exec/translator.h"
 #include "qemu/qemu-print.h"
 #include "semihosting/semihost.h"
diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index 7c6f80daf1..d65758449f 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -26,7 +26,6 @@
 #include "qemu/log.h"
 #include "qemu/bitops.h"
 #include "qemu/qemu-print.h"
-#include "exec/cpu_ldst.h"
 #include "exec/translator.h"
 
 #include "exec/helper-proto.h"
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 74796ec7ba..49b6a757b7 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -27,7 +27,6 @@
 #include "tcg/tcg-op-gvec.h"
 #include "qemu/host-utils.h"
 #include "qemu/main-loop.h"
-#include "exec/cpu_ldst.h"
 
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 49c87d7a01..c1e590feb3 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -22,7 +22,6 @@
 #include "disas/disas.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
-#include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 #include "exec/translator.h"
diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index fa80a91161..3bf0ab8135 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -25,7 +25,6 @@
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
-#include "exec/cpu_ldst.h"
 
 #include "exec/helper-gen.h"
 
-- 
2.41.0


