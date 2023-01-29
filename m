Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pM040-0007qd-Li
	for mharc-qemu-riscv@gnu.org; Sun, 29 Jan 2023 00:17:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pM03z-0007qN-1B; Sun, 29 Jan 2023 00:17:11 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pM03w-0004Xl-UL; Sun, 29 Jan 2023 00:17:10 -0500
Received: by mail-ej1-x630.google.com with SMTP id dr8so1983701ejc.12;
 Sat, 28 Jan 2023 21:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8j5+nWSOs8eGB4svczUf3aHIju/fmNote9HAx8Vm6yw=;
 b=FGdys+Upufy6OUukkDQX+uLfkawuIUq/CS1hl/hxA8HQkoIC5Xbc9vjkwwLOtWOv3v
 8prsZGsrHaXirbo97j6j+yFYqD/uKpN46gf5AprpJT852gfsP5HLCDxzTtrqchBpq3KJ
 Dx5NEgEwtbQOoTpjHFDykmzpgKi+5fq26SqO8Y13RlTJ4gSk5YOphZGdkgVAPztWpBX2
 NQHUeV0acC02yQoEwJ28Haz6iJ+ODYa0cocgzIVoJT4I7UMPGCqDH4fMnw0a3e5vHUl8
 i9p+P4CRB8ef+W/6Ln6n9jZIn7+QFBv7TZzz0L2Xe6/U5vg0oNJblJ2QeT5JqZ/9mp7D
 +oaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8j5+nWSOs8eGB4svczUf3aHIju/fmNote9HAx8Vm6yw=;
 b=xeGz9WJeL3G/HA/1+KKNr5vwPwmbyezL272btE4qDdfJF9i+TZzgBKOCP2xDoiWIqu
 InCsmvOdXUTrE+hPay+KDYZfJZt3Z8inARrEPHij1wRTdGvO+Upco67m86+UJGhZ/21Q
 /jpRxKBSJp5AeSJmbaKqBrTnpjSk8QoQjywXzZ+6hsQPgCr2KUPGzgvjkS/BkJSLLaY/
 4o92o5l36xnkfCMb4Wd423OvQ9rDCGogTvrVqeGT4v/9tLcy3fHX77nHCuTq5e4J89Lw
 rTU9SbltMvLNixce6ELU4QHBYl60dMYN+zryhfzxBfB5893tHZshZwwNYbtElGaUrnCX
 Qq6Q==
X-Gm-Message-State: AFqh2kr3N4hDRioiCYPLq7al6IkW0cfjD6uTPNDrRRQLe0fkIQqKIF2q
 9J0Rg0a4Kv11+iBhX0qO7Brm1zMrPf05+asMUvg=
X-Google-Smtp-Source: AMrXdXtz2G9d9gD7xcMHlygoWPWA7w6AiSSE6ol13ESDjGB/jGfZou2/eRvWhkzm7/EDFbUQE8hrG5/AqaL/OOIb8/Y=
X-Received: by 2002:a17:906:a00b:b0:7c0:beef:79e2 with SMTP id
 p11-20020a170906a00b00b007c0beef79e2mr7931890ejy.148.1674969426805; Sat, 28
 Jan 2023 21:17:06 -0800 (PST)
MIME-Version: 1.0
References: <20230126135219.1054658-1-dbarboza@ventanamicro.com>
 <20230126135219.1054658-3-dbarboza@ventanamicro.com>
In-Reply-To: <20230126135219.1054658-3-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 29 Jan 2023 13:16:55 +0800
Message-ID: <CAEUhbmWxitnfyV6_MpOSOrMSW3FPF1JqD=qbDedpUrqHcMkf_w@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] hw/riscv: split fdt address calculation from fdt
 load
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Sun, 29 Jan 2023 05:17:11 -0000

