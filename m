Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D96D8C61DCA
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 21:26:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wyyct-0003fj-Ie; Tue, 25 Aug 2026 17:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wyycr-0003eq-8F
 for qemu-riscv@nongnu.org; Tue, 25 Aug 2026 17:24:09 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wyyco-0002JB-Q4
 for qemu-riscv@nongnu.org; Tue, 25 Aug 2026 17:24:08 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67PL9YCE3675663
 for <qemu-riscv@nongnu.org>; Tue, 25 Aug 2026 21:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=b4Miz9TXKzy
 RvuNMMeQe6KMM7OsPQgD3XGcw9fM+m+M=; b=KArojKMmT1yEPS8dBjoOi/q92Ln
 ExrYjXiROMHGdNlqicP/Dc0wEuw6TyhV16EsxhuN6GXN2bcy59rC6hS9qU3bT12b
 XMPH9LbkVhyj6sTsfgw3MW07xYPGbk+2XKQ54G6nNFLsil9eTGvKHiRI8laKckO+
 rx+O7MB07hsEVOoDxtFzhbQ1U1Nx7++86UykIhEfdpcn8QdQ4X/rU63VH20D/3GN
 /Rp3uXVvVrxteNuhgW+9NOr9v2LvYPqXzCkxKF20FdX5f6FbXJ/o95cX5t3kru4r
 U5JHdGZsjG3/srELMfH35pj8MD9UzQDH1YxIOaSPENho9mZ73wrygG2G7VQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fgxgtjy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 25 Aug 2026 21:24:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-52769fc3f2eso4356471cf.0
 for <qemu-riscv@nongnu.org>; Tue, 25 Aug 2026 14:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787693044; x=1788297844; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=b4Miz9TXKzyRvuNMMeQe6KMM7OsPQgD3XGcw9fM+m+M=;
 b=irzakzhYndyPHCHfNpocj3qypHwVbxqwr9H2vyaJQW1WTDGx2TfJVXfu5Pcb06FpOD
 hcTZy2fACW5LK0dfvhhtvquyLMG4eaHY/SIuvhhyob+/9QBAo8pxppOiRIDbcvW240LT
 gnlsjxlzL8mS/rwt3IPVeijKMivbZtKQtnuLJyPnYSbTTvh0R9ZQaunATXZ9luji3zFj
 gwWq2IaX1RmX55WakzbYPvunvLEnAza3VXH+I5umCAi62gXJHl9tiVECrfSQJXro+b6A
 B16dVEvjI3v7U+fr+jeCFABA4HQQ/RTtMKSR8CvgMU1+h0L3g22gazG4taR6WDztPmAB
 AFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787693044; x=1788297844;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=b4Miz9TXKzyRvuNMMeQe6KMM7OsPQgD3XGcw9fM+m+M=;
 b=BYHoQMK+EActRDoK6j3r3kvLmd4FbZKPuXPcXuLL5YB02Ad5C6DvbNC72ZeKxtvVfL
 TOcswa7+mYvnrHIFrRUWDk1PKk7JabYtOlUs/buRnUGfQPJpmzMiVP+gDIp29iVXBWqK
 CoYYlxdPKQJPO9/gCygxJDQmMUwgA01wcuSM+kSzLcNVZn8bz3bgwN3OTrEc9r1Nuqn+
 HChKfl/Q5602B30pL3q/wcak9pop3/WUFQo9bf/H1vmDVWItgFZHrHqB4WciB2Pi4fiX
 FGvMA2o6EOH7v0dDDpbzLHDNtKbifePIbSgBOD7WFhOQTtEJSf7spMigTgg8YY9T5zv6
 EYxw==
X-Gm-Message-State: AFuF++nHxgL2S0B0+2yq7iFN7T+uT9+qR1iF3ku2h8OF9b2Xdt39TD8S
 CWjSX2NisB+XEkZkoigOHMdCyOZvOOcuJpvnPWgdS/PiDtxEyU7CLyAYyxnfi9xTHGNwvtXmQXu
 XOy1h3jWLMJDcq2qbLwWoSjaQ9bvF8tRwrue0h7AAYx3QeW/x3fwfpL1IRA==
