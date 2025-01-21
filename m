Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F05C02182
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 14:24:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1taFAV-0000KN-Hs; Tue, 21 Jan 2025 09:23:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFAT-0000Jk-Cm
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 09:23:49 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFAQ-0002wh-1Z
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 09:23:49 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4361c705434so40935165e9.3
 for <qemu-riscv@nongnu.org>; Tue, 21 Jan 2025 06:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737469424; x=1738074224; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=huBnZLMMoWYJ6yRI7yv6u3SXGmIuRg6gkaMshUEQcb4=;
 b=wf3kJWY2nzHFXuAKFGXVp+bjIkUfBgIzC6JWfyyzE8V5a8mEKk1/q+2HmbrzIUdtRL
 ahH03jR5fjKyld7zFTylCNDDfPrTnc6/bF6VOFyBhz4kUK5Dv1BtIA4viEadhvXdbYF9
 ULHthNGDW1/1MEx+CN4bppx2wmw7p26FRdxwpoD5fK22HL9VtO02PzoX2P9DKioWqt1C
 dZFrY7uOc7DlzfeguAQ3uUrvCVspN3tkvAzMNJVRIl8KzFXLnhpcA7629gnEYjmKg55z
 lMC47lhA5Gw2BhskEw/PwhjyJ2yPjbSlszHf/vn9lWYdfiur/DbTWzzLfKpZM/KsBkAj
 16aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737469424; x=1738074224;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=huBnZLMMoWYJ6yRI7yv6u3SXGmIuRg6gkaMshUEQcb4=;
 b=bs6+d3ngPrCTOoqTUQSQMPz/I/LIFoBcdyWtG6HB4/KNOIATOTXgibgQzwBDiZ5tfl
 hq9tAXcjPHasFfTvT5zZhrdcENc7CJfFHajoinOTIvVqXjsnZBlOgRFS/IJ1Rq7ciRYZ
 zsSAHreB1cdL1xR0COe3mHQygEFYvY4O4Uq6cGcUzTk+qwUrnNbY0CuHCVXepG9fg11j
 PlmvqNnMki4PCbycJp4xVL6PqdNWEcKekpE/wT+fA3lV9FMr4HPoA8QecFMfN4uaxpDI
 gdtJHAIdfCGfT/u1sKQuOoX5gt2wPuL4lnuTfixNkn3GdwVZMlzYxWOMC+jHkVLY0DR6
 GlIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoBRY1wU1p3FYGmsXXS0FbHwtzsH5soyRodvgDeROPHs4mmr7tM8VimH+HqfY4Rfl8+J+prjE7SSyh@nongnu.org
X-Gm-Message-State: AOJu0YwuyreISA/cRarX0VCrGbEUUiMifprz/inPpI/7eD+egZ3f6BUb
 RUUOX7jsqx9FxMSyf8IGfhnNbpqP4qAvuOwW9D7Z1Zuqc8hXAaBjTYBFoh28sbm2uybQJJtWEDP
 EATk=
X-Gm-Gg: ASbGncslDLsuZHg2EqiiFfepwD1v1SZtplJBLrK2WmbIibOzQBIxLcNguxUs4UkXrqC
 mcFD8j3rT7wle8hYzT+7y6xzJK+W9EF/ACogzThaV6JpsIV6XA8+O7hs57iqmHFgkmR8Yikqxqb
 9itB4M0SidQ3GyqxAMFHb5K4XX6vxGliYRMuyFqrYDMj77kqNr0L946bq4y6Q/7ntW1Ol5Ucx98
 UUR4hh6UUFG4IYFZheUbZM1IDGGfLlaGHnajwR3PojZIBWfytO68iYA0VbIW4sRRRYCnCNMhWYe
 0cBXq+szzEhMkjMPMx7MpHiVEKaRW0N1PfBArzePUq0S
X-Google-Smtp-Source: AGHT+IENTRqkRL3QRIymaYWOvoK2ecbtBLz5P2eTuEdDsBRulofhxM0CiB5iXk4AtpEAwZvnBOSL5g==
X-Received: by 2002:a05:600c:1da8:b0:434:a711:ace4 with SMTP id
 5b1f17b1804b1-4389eca3ca1mr159671455e9.17.1737469423851; 
 Tue, 21 Jan 2025 06:23:43 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43890469ba8sm178907415e9.37.2025.01.21.06.23.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jan 2025 06:23:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/28] cpus: Restrict CPU has_work() handlers to system
 emulation
