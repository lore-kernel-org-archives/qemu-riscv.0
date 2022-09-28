Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1odPKV-00040e-GJ
	for mharc-qemu-riscv@gnu.org; Wed, 28 Sep 2022 01:09:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2630fb27d=wilfred.mallawa@opensource.wdc.com>)
 id 1odPKU-0003z2-DM
 for qemu-riscv@nongnu.org; Wed, 28 Sep 2022 01:09:54 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:45930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2630fb27d=wilfred.mallawa@opensource.wdc.com>)
 id 1odPKR-0005xh-GL
 for qemu-riscv@nongnu.org; Wed, 28 Sep 2022 01:09:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664341791; x=1695877791;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dOZtPyBygLcd1KNKVNjogMcUbDTujYp71Y3GLnprfhY=;
 b=D0+do6ByoEhni78VW5Sdv54hCVj6Ztd14cOfhZICv8jP3sq8RL8bfMJa
 DZhwuVMsaJFd80HKwyqHqI+0HjciIhYqxtuc9khjlrldNkkDqYvo+k4aK
 TFh+LcXzUQtSY1pT+yrqcplhh5/i5oVmoIImcknlwv2C5LXIBF67iQOo4
 F3CmkRnOIXo9dQ7Cm59cleex5VyEJ6yP0/owohYxeoNEbyulWLZ3wnmpG
 k+QQnnekyBeovWumoKAolVbT75DDDIUp2ltmCjeSpqdBqPBxv5CcTpS5X
 SFiqwc4BMQ7Y5OufQHIz9Nb32b5PNkLIT+jPu1h1tkwzVSFE1cPXdj3mv Q==;
X-IronPort-AV: E=Sophos;i="5.93,351,1654531200"; d="scan'208";a="212459131"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Sep 2022 13:09:42 +0800
IronPort-SDR: aJDlVN9m93Ydi9aCEi2W+GhIpoKvsY/ZAn1jmt5ScN3eRAPcjKWn6B5Dk4+0bZt0rJ7OYwLzZm
 9sWR6Qz8kbuPFPETkUdWFXSqxT1w8wcjcYHV1Myc/OTLz6H7vraUInojDsh4GS909llT9QqcG6
 pIiDtJ+3XWqp+Oyx+vxaCfT6mOv7GNpTPlKoR2uy/JcIeDrgFE4Xr7GAWR+xE+q/yhi49sBR2Y
 BvGOmI2Oux04aXobPSDdPu9LalFSSi83WBm1QsF35qiGAmx92WYGHdvJ9pYE+uyD91s00gEUTU
 JIEkJXPpHrLbxf9NTFIjWQ8e
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Sep 2022 21:29:39 -0700
IronPort-SDR: Uzpzushoq0OkqJLSqxOaohf857dbwfA77K2zpp1Nxust0b2DJlnqsLMJ9teoD5wpN1jODNjC3K
 7vfESn65ljuG1Sm261QBEXe65nXnpHODflvFRBt+2p/r336pl94szzYr9w/YJA73jCd04GPmMM
 pr7Y12rCDkqtPOtfUu88H+GyhhEYPhyzhR/V6ifpwFtNH/ide2R2joS2iOhewdRqd1XcjHXo9w
 B0Ze+R5o3as/yK3Q7VlSY817IiZWQHlII43WPUlhQX3sBmKVnb1sThKagWmlhQSWz95JgFhNXB
 g1M=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Sep 2022 22:09:43 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mcl0k0y0Cz1RwtC
 for <qemu-riscv@nongnu.org>; Tue, 27 Sep 2022 22:09:41 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1664341780; x=1666933781; bh=dOZtPyBygLcd1KNKVN
 jogMcUbDTujYp71Y3GLnprfhY=; b=G01fVJ1LMOWfC+V2+VvU5NFfgPPFH0/O/m
 ttMYL9DQJHj68YEpRsH3unqNt+HwUuIVOv0lBkytxz8J+a8dUeqgXJm2fnIo2/0E
 El4EzxRT4DiEKIZbEg/CV3BtquyxhifO+iCktYTGG2oeROETqrX6R9wqLVay8EdV
 orqh0wzYfpCjmLBMn/hbELbB1YVaf5Q4sSFD2RWSTTRJz1vR9cyOb0O1EKLq9sq6
 NHt5+Jhm4Juc72Cdp8q0ZeKd03RfkPkSIFLCuR8YHRiHWd+bzIoIHv8rPvof+iy7
 BZwebrVmEJnISTSXQjIu5h1uDBKsEgI5ySE7AIKXlno3bZtdnVDA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id AGZmZlTkL6Eu for <qemu-riscv@nongnu.org>;
 Tue, 27 Sep 2022 22:09:40 -0700 (PDT)
