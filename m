Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0505606A319
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 23:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oHd7rfjf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BooGWYqm
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJfVt-0007XX-SF; Wed, 21 Oct 2026 19:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJfVr-0007WW-U7
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 19:14:27 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJfVp-0004yc-Sq
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 19:14:27 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69LKeKNu2160548
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 23:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=aZTPn3dLfVQ
 QbusORahx+nzRUWSRdq1k8r7nhB7U/pA=; b=oHd7rfjfnZoTy3fF8Ldj/7P+hvW
 Qp5YLxd1cMpgdjncoURIe4pbu6MrsJ4pvgxvSYBZrmMQktIC9mZD4VrJRfyK/Iv8
 6vKh5zWn8eFcK0Yy/GE8FVjVYr+W3rGCORnri0nU2pKif3w0rvSsVesk774eerar
 Ow/vV2sL+4pR05DSQa04dmb3Uzr+dOOqxN4rkzT83HEPyPBXiZFM00gtm8maBM4m
 ClvWfhkruvc66mfbvWQqZrn12CA0Wp5nll4kKdAGm21RhMrfx7D1irpfEpXZDO/X
 ESxtY9TM8ljKBtNUWZM3hLbDJDTp2eXAq3fFZiHUjWg62PtzA4jxLPjyptg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf1u3h349-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 23:14:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-53661e036a2so24618761cf.1
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 16:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792624454; x=1793229254; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=aZTPn3dLfVQQbusORahx+nzRUWSRdq1k8r7nhB7U/pA=;
 b=BooGWYqmUeZn3Vls7ws3zTk7wNSdtFbn2h1UOHITf26GljpDTo23epqkJStg+5NozD
 pgLnzYpZZHOT1qflOoJwGOSQVVGtFWJ1huvI4nNJzFMV5IxUmt/bkvclAtNjDSLNF4oe
 oiAqa+Q5+WF5BfeZSnV3w1YMK9ollRmSNzD9Hk5HPTDIVa5GdhfAkojvtZwG3WiaXKfK
 DZ6w7l64dtChQsDAsBTi1oyoYf3Y1egUBEmyy+0CfPyF5mu6P8U3m7lo00UMe/FB68J5
 OGJYdUAsLbCKdXF1xQu33fggKXI3mPSCIP5y/qZrfEKwoRqSU4GOAAz/SFkqBk+1shRG
 1Aeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792624454; x=1793229254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=aZTPn3dLfVQQbusORahx+nzRUWSRdq1k8r7nhB7U/pA=;
 b=sJZHvuw351z9rTp7d6EY1XlMbiVgFdIgxwBxbQ049iUkug3pb8lZIzMXQd+YMd8HKQ
 Dl3dOPqAsR72oCh3TwOts3YRF+aKDylGmpY+qVVjCyPH+6xCv8NviZN/+hONrBYB+PLq
 pRJ+QDj1TJLiQA2IOgEa0QXkd0lD538ch6K8kwBWhX/Hfuvw9xGQMWhFPtw3uhxCtq7e
 KxIOPPCAKru7CaFB5rjZByqufAuoAAI3aQ0o1qy+F4/Gh1HUCgzhYrMvv79cuRZqNpFX
 RzYz/LJEpOWPrdkdT1d1+47X3ipNYjGbaZXnyrtiy9VTVsizg/3vG/4oXho8ZfYOdVDq
 xZjw==
X-Gm-Message-State: AFq9FYKVXrmamk/1uEXwf1aQP3MF8Puelrnxsixd6HsTO3XIeHpYltrk
 CEqbbJajepB+TGZji1AOb4zl0UmVKiMbRXv8S61QoQreFH6a/vjxdn7CCAZffoZjAVMOiiHlFxs
 iyjCMOS0vxfbGhRVsogDBxBS5pAJZoIO+KuoV75ezBtWiaf8RO5Mp7/2C7ePT16Dylw==
