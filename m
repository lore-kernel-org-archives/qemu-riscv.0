Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jrkG8-0000cR-Kp
	for mharc-qemu-riscv@gnu.org; Sat, 04 Jul 2020 11:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkG7-0000bu-9C
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:39:19 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53907
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkG3-0007Rk-Sq
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:39:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nr0/mEmyL3K5IVI928eiIdMK3sHSZE7ocqWvKvjJWbw=;
 b=XA789/g+G/703P6JpzMerPYGQLeqlqY5/dNDidjYPxVs5Y2cYil9ky7NFkE10wsBVougtg
 gZsQZZLFxh4LoZTzK5MmmSOLdnLqnIg0mEs2JvGbRwDWUuTjUgo4qgaGBDPRbNII52E2S3
 eFf11/XNqx55KG4wEUxjVKDwmzNXSB4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-R6knev1DNgmXX7TkLNFCrg-1; Sat, 04 Jul 2020 11:39:12 -0400
X-MC-Unique: R6knev1DNgmXX7TkLNFCrg-1
Received: by mail-wm1-f72.google.com with SMTP id g124so39738541wmg.6
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2020 08:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nr0/mEmyL3K5IVI928eiIdMK3sHSZE7ocqWvKvjJWbw=;
 b=EsWL8413bC3rNTblEtwpAPYV+kzQ0q7qSPqHjrPRCf70fxWobNoQngmI6qcNojwC8B
 M5w4OFZZ0DlVOzzrWZ9WbFY2XCIIDsrbCH+DoiL35Mp75VVnTy7xpzzbxKOC1WJYMg8j
 63SUzb6kBy0SzTwETHmifilC6FCAO4kZPE03aP5Rk4e9LXnEgmWIFJgoMrfbVpInHB7Y
 G1pZRVq1RaGiRqO1cBSc7kEFWM0zffmguJafFFL3XSwEUhks+zjIqkUACKFmgpP9fuCi
 Z0YYI3I0mI/VaLQtP7xJkiFbEa07gBAmmAMvDB9LKWjLxedWGEYIgMLAYS9V8mu3BWQ1
 uSYA==
X-Gm-Message-State: AOAM532Giet2u+BwHCg4Hnwi2wipp+qKyPIRa2gBP+e2kVsGXPxSf6JN
 KKftg+U2GszisWSHQ2+XXstJLPWMQBIuYnb16mXkj81xVvrfsUKGYqO+gU/3uCJl0QznBB55blW
 WTVZ476C4O8NdUYY=
X-Received: by 2002:a5d:60c5:: with SMTP id x5mr6714546wrt.67.1593877151674;
 Sat, 04 Jul 2020 08:39:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqAVYRFYzqVU2yC5gJD1uy3EIPuKDi0xg+WN1Yf+AhcuCgCujLfggwqGqEhizhBOScVaPpFw==
X-Received: by 2002:a5d:60c5:: with SMTP id x5mr6714516wrt.67.1593877151479;
 Sat, 04 Jul 2020 08:39:11 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id u8sm16658341wrt.28.2020.07.04.08.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:39:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Stafford Horne <shorne@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Andrzej Zaborowski <balrogg@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Magnus Damm <magnus.damm@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Thomas Huth <huth@tuxfamily.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC PATCH v2 00/23] hw/qdev: Warn when using pre-qdev/QOM devices
Date: Sat,  4 Jul 2020 17:38:45 +0200
Message-Id: <20200704153908.12118-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 11:39:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 04 Jul 2020 15:39:19 -0000

This is a trivial RFC series to anotate pre-qdev/QOM devices
so developers using them without knowing they are not QOM'ified
yet can realize it and convert them if/when they have time.

qdev/QOM devices are introspectable, so easier to test
or even fuzz.

Since RFC v1:
- Addressed bonzini comments, removed invalid patches
- Addressed thuth comment

