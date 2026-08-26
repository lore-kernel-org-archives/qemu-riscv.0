Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EA0C61DBE
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 21:48:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzLSi-0003Jx-02; Wed, 26 Aug 2026 17:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzLSg-0003JD-MH
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 17:47:10 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzLSe-0001Ma-DX
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 17:47:10 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67QKdMGi2001250
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 21:47:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 b+zSERGWiP/OBCTChbWcd2WODk6dqhL6oPUWWDrpNjw=; b=RJBmtUtkhy/nWIJt
 +1IR5qqefxDN4mS25/jFOZcU+QRSRByu3YWR5uLFGxKF96CFXRpQxRVX80J0pDpc
 rRWK394rg+2m8JG+iRlYLbAecOaPJ52c0TF1ZtI6ceUGrKIK0PefmPvdiP0we8n+
 fojSCQHs4z0xQbBTyLp86YawiBoO/WIBiPpc0w6P+rRoZq6aLH4611ZpHK8kaA7c
 a/Y5nZ9tDhFlHWLDiKTinGGfH0Nr8yrdIASswEGxrcKLKSVO689JMmatYh/1b7se
 NpgWPAMo6qoQVFCHqGB9wKfQTma9BeEObDIy0HYGBhMoX2PuvpkeYP5AST30BYiL
 UL6gDw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga4ec8w6r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 21:47:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-52ce64c41efso24416551cf.3
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 14:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787780826; x=1788385626; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=b+zSERGWiP/OBCTChbWcd2WODk6dqhL6oPUWWDrpNjw=;
 b=P9mv3q4gAmEUA3jyeHXCtRjAMNKWnAnUKg9VVa7ljm3AYYU2a6j9OIPOBP339g9gue
 4vcRJJ/0XaTH5arNp5vJJ+YUXzWk8cFSFKlQSrSfnueZu8eI6Frn2Mc6kTfMeywmQWHy
 6GybvD2smVOZSYamsGNgKeC7GStvjAGS8CQ1L3v9ejo8kFhjuXa95p+xUFO2434Inv3x
 z82Ql3jtC2Y8hNOANpavTE2Kofij81rHvW1tvOv2XgnExBgKzYWoKb8/RNsolM2fS0HU
 LRKEdnOzd8DjYeYO4tVLd753j/z81uzdA58jWbLais8AIWN1+8zxWPYvkg1JRTTGW70V
 sILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787780826; x=1788385626;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=b+zSERGWiP/OBCTChbWcd2WODk6dqhL6oPUWWDrpNjw=;
 b=aKLEbfVMxeNwVIM7+PUaTKhwpLpcSvFEjvVxx2AhrrI0MXYQWdbY0QkBPzfoQLKyJp
 PIFuG5n5TmA95YnBqfVROGYwAHT54dQZ17qgOFoBwvBl6zBw1hZt0De3bla52WsgmcbI
 EhnK1criLrwpWZelzSW4lSEYyFCf34w0z9qHGGOoB40O7w64UPPzPKYsdpRELMRX0gqy
 kUWieLuuhatPq422ajB7OBERhN3UzQhhuGp0kx/LJVcwTzy44/qHIGAzfBjFDxdUQloH
 Kl3tO8v0LdLgp2IQosfpeRvhahROQAZOxj+V4HHIY7DwZoHhsR9ciGDp0+L4mcZupWV4
 a4ig==
X-Gm-Message-State: AFuF++kGuovzYcSzwyiS4SXa/uEH6O7rclRk03DSw5xN/TPOmM4nytUj
 AwQ2GXL7wbXxU9VbJmKt4W1bvAAcU7fdIoY9h5ff5tEdY1ymA8RfJ8RuxQVz7MC81lBDpswHcLG
 sXiHZY6KtPrrmHnvJ6EU99WV6kRwGUb5VXXBVPZcMRG8vHVqERQMd4wNOHQ==