Received: from fedora.home (unknown [10.225.165.54])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mcl0c6q2jz1RvLy;
 Tue, 27 Sep 2022 22:09:36 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v1 1/2] hw/misc: add ibex lifecycle controller
Date: Wed, 28 Sep 2022 15:08:28 +1000
Message-Id: <20220928050827.319293-2-wilfred.mallawa@opensource.wdc.com>
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
X-List-Received-Date: Wed, 28 Sep 2022 05:09:54 -0000

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Device model for the OpenTitan lifecycle controller as per [1].

Addition of this model is the first of many steps to adding `boot_rom`
support for OpenTitan. The OpenTitan `boot_rom` needs to access the
lifecycle controller during the init/test sequence before it jumps to
flash. With this model, we can get past the lifecycle controller stages
in boot.

Currently the supported functionality is limited.

[1] https://docs.opentitan.org/hw/ip/lc_ctrl/doc/

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 hw/misc/ibex_lc_ctrl.c         | 287 +++++++++++++++++++++++++++++++++
 hw/misc/meson.build            |   3 +
 hw/misc/trace-events           |   5 +
 include/hw/misc/ibex_lc_ctrl.h | 121 ++++++++++++++
 4 files changed, 416 insertions(+)
 create mode 100644 hw/misc/ibex_lc_ctrl.c
 create mode 100644 include/hw/misc/ibex_lc_ctrl.h

