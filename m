Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jNlMP-0007jV-H8
	for mharc-qemu-riscv@gnu.org; Sun, 12 Apr 2020 18:45:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50897)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlMM-0007c1-OC
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:45:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlML-0007WT-Ae
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:45:50 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:45240)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlLy-0007OI-Hz; Sun, 12 Apr 2020 18:45:26 -0400
Received: by mail-wr1-x443.google.com with SMTP id v5so8517772wrp.12;
 Sun, 12 Apr 2020 15:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=paXowiFLspJCJ+CxZTq0gQWD9VWSRURwdUHQAdRuXpU=;
 b=a3o93U/zHKzjtmWo/h4HlyWVvYhpJwHL2cZ2tOlElCFEjVvrKgS8PemHiYUQIiU+Ia
 Vjz4zUIuffSPe3f+RoEXjK9iLX9NVuciP8qF9yj93cDygWgh8bnAVnhHDulxUWAKPM2u
 O8oVjVinRP8otLOmF9REGmgBCJubcc5Kct7KN4JrVV5fQ+30QD9FMzvDP9tL681NJ4Xp
 ZXys733MPAO3DRTfpNdpF4PIf4+Qxz8AXt9hok2D8YwKyyIBMiVg8A7P+crQ67bO6kOk
 D6UsKb/Ccv4z0XFbnvNAJ6CgFGIhM8Z93Fj8WPW0BoWTGQrS0oz+oAmzyMBPb6oRa2g0
 p/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=paXowiFLspJCJ+CxZTq0gQWD9VWSRURwdUHQAdRuXpU=;
 b=Ky+Loys3286sMwrfM38RdQFoM3e7tzC3ln2cv27v+8ciOMEBLFEVFvBM/81+gLD1HI
 7AjJyoPfj1GdfaRLaHpFRzBFyHYW+EoP/67zjqeh1JPbSTYuAwdfsYwdzxR+9aCmQ60o
 0ifok47JZ7mj91PuFa/OcsPmaAKgzAur8NdNhJf14c4TTFaP8OBfM69bVZQy5tJC7Rha
 yPTYRviZNr8r81BMgjrZkfSpl1VEzoUps+Scem66zhv0eDYvWE3A2YSSKrpCjBQ6NJFD
 MscSNTXRWMp+G1zmGIp1Xqs/ZOjXQJzcP1F6ZJNZaBhZsH3IhF5xDMT4B3urJD3xnHbT
 Bvkg==
X-Gm-Message-State: AGi0PubHRR+OtuyQ+0ZeBYvCRcT1mvI6PLyHvaZwcjnbznLC5rcuzNZM
 OYNMISTdMx5J6Qw6N6OX7M7fa7ep0C51ug==
X-Google-Smtp-Source: APiQypLTyuwiHqEGMcLZIGWjPH6RdHo9ZCnbXR4GgGGa0GkJX1c3soDYoy4J18s1xpE4CkcyItSo8Q==
X-Received: by 2002:adf:f3c5:: with SMTP id g5mr15721541wrp.230.1586731523938; 
 Sun, 12 Apr 2020 15:45:23 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id a1sm3509742wrn.80.2020.04.12.15.45.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:45:22 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Paul Burton <pburton@wavecomp.com>, Kevin Wolf <kwolf@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Andrew Jeffery <andrew@aj.id.au>, Richard Henderson <rth@twiddle.net>,
 Jiri Slaby <jslaby@suse.cz>, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Amit Shah <amit@kernel.org>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Joel Stanley <joel@jms.id.au>, Jason Wang <jasowang@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Zhang Chen <chen.zhang@intel.com>,
 qemu-riscv@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-block@nongnu.org,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Alistair Francis <alistair@alistair23.me>, Fam Zheng <fam@euphon.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH-for-5.1 v3 0/7] various: Fix error-propagation with Coccinelle
 scripts (part 3)
Date: Mon, 13 Apr 2020 00:45:10 +0200
Message-Id: <20200412224517.12869-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
X-List-Received-Date: Sun, 12 Apr 2020 22:45:52 -0000

This series is inspired of Peter Maydell fix [1]:
"hw/arm/xlnx-zynqmp.c: fix some error-handling code",
but grew after v1 [2] review :/

Markus: I added the cocci patches to your Error section, I hope
that's fine :)

Part 3: Use &error_abort/&error_fatal in instance_init().

Regards,

Phil.

