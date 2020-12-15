Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kozaM-00049w-6a
	for mharc-qemu-riscv@gnu.org; Mon, 14 Dec 2020 20:57:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6115b8be4=alistair.francis@wdc.com>)
 id 1kozaJ-00049O-5u; Mon, 14 Dec 2020 20:57:03 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:10598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6115b8be4=alistair.francis@wdc.com>)
 id 1kozaF-0005vT-Qa; Mon, 14 Dec 2020 20:57:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607997420; x=1639533420;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7hVDMJSX7+4fen5lhkGmd06U0vQq2GxBblUjvWQ54wY=;
 b=ds/blPdMS4N/7fsOhvXBd08vST0tjOXXJyRHdWKkeHWIBvUSHV/O2e+z
 SLorPZZuRwomZ6tA47ucO1pDNo7EdIDJAagbJh2kX2u7/IjSmqfcgh7RR
 0tls0J/gmFMOXBZbtB1jrRokIzvE6IWM9tCm8GfYFN5NNrCSxNt+C1TQX
 hijokKWdp3MFa07cunG0+h8C+gPPLBpEoy2ZkAPVznPH1e1QfFDa0COk4
 kWE9npDCCodD1Yv+n39q52rLdk8P7AvG0Bg5LEyTGm1da/D4ZEn8pZnho
 UG/nom5l6owzyUhOOtPq2iMfomL/onoeNghfIDt/rBYC7AJGYA7Za7kLW w==;
IronPort-SDR: M3XevsEdYS7vW4CZJh+ZjHDvsSkX3rea1zCQ0vmp4j915jLVceVlbOVUdK91Oo0ebgM+mvGj5x
 VU4umUNNc5tp3GaJW4Gf3k4jtkP9bGX7psEZVuroxcICGEOCv1InzUYza8RsKBSyPHUjqforo2
 WCZ4sJQZiR2cUmucAJ69F7z3cK4LkY6J1HS+u1FpNA13RmU8QGheG1P8c72XRTaXXp6A6gWim9
 oOGYtQQ2uQSfz1OhE1YTz/DqWr49L5Hks0RxSZTmjAZtfOyvFpGYaRbXJMpn+++GipKwBcPx2h
 LIk=
X-IronPort-AV: E=Sophos;i="5.78,420,1599494400"; d="scan'208";a="156356085"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Dec 2020 09:56:56 +0800
IronPort-SDR: P01PXNj7A2bh9+Ab8BukTxY/vLvG6CzaS02lWM1b52Qr4rDqaOcMeIcOkkJdv6cAMR8Z69iHiv
 aUjEU8XAoYCVZPv4LXRfSNsUNBQgkV3oZlDEA1ZnhtWFYnHEq3qTyy3bGGZ7jFmqUcHLVOni2b
 NORmVvhjW0QrHosJGu5znUIBZFGbm1/A1KkFDw13V/Ibh54rncYvng1rC0dLnpW0uHT/cZwyhq
 OkkU3QEJSA+awBhQTHSXZIexwIChBNkx0ZlDmTEOuAAlElnflk6IPnDMUuXvO3MKo3BMw9bj0Z
 U3Lg6hfJKSn8LOR3mS8Wmm8Y
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 17:42:14 -0800
IronPort-SDR: JzXxxNfw2ualsP7UVAb/BUHfMXlmqOsO4CxGGb5kbmAQ7xwnl+Vabk2Gfn0npWTBf+2BK6DcJQ
 aFDCqEp3MsXvIkH0hekW/NwiqEsav8qscXWKw18pawvo9dhRgUt0Z2qYXqLO2ydGYhoQejWOX6
 9kWaId/Lq4Vd54X8COpCr4vrOCVK4qPGx7H0h2WAQQ5EbO17X7ll6e/qlNBAbv5wNZ+FuyRPQm
 fLq4flg4fdPRPMIShP5SDibD9y6hps0epta0ScwciXxT1K5JOpOSkfCX2z7xHc1pdvSFaXC5++
 bKM=