X-Gm-Gg: AR+sD11/vU4Ffan31/XREUfRCLbbdVrOcyuTTfGpO/kdnIGWajzZpybsryZPKgOI2vN
 zge8NpBWZ1c7viqZNEoKz4oFKvqLzdWNc7pD9K9/aGc4rOt83+hhAuzlgOgwmqqPfjzfLajBhJ9
 wu9gq/zuvSwfqM+ytzddQFQKP4rGbn7Z2a8NwWg3AifnjMofxjj0UBEW3mqMeI/KFO5D4l7cLKF
 Yyxu/ZdRRb6U0lFT2nP4++IMST1BoO18gAjw0Q6iDPG2UVvJ5QB4cETRDyr3yueeCr9BZZ0aQ3k
 YI+OOUOHdghiPX1vA/Dsyp210mepahLBShUrF1tPgRtLd3GI/5cU8YnQr5JyBQj1gGHG6/s2UHD
 dKUVddLegGUx1IJurQGHoPf1dQvdbUB7Ra14d1Q==
X-Received: by 2002:a05:622a:86:b0:52d:3352:f7ac with SMTP id
 d75a77b69052e-52e42320f65mr108734871cf.28.1787780825188; 
 Wed, 26 Aug 2026 14:47:05 -0700 (PDT)
X-Received: by 2002:a05:622a:86:b0:52d:3352:f7ac with SMTP id
 d75a77b69052e-52e42320f65mr108734241cf.28.1787780824659; 
 Wed, 26 Aug 2026 14:47:04 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90cd73e4117sm490916d6.24.2026.08.26.14.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 14:47:04 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v3 05/14] hw/riscv/fdt_common,
 virt.c: add riscv_create_fdt_pcie()
Date: Wed, 26 Aug 2026 18:46:33 -0300
Message-ID: <20260826214643.122728-6-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826214643.122728-1-daniel.barboza@oss.qualcomm.com>
References: <20260826214643.122728-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KIBqylFo c=1 sm=1 tr=0 ts=6a8f5edb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=nzCZRCZgkTuinHKBC8cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 0Tti2PRUnphqpJ9wTjlwRton2UfRPXnu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE4MyBTYWx0ZWRfXwLr5RAvfugBn
 if3RunIdAUI+h6ovP/uUCjIkmhLAM39hgBqiVBkot5ZRqZEPgGQdY4oNYWae4brUIzMAn+DFu/B
 ZJWVNh+2MHARD55COpQONnS1JNE3AQHL+8K0rTYqOA9uq8Yy5qjsXEOscefRJE+JDPeNdRl5U0z
 AERLCBaUpIqiGMVtWysu2W4m32mQPBARXGBCO6eAL11MvhNSV8uQjAiwQh/8TI9+wl/W87ZwPmu
 jKuO73FBT1ViCnX58nZOyawzfbhn9pI3xolHhLg3QU1k00tzHK0Iq+qMCgbPHKdAXNI24RquaeA
 kIs0HZy7gmSG4Wg1yHeTCsxq0S/Lwczr1CrVl7fgrt0aihK7gO1jD84yV7+KWNmqC+LsQEhBSez
 ZilXnJdP8X6iJlod2h6lNwbnEZwRPUGT0na0g8OBqoL5SCLCGVSDvIy8ciDkl5fd6HDrp3WAzDW
 Bfs2hXDd8D6sOdAs/ow==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE4MyBTYWx0ZWRfXz9SHIjAFKuxS
 y9Gb8+ZE42ClIGkHQUHjrBH8K3s4HhtuCbbu+fYxAADkjJlIKOsGRKpPCools+z1dF4gI3ybdUM
 dftQMqw8ftYs8Er44VAQcr+gVxcQ2K4=
X-Proofpoint-GUID: 0Tti2PRUnphqpJ9wTjlwRton2UfRPXnu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_06,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260183
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

The pcie FDT is quite tedious but can be parametrized into a helper.
This is going to benefit only the 'virt' board for now but it will be
used by the 'riscv-server-ref' board in the near future too.

Some other changes made:

- FDT related macros are moved to fdt-common.h.  Only a couple are being
  used by the helper ATM but more will be added in the next patches;
- an RISCVAIAType enum is created.  There are several FDTs that depends
  on the active AIA type being used, and we want a way to represent the
  different AIA modes that doesn't re-use the 'virt' specific VIRT_AIA_*
  macros.  The enum vals are equivalent by design - we want "s->aia_type"
  to be used by 'virt' when calling the fdt helpers, and other boards
  will use "AIA_*" macros in their code.

