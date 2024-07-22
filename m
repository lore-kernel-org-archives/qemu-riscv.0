Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E41C3DA61
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 00:21:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sVgmQ-0007jR-7u; Sun, 21 Jul 2024 20:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sVglM-0002HK-R6
 for qemu-riscv@nongnu.org; Sun, 21 Jul 2024 20:18:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sVglK-0005wa-Mc
 for qemu-riscv@nongnu.org; Sun, 21 Jul 2024 20:18:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721607526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uKdtFU2bD5M7BU4ChiAF5yuLXt6KWMO049/Tq7aTIq8=;
 b=FRZoEOCMMK2NA9QbgA0bUYGEo1ALdZuWKk4DDXLGOXMA/62yeyQed5pl4my8mol4n/4ukH
 4dYb9WcGmnWbAVEmjEb9IFLMX2tTr4cBHCVLJIZqGGdq1ex4GZFhhsrrsYNFX9Mess2ozB
 lCNZUsT2JfXaWSNpgAYQ7mOCvBKWeJo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619--QafPLAfPTCEBStZBc0BPw-1; Sun, 21 Jul 2024 20:18:44 -0400
X-MC-Unique: -QafPLAfPTCEBStZBc0BPw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-42668796626so28182505e9.0
 for <qemu-riscv@nongnu.org>; Sun, 21 Jul 2024 17:18:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721607523; x=1722212323;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uKdtFU2bD5M7BU4ChiAF5yuLXt6KWMO049/Tq7aTIq8=;
 b=nSn0eJ9DfRy+Arz9gm2rFi3A/m1oPVJMFP/UfTaACCNi7yCTJqtARFjQduJrFvxy3G
 lffP6Nvhu4x/igkrWexLYGY3f+XN1VNkYQlS6jaijIoCc9bGBsO56zihjvw0Umy/aeUN
 92s2siYy777O498gD02S1fE6b8LSz7VaQDZ/9adx88hWtARmGP6w3i/ARkiAygsLGNzp
 V1csE8Jh+m0oOw/qRHhUElfoJN3pms7IOTvn6FGBC1lCSaQLnsVRrJUm8FJp+J5zbXon
 T6fn5y7Jtt6jkFzTduZiJhhWbKKheit3CvCCBfZmmBXkq4LgtR7Fz3zZdZTaf0jnDfsA
 Yilw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU86vEBvc5ovJSfQSE2GhzM1dcKBCqw79rS23wU/K0KX6vp+k6efSU1eQlQ4MtTWSYFXFd4HgD2fbXCTNREzwFWvxwtP0M=
X-Gm-Message-State: AOJu0YyYKuoDs2SgmUg5UOhC5fCuRXyzWie7Um1vdJKJi/EY2Kr/hsmr
 k/qLtSqj/sVF8p+9CPn5aJE9+zqzADDYCo+00OvBfMi6hs29Cp2NXemM4XMDRBinGJ0BGAL98rt
 o3U5oYlcekHUtGcLdDYSmujxM2DXnAPOW+kuHnp3K3tVUipxZ+cSO
X-Received: by 2002:a05:600c:4fd2:b0:426:60e4:c691 with SMTP id
 5b1f17b1804b1-427dc5284b5mr27693345e9.11.1721607523389; 
 Sun, 21 Jul 2024 17:18:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHMnXBjyyY8iAqGyY/a6I9yp2jzeE/A9BI06NkJ8AOmviyvA4hs0Psc7HSzJ/Wr0FRuwpFFg==
X-Received: by 2002:a05:600c:4fd2:b0:426:60e4:c691 with SMTP id
 5b1f17b1804b1-427dc5284b5mr27693275e9.11.1721607522905; 
 Sun, 21 Jul 2024 17:18:42 -0700 (PDT)
Received: from redhat.com (mob-5-90-113-158.net.vodafone.it. [5.90.113.158])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a635cdsm133630885e9.13.2024.07.21.17.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jul 2024 17:18:42 -0700 (PDT)
Date: Sun, 21 Jul 2024 20:18:40 -0400
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
Subject: [PULL 52/63] hw/riscv/virt-acpi-build.c: Update the HID of RISC-V UART
Message-ID: <a99658ab9daf2426f5f4b23db2caa74bebbee6d1.1721607331.git.mst@redhat.com>
References: <cover.1721607331.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1721607331.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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


