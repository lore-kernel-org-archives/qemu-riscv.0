Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNO7N-0002XS-Uo
	for mharc-qemu-riscv@gnu.org; Wed, 01 Feb 2023 20:10:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pNO7L-0002X5-Ke; Wed, 01 Feb 2023 20:10:23 -0500
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pNO7J-0004xp-1T; Wed, 01 Feb 2023 20:10:23 -0500
Received: by mail-vs1-xe32.google.com with SMTP id s24so224253vsi.12;
 Wed, 01 Feb 2023 17:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QeQVvqiokQ0Jy8LM7YsIqyG1uH1AhxSWuzPikfPrTtM=;
 b=GTrvIqjOR8GLJmGwsiIgx0YOZM+Bq62C9nXtrDxhxXm+bPMsMYaE+vCe7bW3a/+AZC
 LoHglo/tbD7eX1RAfDey6Om/YcU8f2P9N8hsnXHDPykz3A1AQOMXexp03bXn/YU8hkTR
 zxUlJGuYzrK9B109JaBKUYJ1PLXJuTtHBx1rMQPvq0mZguLvUOmnjH7eEeEW3vofadur
 do4pXoM5U4N2VaQUpBaCyrgHGnMxM1fy+JFGB+R2pAOYcBQeak1lqT2CQl12rFtf1+ax
 HC9fxONU5Y6ehnv3jNP5I0o2HhzHKxmVlFWr3vXs5gPwp+m7xNzeifEvphJ1IwfbGnNQ
 2Oaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QeQVvqiokQ0Jy8LM7YsIqyG1uH1AhxSWuzPikfPrTtM=;
 b=RRS8+zk8ywxcTJoqphANxKlg7w9h055rDtN1u7ohtBB3IVFq5Qyk3Y17oPZcrXggoE
 6JJYy6/6lwJ/K9r/QwCPzC0hrhoNbaahV+lvyX1NgAGDT7mg7IXhDG/h0Xwvsb2IO2WD
 /P8Y7LIW4gQawRXnAvDOqbFVAhzDibZ2BqggrBdvJhqEX2uwR1TtWrplMJuQHFN3nNrS
 VKhs7SzdzES554d7/WJVxQbCYGBst5lKQs89zlET09MErX6PziMOgKLZLh6PV96itRTT
 QG1pErTgL7MNKHgG/wc5cv4XyvLQAefl9TdhF0TNLVIdWtysn7mn3IZxXKkPR/l20uRT
 vQjQ==
X-Gm-Message-State: AO0yUKX/93uW5zIgiOfbiwKnz8bcNOY4n6lPozP2VTYavkA53NJpyD1v
 UM1XIM4DgHBHtgr/JLXiZZ1v2At3ZTBhEDGtmb8=
X-Google-Smtp-Source: AK7set/sRGQGtVA9NCX/vdv0Oww5WVx9ebUkOi6YzjEToDmY2OmhhyEFcPVhxRj6Y2V7aVY4YfECwxmPuFVd9CX7QZ0=
X-Received: by 2002:a05:6102:52e:b0:3fe:5a64:f8ea with SMTP id
 m14-20020a056102052e00b003fe5a64f8eamr762144vsa.54.1675300219418; Wed, 01 Feb
 2023 17:10:19 -0800 (PST)
MIME-Version: 1.0
References: <20230201171212.1219375-1-dbarboza@ventanamicro.com>
 <20230201171212.1219375-4-dbarboza@ventanamicro.com>
In-Reply-To: <20230201171212.1219375-4-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Feb 2023 11:09:53 +1000
Message-ID: <CAKmqyKOMrgGThNEPWZfwaJroXCniSx7RVYcK2vMtEZhi5vQ=bg@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] hw/riscv: change riscv_compute_fdt_addr() semantics
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng.cn@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe32.google.com
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
X-List-Received-Date: Thu, 02 Feb 2023 01:10:24 -0000

