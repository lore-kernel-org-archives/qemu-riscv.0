Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hdOox-0007n5-VG
	for mharc-qemu-riscv@gnu.org; Tue, 18 Jun 2019 20:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48401)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <prvs=066539cd8=alistair.francis@wdc.com>)
 id 1hdOou-0007hu-NN
 for qemu-riscv@nongnu.org; Tue, 18 Jun 2019 20:51:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=066539cd8=alistair.francis@wdc.com>)
 id 1hdOf6-0003dO-Sc
 for qemu-riscv@nongnu.org; Tue, 18 Jun 2019 20:41:17 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:29347)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=066539cd8=alistair.francis@wdc.com>)
 id 1hdOf5-0003bv-M3; Tue, 18 Jun 2019 20:41:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1560904876; x=1592440876;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/xJwoyzP22n+j8lVthpDqEtf8rQ3OZ10G8cgFJMoid4=;
 b=D+/gbWxwP+svDTZ1Jb83Ud0NPuf9GUFtFTQMgFK41Mq3PyDM2tPPNwA5
 zG3kLozJYumOeouPDpqlf7ypceosW4jKk2SbsKKf3qOAytUuQdoZpCFL1
 J4JaeSs4mWjjMQHO+cVqB/NEUtZprgRGqH5Oz76MtQ8+LgV4u/fJZnhfB
 NVDAlypTN/sCiiXN+mw0UkYc1oNRJ7vh8ygmc28QZijeBlOwjO5gIU5/n
 UIGXpupUBEnnRmhZ8CXdU44e8n0J6FX7bHEnavNJkyGzoK988QMrnfygk
 8V2eV1eXwHbwmV1AtHHAw5d5d8XijZcCdYpjHxy9prii7Tib4wMxBajDH g==;
X-IronPort-AV: E=Sophos;i="5.63,390,1557158400"; d="scan'208";a="110901048"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Jun 2019 08:41:15 +0800
IronPort-SDR: /+4ohsGIH6rvpAkvWDeg1+JiDl+24Gsb1mydKZvDFII2Yz+J0lDfAlZr5o0sLhuidbF6r11LVm
 9mZgCJCD+oJaEG22OUuDwGyFq/cLTxvMLwE8hVEpfTqBuAGsrrMLlEMc7Zsr4ttD7mkdTTY9Lm
 CnN0Yqcvhc37aI9/a1Q9nLR3buUfvQojV/+Sw/BvHmnsoO+4kVo/LR0rsl429Zh5NI3QWG69C6
 GIpSBeRIS3d4OEdR6dXfHheLw0gwyOkE90f9lHgkBp8QcQiwkcqY7cgUyTL2LwoYU4sV/kq06K
 8Q0QrjOSW/hYpUwj385SXaLy
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 18 Jun 2019 17:40:42 -0700
IronPort-SDR: KPjsN3T7iLs+cMKud0MjVFxyxg+IzQ0nqvUk04DaN6hvV0MDhV8bMWoj7HK1jBTJSzaY3ID2LR
 5IoOR1LKnU4zAOLRydChv17ByGl+q90j+rcO1aYONAQO8ZelKCKP5/cUshqjU6NLXPDszclIHy
 4eFB6TBPaGTQfUBKtbcd/GYF2VuzvaH8LxeKS8qj6QNf+zTpDxEInXP0u7sLuZZqmsw8ZnvymB
 zbo64a/7QL5BXGdwfvXnNzJ5/S9EOROjN1ZrrTCsV0GB7QwNmtQIFTcnh4wx9ztD8rOW4/DgKR
 R7k=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.140])
 by uls-op-cesaip02.wdc.com with ESMTP; 18 Jun 2019 17:41:14 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@sifive.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Date: Tue, 18 Jun 2019 17:38:53 -0700
Message-Id: <99fc8fe28f2a0493f248d50d32d4b1bc649536ab.1560904640.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1560904640.git.alistair.francis@wdc.com>
References: <cover.1560904640.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 216.71.154.42
Subject: [Qemu-riscv] [RFC v1 3/5] hw/riscv: Extend the kernel loading
 support
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
X-List-Received-Date: Wed, 19 Jun 2019 00:51:26 -0000

Extend the RISC-V kernel loader to support uImage and Image files.
A Linux kernel can now be booted with:

    qemu-system-riscv64 -machine virt -bios fw_jump.elf -kernel Image

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/boot.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 392ca0cb2e..7f68035a3f 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -67,13 +67,22 @@ target_ulong riscv_load_kernel(MachineState *machine,
     uint64_t kernel_entry, kernel_high;
 
     if (load_elf(kernel_filename, NULL, kernel_translate, machine,
-                 &kernel_entry, NULL, &kernel_high,
-                 0, EM_RISCV, 1, 0) < 0) {
-        error_report("could not load kernel '%s'", kernel_filename);
-        exit(1);
+                 &kernel_entry, NULL, &kernel_high, 0, EM_RISCV, 1, 0) > 0) {
+        return kernel_entry;
+    }
+
+    if (load_uimage_as(kernel_filename, &kernel_entry, NULL, NULL,
+                       kernel_translate, machine, NULL) > 0) {
+        return kernel_entry;
+    }
+
+    if (load_image_targphys_as(kernel_filename, KERNEL_BOOT_ADDRESS,
+                               ram_size, NULL) > 0) {
+        return kernel_entry;
     }
 
-    return kernel_entry;
+    error_report("could not load kernel '%s'", kernel_filename);
+    exit(1);
 }
 
 hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
-- 
2.22.0


