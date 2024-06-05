Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3603EC27C52
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Jun 2024 08:24:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sElvy-0007Ou-F2; Wed, 05 Jun 2024 04:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sElvu-0007OR-FH
 for qemu-riscv@nongnu.org; Wed, 05 Jun 2024 04:23:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sElvs-0003SA-Ms
 for qemu-riscv@nongnu.org; Wed, 05 Jun 2024 04:23:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717575823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sTE/OSFzDlK973R5Pf+D79Yh0R4pPjrH99Lr9jmAoTI=;
 b=g1TVEZLdVJOahu9vrq0xwGoKDCg7q1vbWYqKSzJAEfCGstxCHjCsg3Kq10xc4ewDx73Gok
 uMNTvUqi6EdyWL4/CcyAi5rd7ASvo1uC1uypCNcPDl7uwz6wWK508znPz1wiPrf/BhDjyH
 XkmHNUX9DZ5MiYaf+MWwDrdMnLu2QJc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496-Q-3EmO6HNxK6X758AzwApg-1; Wed, 05 Jun 2024 04:23:42 -0400
X-MC-Unique: Q-3EmO6HNxK6X758AzwApg-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-a68ee264225so147284166b.1
 for <qemu-riscv@nongnu.org>; Wed, 05 Jun 2024 01:23:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717575821; x=1718180621;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sTE/OSFzDlK973R5Pf+D79Yh0R4pPjrH99Lr9jmAoTI=;
 b=Yx1O+xpje9qCnTZf531P2yGdxmyMAaGbJ4BLSDpw1ZVhpnIAV316uz1sq1DO9zd9lP
 ikOxbsVqoLV15HHGN65NAKOBvl2ldKVBnCNxCdnY2VGPiKiWvs+3EVdrSdNkd8FWae/l
 ZcwlEFd57W1FMXGw6hU/j3xTJd8/MHihpJSfFarqU9kdhBoIX0WnWMSJJKVl0PuP5kA8
 0ytrip+0ZA/lq52b9zxfyT6ii/IH7yMhkbN6JUwXfdV9oaCD+BHM43xiWar/UXcemZQV
 PWqMe68Wav1797LtJA0TZPi+RqPukSNanW44wiwz9QEtIt2BWKIZr3cy9ESi/Q3DRX91
 XU1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxJgiM9bwbVKlFA0tNYaTQocq3KJKGwrf/CHiTFOF3VRR6M8opr+iAvyBexfbN4DIBZf2P0g23xXsEKElfkAA1AWBKFx8=
X-Gm-Message-State: AOJu0Yx8WkQI2wpP6KfQTCJ9HAjdlcrlx9TlCKF5j295RjV4Y5sVAoLm
 rHZ4/vb4POxmjPU48KEmXYw4be1apuSr3HHFmQhu0BOCb2XRfiu6C0kJHHP17mJPjTjcfwXzgn1
 z3Ptjh2NaepsUkepwMddpMdDg5tKCQSb8sK1sENIyswWTnHZJnOG8
X-Received: by 2002:a17:906:a184:b0:a5a:15b6:25ab with SMTP id
 a640c23a62f3a-a69a0022d7dmr116951766b.61.1717575820925; 
 Wed, 05 Jun 2024 01:23:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEd3IJJUcLMPIO1EJXANKHLqm3Gw8kb/hrIhNSEuwTE0gQzGbBPTpHZH7z2B/qy8gwx9KwasA==
X-Received: by 2002:a17:906:a184:b0:a5a:15b6:25ab with SMTP id
 a640c23a62f3a-a69a0022d7dmr116949966b.61.1717575820367; 
 Wed, 05 Jun 2024 01:23:40 -0700 (PDT)
Received: from redhat.com ([2.55.58.53]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a68c7882caesm563091266b.27.2024.06.05.01.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 01:23:39 -0700 (PDT)
Date: Wed, 5 Jun 2024 04:23:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH 1/3] gpex-acpi: Support PCI link devices outside the host
 bridge
