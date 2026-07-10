Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D489C43458
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 12:22:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiAEz-00072R-5T; Fri, 10 Jul 2026 08:22:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wi6mk-0000XS-1r
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 04:40:38 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wi6mg-0001s8-Cs
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 04:40:37 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66A7dW2F235369
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 08:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=xzeJ4AiYWR3
 ajTKkbjbIEkZWZjRq772CWz4lMhQHU3s=; b=ki0gpbSrNei3s4wOKsStxkCqtFU
 etsHdq/oiPROD8EfdrrR834zb2YKX3qIy0SkG/BVPOKqmKedh8r50g5QuItOXyk+
 IX6kcD4clWaYe99w9i9gxbLM12RsSMS1rYikmmSgQ5VJMC5Ve+oIg+uLitZvvA1D
 PtpALD7xhzjuoH3z6rFoDdvPXfAE/2Tz4Z50k8nJUBfRq0nbUAlXRK4nV6/aEb6H
 X1SCVkt2KkEd9+FEkDkFdSbcVD8Ze3ne/FEKT3/3q+EFWhTON29Q9NgzEmhbFgws
 x/NBWtSxGh2aiFXKcLBbjPZ2qtkWNJo85whxloQUHyKiC8PazfyTX7dZLyg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeg3km5y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 08:40:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3883dc4ad23so295835a91.0
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 01:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783672830; x=1784277630; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xzeJ4AiYWR3ajTKkbjbIEkZWZjRq772CWz4lMhQHU3s=;
 b=T8ZUJIM0i/m0//SvY+Os4uLtLToFy1wOefHhJlqQFTpg8O/ZCHIV639hsAg3XQaMaL
 S21ADTfnJCt7Bb6klUjIWnNk6OceyW1N25gjIYuhp2e1sI/DQJwQlIRzIMhy+PRln1xG
 R2ea0sXlKtKhLR/p3YB3JSUsdh6qxCInocyaWwA7XjY7MpdnH78/wOWRuCrVNgVX6lsb
 WI2qFFrhiTJQy4WIfh3KfpEUSnzV1GoecPIRK+CFneqZwa0rJxezTs3URrJkLtF4qaBO
 3ciOoEQHmTpQ4a8cS2uj4+GN8whHycvZua98qtwO+01pMPDQ/I3M9gJDtVrrqUpz17Rp
 /FVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783672830; x=1784277630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xzeJ4AiYWR3ajTKkbjbIEkZWZjRq772CWz4lMhQHU3s=;
 b=oVk9HxqoBJA27c53mCWWOsK0LPadbaOOuOM1DpwGqDoyaApdUq1GhhL6EvTtSyVc0f
 7wMfeQVnGOkBHg3/K188Nr5Ce7YJZXeFphOjNxcWyhGZsDcu2z3wXRxkGxjSJtkRk61G
 ouf6Ab+AA1ef0ZoJ8ON47Bf9Iig8zP44+0jTa5uJosIXCE0uZ8Cggdc9w9A2vHLQ7PQL
 opvXPpiMv1yTtBdHEOwzGBGXhyMDzM2KnHYLtK0Gk5PISWIhTq2UB23oKNL9WWIuSYtZ
 rgccp7gE+pQ/BpPMxDCsAHO/mx9nVEcshiTkBmAinWM2pdXvN9DNsFoHqXFvFlzll/VJ
 blbQ==
X-Gm-Message-State: AOJu0YyZw4xe7b7JxXOqGZ5SRb6WIHaNmf2Y21XvnJohXwGdn0P8tKeH
 TBeIrvDFyPRCQJ+x+4tuzUGIA+bGCzglimljzYGX9nmnkzkJEB7xTCpDeQAB4C7WVH5xy1Nk++2
 jQmHhQGWzkRVMdONz/ADxhGmc3kuVjQDlHYxZh6wOSdNF89qWLqmaH+4Moey2fERJPg==
