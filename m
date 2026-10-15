Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97624CC6B38
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 10:25:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xHIdV-0000Xh-M5; Thu, 15 Oct 2026 06:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIdD-0000VF-Hk
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:24:17 -0400
Received: from mail-wr1-f49.google.com ([209.85.221.49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHId8-0003Ag-5G
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:24:14 -0400
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-48c02782159so3116751f8f.0
 for <qemu-riscv@nongnu.org>; Thu, 15 Oct 2026 03:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792059848; x=1792664648;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=oEw6UwwSKrmcNxBgK/lh8jEAyNjqkAQDz3gJekN26zI=;
 b=ZmRGJjI/liIFnOVjBPg9Z6NVF1elSjPWl1TLW2cLPBi26RGod/WKi6AcYSw7kP2nM/
 vUdDjCT1+8dR7Brdu8CXbTMJuJEgpMNa6OIIQt8t5HW0pslOSqd4YgU9WehZLdZPxsbZ
 wln4jQMjzVltgSk1EtI4vHUESp4LopG6Kza/aghybkrpCkkSB2t0MOusZn3nXPXgx7+f
 cypE9YIyusL3lfZmYKih/+SpL/VhqywXP9AMtpsscUEppQtD9KzG47uosERVLYFOQyQW
 Tu4RYHUMztz1K5hZpvU/a3Q3EoC3fOpu6WpbVBFm3rPYG0/RShpoSqMKIEjVhSxTEeAk
 joPA==
X-Forwarded-Encrypted: i=1;
 AKwUvBymoO/QHCDLk2A5psqoO+vm+zo2kyceeqU+frR0d9iRb4mMJIf+GEvh9jSoVdoUAYXHo7/h8S4lE6uX@nongnu.org
X-Gm-Message-State: AFq9FYJVLvwmBwukhjAOKIeurRRSFaW1nRICaWnqpFR8A5fd0RmbnWT6
 MtJUBewxaREvIfD0kkYWOvhpdTDAOgGpY2QfAwz9LPQ4WmSu0egMn8A/
X-Gm-Gg: AYBFou325SsoFAiFtj65t7eiabo71WX5iK0hl7aGVtA4HW3pncPnPlF9cR728yDbYRA
 C4FE7tbLrQUtZMG1IV6sbMHhRAgGZtwLjWf8jLWbAPEqR9ysDOUgGzBtrLeKGLN4IgnavBNu03s
 64QFMgAeBXX9ppuSIB77dRR2FfWLGNUMqZoLPJyJZrB8RVJq8wiF5BNnUSS52KmBRTFCGT/lHXf
 M7kTrOWH72r7+6w/HMTfniUkCU9Hl/46B65kZ/tevNZAuogRpnPkp0A5Ru38Zbp/rV2qgZWJ5OV
 Jh16E//pdHSTryOFS9yDD6AEwRIR3nheALN4OiBMPWThjJ1eTSq3y+SwHOeuqyIEzXiCJ7BaZSh
 9uCGfy0Cc5vSm65BC2sDmrdBhCtno9MM157RVEo11xWWeq5XvewUzAr5WgTGRspsUhQgBAMJXb7
 QlT1AdTEW6IBPRz/sLPUCQvdKv3qD30h+jbF+ZFk9aN8tMR/1OSMnNMBWkrmmKKVVQJBo0z+jbd
 WM1SZlkGp680KD+/8XxEbwmiA+XsgEB2RJfdBVBKIvtRg==
X-Received: by 2002:a05:6000:4b06:b0:48d:eb44:6510 with SMTP id
 ffacd0b85a97d-48deb44663emr9743812f8f.47.1792059847811; 
 Thu, 15 Oct 2026 03:24:07 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48defca4013sm7970351f8f.9.2026.10.15.03.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 03:24:07 -0700 (PDT)
Subject: [PATCH v3 00/50] Aspeed: I2C device models and the Minerva BMC machine
Date: Thu, 15 Oct 2026 11:27:47 +0200
Message-Id: <20261015-bmc-minerva-v3-0-7d50c8a108e5@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Oyw6CMBBFf4XM2popTXi48j8Miz4GqQmgU2g0h
 H+3oIkbl+fmvhYIxJ4CnLIFmKIPfhwSqEMGttPDlYR3iSHHvMAaS2F6K3o/EEctrJNKl7KyNRp
 IiTtT659726X5cJjNjey0VXwdTI85zUw/W+fDNPJr/xDlpv6fi1KgQFcp7QqJVplzy0THlqFZ1
 /UNMA8rwssAAAA=
X-Change-ID: 20260907-bmc-minerva-cd13a718c90b
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Patrick Leis <venture@google.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Emmanuel Blot <emmanuel.blot@free.fr>, Jamin Lin <jaminlin1207@gmail.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, 
 Bernhard Beschow <sgentey@gmail.com>, Glenn Miles <milesg@linux.ibm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792056474; l=7505;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=GqCbJjzECWo/n6o5q3sjpg3hK/D9Sj8BRvq0K+uS+GA=;
 b=4k58PyKU6Vb0lxyK0V9B2wz3INFR+O85OHLy4OuCtXMXoYwmXewpcTxeVHnYG3tQOSMuvU5O2
 4tVHDCtP4V3D+TKHY8EVaq0EW8H8BlAapT4v5SwgztyWsLbpeV3/iox
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.49; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f49.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-riscv@nongnu.org>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Add the minerva-bmc machine and the I2C device models it needs.

Based on master, at:
  615ece3c40 ("Merge tag 'for-upstream' of
  https://gitlab.com/bonzini/qemu into staging")

New models:

  INA230   TI 36V current-shunt and power monitor
  INA238   TI 85V current-shunt, power and temperature monitor
  DS1339   RTC, a DS1338 variant
  PCA9545  4-channel I2C mux with per-channel interrupt inputs

The INA devices derive current and power from the shunt voltage and
their calibration registers. ALERT output is supported. Measurements
come in through QOM properties; however, conversion delay is not
modelled.

Introduce a device class to manage different variants of the DS1338
register map, such as the DS1339. Improve the DS1338 implementation
with a Resettable reset, support for the clock-halt bit, and a
"persist-on-reset" property keeping the registers across a reset.

The minerva-bmc machine is derived from the platform device tree and
instantiates every device that is supported in QEMU. FRU EEPROMs are
sanitised images taken from real hardware.

New qtests for the DS1339, INA230, INA238 and PCA9545, plus DS1338
cases for the register map, and a functional test booting OpenBMC on
minerva-bmc.

The docs now mention the previously missing catalina-bmc and
sanmiguel-bmc machines, and the title has been simplified.

One thing worth a second opinion: the PCA954x muxes now have a
VMStateDescription, which changes the migration stream for the
existing PCA9546 and PCA9548. The DS1338 vmstate also goes from
version 2 to 3, but older streams still load fine.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
Changes in v3:
- ina230: drop a stray comment in the operating-modes test.
- Link to v2: https://lore.kernel.org/qemu-devel/20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr

Changes in v2:
- Rebase onto master, which now contains the v1 base.
- minerva: drop ASPEED_RAM_SIZE, removed upstream.
- No other changes; v1 received no review comments.
- Link to v1: https://lore.kernel.org/qemu-devel/20260907-bmc-minerva-v1-0-0d83ad610c3b@free.fr

---
Emmanuel Blot (50):
      docs/system/arm/aspeed: add the catalina-bmc machine
      docs/system/arm/aspeed: add the sanmiguel-bmc machine
      hw/arm: sanmiguel: remove the second SPI flash controller
      hw/i2c: pca954x: drop unused header inclusions
      hw/i2c: pca954x: add PCA9545 4-channel mux model
      hw/i2c: pca954x: migrate mux state
      tests/qtest: pca9545: add mux test
      hw/rtc: ds1338: move TYPE_DS1338 to a public header
      hw: ds1338: use the TYPE_DS1338 constant instead of the "ds1338" string
      hw/rtc: ds1338: implement Resettable reset
      hw/rtc: ds1338: prefix the file-local helpers with ds1338_
      hw/rtc: ds1338: parameterise the register map via a device class
      hw/rtc: ds1338: program the clock from the time registers
      hw/rtc: ds1338: implement the DS1338 clock-halt bit
      hw/rtc: ds1338: refresh the user registers on a read rollover only
      hw/rtc: ds1338: add a persist-on-reset property
      tests/qtest: ds1338: cover the DS1338-specific register map
      tests/qtest: ds1338: cover the power-on register defaults
      tests/qtest: ds1338: cover the clock-halt bit
      tests/qtest: ds1338: cover persist-on-reset
      tests/qtest: ds1338: cover the reserved bits of the time registers
      hw/rtc: ds1338: add DS1339 variant
      tests/qtest: ds1339: add RTC test
      tests/qtest: ds1339: cover power-on defaults and reserved-bit masking
      tests/qtest: ds1339: cover oscillator stop/restart and time programming
      tests/qtest: ds1339: cover the Century bit
      tests/qtest: ds1339: cover the end-of-month rollover
      tests/qtest: ds1339: cover the 12-hour format
      tests/qtest: ds1339: cover the day-of-week counter
      tests/qtest: ds1339: cover persist-on-reset
      tests/qtest: ds1339: cover the migration round trip
      hw/sensor: ina230: add current/voltage/power monitor
      tests/qtest: ina230: add current/voltage/power monitor test
      tests/qtest: ina230: cover voltage injection and power derivation
      tests/qtest: ina230: cover the ALERT limit functions and CVRF
      tests/qtest: ina230: cover the injection-property limits
      tests/qtest: ina230: cover operating modes and triggered conversions
      tests/qtest: ina230: cover ALERT latch persistence
      tests/qtest: ina230: cover a cleared calibration per channel
      hw/sensor: ina238: add current/voltage/power monitor
      tests/qtest: ina238: add current/voltage/power monitor test
      tests/qtest: ina238: cover voltage/temperature injection and derivation
      tests/qtest: ina238: cover the ALERT path and conversion-ready flag
      tests/qtest: ina238: cover the injection-property limits
      tests/qtest: ina238: cover the operating modes
      tests/qtest: ina238: cover conversion-ready and alert-latch semantics
      tests/qtest: ina238: cover a cleared calibration per channel
      hw/arm: minerva: add Facebook BMC machine
      hw/arm: minerva: populate EEPROM data
      tests/functional/arm: minerva: add BMC boot test

 docs/system/arm/aspeed.rst                  |   7 +-
 hw/arm/Kconfig                              |   2 +
 hw/arm/aspeed_ast2400_palmetto.c            |   4 +-
 hw/arm/aspeed_ast2400_supermicrox11.c       |   4 +-
 hw/arm/aspeed_ast2500_romulus.c             |   4 +-
 hw/arm/aspeed_ast2500_supermicro-x11spi.c   |   4 +-
 hw/arm/aspeed_ast2500_witherspoon.c         |   4 +-
 hw/arm/aspeed_ast2600_bletchley.c           |   3 +-
 hw/arm/aspeed_ast2600_catalina.c            |   2 +-
 hw/arm/aspeed_ast2600_minerva.c             | 856 ++++++++++++++++++++++++++++
 hw/arm/aspeed_ast2600_sanmiguel.c           |   7 +-
 hw/arm/meson.build                          |   1 +
 hw/arm/realview.c                           |   3 +-
 hw/arm/versatilepb.c                        |   3 +-
 hw/i2c/i2c_mux_pca954x.c                    |  98 +++-
 hw/ppc/e500.c                               |   3 +-
 hw/riscv/tt_atlantis.c                      |   3 +-
 hw/rtc/ds1338.c                             | 427 +++++++++++---
 hw/sensor/Kconfig                           |   8 +
 hw/sensor/ina230.c                          | 597 +++++++++++++++++++
 hw/sensor/ina238.c                          | 802 ++++++++++++++++++++++++++
 hw/sensor/meson.build                       |   2 +
 hw/sensor/trace-events                      |  14 +
 include/hw/i2c/i2c_mux_pca954x.h            |   1 +
 include/hw/rtc/ds1338.h                     |  21 +
 include/hw/sensor/ina230.h                  |  14 +
 include/hw/sensor/ina238.h                  |  14 +
 tests/functional/arm/meson.build            |   2 +
 tests/functional/arm/test_aspeed_minerva.py |  30 +
 tests/qtest/ds1338-test.c                   | 191 ++++++-
 tests/qtest/ds1339-test.c                   | 581 +++++++++++++++++++
 tests/qtest/ina230-test.c                   | 602 +++++++++++++++++++
 tests/qtest/ina238-test.c                   | 806 ++++++++++++++++++++++++++
 tests/qtest/meson.build                     |   4 +
 tests/qtest/pca9545-test.c                  | 116 ++++
 35 files changed, 5125 insertions(+), 115 deletions(-)
---
base-commit: 615ece3c406b262996e569f29ea6eed0d81c4d8d
change-id: 20260907-bmc-minerva-cd13a718c90b

Best regards,
--  
Emmanuel Blot <emmanuel.blot@free.fr>


