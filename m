Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22A0C61DB9
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 21:25:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wyycx-0003l3-IK; Tue, 25 Aug 2026 17:24:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wyycv-0003ge-II
 for qemu-riscv@nongnu.org; Tue, 25 Aug 2026 17:24:13 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wyyct-0002LJ-LU
 for qemu-riscv@nongnu.org; Tue, 25 Aug 2026 17:24:13 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67PLA1QU2605132
 for <qemu-riscv@nongnu.org>; Tue, 25 Aug 2026 21:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=HeOItTZvILg
 yY+ctPuYqKhbG6qTTQsbkyGXvY2Arifc=; b=njkXKCsvaZaoFNj4clVtVcQX0A5
 CftkxRe0Q1O8W8bH01EM6HYO+CBpvBmBhHf7hf5rUMSbiW/JbjneSs+6CKkFsVzY
 wd4E21ythMSMIC8yMVOtHf4hisisaNUFT+060oRudqthzLlJET6WOWa/ucm+FX55
 OXGbRnY5sWfr6kRAIjhTXVPZbpIlQksRzkBBI4oiWLB/yXezOcDH6VlrG4FX1UUU
 O3pXYiARupcplF0klZYSTxLGjob1wbTEtufS73Geiz1Yz6FqUu4bu6hnJvTCKsgb
 hHKRS4YkGETMxgZNYi+e2FD+7GxlyChSIIS33gUffmmndmMPNEo9pJ2Yg3A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g98hp2svm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 25 Aug 2026 21:24:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-5174a236220so66611cf.3
 for <qemu-riscv@nongnu.org>; Tue, 25 Aug 2026 14:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787693049; x=1788297849; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HeOItTZvILgyY+ctPuYqKhbG6qTTQsbkyGXvY2Arifc=;
 b=e2uzUawYuhGY6lzkr40w2rppSlrXzRTX1SJpdU+MtJ5YjOReVHFjdn47rxWGIQzXvY
 YKIxKN9XJo2l9svSkdiVG21flsyZhKv8oKHTUk55UC4BoBqVpxFuH3RTDVvVlqnR4gGy
 V1twk4qsiRQXUNIF5MyJuN444rQ+1/0naVzTKdi4izZEFwaY73+RvDyVoppr2zdo3akA
 52bS1jvF8G8kZKl6L2PwlTnLEPa0wWkWUdiJ3nKt+ObgqFFUqoQ6QIpIIblVAH6aNP0X
 XfBJ3XbR5Xd/EQeuJN/5QUaN1hSsMPR+hwWkCcHhfhi1lbGP7hb7nvlLQHze++WdVdPe
 7INA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787693049; x=1788297849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=HeOItTZvILgyY+ctPuYqKhbG6qTTQsbkyGXvY2Arifc=;
 b=cuRt8kARNBT3XH/a2qSi3I5UaZhQEDVXBgR6AZBhUmpRhDPhCz33LV0oq52JdI4UQJ
 OVmDe1hqhmcPpO3TfLVPAU6XU9aJzoj8xs8YXgZ6XQrLk95AAPd56ownpBobfTCun4PJ
 3dFqLUU62mFsJzOd8LJV43265H5MpVau/QUsRYrqouK01I34Q8iBEz/Ks5dKbc7o7RSS
 jTjKVGz5/xW9vUnqqKH3KDXW35KukfQoITUebIC7LQtwhhWPQbynC+OjGGXKue6yEUhB
 U0H2ACvuZWmenSctKymrXXAmm1ddA3V/MUGGaBQ2OA2WYDYIDtyVz0LrG/y+UlQErlm4
 NSZg==
X-Gm-Message-State: AFuF++n8+vQ67ykODx0gLhq2GMT8vWd+SVLVwKvC9hYapPd4ff0YfQx9
 Z+wZ8VdLkAXCNbmA1Qv1zANXnaQdvQ1O5+T0bjTnhx+Tfeu6ChA+KAsyctujABzeHmO7Ah6LnDS
 +p2L0jg/b82UsM+BsiL0Fuie11CoLtamD7jagzvECoX+1TB4wJa5mXi0Jvg==
X-Gm-Gg: AR+sD12olIDNP+ox+gqacdgylVA06y1hTS+TknVl6jmVlGcTYVNmX+ptn5rjswU79qA
 PgUMieeWZDhguxNAm2hdlqGKNp0zTUSG+itfi00WD6W6o68LtqxREti+3aaIoZiQq2qIved3vh5
 0LNayJh3DtHj+PnrEF5grSjdDdeuCCiEmtOlPuioPMn4afBYPhGMrmmnHXnhHLbTeyaxh0zxUx4
 X9LTlhW4qL2Cht7TW8iSOd9VLTLXqpi2F5H6Tn4yhq++xsG2ea65l7Ad4f1auzhq9lRJGUpY44E
 TsZpeQ0jgMZcbGExF5NhHMeAjToTSehxgKB6j9uKCkt4uDPC6bSHkT61SKXUAuTRV10BMy5U0fb
 x0kOQ3TA0DmDjnsI2hfzoQLCXylF6/fBu3EgrvA==
