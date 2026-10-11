Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F32CA9ED0
	for <qemu-riscv@archiver.kernel.org>; Sun, 11 Oct 2026 18:27:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xFyFf-00034Z-LK; Sun, 11 Oct 2026 14:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunil.laxminarasimha@oss.qualcomm.com>)
 id 1xFyFT-0002yQ-A4
 for qemu-riscv@nongnu.org; Sun, 11 Oct 2026 14:26:16 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunil.laxminarasimha@oss.qualcomm.com>)
 id 1xFyFR-0008Su-D3
 for qemu-riscv@nongnu.org; Sun, 11 Oct 2026 14:26:14 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69BILJSN016507
 for <qemu-riscv@nongnu.org>; Sun, 11 Oct 2026 18:26:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:sender:subject:to; s=qcppdkim1; bh=m6oF
 uiTVb24CD7SBzXo9f+RpEjr4Z1iVgWhANPx/q8M=; b=o7A5xUV8JUXWlaouRwY4
 3/ViNRDfxZtmeIuQDCXrSmAYepNA9RPYF6UiaHNIWPamk0cDZbMFC6/qWFtOd1D9
 hrMGl/tWKNi+TSBLtwFr6mSWWuInJotyvBUrTMpOqfBvKqB8+Z3pinSn3o+X856M
 g+EYMnigrFJjLYMlBzTMyvc7XUGRZ5VtLCP3D1k7BourLoGt0VdMhZgwQ0cgSIkn
 LfJe57n1UoatBpghcY/KOLUQACNYvsk80VGTiH3P44sPk8t6VuJBwMpkJ4pJrzu7
 DDsdOsErUWX0E3v1wDPN2PL6LLDj4Tort1ZB8RUPf7zWGNoBF6+/94E6s2sytkSM
 CQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7dk23hus-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Sun, 11 Oct 2026 18:26:11 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id
 a92af1059eb24-143826c4a13so695582c88.1
 for <qemu-riscv@nongnu.org>; Sun, 11 Oct 2026 11:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791743171; x=1792347971; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=m6oFuiTVb24CD7SBzXo9f+RpEjr4Z1iVgWhANPx/q8M=;
 b=PjE/giA8Uady6jZW8iMyd6wnuBMbeA+Q9RmFeyTqKtQ66BiNKXCG85s4I4W3h4y1Gw
 feMhflM0bgxjVgGR1W/kZmBr7lctAncjoKDAZ3q22uhJZSzs5mlyknuEKOxy7iKzaA+o
 FnjH3MRGGtlEAewDWgAe69qt5QPMy7NeORv67sckNCkpsKfuuuPD0KfgUSmsS/YIn5le
 6FmTIi3ZB9FRPJ2KKFla/iBPMwEp/n12zCR9RJA3wadP0sHDKTN8wNm22oAWdWhdLRFF
 MT62MUhJz+4zhBGd8B+NL/0ibzkwRQgJUK3zIwX+pTg3DgPuIjGkSKACV03pRwflq5Zh
 TGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791743171; x=1792347971;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=m6oFuiTVb24CD7SBzXo9f+RpEjr4Z1iVgWhANPx/q8M=;
 b=gCWDMtCHhUUKlZinhHdL3agpaS6uvTcRLWwc4nEsXo0qI1uThW9GHleUwykQFLfom3
 FTeQuYuHyIl5C+eJnSuhAuouEdbC9dlzH54DxTfCsGSvywPW7pOJeL8P13JjoxY4homD
 AEf0XA6mOv3LhiYNLmH7IBTXkLsd/VOKlfIUhGpM2U3DtF+7YqdB9ro0bx8TIGfzJy1+
 TV9uLJS4aF4A6qAWlWFz5D/Pvq+R04BeJSCgYnCx/iI+QoKrTq7PZCELeYf3nMIyGNAZ
 0wxq62K539knqeWL626cQKsGdqgBjKMF9qDDdpUtpq3VUsD75Wl62QvVp4+p2HeEne87
 X1Yg==
X-Forwarded-Encrypted: i=1;
 AKwUvByDyh8kpyz4pC/PKgTnVbegPfFMK9okxgigR7KWCyLdmQZoUYe0VcHUB4H0QccwDSMQEHfB9BHR9WUY@nongnu.org
X-Gm-Message-State: AFq9FYJhpiyv5Rd9wpJZrVVk+6qAIVtV+XYgL+j+U2CrBtdPXdhWAdFr
 XoywRBInru3mMfr8xJVAkhFUfVdm3dUomQLG4lvlFp+LjVVjxrDyLd3ONm0ZY/pgoMe7sfvXPCM
 W90B6lQxIL+i2h50tjx6eP6mg2wgHBrRq8dSyibPO9JUVXVrDVekZTI4zhA==
