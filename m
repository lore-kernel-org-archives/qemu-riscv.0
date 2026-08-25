Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA14EC61DCA
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 21:25:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wyycf-0003VP-VC; Tue, 25 Aug 2026 17:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wyycd-0003Tq-Pd
 for qemu-riscv@nongnu.org; Tue, 25 Aug 2026 17:23:55 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wyycb-0002Gl-PV
 for qemu-riscv@nongnu.org; Tue, 25 Aug 2026 17:23:55 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67PL9ebK2604723
 for <qemu-riscv@nongnu.org>; Tue, 25 Aug 2026 21:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=O9DGexoTufl
 6srH88MZz/5wXHHGKrgy2EfMWxzyd2nY=; b=m/nvxvLfG2fx+h6X54haKdLdmrr
 pO7jvbKEqJtdzYq7xUr93OFjnwLQgKlMjqUBKSBobO0b8geIaQ0N8JReCtRRfBMZ
 aKiRFnfXq9yKmYUHLaZQnfys1LVXZcdL7tmP1y1aCk3LrQ4K+vl3R6x+aVyD+BQR
 bQgxCbjNPtpNd7CDuTlV95S/q3XbWcOwWCS/FVlgL+/89j5CsEAwZ8zeNiPjgyjK
 1mho6DFgZdNWca8prPM/JHRH6E+myyf4T6Czd6mwo/dZG0ln3BvWE9O3f6s1iVLX
 qY7BDTo9dHE/a2SpmlRYmLhVviRGgG4ec05D01jwPwkEALZD4ndTliptLsw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g98hp2su8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 25 Aug 2026 21:23:52 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-9077b4c35c5so4827706d6.2
 for <qemu-riscv@nongnu.org>; Tue, 25 Aug 2026 14:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787693031; x=1788297831; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=O9DGexoTufl6srH88MZz/5wXHHGKrgy2EfMWxzyd2nY=;
 b=UsTfGZ8U32cQSkTkfupnCKPFT8aaW1TeGBA2FmBLNEQXT5pQ2NfvJ1VvCarZ/maLlZ
 5g7LN0zd6NGYBN2uhHAToHxS/hFZcPtwprYO/dm6f9UjGZohWHPG8e6shZvC/SatNoxl
 dKDoF9ZCs+bheCgWjNsfCjwT9ImMy/BmS4GouH3k9mVw+IamFKHQN/q234XL4Ql6Zt0+
 VCuJy+psYXZoybups2ru5eFEDOH+DUryd3wJ9Zh2JjODaK9XVwjU6AsKTNJN7SVq95OG
 ArkjHKBS9LGCNiG2fVIuuBdL7t+V8Q/ezG3wa3g4m6m2Zpp6xApCJrg1pbGhhgUby3lx
 Ce8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787693031; x=1788297831;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=O9DGexoTufl6srH88MZz/5wXHHGKrgy2EfMWxzyd2nY=;
 b=dyCwp+ny1LtQbcYcRXV3uByeXd4E6KSTu2PYsIsrDoeiJIolofPE1Y9bUS9DNlUoQL
 Kt+LGT06XKTgceJYSvvfJkPAg/gWa/7pGEKwmFPnO1S94OZC8MxNuPj6JIYRDcrskCbl
 sclWLv2g5hkRph8jwCS/yMjdr4XRR7d+7ikywAA1DcsvHMITsEcohLLAWMkQqvOYM2VK
 +MV/f0c8E6uOBst5Nd0Wme7hf+mEz4XPWVatqSt0+GLe5RbC9DeoY6xNvdrR4nkV7hMV
 1mp0DRmaUsjn6hOsJgsjQ7GvYrTxX0lpO4K1xEPMrzeyvPtmcercOsGXjfgrD+MgfMLF
 Nn1g==
X-Gm-Message-State: AFuF++lEGoL6Nep9dpKBihyAMqUsQpd3XYrXUz6KJYW8LEyt15J55kdO
 6NVKeJIZ373LEd3uF5S5sYi7sObalwyP1w7M0h35ID/Zlwqmev5moFMm7x5XSWcZvpQ/93WqTlt
 iEHra+J7YbXRahFN4410j0VghW1nv7P3CIesuLV+2/xlhjwk5gRplz+1/Wg==
