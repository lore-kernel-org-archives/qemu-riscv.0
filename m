Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F232CDB482
	for <qemu-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 13:30:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtT47-0003o2-L5; Thu, 19 Oct 2023 09:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qtT45-0003nN-VS
 for qemu-riscv@nongnu.org; Thu, 19 Oct 2023 09:27:54 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qtT42-0006eE-Pt
 for qemu-riscv@nongnu.org; Thu, 19 Oct 2023 09:27:53 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1ea05b3f228so3285845fac.1
 for <qemu-riscv@nongnu.org>; Thu, 19 Oct 2023 06:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697722069; x=1698326869; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mdAe+Wp4ZSFvD/7i0+0PqX//u24fB//8KJVdRTuJHc0=;
 b=YEIQQUBdnYfQYtA5RBqCPa8PdxFTFwYy9LWQ/rFuq0g+CauNlWYjKfAM5lik2Um/zG
 DLHtFPo8oZjMjBhBCnRfSimP4FFbz54JYCxsWWg3lLBR38L7bZJDaI2cto3DPGqgo79x
 qW1xg8WhT+YZXb182sk77CfDu7aSb6nUvctjYnf/qcpmqqZHmOaIGQSGn093oOErtrEp
 up895M8T0fi2W9kvamYRbpaXwT1LAspJ8glCXKrjM11A3v/Pb17lCfUhMruN0GsyVYwX
 i8zCGYFMZVMaR13+GCW71JOJ+XdOUcNKQpMncw8c9vPvkWS7Z9GjWwyU4+g3VRSrqJCO
 bH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697722069; x=1698326869;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mdAe+Wp4ZSFvD/7i0+0PqX//u24fB//8KJVdRTuJHc0=;
 b=M+lfZRe2TfaEAjlUOKIGy8n9e1lHsIzf6vjpwIZWczfx2X67gVjk1BwkjYNfQz+V64
 X6t/rkgWnuz8IMd9Ze5mBVbAqjQi0gYq/hvADqCmn32X+kMMN+ixp+cT4R12WhyykJtp
 iJzHbW8AkDM4Btpt3JfSl0LrFlEw1eag/x1fDHXRmxpmTRooG9/DiZRnxDJVVZvxE8JM
 VZNiv9pAuvryGHw+9K0Ai5hfxp1GJ3H97o2LleVNiH+VTJUBYq43lIuajmDGaxrfOjnT
 evT57Pb53Z8pkGbMKanuRMgHPCSBKx6+TR6cn4Ot8DmTVd8BhSRcFXaz3ySV+TVjzz2q
 zcJw==
X-Gm-Message-State: AOJu0YxkWc/unaibrIDuudflXuz3svQaIK7es7Ab01VykRwqp8CAVaoO
 lPG9N3jpFpeoaFdXfBo02cmz49G4AJJ1pWVk2AE=
X-Google-Smtp-Source: AGHT+IHyByaN+8bUGL66Bmx/e6WK6R5WQmnb8cuq+Wu6mKiSjSkk3fpPsx3mNQb+7q8eWK6on9xwRw==
X-Received: by 2002:a05:6870:2104:b0:1be:e1d9:6f83 with SMTP id
 f4-20020a056870210400b001bee1d96f83mr2518114oae.28.1697722068849; 
 Thu, 19 Oct 2023 06:27:48 -0700 (PDT)
Received: from sunil-laptop.dc1.ventanamicro.com
 ([2409:4071:6e8b:3a98:dd76:4e82:7da6:44ab])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a056a00228b00b0068feb378b89sm5273113pfe.171.2023.10.19.06.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Oct 2023 06:27:48 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v3 04/12] hw/riscv/virt-acpi-build.c: Add AIA support in RINTC
Date: Thu, 19 Oct 2023 18:56:40 +0530
Message-Id: <20231019132648.23703-5-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231019132648.23703-1-sunilvl@ventanamicro.com>
References: <20231019132648.23703-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Update the RINTC structure in MADT with AIA related fields.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/virt-acpi-build.c | 66 +++++++++++++++++++++++++++++++++++---
 1 file changed, 62 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index d8772c2821..073c85f327 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -38,6 +38,7 @@
 #include "hw/intc/riscv_aclint.h"
 
 #define ACPI_BUILD_TABLE_SIZE             0x20000
+#define ACPI_BUILD_INTC_ID(socket, index) ((socket << 24) | (index))
 
 typedef struct AcpiBuildState {
     /* Copy of table in RAM (for patching) */
@@ -58,18 +59,42 @@ static void acpi_align_size(GArray *blob, unsigned align)
 }
 
 static void riscv_acpi_madt_add_rintc(uint32_t uid,
+                                      uint32_t local_cpu_id,
                                       const CPUArchIdList *arch_ids,
-                                      GArray *entry)
+                                      GArray *entry,
+                                      RISCVVirtAIAType aia_type,
+                                      uint64_t imsic_addr,
+                                      uint32_t imsic_size)
 {
     uint64_t hart_id = arch_ids->cpus[uid].arch_id;
 
     build_append_int_noprefix(entry, 0x18, 1);       /* Type     */
-    build_append_int_noprefix(entry, 20, 1);         /* Length   */
+    build_append_int_noprefix(entry, 36, 1);         /* Length   */
     build_append_int_noprefix(entry, 1, 1);          /* Version  */
     build_append_int_noprefix(entry, 0, 1);          /* Reserved */
     build_append_int_noprefix(entry, 0x1, 4);        /* Flags    */
     build_append_int_noprefix(entry, hart_id, 8);    /* Hart ID  */
     build_append_int_noprefix(entry, uid, 4);        /* ACPI Processor UID */
+    /* External Interrupt Controller ID */
+    if (aia_type == VIRT_AIA_TYPE_APLIC) {
+        build_append_int_noprefix(entry,
+                                  ACPI_BUILD_INTC_ID(
+                                      arch_ids->cpus[uid].props.node_id,
+                                      local_cpu_id),
+                                  4);
+    } else {
+        build_append_int_noprefix(entry, 0, 4);
+    }
+
+    if (aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
+        /* IMSIC Base address */
+        build_append_int_noprefix(entry, imsic_addr, 8);
+        /* IMSIC Size */
+        build_append_int_noprefix(entry, imsic_size, 4);
+    } else {
+        build_append_int_noprefix(entry, 0, 8);
+        build_append_int_noprefix(entry, 0, 4);
+    }
 }
 
 static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
