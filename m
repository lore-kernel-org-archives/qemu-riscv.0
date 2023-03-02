Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXezl-0004JH-3w
	for mharc-qemu-riscv@gnu.org; Thu, 02 Mar 2023 04:13:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pXezj-0004Hh-OV
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 04:12:59 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pXezh-0006PO-H2
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 04:12:59 -0500
Received: by mail-pl1-x636.google.com with SMTP id z2so16831286plf.12
 for <qemu-riscv@nongnu.org>; Thu, 02 Mar 2023 01:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nuyTRWn/HlJGxmjclNYs5gw13EaqAWEYeHjzcNKvwTE=;
 b=SdiMrXDc0NvwpySHFYhgygmfMkyGqiOSdVLRaz3cogyZVSnykE9E4SmqJJZc4Hq4yd
 TTDHs4XKXJnF01Uukcj5fIF5hfP6uCQuoAKmJwOA/0f/E1KV/1A/0EJ9eaMpaZw6cYDa
 mf5FDJPZRXGepP/cu3ubvjtyQrNMPHbiCx0dNKZ1iIISd+lYFCoPCFscFcLFN1A+BosT
 FMGlptbVcKLdlRTaHybT3HTap5pXX6Q296yoflK9tbdl6UJum/57FRUlBAvl0wGfoSYl
 bJWe3vt6fyeO7NRjev24ZxDJDa4Wka23wTXJz7Q/r7ZdEIKAdA6AQ26OSPjle+8aiVz9
 0XUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nuyTRWn/HlJGxmjclNYs5gw13EaqAWEYeHjzcNKvwTE=;
 b=ddiDgjmnxwtB1GauTQxO+kKTZP+ZSsjPk5SWW/YDJWSoCUxd9JWke/opmQY2Y90GG1
 IcvA7lt3MjJj2n13Q0OJIJR1x7RY0vG2/GISm6dElogc7qgK/zP318RFlXq+b0hHlisM
 UnX97OrIwCJnotlHI+1Q/d5ZfQvreNa3WV9OWTE02RAL96BAYXoO/3MyF4Iis0ue5nfW
 1UgssOL+VR99+3IANs84zgebjlzzczgyHon5ma8HrGtk3+x54eehf2a26VW56NU3w+qK
 9CLjhiLYHb8jwwDtDTuHm0i19/0hO/ws1lWaECPDFe9WavBA1rb0qt/BJ52KrJtyQbF+
 s8jg==
X-Gm-Message-State: AO0yUKUfprIoQjiiFW4dtsohT6ehW6NSegvm2AFQeMXaiwB16w/M08bH
 Yt8SwcSWpRNNpSYfXTN/DKnx14ScyNkOfrJ7
X-Google-Smtp-Source: AK7set+/LXaMm3i4fxEauETbJWnJcAIYYwX+6QDJLrueOb9WEcCnA4/nkWrNUZgtCk+4n5TJZLimeA==
X-Received: by 2002:a17:902:a513:b0:19d:6f7:70d2 with SMTP id
 s19-20020a170902a51300b0019d06f770d2mr7340599plq.50.1677748368510; 
 Thu, 02 Mar 2023 01:12:48 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
 by smtp.gmail.com with ESMTPSA id
 iz12-20020a170902ef8c00b0019945535973sm9850692plb.63.2023.03.02.01.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 01:12:48 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Igor Mammedov <imammedo@redhat.com>, Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH V5 6/8] hw/riscv/virt: virt-acpi-build.c: Add RHCT Table
Date: Thu,  2 Mar 2023 14:42:10 +0530
Message-Id: <20230302091212.999767-7-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230302091212.999767-1-sunilvl@ventanamicro.com>
References: <20230302091212.999767-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x636.google.com
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
X-List-Received-Date: Thu, 02 Mar 2023 09:13:00 -0000

RISC-V ACPI platforms need to provide RISC-V Hart Capabilities
Table (RHCT). Add this to the ACPI tables.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 hw/riscv/virt-acpi-build.c | 78 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 026d1eaf88..82da0a238c 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -33,6 +33,7 @@
 #include "migration/vmstate.h"
 #include "hw/riscv/virt.h"
 #include "hw/riscv/numa.h"
