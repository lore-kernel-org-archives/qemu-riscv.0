Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXezi-0004Fw-OE
	for mharc-qemu-riscv@gnu.org; Thu, 02 Mar 2023 04:12:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pXezg-00048Q-S6
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 04:12:56 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pXezV-0004RT-H8
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 04:12:56 -0500
Received: by mail-pj1-x1034.google.com with SMTP id x34so16222081pjj.0
 for <qemu-riscv@nongnu.org>; Thu, 02 Mar 2023 01:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2k4EXZKfQUKA+NFhqy+UgqQ7W6/Y203zszftUQA0Hjw=;
 b=h87oX/ekfJ9iK/ipdQy9zc7uFxS5dRBSQxs0Wq2nnyob295Ujz1fF68NnXfc30Q2XW
 e4UKDjBeGNjVBAXLH0SH66tja4uvzN/pqNePHffOMkSa/atk9MiyItRp9oU/VhxrxULb
 z5PoBlFPld39Gadt7uvPlu0q6DDmzGUV0sORpFfrRf97OjYb9kgVdwgLMl+hCnoA00eO
 b6t5I3WoIQPtP9AnKon2ppUr0p06O2vqk72GjSPyNE4ms1eHz0WYAbDhB7s0wrTN65EK
 C87acKkw024Oo3duSiCEJ5c/oGLIS71dWNZ1NLHNABANmCwYpQtBk98GLe8CWDSubznm
 K+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2k4EXZKfQUKA+NFhqy+UgqQ7W6/Y203zszftUQA0Hjw=;
 b=EAyhFoxrzwWgtEqmX9QgElyWcoG0OA0UO9mcn7LwbnHrSIuPK2NZecOvFThPXfZVh0
 J/e+FVOJmc8gZ+lrL39sPFr2TlWtsFh7rFvkq/JL1QB0y6ULK08cJHykVehMNcxi+6S9
 h4Z7fXWvPwOQTmjFWrv4I4JytLz2RKK2QgXiS4mAbH4R59pxGU0dN5L326bGPDdXeIWz
 hNVo1IuIe9uFnkxQgPFCRDxbnY8L+r53XKWv1e6rzJaXLMG1Z5YmucXCIuI8LvoYqFXX
 KPQXxNHzy4+PkM4aTwINyJVHhZD6XlOLzEp8tbgrJC2PTEYQuNlsDng3GzN0J5vWUPXl
 vNbw==
X-Gm-Message-State: AO0yUKX7bXYfvwIgsfIpXDNPclOu3MpaJCFRKYNAjsfELqzrjYeT82vD
 ISu2sQW8wnJ3gFgiZfxjsB9pGfei2gkF9yvm
X-Google-Smtp-Source: AK7set8qy+aF7qVMAMUuqo+AMtp/+n4JB6S1Ncue+t4lBKAPSmvBkZhpNuMHEe+cHU44PvqYgbWX2w==
X-Received: by 2002:a17:90b:350c:b0:22b:f622:56ae with SMTP id
 ls12-20020a17090b350c00b0022bf62256aemr10625486pjb.23.1677748364435; 
 Thu, 02 Mar 2023 01:12:44 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
 by smtp.gmail.com with ESMTPSA id
 iz12-20020a170902ef8c00b0019945535973sm9850692plb.63.2023.03.02.01.12.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 01:12:44 -0800 (PST)
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
Subject: [PATCH V5 5/8] hw/riscv/virt: virt-acpi-build.c: Add RINTC in MADT
Date: Thu,  2 Mar 2023 14:42:09 +0530
Message-Id: <20230302091212.999767-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230302091212.999767-1-sunilvl@ventanamicro.com>
References: <20230302091212.999767-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1034.google.com
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
X-List-Received-Date: Thu, 02 Mar 2023 09:12:57 -0000

Add Multiple APIC Description Table (MADT) with the
RINTC structure for each cpu.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 hw/riscv/virt-acpi-build.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index d6947fdc74..026d1eaf88 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -32,6 +32,7 @@
 #include "sysemu/reset.h"
 #include "migration/vmstate.h"
 #include "hw/riscv/virt.h"
+#include "hw/riscv/numa.h"
 
 #define ACPI_BUILD_TABLE_SIZE             0x20000
 
@@ -160,6 +161,36 @@ static void build_dsdt(GArray *table_data,
     free_aml_allocator();
 }
 
+/*
+ * ACPI spec, Revision 6.5+
+ * 5.2.12 Multiple APIC Description Table (MADT)
+ * REF: https://github.com/riscv-non-isa/riscv-acpi/issues/15
+ *      https://drive.google.com/file/d/1R6k4MshhN3WTT-hwqAquu5nX6xSEqK2l/view
+ */
+static void build_madt(GArray *table_data,
+                       BIOSLinker *linker,
+                       RISCVVirtState *s)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(s);
+    MachineState *ms = MACHINE(s);
+    const CPUArchIdList *arch_ids = mc->possible_cpu_arch_ids(ms);
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
+    for (int i = 0; i < arch_ids->len; i++) {
+        riscv_acpi_madt_add_rintc(i, arch_ids, table_data);
+    }
+
+    acpi_table_end(linker, &table);
+}
+
 static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
 {
     GArray *table_offsets;
@@ -181,6 +212,9 @@ static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
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


