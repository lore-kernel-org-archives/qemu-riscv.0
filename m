Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216F6C3DA63
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 11:06:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sWDGH-000843-DY; Tue, 23 Jul 2024 07:00:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sWDFy-0006hs-5a
 for qemu-riscv@nongnu.org; Tue, 23 Jul 2024 07:00:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sWDFv-0002zo-Sp
 for qemu-riscv@nongnu.org; Tue, 23 Jul 2024 07:00:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721732431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uKdtFU2bD5M7BU4ChiAF5yuLXt6KWMO049/Tq7aTIq8=;
 b=UbPzDVmzmAuyvBdvLmR72HMJNbkWbIJsyp18HTnqzPg/EAiM4891SQVWvvXAqqlwRTiBEu
 W08sn7vvJ2OFDvFLiLqhqgSwE0+AJMW1a7Y0FiZ5oQrUZ2Z5O0kja4JS8oAlnra4jFcMXu
 9CMxOAc5BiHNNlN3VrPw/jaaH49XNnU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-75KLks5KNCGJZSScYM-88A-1; Tue, 23 Jul 2024 07:00:29 -0400
X-MC-Unique: 75KLks5KNCGJZSScYM-88A-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42668796626so40276625e9.0
 for <qemu-riscv@nongnu.org>; Tue, 23 Jul 2024 04:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721732429; x=1722337229;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uKdtFU2bD5M7BU4ChiAF5yuLXt6KWMO049/Tq7aTIq8=;
 b=Ovo9qAcQlvo/FIzzN/0CmZj1Y1CIKMGoiDWE6E/jZSE/a4NOJCTg3u+2MX0pGK65Zv
 +xl1Y9wSiWDAQKLtbq+LnYEhrtFjx6YnBMCu9HF+KBZgji29QiRXqD49POlZ6ljHatc2
 utYhg7DF4K2KsTcZZvdmH1VnLdH484cih2rEjgGkB6aIbuy//ewYllstqCJ0+YiTZwoL
 Lr/lbXKDuedyafp4XzNSiNNW2uS9M3FBgkTXAAuuCmE6pseipmZLYRaMRb1KqjFhfEYY
 N08YUIzWcf219336ccSWY40GsHfM8qXM04mEIvw/sLhCvNOjlb62WdpbnBXWSl5vamzF
 4haA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPUoiNXLbRXgQGKyHDSOaleoZ4cIONhqVuzYAy1KFUgOd4CGF9SbEFN/t/NqYaFgZ8Vv/EVfSIoA7lon0KFUj4nGDTGxU=
X-Gm-Message-State: AOJu0Yzv0kOfCjX22S1LUW/DpRTDorIf+APD74/4q2mYj65xC9zQwcOF
 xYWZ5cGe0if7+eY5NdH4mUuT3SQCP8YBJEzcdKH7ciVh7/eSPCZ6epurK0gl9L3dSZNCpYHU1VZ
 GBEDjhdDaWo9rewYs5JjsseWYMzV54apEuKhzSe8h5sl+ugwEY43u
X-Received: by 2002:a05:600c:4752:b0:426:6edb:7e14 with SMTP id
 5b1f17b1804b1-427ed06197fmr16759015e9.35.1721732428824; 
 Tue, 23 Jul 2024 04:00:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+lVsF4SUdxXtBno6EpPUiUoCkONqPT2tvAJwb6e/syW+3H8UrZS+IHTebWDA0zCE28rZCPw==
X-Received: by 2002:a05:600c:4752:b0:426:6edb:7e14 with SMTP id
 5b1f17b1804b1-427ed06197fmr16758765e9.35.1721732428353; 
 Tue, 23 Jul 2024 04:00:28 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:440:9c9a:ffee:509d:1766:aa7f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a947fasm195197935e9.43.2024.07.23.04.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 04:00:27 -0700 (PDT)
Date: Tue, 23 Jul 2024 07:00:24 -0400
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
Subject: [PULL v2 51/61] hw/riscv/virt-acpi-build.c: Update the HID of RISC-V
 UART
Message-ID: <faacd2e6b6a85a5eee2472e5a7f50bf69c4ad44a.1721731723.git.mst@redhat.com>
References: <cover.1721731723.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1721731723.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.133,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The requirement ACPI_060 in the RISC-V BRS specification [1], requires
NS16550 compatible UART to have the HID RSCV0003. So, update the HID for
the UART.

[1] -  https://github.com/riscv-non-isa/riscv-brs/releases/download/v0.0.2/riscv-brs-spec.pdf
       (Chapter 6)

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20240716144306.2432257-3-sunilvl@ventanamicro.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/riscv/virt-acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 5f5082a35b..36d6a3a412 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -170,7 +170,7 @@ acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
                     uint32_t uart_irq)
 {
     Aml *dev = aml_device("COM0");
-    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0501")));
+    aml_append(dev, aml_name_decl("_HID", aml_string("RSCV0003")));
     aml_append(dev, aml_name_decl("_UID", aml_int(0)));
 
     Aml *crs = aml_resource_template();
-- 
MST


