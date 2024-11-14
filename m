Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8089AD637D5
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 01:15:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tBOQg-0007VW-MV; Wed, 13 Nov 2024 20:13:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBOQe-0007UM-Qs
 for qemu-riscv@nongnu.org; Wed, 13 Nov 2024 20:13:48 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBOQc-0001wp-IA
 for qemu-riscv@nongnu.org; Wed, 13 Nov 2024 20:13:48 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43159c9f617so886675e9.2
 for <qemu-riscv@nongnu.org>; Wed, 13 Nov 2024 17:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731546824; x=1732151624; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n4W2o+WVI2EW3XsW3lSsIks/9d2PO57Qya5v8Q7poU8=;
 b=LitgoMJUmq+gqemI4ODNsD9dB2joc/86+4Bm4D55FpaYIq3e1DyF0VyRTlNoPlsy5I
 qQ0v0P/SnY2dSch4f0h4YQfTZ7HVqsVyAoFY1PiUPiO5qrrF9CT0scM1L6TRsBCEgvaa
 bSnKWelY7q7pO5Y3V10Nr/TJpT1DDAdlnFQCWKkwZUz0Ylz2LHUaA4jRfI02gq1juL1A
 FKsb57f07L1k9Lc23Lk+5cwF9tgKFMZy3DBA2aZoL2p+0WW8GGQBFEw/rkRs8xOv/3n+
 BG1pqZKtSQ285vHI2z+8Q1Ul7tPPCACfnz6RNuNlOgbGbbxgdIjBkBMmq+JqeOZM7r+2
 /KkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731546824; x=1732151624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n4W2o+WVI2EW3XsW3lSsIks/9d2PO57Qya5v8Q7poU8=;
 b=uZsYJ+pnReIXgGoyXlxmMP2+dEMBTuQcIa2ToiTpfEIojzke5jLH4wLZD7Tp1iKsAk
 Dh6GUPab4fOeuzx/S4PsV3Q7Mkq5yqUYjPghkuvqZhWx1klrZROQJmTCIkPXQIvBTYzn
 AFe/puAJXFfGt15h8tBs97YGCa/mUjEznm74bhkicxUlQA+U/fJ1KfkYSAksgWi/hfpP
 IqAnoYzw2eZ8qWTBCCG58IzMP1iDvaDFURL1xMH4iRu/3FhgvwkoJfluorf5dqJaA/uM
 plMjzRBTfxJGjiBLzNbbk1WARFM+pdCOruG9/OX89ntKSS1xC4ngNV8UFt367RuR1o2l
 MgBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6QJ7ZMxwKfc2LYIwzva+rEby9j53JbSy1k/YE0GygKPb07eKhKrUjnHfrVB/dd45GFuM4XQRWhzDa@nongnu.org
X-Gm-Message-State: AOJu0Yz0MgdqtJEAcpB+G0bd9iVxNm4Mf4dH5C0g4jtTmenB4ovCSSIy
 1X2aIzNs/8Kj2D7Q/ls7b/R2KFtphA0wFUsb/orznLFRNhzH8eX12IKaPycG63A=
X-Google-Smtp-Source: AGHT+IEicPSPnx9VguO/9hRNFn0r+OGPnyAza34mmQJUkip7pZQ0zwk7xapErhg7/qyCllNdtkSLxg==
X-Received: by 2002:a05:600c:3582:b0:428:ec2a:8c94 with SMTP id
 5b1f17b1804b1-432b75035camr195067265e9.10.1731546824041; 
 Wed, 13 Nov 2024 17:13:44 -0800 (PST)
Received: from localhost.localdomain ([176.187.209.238])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432dab721d7sm1548395e9.9.2024.11.13.17.13.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 13 Nov 2024 17:13:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 02/24] exec/cpu-defs: Remove unnecessary headers
Date: Thu, 14 Nov 2024 02:12:47 +0100
Message-ID: <20241114011310.3615-3-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114011310.3615-1-philmd@linaro.org>
References: <20241114011310.3615-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

"exec/cpu-defs.h" should be kept as minimal as possible;
besides these includes don't seem necessay. Remove them.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu-defs.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index 0dbef3010c..ae18398fa9 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -23,14 +23,6 @@
 #error cpu.h included from common code
 #endif
 
-#include "qemu/host-utils.h"
-#include "qemu/thread.h"
-#ifndef CONFIG_USER_ONLY
-#include "exec/hwaddr.h"
-#endif
-#include "exec/memattrs.h"
-#include "hw/core/cpu.h"
-
 #include "cpu-param.h"
 
 #ifndef TARGET_LONG_BITS
-- 
2.45.2


