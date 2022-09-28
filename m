Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1odPKd-0004HC-7g
	for mharc-qemu-riscv@gnu.org; Wed, 28 Sep 2022 01:10:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2630fb27d=wilfred.mallawa@opensource.wdc.com>)
 id 1odPKb-0004Da-H8
 for qemu-riscv@nongnu.org; Wed, 28 Sep 2022 01:10:01 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:45930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2630fb27d=wilfred.mallawa@opensource.wdc.com>)
 id 1odPKY-0005xh-Qa
 for qemu-riscv@nongnu.org; Wed, 28 Sep 2022 01:10:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664341798; x=1695877798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yomELWtHAvfi1M1sFbUOHw/Wf0l/zLkZFSnuz+SXMVc=;
 b=T3FSA/9YNePd2XGfcYVoJhTxMerJPdT4WmBhet1o6XXaI/9LBZuq1HX4
 o5RjpWydzQH/Is6xWa3yeujjqaEdb0kLx6vr1Q/2AlbzEDAwuBT275fUM
 gaaMyYnYXzOGMKfPLO0ja30yUSXW8drVISaHmbBG01JdXh2WIiC+D1nWg
 8Hth/BXE8zYxQmBBMMlsWNxrCiygjYQ6lVpIs71JYR5Zc4NcOycSo8Fl2
 7ZEu+a9fiuoReV/DkYKhubnaaKFhsXZzIoWsqXJVHIeo8LBq9EP8mz6/H
 KYUgmj37e97k/ym95Yl0lUjqW5kHSXSnkqaJhcg8EkPRQQAZ5ZKhW5sgR A==;
X-IronPort-AV: E=Sophos;i="5.93,351,1654531200"; d="scan'208";a="212459141"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Sep 2022 13:09:58 +0800
IronPort-SDR: hsrsgzZNET0/6IzJmO3eIArXvR3/KHn+0kjNh8QztUnZlmO+Z8nz43+dPp/w+7fx8XF3JNz6To
 ilPFnkC/x1zkknePEohijzIgqojAa6olQRDkJh65vtXSnR9tSbi2mEXpr+Yb8RpGSxOBx6PT15
 YKA2u+cidUC7em/9TSDJsH3fwgi7yQ1zlzAJaKc+iESDfmiXWrcsGAz3TmQADKTewU6ZaoeSIU
 9WK1mMuvVAjI2UgFbyjc4FHji+tbAcL5TTW3CtpMt+0+ZIe13maPxupHkbUXc+MOK60awStitd
 LGIg0Lk6AAD0BKgBTghTIcBZ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Sep 2022 21:29:54 -0700
IronPort-SDR: EXhQryHkj15G8nz4wYnJOkPgwntWFlVEvzzLPRKiF91x5h57yN1dyHqzSLgFN/RUYGq7Unl2fV
 4v2FoE8rURgPt2TdNijFdeCKXTeVqk5pE5UYJ7FuzWvozIKUPvruIph65dxQ+XET7xyXJ+7QJL
 y/6y/wh0Cz6bAzmI/8rKcZR+JbTSaUAWkStNDEqjbWelnDdUstX1xayqejyP2c7HF0+MeUT391
 60zMFjoO3L9PnVBVWJWKfIc+LBoKDx1PaM4+ufr35CZF0MJbzNZfsXcuwFlMnKbmGz7ecaVVnx
 fZA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Sep 2022 22:09:59 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mcl114vqZz1RvTr
 for <qemu-riscv@nongnu.org>; Tue, 27 Sep 2022 22:09:57 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1664341797; x=1666933798; bh=yomELWtHAvfi1M1sFb
 UOHw/Wf0l/zLkZFSnuz+SXMVc=; b=TJHARhuJnjWkNk33LmT8ZBFSjSIxwsWzx7
 +wh65CiOF2DNN2X2m8YDg1GvvThAaUdSBHCaMhqmVkycAJ3GmH1dGVMUwmhr0/MB
 TfnnJFrwM7Ul6Wr4dcVLSAOCQ43GyeN9hcptgjZ1X2KDNcLE80AIFgZcgm3B4pKI
 Ab9Zb0LcoSHRk2IfNjdDgPkXO0Unneh4UEMijQ+O+/q8YGGzOcMl76ZjaoXy72Vf
 b1GK5pK3Pg8zLRq1rh4DG/B6R8KIyYtMsnuVo9vEbqbgat7hSku3waR7mDAZ9NvE
 NzmZkisldUMbqBwk1jWzkg/sYCF4G2tcwXuFHunuBqv9nYYJj/Lg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id DKIbtx3_jNyt for <qemu-riscv@nongnu.org>;
 Tue, 27 Sep 2022 22:09:57 -0700 (PDT)