[1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg691636.html
[2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg692155.html
Based-on: <20200412224144.12205-1-f4bug@amsat.org>

Philippe Mathieu-Daudé (7):
  scripts/coccinelle: Use &error_abort in TypeInfo::instance_init()
  various: Use &error_abort in instance_init()
  scripts/coccinelle: Find eventually missing error_propagate() calls
  migration/colo: Add missing error-propagation code
  hw/mips/boston: Add missing error-propagation code
  hw/mips/mips_malta: Use &error_abort in MachineClass::init ->
    create_cps
  qga/commands-win32: Add missing error-propagation code

 .../find-missing-error_propagate.cocci        | 53 +++++++++++++++++++
 .../use-error_abort-in-instance_init.cocci    | 45 ++++++++++++++++
 backends/cryptodev-vhost-user.c               |  2 +-
 backends/rng-egd.c                            |  2 +-
 backends/rng-random.c                         |  2 +-
 backends/vhost-user.c                         |  3 +-
 hw/arm/bcm2835_peripherals.c                  |  6 ++-
 hw/arm/vexpress.c                             |  8 +--
 hw/arm/xlnx-zcu102.c                          |  8 +--
 hw/block/fdc.c                                |  4 +-
 hw/block/vhost-user-blk.c                     |  2 +-
 hw/block/virtio-blk.c                         |  2 +-
 hw/core/machine.c                             |  6 +--
 hw/cpu/core.c                                 |  4 +-
 hw/display/vga-pci.c                          |  7 ++-
 hw/display/xlnx_dp.c                          |  4 +-
 hw/dma/sparc32_dma.c                          |  2 +-
 hw/gpio/aspeed_gpio.c                         |  2 +-
 hw/ide/macio.c                                |  4 +-
 hw/ide/qdev.c                                 |  4 +-
 hw/intc/apic_common.c                         |  2 +-
 hw/mem/nvdimm.c                               |  4 +-
 hw/mips/boston.c                              | 17 +++---
 hw/mips/mips_malta.c                          | 15 ++----
 hw/misc/aspeed_sdmc.c                         |  2 +-
 hw/misc/edu.c                                 |  3 +-
 hw/misc/macio/macio.c                         |  4 +-
 hw/misc/macio/pmu.c                           |  3 +-
 hw/misc/pca9552.c                             |  2 +-
 hw/misc/tmp105.c                              |  2 +-
 hw/misc/tmp421.c                              |  8 +--
 hw/net/e1000.c                                |  3 +-
 hw/net/lance.c                                |  3 +-
 hw/net/lasi_i82596.c                          |  3 +-
 hw/net/ne2000-isa.c                           |  4 +-
 hw/net/spapr_llan.c                           |  3 +-
 hw/net/virtio-net.c                           |  2 +-
 hw/pci-host/grackle.c                         |  2 +-
 hw/pci-host/i440fx.c                          |  8 +--
 hw/pci-host/prep.c                            |  2 +-
 hw/pci-host/q35.c                             | 23 ++++----
 hw/pci-host/sabre.c                           |  3 +-
 hw/pci-host/uninorth.c                        |  9 ++--
 hw/pcmcia/pxa2xx.c                            |  3 +-
 hw/ppc/spapr_drc.c                            |  6 +--
 hw/ppc/spapr_rng.c                            |  2 +-
 hw/riscv/sifive_u.c                           |  4 +-
 hw/s390x/event-facility.c                     |  6 +--
 hw/s390x/s390-ccw.c                           |  2 +-
 hw/s390x/s390-skeys.c                         |  4 +-
 hw/s390x/s390-stattrib.c                      |  4 +-
 hw/s390x/sclp.c                               |  2 +-
 hw/scsi/scsi-bus.c                            |  2 +-
 hw/ssi/xilinx_spips.c                         |  2 +-
 hw/usb/bus.c                                  |  4 +-
 hw/usb/dev-network.c                          |  2 +-
 hw/usb/dev-storage.c                          |  4 +-
 hw/usb/host-libusb.c                          |  2 +-
 hw/usb/redirect.c                             |  2 +-
 hw/virtio/virtio-balloon.c                    |  4 +-
 migration/colo.c                              |  3 ++
 net/dump.c                                    |  4 +-
 net/filter-buffer.c                           |  2 +-
 net/filter-mirror.c                           | 10 ++--
 net/filter-rewriter.c                         |  3 +-
 qga/commands-win32.c                          | 26 ++++++---
 target/arm/cpu64.c                            |  4 +-
 target/i386/cpu.c                             | 23 ++++----
 target/s390x/cpu.c                            |  3 +-
 tests/check-qom-proplist.c                    |  7 +--
 tests/test-qdev-global-props.c                |  5 +-
 MAINTAINERS                                   |  2 +
 72 files changed, 289 insertions(+), 155 deletions(-)
 create mode 100644 scripts/coccinelle/find-missing-error_propagate.cocci
 create mode 100644 scripts/coccinelle/use-error_abort-in-instance_init.cocci

-- 
2.21.1


