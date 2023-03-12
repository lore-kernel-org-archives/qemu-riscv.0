Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pbU8O-0002AZ-9X
	for mharc-qemu-riscv@gnu.org; Sun, 12 Mar 2023 18:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pbU8M-0002A5-Mz
 for qemu-riscv@nongnu.org; Sun, 12 Mar 2023 18:25:42 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pbU8K-0001qk-9Y
 for qemu-riscv@nongnu.org; Sun, 12 Mar 2023 18:25:42 -0400
Received: by mail-oi1-x236.google.com with SMTP id q15so8182995oiw.11
 for <qemu-riscv@nongnu.org>; Sun, 12 Mar 2023 15:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678659938;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gbNMLgN0w9Uk051YsUoabSGGG/ZBFHGD2XdPtfzHByk=;
 b=N1NL4GentwBxsDbgyVPoCg1+OYGTmxMijyfyIo27wgkJmU19cRLkiFsG99qt0xj7O4
 ecfDXXy90JfqNN5Rv9X2mWXUCEz//8Ew572Z1TQXCCLN2j7nZ1wW0iyjvjpYXzV5KXW1
 YTuwEW2nY5ZO1KD5JGnnQadCKZCEwhketHTY1MyzriWFTouaAxX1jL5PtRE2cMAFhD20
 HpGKaTJ+Sp+L9E7TlXKWnTPmRIPJhIU5PeDODYeOjQU+P0I9D/6TKp4etfjBBZFYlrm0
 4ggFf+lhmztcb/x7PPgkPEPfAfUy9Lx28f5ljOif+3r99Nd9aREY/QWyA6589AOpTysE
 Cjqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678659938;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gbNMLgN0w9Uk051YsUoabSGGG/ZBFHGD2XdPtfzHByk=;
 b=3msWkhuvj8tY492RsKlbYAB3ifSGh9lF/2+RGBYTBsdvZRYE7ESvufNw6QrHTl4nZV
 Sq00yzvduiTlyVTU9ZzoAnfvcSB27rAwcAEac0txfFlUPoICTlskJLxydKXw6mwKhzFc
 KOLT38K74Slx4b0xI1MvMxap+qOrauhvwJk9yJtVXcyih6kJRYujgnga22Qu7VMhhn1d
 r0VwmdMwYFYUZHBDOZ8sPLjtMNYB1E/3bUjJDGZq9rkjBdVwW3zSznoQrvs4ldNBqDVM
 eW3iNGjsfK72+0LSYG0Rf1fb0hp0Bx1WKrbJ093y1oqlMtzkalIwteqCfCq6wQqDp2SY
 diFA==
X-Gm-Message-State: AO0yUKXzrlE6qpwxqMuxbVDe1yo0CKWWJ7Td8a+whMKEf6chnlAOBl3g
 v3SEwDhknDn5jJV6PkHR3xEofA==
X-Google-Smtp-Source: AK7set/aovWEzFFfm5inBDIta2aTIi6W/TVPZaxiEZVFa9sa5LyKdBcy1i+sor3dA7FnoLD7cVt/Ww==
X-Received: by 2002:a05:6808:2c3:b0:384:2883:4de1 with SMTP id
 a3-20020a05680802c300b0038428834de1mr15011693oid.38.1678659938467; 
 Sun, 12 Mar 2023 15:25:38 -0700 (PDT)
Received: from [192.168.68.107] ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 q8-20020acaf208000000b003785996ef36sm2452769oih.19.2023.03.12.15.25.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Mar 2023 15:25:38 -0700 (PDT)
Message-ID: <a670e893-9eec-98e5-508c-ff0115fdbb06@ventanamicro.com>
Date: Sun, 12 Mar 2023 19:25:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] hw/riscv: Fix the bug of max size limit when put
 initrd to RAM
To: Hang Xu <xuhang@eswincomputing.com>, qemu-riscv@nongnu.org
Cc: palmer@rivosinc.com, bmeng@tinylab.org, alistair.francis@wdc.com,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20230312094022.1127-1-xuhang@eswincomputing.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230312094022.1127-1-xuhang@eswincomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Sun, 12 Mar 2023 22:25:42 -0000

