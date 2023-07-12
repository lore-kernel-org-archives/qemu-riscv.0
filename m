Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF43C0015E
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 16:41:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJct5-0003tG-1o; Wed, 12 Jul 2023 12:40:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qJct3-0003qP-56
 for qemu-riscv@nongnu.org; Wed, 12 Jul 2023 12:40:21 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qJcsz-0004sL-Mb
 for qemu-riscv@nongnu.org; Wed, 12 Jul 2023 12:40:20 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-676f16e0bc4so3674995b3a.0
 for <qemu-riscv@nongnu.org>; Wed, 12 Jul 2023 09:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689180016; x=1691772016;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bh60Vfa7c0ALWIBNvXtT4zqySt4tjrvVx0bFSlWzeX4=;
 b=Fu6X1wWNWNvgAgNOt6s4+QNMukI+Drt8ZF39hQtiLQZqTKBKqFKkK2auYzX4MflB1n
 u3vOTuk9tIwMu/2EAvohUDdkvpus25kjaIZFrCP1uMA0FyQcCK23WSm6QPSTIALK9Vgl
 XPALtS7ppAGqZv3iQ2nasVIGk0XtGqw/YvT1/zaF5SJnGNlOnAvb+/exx4SyjxdcTxOP
 UvhtjawE/UIhaxpx7S8o2zgE4xFtSN3JV5xc7UQRuU8sEgzjva66odKrDwM51/3I/eae
 MKMMhFOEZlt15sNrcpn2Z70cjHeZzvUIrEnusD24+BBm2yizZ/kYI7zp2/4sGa0Tm7aK
 POog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689180016; x=1691772016;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bh60Vfa7c0ALWIBNvXtT4zqySt4tjrvVx0bFSlWzeX4=;
 b=JqYfvqv//2IGVLi9LAk+naLZRMAiLB+BWwCyu+fzUpqjemXrKzS16tWEJF8taNxsXX
 ffGccNnTGEN1n/OR0V0fpN1PBtKCTQqKhl3+DHTg9SPrjvkjEMLo3ovqCM89KB5Lc/AF
 g4Umvv93DczxPReH5ecOXGkCxwTv13AeIQzLCgLgFMafMS4uW0ZGaNZJ42N0H+SElQKn
 wmGpsFEdDjkT8QnrvkNyEJO/eGfF3cot/2E7Pk1UjEmRtYJlJrt05nZDYGwQIBArpsyv
 1xBtnfkkJW2vfPt5foINnW9vxfRgbLCjGZCAOfEcYqw4Cx88L9gqgw/7TwYYiqlMRJKI
 wRsg==
X-Gm-Message-State: ABy/qLYAgWEzxwKxsyN6Rn3yagzb44YnK1y025jWKfp6RfgESOyRF1O/
 eDWWP+cELMxcwpV9QZAIMtItFw==
X-Google-Smtp-Source: APBJJlGIbXhs4LtDCE2ejp+1zhE1AZctW2FPtBam3lABGBtGswCGWOnKV6oGtH9tX/XEzcSZCroOkA==
X-Received: by 2002:a05:6a20:5489:b0:10b:f590:5a1f with SMTP id
 i9-20020a056a20548900b0010bf5905a1fmr20782723pzk.0.1689180015445; 
 Wed, 12 Jul 2023 09:40:15 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.25])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a1709027d9200b001ac7f583f72sm4172824plm.209.2023.07.12.09.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 09:40:15 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 05/10] hw/riscv/virt-acpi-build.c: Add AIA support in RINTC
Date: Wed, 12 Jul 2023 22:09:38 +0530
Message-Id: <20230712163943.98994-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712163943.98994-1-sunilvl@ventanamicro.com>
References: <20230712163943.98994-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
---
 hw/riscv/virt-acpi-build.c | 66 +++++++++++++++++++++++++++++++++++---
 1 file changed, 62 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 01843e4509..12b8ef0352 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -37,6 +37,7 @@
 #include "hw/intc/riscv_aclint.h"
 
 #define ACPI_BUILD_TABLE_SIZE             0x20000
+#define ACPI_BUILD_INTC_ID(socket, index) ((socket << 24) | (index))
 
 typedef struct AcpiBuildState {
     /* Copy of table in RAM (for patching) */
@@ -57,18 +58,42 @@ static void acpi_align_size(GArray *blob, unsigned align)
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
@@ -76,6 +101,11 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
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
@@ -86,8 +116,19 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
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
@@ -226,6 +267,7 @@ static void build_dsdt(GArray *table_data,
  * 5.2.12 Multiple APIC Description Table (MADT)
  * REF: https://github.com/riscv-non-isa/riscv-acpi/issues/15
  *      https://drive.google.com/file/d/1R6k4MshhN3WTT-hwqAquu5nX6xSEqK2l/view
+ *      https://drive.google.com/file/d/1oMGPyOD58JaPgMl1pKasT-VKsIKia7zR/view
  */
 static void build_madt(GArray *table_data,
                        BIOSLinker *linker,
@@ -234,6 +276,12 @@ static void build_madt(GArray *table_data,
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
@@ -245,7 +293,17 @@ static void build_madt(GArray *table_data,
 
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


