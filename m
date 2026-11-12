Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9D9606A31C
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 12:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EUC/teeJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f08FxPiZ
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xRTjU-0000Xh-0N; Thu, 12 Nov 2026 07:16:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xRTiu-0007zj-EM
 for qemu-riscv@nongnu.org; Thu, 12 Nov 2026 07:16:13 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xRTiq-0002Uc-Vn
 for qemu-riscv@nongnu.org; Thu, 12 Nov 2026 07:16:12 -0500
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ACAmkbc2555495
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 12:16:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=e4q7jxEweG9
 hpBMyv1buFc3LQm/Vfhh6LoFFh9SWwwM=; b=EUC/teeJuT8SzhOXnprZLhuBIMI
 OJxZp2hKBSc9Fiez+DX4saR+t9HAMUE7KD33vrhqjMINJq/18WR2h2nWhA1Pz/aA
 h6uiMOMk1Jhi9l6CBzNimaaJcZCllGvEPgO+UIRJ3e/HozzrsAaFunQZdGWQ7mk8
 9d1uO7hSa9crep9qZyb22a2h2yRHJrbZe5nkmjaUC2MrRV8cIJzYKJYDi338FPlW
 k5wymQvvuQSIc/rc/quJcLKt9FqDuXNpo1Jko7dffoGeL54SS6C/D8Nrl7xUGuwe
 tkvuiL5KFcYzkM3r29PtAy+4GrpskPKi2JAbAQ8K0hp7fy2wEEBp95g3NYw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwc1j0955-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 12:16:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-534f3fe0236so89866891cf.2
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 04:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794485767; x=1795090567; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=e4q7jxEweG9hpBMyv1buFc3LQm/Vfhh6LoFFh9SWwwM=;
 b=f08FxPiZOjNrtoBD3BXT6um9Dh5JW5ggBSCSLHXOGbDzOF67rfXEINXk2ZxSEnwGyK
 sSpmoc8rgq9Kp1+KdCOvXZs+WPMJIyoPAdwg0lhAztIjag5Eg5HaFGGQWFPU3ptRQLss
 bd9Es86zW6LsRuDt2z0lu0YUhb8ZCgeRoJw9vAawi010Q40cJSHFak+FsVwdd2QXkY6i
 OWPD/vc/H76UAym5JtT1zzhqX0PhFKB9obKcj8EwCSX4AS8H2VejzM1rgzlbpydejIJy
 fsbbUtqZ1UhSk3wwdQC4WCiH3C67H5XnvjsrkkFfIg4J7FCP8mG+/E058q4x+50dFhTQ
 eSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794485767; x=1795090567;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=e4q7jxEweG9hpBMyv1buFc3LQm/Vfhh6LoFFh9SWwwM=;
 b=0XnmLYt/lS2gnQ8TTcRUZIb2227uHsPXPFGNSajaaO3RSWYB1fdn95jNhInBPTDlPx
 v8xcYevwwbJ2JCFya0ZbHVsr1oC+HTX67jyUcIxqotdtpu7wH9mW/j9N7+KYtfEzpgnZ
 s98jWg2aqEdPFu8U2ofQP4ZZWLnXIxPfRSmd0JwJe2R23qyANVbB41LRFJWuyPAAzfRN
 Y75f7woBUqL8vZxugcZMnqLVxwY6trZBK8F3d0yqNYK5kBcUU8SS2rfhDh9Ku7/8/gAu
 0K54Y6tJAdgIPyphYmHhI9mvlnenTsCnTWfAZrFu7oYiC74w0m0tn5EQLnUmr85ZXqXh
 Xv6Q==
X-Gm-Message-State: APuU4Z9tpkeUdlbcEiD6Dsi/O/aWyMeKB6OR2R6yDO8ZSokwk0ZVqbRJ
 sxBS5n2Kcw+g3K6C3/FCZVz0RHgQlbq2+eWyGoqk1HF0x1+nFug7yKXqUVvLnCGM4yvVcWcSR18
 A/y8Qd9RpXLOID0ZsNFQR/8FeZknO3i+5umRn10ZnnWcT5DahITEbWH35XlVFoOb4aQ==
