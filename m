Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC32606A336
	for <qemu-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 16:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=laOeNrkg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WozmlTfv
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xKHr6-0001MK-PQ; Fri, 23 Oct 2026 12:10:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xKHq7-0000dx-PE
 for qemu-riscv@nongnu.org; Fri, 23 Oct 2026 12:10:01 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xKHq4-0001UP-Ou
 for qemu-riscv@nongnu.org; Fri, 23 Oct 2026 12:09:55 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69NE5vbL4072850
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 16:09:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=BzDWG84REuv
 H8wtFMpjxQ65QwD3R7Ke2GH79Im1dAFw=; b=laOeNrkgOZH/crIzfgdhobASh3D
 s2axKPEpb4xl6U7fKyfJWogmqvoJ7B439FYmNJqwkjLOsuMY5UtNAyxk6SOaqUgT
 FrlnhlAVgCSBfiUbcApmTi3PTDqBcUUsYkSqWXwMoSGruvAm/0dhk6i7KD3QZzbr
 vh4AZeIrLDN2c4ynK9dC9YqiXXJsj+9P8htunUIsK31k+L+jVCgh+Lm/QxVANkZN
 u0A82p+0PFSNkbyc8HzQY4xARAaoTQHsT74tseBnz+GLtUctAQI95uk40pRuL4bQ
 bYswDxilSuOXVTR7ZxNBDI1IbXBFdDMdBddySpOrHtNdxQi3XmAyX22x82w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7bw0w1u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 16:09:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93f5844e383so189694385a.1
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 09:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792771769; x=1793376569; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BzDWG84REuvH8wtFMpjxQ65QwD3R7Ke2GH79Im1dAFw=;
 b=WozmlTfvcyWEsKT7HfHhBoZxmQituXKeLKRpHvNcd+pfkRAQNnWRdJWn0ERqJg6MIy
 Z7AWfB9qSd0j734F7eJd2cvmkFpZUvoKNtYsOVc+NxkrulxajGjAbGIVAX28wF+aT8Zr
 fUK00D/+S1kWklca6rqvcGvHTzmRUVnYjglKB9BObL4OOUg3iIm49HQkQoYbqYe6OXcA
 5ovaIFlF3iu719M6zshHM77RH1GXHi6S5liTIbpZwfC8zXB0BxWZnrI4a6kbGWQ3OQON
 VqaEmTxrP3p1x3Op9oy9eG0FK/HzPTv3M/8vH2/tb8S0V0kT9QkTWKqj6r7B1n5U3xKF
 dPGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792771769; x=1793376569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=BzDWG84REuvH8wtFMpjxQ65QwD3R7Ke2GH79Im1dAFw=;
 b=a3FSktmg6z8tMWT/cMFP75kCOCNn7rrgMtPoG8HWCyPbpLyVCuWUw2F9OyKFqko17j
 tUVadJmqQ0Wgn+xQo044GewyDuMj3jTHR/z3jQraXfww5OyuETzm1DauCFgVd2LnddlT
 GbygHnbMjvhUbGkLeFrJ1ulWSQrRHVWv08C3rWNXqbVn2NLeoXhCUtOBu9g43Nw+ta+7
 qoRRmjQ/H0y9FePbfJ5Qe/bpnTmDesbAkqHuoIgl/us2AovdfUn/TxoNq6RSJwtYc9Dl
 l7xXrsKVpvHeWcRXXh/sSSWS6wxnzQkiFL9tBol4t3lhevMdLVBCPUExFo0vDEF/L5u3
 LICA==
X-Gm-Message-State: AFq9FYJdQWIYKXcPGWJKr+eBbaNZpjtRjdjQVd4kRKyR+0Fkqpw6FAmR
 c/ElCYEmiTeBv+WIXHwLYAozg3LB08OwqVhk9DFo5a2x/5YGEI28CMFNIbEJ6jRL4bQwDG4tbc8
 8FqGN6Mk/UvNVGQmArSZLc92E3CeWBd9f/zp4e2yTDNGQ/pWqH+rIGXyBqA==
