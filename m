Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7ED2C83F14
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 22:15:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qakUC-0005ql-S9; Mon, 28 Aug 2023 18:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qakUB-0005qS-Do
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 18:13:27 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qakU9-00047v-99
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 18:13:27 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-401d2e11dacso2475685e9.0
 for <qemu-riscv@nongnu.org>; Mon, 28 Aug 2023 15:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693260804; x=1693865604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CDnk9YSeaoJdQRRB9TTsPC8B6FMZ/ZKTWzxCgLttq3Q=;
 b=P7BR8xaDjcJGshJySCVQVljJUEjiUazbpSm6e1BrSRK+dCfM7YZ4UL3KGATyHUIm1v
 0n6TjpdingX0FubBMXjURoyLyOfDVd2nooMZL2IRehWAnC46vCUeSBBlSRDJ8q0lv1iy
 vqYmYypvtpHR9mv8E0O9krIbh2FpkurwLZd9aUJJ8zeJbIpVvVwpHFDlnWptsZE2Sh2R
 dBN9pPlV+AW0EPgyUHiX12xfO1wwQam6kV0iXkZu1cRAl6xabGMr4M+KUfuBmj5LKWM7
 Auo23CNqfNZ74J7crYM8/Ey2XTjImyGGSVHQER1R8NY068/ItAuxIA8cBGehJEncdVg6
 Zx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693260804; x=1693865604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CDnk9YSeaoJdQRRB9TTsPC8B6FMZ/ZKTWzxCgLttq3Q=;
 b=IQu+hKdlo00+RSQa0cUGa4uH90s+G+gHD9KAbILVJ3UrStJDM7px/2/o6fqZGW6vG6
 cy34cOIa4MXeGNztmFoQxfL1f2dOyWlOvYTdSdKze8bxhlhlJ7Qa6oPXkhg0smHYjNoU
 suunXLoYWK6LeTY6rv7kizneYZ2iFTYIWIEhyBbjcJTO9gPrRhNGUivNup9m/YOhZeyn
 Sq2HsMZRumD/95QyBWhIvSMVkKMTLxvwRbbWO0ubTP2AjT5myosXjTAsQx1A77cYZ63P
 O5ysX1fsKjH3wlSXiS+TNWdV7qRVeh2aujaAFXuLV/iHVwBsVSLvxD/HJ8SQnqFv1gAt
 dJgA==
X-Gm-Message-State: AOJu0YzkBQDT1BUKgHSks7sVRLBy76YP1HZaSzqrXYFu/xrjQlIv4v3r
 BZSDWZuff3776tFsbwANCy64dw==
X-Google-Smtp-Source: AGHT+IHPvQrHbNHJ1Cn+83ARyJjToN6jv5cfY3yRFi8hdT1JXKLwAncQEdY+0AZgTULZpOckfOJihQ==
X-Received: by 2002:a5d:530b:0:b0:317:ce01:fe99 with SMTP id
 e11-20020a5d530b000000b00317ce01fe99mr605633wrv.9.1693260803920; 
 Mon, 28 Aug 2023 15:13:23 -0700 (PDT)
Received: from m1x-phil.lan ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 u5-20020adfed45000000b0031984b370f2sm11756175wro.47.2023.08.28.15.13.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Aug 2023 15:13:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 01/11] target/ppc/pmu: Include missing 'qemu/timer.h' header
Date: Tue, 29 Aug 2023 00:13:04 +0200
Message-ID: <20230828221314.18435-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828221314.18435-1-philmd@linaro.org>
References: <20230828221314.18435-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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


