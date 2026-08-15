Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21304C5CFC1
	for <qemu-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 19:49:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvKKv-0007Ym-FS; Sat, 15 Aug 2026 15:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvKKg-0007Jg-Ox
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 15:46:21 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvKKf-0008Kl-5M
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 15:46:18 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2cca0c5799eso19522535ad.0
 for <qemu-riscv@nongnu.org>; Sat, 15 Aug 2026 12:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786823175; x=1787427975; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ki19VWjqhUrb9W5NVrRU/ayXP3I7g7OAHfGnfTrb0dc=;
 b=mTtuLKkQ38fHV1kw1UHjRl5dP4rDS5hLDBqlvOhZfXMP2orC34lQCe5Tzb+FrX2i0M
 f8y/HBpjIDxoVRoc6eQpPPd8+0gdP77W9PflFg24qfRx5K8j+aqCLN8PYBlO9UY0h48L
 c+ImAsMBOtNVfkjCkbC+WsYkDII7x4GaC3SPj+P75uZA8E7lWCdCZCcXFMIWHWM9jxRH
 7hZUvPbILjuedWCESNX20YFP2qTkEkNhrjMZJYgosYqjkad7cwBm4WRKxJFWcpn8w2YA
 GuFkqxXi0eYkXiTQkAlv8hUe51r8JRa8EiWrq2ObVXqRHReEYwqH7KsIXuV9NF69LMjz
 Jn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786823175; x=1787427975;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ki19VWjqhUrb9W5NVrRU/ayXP3I7g7OAHfGnfTrb0dc=;
 b=imGjNRxoV8uCV2lo8NIXEqwYs6rXWaRIUFS9WYtLT8TcuAfWZ5JnifqSAMIy0dByBQ
 OpzKYRLiHoQoaQ9Xy9Tx/tllJdhfXSPq2+ae31ANswczbd+vqVF3eC1gzFTBbDFI368r
 spPD7pxmYxhKwjn6M9RJiOvjWZTjnR9bxYIMmIR5eUsgMRt+KTmS8F4yWl/XU3oVkJzW
 Lv9eqj6+rOSw5ApU689EvmEAP/+8QdVD0Vi03K7YoMgEI+MSPc3Jho3H1agoDAPIvg8e
 A7rNwp5piuKdFfm3lvSCKTSwvKLG9C2jj0DnDuEGHgzKMZ/YXZibUTW9NfrUVN9jf9BO
 cdAQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrs7iNg5SWA2M3UxRmYO9+wpl5aqoiDqwTTzMGB8PNZZnNU78czxeRVZIMpRs5m2BYYQsqsISteTCI/@nongnu.org
X-Gm-Message-State: AOJu0YxuAlOYefyxV8hngkGuLBu78IXW9aC+fqljeT6JtsRsgl/WNQgo
 IRswx+l8yDvsQxQQwdEvkca9l0opocrXLNEvddgHDFfhIz8rCtMEN6akOuMID/eZ7wQ=
X-Gm-Gg: AR+sD10uAjF3OGwpj/vtC8izrEE4PkJDtxlA/MgeAOSS8alb2Z4CaMJqxpI+BAN7Esg
 eACUFNnvt4v0p5JNZO5u0YyqVmbJRhTYQ3Ophey99cS+uxCkc+58sMpcgxDjzH/Ou74vTbA6Atk
 2kgcGKbloNxobJnaej6XfrhCd50wVU/cjYnQ+ShNrKSPfZiGViENwBhgYCFkzTTcsWCPHFzE8v+
 nErCxskMrScTBm04u7NU+Cuf+BU/Xgsn84bhkeLlY/D6E3LszeR5PmVqeFWWrNqAuZS233455Nh
 F7KIYbKqYjqI1Jciu8Kes2LepRJmqcwgKXmcUyBKzYaM/QVPTtMGMNqF4DK1RMIDdWZ3L6B8Dks
 074IG+MVJ/MGNRPWd3PdffNbC/uOb9M/2CY+hwsI/BbySOSS+udyOYYybJmI/5AAzz2LuuvKXaE
 dQl71XXs6r99W0l3YpOSjp0ArOHtD+LEF42LkcpXKvVatSsJo82XFSNq7Gsl70SNSMs2MPf1KBx
 R8bNslfctyrYRIzbndDZgKWIji30HQ=
X-Received: by 2002:a17:902:d4c1:b0:2c9:c517:d070 with SMTP id
 d9443c01a7336-2d3b0ad45d3mr144910895ad.3.1786823175273; 
 Sat, 15 Aug 2026 12:46:15 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d3ae753ebcsm21179465ad.5.2026.08.15.12.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 12:46:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: frank.chang@sifive.com,
	max.chou@sifive.com,
	qemu-riscv@nongnu.org
Subject: [PATCH 14/23] target/riscv: Mark VSTART_CHECK_EARLY_EXIT unlikely
Date: Sat, 15 Aug 2026 12:45:39 -0700
Message-ID: <20260815194549.1377505-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815194549.1377505-1-richard.henderson@linaro.org>
References: <20260815194549.1377505-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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