X-Gm-Gg: AR+sD10asz9knutVqcDbJsXuce9sJkFPpji2VbKI6OiBY8USu/PlllStnQ9i0+t9y9j
 34hc9UhHYNM6Ku23KppRp3zICTrBHhcyFNgukraxIRMOg7K/drMroVYx/aQt/TAbPOBCJPkeXC7
 +orcunXDionuPICF/IVfhxuZE0bue2qtJ50acesEiW7J5evRspDRRKd2ttE7hcqwL+6y7KsruWi
 Qs7SXaRAO0WtJbwt8O2AKnh7RV5dAdd53qgk3RJnvpPrDeTVtTDfjAcV1vn9AX0ds6L0hiL3ahE
 fFpA7e/m9dI48famrhtCsgemDKSmkK6YbyiTIgWiU0lIOmKj/JkKJBmftovN0wSqjwpD3gVWyjb
 5rqO33blKvSv6jcnK7FetaAlNeKgxbL4Kiot+FQ==
X-Received: by 2002:a05:622a:4186:b0:51c:ae7:fa1d with SMTP id
 d75a77b69052e-52e42234b68mr23143211cf.5.1787693044316; 
 Tue, 25 Aug 2026 14:24:04 -0700 (PDT)
X-Received: by 2002:a05:622a:4186:b0:51c:ae7:fa1d with SMTP id
 d75a77b69052e-52e42234b68mr23142801cf.5.1787693043905; 
 Tue, 25 Aug 2026 14:24:03 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90cc65299f0sm8646386d6.41.2026.08.25.14.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 14:24:03 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Joel Stanley <joel@jms.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>
Subject: [PATCH 08/13] hw/riscv/fdt-common, virt.c,
 tt_atlantis.c: add create_fdt_uart()
Date: Tue, 25 Aug 2026 18:23:20 -0300
Message-ID: <20260825212326.1907-9-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825212326.1907-1-daniel.barboza@oss.qualcomm.com>
References: <20260825212326.1907-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MqZiLWae c=1 sm=1 tr=0 ts=6a8e07f5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=ZXiSWbBV69HJ4aRO-VQA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: jtXi6QiNobq4QB-KKsZXAIWQQsf3N1z9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDE4MiBTYWx0ZWRfXw63m6eARq9Dl
 4rV4c1OUN6YEdVCj+UiKi+j0NAC5BRE0P6SRArWtZFEbZDW8j3YwTSNxYOtxkKPGPorPcSbZigk
 aL/k0Xo+ay/0MyqZEgR/qCx9Q4vfbH/39pi6MTYWfPoH3pp290X4A4ItOvOon0ErKl6xw+QZjPK
 3lFBsYlh630u9c3U9hVFzJJvMJR2Gj8xtYmPlOk+EkWJuroxIcgUJnr7169mlETZLn3QtAWMsYn
 NWpoTj40IUnFFxEgKkleQcQ7grkKxSUlTu9GBBsNSSfbgrH2YIyT7iMwVarD4xhpg+FMzPM3Pdj
 7QNTTrC3WJExwd7Wu+xpbYfahk4zc75Ea1vaA7akaUOuCsu/EduLoGgVjjV20/rkp1q7rXJ2f9+
 Fr4XyJyXY0JfXsNBExanirch+lkgzrZAyJdmH4zMtIyFacWs3KI1EpZ4BQ7y26My41nied6SMmz
 16WIfmTT8Ib1puPCTRA==
X-Proofpoint-GUID: jtXi6QiNobq4QB-KKsZXAIWQQsf3N1z9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDE4MiBTYWx0ZWRfXxQ2srmL9cNNx
 Af9+9lXW0pcbR8Q981CLG1ZVcyEdIW+7pZ2Wodg85GG1PMIAPvaGr5EPs2/neSFkowTeemjmC20
 rQhHXFoIrKDlndQWcq4PRtUAMRxE8Gc=
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

Add a common uart FDT helper to be used by 'virt' and 'tt-atlantis'.

To accomodate both boards the helper is doing the following:
- an 'additional_reg_props' flag is used to control whether we want
  'reg-shift' and 'reg-io-width' elements added.  OpenSBI won't boot
  with the tt-atlantis board without them, but 'virt' can't deal with
  them being added unconditionally either.