diff --git a/hw/misc/ibex_lc_ctrl.c b/hw/misc/ibex_lc_ctrl.c
new file mode 100644
index 0000000000..f034a92a9c
--- /dev/null
+++ b/hw/misc/ibex_lc_ctrl.c
@@ -0,0 +1,287 @@
+/*
+ * QEMU model of the Ibex Life Cycle Controller
+ * SPEC Reference: https://docs.opentitan.org/hw/ip/lc_ctrl/doc/
+ *
+ * Copyright (C) 2022 Western Digital
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
+ * of this software and associated documentation files (the "Software"),=
 to deal
+ * in the Software without restriction, including without limitation the=
 rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or =
sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be includ=
ed in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "hw/misc/ibex_lc_ctrl.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
+#include "migration/vmstate.h"
+#include "trace.h"
+
+REG32(ALERT_TEST, 0x00)
+    FIELD(ALERT_TEST, FETAL_PROG_ERR, 0, 1)
+    FIELD(ALERT_TEST, FETAL_STATE_ERR, 1, 1)
+    FIELD(ALERT_TEST, FETAL_BUS_INTEG_ERR, 2, 1)
+REG32(CTRL_STATUS, 0x04)
+    FIELD(CTRL_STATUS, READY, 0, 1)
+    FIELD(CTRL_STATUS, TRANSITION_SUCCESSFUL, 0, 1)
+    FIELD(CTRL_STATUS, TRANSITION_COUNT_ERROR, 1, 1)
+    FIELD(CTRL_STATUS, TRANSITION_ERROR, 2, 1)
+    FIELD(CTRL_STATUS, TOKEN_ERROR, 3, 1)
+    FIELD(CTRL_STATUS, FLASH_RMA_ERROR, 4, 1)
+    FIELD(CTRL_STATUS, OTP_ERROR, 5, 1)
+    FIELD(CTRL_STATUS, STATE_ERROR, 6, 1)
+    FIELD(CTRL_STATUS, BUS_INTEG_ERROR, 7, 1)
+    FIELD(CTRL_STATUS, OTP_PARTITION_ERROR, 8, 1)
+REG32(CLAIM_TRANSITION_IF, 0x08)
+     FIELD(CLAIM_TRANSITION_IF, MUTEX, 0, 8)
+REG32(TRANSITION_REGWEN , 0x0C)
+     FIELD(TRANSITION_REGWEN , TRANSITION_REGWEN, 0, 1)
+REG32(TRANSITION_CMD , 0x10)
+     FIELD(TRANSITION_CMD , START, 0, 1)
+REG32(TRANSITION_CTRL , 0x14)
+     FIELD(TRANSITION_CTRL , EXT_CLOCK_EN, 0, 1)
+REG32(TRANSITION_TOKEN_0 , 0x18)
+     FIELD(TRANSITION_TOKEN_0 , TRANSITION_TOKEN_0, 0, 32)
+REG32(TRANSITION_TOKEN_1 , 0x1C)
+     FIELD(TRANSITION_TOKEN_1 , TRANSITION_TOKEN_1, 0, 32)
+REG32(TRANSITION_TOKEN_2 , 0x20)
+     FIELD(TRANSITION_TOKEN_2 , TRANSITION_TOKEN_2, 0, 32)
+REG32(TRANSITION_TOKEN_3 , 0x24)
+     FIELD(TRANSITION_TOKEN_3 , TRANSITION_TOKEN_3, 0, 32)
+REG32(TRANSITION_TARGET , 0x28)
+     FIELD(TRANSITION_TARGET , STATE, 0, 30)
+REG32(OTP_VENDOR_TEST_CTRL , 0x2C)
+     FIELD(OTP_VENDOR_TEST_CTRL , OTP_VENDOR_TEST_CTRL, 0, 32)
+REG32(OTP_VENDOR_TEST_STATUS , 0x30)
+     FIELD(OTP_VENDOR_TEST_STATUS , OTP_VENDOR_TEST_STATUS, 0, 32)
+REG32(LC_STATE , 0x34)
+     FIELD(LC_STATE , STATE, 0, 30)
+REG32(LC_TRANSITION_CNT , 0x38)
+     FIELD(LC_TRANSITION_CNT , CNT, 0, 5)
+REG32(LC_ID_STATE , 0x3C)
+     FIELD(LC_ID_STATE , STATE, 0, 32)
+REG32(HW_REV , 0x40)
+     FIELD(HW_REV , CHIP_REV, 0, 16)
+     FIELD(HW_REV , CHIP_GEN, 16, 16)
+REG32(DEVICE_ID_0 , 0x44)
+     FIELD(DEVICE_ID_0 , DEVICE_ID_0, 0, 32)
+REG32(DEVICE_ID_1 , 0x48)
+     FIELD(DEVICE_ID_1 , DEVICE_ID_2, 0, 32)
+REG32(DEVICE_ID_2 , 0x4C)
+     FIELD(DEVICE_ID_2 , DEVICE_ID_2, 0, 32)
+REG32(DEVICE_ID_3 , 0x50)
+     FIELD(DEVICE_ID_3 , DEVICE_ID_3, 0, 32)
+REG32(DEVICE_ID_4 , 0x54)
+     FIELD(DEVICE_ID_4 , DEVICE_ID_4, 0, 32)
+REG32(DEVICE_ID_5 , 0x58)
+     FIELD(DEVICE_ID_5 , DEVICE_ID_5, 0, 32)
+REG32(DEVICE_ID_6 , 0x5C)
+     FIELD(DEVICE_ID_6 , DEVICE_ID_6, 0, 32)
+REG32(DEVICE_ID_7 , 0x60)
+     FIELD(DEVICE_ID_7 , DEVICE_ID_7, 0, 32)
+REG32(MANUF_STATE_0 , 0x64)
+     FIELD(MANUF_STATE_0 , MANUF_STATE_0, 0, 32)
+REG32(MANUF_STATE_1 , 0x68)
+     FIELD(MANUF_STATE_1 , MANUF_STATE_1, 0, 32)
+REG32(MANUF_STATE_2 , 0x6C)
+     FIELD(MANUF_STATE_2 , MANUF_STATE_2, 0, 32)
+REG32(MANUF_STATE_3 , 0x70)
+     FIELD(MANUF_STATE_3 , MANUF_STATE_3, 0, 32)
+REG32(MANUF_STATE_4 , 0x74)
+     FIELD(MANUF_STATE_4 , MANUF_STATE_4, 0, 32)
+REG32(MANUF_STATE_5 , 0x78)
+     FIELD(MANUF_STATE_5 , MANUF_STATE_5, 0, 32)
+REG32(MANUF_STATE_6 , 0x7C)
+     FIELD(MANUF_STATE_6 , MANUF_STATE_6, 0, 32)
+REG32(MANUF_STATE_7 , 0x80)
+     FIELD(MANUF_STATE_7 , MANUF_STATE_7, 0, 32)
+
+static void ibex_lc_reset(DeviceState *dev)
+{
+    IbexLCState *s =3D IBEX_LC_CTRL(dev);
+
+    trace_ibex_lc_general("Resetting Ibex Life-cycle IP");
+
+    /* Set all register values to spec defaults */
+    s->regs[IBEX_LC_CTRL_ALERT_TEST]                =3D 0x00;
+    s->regs[IBEX_CTRL_STATUS]                       =3D 0x00;
+    s->regs[IBEX_CTRL_CLAIM_TRANSITION_IF]          =3D 0x69;
+    s->regs[IBEX_LC_CTRL_TRANSITION_REGWEN]         =3D 0x0C;
+    s->regs[IBEX_LC_CTRL_TRANSITION_CMD]            =3D 0x10;
+    s->regs[IBEX_LC_CTRL_TRANSITION_CTRL]           =3D 0x14;
+    s->regs[IBEX_LC_CTRL_TRANSITION_TOKEN_0]        =3D 0x00;
+    s->regs[IBEX_LC_CTRL_TRANSITION_TOKEN_1]        =3D 0x00;
+    s->regs[IBEX_LC_CTRL_TRANSITION_TOKEN_2]        =3D 0x00;
+    s->regs[IBEX_LC_CTRL_TRANSITION_TOKEN_3]        =3D 0x00;
+    s->regs[IBEX_LC_CTRL_TRANSITION_TARGET]         =3D 0x00;
+    s->regs[IBEX_LC_CTRL_OTP_VENDOR_TEST_CTRL]      =3D 0x00;
+    s->regs[IBEX_LC_CTRL_OTP_VENDOR_TEST_STATUS]    =3D 0x00;
+    /* This is checked by the boot rom to set state */
+    s->regs[IBEX_LC_CTRL_LC_STATE]                  =3D LC_STATE_TEST_UN=
LOCKED0;
+    s->regs[IBEX_LC_CTRL_LC_TRANSITION_CNT]         =3D 0x00;
+    s->regs[IBEX_LC_CTRL_LC_ID_STATE]               =3D 0x00;
+    s->regs[IBEX_LC_CTRL_HW_REV]                    =3D 0x00;
+    s->regs[IBEX_LC_CTRL_DEVICE_ID_0]               =3D 0x00;
+    s->regs[IBEX_LC_CTRL_DEVICE_ID_1]               =3D 0x00;
+    s->regs[IBEX_LC_CTRL_DEVICE_ID_2]               =3D 0x00;
+    s->regs[IBEX_LC_CTRL_DEVICE_ID_3]               =3D 0x00;
+    s->regs[IBEX_LC_CTRL_DEVICE_ID_4]               =3D 0x00;
+    s->regs[IBEX_LC_CTRL_DEVICE_ID_5]               =3D 0x00;
+    s->regs[IBEX_LC_CTRL_DEVICE_ID_6]               =3D 0x00;
+    s->regs[IBEX_LC_CTRL_DEVICE_ID_7]               =3D 0x00;
+    s->regs[IBEX_LC_CTRL_MANUF_STATE_0]             =3D 0x00;
+    s->regs[IBEX_LC_CTRL_MANUF_STATE_1]             =3D 0x00;
+    s->regs[IBEX_LC_CTRL_MANUF_STATE_2]             =3D 0x00;
+    s->regs[IBEX_LC_CTRL_MANUF_STATE_3]             =3D 0x00;
+    s->regs[IBEX_LC_CTRL_MANUF_STATE_4]             =3D 0x00;
+    s->regs[IBEX_LC_CTRL_MANUF_STATE_5]             =3D 0x00;
+    s->regs[IBEX_LC_CTRL_MANUF_STATE_6]             =3D 0x00;
+    s->regs[IBEX_LC_CTRL_MANUF_STATE_7]             =3D 0x00;
+}
+
+static uint64_t ibex_lc_read(void *opaque, hwaddr addr,
+                                     unsigned int size)
+{
+    IbexLCState *s =3D opaque;
+    uint32_t reg_val =3D 0;
+
+    trace_ibex_lc_read(addr, size);
+    /* Match reg index */
+    addr =3D addr >> 2;
+
+    /* The only wo register is IBEX_LC_CTRL_ALERT_TEST, let's skip it */
+    switch (addr) {
+    case IBEX_CTRL_STATUS...IBEX_LC_CTRL_MANUF_STATE_7:
+        reg_val =3D s->regs[addr];
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "Bad offset 0x%" HWADDR_PRIx "\n"=
,
+                        addr << 2);
+    }
+    return reg_val;
+}
+
+static void ibex_lc_write(void *opaque, hwaddr addr,
+                                uint64_t val64, unsigned int size)
+{
+    IbexLCState *s =3D opaque;
+    uint32_t val32 =3D val64;
+
+    trace_ibex_lc_write(addr, size, val64);
+
+    /* Match reg index */
+    addr =3D addr >> 2;
+    switch (addr) {
+    /* Skipping any R/O registers */
+    case IBEX_LC_CTRL_ALERT_TEST:
+        s->regs[addr] =3D val32;
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: LC_CTRL_ALERT_TEST not supported\n", __func__=
);
+        break;
+    case IBEX_CTRL_CLAIM_TRANSITION_IF:
+        s->regs[addr] =3D val32;
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: LC_CTRL_CLAIM_TRANSITION_IF not supported\n",
+                      __func__);
+        break;
+    case IBEX_LC_CTRL_TRANSITION_CMD:
+        s->regs[addr] =3D val32;
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: LC_CTRL_TRANSITION_CMD not supported\n", __fu=
nc__);
+        break;
+    case IBEX_LC_CTRL_TRANSITION_CTRL:
+        s->regs[addr] =3D val32;
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: LC_CTRL_TRANSITION_CTRL not supported\n", __f=
unc__);
+        break;
+    case IBEX_LC_CTRL_TRANSITION_TOKEN_0...IBEX_LC_CTRL_TRANSITION_TOKEN=
_3:
+        s->regs[addr] =3D val32;
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: LC_CTRL_TRANSITION_TOKENS not supported\n",
+                      __func__);
+        break;
+    case IBEX_LC_CTRL_TRANSITION_TARGET:
+        s->regs[addr] =3D val32;
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: LC_CTRL_TRANSITION_TARGET not supported\n",
+                      __func__);
+        break;
+    case IBEX_LC_CTRL_OTP_VENDOR_TEST_CTRL:
+        s->regs[addr] =3D val32;
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: LC_CTRL_VENDOR_TEST not supported\n",
+                      __func__);
+        break;
+    default:
+        /* The remaining registers are all ro, or bad offset */
+        qemu_log_mask(LOG_GUEST_ERROR, "Bad offset 0x%" HWADDR_PRIx "\n"=
,
+                      addr << 2);
+    }
+}
+
+static const MemoryRegionOps ibex_lc_ops =3D {
+    .read =3D ibex_lc_read,
+    .write =3D ibex_lc_write,
+    /* Ibex default LE */
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
+};
+
+static const VMStateDescription vmstate_ibex =3D {
+    .name =3D TYPE_IBEX_LC_CTRL,
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, IbexLCState, IBEX_LC_NUM_REGS),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void ibex_lc_init(Object *obj)
+{
+    IbexLCState *s =3D IBEX_LC_CTRL(obj);
+
+    trace_ibex_lc_general("Ibex Life-cycle IP Init");
+
+    memory_region_init_io(&s->mmio, obj, &ibex_lc_ops, s,
+                          TYPE_IBEX_LC_CTRL, 0x1000);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
+}
+
+static void ibex_lc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    dc->realize =3D NULL;
+    dc->reset =3D ibex_lc_reset;
+    dc->vmsd =3D &vmstate_ibex;
+}
+
+static const TypeInfo ibex_lc_info =3D {
+    .name          =3D TYPE_IBEX_LC_CTRL,
+    .parent        =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size =3D sizeof(IbexLCState),
+    .instance_init =3D ibex_lc_init,
+    .class_init    =3D ibex_lc_class_init,
+};
+
+static void ibex_lc_register_types(void)
+{
+    type_register_static(&ibex_lc_info);
+}
+
+type_init(ibex_lc_register_types)
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 95268eddc0..581d91be15 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -138,3 +138,6 @@ specific_ss.add(when: 'CONFIG_SBSA_REF', if_true: fil=
es('sbsa_ec.c'))
=20
 # HPPA devices
 softmmu_ss.add(when: 'CONFIG_LASI', if_true: files('lasi.c'))
