Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BADC61DBD
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 21:24:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wyycc-0003TX-UK; Tue, 25 Aug 2026 17:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wyycb-0003T1-T0
 for qemu-riscv@nongnu.org; Tue, 25 Aug 2026 17:23:53 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wyyca-0002GS-3h
 for qemu-riscv@nongnu.org; Tue, 25 Aug 2026 17:23:53 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67PL9hEE3675899
 for <qemu-riscv@nongnu.org>; Tue, 25 Aug 2026 21:23:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=AkchrvUe/LA
 mpQrPITt1acnChXhuDja4ZA5vZ5r9Sjg=; b=cYKaGBKFSwM8hGXaD6rRcE9N7b2
 gjVz4di3rvX64kgG/0uJP2ZobKVW0DdG9vsX2GenmpjCzD6qpwkRqPdcND45HSON
 SibZMMCe0/zqed5wZuYIzSB3GogsNJhxttV4u4sYv4yPmteo38jFP6LSKobDfw6V
 ENWz1RXwm8vwN5oXItM4w4eE67R57XCVdeFVHGwhunrpo2NVjwyt7lur1BvRu++g
 DduH1KxzEee/TGXtFlQaV+heH2af3AzmkxCGqJlV6g0cp6op+X7a4nnWh2QANM8s
 6q4o2CxPE60IWsHbWN0pxIcomzvX323i4rvUPSWaGmLS4Ow+ra2qaYIIUEQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fgxgthw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 25 Aug 2026 21:23:50 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-90cc540a846so3688036d6.0
 for <qemu-riscv@nongnu.org>; Tue, 25 Aug 2026 14:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787693029; x=1788297829; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AkchrvUe/LAmpQrPITt1acnChXhuDja4ZA5vZ5r9Sjg=;
 b=C7jsV6hgmabY9v7Ml+/cXIMvqEA3IFu6BppGhubps/vwmayeFjRgmeaprJ70r0HS8E
 DuomT1A49WqZa3A/kkqLXVWKmYFymBRpn7U5NLmAn07N9KrVqLvu5I+t37/2Ep4GGoHI
 8MIf60pRxNj1GzOK9zt6AgdBalTgUXBswW4vACabDKFdJH4XscV2dil0mqe8mueVovKS
 ZMntiUd1828ZjpCxKucMIeKeWUQRaFU8qFwBmJ7E5GmlcxFfOHrWQQhoN+bOKy5/EIQm
 g7a3fzmHtCcSr/GdAQRSvhUe61SSWwGNkH7J8Fi444lv77N9dS15/4r723CO5UY0dHs4
 uuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787693029; x=1788297829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=AkchrvUe/LAmpQrPITt1acnChXhuDja4ZA5vZ5r9Sjg=;
 b=U29WQF2RFkoe2itmsahAZKPrhXMj/6hSLPLO9QhzyqOzoKSEuuREThDBRqjieivoka
 5LN6Ap2iRII7dRbJOpxhvobpYlDvXQ4To07XEgVGX3+nNIBSAjqVVPZBkKUYm0XzZSJG
 aujD0NU+k4M4D4JRpV7VtloG+ZBTmtKgrpGq9vnA63J1uSxdIZUQuXghx2ejhcp1cV4t
 4s15OO2QM+Y9enyvV/hoYl9IA4KODE/oZWlb6U492bveN8qO82EoWzo98cdy91i9Jnxy
 ENjGCGaHoyQAOYXudoKyz648DLeSLCAS+0fti35h71CQxdMcwFB3JenJteEnIVNHHPST
 tWBQ==
X-Gm-Message-State: AFuF++klFh30ZhK7Qg8+YwF8LIhwRvlVYFYOqL6sz9nFwfK5sf9tv6Hk
 3XOEQdhXxpzjOwqUNrHeDLTHp47yPbgypNaKxbeGQtj8ORl+0BYnYHEMdwv5FN8BYscGSPsO+e+
 vU4h4G4FVHQEg0zLMK8H6UWyATrg8EqxRMx4SrZMuapTk0hyMOQ+1TbanCro16o6MuQ==
X-Gm-Gg: AR+sD1125b6Q2ewWH0mJQOzxuoi/0B9focF2JvMqNCOGGUiIJp5sZ4O/NsXfclbdMQR
 glW/SXCgQk8VegSp9S7xs5Q/9r/A5lYlCfJIKTZ3zjHgrHGCM0GMwIWk4Ax7/W+e8Lq4CLtmrFm
 /Q5VbMoJgazmhTzS2RJG1MPbi58couiH9k8HtNKTR7HpiXqoLPel7VMbR5r1G1TElQGKoly4RAz
 Z+OhSir0ymnTIHlCdmPzO4LktjPIkUXtTMGFy55HlLnlyCBmBFRN8fYh/r1U6FPtfRna8CdKvn6
 seQHed14RrPSkGDbl7xfsvhumvHj9d7VsFI1+88lFWDbpZl/PsVynW0Pedvxb+8fDy+pSQnGa6H
 h4tvfrEmG0WHmMU4x6Szoz97H8znIK7HVloR5bQ==
