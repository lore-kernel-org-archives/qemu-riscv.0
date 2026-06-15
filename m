Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5D4CD98CE
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 20:39:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZE4a-00031m-Cb; Mon, 15 Jun 2026 16:38:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZE4Z-00031O-Mb
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 16:38:19 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZE4X-0002Ch-6t
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 16:38:19 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65FIx7su861018
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 20:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=SjSPCEvpZmT
 ojOhMzFStU6RbZUdT0o496sebX2y2biU=; b=d3PRRk5ccA0q9DsY0tI+a6PBg/w
 RwRaRYesF/s6TSo+aG+d7C1rb6PcFNDStEwU+Ufnnkjd9+kHK7UGE3CWEnGFDrBI
 TGJkx2efGdK4MCPBGViG/aAGnhWEwQrGOlSyW+vPoPsNp9+ci9lyqp0NEdXt7duO
 /XMZsTSDxTdI8kKubxuQB1gFh6fP7NyuFXy19Rv+VMkwhQYyN1CB724BKnFp2l/C
 s2KiHrpgr0CWfs2ZWApTZfZ+QHhCaOUvPIS8bKFjeZ/UAWOfKSKh2z6FPL+EmHn2
 dUQWuUvyhXVHe437EHwZ89DpoM4vqMbfrlcttEc+/4mun+aPNcbPR+sgezQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteydavkd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 20:38:04 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8cecf8bb835so60801636d6.1
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 13:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781555884; x=1782160684; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SjSPCEvpZmTojOhMzFStU6RbZUdT0o496sebX2y2biU=;
 b=RMY6t/GJra3ijcJ+wAlFGkfnpMbk0QtaDHQLpcJZQUIZ6+Wi6jK7O6STNu5CBWtnFN
 Mq4ymX2lJTornecBoTeoyWO5MplLWKr+ZLESD7NRsw1XfpIL/JhkEtI5/+A/tXIup0yx
 5ias/HSbKmueK7Tj6poJ8fUS99AUexqEhIcZgm5fiYJZUazUaw/BfYR8s49A6jiUQsdv
 IH71UQx0qAyjCyzb0JVe01dmULKm5K85lRzoDtiEeqSnJzv9FuCeb6W3uoplrq7VuqNh
 COTm95jox+KKhJpSwBwkVAv+oXdOSirs+IbP/oZO4zBpzLk1oJAs1qfLW7FkuSX4C+kL
 pRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781555884; x=1782160684;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SjSPCEvpZmTojOhMzFStU6RbZUdT0o496sebX2y2biU=;
 b=ihNpaLIXjBsKybqcVbkXOkNVZ7CdrdfYUu7GzPuYoTPC864LH7Nk2f0e7fHaWCdyhk
 2Zeg6BV1+wpQ2xqKIsl9mZ9eeJdzhuBJwu0FmtmKloHwhrT44FsBBP0JEa7dgtAd+NdH
 b5TfP7ax/j5OjwHHENQVTlFExJ1xy393kSnqgcMgT+Ms9uXTIN2nEDAm6LPD+6Vf7SDw
 a+D4/F7s+Z/Q5GVRvkMhWFsBDmAYxSui6RbaWqyjPhqGTxM4S4dRzytCTN6YoeBZka9H
 copwdzMa/NLWY61/4WWHqPAQ9phSslAXX8sTCn/qd6hEH2KsHn7MWL6JG+Z+lpOsgq6T
 EeHw==
X-Gm-Message-State: AOJu0YxVVeU+/BXEfjqz27yvBDQl01VTrVDdwOf0b8ut7qFDWedpr5d8
 7MClAOhAfswWjVTyKkFgtrksebWqzU/j+6z4rZFFQkqrKO/2eeZRvKuFn9ZC5kN9JKhYlitJirR
 w0Ju6t9l4yDxvM+Kf+XDAJ3wOVcRQnUFhKrXULwwFEqG5PtAVlyK/grL3cd9TkTLLdA==
