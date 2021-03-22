Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lOT93-0003hp-Ue
	for mharc-qemu-riscv@gnu.org; Mon, 22 Mar 2021 18:35:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOT91-0003f1-0l
 for qemu-riscv@nongnu.org; Mon, 22 Mar 2021 18:35:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOT8s-0006gc-BB
 for qemu-riscv@nongnu.org; Mon, 22 Mar 2021 18:35:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616452520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QuaXJQGU7xRevn41itaezuZ1ET1Lx0cq3YRMTZ4tkE8=;
 b=c6RppT0Qj3yRGc0b86ygiUEXPf2Wdy+ZUj+n4ztt3eh60wIiCrG44NRENSrla20l2X0AWZ
 tiiKQlbPpL95pcmUiPlkF3UP89rQxVRuGSsF24ODfJ6iFNKM7cp3ygMHxdIDOrwMksixjz
 6hq8cm8ChzAbmPmU+iI+1hJKNg6MVt4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-QwK7o91sNaWjN8NE_Oz6pw-1; Mon, 22 Mar 2021 18:35:17 -0400
X-MC-Unique: QwK7o91sNaWjN8NE_Oz6pw-1
Received: by mail-wr1-f69.google.com with SMTP id p12so117637wrn.18
 for <qemu-riscv@nongnu.org>; Mon, 22 Mar 2021 15:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QuaXJQGU7xRevn41itaezuZ1ET1Lx0cq3YRMTZ4tkE8=;
 b=aFMTXPmWm6T5CSVWE1lRNPB+IslNFPAvfLGWdiGbbL16xzTuyFroSqtWBEVSq6+sCS
 wPIv1ajpOg9Cl1GqnpxtnXb6ZKb4mPH41188kW/r1cZhBRdLVjUMwK+ZwhaVPc8aEk8H
 qhrKvKqPkafuPOYXAD1GcjPqZByF8lW1czl6/0E011+RKKWd2HZxK89TI3EhB1Z1jlhs
 /oI7/gMEIxetc/LILjrstro9WZFVC5E7nJRTDm15I0yMvjjHH6DH/jB6i9ClTZ5tazP5
 mTY3z9dW8f9xmSUFe8fKpqJbJ5dRTSJKgIKg7uNUmqx0Mi5cWXHUpNX0x/Llbbm7EFbz
 wN5Q==
X-Gm-Message-State: AOAM532AwESFvhnboiOygGC9wLn5u4BemMe5sMvD9NpkUYl/tpOkGHvp
 DT6n0pvimNUwwtghHNqsV7QQIOk2tgmw5Uagg7RM1qKTaO+f2DauTs8jO7tWO9zVGNU1F8ekCQl
 FaLOhOm+zI4caZQY=
X-Received: by 2002:a5d:4ac4:: with SMTP id y4mr756367wrs.86.1616452516541;
 Mon, 22 Mar 2021 15:35:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaH94mTeXXlnMZjjAWD4nRvqQy5wJTdR25D9I9qvjFvYln9OLjfKxnW8CT+aIrpjnl4IEmQw==
X-Received: by 2002:a5d:4ac4:: with SMTP id y4mr756356wrs.86.1616452516256;
 Mon, 22 Mar 2021 15:35:16 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id 7sm711278wmk.8.2021.03.22.15.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 15:35:11 -0700 (PDT)
Date: Mon, 22 Mar 2021 18:35:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Dmitry Vyukov <dvyukov@google.com>, Arnd Bergmann <arnd@arndb.de>,
 qemu-riscv@nongnu.org
Subject: Re: [PATCH] hw/pci-host/gpex: Don't fault for unmapped parts of MMIO
 and PIO windows
Message-ID: <20210322183320-mutt-send-email-mst@kernel.org>
References: <20210322201336.9539-1-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210322201336.9539-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Mar 2021 22:35:31 -0000

On Mon, Mar 22, 2021 at 08:13:36PM +0000, Peter Maydell wrote:
> Currently the gpex PCI controller implements no special behaviour for
> guest accesses to areas of the PIO and MMIO where it has not mapped
> any PCI devices, which means that for Arm you end up with a CPU
> exception due to a data abort.
> 
> Most host OSes expect "like an x86 PC" behaviour, where bad accesses
> like this return -1 for reads and ignore writes.  In the interests of
> not being surprising, make host CPU accesses to these windows behave
> as -1/discard where there's no mapped PCI device.
> 
> Reported-by: Dmitry Vyukov <dvyukov@google.com>
> Fixes: https://bugs.launchpad.net/qemu/+bug/1918917
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

