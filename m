Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14473C61DBD
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 21:25:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wyycu-0003gO-LZ; Tue, 25 Aug 2026 17:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wyycs-0003fN-Lc
 for qemu-riscv@nongnu.org; Tue, 25 Aug 2026 17:24:10 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wyycq-0002KN-G1
 for qemu-riscv@nongnu.org; Tue, 25 Aug 2026 17:24:10 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67PLABrQ2021812
 for <qemu-riscv@nongnu.org>; Tue, 25 Aug 2026 21:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=LoDaM/9hyCV
 yH/OGkL8dS2L29acFOpKSFw1j7Ys5DgA=; b=NBgRk7UxhcS9LTkhqtv3rGDRdlE
 ZzhQXBSJJhYu4Z22JszZNkaBJlPke9uDUyamL/8xYIOTgOaf+KmzITq5uIF8n43p
 +TlALCbAVnoe6+FQ1zzg5tg7fo14RidLHdUKxS9Zthk+2iE9jmoBMuad+SZhCpYA
 JaJIRkpRQi30/DSFLEUHUdfSyfSJ7vLERoG2CRhcMdAX9zPceDJH5Ib1pGV59LGc
 J9UuAyt0NUGab8PzHW/wCktK4zgEm4ZbgeVIV8dcf8TBIUzkhCRcPs70tpWgNgry
 7LtQ6EK9Ch6nBqEG0nsGPVeVEJF/VxxvBYziSgA9FkTS/bqxGbA0DXmQqDA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fgr8t5q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 25 Aug 2026 21:24:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c19493ac2so3200521cf.1
 for <qemu-riscv@nongnu.org>; Tue, 25 Aug 2026 14:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787693046; x=1788297846; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LoDaM/9hyCVyH/OGkL8dS2L29acFOpKSFw1j7Ys5DgA=;
 b=Li+w1kJijRvaOMNWOZUATnvt8HNmwoQGjwSlSisF+Yw9QOQ0GHj4MJCHeucx1fq9y7
 HTH07RCsZ4LZsNhc2F1tcvQ8S542W1Bv8PWg/Qb+YT810vRYiEp97wqmac7zU+onITB6
 5xNNnEJGkJPu7rnoeSpT8nJ11DSQ6keyg5voHQp6mXKhoTNWhuWTPNR6X215aVfA8hM3
 c2naHwGoYnt5Wl6dC8jac4J2TD/1aRU+wmBeCB2+XWIvPTAVp34Ekqu6vCv64B7edHWO
 C0YMIYQIn0GBi/Ul8VEE7Obetkg0I2KmnkMQZLqXDdbKyYZkCETR5eQ9ZGIUC9nc0P1L
 pPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787693046; x=1788297846;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=LoDaM/9hyCVyH/OGkL8dS2L29acFOpKSFw1j7Ys5DgA=;
 b=NlQNljny1ZWQV5iPy1qLR/A6aWT1XURG6Iidq/XYfT/8NKhoZ8X8CI+BV9ZMSQK7bE
 fYF5vXGk7jE7QXnBqWTo3F79qZ9f4sk/P6vHIHOYpCRAjtN8rud93A/p3be4ZGRC84gf
 Jxtv2GNBVAx0LYuzslHa7vaFAJVQimguZ8tAT52dxBfgRes4X0a86hZJDTHne8pF0f8R
 yxtEEFNM9aIibiHBC4sS2QA4ePNUJ/uRW84KQcbt6+u5biZFy3z/youlQiOkUPT2/VG4
 s94xnJrNfNdd/cgC2K8YbmqgqEzf49J9pDowUo2MdiQBXokIN6AS8m+LBx4h/2JlchmA
 yZ9w==
X-Gm-Message-State: AFuF++nGbDNiobvbz8TwGlbLXJ6sV50mW6LPsunz5eorBJ8qVjmZh8rR
 CQnGwvduMxQmLvO8INghzg/mLdRv9hfLe3CiJTBe+3hzyxpX3I9h8LE1nlv5vxFwu3/QYHdDpFX
 yAazWC8869Vf3hmg9Unc+eZy6NGp/K3Ru38hR4XU00GPnW/ZdzvrzEdZKZQ==
X-Gm-Gg: AR+sD12eacge6/zS2giLQwMpl8Vyjx2zO0I+d5yDsmkkfmnuYdTA3DlFtgY8mTaPXoD
 c1fL113fWqX/IeWofbbe0Nb4/lFN3XyJX1FZfh06ZRSfa3E1Lw8ZdL7YDAS9YhgmNcmZ7uUNpGB
 k+Gwh3XvLha09XvtC3YHAdhQjKNi/fkN3KSrCh0OcLIPvDyzXuqH5NE2fr/b/CjpHj7k+VsTDcX
 tbGrZ9Qi6tgDENoTBEOyIKKr2U4gKSlzibCAvAvl32jNfRigjNT5ZolN1n4KBxhE/de0jSGO1ML
 blKngyR1t6WS9l1YjdhMvRIBL9MqHbwrQGoQBNJz8E0Ha6gFJKoH92Tv94AdCFWMoopczm9Ayh/
 hkNZJS3yFitH+K/tekffffsXWPbLQXGOxD7whmw==
