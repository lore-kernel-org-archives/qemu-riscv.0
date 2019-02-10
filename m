Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gsvbF-0004Xg-B8
	for mharc-qemu-riscv@gnu.org; Sun, 10 Feb 2019 15:21:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43319)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lukas.auer@aisec.fraunhofer.de>) id 1gsvbD-0004TW-0o
	for qemu-riscv@nongnu.org; Sun, 10 Feb 2019 15:21:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lukas.auer@aisec.fraunhofer.de>) id 1gsvYc-00074I-Mv
	for qemu-riscv@nongnu.org; Sun, 10 Feb 2019 15:18:32 -0500
Received: from mail-edgedd24.fraunhofer.de ([192.102.167.24]:47646)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lukas.auer@aisec.fraunhofer.de>)
	id 1gsvYb-00071O-Sa; Sun, 10 Feb 2019 15:18:30 -0500
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2EVAAAO4PJb/xmnZsBiGgEBAQEBAgEBA?=
	=?us-ascii?q?QEHAgEBAQGBVAIBAQEBCwGCA4FWOYxvix2bPQ2EbINwIjcGDQEDAQECAQECAgJ?=
	=?us-ascii?q?pKIVrCwFGgR4gAQ0FgyGCAqhJM4ocCQGHUIQrgVc/gRGHWYYSAosIlGcHAoERg?=
	=?us-ascii?q?QkEjn4LGIlYhyQBmBaBXCOBVTMaJIM7gicXjh0+ATIBjA6CTQEB?=
X-IPAS-Result: =?us-ascii?q?A2EVAAAO4PJb/xmnZsBiGgEBAQEBAgEBAQEHAgEBAQGBVAI?=
	=?us-ascii?q?BAQEBCwGCA4FWOYxvix2bPQ2EbINwIjcGDQEDAQECAQECAgJpKIVrCwFGgR4gA?=
	=?us-ascii?q?Q0FgyGCAqhJM4ocCQGHUIQrgVc/gRGHWYYSAosIlGcHAoERgQkEjn4LGIlYhyQ?=
	=?us-ascii?q?BmBaBXCOBVTMaJIM7gicXjh0+ATIBjA6CTQEB?=
X-IronPort-AV: E=Sophos;i="5.56,253,1539640800"; d="scan'208";a="23237006"
Received: from mail-mtadd25.fraunhofer.de ([192.102.167.25])
	by mail-edgeDD24.fraunhofer.de with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Feb 2019 21:18:15 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0A1AAAq4PJb/xBhWMBiGwEBAQEDAQEBB?=
	=?us-ascii?q?wMBAQGBVAMBAQELAYM4ITmMb6ZaDYRshBE3Bg0BAwEBAgEBAm0ohWoLAUaBHiA?=
	=?us-ascii?q?BDQWDIYICqEkzih0JAYdQhgI/gRGHWYYSAosIlGcHAoERgQkEjn4LGIlYhyQBm?=
	=?us-ascii?q?BaBXCKBVTMaJIM7gicXjh0+AzABjA6CTQEB?=
X-IronPort-AV: E=Sophos;i="5.56,253,1539640800"; d="scan'208";a="31585611"
Received: from fgdemucivp01ltm.xch.fraunhofer.de (HELO
	FGDEMUCIMP11EXC.ads.fraunhofer.de) ([192.88.97.16])
	by mail-mtaDD25.fraunhofer.de with ESMTP/TLS/AES256-SHA;
	10 Feb 2019 21:18:13 +0100
Received: from localhost.de (10.80.233.50) by
	FGDEMUCIMP11EXC.ads.fraunhofer.de (10.80.232.42) with Microsoft SMTP
	Server (TLS) id 14.3.435.0; Sun, 10 Feb 2019 21:18:12 +0100
From: Lukas Auer <lukas.auer@aisec.fraunhofer.de>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
CC: Lukas Auer <lukas.auer@aisec.fraunhofer.de>, Alistair Francis
	<Alistair.Francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
	Michael Clark
	<mjc@sifive.com>, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
	"Sagar Karandikar" <sagark@eecs.berkeley.edu>
Date: Sun, 10 Feb 2019 21:17:26 +0100
Message-ID: <20190210201726.3567-1-lukas.auer@aisec.fraunhofer.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-11.0.0.4179-8.200.1013-24422.001
X-TM-AS-Result: No--5.248900-8.000000-31
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.102.167.24
Subject: [Qemu-riscv] [PATCH] hw/riscv/virt: re-add machine-specific
 compatible string to /soc/ node
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Feb 2019 20:21:12 -0000

Re-add the previous compatible string "riscv-virtio-soc" to the soc
device tree node to allow U-Boot and Linux to bind machine-specific
drivers to it. The current compatible string "simple-bus" is retained.

This is required by U-Boot to bind devices early, as part of the
pre-relocation driver model.

Fixes: 53f54508dae6("hw/riscv/virtio: Set the soc device tree node as a
simple-bus")
Signed-off-by: Lukas Auer <lukas.auer@aisec.fraunhofer.de>
---

 hw/riscv/virt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 3e8b19c668..c53bb905ff 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -157,6 +157,7 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
     char *nodename;
     uint32_t plic_phandle, phandle = 1;
     int i;
+    const char soc_compat[] = "riscv-virtio-soc\0simple-bus";
 
     fdt = s->fdt = create_device_tree(&s->fdt_size);
     if (!fdt) {
@@ -171,7 +172,7 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
 
     qemu_fdt_add_subnode(fdt, "/soc");
     qemu_fdt_setprop(fdt, "/soc", "ranges", NULL, 0);
-    qemu_fdt_setprop_string(fdt, "/soc", "compatible", "simple-bus");
+    qemu_fdt_setprop(fdt, "/soc", "compatible", soc_compat, sizeof(soc_compat));
     qemu_fdt_setprop_cell(fdt, "/soc", "#size-cells", 0x2);
     qemu_fdt_setprop_cell(fdt, "/soc", "#address-cells", 0x2);
 
-- 
2.20.1


