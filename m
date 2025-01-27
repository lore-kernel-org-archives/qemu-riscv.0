Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA0CC0218A
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 11:56:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tcNj2-0000XJ-0N; Mon, 27 Jan 2025 06:56:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNi3-0006yu-MY
 for qemu-riscv@nongnu.org; Mon, 27 Jan 2025 06:55:22 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNi1-0007Cu-8s
 for qemu-riscv@nongnu.org; Mon, 27 Jan 2025 06:55:19 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4368a293339so49789345e9.3
 for <qemu-riscv@nongnu.org>; Mon, 27 Jan 2025 03:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737978916; x=1738583716; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=477b2+132Twzc6vm7x293Qvrvp4aEfDDM84pZnLDz7E=;
 b=A30Hdz7DgNSk/txVVLqyttURob1pvTspsV1OrXuq6BP+rrCMsb3cR3jCvHhAU5zXy0
 2P+inoAUoI+vsj9Bo3yDQA+WBzhol+dIdi/PR3jRbo4VU3qkW9s9ewdS2c4I1Fx69UC3
 2USRtgLzjJeD+uvUwesUBXpzyhHwbucQYMFUpzalUN5GbnqxB7CQSSaQtrhchCyOoPen
 6aEUiysDCL/76HzS1aBlcukYqhsDGu0e89VLb19DIpSWEOnuE5eNsceBW/XudCd4PlFA
 54nwvd6YrgqO7uxIDTGJqcD7Tfb1zKyh2quAbuona05YUXXh7TNNPUEE8+Wlt88+P4ci
 WRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737978916; x=1738583716;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=477b2+132Twzc6vm7x293Qvrvp4aEfDDM84pZnLDz7E=;
 b=Fj8Bx9suWj5W9RVZle2AgWlWeDHrEkjxtZOq0ocH8z46BcFYUqQzlxZIF6EfcSuXDm
 Q2NxMUVPWbgfKsgo9yPt069IQ6XffVqoWfq9URw+qm+m/FUinf7xQk2QAQLl/JpczpP5
 NNl/sAe3eeKinIl0CPBO/3lvypkWHqnk2o6LfDzpsn2L23HAr9qGHlPtantmfJ0CmFpl
 6h1ofK9T16TT2XpHhBes4HgzVEO1ryPouux3aDDg8ux9SiZ+1THI5KMFts2e3dNcp1Ru
 YwkJYQitqHy+L4Yze3Prjb6qGbzeSXK6ShMNvoFspwwypGBs1vKen0z5czo6hOFkl3l6
 bM5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXe/QSTOXe09Y02ddgNQZ4CvtutWrJOm3tcqKUM4jJuq5SYKq2lZqStpcQM9j8MfZZ8GnFznhmtA9XQ@nongnu.org
X-Gm-Message-State: AOJu0YwirSPZeHzlzNEw7bIPigkpY94teRTR9VQmAG5Exvsr7lLcw12K
 /Qfzkn3961Peigu38gqpwDDUgLRD3I5L/y28j4t/M2ngWmptL+8in2Jjd9DiuDE=
X-Gm-Gg: ASbGncsyxyT05TOOcpCfQpNARdPX1Pffk5psHhv+zkbF31O27c/AiZ+lyJkS/CSocJr
 E6Q1h0Ym+biaS2ZFL9wmbjRhV/gtJPTTkO/WJ626Bnw3fEpNEMhNG0vGRhVK3Vi+USgd015aQi3
 MBJaIp5KDV/M8gACYJ1qrrR+RFnixF5nE0ALJciAIpv+zy+ncTQHXHsKVU1I28lZ7H2daOD9c8S
 /e8z52rE1R4j0oXbF7sFOMiNXsHUbpF/c1z/psR+eREae1/NuNtm0f0IevaOapucpmzX3ISt9w+
 dyNdNaSKnTSc45ztwCfCIHkkuOQa9JCtzbiYUcUiS/PickNYLn/A+SE=
X-Google-Smtp-Source: AGHT+IGHWLmSvU1P39gqGXFnIhRl/32Yegnv45d7TusjfscIdD5eIgw0WV1HeMUXoBfBZqD4Icviow==
X-Received: by 2002:a05:6000:1788:b0:385:ea2b:12cc with SMTP id
 ffacd0b85a97d-38bf56628e4mr37165113f8f.13.1737978915871; 
 Mon, 27 Jan 2025 03:55:15 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1bbd93sm10884096f8f.76.2025.01.27.03.55.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Jan 2025 03:55:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 10/10] disas: Remove target_words_bigendian() call in
 initialize_debug_target()
Date: Mon, 27 Jan 2025 12:54:26 +0100
Message-ID: <20250127115426.51355-11-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250127115426.51355-1-philmd@linaro.org>
References: <20250127115426.51355-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

All CPUClass implementations must implement disas_set_info()
which sets the disassemble_info::endian value.

Ensure that by:

1/ assert disas_set_info() handler is not NULL
2/ set %endian to BFD_ENDIAN_UNKNOWN before calling the
   CPUClass::disas_set_info() handler, then assert %endian
   is not BFD_ENDIAN_UNKNOWN after the call.

This allows removing the target_words_bigendian() call in disas/.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 disas/disas-common.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/disas/disas-common.c b/disas/disas-common.c
index 57505823cb7..42e911e36be 100644
--- a/disas/disas-common.c
+++ b/disas/disas-common.c
@@ -7,7 +7,6 @@
 #include "disas/disas.h"
 #include "disas/capstone.h"
 #include "hw/core/cpu.h"
-#include "exec/tswap.h"
 #include "disas-internal.h"
 
 
@@ -61,15 +60,11 @@ void disas_initialize_debug_target(CPUDebug *s, CPUState *cpu)
 
     s->cpu = cpu;
     s->info.print_address_func = print_address;
-    if (target_words_bigendian()) {
-        s->info.endian = BFD_ENDIAN_BIG;
-    } else {
-        s->info.endian =  BFD_ENDIAN_LITTLE;
-    }
+    s->info.endian =  BFD_ENDIAN_UNKNOWN;
 
-    if (cpu->cc->disas_set_info) {
-        cpu->cc->disas_set_info(cpu, &s->info);
-    }
+    g_assert(cpu->cc->disas_set_info);
+    cpu->cc->disas_set_info(cpu, &s->info);
+    g_assert(s->info.endian !=  BFD_ENDIAN_UNKNOWN);
 }
 
 int disas_gstring_printf(FILE *stream, const char *fmt, ...)
-- 
2.47.1


