Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nghkj-00046u-TJ
	for mharc-qemu-riscv@gnu.org; Tue, 19 Apr 2022 02:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=101f09098=alistair.francis@opensource.wdc.com>)
 id 1nghkY-0003vA-Il
 for qemu-riscv@nongnu.org; Tue, 19 Apr 2022 02:54:11 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:36262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=101f09098=alistair.francis@opensource.wdc.com>)
 id 1nghkW-0004KS-9P
 for qemu-riscv@nongnu.org; Tue, 19 Apr 2022 02:54:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650351246; x=1681887246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H2nNCdBlGkbhKY2PzS9ttJJUrgi/BvPdzYzwwCBJy3c=;
 b=nmRPgkqGxr6Dlu3awgsxA5rpawQsqD6Oe+S31UuaK9fVcC80Z5m54vSy
 9mRX0PPz06syRxa9I6v4R9Q+3uCJR4q4TVVgBHaonOjNYag/jLdgJXPHn
 5fxC/mm9ljPA4B/VuRknA59vjXRBH8jukOJ31AUzrXS+VxE5O7g4k+uZS
 ypGj3S1/NwQg9AqOulIKd1/Jm/C0I8mP180rO0iUzzfYIBQV7lFy47CiT
 Yn0HVOkMx5JeSvB0A9hrC6lPpdw5nF1t0Q6J8x1MgJLQzTpoN5g/QN8BA
 qKwPcaC5szpPRGyJu1/HFYTkSIVl3Elo7hAcXODYItv2Dl+nE5ly9H2/k Q==;
X-IronPort-AV: E=Sophos;i="5.90,272,1643644800"; d="scan'208";a="198236518"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Apr 2022 14:54:05 +0800
IronPort-SDR: odqs/SBkMR9H1GdGd46pq7XXpBkgX/1USFuRhsfsk447Y3LKuxFN1lClYmTTcTSY3PtTZZ3+Sl
 BPiEF1uk6netyssHZ2lc00mTR6UxmT+YoE0HM2asBGV7Tm4R4XypAaJocfrNoAGficf0Xy2zWS
 hETXewA68hFItlLaBqhfsWckhKM/olme2aenvwOtc3raP77tO5ZnwSS7l3aSLsy1/5qUC//ZV6
 zXgzz7BBs3sCgjPpCtJil0+OI/YGcjEdaRuPauRmo9YbwiGeXOcPeMFoQP3CiEm1rb0eCHn1bs
 gVzZZpXJCENrDH874lBfRt1J
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2022 23:25:11 -0700
IronPort-SDR: GILXMQIkDOn2u6KIbwWIr2PklPliVGWApttek992BwQkN0l7IQrDzEoXhpyUbeCe37XCi+21V5
 viysL8NnpFH3sC83Fir/iICwpCQiaySprfm9ZaRMMG+Yh0CywlvLMLdAZCDV4ZchJGVwOB5C2O
 16fYWprG4UTaSF2yjl7yxYEig1+COr7BQrNi/TbcxUEizZZpcbq4u5dstF8Bx48HmzRJ4hvPaO
 RATVfV5AKf4utPyPicDd0QBj8JaLvXXq+FFS04MvW0AxMIrzfpDo5zVASWfBZMflJiDo0x2h5I
 3Kw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2022 23:54:06 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KjDzx2jd1z1SHwl
 for <qemu-riscv@nongnu.org>; Mon, 18 Apr 2022 23:54:05 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650351244; x=1652943245; bh=H2nNCdBlGkbhKY2PzS
 9ttJJUrgi/BvPdzYzwwCBJy3c=; b=YodiCT/J+iM6olQ53Q0tdnPw4QAXQoQWoV
 73Z+9Z9DnkPAJGsSGlNvKn8nrJeYlREZidryMrlzg65hSBh4QujugRWau5w/dSrj
 J4UMDLHPhyYBJPJoukx9YVx1xBP0G8oBOIgxdHvvp+HeL5xeT3tTRHPMbPlDbxZ1
 aqOkj7XenaJh2ix/KKBwJrXs2Vx4Ks0fPYcrsibiWirkm9OninPuAoa/Hq4MM3ko
 odRKXkG83MjYxYbVRguSLkoAEbvyDIQxBQi7WdA+Jp5FmFTFO7guvPb0hw+pV0r3
 g1VGLpqxf2Aur23P3xhzTn/6vU49j/3UyuaE8B2R7gJrJqlOfYkg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id mQpA_oAlFD_f for <qemu-riscv@nongnu.org>;
 Mon, 18 Apr 2022 23:54:04 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KjDzs6XyXz1Rvlx;
 Mon, 18 Apr 2022 23:54:01 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, alistair23@gmail.com,
 palmer@dabbelt.com, bmeng.cn@gmail.com
Subject: [PATCH v3 4/6] hw/riscv: virt: Add support for generating platform
 FDT entries
Date: Tue, 19 Apr 2022 16:53:40 +1000
Message-Id: <20220419065342.878415-5-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419065342.878415-1-alistair.francis@opensource.wdc.com>
References: <20220419065342.878415-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=101f09098=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Similar to the ARM virt machine add support for adding device tree
entries for dynamically created devices.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/riscv/virt.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 169da70350..e4a5c6c28b 100644
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


