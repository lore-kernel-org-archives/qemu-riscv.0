Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECE2C98302
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 16:43:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9Q3z-00059l-OS; Wed, 23 Sep 2026 12:43:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x9Q3x-00058t-I4
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 12:43:18 -0400
Received: from mail-wr2-f12.google.com ([74.125.225.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x9Q3v-0006I6-Ds
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 12:43:17 -0400
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-4834977ae75so880375f8f.3
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 09:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790181794; x=1790786594;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=CQN1fxDMHtBagFvdwic+Hu7ic+a2HzvXXJ4JbNgcRHg=;
 b=cfEhelxaSVZiOW2odGGUY6AmLS4/SMyZaMdFvGAcb30Xr11RltA+j7EDlMwY00C5Q5
 +nDzjjmQxuaImnZsUKDYw0B78URYaqVbM/W2sshXU/pURzuet1m27yBLrWuZuRQPy3di
 s211ws47vKsTXVyPkeAQTOcyPhicavVC3l22+bg/ASloCorpBOsgsOyJ4fdyOCCtNkUr
 rFopVkNdq1Vod1IBTGz/EchrQksnok4PO78uzYk/aRwa0ptMvRDldsLJG28IWPwfKAyG
 T3+6pDOI18LDp9J3AxMPim4JH0Xaqh0KTJ4UyEdvj3JBPQ5obGDLYTEPOTOU5eX9iRYo
 baYw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxrqKlQ+9fM6Jlbp8Jw8yrBHBr9Gbi1WWJfI6hjFUoeUXhod+Mf6LcJHWes+QYrtmlvkmV6ZAAIjhyD@nongnu.org
X-Gm-Message-State: AFuF++kng2tugcSb3uHjdwamMT7A84TmqKf2ecImalWcpHbAKdfA42Yp
 ohl0i1ndFI9qMBhl9bNKIzxuIATinXNZff/UOcPEh1S9IrTWV7yk1JiP
X-Gm-Gg: AYBFou3NF0fVltdTOaaE48bxJ6oQEQFp5dG6UK9ME19+po4m4me9Vg+sO6Cdu5rRsAf
 7khB4PqdGecj7uAh5WUr+XCpLxwxbFjwICIvah7b0T3YlNoW1Oie6/xzRtx6sWz1Z0xoxybT8gw
 pL52gAdClkp7frmRAQrqioKrvJADrgtfkSkHh6z3pCH109sBw2IEPPwZa1tD5weYBxzyjcVK3l5
 f75dCQnIeKLjwjekjkSIdL9IGTifrxT+1YIl+jjsnG/6GoLAQ2EX1Y05bf1FePUt0uVxZk+9Mc5
 4xvZ1oYG/KbTe9B5GY0Dp94i+yuHeQHCgqEIrrJkZiuYGW8J4+gEXOjiOZcjr3wHXwV7M2c7Wbm
 3S5Grm7pFfGoS4tp0LWpV0KXg/G9cBgPSNZ/4GTEqHMDezWKy7Kzy66twOSX5woiygDG40U0ofW
 T19oHSXr8BfrLkwp+r9Jt/kaBzY6SFzOktBpUfc9nBXaPTFXadrt9OB34YVEVp+dbpS0NcslGDK
 UBCHHj24LibXkoO04zlgqgWglDKqxNlmIdfOXJRLomisZihz7HJCVPt
X-Received: by 2002:a05:6000:240f:b0:484:3310:710c with SMTP id
 ffacd0b85a97d-48867069554mr5850299f8f.24.1790181793406; 
 Wed, 23 Sep 2026 09:43:13 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-488682676c7sm7717576f8f.3.2026.09.23.09.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 09:43:12 -0700 (PDT)
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
 Emmanuel Blot <emmanuel.blot@free.fr>
Subject: [PING] Re: [PATCH 00/50] Aspeed: I2C device models and the Minerva
 BMC machine
Date: Wed, 23 Sep 2026 18:39:39 +0200
Message-Id: <20260923-bmc-minerva-v1-ping@free.fr>
In-Reply-To: <20260907-bmc-minerva-v1-0-0d83ad610c3b@free.fr>
References: <20260907-bmc-minerva-v1-0-0d83ad610c3b@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=74.125.225.76; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr2-f12.google.com
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

Hi,

Gentle ping on this series.

The I2C device models stand on their own and can be reviewed — or
picked — independently of the Minerva board:

  04-07  pca954x: PCA9545 model, migrated mux state, qtest
  08-21  ds1338: cleanups, class-parameterised register map,
         clock-halt bit, persist-on-reset, qtest coverage
  22-31  DS1339 variant and its qtest coverage
  32-39  ina230 model and its qtest coverage
  40-47  ina238 model and its qtest coverage

The board work is only the last three patches, and 01-03 are the two
missing doc entries plus a sanmiguel flash-controller fix.

Happy to respin the device models as their own series if that makes
review easier.

Thanks,
Emmanuel


On 7 Sep 2026, at 18:41, Emmanuel Blot wrote:

> Add the minerva-bmc machine and the I2C device models it needs.
>
> Based on legoater/aspeed-next, at:
>   1c05d7e94d ("tests/functional: aspeed: optionally check the device
>   tree model on boot")
>
> New models:
>
>   INA230   TI 36V current-shunt and power monitor
>   INA238   TI 85V current-shunt, power and temperature monitor
>   DS1339   RTC, a DS1338 variant
>   PCA9545  4-channel I2C mux with per-channel interrupt inputs
>
> The INA devices derive current and power from the shunt voltage and
> their calibration registers. ALERT output is supported. Measurements
> come in through QOM properties; however, conversion delay is not
> modelled.
>
> Introduce a device class to manage different variants of the DS1338
> register map, such as the DS1339. Improve the DS1338 implementation
> with a Resettable reset, support for the clock-halt bit, and a
> "persist-on-reset" property keeping the registers across a reset.
>
> The minerva-bmc machine is derived from the platform device tree and
> instantiates every device that is supported in QEMU. FRU EEPROMs are
> sanitised images taken from real hardware.
>
> New qtests for the DS1339, INA230, INA238 and PCA9545, plus DS1338
> cases for the register map, and a functional test booting OpenBMC on
> minerva-bmc.
>
> The docs now mention the previously missing catalina-bmc and
> sanmiguel-bmc machines, and the title has been simplified.
>
> One thing worth a second opinion: the PCA954x muxes now have a
> VMStateDescription, which changes the migration stream for the
> existing PCA9546 and PCA9548. The DS1338 vmstate also goes from
> version 2 to 3, but older streams still load fine.
>
> Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
> ---
> Emmanuel Blot (50):
>       docs/system/arm/aspeed: add the catalina-bmc machine
>       docs/system/arm/aspeed: add the sanmiguel-bmc machine
>       hw/arm: sanmiguel: remove the second SPI flash controller
>       hw/i2c: pca954x: drop unused header inclusions
>       hw/i2c: pca954x: add PCA9545 4-channel mux model
>       hw/i2c: pca954x: migrate mux state
>       tests/qtest: pca9545: add mux test
>       hw/rtc: ds1338: move TYPE_DS1338 to a public header
>       hw: ds1338: use the TYPE_DS1338 constant instead of the "ds1338" string
>       hw/rtc: ds1338: implement Resettable reset
>       hw/rtc: ds1338: prefix the file-local helpers with ds1338_
>       hw/rtc: ds1338: parameterise the register map via a device class
>       hw/rtc: ds1338: program the clock from the time registers
>       hw/rtc: ds1338: implement the DS1338 clock-halt bit
>       hw/rtc: ds1338: refresh the user registers on a read rollover only
>       hw/rtc: ds1338: add a persist-on-reset property
>       tests/qtest: ds1338: cover the DS1338-specific register map
>       tests/qtest: ds1338: cover the power-on register defaults
>       tests/qtest: ds1338: cover the clock-halt bit
>       tests/qtest: ds1338: cover persist-on-reset
>       tests/qtest: ds1338: cover the reserved bits of the time registers
>       hw/rtc: ds1338: add DS1339 variant
>       tests/qtest: ds1339: add RTC test
>       tests/qtest: ds1339: cover power-on defaults and reserved-bit masking
>       tests/qtest: ds1339: cover oscillator stop/restart and time programming
>       tests/qtest: ds1339: cover the Century bit
>       tests/qtest: ds1339: cover the end-of-month rollover
>       tests/qtest: ds1339: cover the 12-hour format
>       tests/qtest: ds1339: cover the day-of-week counter
>       tests/qtest: ds1339: cover persist-on-reset
>       tests/qtest: ds1339: cover the migration round trip
>       hw/sensor: ina230: add current/voltage/power monitor
>       tests/qtest: ina230: add current/voltage/power monitor test
>       tests/qtest: ina230: cover voltage injection and power derivation
>       tests/qtest: ina230: cover the ALERT limit functions and CVRF
>       tests/qtest: ina230: cover the injection-property limits
>       tests/qtest: ina230: cover operating modes and triggered conversions
>       tests/qtest: ina230: cover ALERT latch persistence
>       tests/qtest: ina230: cover a cleared calibration per channel
>       hw/sensor: ina238: add current/voltage/power monitor
>       tests/qtest: ina238: add current/voltage/power monitor test
>       tests/qtest: ina238: cover voltage/temperature injection and derivation
>       tests/qtest: ina238: cover the ALERT path and conversion-ready flag
>       tests/qtest: ina238: cover the injection-property limits
>       tests/qtest: ina238: cover the operating modes
>       tests/qtest: ina238: cover conversion-ready and alert-latch semantics
>       tests/qtest: ina238: cover a cleared calibration per channel
>       hw/arm: minerva: add Facebook BMC machine
>       hw/arm: minerva: populate EEPROM data
>       tests/functional/arm: minerva: add BMC boot test
>
>  docs/system/arm/aspeed.rst                  |   7 +-
>  hw/arm/Kconfig                              |   2 +
>  hw/arm/aspeed_ast2400_palmetto.c            |   4 +-
>  hw/arm/aspeed_ast2400_supermicrox11.c       |   4 +-
>  hw/arm/aspeed_ast2500_romulus.c             |   4 +-
>  hw/arm/aspeed_ast2500_supermicro-x11spi.c   |   4 +-
>  hw/arm/aspeed_ast2500_witherspoon.c         |   4 +-
>  hw/arm/aspeed_ast2600_bletchley.c           |   3 +-
>  hw/arm/aspeed_ast2600_catalina.c            |   2 +-
>  hw/arm/aspeed_ast2600_minerva.c             | 856 ++++++++++++++++++++++++++++
>  hw/arm/aspeed_ast2600_sanmiguel.c           |   7 +-
>  hw/arm/meson.build                          |   1 +
>  hw/arm/realview.c                           |   3 +-
>  hw/arm/versatilepb.c                        |   3 +-
>  hw/i2c/i2c_mux_pca954x.c                    |  98 +++-
>  hw/ppc/e500.c                               |   3 +-
>  hw/riscv/tt_atlantis.c                      |   3 +-
>  hw/rtc/ds1338.c                             | 427 +++++++++++---
>  hw/sensor/Kconfig                           |   8 +
>  hw/sensor/ina230.c                          | 597 +++++++++++++++++++
>  hw/sensor/ina238.c                          | 802 ++++++++++++++++++++++++++
>  hw/sensor/meson.build                       |   2 +
>  hw/sensor/trace-events                      |  14 +
>  include/hw/i2c/i2c_mux_pca954x.h            |   1 +
>  include/hw/rtc/ds1338.h                     |  21 +
>  include/hw/sensor/ina230.h                  |  14 +
>  include/hw/sensor/ina238.h                  |  14 +
>  tests/functional/arm/meson.build            |   2 +
>  tests/functional/arm/test_aspeed_minerva.py |  30 +
>  tests/qtest/ds1338-test.c                   | 191 ++++++-
>  tests/qtest/ds1339-test.c                   | 581 +++++++++++++++++++
>  tests/qtest/ina230-test.c                   | 602 +++++++++++++++++++
>  tests/qtest/ina238-test.c                   | 806 ++++++++++++++++++++++++++
>  tests/qtest/meson.build                     |   4 +
>  tests/qtest/pca9545-test.c                  | 116 ++++
>  35 files changed, 5125 insertions(+), 115 deletions(-)
> ---
> base-commit: 1c05d7e94da04129ea16147074fe73158fb85ff9
> change-id: 20260907-bmc-minerva-cd13a718c90b
>
> Best regards,
> --
> Emmanuel Blot <emmanuel.blot@free.fr>

