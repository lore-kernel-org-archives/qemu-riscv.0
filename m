Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB5FC7EE24
	for <qemu-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 14:14:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6XR0-0003xj-HJ; Tue, 06 Jun 2023 10:13:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6XQy-0003vs-Lu
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 10:13:16 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6XQw-0005Yd-Id
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 10:13:16 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f6e1394060so53535215e9.3
 for <qemu-riscv@nongnu.org>; Tue, 06 Jun 2023 07:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686060793; x=1688652793;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+/gBSuOm/dFGi2epbWaHBWKZe3zw4iREVEHEqpm1U0s=;
 b=HtWZOuq9IEoz3D7QgupgOQRLv/coATTCH+ymBFfBMjTngHXl/elW8/oxGj4WxvsYnw
 ozNfv7QVThuGmSeOh3QfNc7afbd/ty6FLtNuIN+Qln88oheNYhnkKcwoHTc3iVvjUsP7
 5c6VHPAqFSJCxKJgfTAlXQ8NerXZIiSisSP45iltciHbnj5Mi3uEc7h6ezp+TlzJmnjI
 e0cuXlrwKzRT99WuswzblU4poU+hiOXHn7OC+VRqnXWZJketyHRPA/awxf+WaEMR3aBH
 oHrC09WJ44aL2UMu5z/6HqgRq1+vS2dfi4cYFnmfwdpFgGIhzN89xDzB3hE2+uVb/K9S
 SOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686060793; x=1688652793;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+/gBSuOm/dFGi2epbWaHBWKZe3zw4iREVEHEqpm1U0s=;
 b=XjLS0wlE0ODGkoyjbNrGX9bH5XXenDljWdPZi8DeR8MJ97o5/EoyAcPz09LjSf5mRI
 wQWmRuFXbRuOnhIKRcufZs2gOKXgBboW0WM8JUWhGNI9NNplvooB+7X5JH4kN+IQRi1g
 uOzp7ENeFFu0Mh7fr+TLG4Mv/PwcfgBzYQPqNZegy9jC3nzsJ9JYgqezlyVW4RTdGU/0
 BpbRYOMCzRP2QonvCFSHLQJd972zcGLjWwio7s8MRBRwAI7Dm9S1avDDehnbVCS4XIkW
 1ZvtGh6jd22OxWaT41YYdEeB5QLg5wtguUOMlQtBWCPwlBBZwyJD04X5tlGELyJKC1vt
 gBhw==
X-Gm-Message-State: AC+VfDznoxSDdX2sRQ+Ohrpv4rwudaea0IKua04yA5yQaC68cEXLNah7
 rKgHrUjasd2SdrfuZicjHRdlAg==
X-Google-Smtp-Source: ACHHUZ6p6jAcULq4p2SZsh4s7BgCUXum4KJ1YVbFT1HStjAHSHSDqIXx3BDIsEhQC5XATihjVpUQlA==
X-Received: by 2002:a05:600c:2904:b0:3f7:26f8:4cc0 with SMTP id
 i4-20020a05600c290400b003f726f84cc0mr2121358wmd.17.1686060793269; 
 Tue, 06 Jun 2023 07:13:13 -0700 (PDT)
Received: from localhost.localdomain
 (vbo91-h01-176-184-50-104.dsl.sta.abo.bbox.fr. [176.184.50.104])
 by smtp.gmail.com with ESMTPSA id
 e21-20020a05600c219500b003f736735424sm9072246wme.43.2023.06.06.07.13.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 06 Jun 2023 07:13:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/5] target/i386: Rename helper template headers as '.h.inc'
