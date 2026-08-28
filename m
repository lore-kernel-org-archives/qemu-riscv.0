Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F71C61DD9
	for <qemu-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 20:42:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x03MW-0007JW-8k; Fri, 28 Aug 2026 16:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x03MU-0007JO-Ny
 for qemu-riscv@nongnu.org; Fri, 28 Aug 2026 16:39:42 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x03MT-0006VE-0G
 for qemu-riscv@nongnu.org; Fri, 28 Aug 2026 16:39:42 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67SJdWtR125953
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 20:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5lxTjGnQRpUm8uZHl82+qqHwXTfZgivwQUa9kxfBh3Q=; b=YJED9Os0O8zR8jEs
 DDy1IGZiysAtTJ+RrD702X4ScW7DPTB3ykGmuJ0Hyjc1J5bdTVtt32achbaf/riC
 EV+7GhLYgN+t2AQbUBitz1eIX98gGvUscMOfpEvYRp1rrP6CEb9bePzh2k7PbJFZ
 iMR84p+TXra9XAnYfg9MtgWBa3xh1MJWZYHpx8r8ydyX5MfJEvUpl2yL84LzDtFH
 JBOz3MmTtFAT0oX4N3LwBAxGjksELzOzP5FPa/jePzwOCBKh2oJiHTsn+FyG64Za
 JG9f9DedsWEXxetdVz9a1LSFp14FqobRYdjeAesTcRDSJUTF3+WWSH53C7TFEfGm
 SMz5Ng==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbgpc059e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 20:39:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-9375d92d8cdso214655385a.2
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 13:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787949579; x=1788554379; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=5lxTjGnQRpUm8uZHl82+qqHwXTfZgivwQUa9kxfBh3Q=;
 b=OrbBEL5WtoqOVOWnZIg4Vaz0vxrHrHFSSuWrNnqIg8Fe8hF9DNjnf/o4OV77GJFe90
 knVzBeyf2AOM91HbQhlsjAkrrWFpzvdVYGa6fK88zdV6FjvvEsUVlHQ7nvbCTxGW6k8H
 W46AMj3QfFWYdABxBlXKkc2Kqv/qfUGCCOwRgT+SANPHslZFtx+vKJPhi2R+pWuyAwVh
 gGUlCVOSRxKSsXx/qp6BCeP27PQYRnx2f/iI8A9EAawlYW7b3QGMf1qDBbr7WCchDkdD
 qGydE3TdERe2VdFU5STSyhaLpzpnqzeE06yKhLYJphWNHz00HY6bPsUKhkbD9EH//FId
 VGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787949579; x=1788554379;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=5lxTjGnQRpUm8uZHl82+qqHwXTfZgivwQUa9kxfBh3Q=;
 b=HVCs/OHiUVsyef1uC8v9e935EK9F1EK1ZmnQQ+06BP7rbevpzqk7VWnc0wQFfl8pJD
 LW6RfSRgoMhzL8NpG9h1sIQD4hSlIJgp5e6MVSd9dUEytKlj4uKemTDw2aRz2g53vNc8
 HVGC6B4ywr3hOJYndLOqPiW7iIAbuEqbeOanrBfHC8xMpESUvRXgGd8sNE/KM0Qf78Mj
 0GoEHamjCGHV3kkuGAxSBEGO9heBIwFfJAaot8Qs2fB2TNVbY+mwsUMKnW2LHwsll/Xk
 yBdTPM578MH0MPPzGGv89Ng9vm7eU1ZslC+YeVunz8UbFUX0DJ2kAhZeFsDybwPuk0XF
 bysg==
X-Gm-Message-State: AFuF++kAR8HfFxYHmQHusMlDoaLRhY8Vft+sOEEBUKCjL1YdRPTm3KPA
 fwEwmsPIIBTyGBejPwqsR80PAeztPkWyhXJPGi2W7zWLvPdJ2Qu29U+mDrYrUZaGslDbjeNqOuz
 +yfVLSn6qG97r4j6a9NedP+G0SOfgLWHbaPtOn50pv7qnz1Fa2GFU/hhm2Q==
