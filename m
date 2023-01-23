Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pJqUG-0004Hp-Ip
	for mharc-qemu-riscv@gnu.org; Mon, 23 Jan 2023 01:39:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=380668d3b=wilfred.mallawa@opensource.wdc.com>)
 id 1pJqU7-0004HG-Ko
 for qemu-riscv@nongnu.org; Mon, 23 Jan 2023 01:39:19 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=380668d3b=wilfred.mallawa@opensource.wdc.com>)
 id 1pJqU3-0006va-RE
 for qemu-riscv@nongnu.org; Mon, 23 Jan 2023 01:39:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674455951; x=1705991951;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eWJ5XkDSHIuYdcpTK7XUzo6Cgpa0jzUOEOzfXQI2R18=;
 b=lfjwlKG8gUaN2P9o2Ngkg4/C1d0A0PbPXriErM6h+gCwcHmo9VoRyaIv
 ptZpBBK5HaU5SRSVaZQnADpgw+vDY9DIlIS5YLIwsW2c4kQunxO5pzh7h
 mHi20j7b8q6JQJTCsWzgpfwnEHDnw1i4iCgXL1em7MyMYfxcUzbTRAOJX
 NWBtO77+SMSJiCzVHp8EBmrAKthiYiwX4ZIrncoLLfbcp1Icd50iTfDw5
 nFzF3kaD7k5VVgmBWJG8LZieoNaSYA3NHFtVsj4wV1PkYi7uRKCQTpkw8
 8NqRzwrhle3qu3+Ln+JgXdQ6dfqYQu4gVyR+vSRaPmnpGlgAbpPcqJrWY w==;
X-IronPort-AV: E=Sophos;i="5.97,238,1669046400"; d="scan'208";a="333514029"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Jan 2023 14:39:00 +0800
IronPort-SDR: t0/m0w4ODSIxsmnsJhhQu1ldTaWP9eE7W2T1OblVDrnIQ3sfiwIyv7Xp5wiM1wDTWrImJX5y8T
 mJmqk6PBNZCda4U357SSo8xF+eVYOQ6vARELFx4KoIBkk/pxV4czUPRPaaer3mAupUCCZm4+iG
 oVGQgHUmjVv9t7+VtJ5ERw1Y5kMAtUYAMN+h1BUUNPrvRgz6OSavfODR7UvO7kipRPNHVA9qQe
 meP4u4ftVVPhrCa7WM6HsQmVMnyQ40lXpONo/1SYTQuYPN6iGGaNSNfaZek0S1kdzDWR7JYfqf
 8ZA=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Jan 2023 21:56:35 -0800
IronPort-SDR: fl6X1X+eQRaMIYhnBz6xMYhn2s+UYqhJCa7y414GnH3mQVoU9+JHsOE8JRfM9O7L1ds3toSVmf
 fsSru/EI3Kh8+5q1dVbisAXznLL/rrAI5TegBsD+FgV1NDLeQ5/iheInFmzCjcZwlw2Ri/5Wtt
 TR83YtJDPjtLMb/b13soe7MMlhYxCk4acvrT5OkkTCE8Ut7TwVr7yZkJEKwVls/zuGZn3hbBxV
 rVCPTNxLOMeG0905WDBqI5Q4XkrUSTJYdX+Ro9Lcd66OpX5zSFFFGB0ortHt7Zs8myRo8jjWb3
 I7w=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Jan 2023 22:39:00 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P0gRm21DMz1Rwt8
 for <qemu-riscv@nongnu.org>; Sun, 22 Jan 2023 22:39:00 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1674455939;
 x=1677047940; bh=eWJ5XkDSHIuYdcpTK7XUzo6Cgpa0jzUOEOzfXQI2R18=; b=
 ocUlWOKcdogSl6CmTweHqPYQHGQkuHdekSebvrTxXlyfLLYKi1Q64af2g0aZBSV3
 bKDKWs5ZTqNGs3fUSe5R7psUCq9v9DF4aEh0nnztC1yOuRFBZSf/6c5o5RLtdhOU
 SVnuWQlfvzE8hoithe7IwilWyeWYGBadsoZz0mKk60sH8I5a21aQ9vP8gvt+FJbs
 vDNj/zSjPDZ22At7yBUnddMpzDBDNGh3OFe8Qc0GuLAjddIrREfhBJmz38oyeKdx
 rQ19ufoUFmb+eP2H07iwjazAfJu0bDHhUFeq5E0dp66G8oYDYcOMi8YCYAXga7hQ
 t3xH/sibHortxjAV7Wcd/Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id KJ503ywgpX9G for <qemu-riscv@nongnu.org>;
 Sun, 22 Jan 2023 22:38:59 -0800 (PST)
