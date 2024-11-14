Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9650D637CF
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 01:20:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tBORs-0008Va-KC; Wed, 13 Nov 2024 20:15:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBORR-00082W-EV
 for qemu-riscv@nongnu.org; Wed, 13 Nov 2024 20:14:37 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBORO-00027A-LX
 for qemu-riscv@nongnu.org; Wed, 13 Nov 2024 20:14:35 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-432d86a3085so944925e9.2
 for <qemu-riscv@nongnu.org>; Wed, 13 Nov 2024 17:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731546873; x=1732151673; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WwdhRXN0joprmzKwfGffR3OdfbOtF5yrdb8wFJrdlRk=;
 b=rTYxEk/qxNbE/AyiTlJfOQ88rnK0CdC7ZmU9ZgXVb8m0CRJjyGhM/KwtPgKbNz9klU
 HpNkbCXOK1E07G74Cx2ZnNEqAEGlj4bx6IVKAAdKX/NpSR/8Ghj2E/+JLpzxE4ACXQIu
 O/Co+04xnhlDNeQr6oUS4VXOERo9UbArcoR7Fs1dLLbF49K/ZW4yMLxUI2/lnN52cr4w
 zsSerUIEXRtDofoSxX+7i7CAVSvZixwxioH8reTp/R1z60X8X+2o4ZV0lWlW9gRuJC1u
 OoUyUBoJuLA0eum5VeCsywbwSkQWANYZTY/DEd8auRtVBeZciupVd19+7wjA4LVsVfQU
 HVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731546873; x=1732151673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WwdhRXN0joprmzKwfGffR3OdfbOtF5yrdb8wFJrdlRk=;
 b=e2qD6gV/No5ifwn4k5/5g2Qys0srsZH/Q7kK06MjUGV6i6W3CpicSrY5dg2VzxzPRI
 0qMCzate2phxTwPDrUml3EQh6UN4dQFIXxV5ksLPqYRHal8VsQ5I8fc8BsFezBIq2qFf
 FGSGeYShSqQglcPJ96OapPwFqU3m7NXIn9kvBenx1nELcAwiGbfzoNkMUNrgQO0iOwIh
 rcD2QDYTo6ukWU998b11STu7SapipXXeJQUMhkEni3j7DpM3T4qJHBffS0XeZyFg7qEP
 yDkGynIZWf8J5Z8dFC3oEWZHIGkwWlY9hexhRjHCotY0D/c11NSMGMOT+BNtM9eYPb3F
 gR8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUs379FUECgrdRAg3nweCuIKMlMiKfGXEYS7AukMBIa88RKm4UAOMS5Sg185K/vGSiZ1pNXu50NhLiX@nongnu.org
X-Gm-Message-State: AOJu0YxRbl3u1ihB7+llthndsFRKx6bbGcI3lx+wsjbzurLJ4OcwG83M
 lIdw5TmOxM+w5blt0WobuZ9UPd397Iw6lyx+y1Vk09/k+GP/h+H0d/lMlmtnSVI=
X-Google-Smtp-Source: AGHT+IE3ms5xpjQHGWXmVlg3v8W+KzlHKEnbriHG+Xzyq9cJJh/6mR5hbnlsDRfww5BsPv6tn+pTYQ==
X-Received: by 2002:a05:600c:1d1c:b0:426:6308:e2f0 with SMTP id
 5b1f17b1804b1-432da7cbcefmr2174995e9.26.1731546872750; 
 Wed, 13 Nov 2024 17:14:32 -0800 (PST)
Received: from localhost.localdomain ([176.187.209.238])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432d48baa42sm33170825e9.1.2024.11.13.17.14.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 13 Nov 2024 17:14:31 -0800 (PST)
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
Subject: [PATCH 09/24] target/arm/mte: Restrict 'exec/ram_addr.h' to system
 emulation
Date: Thu, 14 Nov 2024 02:12:54 +0100
Message-ID: <20241114011310.3615-10-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114011310.3615-1-philmd@linaro.org>
References: <20241114011310.3615-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

"exec/ram_addr.h" contains system specific declarations.
Restrict its inclusion to sysemu to avoid build errors
when refactoring.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/tcg/mte_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index 9d2ba287ee..b017b26d07 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -23,7 +23,9 @@
 #include "internals.h"
 #include "exec/exec-all.h"
 #include "exec/page-protection.h"
+#ifndef CONFIG_USER_ONLY
 #include "exec/ram_addr.h"
+#endif
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "hw/core/tcg-cpu-ops.h"
-- 
2.45.2