Philippe Mathieu-Daudé (23):
  qom/object: Update documentation
  hw/core/qdev: Add qdev_warn_deprecated_function_used() helper
  hw/arm/omap: Emit warning when old code is used
  hw/arm/pxa2xx: Emit warning when old code is used
  hw/arm/nseries: Emit warning when old code is used
  hw/char/parallel: Emit warning when old code is used
  hw/display/blizzard: Emit warning when old code is used
  hw/display/ramfb: Emit warning when old code is used
  hw/display/tc6393xb: Emit warning when old code is used
  hw/display/vga-isa-mm: Emit warning when old code is used
  hw/dma/etraxfs_dma: Emit warning when old code is used
  hw/dma/soc_dma: Emit warning when old code is used
  hw/input/lasips2: Emit warning when old code is used
  hw/input/tsc2005: Emit warning when old code is used
  hw/m68k/mcf520x: Emit warning when old code is used
  hw/misc/cbus: Emit warning when old code is used
  hw/nvram/eeprom93xx: Emit warning when old code is used
  hw/openrisc/cputimer: Emit warning when old code is used
  hw/ppc/ppc4xx: Emit warning when old code is used
  hw/sh4: Emit warning when old code is used
  hw/riscv: Emit warning when old code is used
  hw/usb/hcd-musb: Emit warning when old code is used
  hw/xtensa/xtfpga: Emit warning when old code is used

 configure                    |  8 ++++++++
 include/hw/qdev-deprecated.h | 26 ++++++++++++++++++++++++++
 include/qom/object.h         |  6 +++---
 hw/arm/nseries.c             |  2 ++
 hw/arm/omap1.c               |  6 ++++++
 hw/arm/pxa2xx.c              |  3 +++
 hw/char/omap_uart.c          |  5 +++++
 hw/char/parallel.c           |  3 +++
 hw/char/sh_serial.c          |  3 +++
 hw/core/qdev.c               |  8 ++++++++
 hw/display/blizzard.c        |  3 +++
 hw/display/pxa2xx_lcd.c      |  3 +++
 hw/display/ramfb.c           |  3 +++
 hw/display/tc6393xb.c        |  3 +++
 hw/display/vga-isa-mm.c      |  5 +++++
 hw/display/vga.c             |  3 +++
 hw/dma/etraxfs_dma.c         |  4 +++-
 hw/dma/soc_dma.c             |  3 +++
 hw/input/lasips2.c           |  4 +++-
 hw/input/pxa2xx_keypad.c     |  3 +++
 hw/input/tsc2005.c           |  3 +++
 hw/intc/sh_intc.c            |  3 +++
 hw/m68k/mcf5206.c            |  5 +++++
 hw/m68k/mcf5208.c            |  3 +++
 hw/misc/cbus.c               |  3 +++
 hw/misc/omap_gpmc.c          |  3 +++
 hw/misc/omap_l4.c            |  3 +++
 hw/misc/omap_sdrc.c          |  3 +++
 hw/nvram/eeprom93xx.c        |  3 +++
 hw/openrisc/cputimer.c       |  3 +++
 hw/ppc/ppc405_boards.c       |  5 +++++
 hw/ppc/ppc405_uc.c           | 21 +++++++++++++++++++++
 hw/ppc/ppc4xx_devs.c         |  7 +++++++
 hw/riscv/riscv_htif.c        |  4 ++++
 hw/riscv/sifive_uart.c       |  4 ++++
 hw/sd/omap_mmc.c             |  5 +++++
 hw/sh4/r2d.c                 |  3 +++
 hw/sh4/sh7750.c              |  4 ++++
 hw/ssi/omap_spi.c            |  3 +++
 hw/timer/omap_synctimer.c    |  4 ++++
 hw/timer/sh_timer.c          |  5 +++++
 hw/usb/hcd-musb.c            |  3 +++
 hw/xtensa/xtfpga.c           |  3 +++
 43 files changed, 202 insertions(+), 5 deletions(-)
 create mode 100644 include/hw/qdev-deprecated.h

-- 
2.21.3


