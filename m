Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F01A606A31C
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 06:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G6KzksXx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gHQENkMs
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xR1Ro-00085A-DC; Wed, 11 Nov 2026 01:04:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1xR1Rm-00084j-8S
 for qemu-riscv@nongnu.org; Wed, 11 Nov 2026 01:04:38 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1xR1Rh-0000Xq-9l
 for qemu-riscv@nongnu.org; Wed, 11 Nov 2026 01:04:36 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AB5KHtf419508
 for <qemu-riscv@nongnu.org>; Wed, 11 Nov 2026 06:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=WIoo5ELzUL+
 vFgYLKtvV6sBmfMdz6DfJgI0tbx2TvS4=; b=G6KzksXxCEoa03OUxvG9E0/DcLU
 nNlLMn8oJ1DHf7Uuz5FmxtWkS38JeE5cdMGTi59HXdE7SzvabwzT7Mi3zickgOuF
 MFG85J8geH3GaABZ41foQm2T4MWn9Rfjz6nReD48FD6zIWz68yN+FaBH78NyS+e0
 webH4HOmwdPQyrH4KsMbxArsCeTsTGdYvCV01nvH3XkR20yKTmiAj4ffvvS8QFv7
 w8yMulcwFgp5/9WCYEfD6z3QWCEGDFAMGIVCz9PlEuBxkmBQ5/FKupIz1SnBOPo5
 LLDGUYE3UU8LCmZVnEDgWgoc/7Vdk8AinyfL3ln4R6Kb6OBx2/lYqKkVbdQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyw4ckgk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 11 Nov 2026 06:04:31 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-313c7315becso30594eec.2
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 22:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794377071; x=1794981871; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WIoo5ELzUL+vFgYLKtvV6sBmfMdz6DfJgI0tbx2TvS4=;
 b=gHQENkMsLjDrbZl7Rz2Y2UXU+/TmOmW0MK80IIgGQiJavv168MBTG70w5iPC+vogBd
 zrI05YhI4Ylb+lrpLq/DlpJ5RBkP7WeRvlXZvIZ7TSlfsP8B4IQKzZ/lDa2ZWsiwdCAm
 uNnMrDuhlUVjJwd88+JsWaORSpOSYzrIa8b8H6DlqObzpm9Fk3DeFF0mQ0xdvTzI98SW
 DiPLj95fvz90GTjJKP3E0fpJb++41I9Yi/cDwNifhMVx6oTbGJAHhAksWBMGUImO7845
 x1ifzuld6nG8egVvrvLA3DfjBDaYNW8aDub/iMdq99ZxUweHwbGp8FIiikn+6Rmq2Sxy
 gEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794377071; x=1794981871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=WIoo5ELzUL+vFgYLKtvV6sBmfMdz6DfJgI0tbx2TvS4=;
 b=Rk/EQ6tW6clMO/YFGur7tos1A7BHNRIUM1+ywyoajdf9GTHf9OenvSkQDJMd/FFnmF
 xjJwgPnsdeKP67j9x+Ocva1a3b9WkBqJaO9Jkeq2bRwLRyLbl7AHXEcFT6PRuXHmOSdG
 ro2gIuLEYpL2FD+QxaJMu6FnydYGeZQs7VfE+gE9RhjKLe5L6u3T9+WtXSuUBNN/ViCp
 pCvZsqgX1UM69Xby0pPBk+NMPr4+L8qP8fLpKvsVpFlvE6OU4YXJ+MSCyG/beKPYRTag
 JE61DPuvCVNErbrCb8qaPr1+aZLennHSjvlHCHPWbqO+mD/0uI9TyE4WQb4/vq+TL0ow
 JjFw==
X-Gm-Message-State: APuU4Z8Wpa1nSiAmp4RrUP0Vy/CvY6QK7wef5U3F1nsyP72PtJk1S03H
 N0O8s+50q/uB6GZNRI6XHckRbJao8qVgTs58jcLaDy+P9SKOI8RHLmunfMzrWfOVeA3r1EQqxa0
 vtbn0n9uHHI6ZaCC3rCqcxskiCzZhN8JJu9mredfFN03q2yPXPW1afMztXA==
