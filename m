Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nKDid-0001Gz-Iv
	for mharc-qemu-riscv@gnu.org; Wed, 16 Feb 2022 01:23:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDib-0001Ge-L9
 for qemu-riscv@nongnu.org; Wed, 16 Feb 2022 01:23:13 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:58996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDiY-0005TZ-4M
 for qemu-riscv@nongnu.org; Wed, 16 Feb 2022 01:23:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644992589; x=1676528589;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OS1E/FtxGnq0FdQKgaclKyxOcSmrIY7adRw9g/4vIHs=;
 b=O+hbfFB8aWrPzURaGErDGwrUAF1IAdpQkyVFKiooXsm+ojdsHLUjyXRZ
 hKozHLhaMqE79Gfa49GQ015tHyQ4I2Lkn6KSwhgGZUKXnhIdLa8uu9meV
 syuShYGE0cMqo9jLaXyAcF29oizu2LTInZ7etSCYXm1Mn4CLLm2sfaAtQ
 HatDv2xClOgres0ozfhHxf/tuge9JjLQh2Zaff0iySOYC5Yfq3OiKcZeL
 rFNvdtPJsNAOUFupryCRh06PtHMh/jH30f8DTaYgnaI7zjBywxYY6EN/T
 X1yCimnc500GvfpVWFpF+4o7ULuNYgJdk/hLIwnNvX3FgaQIYeJsbmyNu A==;
X-IronPort-AV: E=Sophos;i="5.88,373,1635177600"; d="scan'208";a="193072319"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Feb 2022 14:23:04 +0800
IronPort-SDR: lkKidJ4weDU3wyWbxi4yGtesKhVFYkn6RDvPeR9w+8Rh2wi6Gsskco83tQ0lk1PjBaxOJz+PUm
 zcGkp7yzlQSTRzezhW9DR7YPDCHaZgMGe/EQEpDNYqTBG3QfYxMP6N4ymiOu2N17C6dhGlq8rY
 CHckx+o7EU4ipFd5v2uglqgc8dcKbJn9GrfackPfTVW4R592PMbl0e86u02Rjr4a6fv6TGCRqA
 ywBxdWaxFQyCf5gTlIBB7z3GPwuIRcAfbUIjpbMGidf12P1+wc3/mcAyGb6WvtCXyqktUEJjAr
 xNLl3USy2K2j3/dxXhE65uui
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 21:55:53 -0800
IronPort-SDR: jDkOa1CXurYb/Uojfwr+83ryV1T9SgKPDZHIvdHBEYZavGx5RqL/iT4wM+EgOQoY4u1gghKJUb
 uQagLRDtTYtDj/AZ/bO8qwwnjU1BYaFDq8qf0yUcSpUHfd66wMeGHQAZRqjWnuqDYzmUJHnevh
 XW2c6ubb4XgyUBqo7hfCG1PLDTXwWAsOHe+vwfpuscjSh7f83H07DSL5sMemDBua4ETjHaBlCH
 mjK8AHoG/peaRqnwHLcn4TjB1MfG0R4HDeubbkhCTs5NmXhaU0y9VwH+kctnJqC8pqlR/Igi1r
 aTk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:23:05 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jz7Dm5t41z1SVp0
 for <qemu-riscv@nongnu.org>; Tue, 15 Feb 2022 22:23:04 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1644992584;
 x=1647584585; bh=OS1E/FtxGnq0FdQKgaclKyxOcSmrIY7adRw9g/4vIHs=; b=
 bMRs9RtFWHEmnT7yCfOv/xFR4cOWJTv+YMYuydo13QgxcCh3gksAbsBzIDvufJWR
 J+ZBjod19dtDDh+L8uuOt2DS/oN+lvgwUzQnw/xiW//Hi8AXixluU1Cw49dnZFRa
 3cokh4HqmniIHKvWZziqb73whYI5iBv24ZD3h3vVIhysqxc4McGKYoYnFMK2eDjE
 joQ/xA20b19paFtliFV9XjLcDU92O5WU5ABn4q96aWON81p3+oSgXl/35RhkBdtm
 QLrR2fRaI6DD7U2tHUIpKOLxH6cYPFQL8N3gAey2pYy4WBdJDQP1/ANITUEfUAPF
 FiRKXb1iH+30h7mFbxBr4g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id rAcHfJ0wVSyA for <qemu-riscv@nongnu.org>;
 Tue, 15 Feb 2022 22:23:04 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.97])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jz7Dg59M5z1Rwrw;
 Tue, 15 Feb 2022 22:22:59 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, wilfred.mallawa@wdc.com
Subject: [PATCH v1] hw: riscv: opentitan: fixup SPI addresses
Date: Wed, 16 Feb 2022 16:22:48 +1000
Message-Id: <20220216062248.317329-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=039576d22=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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
X-List-Received-Date: Wed, 16 Feb 2022 06:23:13 -0000

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

This patch updates the SPI_DEVICE, SPI_HOST0, SPI_HOST1
base addresses. Also adds these as unimplemented devices.

The address references can be found [1].

[1] https://github.com/lowRISC/opentitan/blob/6c317992fbd646818b34f2a2dbf=
44bc850e461e4/hw/top_earlgrey/sw/autogen/top_earlgrey_memory.h#L107

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 hw/riscv/opentitan.c         | 12 +++++++++---
 include/hw/riscv/opentitan.h |  4 +++-
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index aec7cfa33f..596b518a26 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -33,8 +33,10 @@ static const MemMapEntry ibex_memmap[] =3D {
     [IBEX_DEV_RAM] =3D            {  0x10000000,  0x10000 },
     [IBEX_DEV_FLASH] =3D          {  0x20000000,  0x80000 },
     [IBEX_DEV_UART] =3D           {  0x40000000,  0x1000  },
+    [IBEX_DEV_SPI_HOST0] =3D      {  0x40300000,  0x1000  },
+    [IBEX_DEV_SPI_HOST1] =3D      {  0x40310000,  0x1000  },
     [IBEX_DEV_GPIO] =3D           {  0x40040000,  0x1000  },
-    [IBEX_DEV_SPI] =3D            {  0x40050000,  0x1000  },
+    [IBEX_DEV_SPI_DEVICE] =3D     {  0x40050000,  0x1000  },
     [IBEX_DEV_I2C] =3D            {  0x40080000,  0x1000  },
     [IBEX_DEV_PATTGEN] =3D        {  0x400e0000,  0x1000  },
     [IBEX_DEV_TIMER] =3D          {  0x40100000,  0x1000  },
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


