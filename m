Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984F2C83F09
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 20:47:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uZFCg-000867-Ty; Tue, 08 Jul 2025 16:46:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZDkK-0001tM-MC
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 15:12:59 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZDk8-0006NR-Qa
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 15:12:45 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-6099d89a19cso8485955a12.2
 for <qemu-riscv@nongnu.org>; Tue, 08 Jul 2025 12:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752001954; x=1752606754; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RFonhSB51r1m9DRDPq3gxW3IKaSRsXZYDkC267ansE0=;
 b=N2+YBM7+QmsoCUiw/LhmiSEQRz3GkQq21ox4bYNbpRVeN7qDtvVVhStyJpgeROzQ2O
 C+SppoU1CEQOx/z+eEwqwIc0aPTM/1vQ3QnDkczbHEXSFuzluqPPLBq28NrmbJHQZxZg
 ZK+vm+UTiHi7Dww7LmyOSms5TThPuCi7UAlQdK9Z02Nkeb7SscNvUlsPn0rGxZZJ1X5g
 unfREua57+tMKIk9GIQ4tNN7ZNdjquLMOn1B0lGc/kXNo22aON/u1psq5oYqy19AYejd
 KxcyQZqp3zkOXtwZh66cDp6RLhbMgV4dnfwPxGsm9DqPMNIUenJRoXlPYQ9oEwvverJG
 XY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752001954; x=1752606754;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RFonhSB51r1m9DRDPq3gxW3IKaSRsXZYDkC267ansE0=;
 b=LfO6MNlQzShEZDRAR3Fb/Nn+z4a0Avaqv+hj0Nmi1p1VzOSe9IbK90J8SqUDKvF1M5
 cV7I38rrtM6jA+wRdw+CudUDJ+76TMhkA+iAgFeiUima+gfuAJQY/zaygGo0ztcYNhII
 yOCjetNxJeFmRX8B07BBmTUt14c/Vd2KT5HJvJ0+aFsa/XQWr0ODoJu9cLmML0atwxLL
 /kozBM9cJ3HM09Y5MzA1JLUmYiM6hZU1H34h+10lbOGouGAHJ2dLHXtEu/KvL26pCVQq
 g9fNP0GUB2VXCU7wNyRv+YOv47N5RXP/q8fY8JHiJV2jV4nts78XG3RatRWTjq5UtR5J
 EYmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVm3+mM86KpylSbUcnCpW1gCRghljiQGvvEJkpIprdJAMBivWbqmGUAonfQMOOsQAXNEclQnInY2Kpq@nongnu.org
X-Gm-Message-State: AOJu0Ywf2mv5GDkSpB0BP3+mGIa1kJvCL7XZ0llzO+zebL6sRe6i8L1Y
 FT7GEEYH27hYpqPFemeUnuISN9/FA5ybqKCRcWexDi6y2sdgFeNbsIlVREhetXjJKDnua0xuQT3
 Eg5Nx
X-Gm-Gg: ASbGncu6IIXuuB0xXsGY6hYqFm9NdOqsc4gtrH+RKvhBENUTmrHQRSJXEaqtTusKopg
 xQ5/AvuZcY3T538BDSYcp4o5Uf3q/mu7+h3zSB8fCy34nVeero7HqVwWnrcaJWvtJ5uniCVVhcd
 fWdpIGKdCYXtwzQo6bJJ6KBmdavglwTc2y4CXwmXw3a22WPuHjrBYLiLzA0jdAhWRobC/PohRCN
 HT7aaFAenRfiSeoRdf13/NESfU0wVLlbnpCBQl1QuN382H2v808sqSgCPtS7cgILJyh4xyQ4zLR
 TGpaqiypTvNhKLhHzX5kpCMh/uuIZ5LpIomXhdOcF1AF2nZrX8u4Up7QQ1nT5HksfaTpSpf9sRH
 dqAp+L7pl8l9V7xbt3vDw7AlYd0AncJcbpzt5
X-Google-Smtp-Source: AGHT+IFEQ+Grn2rKXvnzGJpvoE1KkuW74qXxlvK4ke3uCqnSbhamEV2TgSUSqn/9QolpXsBttWVTuA==
X-Received: by 2002:a05:6000:713:b0:3a4:f66a:9d31 with SMTP id
 ffacd0b85a97d-3b49701abf5mr13082687f8f.16.1751995380379; 
 Tue, 08 Jul 2025 10:23:00 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cd44ffb9sm28311905e9.14.2025.07.08.10.22.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Jul 2025 10:22:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 v7 6/8] gdbstub/helpers: Replace TARGET_BIG_ENDIAN ->
 target_big_endian()
Date: Tue,  8 Jul 2025 19:19:46 +0200
Message-ID: <20250708171949.62500-7-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708171949.62500-1-philmd@linaro.org>
References: <20250708171949.62500-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52c.google.com
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

Check endianness at runtime to remove the target-specific
TARGET_BIG_ENDIAN definition.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/gdbstub/helpers.h | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/include/gdbstub/helpers.h b/include/gdbstub/helpers.h
index 6f7cc48adcb..1411b136d5c 100644
--- a/include/gdbstub/helpers.h
+++ b/include/gdbstub/helpers.h
@@ -16,6 +16,7 @@
 #error "gdbstub helpers should only be included by target specific code"
 #endif
 
+#include "qemu/target-info.h"
 #include "exec/tswap.h"
 #include "cpu-param.h"
 
@@ -55,18 +56,14 @@ static inline int gdb_get_reg64(GByteArray *buf, uint64_t val)
 static inline int gdb_get_reg128(GByteArray *buf, uint64_t val_hi,
                                  uint64_t val_lo)
 {
+    bool be = target_big_endian();
     uint64_t to_quad;
-#if TARGET_BIG_ENDIAN
-    to_quad = tswap64(val_hi);
+
+    to_quad = tswap64(be ? val_hi : val_lo);
     g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
-    to_quad = tswap64(val_lo);
+    to_quad = tswap64(be ? val_lo : val_hi);
     g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
-#else
-    to_quad = tswap64(val_lo);
-    g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
-    to_quad = tswap64(val_hi);
-    g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
-#endif
+
     return 16;
 }
 
-- 
2.49.0


