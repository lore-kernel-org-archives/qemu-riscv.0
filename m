Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB8CC3DA41
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 13:43:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sRu5H-0007th-3L; Thu, 11 Jul 2024 09:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sRu5F-0007iq-2S
 for qemu-riscv@nongnu.org; Thu, 11 Jul 2024 09:43:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sRu5C-0007iC-TO
 for qemu-riscv@nongnu.org; Thu, 11 Jul 2024 09:43:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720705417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y3Vwh4o2V5xIUSBr5Y81d30CVy3flf0/wRUdlQVlVYo=;
 b=GRj9NSfpvy/K+Bl9XPMoDV0znOPsee9W2xGtLkDKNNTxTaFZjqq/ltnUWE6VDygTdo1WbN
 aJkJWXl56lwTTE6feTGP072pwj+cn/7z2Z87RQSkjBlygKOfMrNgnjXpQKCJfMXEw/M25P
 z9OAb60poGWd3CsZhZBvfGZEP/ePn6o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-jY6JGOJ2NHKBZcqnPBSxww-1; Thu, 11 Jul 2024 09:43:36 -0400
X-MC-Unique: jY6JGOJ2NHKBZcqnPBSxww-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42668699453so7711925e9.3
 for <qemu-riscv@nongnu.org>; Thu, 11 Jul 2024 06:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720705415; x=1721310215;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y3Vwh4o2V5xIUSBr5Y81d30CVy3flf0/wRUdlQVlVYo=;
 b=BSfLB3opgbCkAJuebOm5LBApWH1RgbOfdiRzxndHlb9/0c18TqqkQdqajUkgxEHfPD
 D7oIAHG3hBrTPcVVlxauPnekNZcBNGAFLJRvo/d6pZ2AA6ZVGxxW7Uh0LVvwpxOvFxLP
 lrTRJqJNVmvzsNkU4RNt+VCOKUBUHBDxaFgVqaEtzNHYmvm3490Y+V9IkSPtJF+idhmb
 s55p19q9euQpFKk59TH0eA28TtaEJkgVmx00Opa8nwPuguqlTpI8M2Nw7fTf87DQcQV5
 hx1467Eo3B/u2AzwzkHYgIBodtloUG2yYaEUkBXmwVwmQB0kpjBwybN/Un/tIyJi7CAh
 2Akg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhCTpFnMkRTIefwnYHo/fCHfrJK7uBssX/xEZItbZ5WpQQSbczQkaqxJvEERJ0EZAZjwXk7kKsFq4vdA1P8Ms8UYboWPU=
X-Gm-Message-State: AOJu0YwBy2RIxuAEnt0qKS2kr1iJ/6Riw9aa76ZjyMttxVUZlbeil2SW
 RPozEFz6xZTn2iUO2CWVa9bkt7kAR/9zNEKtle5bK8fyNtrWeVe9R+p6RmaSHSUUoAvufWuKqvD
 Ru+SdUSHC18UUq+gLvCsoFt7TQIc8VJ2cIfSs5Ohj/OfpP0llBXP0
X-Received: by 2002:a5d:64c4:0:b0:366:efbd:8aa3 with SMTP id
 ffacd0b85a97d-367cea46767mr9908949f8f.2.1720705415048; 
 Thu, 11 Jul 2024 06:43:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbv2MzBZzEFe8VgUZraYHmfRUnzE2eZwsehEebZIMjRlEV9YnF8pVT/jfYAxY/vFMJ42emEA==
X-Received: by 2002:a5d:64c4:0:b0:366:efbd:8aa3 with SMTP id
 ffacd0b85a97d-367cea46767mr9908922f8f.2.1720705414562; 
 Thu, 11 Jul 2024 06:43:34 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfa079asm7735735f8f.68.2024.07.11.06.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 06:43:34 -0700 (PDT)
Date: Thu, 11 Jul 2024 15:43:33 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, Bin Meng
 <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>, Daniel Henrique
 Barboza <dbarboza@ventanamicro.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, "Michael S . Tsirkin" <mst@redhat.com>, Ani
 Sinha <anisinha@redhat.com>
