Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIKaq-0001jA-Ie
	for mharc-qemu-riscv@gnu.org; Wed, 18 Jan 2023 21:23:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pIKap-0001iu-OQ; Wed, 18 Jan 2023 21:23:55 -0500
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pIKan-0001Et-Uz; Wed, 18 Jan 2023 21:23:55 -0500
Received: by mail-ua1-x932.google.com with SMTP id e18so170993uam.9;
 Wed, 18 Jan 2023 18:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dUplL8wjwMqni4h6vkgvmfr8Mr/MGE1oAhY3BFsXzFU=;
 b=b92cDLlEfQd3SRjc4/3PqMUtYtp3hDwejJDEhhrb0jZ+3359wEEyhvmYQy2g/XTW4d
 Sc6l/EqMAsEfR79/w32ot+tadxMHBPkwLDbxEzCJEpNQlvzrK3C2C9c6SwAQqEAO3Oln
 WOUcYG6AKLQH7Ffk8KttyOjUBGxqicmuQqdVNZBSYt53n7DZFTqwhqZ+HDZovPDl5al+
 t/E5QC1IGiJM2sjyELUcqKQjVuN+wE9XY0KB2v6p4Z4iX4pL9ud8inRmOqSVvDpU8N85
 J2ehM8I7Q9q13fL7QGCeH54qytLObVjdhBm6hTY0n7pdQ6jloEN8BWzqbaPPN7nmAZHF
 jneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dUplL8wjwMqni4h6vkgvmfr8Mr/MGE1oAhY3BFsXzFU=;
 b=Da9cpTxQBYLVMlNqjFJiFmgh1t222CWZokQL2M0Pu30eeZkxIbdUybiztBA+fpE9Jj
 4GKqfjG1nKQz/pZSA0Zfnd5ECZPGUOUVut2+xtEhsQ56F1UbFVcSPPQV/TOzv4HNHv/J
 tqKc4VytXdFi5kLJSy6J5ThL6N2TOT1vL9NgpBe4sp1G8A1LvWOmcDdSULU9mH3g7NNp
 Z+8ZJpnQ9Rg+0QzIJKZEvOiSNJLLmgoh5oYfOE5pFpbNHXtEpAhthVd+dNVXeRF+RdzF
 vZ+i1erjL5/2GCprlKveWtVnkAVH5PHbtc913VHY0yLbO1yPfh+uNzzYISP1AOoQG51D
 9SAQ==
X-Gm-Message-State: AFqh2kpM5KbpN6TSqP/2BVnebveOqRAq1skiL53XnaqwkFBW0stb4YIH
 gpjsvJrJLFEtTsXwdGqSuplJLD9aiLUPO9YVU/1+pe/XfjTm3Q==
X-Google-Smtp-Source: AMrXdXsp1PCP7Q8DWenMJnPpMrPxGoqjckC0GusWsck0wF3Xm4InDNFih1AfMUn+FFRARCnKIWcrpo4hB90QqPCFTZA=
X-Received: by 2002:ab0:744f:0:b0:419:1fa3:9618 with SMTP id
 p15-20020ab0744f000000b004191fa39618mr1182880uaq.11.1674095030460; Wed, 18
 Jan 2023 18:23:50 -0800 (PST)
MIME-Version: 1.0
References: <20230116173420.1146808-1-dbarboza@ventanamicro.com>
 <20230116173420.1146808-4-dbarboza@ventanamicro.com>
In-Reply-To: <20230116173420.1146808-4-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 19 Jan 2023 12:23:24 +1000
Message-ID: <CAKmqyKMBjVjxL=YCprrQe4Hy5DXy4riOi4zwExxWG+nW7hx_AQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] hw/riscv: simplify riscv_compute_fdt_addr()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x932.google.com
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
X-List-Received-Date: Thu, 19 Jan 2023 02:23:56 -0000

