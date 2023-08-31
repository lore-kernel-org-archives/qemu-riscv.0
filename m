Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53A5C83F32
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 13:18:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbhJR-0005CD-DD; Thu, 31 Aug 2023 09:02:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhFJ-00035W-ED
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:58:02 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhFD-0005QR-Ad
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:58:00 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-401b3ea0656so7203815e9.0
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 05:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486674; x=1694091474; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EWFG4EongnTwNm4gc3SaYrZZrKAf899rD48bNs5phBA=;
 b=jX/FUq1O8cVMqN4lk9eTKpzdYY4Cq5uh7c+rnkz6M1llJmbnXIt61glTJnw755byiZ
 l8Lcn+M4H9dU2Wm3YEzTU5nuH9Edb9ZWbmz3HkHPmH8lyJMHr2jw5lwRYlER0apypElL
 GTOoIm+4NIi+XcZJmjVnnXjCX5/H6vvmVe4mSFhSWRxtSLDsXG1/eey9sTiJn1xL1lpD
 zJoMBqDwuLTBt//sWlJ2X0BO1Kxrj152SwwV2jCgT47pbGMKnljumfSCoGK01tGQD/KM
 I715LKPdYuh2w+hLaYnOHr9rO+Ve8g5odmteul3TV6yKK5ELM2aQHrA6HarMRdMK7yG8
 8O3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486674; x=1694091474;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EWFG4EongnTwNm4gc3SaYrZZrKAf899rD48bNs5phBA=;
 b=Xu8rGucAj9SP5d++j4lZKS65zApANUe2Szav0IYbvN0aWg7WqS0TheXcVlRDc/fPTI
 F+v2AdAQg0LP4CtjC3Fgdqhv8G4ukp5o+zH37GO3s2Ag5nN46d2hWoDMowijrBNEMlCp
 VZL8wY/W0kmBgCAFNEMmI0r1Helf+P8X2rquQMtZJZh9ng/bxF1BZnI2bv/SlhrFFmqt
 e2CVjddPGRPl2D1LgAqOBklOrbz+n25arNzNbPiEcfhvOtkEa3maQKfpQm9zeQuEFTDr
 4jb7Rpug/82OGyvc+5vRzZlE+R9w6+DE8wBMYYjo/S9xrjAHBW5E33dxpOd63vwS1fg+
 ya5Q==
X-Gm-Message-State: AOJu0YySG8v58iFYyMHCAF1NdXqUawcW3+jiMoy9fuBQ3Y4jZxRgoFhy
 wI3mhecKdXzKVb98T0rsT6K+NQ==
X-Google-Smtp-Source: AGHT+IEUqk3eQT/wbjZBsJ/iAYmj4ug2aU+1hhmz/Bzdw+yKCGBnE/EDv12LTnxAYqUEHFlIOeKnnQ==
X-Received: by 2002:a5d:5242:0:b0:31a:d2b2:f29d with SMTP id
 k2-20020a5d5242000000b0031ad2b2f29dmr4355231wrc.8.1693486673944; 
 Thu, 31 Aug 2023 05:57:53 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a1ced03000000b003feae747ff2sm5128839wmh.35.2023.08.31.05.57.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 05:57:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Brian Cain <bcain@quicinc.com>, Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PULL 11/41] target/translate: Remove unnecessary 'exec/cpu_ldst.h'
 header
Date: Thu, 31 Aug 2023 14:56:13 +0200
Message-ID: <20230831125646.67855-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
Message-Id: <20230828221314.18435-5-philmd@linaro.org>
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


