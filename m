Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E02C61DBE
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 21:48:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzLSv-0003Ri-Aj; Wed, 26 Aug 2026 17:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzLSu-0003QP-DH
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 17:47:24 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzLSs-0001Oi-Cm
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 17:47:24 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67QKdXtr1464191
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 21:47:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 E9Nf8GXBL8IYlGt6bgTxeDRqCmUcg58k3xHk7KkaYdg=; b=l95MpkPM6RF1U7q5
 Yy/FsmjS9AFYBvuOKZ5cODSEJpGFmkV+0iG1kFboqYRyVzPyBZmhHHpISI61o2w9
 xG6wGuqIaaseh1qnm31TQTdcB9ouWsEtuU7UM/qKFrNoivYQL4/zhl90TxDPc3P0
 7Z4eYIQ+W5IOlXqEssLuiOWRpnwkWBW+UdMpwpRyqhJScmpL/TrJrwbJvVw4r7eR
 E7oX8BQBGLR3KnTLtRWJA5qEngghjBoVIDzzY1OKVmVoUrJqbim69jm/HQxTwqsj
 zhBdsu1C2jCk3KO1s2tb4c31XnvBZgxUkj3S/kS/iGNLwcsoxH+PCzSE/bQc4KUD
 azBnrQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga4fwgwy6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 21:47:21 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8eac2620cb0so16857146d6.3
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 14:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787780841; x=1788385641; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=E9Nf8GXBL8IYlGt6bgTxeDRqCmUcg58k3xHk7KkaYdg=;
 b=OzkEnNvKOuQRYGoG+0ysTviSkX3a8l9NHvNZnS6n5O9Le1R9udbmnF5Jt6nsUyYibu
 G+uzAolyRed8j3JITocxjEampOGnCsj7DLMF03LQSYuEjC76yGnbYl2rrONHDl1QR2kx
 J/FIxJiffai7GfF3yUTrx90HosCaRKNsmfaFL82tWpQv9G16tIXPsgafFU7qsuc2TaeA
 kE52a8bHZT24WdD/wPsxQjOXsePkl5FXnBKW/4qVGnT8D0PtL0tOvktb1eylznepHGI9
 KiMCJMHcu90wBVMMzKmSFCksFXxku1pgImJCITXxaK6wcrLEH4kTEQfcZY3TVPgdNPBq
 FX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787780841; x=1788385641;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=E9Nf8GXBL8IYlGt6bgTxeDRqCmUcg58k3xHk7KkaYdg=;
 b=mZdl2pQKtwv1e4dKdc6u6CfKBlzbPtKnnPiWcfpgf9uPFaxPpBmydfCwtlCRVSRNqG
 NLaKvgNs+xIZPTwuDcg6TcqlkW4v8gNA4W3onIiVRRDZWFcOR8/2CMrczunsELx+4vn7
 GN9pC1gS0jEGwP7P/e6rrODD5QSqltbc9YThnxNl0cM7630Wrr05lS/JYuRGxX3/uPvP
 vytTX7m/D579Eg/OUtRY+7Cct0Jwwr44sVir6/nGISJFPBHM5oL9zoIg4ic6/DHkeax8
 UHWFMFiIPhZa6uG0uU38BEloxS5N8gzkqCO7e6s16E/KurbA/d7NHAveXuLz70GZFK7h
 rkJg==
X-Gm-Message-State: AFuF++mxzUxKIuidig5xJ3pUzQHqdYLTNAd9/lPriUr8w8gnRPBOt495
 hLZi5sIhkFMTy046lazWBYLW5u/xzKNyU8jeiovwfWzzbN/sHmSZPleLysoP9agVWCpxgoMm9kv
 e3iom63/mQAi8xPR/Ef/6HcwHV1G1W1PCbyKUdlZlt3BZPCYaohkN3VD4yA==
X-Gm-Gg: AR+sD13JqXTscHtNByU1UhHAg3LrHonE94xNzYENWCUW1YdSyzM1yrNtNH7BXd168Z/
 5IPmye/kPbeaUOPg4AYSdf5e0hYAmhnBa4a0gPxW5pBmR2gcJsPZVUe6RPbB/4Sa7psWds0XRj6
 OmM2hkcwoZSt1O18MKzYbfBfMuMuaBrcWhFGsbhcFUgO7KYqfJapjbUIH7p7SGjICQvKj0/HJrW
 QDHr8zAg76dsCyKyrM8nKnEN1x8PQztsyTNM0ur6KItz5+8P4TvcnXKu/VDaCnrjH6iEzKJjGKl
 Q2kghs9DulUGM9KFKmLTe9rfZRaifVVG17s79AV6hw9h9Cpct8PMVmat/bUbhker2iq/CdrBmz5
 h72kAcid+JPtKsLzj8da39pNPhuBdaaIcDKTGtw==