On Tue, Jan 17, 2023 at 3:34 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> All callers are using attributes from the MachineState object. Use a
> pointer to it instead of passing dram_size (which is always
> machine->ram_size) and fdt (always machine->fdt).
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/boot.c            | 6 +++---
>  hw/riscv/microchip_pfsoc.c | 4 ++--
>  hw/riscv/sifive_u.c        | 4 ++--
>  hw/riscv/spike.c           | 4 ++--
>  hw/riscv/virt.c            | 3 +--
>  include/hw/riscv/boot.h    | 2 +-
>  6 files changed, 11 insertions(+), 12 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index b213a32157..508da3f5c7 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -255,11 +255,11 @@ void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
>   *
>   * The FDT is fdt_packed() during the calculation.
>   */
> -uint32_t riscv_compute_fdt_addr(hwaddr dram_base, uint64_t mem_size,
> -                                void *fdt)
> +uint32_t riscv_compute_fdt_addr(MachineState *machine, hwaddr dram_base)
>  {
> +    void *fdt = machine->fdt;
>      uint64_t temp;
> -    hwaddr dram_end = dram_base + mem_size;
> +    hwaddr dram_end = dram_base + machine->ram_size;
>      int ret = fdt_pack(fdt);
>      int fdtsize;
>
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index dcdbc2cac3..a53e48e996 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -641,8 +641,8 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
>          }
>
>          /* Compute the fdt load address in dram */
> -        fdt_load_addr = riscv_compute_fdt_addr(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
> -                                              machine->ram_size, machine->fdt);
> +        fdt_load_addr = riscv_compute_fdt_addr(machine,
> +                                               memmap[MICROCHIP_PFSOC_DRAM_LO].base);

I don't think this is correct here.

So, first up I understand we don't correctly handle this today, *but*
I see this change as a step in the wrong direction.

The problem here is that ram is split over two areas. So if
machine->ram_size is larger then 0x40000000 it is going to overflow
MICROCHIP_PFSOC_DRAM_LO and jump to MICROCHIP_PFSOC_DRAM_HI
(0x1000000000).

So we really want something like this

        /* Compute the fdt load address in dram */
        if (machine->ram_size > memmap[MICROCHIP_PFSOC_DRAM_LO].size) {
            fdt_load_addr = riscv_load_fdt(memmap[MICROCHIP_PFSOC_DRAM_HI].base,
                                           machine->ram_size -
memmap[MICROCHIP_PFSOC_DRAM_LO].size,
                                           machine->fdt);
        } else {
            fdt_load_addr = riscv_load_fdt(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
                                           machine->ram_size,
                                           machine->fdt);
        }

to handle overflowing MICROCHIP_PFSOC_DRAM_LO. While this patch is
going in the wrong direction and making that more difficult

Alistair



>          riscv_load_fdt(fdt_load_addr, machine->fdt);
>
>          /* Load the reset vector */
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 626d4dc2f3..ebfddf161d 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -616,8 +616,8 @@ static void sifive_u_machine_init(MachineState *machine)
>          kernel_entry = 0;
>      }
>
> -    fdt_load_addr = riscv_compute_fdt_addr(memmap[SIFIVE_U_DEV_DRAM].base,
> -                                           machine->ram_size, machine->fdt);
> +    fdt_load_addr = riscv_compute_fdt_addr(machine,
> +                                           memmap[SIFIVE_U_DEV_DRAM].base);
>      riscv_load_fdt(fdt_load_addr, machine->fdt);
>
>      if (!riscv_is_32bit(&s->soc.u_cpus)) {
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 88b9fdfc36..afd581436b 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -324,8 +324,8 @@ static void spike_board_init(MachineState *machine)
>          kernel_entry = 0;
>      }
>
> -    fdt_load_addr = riscv_compute_fdt_addr(memmap[SPIKE_DRAM].base,
> -                                           machine->ram_size, machine->fdt);
> +    fdt_load_addr = riscv_compute_fdt_addr(machine,
> +                                           memmap[SPIKE_DRAM].base);
>      riscv_load_fdt(fdt_load_addr, machine->fdt);
>
>      /* load the reset vector */
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 839dfaa125..cbba0b8930 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1307,8 +1307,7 @@ static void virt_machine_done(Notifier *notifier, void *data)
>          start_addr = virt_memmap[VIRT_FLASH].base;
>      }
>
> -    fdt_load_addr = riscv_compute_fdt_addr(memmap[VIRT_DRAM].base,
> -                                           machine->ram_size, machine->fdt);
> +    fdt_load_addr = riscv_compute_fdt_addr(machine, memmap[VIRT_DRAM].base);
>      riscv_load_fdt(fdt_load_addr, machine->fdt);
>
>      /* load the reset vector */
> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> index 9aea7b9c46..f933de88fb 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -47,7 +47,7 @@ target_ulong riscv_load_kernel(MachineState *machine,
>                                 target_ulong firmware_end_addr,
>                                 symbol_fn_t sym_cb);
>  void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
> -uint32_t riscv_compute_fdt_addr(hwaddr dram_start, uint64_t dram_size, void *fdt);
> +uint32_t riscv_compute_fdt_addr(MachineState *machine, hwaddr dram_start);
>  void riscv_load_fdt(uint32_t fdt_addr, void *fdt);
>  void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
>                                 hwaddr saddr,
> --
> 2.39.0
>
>

