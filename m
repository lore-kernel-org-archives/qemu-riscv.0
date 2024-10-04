Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA590CF884D
	for <qemu-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 16:31:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1swlCm-00042D-DS; Fri, 04 Oct 2024 12:31:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swlCl-000424-Bu
 for qemu-riscv@nongnu.org; Fri, 04 Oct 2024 12:30:59 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swlCj-0005VO-Lg
 for qemu-riscv@nongnu.org; Fri, 04 Oct 2024 12:30:59 -0400
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5398ec2f3c3so3064680e87.1
 for <qemu-riscv@nongnu.org>; Fri, 04 Oct 2024 09:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728059455; x=1728664255; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5nyIdscBf9eExt1kzAJJIA/rxjuPVcdO2ELN/HXgCsA=;
 b=nxA9KIXYqC19s8kcDB1MZPLC5n5M7wDvXRaLCGZws4KNByrh/gLWmNVu3Rcmuh/+VQ
 WOKS0NKx3Ij6a8BGC2gIhj500792alM2/ve1XPbNfV/UKhFpqI9QDra27l7Os42mCEa1
 8QEPfqh+35U8z8wr5R8lDoLlVxzsQI8fFOvt2M1sX7e/8VgMKDnx3lNlGwxstlN/fCo1
 fw56/sGzUHDrGqYBtp2+QL5QehL9V2FX6Ys7K2YFZO2QmHIBlCcgsNzBNzJDKmCZlLC+
 LiHenaaM2A0Azh9HF+LnwmYWSfZDS+2d6Sxp2jeQrSzuVyci5hmtkqOS3ujNNZibqTOJ
 Naag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728059455; x=1728664255;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5nyIdscBf9eExt1kzAJJIA/rxjuPVcdO2ELN/HXgCsA=;
 b=FqaMeWFgjzqpqpyoJ7VBg7mFMQQzIpzCktwSAjCcJGaLyGudI3ubP6dJ2ffYyLgmBh
 P5JRE53ZIyFJL1bJ13LyUeSS7FT8S3/ALHEs3Wl9aR1o+sX0RtSwlS4/I9DLWNH2+IHp
 VVYKCn6TSpqzJwbjlsc76d0ggM5etzQvJOxKpwSEvegx65g4pa4XjSCpetggkslnDVnI
 Sl3jLmJYle7YCFVtoSrn9RHMdazeN1VFwjxY63nIZlScNElYtO+eN15iK5BNJ4+Z/wll
 B+3ok/ex/jO/IpK3fT0uSh/lMQ0VSaZ7aHzkMP+W8MrTkgZSmkLNlqis4jdcERjpttrH
 4dIg==
X-Gm-Message-State: AOJu0YwYT3hg7xd1dgkuf5DmdtiTHd4YKUc71vSQSluluNDlQANuy+Hh
 KDDRS+yMBFQxNXPeWUlJppZY0Vs2hcPko0SQ+I7+JVeXrMZdcv8AbnmtkHwRN8c=
X-Google-Smtp-Source: AGHT+IHmjxOjWQa3xJUQaDHEtw0LVQF0onnQXPwHXy/V6NSJ50nhb5B/Ol9t4OvRDYTK4rI87UyR7A==
X-Received: by 2002:a05:6512:a8f:b0:536:a50a:3c25 with SMTP id
 2adb3069b0e04-539ab8625dbmr2108527e87.12.1728059454912; 
 Fri, 04 Oct 2024 09:30:54 -0700 (PDT)
Received: from localhost.localdomain ([91.223.100.150])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539aff281aasm305e87.256.2024.10.04.09.30.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 04 Oct 2024 09:30:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 00/25] misc: Use explicit endian LD/ST API
Date: Fri,  4 Oct 2024 13:30:16 -0300
Message-ID: <20241004163042.85922-1-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x130.google.com
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

