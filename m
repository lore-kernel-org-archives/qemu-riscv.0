Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB618C5ACB3
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 03:45:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r5Hgk-0008TB-TT; Mon, 20 Nov 2023 22:44:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r5Hgj-0008Su-EN; Mon, 20 Nov 2023 22:44:37 -0500
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r5Hgg-0006hp-Ga; Mon, 20 Nov 2023 22:44:37 -0500
Received: by mail-vk1-xa2d.google.com with SMTP id
 71dfb90a1353d-4b04364f302so307557e0c.0; 
 Mon, 20 Nov 2023 19:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700538272; x=1701143072; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2ccPx4TlFpyoOMCihpgv7cp03TApBpzgHyg9361DvHA=;
 b=CssYiS2gJNgSTtPIgmS0Y8y91S+75g7vOjVZb8o/hab6qdtXaruwrkGe3r1MnWcwkE
 g4D4RdrC70J9Z4Gfn4OVv3DhQdC7T8Ab9AIzvhNY9ZFdsaK/8KymshenkeQx8benpJbz
 v7hg4DgVzCRTc1CixL7di2OGI09yLZdrzAL9TkxYhK7vtmh/Xqmx5jaIM+aMgAR8qwEH
 u+c/b7esbL1fWGgts3wqsovkHUOsmP/Q5brqksXzQNWw8PIZe1n8Jfx/MNP14obUuoZz
 EMs+d4xkDLr7r40W+Un83Ai953jahDLlnoyde4J6ntgPoVTLklfXyx59K4qgJTFHuqeI
 l7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700538272; x=1701143072;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2ccPx4TlFpyoOMCihpgv7cp03TApBpzgHyg9361DvHA=;
 b=vwbm54CZMS2JOkaYy/J76JzJbdIt1cYtmMfbdz5Qmeey048A7i7y0qUUI0RFMAiy/5
 Ly9bd/S92/5qq0WKPdYRp5dspCt+6MbcgGnWtp4OBo/+us3m2WIQ6ZDPrLYyt2KhqHJU
 TkD6wDthv9AsBMvic8DU9dxcvSp7JwlTQxekYtRrIqzuO+HWziNxsobSm27I3M4u35Nl
 vacM08Mgm/4ZKpVNsVjrqrx5WUf5neVHxv2QMMcJBTnaj90aXhLaFdGIjt9Mgn882PoD
 GJmaWZTbSdA5G03sqPpPtIfEED/O9wUGbMAqJp0A4nfS/kDMKOMPftKCSsJE8OKCdCNH
 7OmQ==
X-Gm-Message-State: AOJu0YyCezaWVwWYjqA3h2RfpVIE54AM+VFNuuS+/xIbl6y6NSBUdbYK
 iMefWpRpPitmlCor4jo35Ba0+/RucuIesUeP7B4=
X-Google-Smtp-Source: AGHT+IHwE1WGR4U5A9hzycdiwXnlak6gHESc9XXqcXIhrHr8X8aBcTCXa5lrW2+jkHRM5UxPIUAnnan9JT0n2KUnvNw=
X-Received: by 2002:a1f:e4c3:0:b0:4ac:fd8:e8ae with SMTP id
 b186-20020a1fe4c3000000b004ac0fd8e8aemr4624456vkh.1.1700538272466; Mon, 20
 Nov 2023 19:44:32 -0800 (PST)
MIME-Version: 1.0
References: <20231110172559.73209-1-dbarboza@ventanamicro.com>
In-Reply-To: <20231110172559.73209-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 21 Nov 2023 13:44:05 +1000
Message-ID: <CAKmqyKMdPTAN-NRwtALctnC9ePLjOVZJbZPvcJNY7G8g+k0ZyA@mail.gmail.com>
Subject: Re: [PATCH for-8.2] hw/riscv/virt.c: do create_fdt() earlier,
 add finalize_fdt()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Sat, Nov 11, 2023 at 3:26=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Commit 49554856f0 fixed a problem, where TPM devices were not appearing
