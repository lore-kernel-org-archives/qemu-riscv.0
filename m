Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82231C61DC4
	for <qemu-riscv@archiver.kernel.org>; Sat, 29 Aug 2026 04:21:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x0AYa-0000LZ-1i; Sat, 29 Aug 2026 00:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vae1207@gmail.com>) id 1x08Re-0004mu-PK
 for qemu-riscv@nongnu.org; Fri, 28 Aug 2026 22:05:22 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vae1207@gmail.com>) id 1x08Rd-0007mX-5r
 for qemu-riscv@nongnu.org; Fri, 28 Aug 2026 22:05:22 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2d8f265cbe6so611775ad.0
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 19:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787969118; x=1788573918; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=iXhy4byTZPIfwfjaGTFvsXHi5gv8NwjDRG7XrZn8HZ8=;
 b=Yo8AqRlAXTMknu9/Vzfrixm6IdkP1ItW4EZ2utaL/+gbN/0zapX1m73YgX5NSv/vsL
 YT1XLg6HtBFija8yHtxHq31yVh9vX6mdsNL/kZBXJUAe5/LJyhT2zePdESuvWp3c0ybP
 opqv5FcEiqSza57F9ksOEt0pXFA3/Ui1WzfUnSWX8eZqI2J3Cy8jiZxS3k9cEfnanNU7
 7jrSM8cibywSdpEsilS2UqGbMmxz5WIoqEwqTMav5DiRVOgciZLyrlTItNiqIjCbUrbP
 25NCPg9lfozjDGLXipyTedtGb+3DVTw/P/ADzn1zXk7aWsmGrFBY0HPooDLyOwl0gvZ+
 ayWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787969118; x=1788573918;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iXhy4byTZPIfwfjaGTFvsXHi5gv8NwjDRG7XrZn8HZ8=;
 b=eHwUsv5x7+2iOlN0DdfQnBhKjUz89CQsr6kfWKazAWxcnLZW9OxK+VxDsofLSfE/uz
 VY9rFrfeYPEwNWZhI0IrA2GX6psdbjqkV7dKWAow6XrHELxUKxZjoYO12DwO4hINGFdF
 RJN4kIOBT070Mjec8v61rRKIAMBY7xnCPMZ7Qnkra4K5Oj/II9PqME1FiV1jW1UUis1t
 ut97YslImfoV5JXT/O0ERc6YcK8J4pryapEcC5er1k/GdL872/rj/ZOaahpV4fngOYf/
 J2dqmK4xejx9huXckwvFE0rEo16OGb+9xzjbR3ytoYbA/+6uc0DE7Xatcum25o/0wsFF
 +xJA==
X-Gm-Message-State: AFuF++nGoF5kbtIw0gH6JNve/hT62FdNkdfzWc17zvvhMKyoJrst7Kt+
 V3wkFnaiWkVhYUU82UCqY3b4nBrxolPj21Hv4YJjZTvHwyqNi6eU0olH
X-Gm-Gg: AR+sD13UM0wBxIbQ0m1bryTyAN2kHE5YvFFnl92RxHWj7K5l009cJtprrroL1tzQOVF
 PU7ixhe4KxGmSR6y7WEI4xD470L0MU5bRbqibGeBZ5lIrHLh22XqtwjogcwQ8VK29jeRfKAo05P
 vP9FXcNNSy8KSO0POoy17WxHRF3/1r6p2w50gWnx8spoQpV3ffMoYSqvr95ids/bCJdYPrz0xKs
 HVoM2YUFZFdbkU7+GeNH2CRozGJ6+5i9eN/OtK7ntkGApNIauUpOeVqf/a12VjLLEKUjHGO41pJ
 YzvrNmiHIZQG194ipdUNIHDp05Z+8UayDXfqwAaZgYJvZwYLsL2rE6/gUzLRc+nCGteKZx/ap0z
 k4cXfICWHYFAX6YnrKbdwzjZzYqRkmt75lmoGEvAsD4PVCUi6Gr2cOXOHrklT8OWEi5qLqXLbaP
 ludJWwLiPtOeUbU0CLBGqexq5iFOw1L5X82FPDbDA/jXeQmpBcNonsa0dlTmZvw1zWslxr0A==
X-Received: by 2002:a17:902:ccd2:b0:2d8:d4d9:ce3b with SMTP id
 d9443c01a7336-2d8d4d9cf90mr49273045ad.22.1787969117570; 
 Fri, 28 Aug 2026 19:05:17 -0700 (PDT)
Received: from localhost.localdomain ([180.213.79.228])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d759869aeesm10592695ad.46.2026.08.28.19.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2026 19:05:17 -0700 (PDT)
From: JunWei Li <vae1207@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, chenhuacai@canaan-creative.com,
 JunWei Li <vae1207@gmail.com>
Subject: [PATCH 0/3] hw/misc: add K230 PMU device model
Date: Sat, 29 Aug 2026 10:02:26 +0800
Message-Id: <20260829020229.389742-1-vae1207@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=vae1207@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 29 Aug 2026 00:20:39 -0400
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

This series adds a device model for the K230 power management unit (PMU)
and wires it into the K230 SoC.

The PMU (K230 TRM V0.3.1 chapter 14) controls the core power-on/off path
through two PMIC output pads and reports six PAD inputs plus RTC
interrupts to the CPU.  This minimal model covers the APB register bank
with TRM reset values and write masks, interrupt detection state
(PAD64..PAD69 inputs setting PMU_INT_STATE, the interrupt line following
PMU_INT_STATE & PMU_INT0_TO_CPU, W1C clear) and the PAD70/PAD71 outputs
driven by PMU_SYSCTRL_REG.  Long/short press timing, edge counting and
debounce are intentionally left for a follow-up.

Patch 1 adds the device model, patch 2 wires it into the K230 SoC
(MMIO 0x91000000, small-core PLIC source 81) and patch 3 adds qtest
coverage.  The k230 qtests pass under qtest-riscv64.

JunWei Li (3):
  hw/misc: add K230 PMU device
  hw/riscv: wire up K230 PMU in the SoC
  tests/qtest: add k230-pmu-test

 MAINTAINERS                 |   3 +
 hw/misc/Kconfig             |   3 +
 hw/misc/k230_pmu.c          | 242 ++++++++++++++++++++++++++++++++++++
 hw/misc/meson.build         |   1 +
 hw/riscv/Kconfig            |   1 +
 hw/riscv/k230.c             |  12 +-
 include/hw/misc/k230_pmu.h  |  71 +++++++++++
 include/hw/riscv/k230.h     |   3 +
 tests/qtest/k230-pmu-test.c | 136 ++++++++++++++++++++
 tests/qtest/meson.build     |   3 +-
 10 files changed, 471 insertions(+), 4 deletions(-)
 create mode 100644 hw/misc/k230_pmu.c
 create mode 100644 include/hw/misc/k230_pmu.h
 create mode 100644 tests/qtest/k230-pmu-test.c

-- 
2.20.1