X-Gm-Gg: Acq92OHGd/aPrtzc4Z2mNUnK4UxBz3EvHfRxwHj2Bg33FrKninrY5x1kD9O8d+7H02a
 RIPIbZ+XHBeqxGGTiHyoSL0GNc9XEfTfGR/V2RVvN8G+EXcnkoMqtNA3/sPlIXHa3PFIdTt6IvP
 0FTGttcgBmpD7DKnPFaoP4dPWLC05cvhZhKUoX9A6PMMC2pp/j/QNvqT//gGAH4Q45ejGvi1+fv
 774A6dkrOLppA0ZTG4pPtDtFdN1V6Tb5tBm0q+I+O5p65FXtvOydF21qVka4KUWe/OT1RPwm8FK
 mabz9R0bIqZ5syyIHiiUBqrizOqXldcDfl8rqIXEOf33oQEysmcXK8LwfjSIO5lk6ylWhP8JleZ
 kerJUcphk2Vb+HbWuXaBf/xJGiUrw+4nrmExyeyk2kXOcdvXswfXQ3VZkBDE=
X-Received: by 2002:ad4:5d4e:0:b0:8ca:ee3:6ea9 with SMTP id
 6a1803df08f44-8d32df2177fmr284743096d6.20.1781555883718; 
 Mon, 15 Jun 2026 13:38:03 -0700 (PDT)
X-Received: by 2002:ad4:5d4e:0:b0:8ca:ee3:6ea9 with SMTP id
 6a1803df08f44-8d32df2177fmr284742546d6.20.1781555883142; 
 Mon, 15 Jun 2026 13:38:03 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8d9f4740fbasm9749906d6.29.2026.06.15.13.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 13:38:02 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 10/13] hw/riscv: add create_fdt_socket_cpus()
Date: Mon, 15 Jun 2026 17:37:30 -0300
Message-ID: <20260615203734.954428-11-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615203734.954428-1-daniel.barboza@oss.qualcomm.com>
References: <20260615203734.954428-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dof4Svx3n-42Fh9-pZBH63eShG6v_77B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDIxOSBTYWx0ZWRfXx+Ay82rGbMAe
 iYxxr8w1xDhVVq02P77burTKOBkpJHd87grHV9N5d+cZ5FrBy59YOada5Lvy2jsj4NfpS5xsdky
 /WoMr+vXNJgEtOgNbknVpbQltg/rZZY=
X-Authority-Analysis: v=2.4 cv=QrJuG1yd c=1 sm=1 tr=0 ts=6a3062ac cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=mtC7jfOSo_ovbUFMjeEA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: dof4Svx3n-42Fh9-pZBH63eShG6v_77B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDIxOSBTYWx0ZWRfX2n/VN0Rz9qtC
 whHvFGiJAQEhN3TKVHHPrvZb5CU1ag5E+kMAuWhOLn+GM7JjNLrV3U+fIGsm47RmIcXvcQu1zzx
 SFOv7RchSbMhL0ATtmB8w6DPsShpe2CJuYHToU3FShre+fQgom5MXyEFolcO+OHIVacwyq24Dfx
 8tZO6tA5rjVr+69Y8SVy0ayqI+C6DSI+p9pXUACzNu2e87VbJjAIecICoFe7Nnmz9BYTdJoaF0g
 gzWJUMffbetxlBA9XWCF7I32rODQRcZhPplhmlDwZnB/2iItSMK3NJ8g3ioy7bvGpGSGImQJ/2H
 5+wKc+38lhL510FxViyOp8Luls7kvBkktSrQbBaUzkTvTSQ6uujQLcTSZTIhQHt2KTQsksNoiQK
 n/ylRO/4w9ZVjpHFx3ruE48R2u8UnrMX3hRXJHV/5CRsXsc1zqudDGvbHIOFGmQdThkjWQdexkP
 QWAID1RuLo8UU5gInfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150219
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