X-Gm-Gg: AYBFou1m7al7MX6zhBNIb7c+1Hsc1yN8gPnZw0Su9/IOWxwUJSqw2DCtoJfhEEo1fcF
 hwnS1IiN7N3CHbDBUh9zAJxzJoFunGa4gjcmKi4SUk56sXUvgjqIccM0JSxJxDUXNeQxJvgDpPh
 wcpUKYWjSerJE5K98aXnj77Mqm9w0cD1xKh/cNccTgBFDdOuhcl0J0T9cH/Dss8jKJfvLjLJwxQ
 9y9W31MTzulY4KISIGy6Xd6ii0SXxfyfjNNzRgMvJHJTKH/Rn7MlzS2igGjBBmiTV/zIbxCN8im
 vKP0oYonfSYj1xrhz9osDgcH6yQrmw9Rd+uB+v12dn/pMjrrRyMlE6iS7jgIpZakeVEkOPhxg8q
 6wbMGsZR4Wt8NRPbCy7EeVRWIvFtGUAbVfpWW1Zkm+1gsZOq3zlZav/A=
X-Received: by 2002:a05:701b:4508:10b0:154:fa0b:6df1 with SMTP id
 a92af1059eb24-16a5e49d6c9mr9218476c88.37.1791743170942; 
 Sun, 11 Oct 2026 11:26:10 -0700 (PDT)
X-Received: by 2002:a05:701b:4508:10b0:154:fa0b:6df1 with SMTP id
 a92af1059eb24-16a5e49d6c9mr9218444c88.37.1791743170328; 
 Sun, 11 Oct 2026 11:26:10 -0700 (PDT)
Received: from hu-sunilvl-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-169a5866477sm22505284c88.22.2026.10.11.11.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2026 11:26:09 -0700 (PDT)
X-Google-Original-From: Sunil V L <sunilvl@oss.qualcomm.com
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Anup Patel <anup.patel@oss.qualcomm.com>,
 Drew Fustini <fustini@kernel.org>, Sunil V L <sunilvl@oss.qualcomm.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>
Subject: [PATCH 2/4] hw/riscv/virt: Add ACPI PPTT table
Date: Sun, 11 Oct 2026 23:55:50 +0530
Message-ID: <20261011182552.1071742-3-sunilvl@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261011182552.1071742-1-sunilvl@oss.qualcomm.com>
References: <20261011182552.1071742-1-sunilvl@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bExbJmCbSzadcnSORy1jL2sQ6cvgu8cC
X-Proofpoint-GUID: bExbJmCbSzadcnSORy1jL2sQ6cvgu8cC
X-Authority-Analysis: v=2.4 cv=E6hYNqdl c=1 sm=1 tr=0 ts=6acbd4c3 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Bq6zwJu1AAAA:8 a=bgGojp78X7_NmGY_0FYA:9 a=Fk4IpSoW4aLDllm1B1p-:22
 a=KQ6X2bKhxX7Fj2iT9C4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDA3MyBTYWx0ZWRfXw0AgkLkWffHl
 gcnADdSU9iJUdSs/S4EUS66CrDbVfnIc+WgkSa3o/Zji0o7MN2OEw1HSV+7Zhm2C/ZqMp6Z9mcH
 1hMVAXziREVF78r4uVDIM7QoyFCcZMKU1jZMSqPI8KnxLT9nlsutq/JN4zBkWENI7C4dNUqSa/D
 BK06dYPLM8A/ube26k4SlXPysajPlk5HPMzCIaO2FA8tRTzULQoIiYL7G2JGLeJYl369WG90I1t
 PhvGEqbKcpvjeMkJ8IscptnPsKj8gAS2YbtBNJxIS0nNVbvQ76psPJM7qi3+BoujL2kN4vLIMEA
 lZVQJX3APFSc8oJftj4caiQL+lo3rCcy533QBwlVmT26R+HD/CHqvNHXsCwJKEVNjcHjWeeu/C0
 cOBUW5zeLv1RKgf2S4rISX7sbwdWU5Urg9NCpLzvhr22AirNEQpOd5XD71IVypFrqu2LIXmbvJ+
 4UQ9iffyUvtXnGpmQ0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDA3MyBTYWx0ZWRfX6DwJcQKD2J4O
 kLsov+i+S59H6qQWb393dd+HYiGUQwJavvq9QW2Sa/KxpmYy11rGeM5RGwc+ZVIZAhYLrrYKTxR
 5S4hQvT8dh7Kdr+8o8K9v96+92uu05U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610110073
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=sunil.laxminarasimha@oss.qualcomm.com;
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Reply-to:  Sunil V L <sunilvl@oss.qualcomm.com>
From:  Sunil V L via <qemu-riscv@nongnu.org>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Sunil V L <sunilvl@oss.qualcomm.com>

Generate the Processor Properties Topology Table (PPTT) for the RISC-V
virt machine.

Describe the machine using separate L1 data and instruction caches plus
unified L2 and L3 caches, and enable the corresponding cache and cluster
SMP properties.