X-Received: by 2002:a05:6214:dcb:b0:90c:ae98:20d2 with SMTP id
 6a1803df08f44-90cc790a6c0mr99241956d6.23.1787780840797; 
 Wed, 26 Aug 2026 14:47:20 -0700 (PDT)
X-Received: by 2002:a05:6214:dcb:b0:90c:ae98:20d2 with SMTP id
 6a1803df08f44-90cc790a6c0mr99241496d6.23.1787780840330; 
 Wed, 26 Aug 2026 14:47:20 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90cd73e4117sm490916d6.24.2026.08.26.14.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 14:47:19 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v3 11/14] hw/riscv/device-common,
 virt.c: add riscv_create_platform_bus()
Date: Wed, 26 Aug 2026 18:46:39 -0300
Message-ID: <20260826214643.122728-12-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826214643.122728-1-daniel.barboza@oss.qualcomm.com>
References: <20260826214643.122728-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SRVJ-hmJG7J_k2ZL6P7MyyCU-t318PiE
X-Authority-Analysis: v=2.4 cv=OtZ/DS/t c=1 sm=1 tr=0 ts=6a8f5ee9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=aH2Wc4Ua3Gm2Ww6jc38A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: SRVJ-hmJG7J_k2ZL6P7MyyCU-t318PiE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE4MyBTYWx0ZWRfX8p4VQIOMuofH
 wvpIkk8cP7DKzLHujWhbNzc05bzAxukdakOqbpxgC8+wfcFjAGVfADms1WcZkNVgrGi9EoYDLBV
 GvHexuYkAKGzs5gtwFxr8OmzCkuQIltE5CBDcDoBDALawdr03IAjQx0376IvzN7Oj3q/QI1uQuz
 Jq9Wz3b+vPzTz+5M8nXhGo+eMQ9bmXRRPtdPuox7ht3OV+GmkMhVHV/n7wwcQ79T5ClcR8H87Y/
 +3bXrm2N+xKDP1fK+fHBJzetR8QNcveaOlTOC4iSFlwPTQtNNuCQb3TyAN/QmSMT4R6tjXci1n6
 2S5dfBoexboj8+Nt/Z0tjPqSQ7AwmVdvaQDn6gh+pwdjzPfQLo65n9tqiTR1OZ6nVliQ3OH5CuI
 67OIt7EgDBITUIQ3Nvz/4J1AspB7TGr68+K9UGJGit8LpulAE+6ug+bNkVXwF/7DBCnG90e0F50
 AGQEh+X9XsILL1frB9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE4MyBTYWx0ZWRfX1pC71430ZO/t
 hQl8tQeGkBU2ttnZf5erNt/uGt+XSNnG0sX1ylKoY+7wNgEf3ffgLW535OSEhI7Izp708pJ/z4q
 5k19uCVcRrKUIAt8oUIh0riycguB6tI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_06,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260183
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

There will be code repetition instances added by the 'riscv-server-ref'
board w.r.t device creation and initialization.  Instead of waiting for
that code to land we're adding helpers beforehand.  The idea is to make
the new board code shorter and more palatable for reviewers.

A new 'device-common' file is created for such helpers.  We'll start
with the platform bus, a nice piece of software that only the 'virt'
board uses so far, and the 'riscv-server-ref' will use to support TPM
devices.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/riscv/device-common.c         | 48 ++++++++++++++++++++++++++++++++
 hw/riscv/meson.build             |  1 +
 hw/riscv/virt.c                  | 30 +++-----------------
 include/hw/riscv/device-common.h | 19 +++++++++++++
 4 files changed, 72 insertions(+), 26 deletions(-)
 create mode 100644 hw/riscv/device-common.c
 create mode 100644 include/hw/riscv/device-common.h