X-Gm-Gg: AYBFou2ZNw6MNnwzLydn1AECkkkeNAm3/Ek1jnXLlfMQ5pxK2EHQrnWxs+ixCRrn9u1
 NDJnes+Z+ig/lTWqnUkDg+MebSCBEUFMReZi/C04grlkdkcGs+JgGgoh3uzhVvRrQmziRUzW0gw
 E+rRZvRke65umEW7M/LIUxJP2ixLQ9UsU/7X+KQspSW857o3ORdhF0rhDxgGdcAm8GfAuxaAxUI
 4bum65OWXdzfw1yqzN6c3yJxyFJ9iHPGkx7lQsx7QhvpVp66YXp1avi9ACRBLonq80d/UkEMter
 rvbHVwx0fI1LYRrfWuh+QOGAXFMvL+NaCDKGdnNv+IaM8d7yD5A3HXlcbVFveriDaX8xIe3sWO/
 iUVN5HcClitH9bVi9JEoHNkGwrcUhzh9lfErNOOwAUwC46uw5iau1+0kaGiUargVZ3p3e7JZcoQ
 ==
X-Received: by 2002:ac8:5f0b:0:b0:536:66ec:1b06 with SMTP id
 d75a77b69052e-5369b89c2e8mr55336681cf.50.1792624453843; 
 Wed, 21 Oct 2026 16:14:13 -0700 (PDT)
X-Received: by 2002:ac8:5f0b:0:b0:536:66ec:1b06 with SMTP id
 d75a77b69052e-5369b89c2e8mr55336341cf.50.1792624453373; 
 Wed, 21 Oct 2026 16:14:13 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com
 (200-204-190-237.dsl.telesp.net.br. [200.204.190.237])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-536ab6cd0dcsm11995651cf.6.2026.10.21.16.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 16:14:12 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 antikostya2@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v4 05/18] hw/riscv/virt.c add trace encoder and ramsink fdt
 nodes
Date: Wed, 21 Oct 2026 20:13:32 -0300
Message-ID: <20261021231346.2452179-6-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021231346.2452179-1-daniel.barboza@oss.qualcomm.com>
References: <20261021231346.2452179-1-daniel.barboza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=S8ZMU4sP c=1 sm=1 tr=0 ts=6ad94746 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=QmVDPCq3bE4LYXGvZ20s0w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=mr6zqDPyyxlTI8rpP2AA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: TRy05kG6CSWsZn1JK3gX4S787hCPtR5T
X-Proofpoint-GUID: TRy05kG6CSWsZn1JK3gX4S787hCPtR5T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA5MiBTYWx0ZWRfX0cneVDMPLQ8M
 Q1e+DeQpRzdBUzwvNd5GOAMo3y9Hj3J8il0Xgqj/5Ux8wy/nRUiyICVynLKxb2aj20ZpxbhzgNo
 IDH1LVIwj2baYVF+cG8H4KxEcpj45ihe+jAYwP5wWdxtrLTDCMGUA93ZA/EmR7CVZcriF3B4Vo4
 RptXzNH4NZoncb/UT681GvafyLQiTfMW020eLXBCoEceqCU/PQUjZTDuBgPERmlBDVc8O15Lp+/
 6RjdhEiOTcUhuV7DTo82edd0ie0hagoObH0CvzHEKE428dFJD+f1kp8yl39VyEHVcgyB+1LDuVL
 EET1IHr+JF5A9Riv1awS+S38l9+IfWxT+a4AipC2nyubh4jOR8K2wpnu5cliwGftcXY2fuH1auN
 ljdO5Z+/tee7R+NdIUMdfNbK5sACacM4zCtjzryciMcXTi0+/SvEJiN0jKhhazIMehmV4EYKI0n
 jM616ByGENBF8AeCkCQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA5MiBTYWx0ZWRfX9Mtq+QN2uHJL
 b6xoYO9A9Dnq6OGeaVG2iynub/Is+cKfgDy8V2ZiBEdVvbM8MsSC2D8hFD8XKfBPyxrnxWzw26K
 UPzwAWV4/xyE3c7LIPbhATbHTiO0ruU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210092
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

