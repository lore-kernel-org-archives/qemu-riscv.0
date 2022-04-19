Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nghkh-00040A-Dt
	for mharc-qemu-riscv@gnu.org; Tue, 19 Apr 2022 02:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=101f09098=alistair.francis@opensource.wdc.com>)
 id 1nghkX-0003v9-Tw
 for qemu-riscv@nongnu.org; Tue, 19 Apr 2022 02:54:11 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:61778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=101f09098=alistair.francis@opensource.wdc.com>)
 id 1nghkW-0004Kp-4z
 for qemu-riscv@nongnu.org; Tue, 19 Apr 2022 02:54:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650351246; x=1681887246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MDWFWDRchKuYdI+t20XFRd6iszdOc+o4yz5MgNB95Fg=;
 b=FvmBZQ7XokA9TPo5Kc8tVqPEg1raIsLQag+eXLhA2yCk81FI93n/Cu5/
 cHmOENwb9s5Ul6M1S961ZyoBmKTIZ6rsNAqBm5vKLHaJR9k9xOHsDr/oU
 OEdOFKWij4cnwJ6Shy8y65eL4pEPwZxfOAYUAS0OrcykiXcnldWQMmk2/
 ROKt6dnShXdBPFMuyHkecemAJQ8bBLmVeZi5EivEvo3bS68G0MgZGI1A1
 e+sgzZt5PGkr74413C9BjmyQAcz9dBEdkOQcz4XVJT9SvC0jpZafy/ZS2
 w4QE5AUkZHplcFkD0hT29QGO813edBXUXSlt+O/rANcTb/5Cd5RkoMJe2 A==;
X-IronPort-AV: E=Sophos;i="5.90,272,1643644800"; d="scan'208";a="203101162"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Apr 2022 14:54:00 +0800
IronPort-SDR: 6Bn4kkp/S9L2buBzxNizeTFx0YwoIz2jKK8bZfndIM2z02esOxcCt86ihgwePwvSTiP2loCwOn
 A57wv5aOlx0CR2Nvie570JeiEkzMhDqSbmg9ZCL/Y3oIBc5r8C7sgTcRjLXh63joIwWWUNIIsc
 hkrdWHs16sfXiYFX8BJ/w/PkY47aJD+OjA51LciMTUSPc9qhoNqs1TmZTnzv21TRk9GeVDRqlr
 Z3H5rgjp7bVFlZnSwBVbhseiyo4YPSrHkdStrVTjQACOeVaZNGfD3PTe/5mQWvcz3x3Cf1B+Bm
 hDa1ihWMuyF3ydLHm4pwJdEw
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2022 23:25:04 -0700
IronPort-SDR: 5a90DCOan8rRQ8cnLYmshyn9yrcOcjL+B55HagDOl6jexuxGWNzgEOvULnO3RwowreqBOO5JKU
 H/9FscySzXnAEPEPT6nSVS6dSJDIxGJT8B0jQd4E6Y5U1X3zjeiBgyqA390M8xW/Uvvoqg/PJ0
 AsFhh0TIFVssfbW8mXiQIeu6KKbAa0I0nuwQ0y5MvMwt4BMmRmeblpMMlp144//0PMSdGPDI81
 O+QQgJH+nr2b35IdorAkoNd1LZeUC9UyUS17karam1luP7Jwpgr9OAf1CZaljencsZ6eApo6lN
 WI4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2022 23:53:59 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KjDzp23Kmz1SHwl
 for <qemu-riscv@nongnu.org>; Mon, 18 Apr 2022 23:53:58 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650351237; x=1652943238; bh=MDWFWDRchKuYdI+t20
 XFRd6iszdOc+o4yz5MgNB95Fg=; b=Hl4w3No0ZN7QLMMXPZ9xkdHqip9YNAXIQ3
 VnExy1aCHNlh3lGK8dlxWp3CBEDDsULbJlYLauOP4bNGPRnqu3XWTTAeTs/Hyt0L
 xfE4//ToFmD07h9MDfMOjUcIZ3r8L+jFDlfvAcY+/8LOJuERfRmo8P7/2ZzFm0tM
 pWuQPVDqVlbChxN+8Kz1/CUq4EL1lyRN16Szcf/St3UJobERHdJL+a/zDSbuNRGB
 m3t0P87zt0I5RGVY2rpJq5uqtD5q+Z1SwEt0NUs78cxMLYgOGgT2njq0RKASMK7J
 xVB1zoudXCgQ3CeksdTbOewlngDV3wqd7r26yUbbVsOD2QIxYJ4Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ipyf0-gwRQp2 for <qemu-riscv@nongnu.org>;
 Mon, 18 Apr 2022 23:53:57 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KjDzk5Vp4z1Rvlx;
 Mon, 18 Apr 2022 23:53:54 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, alistair23@gmail.com,
 palmer@dabbelt.com, bmeng.cn@gmail.com
