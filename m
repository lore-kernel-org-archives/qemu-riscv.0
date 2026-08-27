Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85824C61DC4
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 22:27:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wziYZ-0005JB-5k; Thu, 27 Aug 2026 18:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wziYX-0005Io-Pd
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 18:26:46 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wziYV-0001CT-Rr
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 18:26:45 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67RJLlWW218241
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 22:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0CX/dyij1ROObEc9qiBrVy7iE1ABhLIjMFnCxbweU4Q=; b=KyJ2hJ3LoCJsgFD3
 HLgxGtQjlMWKK+0CVeqahJ56ZdtNOhInAv+5lDgPpQoBmvZAAH2cfkScfBbBsmG3
 YNkOdqaHKAaVX1rhvktUCrt3qFq965XZGrlRe9aC1LKdXXV1CY9Fi2RfXmeVT9/h
 Aul5QWob+1MlpWYR4J4ShQqBzdFQam48NFOmiE11dev5ImqNraqovBr7aj4GOy3d
 YnD2it56u6ukWYedojtWB52lw56INeXIRRRk1x+A7mFRl1/yPRPAHuvePROIc6SM
 IOoNXzAny1XHEvfAPEbizzMy2o8CUTUTUmvi4sSL5CgIaHtG6uItov+zPbBycUZF
 zUP1+g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gaphw23ac-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 22:26:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-938153538caso68124885a.1
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 15:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787869592; x=1788474392; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=0CX/dyij1ROObEc9qiBrVy7iE1ABhLIjMFnCxbweU4Q=;
 b=NmS6DVOB7OnbuHLAU/G1xctYM/3oef7rvnT26g4ufK2LxQyqSeg6RCxHR1LwQQ16Vf
 sLRjcNxgX18NaASWO2J2Sh8xnsM8d9cFvmi60p8JhovTSzdiYDFpFE7Wt2zIr1NvFMAB
 mTo2iDAigkKTG3M9rjDuwGppLU42IICl3be+qF7Ojo+Yw2XvoitwwPk3gHQb9X2MB1Lb
 uy4YlYeLe2TNpv/Dd/kVeRMr667YsUMNQOpU6X/u5JJM7qDCIThRE9Bgxx4GwALhNEAl
 ljEdgTyUuJyJlFCPcGTl8XJkKUpvVuBxip6lmohSQ4G22VVkKu1vnrQXLnLKgM/x4US+
 yc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787869592; x=1788474392;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=0CX/dyij1ROObEc9qiBrVy7iE1ABhLIjMFnCxbweU4Q=;
 b=YingUVEhXtDh47OgYs87fbzcpeUKBQeWmpUbwQN066Q3G0UXZyawSKuXAdyrA/9ngo
 2tqDO0OWJxm+7AgGv/ZJt8sO+c5/qUACK877BUObt4abqFfhKV/NJIILfsf1PcEfBS9q
 FdFIcajAkjKRRGDo1O3SNoWz9DJ7iwO4WaoINdLF70cc2KExRgK3AMAUIv9CHsFMFCdS
 2e7+DYuKU8jZlvg/xPXPINQAWmHtf/zTvM/qGRCkmx1IsA/kPWhKXOrskzd8y8qGtn5H
 P6f2YRrb2/H68XOCkNpGGcp99/mY16ueojBof8ImW7eHaULsfCSNZv/37rL5etwQjEEK
 1l6g==
X-Gm-Message-State: AFuF++mkU6BfeMotiNzWReA5KgyRpL4QFZm729JCpZaN0bK3Cf1AauY3
 fcJz9guCpwHGQNo5wX7QM6BNrTpxaTAP90boNkboOWz9sNNqPhwvOj/D/BbuXNbSBaKliXjLhG2
 HkSkx6z+9A3yMQB3OfzoeR1F2jkXi4khuiy2i0us39M0SS0tM+tnQJy1FGw==
X-Gm-Gg: AR+sD13PrPXUegYbeZFDgkH0E1IDmv5rQUDA+o2d5ZEvuk7QRm6EkjkSajOnj+qtEb5
 nPgGnVRAgBPenFF09+ghLxy0JSn7Xs+5P1HH6mXKBC/o3Gf72p48XzToTEuLtXe50toyN/z7g90
 GFeFUVAmuiINLOhX8HeanqnviUUaHF8D+HljLfpnfW2fdOuqCwZsjNfAytit27D72k6eumQyZdo
 PSxOCrKy6kcBOfkYwdGoRcbLm1XdTjVRcNu5LCTM7KSLdPmu98GhqMDNp2d/kVQSxxQFHQl4nFU
 a3TZ//BmCojQeCrMUSqLPMJO9kkIObRpycV4g/A7mH/w+SieUsivtvsGGckeTqO91Ratt5oyvKc
 OdXNnA13u4+rUhj87jFwkEsGMKTakJDVwZwxwiQ==
