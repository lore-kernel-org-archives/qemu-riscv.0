Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA4CC61DCB
	for <qemu-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 20:41:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x03Mv-0007e0-RQ; Fri, 28 Aug 2026 16:40:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x03Mt-0007Zp-Tx
 for qemu-riscv@nongnu.org; Fri, 28 Aug 2026 16:40:07 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x03Mr-0006Ys-U7
 for qemu-riscv@nongnu.org; Fri, 28 Aug 2026 16:40:07 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67SKZpbF4122308
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 20:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8bTAXk5k+xdLI4q5OKGzJ/3LxYZfT/KUXW18EC8kfKc=; b=fD53IpULMArUCk9T
 CQ/RSwPtwcHIyaEz+JK3o2lXH2AyHKR7wGNTqyLnfLjD8V0ZLyz5lVs2dTG0MpYp
 0B0ke05FtW/KA75BamVT67jk0ZLy6vOG3L8EvAzYDqd+AllI8oNXQ5Mrb+baozJk
 RGtQWHtgMfCzbozU+Avr52IbaiOtNtHEDnBM5dyvyThl9GQDR8mR515TPNcnZrrg
 zMvojKxAJ7Eoron+8Xfp8pDJWGbhVWgwx9gevuijZJAeuJdZRosIcX53WpB6Ig6P
 zjaitwpeSPiADQ0TOoVB1f6NhYw6i7DyUJPQkc13FxFewINY53qucfLj68XdNWUv
 57nm/g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbhgq80d4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 20:39:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93903982af1so273686085a.3
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 13:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787949594; x=1788554394; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=8bTAXk5k+xdLI4q5OKGzJ/3LxYZfT/KUXW18EC8kfKc=;
 b=YArhyHT38Om1QXWsmBkSAYaUOUjFciqAJXw8sJ8r5El0i969KAHf/iCuKBEqzNW0uA
 cAYnSwyLaaMy2bUIdW3JFs2lNUE/0TCuGx3s/+26iUvxJzfh/JFmOklZx4u4/ietjWWr
 TOvoSDMX+xfu7WhiQMzy4lVNxmdJ3DMFriErKJ0PTFMw5dOxUcGzwUMlZHx5qs8GKDyh
 pAANoww+toePL+AMV/+8E3CUOtPZSsymBwWWGkNh4FFuWN3oT4QgcDZ2UMdHCpQVUyc2
 L2w6oQ8JiZ7Y8gzKTmorQKPeEAxM50wwnBRqP1W4AYvN02eLt8OLXvtGuUrYWxTRlPFY
 5H5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787949594; x=1788554394;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=8bTAXk5k+xdLI4q5OKGzJ/3LxYZfT/KUXW18EC8kfKc=;
 b=P98y1/AKQW3+zz8o9IoP8RzJMFhRIP4/cRPOXDo+6T7TLhrLICkuwgXF0qDWxcVDJa
 zTmApPuPoQkHRHjco9r4wnZruKL7xj7G+SLo5VWdC729a3VW2LPr8+T2DcAJrXVFswpv
 vfU4tXOY9MJw75qTTHParifRcD+B7BcMqa3U0Ms0inLm576K+G+XQSEAsYUwrEDf5nAl
 eG7VDrDLlVj47eBKeu3TkIM4WT3fOdRmyPvMLo3S/zCmYW3wzVRUP/qwiCETGVAO2M0A
 XEAmaSGwECQVax5CHyD+G9GaeTw+cVzqkJi7XFMg/Q7vIE2siehZ9Infx1TzBpYVf+Wr
 LExw==
X-Gm-Message-State: AFuF++k9b+pbbVBkYcuLp92nGqWYViRLDV39QcnF/BbY78Bb3ntfxJxk
 VUDtf5vJdACff5BrrM6Uao5Dr+wTRVH3nkTqMdKGqjJcNNUt5uOAWPjAoVwdMklq8eARYQ2H5m2
 4cHP+YLXIKZgo4E1HVLNZ5kYeZiZdjhGk67WcDfubRvuTQLB0hneCD7Xmnw==
