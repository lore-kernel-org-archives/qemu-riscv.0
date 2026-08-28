Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29F5C61DBD
	for <qemu-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 20:40:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x03MU-0007JN-84; Fri, 28 Aug 2026 16:39:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x03MS-0007IV-HU
 for qemu-riscv@nongnu.org; Fri, 28 Aug 2026 16:39:40 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x03MQ-0006UR-9J
 for qemu-riscv@nongnu.org; Fri, 28 Aug 2026 16:39:40 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67SKZksI4122180
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 20:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EF/HHtp2rvbcbWykXnApHPCp3cZe1I4jNoHX+KY8Hpg=; b=lgHJeIlcQp5DxCxJ
 PBxYtSm5GKT5ATeXF1IP1BTdZgfIOzbPrvqWvMKwpoYsGDr/p4PW+Sn0q84qhDvD
 Whi6Bkd2r1qCN0BHiBNyOPMOMZGj/xBppzViDs0Na0gcMZqyU8Dj2i+bi7yLqYJx
 P/ocCbmPIVU2kg3fEvqFZG3BkNfa4CShl7z1Fax8NsTMoW3w8ZK4uzfc9Qgzw/st
 8NWrr9Z5zA9a6JwOELxF+vQg6UWdFzCbHzY9M6a6yEsFmuRF9UNWUjeBzv1ew75c
 uOGReEclGzldqeeVne6d9mPk1Ds1su+Lf7k4XP6fkZW4AXcebA8aFikN10F1Datz
 WLfDMg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbhgq80c9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 20:39:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e82060977so216469785a.1
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 13:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787949577; x=1788554377; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=EF/HHtp2rvbcbWykXnApHPCp3cZe1I4jNoHX+KY8Hpg=;
 b=PAPb2JckqneJ2NmrUWOo2bsJhlAHCz6ba3sn6G4vJleWiWyrsKDtu+aEyOMnTbnhtq
 2QWNPYpre/SMFqZHwcNeG0vP0zCNZ3/zYYhVt/Co0kYhmFvZs+FQAByjNeO+05CWPvou
 WNbaASlSrswembMZA1USfMC0aWJLl7t3WuXB/8M2Ocjsor6U48zyjmKTTNHbtB30yQDt
 8qsIbAl1VV/RiU+o0bS9KF+QQmpJkQC6VsCNkCOCuud+o5V2EnnMFUu/ZkPWUC5OQ5yi
 lYL1sdwv85/QtKmXRmsU0ZaD98/DZ3ChSHzIuNiNqqA+qIGl9CGu8Hwlg0GHlmjEI59C
 tKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787949577; x=1788554377;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=EF/HHtp2rvbcbWykXnApHPCp3cZe1I4jNoHX+KY8Hpg=;
 b=A9d4KnlkfNy8r+mxyoJi+3iagY+KZETg4yX15WhCbMMDGfubSoDqjIHVxf7Dmcz+s9
 uEGd4uD556jvqw7ufZp7zxUZcs/QSpKhLtNmN8699HuR6dWEhcPqD+M1uKmznjrmLfHj
 FwwZhlY5HSfEpN0yJvEXpkyLjWsNz8mOGn8S75vlgKJUVLqt4UCNsmbi8xXzs7CBwUkk
 Q81eFN0BHVwatiIczpY+92uoU+b8BocRAfvaq4t1L6xTjUEgnCFRer4IAM9jExQ8TrUx
 W9MU67ElsBP/TnZYlutbOxEmblXOFPLWVTR/NXnhGrX7HNBIe7op0r1syEO2KU0DTv0v
 2IxA==
X-Gm-Message-State: AFuF++mwQJcP+IK6ANoGyFAp0kcb2MXrg45q/s3Z3xc9G259r/4bS8PM
 5rum1cguCMGRFfXtfOX4NZHKqF0NO3n6Orto9plsTVtm6GNl9UXDP/ERtGmS4tRlDvOMXxe4J/W
 8Yux5Nv+5Y1UtduOsGGo06CkvwLNJPKulAXj1xispFlpcyd8KjC56vTqDlg==
X-Gm-Gg: AR+sD135CoswoA+7tEgk8ThWoayynM02j8yAMP4DeOKeQQkXie0RhBBNHNKMI5TtrpX
 X+5xRmUAJn92cZ+4lqZeO0N7p5fhLMb0bEixp2y4eEQNtxyXnlmLSGck1rE7uYjbWNwkapqsgO4
 c6LSPMYw4FBrDM8bG9BJn3LtrS8MKMorYbFJBy2YtwckbAJZ+komKV5/MG50Krq1vG4DCvpKFhB
 W3piBU7JvIOJG5uBURpVdeO1KqMFangVzbrAN2N3gOp2v/bBSuI0ivEdWm4HXRDXOHthxecU2H3
 o4a1ScLTqAGeuVbuACRPecrasNqPB1JG/UCZksmpbxsV1i1iYo0EYlSPdXD+hYJB+5OgiW3CnOV
 3JReIPa7HSQW2uevXE1MoqXWW9tNJECCWONpURg==
X-Received: by 2002:a05:620a:1b8a:b0:939:116c:284a with SMTP id
 af79cd13be357-939116c2f8amr1354425885a.14.1787949576635; 
 Fri, 28 Aug 2026 13:39:36 -0700 (PDT)
