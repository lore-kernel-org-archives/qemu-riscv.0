Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZIx5-0007hT-7g
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 17:05:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIx2-0007QW-K7
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 17:05:00 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwq-0006of-OD
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 17:04:51 -0500
Received: by mail-pl1-x62d.google.com with SMTP id n6so12091994plf.5
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 14:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678140287;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nEG+8tKpC0mKLiolqDAAgKmMAgJCfr+M8A7Oq6yedtk=;
 b=Q9g++BtxOMjrKJ6ZqeWXxtjVWAhfMrL9IA9K7H1saByIVecmlEpSD+9/cROWNpzz3v
 9lw/xI6WE/5FLRX84hGv1HB7vOc1pJRbLjvGiKKHe3j0BLI1SitKI875rlRoHp3dZ93g
 3eNr/NnyTvm7bVA3P5smzqUe0ZbyoWYAVqut+6eVKsFPQ+wCgsle6qP1Z6c9lLGJReEV
 2YJsaCimZABp/8M9PqiOL1IEvlajnybjG0zPjAiaHz4cgerJUd8fmccW99HfAGiBFPoy
 zr4gkDl52LLYhKvrW6aeGRLbuLsWqwApJ9W7m0O4UWAxdbJL8iH8K5RsXSLKcYnvknYr
 y1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678140287;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nEG+8tKpC0mKLiolqDAAgKmMAgJCfr+M8A7Oq6yedtk=;
 b=wP2uMWnQ6OIlmVNZSlzJWVjsYZfZa0ZSEr0oCyYUCXqZUhIyL1xPIQe7/viPT6j/Mg
 3+atgaEKzOduuKTV3Ar7bkkcur8sudOYHdjDmj7KPYq0z0fRZfkiHXxNbjM10063DsM2
 BFO3+di9yvNiZ0kLYcwTBz9Rhum0yCKMs4H5PGWE5kQGHNKYvVEHnyjxjm0JMrndLbT+
 MdcDvWDXShF8jmDl7Upllg5XuCdVqO21Obkgv0cT8vxB3ycQ1dplIVJAP6evWoMQtPzS
 Lm37d4pcy2DsRKqLZcdLAvnIivv1KEGQx5g5BcE0f/+SlPBZdKXyiexF4JnReuLo4IPn
 yp6Q==
X-Gm-Message-State: AO0yUKU2HeWh4JjTVe17jVBCRgLhuSxxJdlFyA3kRDXJwywwnaBpLOtI
 RmiiphBGiiX9v5Iz5ciAYrO9iw3StuoyJ5jID3I=
X-Google-Smtp-Source: AK7set836ArEa8FSoQWZ/YyDL937N+Kyye7CTOct9/zDn51HOGvQqAVt8041QYp/oMBXBsn8xBk4lw==
X-Received: by 2002:a17:902:b488:b0:19d:19fb:55ec with SMTP id
 y8-20020a170902b48800b0019d19fb55ecmr10137013plr.6.1678140287389; 
 Mon, 06 Mar 2023 14:04:47 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 s18-20020a17090302d200b0019e665b24dfsm7295464plk.1.2023.03.06.14.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 14:04:47 -0800 (PST)
Subject: [PULL 20/22] hw/riscv/virt: virt-acpi-build.c: Add RHCT Table
Date: Mon,  6 Mar 2023 14:02:57 -0800
Message-Id: <20230306220259.7748-21-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306220259.7748-1-palmer@rivosinc.com>
References: <20230306220259.7748-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Sunil V L <sunilvl@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 06 Mar 2023 22:05:01 -0000

From: Sunil V L <sunilvl@ventanamicro.com>

RISC-V ACPI platforms need to provide RISC-V Hart Capabilities
Table (RHCT). Add this to the ACPI tables.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Message-ID: <20230302091212.999767-7-sunilvl@ventanamicro.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
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
2.39.2