Received: from fedora.wdc.com (unknown [10.225.165.36])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P0gRh2ckZz1RvLy;
 Sun, 22 Jan 2023 22:38:55 -0800 (PST)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v2] include/hw/riscv/opentitan: update opentitan IRQs
Date: Mon, 23 Jan 2023 16:36:21 +1000
Message-Id: <20230123063619.222459-1-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=380668d3b=wilfred.mallawa@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 23 Jan 2023 06:39:22 -0000

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Updates the opentitan IRQs to match the latest supported commit of
Opentitan from TockOS.

OPENTITAN_SUPPORTED_SHA :=3D 565e4af39760a123c59a184aa2f5812a961fde47

Memory layout as per [1]

[1] https://github.com/lowRISC/opentitan/blob/565e4af39760a123c59a184aa2f=
5812a961fde47/hw/top_earlgrey/sw/autogen/top_earlgrey_memory.h

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
Changes in v2:
	- Updated the MMIO register layout/size
	- Bumped the supported commit sha
	- Added link to OT register layout for reference in the commit
	  msg

 hw/riscv/opentitan.c         | 80 ++++++++++++++++++------------------
 include/hw/riscv/opentitan.h | 14 +++----
 2 files changed, 47 insertions(+), 47 deletions(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 64d5d435b9..353f030d80 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -31,47 +31,47 @@
 /*
  * This version of the OpenTitan machine currently supports
  * OpenTitan RTL version:
- * <lowRISC/opentitan@d072ac505f82152678d6e04be95c72b728a347b8>
+ * <lowRISC/opentitan@565e4af39760a123c59a184aa2f5812a961fde47>
  *
  * MMIO mapping as per (specified commit):
  * lowRISC/opentitan: hw/top_earlgrey/sw/autogen/top_earlgrey_memory.h
  */
 static const MemMapEntry ibex_memmap[] =3D {
-    [IBEX_DEV_ROM] =3D            {  0x00008000,  0x8000 },
-    [IBEX_DEV_RAM] =3D            {  0x10000000,  0x20000 },
-    [IBEX_DEV_FLASH] =3D          {  0x20000000,  0x100000 },
-    [IBEX_DEV_UART] =3D           {  0x40000000,  0x1000  },
-    [IBEX_DEV_GPIO] =3D           {  0x40040000,  0x1000  },
-    [IBEX_DEV_SPI_DEVICE] =3D     {  0x40050000,  0x1000  },
-    [IBEX_DEV_I2C] =3D            {  0x40080000,  0x1000  },
-    [IBEX_DEV_PATTGEN] =3D        {  0x400e0000,  0x1000  },
-    [IBEX_DEV_TIMER] =3D          {  0x40100000,  0x1000  },
-    [IBEX_DEV_OTP_CTRL] =3D       {  0x40130000,  0x4000  },
-    [IBEX_DEV_LC_CTRL] =3D        {  0x40140000,  0x1000  },
-    [IBEX_DEV_ALERT_HANDLER] =3D  {  0x40150000,  0x1000  },
-    [IBEX_DEV_SPI_HOST0] =3D      {  0x40300000,  0x1000  },
-    [IBEX_DEV_SPI_HOST1] =3D      {  0x40310000,  0x1000  },
-    [IBEX_DEV_USBDEV] =3D         {  0x40320000,  0x1000  },
-    [IBEX_DEV_PWRMGR] =3D         {  0x40400000,  0x1000  },
-    [IBEX_DEV_RSTMGR] =3D         {  0x40410000,  0x1000  },
-    [IBEX_DEV_CLKMGR] =3D         {  0x40420000,  0x1000  },
-    [IBEX_DEV_PINMUX] =3D         {  0x40460000,  0x1000  },
-    [IBEX_DEV_AON_TIMER] =3D      {  0x40470000,  0x1000  },
-    [IBEX_DEV_SENSOR_CTRL] =3D    {  0x40490000,  0x1000  },
-    [IBEX_DEV_FLASH_CTRL] =3D     {  0x41000000,  0x1000  },
-    [IBEX_DEV_AES] =3D            {  0x41100000,  0x1000  },
-    [IBEX_DEV_HMAC] =3D           {  0x41110000,  0x1000  },
-    [IBEX_DEV_KMAC] =3D           {  0x41120000,  0x1000  },
-    [IBEX_DEV_OTBN] =3D           {  0x41130000,  0x10000 },
-    [IBEX_DEV_KEYMGR] =3D         {  0x41140000,  0x1000  },
-    [IBEX_DEV_CSRNG] =3D          {  0x41150000,  0x1000  },
-    [IBEX_DEV_ENTROPY] =3D        {  0x41160000,  0x1000  },
-    [IBEX_DEV_EDNO] =3D           {  0x41170000,  0x1000  },
-    [IBEX_DEV_EDN1] =3D           {  0x41180000,  0x1000  },
-    [IBEX_DEV_NMI_GEN] =3D        {  0x411c0000,  0x1000  },
-    [IBEX_DEV_PERI] =3D           {  0x411f0000,  0x10000 },
-    [IBEX_DEV_PLIC] =3D           {  0x48000000,  0x4005000 },
-    [IBEX_DEV_FLASH_VIRTUAL] =3D  {  0x80000000,  0x80000 },
+    [IBEX_DEV_ROM] =3D            {  0x00008000,  0x8000      },
+    [IBEX_DEV_RAM] =3D            {  0x10000000,  0x20000     },
+    [IBEX_DEV_FLASH] =3D          {  0x20000000,  0x100000    },
+    [IBEX_DEV_UART] =3D           {  0x40000000,  0x40        },
+    [IBEX_DEV_GPIO] =3D           {  0x40040000,  0x40        },
+    [IBEX_DEV_SPI_DEVICE] =3D     {  0x40050000,  0x2000      },
+    [IBEX_DEV_I2C] =3D            {  0x40080000,  0x80        },
+    [IBEX_DEV_PATTGEN] =3D        {  0x400e0000,  0x40        },
+    [IBEX_DEV_TIMER] =3D          {  0x40100000,  0x200       },
+    [IBEX_DEV_OTP_CTRL] =3D       {  0x40130000,  0x2000      },
+    [IBEX_DEV_LC_CTRL] =3D        {  0x40140000,  0x100       },
+    [IBEX_DEV_ALERT_HANDLER] =3D  {  0x40150000,  0x800       },
+    [IBEX_DEV_SPI_HOST0] =3D      {  0x40300000,  0x40        },
+    [IBEX_DEV_SPI_HOST1] =3D      {  0x40310000,  0x40        },
+    [IBEX_DEV_USBDEV] =3D         {  0x40320000,  0x1000      },
+    [IBEX_DEV_PWRMGR] =3D         {  0x40400000,  0x80        },
+    [IBEX_DEV_RSTMGR] =3D         {  0x40410000,  0x80        },
+    [IBEX_DEV_CLKMGR] =3D         {  0x40420000,  0x80        },
+    [IBEX_DEV_PINMUX] =3D         {  0x40460000,  0x1000      },
+    [IBEX_DEV_AON_TIMER] =3D      {  0x40470000,  0x40        },
+    [IBEX_DEV_SENSOR_CTRL] =3D    {  0x40490000,  0x40        },
+    [IBEX_DEV_FLASH_CTRL] =3D     {  0x41000000,  0x200       },
+    [IBEX_DEV_AES] =3D            {  0x41100000,  0x100       },
+    [IBEX_DEV_HMAC] =3D           {  0x41110000,  0x1000      },
+    [IBEX_DEV_KMAC] =3D           {  0x41120000,  0x1000      },
+    [IBEX_DEV_OTBN] =3D           {  0x41130000,  0x10000     },
+    [IBEX_DEV_KEYMGR] =3D         {  0x41140000,  0x100       },
+    [IBEX_DEV_CSRNG] =3D          {  0x41150000,  0x80        },
+    [IBEX_DEV_ENTROPY] =3D        {  0x41160000,  0x100       },
+    [IBEX_DEV_EDNO] =3D           {  0x41170000,  0x80        },
+    [IBEX_DEV_EDN1] =3D           {  0x41180000,  0x80        },
+    [IBEX_DEV_SRAM_CTRL] =3D      {  0x411c0000,  0x20        },
+    [IBEX_DEV_IBEX_CFG] =3D       {  0x411f0000,  0x100       },
+    [IBEX_DEV_PLIC] =3D           {  0x48000000,  0x8000000   },
+    [IBEX_DEV_FLASH_VIRTUAL] =3D  {  0x80000000,  0x80000     },
 };
=20
 static void opentitan_board_init(MachineState *machine)
@@ -294,12 +294,12 @@ static void lowrisc_ibex_soc_realize(DeviceState *d=
ev_soc, Error **errp)
         memmap[IBEX_DEV_EDN1].base, memmap[IBEX_DEV_EDN1].size);
     create_unimplemented_device("riscv.lowrisc.ibex.alert_handler",
         memmap[IBEX_DEV_ALERT_HANDLER].base, memmap[IBEX_DEV_ALERT_HANDL=
ER].size);
-    create_unimplemented_device("riscv.lowrisc.ibex.nmi_gen",
-        memmap[IBEX_DEV_NMI_GEN].base, memmap[IBEX_DEV_NMI_GEN].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.sram_ctrl",
+        memmap[IBEX_DEV_SRAM_CTRL].base, memmap[IBEX_DEV_SRAM_CTRL].size=
);
     create_unimplemented_device("riscv.lowrisc.ibex.otbn",
         memmap[IBEX_DEV_OTBN].base, memmap[IBEX_DEV_OTBN].size);
