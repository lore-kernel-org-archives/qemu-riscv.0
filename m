Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIKQy-0006aQ-Oi
	for mharc-qemu-riscv@gnu.org; Wed, 18 Jan 2023 21:13:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pIKQw-0006a4-KY; Wed, 18 Jan 2023 21:13:42 -0500
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pIKQu-0008SN-LU; Wed, 18 Jan 2023 21:13:42 -0500
Received: by mail-vk1-xa2b.google.com with SMTP id 12so262923vkj.12;
 Wed, 18 Jan 2023 18:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=v2W7SXcjeLduz9XNKnGBLcG3e1m2QlJ/Rnmpk1M4XR0=;
 b=bC57CVGuAOdwjYUD3ikjXBo/R8tRM/PSVxSUOHiCzJpPbvKyEQKcXoHz7qQJAPcgO/
 fy6tMX5RFrdnRVPtptaDI6en4hmUtteC3Px5y2kKva3r0g5QuROEiqpqgaTiyKqkOoGG
 oPXeSdB8wkQ7ZI9OI2pF7WOXcwJCuwgcKAYAehU3rj/bkfPGAmHyfqHEpWnPMDpxNd//
 yt1K8vnn4HYC2q9iHTsByQ1+XswBGL1wUScsHB7dUcvsMtpXroa4dRSwyXKSE8NJO0I6
 crgyAFz47s42Eueq1v16T351oE0k1HGFn/L5iEl/YXQHpC9TFD2UAdeMPcRHmuWptb2P
 R80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v2W7SXcjeLduz9XNKnGBLcG3e1m2QlJ/Rnmpk1M4XR0=;
 b=rrkREh3eg47KxQuVcyaZT6lG+Kyb6StHvlK801ee2H3/0m/PIt1Qc0XyTiSEJcGReo
 OWuvry56/fO9ZWZ/5qNb2kBKdhZqh37XCdXrj4iFMcmDehyzBTra1Zmhl7gbHMDyOV14
 HajfVRORB74RkeWsTNN2oqFVS4X/orArY8wVNij7GiXgd7dQTvEKL+hqr2HjRAdnRnSZ
 ca8mLK/cWUlmtYuPPn74iTeYaH6FSv5E2n+T0vg7iQguXZJEP3a6fa4sdtA2im41BG1u
 Zr/oknoAC2JULwsiy0ZBehR4qN+OixYkSRZnjf6PfySTimPSba18409vcw7ExH87IHK9
 Z3IA==
X-Gm-Message-State: AFqh2krDIYfeyPEF0XJzf8ljVrGd51qkIbo4GuyOS+f95l3cyhJoa5i4
 wyuP1oi7NcI80koPl+55BlDk8BR2tah2xCG5908=
X-Google-Smtp-Source: AMrXdXuDM/b/CEqy59UU3F940Ti6Nb+2aClYzypDKWw2m7kClbiR+bewJ3KcxL1UEXq/ojBsl8DUzcVmNLrczVSj6Jc=
X-Received: by 2002:a1f:2c0c:0:b0:3e1:7e08:a117 with SMTP id
 s12-20020a1f2c0c000000b003e17e08a117mr1266096vks.34.1674094419077; Wed, 18
 Jan 2023 18:13:39 -0800 (PST)
MIME-Version: 1.0
References: <20230116173420.1146808-1-dbarboza@ventanamicro.com>
 <20230116173420.1146808-3-dbarboza@ventanamicro.com>
In-Reply-To: <20230116173420.1146808-3-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 19 Jan 2023 12:13:13 +1000
Message-ID: <CAKmqyKNBbzuC66cDvrV_4P_BSq5LKegveZGaYLwVUp8RZa6WwA@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] hw/riscv: split fdt address calculation from fdt
 load
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2b.google.com
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
X-List-Received-Date: Thu, 19 Jan 2023 02:13:43 -0000