X-Gm-Gg: AR+sD11YXThsmv/x1X7Loxic7D3i6L/JkdB6C0OqgVqp+EF4YxhnFix91NmWuYgBi4D
 dzjpxDO5f7xuj5SFLDmbJlGC7Izif6+XDSB35HtKPMfYmoPuyFX3gVuAi72or3yLAGosKdGxJuJ
 hs0rRo8Qd0BTEvcxj+MiW+seCo7++Aegs1VWBAKAhihbYTSt2t4vWPS6DkD2Y7wxo8CtKOG8Whv
 vykE5f65UeKXrXgJdD1OYrLxi2Aurz5KG8yUA6SpEZrB9jmCzguHytD7ohlHutZn5JsDm2n7Zcd
 t2X3VqUtrG6BwNyKSxcM9RJt147euQZCMG7Cn+n+8+Wv0uid9EolF+XotObOi4uh/gsBj6WuSoB
 ecMgcyEdtCeDPtJSBBGmtry30FZVpWYmTlZhVOA==
X-Received: by 2002:a05:6214:4605:b0:8ee:d9e7:be2d with SMTP id
 6a1803df08f44-90cc79308d8mr18698086d6.7.1787693031257; 
 Tue, 25 Aug 2026 14:23:51 -0700 (PDT)
X-Received: by 2002:a05:6214:4605:b0:8ee:d9e7:be2d with SMTP id
 6a1803df08f44-90cc79308d8mr18697606d6.7.1787693030841; 
 Tue, 25 Aug 2026 14:23:50 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90cc65299f0sm8646386d6.41.2026.08.25.14.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 14:23:50 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 03/13] hw/riscv/fdt-common,
 virt.c: add create_fdt_riscv_iommu_sys()
Date: Tue, 25 Aug 2026 18:23:15 -0300
Message-ID: <20260825212326.1907-4-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825212326.1907-1-daniel.barboza@oss.qualcomm.com>
References: <20260825212326.1907-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IwnIR99mycRytYyu7F1I3LPrUN-2xQFv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDE4MiBTYWx0ZWRfXxqlb50waEUol
 cHk4jHH79D1VBG10jYn2gl+YmNaEn5wboR2BlH3rOjEFNjD9bQjw8ETDwbQG3hEkYaqYqqzWFNQ
 q/3xij7IqHoWI1/TuoM3LG/ahbXuBhZk4LPFQif6oHxsudq+Z/Bo4XOxTMr8acvnUFXX3rkopcs
 LGCOt8wP1aSdP2dPulhUpGZtQCQc37WmHHJjFA41YVYzOCcCQn9MR+t8WVD2wl4b4Ffd2J4Wzh9
 z//n7oPJhGrsfOxxZjpZhURUeSyBsH/IMRQ564Ifm2w2lW5mgFTj458b+SlfaguEEgf18JNhcc4
 pUEskEkC5mQ/bxZszhCP+8PnCUoN9JQdp0N+NDkxwDxqCEUEUmrPjIDDno3UmmMDkfkgF2BCBqv
 ZfV/pLjg/8+OI9zCdtCHCUj+TvR7V3EK64f1l9eFADCElzcq2/0flx5MOjvVMtRZUoDHHbM3369
 fsJbYa2R1s1MsH0UUOQ==
X-Authority-Analysis: v=2.4 cv=B7CJFutM c=1 sm=1 tr=0 ts=6a8e07e8 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=-lP9cGLPB0zaG0B-UEoA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: IwnIR99mycRytYyu7F1I3LPrUN-2xQFv
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDE4MiBTYWx0ZWRfX3t7zEXSFZsbZ
 x0fndlskAsMbUIE7qdlyFUNKr46gmKPPUgqu4/7VN/RJKubeVo03Tq+7dbWhjzUO6jZijgMvcGk
 7s9CbaUF4vtl1SI7s9Jq3WqG22zaZMw=
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

