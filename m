Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F332C5DF97
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 21:47:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzLSn-0003Mp-PP; Wed, 26 Aug 2026 17:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzLSm-0003Ls-A0
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 17:47:16 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzLSk-0001NV-7V
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 17:47:16 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67QKe4TC2021859
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 21:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +ZETKdPLy6IjmU6J+Sc+itCX64uxmtcifgBIGKkcOp8=; b=QIs6tt0OjNcvv5jI
 MiG0yUPxCcGgtnNzxoORi1daqLwrERNAuLue/vxjOBJGtuciNn0rXThOVbef0May
 YxdXZJyESPa0OZmtSg6mMFv5Ppn/UdfDS23niw33kWuhc7wBijzl0HEx6wpBwRkN
 FeU58lNESZRO5QvGPa4nKbqCYIwEFdohLB2w0wWDlpUMHVPVGMiJbor9Z3o9QzLS
 Y4LO8a9/J/uYGTEw6HzJknJEMKc+Om9YmoyVxXfoDq4Fc/CTpF/Y54lJnC9gv77p
 oUjetPdXfR4N0Xf7pU0ZshUdsE6HWUU/125WWMSakrdjln8r7Vqu6O3H6Uy8qPJ0
 H4omRQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga075a4b0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 21:47:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-90cc915d1d9so18169256d6.2
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 14:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787780833; x=1788385633; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=+ZETKdPLy6IjmU6J+Sc+itCX64uxmtcifgBIGKkcOp8=;
 b=Kqy2/xPmeBP8VW2kfWs7zQbqHeJNOzIhKg8ZFpFaPdKjNpdGVjuTVfsy+Ugp2Pq9UR
 22CEJGMe2Za/u4Hmu/GwF5+cRzHQMTL9PpBHcx0SsN019xo6rPBxNevZB5Kn2PSdl8gz
 cdXsYQjIuCyohNRxaSzJwAjdMM5cayzEHuCczOUY578lI9iOfsVZ1x4vrfu2uEqcmec2
 sqpWLPfGqi9vC257lm1bBNbZ8kqkwN7/932t3z7iXrLTLKowzywCbdyqk68OFled1nTc
 XchFj2d979nUr8m7MFAXGXjMO/lp2O2GE1FDR/6WQK/VJyVo7+e8N6l9iohkMUuDzJEY
 t8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787780833; x=1788385633;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=+ZETKdPLy6IjmU6J+Sc+itCX64uxmtcifgBIGKkcOp8=;
 b=LXHuRnWfcqDQd+IFhhYJ7Z0XqvyUM3IMdPVWpfZ+HUBYUaQdJ3qdmvzsqhlKDEPSrI
 oJzrv2pfYwO2n4l0p/4RevuLsIfPIEZ66IZFSWD7FFxw2psm0knI11Xgrl9xIsQHdSKW
 5mSDGJooBu3xWUc0OxsGYOhiLRqA7V/lz4dyhBxciQnbqCmD/KkWfxn6pqBsIMkeg8ua
 jzesazkFjEka8veVrgLEcNY/zOqjVOO87tQzg+F2gp51HA/DwPmrI2qbXa/eLgQAofFm
 mRkY2CS/tXrZjt3PLJsY3ynHeIyAlCRh5FSoAhBcoXB3cAIRuo+KYijval66U9CxQT93
 +yDA==
X-Gm-Message-State: AFuF++nOY2y44EqbXg4zMKx13YyLj0Dp+gaAb5oe4kV1WZrelr26ZBju
 0lGugGFDCqCtHyHYm4r2WpWxPnxZD7Y12PwiVmAvg5ZfRMKghmpAIuyM3qvboONtGXzsiCrf0tj
 yLZQbfMH0oMv7Yt69ilYMWI4BeW6ra2d8DyhDpCVWgOkd8+mSqSAc21i1hQ==
X-Gm-Gg: AR+sD10/Twc080PgSwevXnad1YyRdRTxbMQhx7NSa9jdtjs5yF++1dTAQfCYqn3M3VZ
 wrMDC56Wkc9ji3dsF9Hy8xkD11u2bth4wzqCKx+LKw2X/QPkAiEvW0SYARTQMEs072mziQCsazN
 YV5sairaFOhOwwIjZ5LJf0nIS/tugBb/QHnllsDuqxNSYxc5SNt4jCjvymTDknPDQoIuBYeGWwb
 1dx4PYe69KnVxGLjdm5AgnD0bJN1RATveW9yX/DelCwCbgtD8lS0AaIZTxpO6+B45zjtzH5q+gj
 dkqOV7wSzitohdXUeKzes0uCoZaB0aSrnK15Z3dWpsxORgxE+0RAHM/bl3v0ALzsNgSZ0wlyV8h
 ftrH2YR4u6aAGaUS4DItPwYXiG7iwkPRCQW1WIQ==