BTW it looks like launchpad butchered the lore.kernel.org
link so one can't find out what was the guest issue this is
fixing. Want to include a bit more data in the commit log
instead?

> ---
> Not convinced that this is 6.0 material, because IMHO the
> kernel shouldn't be doing this in the first place.
> Do we need to have the property machinery so that old
> virt-5.2 etc retain the previous behaviour ?
> ---
>  include/hw/pci-host/gpex.h |  2 ++
>  hw/pci-host/gpex.c         | 37 +++++++++++++++++++++++++++++++++++--
>  2 files changed, 37 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
> index d48a020a952..ad876ecd209 100644
> --- a/include/hw/pci-host/gpex.h
> +++ b/include/hw/pci-host/gpex.h
> @@ -49,6 +49,8 @@ struct GPEXHost {
>  
>      MemoryRegion io_ioport;
>      MemoryRegion io_mmio;
> +    MemoryRegion io_ioport_window;
> +    MemoryRegion io_mmio_window;
>      qemu_irq irq[GPEX_NUM_IRQS];
>      int irq_num[GPEX_NUM_IRQS];
>  };
> diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
> index 2bdbe7b4561..1f48c89ac6a 100644
> --- a/hw/pci-host/gpex.c
> +++ b/hw/pci-host/gpex.c
> @@ -82,13 +82,46 @@ static void gpex_host_realize(DeviceState *dev, Error **errp)
>      PCIExpressHost *pex = PCIE_HOST_BRIDGE(dev);
>      int i;
>  
> +    /*
> +     * Note that the MemoryRegions io_mmio and io_ioport that we pass
> +     * to pci_register_root_bus() are not the same as the
> +     * MemoryRegions io_mmio_window and io_ioport_window that we
> +     * expose as SysBus MRs. The difference is in the behaviour of
> +     * accesses to addresses where no PCI device has been mapped.
> +     *
> +     * io_mmio and io_ioport are the underlying PCI view of the PCI
> +     * address space, and when a PCI device does a bus master access
> +     * to a bad address this is reported back to it as a transaction
> +     * failure.
> +     *
> +     * io_mmio_window and io_ioport_window implement "unmapped
> +     * addresses read as -1 and ignore writes"; this is traditional
> +     * x86 PC behaviour, which is not mandated by the PCI spec proper
> +     * but expected by much PCI-using guest software, including Linux.
> +     *
> +     * In the interests of not being unnecessarily surprising, we
> +     * implement it in the gpex PCI host controller, by providing the
> +     * _window MRs, which are containers with io ops that implement
> +     * the 'background' behaviour and which hold the real PCI MRs as
> +     * subregions.
> +     */
>      pcie_host_mmcfg_init(pex, PCIE_MMCFG_SIZE_MAX);
>      memory_region_init(&s->io_mmio, OBJECT(s), "gpex_mmio", UINT64_MAX);
>      memory_region_init(&s->io_ioport, OBJECT(s), "gpex_ioport", 64 * 1024);
>  
> +    memory_region_init_io(&s->io_mmio_window, OBJECT(s),
> +                          &unassigned_io_ops, OBJECT(s),
> +                          "gpex_mmio_window", UINT64_MAX);
> +    memory_region_init_io(&s->io_ioport_window, OBJECT(s),
> +                          &unassigned_io_ops, OBJECT(s),
> +                          "gpex_ioport_window", 64 * 1024);
> +
> +    memory_region_add_subregion(&s->io_mmio_window, 0, &s->io_mmio);
> +    memory_region_add_subregion(&s->io_ioport_window, 0, &s->io_ioport);
> +
>      sysbus_init_mmio(sbd, &pex->mmio);
> -    sysbus_init_mmio(sbd, &s->io_mmio);
> -    sysbus_init_mmio(sbd, &s->io_ioport);
> +    sysbus_init_mmio(sbd, &s->io_mmio_window);
> +    sysbus_init_mmio(sbd, &s->io_ioport_window);
>      for (i = 0; i < GPEX_NUM_IRQS; i++) {
>          sysbus_init_irq(sbd, &s->irq[i]);
>          s->irq_num[i] = -1;
> -- 
> 2.20.1