X-Received: by 2002:a05:620a:622a:b0:916:10f6:780f with SMTP id
 af79cd13be357-9391390443fmr230020985a.27.1787869592121; 
 Thu, 27 Aug 2026 15:26:32 -0700 (PDT)
X-Received: by 2002:a05:620a:622a:b0:916:10f6:780f with SMTP id
 af79cd13be357-9391390443fmr230017485a.27.1787869591716; 
 Thu, 27 Aug 2026 15:26:31 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-939173a734dsm8924985a.26.2026.08.27.15.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 15:26:31 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v4 04/14] hw/riscv/fdt-common,
 virt.c: add riscv_create_fdt_riscv_iommu_sys()
Date: Thu, 27 Aug 2026 19:25:57 -0300
Message-ID: <20260827222608.329788-5-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827222608.329788-1-daniel.barboza@oss.qualcomm.com>
References: <20260827222608.329788-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 40jPdCMWOWOWQj8Aix4AL6eRfH4juaNG
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE5MCBTYWx0ZWRfX5KVsbmEGAgSq
 mtEx4XN/nRYQAhXabByeB7vhPlwH/EGOizsF9gnpEQqj64VIjr/aOSfgdPqytVNVjMArUr/w0hu
 fF7ZmTdeCKlEKSwFESOsVi1LPHR6Ihg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE5MCBTYWx0ZWRfXwNqekdX7pVMW
 wrymx248ytehTlovWNTHTZqLDcfzGXG4ZnYqcwagxj/4HQ8Mb0irtcUs2wBsDlEl7sbTs0295Oh
 WElT0Dx0cowJWN6cP3jxLIZj8u94YpBOfb1zNu+EPmodbQjPdD9eHgHQE0z1nlvDCRDIFGoWxES
 ivZKMklkI90pL8yaJUsMN1bwLKDoZTCXAWfU956Et1ZdFWufcnvP/kHIxEMtxpVEd/Lej5dMFiQ
 qFWqoNCN2OJ5EOFa1EON3Xrbyo3OCiceMDIWaNVv4CSntbsMxoIWDo0FHvNp7HBT9x6LBPujDMR
 lMSYYXeriDDGpEOpREbAW1N9sePJv940fVbAiXDMkQyvqRUfgz2Do6f4/jMtiL77i9a0bWPQzd7
 ud/wIfvO+f3+Gjt6a42+DpUelNMz7mE26PCU+2cn6p50TSdTfoOQWYn+f2iCdOPbJ+Qcz8d9qdU
 6+EtSuryCXt34ah9R2w==
X-Proofpoint-ORIG-GUID: 40jPdCMWOWOWQj8Aix4AL6eRfH4juaNG
X-Authority-Analysis: v=2.4 cv=E8b9Y6dl c=1 sm=1 tr=0 ts=6a90b998 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=AqYGxfEHplewfouIbmYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_08,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
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

Both the 'virt' board and the future 'riscv-server-ref' boards uses an
iommu-sys device that is declared in the DT.  Create a helper to
encapsulate the logic and avoid copy/pasting stuff between boards.

The helper will return the iommu phandle value instead of returning void
and writing the used phandle in an extra argument.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/riscv/fdt-common.c         | 35 ++++++++++++++++++++++++
 hw/riscv/virt.c               | 50 ++++++-----------------------------
 include/hw/riscv/fdt-common.h |  5 ++++
 3 files changed, 48 insertions(+), 42 deletions(-)

diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
index eac5ca9322..88589330fb 100644
--- a/hw/riscv/fdt-common.c
+++ b/hw/riscv/fdt-common.c
@@ -13,6 +13,8 @@
 #include "hw/core/boards.h"
 #include "hw/riscv/fdt-common.h"
 #include "target/riscv/cpu_bits.h"
+#include "hw/riscv/riscv-iommu-bits.h"
+#include "hw/riscv/iommu.h"
 
 void *riscv_create_board_device_tree(const char *model, const char *compatible,
                                      int *fdt_size)