@@ -77,6 +102,11 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
     MachineClass *mc = MACHINE_GET_CLASS(s);
     MachineState *ms = MACHINE(s);
     const CPUArchIdList *arch_ids = mc->possible_cpu_arch_ids(ms);
+    uint64_t imsic_socket_addr, imsic_addr;
+    uint8_t  guest_index_bits;
+    uint32_t imsic_size, local_cpu_id, socket_id;
+
+    guest_index_bits = imsic_num_bits(s->aia_guests + 1);
 
     for (int i = 0; i < arch_ids->len; i++) {
             Aml *dev;
@@ -87,8 +117,19 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
             aml_append(dev, aml_name_decl("_UID",
                        aml_int(arch_ids->cpus[i].arch_id)));
 
+            socket_id = arch_ids->cpus[i].props.node_id;
+            local_cpu_id = (arch_ids->cpus[i].arch_id -
+                            riscv_socket_first_hartid(ms, socket_id)) %
+                            riscv_socket_hart_count(ms, socket_id);
             /* build _MAT object */
-            riscv_acpi_madt_add_rintc(i, arch_ids, madt_buf);
+            imsic_socket_addr = s->memmap[VIRT_IMSIC_S].base +
+                                (socket_id * VIRT_IMSIC_GROUP_MAX_SIZE);
+            imsic_addr = imsic_socket_addr +
+                         local_cpu_id * IMSIC_HART_SIZE(guest_index_bits);
+            imsic_size = IMSIC_HART_SIZE(guest_index_bits);
+
+            riscv_acpi_madt_add_rintc(i, local_cpu_id, arch_ids, madt_buf,
+                                      s->aia_type, imsic_addr, imsic_size);
             aml_append(dev, aml_name_decl("_MAT",
                                           aml_buffer(madt_buf->len,
                                           (uint8_t *)madt_buf->data)));
@@ -227,6 +268,7 @@ static void build_dsdt(GArray *table_data,
  * 5.2.12 Multiple APIC Description Table (MADT)
  * REF: https://github.com/riscv-non-isa/riscv-acpi/issues/15
  *      https://drive.google.com/file/d/1R6k4MshhN3WTT-hwqAquu5nX6xSEqK2l/view
+ *      https://drive.google.com/file/d/1oMGPyOD58JaPgMl1pKasT-VKsIKia7zR/view
  */
 static void build_madt(GArray *table_data,
                        BIOSLinker *linker,
@@ -235,6 +277,12 @@ static void build_madt(GArray *table_data,
     MachineClass *mc = MACHINE_GET_CLASS(s);
     MachineState *ms = MACHINE(s);
     const CPUArchIdList *arch_ids = mc->possible_cpu_arch_ids(ms);
+    uint64_t imsic_socket_addr, imsic_addr;
+    uint8_t  guest_index_bits;
+    uint32_t imsic_size;
+    uint32_t local_cpu_id, socket_id;
+
+    guest_index_bits = imsic_num_bits(s->aia_guests + 1);
 
     AcpiTable table = { .sig = "APIC", .rev = 6, .oem_id = s->oem_id,
                         .oem_table_id = s->oem_table_id };
@@ -246,7 +294,17 @@ static void build_madt(GArray *table_data,
 
     /* RISC-V Local INTC structures per HART */
     for (int i = 0; i < arch_ids->len; i++) {
-        riscv_acpi_madt_add_rintc(i, arch_ids, table_data);
+        socket_id = arch_ids->cpus[i].props.node_id;
+        local_cpu_id = (arch_ids->cpus[i].arch_id -
+                       riscv_socket_first_hartid(ms, socket_id)) %
+                       riscv_socket_hart_count(ms, socket_id);
+        imsic_socket_addr = s->memmap[VIRT_IMSIC_S].base +
+                            (socket_id * VIRT_IMSIC_GROUP_MAX_SIZE);
+        imsic_addr = imsic_socket_addr +
+                     local_cpu_id * IMSIC_HART_SIZE(guest_index_bits);
+        imsic_size = IMSIC_HART_SIZE(guest_index_bits);
+        riscv_acpi_madt_add_rintc(i, local_cpu_id, arch_ids, table_data,
+                                  s->aia_type, imsic_addr, imsic_size);
     }
 
     acpi_table_end(linker, &table);
-- 
2.34.1