Subject: Re: [PATCH v2 4/9] acpi/gpex: Create PCI link devices outside PCI
 root bridge
Message-ID: <20240711154333.262e0bda@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240708114741.3499585-5-sunilvl@ventanamicro.com>
References: <20240708114741.3499585-1-sunilvl@ventanamicro.com>
 <20240708114741.3499585-5-sunilvl@ventanamicro.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.142,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Mon,  8 Jul 2024 17:17:36 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> Currently, PCI link devices (PNP0C0F) are always created within the
> scope of the PCI root bridge. However, RISC-V needs these link devices
> to be created outside to ensure the probing order in the OS. This
> matches the example given in the ACPI specification [1] as well. Hence,
> create these link devices directly under _SB instead of under the PCI
> root bridge.
> 
> To keep these link device names unique for multiple PCI bridges, change
> the device name from GSIx to LXXY format where XX is the PCI bus number
> and Y is the INTx.
> 
> GPEX is currently used by riscv, aarch64/virt and x86/microvm machines.
> So, this change will alter the DSDT for those systems.
> 
> [1] - ACPI 5.1: 6.2.13.1 Example: Using _PRT to Describe PCI IRQ Routing
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  hw/pci-host/gpex-acpi.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> index f69413ea2c..a93b55c991 100644
> --- a/hw/pci-host/gpex-acpi.c
> +++ b/hw/pci-host/gpex-acpi.c
> @@ -7,7 +7,8 @@
>  #include "hw/pci/pcie_host.h"
>  #include "hw/acpi/cxl.h"
>  
> -static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq)
> +static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq,
> +                                          Aml *scope, uint8_t bus_num)
>  {
>      Aml *method, *crs;
>      int i, slot_no;
> @@ -20,7 +21,7 @@ static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq)
>              Aml *pkg = aml_package(4);
>              aml_append(pkg, aml_int((slot_no << 16) | 0xFFFF));
>              aml_append(pkg, aml_int(i));
> -            aml_append(pkg, aml_name("GSI%d", gsi));
> +            aml_append(pkg, aml_name("L%.02X%d", bus_num, gsi));
 instead of mixing hex and decimal here, make gsi hex as well to be consistent?


>              aml_append(pkg, aml_int(0));
>              aml_append(rt_pkg, pkg);
>          }
> @@ -30,7 +31,7 @@ static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq)
>      /* Create GSI link device */
>      for (i = 0; i < PCI_NUM_PINS; i++) {
>          uint32_t irqs = irq + i;
> -        Aml *dev_gsi = aml_device("GSI%d", i);
> +        Aml *dev_gsi = aml_device("L%.02X%d", bus_num, i);
ditto

>          aml_append(dev_gsi, aml_name_decl("_HID", aml_string("PNP0C0F")));
>          aml_append(dev_gsi, aml_name_decl("_UID", aml_int(i)));
>          crs = aml_resource_template();
> @@ -45,7 +46,7 @@ static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq)
>          aml_append(dev_gsi, aml_name_decl("_CRS", crs));
>          method = aml_method("_SRS", 1, AML_NOTSERIALIZED);
>          aml_append(dev_gsi, method);
> -        aml_append(dev, dev_gsi);
> +        aml_append(scope, dev_gsi);
>      }
>  }
>  
> @@ -174,7 +175,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>                  aml_append(dev, aml_name_decl("_PXM", aml_int(numa_node)));
>              }
>  
> -            acpi_dsdt_add_pci_route_table(dev, cfg->irq);
> +            acpi_dsdt_add_pci_route_table(dev, cfg->irq, scope, bus_num);
>  
>              /*
>               * Resources defined for PXBs are composed of the following parts:
> @@ -205,7 +206,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>      aml_append(dev, aml_name_decl("_STR", aml_unicode("PCIe 0 Device")));
>      aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
>  
> -    acpi_dsdt_add_pci_route_table(dev, cfg->irq);
> +    acpi_dsdt_add_pci_route_table(dev, cfg->irq, scope, 0);
>  
>      method = aml_method("_CBA", 0, AML_NOTSERIALIZED);
>      aml_append(method, aml_return(aml_int(cfg->ecam.base)));


