Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ncHWM-00056E-Ig
	for mharc-qemu-riscv@gnu.org; Wed, 06 Apr 2022 22:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=089d0ce6d=alistair.francis@opensource.wdc.com>)
 id 1ncHWJ-000513-Dt
 for qemu-riscv@nongnu.org; Wed, 06 Apr 2022 22:05:11 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:21868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=089d0ce6d=alistair.francis@opensource.wdc.com>)
 id 1ncHWH-0007N0-Lz
 for qemu-riscv@nongnu.org; Wed, 06 Apr 2022 22:05:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1649297109; x=1680833109;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6W9Q3f9HKhqO8NzY38idQYoPrAEDcxn3lMCoVDZrHmY=;
 b=CbTCCihvSzojxy2O6jmXQqN+hgnuYd4f6ygLQVn54Vxba0SHxr/e8ylm
 dmsWUI6Do7otAlJiHO8pU4RztcET8yKJ4r9frofaUqEPMK5Wt7DCV80pA
 Q9bb74sLzwkpafd38Onjkc9D/Qp0wiTEAaaSpdAG4p4hOls3dJuQ4yyYx
 L64RcZwTEuMA0Wolug6YMwEyi7p5fZAv2PmlSRi+97el5BrfgfAScMBNO
 7SofrFbvcCcawy+IkiwxiwH9JhythS3FxD2EHPOq94NUpH0JfkdWUgfn9
 MUwF8A+Gc0i/H8jWrU7rajumAOB5RMbYCnYDzcT+1RDzuH5oL6QvPxZOD g==;
X-IronPort-AV: E=Sophos;i="5.90,241,1643644800"; d="scan'208";a="196170949"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Apr 2022 10:05:06 +0800
IronPort-SDR: U8nUc9dW20f1DxHKOipMRjreK8OhfGe4IQemaDQoJ39yf9pHWs2PJP70tj4lPe4MVWtRxORwns
 FsVUC2CNTXyKiDQbySoMGWbxjuBy3SOXim0tpdecg80W0d5TD56ccGTCnLuK6jowDNQ4RvDiN7
 8RjQmr7t/0z3MsKkwJHvxUSLWS/XGONW0QsCZkfP6xh5r0d3ck5UajPIAo2hcEeuWmI2XVVxUP
 gwVRqcJufE5EdOd8QoTio2fV49TOHAigmjSSp3ZW6uhh+4wG+rUEgp1uIZpMt53Jyl6IuBrN3S
 /RAoES91A50cx3qCdAJHwZfP
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2022 18:35:47 -0700
IronPort-SDR: HyFNbTscX/CgMkWXLkJJBEYY72olJ2/j5HcbX0p7ifPIX72b9Hv0iiQFWqWc5aKoGtC1KfDPyB
 qDuKeWQLglXZLbbBLS2Kp3NK5/rOBFXQUsWvIL5jcCQwE3qMivbit0L5bLcod3Y9NiZapnCUdo
 +Cf4ed6uB9IhuqnDVrH8syn7tR6v+pmNeGKlAaavoDpSnuPrhEE5dllWsQLdF5q39uvNaXnLN2
 3fuWYGClk8r4W5k3+mwCiuxKWr0lW0XmzAlKycG3sdn78PL5N759rsAOlryqnQ1DhIyU2g05YO
 g8M=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2022 19:05:07 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KYl8150Z1z1SVp9
 for <qemu-riscv@nongnu.org>; Wed,  6 Apr 2022 19:05:05 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1649297104; x=1651889105; bh=6W9Q3f9HKhqO8NzY38
 idQYoPrAEDcxn3lMCoVDZrHmY=; b=LABEiFNPH+c0UMZ+1HZt+6t0585apyLdro
 xU+W4IWH9WaSFtUbvH0Nnlu3zn/uUMGYV8d+It4mc2/BxBR2/BjjAQRYaH2ADzwZ
 4ZtMUdxXn+2ZvA++eayPvtIHBaVinatimbfCEy7l4SfmqhK7NRZL+389jZnOItW0
 nvUKNbIuNV72FRMFtGAlqEu9LGKJWdli1S3gfJzuSS8KBuzWa4D9mUlJnC+MZt2o
 XgF7911H73u88c7OLu7DS2OezCnPWESOrLFck8aM9+aNuhD4ZoL9SMuctHTjalQj
 b3UXV5lVEpprfq5GhvqCxnqneK9uM6y7e16Jj0rQJN1S+1vf1T7g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id p5xTnfBnRJDX for <qemu-riscv@nongnu.org>;
 Wed,  6 Apr 2022 19:05:04 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.114])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KYl7v1jHdz1Rvlx;
 Wed,  6 Apr 2022 19:04:58 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, alistair23@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>, bmeng.cn@gmail.com,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 4/6] hw/riscv: virt: Add support for generateing platform
 FDT entries
