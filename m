Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hmxia-0008IS-J5
	for mharc-qemu-riscv@gnu.org; Mon, 15 Jul 2019 05:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57819)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hmxiY-00087r-4T
 for qemu-riscv@nongnu.org; Mon, 15 Jul 2019 05:56:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hmxiX-0001px-8L
 for qemu-riscv@nongnu.org; Mon, 15 Jul 2019 05:56:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51846)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hmxiR-0001mL-R8; Mon, 15 Jul 2019 05:56:15 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BBBCC3DD47;
 Mon, 15 Jul 2019 09:56:12 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B00B6012C;
 Mon, 15 Jul 2019 09:55:53 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@sifive.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>, qemu-arm@nongnu.org,
 Helge Deller <deller@gmx.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Mon, 15 Jul 2019 11:55:42 +0200
Message-Id: <20190715095545.28545-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Mon, 15 Jul 2019 09:56:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-riscv] [PATCH 0/3] hw/Kconfig: PCI & USB fixes
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
X-List-Received-Date: Mon, 15 Jul 2019 09:56:23 -0000

I actually wanted to clean the USB devices (i.e. to not have
USB3 devices appear on OHCI buses) but this is too late for
the next release, so let's post the patches accumulated.

Philippe Mathieu-Daud=C3=A9 (3):
  hw/Kconfig: PCI bus implies PCI_DEVICES
  hw/usb/Kconfig: Add CONFIG_USB_EHCI_PCI
  hw/usb/Kconfig: USB_XHCI_NEC requires USB_XHCI

 docs/devel/kconfig.rst |  1 -
 hw/alpha/Kconfig       |  1 -
 hw/arm/Kconfig         |  4 ----
 hw/hppa/Kconfig        |  1 -
 hw/i386/Kconfig        |  1 -
 hw/pci/Kconfig         |  1 +
 hw/ppc/Kconfig         |  6 ------
 hw/riscv/Kconfig       |  1 -
 hw/sh4/Kconfig         |  1 -
 hw/sparc64/Kconfig     |  1 -
 hw/usb/Kconfig         | 11 +++++++----
 hw/usb/Makefile.objs   |  5 +++--
 12 files changed, 11 insertions(+), 23 deletions(-)

--=20
2.20.1