Consolidate the creation of CPUs socket FDT in a helper that can be
shared across all boards.

The code was basically moved from the function with the same name from
'virt.c', with additional bits to create the cluster subnode beforehand.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/fdt-common.c         | 74 +++++++++++++++++++++++++++++++
 hw/riscv/virt.c               | 83 +++--------------------------------
 include/hw/riscv/fdt-common.h |  7 +++
 3 files changed, 87 insertions(+), 77 deletions(-)

diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
index 02ac9ddcd8..6c795409a4 100644
--- a/hw/riscv/fdt-common.c
+++ b/hw/riscv/fdt-common.c
@@ -93,3 +93,77 @@ void fdt_create_cpu_socket_subnode(void *fdt, uint64_t timebase_frequency)
     qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
     qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
 }
+
+void create_fdt_socket_cpus(void *fdt, RISCVCPU *socket_harts,
+                            int socket_id, int num_harts_socket,
+                            int socket_hartid_base, uint32_t *phandle,
+                            uint32_t *intc_phandles, bool numa_enabled,
+                            bool is_32_bit)
+{
+    g_autofree char *clust_name = NULL;
+    uint32_t cpu_phandle;
+
+    clust_name = g_strdup_printf("/cpus/cpu-map/cluster%d", socket_id);
+    qemu_fdt_add_subnode(fdt, clust_name);
+
+    for (int cpu = num_harts_socket - 1; cpu >= 0; cpu--) {
+        RISCVCPU *cpu_ptr = &socket_harts[cpu];
+        int8_t satp_mode_max = cpu_ptr->cfg.max_satp_mode;
+        g_autofree char *cpu_name = NULL;
+        g_autofree char *core_name = NULL;
+        g_autofree char *intc_name = NULL;
+
+        cpu_phandle = (*phandle)++;
+
+        cpu_name = g_strdup_printf("/cpus/cpu@%d", socket_hartid_base + cpu);
+        qemu_fdt_add_subnode(fdt, cpu_name);
+
+        if (satp_mode_max != -1) {
+            g_autofree char *sv_name = NULL;
+            sv_name = g_strdup_printf("riscv,%s",
+                                      satp_mode_str(satp_mode_max, is_32_bit));
+            qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type", sv_name);
+        }
+        riscv_isa_write_fdt(cpu_ptr, fdt, cpu_name);
+
+        if (cpu_ptr->cfg.ext_zicbom) {
+            qemu_fdt_setprop_cell(fdt, cpu_name, "riscv,cbom-block-size",
+                                  cpu_ptr->cfg.cbom_blocksize);
+        }
+
+        if (cpu_ptr->cfg.ext_zicboz) {
+            qemu_fdt_setprop_cell(fdt, cpu_name, "riscv,cboz-block-size",
+                                  cpu_ptr->cfg.cboz_blocksize);
+        }
+
+        if (cpu_ptr->cfg.ext_zicbop) {
+            qemu_fdt_setprop_cell(fdt, cpu_name, "riscv,cbop-block-size",
+                                  cpu_ptr->cfg.cbop_blocksize);
+        }
+
+        qemu_fdt_setprop_string(fdt, cpu_name, "compatible", "riscv");
+        qemu_fdt_setprop_string(fdt, cpu_name, "status", "okay");
+        qemu_fdt_setprop_cell(fdt, cpu_name, "reg",
+                              socket_hartid_base + cpu);
+        qemu_fdt_setprop_string(fdt, cpu_name, "device_type", "cpu");
+        if (numa_enabled) {
+            qemu_fdt_setprop_cell(fdt, cpu_name, "numa-node-id", socket_id);
+        }
+        qemu_fdt_setprop_cell(fdt, cpu_name, "phandle", cpu_phandle);
+
+        intc_phandles[cpu] = (*phandle)++;
+
+        intc_name = g_strdup_printf("%s/interrupt-controller", cpu_name);
+        qemu_fdt_add_subnode(fdt, intc_name);
+        qemu_fdt_setprop_cell(fdt, intc_name, "phandle",
+                              intc_phandles[cpu]);
+        qemu_fdt_setprop_string(fdt, intc_name, "compatible",
+                                "riscv,cpu-intc");
+        qemu_fdt_setprop(fdt, intc_name, "interrupt-controller", NULL, 0);
+        qemu_fdt_setprop_cell(fdt, intc_name, "#interrupt-cells", 1);
+
+        core_name = g_strdup_printf("%s/core%d", clust_name, cpu);
+        qemu_fdt_add_subnode(fdt, core_name);
+        qemu_fdt_setprop_cell(fdt, core_name, "cpu", cpu_phandle);
+    }
+}
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 6641b60131..33775a61fd 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -231,77 +231,6 @@ static void create_pcie_irq_map(RISCVVirtState *s, void *fdt, char *nodename,
                            0x1800, 0, 0, 0x7);
 }
 
