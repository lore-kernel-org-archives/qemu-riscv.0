Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B4BC8303C
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 22:12:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uZGYM-0004Wg-Km; Tue, 08 Jul 2025 18:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZGGD-0001Nn-5g
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 17:54:00 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZGGB-0003P3-H4
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 17:53:56 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a510432236so3229927f8f.0
 for <qemu-riscv@nongnu.org>; Tue, 08 Jul 2025 14:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752011633; x=1752616433; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oxnjh/X694j9j3b/2Ng5oDJDQQ9fFb9s5F3xkMYnYD8=;
 b=kbBL8baaGGM4NxXJwIGFnxya5NLWrmu7GtfEfZ1np4GY/I4uxkhc7LMZbfwCDF2Z6k
 sXeevAlgqEdQmUO/q7wjIYpGChI5fGsFV4N7MtSAC/n+VEfhs2eFk5ztzv5VSkJ4oxwV
 4mnHPw/EOseCEjGA7mj90WcBaPOQBdTR8pF7PD3M4pJR/mlQjw2L8ICNJQcWcBa7QBgi
 zzPFIh+lMVQTSaMbcDzlEWfDs0HGH4ShK3HwogZkRT7dKS9uhrMv5Wb4hg3dXwcKHsHg
 qx92zUH7mXdD5vLDUVGY/g6MOdKGoPhVCb9R3esyBV1ELF0GbbJJWGGBb6EX3seqUmsh
 Xp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752011633; x=1752616433;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oxnjh/X694j9j3b/2Ng5oDJDQQ9fFb9s5F3xkMYnYD8=;
 b=OIHvJzIVODWccYSb9ZH3VSuPGZvHerz27nTUH741OQCqxRKv7Rd+XFY/qW+7Kyte9O
 3/Zc25wikkrGOYTN1aWqpyF24vunYgbo5veVct77IOlxGN7uyH5q/TOiRGv9W9MfLIVa
 0ceLRdpVoEIktILLVgsaczDjB+ttURF0o1aEdEyr9T7Ary7UDkEgC8uV8We6egVatdQ+
 0rnh3qpuCx4dpGT+N+k3KtEoTW9kG5sb3ojk78+Ixv5pgXcT+URFdXHyJUZtp0kAsi8A
 cqNZTnWcsp7ufLstE7BlOZQs6DzSvE8hXo4+kF71Cx6du2/eb3eEkpRdAfPtPAR/dQop
 8NPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLLTUq/dDuAGkNEeEtVnunmzg9zeejJH+PKbrrRdT21Ziqba1oHfoE4IYue6mo4qmGv2B0teLfdtwg@nongnu.org
X-Gm-Message-State: AOJu0Yy6Bj11UsUYQBIPjQfK+ix98da4Sw5JJ3NMKc/PJOS2RvTjuhk8
 ZC+uDodPfriRNLx1TO3n6LGO8Xf4CD1LzBDRvoiahYcVsN4kxx/2y3mrlBBaQv6iEng=
X-Gm-Gg: ASbGnctgER78ubGhVOD1cOD3hdhMfNJajXN0mMX2/44G+CDE9L2oqflt/XC1mif8yHx
 /umr42SMj9Ta5RthJaAWuXDYznlAnWUyFNUcivYNMr9tyOdc8eIkUy6fCdUrBf0BeMWysOjFkzd
 7dvZRMbOVu/82RK7dlpwW92Hw3S1esn9nNW1h5nnQTlSkzP4y0BRNlGS48wT/UDURiA3AogvHFA
 6YiHM4o1485fCZIuCl1AONSBLj8GyfdTes3hSeP6PW751v4q7GKa5o7fFOhTHTYL2Uq7GdWwGE4
 FeekLpTR7q989eMy9z05t6eVjprYxH3bKCmhkhoIjrioKlPg3iXuJKGQHYj3Q4T4Yb2kVsbP6PE
 wyj8Bq8NcnKZp8DnJV3E4vwoYf7mMF5sq9cV9RNO8NQ==
