Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j5C8i-0005xP-2O
	for mharc-qemu-riscv@gnu.org; Fri, 21 Feb 2020 12:31:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37927)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j5C8f-0005x1-W9
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2020 12:30:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j5C8e-0007uI-HW
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2020 12:30:57 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:21077
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j5C8e-0007ty-DU
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2020 12:30:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582306255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DW078fSvt/wxVo8MW6RkGmUKOq8LBVvtStTwUkCFZp0=;
 b=evR2OpGr6ryj4kHcIj8w0fMmTe+Wonw+aDBMTZccifnBR4SXAwGrjUdvLLnWp1spwWS7Hd
 gqmRTuZ0hQdPgq1Wf5TBnL1DbkpxCuxHBcP9hwITEX2RXu29/KAl6U+6IVEmh+0xXTmRxi
 dfZIk4WrTsUu8JD/eyDKtj4ebXqe378=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-q1j6V0dONNeQJLGLCQ9W6g-1; Fri, 21 Feb 2020 12:30:53 -0500
X-MC-Unique: q1j6V0dONNeQJLGLCQ9W6g-1
Received: by mail-wm1-f70.google.com with SMTP id k21so854091wmi.2
 for <qemu-riscv@nongnu.org>; Fri, 21 Feb 2020 09:30:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uAN0dTE3rfOWvsVoICSRFD9tmlR68qf+wBSCeU/ZbPU=;
 b=DPSrMVc0f8KmKYnghFgWsP7j9QsWq5Lg43Xk2CTgci+mT77KPHQNjn9rZrGLM7xAHW
 6YsEm9tJGMTrFXq5ozHSUmoVNpwx/FvbUYtoSpW5tl4NY3FnJit5ru5MSsrElgeMM8Gi
 yi13m6xCetMhhjZMOY7arYjGPS8riXXQutSwKunidEZzzzZtRMt680c66iwzPmBWjbmW
 /7BA6O0sD0qxxqe5FPUl4pKLDbU5dbxSU0g++yBkC9CZkPneyoTpy+8x94H4eJZcJHty
 K1wBrmlchbpO6Zu4qmYzx0xtrFe85T+A9X9Fm+TSp6xZe7nFXcKqI2M37gVAx60fSrCr
 9ulQ==
X-Gm-Message-State: APjAAAWTsWD/6jFoipbt4e95RB+uq41A7IErl86Mg4M++wcmV5vadQQs
 hHYSevkNK6LnOXXL7MjlIC6WTKESVIZpEmx+DmgKiLg4kSxtE710VwV/2S1GSgEmNdHOcG23TjR
 7Akn2JoHd5B77j64=
X-Received: by 2002:adf:fe43:: with SMTP id m3mr52587970wrs.213.1582306252640; 
 Fri, 21 Feb 2020 09:30:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqynjMoLs2CLxYrTIDWvEsXXOVLD/j3uHLlhbsn3QvkxuedCNGtdjQN2y3xDXD4I4Te2WtPi1Q==
X-Received: by 2002:adf:fe43:: with SMTP id m3mr52587938wrs.213.1582306252393; 
 Fri, 21 Feb 2020 09:30:52 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id h18sm5000871wrv.78.2020.02.21.09.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 09:30:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Peter Maydell <peter.maydell@linaro.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Joel Stanley <joel@jms.id.au>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 0/7] hw: Let devices own the MemoryRegion they create
Date: Fri, 21 Feb 2020 18:30:42 +0100
Message-Id: <20200221173049.18134-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Fri, 21 Feb 2020 17:30:59 -0000

When a device creates a MemoryRegion without setting its ownership,
the MemoryRegion is added to the machine "/unattached" container in
the QOM tree.

Add a script to do automatically let the device take the ownership
of the memory regions it creates, and run it.

Philippe Mathieu-Daud=C3=A9 (7):
  scripts/coccinelle: Add a script to let devices own their
    MemoryRegions
  hw/arm: Let devices own the MemoryRegion they create
  hw/char: Let devices own the MemoryRegion they create
  hw/core: Let devices own the MemoryRegion they create
  hw/display: Let devices own the MemoryRegion they create
  hw/dma: Let devices own the MemoryRegion they create
  hw/riscv: Let devices own the MemoryRegion they create

 hw/arm/exynos4210.c                           | 14 ++--
 hw/arm/fsl-imx25.c                            | 14 ++--
 hw/arm/fsl-imx31.c                            | 10 +--
 hw/arm/fsl-imx6.c                             | 10 +--
 hw/arm/fsl-imx6ul.c                           | 14 ++--
 hw/arm/msf2-soc.c                             |  8 +-
 hw/arm/nrf51_soc.c                            |  2 +-
 hw/arm/stm32f205_soc.c                        | 10 +--
 hw/arm/stm32f405_soc.c                        | 13 +--
 hw/arm/xlnx-zynqmp.c                          | 13 ++-
 hw/char/serial.c                              |  7 +-
 hw/core/platform-bus.c                        |  3 +-
 hw/display/cg3.c                              |  4 +-
 hw/display/g364fb.c                           |  5 +-
 hw/display/macfb.c                            |  4 +-
 hw/display/vmware_vga.c                       |  4 +-
 hw/dma/i8257.c                                |  2 +-
 hw/dma/rc4030.c                               |  4 +-
 hw/riscv/sifive_e.c                           |  8 +-
 hw/riscv/sifive_u.c                           |  4 +-
 .../memory_region_owner_nonnull.cocci         | 80 +++++++++++++++++++
 21 files changed, 158 insertions(+), 75 deletions(-)
 create mode 100644 scripts/coccinelle/memory_region_owner_nonnull.cocci

--=20
2.21.1


