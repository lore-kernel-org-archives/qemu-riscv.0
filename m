Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F321C3DA4A
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jul 2024 17:12:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sTPEm-0004oY-N1; Mon, 15 Jul 2024 13:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sTPEl-0004i1-18
 for qemu-riscv@nongnu.org; Mon, 15 Jul 2024 13:11:43 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sTPEj-00077M-44
 for qemu-riscv@nongnu.org; Mon, 15 Jul 2024 13:11:42 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-70af3d9169bso3154337b3a.1
 for <qemu-riscv@nongnu.org>; Mon, 15 Jul 2024 10:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1721063500; x=1721668300; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mGZr15x0eRAM5JYBeNcxfmFVRpj6MMcjWS0cU8CYrYQ=;
 b=lRZgMpZyOjuhmPBMQfkpZ4nieiVD8DC18skRjMNS+MEQRDTeTvtkv4ibykx9IhISdL
 kgFE/l9A1DTOJxdBjDVVhRqjjCO7z+oJ7uU+NwnzLggXOMv+gdjPBKVExSDQeTf1pCub
 PUd4T6orQP+QJHmAWnflu+ca2dLgRPtjvdRI3EXvG58KQmLqcQkll6TxzJ2JFEFEMAFx
 7mmAjLOKtJ8HNG838/gDmFBi8CerBRZL2/wUSfYPzU5wqDCDtJXtSVWY/2KqifS32bBK
 DkIm2r4nOMj9PCsYvNcaPvSJROLEQ5IYUEiauVEyGZQm3o71f6HfAu9WBrLxdbveS4QR
 6GgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721063500; x=1721668300;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mGZr15x0eRAM5JYBeNcxfmFVRpj6MMcjWS0cU8CYrYQ=;
 b=ngF+3K4mkChvdZulNKV+9rq2KDzIIu+dbjIW89ZA5HjD6tegMKKwwBGrefBBHHjmqG
 8nri+E33GCw9misVpZMnaMFXJF7sThG9soKOw8vKN9AwerxIIShwMoqOUbPOuG/VpbL2
 nPgMx3d7R3JFSMRczrNEHkHjo3VdOzT1qtnai/sei1G0GyIQGZGuLgkhLu8XEVIB0ML+
 B9DSNlZpmo25Q5IubxHUWS7qbJY8HGKgHjQpMbYzx8Pqz22Q8DhDpbWPLQngqjes52+W
 Os/mNyvK/dW+Lffc4acgdrTyeVSu9ngGvuLzEeHGA3U4IZqQHjEVAkIO3cDwArVZ8/cN
 VWxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWL5GCEBiKCffQHYjYgQ//NQ31noMglyY10+iIpofZW94czd/D0smyyMGx26Snu5bx8QeZ6jibj4rrNdW0I+sMPGP6egEc=
X-Gm-Message-State: AOJu0YzqiJFVsrYzX8f63VdKf+Hzd4JKjwoJqJoNAltD7zL79zbCb5b3
 VM4bhdpxN6Ug001pHXYqs5oyU2ncNhLCDctlhry5zWSwZxwTsTNGoT7i2ABNKB4=
X-Google-Smtp-Source: AGHT+IGxYYaRmXTYc10KEUUk0yn+1pRB5m2cSkUgr7mVxhVkKfQ7V4xE91RWDHLTtMXAcJdFIiMuGA==
X-Received: by 2002:a05:6a00:c89:b0:706:b10c:548a with SMTP id
 d2e1a72fcca58-70ba48c701cmr343513b3a.22.1721063499603; 
 Mon, 15 Jul 2024 10:11:39 -0700 (PDT)
Received: from sunil-pc.tail07344b.ts.net ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7eca85ccsm4752618b3a.178.2024.07.15.10.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 10:11:39 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v3 1/9] hw/riscv/virt-acpi-build.c: Add namespace devices for
 PLIC and APLIC
Date: Mon, 15 Jul 2024 22:41:21 +0530
Message-ID: <20240715171129.1168896-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240715171129.1168896-1-sunilvl@ventanamicro.com>
References: <20240715171129.1168896-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42f.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

As per the requirement ACPI_080 in the RISC-V Boot and Runtime Services
(BRS) specification [1],  PLIC and APLIC should be in namespace as well.
So, add them using the defined HID.

[1] - https://github.com/riscv-non-isa/riscv-brs/blob/main/acpi.adoc
      (commit : 241575b3189c5d9e60b5e55e78cf0443092713bf)

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt-acpi-build.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 0925528160..5f5082a35b 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -141,6 +141,30 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
     }
 }
 
+static void acpi_dsdt_add_plic_aplic(Aml *scope, uint8_t socket_count,
+                                     uint64_t mmio_base, uint64_t mmio_size,
+                                     const char *hid)
+{
+    uint64_t plic_aplic_addr;
+    uint32_t gsi_base;
+    uint8_t  socket;
+
+    for (socket = 0; socket < socket_count; socket++) {
+        plic_aplic_addr = mmio_base + mmio_size * socket;
+        gsi_base = VIRT_IRQCHIP_NUM_SOURCES * socket;
+        Aml *dev = aml_device("IC%.02X", socket);
+        aml_append(dev, aml_name_decl("_HID", aml_string("%s", hid)));
+        aml_append(dev, aml_name_decl("_UID", aml_int(socket)));
+        aml_append(dev, aml_name_decl("_GSB", aml_int(gsi_base)));
+
+        Aml *crs = aml_resource_template();
+        aml_append(crs, aml_memory32_fixed(plic_aplic_addr, mmio_size,
+                                           AML_READ_WRITE));
+        aml_append(dev, aml_name_decl("_CRS", crs));
+        aml_append(scope, dev);
+    }
+}
+
 static void
 acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
                     uint32_t uart_irq)
@@ -411,6 +435,14 @@ static void build_dsdt(GArray *table_data,
 
     socket_count = riscv_socket_count(ms);
 
+    if (s->aia_type == VIRT_AIA_TYPE_NONE) {
+        acpi_dsdt_add_plic_aplic(scope, socket_count, memmap[VIRT_PLIC].base,
+                                 memmap[VIRT_PLIC].size, "RSCV0001");
+    } else {
+        acpi_dsdt_add_plic_aplic(scope, socket_count, memmap[VIRT_APLIC_S].base,
+                                 memmap[VIRT_APLIC_S].size, "RSCV0002");
+    }
+
     acpi_dsdt_add_uart(scope, &memmap[VIRT_UART0], UART0_IRQ);
 
     if (socket_count == 1) {
-- 
2.43.0


