Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FA2C001E0
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 17:52:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qU9pI-00033H-CL; Thu, 10 Aug 2023 13:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qU9pG-00032W-M3
 for qemu-riscv@nongnu.org; Thu, 10 Aug 2023 13:51:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qU9pF-0006QM-5d
 for qemu-riscv@nongnu.org; Thu, 10 Aug 2023 13:51:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691689916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/1mnsrBv9dg9AfHx1DCsV2pSiqRCQFxw5iHOER8p6sc=;
 b=iHsMEnoREEm7lCwdXM5jkp2Jvn4DBrLVMrG09nCYnb1CiZ+SuU4T799Ve8RG3qM2sZYX+j
 QJ0KvSYrJKWo+/nbnE2+waWl2Y5aev2sGfiHl/DxqlhU6/1mD8LvtYn/8+C7s7qHS2Q+MO
 W3qc4wqFyWkPJqpnAJu0n/yX4cUQwvY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-ghGW0bCtNd-RrdDeakCvVA-1; Thu, 10 Aug 2023 13:51:55 -0400
X-MC-Unique: ghGW0bCtNd-RrdDeakCvVA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f41a04a297so6956735e9.3
 for <qemu-riscv@nongnu.org>; Thu, 10 Aug 2023 10:51:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691689914; x=1692294714;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/1mnsrBv9dg9AfHx1DCsV2pSiqRCQFxw5iHOER8p6sc=;
 b=OgFUxsaqpvkACfvquuMqCWewlLDGuzBs+P2/UlMGtv0iRAoOy07iWP/a7HXhtaFmwR
 CexlDKNe8N+Czakuh/o3tgkCXtoVLbjDPTKDwzBKmAqsWkjlVStDVroQR6iTvwiJG1UL
 uhbjm5+jnogy7YlpZABxXgxMyzRqmy2ZsmG+QxL7luCplMhhgV29R/qVZEKC0h6PDMqA
 H6nKassDVOhovxhxowDfMxn1YgdbbRPXSTS786YW285WU68scx51t/7+b0fnW61DB0Q9
 9HNrsgVzRFcsXpDwwgnQ8UBCmqKnJAou15z+WpFyE5VEYIx07/dVUdtZwubwmdoS1Wai
 YXFw==
X-Gm-Message-State: AOJu0YxsrqwlHphmXJ8jxt3cvEkLg1H0IBbThx2sm5FhnWyUGW4rcbVi
 d1j3JOUPxf57PPsXh3qYqtQEuGRZih0yiFFE/QS+/iUIsj4kTGsy0gcD2fHtKrOXYtsStlia3g/
 6TTRGLTButSvNTQ0=
X-Received: by 2002:a05:600c:2196:b0:3fc:9e:eead with SMTP id
 e22-20020a05600c219600b003fc009eeeadmr2424876wme.20.1691689913905; 
 Thu, 10 Aug 2023 10:51:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHajOvQn1RaHcEkC3sbMFnV7QM5byHNrP7JuHtbz2tN7clmDo4rqqER5cB3mbrXg1e7hd+cfw==
X-Received: by 2002:a05:600c:2196:b0:3fc:9e:eead with SMTP id
 e22-20020a05600c219600b003fc009eeeadmr2424864wme.20.1691689913584; 
 Thu, 10 Aug 2023 10:51:53 -0700 (PDT)
Received: from redhat.com ([2.55.42.146]) by smtp.gmail.com with ESMTPSA id
 c19-20020a7bc853000000b003fbc0a49b57sm2794967wml.6.2023.08.10.10.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Aug 2023 10:51:53 -0700 (PDT)
Date: Thu, 10 Aug 2023 13:51:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Chien <jason.chien@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Greg Kurz <groug@kaod.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH] hw/pci-host: Allow extended config space access for
 Designware PCIe host
Message-ID: <20230810135050-mutt-send-email-mst@kernel.org>
References: <20230809102257.25121-1-jason.chien@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230809102257.25121-1-jason.chien@sifive.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Wed, Aug 09, 2023 at 10:22:50AM +0000, Jason Chien wrote:
> In pcie_bus_realize(), a root bus is realized as a PCIe bus and a non-root
> bus is realized as a PCIe bus if its parent bus is a PCIe bus. However,
> the child bus "dw-pcie" is realized before the parent bus "pcie" which is
> the root PCIe bus. Thus, the extended configuration space is not accessible
> on "dw-pcie". The issue can be resolved by adding the
> PCI_BUS_EXTENDED_CONFIG_SPACE flag to "pcie" before "dw-pcie" is realized.
> 
> Signed-off-by: Jason Chien <jason.chien@sifive.com>


Acked-by: Michael S. Tsirkin <mst@redhat.com>

I'm not planning another pull before release, hopefully
another maintainer can pick it up? Peter?

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