X-Gm-Gg: AfdE7ckm0bLpC3N6u/4H8Jcov9cKkcgWHc2Q/2OmsOdUIkjTMfTVGmJtPqN1VAz7nbU
 KOYxh7e53KeSQhakbYLMUYEH0uFh7loZGoyZ+TQcktyBthyp9uJPViExlHXehBwaa9T8pTjI8OH
 G4oQhnM2zfV1VUFDZif9DzBAQq5+h3docmuNuxFff5Sy9BFWe1uCPNjI8RpCZpfnczRl3xXctiM
 Bpcw7WC65T7E0W+22FNqdnZUs1OMWsrfEwkA3acFZdmVWZiydfKBJis7/UuLXd/LiXxyhUecFoj
 Rw4sadU7biCfpJIULGNNlBqESsTmYGBFr9h48zLz8GlvEOron0umajLVrYiOWMvYB6Ccm6MlxPe
 OdXU+ENgXBL9tYyDa+jn6QuG95Rp+uzFdHoOpaPaG3ZT8o8fIoig+oQyPeLUzU3IDA8HxSR9gdC
 CMBvmxNGDvmiv4pTMuSXYFcz4TF/nyJShZxvGrT+RcuA==
X-Received: by 2002:a17:90a:d888:b0:36d:de94:f31 with SMTP id
 98e67ed59e1d1-38a21af4f70mr5390264a91.7.1783672829644; 
 Fri, 10 Jul 2026 01:40:29 -0700 (PDT)
X-Received: by 2002:a17:90a:d888:b0:36d:de94:f31 with SMTP id
 98e67ed59e1d1-38a21af4f70mr5390248a91.7.1783672829118; 
 Fri, 10 Jul 2026 01:40:29 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3118389d9bcsm29164925eec.20.2026.07.10.01.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 01:40:28 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, daniel.barboza@oss.qualcomm.com,
 Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Subject: [PATCH v2 04/10] hw/riscv/virt: add opt-in RPMI base support
Date: Fri, 10 Jul 2026 14:09:46 +0530
Message-ID: <b60250b3a051614dc0d135fbee879afde3f171ef.1783660209.git.subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783660209.git.subrahmanya.lingappa@oss.qualcomm.com>
References: <cover.1783660209.git.subrahmanya.lingappa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA4MyBTYWx0ZWRfX6JoaJLp6oZEa
 2O8PgwxoEgo+Eei+p/Tlt7aawG4lOgnMf4EYVP16CAaGxPBXs9DsdA28hGQoNB9KhPhd/AJ+OyN
 3KmE98c8C91N0+VGDAvuUVUfZjBnOx/3lbRQrtXaxfBIBajswZRXwUNUelA1++Ghv5X/44BEkrE
 x5ntfc49w6Te17im4fcSbicHAvcV/qD8W9HK91KJVCn9F8E1xKk2HirGRj5h+qNBsRWFtw+E4oX
 Rr9592w7KhXPp1Fw1jpBglNUPLlacxN8YD7QlSvwamD1Oub2PZPVBd+N3QI/oM889fny4tf8Y+Q
 UDJvqw2baAtASn4jaFh6rfFbXMYh5bfNwzWGnRGL0uoW8SA2+vGAb7gdgnvVz29E1On07toRWTF
 VmTymuo40Dooes1AsgH6XZk38sXgVxxru5bI5R2s9DTTbeW/hRBonHLK+TwNX4JSdmFa7oYdkRz
 OZu3ikttfeIneogP78w==
X-Authority-Analysis: v=2.4 cv=ZcMt8MVA c=1 sm=1 tr=0 ts=6a50affe cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=g5JW_UTvCJDKiRHPheAA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA4MyBTYWx0ZWRfXzXt7IXbfa9Z6
 oRWffXK/poyDjcznHBYjqVm08Wc4P3wWnVUDV5G6imAyaFi1GbWtK93fZ6IP+Ma3Zgqgb1K80SP
 jISRQLTJZS4wIL0TniBLrMrFRzNeIPw=