- an 'is_serial0' flag is added to control whether we need to set
  additional properties related to the first serial.  This is required
  because the 'virt' board adds two uarts in the FDT.

No FDT changes intended.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/fdt-common.c         | 39 +++++++++++++++++++++++++++++++
 hw/riscv/tt_atlantis.c        | 21 +----------------
 hw/riscv/virt.c               | 44 +++++++----------------------------
 include/hw/riscv/fdt-common.h |  4 ++++
 4 files changed, 52 insertions(+), 56 deletions(-)

diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
index f31cc9d3cc..b3f3af3762 100644
--- a/hw/riscv/fdt-common.c
+++ b/hw/riscv/fdt-common.c
@@ -791,3 +791,42 @@ void create_fdt_socket_aclint(void *fdt, ACLINTFdtProps *props,
         g_free(name);
     }
 }
+
+void create_fdt_uart(void *fdt, const MemMapEntry *uart_mem,
+                     int uart_irq, int aia_type,
+                     bool additional_reg_props, bool is_serial0,
+                     uint32_t irq_mmio_phandle)
+{
+    g_autofree char *name = NULL;
+
+    name = g_strdup_printf("/soc/serial@%"HWADDR_PRIx, uart_mem->base);
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop_string(fdt, name, "compatible", "ns16550a");
+    qemu_fdt_setprop_sized_cells(fdt, name, "reg",
+                                 2, uart_mem->base,
+                                 2, uart_mem->size);
+
+    /*
+     * The tt-atlantis board requires these extra props in the
+     * DT, but adding them unconditionally will break OpenSBI
+     * for 'virt'.
+     */
+    if (additional_reg_props) {
+        qemu_fdt_setprop_cell(fdt, name, "reg-shift", 2);
+        qemu_fdt_setprop_cell(fdt, name, "reg-io-width", 4);
+    }
+
+    qemu_fdt_setprop_cell(fdt, name, "clock-frequency", 3686400);
+    qemu_fdt_setprop_cell(fdt, name, "interrupt-parent", irq_mmio_phandle);
+
+    if (aia_type == AIA_TYPE_NONE) {
+        qemu_fdt_setprop_cell(fdt, name, "interrupts", uart_irq);
+    } else {
+        qemu_fdt_setprop_cells(fdt, name, "interrupts", uart_irq, 0x4);
+    }
+
+    if (is_serial0) {
+        qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", name);
+        qemu_fdt_setprop_string(fdt, "/aliases", "serial0", name);
+    }
+}
diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
index d808bcc11c..eb22b67b71 100644
--- a/hw/riscv/tt_atlantis.c
+++ b/hw/riscv/tt_atlantis.c
@@ -259,25 +259,6 @@ static void create_fdt_cpu(TTAtlantisState *s, const MemMapEntry *memmap,
                          IRQ_S_EXT, s->soc.num_harts);
 }
 
-static void create_fdt_uart(void *fdt, const MemMapEntry *mem, int irq,
-                            int irqchip_phandle)
-{
-    g_autofree char *name = g_strdup_printf("/soc/serial@%"HWADDR_PRIX,
-                                            mem->base);
-
-    qemu_fdt_add_subnode(fdt, name);
-    qemu_fdt_setprop_string(fdt, name, "compatible", "ns16550a");
-    qemu_fdt_setprop_sized_cells(fdt, name, "reg", 2, mem->base, 2, mem->size);
-    qemu_fdt_setprop_cell(fdt, name, "reg-shift", 2);
-    qemu_fdt_setprop_cell(fdt, name, "reg-io-width", 4);
-    qemu_fdt_setprop_cell(fdt, name, "clock-frequency", 3686400);
-    qemu_fdt_setprop_cell(fdt, name, "interrupt-parent", irqchip_phandle);
-    qemu_fdt_setprop_cells(fdt, name, "interrupts", irq, 0x4);
-
-    qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", name);
-    qemu_fdt_setprop_string(fdt, "/aliases", "serial0", name);
-}
-
 static void create_fdt_rng(void *fdt)
 {
     uint8_t rng_seed[32];
@@ -345,7 +326,7 @@ static void finalize_fdt(TTAtlantisState *s)
      */
 
     create_fdt_uart(fdt, &s->memmap[TT_ATL_UART1], TT_ATL_UART1_IRQ,
-                    aplic_s_phandle);
+                    AIA_TYPE_APLIC_IMSIC, true, true, aplic_s_phandle);
 
     create_fdt_clk(fdt, "periph-clk", 100000000, periph_clk_phandle);
 
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index ef2670f20e..e4bf9c26ef 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -415,41 +415,6 @@ static void create_fdt_virtio(RISCVVirtState *s, uint32_t irq_virtio_phandle)
     }
 }
 