X-Gm-Gg: AR+sD122QGXPPOOO0wdZYSiRPdr+Dp+/Avd0ESKFcJfWvd6fZCVr+vfNjbMfjPQnbS/
 BChIvpVnIt/CQCIt0NxN6cdU4o69vpS8cDCidgxee1W/Hk8NMPU86eth6EUvC5VN3RQhqIHX0FJ
 usCsRSv4lGE5Pu9zBRbYRmoLlv+49fnshcDhgAHbkkH6swNpH51C9fur9pY57xH8hKS2Nt4gPwW
 2P1YXPzOUNfzHKbvmch5JmQDBowyDfL9LAiUQ7takIrvJHGYtpgY01U+QySs1RGe+wdW+7e1RY9
 YsNpcaetq9Nn0GB50Fytr/yYnh1TZoKbYz66VEe1SMvmpEir8P0D4WZB3rd8Iiu2aBGVtbMXefX
 awV1397JDiDPyHTq8/7KQSjd20Ni04S61gb9HSw==
X-Received: by 2002:a05:620a:6886:b0:92e:9d63:a6f6 with SMTP id
 af79cd13be357-93913808713mr1165222385a.17.1787949594384; 
 Fri, 28 Aug 2026 13:39:54 -0700 (PDT)
X-Received: by 2002:a05:620a:6886:b0:92e:9d63:a6f6 with SMTP id
 af79cd13be357-93913808713mr1165216385a.17.1787949593884; 
 Fri, 28 Aug 2026 13:39:53 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-939173f2758sm218063985a.37.2026.08.28.13.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2026 13:39:53 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v5 10/15] hw/riscv/fdt-common,
 virt.c: add riscv_create_fdt_uart()
Date: Fri, 28 Aug 2026 17:39:12 -0300
Message-ID: <20260828203918.350131-11-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828203918.350131-1-daniel.barboza@oss.qualcomm.com>
References: <20260828203918.350131-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: y9J7PbblEDBMTmMJ-8bD_SHCnaRnnD33
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE3OSBTYWx0ZWRfXy3swvYh5og+f
 OXX+16yuYDacIoBIcHEdJ92Yg9VHy1So99VvC4f806dhiYZsDBnu1r0muEOQdyb8mICCrguKlE+
 sUOBnEIwTl0Jtpbif+Findu59rTKMmg=
X-Proofpoint-ORIG-GUID: y9J7PbblEDBMTmMJ-8bD_SHCnaRnnD33
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE3OSBTYWx0ZWRfX3BDaZw96rvSU
 TQcmg2iAcACULLCYjrIgcyRn94xlghj7agH9T/QRSv1sKP94q5mklKExIEPbgMRDjzlmRVA1NK0
 ojaMaa2diReB/ZKT6I5378VGTZ8A+wtM1R631ijD6oUkQA2Ki472sdc9vpSuwdnobmzp4MY/F6s
 6lhA4m3a3fB4VBe2Tdflyk49OpuGNGSsQbktpaw5YAEwn894zx2vuYi+FnukXDi9qB92Q81I0An
 VedhQrhCF2dft0EBJJ/4PBCQtdM9aBExhER/NeGM3PCk6VTMYzWIz0d+obHtHpN9MmoAbPKkEBB
 OiZjiX5ZCuF1pa1NYZXycQgTyEbEOIlqDqRDc7ZtFXx0bn9og/iXMY/YKUbKY2svRm3g3UuRg0e
 kc8b8yFBa9V402RZFUY03w+i7bKuXx/RBwwU6kynUNLhEDHc+8DBdtGIZP+c4HrXQB4yvkAbDeq
 Cm3l5sG2i9upzIGo5DQ==
X-Authority-Analysis: v=2.4 cv=CsGPtH4D c=1 sm=1 tr=0 ts=6a91f21a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Rd_eAvTXF2ongSiteCUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
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

Add a common uart FDT helper to be used by 'virt' and the future
'riscv-server-ref' board.

The 'tt-atlantis' board is left out of this patch because it's going
through UART related changes and its FDT might change soon, thus it's
better to wait for the final DT to be determined and then we can
evaluate whether it can share a common helper.

The "/chosen" and "/alias" changes are UART0 only so we're keeping them
out of the common helper.  The board can set both manually as
appropriate.

No FDT changes intended.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/riscv/fdt-common.c         | 29 +++++++++++++++++++++++++++++
 hw/riscv/virt.c               | 35 +++++++++--------------------------
 include/hw/riscv/fdt-common.h |  5 +++++
 3 files changed, 43 insertions(+), 26 deletions(-)

diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
index d2ce93ad28..0107aadaad 100644
--- a/hw/riscv/fdt-common.c
+++ b/hw/riscv/fdt-common.c
@@ -22,6 +22,8 @@
 #include "hw/pci/pcie_host.h"
 #include "hw/riscv/aia.h"
 
