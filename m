Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hmxim-0000bt-Ms
	for mharc-qemu-riscv@gnu.org; Mon, 15 Jul 2019 05:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57902)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hmxik-0000RT-El
 for qemu-riscv@nongnu.org; Mon, 15 Jul 2019 05:56:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hmxii-0001vB-TI
 for qemu-riscv@nongnu.org; Mon, 15 Jul 2019 05:56:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42214)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hmxia-0001qr-Dv; Mon, 15 Jul 2019 05:56:24 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7F07583F42;
 Mon, 15 Jul 2019 09:56:23 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0DF46013B;
 Mon, 15 Jul 2019 09:56:13 +0000 (UTC)
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
Date: Mon, 15 Jul 2019 11:55:43 +0200
Message-Id: <20190715095545.28545-2-philmd@redhat.com>
In-Reply-To: <20190715095545.28545-1-philmd@redhat.com>
References: <20190715095545.28545-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Mon, 15 Jul 2019 09:56:23 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-riscv] [RFC PATCH 1/3] hw/Kconfig: PCI bus implies PCI_DEVICES
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
X-List-Received-Date: Mon, 15 Jul 2019 09:56:36 -0000

If a controller device provides a PCI bus, we can plug any PCI
daughter card on it.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 docs/devel/kconfig.rst | 1 -
 hw/alpha/Kconfig       | 1 -
 hw/arm/Kconfig         | 4 ----
 hw/hppa/Kconfig        | 1 -
 hw/i386/Kconfig        | 1 -
 hw/pci/Kconfig         | 1 +
 hw/ppc/Kconfig         | 6 ------
 hw/riscv/Kconfig       | 1 -
 hw/sh4/Kconfig         | 1 -
 hw/sparc64/Kconfig     | 1 -
 10 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/docs/devel/kconfig.rst b/docs/devel/kconfig.rst
index d6f8eb0977..6c010d38d4 100644
--- a/docs/devel/kconfig.rst
+++ b/docs/devel/kconfig.rst
@@ -56,7 +56,6 @@ stanza like the following::
=20
       config ARM_VIRT
          bool
-         imply PCI_DEVICES
          imply VFIO_AMD_XGBE
          imply VFIO_XGMAC
          select A15MPCORE
diff --git a/hw/alpha/Kconfig b/hw/alpha/Kconfig
index 15c59ff264..ddac1bf8e5 100644
--- a/hw/alpha/Kconfig
+++ b/hw/alpha/Kconfig
@@ -1,6 +1,5 @@
 config DP264
     bool
-    imply PCI_DEVICES
     imply TEST_DEVICES
     imply E1000_PCI
     select I82374
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index ab65ecd216..51db042a0a 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -1,6 +1,5 @@
 config ARM_VIRT
     bool
-    imply PCI_DEVICES
     imply TEST_DEVICES
     imply VFIO_AMD_XGBE
     imply VFIO_PLATFORM
@@ -159,7 +158,6 @@ config Z2
=20
 config REALVIEW
     bool
-    imply PCI_DEVICES
     imply PCI_TESTDEV
     select SMC91C111
     select LAN9118
@@ -186,7 +184,6 @@ config REALVIEW
=20
 config SBSA_REF
     bool
-    imply PCI_DEVICES
     select AHCI
     select ARM_SMMUV3
     select GPIO_KEY
@@ -365,7 +362,6 @@ config MPS2
=20
 config FSL_IMX7
     bool
-    imply PCI_DEVICES
     imply TEST_DEVICES
     select A15MPCORE
     select PCI
diff --git a/hw/hppa/Kconfig b/hw/hppa/Kconfig
index 6e5d74a825..13183ff243 100644
--- a/hw/hppa/Kconfig
+++ b/hw/hppa/Kconfig
@@ -1,6 +1,5 @@
 config DINO
     bool
-    imply PCI_DEVICES
     imply E1000_PCI
     imply VIRTIO_VGA
     select PCI
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index 4ddf2a9c55..4eceab2c7c 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -10,7 +10,6 @@ config PC
     imply ISA_IPMI_BT
     imply ISA_DEBUG
     imply PARALLEL
-    imply PCI_DEVICES
     imply PVPANIC
     imply QXL
     imply SEV
diff --git a/hw/pci/Kconfig b/hw/pci/Kconfig
index 77f8b005ff..0f7267db35 100644
--- a/hw/pci/Kconfig
+++ b/hw/pci/Kconfig
@@ -1,5 +1,6 @@
 config PCI
     bool
+    imply PCI_DEVICES
=20
 config PCI_EXPRESS
     bool
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index f927ec9c74..6a7f06744d 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -1,6 +1,5 @@
 config PSERIES
     bool
-    imply PCI_DEVICES
     imply TEST_DEVICES
     imply VIRTIO_VGA
     select DIMM
@@ -18,7 +17,6 @@ config SPAPR_RNG
=20
 config POWERNV
     bool
-    imply PCI_DEVICES
     imply TEST_DEVICES
     select ISA_IPMI_BT
     select IPMI_LOCAL
@@ -36,7 +34,6 @@ config PPC405
=20
 config PPC440
     bool
-    imply PCI_DEVICES
     imply TEST_DEVICES
     imply E1000_PCI
     select PCI_EXPRESS
@@ -62,7 +59,6 @@ config SAM460EX
=20
 config PREP
     bool
-    imply PCI_DEVICES
     imply TEST_DEVICES
     select CS4231A
     select PREP_PCI
@@ -77,7 +73,6 @@ config RS6000_MC
=20
 config MAC_OLDWORLD
     bool
-    imply PCI_DEVICES
     imply SUNGEM
     imply TEST_DEVICES
     select ADB
@@ -87,7 +82,6 @@ config MAC_OLDWORLD
=20
 config MAC_NEWWORLD
     bool
-    imply PCI_DEVICES
     imply SUNGEM
     imply TEST_DEVICES
     select ADB
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 8674211085..636072c7f3 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -27,7 +27,6 @@ config SPIKE
=20
 config RISCV_VIRT
     bool
-    imply PCI_DEVICES
     imply TEST_DEVICES
     select PCI
     select HART
diff --git a/hw/sh4/Kconfig b/hw/sh4/Kconfig
index 4cbce3a0ed..cfde77d04a 100644
--- a/hw/sh4/Kconfig
+++ b/hw/sh4/Kconfig
@@ -1,6 +1,5 @@
 config R2D
     bool
-    imply PCI_DEVICES
     imply TEST_DEVICES
     imply RTL8139_PCI
     select I82378 if TEST_DEVICES
diff --git a/hw/sparc64/Kconfig b/hw/sparc64/Kconfig
index d4d76a89be..125d442d65 100644
--- a/hw/sparc64/Kconfig
+++ b/hw/sparc64/Kconfig
@@ -1,6 +1,5 @@
 config SUN4U
     bool
-    imply PCI_DEVICES
     imply SUNHME
     imply TEST_DEVICES
     imply PARALLEL
--=20
2.20.1


