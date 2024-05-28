Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022A7C25B78
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 May 2024 07:31:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sBrIp-0003cf-2n; Tue, 28 May 2024 03:31:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sBrIn-0003bj-TP
 for qemu-riscv@nongnu.org; Tue, 28 May 2024 03:31:21 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sBrIm-0001eb-9q
 for qemu-riscv@nongnu.org; Tue, 28 May 2024 03:31:21 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6f8ea3e9543so346178b3a.2
 for <qemu-riscv@nongnu.org>; Tue, 28 May 2024 00:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1716881479; x=1717486279; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U1C+cXXjZTBdG34i2THVAeaMfMT5wPu2gPry985wW58=;
 b=pgeKSql60m9P1zbaI/zWZjJujlFu8lghZlNsHlcddWA1/s2w597a/n7mmI5g0kDfZZ
 UQgglSLy9xNdwqfPfZJ2aEk6kHB6JCHofKJ1Qgjfnik3qeV+yXqxbTj+kf8Eol5pgH91
 pDeDeiBQ3vE0k7xLUG3UEw+7LRhtePdE4073hkGvs096z/sLnMhRTKFrBe0JGDAwLsW3
 dsJlggka9w22NIlZzr4Mk3o8kOIGRYw4TKjwHaSbBkWMI9h3X7u4yk6VbxXvt6G0d+Q+
 OHMvoy4ocwB6F0wEHZ552+3aWlEEFwEkz+Ne/8mwhpyIX1FyQbrBpCiicpKaS2MJ3KIK
 2EUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716881479; x=1717486279;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U1C+cXXjZTBdG34i2THVAeaMfMT5wPu2gPry985wW58=;
 b=XlFL+rVTD5Nqk7tvXKvBKeEq3pdFyv+orHp5Q3CDfAKA0dNzFUjRXwGyMQlaWPFik2
 uKHilpw4Wx2ORhEIMahDq1ntuI2h1e1UnoLHWcb9znBBfAl8y6kUQ1MT3ma0x/b7C7Cv
 wngOxkhHVEw8xIefdu+cveFnVv76c3qiIZZBvqGjkeM6QVNK3FraheSTZ6yDjXUoEYol
 Uha2dH9iHESE1mwooaelLe27O+mzAWeNwqzh6qKMdGATRv0mpz7tmByWneC+LbFHoIhN
 X75nSTgq+vf43+HoDryXPjEifR7NnIMIEjr44reeErijN7xgmHvfglNA1UYWioV+KOiR
 DXOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsvOY5nRKcp3+ghQPLc1T7V3Gdl5PTJJGRvtBjOwpCV8FyBwr9qpjkidzzFEsnXQjPctyAmqKam/4nndiqgEnFQEdmlwA=
X-Gm-Message-State: AOJu0Yw7kwyFXRNk2mQP06604bzRqNyLaIVJXXFFr4q8ebctKu7Anp8Z
 69x+Y2InyCa4DzcEV0uYtxCgmFf+exmTYePS7w+Wf/9sDtgGK5mlKNGrvj1expc=
X-Google-Smtp-Source: AGHT+IGC+C/jnVXPXbn7EPctvy3oeDf6LPx7fOANzHa7O8iZTJMRogUuyTO6E6mnsNWkjRaOQl4EwA==
X-Received: by 2002:a05:6a00:1f12:b0:6f6:7c6a:2c14 with SMTP id
 d2e1a72fcca58-6f8f2c56e53mr11720460b3a.4.1716881478728; 
 Tue, 28 May 2024 00:31:18 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.31])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fd4d51a2sm5881080b3a.189.2024.05.28.00.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 00:31:18 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 2/3] hw/riscv/virt-acpi-build.c: Add namespace devices for
 PLIC and APLIC
Date: Tue, 28 May 2024 13:01:02 +0530
Message-Id: <20240528073103.1075812-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240528073103.1075812-1-sunilvl@ventanamicro.com>
References: <20240528073103.1075812-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

PLIC and APLIC should be in namespace as well. So, add them using the
defined HID.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/riscv/virt-acpi-build.c | 47 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 832a3acb8d..47ec78e432 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -141,6 +141,52 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
     }
 }
 
+static void acpi_dsdt_add_plic_aplic(Aml *scope, RISCVVirtState *s)
+{
+    MachineState *ms = MACHINE(s);
+    uint64_t plic_aplic_addr;
+    uint32_t gsi_base;
+    uint8_t  socket;
+
+    if (s->aia_type == VIRT_AIA_TYPE_NONE) {
+        /* PLICs */
+        for (socket = 0; socket < riscv_socket_count(ms); socket++) {
+            plic_aplic_addr = s->memmap[VIRT_PLIC].base +
+                         s->memmap[VIRT_PLIC].size * socket;
+            gsi_base = VIRT_IRQCHIP_NUM_SOURCES * socket;
+            Aml *dev = aml_device("IC%.02X", socket);
+            aml_append(dev, aml_name_decl("_HID", aml_string("RSCV0001")));
+            aml_append(dev, aml_name_decl("_UID", aml_int(socket)));
+            aml_append(dev, aml_name_decl("_GSB", aml_int(gsi_base)));
+
+            Aml *crs = aml_resource_template();
+            aml_append(crs, aml_memory32_fixed(plic_aplic_addr,
+                                               s->memmap[VIRT_PLIC].size,
+                                               AML_READ_WRITE));
+            aml_append(dev, aml_name_decl("_CRS", crs));
+            aml_append(scope, dev);
+        }
+    } else {
+        /* APLICs */
+        for (socket = 0; socket < riscv_socket_count(ms); socket++) {
+            plic_aplic_addr = s->memmap[VIRT_APLIC_S].base +
+                             s->memmap[VIRT_APLIC_S].size * socket;
+            gsi_base = VIRT_IRQCHIP_NUM_SOURCES * socket;
+            Aml *dev = aml_device("IC%.02X", socket);
+            aml_append(dev, aml_name_decl("_HID", aml_string("RSCV0002")));
+            aml_append(dev, aml_name_decl("_UID", aml_int(socket)));
+            aml_append(dev, aml_name_decl("_GSB", aml_int(gsi_base)));
+
+            Aml *crs = aml_resource_template();
+            aml_append(crs, aml_memory32_fixed(plic_aplic_addr,
+                                               s->memmap[VIRT_APLIC_S].size,
+                                               AML_READ_WRITE));
+            aml_append(dev, aml_name_decl("_CRS", crs));
+            aml_append(scope, dev);
+        }
+    }
+}
+
 static void
 acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
                     uint32_t uart_irq)
@@ -411,6 +457,7 @@ static void build_dsdt(GArray *table_data,
 
     socket_count = riscv_socket_count(ms);
 
+    acpi_dsdt_add_plic_aplic(scope, s);
     acpi_dsdt_add_uart(scope, &memmap[VIRT_UART0], UART0_IRQ);
 
     if (socket_count == 1) {
-- 
2.40.1