+
+# IBEX Devices
+softmmu_ss.add(when: 'CONFIG_IBEX', if_true: files('ibex_lc_ctrl.c'))
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index c18bc0605e..5996d6ef8d 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -274,3 +274,8 @@ virt_ctrl_instance_init(void *dev) "ctrl: %p"
 lasi_chip_mem_valid(uint64_t addr, uint32_t val) "access to addr 0x%"PRI=
x64" is %d"
 lasi_chip_read(uint64_t addr, uint32_t val) "addr 0x%"PRIx64" val 0x%08x=
"
 lasi_chip_write(uint64_t addr, uint32_t val) "addr 0x%"PRIx64" val 0x%08=
x"
+
+# ibex_lc_ctrl.c
+ibex_lc_general(const char *msg) "%s"
+ibex_lc_write(uint64_t addr, uint32_t size, uint64_t data) "@0x%" PRIx64=
 " size %u: 0x%" PRIx64
+ibex_lc_read(uint64_t addr, uint32_t size) "@0x%" PRIx64 " size %u:"
diff --git a/include/hw/misc/ibex_lc_ctrl.h b/include/hw/misc/ibex_lc_ctr=
l.h
new file mode 100644
index 0000000000..883a52002a
--- /dev/null
+++ b/include/hw/misc/ibex_lc_ctrl.h
@@ -0,0 +1,121 @@
+/*
+ * QEMU model of the Ibex Life Cycle Controller
+ * SPEC Reference: https://docs.opentitan.org/hw/ip/lc_ctrl/doc/#registe=
r-table
+ *
+ * Copyright (C) 2022 Western Digital
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
+ * of this software and associated documentation files (the "Software"),=
 to deal
+ * in the Software without restriction, including without limitation the=
 rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or =
sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be includ=
ed in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S IN
+ * THE SOFTWARE.
+ */
+#ifndef IBEX_LC_CTRL_H
+#define IBEX_LC_CTRL_H
+
+#include "hw/sysbus.h"
+#include "hw/hw.h"
+#include "hw/ssi/ssi.h"
+#include "qemu/fifo8.h"
+#include "qom/object.h"
+#include "hw/registerfields.h"
+#include "qemu/timer.h"
+
+#define TYPE_IBEX_LC_CTRL "ibex-lc"
+#define IBEX_LC_CTRL(obj) \
+    OBJECT_CHECK(IbexLCState, (obj), TYPE_IBEX_LC_CTRL)
+
+/* LC Registers */
+#define IBEX_LC_CTRL_ALERT_TEST                      (0x00 / 4) /* wo */
+#define IBEX_CTRL_STATUS                             (0x04 / 4) /* ro */
+#define IBEX_CTRL_CLAIM_TRANSITION_IF                (0x08 / 4) /* rw */
+#define IBEX_LC_CTRL_TRANSITION_REGWEN               (0x0C / 4) /* ro */
+#define IBEX_LC_CTRL_TRANSITION_CMD                  (0x10 / 4) /* r0w1c=
 */
