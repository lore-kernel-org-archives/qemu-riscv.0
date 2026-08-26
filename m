Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4528C61DBD
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 16:50:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzGoH-0006UF-VE; Wed, 26 Aug 2026 12:49:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzGoG-0006Q3-00
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 12:49:08 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzGoE-0000wx-7t
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 12:49:07 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67QDutVL910360
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 16:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=zik9fMnwPW+
 cjZ1etBvvnJ0/y9M6axxZ9bmNknOgDGA=; b=F+UIaS6UfJ+4/bXKxYavJjZocez
 tAZzRoLHy45mhYs7iwozxCg7IfjprUIzI/a4ivxBKLapQMcK9tVykU/blbcDvNcI
 Y6+0SJAbdGvBVzSSgaLeLG4CGCTTvqBmgVU1QUpX8YrIMxn8W9O0wOkPzrKKZB+U
 zszq68B5TtqAYOyCdsgDftW5AhfwZMO5N7y2jkJMoG+kulBoDuJHvYOKjR28JU2Y
 SnxUyyBM0GT3r8cX72FtLQ/I0C2ow2Jgs+qNyRvsiIQ2vaxvkEK/q05jlN1fyO4W
 xRpqv7JdY+i9oIEsYjvVl2Z6c7cx6QNNRawGk5XZ8GSS4phd7978j10J0eA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga03a93ex-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 16:48:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-52f52ccd459so6408901cf.1
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 09:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787762934; x=1788367734; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zik9fMnwPW+cjZ1etBvvnJ0/y9M6axxZ9bmNknOgDGA=;
 b=jEjJxuaPfga5fLAP0ptSOxeUBzXYhfPYA2Rys00HcuCTJW4WE2u/VtLsMEPiYwzcEX
 4vDpHnLxspWAH6TK46zQ+z2PowoitqPwVN+iYOtlSm8o19g+0U4vSdCppgSZX0+BIf/P
 vBYw08ZJDvfbXnVRuLD/eGYUXutwIlNSXtcWtcw28SKaj6ZbQcrINcX1pF2fM+emZFNf
 J/09Jqd2HPRg9WmKURJ5vQRx5cwv5UsfHlsk64X6aopTGM92pb229sJgXRx5dIrJSLE1
 1U4RG+gxUTi6g0hs06Y7nPoB1hFb/LsDq8PcySUU8y+vHPcTuz6pXSIdm8aPG1zLYygs
 G18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787762934; x=1788367734;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=zik9fMnwPW+cjZ1etBvvnJ0/y9M6axxZ9bmNknOgDGA=;
 b=Mip+WAFrfpEjgEhhUQGaaWLRmMcvaFF6VmLgn1JSNDF9DNnjVXTw9/I5bQwcc5s58A
 emoE48koUIyRqppDSWA3a3TL2x0pG1msCFL3PMXDo1zCV/QXJJknEUGgQIXhcQ4xj3B4
 +aWNYP2s9pi5G4Fj4bP7+EMYmHnY2n+W3dtLH4v/p1UpuYm/srZmTM/neFThUZzCx01y
 B5zCMk7KILu3myeVEfpY2mjbGdXHFdbaLFNZQah45PimqM8+8IvYa7grMudil7qUHoQv
 9tjbpLFoveYGeMOW8nnANc6lHgLHG6hDw5/lBT0qPPxl8j9p7R6Z+XzDYeNn+lndCGe5
 uDBA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrRULjR+oHqybHHVvaDYJjoor3jkZdGLN8uD7P7tHCVzqtFUArub3bVgsm2dq3HalgSKArWJhmIBAuu@nongnu.org
X-Gm-Message-State: AFuF++ljS2wTsTnHxooT1zNcLzSCrZF5GExkbU1abtUoluOyrDaxx58w
 LT7NsVt4NXsGeS4radl8RjyAtQ2LeCKwyaW4KTO+kl5wZHLwgqOSucAo7kGfvwLpOdPdg/Y58hp
 zXQxt4ie+D8Z8oYgVpjjEHHSN172WVDwwCyYUXFx4WcT3CzAQJ0YQakTCBPkfJ7nrmw==
X-Gm-Gg: AR+sD12hKYUssE7ybEpKsnnNjferdv3XBd4aCsZk5N+7dJQcTH/6JUkSTVI3mBFGHV8
 gMEKGnQJAGsGYHBKHhUZWN+gQNsZH7fTpBunCLYbt/N12Taz0NoEwSFqSEHAcqtnfU1VrzMmbqV
 QaAKt3oGZO4lwoKt+q6Wrb5YbRZlpi1gDXcNQN4C+OJ5CQzNeav16mbEfU3s7x6awB8XaRqMsJZ
 tuiSP/staBfu5F37oRYWmhurUl/USgZKctviSo1UcLr5DEowra6J7BLFPfm5y0GaL7Ml0TY4wQF
 bJaXJ7iH0qcySONU7WcXwxgNzK7dsqi5LG3N6V4v4Ocp8JE0Z6A9qlyCnZdEFKZK7xtxlS4scIV
 p+bkOJ7C6pZocWQz6SVOB/9U3hAT7OfFhsod1Dw==
