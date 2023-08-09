Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337D8C001B0
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 21:24:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTqfc-0006XZ-TP; Wed, 09 Aug 2023 17:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qTqfb-0006XJ-DI
 for qemu-riscv@nongnu.org; Wed, 09 Aug 2023 17:24:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qTqfZ-0007NA-SE
 for qemu-riscv@nongnu.org; Wed, 09 Aug 2023 17:24:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691616279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=umdNypH+rFz/fDMq+B3MPfHFLbSFUqS8VdJV8sfoYM8=;
 b=VaINaJQz1VdVhocVl/R155CjhQETkfZNG2sLgCxo6MCWEGVZAh78yo74Bjkh1HI21xsAKX
 UlScjrbnudinXHypQlHAT0fSjZXxBvK9zeJ5hWHNAg/JP8bdGmNJCG3VH6MhlqQ49Fj3Yj
 CIYrF+53ySoGl/fIqOIUEiAPm4F4o5Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-V0XGdFHQObOXjwa2vQ5ARA-1; Wed, 09 Aug 2023 17:24:38 -0400
X-MC-Unique: V0XGdFHQObOXjwa2vQ5ARA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fe4bda379fso1499625e9.1
 for <qemu-riscv@nongnu.org>; Wed, 09 Aug 2023 14:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691616277; x=1692221077;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=umdNypH+rFz/fDMq+B3MPfHFLbSFUqS8VdJV8sfoYM8=;
 b=FIF8jl/GBQ33LA/H2O37CbBLaWZb7wsBHQID7Am3Z0rb878QBTiAF5LAv5uekagPAq
 SfXBJ23wvjUGiZ1CoaJg5Q3vjYHzn6DP0WRkYdo6dfVy7r8dyLybcNKYcdMcvCjnJrHK
 eoLWFEYLhaJgzQ/6zEJaSiYXbxSqv8dMrztohgr+Y02uRcakDtgeuqubXBTfVnvR3yAF
 NSBc6lXIfNkFdWd75kVUOUWExtryCOFnJTIgcp3zmuXfD4ys9mOGUJqLn8NeqJsO0p/j
 nNEVxnaZmq3CT99di2SvkUABL8SUSKVUKdaw6BSiXYhCZDnWWWFW5aXdTXOzHYebQkWC
 8bzw==
X-Gm-Message-State: AOJu0YzYELyj/dET1KeCzSHQQhUkK3bcixdn9gXVVHkTnwriVsXxnxFI
 95t0m+dOjYq2K+xnmDW7iKfrLBFub0cj8mo8JU+jbAldMbj9c0IQs8B+528B66pV1UeOHSV1kG8
 8YiHxe7EvLPfpino=
X-Received: by 2002:a7b:cb85:0:b0:3fe:485f:ed13 with SMTP id
 m5-20020a7bcb85000000b003fe485fed13mr274375wmi.29.1691616277536; 
 Wed, 09 Aug 2023 14:24:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSamr49aQ56i4Rq9snA1Oj143PuyDjKCc32MNiue9cqLfn0Swq7hTCSgnkOOeIdmNagGcIWw==
X-Received: by 2002:a7b:cb85:0:b0:3fe:485f:ed13 with SMTP id
 m5-20020a7bcb85000000b003fe485fed13mr274360wmi.29.1691616277180; 
 Wed, 09 Aug 2023 14:24:37 -0700 (PDT)
Received: from redhat.com ([2.52.137.93]) by smtp.gmail.com with ESMTPSA id
 u11-20020a05600c00cb00b003fe29f6b61bsm97146wmm.46.2023.08.09.14.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Aug 2023 14:24:36 -0700 (PDT)
Date: Wed, 9 Aug 2023 17:24:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Chien <jason.chien@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Greg Kurz <groug@kaod.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH] hw/pci-host: Allow extended config space access for
 Designware PCIe host
Message-ID: <20230809172413-mutt-send-email-mst@kernel.org>
References: <20230809102257.25121-1-jason.chien@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230809102257.25121-1-jason.chien@sifive.com>
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

On Wed, Aug 09, 2023 at 10:22:50AM +0000, Jason Chien wrote:
> In pcie_bus_realize(), a root bus is realized as a PCIe bus and a non-root
> bus is realized as a PCIe bus if its parent bus is a PCIe bus. However,
> the child bus "dw-pcie" is realized before the parent bus "pcie" which is
> the root PCIe bus. Thus, the extended configuration space is not accessible
> on "dw-pcie". The issue can be resolved by adding the
> PCI_BUS_EXTENDED_CONFIG_SPACE flag to "pcie" before "dw-pcie" is realized.
> 
> Signed-off-by: Jason Chien <jason.chien@sifive.com>

I think we should fix the order of initialization rather than
hack around it.

> ---
>  hw/pci-host/designware.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
> index 9e183caa48..388d252ee2 100644
> --- a/hw/pci-host/designware.c
> +++ b/hw/pci-host/designware.c
> @@ -694,6 +694,7 @@ static void designware_pcie_host_realize(DeviceState *dev, Error **errp)
>                                       &s->pci.io,
>                                       0, 4,
>                                       TYPE_PCIE_BUS);
> +    pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
>  
>      memory_region_init(&s->pci.address_space_root,
>                         OBJECT(s),
> -- 
> 2.17.1


