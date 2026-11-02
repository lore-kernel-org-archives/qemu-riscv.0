Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0EF606A326
	for <qemu-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 08:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RG4Wv2kY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JcAvsZWt
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xNnTn-0002yM-NT; Mon, 02 Nov 2026 03:33:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1xNnSx-0002oc-Mf
 for qemu-riscv@nongnu.org; Mon, 02 Nov 2026 03:32:38 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1xNnSs-0004og-BP
 for qemu-riscv@nongnu.org; Mon, 02 Nov 2026 03:32:29 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A26phfY3121059
 for <qemu-riscv@nongnu.org>; Mon, 2 Nov 2026 08:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=rmFrDc0KgPN
 HHa0ffKf08DOspV7JwzgSvvDggzxccNY=; b=RG4Wv2kYl9yrqLvEgcBpXwd8b/J
 xn33FG+9PItzwGkPS2Odzo6i3Zdbo53vpSUVMRJ0v7XbCzb8jFtewSgwtnuP9RZO
 Hd7SxhXHqdWLUJ9C1Jo23v+uBY6Vezx7MyDF9cRdRHLLpmg/2XnJSCKTnQicrMnC
 p3Pcvf6PXs8HB4Y0Onz0ZAH16khPq5bgpzVFrGp/nfeFk+5UxKBtSMqAwmx8QnSR
 lan9InonGpUQNXGizIsfiBHuyzDhEyLyLMJa/tgm1pjVpW13GiNt6t6jBlNS2ORO
 +AFma0Z71oH4/KfFEaHXLqzKFU9HDofkhcAz/hjeppWMz7cRXa/P99Kbw6A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmerbyq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 02 Nov 2026 08:32:24 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-7c2b7a15cedso86081137.0
 for <qemu-riscv@nongnu.org>; Mon, 02 Nov 2026 00:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793608344; x=1794213144; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rmFrDc0KgPNHHa0ffKf08DOspV7JwzgSvvDggzxccNY=;
 b=JcAvsZWt78q16jvXwr6Pm+QxuKm3cIQ0YI47I9VZ3rVFCQ3TrM+YYG7k2G/RGPRHh1
 CfT5HTiLdnqZEmszkH9C3jJBYoft4qVkjLzUajHr7krGPEGN2w37/vyJCpKtw3k3ZbR5
 V35kqVGgpBlRp05mHGRBMEDYFjgkzWapgJRODbchM1Iw1IAtJH/Rp5BGLx/mt7VOKlSr
 KU5797IwumrQd/UsmVrgmcQGYJyPgCgKuCstIGdMT1elfT1cxFLoRXiZAuwLQgnUjI0E
 UryzeHEV3YCneU2xJRmRgvEhcN6twQpoYKadsGduinU2yJwgjNQwmb4PxrB9DDdtClIK
 zEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793608344; x=1794213144;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=rmFrDc0KgPNHHa0ffKf08DOspV7JwzgSvvDggzxccNY=;
 b=iaPMhx2vTz/8aMfHE4nsR/QiXR6E/qpXh44HW6xTdkK8HcHwdHj8CG1NS/+eBpnmOK
 8ic7l6aXTWlZWga6vhWE1D8v7Rxpw4vCZUPhtJxl/mBr1SSbcG7e5VHj4WeKIIEaBAIj
 VE8RKQCfJBU7OonoSmW3p44G9Lh+Qu8xCzG7m6Uu++3eUPaBwKqqfuhTf/IQT9ElHtBe
 71PkVGgEO10tvQ3hyOafkQCUYSSB3F1jLD9+O5M96EDM0LuT1sWiFxRnL8kmzO2Wgc1O
 xDEoqEFVojBTORsiYtK4/k80F4l8/JKSQFfZggHdkJUsun3eiQSbP5XXDmOrE5D4YJOC
 0j4w==