Date: Tue, 21 Jan 2025 15:23:13 +0100
Message-ID: <20250121142341.17001-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

On user emulation, threads always have work to do, and
CPUClass::has_work() is never called. Restrict it to system
emulation, allowing to simplify a bit and reduce code built
on user emulation.

Based-on: <20250121114056.53949-1-philmd@linaro.org>
 "cpus: Prefer cached CpuClass over CPU_GET_CLASS() macro"

Philippe Mathieu-Daudé (28):
  target/hexagon: Ensure not being build on system emulation
  target/rx: Ensure not being build on user emulation
  target/tricore: Ensure not being build on user emulation
  cpus: Restrict cpu_get_memory_mapping() to system emulation
  cpus: Restrict cpu_has_work() to system emulation
  cpus: Un-inline cpu_has_work()
  cpus: Introduce SysemuCPUOps::has_work() handler
  target/alpha: Move has_work() from CPUClass to SysemuCPUOps
  target/arm: Move has_work() from CPUClass to SysemuCPUOps
  target/avr: Move has_work() from CPUClass to SysemuCPUOps
  target/hexagon: Remove CPUClass:has_work() handler
  target/hppa: Move has_work() from CPUClass to SysemuCPUOps
  target/i386: Move has_work() from CPUClass to SysemuCPUOps
  target/loongarch: Move has_work() from CPUClass to SysemuCPUOps
  target/m68k: Move has_work() from CPUClass to SysemuCPUOps
  target/microblaze: Move has_work() from CPUClass to SysemuCPUOps
  target/mips: Move has_work() from CPUClass to SysemuCPUOps
  target/openrisc: Move has_work() from CPUClass to SysemuCPUOps
  target/ppc: Move has_work() from CPUClass to SysemuCPUOps
  target/riscv: Move has_work() from CPUClass to SysemuCPUOps
  target/rx: Move has_work() from CPUClass to SysemuCPUOps
  target/s390x: Restrict I/O handler installers to system emulation
  target/s390x: Move has_work() from CPUClass to SysemuCPUOps
  target/sh4: Move has_work() from CPUClass to SysemuCPUOps
  target/sparc: Move has_work() from CPUClass to SysemuCPUOps
  target/tricore: Move has_work() from CPUClass to SysemuCPUOps
  target/xtensa: Move has_work() from CPUClass to SysemuCPUOps
  cpus: Remove CPUClass::has_work() handler

 include/hw/core/cpu.h            | 30 ++++++++++++------------------
 include/hw/core/sysemu-cpu-ops.h |  4 ++++
 target/hexagon/cpu.h             |  4 ++++
 target/i386/cpu.h                |  4 ++--
 target/mips/internal.h           |  4 ++--
 target/riscv/cpu.h               |  9 +++++----
 target/riscv/internals.h         |  3 ---
 target/rx/cpu.h                  |  6 ++++--
 target/s390x/s390x-internal.h    |  5 +++++
 target/tricore/cpu.h             |  4 ++++
 hw/core/cpu-common.c             |  6 ------
 hw/core/cpu-system.c             |  6 ++++++
 target/alpha/cpu.c               |  4 +++-
 target/arm/cpu.c                 |  4 +++-
 target/avr/cpu.c                 |  2 +-
 target/hexagon/cpu.c             |  6 ------
 target/hppa/cpu.c                |  4 +++-
 target/i386/cpu.c                |  8 +++-----
 target/loongarch/cpu.c           |  8 +++-----
 target/m68k/cpu.c                |  4 +++-
 target/microblaze/cpu.c          |  4 +++-
 target/mips/cpu.c                |  4 +++-
 target/openrisc/cpu.c            |  4 +++-
 target/ppc/cpu_init.c            |  4 +++-
 target/riscv/cpu.c               |  8 +++-----
 target/rx/cpu.c                  |  8 +-------
 target/rx/helper.c               |  4 ----
 target/s390x/cpu-system.c        | 18 ++++++++++++++++++
 target/s390x/cpu.c               | 18 ------------------
 target/s390x/interrupt.c         |  8 ++------
 target/sh4/cpu.c                 |  4 ++--
 target/sparc/cpu.c               |  4 +++-
 target/tricore/cpu.c             |  2 +-
 target/xtensa/cpu.c              | 12 +++++-------
 34 files changed, 114 insertions(+), 113 deletions(-)

-- 
2.47.1