@@ -349,3 +351,36 @@ void riscv_create_fdt_syscon(void *fdt, uint32_t *next_phandle,
     qemu_fdt_setprop_cell(fdt, name, "value", poweroff);
     g_free(name);
 }
+
+uint32_t riscv_create_fdt_riscv_iommu_sys(void *fdt, hwaddr addr, hwaddr size,
+                                          uint32_t *next_phandle,
+                                          uint32_t irq_chip,
+                                          uint32_t msi_phandle,
+                                          uint32_t iommu_sys_irq)
+{
+    const char comp[] = "riscv,iommu";
+    g_autofree char *iommu_node = NULL;
+    uint32_t iommu_phandle;
+
+    iommu_node = g_strdup_printf("/soc/iommu@%"HWADDR_PRIx, addr);
+    qemu_fdt_add_subnode(fdt, iommu_node);
+
+    qemu_fdt_setprop(fdt, iommu_node, "compatible", comp, sizeof(comp));
+    qemu_fdt_setprop_cell(fdt, iommu_node, "#iommu-cells", 1);
+
+    iommu_phandle = next_phandle ? (*next_phandle)++ : qemu_fdt_alloc_phandle(fdt);
+    qemu_fdt_setprop_cell(fdt, iommu_node, "phandle", iommu_phandle);
+
+    qemu_fdt_setprop_sized_cells(fdt, iommu_node, "reg", 2, addr, 2, size);
+    qemu_fdt_setprop_cell(fdt, iommu_node, "interrupt-parent", irq_chip);
+
+    qemu_fdt_setprop_cells(fdt, iommu_node, "interrupts",
+        iommu_sys_irq + RISCV_IOMMU_INTR_CQ, FDT_IRQ_TYPE_EDGE_LOW,
+        iommu_sys_irq + RISCV_IOMMU_INTR_FQ, FDT_IRQ_TYPE_EDGE_LOW,
+        iommu_sys_irq + RISCV_IOMMU_INTR_PM, FDT_IRQ_TYPE_EDGE_LOW,
+        iommu_sys_irq + RISCV_IOMMU_INTR_PQ, FDT_IRQ_TYPE_EDGE_LOW);
+
+    qemu_fdt_setprop_cell(fdt, iommu_node, "msi-parent", msi_phandle);
+
+    return iommu_phandle;
+}
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index ab6c53c78a..8a165f4d9e 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -869,46 +869,6 @@ static void create_fdt_virtio_iommu(RISCVVirtState *s, uint16_t bdf)
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
@@ -947,8 +907,14 @@ static void finalize_fdt(RISCVVirtState *s)
     create_fdt_virtio(s, irq_virtio_phandle);
 
     if (virt_is_iommu_sys_enabled(s)) {
-        create_fdt_iommu_sys(s, irq_mmio_phandle, msi_pcie_phandle,
-                             &iommu_sys_phandle);
+        iommu_sys_phandle =
+            riscv_create_fdt_riscv_iommu_sys(MACHINE(s)->fdt,
+                                             s->memmap[VIRT_IOMMU_SYS].base,
+                                             s->memmap[VIRT_IOMMU_SYS].size,
+                                             &phandle,
+                                             irq_mmio_phandle,
+                                             msi_pcie_phandle,
+                                             IOMMU_SYS_IRQ);
     }
     create_fdt_pcie(s, irq_pcie_phandle, msi_pcie_phandle,
                     iommu_sys_phandle);
diff --git a/include/hw/riscv/fdt-common.h b/include/hw/riscv/fdt-common.h
index e377682b32..65711468b8 100644
--- a/include/hw/riscv/fdt-common.h
+++ b/include/hw/riscv/fdt-common.h
@@ -43,4 +43,9 @@ void riscv_create_fdt_syscon(void *fdt, uint32_t *next_phandle,
                              hwaddr addr, hwaddr size,
                              uint32_t reboot, uint32_t poweroff,
                              bool sifive_test_compat);
+uint32_t riscv_create_fdt_riscv_iommu_sys(void *fdt, hwaddr addr, hwaddr size,
+                                          uint32_t *next_phandle,
+                                          uint32_t irq_chip,
+                                          uint32_t msi_phandle,
+                                          uint32_t iommu_sys_irq);
 #endif
-- 
2.43.0


