Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1hLn-0006jW-Nc
	for mharc-qemu-riscv@gnu.org; Thu, 08 Jul 2021 23:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=81790befc=alistair.francis@wdc.com>)
 id 1m1hLl-0006eB-8x; Thu, 08 Jul 2021 23:38:49 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:47757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=81790befc=alistair.francis@wdc.com>)
 id 1m1hLj-0001Oq-78; Thu, 08 Jul 2021 23:38:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1625801926; x=1657337926;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OGqBAplPI0Fe/WO9NdGMvjc3gZz30M3zXEeZ5/TqlI0=;
 b=Wo1LtKfsCeqazI+mmHnSanK3eHEdJ3o/B8bvST69CXm9jZ2Jiowi1dEx
 s9T2MtSYh9MbBirbIHbQCtmrm72EKGRvY1agcG/UvRXpT736Jp7rmQBtJ
 cWSIcGGxtJ1auPyEpYHgeV0a/p+v+Psh39trmkcQWJwLioZM6S7jnpibw
 4svLNLzqVOCQJZMqnybvOmWLP72R3GkKqs6LdNE4K0eDk2sFpvPKvh0aW
 cwdP5u6J1eGN528ob9f8mf4psDCGV5r2UwwwFyJwsW1cIcM+MZIN1oTzT
 34laDffTSJAXt3Wpf1j8KpX3YEu5r/L4ogoEXHgDjrg5Psi57IczcrORa g==;
IronPort-SDR: 4xgC7Oolrt9oFuUw0nS77zJ5+2Zp6b6YyXGcUbRJ2yfKR89eUKv3mB6Mm8LmkR3BY2nhd3B6ii
 MIIqVuIr8OLXqWmHUR1OBFZf53Be0akhvo2bcwomeuJLgxSjeaTgoz/rPl2LQ2AhDJfsTdAtCz
 OX0Y98GVGhBygQOFtVC4QneLTC4Cl/V/Bw5x0xdS3SPw2hGdZwaxlS24MfVIeIGDt1b2c63u1P
 5o2TnmblV4bsMvRKTGwobGcasn+G3Km7lzB7o/3Jj5ZFPTEBKVmSKJoivRB1e/VSia3g6okQt3
 QHY=
X-IronPort-AV: E=Sophos;i="5.84,225,1620662400"; d="scan'208";a="178928252"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Jul 2021 11:38:45 +0800
IronPort-SDR: K/5Dp5bDgQCJQPylVdL05nLvITVH2jtAzZj6K0GlX9nWN2yt8bU4zCUTFKik0S4a/BzvHfUS4H
 piDBe+/QJruVHrzKVIVT3gZEu2bCSmhnzHgpdjsaiy2Xlx/a4Hr/emGn7Xwev9R5h50US+Xg/V
 eXviQYIbka44on/GeFjX+XGnwboVeZxJrFqkQAP5SNP1GgnadBzS+eA+mrblOd1aNcrXoIe+2b
 Oi861g06GuygmnPtQgahUJyCFF6mde5We12/Dm56lW0TJv+l9vRJYSHyttIW57lRg+wLs7zZLN
 HWQhcMDyUmwmI+Gy5sgD7PGu
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2021 20:16:57 -0700
IronPort-SDR: wcYvKcETCxkin4x3IDz7uXJF0QWCmXjGEPtucGBWqnknQii7cJbwkjmVj/rRfo1MeF0bxJ00+u
 LHd+86VJTJ9Gg7n9x/dZi0vBQf0L2Ia6mBHqwBP6tdmRT+4lUm3iBKUYGYuA/iHhvLPf8/JbLg
 DQMqNdvUryPSETaawE5PBp7synOoPg/bPU70hBR0DQQGasU2yWu6E2rw+lZXBGHlaCYZ0zeYac
 XR6hcqhIwEcnzzimox0Yh9xuRT18jg6MDhKz6gLywjUVHjiD0pxLve1QBuJh6kGfXdf07g6os8
 r/M=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.165.107])
 by uls-op-cesaip01.wdc.com with ESMTP; 08 Jul 2021 20:38:42 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 2/3] hw/riscv: opentitan: Add the unimplement
 rv_core_ibex_peri
Date: Fri,  9 Jul 2021 13:38:39 +1000
Message-Id: <ed707782e84118e1b06a32fd79b70fecfb54ff82.1625801868.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1625801868.git.alistair.francis@wdc.com>
References: <cover.1625801868.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=81790befc=alistair.francis@wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Fri, 09 Jul 2021 03:38:49 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 include/hw/riscv/opentitan.h | 1 +
 hw/riscv/opentitan.c         | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index 86cceef698..a488f5e8ec 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -81,6 +81,7 @@ enum {
     IBEX_DEV_ALERT_HANDLER,
     IBEX_DEV_NMI_GEN,
     IBEX_DEV_OTBN,
+    IBEX_DEV_PERI,
 };
 
 enum {
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index c5a7e3bacb..933c211b11 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -58,6 +58,7 @@ static const MemMapEntry ibex_memmap[] = {
     [IBEX_DEV_ALERT_HANDLER] =  {  0x411b0000,  0x1000  },
     [IBEX_DEV_NMI_GEN] =        {  0x411c0000,  0x1000  },
     [IBEX_DEV_OTBN] =           {  0x411d0000,  0x10000 },
+    [IBEX_DEV_PERI] =           {  0x411f0000,  0x10000 },
 };
 
 static void opentitan_board_init(MachineState *machine)
@@ -217,6 +218,8 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
         memmap[IBEX_DEV_NMI_GEN].base, memmap[IBEX_DEV_NMI_GEN].size);
     create_unimplemented_device("riscv.lowrisc.ibex.otbn",
         memmap[IBEX_DEV_OTBN].base, memmap[IBEX_DEV_OTBN].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.peri",
+        memmap[IBEX_DEV_PERI].base, memmap[IBEX_DEV_PERI].size);
 }
 
 static void lowrisc_ibex_soc_class_init(ObjectClass *oc, void *data)
-- 
2.31.1