Both the 'virt' board and the future 'riscv-server-ref' boards uses an
iommu-sys device that is declared in the DT.

Create a helper to encapsulate the logic and avoid copy/pasting stuff
between boards.

No FDT changes intended.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/fdt-common.c         | 40 +++++++++++++++++++++++++++++
 hw/riscv/virt.c               | 47 ++++-------------------------------
 include/hw/riscv/fdt-common.h |  5 ++++
 3 files changed, 50 insertions(+), 42 deletions(-)

diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
index a2168c09ec..ddc56821d3 100644
--- a/hw/riscv/fdt-common.c
+++ b/hw/riscv/fdt-common.c
@@ -13,6 +13,8 @@
 #include "hw/core/boards.h"
 #include "hw/riscv/fdt-common.h"
 #include "target/riscv/cpu_bits.h"
+#include "hw/riscv/riscv-iommu-bits.h"
+#include "hw/riscv/iommu.h"
 
 void *create_board_device_tree(const char *model, const char *compatible,
                                int *fdt_size)
@@ -347,3 +349,41 @@ void create_fdt_syscon(void *fdt, uint32_t *phandle,
     qemu_fdt_setprop_cell(fdt, name, "value", poweroff);
     g_free(name);
 }
+
+void create_fdt_riscv_iommu_sys(void *fdt, hwaddr addr, hwaddr size,
+                                uint32_t irq_chip,
+                                uint32_t msi_phandle,
+                                uint32_t *iommu_sys_phandle,
+                                uint32_t iommu_sys_irq)
+{
+    const char comp[] = "riscv,iommu";
+    uint32_t iommu_phandle;
+    g_autofree char *iommu_node = NULL;
+    uint32_t iommu_irq_map[RISCV_IOMMU_INTR_COUNT] = {
+        iommu_sys_irq + RISCV_IOMMU_INTR_CQ,
+        iommu_sys_irq + RISCV_IOMMU_INTR_FQ,
+        iommu_sys_irq + RISCV_IOMMU_INTR_PM,
+        iommu_sys_irq + RISCV_IOMMU_INTR_PQ,
+    };
+
+    iommu_node = g_strdup_printf("/soc/iommu@%"HWADDR_PRIx, addr);
+    iommu_phandle = qemu_fdt_alloc_phandle(fdt);
+    qemu_fdt_add_subnode(fdt, iommu_node);
+
+    qemu_fdt_setprop(fdt, iommu_node, "compatible", comp, sizeof(comp));
+    qemu_fdt_setprop_cell(fdt, iommu_node, "#iommu-cells", 1);
+    qemu_fdt_setprop_cell(fdt, iommu_node, "phandle", iommu_phandle);
+
+    qemu_fdt_setprop_sized_cells(fdt, iommu_node, "reg", 2, addr, 2, size);
+    qemu_fdt_setprop_cell(fdt, iommu_node, "interrupt-parent", irq_chip);
+
+    qemu_fdt_setprop_cells(fdt, iommu_node, "interrupts",
+        iommu_irq_map[0], FDT_IRQ_TYPE_EDGE_LOW,
+        iommu_irq_map[1], FDT_IRQ_TYPE_EDGE_LOW,
+        iommu_irq_map[2], FDT_IRQ_TYPE_EDGE_LOW,
+        iommu_irq_map[3], FDT_IRQ_TYPE_EDGE_LOW);
+
+    qemu_fdt_setprop_cell(fdt, iommu_node, "msi-parent", msi_phandle);
+
+    *iommu_sys_phandle = iommu_phandle;
+}
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index acbbe458fa..9417aa7a06 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -867,46 +867,6 @@ static void create_fdt_virtio_iommu(RISCVVirtState *s, uint16_t bdf)
                            bdf + 1, iommu_phandle, bdf + 1, 0xffff - bdf);
 }
 
