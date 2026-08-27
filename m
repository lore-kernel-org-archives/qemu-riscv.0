Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10B1C61DC4
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 22:29:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wziYx-0005mS-1d; Thu, 27 Aug 2026 18:27:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wziYv-0005i9-Jj
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 18:27:09 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wziYt-0001Ks-Kf
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 18:27:09 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67RJLnOJ795072
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 22:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nyKGR9ByEDWBLOAhMhaSOKX70qpsV8Bw3hlJiUJq8Cs=; b=m+ciYOXQuvqFpkd4
 vrCBjA2BVa14O0m6h/uArov7DL3EEg2L1FQtPG45qGr6S0L8UIixE27pgqVWRlxk
 0GoDJG+i5sNsdK7WpTtvIPhu9L6j+seR1WWZ9fT62/y51fJEyJNrzk7Y1s//Kf3n
 TzllC+obB/KX2LPklrdRBI9V2ID+hkeQdijbG6EukeYJYFv3y2kYcw+Yh85Ze59O
 TcZHbUQS7kKxPsFY7F754pb+k2dlofJj5pqX0giHUdesQP0IoXpVspkG2NlMmOEq
 kgeaCEtnOFUViXw2agr9lLxCuIF5gSyD18UPCYsnJsdnEwx8xK6CHllJeio3Ytxw
 vq8GUw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gam6fjp61-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 22:26:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-936e393061dso13997285a.2
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 15:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787869616; x=1788474416; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=nyKGR9ByEDWBLOAhMhaSOKX70qpsV8Bw3hlJiUJq8Cs=;
 b=XgvWT4+94FVMoStGtdZ+TtwGnNMQJD9L7ZB8AmBere0+VkHYJUXtMxa3Tyd31Zwq3e
 FSh4V4rNFDqE/WaHYmlXny8lqGF7C00/9Jm0qB/OMU2rz+pbViKzGpe7JiJwpk1A9m6u
 hk+bHh/pKh668xZriXR/OedGtJQTqeZ8a/DKKfn/13Gy0PG+rMOw5avuv6ITp+zd2dT9
 EThUas7jkEjNxfD863p5dKvXzqk1MZI+i1uYflBAdY++HDHWIy8qL2TT76yS+DdG6kq1
 UzXNG16SpxX9mBcFYvn6E1C4o/46KpitvWJIcphIATZ5r9Neanh2smUE7YZJKzO7+P5g
 j/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787869616; x=1788474416;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=nyKGR9ByEDWBLOAhMhaSOKX70qpsV8Bw3hlJiUJq8Cs=;
 b=k7n09StvvkFB4916/fr2XZIbPsRsCxNVs1qPkVEZ1nkW3wQ7VPteK3eoI2FdsGcok0
 Z4JZ36VQbgGtJBT6/2sLld0bMRhP7hS8pMKZiPAF2wevYsc+EQYuvkvZWYvUg5DN1NTs
 PnPU+Z/+NooQIIth9xy6A+2TrD0TphJ5a5ZCQi+Q/v5QSocQukeqHjY1H5pnw36duN8l
 LqRLeP0xaZAd0RBR5/xIkAWQWn9xL+N7lisYCXmDMBmjdcBwxIlSKVcayUrjqlC5rMu8
 IUSpeUv+VhunaNe0CKbw/LOh/7SCyV4LDDJSQc8xY5VP1Biw5O2YlSs2Jx0Us1FlbDkZ
 IIcQ==
X-Gm-Message-State: AFuF++mxa5NjZZH1aZkc4vTIAF30kSNmTvRInJMF6oZdBzBfPrOye0kw
 nHFut5/eeo5tSseajGCRs5atX1XqMQPfw4ZOWYEMmWVJ/07JzOr5tVWzTBvLOf4BdKLwCPu6K5X
 nKVb5x2SGuRww5qf+GvpkXrPaumVcqTbMCuz1fBtn95n7spGseOfvXPlw6A==
X-Gm-Gg: AR+sD13x3JbraNgKfHhavXBoXhc0kc8EXG/PlwSrRt2gMwUxOqPBEOXmqnqtsMOWrNx
 i3Nhz3aihn1uqQlJmu13UF8W2cy1RdL+yUQrz9dQeXsI/hGucFHxjGKcBOI7BVW5vaC0Q+RoBh2
 2Siw21Q7fnPVEgRuRQ/IVNoIj/JbG2lldzutZO6IMvh8lSaZP4wa7wQzY6QclJBeFiSDD87nBmh
 WHIFVwpoPljvvdMMRcCoZrdAsWsBZU/EvPOU+g7CRj7X4gittGYmYGmCrLFL7smHCNOaALcFlnT
 cNFGmHZsdJD526T2WEiToPPm4MuqrCMCZeWimIsmJTcOhEBvYrbo2zvdOMMD083aKdMiHjShNdp
 MsoPg1T2iIM0ij+g0OsUiWPcy47Wwir3imajy8g==
X-Received: by 2002:a05:620a:8086:b0:939:16f6:4d01 with SMTP id
 af79cd13be357-93916f64e85mr50336985a.21.1787869615797; 
 Thu, 27 Aug 2026 15:26:55 -0700 (PDT)
