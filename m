Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pShKT-0004lZ-9j
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 11:41:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pShKR-0004hp-Cz
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 11:41:51 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pShKP-0000Y0-NI
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 11:41:51 -0500
Received: by mail-pl1-x633.google.com with SMTP id c11so1841582ple.9
 for <qemu-riscv@nongnu.org>; Thu, 16 Feb 2023 08:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bQDU46N3rDTzLn5FXJmqO5LODOp0HEKx8SmnOWYr7Ew=;
 b=CoZVnyNqRTKC8FLFL4xIKQpERcuj+6Mv7psJ+nz9lxfCHif6ksW3olhIxO/GF4NNSI
 BDVjidZ2jCmgnlHcgr+rfb+Q8dReZp9JurV2ahqDSu6XJriVmojL+tbrTzV5baz6rvsy
 UwnqMkRVv+NY9Q0yCnYeoZV9evAiwPRAqn/NKNkToJTTTR6dGD4qIveL8YlO4jAi0qEA
 WYP096tj0l8GK+Xsn9FgBDVyiAkc1+C5U5E7qaQfCkC5UlgZDDoR3EFguWBabpBEPhNb
 tIMIB5zkkxuhXbQBhqkALkR6426jr+MFwEy0BG5ABia+6UZHR37kN9p3Fe4JP5up+FaS
 rxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bQDU46N3rDTzLn5FXJmqO5LODOp0HEKx8SmnOWYr7Ew=;
 b=PNgzTrS29jcpwaH+Qy4VqBi84IlnmvbL8T+YxEyianmUn4BBjGIN56LV2K4SIiXdq3
 VBMuM6yQUui2JM/pioNi4CC6lOIWfi/+J+8tRAaXK/sxOix9qevhIcdscTc5kR+/dKJb
 Cna6vCb6yJM8cr2zf5x2St+UVqMoLcyRZQnPCj0kTlW68MYRnn0KOk8rquI/D9GDlkma
 kX8Vz7OCDh2G6DvfR+gdgj6t5Bvrgtw7SH4DGwVg2T9hyzi9PtPIU1c7OJ0ymZyWrSoF
 FVNCQ39F0XHkZ6mocOqsqQgVwcvMFis7Ga0uTn8LPKGCTayX4FaTcMVDfRy6mZZFq3FW
 GihA==
X-Gm-Message-State: AO0yUKXmdV/S6EQiLBbmubQcoQK6+jC1MNCLpEwvzBOPjCIwOHfUlZxZ
 z+MzqxatRwCJmhGKkX/NdGwgHw==
X-Google-Smtp-Source: AK7set84VREEjcdDuUNQcbugCCNTp8hPZr+uU0qorCW5LXD66vjEDZTf0Cy6TgfLyA3hkv4FRPx8TA==
X-Received: by 2002:a05:6a20:468a:b0:c7:40a1:ac1b with SMTP id
 el10-20020a056a20468a00b000c740a1ac1bmr1116232pzb.50.1676565708490; 
 Thu, 16 Feb 2023 08:41:48 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 q20-20020a638c54000000b004fbd10af99asm1385243pgn.60.2023.02.16.08.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 08:41:48 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH V3 5/8] hw/riscv/virt: virt-acpi-build.c: Add RINTC in MADT
Date: Thu, 16 Feb 2023 22:11:22 +0530
Message-Id: <20230216164125.1945633-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216164125.1945633-1-sunilvl@ventanamicro.com>
References: <20230216164125.1945633-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 16 Feb 2023 16:41:51 -0000

Add Multiple APIC Description Table (MADT) with the
RINTC structure for each cpu.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt-acpi-build.c | 44 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 30af974db3..58e49cd6d6 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -32,6 +32,7 @@
 #include "sysemu/reset.h"
 #include "migration/vmstate.h"
 #include "hw/riscv/virt.h"
+#include "hw/riscv/numa.h"
 
 #define ACPI_BUILD_TABLE_SIZE             0x20000
 
@@ -123,6 +124,46 @@ static void build_dsdt(GArray *table_data,
     free_aml_allocator();
 }
 
+/* MADT */
+static void build_madt(GArray *table_data,
+                       BIOSLinker *linker,
+                       RISCVVirtState *s)
+{
+    MachineState *ms = MACHINE(s);
+    int socket;
+    uint16_t base_hartid = 0;
+    uint32_t cpu_id = 0;
+
+    AcpiTable table = { .sig = "APIC", .rev = 6, .oem_id = s->oem_id,
+                        .oem_table_id = s->oem_table_id };
+
+    acpi_table_begin(&table, table_data);
+    /* Local Interrupt Controller Address */
+    build_append_int_noprefix(table_data, 0, 4);
+    build_append_int_noprefix(table_data, 0, 4);   /* MADT Flags */
+
+    /* RISC-V Local INTC structures per HART */
+    for (socket = 0; socket < riscv_socket_count(ms); socket++) {
+        base_hartid = riscv_socket_first_hartid(ms, socket);
+
+        for (int i = 0; i < s->soc[socket].num_harts; i++) {
+            build_append_int_noprefix(table_data, 0x18, 1);    /* Type     */
+            build_append_int_noprefix(table_data, 20, 1);      /* Length   */
+            build_append_int_noprefix(table_data, 1, 1);       /* Version  */
+            build_append_int_noprefix(table_data, 0, 1);       /* Reserved */
+            build_append_int_noprefix(table_data, 1, 4);       /* Flags    */
+            build_append_int_noprefix(table_data,
+                                      (base_hartid + i), 8);   /* Hart ID  */
+
+            /* ACPI Processor UID  */
+            build_append_int_noprefix(table_data, cpu_id, 4);
+            cpu_id++;
+        }
+    }
+
+    acpi_table_end(linker, &table);
+}
+
 static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
 {
     GArray *table_offsets;
@@ -144,6 +185,9 @@ static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
     acpi_add_table(table_offsets, tables_blob);
     build_fadt_rev6(tables_blob, tables->linker, s, dsdt);
 
+    acpi_add_table(table_offsets, tables_blob);
+    build_madt(tables_blob, tables->linker, s);
+
     /* XSDT is pointed to by RSDP */
     xsdt = tables_blob->len;
     build_xsdt(tables_blob, tables->linker, table_offsets, s->oem_id,
-- 
2.34.1


