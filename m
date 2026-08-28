Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F6DC61DBD
	for <qemu-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 20:43:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x03Mx-0007jL-H0; Fri, 28 Aug 2026 16:40:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x03Mv-0007eL-UZ
 for qemu-riscv@nongnu.org; Fri, 28 Aug 2026 16:40:09 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x03Mu-0006ZV-BJ
 for qemu-riscv@nongnu.org; Fri, 28 Aug 2026 16:40:09 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67SJdYPT125969
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 20:39:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xEdPCCLzIVRspO+yj25546pzzNDI8awn4evP4Q7pQ/I=; b=Ql7qoHZLR+nLVTDN
 6+SSjRtCfcECJ+Q174C4j0CBbXHqZhX/T5R6vhdlVuP1UjLbEE0ZtJuYo6W9eRiI
 X64uW9qIIV1GNTNCIquormFBPp0He95fJ6jIHPFlwGdJb4yIgrkRYP+mv1hk+YcG
 +u6833JCUmiXAaOIV21E8jqK1+lGS3EKsrrbMoSPQhGd5N8wexFcPTT+STQQyHKM
 n6xF3c3HuVx5sfIOwLieGa6wYpxO61nSdF4YwXORnrpfQkolYL9KhP9lW6g9HPw9
 iq+xKscXrEWiaW70R5mZfe0AQ5yjIf5LAe8Q+b1e+yg4sWfeUnJZnNBADn4/AwPe
 7F+Zyw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbgpc05ad-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 20:39:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-9390ca1a9abso196235585a.2
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 13:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787949597; x=1788554397; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=xEdPCCLzIVRspO+yj25546pzzNDI8awn4evP4Q7pQ/I=;
 b=cLhrVcpx2KLlIYV6mckyjRc/1XbDHGn2uAXMOXggvM5EsaTZkSAWl/KBkVfew00Bk8
 2IYP+m4oR0tZAhnYzA+V7x8xIffHG+cOL5xhc4096/di62c6hg8wryB9LPREPk6HNTI4
 d7tb8v4VsJcm2u0XK2ur8gm+wPMJdSXwplphjc9xTkpSfX9af+rYn4jJfNjkiIl6+wey
 MHN6snGbKTdRvnxlusNC9z5gNx3Et0tXVqy0C68LFGFmKIkoJCOYhNqbnO9lsyMt68/Z
 KqV+6xHnzzcsPLU9hAFXZSB5PPqJ/OQaC82JTt+GLn3X6YpFlUFWVcDlSAYx0LjkTAa2
 mveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787949597; x=1788554397;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xEdPCCLzIVRspO+yj25546pzzNDI8awn4evP4Q7pQ/I=;
 b=SOqX9tx2u0gcBTUtTPkaFut81PU4/C6pv5CvlbUPSqjb73vowbXB+b1WUiRgdrBTMo
 27Ha89P0mVnUwBo6sS+kp6k7eaLnutqpCQ6KSZtAE7p+rV9Mo4XgRa6WDi9T02zU4JwB
 k+hN6sNAn7qV258dICMvqB3G48FK2GuNc4ce4+/ntYpYYiA7Nl5xy6I5k1vVwLPahNIB
 hJR8CP3ugDMYDv7kPUHzQQy6cQKKX/V9JmNArjUYQzTX+WndjXjTrSta8EgtL7Qtj8Q2
 pDlsL410h6wGLr96/HRsqzdjjjJzVcQPJYtOzY6aMISektFii5dxUEuIBCLNtEnIymVX
 PyHA==
X-Gm-Message-State: AFuF++lacqbNbtkggCGsB2ZLn3W/K5NOh3//oouE/NJJoF/34kAki6RN
 8TnevdaxyCp6liMZtm6ZuT41F6LgAhM/hp7u7STWhihbUUUlSR65cErkWtYfetv4kM1J5zcdZtr
 r9x+ma/ct1I+fJfOfl5+z/idSFP0mkjzkNu8xAQILd5gO6WmilnoBBNHFog==
