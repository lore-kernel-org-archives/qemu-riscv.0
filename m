Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63567C83F12
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 13:13:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbhJO-0004x7-Iu; Thu, 31 Aug 2023 09:02:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhFk-0003K7-2S
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:58:33 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhFh-0005Zz-CI
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:58:27 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-400a087b0bfso7534995e9.2
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 05:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486703; x=1694091503; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=npXC2cUG3xwBM86LQFtlABD0NAvwwGboOAIVdLWrRRI=;
 b=M6c02v5UqYa4WmSRhnXr81EZ8h646oOAEtyJMpQLOm2jEfnUPS/aeHCnf7uWW9BznD
 tSS5Afi2uttVt/WuXUcFgty6t1mjkk644s/cTn6PephoVZ5u5grPvpC0hUko1Gh9fkCu
 y+oFHz4drO4CpePNxdi8Sy7bEkHDN5qteGY4EFm93OXTvdC1IYoOzKdo3zeY+DCCwqis
 i6bawe4XwVQy+EMxygHK/R8x+Q5HpFXh9W8r0NrQCcjE2vj2yl23Rln6IPMZSAHOh+mu
 eMEenChJf53ubz72RoU1x/XOSUp2Hg3Ya++dUkDRfBWBrw7fKyDmHFl0H/ljDjcf4OvW
 tMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486703; x=1694091503;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=npXC2cUG3xwBM86LQFtlABD0NAvwwGboOAIVdLWrRRI=;
 b=PUMOWuHeiVB/ZSgQUPc3lJqwAnbt7HBTT/HSOx5o5SqJywYaiEQxg6wD4Bidcf9P2T
 L271yXG3C7FLMPmxE01cfjB6rHbPIxTQAKwtdPSRZRRuCt9x/HJX7d2Ebta+QESW9Dft
 z9OgvKLFqvFNOCSNaeyUl3D2jpHNVV0R3uehHnKVI47eFvf4yPqkPGodDoc8GW/6D9Bc
 Di3IStmWDaSrjU8foyo6+41x957ShNjPXOE4vU6hT0pRsT4pqzSXopvezULZuewkmvV7
 XStDswYC6PrZRFbYE7u3ToCSxeINvvl3JhD4za+/c+p7i4NfZCpS2jYMVLNGVwbtlFU7
 SW/Q==
X-Gm-Message-State: AOJu0YyHrZW419CXfffbVpfuoMzeQBCxCN2HK2KeGmTSSbWaXk56fP1y
 lHAdslm4wmfxXYnRf1fU0esBMA==
X-Google-Smtp-Source: AGHT+IF/kQ8rtUaspuxVwfY6yFl4rAW5NPGAS1z+mQJxbjazGbYEGqdzD3ogOqjVpsBTED0wXLH5uw==
X-Received: by 2002:a7b:cb8f:0:b0:401:d258:ad26 with SMTP id
 m15-20020a7bcb8f000000b00401d258ad26mr4401784wmi.19.1693486702890; 
 Thu, 31 Aug 2023 05:58:22 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a5d4ac3000000b003141a3c4353sm2134044wrs.30.2023.08.31.05.58.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 05:58:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [PULL 16/41] target/xtensa: Include missing 'qemu/atomic.h' header
Date: Thu, 31 Aug 2023 14:56:18 +0200
Message-ID: <20230831125646.67855-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
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

Since commit fa92bd4af7 ("target/xtensa: fix access to
the INTERRUPT SR") these files use QEMU atomic API.
Explicit the header inclusion instead of relying on
implicit and indirect inclusion.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230828221314.18435-10-philmd@linaro.org>
---
 hw/xtensa/pic_cpu.c        | 1 +
 target/xtensa/exc_helper.c | 1 +
 target/xtensa/op_helper.c  | 1 +
 3 files changed, 3 insertions(+)

diff --git a/hw/xtensa/pic_cpu.c b/hw/xtensa/pic_cpu.c
index 6c9447565d..8cef88c61b 100644
--- a/hw/xtensa/pic_cpu.c
+++ b/hw/xtensa/pic_cpu.c
@@ -30,6 +30,7 @@
 #include "hw/irq.h"
 #include "qemu/log.h"
 #include "qemu/timer.h"
+#include "qemu/atomic.h"
 
 void check_interrupts(CPUXtensaState *env)
 {
diff --git a/target/xtensa/exc_helper.c b/target/xtensa/exc_helper.c
index 43f6a862de..91354884f7 100644
--- a/target/xtensa/exc_helper.c
+++ b/target/xtensa/exc_helper.c
@@ -31,6 +31,7 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
+#include "qemu/atomic.h"
 #include "exec/exec-all.h"
 
 void HELPER(exception)(CPUXtensaState *env, uint32_t excp)
diff --git a/target/xtensa/op_helper.c b/target/xtensa/op_helper.c
index 03e2c1889a..7bb8cd6726 100644
--- a/target/xtensa/op_helper.c
+++ b/target/xtensa/op_helper.c
@@ -30,6 +30,7 @@
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
 #include "exec/exec-all.h"
+#include "qemu/atomic.h"
 #include "qemu/timer.h"
 
 #ifndef CONFIG_USER_ONLY
-- 
2.41.0


