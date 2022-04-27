Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njrIc-0004zG-De
	for mharc-qemu-riscv@gnu.org; Wed, 27 Apr 2022 19:42:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=109fe075d=alistair.francis@opensource.wdc.com>)
 id 1njrIX-0004ve-Kl
 for qemu-riscv@nongnu.org; Wed, 27 Apr 2022 19:42:20 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:48835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=109fe075d=alistair.francis@opensource.wdc.com>)
 id 1njrIV-0004VC-3U
 for qemu-riscv@nongnu.org; Wed, 27 Apr 2022 19:42:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651102935; x=1682638935;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l40sjyCp0l/BFK8+rhXyzxzFyGa7+yrMxywVjzjn3c0=;
 b=oOjVBRptU2EuCrD8WVWoiDKsOrDQ9MkYfNWlXYTBaUgJcW9V6N/wjx5Y
 oBlwbSYGu64UsQ9kTtbWoImpgRcD6EVFJI24h8GDD5+Lpn88rDYU4i/RM
 bH6OG3kit3bWGh53D1mrU0OWabJ9RAbTArtrcm325cJ/YOljcOG1xOzZE
 xNbBchnG6zTPNVlr3n2L/X1s9r9xyRvveLsUJsYQni7H3yRzh+UGb51ta
 F+pvizoeJ8AOquIForNx3e0hBV6srIxDr6qYFrjyA5S2E9o3LEf4G61Yq
 3EDuktl2pYIQlEtuddDMB8Jcbe6fQWn1MLM3l0pHSLTNZoG57p3q0HV3S g==;
X-IronPort-AV: E=Sophos;i="5.90,294,1643644800"; d="scan'208";a="197844546"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Apr 2022 07:42:13 +0800
IronPort-SDR: Jc96o5hmnE04cW9Kbi8UXSfQGb9oDuVFQQ3RrhK0neINSpddRuiV4SW8EEGMQ7bUKcHZwVvA0d
 SEBRLXWpNxuDOpWlYdyMItJ0fVyxeKkoDYfuhKBCb8XS4pGnFg9BPkiGmt/utBUVMSG0l3HNIN
 0c2tEnhwVGSvtMRfj7yYVE1IBPRA5JRsCoWJbUrH2eOHqa4CTY6sKCQBuIxFlsL9uYZkq/Zfux
 jaBijFSWp2gbzREK9J9v3yqnZOlqCIZ8YdG26FHXxE0xeBaN61hwjyURfdUO7L+mt8IUtayoN7
 At7npa/sztSdCpRlCQGt1mAH
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 16:12:22 -0700
IronPort-SDR: HNTVVWZVQ+h4O8iNv0kSmAxYwn0E+mUfgAYGiX2pPZ9KTdI9dXu9cUbXky3ENTvvj1KM+TKxwJ
 F8TonFyWiTTU3ccndhI6qb0rF/U9kN2/A/enNl2g0w2YE6hXf8LsGnxgUHTlawS7N7R4nQ1TJ5
 McOvvrNPzRzn38ejbRYHP/VT9kOoaFrOXTw/OrsHMZAI7F2OstuHMewvhcuomUUsQnBnfVZqTj
 R4iabgWOgpvJD2CMkvjeHVogNwFMsKHvQUMq+n+GWFYDmdB4mdAXlmW4tYw/B91cFSRmd8BjnY
 IUo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 16:42:13 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KpZzS3nDvz1Rvlx
 for <qemu-riscv@nongnu.org>; Wed, 27 Apr 2022 16:42:12 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1651102931; x=1653694932; bh=l40sjyCp0l/BFK8+rh
 XyzxzFyGa7+yrMxywVjzjn3c0=; b=qhVky5MSkVeCOMD8I9vNFzl7Spz5R+s1Xh
 aWHZ9cz7/GpHPT7nU5EZGeqIr3+Ocsq5p0xQLSVvQLIiPM+FVOavojqSoN6Qxzi6
 r5aH+8HImotWgrz3klMTgvwCSQYbwUT+l4uiSHONsZBu8xWnm5oqP2wkj4TG6S23
 ePfrPFn5wNB+E8KzZ6MjM5Q9ZbWw/RL6Oh98w+nG2SxX86ahddvpYp2/502oPgyZ
 SIRP8WQEPSYdrtIfpZ2bT+a1QfX1zcMJD8lH2iM9LixIwAstp7cUeCpHcu0lajrK
 Ur0voFffn3bQDP33DdDq4lk+CyKsZfXVErZ+wQiMRsa0GaqHp86A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ifJ9GlfcMY0H for <qemu-riscv@nongnu.org>;
 Wed, 27 Apr 2022 16:42:11 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KpZzN0wFSz1Rvlc;
 Wed, 27 Apr 2022 16:42:07 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, alistair23@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH v5 4/6] hw/riscv: virt: Add support for generating platform
 FDT entries
Date: Thu, 28 Apr 2022 09:41:44 +1000
Message-Id: <20220427234146.1130752-5-alistair.francis@opensource.wdc.com>
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
X-List-Received-Date: Wed, 27 Apr 2022 23:42:20 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Similar to the ARM virt machine add support for adding device tree
entries for dynamically created devices.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/riscv/virt.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 312138e7bf..a2ffd04a78 100644
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
@@ -475,6 +476,12 @@ static void create_fdt_socket_plic(RISCVVirtState *s=
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
@@ -552,6 +559,12 @@ static void create_fdt_imsic(RISCVVirtState *s, cons=
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
@@ -689,6 +702,12 @@ static void create_fdt_socket_aplic(RISCVVirtState *=
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