On Tue, Jan 17, 2023 at 3:35 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> A common trend in other archs is to calculate the fdt address, which is
> usually straightforward, and then calling a function that loads the
> fdt/dtb by using that address.
>
> riscv_load_fdt() is doing a bit too much in comparison. It's calculating
> the fdt address via an elaborated heuristic to put the FDT at the bottom
> of DRAM, and "bottom of DRAM" will vary across boards and
> configurations, then it's actually loading the fdt, and finally it's
> returning the fdt address used to the caller.
>
> Reduce the existing complexity of riscv_load_fdt() by splitting its code
> into a new function, riscv_compute_fdt_addr(), that will take care of
> all fdt address logic. riscv_load_fdt() can then be a simple function
> that just loads a fdt at the given fdt address.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/boot.c            | 24 ++++++++++++++++--------
>  hw/riscv/microchip_pfsoc.c |  6 ++++--
>  hw/riscv/sifive_u.c        |  7 ++++---
>  hw/riscv/spike.c           |  6 +++---
>  hw/riscv/virt.c            |  7 ++++---
>  include/hw/riscv/boot.h    |  3 ++-
>  6 files changed, 33 insertions(+), 20 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index dc14d8cd14..b213a32157 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -249,9 +249,16 @@ void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
>      }
>  }
>
> -uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
> +/*
> + * The FDT should be put at the farthest point possible to
> + * avoid overwriting it with the kernel/initrd.
> + *
> + * The FDT is fdt_packed() during the calculation.
> + */
> +uint32_t riscv_compute_fdt_addr(hwaddr dram_base, uint64_t mem_size,
> +                                void *fdt)
>  {
> -    uint64_t temp, fdt_addr;
> +    uint64_t temp;
>      hwaddr dram_end = dram_base + mem_size;
>      int ret = fdt_pack(fdt);
>      int fdtsize;
> @@ -272,11 +279,14 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
>       * end of dram or 3GB whichever is lesser.
>       */
>      temp = (dram_base < 3072 * MiB) ? MIN(dram_end, 3072 * MiB) : dram_end;
> -    fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
>
> -    ret = fdt_pack(fdt);
> -    /* Should only fail if we've built a corrupted tree */
> -    g_assert(ret == 0);
> +    return QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
> +}
> +
> +void riscv_load_fdt(uint32_t fdt_addr, void *fdt)
> +{
> +    uint32_t fdtsize = fdt_totalsize(fdt);
> +
>      /* copy in the device tree */
>      qemu_fdt_dumpdtb(fdt, fdtsize);
>
> @@ -284,8 +294,6 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
>                            &address_space_memory);
>      qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
>                          rom_ptr_for_as(&address_space_memory, fdt_addr, fdtsize));
> -
> -    return fdt_addr;
>  }
>
>  void riscv_rom_copy_firmware_info(MachineState *machine, hwaddr rom_base,
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index 82ae5e7023..dcdbc2cac3 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -641,8 +641,10 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
>          }
>
>          /* Compute the fdt load address in dram */
> -        fdt_load_addr = riscv_load_fdt(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
> -                                       machine->ram_size, machine->fdt);
> +        fdt_load_addr = riscv_compute_fdt_addr(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
> +                                              machine->ram_size, machine->fdt);
> +        riscv_load_fdt(fdt_load_addr, machine->fdt);
> +
>          /* Load the reset vector */
>          riscv_setup_rom_reset_vec(machine, &s->soc.u_cpus, firmware_load_addr,
>                                    memmap[MICROCHIP_PFSOC_ENVM_DATA].base,
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 2fb6ee231f..626d4dc2f3 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -616,9 +616,10 @@ static void sifive_u_machine_init(MachineState *machine)
>          kernel_entry = 0;
>      }
>
> -    /* Compute the fdt load address in dram */
> -    fdt_load_addr = riscv_load_fdt(memmap[SIFIVE_U_DEV_DRAM].base,
> -                                   machine->ram_size, machine->fdt);
> +    fdt_load_addr = riscv_compute_fdt_addr(memmap[SIFIVE_U_DEV_DRAM].base,
> +                                           machine->ram_size, machine->fdt);
> +    riscv_load_fdt(fdt_load_addr, machine->fdt);
> +
>      if (!riscv_is_32bit(&s->soc.u_cpus)) {
>          start_addr_hi32 = (uint64_t)start_addr >> 32;
>      }
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index badc11ec43..88b9fdfc36 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -324,9 +324,9 @@ static void spike_board_init(MachineState *machine)
>          kernel_entry = 0;
>      }
>
> -    /* Compute the fdt load address in dram */
> -    fdt_load_addr = riscv_load_fdt(memmap[SPIKE_DRAM].base,
> -                                   machine->ram_size, machine->fdt);
> +    fdt_load_addr = riscv_compute_fdt_addr(memmap[SPIKE_DRAM].base,
> +                                           machine->ram_size, machine->fdt);
> +    riscv_load_fdt(fdt_load_addr, machine->fdt);
>
>      /* load the reset vector */
>      riscv_setup_rom_reset_vec(machine, &s->soc[0], memmap[SPIKE_DRAM].base,
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index e6d4f06e8d..839dfaa125 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1307,9 +1307,10 @@ static void virt_machine_done(Notifier *notifier, void *data)
>          start_addr = virt_memmap[VIRT_FLASH].base;
>      }
>
> -    /* Compute the fdt load address in dram */
> -    fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
> -                                   machine->ram_size, machine->fdt);
> +    fdt_load_addr = riscv_compute_fdt_addr(memmap[VIRT_DRAM].base,
> +                                           machine->ram_size, machine->fdt);
> +    riscv_load_fdt(fdt_load_addr, machine->fdt);
> +
>      /* load the reset vector */
>      riscv_setup_rom_reset_vec(machine, &s->soc[0], start_addr,
>                                virt_memmap[VIRT_MROM].base,
> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> index f94653a09b..9aea7b9c46 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -47,7 +47,8 @@ target_ulong riscv_load_kernel(MachineState *machine,
>                                 target_ulong firmware_end_addr,
>                                 symbol_fn_t sym_cb);
>  void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
> -uint64_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
> +uint32_t riscv_compute_fdt_addr(hwaddr dram_start, uint64_t dram_size, void *fdt);
> +void riscv_load_fdt(uint32_t fdt_addr, void *fdt);
>  void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
>                                 hwaddr saddr,
>                                 hwaddr rom_base, hwaddr rom_size,
> --
> 2.39.0
>
>