X-Gm-Gg: AYBFou2N7kvz01R0xVZDwX8XQXOlk0ZUZHaM3lT373VFZ/ijDXguLV48n5EnOv7/RuD
 ybZeEScggQLJ8Ik97IVc6uw/QjkQf82Wslk2ZcM5Z3FZ7xiDo2jWwHwFxQwdFF94z9R2dPZhw4T
 Il6syUSkPB5EEWtuaIjXVPge0Jlh9AtwMQwuh7XJsk2UjywyjfUJqPJ2E/OcNDif1fPMwpDzIVK
 iKY6EUI8BUAxHmilMZ81S7OGiD6D67qdt2qVKcgs+FHIgnu0lLQYqCKAFSv24FQR7IpNftziUqJ
 z3PK3Nu+vbgCsxC/hd67G+jbRD3m992W+2gZZK/ERY+h1jj0zjBUS0lZKCkwJot+1vvbHXh25Bv
 WNyrCbU/EqYAxin9meBejwLaCOWZuLLBT56Wuf4lF7TcWvtYPRsJp+pL9fkIxzCifVpPZhDqXUA
 lkcGHDCCif1/F5d8Ic2hxzlwbPgxx9d4p3fhSq4VD0CTJ3hGNlwnY5Y1fEXTHObdhS3pU87nLBb
 NXLm3Q=
X-Received: by 2002:a05:701b:21c3:b0:183:d275:cf76 with SMTP id
 a92af1059eb24-1b3c02fe0abmr2045586c88.2.1794377070867; 
 Tue, 10 Nov 2026 22:04:30 -0800 (PST)
X-Received: by 2002:a05:701b:21c3:b0:183:d275:cf76 with SMTP id
 a92af1059eb24-1b3c02fe0abmr2045552c88.2.1794377069934; 
 Tue, 10 Nov 2026 22:04:29 -0800 (PST)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b3b5b2ff3bsm15067990c88.11.2026.11.10.22.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 22:04:29 -0800 (PST)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Subject: [PATCH v15 04/10] hw/riscv/virt: add opt-in RPMI base support
Date: Wed, 11 Nov 2026 11:33:56 +0530
Message-ID: <20261111060403.3777501-5-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111060403.3777501-1-subrahmanya.lingappa@oss.qualcomm.com>
References: <20261111060403.3777501-1-subrahmanya.lingappa@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAyMyBTYWx0ZWRfX09MhpqlrNr8l
 mUD2ROBIOVBj1QcuqsQzxKdJH/OLsMpxql4INW3Sc2MMHFP7iIMSErH6F6CRrGiFaN3RdwEL7Sm
 47D1ivnQ0owW8If9pfqNzcN7CVa98tsxTR7p/CGHxgbSIw3pXG0KJB8bTDdlfYXt5Er04MV0a2z
 FovYdgODxQ7TgfjWkcfMrAIqDFKQOTqHt+PDFR7MgoADXT4teqhRmzOOMC6XakpMANqCWgCBE1y
 W5es/56hobtViY+n4nBJGqD77GBbRVcaFYkEfye/OzAkkUAg9RLooqIekVFYVdl+byTC1b7b6Jc
 5mywrUPwhsE3AUFJu3kRYoverThEIPi6ZU5aFURvvq/MS1IDMO9Ussh7l4v3/yLW/F7IF2iu4c1
 A1fnnecUtWE//uYzVTtaNdlNkvtdI25r8zxUZmcnpXW5unTHy14+GST/Bhr5PTAcxRQ5htAbHg3
 X2XjAQIVXXhhXr4jaDw==
X-Authority-Analysis: v=2.4 cv=Ee1d0/mC c=1 sm=1 tr=0 ts=6af4056f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=HmRiOy3tFSfIY13RnpAA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAyMyBTYWx0ZWRfXzCKzBQ8OuqFo
 lcVyU8ZzlrDoawj7MOqUa+aNLHbln7JrV2Hvf9nBWzFFsNHSOxxrDz/22XRSOBPvnAVyUGqZATG
 Q5gawkckuu+noaiwRGX7SjLDPJVsqE0=
X-Proofpoint-GUID: DvEtuVQL4xppUCvCMBYk2J0_9ig-T3Yi
X-Proofpoint-ORIG-GUID: DvEtuVQL4xppUCvCMBYk2J0_9ig-T3Yi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110023
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=subrahmanya.lingappa@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the virt machine rpmi=on/off option and wire the initial RPMI
Base transport into machine realization for firmware clients that use RPMI
platform management.