On Thu, Feb 2, 2023 at 3:13 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> As it is now, riscv_compute_fdt_addr() is receiving a dram_base, a
> mem_size (which is defaulted to MachineState::ram_size in all boards)
> and the FDT pointer. And it makes a very important assumption: the DRAM
> interval dram_base + mem_size is contiguous. This is indeed the case for
> most boards that use a FDT.
>
> The Icicle Kit board works with 2 distinct RAM banks that are separated
> by a gap. We have a lower bank with 1GiB size, a gap follows, then at
> 64GiB the high memory starts. MachineClass::default_ram_size for this
> board is set to 1.5Gb, and machine_init() is enforcing it as minimal RAM
> size, meaning that there we'll always have at least 512 MiB in the Hi
> RAM area.
>
> Using riscv_compute_fdt_addr() in this board is weird because not only
> the board has sparse RAM, and it's calling it using the base address of
> the Lo RAM area, but it's also using a mem_size that we have guarantees
> that it will go up to the Hi RAM. All the function assumptions doesn't
> work for this board.
>
> In fact, what makes the function works at all in this case is a
> coincidence. Commit 1a475d39ef54 introduced a 3GB boundary for the FDT,
> down from 4Gb, that is enforced if dram_base is lower than 3072 MiB. For
> the Icicle Kit board, memmap[MICROCHIP_PFSOC_DRAM_LO].base is 0x80000000
> (2 Gb) and it has a 1Gb size, so it will fall in the conditions to put
> the FDT under a 3Gb address, which happens to be exactly at the end of
> DRAM_LO. If the base address of the Lo area started later than 3Gb this
> function would be unusable by the board. Changing any assumptions inside
> riscv_compute_fdt_addr() can also break it by accident as well.
>
> Let's change riscv_compute_fdt_addr() semantics to be appropriate to the
> Icicle Kit board and for future boards that might have sparse RAM
> topologies to worry about:
>
> - relieve the condition that the dram_base + mem_size area is contiguous,
> since this is already not the case today;
>
> - receive an extra 'dram_size' size attribute that refers to a contiguous
> RAM block that the board wants the FDT to reside on.
>
> Together with 'mem_size' and 'fdt', which are now now being consumed by a
> MachineState pointer, we're able to make clear assumptions based on the
> DRAM block and total mem_size available to ensure that the FDT will be put
> in a valid RAM address.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/boot.c            | 35 +++++++++++++++++++++++------------
>  hw/riscv/microchip_pfsoc.c |  3 ++-
>  hw/riscv/sifive_u.c        |  3 ++-
>  hw/riscv/spike.c           |  3 ++-
>  hw/riscv/virt.c            |  3 ++-
>  include/hw/riscv/boot.h    |  2 +-
>  6 files changed, 32 insertions(+), 17 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 2e53494b08..c7e0e50bd8 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -250,33 +250,44 @@ void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
>  }
>
>  /*
> - * The FDT should be put at the farthest point possible to
> - * avoid overwriting it with the kernel/initrd.
> + * This function makes an assumption that the DRAM interval
> + * 'dram_base' + 'dram_size' is contiguous.
>   *
> - * This function makes an assumption that the DRAM is
> - * contiguous. It also cares about 32-bit systems and
> - * will limit fdt_addr to be addressable by them even for
> - * 64-bit CPUs.
> + * Considering that 'dram_end' is the lowest value between
> + * the end of the DRAM block and MachineState->ram_size, the
> + * FDT location will vary according to 'dram_base':
> + *
> + * - if 'dram_base' is less that 3072 MiB, the FDT will be
> + * put at the lowest value between 3072 MiB and 'dram_end';
> + *
> + * - if 'dram_base' is higher than 3072 MiB, the FDT will be
> + * put at 'dram_end'.
>   *
>   * The FDT is fdt_packed() during the calculation.
>   */
> -uint64_t riscv_compute_fdt_addr(hwaddr dram_base, uint64_t mem_size,
> -                                void *fdt)
> +uint64_t riscv_compute_fdt_addr(hwaddr dram_base, hwaddr dram_size,
> +                                MachineState *ms)
>  {
> -    uint64_t temp;
> -    hwaddr dram_end = dram_base + mem_size;
> -    int ret = fdt_pack(fdt);
> +    int ret = fdt_pack(ms->fdt);
> +    hwaddr dram_end, temp;
>      int fdtsize;
>
>      /* Should only fail if we've built a corrupted tree */
>      g_assert(ret == 0);
>
> -    fdtsize = fdt_totalsize(fdt);
> +    fdtsize = fdt_totalsize(ms->fdt);
>      if (fdtsize <= 0) {
>          error_report("invalid device-tree");
>          exit(1);
>      }
>
> +    /*
> +     * A dram_size == 0, usually from a MemMapEntry[].size element,
> +     * means that the DRAM block goes all the way to ms->ram_size.
> +     */
> +    dram_end = dram_base;
> +    dram_end += dram_size ? MIN(ms->ram_size, dram_size) : ms->ram_size;
> +
>      /*
>       * We should put fdt as far as possible to avoid kernel/initrd overwriting
>       * its content. But it should be addressable by 32 bit system as well.
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index 17499d4152..2b91e49561 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -642,7 +642,8 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
>
>          /* Compute the fdt load address in dram */
>          fdt_load_addr = riscv_compute_fdt_addr(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
> -                                               machine->ram_size, machine->fdt);
> +                                               memmap[MICROCHIP_PFSOC_DRAM_LO].size,
> +                                               machine);
>          riscv_load_fdt(fdt_load_addr, machine->fdt);
>
>          /* Load the reset vector */
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 626d4dc2f3..d3ab7a9cda 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -617,7 +617,8 @@ static void sifive_u_machine_init(MachineState *machine)
>      }
>
>      fdt_load_addr = riscv_compute_fdt_addr(memmap[SIFIVE_U_DEV_DRAM].base,
> -                                           machine->ram_size, machine->fdt);
> +                                           memmap[SIFIVE_U_DEV_DRAM].size,
> +                                           machine);
>      riscv_load_fdt(fdt_load_addr, machine->fdt);
>
>      if (!riscv_is_32bit(&s->soc.u_cpus)) {
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index f1114f2c71..cc3f6dac17 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -325,7 +325,8 @@ static void spike_board_init(MachineState *machine)
>      }
>
>      fdt_load_addr = riscv_compute_fdt_addr(memmap[SPIKE_DRAM].base,
> -                                           machine->ram_size, machine->fdt);
> +                                           memmap[SPIKE_DRAM].size,
> +                                           machine);
>      riscv_load_fdt(fdt_load_addr, machine->fdt);
>
>      /* load the reset vector */
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 2e0a0cdb17..a061151a6f 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1304,7 +1304,8 @@ static void virt_machine_done(Notifier *notifier, void *data)
>      }
>
>      fdt_load_addr = riscv_compute_fdt_addr(memmap[VIRT_DRAM].base,
> -                                           machine->ram_size, machine->fdt);
> +                                           memmap[VIRT_DRAM].size,
> +                                           machine);
>      riscv_load_fdt(fdt_load_addr, machine->fdt);
>
>      /* load the reset vector */
> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> index 46de4ec46b..511390f60e 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -48,7 +48,7 @@ target_ulong riscv_load_kernel(MachineState *machine,
>                                 symbol_fn_t sym_cb);
>  void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
>  uint64_t riscv_compute_fdt_addr(hwaddr dram_start, uint64_t dram_size,
> -                                void *fdt);
> +                                MachineState *ms);
>  void riscv_load_fdt(hwaddr fdt_addr, void *fdt);
>  void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
>                                 hwaddr saddr,
> --
> 2.39.1
>
>

