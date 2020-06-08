Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiKDI-00069l-JK
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 12:01:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKCx-0005zs-1j
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:01:10 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:60918
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKCm-0007Px-I0
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:01:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=r7PHbUODraiyYDfGeXtIeVn3Evhw0HgQCb8r2diF6v0=;
 b=fnGHtiUWE2LM4j38X40NYaHkSd4Jf6d0YJt17pODpTNcs2r8oZmi7eFxmzl86AxNIswF6V
 v027L7Ek//TnOW3KpmTpShykoOaOn44I6CFV7kbwHyWXgfH69a0i4Uj+0IajYrpgJ0e1Yi
 zC1xnXWoXFjZ4m9iTIBQT/OgcC4uGC4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-z27DBXNQPjqDkEoo_2ngQQ-1; Mon, 08 Jun 2020 12:00:49 -0400
X-MC-Unique: z27DBXNQPjqDkEoo_2ngQQ-1
Received: by mail-wm1-f72.google.com with SMTP id a7so9992wmf.1
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2020 09:00:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r7PHbUODraiyYDfGeXtIeVn3Evhw0HgQCb8r2diF6v0=;
 b=nz03zjo0Vfvo4cHLAogblRnkhHH/Kt1xIfmYTPeWzVdLXbKs8BYsooJUdmD2XkW5Ow
 yBJNLFUrXJ1wGidLX7yl2c9Gy1PXbyU7J9VgjgaSMGCefmNI+7Qak6Msc9Zo1p25CVeQ
 rEwDVI2pq8exFAgvZZEwLuZo5a55/6g1yyymbBq4foTeKfbmdstsG9y25eOcPEFhSPqM
 f4TiVmre64OX6fK3T8hEQ9gtk3vPM3I+lbRHbzmC3YStiYqliCgv6pnZinKUoaDYb80z
 arfLHATYri+csWpWTLqbXGXExthb/MdB8TwL459pXl71xM+X3o7rNsBMEnomAkyGckLs
 kAQA==
X-Gm-Message-State: AOAM533sj5ngPekrD2PFiNfLcuIKWxcrWWcoA2Qf79oaf3d9hVHqtSRl
 KZWtZG+zSTz+lYEExBNwuxB99hc5aWd0TXliGLMLsfqkpz+rF17a2CIHSYiloXDzza48sGQK1vS
 cmbK43ze2lmXU8/Y=
X-Received: by 2002:a5d:69cb:: with SMTP id s11mr24291804wrw.91.1591632048440; 
 Mon, 08 Jun 2020 09:00:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMtorKuHBb+MRvZ6tBeip6kyiiVi39BDg4R5E8m4jpXwbcp5IXslWyCaizAHQ0jAbG9qrLqg==
X-Received: by 2002:a5d:69cb:: with SMTP id s11mr24291746wrw.91.1591632048080; 
 Mon, 08 Jun 2020 09:00:48 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id o15sm175107wrv.48.2020.06.08.09.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:00:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Stafford Horne <shorne@gmail.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 qemu-ppc@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <rth@twiddle.net>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, qemu-riscv@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Anthony Perard <anthony.perard@citrix.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 David Gibson <david@gibson.dropbear.id.au>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC PATCH 00/35] hw/qdev: Warn when using pre-qdev/QOM devices
Date: Mon,  8 Jun 2020 18:00:09 +0200
Message-Id: <20200608160044.15531-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 05:40:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 08 Jun 2020 16:01:11 -0000

Based on today's IRC chat, this is a trivial RFC series
to anotate pre-qdev/QOM devices so developers using them
without knowing they are not QOM'ified yet can realize
it and convert them if they have time.

qdev/QOM devices are introspectable, so easier to test
or even fuzz.

