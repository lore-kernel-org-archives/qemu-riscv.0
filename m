Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07BC2C61DC4
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 16:49:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzGnf-00064Y-Mg; Wed, 26 Aug 2026 12:48:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzGne-00063a-Gv
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 12:48:30 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzGnc-0000ra-Fx
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 12:48:30 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67QDvDOU612407
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 16:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=AkchrvUe/LA
 mpQrPITt1acnChXhuDja4ZA5vZ5r9Sjg=; b=Oi/Od7e7A11/40eAMeTdafUpdl8
 GcMGotGjCCeSsMBHl1lwakK/5PzZnW9jV/7S7vRuKALuAeCsQr5ls0kN3VosDaW5
 RptA5Gf5DRlNp1e0EK4QXU030AUQXTJ8oh8wqIqDUmTQsvD1obG1jWj3m7oP3Sos
 KEtZGp7sQghvdjvR8yAXXddAYdryvl0NpDCBybclB7XJenmNHHimHezqeSzoF+eW
 6UNUvyBHRkcP/5iMue7BkapNUDXvtTKplC29mQxZWfi9+V0d3MdljM0cRjfGQpEc
 OXBckduoJ9ycj99CF+hZs3frFlcuTuWN6XK0S7Rr9CTh09gGQ3ZkvHuOzYg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9smxaspr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 16:48:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-8f39a46efd9so831066d6.1
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 09:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787762905; x=1788367705; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AkchrvUe/LAmpQrPITt1acnChXhuDja4ZA5vZ5r9Sjg=;
 b=S2OsNg+gj5FLnQdW6F1yi8TiM+FpPxjYSNbnzuOC84lRZ4ClpCUbO7ua8lEt7ehlFO
 1ZeAO78mpeKIWG6pXeWeAqYDp93tDryayUwASaSSgbPKkpUpRTed98obua1aL9XFR2Xz
 kGXakrk1BUOsvUbaZLP084N9WteV1nMap9g++o9ADl+t0A/fx7Lz8S6sKiTO1baAZdzh
 iFEQ3TcSsFjVJ0t48pqp5y/K5kwgmC+rRcZslcWjpKlGmiJdw6gRtJJZD3x21meM+oas
 d3mFKdJPRTZNRTttlIMUV79PvvelHwulBRGFJrlvzUSOyjhjE+GlZtRFTvEoJkr8ua7t
 mbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787762905; x=1788367705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=AkchrvUe/LAmpQrPITt1acnChXhuDja4ZA5vZ5r9Sjg=;
 b=dcpnSCb9sRZx4k6xj9Rius7icYe8gn/JbU2PV9UJo0FZjYCRyQ9S4NKQz7QTY+3PN3
 JtuPEmQDvP9mcHpvvT9UnojuzXEE07acJpFkAQXaUn93QVzIyOS1CIhIiM/aP1Vi82NQ
 WwAl+1H9ys9BpxsACeof/ORPgjoK5b5W8mqIwWTkoR30Kmrty8A0xESQpNQinYtzUHEZ
 iP6/Ip21sXBvYX3VhAJJGEIpkoKjDDE9E2zC4BVE9f+UpWhWC/S9bG7G2oXziUaNFKS5
 pS+fI0/poRr6uOfDSyG5V1ZdGbiJadYGipRWkIS1ffisR6WeQBkeYmSH9/+KmzoV9c92
 hefA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqcZB0ajEhHjgUu2+Pd7VE36ULT8pFawxrLtLqgN51aZB4YuadB4ObHcr7g6h7l01hMRHNr2SHCrhtD@nongnu.org
X-Gm-Message-State: AFuF++nGIvORZseYTr4Ac6jvvtg54ayyI0vCLVoMzhhZK0VoS1/dpeOi
 sn0dsRZjFWloOHEApTrYJEt2IewwVodj7n1zY8XCp3JDfImTjAxNkwoeOTECI/wPtqi/8iu8F4/
 Q0fJs4HnKgI1PIgNZPBWiE/iFdLSKxymKBn6EugxQnAxofskbpglkJeHexQ==