Date: Tue,  6 Jun 2023 16:12:50 +0200
Message-Id: <20230606141252.95032-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230606141252.95032-1-philmd@linaro.org>
References: <20230606141252.95032-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Therefore rename the included templates as '.h.inc'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/helper.h                                      | 6 +++---
 target/i386/{ops_sse_header.h => ops_sse_header.h.inc}    | 0
 ...hift_helper_template.h => shift_helper_template.h.inc} | 0
 .../{cc_helper_template.h => cc_helper_template.h.inc}    | 0
 target/i386/tcg/cc_helper.c                               | 8 ++++----
 target/i386/tcg/int_helper.c                              | 8 ++++----
 6 files changed, 11 insertions(+), 11 deletions(-)
 rename target/i386/{ops_sse_header.h => ops_sse_header.h.inc} (100%)
 rename target/i386/{shift_helper_template.h => shift_helper_template.h.inc} (100%)
 rename target/i386/tcg/{cc_helper_template.h => cc_helper_template.h.inc} (100%)

diff --git a/target/i386/helper.h b/target/i386/helper.h
index e627a93107..e972e1cf36 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -203,11 +203,11 @@ DEF_HELPER_1(enter_mmx, void, env)
 DEF_HELPER_1(emms, void, env)
 
 #define SHIFT 0
-#include "ops_sse_header.h"
+#include "ops_sse_header.h.inc"
 #define SHIFT 1
-#include "ops_sse_header.h"
+#include "ops_sse_header.h.inc"
 #define SHIFT 2
-#include "ops_sse_header.h"
+#include "ops_sse_header.h.inc"
 
 DEF_HELPER_3(rclb, tl, env, tl, tl)
 DEF_HELPER_3(rclw, tl, env, tl, tl)
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h.inc
similarity index 100%
rename from target/i386/ops_sse_header.h
rename to target/i386/ops_sse_header.h.inc
diff --git a/target/i386/shift_helper_template.h b/target/i386/shift_helper_template.h.inc
similarity index 100%
rename from target/i386/shift_helper_template.h
rename to target/i386/shift_helper_template.h.inc
diff --git a/target/i386/tcg/cc_helper_template.h b/target/i386/tcg/cc_helper_template.h.inc
similarity index 100%
rename from target/i386/tcg/cc_helper_template.h
rename to target/i386/tcg/cc_helper_template.h.inc
diff --git a/target/i386/tcg/cc_helper.c b/target/i386/tcg/cc_helper.c
index 6227dbb30b..c310bd842f 100644
--- a/target/i386/tcg/cc_helper.c
+++ b/target/i386/tcg/cc_helper.c
@@ -58,21 +58,21 @@ const uint8_t parity_table[256] = {
 };
 
 #define SHIFT 0
-#include "cc_helper_template.h"
+#include "cc_helper_template.h.inc"
 #undef SHIFT
 
 #define SHIFT 1
-#include "cc_helper_template.h"
+#include "cc_helper_template.h.inc"
 #undef SHIFT
 
 #define SHIFT 2
-#include "cc_helper_template.h"
+#include "cc_helper_template.h.inc"
 #undef SHIFT
 
 #ifdef TARGET_X86_64
 
 #define SHIFT 3
-#include "cc_helper_template.h"
+#include "cc_helper_template.h.inc"
 #undef SHIFT
 
 #endif
diff --git a/target/i386/tcg/int_helper.c b/target/i386/tcg/int_helper.c
index 599ac968b0..05418f181f 100644
--- a/target/i386/tcg/int_helper.c
+++ b/target/i386/tcg/int_helper.c
@@ -448,20 +448,20 @@ target_ulong helper_pext(target_ulong src, target_ulong mask)
 }
 
 #define SHIFT 0
-#include "shift_helper_template.h"
+#include "shift_helper_template.h.inc"
 #undef SHIFT
 
 #define SHIFT 1
-#include "shift_helper_template.h"
+#include "shift_helper_template.h.inc"
 #undef SHIFT
 
 #define SHIFT 2
-#include "shift_helper_template.h"
+#include "shift_helper_template.h.inc"
 #undef SHIFT
 
 #ifdef TARGET_X86_64
 #define SHIFT 3
-#include "shift_helper_template.h"
+#include "shift_helper_template.h.inc"
 #undef SHIFT
 #endif
 
-- 
2.38.1