X-Received: by 2002:a05:622a:451:b0:52e:1039:c465 with SMTP id
 d75a77b69052e-52e4223411emr21520211cf.7.1787693046089; 
 Tue, 25 Aug 2026 14:24:06 -0700 (PDT)
X-Received: by 2002:a05:622a:451:b0:52e:1039:c465 with SMTP id
 d75a77b69052e-52e4223411emr21515721cf.7.1787693040816; 
 Tue, 25 Aug 2026 14:24:00 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90cc65299f0sm8646386d6.41.2026.08.25.14.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 14:24:00 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 07/13] hw/riscv/fdt-common,
 virt.c: add create_fdt_socket_aclint()
Date: Tue, 25 Aug 2026 18:23:19 -0300
Message-ID: <20260825212326.1907-8-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825212326.1907-1-daniel.barboza@oss.qualcomm.com>
References: <20260825212326.1907-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VR339gtHxaXly9M-aWL4UhEb7K_xgv-F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDE4MiBTYWx0ZWRfX5qZ8HZY2e3RJ
 1mKcf1OElgxPL5njl8d6BEJO16xfdyKQ0HDR11tg/GapgG5ox+z6r2cc6/QdWVh3u6XjDHIIHhB
 gZh9DaOU2ynhsC7m2EyvYxpPmXzp8JsrqIO8b8/4DABt9IOMsmQivvkwWlX78ENE1y8bZkhkSJE
 JtkLtUBUYRyyjhyzcY8nGiC1PoznnLb2fRZN5s2jmwqhqRq3quuKmKBmWlJd0usAQuiDUqnk/rw
 GyYwzs7eS0keDfQtlnJVtNI/ovolqxpz46rQIdRr1yzayN8ZS0bQSsKpRA86HZydjdCXUoHwdCs
 0JuxhJM16NqXvgKOMI31h1hM46r5PXmQLV9OPZP8kVB0ylaUaSa/ScqZOoCIVzqRkvOQL2ZqZ+f
 empGXS80twk7knWPz50zrCayf38kLW5+LrtPxT23nt9pC+eb5KKw73a7XZWbeEZoj743GPfj510
 m9AJ6l4UtJtoVNUuAbA==
X-Authority-Analysis: v=2.4 cv=d8LFDxjE c=1 sm=1 tr=0 ts=6a8e07f7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=7Bblaz4JstUzMt5rO2kA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: VR339gtHxaXly9M-aWL4UhEb7K_xgv-F
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDE4MiBTYWx0ZWRfX/9asgI3Y6vve
 4Tw++5awBsA41YguM5k+ysev0hFO503Zv7V2thdenKszTqQ8B52IgvpD3KtqCtPWT3ArhO92mLF
 Vugzp/i8JLwP3zJ6hZHSUiEPHMiYImk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_06,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250182
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

Yet another FDT that we want to move to a helper to avoid copy/pasting
code to other boards that will use a mtimer.  In particular the future
'riscv-server-ref' board.

No FDT changes made.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/fdt-common.c         | 96 +++++++++++++++++++++++++++++++++
 hw/riscv/virt.c               | 99 ++++-------------------------------
 include/hw/riscv/fdt-common.h | 11 ++++
 3 files changed, 118 insertions(+), 88 deletions(-)

diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
index 77168f5c4f..f31cc9d3cc 100644
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
@@ -695,3 +696,98 @@ void create_fdt_socket_aplic(void *fdt, APLICFdtProps *props,
 
     aplic_phandles[props->socket] = aplic_s_phandle;
 }
+
+void create_fdt_socket_aclint(void *fdt, ACLINTFdtProps *props,
+                              uint32_t *intc_phandles)
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
index dd8f5d9d75..ef2670f20e 100644
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
 
     fdt_create_cpu_socket_subnode(ms->fdt,
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
@@ -372,7 +293,9 @@ static void create_fdt_sockets(RISCVVirtState *s,
                                  socket, riscv_numa_enabled(ms));
 
         if (virt_aclint_allowed() && s->have_aclint) {
-            create_fdt_socket_aclint(s, socket,
+            aclint_props.socket = socket;
+            aclint_props.num_harts = s->soc[socket].num_harts;
+            create_fdt_socket_aclint(ms->fdt, &aclint_props,
                                      &intc_phandles[phandle_pos]);
         } else if (tcg_enabled()) {
             hwaddr clintaddr = s->memmap[VIRT_CLINT].base +
diff --git a/include/hw/riscv/fdt-common.h b/include/hw/riscv/fdt-common.h
index 7a7e3ad7af..fbcf9aaffb 100644
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
 void *create_board_device_tree(const char *model, const char *compatible,
                                int *fdt_size);
 void create_fdt_socket_memory(void *fdt, hwaddr addr, uint64_t size,
@@ -112,4 +121,6 @@ void create_fdt_socket_aplic(void *fdt, APLICFdtProps *props,
                              uint32_t *phandle,
                              uint32_t *intc_phandles,
                              uint32_t *aplic_phandles);
+void create_fdt_socket_aclint(void *fdt, ACLINTFdtProps *props,
+                              uint32_t *intc_phandles);
 #endif
-- 
2.43.0


