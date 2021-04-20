Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lYnYb-0005aJ-RV
	for mharc-qemu-riscv@gnu.org; Tue, 20 Apr 2021 06:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lYnYa-0005Zl-AQ
 for qemu-riscv@nongnu.org; Tue, 20 Apr 2021 06:24:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lYnYW-0004yK-3T
 for qemu-riscv@nongnu.org; Tue, 20 Apr 2021 06:24:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618914271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UzlMlCY0WRFXaPEEeGEAB9ltmYX9QPJYFNCEUH3SBXU=;
 b=IoqbIDcY0vSGRZVESbBJzZM7zLocAQXLY8TLMHv5FboCMkSBN2jIMGqCDPh5ooiYx+GUlz
 4zHbrJj6zpn+bWHUDaYZAsPkaqzoDmTHVf4tD7nG1VTtX/buBS2jYaWvhbSvzhar6EAuy5
 E0qsdxT25uPxZxyFgNmYoRFdZGsWA1Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-SzmaTITzOoekFPXYsAwGLA-1; Tue, 20 Apr 2021 06:24:28 -0400
X-MC-Unique: SzmaTITzOoekFPXYsAwGLA-1
Received: by mail-wr1-f71.google.com with SMTP id
 91-20020adf92640000b02901060747826eso8877047wrj.13
 for <qemu-riscv@nongnu.org>; Tue, 20 Apr 2021 03:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UzlMlCY0WRFXaPEEeGEAB9ltmYX9QPJYFNCEUH3SBXU=;
 b=quUxn8X5rUCwdI+e5U+QcTqfZXYJItda7iW/F53voIo0r0o18WqmqrfFR8KcBbn51D
 CX554k1gMuf1ulqQNmnFwjRwkKbsQm98VGXjyZm/hmMyZ+gLsoXTg2qK2SSZ1uV8xuqK
 42pCCbgCuTB2t0eX448uTNHXVhBGOl+Jxl/SWv/trOyvuBf8c+1Y722tICm5EePo3EVp
 EFecwa6lbXIRIJaDvta0qFB7X9kq3CJY6n6yCAIJw24g6m5sMMOJYUYFK1/PJQA7zbOo
 IQstDuUnxEgHpQQOld0FT45xHPSrTBylrIXaseJH+LS1+pwSczGEt54HEr/I3Ezpcna8
 cCYQ==
X-Gm-Message-State: AOAM533PxKsar5fAONXUGZQmz4OXgZoGQu7z31hfcFvqWtRAwPYo4y0q
 9ClGFp3Twc20TlanTjHJbUz1hImPBDXX3766skmSgwuR9c/wkl9/0XRDjKktLB2bSHfWVB89mxC
 qQYHe1PhjQzKD7O0=
X-Received: by 2002:a05:6000:1449:: with SMTP id
 v9mr20040193wrx.295.1618914266685; 
 Tue, 20 Apr 2021 03:24:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYhj4kXNWPtjhDfeJolN3yNspvsHH+A0Ebw5S9rfqXHQJ4ziygrWT97/vrfyi3dwUOW9J6ww==
X-Received: by 2002:a05:6000:1449:: with SMTP id
 v9mr20040168wrx.295.1618914266457; 
 Tue, 20 Apr 2021 03:24:26 -0700 (PDT)
Received: from redhat.com ([2a10:800a:cdef:0:114d:2085:61e4:7b41])
 by smtp.gmail.com with ESMTPSA id c18sm26661591wrn.92.2021.04.20.03.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 03:24:25 -0700 (PDT)
Date: Tue, 20 Apr 2021 06:24:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Dmitry Vyukov <dvyukov@google.com>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 for-6.0?] hw/pci-host/gpex: Don't fault for unmapped
 parts of MMIO and PIO windows
Message-ID: <20210420062357-mutt-send-email-mst@kernel.org>
References: <20210325163315.27724-1-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210325163315.27724-1-peter.maydell@linaro.org>
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
X-List-Received-Date: Tue, 20 Apr 2021 10:24:36 -0000

On Thu, Mar 25, 2021 at 04:33:15PM +0000, Peter Maydell wrote:
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
> The old behaviour generally didn't cause any problems, because
> almost always the guest OS will map the PCI devices and then only
> access where it has mapped them. One corner case where you will see
> this kind of access is if Linux attempts to probe legacy ISA
> devices via a PIO window access. So far the only case where we've
> seen this has been via the syzkaller fuzzer.
> 
> Reported-by: Dmitry Vyukov <dvyukov@google.com>
> Fixes: https://bugs.launchpad.net/qemu/+bug/1918917
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>


Looks ok superficially

