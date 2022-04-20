Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nh3H6-0007wH-Vu
	for mharc-qemu-riscv@gnu.org; Wed, 20 Apr 2022 01:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1021dae20=alistair.francis@opensource.wdc.com>)
 id 1nh3H5-0007tt-2d
 for qemu-riscv@nongnu.org; Wed, 20 Apr 2022 01:53:11 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:55176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1021dae20=alistair.francis@opensource.wdc.com>)
 id 1nh3H3-0004RT-63
 for qemu-riscv@nongnu.org; Wed, 20 Apr 2022 01:53:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650433988; x=1681969988;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MDWFWDRchKuYdI+t20XFRd6iszdOc+o4yz5MgNB95Fg=;
 b=LmG67SQ9PxAi9HCHT4Es3PHZSTMzSJdkMOfuBiQ36/QCYu2WYy4/TDNL
 szbyUsAO6A/9l/3aXnpTRIhAxo6gwUU4EYzt536Wct7iw3uJe+H4mBZ04
 iHRWGsPiihzUY0+vHe7+nMgHOjUfnFgu+S2+O5uELZYEaiGoH8m1pg3SU
 yDyAf2LUrbTTbf5QPpzQWEpio56R/PSnAtBLV8mxw7oNRH9QVjr+G8C3n
 g0x0WURaVEzYc9mQd8NJ0adTjVUzVwrsabiSbKzYlifPcRM/2x38mRJ/D
 9kOPppDkTog/dLZ+u4iDLk9M+3dBuYMlVsRiBm7WYxgj+Ngn5zwAdU+k3 g==;
X-IronPort-AV: E=Sophos;i="5.90,274,1643644800"; d="scan'208";a="302527749"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Apr 2022 13:53:08 +0800
IronPort-SDR: fx5SDQtYvTB8WL/nQgrNvooxgR0NECe9qy5fLXrg1QqOuxDcGj0RUzmxuiXEcPbE8woKPTdwKz
 VxVVPucRPhPj4KbIMnSufEanA07N6CrVRY6SBIOw6J2zkYKSIIEqVLqutDrFKjePnwn0O4BvR8
 cb7J4CgS6Kd+S+s1KS7plzVIt7Uvm3T2mVd2RFBy1i3XqZGrbKsM864PW7kRRLq4s+755bavuG
 LJJSeWItOsdOoIEsCdU0g0/vgMMTwksLNdDUvikcVU7Au+GUGsSEfNT+QQp1ptf5MmKHhzitkt
 vX/39t9OYPnTW57C8VxnVY1f
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2022 22:23:26 -0700
IronPort-SDR: u7pUaMBorab4SlgvEMfaZVJeYmTXuoXrN8IJQbAzxwaM9F/UhmJBrmMXOTa1dZCCkYKCeOAxV9
 luywnLRUpmRAjK02/FqN025KAy+C+5JXvTEx9Lshu3LzR8aT4EEE1XFmVt5b9HFnUyMFYrDaYn
 MhwyzCNXPJY8BWeoyqLjY8EJeX+4DfMQBuby8Z2tT6xtVVfNDE2mC/yJlv3jeyTVWuZrc5ZkXq
 6vogNwEPs7NtiOKM9e4fyDOsPsaQQjBFmrMXPKoi/xPKFC9VthNaMHs0XioGLxOUPuV/WfgHQT
 q/E=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2022 22:53:09 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Kjqb81KMDz1SVnx
 for <qemu-riscv@nongnu.org>; Tue, 19 Apr 2022 22:53:08 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650433987; x=1653025988; bh=MDWFWDRchKuYdI+t20
 XFRd6iszdOc+o4yz5MgNB95Fg=; b=QDWX1ErG+3VH3ItPU+6izieqKcQ7qdOfb4
 PKTgsNpYjReLUVeZBL0pNQPEOXngG3x1oc+0yY29m5lrmg49Bq7zljQsWFIYkZd4
 LxHQjjFYsE2cUrtFwCgx9A25IkDM8vZYewAXfhHvG3BTk6zWfdt9c1SlBgrFQ9Gs
 IzNLkjJZqFooG9AcSAHXY/rUj73HPze0ggwnOY8L+j7MJCBvYuDNg6h2qIeO+neQ
 fYbNC55Ssd02VsoYCM7+G7vjrgsVvqEujS4wgUSqOvUWuIWEpS3moITX/SYA2ngD
 zXF3ctX3d7dQ27Gmlba6mD/RbkllYZtXGE8bVLTK4PrckDyeLRcw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id rh7TPQqYRtCk for <qemu-riscv@nongnu.org>;
 Tue, 19 Apr 2022 22:53:07 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Kjqb26s2cz1Rvlx;
 Tue, 19 Apr 2022 22:53:02 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair@alistair23.me>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, bmeng.cn@gmail.com,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v4 2/6] hw/core: Move the ARM sysbus-fdt to core
Date: Wed, 20 Apr 2022 15:52:44 +1000
Message-Id: <20220420055248.960491-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420055248.960491-1-alistair.francis@opensource.wdc.com>
References: <20220420055248.960491-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1021dae20=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 20 Apr 2022 05:53:11 -0000

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


