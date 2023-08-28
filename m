Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697B6C83F12
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 22:15:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qakUK-0005uA-MB; Mon, 28 Aug 2023 18:13:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qakUJ-0005tU-LH
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 18:13:35 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qakUF-00048t-74
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 18:13:35 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fee87dd251so34852375e9.2
 for <qemu-riscv@nongnu.org>; Mon, 28 Aug 2023 15:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693260810; x=1693865610;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uMoJnfVgaQ/gSCJ1EcKalX6fTZe7ML+oEsM4UrP9ySg=;
 b=ueRVCvKg2mCfDpdrpsar4KWAKAQlZnxAwTgezKNFmIMX2ApvXjHpM8UyClm6Kh6AoZ
 +A/6w6hOUVCJEvM+CMOL+zSXfNuu9h1yW3UG441TQGuZcNlJhJDtDKEIJ+6Eo/tArxqo
 2gCqWZSJfPo4X9gJTl5qwYxJ4KRLlO0+1MtxCGe8nQmUiXJD6/VoQrG6iPGKNYO3koMA
 m2HxNN1A9VmW4BIe3fruRTWO2x/nQnP4DLfad1mU4NxK+Q7Z72lXiBpc1tFrGfdBb1Jh
 UdHvYI3X7ypsW0cnCK2FXqBqUi62LtnxEA64F25498Qor3zwDNUMG0ondGCHX3IgoyPN
 xAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693260810; x=1693865610;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uMoJnfVgaQ/gSCJ1EcKalX6fTZe7ML+oEsM4UrP9ySg=;
 b=KjOYo5IMYwtyW+aOqhbuaUMOKEr8Pb6GFZvoHiRCQ1CSsUg3gXzGiiRyQtdW3df5e2
 Vzan4qUxFFEKjK0fBkaouDbvFA6cDYGJnq7ai1bHV/zhc8hry7OYnd4XRgMW8DQRIwy8
 Xc72jMta8ZCinUqFTXu6qbiAvNF961XeEBJdHnFMmeGlsTMzE+6VzOzMZcnSt0Kkbf5m
 4A1DdBgtlUzhHuvQZUP25w7GimEGNoG1X39XdJPKM1qyuuKq71NsiPwMCbeRWH9Oi2hl
 3v5fGt39LONt4AM2nIVuC5RZ7NCu8UrCEGxlSDG7kO6eOQPXGcUjIdebIOakGCIMSGhR
 ty1w==
X-Gm-Message-State: AOJu0YzCbmTlpwafg2pJZyrHcWOnhfn7T0I7pHI9un8VWTtoTJGh8Uvb
 SvoHQ/FrDrmaObQrOlVT6xtBAA==
X-Google-Smtp-Source: AGHT+IEe2TUUTRhdZ8Kt7OhGN+ERIYjj44nF60thqqaLbUi4pYCTgspdgNA/Dl6Ahxs/kYIs3V/F5Q==
X-Received: by 2002:a1c:f304:0:b0:3fe:4900:db95 with SMTP id
 q4-20020a1cf304000000b003fe4900db95mr21506058wmq.37.1693260809816; 
 Mon, 28 Aug 2023 15:13:29 -0700 (PDT)
Received: from m1x-phil.lan ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a7bcb89000000b003fee777fd84sm11904037wmi.41.2023.08.28.15.13.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Aug 2023 15:13:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 02/11] target/riscv/pmu: Restrict 'qemu/log.h' include to
 source
Date: Tue, 29 Aug 2023 00:13:05 +0200
Message-ID: <20230828221314.18435-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828221314.18435-1-philmd@linaro.org>
References: <20230828221314.18435-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

Declarations from "riscv/pmu.h" don't need anything from "qemu/log.h",
reduce it's inclusion to the source.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/pmu.h | 1 -
 target/riscv/pmu.c | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
index 0c819ca983..d2be06a133 100644
--- a/target/riscv/pmu.h
+++ b/target/riscv/pmu.h
@@ -16,7 +16,6 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include "qemu/log.h"
 #include "cpu.h"
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
index db06b3882f..36f6307d28 100644
--- a/target/riscv/pmu.c
+++ b/target/riscv/pmu.c
@@ -17,6 +17,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "cpu.h"
 #include "pmu.h"
 #include "sysemu/cpu-timers.h"
-- 
2.41.0


