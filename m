Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njrIS-0004sL-Ip
	for mharc-qemu-riscv@gnu.org; Wed, 27 Apr 2022 19:42:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=109fe075d=alistair.francis@opensource.wdc.com>)
 id 1njrIQ-0004p2-KB
 for qemu-riscv@nongnu.org; Wed, 27 Apr 2022 19:42:10 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:48835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=109fe075d=alistair.francis@opensource.wdc.com>)
 id 1njrIO-0004VC-TQ
 for qemu-riscv@nongnu.org; Wed, 27 Apr 2022 19:42:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651102928; x=1682638928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VDMqwzAuMleBEfUbybBP0LToT0CiGMl/sjF8ifOru0A=;
 b=aYtwt6RYP0IRXbLf22z4HIjq1fE5RIFF7vHZT2rLOmlcBO9vuE9ajtBo
 SUOSIf4gytKN14zX8iLjAE8UljzEiu96/TenXehJXAPiHPp0lWd5ki+6i
 xrG4FlWKVfPu0K/2qMAVyO6AvvTHq3ZBdrH0lu9UQVqEBmmyNKfy4Pbpu
 ME03GKRNzajQBfk5EOWAJoX4YmpGCNMTtyudpvzajkhhFGyfDbmOTgOgu
 5p/dk6xOItYdqIotwq+GvUFghlA4qnp/oCXf2Ks+JhXOjQ+7zxhcxAvA/
 rlEQQaI24Y6F5nHCaQairXGy2EhmGyj2/GAN9/ejyRF1QrWGa7tlUnwmq g==;
X-IronPort-AV: E=Sophos;i="5.90,294,1643644800"; d="scan'208";a="197844532"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Apr 2022 07:42:05 +0800
IronPort-SDR: hRaggITcQBmOns36bYWHNQQKg3XdoicYQRaMwc+fzZhY95zoG91aQ+XaGHUew1J5k/CuJRgSYI
 jdua5ERny+1HHC0NgbpTuVEAv8fwlWNQ+auTlYGLEBlM1g+eGXCsuIasbg/gTXkM0LEhWhT2yN
 mvKz2C69YIOmLu36GJpHUaSUIkcJChh1VxX5SY7ipF5k85bTuCp5SvQgf38FOnebXqg2lsvBd2
 Twki/anq9nt61WNJ7H2kr1iWpo260X1R2PQNFLRN3IZVZ3FrHzRQ+teg/dS4A0g1MbR+8mJLJT
 6qI0ph+KzcTw/xDfmZ2y1mgi
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 16:12:57 -0700
IronPort-SDR: Uj7nMI9pLYfJJJ5DN0G0f5LuIJLxBdS7fOsAozszaXvzOtDvSzOsRWJJFQYkXgeGekqlHp5PbG
 Y3Ddm7t3nYHWl4SsWr5BrfaQb32gY7eBztKxuWbi6DK+WeLcU4olPe5ptBYLov96+BWfhvgM/f
 /wMm95OvSwAp0Am8lbWaKsXQ1rV5NFGNDdP68xzAuUsxdkWGlgJCyGekVPC8O4q+xWRVh85hfx
 Glex1uvvaylQV8uo2oi0KK5RME1jZg23nhSTFr/W8CnUCj46g71YuZY2MXFYkP4od127nAY3lX
 01E=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 16:42:05 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KpZzJ2QTnz1SVp3
 for <qemu-riscv@nongnu.org>; Wed, 27 Apr 2022 16:42:04 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1651102923; x=1653694924; bh=VDMqwzAuMleBEfUbyb
 BP0LToT0CiGMl/sjF8ifOru0A=; b=r+BvutMlphBtwKfSNvbZFO3qMd77WR0IIA
 +M5MKvqgvWCyu1QCLilpU95tRO9kFx5e96XfD6ywn+DcerAoywlwztvVAKbDH8RP
 Wy1FcuDzAGbSIrwUm6UAO5CIb4G5yjsZYaBil/fSLyaKkrANppeCfFlATYClIMe+
 5059ztnMM8zNy3QYWSQOrvsUBRvcmX5erxOXGt+hXWrB9PfWxcOfkeb5QgNITOyK
 6Rkd+FRZ9JowIAEQ1Gq0U1hZpkuDCbnHGcd/uKxtLBDCWXO39jmf0cEqLfKMuo7q
 rSkmpmHxyjTSXRlLSdHPLJUCaIygHGLHVVT6Ahsy5iCdk1piqzwQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id h3Erv1WwAl9i for <qemu-riscv@nongnu.org>;
 Wed, 27 Apr 2022 16:42:03 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KpZzD0HrBz1Rvlc;
 Wed, 27 Apr 2022 16:41:59 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, alistair23@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH v5 2/6] hw/core: Move the ARM sysbus-fdt to core
Date: Thu, 28 Apr 2022 09:41:42 +1000
Message-Id: <20220427234146.1130752-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427234146.1130752-1-alistair.francis@opensource.wdc.com>
References: <20220427234146.1130752-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=109fe075d=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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
X-List-Received-Date: Wed, 27 Apr 2022 23:42:11 -0000

From: Alistair Francis <alistair.francis@wdc.com>

The ARM virt machine currently uses sysbus-fdt to create device tree
entries for dynamically created MMIO devices.

The RISC-V virt machine can also benefit from this, so move the code to
the core directory.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
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
index 5bdd98e4a1..f94278935f 100644
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
index 66a2de7e13..37fc9b919c 100644
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


