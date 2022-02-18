Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nKwvF-0007e2-0n
	for mharc-qemu-riscv@gnu.org; Fri, 18 Feb 2022 01:39:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=041753b3d=alistair.francis@opensource.wdc.com>)
 id 1nKwv6-0007df-Lm
 for qemu-riscv@nongnu.org; Fri, 18 Feb 2022 01:39:08 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:16267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=041753b3d=alistair.francis@opensource.wdc.com>)
 id 1nKwv0-0002cZ-S3
 for qemu-riscv@nongnu.org; Fri, 18 Feb 2022 01:39:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1645166343; x=1676702343;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=POAeFf8lmhKQLPzv4kini1ERq/h60YOWCEprrO1GQ2g=;
 b=MfQQICiC8SNJa4qakdJo6LsAy28JHS495zs/VS/0SCMDcYu9yvdi3RT6
 Vra/REEO+DlqzHeKXDaHw7DXi7uwwQiLmpVt3n6XHPt7uRei/Jow4StOb
 jwQ7zK42dOhXB9Hn9hry4TuZtoTacQh/XyINZDoZ4t55gG9dOGbyQkDNH
 oD1M7rIWNWbkreNER8jqBOmQcy6UWlnAI6od2yppSWqkTVWgsm/PKNh01
 fFaUsz12NdC7bMsEC28nDm7WDih5ez4MClCSKm2e4AnUBc6PCFc2awmCH
 9afmF+9m0eQb/BwBcorJw43zOs7BR4J2EDvOMgkKKVGPVc3rXeL9aH0FR w==;
X-IronPort-AV: E=Sophos;i="5.88,378,1635177600"; d="scan'208";a="194238252"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Feb 2022 14:38:52 +0800
IronPort-SDR: 8kQWU0kg23xHVEWIDl5TYrVrO3oOi1ByQfHVxb7yEPKulIcLlkBZfrdGZ1WWxahINONZbOuSIm
 vEhcF3NGGmNVeLTBe8GrmGePUIaXJeLDh7+4gvDmq5lC9/qJvVqR6t0K+/ErAv5sYERf7w9STo
 8uJT9YqFyeqZokluofMB+OKWuYlB6ccnImygvooGjs3UGd3FCWdUYf//V1eum6M5sOV29v3Ga1
 NpHdjx0DEs07VUBcmPbenvu4elr0cZaX0mtqqgWgXQgtgrfXpPDAS3/G8EIj2Ms3nFrxD0/RIP
 FP+7InCFhUuy49+wM5t/iRBC
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 22:10:29 -0800
IronPort-SDR: qtp/oNWisXWCrV+PHN9AEvRBoCL9X1L61r7JkLglPDL5E+zKlWk8RtuiKaAbSOTzj/a4rzhFEJ
 f9kAv33EAMuqz0uBvISiJsexq3XdyWz+MXhqh2alYSmUKSJwtX+PTNLbqkKQ3eGjfNt1So0znM
 8Wl7G/Gdt9K0gVaiCGY7vdELn9sbUQKvKfyjFMgBVBjHxu43ANiAYbvnjzEtrYi9uiaJmd0Iiv
 2JLuB7Kfkf8qNdnK+cBg+KKDY2Y9QWcXPTY0E92YCVuYwCfReOegnSG11L7sS5XJRFQ2GZnbAu
 isQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 22:38:52 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4K0MV33tw9z1SVp1
 for <qemu-riscv@nongnu.org>; Thu, 17 Feb 2022 22:38:51 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1645166330;
 x=1647758331; bh=POAeFf8lmhKQLPzv4kini1ERq/h60YOWCEprrO1GQ2g=; b=
 c/UT0vs3rna6yyLiOeT0l3IRNSas3xtBapeIBYXlYcQ97Qn6BbXliauecXGUsV+1
 Yv7oi58BCT/CvgdtP0U0JUdEyMnrGV6P/ygULRz328h29YzDfAnJ0Aj2mbv1FvUm
 XrN4ozbJqu15bh/32/JLfos7xEQ9SoefgJRJIrixRXtCRmM1+1y0+BolsGlCa1EH
 zljP12iw6r2qAok3WObXPOuAHdDK6dl8vVGDrxolqTyot0MUtakZLWU7VSMe7961
 FolNLK47sa/ZhyofGk4B+E72HVppn0L0TxolBYU+ADj6wdBK+1nlJ4FNPLYw2Pyp
 6D8HVahWmnQKecojWZcu5A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 3lsuMoPpwXLX for <qemu-riscv@nongnu.org>;
 Thu, 17 Feb 2022 22:38:50 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.97])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4K0MTy40vvz1Rwrw;
 Thu, 17 Feb 2022 22:38:46 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, wilfred.mallawa@wdc.com