Subject: [PATCH v3 2/6] hw/core: Move the ARM sysbus-fdt to core
Date: Tue, 19 Apr 2022 16:53:38 +1000
Message-Id: <20220419065342.878415-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419065342.878415-1-alistair.francis@opensource.wdc.com>
References: <20220419065342.878415-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=101f09098=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Apr 2022 06:54:13 -0000

From: Alistair Francis <alistair.francis@wdc.com>

The ARM virt machine currently uses sysbus-fdt to create device tree
entries for dynamically created MMIO devices.

The RISC-V virt machine can also benefit from this, so move the code to
the core directory.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 include/hw/{arm =3D> core}/sysbus-fdt.h | 0
 hw/arm/virt.c                         | 2 +-
 hw/arm/xlnx-versal-virt.c             | 1 -
 hw/{arm =3D> core}/sysbus-fdt.c         | 2 +-
 hw/arm/meson.build                    | 1 -
 hw/core/meson.build                   | 1 +
 6 files changed, 3 insertions(+), 4 deletions(-)
 rename include/hw/{arm =3D> core}/sysbus-fdt.h (100%)
 rename hw/{arm =3D> core}/sysbus-fdt.c (99%)

diff --git a/include/hw/arm/sysbus-fdt.h b/include/hw/core/sysbus-fdt.h
similarity index 100%
rename from include/hw/arm/sysbus-fdt.h
rename to include/hw/core/sysbus-fdt.h
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d2e5ecd234..cfababa292 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -56,7 +56,7 @@
 #include "qemu/module.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/virtio/virtio-pci.h"
-#include "hw/arm/sysbus-fdt.h"
+#include "hw/core/sysbus-fdt.h"
 #include "hw/platform-bus.h"
 #include "hw/qdev-properties.h"
 #include "hw/arm/fdt.h"
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 7c7baff8b7..bc20af4ba8 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -15,7 +15,6 @@
 #include "sysemu/device_tree.h"
 #include "hw/boards.h"
 #include "hw/sysbus.h"
-#include "hw/arm/sysbus-fdt.h"
 #include "hw/arm/fdt.h"
 #include "cpu.h"
 #include "hw/qdev-properties.h"
diff --git a/hw/arm/sysbus-fdt.c b/hw/core/sysbus-fdt.c
similarity index 99%
rename from hw/arm/sysbus-fdt.c
rename to hw/core/sysbus-fdt.c
index 48c5fe9bf1..19d22cbe73 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/core/sysbus-fdt.c
@@ -27,7 +27,7 @@
 #ifdef CONFIG_LINUX
 #include <linux/vfio.h>
 #endif
-#include "hw/arm/sysbus-fdt.h"
+#include "hw/core/sysbus-fdt.h"
 #include "qemu/error-report.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/tpm.h"
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 721a8eb8be..122e5dd992 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -1,6 +1,5 @@
 arm_ss =3D ss.source_set()
 arm_ss.add(files('boot.c'), fdt)
-arm_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('sysbus-fdt.c'))
 arm_ss.add(when: 'CONFIG_ARM_VIRT', if_true: files('virt.c'))
 arm_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
 arm_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic_boards.c'))
diff --git a/hw/core/meson.build b/hw/core/meson.build
index 0f884d6fd4..7a4d02b6c0 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -33,6 +33,7 @@ softmmu_ss.add(when: 'CONFIG_PTIMER', if_true: files('p=
timer.c'))
 softmmu_ss.add(when: 'CONFIG_REGISTER', if_true: files('register.c'))
 softmmu_ss.add(when: 'CONFIG_SPLIT_IRQ', if_true: files('split-irq.c'))
 softmmu_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('stream.c'))
+softmmu_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('sysbus-fdt.c=
'))
=20
 softmmu_ss.add(files(
   'cpu-sysemu.c',
--=20
2.35.1


