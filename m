Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hmxj0-0001aV-QH
	for mharc-qemu-riscv@gnu.org; Mon, 15 Jul 2019 05:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58006)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hmxix-0001Oc-VL
 for qemu-riscv@nongnu.org; Mon, 15 Jul 2019 05:56:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hmxiw-00021L-T0
 for qemu-riscv@nongnu.org; Mon, 15 Jul 2019 05:56:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51222)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hmxin-0001wJ-Mu; Mon, 15 Jul 2019 05:56:37 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 931A3307FBCB;
 Mon, 15 Jul 2019 09:56:36 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 185426012C;
 Mon, 15 Jul 2019 09:56:23 +0000 (UTC)
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
Date: Mon, 15 Jul 2019 11:55:44 +0200
Message-Id: <20190715095545.28545-3-philmd@redhat.com>
In-Reply-To: <20190715095545.28545-1-philmd@redhat.com>
References: <20190715095545.28545-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Mon, 15 Jul 2019 09:56:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-riscv] [PATCH-for-4.2 2/3] hw/usb/Kconfig: Add
 CONFIG_USB_EHCI_PCI
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
X-List-Received-Date: Mon, 15 Jul 2019 09:56:50 -0000

The USB_EHCI entry currently include PCI code. Since the EHCI
implementation is already split in sysbus/PCI, add a new
USB_EHCI_PCI. There are no logical changes, but the Kconfig
dependencies tree is cleaner.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/usb/Kconfig       | 9 ++++++---
 hw/usb/Makefile.objs | 5 +++--
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
index 564305e283..495c6f2d48 100644
--- a/hw/usb/Kconfig
+++ b/hw/usb/Kconfig
@@ -19,13 +19,16 @@ config USB_OHCI_PCI
=20
 config USB_EHCI
     bool
-    default y if PCI_DEVICES
-    depends on PCI
     select USB
=20
+config USB_EHCI_PCI
+    bool
+    default y if PCI_DEVICES
+    select USB_EHCI
+
 config USB_EHCI_SYSBUS
     bool
-    select USB
+    select USB_EHCI
=20
 config USB_XHCI
     bool
diff --git a/hw/usb/Makefile.objs b/hw/usb/Makefile.objs
index 81688f6e70..303ac084a0 100644
--- a/hw/usb/Makefile.objs
+++ b/hw/usb/Makefile.objs
@@ -6,8 +6,9 @@ common-obj-$(CONFIG_USB) +=3D desc.o desc-msos.o
 common-obj-$(CONFIG_USB_UHCI) +=3D hcd-uhci.o
 common-obj-$(CONFIG_USB_OHCI) +=3D hcd-ohci.o
 common-obj-$(CONFIG_USB_OHCI_PCI) +=3D hcd-ohci-pci.o
-common-obj-$(CONFIG_USB_EHCI) +=3D hcd-ehci.o hcd-ehci-pci.o
-common-obj-$(CONFIG_USB_EHCI_SYSBUS) +=3D hcd-ehci.o hcd-ehci-sysbus.o
+common-obj-$(CONFIG_USB_EHCI) +=3D hcd-ehci.o
+common-obj-$(CONFIG_USB_EHCI_PCI) +=3D hcd-ehci-pci.o
+common-obj-$(CONFIG_USB_EHCI_SYSBUS) +=3D hcd-ehci-sysbus.o
 common-obj-$(CONFIG_USB_XHCI) +=3D hcd-xhci.o
 common-obj-$(CONFIG_USB_XHCI_NEC) +=3D hcd-xhci-nec.o
 common-obj-$(CONFIG_USB_MUSB) +=3D hcd-musb.o
--=20
2.20.1