X-Gm-Gg: AR+sD12Jy+NwCXbdI6OblSL4PoLLIs2VQtN7sLve1IUs8ybSIVKHKkxpBYZrO9Nqn77
 hKijv2NDtbO86M1MwCP57NMAMoxg+ph85TvCU0Dh59V2sTOToIIwVkfKQ17ccqTFsMcb8+Z1/NU
 0C5d9V2METFXnWRwj9RfSHwTm+33qxPIklvH3VG9uUn9HDsukj1fA/3XKoaM9BRIygUdAD6ITqs
 MBRCOnuMKWVYx74ThYOQRcRUwrazXbRUKQSuFT8l/Cy7PX/xUIgH0KZWaKe40jvjV7CJebYdskF
 hb9aAyhfO4FP9yUCT/sCOPq2H3CCuVOL2v7Ea7sfoXgl24JmTB5ermehaZf1XzuJVxb6CMXPUuP
 DdlnO5pWUAf6tGAc3XOpXyremXdkSEkbhRI3BFw==
X-Received: by 2002:a05:620a:a0c9:10b0:939:595:e132 with SMTP id
 af79cd13be357-939137b133amr904238385a.5.1787949596718; 
 Fri, 28 Aug 2026 13:39:56 -0700 (PDT)
X-Received: by 2002:a05:620a:a0c9:10b0:939:595:e132 with SMTP id
 af79cd13be357-939137b133amr904235585a.5.1787949596281; 
 Fri, 28 Aug 2026 13:39:56 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-939173f2758sm218063985a.37.2026.08.28.13.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2026 13:39:55 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v5 11/15] hw/riscv/fdt-common,
 virt.c: add riscv_create_fdt_rtc()
Date: Fri, 28 Aug 2026 17:39:13 -0300
Message-ID: <20260828203918.350131-12-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828203918.350131-1-daniel.barboza@oss.qualcomm.com>
References: <20260828203918.350131-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YEN9UlkNXk47QKStQmwYC0K87koNO6Lt
X-Proofpoint-GUID: YEN9UlkNXk47QKStQmwYC0K87koNO6Lt
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE3OSBTYWx0ZWRfX/Xi1OEKxkfFN
 HtXTgRdG87DWkJzMEuFzZ78XD6Z5mf+2YJ3jm2r2e+OTIAdOgbeZcwIU7kv+k5whm+dizxWRLpl
 qAPp6UZCkeFGBCOEzqj+qXD7244aOWU=
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a91f21d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=RnOvKumpmH0hROQiWQcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE3OSBTYWx0ZWRfXzN8NWznJaIR9
 yusS3QzRNpXjuhExSaC2F4fBpyE4SpvEXLoqRKgCeTcUZUcY619SkGMZ/HkRN/lZa6PablTLZw0
 HJrLRVbSFB1KjILh8GJ1N8bGjiuzlJibufKx3UlN9ErX1GSvy9BHE/tZNmLIZgBmhsgAZJAzyUA
 2KCL6DNiDkk+HQLRDo8gplcbpCY+8YXPopowWG97zc4a55Owbu4WC2M9IoEyuPhjjKrmQ28DqgW
 GmsS/qrT0TL2ITR0gqHu8iT/8836mit+tr2JxzPhS3TPmmI4kRl5t/K86b10QyYNSxrBH4vklus
 B62gFgj7rIGKexFKRJGJ9YtbOGW4q0mtf5wb+VcITNi+p3ilnmG1d8v6zTluYVs+hYfLUbwhlDa
 5oSDzwHpBZJbRFhX0LUL/blkkLIWhRzHSG7BzeErXTFf6LgBgaxzq9MvNFTYUOR3NBv0ZopUv1P
 cVJnWjAzNQwdkup7CVA==
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

The soon to be added 'riscv-server-ref' board will add a rtc FDT subnode
that is similar to what the 'virt' board users.  Put it into a helper to
avoid copy/pasting code.

No FDT changes intended.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/riscv/fdt-common.c         | 21 +++++++++++++++++++++
 hw/riscv/virt.c               | 26 ++------------------------
 include/hw/riscv/fdt-common.h |  3 +++
 3 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