Subject: [PATCH v2] hw: riscv: opentitan: fixup SPI addresses
Date: Fri, 18 Feb 2022 16:38:39 +1000
Message-Id: <20220218063839.405082-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=041753b3d=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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
X-List-Received-Date: Fri, 18 Feb 2022 06:39:10 -0000

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

This patch updates the SPI_DEVICE, SPI_HOST0, SPI_HOST1
base addresses. Also adds these as unimplemented devices.

The address references can be found [1].

[1] https://github.com/lowRISC/opentitan/blob/6c317992fbd646818b34f2a2dbf=
44bc850e461e4/hw/top_earlgrey/sw/autogen/top_earlgrey_memory.h#L107

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
v2: arranged base addrs in sorted order

 hw/riscv/opentitan.c         | 12 +++++++++---
 include/hw/riscv/opentitan.h |  4 +++-
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index aec7cfa33f..833624d66c 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -34,13 +34,15 @@ static const MemMapEntry ibex_memmap[] =3D {
     [IBEX_DEV_FLASH] =3D          {  0x20000000,  0x80000 },
     [IBEX_DEV_UART] =3D           {  0x40000000,  0x1000  },
     [IBEX_DEV_GPIO] =3D           {  0x40040000,  0x1000  },
-    [IBEX_DEV_SPI] =3D            {  0x40050000,  0x1000  },
+    [IBEX_DEV_SPI_DEVICE] =3D     {  0x40050000,  0x1000  },
     [IBEX_DEV_I2C] =3D            {  0x40080000,  0x1000  },
     [IBEX_DEV_PATTGEN] =3D        {  0x400e0000,  0x1000  },
     [IBEX_DEV_TIMER] =3D          {  0x40100000,  0x1000  },
     [IBEX_DEV_SENSOR_CTRL] =3D    {  0x40110000,  0x1000  },
     [IBEX_DEV_OTP_CTRL] =3D       {  0x40130000,  0x4000  },
     [IBEX_DEV_USBDEV] =3D         {  0x40150000,  0x1000  },
+    [IBEX_DEV_SPI_HOST0] =3D      {  0x40300000,  0x1000  },
+    [IBEX_DEV_SPI_HOST1] =3D      {  0x40310000,  0x1000  },
     [IBEX_DEV_PWRMGR] =3D         {  0x40400000,  0x1000  },
     [IBEX_DEV_RSTMGR] =3D         {  0x40410000,  0x1000  },
     [IBEX_DEV_CLKMGR] =3D         {  0x40420000,  0x1000  },
@@ -209,8 +211,12 @@ static void lowrisc_ibex_soc_realize(DeviceState *de=
v_soc, Error **errp)
=20
     create_unimplemented_device("riscv.lowrisc.ibex.gpio",
         memmap[IBEX_DEV_GPIO].base, memmap[IBEX_DEV_GPIO].size);
-    create_unimplemented_device("riscv.lowrisc.ibex.spi",
-        memmap[IBEX_DEV_SPI].base, memmap[IBEX_DEV_SPI].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.spi_device",
+        memmap[IBEX_DEV_SPI_DEVICE].base, memmap[IBEX_DEV_SPI_DEVICE].si=
ze);
+    create_unimplemented_device("riscv.lowrisc.ibex.spi_host0",
+        memmap[IBEX_DEV_SPI_HOST0].base, memmap[IBEX_DEV_SPI_HOST0].size=
);
+    create_unimplemented_device("riscv.lowrisc.ibex.spi_host1",
+        memmap[IBEX_DEV_SPI_HOST1].base, memmap[IBEX_DEV_SPI_HOST1].size=
);
     create_unimplemented_device("riscv.lowrisc.ibex.i2c",
         memmap[IBEX_DEV_I2C].base, memmap[IBEX_DEV_I2C].size);
     create_unimplemented_device("riscv.lowrisc.ibex.pattgen",
diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index eac35ef590..00da9ded43 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -57,8 +57,10 @@ enum {
     IBEX_DEV_FLASH,
     IBEX_DEV_FLASH_VIRTUAL,
     IBEX_DEV_UART,
+    IBEX_DEV_SPI_DEVICE,
+    IBEX_DEV_SPI_HOST0,
+    IBEX_DEV_SPI_HOST1,
     IBEX_DEV_GPIO,
-    IBEX_DEV_SPI,
     IBEX_DEV_I2C,
     IBEX_DEV_PATTGEN,
     IBEX_DEV_TIMER,
--=20
2.35.1