X-Received: by 2002:a05:622a:82:b0:51e:e5a2:ac82 with SMTP id
 d75a77b69052e-52e4230bf05mr19956631cf.23.1787693049180; 
 Tue, 25 Aug 2026 14:24:09 -0700 (PDT)
X-Received: by 2002:a05:622a:82:b0:51e:e5a2:ac82 with SMTP id
 d75a77b69052e-52e4230bf05mr19956041cf.23.1787693048590; 
 Tue, 25 Aug 2026 14:24:08 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90cc65299f0sm8646386d6.41.2026.08.25.14.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 14:24:08 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 10/13] hw/riscv/device-common,
 virt.c: add create_platform_bus()
Date: Tue, 25 Aug 2026 18:23:22 -0300
Message-ID: <20260825212326.1907-11-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825212326.1907-1-daniel.barboza@oss.qualcomm.com>
References: <20260825212326.1907-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: LfdJXaJuG4mC4FwtJVsozgdex0Oo6fgC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDE4MiBTYWx0ZWRfX6MX92k+kpfaY
 Zp5fN2glMjCff+YJub7B0R+WFKyJE4RjZYrEpZYaQQJMxg2drexRiZdlu3RXqr+juUUT1JNRlDa
 4+vbAUm5pMRKpp7RDkZGSTKfnIv7/zTwBfYI/ZrKdH1+rgvD5jyht45T/qai+7UPp0+QbkzCTf+
 eFVtcUmhRvAGHjF8aFXnJu0oYbDN70inoW72XjfAXpcLsOhhsGLwnHBabuN3rasD5zQ+nZTxpcV
 0SmhBqQM3wPOONsfr6lsdwQUMM3+93v+d2EHyOWnOFtD3XYlKhdOgjlxMXkbfsIjfrt8XBuXV5R
 tEt9ET+AA4S2vpxgUbrW9wiy8jZVAQ8pM0YWxeB/TOurgQsiyKCeN3E1Hm0HBugm9XKUndC4fmU
 DUan2k2jJqY4tlgM26PxHbt377icqfBTQkHKIEkwUJf3RlZya5Ie/vMJw0ondWLuVE7UZUhgZYf
 udPu4N6y19LC4xaiRfg==
X-Authority-Analysis: v=2.4 cv=B7CJFutM c=1 sm=1 tr=0 ts=6a8e07fa cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=8qX1o8pqpDL_2YrQefAA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: LfdJXaJuG4mC4FwtJVsozgdex0Oo6fgC
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDE4MiBTYWx0ZWRfXxFWu1AVJUWsO
 4RJ09xQdy++KDVZjkWpqqmeCT/vo5MMYXNLMwx+S8SYO45CPRIpHJy73rzMjQ1WrAVZ8vGCYitn
 ePcfN1UcV0Ey2ZlT3YMdfjgn33kt6Qs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_06,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250182
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
---
 hw/riscv/device-common.c         | 48 ++++++++++++++++++++++++++++++++
 hw/riscv/meson.build             |  1 +
 hw/riscv/virt.c                  | 31 ++++-----------------
 include/hw/riscv/device-common.h | 19 +++++++++++++
 4 files changed, 73 insertions(+), 26 deletions(-)
 create mode 100644 hw/riscv/device-common.c
 create mode 100644 include/hw/riscv/device-common.h

diff --git a/hw/riscv/device-common.c b/hw/riscv/device-common.c
new file mode 100644
index 0000000000..74627b996d
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
+DeviceState *create_platform_bus(DeviceState *irqchip,
+                                 const MemMapEntry *platform_bus_mem,
+                                 int platform_bus_base_irq,
+                                 int platform_bus_num_irqs)
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
index f3c176dddc..7ecc3aeb6e 100644
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
@@ -661,31 +662,6 @@ static DeviceState *virt_create_plic(const MemMapEntry *memmap, int socket,
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
@@ -1006,7 +982,10 @@ static void virt_machine_init(MachineState *machine)
 
     gpex_pcie_init(system_memory, pcie_irqchip, s);
 
-    create_platform_bus(s, mmio_irqchip);
+    s->platform_bus_dev = create_platform_bus(mmio_irqchip,
+                                              &s->memmap[VIRT_PLATFORM_BUS],
+                                              VIRT_PLATFORM_BUS_IRQ,
+                                              VIRT_PLATFORM_BUS_NUM_IRQS);
 
     serial_mm_init(system_memory, s->memmap[VIRT_UART0].base,
         0, qdev_get_gpio_in(mmio_irqchip, UART0_IRQ), 399193,
diff --git a/include/hw/riscv/device-common.h b/include/hw/riscv/device-common.h
new file mode 100644
index 0000000000..f91c39511f
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
+DeviceState *create_platform_bus(DeviceState *irqchip,
+                                 const MemMapEntry *platform_bus_mem,
+                                 int platform_bus_base_irq,
+                                 int platform_bus_num_irqs);
+#endif
-- 
2.43.0