Date: Thu,  7 Apr 2022 12:04:30 +1000
Message-Id: <20220407020432.4062829-5-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407020432.4062829-1-alistair.francis@opensource.wdc.com>
References: <20220407020432.4062829-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=089d0ce6d=alistair.francis@opensource.wdc.com;
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
X-List-Received-Date: Thu, 07 Apr 2022 02:05:11 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Similar to the ARM virt machine add support for adding device tree
entries for dynamically created devices.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index b066725be6..eba8495e9a 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -28,6 +28,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/char/serial.h"
 #include "target/riscv/cpu.h"
+#include "hw/core/sysbus-fdt.h"
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/virt.h"
 #include "hw/riscv/boot.h"
@@ -411,6 +412,12 @@ static void create_fdt_socket_aclint(RISCVVirtState =
*s,
         qemu_fdt_setprop(mc->fdt, name, "interrupt-controller", NULL, 0)=
;
         qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells", 0);
         riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
+
+        platform_bus_add_all_fdt_nodes(mc->fdt, name,
+                                       memmap[VIRT_PLATFORM_BUS].base,
+                                       memmap[VIRT_PLATFORM_BUS].size,
+                                       VIRT_PLATFORM_BUS_IRQ);
+
         g_free(name);
     }
=20
@@ -469,6 +476,12 @@ static void create_fdt_socket_plic(RISCVVirtState *s=
,
     riscv_socket_fdt_write_id(mc, mc->fdt, plic_name, socket);
     qemu_fdt_setprop_cell(mc->fdt, plic_name, "phandle",
         plic_phandles[socket]);
+
+    platform_bus_add_all_fdt_nodes(mc->fdt, plic_name,
+                                   memmap[VIRT_PLATFORM_BUS].base,
+                                   memmap[VIRT_PLATFORM_BUS].size,
+                                   VIRT_PLATFORM_BUS_IRQ);
+
     g_free(plic_name);
=20
     g_free(plic_cells);
@@ -546,6 +559,12 @@ static void create_fdt_imsic(RISCVVirtState *s, cons=
t MemMapEntry *memmap,
             IMSIC_MMIO_GROUP_MIN_SHIFT);
     }
     qemu_fdt_setprop_cell(mc->fdt, imsic_name, "phandle", *msi_m_phandle=
);
+
+    platform_bus_add_all_fdt_nodes(mc->fdt, imsic_name,
+                                   memmap[VIRT_PLATFORM_BUS].base,
+                                   memmap[VIRT_PLATFORM_BUS].size,
+                                   VIRT_PLATFORM_BUS_IRQ);
+
     g_free(imsic_name);
=20
     /* S-level IMSIC node */
@@ -683,6 +702,12 @@ static void create_fdt_socket_aplic(RISCVVirtState *=
s,
         VIRT_IRQCHIP_NUM_SOURCES);
     riscv_socket_fdt_write_id(mc, mc->fdt, aplic_name, socket);
     qemu_fdt_setprop_cell(mc->fdt, aplic_name, "phandle", aplic_s_phandl=
e);
+
+    platform_bus_add_all_fdt_nodes(mc->fdt, aplic_name,
+                                   memmap[VIRT_PLATFORM_BUS].base,
+                                   memmap[VIRT_PLATFORM_BUS].size,
+                                   VIRT_PLATFORM_BUS_IRQ);
+
     g_free(aplic_name);
=20
     g_free(aplic_cells);
--=20
2.35.1