X-Gm-Gg: AR+sD10bhF00tcKlgpieXfsmhga+ikHkc79+/oBOoUIyIHp7e2DY5zGp929/MYRvzw4
 nXb8aArKYP12HfrpqBpfeZXvo+dZE0uxDpQyQoEOlRZECqq8DmX5BkqAVv12L3zixRQYUS1Uttv
 iIhAhry3k4bZbqF/FkCi/pH4kA1VW1TNWLhfZnha6/vqYDg5eOzc8U7qjBMwcnc4J+tyu834R3v
 UofFiqC/1+njkihAj/fDv5HwjSdbHrQvcj2S0Ab9JFzg/3yaIyQnRbyFfnBtXInBja5XmVt4Lt8
 8ubYv3mphFjsL/aBnFjLZ+PFtheLeS8rtbQFWq6KzN6Xr2f0B8hpi1OzeGzJS7t8MAVUJu4qW/o
 iR2DZLrzNixZmW/OkeWVEwFdV74tHkip5YXmW1g==
X-Received: by 2002:a05:622a:5b92:b0:527:69ad:fceb with SMTP id
 d75a77b69052e-52fa186f8a6mr9090421cf.0.1787762905412; 
 Wed, 26 Aug 2026 09:48:25 -0700 (PDT)
X-Received: by 2002:a05:622a:5b92:b0:527:69ad:fceb with SMTP id
 d75a77b69052e-52fa186f8a6mr9089721cf.0.1787762904925; 
 Wed, 26 Aug 2026 09:48:24 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-52e4275fc3esm20092651cf.25.2026.08.26.09.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 09:48:24 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v2 02/13] hw/riscv/fdt-common, virt.c: add create_fdt_syscon()
Date: Wed, 26 Aug 2026 13:48:02 -0300
Message-ID: <20260826164814.44335-3-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826164814.44335-1-daniel.barboza@oss.qualcomm.com>
References: <20260826164814.44335-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O/oJeh9W c=1 sm=1 tr=0 ts=6a8f18da cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=azO7UiENNDAzAd32FwoA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 0VllZGQ4fhqPrsHLVbVo3aLTUAZqXgTT
X-Proofpoint-ORIG-GUID: 0VllZGQ4fhqPrsHLVbVo3aLTUAZqXgTT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0MCBTYWx0ZWRfX2p9qmU9SPVqM
 OOsOY9jutXYLOShP6iCe86LS2ZsHV7kwQSSswSegybn2N1Ptgiy99AzFdubn7YxUMTh1oTShpPt
 BeN5fPeXidFp98xX5IGGPZK6vTSRDsGgJvueTcGQPr0BfA27Hw0fxTh3AKFez1w9Eu2SnBFBBkI
 7U/goFWvvbhX72B1jkv2pMYcsOCkusYBL3K/p3jiY3O71y5hKbdToVqI9VM5siQs/NBD13/XziZ
 1WCq26tzTdtdOJbyVbRhZWm4P7v/GmSbpHdXWJm7kA8Hh1gJWGHSB5mEpaR7HwQ6XZBaVbHEjg4
 nk4qcJ2l5Lo514bMS0vdaF65PBS3yAAJ68hsZAIi+20VGAfaORa1IkuvR9cfitV+Bzkn49lN99p
 U00A9HcvXWnoS7ENDWgtjOBeMmSgwbHRHXI1LkpSx7SV5KvD9JNbRt1XhhXxhy2MdUOMxnaidmr
 UTypUlF1FX6Tal4aXxA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0MCBTYWx0ZWRfX8Ua0Gi1mEQq6
 gTyOXRgiG4C5UHMWzXg3SzorfQqwzQTpZGbf8shisqtsDvd2irUdWLvEm3IUzdj5DiZWgBJ65cR
 wm5EnJ3kd5Qu7tPuLEik8t4kBRTrIJU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260140
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