index 0107aadaad..ce2dcb43b4 100644
--- a/hw/riscv/fdt-common.c
+++ b/hw/riscv/fdt-common.c
@@ -828,3 +828,24 @@ void riscv_create_fdt_uart(void *fdt, const MemMapEntry *uart_mem,
         qemu_fdt_setprop_cells(fdt, name, "interrupts", uart_irq, 0x4);
     }
 }
+
+void riscv_create_fdt_rtc(void *fdt, const MemMapEntry *rtc_mem,
+                          int rtc_irq, int aia_type,
+                          uint32_t irq_phandle)
+{
+    g_autofree char *name = NULL;
+
+    name = g_strdup_printf("/soc/rtc@%"HWADDR_PRIx,
+                           rtc_mem->base);
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop_string(fdt, name, "compatible", "google,goldfish-rtc");
+    qemu_fdt_setprop_sized_cells(fdt, name, "reg",
+                                 2, rtc_mem->base,
+                                 2, rtc_mem->size);
+    qemu_fdt_setprop_cell(fdt, name, "interrupt-parent", irq_phandle);
+    if (aia_type == AIA_TYPE_NONE) {
+        qemu_fdt_setprop_cell(fdt, name, "interrupts", rtc_irq);
+    } else {
+        qemu_fdt_setprop_cells(fdt, name, "interrupts", rtc_irq, 0x4);
+    }
+}
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 3e40513dc1..ccea5784f0 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -436,29 +436,6 @@ static void create_fdt_uarts(RISCVVirtState *s, uint32_t irq_mmio_phandle)
     qemu_fdt_setprop_string(ms->fdt, "/aliases", "serial0", name);
 }
 
-static void create_fdt_rtc(RISCVVirtState *s,
-                           uint32_t irq_mmio_phandle)
-{
-    g_autofree char *name = NULL;
-    MachineState *ms = MACHINE(s);
-
-    name = g_strdup_printf("/soc/rtc@%"HWADDR_PRIx,
-                           s->memmap[VIRT_RTC].base);
-    qemu_fdt_add_subnode(ms->fdt, name);
-    qemu_fdt_setprop_string(ms->fdt, name, "compatible",
-        "google,goldfish-rtc");
-    qemu_fdt_setprop_sized_cells(ms->fdt, name, "reg",
-                                 2, s->memmap[VIRT_RTC].base,
-                                 2, s->memmap[VIRT_RTC].size);
-    qemu_fdt_setprop_cell(ms->fdt, name, "interrupt-parent",
-        irq_mmio_phandle);
-    if (s->aia_type == VIRT_AIA_TYPE_NONE) {
-        qemu_fdt_setprop_cell(ms->fdt, name, "interrupts", RTC_IRQ);
-    } else {
-        qemu_fdt_setprop_cells(ms->fdt, name, "interrupts", RTC_IRQ, 0x4);
-    }
-}
-
 static void create_fdt_fw_cfg(RISCVVirtState *s)
 {
     MachineState *ms = MACHINE(s);
@@ -566,7 +543,8 @@ static void finalize_fdt(RISCVVirtState *s)
 
     create_fdt_uarts(s, irq_mmio_phandle);
 
-    create_fdt_rtc(s, irq_mmio_phandle);
+    riscv_create_fdt_rtc(MACHINE(s)->fdt, &s->memmap[VIRT_RTC], RTC_IRQ,
+                         s->aia_type, irq_mmio_phandle);
 }
 
 static void create_fdt(RISCVVirtState *s)
diff --git a/include/hw/riscv/fdt-common.h b/include/hw/riscv/fdt-common.h
index c8b25348bd..eb9db8278d 100644
--- a/include/hw/riscv/fdt-common.h
+++ b/include/hw/riscv/fdt-common.h
@@ -133,4 +133,7 @@ char *riscv_fdt_get_uart_nodename(hwaddr addr);
 void riscv_create_fdt_uart(void *fdt, const MemMapEntry *uart_mem,
                            int uart_irq, int aia_type,
                            uint32_t irq_phandle);
+void riscv_create_fdt_rtc(void *fdt, const MemMapEntry *rtc_mem,
+                          int rtc_irq, int aia_type,
+                          uint32_t irq_phandle);
 #endif
-- 
2.43.0