diff --git a/hw/riscv/device-common.c b/hw/riscv/device-common.c
new file mode 100644
index 0000000000..d3c68a9e71
--- /dev/null
+++ b/hw/riscv/device-common.c
@@ -0,0 +1,48 @@
+/*
+ * RISC-V board helpers for FDT generation.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+
+#include "hw/riscv/device-common.h"
+
+#include "hw/core/platform-bus.h"
+#include "hw/core/qdev.h"
+#include "hw/core/qdev-properties.h"
+#include "hw/core/sysbus.h"
+#include "qapi/error.h"
+#include "system/address-spaces.h"
+#include "system/memory.h"
+
+
+DeviceState *riscv_create_platform_bus(DeviceState *irqchip,
+                                       const MemMapEntry *platform_bus_mem,
+                                       int platform_bus_base_irq,
+                                       int platform_bus_num_irqs)
+{
+    MemoryRegion *sysmem = get_system_memory();
+    DeviceState *dev;
+    SysBusDevice *sysbus;
+
+    dev = qdev_new(TYPE_PLATFORM_BUS_DEVICE);
+    dev->id = g_strdup(TYPE_PLATFORM_BUS_DEVICE);
+    qdev_prop_set_uint32(dev, "num_irqs", platform_bus_num_irqs);
+    qdev_prop_set_uint32(dev, "mmio_size", platform_bus_mem->size);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+
+    sysbus = SYS_BUS_DEVICE(dev);
+    for (int i = 0; i < platform_bus_num_irqs; i++) {
+        int irq = platform_bus_base_irq + i;
+        sysbus_connect_irq(sysbus, i, qdev_get_gpio_in(irqchip, irq));
+    }
+
+    memory_region_add_subregion(sysmem,
+                                platform_bus_mem->base,
+                                sysbus_mmio_get_region(sysbus, 0));
+
+    return dev;
+}
diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
index 0d82ceacc4..7aa3c1578d 100644
--- a/hw/riscv/meson.build
+++ b/hw/riscv/meson.build
@@ -1,6 +1,7 @@
 riscv_ss = ss.source_set()
 riscv_ss.add(files('aia.c'))
 riscv_ss.add(files('boot.c'))
+riscv_ss.add(files('device-common.c'))
 riscv_ss.add(files('fdt-common.c'))
 riscv_ss.add(when: 'CONFIG_RISCV_NUMA', if_true: files('numa.c'))
 riscv_ss.add(files('riscv_hart.c'))
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 9287edb96a..8ffe8ae538 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -35,6 +35,7 @@
 #include "hw/riscv/riscv-iommu-bits.h"
 #include "hw/riscv/virt.h"
 #include "hw/riscv/boot.h"
+#include "hw/riscv/device-common.h"
 #include "hw/riscv/fdt-common.h"
 #include "hw/riscv/machines-qom.h"
 #include "hw/riscv/numa.h"
@@ -669,31 +670,6 @@ static DeviceState *virt_create_plic(const MemMapEntry *memmap, int socket,
              memmap[VIRT_PLIC].size);
 }
 
-static void create_platform_bus(RISCVVirtState *s, DeviceState *irqchip)
-{
-    DeviceState *dev;
-    SysBusDevice *sysbus;
-    int i;
-    MemoryRegion *sysmem = get_system_memory();
-
-    dev = qdev_new(TYPE_PLATFORM_BUS_DEVICE);
-    dev->id = g_strdup(TYPE_PLATFORM_BUS_DEVICE);
-    qdev_prop_set_uint32(dev, "num_irqs", VIRT_PLATFORM_BUS_NUM_IRQS);
-    qdev_prop_set_uint32(dev, "mmio_size", s->memmap[VIRT_PLATFORM_BUS].size);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    s->platform_bus_dev = dev;
-
-    sysbus = SYS_BUS_DEVICE(dev);
-    for (i = 0; i < VIRT_PLATFORM_BUS_NUM_IRQS; i++) {
-        int irq = VIRT_PLATFORM_BUS_IRQ + i;
-        sysbus_connect_irq(sysbus, i, qdev_get_gpio_in(irqchip, irq));
-    }
-
-    memory_region_add_subregion(sysmem,
-                                s->memmap[VIRT_PLATFORM_BUS].base,
-                                sysbus_mmio_get_region(sysbus, 0));
-}
-
 static void virt_build_smbios(RISCVVirtState *s)
 {
     MachineClass *mc = MACHINE_GET_CLASS(s);
@@ -1014,7 +990,9 @@ static void virt_machine_init(MachineState *machine)
 
     gpex_pcie_init(system_memory, pcie_irqchip, s);
 
-    create_platform_bus(s, mmio_irqchip);
+    s->platform_bus_dev = riscv_create_platform_bus(mmio_irqchip,
+        &s->memmap[VIRT_PLATFORM_BUS], VIRT_PLATFORM_BUS_IRQ,
+        VIRT_PLATFORM_BUS_NUM_IRQS);
 
     serial_mm_init(system_memory, s->memmap[VIRT_UART0].base,
         0, qdev_get_gpio_in(mmio_irqchip, UART0_IRQ), 399193,
diff --git a/include/hw/riscv/device-common.h b/include/hw/riscv/device-common.h
new file mode 100644
index 0000000000..12af031bbf
--- /dev/null
+++ b/include/hw/riscv/device-common.h
@@ -0,0 +1,19 @@
+/*
+ * RISC-V board helpers for FDT generation.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef RISCV_DEVICE_COMMON_H
+#define RISCV_DEVICE_COMMON_H
+
+#include "exec/hwaddr.h"
+#include "hw/core/qdev.h"
+
+DeviceState *riscv_create_platform_bus(DeviceState *irqchip,
+                                       const MemMapEntry *platform_bus_mem,
+                                       int platform_bus_base_irq,
+                                       int platform_bus_num_irqs);
+#endif
-- 
2.43.0


