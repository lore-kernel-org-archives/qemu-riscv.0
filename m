Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jTraX-0000fS-Ui
	for mharc-qemu-riscv@gnu.org; Wed, 29 Apr 2020 14:37:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37582)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=381fbd49e=alistair.francis@wdc.com>)
 id 1jTraU-0000Y9-8K
 for qemu-riscv@nongnu.org; Wed, 29 Apr 2020 14:37:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <prvs=381fbd49e=alistair.francis@wdc.com>)
 id 1jTraS-0003ul-Ve
 for qemu-riscv@nongnu.org; Wed, 29 Apr 2020 14:37:37 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:2049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=381fbd49e=alistair.francis@wdc.com>)
 id 1jTraS-0003Ps-4A; Wed, 29 Apr 2020 14:37:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1588185457; x=1619721457;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BPQHeYhW0+8Gd1YdWGKpS99M5X8zYqkIAis4E32nD/c=;
 b=IxgYORL3KyGsN0K/ihrs2qGaHknkEGe0dP7w7abO7o0yaiVZe0P3To5v
 NFaUvFqaC/CyA/enLBp/sluW/iEW4aUv7qa7SfMP8Qh69nWgMByovAzeL
 rBFCReqgvXOBqcO2dld1EXKbUj5HZ/wVBChHda5PAxY48hLXIgLt+fwln
 ysvw7c4v6bOps3pzR7t4BECjBmaaiUKgreVeeMpyVmMsF4mitRJGISN1d
 yAYuvJwLPZNy2Ry4ChysZndr+/VdmuAAkPtpB+F6wmObmF86HjBFjWbta
 nAv8PU2LqmYyQD9NXfMNSpFpmMQoGhNqfSUAfCnsFLGsdEgHTp+tUFaM2 A==;
IronPort-SDR: GD+kiaHD9TiISXimsKslZgu2Z4rejFwPZRsZrg+EiHqvFkgB/5QSMYi/xzR5qyGjVSCYxhk8LB
 sR6xsl0QStmtW3LEXaTkehKXPvDPNZkl7BRchDSqQoWnXGiGjjD9p73LbEs3azwhpWC20RS1Ev
 vztnfsFmNGt8ovM9T5neAOYMxnbe9I6KMzYRk+NIyhOPIqOxfLVBntO2mlfgsg2buTbKMqFNZo
 /N+P1LboaFRGNsw7vfG9rLv5XMdEWlDNbaDLL/x9JWc53W6f/yjo6O8+phglgwn1huanVFEIrV
 N+Y=
X-IronPort-AV: E=Sophos;i="5.73,332,1583164800"; d="scan'208";a="137935158"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Apr 2020 02:37:08 +0800
IronPort-SDR: yz62U3AD2XWTbk+d303+HyUwcVxT6MrpFTZg0pQAvK75bmKvIO17nsqy1j4po1JwYUehj6Oh++
 +xhWvKQeOaP5/9615QUWGdGZD5ANzKgp4=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2020 11:27:12 -0700
IronPort-SDR: 17OGOyw7LHB3vRJc40YxRHVDy/e+uUBcGlwJkMNaRsIWJ7F4609RoBvV/h/E0VNOgJOmIy2hx6
 ZiXrP6+EFZTg==
WDCIronportException: Internal
Received: from cnf007834.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.55.253])
 by uls-op-cesaip01.wdc.com with ESMTP; 29 Apr 2020 11:37:06 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Cc: palmerdabbelt@google.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 13/14] hw/riscv/spike: Allow loading firmware separately using
 -bios option
Date: Wed, 29 Apr 2020 11:28:55 -0700
Message-Id: <20200429182856.2588202-14-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200429182856.2588202-1-alistair.francis@wdc.com>
References: <20200429182856.2588202-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=381fbd49e=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 14:37:03
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Received-From: 216.71.154.45
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
X-List-Received-Date: Wed, 29 Apr 2020 18:37:40 -0000

From: Anup Patel <anup.patel@wdc.com>

This patch extends Spike machine support to allow loading OpenSBI
firmware (fw_jump.elf) separately using -bios option.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20200427080644.168461-3-anup.patel@wdc.com
Message-Id: <20200427080644.168461-3-anup.patel@wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/spike.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 98697a244e..e7908b88fe 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -45,6 +45,12 @@
 
 #include <libfdt.h>
 
+#if defined(TARGET_RISCV32)
+# define BIOS_FILENAME "opensbi-riscv32-spike-fw_jump.elf"
+#else
+# define BIOS_FILENAME "opensbi-riscv64-spike-fw_jump.elf"
+#endif
+
 static const struct MemmapEntry {
     hwaddr base;
     hwaddr size;
@@ -187,8 +193,24 @@ static void spike_board_init(MachineState *machine)
     memory_region_add_subregion(system_memory, memmap[SPIKE_MROM].base,
                                 mask_rom);
 
+    riscv_find_and_load_firmware(machine, BIOS_FILENAME,
+                                 memmap[SPIKE_DRAM].base,
+                                 htif_symbol_callback);
+
     if (machine->kernel_filename) {
-        riscv_load_kernel(machine->kernel_filename, htif_symbol_callback);
+        uint64_t kernel_entry = riscv_load_kernel(machine->kernel_filename,
+                                                  htif_symbol_callback);
+
+        if (machine->initrd_filename) {
+            hwaddr start;
+            hwaddr end = riscv_load_initrd(machine->initrd_filename,
+                                           machine->ram_size, kernel_entry,
+                                           &start);
+            qemu_fdt_setprop_cell(s->fdt, "/chosen",
+                                  "linux,initrd-start", start);
+            qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
+                                  end);
+        }
     }
 
     /* reset vector */
-- 
2.26.2