WDCIronportException: Internal
Received: from usa001914.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.33])
 by uls-op-cesaip01.wdc.com with ESMTP; 14 Dec 2020 17:56:54 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 1/1] riscv/opentitan: Update the OpenTitan memory layout
Date: Mon, 14 Dec 2020 17:56:54 -0800
Message-Id: <8eb65314830a75d0fea3fccf77bc45b8ddd01c42.1607982831.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=6115b8be4=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 15 Dec 2020 01:57:03 -0000

OpenTitan is currently only avalible on an FPGA platform and the memory
addresses have changed. Update to use the new memory addresses.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/opentitan.h | 23 +++++++---
 hw/riscv/opentitan.c         | 81 +++++++++++++++++++++++++-----------
 2 files changed, 74 insertions(+), 30 deletions(-)

diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index 5ff0c0f85e..a5ea3a5e4e 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -55,19 +55,30 @@ enum {
     IBEX_DEV_UART,
     IBEX_DEV_GPIO,
     IBEX_DEV_SPI,
-    IBEX_DEV_FLASH_CTRL,
+    IBEX_DEV_I2C,
+    IBEX_DEV_PATTGEN,
     IBEX_DEV_RV_TIMER,
-    IBEX_DEV_AES,
-    IBEX_DEV_HMAC,
-    IBEX_DEV_PLIC,
+    IBEX_DEV_SENSOR_CTRL,
+    IBEX_DEV_OTP_CTRL,
     IBEX_DEV_PWRMGR,
     IBEX_DEV_RSTMGR,
     IBEX_DEV_CLKMGR,
     IBEX_DEV_PINMUX,
+    IBEX_DEV_PADCTRL,
+    IBEX_DEV_USBDEV,
+    IBEX_DEV_FLASH_CTRL,
+    IBEX_DEV_PLIC,
+    IBEX_DEV_AES,
+    IBEX_DEV_HMAC,
+    IBEX_DEV_KMAC,
+    IBEX_DEV_KEYMGR,
+    IBEX_DEV_CSRNG,
+    IBEX_DEV_ENTROPY,
+    IBEX_DEV_EDNO,
+    IBEX_DEV_EDN1,
     IBEX_DEV_ALERT_HANDLER,
     IBEX_DEV_NMI_GEN,
-    IBEX_DEV_USBDEV,
-    IBEX_DEV_PADCTRL,
+    IBEX_DEV_OTBN,
 };
 
 enum {
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index cc758b78b8..af3456932f 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -35,22 +35,33 @@ static const struct MemmapEntry {
     [IBEX_DEV_ROM] =            {  0x00008000, 16 * KiB },
     [IBEX_DEV_RAM] =            {  0x10000000,  0x10000 },
     [IBEX_DEV_FLASH] =          {  0x20000000,  0x80000 },
-    [IBEX_DEV_UART] =           {  0x40000000,  0x10000 },
-    [IBEX_DEV_GPIO] =           {  0x40010000,  0x10000 },
-    [IBEX_DEV_SPI] =            {  0x40020000,  0x10000 },
-    [IBEX_DEV_FLASH_CTRL] =     {  0x40030000,  0x10000 },
-    [IBEX_DEV_PINMUX] =         {  0x40070000,  0x10000 },
-    [IBEX_DEV_RV_TIMER] =       {  0x40080000,  0x10000 },
-    [IBEX_DEV_PLIC] =           {  0x40090000,  0x10000 },
-    [IBEX_DEV_PWRMGR] =         {  0x400A0000,  0x10000 },
-    [IBEX_DEV_RSTMGR] =         {  0x400B0000,  0x10000 },
-    [IBEX_DEV_CLKMGR] =         {  0x400C0000,  0x10000 },
-    [IBEX_DEV_AES] =            {  0x40110000,  0x10000 },
-    [IBEX_DEV_HMAC] =           {  0x40120000,  0x10000 },
-    [IBEX_DEV_ALERT_HANDLER] =  {  0x40130000,  0x10000 },
-    [IBEX_DEV_NMI_GEN] =        {  0x40140000,  0x10000 },
-    [IBEX_DEV_USBDEV] =         {  0x40150000,  0x10000 },
-    [IBEX_DEV_PADCTRL] =        {  0x40160000,  0x10000 }
+    [IBEX_DEV_UART] =           {  0x40000000,  0x1000  },
+    [IBEX_DEV_GPIO] =           {  0x40040000,  0x1000  },
+    [IBEX_DEV_SPI] =            {  0x40050000,  0x1000  },
+    [IBEX_DEV_I2C] =            {  0x40080000,  0x1000  },
+    [IBEX_DEV_PATTGEN] =        {  0x400e0000,  0x1000  },
+    [IBEX_DEV_RV_TIMER] =       {  0x40100000,  0x1000  },
+    [IBEX_DEV_SENSOR_CTRL] =    {  0x40110000,  0x1000  },
+    [IBEX_DEV_OTP_CTRL] =       {  0x40130000,  0x4000  },
+    [IBEX_DEV_PWRMGR] =         {  0x40400000,  0x1000  },
+    [IBEX_DEV_RSTMGR] =         {  0x40410000,  0x1000  },
+    [IBEX_DEV_CLKMGR] =         {  0x40420000,  0x1000  },
+    [IBEX_DEV_PINMUX] =         {  0x40460000,  0x1000  },
+    [IBEX_DEV_PADCTRL] =        {  0x40470000,  0x1000  },
+    [IBEX_DEV_USBDEV] =         {  0x40500000,  0x1000  },
+    [IBEX_DEV_FLASH_CTRL] =     {  0x41000000,  0x1000  },
+    [IBEX_DEV_PLIC] =           {  0x41010000,  0x1000  },
+    [IBEX_DEV_AES] =            {  0x41100000,  0x1000  },
+    [IBEX_DEV_HMAC] =           {  0x41110000,  0x1000  },
+    [IBEX_DEV_KMAC] =           {  0x41120000,  0x1000  },
+    [IBEX_DEV_KEYMGR] =         {  0x41130000,  0x1000  },
+    [IBEX_DEV_CSRNG] =          {  0x41150000,  0x1000  },
+    [IBEX_DEV_ENTROPY] =        {  0x41160000,  0x1000  },
+    [IBEX_DEV_EDNO] =           {  0x41170000,  0x1000  },
+    [IBEX_DEV_EDN1] =           {  0x41180000,  0x1000  },
+    [IBEX_DEV_ALERT_HANDLER] =  {  0x411b0000,  0x1000  },
+    [IBEX_DEV_NMI_GEN] =        {  0x411c0000,  0x1000  },
+    [IBEX_DEV_OTBN] =           {  0x411d0000,  0x10000 },
 };
 
 static void opentitan_board_init(MachineState *machine)
@@ -156,30 +167,52 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
         memmap[IBEX_DEV_GPIO].base, memmap[IBEX_DEV_GPIO].size);
     create_unimplemented_device("riscv.lowrisc.ibex.spi",
         memmap[IBEX_DEV_SPI].base, memmap[IBEX_DEV_SPI].size);
