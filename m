Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3503AC27C53
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Jun 2024 11:43:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sEp38-0004Q6-IW; Wed, 05 Jun 2024 07:43:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sEp35-0004PR-Kn
 for qemu-riscv@nongnu.org; Wed, 05 Jun 2024 07:43:23 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sEp32-0007gm-TA
 for qemu-riscv@nongnu.org; Wed, 05 Jun 2024 07:43:23 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1f64ecb1766so18145475ad.1
 for <qemu-riscv@nongnu.org>; Wed, 05 Jun 2024 04:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1717587798; x=1718192598; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ll+ZFM5Q7ocX2TYkiLSI5Ow6QFXl/bg0O6LV2bqlLrQ=;
 b=XbsEgZlpVxkHGF8EdAG/bNNFcV4/IRv/Z6j93LJujiM9TBZQMx+aCnHsmnFtuhWoan
 dh6wZzrATQM0NjOmCrEMg1GGvd2HnpHI1P/gvzxHEWfmtCIlB8bVLFaXJzaNzQ/C2rWO
 bc6qnH3eY2M1VZyM3xCOj2iIUskmXL0xK2GHMnf+0vl62g12pQXQRT9P3lZ8uqEnGdNg
 ThSBmulODZGAmWY98GJj5+fjms7412CjkX+qYTMw8wcJZH7gpJp0ZgmzlknnJQy4jTiY
 KIxZiUlGMU0P7Ls+Olo+QEq8BrVOq/RrKpbSN1NrNLHtuhYqA7cWTFTf92C3cNtTJ8AH
 +ZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717587798; x=1718192598;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ll+ZFM5Q7ocX2TYkiLSI5Ow6QFXl/bg0O6LV2bqlLrQ=;
 b=CGjXtKpiYrJ71r/+ZtIV8YgJq2/7ysoBa68kJoiO9+uxx6J/buu9IIUf25vREASO9K
 I5HYqOVRdi9YvIUA5HiU8N02Rlap4BU5xLs51hRER3/HnjWtXB+jyJo2VK0GB3H0/O6s
 R+oujeeqx3DvJElyhlCbL+01+Crxwti49BpHCf9pFCvitCZTzTroi6FC1Tw9ojgyVWyM
 l2r08Fm4pZLpcoK8seqdoIyua0cTcrQBFnmAgV/VmUvXNEaTbQ1gYy1lnLYjR563aXdX
 Z7DxSjwb29q35K7X0X6bfNZ9a422AufPH9wRC8MX4hfV3sA6+z9z4klMrZ21NJm9L/CB
 FVog==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmfhveIrnGfViflITLCIzExkSnGBzEcxwoAB3O7HJRVOsbvZwzS2q/ChwEyoSEAPs1+kSJRCOGzc8ne37cyt6ggGTKJAA=
X-Gm-Message-State: AOJu0YyKggAjKCz6dKlwYttTsMnsOuAs3FG16LUEzKtsNTYzQdYUQn30
 m5C8Z6h0FAwO9FzChokXIhiqnWs5d4BVR6GyORz+OPo/6S+tCWpalyjru5o0rzc=
X-Google-Smtp-Source: AGHT+IFDMHgYWXuaTH2bAGbF7UWbNzDB3UUHl6eska5czlDOdjS8FwkRREdE5FQhkM7eQyLD+Jj7LQ==
X-Received: by 2002:a17:903:18d:b0:1f4:71ef:98f8 with SMTP id
 d9443c01a7336-1f6a5a0f423mr26170845ad.16.1717587798480; 
 Wed, 05 Jun 2024 04:43:18 -0700 (PDT)
Received: from sunil-laptop ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f676851481sm58687855ad.290.2024.06.05.04.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 04:43:17 -0700 (PDT)
Date: Wed, 5 Jun 2024 17:13:10 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH 1/3] gpex-acpi: Support PCI link devices outside the host
 bridge
Message-ID: <ZmBPTgNSHCeex+Qv@sunil-laptop>
References: <20240528073103.1075812-1-sunilvl@ventanamicro.com>
 <20240528073103.1075812-2-sunilvl@ventanamicro.com>
 <20240605041837-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605041837-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Hi Michael,

Thank you very much for the review!

On Wed, Jun 05, 2024 at 04:23:36AM -0400, Michael S. Tsirkin wrote:
> On Tue, May 28, 2024 at 01:01:01PM +0530, Sunil V L wrote:
> > Currently, PCI link devices (PNP0C0F) are always created within the
> > scope of the PCI root complex. However, RISC-V needs PCI link devices to
> > be outside the scope of the PCI host bridge to properly enable the probe
> > order. This matches the example given in the ACPI specification section
> > 6.2.13.1 as well.
> 
> Given that, what happens if we do this for all architectures?
> 
In theory and from my observation of linux on arm64, this should not
have any impact. However, I was bit hesitant to change for other
architectures since I was not sure how namespace changes like this will
affect different OS/architecture combination.

It looks like there is no real concern to make this change generic. That
should simplify the patch as well. Let me update in next version.
It would also warrant updating ACPI table blob for bios-table-test.

> > 
> > Enable creating link devices outside the scope of PCI root complex based
> > on the flag which gets set currently only for RISC-V.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  hw/pci-host/gpex-acpi.c    | 29 ++++++++++++++++++++++++-----
> >  hw/riscv/virt-acpi-build.c |  8 +++++---
> >  include/hw/pci-host/gpex.h |  5 ++++-
> >  3 files changed, 33 insertions(+), 9 deletions(-)
> > 
> > diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> > index f69413ea2c..cea89a3ed8 100644
> > --- a/hw/pci-host/gpex-acpi.c
> > +++ b/hw/pci-host/gpex-acpi.c
> > @@ -7,7 +7,7 @@
> >  #include "hw/pci/pcie_host.h"
> >  #include "hw/acpi/cxl.h"
> >  
> > -static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq)
> > +static void acpi_dsdt_add_pci_route_table(Aml *scope, Aml *dev, uint32_t irq)
> >  {
> >      Aml *method, *crs;
> >      int i, slot_no;
> > @@ -45,7 +45,17 @@ static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq)
> >          aml_append(dev_gsi, aml_name_decl("_CRS", crs));
> >          method = aml_method("_SRS", 1, AML_NOTSERIALIZED);
> >          aml_append(dev_gsi, method);
> > -        aml_append(dev, dev_gsi);
> > +
> > +        /*
> > +         * Some architectures like RISC-V
> 
> 
> Just risc-v for now right?
> > need PCI link devices created
> > +         * outside the scope of the PCI host bridge
> 
> .. in order to load the drivers in the correct order.
> Others .... .
> 
Okay.

> > similar to the example
> > +         * given in the section 6.2.13.1 of ACPI spec 6.5.
> 
> 
> This is not how we quote ACPI spec.
> 
> First you find the earliest spec version which has it.
> Then you mention that, section/table # and title.
> For example:
> 
> 	ACPI 6.1: 18.3.2.8 Generic Hardware Error Source
> 
>
Thanks!. Let me update as you suggested.

Thanks,
Sunil 

