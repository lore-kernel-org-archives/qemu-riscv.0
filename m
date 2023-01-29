Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pM0W1-0006xx-Me
	for mharc-qemu-riscv@gnu.org; Sun, 29 Jan 2023 00:46:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pM0Vz-0006xS-NS; Sun, 29 Jan 2023 00:46:07 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pM0Vu-0000NC-BL; Sun, 29 Jan 2023 00:46:07 -0500
Received: by mail-ej1-x62a.google.com with SMTP id qw12so7713090ejc.2;
 Sat, 28 Jan 2023 21:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=W6BkLfctiOoE8HwM3s6t2Jwc2gJpGrkuQyKPnSMROjU=;
 b=IA9zHTwNqZfnB0Cbg6iOZl56CgAdIR9zBTYDjhN47W9cQUj+e3QVQZ4YL/ibKXMjFr
 KoQNZB2aD5poWJsZWIN7aOELpiYWc+oqwhWY6FJzyeeFLt8t7JMASKBXuO11MG6DkQnK
 A2+CQ6ba8hJ8VTuTmMbw8XfjXjK5mSyo33LZ+pLeRu6j4BeBsyI1P8163p9N+Y78gJgM
 x2PgJiOU1HDNUhKxSX/ShFwWyK+i0efjMAPMXZaVwtUyXErtg3furQGSr9qRFSkBSrdr
 p6zy3EhiFtzpQUZpNoUWN2KjeoquIdgtVWA96X+E40KajPveM07mHcUBQSekPkSo0FQ1
 mgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W6BkLfctiOoE8HwM3s6t2Jwc2gJpGrkuQyKPnSMROjU=;
 b=SUmc9lyx0tv18ZUXqKajJKaXHzRycsdHQI9SBaj/Y8S9oRl+avjmX7rXVkiizNeJ3o
 AuzDDphnJc3yy5wYJ3zfl65n27GdtwX9Zqi0UZjuIPKjxb5njLEs4jngng+L7L5gYfaE
 Hm06GbrpD3BORUUQ8a5lnxvjG+ikLuteW7NER88PiiK8XUAFbZlKqcpxcwWY2KucM+2C
 S1zkhv+mYwMRRxMdYKdxDI4lvCy/BO08KzbECo1uPkuur2eSLHEMbyWPujsFPB+5Cdbx
 q4DddciiUTV5lElwIYGD4XK8GknK1AyDTv+L97yAcGV4EY5/YyZ0z/VnuRgi28DqG+Cs
 13OA==
X-Gm-Message-State: AFqh2koOZbVjyc3YnCHjFG96Y7pJDCUaWJu95APEPH2I32ckRreaMqxb
 6KnVQrh8HUn+CeGcVmlOc9lqzplgyOD8ZM2E3lI=
X-Google-Smtp-Source: AMrXdXtLHzb8TCOV4XMmoK00peQ2Md67X+XGt3s9a5H66I62pbJ0MXvpFP6+dKVRXsIsMptvqRCf4onpcVkl+lOySyg=
X-Received: by 2002:a17:906:a00b:b0:7c0:beef:79e2 with SMTP id
 p11-20020a170906a00b00b007c0beef79e2mr7941878ejy.148.1674971159942; Sat, 28
 Jan 2023 21:45:59 -0800 (PST)
MIME-Version: 1.0
References: <20230126135219.1054658-1-dbarboza@ventanamicro.com>
 <20230126135219.1054658-4-dbarboza@ventanamicro.com>
In-Reply-To: <20230126135219.1054658-4-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 29 Jan 2023 13:45:48 +0800
Message-ID: <CAEUhbmW7Yh_7UOjeoPKBhSF1P4axp6kggtSEj9BAty1q6Ed4QA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] hw/riscv: change riscv_compute_fdt_addr() semantics
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62a.google.com
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
X-List-Received-Date: Sun, 29 Jan 2023 05:46:08 -0000

On Thu, Jan 26, 2023 at 9:54 PM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> As it is now, riscv_compute_fdt_addr() is receiving a dram_base, a
> mem_size (which is defaulted to MachineState::ram_size in all boards)
> and the FDT pointer. And it makes a very important assumption: the DRAM
> interval dram_base + mem_size is contiguous. This is indeed the case for
> most boards that uses a FDT.

s/uses/use

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
> coincidence.  Commit 1a475d39ef54 introduced a 3GB boundary for the FDT,
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

Well written commit message. Thanks!

> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/boot.c            | 38 ++++++++++++++++++++++++++------------
>  hw/riscv/microchip_pfsoc.c |  3 ++-
>  hw/riscv/sifive_u.c        |  3 ++-
>  hw/riscv/spike.c           |  3 ++-
>  hw/riscv/virt.c            |  3 ++-
>  include/hw/riscv/boot.h    |  4 ++--
>  6 files changed, 36 insertions(+), 18 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index a6f7b8ae8e..8f4991480b 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -284,33 +284,47 @@ out:
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
> -uint32_t riscv_compute_fdt_addr(hwaddr dram_base, uint64_t mem_size,
> -                                void *fdt)
> +hwaddr riscv_compute_fdt_addr(hwaddr dram_base, hwaddr dram_size,

Using hwaddr to represent a size looks weird. Although technically
they are the same ... I would leave this as it is.

> +                              MachineState *ms)
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
> +    if (dram_size == 0x0) {
> +        dram_end = dram_base + ms->ram_size;
> +    } else {
> +        dram_end = dram_base + MIN(ms->ram_size, dram_size);
> +    }

How about:

g_assert(dram_size < ms->ram_size);
dram_end = dram_base + (dram_size ? dram_size : ms->ram_size);

> +
>      /*
>       * We should put fdt as far as possible to avoid kernel/initrd overwriting
>       * its content. But it should be addressable by 32 bit system as well.
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index a30203db85..e81bbd12df 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -634,7 +634,8 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
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
> index 6bbdbe5fb7..ad3bb35b34 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -609,7 +609,8 @@ static void sifive_u_machine_init(MachineState *machine)
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
> index ceebe34c5f..b5979eddd6 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -317,7 +317,8 @@ static void spike_board_init(MachineState *machine)
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
> index 43fca597f0..f079a30b60 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1293,7 +1293,8 @@ static void virt_machine_done(Notifier *notifier, void *data)
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
> index 7babd669c7..a6099c2dc6 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -48,8 +48,8 @@ target_ulong riscv_load_kernel(MachineState *machine,
>                                 target_ulong firmware_end_addr,
>                                 bool load_initrd,
>                                 symbol_fn_t sym_cb);
> -uint32_t riscv_compute_fdt_addr(hwaddr dram_start, uint64_t dram_size,
> -                                void *fdt);
> +hwaddr riscv_compute_fdt_addr(hwaddr dram_start, uint64_t dram_size,
> +                              MachineState *ms);
>  void riscv_load_fdt(hwaddr fdt_addr, void *fdt);
>  void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
>                                 hwaddr saddr,
> --

Regards,
Bin

