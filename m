Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lPUVo-0001E5-8z
	for mharc-qemu-riscv@gnu.org; Thu, 25 Mar 2021 14:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPUVg-0001Cx-34; Thu, 25 Mar 2021 14:15:09 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:38885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPUVb-0008Og-4H; Thu, 25 Mar 2021 14:15:04 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 m20-20020a7bcb940000b029010cab7e5a9fso3624490wmi.3; 
 Thu, 25 Mar 2021 11:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aQY57PXl5KgQCcyO+MfsfF9QAvKDZdNHuXYoHurhUcc=;
 b=WwGC8rSNib25wjhN1CU5aNjj/SWOFHXaH0N/ZPlEtrYoNSiOzNH2qt+ZvnILJsh8QZ
 GCFsfyTwy7RwGkno6k+s0/UXVzofM7EzFsAhc1b/AFHArQ7kbK+0plXULPoF+81PrNDd
 TUre/NgYL2cOxTJ+8NXFmLp8GgsHNVYPAcocqkS3CfGnBsT+a+W8DODZ7becLokBFidF
 8jQV+KXYYF9nX5jeyu06HMoz951kSgmtW3TnOKt4eDdbgSqcQY19KbfFTBrelo6VgQqr
 VAfuUC5Cp4ojceE6BK+orB7tdp0CnXLtyvMAHShHrSB3JFQMuxhl+F+KVLREl6Eny98y
 zJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aQY57PXl5KgQCcyO+MfsfF9QAvKDZdNHuXYoHurhUcc=;
 b=DpDMb4BrmigkF6xjEzdYblvWEGgC3HN/UPpb7eBuQVq1quw1OmnOB4Gu5HjnbC2g6L
 kDdX3GTtjMQeQTdFA1sCyjebFpPqxFb9W7QjFyv97oW5pe0Ch3XpxITzdDi4aTP3dikM
 nvbNjCufIiT2sRyWoF4T7NTg2FIzGEvFGmFd5HiKj3L1SEEbeoTUMQPtXNqo8Bx4w5uV
 +DBkg8uqhURhk6ci0+eqfwiTfsq517ii8OFywR+/dagXP3cJ5VV5DSiYBuFzjebjtxqP
 WRmbwoXD1tiASpp5ugfbg1+lK9y0XMyCRItEmqhr8jzgk+AR39EHPBKb773T1n+gg5xd
 RO4w==
X-Gm-Message-State: AOAM5336RGlD2Ez0GOAlLymasNXmFWQ9WGrGfjrZHCVhkJC2efNObjn/
 EwBzT2ma1Hv7V1aaR9+uoqc=
X-Google-Smtp-Source: ABdhPJyEOh4PZBQvBp4nkdavhvziF3p6CytNGJueHJr6yGjVnd/6IFi8EWk3JMfWHPdbesdZM+JXGg==
X-Received: by 2002:a05:600c:203:: with SMTP id 3mr9233774wmi.88.1616696098486; 
 Thu, 25 Mar 2021 11:14:58 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id r14sm8750081wrw.91.2021.03.25.11.14.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 11:14:57 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 for-6.0?] hw/pci-host/gpex: Don't fault for unmapped
 parts of MMIO and PIO windows
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Arnd Bergmann <arnd@arndb.de>,
 Dmitry Vyukov <dvyukov@google.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20210325163315.27724-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1df78911-9858-b747-b22b-7e5254cd3cac@amsat.org>
Date: Thu, 25 Mar 2021 19:14:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210325163315.27724-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 25 Mar 2021 18:15:11 -0000

Hi Peter,

On 3/25/21 5:33 PM, Peter Maydell wrote:
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

I suspect PCI-ISA bridges to provide an EISA bus.

The 'IEEE P996' ISA spec doesn't seem public. Per the Intel
ISA spec:
https://archive.org/details/bitsavers_intelbusSpep89_3342148/page/n31/mode/2up
the data lines are tri-stated, but I couldn't find the default logic
when no add-on card owns the bus at the requested address (to confirm
the "read as -1").

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

EISA -> 4 * GiB

unassigned_io_ops allows 64-bit accesses. Here we want up to 32.

Maybe we don't care.

> +        memory_region_init_io(&s->io_ioport_window, OBJECT(s),
> +                              &unassigned_io_ops, OBJECT(s),
> +                              "gpex_ioport_window", 64 * 1024);

Ditto, unassigned_io_ops accepts 64-bit accesses.

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

IMO this change belongs to the parent bridges,
TYPE_PCI_HOST_BRIDGE and TYPE_PCIE_HOST_BRIDGE.

Again, 6.0 is at the door, so this can be discussed /
updated later.

Regards,

Phil.