+#include "hw/intc/riscv_aclint.h"
 
 #define ACPI_BUILD_TABLE_SIZE             0x20000
 
@@ -111,6 +112,80 @@ static void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap)
     aml_append(scope, dev);
 }
 
+/* RHCT Node[N] starts at offset 56 */
+#define RHCT_NODE_ARRAY_OFFSET 56
+
+/*
+ * ACPI spec, Revision 6.5+
+ * 5.2.36 RISC-V Hart Capabilities Table (RHCT)
+ * REF: https://github.com/riscv-non-isa/riscv-acpi/issues/16
+ *      https://drive.google.com/file/d/1nP3nFiH4jkPMp6COOxP6123DCZKR-tia/view
+ */
+static void build_rhct(GArray *table_data,
+                       BIOSLinker *linker,
+                       RISCVVirtState *s)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(s);
+    MachineState *ms = MACHINE(s);
+    const CPUArchIdList *arch_ids = mc->possible_cpu_arch_ids(ms);
+    size_t len, aligned_len;
+    uint32_t isa_offset, num_rhct_nodes;
+    RISCVCPU *cpu;
+    char *isa;
+
+    AcpiTable table = { .sig = "RHCT", .rev = 1, .oem_id = s->oem_id,
+                        .oem_table_id = s->oem_table_id };
+
+    acpi_table_begin(&table, table_data);
+
+    build_append_int_noprefix(table_data, 0x0, 4);   /* Reserved */
+
+    /* Time Base Frequency */
+    build_append_int_noprefix(table_data,
+                              RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, 8);
+
+    /* ISA + N hart info */
+    num_rhct_nodes = 1 + ms->smp.cpus;
+
+    /* Number of RHCT nodes*/
+    build_append_int_noprefix(table_data, num_rhct_nodes, 4);
+
+    /* Offset to the RHCT node array */
+    build_append_int_noprefix(table_data, RHCT_NODE_ARRAY_OFFSET, 4);
+
+    /* ISA String Node */
+    isa_offset = table_data->len - table.table_offset;
+    build_append_int_noprefix(table_data, 0, 2);   /* Type 0 */
+
+    cpu = &s->soc[0].harts[0];
+    isa = riscv_isa_string(cpu);
+    len = 8 + strlen(isa) + 1;
+    aligned_len = (len % 2) ? (len + 1) : len;
+
+    build_append_int_noprefix(table_data, aligned_len, 2);   /* Length */
+    build_append_int_noprefix(table_data, 0x1, 2);           /* Revision */
+
+    /* ISA string length including NUL */
+    build_append_int_noprefix(table_data, strlen(isa) + 1, 2);
+    g_array_append_vals(table_data, isa, strlen(isa) + 1);   /* ISA string */
+
+    if (aligned_len != len) {
+        build_append_int_noprefix(table_data, 0x0, 1);   /* Optional Padding */
+    }
+
+    /* Hart Info Node */
+    for (int i = 0; i < arch_ids->len; i++) {
+        build_append_int_noprefix(table_data, 0xFFFF, 2);  /* Type */
+        build_append_int_noprefix(table_data, 16, 2);      /* Length */
+        build_append_int_noprefix(table_data, 0x1, 2);     /* Revision */
+        build_append_int_noprefix(table_data, 1, 2);    /* Number of offsets */
+        build_append_int_noprefix(table_data, i, 4);    /* ACPI Processor UID */
+        build_append_int_noprefix(table_data, isa_offset, 4); /* Offsets[0] */
+    }
+
+    acpi_table_end(linker, &table);
+}
+
 /* FADT */
 static void build_fadt_rev6(GArray *table_data,
                             BIOSLinker *linker,
@@ -215,6 +290,9 @@ static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
     acpi_add_table(table_offsets, tables_blob);
     build_madt(tables_blob, tables->linker, s);
 
+    acpi_add_table(table_offsets, tables_blob);
+    build_rhct(tables_blob, tables->linker, s);
+
     /* XSDT is pointed to by RSDP */
     xsdt = tables_blob->len;
     build_xsdt(tables_blob, tables->linker, table_offsets, s->oem_id,
-- 
2.34.1


