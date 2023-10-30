Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6C3C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 02:51:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxIND-0004Gj-P9; Sun, 29 Oct 2023 22:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qxIN8-0004FP-AN; Sun, 29 Oct 2023 22:51:23 -0400
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qxIN6-0002BS-M8; Sun, 29 Oct 2023 22:51:22 -0400
Received: by mail-vs1-xe30.google.com with SMTP id
 ada2fe7eead31-458289fb60bso1539168137.0; 
 Sun, 29 Oct 2023 19:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698634278; x=1699239078; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZOVY9HgftFWKJq8z/RFAX/EipujfuR5ixNs8c9pdxX0=;
 b=G//BQyY3JKlwHUVy3Nln4J1CT1weeRVUuHt/34iaJ4IzsAYl8ziq2jmFta0qztRUli
 0wHLSl3Usi4WoqfQsBNpafr+JqfhlUOQSsHS/v5Z0smUysbphYBNfofsV7tebdySJTCM
 Bc4WoknWd/0LB+wjDkIQzRz4rYETu4212F5R/4gzid4BlT54bEYFVrPJTos1ns6CMr3B
 nmbiLrueNQV4VRiDQna55z+jP0fYXXwn34xqQi1NKdn9xNoh4L08oxecP5fL+hBprC5s
 JOCDy+3XQTr0cQRnVEQlw0+M6nMpW1aUm9MIOIqwh/vmUFgcKcG7Dhm0I9jzw+qdVz5J
 YH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698634278; x=1699239078;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZOVY9HgftFWKJq8z/RFAX/EipujfuR5ixNs8c9pdxX0=;
 b=pflxVpofYEbnz0kJ7SPs8jPz6DvqjLc6+O12bvxSMSYojKN3mkulfhmDIzQawoYpdx
 FwpNiZWKT9gDx0jy+b/S80yQNysFzW8n9mc53aajtKbfMu04htetcrqoTuwnVAuntgQ8
 J5Tu+zAixBWmNQYgJ3p9RXwhKVhasCgJBn+wlTT5bTsOgg+9q/LBK1h+1xQTDN5CuF1D
 EElzossZ6xalb/SLFc/tw0vrA5a9D9BgHji70GxH/+8VdpTk2nhJMAXBke7uvWxqjIAf
 8PeGV6TIQxg1TXmeZY6FtUDKXoPL5BlVFvq2iVAoOIRQJc+SX9RgsTS+nWWlKteEJ+p/
 IrVg==
X-Gm-Message-State: AOJu0Yy7dsTZWYBhPvKCKqcVe4YUVV5okokfdqcG/7almhU5ENvP42r+
 jDQ2mkjHQ/uzW6eglRMxGFGk1lvu9yU35tV57s4=
X-Google-Smtp-Source: AGHT+IE7X7XJhNGmy9sjEpN6h8tZO9t2/I9BxwS+u0HYpGbPBYmhBCW/Gmq6IA+ZdpjhwaBRApFRyWmjn0piW5cCSuw=
X-Received: by 2002:a05:6102:355a:b0:457:cc6c:9491 with SMTP id
 e26-20020a056102355a00b00457cc6c9491mr7726524vss.17.1698634278418; Sun, 29
 Oct 2023 19:51:18 -0700 (PDT)
MIME-Version: 1.0
References: <20231025200713.580814-1-sunilvl@ventanamicro.com>
 <20231025200713.580814-12-sunilvl@ventanamicro.com>