X-Received: by 2002:a05:6214:568d:b0:90c:b640:7c04 with SMTP id
 6a1803df08f44-90cc79fe02emr19975476d6.27.1787693028987; 
 Tue, 25 Aug 2026 14:23:48 -0700 (PDT)
X-Received: by 2002:a05:6214:568d:b0:90c:b640:7c04 with SMTP id
 6a1803df08f44-90cc79fe02emr19975006d6.27.1787693028568; 
 Tue, 25 Aug 2026 14:23:48 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90cc65299f0sm8646386d6.41.2026.08.25.14.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 14:23:48 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 02/13] hw/riscv/fdt-common, virt.c: add create_fdt_syscon()
Date: Tue, 25 Aug 2026 18:23:14 -0300
Message-ID: <20260825212326.1907-3-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825212326.1907-1-daniel.barboza@oss.qualcomm.com>
References: <20260825212326.1907-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MqZiLWae c=1 sm=1 tr=0 ts=6a8e07e6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=azO7UiENNDAzAd32FwoA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: lU_wPA_-aH6E_k2BltBMCaUWrhUvWoCL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDE4MiBTYWx0ZWRfXzFH1rAe4/7St
 MUBzv1H1D0xF6E6taGKqxoFzEH/VFRikEfVVrzpmmKyCy7gROJkXlDilTrPU5jQq84xngJMm8wH
 p7gzxTXghp40oGmS/UBcwdj3ayE8fiH0KAqOsLnlZYducWOTjXkDN2k/TW1pEnZHlVPSUs8kwae
 tXFFziPWm7Esa3Rz+Ut+Dps8SzN4ag3GudYiBv35wACXH2K9roKmS5g/6Cr3AklXtMLp6G7AGvc
 sBRIJu2Un6QAgS9NzjslPZuUaNHdmKoWBuPLao96HyZ89S0OYKclyGTAo00xgBtPw+Lom9aRQY2
 9Lc/OXfN8gsao7WjfxBEYr33OyP1GFjIyvPYbuMs9UdYkDPd9wSjWhoCNirUrvY//IYRDfFnKLE
 HpLwVsLDYcVDrK9LsAYC3/DdzXCZBWKbT4TDjGhGRQuxioYnICvUt0LP9ONPc+ARQ6DWFWLJ6sS
 90kuZKNxBgw0NqZFiZA==
X-Proofpoint-GUID: lU_wPA_-aH6E_k2BltBMCaUWrhUvWoCL
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDE4MiBTYWx0ZWRfXx8fnv1MFQYex
 A4I977/KGuHzwpOA1hSNalNj0+zYrCNAvfnEBqKCgthz5eA/o9a6i0CgfrdzF0wopQHj7YDsqRb
 wGyxxcmITXgcHHvaQp67wtIcgPms5MI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_06,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
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

The soon to be added riscv-server-ref board will declare a syscon FDT
similar to what the 'virt' board already does.

It won't have a 'sifive,test0' and 'sifive,test1' compat string though,
hence we'll add a flag to enable/disable these additional properties.

The FDT is slightly changed: the subnode is now named 'soc/syscon' instead
of 'soc/test' to be compatible with the latest device-tree docs.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/fdt-common.c         | 53 +++++++++++++++++++++++++++++++++++
 hw/riscv/virt.c               | 45 ++---------------------------
 include/hw/riscv/fdt-common.h |  4 +++
 3 files changed, 60 insertions(+), 42 deletions(-)

diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
index e74423a225..a2168c09ec 100644
--- a/hw/riscv/fdt-common.c
+++ b/hw/riscv/fdt-common.c
@@ -294,3 +294,56 @@ void create_fdt_flash(void *fdt, hwaddr flashbase, hwaddr flashsize)
                                  2, flashbase + flashsize, 2, flashsize);
     qemu_fdt_setprop_cell(fdt, name, "bank-width", 4);
 }