X-Gm-Gg: AR+sD13f7NOvNjbtbPDWfhEZeTiodmSYdl5aJ499mNswpF5PwsjTO+wt79CTjCaoKaz
 JCCGzrf0Md08atDSrk1Zf81+Pu9uvBlYUDpPOk3tA1wXTzWN4dm07wpv1ZGKhcB4Lxuullxk+31
 T4K9B4OSkyLtqNpSxxRUFpgcemot1rlqDMvfeMkLKAAtgFTcBu6re3j7qcflvoR8P+q8DIhv8rc
 dKxhf1SSzxLKvToBRVJmk2qf40QIkMhqT+bdhvEXTmgT2pwq9blQDUw6rCRGD9J+Et4YCnveK8y
 gmrjYTWR+NSmZ/+ALXXPNJfX7m089qGhnA9Ay+bp8qx4XEC5wlGHhsaq7OnPhHxSJsS1UujUtmv
 DEiYI7Rk3Qu4QwrHma9+10V59aE+XUTk0AG7ERw==
X-Received: by 2002:a05:620a:6193:b0:936:bc40:cae2 with SMTP id
 af79cd13be357-9391398ee3bmr1019478285a.39.1787949578959; 
 Fri, 28 Aug 2026 13:39:38 -0700 (PDT)
X-Received: by 2002:a05:620a:6193:b0:936:bc40:cae2 with SMTP id
 af79cd13be357-9391398ee3bmr1019473185a.39.1787949578558; 
 Fri, 28 Aug 2026 13:39:38 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-939173f2758sm218063985a.37.2026.08.28.13.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2026 13:39:38 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v5 04/15] hw/riscv/fdt-common,
 virt.c: add riscv_create_fdt_riscv_iommu_sys()
Date: Fri, 28 Aug 2026 17:39:06 -0300
Message-ID: <20260828203918.350131-5-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828203918.350131-1-daniel.barboza@oss.qualcomm.com>
References: <20260828203918.350131-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HTTViE_LxHJSP41lKt6Ru1v6uL8uIGyb
X-Proofpoint-GUID: HTTViE_LxHJSP41lKt6Ru1v6uL8uIGyb
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE3OSBTYWx0ZWRfX3s78F5sec6Uz
 KWMeo41QlLhKaVGsf/7Q0Y9DfRYCKKLeBFUNJi2o5+MeCBUSH6ypzJQ5A2OBSOFAo6vkVfETq+8
 KLdURgomyyOwSys5NVsHOR3a70wXyWQ=
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a91f20b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=FRSEYCzRAAAA:8 a=4Tf7kDObtFz1SKwdFkIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE3OSBTYWx0ZWRfX2iB/dIyURj8t
 aRsJqMVj1Kpl41dMIhMlppK6kcU9LqGK/H/B+JK8aJDH3sEHU7ODFEgt518v0ecx585Z020ecuL
 oVPc6wYXMTrH9gQx3HHjQkv8P0DjvCz7Ww/7Ofujl3hbaqIMIq4msCVH6O9OmWHOj6k/IUIFyBd
 P0ivjZlyW1HzQQifs1c34K3bSdssSbt7fyJpJSwR5u2eIXV7ACL4Fena305v+W3nXR7AWDm8NNH
 Vmvhv/D5DAtETpe3dym6Z2VbDDy4q7cTO3WL3aPhqsw9vmc6Dx4nrgKYDr90BVMy4Gy+LiYlES8
 kki+jQyCvk7a10K+dGF5vVBTzPcz9vBfNE5Fwk2AEXJLUgnsN0m98Iudct38lZbJOXnG7tmQc4Y
 R3mTatvOksq9VlAPuKDVqmBDHYluOTgjYfVyiw+YWVdXWjaz9YJroV+sWGPRW4cIufATHlx0gyD
 PVOaySSC6rZ9iuWz1yA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280179
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

Both the 'virt' board and the future 'riscv-server-ref' boards uses an
iommu-sys device that is declared in the DT.  Create a helper to
encapsulate the logic and avoid copy/pasting stuff between boards.

The helper will return the iommu phandle value instead of returning void
and writing the used phandle in an extra argument.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Chao Liu <chao.liu@processmission.com>
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