The trace encoder and trace ramsink nodes should confirm to the bindings
described in "riscv,trace-component.yaml" in the Linux kernel. That way,
encoder and ramsink devices get populated on the rvtrace bus and perf
record is able to capture the trace data in the auxtrace section as
expected.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/fdt-common.c         | 70 +++++++++++++++++++++++++++++++++++
 hw/riscv/virt.c               | 47 +++++++++++++++++++++++
 include/hw/riscv/fdt-common.h |  4 ++
 3 files changed, 121 insertions(+)

diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
index ce2dcb43b4..6130b1bcc1 100644
--- a/hw/riscv/fdt-common.c
+++ b/hw/riscv/fdt-common.c
@@ -105,6 +105,12 @@ void riscv_fdt_create_cpu_socket_subnode(void *fdt,
     qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
 }
 
+/* Caller must free string after use */
+static char* fdt_get_cpu_nodename(int cpu_id)
+{
+    return g_strdup_printf("/cpus/cpu@%d", cpu_id);
+}
+
 static void
 create_fdt_socket_cpu_internal(void *fdt, char *clust_name, RISCVCPU *cpu_ptr,
                                int cpu, int socket_id, int socket_hartid_base,
@@ -849,3 +855,67 @@ void riscv_create_fdt_rtc(void *fdt, const MemMapEntry *rtc_mem,
         qemu_fdt_setprop_cells(fdt, name, "interrupts", rtc_irq, 0x4);
     }
 }
+
+/* Returns the 'out-ports/port/endpoint' nodepath.  Caller
+   must free the string after use.  */
+char *riscv_create_fdt_trace_encoder(void *fdt, hwaddr addr, hwaddr size,
+                                     int cpu_id)
+{
+    static const char * const tr_compat[2] = { "qemu,trace-component",
+                                               "riscv,trace-component" };
+    g_autofree char *cpu_nodename = fdt_get_cpu_nodename(cpu_id);
+    g_autofree char *trencoder_name = NULL;
+    char *endpoint = NULL;
+
+    trencoder_name = g_strdup_printf("/soc/encoder@%"HWADDR_PRIx, addr);
+    qemu_fdt_add_subnode(fdt, trencoder_name);
+
+    qemu_fdt_setprop_sized_cells(fdt, trencoder_name, "reg",
+                                 2, addr,
+                                 2, size);
+
+    qemu_fdt_setprop_string_array(fdt, trencoder_name, "compatible",
+                                  (char **)&tr_compat,
+                                  ARRAY_SIZE(tr_compat));
+
+    qemu_fdt_setprop_phandle(fdt, trencoder_name, "cpus", cpu_nodename);
+
+    endpoint = g_strdup_printf("%s/out-ports/port/endpoint", trencoder_name);
+    qemu_fdt_add_path(fdt, endpoint);
+    qemu_fdt_setprop_cell(fdt, endpoint, "phandle",
+                          qemu_fdt_alloc_phandle(fdt));
+
+    return endpoint;
+}
+
+/* Returns the 'in-ports/port/endpoint' nodepath.  Caller
+   must free the string after use.  */
+char *riscv_create_fdt_trace_ramsink(void *fdt, hwaddr addr, hwaddr size,
+                                     int cpu_id)
+{
+    static const char * const tr_compat[2] = { "qemu,trace-component",
+                                               "riscv,trace-component" };
+    g_autofree char *cpu_nodename = fdt_get_cpu_nodename(cpu_id);
+    g_autofree char *ramsink_name = NULL;
+    char *endpoint = NULL;
+
+    ramsink_name = g_strdup_printf("/soc/ramsink@%"HWADDR_PRIx, addr);
+    qemu_fdt_add_subnode(fdt, ramsink_name);
+
+    qemu_fdt_setprop_sized_cells(fdt, ramsink_name, "reg",
+                                 2, addr,
+                                 2, size);
+
+    qemu_fdt_setprop_string_array(fdt, ramsink_name, "compatible",
+                                  (char **)&tr_compat,
+                                  ARRAY_SIZE(tr_compat));
+
+    qemu_fdt_setprop_phandle(fdt, ramsink_name, "cpus", cpu_nodename);
+
+    endpoint = g_strdup_printf("%s/in-ports/port/endpoint", ramsink_name);
+    qemu_fdt_add_path(fdt, endpoint);
+    qemu_fdt_setprop_cell(fdt, endpoint, "phandle",
+                          qemu_fdt_alloc_phandle(fdt));
+
+    return endpoint;
+}
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index d47b295f0c..6bc8d384ec 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -479,6 +479,51 @@ static void create_fdt_iommu(RISCVVirtState *s, uint16_t bdf)
     s->pci_iommu_bdf = bdf;
 }
 