No FDT changes made.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/riscv/fdt-common.c         | 111 ++++++++++++++++++++++++++++++++++
 hw/riscv/virt.c               | 111 +++-------------------------------
 include/hw/riscv/fdt-common.h |  29 +++++++++
 include/hw/riscv/virt.h       |  15 -----
 4 files changed, 149 insertions(+), 117 deletions(-)

diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
index 0e3423acc8..54604d3158 100644
--- a/hw/riscv/fdt-common.c
+++ b/hw/riscv/fdt-common.c
@@ -15,6 +15,8 @@
 #include "target/riscv/cpu_bits.h"
 #include "hw/riscv/riscv-iommu-bits.h"
 #include "hw/riscv/iommu.h"
+#include "hw/pci/pci.h"
+#include "hw/pci/pcie_host.h"
 
 void *riscv_create_board_device_tree(const char *model, const char *compatible,
                                      int *fdt_size)
@@ -388,3 +390,112 @@ void riscv_create_fdt_riscv_iommu_sys(void *fdt, hwaddr addr, hwaddr size,
 
     *iommu_sys_phandle = iommu_phandle;
 }
+
+static void create_pcie_irq_map(void *fdt, char *nodename,
+                                uint32_t irqchip_phandle,
+                                RISCVAIAType aia_type, uint32_t pcie_irq)
+{
+    int pin, dev;
+    uint32_t irq_map_stride = 0;
+    uint32_t full_irq_map[PCI_NUM_PINS * PCI_NUM_PINS *
+                          FDT_MAX_INT_MAP_WIDTH] = {};
+    uint32_t *irq_map = full_irq_map;
+
+    /*
+     * This code creates a standard swizzle of interrupts such that
+     * each device's first interrupt is based on it's PCI_SLOT number.
+     * (See pci_swizzle_map_irq_fn())
+     *
+     * We only need one entry per interrupt in the table (not one per
+     * possible slot) seeing the interrupt-map-mask will allow the table
+     * to wrap to any number of devices.
+     */
+    for (dev = 0; dev < PCI_NUM_PINS; dev++) {
+        int devfn = dev * 0x8;
+
+        for (pin = 0; pin < PCI_NUM_PINS; pin++) {
+            int irq_nr = pcie_irq + ((pin + PCI_SLOT(devfn)) % PCI_NUM_PINS);
+            int i = 0;
+
+            /* Fill PCI address cells */
+            irq_map[i] = cpu_to_be32(devfn << 8);
+            i += FDT_PCI_ADDR_CELLS;
+
+            /* Fill PCI Interrupt cells */
+            irq_map[i] = cpu_to_be32(pin + 1);
+            i += FDT_PCI_INT_CELLS;
+
+            /* Fill interrupt controller phandle and cells */
+            irq_map[i++] = cpu_to_be32(irqchip_phandle);
+            irq_map[i++] = cpu_to_be32(irq_nr);
+
+            if (aia_type != AIA_TYPE_NONE) {
+                irq_map[i++] = cpu_to_be32(0x4);
+            }
+
+            if (!irq_map_stride) {
+                irq_map_stride = i;
+            }
+            irq_map += irq_map_stride;
+        }
+    }
+
+    qemu_fdt_setprop(fdt, nodename, "interrupt-map", full_irq_map,
+                     PCI_NUM_PINS * PCI_NUM_PINS *
+                     irq_map_stride * sizeof(uint32_t));
+
+    qemu_fdt_setprop_cells(fdt, nodename, "interrupt-map-mask",
+                           0x1800, 0, 0, 0x7);
+}
+
+/*
+ * NOTE: this function uses a "/soc/pci@..." FDT subnode that
+ * should be created beforehand.
+ */
+void riscv_create_fdt_pcie(void *fdt, int aia_type, bool has_iommu_sys,
+                           const MemMapEntry *pcie_ecam,
+                           const MemMapEntry *pcie_pio,
+                           const MemMapEntry *pcie_mmio,
+                           const MemMapEntry *high_pcie,
+                           uint32_t irq_pcie_phandle,
+                           uint32_t msi_pcie_phandle,
+                           uint32_t iommu_sys_phandle, uint32_t pcie_irq)
+{
+    g_autofree char *name = NULL;
+
+    name = g_strdup_printf("/soc/pci@%"HWADDR_PRIx, pcie_ecam->base);
+    qemu_fdt_setprop_cell(fdt, name, "#address-cells", FDT_PCI_ADDR_CELLS);
+    qemu_fdt_setprop_cell(fdt, name, "#interrupt-cells", FDT_PCI_INT_CELLS);
+    qemu_fdt_setprop_cell(fdt, name, "#size-cells", 0x2);
+    qemu_fdt_setprop_string(fdt, name, "compatible", "pci-host-ecam-generic");
+    qemu_fdt_setprop_string(fdt, name, "device_type", "pci");
+    qemu_fdt_setprop_cell(fdt, name, "linux,pci-domain", 0);
+
+    qemu_fdt_setprop_cells(fdt, name, "bus-range", 0,
+                           pcie_ecam->size / PCIE_MMCFG_SIZE_MIN - 1);
+    qemu_fdt_setprop(fdt, name, "dma-coherent", NULL, 0);
+
+    if (aia_type == AIA_TYPE_APLIC_IMSIC) {
+        qemu_fdt_setprop_cell(fdt, name, "msi-parent", msi_pcie_phandle);
+    }
+
+    qemu_fdt_setprop_sized_cells(fdt, name, "reg", 2,
+                                 pcie_ecam->base, 2, pcie_ecam->size);
+
+    qemu_fdt_setprop_sized_cells(fdt, name, "ranges",
+        1, FDT_PCI_RANGE_IOPORT, 2, 0,
+        2, pcie_pio->base, 2, pcie_pio->size,
+        1, FDT_PCI_RANGE_MMIO,
+        2, pcie_mmio->base,
+        2, pcie_mmio->base, 2, pcie_mmio->size,
+        1, FDT_PCI_RANGE_MMIO_64BIT,
+        2, high_pcie->base,
+        2, high_pcie->base, 2, high_pcie->size);
+
+    if (has_iommu_sys) {
+        qemu_fdt_setprop_cells(fdt, name, "iommu-map",
+                               0, iommu_sys_phandle, 0, 0x10000);
+    }
+
+    create_pcie_irq_map(fdt, name, irq_pcie_phandle, aia_type, pcie_irq);
+}
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 211734c52b..32d66a278c 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -180,61 +180,6 @@ static void virt_flash_map(RISCVVirtState *s,
                     sysmem);
 }
 
