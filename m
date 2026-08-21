Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CFFC5DF7D
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 04:05:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxGUS-00066X-S1; Fri, 21 Aug 2026 00:04:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxGUR-00065B-AQ
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 00:04:23 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxGUP-0003DM-P8
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 00:04:22 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-38e347638adso519303a91.0
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 21:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787285060; x=1787889860; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ki19VWjqhUrb9W5NVrRU/ayXP3I7g7OAHfGnfTrb0dc=;
 b=bxykv2A4wBgeDyRSBNaGtWGUq2wSugk6yIG+LPBjcfOUqdGxCEhFOtXKmGiwWBWnQC
 Lyz8ijOPKA5hbiqOY8pmCrllD7SNnQpmK18bW3m3xrvgN2lz7frsi+KINC8eohZBwKqj
 UXql0HtFnBaayJCdPK3bcFqnnu1cEFkI8ckwQNs7ZRGsPkQzsbd76Mlah7ykB/p8j9pM
 i+kbWZ9vVmA+YKdBZi8PiAFViXirTMBSGSjQKQjUxlCuUkb3UFRegL2/YJQH5aiuARCJ
 NmID03i8YFRJI46ClunumQOz3jnSJTq4HjbGe0vfwLZ+vZIqwi3p3eVatNrO5MboXdsi
 Hm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787285060; x=1787889860;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ki19VWjqhUrb9W5NVrRU/ayXP3I7g7OAHfGnfTrb0dc=;
 b=XcCb3OtAWxxGENjYn7dDQT5VTYxnofzhSj4cCcwk6sVNXfTCCJ9K5626VeZavdB+Y9
 imNO9U2Va15j5WT2AeKZT5eon2S2S0VRNfJgkuyBUWCAKg33VTtCXBwUzkHy0BeanJUv
 kaSqCcPwIT9ulqZjPVbwlP08ihtc85TcmN0LTzPfMLX9PBgyz4xzgIQa5wgTU7u71SYZ
 4ms/9hFtKopHtp8/T/t1gEtI10ZbRvXgZIr+tqDSJVhuJtv5IvjHFhsvTjzVqwif5XNM
 ZcZ7vnB4wmOYYV9CactoqMo9hv+5z60FdvZrgAY9h99q3weVsQjVAyOihd1Xdk/I6TXn
 oVtQ==
X-Gm-Message-State: AFuF++l2HSbVsBrzkVPVPiT+/rvtOiZ8f7+m/OC73D+OtfRqC5STmE6p
 DyhXAtWVeaxJCuGdBth5xbgUsLA8aYmEPieoFohfDZw8YoZD60RqykG4Tw1ZqCwtbP0=
X-Gm-Gg: AR+sD129k4JOSqBLFrN2H1ndhSf823rXeHTgiB5XI5XPjmcYoHYqCXb33LB/y7qH07n
 20UcW80TTuCqXYUJZLHwl4AncPUFDVsASpWqwyEhTgDfM9SCB/HsrDSxeDWj0BUHqVAcmepqxUf
 jkaaZaEiEMAL+E1eYpoMoMUH9MgxAwowA2QYA8UnAXP2kcnJj7cNudac1N7CGV1hV0ERGEcePn3
 Om7ZPJzrFQaEbp/U1aVcL9+5NFr8KrucY1OWpGyJDMk7sXqTeJiwZzWpJZ7DwPvnAeP0T2uDhwO
 5SxCthNkF+K1fKqCOPQDnDXQws+xcIO5tABhUXHgnpvSkzcWDMpE0E4AnKfyDWnSUcvFeJVrfD8
 GjClMXBIgYkIncIZaK925DQv7Y/Z8kUfrAARYnbZo7gIXqwywGDHwztFGMe+63Sa1oQd5KKPlti
 PiRnClgwt38lunBAF1ADkhRfgG650F4fAhRuTUnwDZK87yRDU8LG3E1hId78H5Z4r4qxF1
X-Received: by 2002:a17:90b:2ccb:b0:36b:bec8:94c5 with SMTP id
 98e67ed59e1d1-395c35ba5aemr6408309a91.10.1787285060350; 
 Thu, 20 Aug 2026 21:04:20 -0700 (PDT)
Received: from stoup.. ([108.174.179.84]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-395c4c194d2sm1298383a91.15.2026.08.20.21.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2026 21:04:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH v2 12/23] target/riscv: Mark VSTART_CHECK_EARLY_EXIT unlikely
Date: Thu, 20 Aug 2026 21:03:53 -0700
Message-ID: <20260821040404.268123-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821040404.268123-1-richard.henderson@linaro.org>
References: <20260821040404.268123-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
 target/riscv/tcg/vector_internals.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/tcg/vector_internals.h b/target/riscv/tcg/vector_internals.h
index 5681b81815..d081397f65 100644
--- a/target/riscv/tcg/vector_internals.h
+++ b/target/riscv/tcg/vector_internals.h
@@ -26,7 +26,7 @@
 #include "internals.h"
 
 #define VSTART_CHECK_EARLY_EXIT(env, vl) do { \
-    if (env->vstart >= vl) {                  \
+    if (unlikely(env->vstart >= vl)) {        \
         env->vstart = 0;                      \
         return;                               \
     }                                         \
-- 
2.43.0