-    create_unimplemented_device("riscv.lowrisc.ibex.peri",
-        memmap[IBEX_DEV_PERI].base, memmap[IBEX_DEV_PERI].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.ibex_cfg",
+        memmap[IBEX_DEV_IBEX_CFG].base, memmap[IBEX_DEV_IBEX_CFG].size);
 }
=20
 static Property lowrisc_ibex_soc_props[] =3D {
diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index 7659d1bc5b..c40b05052a 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -94,9 +94,9 @@ enum {
     IBEX_DEV_EDNO,
     IBEX_DEV_EDN1,
     IBEX_DEV_ALERT_HANDLER,
-    IBEX_DEV_NMI_GEN,
+    IBEX_DEV_SRAM_CTRL,
     IBEX_DEV_OTBN,
-    IBEX_DEV_PERI,
+    IBEX_DEV_IBEX_CFG,
 };
=20
 enum {
@@ -108,11 +108,11 @@ enum {
     IBEX_UART0_RX_BREAK_ERR_IRQ   =3D 6,
     IBEX_UART0_RX_TIMEOUT_IRQ     =3D 7,
     IBEX_UART0_RX_PARITY_ERR_IRQ  =3D 8,
-    IBEX_TIMER_TIMEREXPIRED0_0    =3D 127,
-    IBEX_SPI_HOST0_ERR_IRQ        =3D 134,
-    IBEX_SPI_HOST0_SPI_EVENT_IRQ  =3D 135,
-    IBEX_SPI_HOST1_ERR_IRQ        =3D 136,
-    IBEX_SPI_HOST1_SPI_EVENT_IRQ  =3D 137,
+    IBEX_TIMER_TIMEREXPIRED0_0    =3D 124,
+    IBEX_SPI_HOST0_ERR_IRQ        =3D 131,
+    IBEX_SPI_HOST0_SPI_EVENT_IRQ  =3D 132,
+    IBEX_SPI_HOST1_ERR_IRQ        =3D 133,
+    IBEX_SPI_HOST1_SPI_EVENT_IRQ  =3D 134,
 };
=20
 #endif
--=20
2.39.1


