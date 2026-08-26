Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A20C5DF97
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 21:48:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzLSd-0003IE-7D; Wed, 26 Aug 2026 17:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzLSc-0003Hy-4C
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 17:47:06 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzLSa-0001M4-Eo
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 17:47:05 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67QKdhHF2020932
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 21:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 327+8iSvgAaeuSiMvm/59dG2LTKR2DADHsohCzz2q9c=; b=H+p1Opmj13dXVriT
 AXV2HyqxuT0iTF24v+46Toj8B3/c+h/sDdoPjKIafFT4aIJT8Hw9pL/qBF3uPGdl
 l4cg/uqXkY8i35H9KZ1+T34yfBmpQa/7FcoeGLwj19IUhnluwezFdnvP+CcnZ1Lq
 5A9soKiR1W6CDtupe0WVs0OJPK3E9S0g9zjyyQRV8lzlx8KxI4QYmdf4q/TNXYTN
 dnKXoyvAVpabHBXyDejI7TunjlveyhHYMnNj97kh91Ti09R90ie2JbVOK70IZsTn
 VXfLrJGaoKoHys0hnBO+Gd4k9v/FJMXhUBSnXKNobXZW+Yukd533lOMejDZcOuqd
 yFArZQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga075a4af-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 21:47:03 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8f0ed4fe79aso25910356d6.0
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 14:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787780823; x=1788385623; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=327+8iSvgAaeuSiMvm/59dG2LTKR2DADHsohCzz2q9c=;
 b=ZLbihkiHax40Fljgpv1UMNOWO2mNP3/pNay1alkeGGarVJd4GkFP7LS2/fnoUk7eQK
 o5Dk9wNVqnGqAy9Z5TzccpzBa3FX19Ui8V4XiSVjQUQHJR55+wZB/3tb4za0re6s6Yeo
 g6xMk2I1lsdhpce5zWsJ95SpbaOpxxYJdx+yql2WdupV/AgigFxJE0LPypJLLGkZdu3y
 VFVAPTPUXrLYqio/T42GooKT+WI6RDvqWUnaBzgyV/OAuRHJykG8pl9th+aC7ocQz36K
 ebESi9TrfnWuxcI3zduHCw6FrVr/0GCp+7nckWEhTgV/80PZ/Wp6nwr6WhIkCI7/dcPJ
 d6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787780823; x=1788385623;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=327+8iSvgAaeuSiMvm/59dG2LTKR2DADHsohCzz2q9c=;
 b=B2F5gQYQsLYm9UUg5F7vVW07glrtEOoYXw00qgdIKVpsAWGjbRHfzFuc3ISoBLjYrN
 tTPZeQWouTydpG+RED2TiocX7bQhjUKc/EoLZ+iTdBRI3FkR04eeG73yQdPFCWIt5LDu
 rDHKGM6QY6euj+iSd9LaBrOMywjynUR7TQU6zxtQ0XWGjISFwI0gpjQn+plQoF1wxQKa
 xGn/bovksN2S0WBOgF4oVupP533MmjSQLfI8tgBQsOawOlB2Ax/DWHjxMVnB7awBm2d+
 mpzzpOO+//kYIaUgsPQNv14sEkEUr1wk53uiGqf4kW93RpG269Q2SX6tbaJZtlNIYrUQ
 N9eA==
X-Gm-Message-State: AFuF++kZ2mskGoK4ffBMPypKFekU65ttj8qPhc3f8SVNfhx81aipW1sD
 k6jHeKqw3kp/Jb+jdcNfXh9+zljKBGf61bOyin/UUQxbJND4EcwFU77Z+jrBRj3niGeMQy3CHD+
 lLzw0tzZIHH5ZtC4SBPtNrTetJFEj0eoMj252ZNkBHo4NRRUvP4sfegzgOA==
X-Gm-Gg: AR+sD113vauhHYYEYWGIXLeiPmJjQcn7CNyk3z9TK0dUHA+Arigj1uZrpQsVq9AB3mP
 nHMQXCZtlypPNCD6J73X75+J4Hq+Ak8UHKju7mBxs0mlwL9lvB8I791JtYhz1IMXyrLaPEyi3nX
 Mt4ZqnZiBNbHT8p85MQ2aoP/XAUVJZy5+TLdY5KJHAbm2qkliEaCfO2+vV25hUbpiC/VrBlRzwY
 eDsWWiKlOo6ssdF4mL2aMQrVPxzToHA8lZTdyBE9Zz/BKd1BtkeYTb67llp2ENYEEdxyQ2c0JGx
 SnsucMj3TMYJljwPUw8MZJFcoR/QEiFp5/FaLAWMuoryti5wtNNiEEj+4RzOFQjUvFR1vNGM/Gl
 33DIcf3F+DiPIIvlGgi9bkk790cQCGI3JVH3C7A==
X-Received: by 2002:a05:6214:3199:b0:908:951f:415 with SMTP id
 6a1803df08f44-90cc78ad65emr123460366d6.13.1787780822649; 
 Wed, 26 Aug 2026 14:47:02 -0700 (PDT)
X-Received: by 2002:a05:6214:3199:b0:908:951f:415 with SMTP id
 6a1803df08f44-90cc78ad65emr123459656d6.13.1787780822070; 
 Wed, 26 Aug 2026 14:47:02 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90cd73e4117sm490916d6.24.2026.08.26.14.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 14:47:01 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v3 04/14] hw/riscv/fdt-common,
 virt.c: add riscv_create_fdt_riscv_iommu_sys()
