Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE7BC0219B
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 18:21:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tg6Sf-0007dq-O3; Thu, 06 Feb 2025 13:18:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tg6SW-0007aA-Qn
 for qemu-riscv@nongnu.org; Thu, 06 Feb 2025 13:18:40 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tg6ST-0006nZ-85
 for qemu-riscv@nongnu.org; Thu, 06 Feb 2025 13:18:40 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-436345cc17bso9207305e9.0
 for <qemu-riscv@nongnu.org>; Thu, 06 Feb 2025 10:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738865915; x=1739470715; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6LHjztvOXiDQDfjzUacIFhli1dmDqwSPlQwLVgEIi+o=;
 b=Pre/BAxJIQ8nd5r1OBDzQtMaFgEh6RulGb/kyQXP88RXjybEGXpSugXBFXpZw/qekL
 o8hS9/8nOxQ4yR83R6DiCcITKV3yUn4XJL7YuUpz7RBog2lRHikKVmT/hRlStVwsL73w
 a3Jomr39EBjM88bcAbrrbXf0cBCkwhpAOAmeO0tGZOBwYcI5IvQx3L7vqsLy3VLdJXgo
 sl8GYwd72O0JmCjeW3sf2OXYFTkyxsJxjmt4ECklVGQbVwyVwtKNcG23rQ5WrUVGmGIH
 gFG7o3N7oezF4X9ZuzrbqqIwXvq7VSkB0oGOjJeC7aFuoDt/ghI6yGiIsBItvibTZF9x
 ED3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738865915; x=1739470715;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6LHjztvOXiDQDfjzUacIFhli1dmDqwSPlQwLVgEIi+o=;
 b=skn3R0KdKTGBLwNek7JL7eqEb1PmvOokf+/+6Q6tCEAXGHp673hHkGi6UX0UXD709j
 36Mpfft5bz3+1zuMR/rN0MuIuMG4OVKYbf7BjCqcLh2EFbysQaaZCQ6QsQ0TKWek++rd
 r36F+8yJfjASjQc1SWHoajCvACDWB71Cmsy+RMk/LDoqsh+ecJXa2kAHmQX3eqNV0uYS
 AGUNM7uSbC+vkyvRHsb+jQ42r/ecJ9NITDNczL7eDRkovRTbeMlyLzlRJ1JfJq3h+CAV
 CqCSGyTfO37ht12dSI56VuUJh8gCvyqyNF8BnJitJAKA4Q1SK2ZGWIcfZZWXbpubZhxU
 XpeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYD7P/p8eju7LoXmTw3m5ZghlPdsWsqCLFjHUPCrhC6Y0itZI1UCRd1oSzVPuijmUb0M1NerTMiXwc@nongnu.org
X-Gm-Message-State: AOJu0Yys6OWh9tYrNsd9n72at9xsrOb4PQ9NoFCQThEtoL9nBabu5/s8
 Axya95OKXIZ4rqgonxMlpFNsW3WgNu5ar/30RE1W3lwGF/sA5wSNDpL29SL8n7k=
X-Gm-Gg: ASbGncusDs52G986jBaMmXCNIb0Ya+72Kzld//0l2RnScx+zxnZVNRSOX4reNFyM4UD
 RdPXpWlY8DKdKi5d9DWtDnFVVCxwuQdaIpjqnVUpGdLnfVRuesC+Fzf/rkWLdSmZbiYKijysbRD
 oM/TkgWEdkd/qyrRED70gS165/9/pizodOuMkfV1QztrpLx1uuYXHnkqpkTzLbVqqaqYGlW26Ni
 MoeM2Np7Qv9j6qGjNOsbyHMHToGeId4FGioOMsiF/LjJbCOMRjrdXgcjZs5Jb9jSPAyawRVr1Jj
 bIFV3eHYuU6myGxW/MK+YHEc9yMX1qIIzBJ2nBAj7wfoNB6OovTcV2U/7EsO/+v/MQ==
X-Google-Smtp-Source: AGHT+IHWsdt7Hu475L9U/wXrO8KwbKW2OPsB4SJj840Ah0NqXBlSgye30DjFHJDj7fkskVwA7kuF8Q==
X-Received: by 2002:a05:600c:219a:b0:434:fbda:1f36 with SMTP id
 5b1f17b1804b1-439249b2ecfmr3525805e9.20.1738865914625; 
 Thu, 06 Feb 2025 10:18:34 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391dcae80dsm26339635e9.22.2025.02.06.10.18.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 06 Feb 2025 10:18:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/7] MAINTAINERS: Unify Alistair's professional email address
Date: Thu,  6 Feb 2025 19:18:21 +0100
Message-ID: <20250206181827.41557-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250206181827.41557-1-philmd@linaro.org>
References: <20250206181827.41557-1-philmd@linaro.org>
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

Alistair's email is typed differently, so the get_maintainer.pl
script add it twice :) Unify to reduce traffic.

  $ git grep -h 'Alistair Francis' -- MAINTAINERS | sort -u
  M: Alistair Francis <Alistair.Francis@wdc.com>
  M: Alistair Francis <alistair.francis@wdc.com>
  M: Alistair Francis <alistair@alistair23.me>

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0cf37fce7b5..b7ac1519ee3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -318,7 +318,7 @@ F: tests/functional/test_ppc_74xx.py
 
 RISC-V TCG CPUs
 M: Palmer Dabbelt <palmer@dabbelt.com>
-M: Alistair Francis <alistair.francis@wdc.com>
+M: alistair.francis <alistair.francis@wdc.com>
 M: Bin Meng <bmeng.cn@gmail.com>
 R: Weiwei Li <liwei1518@gmail.com>
 R: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
@@ -753,7 +753,7 @@ F: docs/system/arm/digic.rst
 
 Goldfish RTC
 M: Anup Patel <anup.patel@wdc.com>
-M: Alistair Francis <Alistair.Francis@wdc.com>
+M: alistair.francis <alistair.francis@wdc.com>
 L: qemu-riscv@nongnu.org
 S: Maintained
 F: hw/rtc/goldfish_rtc.c
@@ -1009,7 +1009,7 @@ F: tests/functional/test_arm_tuxrun.py
 
 Xilinx Zynq
 M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
-M: Alistair Francis <alistair@alistair23.me>
+M: alistair.francis <alistair@alistair23.me>
 M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
@@ -1593,7 +1593,7 @@ F: pc-bios/vof*
 RISC-V Machines
 ---------------
 OpenTitan
-M: Alistair Francis <Alistair.Francis@wdc.com>
+M: Alistair Francis <alistair.francis@wdc.com>
 L: qemu-riscv@nongnu.org
 S: Supported
 F: hw/riscv/opentitan.c
@@ -1628,7 +1628,7 @@ F: include/hw/riscv/shakti_c.h
 F: include/hw/char/shakti_uart.h
 
 SiFive Machines
-M: Alistair Francis <Alistair.Francis@wdc.com>
+M: Alistair Francis <alistair.francis@wdc.com>
 M: Bin Meng <bmeng.cn@gmail.com>
 M: Palmer Dabbelt <palmer@dabbelt.com>
 L: qemu-riscv@nongnu.org
@@ -3842,7 +3842,7 @@ F: tcg/ppc/
 
 RISC-V TCG target
 M: Palmer Dabbelt <palmer@dabbelt.com>
-M: Alistair Francis <Alistair.Francis@wdc.com>
+M: Alistair Francis <alistair.francis@wdc.com>
 L: qemu-riscv@nongnu.org
 S: Maintained
 F: tcg/riscv/
-- 
2.47.1