The option remains disabled by default. Enabling it requires a
librpmi-enabled TCG build; KVM and builds without librpmi reject the
configuration. The RPMI mailbox node is emitted when enabled, while the
legacy reset and poweroff nodes remain available until the later service
patches select the RPMI reset path.

Size each A2P queue from one quarter of shared memory after
reserving 8 KiB: 30 KiB per queue on virt.

Signed-off-by: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
---
 hw/riscv/Kconfig        |  1 +
 hw/riscv/virt.c         | 90 +++++++++++++++++++++++++++++++++++++++++
 include/hw/riscv/virt.h |  3 ++
 3 files changed, 94 insertions(+)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index d89fdfcc86..28d108faf8 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -49,6 +49,7 @@ config RISCV_VIRT
     imply VIRTIO_VGA
     imply TEST_DEVICES
     imply TPM_TIS_SYSBUS
+    imply RISCV_RPMI
     select DEVICE_TREE
     select RISCV_NUMA
     select GOLDFISH_RTC
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index de1c92463a..8a2ed43029 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -46,6 +46,8 @@
 #include "hw/intc/riscv_aplic.h"
 #include "hw/intc/sifive_plic.h"
 #include "hw/misc/sifive_test.h"
+#include "hw/misc/riscv_rpmi.h"
+#include "hw/riscv/rpmi-fdt.h"
 #include "hw/core/platform-bus.h"
 #include "chardev/char.h"
 #include "system/device_tree.h"
@@ -107,6 +109,8 @@ static const MemMapEntry virt_memmap[] = {
     /* UART1 supports page isolation from UART0 */
     [VIRT_UART1] =        { 0x1000a000,         0x100 },
     [VIRT_FW_CFG] =       { 0x10100000,          0x18 },
+    [VIRT_RPMI_SHMEM] =   { 0x10200000,       0x20000 },
+    [VIRT_RPMI_DOORBELL] = { 0x10230000,        0x1000 },
     [VIRT_FLASH] =        { 0x20000000,     0x4000000 },
     [VIRT_IMSIC_M] =      { 0x24000000, VIRT_IMSIC_MAX_SIZE },
     [VIRT_IMSIC_S] =      { 0x28000000, VIRT_IMSIC_MAX_SIZE },
@@ -115,6 +119,10 @@ static const MemMapEntry virt_memmap[] = {
     [VIRT_DRAM] =         { 0x80000000,           0x0 },
 };
 
+#define VIRT_RPMI_A2P_REQ_SIZE \
+    ((virt_memmap[VIRT_RPMI_SHMEM].size - 0x2000) / 4)
+#define VIRT_RPMI_P2A_REQ_SIZE 0
+
 /* PCIe high mmio is fixed for RV32 */
 #define VIRT32_HIGH_PCIE_MMIO_BASE  0x300000000ULL
 #define VIRT32_HIGH_PCIE_MMIO_SIZE  (4 * GiB)
@@ -470,6 +478,35 @@ static void create_fdt_iommu(RISCVVirtState *s, uint16_t bdf)
     s->pci_iommu_bdf = bdf;
 }
 
+static RiscvRpmiConfig virt_rpmi_config(RISCVVirtState *s,
+                                        const uint32_t *hart_ids,
+                                        uint32_t hart_count)
+{
+    return (RiscvRpmiConfig) {
+        .doorbell_base = s->memmap[VIRT_RPMI_DOORBELL].base,
+        .shmem_base = s->memmap[VIRT_RPMI_SHMEM].base,
+        .shmem_size = s->memmap[VIRT_RPMI_SHMEM].size,
+        .a2p_req_size = VIRT_RPMI_A2P_REQ_SIZE,
+        .p2a_req_size = VIRT_RPMI_P2A_REQ_SIZE,
+        .platform_info = "QEMU RISC-V virt RPMI",
+        .hart_ids = hart_ids,
+        .hart_count = hart_count,
+    };
+}
+
+static void create_fdt_rpmi(RISCVVirtState *s, uint32_t *phandle)
+{
+    RiscvRpmiFdtMboxConfig cfg = {
+        .shmem_base = s->memmap[VIRT_RPMI_SHMEM].base,
+        .doorbell_base = s->memmap[VIRT_RPMI_DOORBELL].base,
+        .a2p_req_size = VIRT_RPMI_A2P_REQ_SIZE,
+        .p2a_req_size = VIRT_RPMI_P2A_REQ_SIZE,
+        .doorbell_size = s->memmap[VIRT_RPMI_DOORBELL].size,
+    };
+
+    riscv_rpmi_fdt_add_mbox(MACHINE(s)->fdt, &cfg, phandle, NULL);
+}
+
 static void finalize_fdt(RISCVVirtState *s)
 {
     uint32_t phandle = 1, irq_mmio_phandle = 1, msi_pcie_phandle = 1;
@@ -506,6 +543,9 @@ static void finalize_fdt(RISCVVirtState *s)
                             s->memmap[VIRT_TEST].base,
                             s->memmap[VIRT_TEST].size,
                             FINISHER_RESET, FINISHER_PASS, true);