> in the FDT, by delaying the FDT creation up until virt_machine_done().
> This create a side effect (see gitlab #1925) - devices that need access
> to the '/chosen' FDT node during realize() stopped working because, at
> that point, we don't have a FDT.
>
> This happens because our FDT creation is monolithic, but it doesn't need
> to be. We can add the needed FDT components for realize() time and, at
> the same time, do another FDT round where we account for dynamic sysbus
> devices.  In other words, the problem fixed by 49554856f0 could also be
> fixed by postponing only create_fdt_sockets() and its dependencies,
> leaving everything else from create_fdt() to be done during init().
>
> Split the FDT creation in two parts:
>
> - create_fdt(), now moved back to virt_machine_init(), will create FDT
>   nodes that doesn't depend on additional (dynamic) devices from the
>   sysbus;
>
> - a new finalize_fdt() step is added, where create_fdt_sockets() and
>   friends is executed, accounting for the dynamic sysbus devices that
>   were added during realize().
>
> This will make both use cases happy: TPM devices are still working as
> intended, and devices such as 'guest-loader' have a FDT to work on
> during realize().
>
> Fixes: 49554856f0 ("riscv: Generate devicetree only after machine initial=
ization is complete")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1925
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/riscv/virt.c | 71 +++++++++++++++++++++++++++++--------------------
>  1 file changed, 42 insertions(+), 29 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index c7fc97e273..d2eac24156 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -962,7 +962,6 @@ static void create_fdt_uart(RISCVVirtState *s, const =
MemMapEntry *memmap,
>          qemu_fdt_setprop_cells(ms->fdt, name, "interrupts", UART0_IRQ, 0=
x4);
>      }
>
> -    qemu_fdt_add_subnode(ms->fdt, "/chosen");
>      qemu_fdt_setprop_string(ms->fdt, "/chosen", "stdout-path", name);
>      g_free(name);
>  }
> @@ -1023,11 +1022,29 @@ static void create_fdt_fw_cfg(RISCVVirtState *s, =
const MemMapEntry *memmap)
>      g_free(nodename);
>  }
>
> -static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap)
> +static void finalize_fdt(RISCVVirtState *s)
>  {
> -    MachineState *ms =3D MACHINE(s);
>      uint32_t phandle =3D 1, irq_mmio_phandle =3D 1, msi_pcie_phandle =3D=
 1;
>      uint32_t irq_pcie_phandle =3D 1, irq_virtio_phandle =3D 1;
> +
> +    create_fdt_sockets(s, virt_memmap, &phandle, &irq_mmio_phandle,
> +                       &irq_pcie_phandle, &irq_virtio_phandle,
> +                       &msi_pcie_phandle);
> +
> +    create_fdt_virtio(s, virt_memmap, irq_virtio_phandle);
> +
> +    create_fdt_pcie(s, virt_memmap, irq_pcie_phandle, msi_pcie_phandle);
> +
> +    create_fdt_reset(s, virt_memmap, &phandle);
> +
> +    create_fdt_uart(s, virt_memmap, irq_mmio_phandle);
> +
> +    create_fdt_rtc(s, virt_memmap, irq_mmio_phandle);
> +}
> +
> +static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap)
> +{
> +    MachineState *ms =3D MACHINE(s);
>      uint8_t rng_seed[32];
>
>      ms->fdt =3D create_device_tree(&s->fdt_size);
> @@ -1047,28 +1064,16 @@ static void create_fdt(RISCVVirtState *s, const M=
emMapEntry *memmap)
>      qemu_fdt_setprop_cell(ms->fdt, "/soc", "#size-cells", 0x2);
>      qemu_fdt_setprop_cell(ms->fdt, "/soc", "#address-cells", 0x2);
>
> -    create_fdt_sockets(s, memmap, &phandle, &irq_mmio_phandle,
> -                       &irq_pcie_phandle, &irq_virtio_phandle,
> -                       &msi_pcie_phandle);
> -
> -    create_fdt_virtio(s, memmap, irq_virtio_phandle);
> -
> -    create_fdt_pcie(s, memmap, irq_pcie_phandle, msi_pcie_phandle);
> -
> -    create_fdt_reset(s, memmap, &phandle);
> -
> -    create_fdt_uart(s, memmap, irq_mmio_phandle);
> -
> -    create_fdt_rtc(s, memmap, irq_mmio_phandle);
> -
> -    create_fdt_flash(s, memmap);
> -    create_fdt_fw_cfg(s, memmap);
> -    create_fdt_pmu(s);
> +    qemu_fdt_add_subnode(ms->fdt, "/chosen");
>
>      /* Pass seed to RNG */
>      qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
>      qemu_fdt_setprop(ms->fdt, "/chosen", "rng-seed",
>                       rng_seed, sizeof(rng_seed));
> +
> +    create_fdt_flash(s, memmap);
> +    create_fdt_fw_cfg(s, memmap);
> +    create_fdt_pmu(s);
>  }
>
>  static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
> @@ -1257,15 +1262,12 @@ static void virt_machine_done(Notifier *notifier,=
 void *data)
>      uint64_t kernel_entry =3D 0;
>      BlockBackend *pflash_blk0;
>
> -    /* load/create device tree */
> -    if (machine->dtb) {
> -        machine->fdt =3D load_device_tree(machine->dtb, &s->fdt_size);
> -        if (!machine->fdt) {
> -            error_report("load_device_tree() failed");
> -            exit(1);
> -        }
> -    } else {
> -        create_fdt(s, memmap);
> +    /*
> +     * An user provided dtb must include everything, including
> +     * dynamic sysbus devices. Our FDT needs to be finalized.
> +     */
> +    if (machine->dtb =3D=3D NULL) {
> +        finalize_fdt(s);
>      }
>
>      /*
> @@ -1541,6 +1543,17 @@ static void virt_machine_init(MachineState *machin=
e)
>      }
>      virt_flash_map(s, system_memory);
>
> +    /* load/create device tree */
> +    if (machine->dtb) {
> +        machine->fdt =3D load_device_tree(machine->dtb, &s->fdt_size);
> +        if (!machine->fdt) {
> +            error_report("load_device_tree() failed");
> +            exit(1);
> +        }
> +    } else {
> +        create_fdt(s, memmap);
> +    }
> +
>      s->machine_done.notify =3D virt_machine_done;
>      qemu_add_machine_init_done_notifier(&s->machine_done);
>  }
> --
> 2.41.0
>
>

