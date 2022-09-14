Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oYPN9-0001fG-OR
	for mharc-qemu-riscv@gnu.org; Wed, 14 Sep 2022 06:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2494fb295=alistair.francis@wdc.com>)
 id 1oYPN0-0001Zi-Ss; Wed, 14 Sep 2022 06:11:55 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:25189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2494fb295=alistair.francis@wdc.com>)
 id 1oYPMz-0005xH-3t; Wed, 14 Sep 2022 06:11:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1663150308; x=1694686308;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9ipMvwRnulhRPxErs5FRklIdkTOE8ARBrHTdf/sATms=;
 b=VrwKgmfINlxCPfJ0U3Xri+BZSNSfy4FFeUw5HJuVxJ4+ItfIkL3Jzd8+
 IU/541mF7pcndyPLvacLl+czR8+YZogBY9TL8MLM/SPl2fvsrC2MOKnKv
 83/kP9WCZCh31VRUQwry2fZNjiwxyShrQEqMPCyNlwUigkL1UgpI1JaWt
 jYSiysfWIJU44FIAI00f0m3vKs3IIqG1eAHToz9FIcTytrm1bcN/3yqqT
 Ia080bQyC5vszsxxchSHG+fSbUHL/HgNIa53mKILW53gzNZMs81PPB88I
 8TEIzR4vVhaAS0cv4peoNRLk8FDDDjyYJXOBIW+I5+MfCi5oN8SEwIZIg g==;
X-IronPort-AV: E=Sophos;i="5.93,315,1654531200"; d="scan'208";a="315604495"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Sep 2022 18:11:39 +0800
IronPort-SDR: wKbYy2ddOUULxaDX58+nGWHyEGumtDJQ128kDPU4VmKLwyjFNYiRlQzcUWqARzCOWhBMjG3xNF
 ee3/EZUm5uvtilH4UE2WN8JjSpRxfdt4Xt+XolBPA3sWXG0K/YPm4AP527rJ5I4w2PRsKqZOBm
 RO44KHAcUxlTGnXVIO69+1Bq69DfmK62HuHr+tXr/Z5EWFlTgWt2yPQqUnQfQacACJ8fBYYGOF
 6UzeR/X6ldotObMJnNt8Jr2gbtJ0IBBVII5xnd37UTI0djC2Icd1aHSbAkDAfIBFUz259lPQGL
 LCvAKzpQWBZxVOBG6rwrof8Q
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Sep 2022 02:26:25 -0700
IronPort-SDR: AOPo1kKzDF9IIEFiXN4XmJsUzv5aw37xxVF4XkOGaPFYPBvYoCgf6x5MkKjF/djz3Xefjp3ivD
 kihkvwXelALCUKljg9Tfz+H6b3Y8gmBldr3CAU0oxc0rHFEbrQlg71DCzpRXaR3/hdt5PsKczf
 b+mnbZbLOYB0T7jCzXyPa684wFtymo3I5jKCMhI8odbE4KT5MmzpTj1RAdfkVvsmNJ2Qi1lJHU
 HWocgH2ubyz6pE2VBUB4+eD3tq0KQgDFOgsgHoFvG5rejTb4oxOAa00mT21YfE9ylakbVpaK7i
 Z+c=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.107])
 by uls-op-cesaip02.wdc.com with ESMTP; 14 Sep 2022 03:11:38 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
Subject: [PATCH 3/3] hw/riscv: opentitan: Expose the resetvec as a SoC property
Date: Wed, 14 Sep 2022 12:11:08 +0200
Message-Id: <20220914101108.82571-4-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220914101108.82571-1-alistair.francis@wdc.com>
References: <20220914101108.82571-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=2494fb295=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
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
X-List-Received-Date: Wed, 14 Sep 2022 10:11:56 -0000

On the OpenTitan hardware the resetvec is fixed at the start of ROM. In
QEMU we don't run the ROM code and instead just jump to the next stage.
This means we need to be a little more flexible about what the resetvec
is.

This patch allows us to set the resetvec from the command line with
something like this:
    -global driver=riscv.lowrisc.ibex.soc,property=resetvec,value=0x20000400

This way as the next stage changes we can update the resetvec.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/opentitan.h | 2 ++
 hw/riscv/opentitan.c         | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index 26d960f288..6665cd5794 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -46,6 +46,8 @@ struct LowRISCIbexSoCState {
     IbexTimerState timer;
     IbexSPIHostState spi_host[OPENTITAN_NUM_SPI_HOSTS];
 
+    uint32_t resetvec;
+
     MemoryRegion flash_mem;
     MemoryRegion rom;
     MemoryRegion flash_alias;
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 45c92c9bbc..be7ff1eea0 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -142,7 +142,7 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
                             &error_abort);
     object_property_set_int(OBJECT(&s->cpus), "num-harts", ms->smp.cpus,
                             &error_abort);
-    object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x20000400,
+    object_property_set_int(OBJECT(&s->cpus), "resetvec", s->resetvec,
                             &error_abort);
     sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_fatal);
 
@@ -297,10 +297,16 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
         memmap[IBEX_DEV_PERI].base, memmap[IBEX_DEV_PERI].size);
 }
 
+static Property lowrisc_ibex_soc_props[] = {
+    DEFINE_PROP_UINT32("resetvec", LowRISCIbexSoCState, resetvec, 0x20000400),
+    DEFINE_PROP_END_OF_LIST()
+};
+
 static void lowrisc_ibex_soc_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
 
+    device_class_set_props(dc, lowrisc_ibex_soc_props);
     dc->realize = lowrisc_ibex_soc_realize;
     /* Reason: Uses serial_hds in realize function, thus can't be used twice */
     dc->user_creatable = false;
-- 
2.37.2