X-Received: by 2002:a05:622a:5d1:b0:52d:92c1:b7b2 with SMTP id
 d75a77b69052e-52e4228f2fbmr76381271cf.2.1787762933924; 
 Wed, 26 Aug 2026 09:48:53 -0700 (PDT)
X-Received: by 2002:a05:622a:5d1:b0:52d:92c1:b7b2 with SMTP id
 d75a77b69052e-52e4228f2fbmr76380921cf.2.1787762933396; 
 Wed, 26 Aug 2026 09:48:53 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-52e4275fc3esm20092651cf.25.2026.08.26.09.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 09:48:52 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v2 12/13] hw/riscv/device-common, virt.c: add gpex_pcie_init()
Date: Wed, 26 Aug 2026 13:48:12 -0300
Message-ID: <20260826164814.44335-13-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826164814.44335-1-daniel.barboza@oss.qualcomm.com>
References: <20260826164814.44335-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9n4zS0lRcEz8BNE0PUoTNRicp6dTTH_Q
X-Authority-Analysis: v=2.4 cv=VdLH+lp9 c=1 sm=1 tr=0 ts=6a8f18f7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=i57S3HUJNi793Ni1t6cA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 9n4zS0lRcEz8BNE0PUoTNRicp6dTTH_Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0MCBTYWx0ZWRfX6Fr95v0vVSMw
 REimLPFBcQlnKzR/LS65udKLbDMOH3tMfdJmhr7mRacf/1dSdlL1QsiZhC71dMDLiYy7QU68Smf
 gYYm1dw5iMy4CIVCcInel4shNAQjtK2URuZCRKP020DOpyWmK64hUK6pZQwy8fq6J4E2ACQIy5A
 UExDLSmZOiCmpOtqvX2DbXwMkanCDFEM+Ai89qrm9vb6EYYdaRKNu4EO6h+dXEDu2UnLxEN81RD
 4My56rdfwkqCeYhAUyrMmo+/0T8bSvBWSRp6NK0uL0R3NZUuSHm8HRh+yjH7z1M6w3HCV2dXxqL
 QjqYxztFv3wtqjH8k/TmhpqbS5kX7oR4DGQtC2a6ZdibuH+l19sVO/0CaUrEwASOZbCNa37ailm
 zxp6eJGS5sJ+Ma3NU0mXvP0M2X+y25XxLS1mmw8swJe/ZuSjoSZoa0QXCMrGnE1S9Bt0szkBPLu
 /rkrA7nuVx8otQ0Kquw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0MCBTYWx0ZWRfX1ZVdONfgBObG
 QY73f9e6u8nnFoY6oh7o1QVBG1eTHSL69MqC+a9jPDFjmFC0IZ5HYE0KbF2HbcbI/vxkt/wsFnV
 r1J4BGoX+Yr+460zq5DqDvwIkXKUGHQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260140
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

The GPEX_HOST initialization in 'virt' can be moved to device-common.c
and be re-used later for other boards, namely the future
'riscv-server-ref' emulation.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/device-common.c         | 76 +++++++++++++++++++++++++++++++
 hw/riscv/virt.c                  | 77 ++------------------------------
 include/hw/riscv/device-common.h |  7 +++
 3 files changed, 87 insertions(+), 73 deletions(-)

diff --git a/hw/riscv/device-common.c b/hw/riscv/device-common.c
index 03e85a7c86..49f6fb8dd2 100644
--- a/hw/riscv/device-common.c
+++ b/hw/riscv/device-common.c
@@ -15,6 +15,8 @@
 #include "hw/core/qdev.h"
 #include "hw/core/qdev-properties.h"
 #include "hw/core/sysbus.h"
+#include "hw/pci/pci.h"
+#include "hw/pci-host/gpex.h"
 #include "qapi/error.h"
 #include "qom/object.h"
 #include "system/address-spaces.h"
@@ -90,3 +92,77 @@ void riscv_init_flash_map(PFlashCFI01 *flash, hwaddr base, hwaddr size,
     memory_region_add_subregion(sysmem, base,
                             sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0));
 }