Received: from fedora.home (unknown [10.225.165.54])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mcl0y2RlJz1RvLy;
 Tue, 27 Sep 2022 22:09:54 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v1 2/2] riscv/opentitan: connect lifecycle controller
Date: Wed, 28 Sep 2022 15:08:30 +1000
Message-Id: <20220928050827.319293-3-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928050827.319293-1-wilfred.mallawa@opensource.wdc.com>
References: <20220928050827.319293-1-wilfred.mallawa@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=2630fb27d=wilfred.mallawa@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 28 Sep 2022 05:10:01 -0000

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Connects the ibex lifecycle controller with opentitan,
with this change, we can now get past the lifecycle checks
in the boot rom.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 hw/riscv/opentitan.c         | 10 ++++++++--
 include/hw/riscv/opentitan.h |  2 ++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index be7ff1eea0..73a5cef694 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -122,6 +122,8 @@ static void lowrisc_ibex_soc_init(Object *obj)
=20
     object_initialize_child(obj, "timer", &s->timer, TYPE_IBEX_TIMER);
=20
+    object_initialize_child(obj, "lifetime_ctrl", &s->lc, TYPE_IBEX_LC_C=
TRL);
+
     for (int i =3D 0; i < OPENTITAN_NUM_SPI_HOSTS; i++) {
         object_initialize_child(obj, "spi_host[*]", &s->spi_host[i],
                                 TYPE_IBEX_SPI_HOST);
@@ -243,6 +245,12 @@ static void lowrisc_ibex_soc_realize(DeviceState *de=
v_soc, Error **errp)
         }
     }
=20
+    /* Life-Cycle Control */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->lc), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->lc), 0, memmap[IBEX_DEV_LC_CTRL].=
base);
+
     create_unimplemented_device("riscv.lowrisc.ibex.gpio",
         memmap[IBEX_DEV_GPIO].base, memmap[IBEX_DEV_GPIO].size);
     create_unimplemented_device("riscv.lowrisc.ibex.spi_device",
@@ -255,8 +263,6 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev=
_soc, Error **errp)
         memmap[IBEX_DEV_SENSOR_CTRL].base, memmap[IBEX_DEV_SENSOR_CTRL].=
size);
     create_unimplemented_device("riscv.lowrisc.ibex.otp_ctrl",
         memmap[IBEX_DEV_OTP_CTRL].base, memmap[IBEX_DEV_OTP_CTRL].size);
-    create_unimplemented_device("riscv.lowrisc.ibex.lc_ctrl",
-        memmap[IBEX_DEV_LC_CTRL].base, memmap[IBEX_DEV_LC_CTRL].size);
     create_unimplemented_device("riscv.lowrisc.ibex.pwrmgr",
         memmap[IBEX_DEV_PWRMGR].base, memmap[IBEX_DEV_PWRMGR].size);
     create_unimplemented_device("riscv.lowrisc.ibex.rstmgr",
diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index 6665cd5794..64b7f21339 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -24,6 +24,7 @@
 #include "hw/char/ibex_uart.h"
 #include "hw/timer/ibex_timer.h"
 #include "hw/ssi/ibex_spi_host.h"
+#include "hw/misc/ibex_lc_ctrl.h"
 #include "qom/object.h"
=20
 #define TYPE_RISCV_IBEX_SOC "riscv.lowrisc.ibex.soc"
@@ -44,6 +45,7 @@ struct LowRISCIbexSoCState {
     SiFivePLICState plic;
     IbexUartState uart;
     IbexTimerState timer;
+    IbexLCState lc;
     IbexSPIHostState spi_host[OPENTITAN_NUM_SPI_HOSTS];
=20
     uint32_t resetvec;
--=20
2.37.3