+
+/*
+ * @sifive_test_compat is used to create a FDT that declares
+ * compat with "sifive,test1" and "sifive,test0".  This happens
+ * to be the case for the 'virt' machine that also creates a
+ * 'sifive_test' syscon device.
+ */
+void create_fdt_syscon(void *fdt, uint32_t *phandle,
+                       hwaddr addr, hwaddr size,
+                       uint32_t reboot, uint32_t poweroff,
+                       bool sifive_test_compat)
+{
+    uint32_t syscon_phandle = (*phandle)++;
+    char *name;
+
+    name = g_strdup_printf("/soc/syscon@%"HWADDR_PRIx, addr);
+    qemu_fdt_add_subnode(fdt, name);
+
+    if (sifive_test_compat) {
+        static const char * const compat[3] = {
+            "sifive,test1", "sifive,test0", "syscon"
+        };
+
+        qemu_fdt_setprop_string_array(fdt, name, "compatible",
+                                      (char **)&compat, ARRAY_SIZE(compat));
+    } else {
+        qemu_fdt_setprop_string(fdt, name, "compatible", "syscon");
+    }
+
+    qemu_fdt_setprop_sized_cells(fdt, name, "reg",
+                                 2, addr,
+                                 2, size);
+
+    qemu_fdt_setprop_cell(fdt, name, "phandle", syscon_phandle);
+
+    g_free(name);
+
+    name = g_strdup_printf("/reboot");
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop_string(fdt, name, "compatible", "syscon-reboot");
+    qemu_fdt_setprop_cell(fdt, name, "regmap", syscon_phandle);
+    qemu_fdt_setprop_cell(fdt, name, "offset", 0x0);
+    qemu_fdt_setprop_cell(fdt, name, "value", reboot);
+    g_free(name);
+
+    name = g_strdup_printf("/poweroff");
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop_string(fdt, name, "compatible", "syscon-poweroff");
+    qemu_fdt_setprop_cell(fdt, name, "regmap", syscon_phandle);
+    qemu_fdt_setprop_cell(fdt, name, "offset", 0x0);
+    qemu_fdt_setprop_cell(fdt, name, "value", poweroff);
+    g_free(name);
+}
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 33a121abd9..acbbe458fa 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -766,47 +766,6 @@ static void create_fdt_pcie(RISCVVirtState *s,
     create_pcie_irq_map(s, ms->fdt, name, irq_pcie_phandle);
 }
 
-static void create_fdt_reset(RISCVVirtState *s, uint32_t *phandle)
-{
-    char *name;
-    uint32_t test_phandle;
-    MachineState *ms = MACHINE(s);
-
-    test_phandle = (*phandle)++;
-    name = g_strdup_printf("/soc/test@%"HWADDR_PRIx,
-                           s->memmap[VIRT_TEST].base);
-    qemu_fdt_add_subnode(ms->fdt, name);
-    {
-        static const char * const compat[3] = {
-            "sifive,test1", "sifive,test0", "syscon"
-        };
-        qemu_fdt_setprop_string_array(ms->fdt, name, "compatible",
-                                      (char **)&compat, ARRAY_SIZE(compat));
-    }
-    qemu_fdt_setprop_sized_cells(ms->fdt, name, "reg",
-                                 2, s->memmap[VIRT_TEST].base,
-                                 2, s->memmap[VIRT_TEST].size);
-    qemu_fdt_setprop_cell(ms->fdt, name, "phandle", test_phandle);
-    test_phandle = qemu_fdt_get_phandle(ms->fdt, name);
-    g_free(name);
-
-    name = g_strdup_printf("/reboot");
-    qemu_fdt_add_subnode(ms->fdt, name);
-    qemu_fdt_setprop_string(ms->fdt, name, "compatible", "syscon-reboot");
-    qemu_fdt_setprop_cell(ms->fdt, name, "regmap", test_phandle);
-    qemu_fdt_setprop_cell(ms->fdt, name, "offset", 0x0);
-    qemu_fdt_setprop_cell(ms->fdt, name, "value", FINISHER_RESET);
-    g_free(name);
-
-    name = g_strdup_printf("/poweroff");
-    qemu_fdt_add_subnode(ms->fdt, name);
-    qemu_fdt_setprop_string(ms->fdt, name, "compatible", "syscon-poweroff");
-    qemu_fdt_setprop_cell(ms->fdt, name, "regmap", test_phandle);
-    qemu_fdt_setprop_cell(ms->fdt, name, "offset", 0x0);
-    qemu_fdt_setprop_cell(ms->fdt, name, "value", FINISHER_PASS);
-    g_free(name);
-}
-
 static void create_fdt_uart(RISCVVirtState *s,
                             uint32_t irq_mmio_phandle, int memId, int irqNo)
 {
@@ -992,7 +951,9 @@ static void finalize_fdt(RISCVVirtState *s)
     create_fdt_pcie(s, irq_pcie_phandle, msi_pcie_phandle,
                     iommu_sys_phandle);
 
-    create_fdt_reset(s, &phandle);
+    create_fdt_syscon(MACHINE(s)->fdt, &phandle,
+                      s->memmap[VIRT_TEST].base, s->memmap[VIRT_TEST].size,
+                      FINISHER_RESET, FINISHER_PASS, true);
 
     create_fdt_uarts(s, irq_mmio_phandle);
 
diff --git a/include/hw/riscv/fdt-common.h b/include/hw/riscv/fdt-common.h
index 6e438e0278..31203df517 100644
--- a/include/hw/riscv/fdt-common.h
+++ b/include/hw/riscv/fdt-common.h
@@ -37,4 +37,8 @@ void create_fdt_plic(void *fdt, hwaddr addr, uint64_t size,
                      bool numa_enabled, int socket);
 void riscv_pmu_generate_fdt_node(void *fdt, uint32_t cmask, char *pmu_name);
 void create_fdt_flash(void *fdt, hwaddr flashbase, hwaddr flashsize);
+void create_fdt_syscon(void *fdt, uint32_t *phandle,
+                       hwaddr addr, hwaddr size,
+                       uint32_t reboot, uint32_t poweroff,
+                       bool sifive_test_compat);
 #endif
-- 
2.43.0


