Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D90CCC6B34
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 06:52:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xHFJa-0003oc-LS; Thu, 15 Oct 2026 02:51:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@oss.qualcomm.com>)
 id 1xHFJY-0003o2-QI
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 02:51:44 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@oss.qualcomm.com>)
 id 1xHFJX-0007kT-3f
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 02:51:44 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69F6pBZ02121583
 for <qemu-riscv@nongnu.org>; Thu, 15 Oct 2026 06:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=4DL+SBQ2Ss3
 ATMiGsknsh3lcVREWPyJVJydoWib4YtU=; b=dVYR7Aj3xCJMIOf9qVrgu9TyOxT
 KGEDnTCNfvvUWOxPj1wsHMDsqhV8sqEvF5hK8VZiqHnTHhhDaN9qVWX1FcVLmoOi
 jI/8pWJPZkX+gBVHlm8F6Pxpjx+3u7PxpgYDdAB3JQK4U90AWbaQpN/zAC1KY0ER
 e2eh7h85v0o86ryKIk3dKNg6eeLeyvJlS27xhHTf3Uy+D6IA42f4cyQpIMmgEQkm
 pXfdOnjVoFBtpU/8Rabjh2pYLLbVLk18+EGY7VDnyX3iL9GuAuL1uGBpAWJPNlU6
 MLFfaGcHEMFTSD6OOwwDwJc2TclTbbyX3nZ4f+GTwOtUGXaDCcy2eq/h2aw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn19wc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 15 Oct 2026 06:51:42 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id
 a92af1059eb24-1663fb7e005so6334864c88.0
 for <qemu-riscv@nongnu.org>; Wed, 14 Oct 2026 23:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792047101; x=1792651901; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4DL+SBQ2Ss3ATMiGsknsh3lcVREWPyJVJydoWib4YtU=;
 b=KIjJyt8cLN4wN/EEBfyyXjxwl9+sz1ojeP6W9ujs0Kjn+FkKVAOdmDlzr9YTCAI9Y1
 f/oAiUIJYqdguO1k01XIvuMp68188u/rEz9hm9eZVfxjiTMAvoplERLr6Y71tdSf0izW
 L5aZcg55udVt2EIEVC/dWtZ+NSyRXH5d2IQf+CUzFrksoyLjJu1sPfkDixi/5qk5+VOK
 6xSBxnn/yahQIkNTBzQYxzKjHOoflUb99kDmLvzxoOjdNyFkVVsTarY4DhzCApkUs6sn
 Cy9lYvLi+lZFSyTLP9OVNQa6XfyJ+el97oUKJtLyTQp0HrzIXHXQZqnguldVhk/cxYUW
 QQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792047101; x=1792651901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4DL+SBQ2Ss3ATMiGsknsh3lcVREWPyJVJydoWib4YtU=;
 b=HMpbX6Lpl4iHPReEAwsbJQ92KQl+Sqj0aLgi7M9XAMH0HVh/er3Pfm/Iqb7DXZOK6M
 MAdIY0lxu/OMXftcLFeosyZwP8OjxUPNws4eioYWEg7iGIzRnuSj9lwObzRBTitbOk+5
 z3LsSA8Ze8npms6VaTre/khokA7N3Qasd11za3RqpinFyMSkEUV7UBI0ptv0ARSKMIk8
 TqYbmGBHekdmJz2QPxmpoDkAvZCav1Hh4CvfZOLwiZN8V5vnti7027fsAdckf0C+7eJ3
 TTuGLWFzGCSOzqSdlq+EuEHyiisYeaaqK+2D8XYe9hWgk5d9+SPGhDPc7ZKIbFKE2pBj
 ifMQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBy35iLjoR+IABj650xNl2PVCFJwAFS+HWCcdE4IpIh40fVxo9UtANARGsOnl01+igmA/RU5JfDSIO2H@nongnu.org
X-Gm-Message-State: AFq9FYLLJopcjnSDptRRhTpNY6qU0JCvfmh37M7PB9jFLFfe5z5ixPSM
 okoY/H/V1ksGuE5JWH6X6aHeKoKmOlTtaQT0mTmgK7oCPsAbXh+GqCgAENnpzJNGOnp/JKA7pJz
 8GtwzQ3xbND88uRVnJ/0JfyIdj71QMbAsEDilBCvRl3jVxQ9rjohLwDuNaA==
X-Gm-Gg: AYBFou31nNppU1oNESdCFF1wjHXf3a5f6FcUpOBnw2xJ53fuvyk2oV2M5x701FmXywM
 HrIhAVOgM2/nquTDO4Ux07NVdiuAIZRxedp4D/zT21YiokSCz0nHFFswZDNdeL/kH40vXhZBi5R
 bXe8j9/BfTxz5Fsx7CSdTjlX+h5v7cPxZFsuDOekVHDbz4ji2+rxOGpCo1GJkHwxFxdapKt2M/S
 jsclqSSLxjM/8sBubTxa7qYoJweH6mdMXxK+YA1qFqUCrUtuyTLCyplHEGqPVMNA0X02rqiZ/0w
 ZO82QdlbBfwAKkozwZAPc4fhJ2kIeMXfRQcFDXLrMiyY7I6KNEhiZCaFvloyebOowZtalurSiim
 LvWuTnT8hnUO0fgsaBHv/MlPEukqLa+SMHn9J4raQr17GUnPTWFznR2nkKOBRga70k86ZCa81UF
 UJjF85NeUvtmg=