-static void create_fdt_uart(RISCVVirtState *s,
-                            uint32_t irq_mmio_phandle, int memId, int irqNo)
-{
-    g_autofree char *name = NULL;
-    MachineState *ms = MACHINE(s);
-
-    name = g_strdup_printf("/soc/serial@%"HWADDR_PRIx,
-                           s->memmap[memId].base);
-    qemu_fdt_add_subnode(ms->fdt, name);
-    qemu_fdt_setprop_string(ms->fdt, name, "compatible", "ns16550a");
-    qemu_fdt_setprop_sized_cells(ms->fdt, name, "reg",
-                                 2, s->memmap[memId].base,
-                                 2, s->memmap[memId].size);
-    qemu_fdt_setprop_cell(ms->fdt, name, "clock-frequency", 3686400);
-    qemu_fdt_setprop_cell(ms->fdt, name, "interrupt-parent", irq_mmio_phandle);
-    if (s->aia_type == VIRT_AIA_TYPE_NONE) {
-        qemu_fdt_setprop_cell(ms->fdt, name, "interrupts", irqNo);
-    } else {
-        qemu_fdt_setprop_cells(ms->fdt, name, "interrupts", irqNo, 0x4);
-    }
-
-    if (VIRT_UART0 == memId) {
-        qemu_fdt_setprop_string(ms->fdt, "/chosen", "stdout-path", name);
-        qemu_fdt_setprop_string(ms->fdt, "/aliases", "serial0", name);
-    }
-}
-
-static void create_fdt_uarts(RISCVVirtState *s, uint32_t irq_mmio_phandle)
-{
-    if (s->uart1_present) {
-        create_fdt_uart(s, irq_mmio_phandle, VIRT_UART1, UART1_IRQ);
-    }
-    create_fdt_uart(s, irq_mmio_phandle, VIRT_UART0, UART0_IRQ);
-}
-
 static void create_fdt_rtc(RISCVVirtState *s,
                            uint32_t irq_mmio_phandle)
 {
@@ -571,7 +536,14 @@ static void finalize_fdt(RISCVVirtState *s)
                       s->memmap[VIRT_TEST].base, s->memmap[VIRT_TEST].size,
                       FINISHER_RESET, FINISHER_PASS, true);
 
-    create_fdt_uarts(s, irq_mmio_phandle);
+    create_fdt_uart(MACHINE(s)->fdt, &s->memmap[VIRT_UART0], UART0_IRQ,
+                    s->aia_type, false, true, irq_mmio_phandle);
+
+    if (s->uart1_present) {
+        create_fdt_uart(MACHINE(s)->fdt, &s->memmap[VIRT_UART1],
+                        UART1_IRQ, s->aia_type, false, false,
+                        irq_mmio_phandle);
+    }
 
     create_fdt_rtc(s, irq_mmio_phandle);
 }
diff --git a/include/hw/riscv/fdt-common.h b/include/hw/riscv/fdt-common.h
index fbcf9aaffb..cef1073449 100644
--- a/include/hw/riscv/fdt-common.h
+++ b/include/hw/riscv/fdt-common.h
@@ -123,4 +123,8 @@ void create_fdt_socket_aplic(void *fdt, APLICFdtProps *props,
                              uint32_t *aplic_phandles);
 void create_fdt_socket_aclint(void *fdt, ACLINTFdtProps *props,
                               uint32_t *intc_phandles);
+void create_fdt_uart(void *fdt, const MemMapEntry *uart_mem,
+                     int uart_irq, int aia_type,
+                     bool additional_reg_props, bool is_serial0,
+                     uint32_t irq_mmio_phandle);
 #endif
-- 
2.43.0