X-Proofpoint-GUID: ut6Hc5A6O5zWAgvOysrp-VQn4jwtZSkZ
X-Proofpoint-ORIG-GUID: ut6Hc5A6O5zWAgvOysrp-VQn4jwtZSkZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100083
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=subrahmanya.lingappa@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 10 Jul 2026 08:21:46 -0400
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

From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>

Add the virt machine rpmi=on/off option and wire the initial RPMI Base
transport into machine realization.

The option remains disabled by default and requires TCG plus librpmi.
Invalid accelerator/build combinations fail during machine
initialization. When enabled, virt allocates the RPMI shared-memory
transport, creates the RPMI device, configures Base service metadata,
and emits the corresponding device-tree nodes for firmware discovery.

Signed-off-by: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
---
 hw/riscv/Kconfig             |  1 +
 hw/riscv/virt.c              | 96 ++++++++++++++++++++++++++++++++++++
 include/hw/misc/riscv_rpmi.h | 10 ++++
 include/hw/riscv/virt.h      |  3 ++
 4 files changed, 110 insertions(+)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 54e41a6afc..4e25be113a 100644
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
index 33775a61fd..e52ccfae1f 100644
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
@@ -97,6 +99,8 @@ static const MemMapEntry virt_memmap[] = {
     [VIRT_UART0] =        { 0x10000000,         0x100 },
     [VIRT_VIRTIO] =       { 0x10001000,        0x1000 },
     [VIRT_FW_CFG] =       { 0x10100000,          0x18 },
+    [VIRT_RPMI_SHMEM] =   { 0x10200000,       0x20000 },
+    [VIRT_RPMI_DOORBELL] = { 0x10230000,        0x1000 },
     [VIRT_FLASH] =        { 0x20000000,     0x4000000 },
     [VIRT_IMSIC_M] =      { 0x24000000, VIRT_IMSIC_MAX_SIZE },
     [VIRT_IMSIC_S] =      { 0x28000000, VIRT_IMSIC_MAX_SIZE },
@@ -1002,6 +1006,40 @@ static void create_fdt_iommu(RISCVVirtState *s, uint16_t bdf)
     s->pci_iommu_bdf = bdf;
 }
 
+
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
+static void create_fdt_rpmi(RISCVVirtState *s, uint32_t *phandle,
+                            uint32_t msi_phandle)
+{
+    RiscvRpmiConfig rpmi_cfg = virt_rpmi_config(s, NULL, 0);
+    uint32_t rpmi_mbox_handle;
+    RiscvRpmiFdtMboxConfig cfg = {
+        .shmem_base = rpmi_cfg.shmem_base,
+        .doorbell_base = rpmi_cfg.doorbell_base,
+        .a2p_req_size = rpmi_cfg.a2p_req_size,
+        .p2a_req_size = rpmi_cfg.p2a_req_size,
+        .doorbell_size = s->memmap[VIRT_RPMI_DOORBELL].size,
+    };
+
+    riscv_rpmi_fdt_add_mbox(MACHINE(s)->fdt, &cfg, phandle,
+                            &rpmi_mbox_handle);
+}
+
 static void finalize_fdt(RISCVVirtState *s)
 {
     uint32_t phandle = 1, irq_mmio_phandle = 1, msi_pcie_phandle = 1;
@@ -1021,6 +1059,10 @@ static void finalize_fdt(RISCVVirtState *s)
     create_fdt_pcie(s, irq_pcie_phandle, msi_pcie_phandle,
                     iommu_sys_phandle);
 
+    if (s->have_rpmi) {
+        create_fdt_rpmi(s, &phandle, msi_pcie_phandle);
+    }
+
     create_fdt_reset(s, &phandle);
 
     create_fdt_uart(s, irq_mmio_phandle);
@@ -1410,6 +1452,18 @@ static void virt_machine_init(MachineState *machine)
         exit(1);
     }
 