Philippe Mathieu-Daudé (35):
  qom/object: Update documentation
  hw/core/qdev: Add qdev_warn_deprecated_function_used() helper
  hw/arm/omap: Emit warning when old code is used
  hw/arm/pxa2xx: Emit warning when old code is used
  hw/arm/nseries: Emit warning when old code is used
  hw/timer/arm_timer: Emit warning when old code is used
  hw/char/parallel: Emit warning when old code is used
  hw/display/blizzard: Emit warning when old code is used
  hw/display/ramfb: Emit warning when old code is used
  hw/display/tc6393xb: Emit warning when old code is used
  hw/display/vga-isa-mm: Emit warning when old code is used
  hw/dma/etraxfs_dma: Emit warning when old code is used
  hw/dma/soc_dma: Emit warning when old code is used
  hw/i386/pc: Emit warning when old code is used
  hw/i386/xen/xen-hvm: Emit warning when old code is used
  hw/input/lasips2: Emit warning when old code is used
  hw/input/pckbd: Emit warning when old code is used
  hw/input/ps2: Emit warning when old code is used
  hw/input/tsc2005: Emit warning when old code is used
  hw/intc/i8259: Emit warning when old code is used
  hw/lm32/lm32_hwsetup: Emit warning when old code is used
  hw/m68k/mcf520x: Emit warning when old code is used
  hw/misc/applesmc: Emit warning when old code is used
  hw/misc/cbus: Emit warning when old code is used
  hw/nvram/eeprom93xx: Emit warning when old code is used
  hw/openrisc/cputimer: Emit warning when old code is used
  hw/ppc/ppc: Emit warning when old code is used
  hw/ppc/ppc4xx: Emit warning when old code is used
  hw/ppc/ppc_booke: Emit warning when old code is used
  hw/ppc/virtex_ml507: Emit warning when old code is used
  hw/sh4: Emit warning when old code is used
  hw/riscv: Emit warning when old code is used
  hw/timer/slavio_timer: Emit warning when old code is used
  hw/usb/hcd-musb: Emit warning when old code is used
  hw/xtensa/xtfpga: Emit warning when old code is used

 configure                    |  8 ++++++++
 hw/lm32/lm32_hwsetup.h       |  3 +++
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
 hw/i386/pc.c                 |  3 +++
 hw/i386/xen/xen-hvm.c        |  4 +++-
 hw/input/lasips2.c           |  4 +++-
 hw/input/pckbd.c             |  4 +++-
 hw/input/ps2.c               |  6 +++++-
 hw/input/pxa2xx_keypad.c     |  3 +++
 hw/input/tsc2005.c           |  3 +++
 hw/intc/i8259.c              |  3 +++
 hw/intc/sh_intc.c            |  3 +++
 hw/m68k/mcf5206.c            |  5 +++++
 hw/m68k/mcf5208.c            |  3 +++
 hw/misc/applesmc.c           |  3 +++
 hw/misc/cbus.c               |  3 +++
 hw/misc/omap_gpmc.c          |  3 +++
 hw/misc/omap_l4.c            |  3 +++
 hw/misc/omap_sdrc.c          |  3 +++
 hw/nvram/eeprom93xx.c        |  3 +++
 hw/openrisc/cputimer.c       |  3 +++
 hw/ppc/ppc.c                 |  3 +++
 hw/ppc/ppc405_boards.c       |  5 +++++
 hw/ppc/ppc405_uc.c           | 21 +++++++++++++++++++++
 hw/ppc/ppc4xx_devs.c         |  7 +++++++
 hw/ppc/ppc_booke.c           |  4 +++-
 hw/ppc/virtex_ml507.c        |  4 +++-
 hw/riscv/riscv_htif.c        |  4 ++++
 hw/riscv/sifive_uart.c       |  4 ++++
 hw/sd/omap_mmc.c             |  5 +++++
 hw/sh4/r2d.c                 |  3 +++
 hw/sh4/sh7750.c              |  4 ++++
 hw/ssi/omap_spi.c            |  3 +++
 hw/timer/arm_timer.c         |  3 +++
 hw/timer/omap_synctimer.c    |  4 ++++
 hw/timer/sh_timer.c          |  5 +++++
 hw/timer/slavio_timer.c      |  3 +++
 hw/usb/hcd-musb.c            |  3 +++
 hw/xtensa/xtfpga.c           |  3 +++
 55 files changed, 240 insertions(+), 10 deletions(-)
 create mode 100644 include/hw/qdev-deprecated.h

-- 
2.21.3