-    create_unimplemented_device("riscv.lowrisc.ibex.flash_ctrl",
-        memmap[IBEX_DEV_FLASH_CTRL].base, memmap[IBEX_DEV_FLASH_CTRL].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.i2c",
+        memmap[IBEX_DEV_I2C].base, memmap[IBEX_DEV_I2C].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.pattgen",
+        memmap[IBEX_DEV_PATTGEN].base, memmap[IBEX_DEV_PATTGEN].size);
     create_unimplemented_device("riscv.lowrisc.ibex.rv_timer",
         memmap[IBEX_DEV_RV_TIMER].base, memmap[IBEX_DEV_RV_TIMER].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.sensor_ctrl",
+        memmap[IBEX_DEV_SENSOR_CTRL].base, memmap[IBEX_DEV_SENSOR_CTRL].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.otp_ctrl",
+        memmap[IBEX_DEV_OTP_CTRL].base, memmap[IBEX_DEV_OTP_CTRL].size);
     create_unimplemented_device("riscv.lowrisc.ibex.pwrmgr",
         memmap[IBEX_DEV_PWRMGR].base, memmap[IBEX_DEV_PWRMGR].size);
     create_unimplemented_device("riscv.lowrisc.ibex.rstmgr",
         memmap[IBEX_DEV_RSTMGR].base, memmap[IBEX_DEV_RSTMGR].size);
     create_unimplemented_device("riscv.lowrisc.ibex.clkmgr",
         memmap[IBEX_DEV_CLKMGR].base, memmap[IBEX_DEV_CLKMGR].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.pinmux",
+        memmap[IBEX_DEV_PINMUX].base, memmap[IBEX_DEV_PINMUX].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.padctrl",
+        memmap[IBEX_DEV_PADCTRL].base, memmap[IBEX_DEV_PADCTRL].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.usbdev",
+        memmap[IBEX_DEV_USBDEV].base, memmap[IBEX_DEV_USBDEV].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.flash_ctrl",
+        memmap[IBEX_DEV_FLASH_CTRL].base, memmap[IBEX_DEV_FLASH_CTRL].size);
     create_unimplemented_device("riscv.lowrisc.ibex.aes",
         memmap[IBEX_DEV_AES].base, memmap[IBEX_DEV_AES].size);
     create_unimplemented_device("riscv.lowrisc.ibex.hmac",
         memmap[IBEX_DEV_HMAC].base, memmap[IBEX_DEV_HMAC].size);