X-Gm-Message-State: APuU4Z9uilSpMxIG7h9DE213tq/ag8cSVeAP+6m4zakyiTq/s7fj8D23
 ii83SE3jfkLNhGg76lD66pIU9Jmou9cm9EA+SoNkNASAb09c2/XsAJj7onXuWj5oNvV5tf3Bphb
 wyWmx5R0R0r6xhwuNoTRxEssyfBswr1+9SVZ5QfV3bqvTI6Vtzi4vRYdVlA==
X-Gm-Gg: AYBFou37VfPjZptcIlfYMFjGswDm9pgEUIEZVkZ+WMv6tQxALnUSIpdZDGdssOOVYlb
 MklKc4e4JiDIVDO83gqjkrGaDq2B70cujBltirix++oGbfU2vYL/J6fJkBWLSeZ6KUvCPZPT6Vu
 lml6037q8A0WJoBvep5znwhxuz1S4fgZswLJsUH5fnWIhHtSPq5fWeI/nHYGV/dRoue8bDTvMGJ
 2k7cW6LIqecUqu8atoLEA7X9X384q/5Tu7fBzO94olO7YP737UcB6140v8YzpqOZ5Yxe2O2mODu
 v8O3nYDwET8AQg83/fOG2U8SOLySsT21WM8o2P2qF3N+xCU/jYVpP/FAVDG6nuWt13PmGVRiIm2
 U6ofcDLOlmS/Kh8p+sKFbe+0/oQjG542F7QyxeHIXkvHWEcOAV5+pc9ZVvretT/7FaXvS8dMbpq
 XMhoRxo6x5nXY5CJmPgwj/gyy99t2dJlTE7/2GAOiv/ntyrs6d6z8EsAhnCRuvuKFSWXU1f/M8i
 WMhsHy1
X-Received: by 2002:a05:6102:868f:20b0:7b4:f1cd:80dd with SMTP id
 ada2fe7eead31-7d0727a54dbmr3088626137.1.1793608344139; 
 Mon, 02 Nov 2026 00:32:24 -0800 (PST)
X-Received: by 2002:a05:6102:868f:20b0:7b4:f1cd:80dd with SMTP id
 ada2fe7eead31-7d0727a54dbmr3088622137.1.1793608343710; 
 Mon, 02 Nov 2026 00:32:23 -0800 (PST)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b106edc7f8sm15083213c88.9.2026.11.02.00.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 00:32:23 -0800 (PST)
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
Subject: [PATCH v13 04/10] hw/riscv/virt: add opt-in RPMI base support
Date: Mon,  2 Nov 2026 14:01:52 +0530
Message-ID: <20261102083159.3383468-5-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102083159.3383468-1-subrahmanya.lingappa@oss.qualcomm.com>
References: <20261102083159.3383468-1-subrahmanya.lingappa@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae84a98 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=DxKkKmlP5ys5yIFZ1rYA:9 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzMyBTYWx0ZWRfX+FP48q9Fze3i
 MyyaR8ZjOvTL83KiXvP9IAlFTo9bVtLpenZcXkICGokCDjWCdo/HMuWtAq2aKSgPnFDX5WXVDSO
 hDxWBp6hRSVwMDfSHutT9pfP3FYpL+wQ85FzjXL09/7tVAqACc44VJ+voTrCFZcAqQLCSxpS6fq
 4IsWg0RcB5yP2HAblY0HwZRW22r8VURtd0xkcRCwoKAzji1Vo9oQ6BFF9jg/n4LIJFmdxGL6TW4
 D0+UFBFBg2+XyFWzuSxDPBTc/hpIYq1RQJYqZZ8sFfPH5vTaBnxcoPlZGSY3wrw8dqPA7ULwicB
 v0J5jOtGLufWWgRH9BuIDg9HzwrdZqB6+si+RARceVi4FruR3EVDwyju0u/MO1YDal0D3ZugEAY
 BJeqKV8VSSR20rUWQWB7V/cZFQcTOcMzH/96GxkvjqecSkO39tgtvSTO9yHhLL2+evuvntsMlYm
 7RGwVw66ntXvuBkyBeA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzMyBTYWx0ZWRfX0Ni2aSwEIb1I
 lRqLsBRSDZGBN0pVV/Fzz1rxFHB/KYysfCZmsg0tHIB33BS1Bj+3Z8kR9RAtJZa2noZtDVexUbv
 TpuKmDxH5RTIxXhq2KpVu2kH9kJBz3I=