+static void create_fdt_rvtrace(RISCVVirtState *s)
+{
+    MachineState *ms = MACHINE(s);
+    int socket_count = riscv_socket_count(ms);
+    hwaddr encoder_addr, ramsink_addr, size = 0x100;
+    RISCVCPU *cpu_ptr;
+    int cpu_id;
+
+    for (int i = 0; i < socket_count; i++) {
+        for (int cpu = 0; cpu < s->soc[i].num_harts; cpu++) {
+            g_autofree char *in_endpoint = NULL;
+            g_autofree char *out_endpoint = NULL;
+
+            cpu_ptr = &s->soc[i].harts[cpu];
+            if (!cpu_ptr->trencoder) {
+                continue;
+            }
+
+            encoder_addr = object_property_get_uint(cpu_ptr->trencoder,
+                                                    "baseaddr",
+                                                    &error_abort);
+            ramsink_addr = object_property_get_uint(cpu_ptr->trencoder,
+                                                    "dest-baseaddr",
+                                                    &error_abort);
+            cpu_id = s->soc[i].hartid_base + cpu;
+
+            in_endpoint = riscv_create_fdt_trace_ramsink(ms->fdt,
+                                                         ramsink_addr,
+                                                         size, cpu_id);
+
+            out_endpoint = riscv_create_fdt_trace_encoder(ms->fdt,
+                                                          encoder_addr,
+                                                          size, cpu_id);
+
+            /* The remote-endpoint property is bidirectional, i.e. the
+               in-ports endpoint must point to the out-ports endpoint
+               and vice-versa.  */
+            qemu_fdt_setprop_phandle(ms->fdt, in_endpoint,
+                                     "remote-endpoint", out_endpoint);
+            qemu_fdt_setprop_phandle(ms->fdt, out_endpoint,
+                                     "remote-endpoint", in_endpoint);
+        }
+    }
+}
+
 static void finalize_fdt(RISCVVirtState *s)
 {
     uint32_t phandle = 1, irq_mmio_phandle = 1, msi_pcie_phandle = 1;
@@ -520,6 +565,8 @@ static void finalize_fdt(RISCVVirtState *s)
 
     riscv_create_fdt_rtc(MACHINE(s)->fdt, &s->memmap[VIRT_RTC], RTC_IRQ,
                          s->aia_type, irq_mmio_phandle);
+
+    create_fdt_rvtrace(s);
 }
 
 static void create_fdt(RISCVVirtState *s)
diff --git a/include/hw/riscv/fdt-common.h b/include/hw/riscv/fdt-common.h
index eb9db8278d..fd03a9e0ab 100644
--- a/include/hw/riscv/fdt-common.h
+++ b/include/hw/riscv/fdt-common.h
@@ -136,4 +136,8 @@ void riscv_create_fdt_uart(void *fdt, const MemMapEntry *uart_mem,
 void riscv_create_fdt_rtc(void *fdt, const MemMapEntry *rtc_mem,
                           int rtc_irq, int aia_type,
                           uint32_t irq_phandle);
+char *riscv_create_fdt_trace_encoder(void *fdt, hwaddr addr, hwaddr size,
+                                     int cpu_id);
+char *riscv_create_fdt_trace_ramsink(void *fdt, hwaddr addr, hwaddr size,
+                                     int cpu_id);
 #endif
-- 
2.43.0