-static void create_fdt_iommu_sys(RISCVVirtState *s, uint32_t irq_chip,
-                                 uint32_t msi_phandle,
-                                 uint32_t *iommu_sys_phandle)
-{
-    const char comp[] = "riscv,iommu";
-    void *fdt = MACHINE(s)->fdt;
-    uint32_t iommu_phandle;
-    g_autofree char *iommu_node = NULL;
-    hwaddr addr = s->memmap[VIRT_IOMMU_SYS].base;
-    hwaddr size = s->memmap[VIRT_IOMMU_SYS].size;
-    uint32_t iommu_irq_map[RISCV_IOMMU_INTR_COUNT] = {
-        IOMMU_SYS_IRQ + RISCV_IOMMU_INTR_CQ,
-        IOMMU_SYS_IRQ + RISCV_IOMMU_INTR_FQ,
-        IOMMU_SYS_IRQ + RISCV_IOMMU_INTR_PM,
-        IOMMU_SYS_IRQ + RISCV_IOMMU_INTR_PQ,
-    };
-
-    iommu_node = g_strdup_printf("/soc/iommu@%x",
-                               (unsigned int) s->memmap[VIRT_IOMMU_SYS].base);
-    iommu_phandle = qemu_fdt_alloc_phandle(fdt);
-    qemu_fdt_add_subnode(fdt, iommu_node);
-
-    qemu_fdt_setprop(fdt, iommu_node, "compatible", comp, sizeof(comp));
-    qemu_fdt_setprop_cell(fdt, iommu_node, "#iommu-cells", 1);
-    qemu_fdt_setprop_cell(fdt, iommu_node, "phandle", iommu_phandle);
-
-    qemu_fdt_setprop_sized_cells(fdt, iommu_node, "reg", 2, addr, 2, size);
-    qemu_fdt_setprop_cell(fdt, iommu_node, "interrupt-parent", irq_chip);
-
-    qemu_fdt_setprop_cells(fdt, iommu_node, "interrupts",
-        iommu_irq_map[0], FDT_IRQ_TYPE_EDGE_LOW,
-        iommu_irq_map[1], FDT_IRQ_TYPE_EDGE_LOW,
-        iommu_irq_map[2], FDT_IRQ_TYPE_EDGE_LOW,
-        iommu_irq_map[3], FDT_IRQ_TYPE_EDGE_LOW);
-
-    qemu_fdt_setprop_cell(fdt, iommu_node, "msi-parent", msi_phandle);
-
-    *iommu_sys_phandle = iommu_phandle;
-}
-
 static void create_fdt_iommu(RISCVVirtState *s, uint16_t bdf)
 {
     const char comp[] = "riscv,pci-iommu";
@@ -945,8 +905,11 @@ static void finalize_fdt(RISCVVirtState *s)
     create_fdt_virtio(s, irq_virtio_phandle);
 
     if (virt_is_iommu_sys_enabled(s)) {
-        create_fdt_iommu_sys(s, irq_mmio_phandle, msi_pcie_phandle,
-                             &iommu_sys_phandle);
+        create_fdt_riscv_iommu_sys(MACHINE(s)->fdt,
+                                   s->memmap[VIRT_IOMMU_SYS].base,
+                                   s->memmap[VIRT_IOMMU_SYS].size,
+                                   irq_mmio_phandle, msi_pcie_phandle,
+                                   &iommu_sys_phandle, IOMMU_SYS_IRQ);
     }
     create_fdt_pcie(s, irq_pcie_phandle, msi_pcie_phandle,
                     iommu_sys_phandle);
diff --git a/include/hw/riscv/fdt-common.h b/include/hw/riscv/fdt-common.h
index 31203df517..37a1544706 100644
--- a/include/hw/riscv/fdt-common.h
+++ b/include/hw/riscv/fdt-common.h
@@ -41,4 +41,9 @@ void create_fdt_syscon(void *fdt, uint32_t *phandle,
                        hwaddr addr, hwaddr size,
                        uint32_t reboot, uint32_t poweroff,
                        bool sifive_test_compat);
+void create_fdt_riscv_iommu_sys(void *fdt, hwaddr addr, hwaddr size,
+                                uint32_t irq_chip,
+                                uint32_t msi_phandle,
+                                uint32_t *iommu_sys_phandle,
+                                uint32_t iommu_sys_irq);
 #endif
-- 
2.43.0