X-Received: by 2002:a05:6214:4608:b0:907:c0e1:62e4 with SMTP id
 6a1803df08f44-90cc792d3e7mr128738016d6.9.1787780832593; 
 Wed, 26 Aug 2026 14:47:12 -0700 (PDT)
X-Received: by 2002:a05:6214:4608:b0:907:c0e1:62e4 with SMTP id
 6a1803df08f44-90cc792d3e7mr128737336d6.9.1787780832042; 
 Wed, 26 Aug 2026 14:47:12 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90cd73e4117sm490916d6.24.2026.08.26.14.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 14:47:11 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v3 08/14] hw/riscv/fdt-common,
 virt.c: add riscv_create_fdt_socket_aclint()
Date: Wed, 26 Aug 2026 18:46:36 -0300
Message-ID: <20260826214643.122728-9-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826214643.122728-1-daniel.barboza@oss.qualcomm.com>
References: <20260826214643.122728-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mZalYDk0WRzcB5waK5ePaRTdTXKBDFRY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE4MyBTYWx0ZWRfX7HtzUosQ3yK0
 U1BsISNhft4vWDBBufCCc8Y54ykGQI7HfyqVy0east9/TCGYN9Cr63u0fBMwjW2iLYpijZwE43v
 cp2EW6O9nZFbs/PSjJU+Wz8IP8+QA8zQeKE+/qRK+as3xcu7TNuNrcZcwl2ym/APsEahFEoDaB9
 kfQ6hnWRWzUj/Y224fx/7JqEp+g5UlhgyJkkxGjaIUAQaNGi8+/NwskXlPzjGaNu8eghGjMeH1B
 PNRmOWr5ni//YwVNxGbfNqhTjVmVNd8Eb+mLQW5Ee+pMKo13bCxwgZrNHa/dsXrg7I0b94dnE4C
 5bstSZC9Xn0is/iB0X7PHtBO6U1+Clry80RU6XPGxkm2XqNw1E9nFnDVHnGtPqTc7teKT+5rAN0
 L6i26XVcO3qprCgsnG++MzQ3zAlIR6/XVgxK1EC62pVYbfC9uZhPObZMnyQV9bsvwRklryIE9oY
 FboA5Dyq1Bll1UIoHpg==
X-Proofpoint-GUID: mZalYDk0WRzcB5waK5ePaRTdTXKBDFRY
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE4MyBTYWx0ZWRfX5mJ7uCieRRCq
 B4xB5OSZmOLxMkM1lwJXys6Tp1VNg4lPgL6YPme+yWU/a1fXk7AIBpYzIz1c3zJbA/8h3iAIZ3L
 p+1QR/Ay4X16WlX4UAhOafwZYmTAf6g=
X-Authority-Analysis: v=2.4 cv=RPiD2Yi+ c=1 sm=1 tr=0 ts=6a8f5ee1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=5MeqwQr2QVKu_SNN6D4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
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

Yet another FDT that we want to move to a helper to avoid copy/pasting
code to other boards that will use a mtimer.  In particular the future
'riscv-server-ref' board.

No FDT changes made.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/riscv/fdt-common.c         |  96 ++++++++++++++++++++++++++++++++
 hw/riscv/virt.c               | 101 ++++------------------------------
 include/hw/riscv/fdt-common.h |  11 ++++
 3 files changed, 119 insertions(+), 89 deletions(-)

diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
index 3107c6b66c..e6bb107309 100644
--- a/hw/riscv/fdt-common.c
+++ b/hw/riscv/fdt-common.c
@@ -16,6 +16,7 @@
 #include "target/riscv/cpu_bits.h"
 #include "hw/riscv/riscv-iommu-bits.h"
 #include "hw/riscv/iommu.h"
+#include "hw/intc/riscv_aclint.h"
 #include "hw/intc/riscv_imsic.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pcie_host.h"