X-Gm-Gg: AYBFou2xlSeBVNky4CjvCD9mL2J2esIq4MXYbYjo4DTAIUXRSdbR+i9NPmFyUYdpBva
 wvTRYQDx7SqMThalmEZNXZ+MTQ4wbMj7Rcll6j2+aXPRSbd8bs5A9A4dBg3J4nq97n7YrIILXD6
 XhbbGA/LacpuNRB0lJ0PfUhkCJASFoe52HTPQuTcFLFHL+JCzWSfsleF7zoBStiHNLIGZGwBwG0
 JpYdsCUG+z5aYl8PXGH0rkUXCXvTg4x3iS34kCpOGGfuqRdzRCD/SVg6JR+G1SdvJUQDsCpF0Pj
 6PHlboQ2TaxF7t+mmKFmjj6qYr2iKjwiiqc6czmNxiXFQ7cVT0QxDsnpQWJXb2DzHx0h/1P0uvR
 Rc/H9OeqcERED1qfnorW4gQKvk/zV7KO+5mIs7w==
X-Received: by 2002:a05:620a:8399:b0:93e:8614:bbe7 with SMTP id
 af79cd13be357-93f6f79c4a0mr472124285a.12.1792771768742; 
 Fri, 23 Oct 2026 09:09:28 -0700 (PDT)
X-Received: by 2002:a05:620a:8399:b0:93e:8614:bbe7 with SMTP id
 af79cd13be357-93f6f79c4a0mr472117085a.12.1792771768091; 
 Fri, 23 Oct 2026 09:09:28 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([152.234.125.162])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c4524f226sm5063406d6.27.2026.10.23.09.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 09:09:27 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 3/6] hw/riscv: make UART FDT helper consider baud rate
Date: Fri, 23 Oct 2026 13:09:10 -0300
Message-ID: <20261023160913.24992-4-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023160913.24992-1-daniel.barboza@oss.qualcomm.com>
References: <20261023160913.24992-1-daniel.barboza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JHFynK5JhzaP2GiOgIbi86n-v6E0VAMI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MyBTYWx0ZWRfXxw1fnb3clFb4
 Znem6pQhttio9HncSe7O9YZRDjYLx/D0lS64gio4x7eci+6LGkJqIf9LtB6881jVUni8VuYSft1
 TWDSZvvpVPWkaO75n5g+GBnIxS1M9qs=
X-Authority-Analysis: v=2.4 cv=QdTzLcbv c=1 sm=1 tr=0 ts=6adb86b9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=AgQEunjic7gIBKSbIeB6Ag==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=uxJGSlK6fkZaI5NcCCYA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: JHFynK5JhzaP2GiOgIbi86n-v6E0VAMI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MyBTYWx0ZWRfX1T3Yj8dJpt8S
 jGknXNueqZs1PAq8qgzRkAkcPk887LqhjbMav5RK0qze5b/MekFo085xuToIs624InfX5wQ5UJ1
 JAodIXWivHaaslLGi407KQy/oe5FhnNMFCZb5VxQCqMiba2BDOKuNAT+f42zQ8Ie8/2hQ0w3f2p
 VBFu4ZnIAhAVNP7oukDvVDx5zyM35+i8gy2ZtITSFkDHiV4dYarugIpdxuj/FjaDg3tF5OPa5v1
 CILI64jxc/0nMuq/fR3Mi2niJvCBMCdqIsOhLCCBL79O2kly//eIBgmOnUg1ExE13BRVNdbDkPH
 LMywJvUOYMEksfBseM/3867vQLIVKhP9GHZUxTkG0JzQJ1sV9AaWJmOMd+DEoRewfAAK8MRUy95
 0v3DyLNUUY2QmcKBv2sxormE3Lny/IeZiScMtYoWPC9zHz0iKJgFdFLXet9s4WDNIGUu/jvVCGZ
 PQE2/UXgfuOjHQ3ePoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230063
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
index ea24720a08..3191615c02 100644
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
index 39381cb21d..c4447d971b 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -385,11 +385,11 @@ static void create_fdt_uarts(RISCVVirtState *s, uint32_t irq_mmio_phandle)
 
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


