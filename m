Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DEFC3DA63
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 11:03:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sWDGM-000060-48; Tue, 23 Jul 2024 07:00:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sWDFv-0006WY-6W
 for qemu-riscv@nongnu.org; Tue, 23 Jul 2024 07:00:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sWDFs-0002zK-Hf
 for qemu-riscv@nongnu.org; Tue, 23 Jul 2024 07:00:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721732428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2MFU5YluLJy3dMwMtCRKC5eZxelIcmwO+t8tRGjROFc=;
 b=egS7n7cu2CKPX0p3loUW2kPe4VQeTupLhZu8RMNWmy8cQDKttaSMExV2YfUUJz0Q4mVOF1
 +IWgn6XrjJDE1idAugnN3PWnxLOB/rwlT9ukW+ajBYcsKJRFPIylsZbECOxZqcTVXp2T/2
 hprE9acm5ptD0JlhCn6XIKVmBoWXvxI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-Id7l7sjkNm-B99O0tyQ45g-1; Tue, 23 Jul 2024 07:00:25 -0400
X-MC-Unique: Id7l7sjkNm-B99O0tyQ45g-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-42725d3ae3eso39609545e9.3
 for <qemu-riscv@nongnu.org>; Tue, 23 Jul 2024 04:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721732425; x=1722337225;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2MFU5YluLJy3dMwMtCRKC5eZxelIcmwO+t8tRGjROFc=;
 b=CWEbihj3L6WxbSTXV0V6zYU9en2HpJc65CwVkpv3ljNuowmict3f3+mj7f/AtBz4BW
 gMXijM3n99ekdun+oA5U0cgiWv0a5J4ICSsM7fPm+X18nnPKimiqnU20eAcJAlsf/Cf7
 AE6/NITUKFPpF83wNShzfzb8AyTEcOzL/6j9Mds3PeOgr5wRCwjkoYSNmRF4ayHkt09C
 Sm3QkuR2tQnTXsSAMznGcZMbHBysxVPhc9VU+i1aZsmB99JU2wO3a5T7SIOEvTbegA/2
 FkQvTqA3e84Vn4UO6D9qoDp9TJ2+fRN2OK8sRL7tU0toSzqYOVXGdPWSAblmvnL76dYk
 0fcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdVySmUoC3UikZyV2jtuTWSQGfwWNcP/i8Su+g5/a86R1xXpcjfY8sHsvS1rVUcWw0/b889uKRDSll27FIYKicDjxEqJg=
X-Gm-Message-State: AOJu0YxiPWSC8tgDANBE9u1EYAiY9HsKm92AOMdSqA/BjetSnoV68IOq
 AJ/ClE+yLAXZnwd+sORiOQv329EIqQP/5EI6fKs7u6B/jcnF48sg8mu63vEKffM90eX+qjaLCFr
 yqlasFIaALW1QAQzCFJXpuhb+mLBtyPhenmZhnkK3AB1/8h5Mvj2k
X-Received: by 2002:a05:600c:4e47:b0:426:6e8b:3dc5 with SMTP id
 5b1f17b1804b1-427dc56753emr76771765e9.32.1721732424569; 
 Tue, 23 Jul 2024 04:00:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IES2xGA854gQwoyFz4WEDiNhXqaTPv4cn1iY75vXqabsEsDP7O8DHpzV4z3K1Vb2qkzWcRCVw==
X-Received: by 2002:a05:600c:4e47:b0:426:6e8b:3dc5 with SMTP id
 5b1f17b1804b1-427dc56753emr76771375e9.32.1721732423942; 
 Tue, 23 Jul 2024 04:00:23 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:440:9c9a:ffee:509d:1766:aa7f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d8f1cf7esm158567575e9.39.2024.07.23.04.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 04:00:23 -0700 (PDT)
Date: Tue, 23 Jul 2024 07:00:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
Subject: [PULL v2 50/61] hw/riscv/virt-acpi-build.c: Add namespace devices
 for PLIC and APLIC
Message-ID: <a54dd0cd6b9119c44d52547f51a529122f0ec1f1.1721731723.git.mst@redhat.com>
References: <cover.1721731723.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1721731723.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.133,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Sunil V L <sunilvl@ventanamicro.com>

As per the requirement ACPI_080 in the RISC-V Boot and Runtime Services
(BRS) specification [1],  PLIC and APLIC should be in namespace as well.
So, add them using the defined HID.

[1] - https://github.com/riscv-non-isa/riscv-brs/releases/download/v0.0.2/riscv-brs-spec.pdf
      (Chapter 6)

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20240716144306.2432257-2-sunilvl@ventanamicro.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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
MST