X-Proofpoint-ORIG-GUID: 8DSixFZdesIjXLSwyYfuFgtFefjHp8bv
X-Proofpoint-GUID: 8DSixFZdesIjXLSwyYfuFgtFefjHp8bv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020033
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=subrahmanya.lingappa@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

Signed-off-by: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
---
 hw/riscv/Kconfig        |  1 +
 hw/riscv/virt.c         | 89 +++++++++++++++++++++++++++++++++++++++++
 include/hw/riscv/virt.h |  3 ++
 3 files changed, 93 insertions(+)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index fb05031228..dfdbc6dfe1 100644
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
index d4b501802f..c564b5be45 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -45,6 +45,8 @@
 #include "hw/intc/riscv_aplic.h"
 #include "hw/intc/sifive_plic.h"
 #include "hw/misc/sifive_test.h"
+#include "hw/misc/riscv_rpmi.h"
+#include "hw/riscv/rpmi-fdt.h"
 #include "hw/core/platform-bus.h"
 #include "chardev/char.h"
 #include "system/device_tree.h"
@@ -101,6 +103,8 @@ static const MemMapEntry virt_memmap[] = {
     /* UART1 supports page isolation from UART0 */
     [VIRT_UART1] =        { 0x1000a000,         0x100 },
     [VIRT_FW_CFG] =       { 0x10100000,          0x18 },
+    [VIRT_RPMI_SHMEM] =   { 0x10200000,       0x20000 },
+    [VIRT_RPMI_DOORBELL] = { 0x10230000,        0x1000 },
     [VIRT_FLASH] =        { 0x20000000,     0x4000000 },
     [VIRT_IMSIC_M] =      { 0x24000000, VIRT_IMSIC_MAX_SIZE },
     [VIRT_IMSIC_S] =      { 0x28000000, VIRT_IMSIC_MAX_SIZE },
@@ -109,6 +113,9 @@ static const MemMapEntry virt_memmap[] = {
     [VIRT_DRAM] =         { 0x80000000,           0x0 },
 };
 
+#define VIRT_RPMI_A2P_REQ_SIZE (16 * RPMI_QUEUE_SLOT_SIZE)
+#define VIRT_RPMI_P2A_REQ_SIZE 0
+
 /* PCIe high mmio is fixed for RV32 */
 #define VIRT32_HIGH_PCIE_MMIO_BASE  0x300000000ULL
 #define VIRT32_HIGH_PCIE_MMIO_SIZE  (4 * GiB)
@@ -464,6 +471,35 @@ static void create_fdt_iommu(RISCVVirtState *s, uint16_t bdf)
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
@@ -500,6 +536,9 @@ static void finalize_fdt(RISCVVirtState *s)
                             s->memmap[VIRT_TEST].base,
                             s->memmap[VIRT_TEST].size,
                             FINISHER_RESET, FINISHER_PASS, true);
+    if (s->have_rpmi) {
+        create_fdt_rpmi(s, &phandle);
+    }
 
     create_fdt_uarts(s, irq_mmio_phandle);
 
@@ -733,6 +772,18 @@ static void virt_machine_init(MachineState *machine)
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
@@ -891,6 +942,21 @@ static void virt_machine_init(MachineState *machine)
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
@@ -1044,6 +1110,20 @@ static void virt_set_aclint(Object *obj, bool value, Error **errp)
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
@@ -1165,6 +1245,15 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
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
index e516898f9a..919a664bc2 100644
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
-- 
2.43.0