Hi,

First, all patches in QEMU must also go to to the general mailing list (qemu-devel)
as well. I'm adding it in the CC in this reply. Sorry to not mentioning it in the
first version - I noticed that you didn't CC qemu-devel here, and in v1, just now
when replying to this patch.

As for the commit title, we don't need to mention that you're fixing a bug. I mean,
at least for me, if it needs fixing it's already a bug :D

I'd go with:

"hw/riscv: Fix max initrd size limit when put initrd to RAM"


On 3/12/23 06:40, Hang Xu wrote:
> Because the starting address of ram is not necessarily 0,
> the remaining free space in ram is
> ram_size - (start - ram_base) instead of ram_size-start.
> The changes based on patch1 are as follows:
> 1. Rebase
> 2. Considering that the ram block may be discontinuous


So, when documenting changes from one version to the other we usually do in one
of two ways:

- put it right after the "---"  after your "Signed-off-by". Everything you
put there won't be converted into code or commit message when applying the
patch;

- create the patch with --cover-letter and document it there in separate.


What you did here will force the maintainer to remove this change history
from the commit message when applying it.

> 
> Signed-off-by: Hang Xu <xuhang@eswincomputing.com>
> ---
>   hw/riscv/boot.c            | 18 ++++++++++++------
>   hw/riscv/microchip_pfsoc.c |  5 ++++-
>   hw/riscv/opentitan.c       |  2 +-
>   hw/riscv/sifive_e.c        |  2 +-
>   hw/riscv/sifive_u.c        |  5 ++++-
>   hw/riscv/spike.c           |  5 ++++-
>   hw/riscv/virt.c            |  5 ++++-
>   include/hw/riscv/boot.h    |  2 ++
>   8 files changed, 32 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 52bf8e67de..73b44a0c8b 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -173,10 +173,10 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
>       exit(1);
>   }
>   
> -static void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
> +static void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry,
> +                              uint64_t ram_base, uint64_t ram_size)
>   {
>       const char *filename = machine->initrd_filename;
> -    uint64_t mem_size = machine->ram_size;
>       void *fdt = machine->fdt;
>       hwaddr start, end;
>       ssize_t size;
> @@ -193,12 +193,16 @@ static void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
>        * So for boards with less  than 256MB of RAM we put the initrd
>        * halfway into RAM, and for boards with 256MB of RAM or more we put
>        * the initrd at 128MB.
> +     * A ram_size == 0, usually from a MemMapEntry[].size element,
> +     * means that the RAM block goes all the way to ms->ram_size.
>        */
> -    start = kernel_entry + MIN(mem_size / 2, 128 * MiB);
> +    ram_size = ram_size ? MIN(machine->ram_size, ram_size) : machine->ram_size;
> +    start = kernel_entry + MIN(ram_size / 2, 128 * MiB);
> +    uint64_t max_initrd = ram_size - (start - ram_base);

Please declare 'max_initrd' at the start of the function with the other vars.


Everything else looks good to me.


Thanks,


Daniel

>   
> -    size = load_ramdisk(filename, start, mem_size - start);
> +    size = load_ramdisk(filename, start, max_initrd);
>       if (size == -1) {
> -        size = load_image_targphys(filename, start, mem_size - start);
> +        size = load_image_targphys(filename, start, max_initrd);
>           if (size == -1) {
>               error_report("could not load ramdisk '%s'", filename);
>               exit(1);
> @@ -217,6 +221,8 @@ target_ulong riscv_load_kernel(MachineState *machine,
>                                  RISCVHartArrayState *harts,
>                                  target_ulong kernel_start_addr,
>                                  bool load_initrd,
> +                               uint64_t ram_base,
> +                               uint64_t ram_size,
>                                  symbol_fn_t sym_cb)
>   {
>       const char *kernel_filename = machine->kernel_filename;
> @@ -263,7 +269,7 @@ out:
>       }
>   
>       if (load_initrd && machine->initrd_filename) {
> -        riscv_load_initrd(machine, kernel_entry);
> +        riscv_load_initrd(machine, kernel_entry, ram_base, ram_size);
>       }
>   
>       if (fdt && machine->kernel_cmdline && *machine->kernel_cmdline) {
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index e81bbd12df..b42d90b89e 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -630,7 +630,10 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
>                                                            firmware_end_addr);
>   
>           kernel_entry = riscv_load_kernel(machine, &s->soc.u_cpus,
> -                                         kernel_start_addr, true, NULL);
> +                                         kernel_start_addr, true,
> +                                         memmap[MICROCHIP_PFSOC_DRAM_LO].base,
> +                                         memmap[MICROCHIP_PFSOC_DRAM_LO].size,
> +                                         NULL);
>   
>           /* Compute the fdt load address in dram */
>           fdt_load_addr = riscv_compute_fdt_addr(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index b06944d382..bb663523d5 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -103,7 +103,7 @@ static void opentitan_board_init(MachineState *machine)
>       if (machine->kernel_filename) {
>           riscv_load_kernel(machine, &s->soc.cpus,
>                             memmap[IBEX_DEV_RAM].base,
> -                          false, NULL);
> +                          false, 0, 0, NULL);
>       }
>   }
>   
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index 04939b60c3..5b47d539a6 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -116,7 +116,7 @@ static void sifive_e_machine_init(MachineState *machine)
>       if (machine->kernel_filename) {
>           riscv_load_kernel(machine, &s->soc.cpus,
>                             memmap[SIFIVE_E_DEV_DTIM].base,
> -                          false, NULL);
> +                          false, 0, 0, NULL);
>       }
>   }
>   
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 35a335b8d0..b45fdc968c 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -599,7 +599,10 @@ static void sifive_u_machine_init(MachineState *machine)
>                                                            firmware_end_addr);
>   
>           kernel_entry = riscv_load_kernel(machine, &s->soc.u_cpus,
> -                                         kernel_start_addr, true, NULL);
> +                                         kernel_start_addr, true,
> +                                         memmap[SIFIVE_U_DEV_DRAM].base,
> +                                         memmap[SIFIVE_U_DEV_DRAM].size,
> +                                         NULL);
>       } else {
>          /*
>           * If dynamic firmware is used, it doesn't know where is the next mode
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index a584d5b3a2..e322ed8506 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -307,7 +307,10 @@ static void spike_board_init(MachineState *machine)
>   
>           kernel_entry = riscv_load_kernel(machine, &s->soc[0],
>                                            kernel_start_addr,
> -                                         true, htif_symbol_callback);
> +                                         true,
> +                                         memmap[SPIKE_DRAM].base,
> +                                         memmap[SPIKE_DRAM].size,
> +                                         htif_symbol_callback);
>       } else {
>          /*
>           * If dynamic firmware is used, it doesn't know where is the next mode
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 4e3efbee16..11f26b0dc0 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1287,7 +1287,10 @@ static void virt_machine_done(Notifier *notifier, void *data)
>                                                            firmware_end_addr);
>   
>           kernel_entry = riscv_load_kernel(machine, &s->soc[0],
> -                                         kernel_start_addr, true, NULL);
> +                                         kernel_start_addr, true,
> +                                         memmap[VIRT_DRAM].base,
> +                                         memmap[VIRT_DRAM].size,
> +                                         NULL);
>       } else {
>          /*
>           * If dynamic firmware is used, it doesn't know where is the next mode
> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> index a2e4ae9cb0..987e1add38 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -47,6 +47,8 @@ target_ulong riscv_load_kernel(MachineState *machine,
>                                  RISCVHartArrayState *harts,
>                                  target_ulong firmware_end_addr,
>                                  bool load_initrd,
> +                               uint64_t ram_base,
> +                               uint64_t ram_size,
>                                  symbol_fn_t sym_cb);
>   uint64_t riscv_compute_fdt_addr(hwaddr dram_start, uint64_t dram_size,
>                                   MachineState *ms);