For targets (or HW) which are only built for a particular
endianness, the generic LD/ST helpers are defined as the
target endianness variant. For example, on big-endian
targets, stl_p() is equivalent of stl_be_p().

This series replaces in bulk these LD/ST calls.

This is helpful for the single binary project where we
want to build a single binary for multiple targets of
different endianness.

Philippe Mathieu-Daudé (25):
  gdbstub/helpers: Have ldtul_p() definition use ldn_p()
  target/hexagon: Replace ldtul_p() -> ldl_p()
  target/alpha: Replace ldtul_p() -> ldq_p()
  target/s390x: Replace ldtul_p() -> ldq_p()
  gdbstub/helpers: Introduce ldtul_$endian_p() helpers
  target/alpha: Use explicit little-endian LD/ST API
  target/hexagon: Use explicit little-endian LD/ST API
  hw/i386: Use explicit little-endian LD/ST API
  target/i386: Use explicit little-endian LD/ST API
  target/avr: Use explicit little-endian LD/ST API
  linux-user/i386: Use explicit little-endian LD/ST API
  target/loongarch: Use explicit little-endian LD/ST API
  target/sh4: Use explicit little-endian LD/ST API
  target/tricore: Use explicit little-endian LD/ST API
  target/rx: Use explicit little-endian LD/ST API
  target/riscv: Use explicit little-endian LD/ST API
  hw/m68k: Use explicit big-endian LD/ST API
  target/m68k: Use explicit big-endian LD/ST API
  hw/sparc: Use explicit big-endian LD/ST API
  target/sparc: Use explicit big-endian LD/ST API
  target/hppa: Use explicit big-endian LD/ST API
  hw/s390x: Use explicit big-endian LD/ST API
  target/s390x: Use explicit big-endian LD/ST API
  target/openrisc: Use explicit big-endian LD/ST API
  hw/ppc/e500: Use explicit big-endian LD/ST API

 hw/m68k/bootinfo.h                   |  28 ++---
 include/gdbstub/helpers.h            |   6 +-
 hw/i386/multiboot.c                  |  36 +++---
 hw/i386/x86-common.c                 |  26 ++---
 hw/m68k/mcf5208.c                    |   2 +-
 hw/m68k/next-cube.c                  |   2 +-
 hw/m68k/q800.c                       |   4 +-
 hw/ppc/ppce500_spin.c                |  24 ++--
 hw/s390x/ipl.c                       |   4 +-
 hw/s390x/s390-pci-inst.c             | 166 +++++++++++++--------------
 hw/sparc/leon3.c                     |  42 +++----
 hw/sparc/sun4m.c                     |   6 +-
 hw/sparc64/sun4u.c                   |   6 +-
 linux-user/i386/signal.c             |   4 +-
 target/alpha/gdbstub.c               |   2 +-
 target/avr/gdbstub.c                 |   4 +-
 target/hexagon/gdbstub.c             |  10 +-
 target/hppa/gdbstub.c                |   2 +-
 target/i386/gdbstub.c                |  30 ++---
 target/i386/tcg/sysemu/excp_helper.c |   4 +-
 target/i386/xsave_helper.c           |  32 +++---
 target/loongarch/gdbstub.c           |   8 +-
 target/m68k/gdbstub.c                |   2 +-
 target/m68k/helper.c                 |  10 +-
 target/openrisc/gdbstub.c            |   2 +-
 target/riscv/gdbstub.c               |  14 +--
 target/rx/cpu.c                      |   2 +-
 target/rx/gdbstub.c                  |  24 ++--
 target/s390x/gdbstub.c               |  34 +++---
 target/s390x/ioinst.c                |   2 +-
 target/sh4/gdbstub.c                 |  36 +++---
 target/sparc/gdbstub.c               |   6 +-
 target/tricore/gdbstub.c             |   2 +-
 33 files changed, 292 insertions(+), 290 deletions(-)

-- 
2.45.2


