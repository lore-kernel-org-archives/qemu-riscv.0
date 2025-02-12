Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C028C021A4
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 11:28:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tiAr3-0005yY-PU; Wed, 12 Feb 2025 06:24:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiAqr-0005vu-Pv
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2025 06:24:23 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiAqo-0004QX-5N
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2025 06:24:21 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-38dc73cc5acso486167f8f.0
 for <qemu-riscv@nongnu.org>; Wed, 12 Feb 2025 03:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739359456; x=1739964256; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v0lKQ188Fqhtlt77kv+yVBP0rRi7j4Hamor1/xZAokE=;
 b=gAwVzIzm5gnWRoCysx51Ed6LxyK59i4FNfe88/Tb6hJm+b3jEUzbWgmcPjQVZTvr5V
 jGiQliCe/Xg+4aNq6eooCiqZ6yybj8wH3hEQJqw/nI6OucuMME7ObncYLmNdT4wi23W3
 EWbCevenrOp6D1SUD7S9z+XapemJvoeS12OAPk3cbXTJaMTCMcBOzZloj9nq7qFfCBiK
 fvv3J4AyYPivrHcQDTvSP0V/gxJ3Cwed2XQ1voGfp4PWSSMjZUWQhBlkt5tHf8f3nx5x
 9l1qCEte0ukd3V4ZoO5ZX9gaZ4nYjh/Np4oLQRE58Pc5RWOPfLgqsIg2oSOuQPawuiXP
 io5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739359456; x=1739964256;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v0lKQ188Fqhtlt77kv+yVBP0rRi7j4Hamor1/xZAokE=;
 b=HFflm7ATIa3hybxu62yWaxSmriHcEpSX2c3DqLkC9du6IijlX9rt32eaxZhGUFHCBT
 MPRuumIkXllpT+kFfjDWigqWha01frCaC22njkGOe3vC896kR7Go3N+oPxLjATY1zs52
 cmR40HGJlFZqKAosGQGQkVPsQeVRZzjRPOjh/qYRYUqMh1UPOH3dWnZaATx6/4ZpipwG
 Ao/vqhgz7nlKCkLWPFjCPc/dxzK4JP9N0SQPi8v16NnDwpqhnrwpV49rdVQkYfC9Y41y
 lViG3M1TXFlfSyVZBj+BuAA3Prm2i5GpxJ5eVusgFbCkOnB4qE9BwSM/fWhpogGsVYrP
 Q1/g==
X-Gm-Message-State: AOJu0YxL/ZVvKxinpIkZCkRTtH2+vCyi24UYzHXDz9tP8pqQ1J8jdJ2c
 ymh0EqMIJYFLPhHgcPVb6R0iP30OJP1zvUixLoYTXIlboLdWHEOCpX9IOS4HhFM=
X-Gm-Gg: ASbGncvkkpZkSSKDVtSi4XbzGyCRSEMV4Adnh5FlwgZOpd362Sn/ccilgIKyT0QP1A4
 Q1uSYVjdyxWqAa0mSYAPox4AQp+qeJRyElH4758E74BFGL4GNPIMurPEUazo0iy1ckEFa3cue1z
 TYrBtKCVvyMeuXYRndGBk4r+rvTT4LE1NLLA0Fb0BPc8pqvulclGdwYghDa8eqRPLdPufGlSTMW
 QppKcnQA7QIdpDXOL+tA3ymkacBGfBhgT5mXC0oPrd8AqakyZop9q9RDS3FCnJ0RgM2QgbxOGJK
 9tvvBTwMjCN0gyny1z3DIAnnFQQBP0Oey3mORDIpBtUw1oGG9ttSf6cnkBl1j/E0cQ==
X-Google-Smtp-Source: AGHT+IF2VLYNunMdGJM9wNvjFIRaZCxwqlhfznh5xn9UtRNMURCV5RQsXh4acio9lR0xkETVdST4NA==
X-Received: by 2002:a5d:5885:0:b0:38d:dcbe:91fd with SMTP id
 ffacd0b85a97d-38de43c7377mr6776481f8f.22.1739359455994; 
 Wed, 12 Feb 2025 03:24:15 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1b8397sm16584455e9.36.2025.02.12.03.24.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Feb 2025 03:24:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 00/11] hw/microblaze: Allow running cross-endian vCPUs
Date: Wed, 12 Feb 2025 12:24:02 +0100
Message-ID: <20250212112413.37553-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

Since v5:
- Introduce QAPI EndianMode
- Update RISCV machine while rebasing
- Fixed INTC use on PPC (Thomas)
- Dropped patch adding more machines (Daniel)

Since v4 & v3:
- Addressed Thomas review comments

Since v2:
- Addressed Richard's review comments

Since v1:
- Make device endianness configurable (Edgar)
- Convert more Xilinx devices
- Avoid preprocessor #if (Richard)
- Add R-b tags

Philippe Mathieu-Daudé (11):
  hw/qdev-properties-system: Introduce EndianMode QAPI enum
  hw/intc/xilinx_intc: Make device endianness configurable
  hw/net/xilinx_ethlite: Make device endianness configurable
  hw/timer/xilinx_timer: Make device endianness configurable
  hw/char/xilinx_uartlite: Make device endianness configurable
  hw/ssi/xilinx_spi: Make device endianness configurable
  tests/functional: Avoid using www.qemu-advent-calendar.org URL
  tests/functional: Explicit endianness of microblaze assets
  tests/functional: Allow microblaze tests to take a machine name
    argument
  tests/functional: Remove sleep() kludges from microblaze tests
  tests/functional: Have microblaze tests inherit common parent class

 qapi/common.json                              | 16 +++++
 include/hw/qdev-properties-system.h           |  7 +++
 hw/char/xilinx_uartlite.c                     | 34 +++++++----
 hw/core/qdev-properties-system.c              | 11 ++++
 hw/intc/xilinx_intc.c                         | 60 ++++++++++++++-----
 hw/microblaze/petalogix_ml605_mmu.c           |  3 +
 hw/microblaze/petalogix_s3adsp1800_mmu.c      |  6 ++
 hw/net/xilinx_ethlite.c                       | 27 +++++++--
 hw/ppc/virtex_ml507.c                         |  2 +
 hw/riscv/microblaze-v-generic.c               |  5 ++
 hw/ssi/xilinx_spi.c                           | 32 +++++++---
 hw/timer/xilinx_timer.c                       | 43 +++++++++----
 .../functional/test_microblaze_s3adsp1800.py  | 35 +++++++++--
 .../test_microblazeel_s3adsp1800.py           | 32 ++--------
 14 files changed, 229 insertions(+), 84 deletions(-)

-- 
2.47.1


