Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0854C0032E
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 20:14:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvkAj-0007XA-Dd; Wed, 25 Oct 2023 16:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qvkAX-0007No-4l
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 16:07:58 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qvkAV-0003TM-5k
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 16:07:56 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6be840283ceso113765b3a.3
 for <qemu-riscv@nongnu.org>; Wed, 25 Oct 2023 13:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698264474; x=1698869274; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TfFeqiwy/lnMV+wtArC/MMG4vgmZOnTJ6KJSLyrtCZ4=;
 b=mQtXv0ER6ER3+s2kg1qheh+RSRvF/6zPTGiapG/mjuwr+5jxMcDqLIT0kXjgAtQvb+
 z0KHFD7wn6BI6/GZFYGKsmS5mZXeu0JPvblw9Qvqmwws5Kx2p4kniV1eq+5r6SPqcoOA
 jXT4bk98OmHEuxh9x+9CjHnJCuL7uTcdq1IJ6JofXfKlkKzvNE2nyxaq1A3oHmpnp72I
 srxTKboZ2fumQYoT4Gx1Q/Iy1u6eU28MbcDROhSL9oUi5x8mlFCkOBMRCQzCmdVni48K
 4AlfKhXG6Jd4FSuaTDmnKyAVOkMpAl2lXDymQUS0R3lmP4v/MgrdmgMLJuqdrTGftNbm
 1IwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698264474; x=1698869274;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TfFeqiwy/lnMV+wtArC/MMG4vgmZOnTJ6KJSLyrtCZ4=;
 b=XEw+wfj4xkr2voOFusiRT3vKJc0KnDJma3HYE3I+0O8dij7D6coVMZB7BsSyP1t2wb
 ekrpUSG8O1j8EEuZTPXAJXzJbcoDgz4AhGGS3uGUeeMlL21fB+bAvBZBBbhZVOq0dUE2
 2Mfe1WUHPfPGPOfW4yH3FrZLKvs1zrRrnvhSWM8y4cma/WaAxAKhUoaUnUZT+tLlQ85V
 HCKOLD95GKr/J6a9W9kT7+bw4wfYXz+P0HfyleOVb1e518/P6KIH871ZRKFc9wO3KyRo
 7JqZGHlF2wgQotpwOGM5Ydnv52EeoUnRHzJJ8q7P06Cjv/W6liSyvqEdTReo5AebwVBy
 Z2Mw==
X-Gm-Message-State: AOJu0YwVOiCP0ac9XMDWGu4mujlicUQvdBNrxVPzyGBlpU8an1seF7NC
 MxOsrznapCMG00rLd2j0XYc8gA==
X-Google-Smtp-Source: AGHT+IFdwE61xShdX8TnjOLD8LIRwIy2pr+JhEA/00mbh/w33+w+Pu4N+f+Utr25rli38cwVp7jhIw==
X-Received: by 2002:a05:6a20:7f9e:b0:140:c838:2b2e with SMTP id
 d30-20020a056a207f9e00b00140c8382b2emr8605045pzj.22.1698264473463; 
 Wed, 25 Oct 2023 13:07:53 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 f1-20020aa79681000000b0068fe7c4148fsm9696768pfk.57.2023.10.25.13.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 13:07:53 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v4 05/13] hw/riscv/virt-acpi-build.c: Add AIA support in RINTC
Date: Thu, 26 Oct 2023 01:37:05 +0530
Message-Id: <20231025200713.580814-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025200713.580814-1-sunilvl@ventanamicro.com>
References: <20231025200713.580814-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Acked-by: Alistair Francis <alistair.francis@wdc.com>
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
2.39.2