+
+DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
+                            DeviceState *irqchip,
+                            const MemMapEntry *pcie_ecam_mem,
+                            const MemMapEntry *pcie_mmio_mem,
+                            const MemMapEntry *high_pcie_mmio_mem,
+                            const MemMapEntry *pcie_pio_mem,
+                            int pcie_irq)
+{
+    DeviceState *dev;
+    MemoryRegion *ecam_alias, *ecam_reg;
+    MemoryRegion *mmio_alias, *high_mmio_alias, *mmio_reg;
+    hwaddr ecam_base = pcie_ecam_mem->base;
+    hwaddr ecam_size = pcie_ecam_mem->size;
+    hwaddr mmio_base = pcie_mmio_mem->base;
+    hwaddr mmio_size = pcie_mmio_mem->size;
+    hwaddr high_mmio_base = high_pcie_mmio_mem->base;
+    hwaddr high_mmio_size = high_pcie_mmio_mem->size;
+    hwaddr pio_base = pcie_pio_mem->base;
+    hwaddr pio_size = pcie_pio_mem->size;
+
+    dev = qdev_new(TYPE_GPEX_HOST);
+
+    /* Set GPEX object properties for the virt machine */
+    object_property_set_uint(OBJECT(dev), PCI_HOST_ECAM_BASE,
+                            ecam_base, NULL);
+    object_property_set_int(OBJECT(dev), PCI_HOST_ECAM_SIZE,
+                            ecam_size, NULL);
+    object_property_set_uint(OBJECT(dev), PCI_HOST_BELOW_4G_MMIO_BASE,
+                             mmio_base, NULL);
+    object_property_set_int(OBJECT(dev), PCI_HOST_BELOW_4G_MMIO_SIZE,
+                            mmio_size, NULL);
+    object_property_set_uint(OBJECT(dev), PCI_HOST_ABOVE_4G_MMIO_BASE,
+                             high_mmio_base, NULL);
+    object_property_set_int(OBJECT(dev), PCI_HOST_ABOVE_4G_MMIO_SIZE,
+                            high_mmio_size, NULL);
+    object_property_set_uint(OBJECT(dev), PCI_HOST_PIO_BASE,
+                            pio_base, NULL);
+    object_property_set_int(OBJECT(dev), PCI_HOST_PIO_SIZE,
+                            pio_size, NULL);
+
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+
+    ecam_alias = g_new0(MemoryRegion, 1);
+    ecam_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
+    memory_region_init_alias(ecam_alias, OBJECT(dev), "pcie-ecam",
+                             ecam_reg, 0, ecam_size);
+    memory_region_add_subregion(get_system_memory(), ecam_base, ecam_alias);
+
+    mmio_alias = g_new0(MemoryRegion, 1);
+    mmio_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 1);
+    memory_region_init_alias(mmio_alias, OBJECT(dev), "pcie-mmio",
+                             mmio_reg, mmio_base, mmio_size);
+    memory_region_add_subregion(get_system_memory(), mmio_base, mmio_alias);
+
+    /* Map high MMIO space */
+    high_mmio_alias = g_new0(MemoryRegion, 1);
+    memory_region_init_alias(high_mmio_alias, OBJECT(dev), "pcie-mmio-high",
+                             mmio_reg, high_mmio_base, high_mmio_size);
+    memory_region_add_subregion(get_system_memory(), high_mmio_base,
+                                high_mmio_alias);
+
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 2, pio_base);
+
+    for (int i = 0; i < PCI_NUM_PINS; i++) {
+        qemu_irq irq = qdev_get_gpio_in(irqchip, pcie_irq + i);
+
+        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, irq);
+        gpex_set_irq_num(GPEX_HOST(dev), i, pcie_irq + i);
+    }
+
+    GPEX_HOST(dev)->gpex_cfg.bus = PCI_HOST_BRIDGE(dev)->bus;
+    return dev;
+}
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 6ffafae46d..af9de36726 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -518,78 +518,6 @@ static void create_fdt(RISCVVirtState *s)
     create_fdt_pmu(s);
 }
 