In-Reply-To: <20231025200713.580814-12-sunilvl@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Oct 2023 12:50:51 +1000
Message-ID: <CAKmqyKN8LxhFRtxNWvd34TjUeaDrshBe59wQF+O4HiF1baM8Ew@mail.gmail.com>
Subject: Re: [PATCH v4 11/13] hw/riscv/virt: Update GPEX MMIO related
 properties
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, 
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe30.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Oct 26, 2023 at 6:09=E2=80=AFAM Sunil V L <sunilvl@ventanamicro.com=
> wrote:
>
> Update the GPEX host bridge properties related to MMIO ranges with
> values set for the virt machine.
>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c         | 47 ++++++++++++++++++++++++++++-------------
>  include/hw/riscv/virt.h |  1 +
>  2 files changed, 33 insertions(+), 15 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 085654ab2f..e64886a4d8 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1049,21 +1049,45 @@ static void create_fdt(RISCVVirtState *s, const M=
emMapEntry *memmap)
>  }
>
>  static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
> -                                          hwaddr ecam_base, hwaddr ecam_=
size,
> -                                          hwaddr mmio_base, hwaddr mmio_=
size,
> -                                          hwaddr high_mmio_base,
> -                                          hwaddr high_mmio_size,
> -                                          hwaddr pio_base,
> -                                          DeviceState *irqchip)
> +                                          DeviceState *irqchip,
> +                                          RISCVVirtState *s)
>  {
>      DeviceState *dev;
>      MemoryRegion *ecam_alias, *ecam_reg;
>      MemoryRegion *mmio_alias, *high_mmio_alias, *mmio_reg;
> +    hwaddr ecam_base =3D s->memmap[VIRT_PCIE_ECAM].base;
> +    hwaddr ecam_size =3D s->memmap[VIRT_PCIE_ECAM].size;
> +    hwaddr mmio_base =3D s->memmap[VIRT_PCIE_MMIO].base;
> +    hwaddr mmio_size =3D s->memmap[VIRT_PCIE_MMIO].size;
> +    hwaddr high_mmio_base =3D virt_high_pcie_memmap.base;
> +    hwaddr high_mmio_size =3D virt_high_pcie_memmap.size;
> +    hwaddr pio_base =3D s->memmap[VIRT_PCIE_PIO].base;
> +    hwaddr pio_size =3D s->memmap[VIRT_PCIE_PIO].size;
>      qemu_irq irq;
>      int i;
>
>      dev =3D qdev_new(TYPE_GPEX_HOST);
>
> +    /* Set GPEX object properties for the virt machine */
> +    object_property_set_uint(OBJECT(GPEX_HOST(dev)), PCI_HOST_ECAM_BASE,
> +                            ecam_base, NULL);
> +    object_property_set_int(OBJECT(GPEX_HOST(dev)), PCI_HOST_ECAM_SIZE,
> +                            ecam_size, NULL);
> +    object_property_set_uint(OBJECT(GPEX_HOST(dev)),
> +                             PCI_HOST_BELOW_4G_MMIO_BASE,
> +                             mmio_base, NULL);
> +    object_property_set_int(OBJECT(GPEX_HOST(dev)), PCI_HOST_BELOW_4G_MM=
IO_SIZE,
> +                            mmio_size, NULL);
> +    object_property_set_uint(OBJECT(GPEX_HOST(dev)),
> +                             PCI_HOST_ABOVE_4G_MMIO_BASE,
> +                             high_mmio_base, NULL);
> +    object_property_set_int(OBJECT(GPEX_HOST(dev)), PCI_HOST_ABOVE_4G_MM=
IO_SIZE,
> +                            high_mmio_size, NULL);
> +    object_property_set_uint(OBJECT(GPEX_HOST(dev)), PCI_HOST_PIO_BASE,
> +                            pio_base, NULL);
> +    object_property_set_int(OBJECT(GPEX_HOST(dev)), PCI_HOST_PIO_SIZE,
> +                            pio_size, NULL);
> +
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>
>      ecam_alias =3D g_new0(MemoryRegion, 1);
> @@ -1094,6 +1118,7 @@ static inline DeviceState *gpex_pcie_init(MemoryReg=
ion *sys_mem,
>          gpex_set_irq_num(GPEX_HOST(dev), i, PCIE_IRQ + i);
>      }
>
> +    GPEX_HOST(dev)->gpex_cfg.bus =3D PCI_HOST_BRIDGE(GPEX_HOST(dev))->bu=
s;
>      return dev;
>  }
>
> @@ -1492,15 +1517,7 @@ static void virt_machine_init(MachineState *machin=
e)
>              qdev_get_gpio_in(virtio_irqchip, VIRTIO_IRQ + i));
>      }
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
>      create_platform_bus(s, mmio_irqchip);
>
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index 5b03575ed3..f89790fd58 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -61,6 +61,7 @@ struct RISCVVirtState {
>      char *oem_table_id;
>      OnOffAuto acpi;
>      const MemMapEntry *memmap;
> +    struct GPEXHost *gpex_host;
>  };
>
>  enum {
> --
> 2.39.2
>
>