X-Gm-Gg: AYBFou3n8FbQrNoR7HD+9skGCEzoksrgDGFDfI2LQNLV7ef3WLZICRMnG6Vaeld/CD6
 hSbMjiRLcYrB3Fb3pd23BQ7a/G3nQXATR6wCfcOSg9bR44x98ghd5rmKoslTejovSuSX8J64VJf
 7tUYKQyV4pWFYDnkpr2P8Vvid2yWGGGdzsSyOSz7d6EW96mXfGNT88qHKD3Rqb0eQHIwdzHvFUo
 aMvnqHFiwLJbWd3vrnHKr8hBhNj9qm/O20m4b2lRLMzHYJUd07R951mvzhms0ZM0wb/CXwgaZVc
 UcZtKI7rS2yRZyUjlr6ff5iXv9kf5te0If8lw77GcHtGVPuaBDTjdmDqFKZYEYHQWwNedIfEDjN
 puPXdwe3FZNmkLH5UgIhzw0LgC/nYGWuKtzlY/HPCyPhCGnM/rtWrYNnxObJ0CJ+YAlHvVJ+9c2
 Yzkf+IkcHU1dWWEAXTxpZm/wiRLdEoqCjxP4hINuTaW+1n
X-Received: by 2002:a05:622a:1651:b0:537:dea7:adb1 with SMTP id
 d75a77b69052e-556bdce0a89mr85837971cf.4.1794485766846; 
 Thu, 12 Nov 2026 04:16:06 -0800 (PST)
X-Received: by 2002:a05:622a:1651:b0:537:dea7:adb1 with SMTP id
 d75a77b69052e-556bdce0a89mr85837581cf.4.1794485766340; 
 Thu, 12 Nov 2026 04:16:06 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com (189-68-253-226.dsl.telesp.net.br.
 [189.68.253.226]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5550af6096asm73538651cf.5.2026.11.12.04.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 04:16:04 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v2 2/5] hw/riscv: make UART FDT helper consider baud rate
Date: Thu, 12 Nov 2026 09:15:50 -0300
Message-ID: <20261112121553.485439-3-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112121553.485439-1-daniel.barboza@oss.qualcomm.com>
References: <20261112121553.485439-1-daniel.barboza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0OCBTYWx0ZWRfX9/J19zoml1Oe
 rA8embih4V+mTmIxqNRSQg2jcvV8yC8Nf5E9J/HUB1xJwEStnDOZ5CL1V9YUw75B6giiZn2z3D0
 lAit+efN1+6fRL832QIx5JFVa6/ITWk=
X-Proofpoint-ORIG-GUID: bncoPB-ILmUrgmG4GqLnlqnhtttWE8Se
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0OCBTYWx0ZWRfX7OuOxXA013sX
 AU8yF2BmW+hRnhr8TPNBhIrAwVL0RJqUmF/g3hwgbznre9WjQu6y5GtgSHL1loaGIi2jummlASX
 xGaUBw1jA8cVFJky/fK5dHNAE4oH6/5FskpZ9AFk3Ps9GtSjUMa/v1nJBf5JkV+v/fktmt47dp4
 4rJRRB3Mg8ZkSzBILDGMzuqHt8d4OXuLyK5la8EzVEeLw0mO/LiybSt+rILVvOvSUv8T9WsoPOL
 p3P3BGRpDV8oExx1gkiRaJLR+UNv1AeyOT2C4mem8UcC1wtgEtAHfTHBAxAOFOD0W3KnfigtRr5
 olWTgFGcreWIYzjUnpAv5iwgyI+o02hVNIPn9L6JwKPiN/ouW2femfH8t2ujaDUU7NIGuJqWB/e
 jZw1ZCNdZxacdF3ShgnWYLvdnuBFObPPTGzE9ZwMWfLR9UoEF6Xlz5dZv5juTwWMXWmrFj13PM4
 w1cx+W82F0UhabB9tGw==
X-Proofpoint-GUID: bncoPB-ILmUrgmG4GqLnlqnhtttWE8Se
X-Authority-Analysis: v=2.4 cv=Vqe2kO2n c=1 sm=1 tr=0 ts=6af5ae07 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xcxBfRYLw5hNHjR815/AfA==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=JF9118EUAAAA:8 a=uxJGSlK6fkZaI5NcCCYA:9 a=uxP6HrT_eTzRwkO_Te1X:22
 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120048
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

riscv_create_fdt_uart() is defaulting to a 3.6864 Mhz clock, which Linux
will interpret as a 230400 base baud serial.