-static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
-                                          DeviceState *irqchip,
-                                          RISCVVirtState *s)
-{
-    DeviceState *dev;
-    MemoryRegion *ecam_alias, *ecam_reg;
-    MemoryRegion *mmio_alias, *high_mmio_alias, *mmio_reg;
-    hwaddr ecam_base = s->memmap[VIRT_PCIE_ECAM].base;
-    hwaddr ecam_size = s->memmap[VIRT_PCIE_ECAM].size;
-    hwaddr mmio_base = s->memmap[VIRT_PCIE_MMIO].base;
-    hwaddr mmio_size = s->memmap[VIRT_PCIE_MMIO].size;
-    hwaddr high_mmio_base = virt_high_pcie_memmap.base;
-    hwaddr high_mmio_size = virt_high_pcie_memmap.size;
-    hwaddr pio_base = s->memmap[VIRT_PCIE_PIO].base;
-    hwaddr pio_size = s->memmap[VIRT_PCIE_PIO].size;
-    qemu_irq irq;
-    int i;
-
-    dev = qdev_new(TYPE_GPEX_HOST);
-
-    /* Set GPEX object properties for the virt machine */
-    object_property_set_uint(OBJECT(dev), PCI_HOST_ECAM_BASE,
-                            ecam_base, NULL);
-    object_property_set_int(OBJECT(dev), PCI_HOST_ECAM_SIZE,
-                            ecam_size, NULL);
-    object_property_set_uint(OBJECT(dev), PCI_HOST_BELOW_4G_MMIO_BASE,
-                             mmio_base, NULL);
-    object_property_set_int(OBJECT(dev), PCI_HOST_BELOW_4G_MMIO_SIZE,
-                            mmio_size, NULL);
-    object_property_set_uint(OBJECT(dev), PCI_HOST_ABOVE_4G_MMIO_BASE,
-                             high_mmio_base, NULL);
-    object_property_set_int(OBJECT(dev), PCI_HOST_ABOVE_4G_MMIO_SIZE,
-                            high_mmio_size, NULL);
-    object_property_set_uint(OBJECT(dev), PCI_HOST_PIO_BASE,
-                            pio_base, NULL);
-    object_property_set_int(OBJECT(dev), PCI_HOST_PIO_SIZE,
-                            pio_size, NULL);
-
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-
-    ecam_alias = g_new0(MemoryRegion, 1);
-    ecam_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
-    memory_region_init_alias(ecam_alias, OBJECT(dev), "pcie-ecam",
-                             ecam_reg, 0, ecam_size);
-    memory_region_add_subregion(get_system_memory(), ecam_base, ecam_alias);
-
-    mmio_alias = g_new0(MemoryRegion, 1);
-    mmio_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 1);
-    memory_region_init_alias(mmio_alias, OBJECT(dev), "pcie-mmio",
-                             mmio_reg, mmio_base, mmio_size);
-    memory_region_add_subregion(get_system_memory(), mmio_base, mmio_alias);
-
-    /* Map high MMIO space */
-    high_mmio_alias = g_new0(MemoryRegion, 1);
-    memory_region_init_alias(high_mmio_alias, OBJECT(dev), "pcie-mmio-high",
-                             mmio_reg, high_mmio_base, high_mmio_size);
-    memory_region_add_subregion(get_system_memory(), high_mmio_base,
-                                high_mmio_alias);
-
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 2, pio_base);
-
-    for (i = 0; i < PCI_NUM_PINS; i++) {
-        irq = qdev_get_gpio_in(irqchip, PCIE_IRQ + i);
-
-        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, irq);
-        gpex_set_irq_num(GPEX_HOST(dev), i, PCIE_IRQ + i);
-    }
-
-    GPEX_HOST(dev)->gpex_cfg.bus = PCI_HOST_BRIDGE(dev)->bus;
-    return dev;
-}
-
 static FWCfgState *create_fw_cfg(const MachineState *ms, hwaddr base)
 {
     FWCfgState *fw_cfg;
@@ -939,7 +867,10 @@ static void virt_machine_init(MachineState *machine)
             qdev_get_gpio_in(virtio_irqchip, VIRTIO_IRQ + i));
     }
 
-    gpex_pcie_init(system_memory, pcie_irqchip, s);
+    gpex_pcie_init(system_memory, pcie_irqchip,
+                   &s->memmap[VIRT_PCIE_ECAM], &s->memmap[VIRT_PCIE_MMIO],
+                   &virt_high_pcie_memmap, &s->memmap[VIRT_PCIE_PIO],
+                   PCIE_IRQ);
 
     s->platform_bus_dev = create_platform_bus(mmio_irqchip,
                                               &s->memmap[VIRT_PLATFORM_BUS],
diff --git a/include/hw/riscv/device-common.h b/include/hw/riscv/device-common.h
index 1cdb8ab5cc..77760e082c 100644
--- a/include/hw/riscv/device-common.h
+++ b/include/hw/riscv/device-common.h
@@ -22,4 +22,11 @@ PFlashCFI01 *riscv_flash_create(Object *parent, const char *name,
                                 int flash_sector_size);
 void riscv_init_flash_map(PFlashCFI01 *flash, hwaddr base, hwaddr size,
                           MemoryRegion *sysmem, int flash_sector_size);
+DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
+                            DeviceState *irqchip,
+                            const MemMapEntry *pcie_ecam_mem,
+                            const MemMapEntry *pcie_mmio_mem,
+                            const MemMapEntry *high_pcie_mmio_mem,
+                            const MemMapEntry *pcie_pio_mem,
+                            int pcie_irq);
 #endif
-- 
2.43.0