X-Received: by 2002:a05:620a:8086:b0:939:16f6:4d01 with SMTP id
 af79cd13be357-93916f64e85mr50330985a.21.1787869615325; 
 Thu, 27 Aug 2026 15:26:55 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-939173a734dsm8924985a.26.2026.08.27.15.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 15:26:54 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v4 13/14] hw/riscv/device-common,
 virt.c: add riscv_gpex_pcie_init()
Date: Thu, 27 Aug 2026 19:26:06 -0300
Message-ID: <20260827222608.329788-14-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827222608.329788-1-daniel.barboza@oss.qualcomm.com>
References: <20260827222608.329788-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE5MCBTYWx0ZWRfX87MYJn+baDkU
 /YGRi+y5DvHi6ceeIUvZ9EZRTflvArMPNtxfaxEV39ziy2h/4497zBDoBY/shO46lqD0Ac8DZTe
 hp6YlkOb84vpAo+4j/67iJ+4sNaEPMI=
X-Proofpoint-GUID: NPeq2bVQdG8Y_uwdh9KWAZVyH_iWBzCL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE5MCBTYWx0ZWRfX7sU3xGslLBmC
 bX+CU9Zb2LkTY+e9EAg8I5IhTSuyIxKMrJy+fZV3VkXvDZRDG2SGG/BRfLwZ3ScIE67aeh0RxKx
 RvVbWpRXw+CZ06So/3V09dFNzF0f7WQdy18bqSZYf9dQXG29U0KFqTm3c3KjV1ybzYTCi/serc/
 bCdjrcQhnn5T5LdCtl69pdSG5GcXf0QFtYVrD5LENcbrIi925F1+NRgReIVprGSBpQrByhmv8ro
 77EQJeYNFwS/7D8e3vs0ykmRWxOvyeF6UBf5nr/sBwdaBq7HfyAWQHtp9P9Ey3Qlz9uskdIcUzD
 F0UmaGUsPtwYs/nHbUCbwifJ9/5BGrJtiS0WC8tR+QHPFOl/093Vj4hN40wEIyAsGx0NuLDtNHp
 nHReg6BEsjh/fwOLkNDA/SLC/dMuJPJImDAhRLW5UfrpEoPU+9oXYfgszQ2ymRMQXPrOAHM8h9D
 zzZQneCvZW5Htoz/pdg==
X-Authority-Analysis: v=2.4 cv=eIgjSnp1 c=1 sm=1 tr=0 ts=6a90b9b0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=i57S3HUJNi793Ni1t6cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: NPeq2bVQdG8Y_uwdh9KWAZVyH_iWBzCL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_08,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270190
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/riscv/device-common.c         | 76 +++++++++++++++++++++++++++++++
 hw/riscv/virt.c                  | 77 ++------------------------------
 include/hw/riscv/device-common.h |  7 +++
 3 files changed, 87 insertions(+), 73 deletions(-)

diff --git a/hw/riscv/device-common.c b/hw/riscv/device-common.c
index a054cd7114..d1a6814f87 100644
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
+DeviceState *riscv_gpex_pcie_init(MemoryRegion *sys_mem,
+                                  DeviceState *irqchip,
+                                  const MemMapEntry *pcie_ecam_mem,
+                                  const MemMapEntry *pcie_mmio_mem,
+                                  const MemMapEntry *high_pcie_mmio_mem,
+                                  const MemMapEntry *pcie_pio_mem,
+                                  int pcie_irq)
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
index 9ff5beae77..d75dec2dd2 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -540,78 +540,6 @@ static void create_fdt(RISCVVirtState *s)
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
@@ -963,7 +891,10 @@ static void virt_machine_init(MachineState *machine)
             qdev_get_gpio_in(virtio_irqchip, VIRTIO_IRQ + i));
     }
 
-    gpex_pcie_init(system_memory, pcie_irqchip, s);
+    riscv_gpex_pcie_init(system_memory, pcie_irqchip,
+                   &s->memmap[VIRT_PCIE_ECAM], &s->memmap[VIRT_PCIE_MMIO],
+                   &virt_high_pcie_memmap, &s->memmap[VIRT_PCIE_PIO],
+                   PCIE_IRQ);
 
     s->platform_bus_dev = riscv_create_platform_bus(mmio_irqchip,
         &s->memmap[VIRT_PLATFORM_BUS], VIRT_PLATFORM_BUS_IRQ,
diff --git a/include/hw/riscv/device-common.h b/include/hw/riscv/device-common.h
index 9f8bc67a1d..572912ec36 100644
--- a/include/hw/riscv/device-common.h
+++ b/include/hw/riscv/device-common.h
@@ -22,4 +22,11 @@ PFlashCFI01 *riscv_flash_create(Object *parent, const char *name,
                                 int flash_sector_size);
 void riscv_init_flash_map(PFlashCFI01 *flash, hwaddr base, hwaddr size,
                           MemoryRegion *sysmem, int flash_sector_size);
+DeviceState *riscv_gpex_pcie_init(MemoryRegion *sys_mem,
+                                  DeviceState *irqchip,
+                                  const MemMapEntry *pcie_ecam_mem,
+                                  const MemMapEntry *pcie_mmio_mem,
+                                  const MemMapEntry *high_pcie_mmio_mem,
+                                  const MemMapEntry *pcie_pio_mem,
+                                  int pcie_irq);
 #endif
-- 
2.43.0