We need more flexibility to set a different baud rate for UART devices.
Add an optional 'base_baud' parameter that allows callers to set a baud
rate for the related device.  We're keeping the existing default in case
the caller does not care to provide a base baud.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>`
---
 hw/riscv/fdt-common.c          | 19 +++++++++++++++++--
 hw/riscv/server_platform_ref.c |  1 +
 hw/riscv/virt.c                |  4 ++--
 include/hw/riscv/fdt-common.h  |  1 +
 4 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
index ce2dcb43b4..abb913faec 100644
--- a/hw/riscv/fdt-common.c
+++ b/hw/riscv/fdt-common.c
@@ -22,7 +22,11 @@
 #include "hw/pci/pcie_host.h"
 #include "hw/riscv/aia.h"
 
-#define UART_STD_CLOCK_FREQ 3686400 /* 3.6864 MHz */
+ /*
+  * This 3.6864 MHz default clock results in a base
+  * baud of 230400 symbols/second.
+  */
+#define UART_STD_CLOCK_FREQ 3686400
 
 void *riscv_create_board_device_tree(const char *model, const char *compatible,
                                      int *fdt_size)
@@ -807,11 +811,14 @@ char *riscv_fdt_get_uart_nodename(hwaddr addr)
     return g_strdup_printf("/soc/serial@%"HWADDR_PRIx, addr);
 }
 
+/* If base_baud = 0 this function assumes a base baud of 230400.  */
 void riscv_create_fdt_uart(void *fdt, const MemMapEntry *uart_mem,
                            int uart_irq, int aia_type,
+                           int base_baud,
                            uint32_t irq_phandle)
 {
     g_autofree char *name = riscv_fdt_get_uart_nodename(uart_mem->base);
+    uint64_t clock_freq = UART_STD_CLOCK_FREQ;
 
     qemu_fdt_add_subnode(fdt, name);
     qemu_fdt_setprop_string(fdt, name, "compatible", "ns16550a");
@@ -819,7 +826,15 @@ void riscv_create_fdt_uart(void *fdt, const MemMapEntry *uart_mem,
                                  2, uart_mem->base,
                                  2, uart_mem->size);
 
-    qemu_fdt_setprop_cell(fdt, name, "clock-frequency", UART_STD_CLOCK_FREQ);
+    if (base_baud != 0) {
+        /*
+         * The base baud formula is base_baud = clock_freq / 16,
+         * ergo clock_freq = base_baud * 16.
+         */
+        clock_freq = base_baud * 16;
+    }
+
+    qemu_fdt_setprop_cell(fdt, name, "clock-frequency", clock_freq);
     qemu_fdt_setprop_cell(fdt, name, "interrupt-parent", irq_phandle);
 
     if (aia_type == AIA_TYPE_NONE) {
diff --git a/hw/riscv/server_platform_ref.c b/hw/riscv/server_platform_ref.c
index f8016e14b0..d727ea6c41 100644
--- a/hw/riscv/server_platform_ref.c
+++ b/hw/riscv/server_platform_ref.c
@@ -315,6 +315,7 @@ static void finalize_fdt(RISCVServerRefMachineState *s)
 
     riscv_create_fdt_uart(ms->fdt, &rvserver_ref_memmap[RVSERVER_UART0],
                           RVSERVER_UART0_IRQ, AIA_TYPE_APLIC_IMSIC,
+                          0,
                           irq_mmio_phandle);
     name = riscv_fdt_get_uart_nodename(rvserver_ref_memmap[RVSERVER_UART0].base);
     qemu_fdt_setprop_string(ms->fdt, "/chosen", "stdout-path", name);
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 88de49aa6e..dd1b02a7b3 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -391,11 +391,11 @@ static void create_fdt_uarts(RISCVVirtState *s, uint32_t irq_mmio_phandle)
 
     if (s->uart1_present) {
         riscv_create_fdt_uart(ms->fdt, &s->memmap[VIRT_UART1],
-                              UART1_IRQ, s->aia_type, irq_mmio_phandle);
+                              UART1_IRQ, 0, s->aia_type, irq_mmio_phandle);
     }
 
     riscv_create_fdt_uart(ms->fdt, &s->memmap[VIRT_UART0], UART0_IRQ,
-                          s->aia_type, irq_mmio_phandle);
+                          s->aia_type, 0, irq_mmio_phandle);
 
     name = riscv_fdt_get_uart_nodename(s->memmap[VIRT_UART0].base);
     qemu_fdt_setprop_string(ms->fdt, "/chosen", "stdout-path", name);
diff --git a/include/hw/riscv/fdt-common.h b/include/hw/riscv/fdt-common.h
index eb9db8278d..ee664983f4 100644
--- a/include/hw/riscv/fdt-common.h
+++ b/include/hw/riscv/fdt-common.h
@@ -132,6 +132,7 @@ void riscv_create_fdt_socket_aclint(void *fdt, ACLINTFdtProps *props,
 char *riscv_fdt_get_uart_nodename(hwaddr addr);
 void riscv_create_fdt_uart(void *fdt, const MemMapEntry *uart_mem,
                            int uart_irq, int aia_type,
+                           int base_baud,
                            uint32_t irq_phandle);
 void riscv_create_fdt_rtc(void *fdt, const MemMapEntry *rtc_mem,
                           int rtc_irq, int aia_type,
-- 
2.43.0