X-Received: by 2002:a05:7022:1584:b0:143:4d12:396d with SMTP id
 a92af1059eb24-16a61a6def5mr33427237c88.26.1792047100922; 
 Wed, 14 Oct 2026 23:51:40 -0700 (PDT)
X-Received: by 2002:a05:7022:1584:b0:143:4d12:396d with SMTP id
 a92af1059eb24-16a61a6def5mr33427204c88.26.1792047100330; 
 Wed, 14 Oct 2026 23:51:40 -0700 (PDT)
Received: from hu-sunilvl-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-169a442956asm67451789c88.16.2026.10.14.23.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 23:51:39 -0700 (PDT)
From: Sunil V L <sunilvl@oss.qualcomm.com>
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
 Drew Fustini <fustini@kernel.org>, Prajwal N <prajwal.n@oss.qualcomm.com>,
 Shankar C <shankar.c@oss.qualcomm.com>,
 Sunil V L <sunilvl@oss.qualcomm.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>
Subject: [PATCH v2 2/4] hw/riscv/virt: Add ACPI PPTT table
Date: Thu, 15 Oct 2026 12:19:55 +0530
Message-ID: <20261015064957.4076464-3-sunilvl@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015064957.4076464-1-sunilvl@oss.qualcomm.com>
References: <20261015064957.4076464-1-sunilvl@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyNyBTYWx0ZWRfX5F6RjA0STThI
 qS2DQ65Sys93Y96Vjq5aevyQvmhbivQYvi/PKaffr0nTFkGzRkmm3DI/YBqKTlWMdUHaNXOTdZ+
 KGVykdtAWABYD/YWI+DzXFZ2739ztPFTbutHs5frB9hktWXzY1OZ6O8cXPkJMryqm3zGEQ46on7
 l9jWQ+RkAvqMTFwrWuda0efMGsmUdzzBrJF3ZxpOeF2p9QncP9RYxSmkT+NaYYYXFykOlq1MJwJ
 wsN7Nwzofk/4dq0WMmI8iDP+1ZblBQGO7dzHMGQk/WdmHcMrUZMrHLSOEK2bVmDZe+n1U8yLUq1
 q9wU6vTYJvLjqwB0FlZLO3mx75ziT+7oKFgvQerm/xoVCy9lHbxZYJ6BRQwBiSdNd7aosN/+Wu7
 kGohIayHGpqwOzS9vlhjpymOMJXWvRG0xOGesQUIRXXUZmjBxVkii9Fm8vncg/rinFAoZmXV0ed
 U3vn5B6f/fD2aUMb9WQ==
X-Proofpoint-GUID: 30PdnZJ7VUg_YIwXg_LmJCfot9OI4Yty
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyNyBTYWx0ZWRfX83WfA3JUJajI
 FEpNtuTT0Ayg23HSqQT4rvgU0w8dn8Q4ZoAdxNJ2Apg5fOz7DH5HvsfG/ePa96NOail0VJlU9Vy
 WJ/vhdFQTcBFt2+xEMFJgMroCEh3J5E=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad077fe cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Bq6zwJu1AAAA:8 a=bgGojp78X7_NmGY_0FYA:9 a=vBUdepa8ALXHeOFLBtFW:22
 a=KQ6X2bKhxX7Fj2iT9C4S:22
X-Proofpoint-ORIG-GUID: 30PdnZJ7VUg_YIwXg_LmJCfot9OI4Yty
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150027
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=sunilvl@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

Generate the Processor Properties Topology Table (PPTT) for the RISC-V
virt machine.

Describe the machine using separate L1 data and instruction caches plus
unified L2 and L3 caches, and enable the corresponding cache and cluster
SMP properties.

Signed-off-by: Sunil V L <sunilvl@oss.qualcomm.com>
Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
---
 hw/riscv/virt-acpi-build.c |  7 ++++++
 hw/riscv/virt.c            | 51 ++++++++++++++++++++++++++++++++++++++
 include/hw/riscv/virt.h    |  4 +++
 3 files changed, 62 insertions(+)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 0475dcb5c601..8254f1294a72 100644
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
 
@@ -909,6 +912,10 @@ static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
         build_rimt(tables_blob, tables->linker, s);
     }
 
+    acpi_add_table(table_offsets, tables_blob);
+    build_pptt(tables_blob, tables->linker, ms, s->oem_id,
+               s->oem_table_id, num_caches, caches);
+
     acpi_add_table(table_offsets, tables_blob);
 
     if (ms->acpi_spcr_enabled) {
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index d4b501802f60..c84b17a40125 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -109,6 +109,45 @@ static const MemMapEntry virt_memmap[] = {
     [VIRT_DRAM] =         { 0x80000000,           0x0 },
 };
 
+static CPUCoreCaches virt_caches[] = {
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
@@ -140,6 +179,12 @@ static void virt_flash_map(RISCVVirtState *s,
                          sysmem, VIRT_FLASH_SECTOR_SIZE);
 }
 
+unsigned int virt_get_caches(CPUCoreCaches *caches)
+{
+    memcpy(caches, virt_caches, sizeof(virt_caches));
+    return ARRAY_SIZE(virt_caches);
+}
+
 static void create_fdt_socket_plic(RISCVVirtState *s,
                                    int socket,
                                    uint32_t *phandle, uint32_t *intc_phandles,
@@ -1144,6 +1189,12 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
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