Message-ID: <20240605041837-mutt-send-email-mst@kernel.org>
References: <20240528073103.1075812-1-sunilvl@ventanamicro.com>
 <20240528073103.1075812-2-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20240528073103.1075812-2-sunilvl@ventanamicro.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, May 28, 2024 at 01:01:01PM +0530, Sunil V L wrote:
> Currently, PCI link devices (PNP0C0F) are always created within the
> scope of the PCI root complex. However, RISC-V needs PCI link devices to
> be outside the scope of the PCI host bridge to properly enable the probe
> order. This matches the example given in the ACPI specification section
> 6.2.13.1 as well.

Given that, what happens if we do this for all architectures?

> 
> Enable creating link devices outside the scope of PCI root complex based
> on the flag which gets set currently only for RISC-V.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  hw/pci-host/gpex-acpi.c    | 29 ++++++++++++++++++++++++-----
>  hw/riscv/virt-acpi-build.c |  8 +++++---
>  include/hw/pci-host/gpex.h |  5 ++++-
>  3 files changed, 33 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> index f69413ea2c..cea89a3ed8 100644
> --- a/hw/pci-host/gpex-acpi.c
> +++ b/hw/pci-host/gpex-acpi.c
> @@ -7,7 +7,7 @@
>  #include "hw/pci/pcie_host.h"
>  #include "hw/acpi/cxl.h"
>  
> -static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq)
> +static void acpi_dsdt_add_pci_route_table(Aml *scope, Aml *dev, uint32_t irq)
>  {
>      Aml *method, *crs;
>      int i, slot_no;
> @@ -45,7 +45,17 @@ static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq)
>          aml_append(dev_gsi, aml_name_decl("_CRS", crs));
>          method = aml_method("_SRS", 1, AML_NOTSERIALIZED);
>          aml_append(dev_gsi, method);
> -        aml_append(dev, dev_gsi);
> +
> +        /*
> +         * Some architectures like RISC-V


Just risc-v for now right?
> need PCI link devices created
> +         * outside the scope of the PCI host bridge

.. in order to load the drivers in the correct order.
Others .... .

> similar to the example
> +         * given in the section 6.2.13.1 of ACPI spec 6.5.


This is not how we quote ACPI spec.

First you find the earliest spec version which has it.
Then you mention that, section/table # and title.
For example:

	ACPI 6.1: 18.3.2.8 Generic Hardware Error Source


> +         */
> +         if (scope) {
> +            aml_append(scope, dev_gsi);
> +        } else {
> +            aml_append(dev, dev_gsi);
> +        }
>      }
>  }
>  
> @@ -174,7 +184,11 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>                  aml_append(dev, aml_name_decl("_PXM", aml_int(numa_node)));
>              }
>  
> -            acpi_dsdt_add_pci_route_table(dev, cfg->irq);
> +            if (cfg->flags & GPEX_FLAGS_EXT_GSI_LINK) {
> +                acpi_dsdt_add_pci_route_table(scope, dev, cfg->irq);
> +            } else {
> +                acpi_dsdt_add_pci_route_table(NULL, dev, cfg->irq);
> +            }
>  
>              /*
>               * Resources defined for PXBs are composed of the following parts:
> @@ -205,7 +219,11 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>      aml_append(dev, aml_name_decl("_STR", aml_unicode("PCIe 0 Device")));
>      aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
>  
> -    acpi_dsdt_add_pci_route_table(dev, cfg->irq);
> +    if (cfg->flags & GPEX_FLAGS_EXT_GSI_LINK) {
> +        acpi_dsdt_add_pci_route_table(scope, dev, cfg->irq);
> +    } else {
> +        acpi_dsdt_add_pci_route_table(NULL, dev, cfg->irq);
> +    }
>  
>      method = aml_method("_CBA", 0, AML_NOTSERIALIZED);
>      aml_append(method, aml_return(aml_int(cfg->ecam.base)));
> @@ -282,7 +300,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>      crs_range_set_free(&crs_range_set);
>  }
>  
> -void acpi_dsdt_add_gpex_host(Aml *scope, uint32_t irq)
> +void acpi_dsdt_add_gpex_host(Aml *scope, uint32_t irq, uint32_t flags)
>  {
>      bool ambig;
>      Object *obj = object_resolve_path_type("", TYPE_GPEX_HOST, &ambig);
> @@ -292,5 +310,6 @@ void acpi_dsdt_add_gpex_host(Aml *scope, uint32_t irq)
>      }
>  
>      GPEX_HOST(obj)->gpex_cfg.irq = irq;
> +    GPEX_HOST(obj)->gpex_cfg.flags = flags;
>      acpi_dsdt_add_gpex(scope, &GPEX_HOST(obj)->gpex_cfg);
>  }
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 0925528160..832a3acb8d 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -417,19 +417,21 @@ static void build_dsdt(GArray *table_data,
>          virtio_acpi_dsdt_add(scope, memmap[VIRT_VIRTIO].base,
>                               memmap[VIRT_VIRTIO].size,
>                               VIRTIO_IRQ, 0, VIRTIO_COUNT);
> -        acpi_dsdt_add_gpex_host(scope, PCIE_IRQ);
> +        acpi_dsdt_add_gpex_host(scope, PCIE_IRQ, GPEX_FLAGS_EXT_GSI_LINK);
>      } else if (socket_count == 2) {
>          virtio_acpi_dsdt_add(scope, memmap[VIRT_VIRTIO].base,
>                               memmap[VIRT_VIRTIO].size,
>                               VIRTIO_IRQ + VIRT_IRQCHIP_NUM_SOURCES, 0,
>                               VIRTIO_COUNT);
> -        acpi_dsdt_add_gpex_host(scope, PCIE_IRQ + VIRT_IRQCHIP_NUM_SOURCES);
> +        acpi_dsdt_add_gpex_host(scope, PCIE_IRQ + VIRT_IRQCHIP_NUM_SOURCES,
> +                                GPEX_FLAGS_EXT_GSI_LINK);
>      } else {
>          virtio_acpi_dsdt_add(scope, memmap[VIRT_VIRTIO].base,
>                               memmap[VIRT_VIRTIO].size,
>                               VIRTIO_IRQ + VIRT_IRQCHIP_NUM_SOURCES, 0,
>                               VIRTIO_COUNT);
> -        acpi_dsdt_add_gpex_host(scope, PCIE_IRQ + VIRT_IRQCHIP_NUM_SOURCES * 2);
> +        acpi_dsdt_add_gpex_host(scope, PCIE_IRQ + VIRT_IRQCHIP_NUM_SOURCES * 2,
> +                                GPEX_FLAGS_EXT_GSI_LINK);
>      }
>  
>      aml_append(dsdt, scope);
> diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
> index dce883573b..bee17d62c5 100644
> --- a/include/hw/pci-host/gpex.h
> +++ b/include/hw/pci-host/gpex.h
> @@ -47,8 +47,11 @@ struct GPEXConfig {
>      MemMapEntry pio;
>      int         irq;
>      PCIBus      *bus;
> +    uint32_t    flags;
>  };
>  
> +#define GPEX_FLAGS_EXT_GSI_LINK BIT(0)
> +
>  struct GPEXHost {
>      /*< private >*/
>      PCIExpressHost parent_obj;
> @@ -71,7 +74,7 @@ struct GPEXHost {
>  int gpex_set_irq_num(GPEXHost *s, int index, int gsi);
>  
>  void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg);
> -void acpi_dsdt_add_gpex_host(Aml *scope, uint32_t irq);
> +void acpi_dsdt_add_gpex_host(Aml *scope, uint32_t irq, uint32_t flags);
>  
>  #define PCI_HOST_PIO_BASE               "x-pio-base"
>  #define PCI_HOST_PIO_SIZE               "x-pio-size"
> -- 
> 2.40.1
> 
> 