On Thu, Jan 26, 2023 at 9:53 PM Daniel Henrique Barboza
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
> We're also taken the opportunity to clarify the intentions and
> assumptions made by these functions. riscv_load_fdt() is now receiving a
> hwaddr as fdt_addr because there is no restriction of having to load the
> fdt in higher addresses that doesn't fit in an uint32_t.
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/boot.c            | 33 +++++++++++++++++++++++++--------
>  hw/riscv/microchip_pfsoc.c |  6 ++++--
>  hw/riscv/sifive_u.c        |  7 ++++---
>  hw/riscv/spike.c           |  6 +++---
>  hw/riscv/virt.c            |  7 ++++---
>  include/hw/riscv/boot.h    |  4 +++-
>  6 files changed, 43 insertions(+), 20 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index a563b7482a..a6f7b8ae8e 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -283,9 +283,21 @@ out:
>      return kernel_entry;
>  }
>
> -uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
> +/*
> + * The FDT should be put at the farthest point possible to
> + * avoid overwriting it with the kernel/initrd.
> + *
> + * This function makes an assumption that the DRAM is
> + * contiguous. It also cares about 32-bit systems and
> + * will limit fdt_addr to be addressable by them even for
> + * 64-bit CPUs.
> + *
> + * The FDT is fdt_packed() during the calculation.
> + */
> +uint32_t riscv_compute_fdt_addr(hwaddr dram_base, uint64_t mem_size,
> +                                void *fdt)

The original code returns a uint64_t for fdt_addr but now this is uint32_t?

>  {
> -    uint64_t temp, fdt_addr;
> +    uint64_t temp;
>      hwaddr dram_end = dram_base + mem_size;
>      int ret = fdt_pack(fdt);
>      int fdtsize;
> @@ -306,11 +318,18 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
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
> +/*
> + * 'fdt_addr' is received as hwaddr because boards might put
> + * the FDT beyond 32-bit addressing boundary.
> + */
> +void riscv_load_fdt(hwaddr fdt_addr, void *fdt)
> +{
> +    uint32_t fdtsize = fdt_totalsize(fdt);
> +
>      /* copy in the device tree */
>      qemu_fdt_dumpdtb(fdt, fdtsize);
>
> @@ -318,8 +337,6 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
>                            &address_space_memory);
>      qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
>                          rom_ptr_for_as(&address_space_memory, fdt_addr, fdtsize));
> -
> -    return fdt_addr;
>  }
>
>  void riscv_rom_copy_firmware_info(MachineState *machine, hwaddr rom_base,
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index b7e171b605..a30203db85 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -633,8 +633,10 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
>                                           kernel_start_addr, true, NULL);
>
>          /* Compute the fdt load address in dram */
> -        fdt_load_addr = riscv_load_fdt(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
> -                                       machine->ram_size, machine->fdt);
> +        fdt_load_addr = riscv_compute_fdt_addr(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
> +                                               machine->ram_size, machine->fdt);
> +        riscv_load_fdt(fdt_load_addr, machine->fdt);
> +
>          /* Load the reset vector */
>          riscv_setup_rom_reset_vec(machine, &s->soc.u_cpus, firmware_load_addr,
>                                    memmap[MICROCHIP_PFSOC_ENVM_DATA].base,
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index b0b3e6f03a..6bbdbe5fb7 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -608,9 +608,10 @@ static void sifive_u_machine_init(MachineState *machine)
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
> index 483581e05f..ceebe34c5f 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -316,9 +316,9 @@ static void spike_board_init(MachineState *machine)
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
> index 48326406fd..43fca597f0 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1292,9 +1292,10 @@ static void virt_machine_done(Notifier *notifier, void *data)
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
> index bc9faed397..7babd669c7 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -48,7 +48,9 @@ target_ulong riscv_load_kernel(MachineState *machine,
>                                 target_ulong firmware_end_addr,
>                                 bool load_initrd,
>                                 symbol_fn_t sym_cb);
> -uint64_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
> +uint32_t riscv_compute_fdt_addr(hwaddr dram_start, uint64_t dram_size,
> +                                void *fdt);
> +void riscv_load_fdt(hwaddr fdt_addr, void *fdt);
>  void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
>                                 hwaddr saddr,
>                                 hwaddr rom_base, hwaddr rom_size,
> --

Regards,
Bin