+
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
     /* Initialize sockets */
     mmio_irqchip = virtio_irqchip = pcie_irqchip = NULL;
     for (i = 0; i < socket_count; i++) {
@@ -1552,6 +1606,25 @@ static void virt_machine_init(MachineState *machine)
     /* SiFive Test MMIO device */
     sifive_test_create(s->memmap[VIRT_TEST].base);
 
+    if (s->have_rpmi) {
+        MachineClass *mc = MACHINE_GET_CLASS(machine);
+        const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(machine);
+        g_autofree uint32_t *rpmi_hart_ids =
+            g_new0(uint32_t, machine->smp.cpus);
+        RiscvRpmiConfig rpmi_cfg;
+        Error *local_err = NULL;
+
+        for (i = 0; i < machine->smp.cpus; i++) {
+            rpmi_hart_ids[i] = possible_cpus->cpus[i].arch_id;
+        }
+
+        rpmi_cfg = virt_rpmi_config(s, rpmi_hart_ids, machine->smp.cpus);
+        if (!riscv_rpmi_create(&rpmi_cfg, &local_err)) {
+            error_report_err(local_err);
+            exit(1);
+        }
+    }
+
     /* VirtIO MMIO devices */
     for (i = 0; i < VIRTIO_COUNT; i++) {
         sysbus_create_simple("virtio-mmio",
@@ -1636,6 +1709,7 @@ static void virt_machine_instance_init(Object *obj)
 
     s->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     s->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
+    s->have_rpmi = false;
     s->acpi = ON_OFF_AUTO_AUTO;
     s->iommu_sys = ON_OFF_AUTO_AUTO;
 }
@@ -1710,6 +1784,21 @@ static void virt_set_aclint(Object *obj, bool value, Error **errp)
     s->have_aclint = value;
 }
 
+
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
@@ -1831,6 +1920,13 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
                                           "enable/disable emulating "
                                           "ACLINT devices");
 
+
+    object_class_property_add_bool(oc, "rpmi", virt_get_rpmi,
+                                   virt_set_rpmi);
+    object_class_property_set_description(oc, "rpmi",
+                                          "Set on/off to enable/disable "
+                                          "RISC-V RPMI devices");
+
     object_class_property_add_str(oc, "aia", virt_get_aia,
                                   virt_set_aia);
     object_class_property_set_description(oc, "aia",
diff --git a/include/hw/misc/riscv_rpmi.h b/include/hw/misc/riscv_rpmi.h
index cb2658e57e..b5d8a32f9b 100644
--- a/include/hw/misc/riscv_rpmi.h
+++ b/include/hw/misc/riscv_rpmi.h
@@ -85,6 +85,16 @@ struct RiscvRpmiState {
     bool has_shmem;
 };
 
+#ifdef CONFIG_LIBRPMI
 DeviceState *riscv_rpmi_create(const RiscvRpmiConfig *cfg, Error **errp);
+#else
+static inline DeviceState *riscv_rpmi_create(const RiscvRpmiConfig *cfg,
+                                             Error **errp)
+{
+    (void)cfg;
+    (void)errp;
+    return NULL;
+}
+#endif
 
 #endif
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 18a2a323a3..f7c48613bf 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -55,6 +55,7 @@ struct RISCVVirtState {
 
     int fdt_size;
     bool have_aclint;
+    bool have_rpmi;
     RISCVVirtAIAType aia_type;
     int aia_guests;
     char *oem_id;
@@ -79,6 +80,8 @@ enum {
     VIRT_UART0,
     VIRT_VIRTIO,
     VIRT_FW_CFG,
+    VIRT_RPMI_SHMEM,
+    VIRT_RPMI_DOORBELL,
     VIRT_IMSIC_M,
     VIRT_IMSIC_S,
     VIRT_FLASH,
-- 
2.43.0


