Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRa0u-0006Ci-Tz
	for mharc-qemu-riscv@gnu.org; Mon, 13 Feb 2023 09:41:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pRa0t-00069q-NW
 for qemu-riscv@nongnu.org; Mon, 13 Feb 2023 09:41:03 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pRa0s-0005Ta-45
 for qemu-riscv@nongnu.org; Mon, 13 Feb 2023 09:41:03 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 bt4-20020a17090af00400b002341621377cso1288570pjb.2
 for <qemu-riscv@nongnu.org>; Mon, 13 Feb 2023 06:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+3u0RokfiHf27XjD4i6Mx9oLVxpDXWFhjR84GcrrvHM=;
 b=UPv4RYOOVUFFCqH6R2CFWZeZZJ5ak7b2ts0HBQkYy1ovG1d8xArloXyE+v74Lj1wpA
 tXoXzZ4rt9eRyjaZEf6PVds3OPawuX35jrNKPStS2F0NvNbWVRnLlRLL11hZSgeLiI6k
 H3+SWsCcdQvW9hRq+SyMSF55Dq/E12g7WcTJHJdnt7Tk0oDrwlqrGx4YcpJo2XeMStHZ
 N21qr2qJ+001RkZstpf86IT3vRxOJ4E+oytlDtmfzN1jZWX8g8rNFjFBIT417UOErGge
 qP/gB9IszyweyJxNGt502+G7OhrDbAoTo38NbPb6NJQBxWZK/RAZK0MMPilMLbTfzR/F
 +aoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+3u0RokfiHf27XjD4i6Mx9oLVxpDXWFhjR84GcrrvHM=;
 b=nE0V1VwpzuWrGRKtjc+gqUU05cTmKt4vEHnaopHCajIJn1O4S6KotXUc5YTRGEET8k
 Aqp2hHTv83znKtgjDp5xonHpJez3aW0TQeioRJF06UB+Ges++n+PG0tMb07J1MTFTEX1
 8/4L+O1epm1sndhitP4DYBvhq7f56+OQd6dbcIsq2s8L2okgTJ5rXfELoCgGVfD0boqq
 5g/7XkrNRzD9leJ42pwuwrw2JcI9TGP6eoqSmh1Zlal3Ne9+NSiGjUN08RhZRBcSHx+J
 K6TWIyf9rlGoadKOk/H6T9V2Bq2bScVuL2jCsxfXNtFAMt4+l884WQ8ET7rRufXFZ0ab
 Enig==
X-Gm-Message-State: AO0yUKV9jvvMr6HeFht5JuXDQeY5TyRNistmRLbGf6n/PT73YNYm9Wl3
 r8stDepmkeAVwrXnvK4bSiHxcw==
X-Google-Smtp-Source: AK7set9D8UV7qg4n5sPlhULf2l54VjAcJ7V3uYyXRkoYOcBy/YFitdVFOPVxvPWaTX/A3WjtoP5mnw==
X-Received: by 2002:a05:6a21:6713:b0:be:ec6e:6470 with SMTP id
 wh19-20020a056a21671300b000beec6e6470mr18945116pzb.22.1676299260949; 
 Mon, 13 Feb 2023 06:41:00 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 y23-20020a63de57000000b004fb8732a2f9sm3777757pgi.88.2023.02.13.06.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 06:41:00 -0800 (PST)
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
Subject: [PATCH V2 05/10] hw/riscv/virt: virt-acpi-build.c: Add RINTC in MADT
Date: Mon, 13 Feb 2023 20:10:33 +0530
Message-Id: <20230213144038.2547584-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
References: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1033.google.com
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
X-List-Received-Date: Mon, 13 Feb 2023 14:41:03 -0000

Add Multiple APIC Description Table (MADT) with the
INTC structure for each cpu.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt-acpi-build.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 3c4da6c385..f54e3fb731 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -134,6 +134,43 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, RISCVVirtState *s)
     free_aml_allocator();
 }
 
+/* MADT */
+static void
+build_madt(GArray *table_data, BIOSLinker *linker, RISCVVirtState *s)
+{
+    MachineState *mc = MACHINE(s);
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
+    for (socket = 0; socket < riscv_socket_count(mc); socket++) {
+        base_hartid = riscv_socket_first_hartid(mc, socket);
+
+        for (int i = 0; i < s->soc[socket].num_harts; i++) {
+            build_append_int_noprefix(table_data, 0x18, 1);    /* Type     */
+            build_append_int_noprefix(table_data, 20, 1);      /* Length   */
+            build_append_int_noprefix(table_data, 1, 1);       /* Version  */
+            build_append_int_noprefix(table_data, 0, 1);       /* Reserved */
+            build_append_int_noprefix(table_data, 1, 4);       /* Flags    */
+            build_append_int_noprefix(table_data,
+                                      (base_hartid + i), 8);   /* hartid   */
+            build_append_int_noprefix(table_data, cpu_id, 4);  /* ACPI ID  */
+            cpu_id++;
+        }
+    }
+
+    acpi_table_end(linker, &table);
+}
+
 static void
 virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
 {
-- 
2.34.1