+#define IBEX_LC_CTRL_TRANSITION_CTRL                 (0x14 / 4) /* rw1s*=
/
+#define IBEX_LC_CTRL_TRANSITION_TOKEN_0              (0x18 / 4) /* rw */
+#define IBEX_LC_CTRL_TRANSITION_TOKEN_1              (0x1C / 4) /* rw */
+#define IBEX_LC_CTRL_TRANSITION_TOKEN_2              (0x20 / 4) /* rw */
+#define IBEX_LC_CTRL_TRANSITION_TOKEN_3              (0x24 / 4) /* rw */
+#define IBEX_LC_CTRL_TRANSITION_TARGET               (0x28 / 4) /* rw */
+#define IBEX_LC_CTRL_OTP_VENDOR_TEST_CTRL            (0x2C / 4) /* rw */
+#define IBEX_LC_CTRL_OTP_VENDOR_TEST_STATUS          (0x30 / 4) /* ro */
+#define IBEX_LC_CTRL_LC_STATE                        (0x34 / 4) /* ro */
+#define IBEX_LC_CTRL_LC_TRANSITION_CNT               (0x38 / 4) /* ro */
+#define IBEX_LC_CTRL_LC_ID_STATE                     (0x3C / 4) /* ro */
+#define IBEX_LC_CTRL_HW_REV                          (0x40 / 4) /* ro */
+#define IBEX_LC_CTRL_DEVICE_ID_0                     (0x44 / 4) /* ro */
+#define IBEX_LC_CTRL_DEVICE_ID_1                     (0x48 / 4) /* ro */
+#define IBEX_LC_CTRL_DEVICE_ID_2                     (0x4C / 4) /* ro */
+#define IBEX_LC_CTRL_DEVICE_ID_3                     (0x50 / 4) /* ro */
+#define IBEX_LC_CTRL_DEVICE_ID_4                     (0x54 / 4) /* ro */
+#define IBEX_LC_CTRL_DEVICE_ID_5                     (0x58 / 4) /* ro */
+#define IBEX_LC_CTRL_DEVICE_ID_6                     (0x5C / 4) /* ro */
+#define IBEX_LC_CTRL_DEVICE_ID_7                     (0x60 / 4) /* ro */
+#define IBEX_LC_CTRL_MANUF_STATE_0                   (0x64 / 4) /* ro */
+#define IBEX_LC_CTRL_MANUF_STATE_1                   (0x68 / 4) /* ro */
+#define IBEX_LC_CTRL_MANUF_STATE_2                   (0x6C / 4) /* ro */
+#define IBEX_LC_CTRL_MANUF_STATE_3                   (0x70 / 4) /* ro */
+#define IBEX_LC_CTRL_MANUF_STATE_4                   (0x74 / 4) /* ro */
+#define IBEX_LC_CTRL_MANUF_STATE_5                   (0x78 / 4) /* ro */
+#define IBEX_LC_CTRL_MANUF_STATE_6                   (0x7C / 4) /* ro */
+#define IBEX_LC_CTRL_MANUF_STATE_7                   (0x80 / 4) /* ro */
+
+/*  Max Register (Based on addr) */
+#define IBEX_LC_NUM_REGS           (IBEX_LC_CTRL_MANUF_STATE_7 + 1)
+
+/*
+ * Lifecycle States
+ * These are magic values that set particular system state
+ * See here: https://docs.opentitan.org/hw/ip/lc_ctrl/doc/#Reg_lc_state
+ */
+/* Unlocked test state where debug functions are enabled. */
+#define LC_STATE_RAW                0x00000000
+#define LC_STATE_TEST_UNLOCKED0     0x02108421
+#define LC_STATE_TEST_LCOKED0       0x04210842
+#define LC_STATE_TEST_UNLOCKED1     0x06318c63
+#define LC_STATE_TEST_LOCKED1       0x08421084
+#define LC_STATE_TEST_UNLOCKED2     0x0a5294a5
+#define LC_STATE_TEST_LOCKED2       0x0c6318c6
+#define LC_STATE_TEST_UNLOCKED3     0x0e739ce7
+#define LC_STATE_TEST_LOCKED3       0x10842108
+#define LC_STATE_TEST_UNLOCKED4     0x1294a529
+#define LC_STATE_TEST_LOCKED4       0x14a5294a
+#define LC_STATE_TEST_UNLOCKED5     0x16b5ad6b
+#define LC_STATE_TEST_LOCKED5       0x18c6318c
+#define LC_STATE_TEST_UNLOCKED6     0x1ad6b5ad
+#define LC_STATE_TEST_LOCKED6       0x1ce739ce
+#define LC_STATE_TEST_UNLOCKED7     0x1ef7bdef
+#define LC_STATE_DEV                0x21084210
+#define LC_STATE_PROD               0x2318c631
+#define LC_STATE_PROD_END           0x25294a52
+#define LC_STATE_RMA                0x2739ce73
+#define LC_STATE_SCRAP              0x294a5294
+#define LC_STATE_POST_TRANSITION    0x2b5ad6b5
+#define LC_STATE_ESCALATE           0x2d6b5ad6
+#define LC_STATE_INVALID            0x2f7bdef7
+
+
+typedef struct {
+    /* <private> */
+    SysBusDevice parent_obj;
+
+    /* <public> */
+    MemoryRegion mmio;
+    uint32_t regs[IBEX_LC_NUM_REGS];
+
+} IbexLCState;
+
+
+#endif
--=20
2.37.3