@@ -699,3 +700,98 @@ void riscv_create_fdt_socket_aplic(void *fdt, APLICFdtProps *props,
 
     aplic_phandles[props->socket] = aplic_s_phandle;
 }
+
+void riscv_create_fdt_socket_aclint(void *fdt, ACLINTFdtProps *props,
+                                    uint32_t *intc_phandles)
+{
+    uint32_t aclint_cells_size = props->num_harts * sizeof(uint32_t) * 2;
+    g_autofree uint32_t *aclint_mswi_cells = NULL;
+    g_autofree uint32_t *aclint_sswi_cells = NULL;
+    g_autofree uint32_t *aclint_mtimer_cells = NULL;
+    hwaddr addr, size;
+    char *name;
+    int cpu;
+
+    aclint_mswi_cells = g_new0(uint32_t, props->num_harts * 2);
+    aclint_mtimer_cells = g_new0(uint32_t, props->num_harts * 2);
+    aclint_sswi_cells = g_new0(uint32_t, props->num_harts * 2);
+
+    for (cpu = 0; cpu < props->num_harts; cpu++) {
+        aclint_mswi_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
+        aclint_mswi_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_SOFT);
+        aclint_mtimer_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
+        aclint_mtimer_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_TIMER);
+        aclint_sswi_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
+        aclint_sswi_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_S_SOFT);
+    }
+
+    if (props->aia_type != AIA_TYPE_APLIC_IMSIC) {
+        addr = props->clint->base + (props->clint->size * props->socket);
+        name = g_strdup_printf("/soc/mswi@%"HWADDR_PRIx, addr);
+
+        qemu_fdt_add_subnode(fdt, name);
+        qemu_fdt_setprop_string(fdt, name, "compatible", "riscv,aclint-mswi");
+        qemu_fdt_setprop_sized_cells(fdt, name, "reg",
+                                     2, addr, 2, RISCV_ACLINT_SWI_SIZE);
+        qemu_fdt_setprop(fdt, name, "interrupts-extended",
+                         aclint_mswi_cells, aclint_cells_size);
+        qemu_fdt_setprop(fdt, name, "interrupt-controller", NULL, 0);
+        qemu_fdt_setprop_cell(fdt, name, "#interrupt-cells", 0);
+
+        if (props->numa_enabled) {
+            qemu_fdt_setprop_cell(fdt, name, "numa-node-id", props->socket);
+        }
+
+        g_free(name);
+    }
+
+    if (props->aia_type == AIA_TYPE_APLIC_IMSIC) {
+        addr = props->clint->base +
+               (RISCV_ACLINT_DEFAULT_MTIMER_SIZE * props->socket);
+        size = RISCV_ACLINT_DEFAULT_MTIMER_SIZE;
+    } else {
+        addr = props->clint->base + RISCV_ACLINT_SWI_SIZE +
+               (props->clint->size * props->socket);
+        size = props->clint->size - RISCV_ACLINT_SWI_SIZE;
+    }
+
+    name = g_strdup_printf("/soc/mtimer@%"HWADDR_PRIx, addr);
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop_string(fdt, name, "compatible",
+                            "riscv,aclint-mtimer");
+    qemu_fdt_setprop_sized_cells(fdt, name, "reg",
+        2, addr,
+        2, size - RISCV_ACLINT_DEFAULT_MTIME,
+        2, addr + RISCV_ACLINT_DEFAULT_MTIMECMP,
+        2, RISCV_ACLINT_DEFAULT_MTIME);
+    qemu_fdt_setprop(fdt, name, "interrupts-extended",
+                     aclint_mtimer_cells, aclint_cells_size);
+
+    if (props->numa_enabled) {
+        qemu_fdt_setprop_cell(fdt, name, "numa-node-id", props->socket);
+    }
+
+    g_free(name);
+
+    if (props->aia_type != AIA_TYPE_APLIC_IMSIC) {
+        addr = props->aclint_sswi->base
+               + (props->aclint_sswi->size * props->socket);
+
+        name = g_strdup_printf("/soc/sswi@%"HWADDR_PRIx, addr);
+        qemu_fdt_add_subnode(fdt, name);
+        qemu_fdt_setprop_string(fdt, name, "compatible",
+            "riscv,aclint-sswi");
+        qemu_fdt_setprop_sized_cells(fdt, name, "reg",
+                                     2, addr, 2, props->aclint_sswi->size);
+        qemu_fdt_setprop(fdt, name, "interrupts-extended",
+                         aclint_sswi_cells, aclint_cells_size);
+        qemu_fdt_setprop(fdt, name, "interrupt-controller", NULL, 0);
+        qemu_fdt_setprop_cell(fdt, name, "#interrupt-cells", 0);
+
+        if (props->numa_enabled) {
+            qemu_fdt_setprop_cell(fdt, name, "numa-node-id", props->socket);
+        }
+
+        g_free(name);
+    }
+}
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 117808a921..2e1d1ea12b 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -180,93 +180,6 @@ static void virt_flash_map(RISCVVirtState *s,
                     sysmem);
 }
 
