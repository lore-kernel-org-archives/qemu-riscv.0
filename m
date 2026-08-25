Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C60C61DC2
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 21:26:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wyyd0-0003nO-Vl; Tue, 25 Aug 2026 17:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wyycz-0003mr-M0
 for qemu-riscv@nongnu.org; Tue, 25 Aug 2026 17:24:17 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wyycx-0002N1-QJ
 for qemu-riscv@nongnu.org; Tue, 25 Aug 2026 17:24:17 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67PL9vn72991549
 for <qemu-riscv@nongnu.org>; Tue, 25 Aug 2026 21:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=zik9fMnwPW+
 cjZ1etBvvnJ0/y9M6axxZ9bmNknOgDGA=; b=PWdSrIAuJDQgM96F3IXQIJ4TQL8
 Z8FFBN5Zf/Ro4o80k3n04VzE0mrzkv7i5XaOaA2qcnMTrrhxJ81XojTK7e3tVViI
 N7hX10bh6/im46AUsOoo8jQFy6amTW716HpgTfNoTxC8mZ122PA1vlmPMmEVhz1w
 Dc/GMwuxe8lYL27JDcIIHc60uUAy4fTsG4HfuuTvOu+SYnV7X9io7MbHpBEkK/xQ
 GsS9dKjkMztVWyycYeVLaPj/zB7MosXaCsWUpA3x3cYMeMbaijJb6NO9vX8tcxqZ
 GNOAvbRjFdwrLXxjEAaIJ3VBjaBoRfiz6NmCXgE5bRiNjgMl+LY4BjdK3aw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9cgpspc1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 25 Aug 2026 21:24:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-52d33c89a29so3912721cf.1
 for <qemu-riscv@nongnu.org>; Tue, 25 Aug 2026 14:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787693054; x=1788297854; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zik9fMnwPW+cjZ1etBvvnJ0/y9M6axxZ9bmNknOgDGA=;
 b=c9x4Np0EU4NhTRlm7AXdaO2MfcEwgBnpXtPqn89l5Hgnz2VXkjJgPPFRpVon6YSWd1
 zKxNtAs3dYNyIT8Co00Vi1ka+4B48L1EmMEIGfwHkq9YFnsGsikkP6wrf+hLUy5Kggbp
 jYqwFhDJ/eWC1C1ffSRvueNr8HeT0IVlDCiJN1N8THD2kAiS8TF9CdS2cBmhM6mGU5ek
 PtDrd5op9Ezc/BlV+keLl0o7flgHNxismd8EW4DpTk8wAKREqCn0NphdtTsSCSm4lgOw
 eMsHYZ53iFG8d6vR4lb446yzz2ECPnPmaNOLpojWjKMkLeNmuJ0MwPRgNStIqFCe1bzb
 ypnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787693054; x=1788297854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=zik9fMnwPW+cjZ1etBvvnJ0/y9M6axxZ9bmNknOgDGA=;
 b=Cs6HzLuRFPvaMm3S0GpA4roTTB7IcDXZSwW9oIbnZmeBxIrWzRuWilvhDB+j3/l3Nf
 O6RrLf4jwgMMlrznkJb/222HXi+6jEQG5qVvXH3q/1KqulNDMXjQ4NkCldVeJQzyFUzA
 qLgjAbQempUe9aNp9osLGQHFCsSZeU3g38eiUY8JQty7l6EaanE0vrZ7gMq170qG0orn
 le8VfY9iYErkRBzw/gg4k1AwIsyCX1toTR41abEPwoVKvWr2Bk9TGlhgtlbNVgSdahWi
 GUAQkjUhKKdhzZis137NJUZ0LObOfbRHBGQtUyL7u11C5IQtxT8UmHRd5rQ9nD+vZP1j
 0gSA==
X-Gm-Message-State: AFuF++mGMHn8iiWeY6qEJ2Uww88WG3Agi93TfQGoB3duNNPS4L1+WE/I
 METQoq+vP3KjULibRx5sF1jonAArRiaRYgNuaZLfNswcnn6Lu47LtZPvAHYsFgBFPsT8z4xL1W4
 vnqnovpcnfkaLWVSaeRtdxoPhRI+JktXwVVRZF8vF8R+uElIqIdTLLP967RqijIFp/Q==