+#define UART_STD_CLOCK_FREQ 3686400 /* 3.6864 MHz */
+
 void *riscv_create_board_device_tree(const char *model, const char *compatible,
                                      int *fdt_size)
 {
@@ -799,3 +801,30 @@ void riscv_create_fdt_socket_aclint(void *fdt, ACLINTFdtProps *props,
         g_free(name);
     }
 }
+
+char *riscv_fdt_get_uart_nodename(hwaddr addr)
+{
+    return g_strdup_printf("/soc/serial@%"HWADDR_PRIx, addr);
+}
+
+void riscv_create_fdt_uart(void *fdt, const MemMapEntry *uart_mem,
+                           int uart_irq, int aia_type,
+                           uint32_t irq_phandle)
+{
+    g_autofree char *name = riscv_fdt_get_uart_nodename(uart_mem->base);
+
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop_string(fdt, name, "compatible", "ns16550a");
+    qemu_fdt_setprop_sized_cells(fdt, name, "reg",
+                                 2, uart_mem->base,
+                                 2, uart_mem->size);
+
+    qemu_fdt_setprop_cell(fdt, name, "clock-frequency", UART_STD_CLOCK_FREQ);
+    qemu_fdt_setprop_cell(fdt, name, "interrupt-parent", irq_phandle);
+
+    if (aia_type == AIA_TYPE_NONE) {
+        qemu_fdt_setprop_cell(fdt, name, "interrupts", uart_irq);
+    } else {
+        qemu_fdt_setprop_cells(fdt, name, "interrupts", uart_irq, 0x4);
+    }
+}
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 717a01da8d..3e40513dc1 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -418,39 +418,22 @@ static void create_fdt_virtio(RISCVVirtState *s, uint32_t irq_virtio_phandle)
     }
 }
 
-static void create_fdt_uart(RISCVVirtState *s,
-                            uint32_t irq_mmio_phandle, int memId, int irqNo)
+static void create_fdt_uarts(RISCVVirtState *s, uint32_t irq_mmio_phandle)
 {
     g_autofree char *name = NULL;
     MachineState *ms = MACHINE(s);
 
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
+    if (s->uart1_present) {
+        riscv_create_fdt_uart(ms->fdt, &s->memmap[VIRT_UART1],
+                              UART1_IRQ, s->aia_type, irq_mmio_phandle);
     }
 
-    if (VIRT_UART0 == memId) {
-        qemu_fdt_setprop_string(ms->fdt, "/chosen", "stdout-path", name);
-        qemu_fdt_setprop_string(ms->fdt, "/aliases", "serial0", name);
-    }
-}
+    riscv_create_fdt_uart(ms->fdt, &s->memmap[VIRT_UART0], UART0_IRQ,
+                          s->aia_type, irq_mmio_phandle);
 
-static void create_fdt_uarts(RISCVVirtState *s, uint32_t irq_mmio_phandle)
-{
-    if (s->uart1_present) {
-        create_fdt_uart(s, irq_mmio_phandle, VIRT_UART1, UART1_IRQ);
-    }
-    create_fdt_uart(s, irq_mmio_phandle, VIRT_UART0, UART0_IRQ);
+    name = riscv_fdt_get_uart_nodename(s->memmap[VIRT_UART0].base);
+    qemu_fdt_setprop_string(ms->fdt, "/chosen", "stdout-path", name);
+    qemu_fdt_setprop_string(ms->fdt, "/aliases", "serial0", name);
 }
 
 static void create_fdt_rtc(RISCVVirtState *s,
diff --git a/include/hw/riscv/fdt-common.h b/include/hw/riscv/fdt-common.h
index a45b063f66..c8b25348bd 100644
--- a/include/hw/riscv/fdt-common.h
+++ b/include/hw/riscv/fdt-common.h
@@ -128,4 +128,9 @@ void riscv_create_fdt_socket_aplic(void *fdt, APLICFdtProps *props,
                                    uint32_t *aplic_phandles);
 void riscv_create_fdt_socket_aclint(void *fdt, ACLINTFdtProps *props,
                                     uint32_t *intc_phandles);
+/* Caller must free the returned string.  */
+char *riscv_fdt_get_uart_nodename(hwaddr addr);
+void riscv_create_fdt_uart(void *fdt, const MemMapEntry *uart_mem,
+                           int uart_irq, int aia_type,
+                           uint32_t irq_phandle);
 #endif
-- 
2.43.0