-static void create_fdt_socket_aclint(RISCVVirtState *s,
-                                     int socket,
-                                     uint32_t *intc_phandles)
-{
-    int cpu;
-    char *name;
-    unsigned long addr, size;
-    uint32_t aclint_cells_size;
-    g_autofree uint32_t *aclint_mswi_cells = NULL;
-    g_autofree uint32_t *aclint_sswi_cells = NULL;
-    g_autofree uint32_t *aclint_mtimer_cells = NULL;
-    MachineState *ms = MACHINE(s);
-
-    aclint_mswi_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
-    aclint_mtimer_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
-    aclint_sswi_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
-
-    for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
-        aclint_mswi_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
-        aclint_mswi_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_SOFT);
-        aclint_mtimer_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
-        aclint_mtimer_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_TIMER);
-        aclint_sswi_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
-        aclint_sswi_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_S_SOFT);
-    }
-    aclint_cells_size = s->soc[socket].num_harts * sizeof(uint32_t) * 2;
-
-    if (s->aia_type != VIRT_AIA_TYPE_APLIC_IMSIC) {
-        addr = s->memmap[VIRT_CLINT].base +
-               (s->memmap[VIRT_CLINT].size * socket);
-        name = g_strdup_printf("/soc/mswi@%lx", addr);
-
-        qemu_fdt_add_subnode(ms->fdt, name);
-        qemu_fdt_setprop_string(ms->fdt, name, "compatible",
-            "riscv,aclint-mswi");
-        qemu_fdt_setprop_sized_cells(ms->fdt, name, "reg",
-            2, addr, 2, RISCV_ACLINT_SWI_SIZE);
-        qemu_fdt_setprop(ms->fdt, name, "interrupts-extended",
-            aclint_mswi_cells, aclint_cells_size);
-        qemu_fdt_setprop(ms->fdt, name, "interrupt-controller", NULL, 0);
-        qemu_fdt_setprop_cell(ms->fdt, name, "#interrupt-cells", 0);
-        riscv_socket_fdt_write_id(ms, name, socket);
-        g_free(name);
-    }
-
-    if (s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
-        addr = s->memmap[VIRT_CLINT].base +
-               (RISCV_ACLINT_DEFAULT_MTIMER_SIZE * socket);
-        size = RISCV_ACLINT_DEFAULT_MTIMER_SIZE;
-    } else {
-        addr = s->memmap[VIRT_CLINT].base + RISCV_ACLINT_SWI_SIZE +
-               (s->memmap[VIRT_CLINT].size * socket);
-        size = s->memmap[VIRT_CLINT].size - RISCV_ACLINT_SWI_SIZE;
-    }
-    name = g_strdup_printf("/soc/mtimer@%lx", addr);
-    qemu_fdt_add_subnode(ms->fdt, name);
-    qemu_fdt_setprop_string(ms->fdt, name, "compatible",
-        "riscv,aclint-mtimer");
-    qemu_fdt_setprop_sized_cells(ms->fdt, name, "reg",
-        2, addr + RISCV_ACLINT_DEFAULT_MTIME,
-        2, size - RISCV_ACLINT_DEFAULT_MTIME,
-        2, addr + RISCV_ACLINT_DEFAULT_MTIMECMP,
-        2, RISCV_ACLINT_DEFAULT_MTIME);
-    qemu_fdt_setprop(ms->fdt, name, "interrupts-extended",
-        aclint_mtimer_cells, aclint_cells_size);
-    riscv_socket_fdt_write_id(ms, name, socket);
-    g_free(name);
-
-    if (s->aia_type != VIRT_AIA_TYPE_APLIC_IMSIC) {
-        addr = s->memmap[VIRT_ACLINT_SSWI].base +
-               (s->memmap[VIRT_ACLINT_SSWI].size * socket);
-
-        name = g_strdup_printf("/soc/sswi@%lx", addr);
-        qemu_fdt_add_subnode(ms->fdt, name);
-        qemu_fdt_setprop_string(ms->fdt, name, "compatible",
-            "riscv,aclint-sswi");
-        qemu_fdt_setprop_sized_cells(ms->fdt, name, "reg",
-            2, addr, 2, s->memmap[VIRT_ACLINT_SSWI].size);
-        qemu_fdt_setprop(ms->fdt, name, "interrupts-extended",
-            aclint_sswi_cells, aclint_cells_size);
-        qemu_fdt_setprop(ms->fdt, name, "interrupt-controller", NULL, 0);
-        qemu_fdt_setprop_cell(ms->fdt, name, "#interrupt-cells", 0);
-        riscv_socket_fdt_write_id(ms, name, socket);
-        g_free(name);
-    }
-}
-
 static void create_fdt_socket_plic(RISCVVirtState *s,
                                    int socket,
                                    uint32_t *phandle, uint32_t *intc_phandles,
@@ -347,6 +260,7 @@ static void create_fdt_sockets(RISCVVirtState *s,
     bool numa_enabled = riscv_numa_enabled(ms);
     bool is_32_bit = riscv_is_32bit(&s->soc[0]);
     APLICFdtProps aplic_props;
+    ACLINTFdtProps aclint_props;
 
     riscv_fdt_create_cpu_socket_subnode(ms->fdt,
         kvm_enabled() ? kvm_riscv_get_timebase_frequency(&s->soc->harts[0]) :
@@ -354,6 +268,13 @@ static void create_fdt_sockets(RISCVVirtState *s,
 
     intc_phandles = g_new0(uint32_t, ms->smp.cpus);
 
+    if (virt_aclint_allowed() && s->have_aclint) {
+        aclint_props.clint = &s->memmap[VIRT_CLINT];
+        aclint_props.aclint_sswi = &s->memmap[VIRT_ACLINT_SSWI];
+        aclint_props.aia_type = s->aia_type;
+        aclint_props.numa_enabled = numa_enabled;
+    }
+
     phandle_pos = ms->smp.cpus;
     for (socket = (socket_count - 1); socket >= 0; socket--) {
         hwaddr memaddr = s->memmap[VIRT_DRAM].base +
@@ -372,8 +293,10 @@ static void create_fdt_sockets(RISCVVirtState *s,
                                        socket, riscv_numa_enabled(ms));
 
         if (virt_aclint_allowed() && s->have_aclint) {
-            create_fdt_socket_aclint(s, socket,
-                                     &intc_phandles[phandle_pos]);
+            aclint_props.socket = socket;
+            aclint_props.num_harts = s->soc[socket].num_harts;
+            riscv_create_fdt_socket_aclint(ms->fdt, &aclint_props,
+                                           &intc_phandles[phandle_pos]);
         } else if (tcg_enabled()) {
             hwaddr clintaddr = s->memmap[VIRT_CLINT].base +
                                s->memmap[VIRT_CLINT].size * socket;
diff --git a/include/hw/riscv/fdt-common.h b/include/hw/riscv/fdt-common.h
index 1bfc85cb77..3d121d1098 100644
--- a/include/hw/riscv/fdt-common.h
+++ b/include/hw/riscv/fdt-common.h
@@ -63,6 +63,15 @@ typedef struct APLICFdtProps {
     int aia_type;
 } APLICFdtProps;
 
+typedef struct ACLINTFdtProps {
+    const MemMapEntry *clint;
+    const MemMapEntry *aclint_sswi;
+    int socket;
+    int num_harts;
+    int aia_type;
+    bool numa_enabled;
+} ACLINTFdtProps;
+
 void *riscv_create_board_device_tree(const char *model, const char *compatible,
                                      int *fdt_size);
 void riscv_create_fdt_socket_memory(void *fdt, hwaddr addr, uint64_t size,
@@ -117,4 +126,6 @@ void riscv_create_fdt_socket_aplic(void *fdt, APLICFdtProps *props,
                                    uint32_t *phandle,
                                    uint32_t *intc_phandles,
                                    uint32_t *aplic_phandles);
+void riscv_create_fdt_socket_aclint(void *fdt, ACLINTFdtProps *props,
+                                    uint32_t *intc_phandles);
 #endif
-- 
2.43.0