-static void create_pcie_irq_map(RISCVVirtState *s, void *fdt, char *nodename,
-                                uint32_t irqchip_phandle)
-{
-    int pin, dev;
-    uint32_t irq_map_stride = 0;
-    uint32_t full_irq_map[PCI_NUM_PINS * PCI_NUM_PINS *
-                          FDT_MAX_INT_MAP_WIDTH] = {};
-    uint32_t *irq_map = full_irq_map;
-
-    /*
-     * This code creates a standard swizzle of interrupts such that
-     * each device's first interrupt is based on it's PCI_SLOT number.
-     * (See pci_swizzle_map_irq_fn())
-     *
-     * We only need one entry per interrupt in the table (not one per
-     * possible slot) seeing the interrupt-map-mask will allow the table
-     * to wrap to any number of devices.
-     */
-    for (dev = 0; dev < PCI_NUM_PINS; dev++) {
-        int devfn = dev * 0x8;
-
-        for (pin = 0; pin < PCI_NUM_PINS; pin++) {
-            int irq_nr = PCIE_IRQ + ((pin + PCI_SLOT(devfn)) % PCI_NUM_PINS);
-            int i = 0;
-
-            /* Fill PCI address cells */
-            irq_map[i] = cpu_to_be32(devfn << 8);
-            i += FDT_PCI_ADDR_CELLS;
-
-            /* Fill PCI Interrupt cells */
-            irq_map[i] = cpu_to_be32(pin + 1);
-            i += FDT_PCI_INT_CELLS;
-
-            /* Fill interrupt controller phandle and cells */
-            irq_map[i++] = cpu_to_be32(irqchip_phandle);
-            irq_map[i++] = cpu_to_be32(irq_nr);
-            if (s->aia_type != VIRT_AIA_TYPE_NONE) {
-                irq_map[i++] = cpu_to_be32(0x4);
-            }
-
-            if (!irq_map_stride) {
-                irq_map_stride = i;
-            }
-            irq_map += irq_map_stride;
-        }
-    }
-
-    qemu_fdt_setprop(fdt, nodename, "interrupt-map", full_irq_map,
-                     PCI_NUM_PINS * PCI_NUM_PINS *
-                     irq_map_stride * sizeof(uint32_t));
-
-    qemu_fdt_setprop_cells(fdt, nodename, "interrupt-map-mask",
-                           0x1800, 0, 0, 0x7);
-}
-
 static void create_fdt_socket_aclint(RISCVVirtState *s,
                                      int socket,
                                      uint32_t *intc_phandles)