X-Gm-Gg: AR+sD13JfbDBF8hwBWvPtWwQxsdaEq0Yl2hUNeUe+ibH5ChokinBPkj4kvY8kvBwAHl
 x0kdz/lVeGD3a+DFioX8VoV8Grs+UCZ5BRZUBAfNzmZqf9HTaXHe95woIfRw02GmsVKM6VXzQat
 bWgwSqjj00QWcILegiIDj05UbTTwPs/O4go1z9+mGEuZjNdVu2ZjzU7oGgAkUl2SiphDw+ZX622
 bSPf5YTHdr3CTmtUntEdAxbDu5y2rLf3oP7Dvky5iMY9ZOULROqlm/gXj4Vt5WTODcGZjA/Y24Y
 U9RY+ftOBgQCdK0WUoWpQypGU4yOcl/aPlIeQECL0DHFKwPaDU27K6FylG2p5SR0zmcA/NOxXeE
 E6qUDf1yq5Xw+Vg3f1XIXBB/LCO638hXGK04uRg==
X-Received: by 2002:a05:622a:1903:b0:528:3882:3869 with SMTP id
 d75a77b69052e-52e4228dd23mr22908851cf.13.1787693054035; 
 Tue, 25 Aug 2026 14:24:14 -0700 (PDT)
X-Received: by 2002:a05:622a:1903:b0:528:3882:3869 with SMTP id
 d75a77b69052e-52e4228dd23mr22907721cf.13.1787693053142; 
 Tue, 25 Aug 2026 14:24:13 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90cc65299f0sm8646386d6.41.2026.08.25.14.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 14:24:12 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 12/13] hw/riscv/device-common, virt.c: add gpex_pcie_init()
Date: Tue, 25 Aug 2026 18:23:24 -0300
Message-ID: <20260825212326.1907-13-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825212326.1907-1-daniel.barboza@oss.qualcomm.com>
References: <20260825212326.1907-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: goJ-4_sy_MdVKmOKwXw10L9JUT8PS5zf
X-Proofpoint-ORIG-GUID: goJ-4_sy_MdVKmOKwXw10L9JUT8PS5zf
X-Authority-Analysis: v=2.4 cv=I+NVgtgg c=1 sm=1 tr=0 ts=6a8e07fe cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=i57S3HUJNi793Ni1t6cA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDE4MiBTYWx0ZWRfX8cuqcOTT7xrG
 R0KGeUDeIQ6eGvF8FQYDAhybm2V9uOuRZfukk0Gnnkw3kJYEJkx20Y7Jc2/UR9lm4ndDAUyYMAx
 kTmUBKkqD8gBmEt8MPoSnidq130BqPcNUJHsFD+ZLZN4QO9otOSnzQJ7lJrO82xI4h430RxM4HH
 fEAFp2JAN8MV4GUNjOeQu01RQ4Wl8Jlpr0UKk7RhRiEdBabTWfNUSlXaqc4Bwo3MZ2mUJ5S1hI4
 tbOMTUykpt7pPAC9UuEJGlXTgPqFs+NpYEooq4GV4QBeb9trDEe3sYyldTYkZfMYOit4lnDhNnl
 oyFTc/IRH2gIP5b37L1w77zqyeyEXhc8K2iWcg/adJelOsdJSnIT1vxTb0NmcawYQKh+ptpF5dX
 hyXJXiHA41PiODxWYJvSCgccJZNQd2YTXB13UwpCG3sfYz8A+MEnf/91n6oRYaoP7DtJbxF93Vs
 VOd06cWUSqelhJKFypA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDE4MiBTYWx0ZWRfX1fC5w1zOlTvf
 sMhkS/zdFiGHmOfmWsu5xUwSpg6zJJH+Kxrn7OUsdiIJ0TG9bjS1uqHDDih3Q2kPsaq82MTlcoZ
 /2dz/f8jOml4r7nazhyGu3yfwaqRTZ4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_06,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250182
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