+    if (s->have_rpmi) {
+        create_fdt_rpmi(s, &phandle);
+    }
 
     create_fdt_uarts(s, irq_mmio_phandle);
 
@@ -739,6 +779,18 @@ static void virt_machine_init(MachineState *machine)
         exit(1);
     }
 
+    if (s->have_rpmi) {
+#ifndef CONFIG_LIBRPMI
+        error_report("RISC-V RPMI support is not compiled in");
+        exit(1);
+#else
+        if (kvm_enabled()) {
+            error_report("RISC-V RPMI support is not available with KVM");
+            exit(1);
+        }
+#endif
+    }
+
     /* Initialize sockets */
     mmio_irqchip = virtio_irqchip = pcie_irqchip = NULL;
     for (i = 0; i < socket_count; i++) {
@@ -897,6 +949,21 @@ static void virt_machine_init(MachineState *machine)
     /* SiFive Test MMIO device */
     sifive_test_create(s->memmap[VIRT_TEST].base);
 
+    if (s->have_rpmi) {
+        MachineClass *mc = MACHINE_GET_CLASS(machine);
+        const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(machine);
+        g_autofree uint32_t *rpmi_hart_ids =
+            g_new0(uint32_t, machine->smp.cpus);
+        RiscvRpmiConfig rpmi_cfg;
+
+        for (i = 0; i < machine->smp.cpus; i++) {
+            rpmi_hart_ids[i] = possible_cpus->cpus[i].arch_id;
+        }
+
+        rpmi_cfg = virt_rpmi_config(s, rpmi_hart_ids, machine->smp.cpus);
+        riscv_rpmi_create(&rpmi_cfg, &error_fatal);
+    }
+
     /* VirtIO MMIO devices */
     for (i = 0; i < VIRTIO_COUNT; i++) {
         sysbus_create_simple("virtio-mmio",
@@ -1050,6 +1117,20 @@ static void virt_set_aclint(Object *obj, bool value, Error **errp)
     s->have_aclint = value;
 }
 
+static bool virt_get_rpmi(Object *obj, Error **errp)
+{
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
+
+    return s->have_rpmi;
+}
+
+static void virt_set_rpmi(Object *obj, bool value, Error **errp)
+{
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
+
+    s->have_rpmi = value;
+}
+
 bool virt_is_iommu_sys_enabled(RISCVVirtState *s)
 {
     return s->iommu_sys == ON_OFF_AUTO_ON;
@@ -1166,6 +1247,15 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
                                           "enable/disable emulating "
                                           "ACLINT devices");
 
+
+    object_class_property_add_bool(oc, "rpmi", virt_get_rpmi,
+                                   virt_set_rpmi);
+    object_class_property_set_description(oc, "rpmi",
+                                          "Set on/off to enable/disable "
+                                          "RISC-V RPMI devices; requires "
+                                          "librpmi and is unavailable with "
+                                          "KVM");
+
     object_class_property_add_str(oc, "aia", virt_get_aia,
                                   virt_set_aia);
     object_class_property_set_description(oc, "aia",
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 6e4fbf4b64..c9fb118fc8 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -55,6 +55,7 @@ struct RISCVVirtState {
 
     int fdt_size;
     bool have_aclint;
+    bool have_rpmi;
     RISCVVirtAIAType aia_type;
     int aia_guests;
     char *oem_id;
@@ -82,6 +83,8 @@ enum {
     VIRT_VIRTIO,
     VIRT_UART1,
     VIRT_FW_CFG,
+    VIRT_RPMI_SHMEM,
+    VIRT_RPMI_DOORBELL,
     VIRT_IMSIC_M,
     VIRT_IMSIC_S,
     VIRT_FLASH,