-static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
-                                   char *clust_name, uint32_t *phandle,
-                                   uint32_t *intc_phandles)
-{
-    int cpu;
-    uint32_t cpu_phandle;
-    MachineState *ms = MACHINE(s);
-    bool is_32_bit = riscv_is_32bit(&s->soc[0]);
-
-    for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
-        RISCVCPU *cpu_ptr = &s->soc[socket].harts[cpu];
-        int8_t satp_mode_max = cpu_ptr->cfg.max_satp_mode;
-        g_autofree char *cpu_name = NULL;
-        g_autofree char *core_name = NULL;
-        g_autofree char *intc_name = NULL;
-        g_autofree char *sv_name = NULL;
-
-        cpu_phandle = (*phandle)++;
-
-        cpu_name = g_strdup_printf("/cpus/cpu@%d",
-            s->soc[socket].hartid_base + cpu);
-        qemu_fdt_add_subnode(ms->fdt, cpu_name);
-
-        if (satp_mode_max != -1) {
-            sv_name = g_strdup_printf("riscv,%s",
-                                      satp_mode_str(satp_mode_max, is_32_bit));
-            qemu_fdt_setprop_string(ms->fdt, cpu_name, "mmu-type", sv_name);
-        }
-
-        riscv_isa_write_fdt(cpu_ptr, ms->fdt, cpu_name);
-
-        if (cpu_ptr->cfg.ext_zicbom) {
-            qemu_fdt_setprop_cell(ms->fdt, cpu_name, "riscv,cbom-block-size",
-                                  cpu_ptr->cfg.cbom_blocksize);
-        }
-
-        if (cpu_ptr->cfg.ext_zicboz) {
-            qemu_fdt_setprop_cell(ms->fdt, cpu_name, "riscv,cboz-block-size",
-                                  cpu_ptr->cfg.cboz_blocksize);
-        }
-
-        if (cpu_ptr->cfg.ext_zicbop) {
-            qemu_fdt_setprop_cell(ms->fdt, cpu_name, "riscv,cbop-block-size",
-                                  cpu_ptr->cfg.cbop_blocksize);
-        }
-
-        qemu_fdt_setprop_string(ms->fdt, cpu_name, "compatible", "riscv");
-        qemu_fdt_setprop_string(ms->fdt, cpu_name, "status", "okay");
-        qemu_fdt_setprop_cell(ms->fdt, cpu_name, "reg",
-            s->soc[socket].hartid_base + cpu);
-        qemu_fdt_setprop_string(ms->fdt, cpu_name, "device_type", "cpu");
-        riscv_socket_fdt_write_id(ms, cpu_name, socket);
-        qemu_fdt_setprop_cell(ms->fdt, cpu_name, "phandle", cpu_phandle);
-
-        intc_phandles[cpu] = (*phandle)++;
-
-        intc_name = g_strdup_printf("%s/interrupt-controller", cpu_name);
-        qemu_fdt_add_subnode(ms->fdt, intc_name);
-        qemu_fdt_setprop_cell(ms->fdt, intc_name, "phandle",
-            intc_phandles[cpu]);
-        qemu_fdt_setprop_string(ms->fdt, intc_name, "compatible",
-            "riscv,cpu-intc");
-        qemu_fdt_setprop(ms->fdt, intc_name, "interrupt-controller", NULL, 0);
-        qemu_fdt_setprop_cell(ms->fdt, intc_name, "#interrupt-cells", 1);
-
-        core_name = g_strdup_printf("%s/core%d", clust_name, cpu);
-        qemu_fdt_add_subnode(ms->fdt, core_name);
-        qemu_fdt_setprop_cell(ms->fdt, core_name, "cpu", cpu_phandle);
-    }
-}
-
 static void create_fdt_socket_aclint(RISCVVirtState *s,
                                      int socket,
                                      uint32_t *intc_phandles)