@@ -722,51 +667,6 @@ static void create_fdt_virtio(RISCVVirtState *s, uint32_t irq_virtio_phandle)
     }
 }
 
-static void create_fdt_pcie(RISCVVirtState *s,
-                            uint32_t irq_pcie_phandle,
-                            uint32_t msi_pcie_phandle,
-                            uint32_t iommu_sys_phandle)
-{
-    g_autofree char *name = NULL;
-    MachineState *ms = MACHINE(s);
-
-    name = g_strdup_printf("/soc/pci@%"HWADDR_PRIx,
-                           s->memmap[VIRT_PCIE_ECAM].base);
-    qemu_fdt_setprop_cell(ms->fdt, name, "#address-cells",
-        FDT_PCI_ADDR_CELLS);
-    qemu_fdt_setprop_cell(ms->fdt, name, "#interrupt-cells",
-        FDT_PCI_INT_CELLS);
-    qemu_fdt_setprop_cell(ms->fdt, name, "#size-cells", 0x2);
-    qemu_fdt_setprop_string(ms->fdt, name, "compatible",
-        "pci-host-ecam-generic");
-    qemu_fdt_setprop_string(ms->fdt, name, "device_type", "pci");
-    qemu_fdt_setprop_cell(ms->fdt, name, "linux,pci-domain", 0);
-    qemu_fdt_setprop_cells(ms->fdt, name, "bus-range", 0,
-        s->memmap[VIRT_PCIE_ECAM].size / PCIE_MMCFG_SIZE_MIN - 1);
-    qemu_fdt_setprop(ms->fdt, name, "dma-coherent", NULL, 0);
-    if (s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
-        qemu_fdt_setprop_cell(ms->fdt, name, "msi-parent", msi_pcie_phandle);
-    }
-    qemu_fdt_setprop_sized_cells(ms->fdt, name, "reg", 2,
-        s->memmap[VIRT_PCIE_ECAM].base, 2, s->memmap[VIRT_PCIE_ECAM].size);
-    qemu_fdt_setprop_sized_cells(ms->fdt, name, "ranges",
-        1, FDT_PCI_RANGE_IOPORT, 2, 0,
-        2, s->memmap[VIRT_PCIE_PIO].base, 2, s->memmap[VIRT_PCIE_PIO].size,
-        1, FDT_PCI_RANGE_MMIO,
-        2, s->memmap[VIRT_PCIE_MMIO].base,
-        2, s->memmap[VIRT_PCIE_MMIO].base, 2, s->memmap[VIRT_PCIE_MMIO].size,
-        1, FDT_PCI_RANGE_MMIO_64BIT,
-        2, virt_high_pcie_memmap.base,
-        2, virt_high_pcie_memmap.base, 2, virt_high_pcie_memmap.size);
-
-    if (virt_is_iommu_sys_enabled(s)) {
-        qemu_fdt_setprop_cells(ms->fdt, name, "iommu-map",
-                               0, iommu_sys_phandle, 0, 0x10000);
-    }
-
-    create_pcie_irq_map(s, ms->fdt, name, irq_pcie_phandle);
-}
-
 static void create_fdt_uart(RISCVVirtState *s,
                             uint32_t irq_mmio_phandle, int memId, int irqNo)
 {
@@ -912,8 +812,15 @@ static void finalize_fdt(RISCVVirtState *s)
                                          irq_mmio_phandle, msi_pcie_phandle,
                                          &iommu_sys_phandle, IOMMU_SYS_IRQ);
     }