-    create_unimplemented_device("riscv.lowrisc.ibex.pinmux",
-        memmap[IBEX_DEV_PINMUX].base, memmap[IBEX_DEV_PINMUX].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.kmac",
+        memmap[IBEX_DEV_KMAC].base, memmap[IBEX_DEV_KMAC].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.keymgr",
+        memmap[IBEX_DEV_KEYMGR].base, memmap[IBEX_DEV_KEYMGR].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.csrng",
+        memmap[IBEX_DEV_CSRNG].base, memmap[IBEX_DEV_CSRNG].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.entropy",
+        memmap[IBEX_DEV_ENTROPY].base, memmap[IBEX_DEV_ENTROPY].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.edn0",
+        memmap[IBEX_DEV_EDNO].base, memmap[IBEX_DEV_EDNO].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.edn1",
+        memmap[IBEX_DEV_EDN1].base, memmap[IBEX_DEV_EDN1].size);
     create_unimplemented_device("riscv.lowrisc.ibex.alert_handler",
         memmap[IBEX_DEV_ALERT_HANDLER].base, memmap[IBEX_DEV_ALERT_HANDLER].size);
     create_unimplemented_device("riscv.lowrisc.ibex.nmi_gen",
         memmap[IBEX_DEV_NMI_GEN].base, memmap[IBEX_DEV_NMI_GEN].size);
-    create_unimplemented_device("riscv.lowrisc.ibex.usbdev",
-        memmap[IBEX_DEV_USBDEV].base, memmap[IBEX_DEV_USBDEV].size);
-    create_unimplemented_device("riscv.lowrisc.ibex.padctrl",
-        memmap[IBEX_DEV_PADCTRL].base, memmap[IBEX_DEV_PADCTRL].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.otbn",
+        memmap[IBEX_DEV_OTBN].base, memmap[IBEX_DEV_OTBN].size);
 }
 
 static void lowrisc_ibex_soc_class_init(ObjectClass *oc, void *data)
-- 
2.29.2