@@ -693,6 +622,7 @@ static void create_fdt_sockets(RISCVVirtState *s,
     g_autofree uint32_t *intc_phandles = NULL;
     int socket_count = riscv_socket_count(ms);
     bool numa_enabled = riscv_numa_enabled(ms);
+    bool is_32_bit = riscv_is_32bit(&s->soc[0]);
 
     fdt_create_cpu_socket_subnode(ms->fdt,
         kvm_enabled() ? kvm_riscv_get_timebase_frequency(&s->soc->harts[0]) :
@@ -702,18 +632,17 @@ static void create_fdt_sockets(RISCVVirtState *s,
 
     phandle_pos = ms->smp.cpus;
     for (socket = (socket_count - 1); socket >= 0; socket--) {
-        g_autofree char *clust_name = NULL;
         hwaddr memaddr = s->memmap[VIRT_DRAM].base +
                          riscv_socket_mem_offset(ms, socket);
         uint64_t memsize = riscv_socket_mem_size(ms, socket);
 
         phandle_pos -= s->soc[socket].num_harts;
 
-        clust_name = g_strdup_printf("/cpus/cpu-map/cluster%d", socket);
-        qemu_fdt_add_subnode(ms->fdt, clust_name);
-
-        create_fdt_socket_cpus(s, socket, clust_name, phandle,
-                               &intc_phandles[phandle_pos]);
+        create_fdt_socket_cpus(ms->fdt, (&s->soc[socket])->harts, socket,
+                               s->soc[socket].num_harts,
+                               s->soc[socket].hartid_base,
+                               phandle, &intc_phandles[phandle_pos],
+                               numa_enabled, is_32_bit);
 
         create_fdt_socket_memory(ms->fdt, memaddr, memsize,
                                  socket, riscv_numa_enabled(ms));
diff --git a/include/hw/riscv/fdt-common.h b/include/hw/riscv/fdt-common.h
index 27020e69c6..3af9d5c3fd 100644
--- a/include/hw/riscv/fdt-common.h
+++ b/include/hw/riscv/fdt-common.h
@@ -9,6 +9,8 @@
 #ifndef RISCV_VIRT_FDT_H
 #define RISCV_VIRT_FDT_H
 
+#include "target/riscv/cpu.h"
+
 void *create_board_device_tree(const char *model, const char *compatible,
                                int *fdt_size);
 void create_fdt_socket_memory(void *fdt, hwaddr addr, uint64_t size,
@@ -19,4 +21,9 @@ void create_fdt_socket_clint(void *fdt, hwaddr addr, uint64_t size,
                              int socket_id, uint32_t *intc_phandles,
                              int num_harts, bool numa_enabled);
 void fdt_create_cpu_socket_subnode(void *fdt, uint64_t timebase_frequency);
+void create_fdt_socket_cpus(void *fdt, RISCVCPU *socket_harts,
+                            int socket_id, int num_harts_socket,
+                            int socket_hartid_base, uint32_t *phandle,
+                            uint32_t *intc_phandles, bool numa_enabled,
+                            bool is_32_bit);
 #endif
-- 
2.43.0