Acked-by: Michael S. Tsirkin <mst@redhat.com>

Peter pls merge if appropriate.

> ---
> v1->v2 changes: put in the hw_compat machinery.
> 
> Still not sure if I want to put this in 6.0 or not.
> 
>  include/hw/pci-host/gpex.h |  4 +++
>  hw/core/machine.c          |  1 +
>  hw/pci-host/gpex.c         | 56 ++++++++++++++++++++++++++++++++++++--
>  3 files changed, 58 insertions(+), 3 deletions(-)
> 
> diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
> index d48a020a952..fcf8b638200 100644
> --- a/include/hw/pci-host/gpex.h
> +++ b/include/hw/pci-host/gpex.h
> @@ -49,8 +49,12 @@ struct GPEXHost {
>  
>      MemoryRegion io_ioport;
>      MemoryRegion io_mmio;
> +    MemoryRegion io_ioport_window;
> +    MemoryRegion io_mmio_window;
>      qemu_irq irq[GPEX_NUM_IRQS];
>      int irq_num[GPEX_NUM_IRQS];
> +
> +    bool allow_unmapped_accesses;
>  };
>  
>  struct GPEXConfig {
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 257a664ea2e..9750fad7435 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -41,6 +41,7 @@ GlobalProperty hw_compat_5_2[] = {
>      { "PIIX4_PM", "smm-compat", "on"},
>      { "virtio-blk-device", "report-discard-granularity", "off" },
>      { "virtio-net-pci", "vectors", "3"},
> +    { "gpex-pcihost", "allow-unmapped-accesses", "false" },
>  };
>  const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
>  
> diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
> index 2bdbe7b4561..a6752fac5e8 100644
> --- a/hw/pci-host/gpex.c
> +++ b/hw/pci-host/gpex.c
> @@ -83,12 +83,51 @@ static void gpex_host_realize(DeviceState *dev, Error **errp)
>      int i;
>  
>      pcie_host_mmcfg_init(pex, PCIE_MMCFG_SIZE_MAX);
> +    sysbus_init_mmio(sbd, &pex->mmio);
> +
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
>      memory_region_init(&s->io_mmio, OBJECT(s), "gpex_mmio", UINT64_MAX);
>      memory_region_init(&s->io_ioport, OBJECT(s), "gpex_ioport", 64 * 1024);
>  
> -    sysbus_init_mmio(sbd, &pex->mmio);
> -    sysbus_init_mmio(sbd, &s->io_mmio);
> -    sysbus_init_mmio(sbd, &s->io_ioport);
> +    if (s->allow_unmapped_accesses) {
> +        memory_region_init_io(&s->io_mmio_window, OBJECT(s),
> +                              &unassigned_io_ops, OBJECT(s),
> +                              "gpex_mmio_window", UINT64_MAX);
> +        memory_region_init_io(&s->io_ioport_window, OBJECT(s),
> +                              &unassigned_io_ops, OBJECT(s),
> +                              "gpex_ioport_window", 64 * 1024);
> +
> +        memory_region_add_subregion(&s->io_mmio_window, 0, &s->io_mmio);
> +        memory_region_add_subregion(&s->io_ioport_window, 0, &s->io_ioport);
> +        sysbus_init_mmio(sbd, &s->io_mmio_window);
> +        sysbus_init_mmio(sbd, &s->io_ioport_window);
> +    } else {
> +        sysbus_init_mmio(sbd, &s->io_mmio);
> +        sysbus_init_mmio(sbd, &s->io_ioport);
> +    }
> +
>      for (i = 0; i < GPEX_NUM_IRQS; i++) {
>          sysbus_init_irq(sbd, &s->irq[i]);
>          s->irq_num[i] = -1;
> @@ -108,6 +147,16 @@ static const char *gpex_host_root_bus_path(PCIHostState *host_bridge,
>      return "0000:00";
>  }
>  
> +static Property gpex_host_properties[] = {
> +    /*
> +     * Permit CPU accesses to unmapped areas of the PIO and MMIO windows
> +     * (discarding writes and returning -1 for reads) rather than aborting.
> +     */
> +    DEFINE_PROP_BOOL("allow-unmapped-accesses", GPEXHost,
> +                     allow_unmapped_accesses, true),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>  static void gpex_host_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -117,6 +166,7 @@ static void gpex_host_class_init(ObjectClass *klass, void *data)
>      dc->realize = gpex_host_realize;
>      set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>      dc->fw_name = "pci";
> +    device_class_set_props(dc, gpex_host_properties);
>  }
>  
>  static void gpex_host_initfn(Object *obj)
> -- 
> 2.20.1