X-Google-Smtp-Source: AGHT+IEapKHkl/MIZsyavswhrJ0kmSudvREE1nrzhAoKhLSRwgepxYWrQlZ4ctFcBcxub+n1tWqevw==
X-Received: by 2002:a05:6000:1788:b0:3a4:f379:65bc with SMTP id
 ffacd0b85a97d-3b497038e7emr15382058f8f.40.1752011633355; 
 Tue, 08 Jul 2025 14:53:53 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47285e236sm13995248f8f.100.2025.07.08.14.53.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Jul 2025 14:53:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 RESEND v8 6/8] gdbstub/helpers: Replace
 TARGET_BIG_ENDIAN -> target_big_endian()
Date: Tue,  8 Jul 2025 23:53:17 +0200
Message-ID: <20250708215320.70426-7-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708215320.70426-1-philmd@linaro.org>
References: <20250708215320.70426-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
TARGET_BIG_ENDIAN definition. Use cpu_to_[be,le]XX() from
"qemu/bswap.h" instead of tswapXX() from "exec/tswap.h".

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/gdbstub/helpers.h | 48 +++++++++++++++++++++++----------------
 1 file changed, 29 insertions(+), 19 deletions(-)

diff --git a/include/gdbstub/helpers.h b/include/gdbstub/helpers.h
index 6f7cc48adcb..b685afac436 100644
--- a/include/gdbstub/helpers.h
+++ b/include/gdbstub/helpers.h
@@ -16,7 +16,8 @@
 #error "gdbstub helpers should only be included by target specific code"
 #endif
 
-#include "exec/tswap.h"
+#include "qemu/bswap.h"
+#include "qemu/target-info.h"
 #include "cpu-param.h"
 
 /*
@@ -33,40 +34,49 @@ static inline int gdb_get_reg8(GByteArray *buf, uint8_t val)
 
 static inline int gdb_get_reg16(GByteArray *buf, uint16_t val)
 {
-    uint16_t to_word = tswap16(val);
-    g_byte_array_append(buf, (uint8_t *) &to_word, 2);
+    if (target_big_endian()) {
+        cpu_to_be16s(&val);
+    } else {
+        cpu_to_le16s(&val);
+    }
+    g_byte_array_append(buf, (uint8_t *) &val, 2);
     return 2;
 }
 
 static inline int gdb_get_reg32(GByteArray *buf, uint32_t val)
 {
-    uint32_t to_long = tswap32(val);
-    g_byte_array_append(buf, (uint8_t *) &to_long, 4);
+    if (target_big_endian()) {
+        cpu_to_be32s(&val);
+    } else {
+        cpu_to_le32s(&val);
+    }
+    g_byte_array_append(buf, (uint8_t *) &val, 4);
     return 4;
 }
 
 static inline int gdb_get_reg64(GByteArray *buf, uint64_t val)
 {
-    uint64_t to_quad = tswap64(val);
-    g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
+    if (target_big_endian()) {
+        cpu_to_be64s(&val);
+    } else {
+        cpu_to_le64s(&val);
+    }
+    g_byte_array_append(buf, (uint8_t *) &val, 8);
     return 8;
 }
 
 static inline int gdb_get_reg128(GByteArray *buf, uint64_t val_hi,
                                  uint64_t val_lo)
 {
-    uint64_t to_quad;
-#if TARGET_BIG_ENDIAN
-    to_quad = tswap64(val_hi);
-    g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
-    to_quad = tswap64(val_lo);
-    g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
-#else
-    to_quad = tswap64(val_lo);
-    g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
-    to_quad = tswap64(val_hi);
-    g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
-#endif
+    uint64_t tmp[2];
+    if (target_big_endian()) {
+        tmp[0] = cpu_to_be64(val_hi);
+        tmp[1] = cpu_to_be64(val_lo);
+    } else {
+        tmp[0] = cpu_to_le64(val_lo);
+        tmp[1] = cpu_to_le64(val_hi);
+    }
+    g_byte_array_append(buf, (uint8_t *)&tmp, 16);
     return 16;
 }
 
-- 
2.49.0


