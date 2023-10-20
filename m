Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D332BCDB47E
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 11:48:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtnz0-0007lw-1m; Fri, 20 Oct 2023 07:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qtnyt-0007ZV-CU
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 07:47:59 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qtnyn-000598-EW
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 07:47:55 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1ca6809fb8aso5261405ad.1
 for <qemu-riscv@nongnu.org>; Fri, 20 Oct 2023 04:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697802459; x=1698407259; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y85EpA4qfM/Xl7cuFTNb/PevodubnQnKmuyXDqJie4c=;
 b=lpHum43RoKbGYsx/VINc/M1KH6qx32H1nZ1obxA1AU/nVAHXcMnvP3ExGnpjbM8BgC
 Cn8fG6Lt4BOnTwbmWSahzzWFClflNpdKso9o5OOLJFQqAGUFGT/O5g44TNWLz4+G93TZ
 B446tsArrjMo6sJ0aWs3+dBxftucMd6kAJtTPRl9Gda7bU5pkm0YszTxVgSMIpBB1Hbb
 JTbsqP+upzuFZ3GK8LTYhaRWsUA+ejWhse/ID04TFKJ+OzMpZT/PgyN/5micmJpXP0wf
 t+x2NBnzk2P6hYa9PzZ8zyy6HVAwu6wrqPHMOcIkRITNUH0uS8OZnzYuaOfyTK+9lkNe
 lhKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697802459; x=1698407259;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y85EpA4qfM/Xl7cuFTNb/PevodubnQnKmuyXDqJie4c=;
 b=dLNDY1r6iG62GVP5jenbTbtsrVOO4DWvMwmK1f1SfNRsgsFpmKRV95Gx5+7RZz2nC7
 rNgwvSOA3CZccTGZiohm67FrnXnDreMx6uDTii4zH8RjlGm4/GqfORjDqxCx/53oWBMU
 jcaHIO8wkj0swdG2cokSBu5Gf8eMa3kybUImzcXuScAtAXQJ/T9gDLhQcXdBa8hlzj+T
 PuYxheM+Z77CTSpSeD9M/rzAtF6ktN6mEpkbVnybvYZ82Dc2Nb6vBUigOQ/ZELf+HMW6
 ePJKa+shluwMNLvzxf5wIbp4/kPYCn1u7vPuw43PMKhznbLUVXuhBU0ryVNmHRr/C3Cy
 cu7g==
X-Gm-Message-State: AOJu0Yzuf7Q6MgervAoekxn/Qxkn5GYZAAyWapRDB9KwzxjHnUOtxaqN
 R35ZkvZv6AKc7rlaCi3j5zvfnw==
X-Google-Smtp-Source: AGHT+IE0M1vNEqP+7nAMn84pWn7D3grfUwTo9bylbnVIwbmTA1w1E9Akgl+sBShISkO5MECzkG9jqw==
X-Received: by 2002:a17:902:db11:b0:1ca:8cb0:7ff5 with SMTP id
 m17-20020a170902db1100b001ca8cb07ff5mr1947567plx.9.1697802459150; 
 Fri, 20 Oct 2023 04:47:39 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bdcd:fb00:6501:2693:db52:c621?
 ([2804:7f0:bdcd:fb00:6501:2693:db52:c621])
 by smtp.gmail.com with ESMTPSA id
 i17-20020a17090332d100b001c32fd9e412sm1349188plr.58.2023.10.20.04.47.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Oct 2023 04:47:38 -0700 (PDT)
Message-ID: <7e5ca488-4fc4-4a53-a092-28740adae806@ventanamicro.com>
Date: Fri, 20 Oct 2023 08:47:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/12] hw/riscv/virt: Update GPEX MMIO related
 properties
Content-Language: en-US
To: Sunil V L <sunilvl@ventanamicro.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>, Andrew Jones
 <ajones@ventanamicro.com>, Atish Kumar Patra <atishp@rivosinc.com>,
 Haibo Xu <haibo1.xu@intel.com>
References: <20231019132648.23703-1-sunilvl@ventanamicro.com>
 <20231019132648.23703-11-sunilvl@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231019132648.23703-11-sunilvl@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 10/19/23 10:26, Sunil V L wrote:
> Update the GPEX host bridge properties related to MMIO ranges with values
> set for the virt machine.
> 
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/riscv/virt.c         | 47 ++++++++++++++++++++++++++++-------------
>   include/hw/riscv/virt.h |  1 +
>   2 files changed, 33 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 085654ab2f..e64886a4d8 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1049,21 +1049,45 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap)
>   }
>   
>   static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
> -                                          hwaddr ecam_base, hwaddr ecam_size,
> -                                          hwaddr mmio_base, hwaddr mmio_size,
> -                                          hwaddr high_mmio_base,
> -                                          hwaddr high_mmio_size,
> -                                          hwaddr pio_base,
> -                                          DeviceState *irqchip)
> +                                          DeviceState *irqchip,
> +                                          RISCVVirtState *s)
>   {
>       DeviceState *dev;
>       MemoryRegion *ecam_alias, *ecam_reg;
>       MemoryRegion *mmio_alias, *high_mmio_alias, *mmio_reg;
> +    hwaddr ecam_base = s->memmap[VIRT_PCIE_ECAM].base;
> +    hwaddr ecam_size = s->memmap[VIRT_PCIE_ECAM].size;
> +    hwaddr mmio_base = s->memmap[VIRT_PCIE_MMIO].base;
> +    hwaddr mmio_size = s->memmap[VIRT_PCIE_MMIO].size;
> +    hwaddr high_mmio_base = virt_high_pcie_memmap.base;
> +    hwaddr high_mmio_size = virt_high_pcie_memmap.size;
> +    hwaddr pio_base = s->memmap[VIRT_PCIE_PIO].base;
> +    hwaddr pio_size = s->memmap[VIRT_PCIE_PIO].size;
>       qemu_irq irq;
>       int i;
>   
>       dev = qdev_new(TYPE_GPEX_HOST);
>   
> +    /* Set GPEX object properties for the virt machine */
> +    object_property_set_uint(OBJECT(GPEX_HOST(dev)), PCI_HOST_ECAM_BASE,
> +                            ecam_base, NULL);
> +    object_property_set_int(OBJECT(GPEX_HOST(dev)), PCI_HOST_ECAM_SIZE,
> +                            ecam_size, NULL);
> +    object_property_set_uint(OBJECT(GPEX_HOST(dev)),
> +                             PCI_HOST_BELOW_4G_MMIO_BASE,
> +                             mmio_base, NULL);
> +    object_property_set_int(OBJECT(GPEX_HOST(dev)), PCI_HOST_BELOW_4G_MMIO_SIZE,
> +                            mmio_size, NULL);
> +    object_property_set_uint(OBJECT(GPEX_HOST(dev)),
> +                             PCI_HOST_ABOVE_4G_MMIO_BASE,
> +                             high_mmio_base, NULL);
> +    object_property_set_int(OBJECT(GPEX_HOST(dev)), PCI_HOST_ABOVE_4G_MMIO_SIZE,
> +                            high_mmio_size, NULL);
> +    object_property_set_uint(OBJECT(GPEX_HOST(dev)), PCI_HOST_PIO_BASE,
> +                            pio_base, NULL);
> +    object_property_set_int(OBJECT(GPEX_HOST(dev)), PCI_HOST_PIO_SIZE,
> +                            pio_size, NULL);
> +
>       sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>   
>       ecam_alias = g_new0(MemoryRegion, 1);
> @@ -1094,6 +1118,7 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
>           gpex_set_irq_num(GPEX_HOST(dev), i, PCIE_IRQ + i);
>       }
>   
> +    GPEX_HOST(dev)->gpex_cfg.bus = PCI_HOST_BRIDGE(GPEX_HOST(dev))->bus;
>       return dev;
>   }
>   
> @@ -1492,15 +1517,7 @@ static void virt_machine_init(MachineState *machine)
>               qdev_get_gpio_in(virtio_irqchip, VIRTIO_IRQ + i));
>       }
>   
> -    gpex_pcie_init(system_memory,
> -                   memmap[VIRT_PCIE_ECAM].base,
> -                   memmap[VIRT_PCIE_ECAM].size,
> -                   memmap[VIRT_PCIE_MMIO].base,
> -                   memmap[VIRT_PCIE_MMIO].size,
> -                   virt_high_pcie_memmap.base,
> -                   virt_high_pcie_memmap.size,
> -                   memmap[VIRT_PCIE_PIO].base,
> -                   pcie_irqchip);
> +    gpex_pcie_init(system_memory, pcie_irqchip, s);
>   
>       create_platform_bus(s, mmio_irqchip);
>   
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index 5b03575ed3..f89790fd58 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -61,6 +61,7 @@ struct RISCVVirtState {
>       char *oem_table_id;
>       OnOffAuto acpi;
>       const MemMapEntry *memmap;
> +    struct GPEXHost *gpex_host;
>   };
>   
>   enum {

