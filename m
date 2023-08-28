Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6534C83F11
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 14:57:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qadeq-0003ER-7v; Mon, 28 Aug 2023 10:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qadeo-0003Do-AI
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 10:55:58 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qadem-0000cU-4Q
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 10:55:58 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-31c6d17aec4so2807198f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 28 Aug 2023 07:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693234554; x=1693839354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CDnk9YSeaoJdQRRB9TTsPC8B6FMZ/ZKTWzxCgLttq3Q=;
 b=RX0Ofg5KAXxE9CDOWpykX8qYJeHS2VRbi9dmFytIAybRaja/e+N1aawJ3Ja7qiw78j
 uz/xTipwL1cXatc3MLu2VtGxp3fBWQmLGV0EYsWsOpmMVPBL17/wXaMAwTV+4tKvVcO8
 J2jeyC1jmzJIhk4XCV817THqBF6btaKqOHUSkl4yoYLfl4GiFjYWXHWBjKW6QDvSvThJ
 Ub6qbwgv+uygkpb+BlSuY3p2UODY94HNZUiLhCeQ/A4valJmrYNhCGBQvRyifhTdbn0K
 ZPbra76QKYS8rUU6Ki73MUK7dNR9K0P18fZwvRbej4luWpCnOPMaClw7ioMnOj2XW3To
 b+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693234554; x=1693839354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CDnk9YSeaoJdQRRB9TTsPC8B6FMZ/ZKTWzxCgLttq3Q=;
 b=Nzz3sdOMYloASuuDsZ0ukHei/kUXtpiscZc9b28oIPO7LS6LZDwvXkrMXAA1QiZ27d
 hb2ZSw0MVeK/XCaVzxo4KamPmfkWVa0O+/elQt+FjI4Bh7+oqtEAMRiMpFEaFqQG/JDY
 98s62if5ZQGoHo2GYteMXZgPx5hCdkBE5HS4A0LDMgTDBAltHzR7aNOU76OZlnN9xgbu
 jSy2PtOA9tkFQmTVLTc1t3ZW6k1xMBticswmbXfMIwSKsOv7IclyUE4SD2PNsKhdHC3h
 V3ml0TVLuTXAxQhtXQk5CaudMSkBLeUZBTElMJkbqkG83GJoYb0FklmImz4J+LnFOP/l
 Fh0w==
X-Gm-Message-State: AOJu0YxtP+MTEX4Dvql+neW95WhpjIbr5FyVbQ9K9xzfqTaAKH6hCHvY
 3AImJXXMDh9rrf28ZrvW3fcBdA==
X-Google-Smtp-Source: AGHT+IFtKPqn9H8dM0EcnoJ88txDSTB5+rb0cw/Kq6A6007wcuecFxh2eDDZomlIGJ97V8a625rtdA==
X-Received: by 2002:a5d:688c:0:b0:31a:dc2e:2db2 with SMTP id
 h12-20020a5d688c000000b0031adc2e2db2mr18174702wru.49.1693234554675; 
 Mon, 28 Aug 2023 07:55:54 -0700 (PDT)
Received: from m1x-phil.lan ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 z19-20020a05600c221300b003fee9cdf55esm10908709wml.14.2023.08.28.07.55.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Aug 2023 07:55:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/8] target/ppc/pmu: Include missing 'qemu/timer.h' header
Date: Mon, 28 Aug 2023 16:55:38 +0200
Message-ID: <20230828145545.81165-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828145545.81165-1-philmd@linaro.org>
References: <20230828145545.81165-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

Since commit c2eff582a3 ("target/ppc: PMU basic cycle count for
pseries TCG") pmu_update_cycles() uses QEMU_CLOCK_VIRTUAL and
calls qemu_clock_get_ns(), both defined in "qemu/timer.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/ppc/power8-pmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 7bb4bf81f7..2537cded83 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -16,6 +16,7 @@
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
 #include "qemu/error-report.h"
+#include "qemu/timer.h"
 #include "qemu/main-loop.h"
 #include "hw/ppc/ppc.h"
 #include "power8-pmu.h"
-- 
2.41.0