-    create_fdt_pcie(s, irq_pcie_phandle, msi_pcie_phandle,
-                    iommu_sys_phandle);
+
+    riscv_create_fdt_pcie(MACHINE(s)->fdt, s->aia_type,
+                          virt_is_iommu_sys_enabled(s),
+                          &s->memmap[VIRT_PCIE_ECAM],
+                          &s->memmap[VIRT_PCIE_PIO],
+                          &s->memmap[VIRT_PCIE_MMIO],
+                          &virt_high_pcie_memmap,
+                          irq_pcie_phandle, msi_pcie_phandle,
+                          iommu_sys_phandle, PCIE_IRQ);
 
     riscv_create_fdt_syscon(MACHINE(s)->fdt, &phandle,
                             s->memmap[VIRT_TEST].base,
diff --git a/include/hw/riscv/fdt-common.h b/include/hw/riscv/fdt-common.h
index 79463abfa5..7517316a56 100644
--- a/include/hw/riscv/fdt-common.h
+++ b/include/hw/riscv/fdt-common.h
@@ -11,6 +11,27 @@
 
 #include "target/riscv/cpu.h"
 
+#define FDT_PCI_ADDR_CELLS    3
+#define FDT_PCI_INT_CELLS     1
+#define FDT_PLIC_ADDR_CELLS   0
+#define FDT_PLIC_INT_CELLS    1
+#define FDT_APLIC_INT_CELLS   2
+#define FDT_APLIC_ADDR_CELLS  0
+#define FDT_IMSIC_INT_CELLS   0
+#define FDT_MAX_INT_CELLS     2
+#define FDT_MAX_INT_MAP_WIDTH (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + \
+                                 1 + FDT_MAX_INT_CELLS)
+#define FDT_PLIC_INT_MAP_WIDTH  (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + \
+                                 1 + FDT_PLIC_INT_CELLS)
+#define FDT_APLIC_INT_MAP_WIDTH (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + \
+                                 1 + FDT_APLIC_INT_CELLS)
+
+typedef enum RISCVAIAType {
+    AIA_TYPE_NONE = 0,
+    AIA_TYPE_APLIC,
+    AIA_TYPE_APLIC_IMSIC,
+} RISCVAIAType;
+
 void *riscv_create_board_device_tree(const char *model, const char *compatible,
                                      int *fdt_size);
 void riscv_create_fdt_socket_memory(void *fdt, hwaddr addr, uint64_t size,
@@ -48,4 +69,12 @@ void riscv_create_fdt_riscv_iommu_sys(void *fdt, hwaddr addr, hwaddr size,
                                       uint32_t msi_phandle,
                                       uint32_t *iommu_sys_phandle,
                                       uint32_t iommu_sys_irq);
+void riscv_create_fdt_pcie(void *fdt, int aia_type, bool has_iommu_sys,
+                           const MemMapEntry *pcie_ecam,
+                           const MemMapEntry *pcie_pio,
+                           const MemMapEntry *pcie_mmio,
+                           const MemMapEntry *high_pcie,
+                           uint32_t irq_pcie_phandle,
+                           uint32_t msi_pcie_phandle,
+                           uint32_t iommu_sys_phandle, uint32_t pcie_irq);
 #endif
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 7c862b0da2..e516898f9a 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -121,21 +121,6 @@ enum {
 #define VIRT_PLIC_SIZE(__num_context) \
     (VIRT_PLIC_CONTEXT_BASE + (__num_context) * VIRT_PLIC_CONTEXT_STRIDE)
 
-#define FDT_PCI_ADDR_CELLS    3
-#define FDT_PCI_INT_CELLS     1
-#define FDT_PLIC_ADDR_CELLS   0
-#define FDT_PLIC_INT_CELLS    1
-#define FDT_APLIC_INT_CELLS   2
-#define FDT_APLIC_ADDR_CELLS  0
-#define FDT_IMSIC_INT_CELLS   0
-#define FDT_MAX_INT_CELLS     2
-#define FDT_MAX_INT_MAP_WIDTH (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + \
-                                 1 + FDT_MAX_INT_CELLS)
-#define FDT_PLIC_INT_MAP_WIDTH  (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + \
-                                 1 + FDT_PLIC_INT_CELLS)
-#define FDT_APLIC_INT_MAP_WIDTH (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + \
-                                 1 + FDT_APLIC_INT_CELLS)
-
 bool virt_is_acpi_enabled(RISCVVirtState *s);
 bool virt_is_iommu_sys_enabled(RISCVVirtState *s);
 void virt_acpi_setup(RISCVVirtState *vms);
-- 
2.43.0