Date: Wed, 26 Aug 2026 18:46:32 -0300
Message-ID: <20260826214643.122728-5-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826214643.122728-1-daniel.barboza@oss.qualcomm.com>
References: <20260826214643.122728-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: UFyvV4Le-ldftDyt2B-qE2fZu5Rov6R1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE4MyBTYWx0ZWRfXxEDz1JaN/ipL
 B4v1v3VfNN/bRbI9wvrcDbgk29UschBfBG3Cp+zh0cv4zJUpv0Orx/Xfu1RaJMp4iQ80gA6yREf
 dxoOU7jlk3RByv4UBjkNvct1Z9vnoMef/hmf9fXjPFn0CvUsrIwBQpZUq6/sB/DgOmxLiQ6s3E8
 s9/ttW74YYQJ9kBiIIEhe9pK/CswReW0tHwfRzVtkmta2gFgH1vdECMrsuJD0t7Or3lEquZWCur
 F7mDND+mSWfSCEDvxW2ortqD6hZdgkHbJLo2PBnA7FCiJZH5adlKiC2NyN5p1jpBvSHxFs5gRGD
 Hp+iVWobjbupXgzDt7qO9gh1yvyEPdE7OZ6jhC3hfzuJ14YcVxkhYRRmpZ75x8PiB13oag8cIic
 beRVjyylTXOr3/Jq6LyH+3cDY9KupuWmNFx8WGT0qOMd3dHcRYzZ/+L9jjIF3HkEIdH3FfC5KMk
 ydhRDEodaHVlBgm3liQ==
X-Proofpoint-GUID: UFyvV4Le-ldftDyt2B-qE2fZu5Rov6R1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE4MyBTYWx0ZWRfX54DspAOdaK+E
 tcPZwRYainaeRfZihZAVvjvg3RR27o4Swtll+PEabIoEcsTgH2J9g8LjRqjLjOGozvGX6c/fH91
 ZzSyYghS6F+GXQa/53D4G6Dxq94dOCg=
X-Authority-Analysis: v=2.4 cv=RPiD2Yi+ c=1 sm=1 tr=0 ts=6a8f5ed7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=AqYGxfEHplewfouIbmYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_06,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260183
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
iommu-sys device that is declared in the DT.

Create a helper to encapsulate the logic and avoid copy/pasting stuff
between boards.

No FDT changes intended.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/riscv/fdt-common.c         | 40 +++++++++++++++++++++++++++++
 hw/riscv/virt.c               | 47 ++++-------------------------------
 include/hw/riscv/fdt-common.h |  5 ++++
 3 files changed, 50 insertions(+), 42 deletions(-)

diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
index 4406887f98..0e3423acc8 100644
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
@@ -348,3 +350,41 @@ void riscv_create_fdt_syscon(void *fdt, uint32_t *phandle,
     qemu_fdt_setprop_cell(fdt, name, "value", poweroff);
     g_free(name);
 }
+
+void riscv_create_fdt_riscv_iommu_sys(void *fdt, hwaddr addr, hwaddr size,
+                                      uint32_t irq_chip,
+                                      uint32_t msi_phandle,
+                                      uint32_t *iommu_sys_phandle,
+                                      uint32_t iommu_sys_irq)
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
index 371a900071..211734c52b 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -868,46 +868,6 @@ static void create_fdt_virtio_iommu(RISCVVirtState *s, uint16_t bdf)
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
@@ -946,8 +906,11 @@ static void finalize_fdt(RISCVVirtState *s)
     create_fdt_virtio(s, irq_virtio_phandle);
 
     if (virt_is_iommu_sys_enabled(s)) {
-        create_fdt_iommu_sys(s, irq_mmio_phandle, msi_pcie_phandle,
-                             &iommu_sys_phandle);
+        riscv_create_fdt_riscv_iommu_sys(MACHINE(s)->fdt,
+                                         s->memmap[VIRT_IOMMU_SYS].base,
+                                         s->memmap[VIRT_IOMMU_SYS].size,
+                                         irq_mmio_phandle, msi_pcie_phandle,
+                                         &iommu_sys_phandle, IOMMU_SYS_IRQ);
     }
     create_fdt_pcie(s, irq_pcie_phandle, msi_pcie_phandle,
                     iommu_sys_phandle);
diff --git a/include/hw/riscv/fdt-common.h b/include/hw/riscv/fdt-common.h
index c643681155..79463abfa5 100644
--- a/include/hw/riscv/fdt-common.h
+++ b/include/hw/riscv/fdt-common.h
@@ -43,4 +43,9 @@ void riscv_create_fdt_syscon(void *fdt, uint32_t *phandle,
                              hwaddr addr, hwaddr size,
                              uint32_t reboot, uint32_t poweroff,
                              bool sifive_test_compat);
+void riscv_create_fdt_riscv_iommu_sys(void *fdt, hwaddr addr, hwaddr size,
+                                      uint32_t irq_chip,
+                                      uint32_t msi_phandle,
+                                      uint32_t *iommu_sys_phandle,
+                                      uint32_t iommu_sys_irq);
 #endif
-- 
2.43.0


