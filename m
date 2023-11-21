Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30C6C5ACB3
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 03:41:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r5Hcw-00073D-BT; Mon, 20 Nov 2023 22:40:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r5Hcm-00071T-Ln; Mon, 20 Nov 2023 22:40:34 -0500
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r5Hch-00068i-GP; Mon, 20 Nov 2023 22:40:29 -0500
Received: by mail-vs1-xe2b.google.com with SMTP id
 ada2fe7eead31-462a978c470so389807137.2; 
 Mon, 20 Nov 2023 19:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700538026; x=1701142826; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YsvfmkwbkOWtfjfP0vdeXgJ8yWZPDqANGzEUMkzDFk0=;
 b=GKLRoVsOUb4sf02r5m7W+FtvxubJC4cF+s82rhmS18in431X7Me/5d2I2SAeKv0Dpr
 xnEe/kkGUPdyMMwmtr4Uy4HG/NXgw9v7h7haWOjlZDfqahLfC/Csgqy7oT9uyEd6YuX7
 KudnJgJF0/vKCziuclSEaHwcWrcx+I1CywqkgjERSQXX/HNQMpzFT7FKq92Qc5/I/mHs
 tSbv6EwsCgf81vrDFzHHYljHlFW/Cp2JZzsnOdXlAHHrfgVvZRpRinhkY5NCLOuCBT/H
 8TV8ts8ZiouYaAFtly5UZ4U6wCV1tLS9JQDcu1cC79ge+Ces0qGflfDb+gbGs0y4kx96
 Q4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700538026; x=1701142826;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YsvfmkwbkOWtfjfP0vdeXgJ8yWZPDqANGzEUMkzDFk0=;
 b=EPG6H5ZIcxkL+pQCfHeXp2XBboUD/B8aLrYxrE52dPCWR7y5HpqYhP0Zdc6iACFR2d
 wgBuQ5/kcGqNisBATse+feT2iVlGypbd4Zc5GFaraakpg2DfeQDfIC52P17p/Xs2meIU
 W6sx5+95ptRZpL9FhPSlP31oSbpGS91yL1tL/FsqU1zLClkbuFC28Ji47GrnPWYv3EK5
 vgUT+K3js2OTIAVL/bx4tlD0ZIYNeksG4J6TQTDqYgDMQsreJBLqnX7t4khuaO1trIA/
 XaD7QP+1voY46gT6ggiGL7rBh1AzXSpNUSJEi/RWnPKoog7G6pVjaJ0bsXbjKmhjmEbe
 UnNw==
X-Gm-Message-State: AOJu0YwKsyPcrz82VeltgR+SFl6pqnJX1oHzdyT/PH1bzhx4DTr8p0iK
 0aHu9FdSymV3gfHqkPLH0WpOdjWs156VOl9dm4I=
X-Google-Smtp-Source: AGHT+IG2Ag/ulWnnJBdUQ5x4VqTAHIVAUogsAzMYq7ut+XbgO/DUPw34F2SVD43EFyUxIblUuRzmaoBC1XpRepne1pk=
X-Received: by 2002:a05:6102:4695:b0:460:f36e:beee with SMTP id
 dw21-20020a056102469500b00460f36ebeeemr4420744vsb.30.1700538025814; Mon, 20
 Nov 2023 19:40:25 -0800 (PST)
MIME-Version: 1.0
References: <20231110172559.73209-1-dbarboza@ventanamicro.com>
In-Reply-To: <20231110172559.73209-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 21 Nov 2023 13:39:59 +1000
Message-ID: <CAKmqyKM_Y35O-t=QFg=-G7GXrA-rOe2T6wht4Ph-OBbX3+UFMA@mail.gmail.com>
Subject: Re: [PATCH for-8.2] hw/riscv/virt.c: do create_fdt() earlier,
 add finalize_fdt()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2b.google.com
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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