Signed-off-by: Sunil V L <sunilvl@oss.qualcomm.com>
Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
---
 hw/riscv/virt-acpi-build.c |  7 +++++
 hw/riscv/virt.c            | 54 ++++++++++++++++++++++++++++++++++++++
 include/hw/riscv/virt.h    |  4 +++
 3 files changed, 65 insertions(+)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 0475dcb5c601..3c72a03dadb6 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -882,7 +882,10 @@ static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
     unsigned dsdt, xsdt;
     GArray *tables_blob = tables->table_data;
     MachineState *ms = MACHINE(s);
+    CPUCoreCaches caches[CPU_MAX_CACHES];
+    unsigned int num_caches;
 
+    num_caches = virt_get_caches(caches);
     table_offsets = g_array_new(false, true,
                                 sizeof(uint32_t));
 
@@ -915,6 +918,10 @@ static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
         spcr_setup(tables_blob, tables->linker, s);
     }
 
+    acpi_add_table(table_offsets, tables_blob);
+    build_pptt(tables_blob, tables->linker, ms, s->oem_id,
+               s->oem_table_id, num_caches, caches);
+
     acpi_add_table(table_offsets, tables_blob);
     {
         AcpiMcfgInfo mcfg = {
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index d4b501802f60..245651fbbd13 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -109,6 +109,45 @@ static const MemMapEntry virt_memmap[] = {
     [VIRT_DRAM] =         { 0x80000000,           0x0 },
 };
 
+CPUCoreCaches virt_caches[] = {
+    {
+        .type = DATA_CACHE,
+        .sets = 256,
+        .size = 64 * KiB,
+        .level = 1,
+        .linesize = 64,
+        .attributes = 0x0,
+        .associativity = 4,
+    },
+    {
+        .type = INSTRUCTION_CACHE,
+        .sets = 256,
+        .size = 64 * KiB,
+        .level = 1,
+        .linesize = 64,
+        .attributes = 0x0,
+        .associativity = 4,
+    },
+    {
+        .type = UNIFIED_CACHE,
+        .sets = 4096,
+        .size = 2048 * KiB,
+        .level = 2,
+        .linesize = 64,
+        .attributes = 0x0,
+        .associativity = 8,
+    },
+    {
+        .type = UNIFIED_CACHE,
+        .sets = 8192,
+        .size = 4096 * KiB,
+        .level = 3,
+        .linesize = 64,
+        .attributes = 0x0,
+        .associativity = 8,
+    },
+};
+
 /* PCIe high mmio is fixed for RV32 */
 #define VIRT32_HIGH_PCIE_MMIO_BASE  0x300000000ULL
 #define VIRT32_HIGH_PCIE_MMIO_SIZE  (4 * GiB)
@@ -140,6 +179,15 @@ static void virt_flash_map(RISCVVirtState *s,
                          sysmem, VIRT_FLASH_SECTOR_SIZE);
 }
 
+unsigned int virt_get_caches(CPUCoreCaches *caches)
+{
+    for (int i = 0; i < ARRAY_SIZE(virt_caches); i++) {
+        caches[i] = virt_caches[i];
+    }
+
+    return ARRAY_SIZE(virt_caches);
+}
+
 static void create_fdt_socket_plic(RISCVVirtState *s,
                                    int socket,
                                    uint32_t *phandle, uint32_t *intc_phandles,
@@ -1144,6 +1192,12 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
     mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
     mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
     mc->numa_mem_supported = true;
+    mc->smp_props.clusters_supported = true;
+    mc->smp_props.cache_supported[CACHE_LEVEL_AND_TYPE_L1D] = true;
+    mc->smp_props.cache_supported[CACHE_LEVEL_AND_TYPE_L1I] = true;
+    mc->smp_props.cache_supported[CACHE_LEVEL_AND_TYPE_L2] = true;
+    mc->smp_props.cache_supported[CACHE_LEVEL_AND_TYPE_L3] = true;
+
     /* platform instead of architectural choice */
     mc->cpu_cluster_has_numa_boundary = true;
     mc->default_ram_id = "riscv_virt_board.ram";
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index e516898f9ad9..1e498a4f5f6e 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -121,10 +121,14 @@ enum {
 #define VIRT_PLIC_SIZE(__num_context) \
     (VIRT_PLIC_CONTEXT_BASE + (__num_context) * VIRT_PLIC_CONTEXT_STRIDE)
 
+#define CPU_MAX_CACHES 16
+
 bool virt_is_acpi_enabled(RISCVVirtState *s);
 bool virt_is_iommu_sys_enabled(RISCVVirtState *s);
 void virt_acpi_setup(RISCVVirtState *vms);
 
+unsigned int virt_get_caches(CPUCoreCaches *caches);
+
 /*
  * The virt machine physical address space used by some of the devices
  * namely ACLINT, PLIC, APLIC, and IMSIC depend on number of Sockets,
-- 
2.43.0