X-Received: by 2002:a05:620a:1b8a:b0:939:116c:284a with SMTP id
 af79cd13be357-939116c2f8amr1354420585a.14.1787949576094; 
 Fri, 28 Aug 2026 13:39:36 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-939173f2758sm218063985a.37.2026.08.28.13.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2026 13:39:35 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v5 03/15] hw/riscv/fdt-common,
 virt.c: add riscv_create_fdt_syscon()
Date: Fri, 28 Aug 2026 17:39:05 -0300
Message-ID: <20260828203918.350131-4-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828203918.350131-1-daniel.barboza@oss.qualcomm.com>
References: <20260828203918.350131-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FKv_v6no6nOnhqKOqvMUE6TWF6TRICz8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE3OSBTYWx0ZWRfXz859yRRZsCM0
 4XHNx5eFDG9T4ztZvaredUsti5mT2lZH+VjL1nP35JO+a5TAln4qiB5vtqPLFeyluKgh2iso1Yb
 sopwYUPYdG2j/rzYOm1wVERrB3gYkMw=
X-Proofpoint-ORIG-GUID: FKv_v6no6nOnhqKOqvMUE6TWF6TRICz8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE3OSBTYWx0ZWRfX/Zt+bb7GNSK4
 CUbYlTbkcvJpTr0LbEp+AFFwNjTqIerXeA9yjQULBjV9dXkXZ7i1idl7M2As+OqWuXVAyfNcg+u
 odagO/16YumPhoEijePnZ0HaLvImxEQ9BPr2EbNfWbJdcxHhpM6JdTCfOd5GKtI1oEp5216oCAc
 AL8lfKln5SVvsPWS3naJ8QZiixft66QTPmwTf3e8DVawRWvm3byj/wDubvqVmAP3jshLNXIsDCu
 SoWtH61HeiIUXx5h/UnZXWsVj1LBPqJPSzvabc2Rgs3CTRyl3hhVPgbJP2JQN7Hmr1Y3IAfOfQ3
 wdNxB6Ekvqj7kc+AcrqzPb7293A5vVNhwjfNWpi8/zcfwoSHQsOxtaUU77966LPhY+FKpliYmCo
 P/oBS1qjLCacV30tl5L2aekQ9P9QIZV46RzZSlqK2QPIK0FE7RM0HFmab9hcR8luVv3YLiuzPBn
 iVcp3xB5o+9xN2pQPnQ==
X-Authority-Analysis: v=2.4 cv=CsGPtH4D c=1 sm=1 tr=0 ts=6a91f209 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=FRSEYCzRAAAA:8 a=4Tf7kDObtFz1SKwdFkIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
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

The soon to be added riscv-server-ref board will declare a syscon FDT
similar to what the 'virt' board already does.

It won't have a 'sifive,test0' and 'sifive,test1' compat string though,
hence we'll add a flag to enable/disable these additional properties.

The FDT is slightly changed: the subnode is now named 'soc/syscon' instead
of 'soc/test' to be compatible with the latest device-tree docs.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Chao Liu <chao.liu@processmission.com>
---
 hw/riscv/fdt-common.c         | 54 +++++++++++++++++++++++++++++++++++
 hw/riscv/virt.c               | 46 +++--------------------------
 include/hw/riscv/fdt-common.h |  4 +++
 3 files changed, 62 insertions(+), 42 deletions(-)

diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
index 6fcc1ce21f..eac5ca9322 100644
--- a/hw/riscv/fdt-common.c
+++ b/hw/riscv/fdt-common.c
@@ -295,3 +295,57 @@ void riscv_create_fdt_flash(void *fdt, hwaddr flashbase, hwaddr flashsize)
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
+void riscv_create_fdt_syscon(void *fdt, uint32_t *next_phandle,
+                             hwaddr addr, hwaddr size,
+                             uint32_t reboot, uint32_t poweroff,
+                             bool sifive_test_compat)
+{
+    uint32_t syscon_phandle;
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
+    syscon_phandle = next_phandle ? (*next_phandle)++ : qemu_fdt_alloc_phandle(fdt);
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
index e48337dfd9..ab6c53c78a 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -768,47 +768,6 @@ static void create_fdt_pcie(RISCVVirtState *s,
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
@@ -994,7 +953,10 @@ static void finalize_fdt(RISCVVirtState *s)
     create_fdt_pcie(s, irq_pcie_phandle, msi_pcie_phandle,
                     iommu_sys_phandle);
 
-    create_fdt_reset(s, &phandle);
+    riscv_create_fdt_syscon(MACHINE(s)->fdt, &phandle,
+                            s->memmap[VIRT_TEST].base,
+                            s->memmap[VIRT_TEST].size,
+                            FINISHER_RESET, FINISHER_PASS, true);
 
     create_fdt_uarts(s, irq_mmio_phandle);
 
diff --git a/include/hw/riscv/fdt-common.h b/include/hw/riscv/fdt-common.h
index b422da6aef..e377682b32 100644
--- a/include/hw/riscv/fdt-common.h
+++ b/include/hw/riscv/fdt-common.h
@@ -39,4 +39,8 @@ void riscv_create_fdt_plic(void *fdt, hwaddr addr, uint64_t size,
                            bool numa_enabled, int socket);
 void riscv_pmu_generate_fdt_node(void *fdt, uint32_t cmask, char *pmu_name);
 void riscv_create_fdt_flash(void *fdt, hwaddr flashbase, hwaddr flashsize);
+void riscv_create_fdt_syscon(void *fdt, uint32_t *next_phandle,
+                             hwaddr addr, hwaddr size,
+                             uint32_t reboot, uint32_t poweroff,
+                             bool sifive_test_compat);
 #endif
-- 
2.43.0


