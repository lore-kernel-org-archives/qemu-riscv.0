Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAYj6-0006j2-03
	for mharc-qemu-riscv@gnu.org; Wed, 28 Dec 2022 10:52:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAYiz-0006en-Mk
 for qemu-riscv@nongnu.org; Wed, 28 Dec 2022 10:52:17 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAYiv-0005zQ-Kb
 for qemu-riscv@nongnu.org; Wed, 28 Dec 2022 10:52:12 -0500
Received: by mail-wr1-x436.google.com with SMTP id y16so15282366wrm.2
 for <qemu-riscv@nongnu.org>; Wed, 28 Dec 2022 07:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ouNpBjITVl1/9DCdAcZAuVmdG2j8TP0kohnxhxppq8w=;
 b=dpl1++eWDcVLWXTIp0H5fiEPDBDIJKotEY0Ap2rm8w+W1ReDA7l9SBPXhcYhCVUamo
 jo3ekalnT4ps80wXkszYWq5+Uc36Qj2P1v6BZpMug/qbMbTbwuFj949ZuEzOxnVg784m
 NOUaCgYjQ4gQ0nFqfwh2bJFiIYr4h2ASm3sOpURxNdD6djha9RH/AztBqEEb+oiHjj8M
 mWBlgEDpIs/j3NR0wEooPIzu4nVYwK3MR9GrZJMPlgmEkppPT4HOqdsgA3/V+IVNeFgC
 ypY6t8Z1Dzl5rwXlxI47heNUbLxO7p6dOJxaNoO8QXdWGrnI1aA/eCow9TIKsfTQCyn7
 VKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ouNpBjITVl1/9DCdAcZAuVmdG2j8TP0kohnxhxppq8w=;
 b=KiT5myJCEFG4MjdSqZAsGGJyujDuuTjo3VVfSvcKedVtHNmsCyE5QMFnEP4DJKrkg1
 GdeINzWdiTa/plEzpOfc+SwrOXJl3AcP2l5XXoF1f+rL1w7WJ2awSnVUEXoBDrOShP0n
 Mni96Th+5vaEyvKY5hIA5mpH2AKa+d630tvaDsRq6qzpxbPJDLO4hQ6l4XepVaXekQ0f
 7B1pES/EgueyNlwphZ09DOIQRkWpoOXO4Xjn7PNkBVircc/odLoq7gtOQ6Dmr8zHg3ML
 CoxotMqsi/b/ojGAbzgwxGwQh9FdVGM/62py3gFb8cJlllkKjZ5Faqhi6ni4C9qsTThp
 vh1Q==
X-Gm-Message-State: AFqh2koTeDG9Bxcf97jsJf9J7kCfTpjaNuFvnpjbzIPk8Je2T14+7GNS
 SNGZkCwauoDpHYFRdrCxVfuZQGZg6k5eed5c
X-Google-Smtp-Source: AMrXdXsbk3M7xVn86UGdypl/8CfSirAqXrViRDu/ymi2hm9sOL3iaIRSyToIqOcxdLvskM2ScXvauA==
X-Received: by 2002:a5d:53cd:0:b0:261:d8be:3047 with SMTP id
 a13-20020a5d53cd000000b00261d8be3047mr16191809wrw.3.1672242728027; 
 Wed, 28 Dec 2022 07:52:08 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c4-20020a5d4f04000000b002365cd93d05sm15638972wru.102.2022.12.28.07.52.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 07:52:07 -0800 (PST)
Message-ID: <be60d9e5-4c9c-791f-564b-2a740fe3d261@linaro.org>
Date: Wed, 28 Dec 2022 16:52:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 09/10] hw/riscv/boot.c: introduce
 riscv_load_kernel_and_initrd()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20221228133336.197467-1-dbarboza@ventanamicro.com>
 <20221228133336.197467-10-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221228133336.197467-10-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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
X-List-Received-Date: Wed, 28 Dec 2022 15:52:17 -0000

On 28/12/22 14:33, Daniel Henrique Barboza wrote:
> The microchip_icicle_kit, sifive_u, spike and virt boards are now doing
> the same steps when '-kernel' is used:
> 
> - execute load_kernel()
> - load init_rd()
> - write kernel_cmdline in the fdt
> 
> Let's fold everything inside riscv_load_kernel() to avoid code
> repetition. Every other board that uses riscv_load_kernel() will have
> this same behavior, including boards that doesn't have a valid FDT, so
> we need to take care to not do FDT operations without checking it first.
> 
> Since we're now doing way more than just loading the kernel, rename
> riscv_load_kernel() to riscv_load_kernel_and_initrd().
> 
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   hw/riscv/boot.c            | 27 +++++++++++++++++++++------
>   hw/riscv/microchip_pfsoc.c | 12 ++----------
>   hw/riscv/opentitan.c       |  2 +-
>   hw/riscv/sifive_e.c        |  3 ++-
>   hw/riscv/sifive_u.c        | 12 ++----------
>   hw/riscv/spike.c           | 14 +++-----------
>   hw/riscv/virt.c            | 12 ++----------
>   include/hw/riscv/boot.h    |  6 +++---
>   8 files changed, 36 insertions(+), 52 deletions(-)
> 
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index cd9c989edb..6d1243ad8b 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -171,12 +171,13 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
>       exit(1);
>   }
>   
> -target_ulong riscv_load_kernel(MachineState *machine,
> -                               target_ulong kernel_start_addr,
> -                               symbol_fn_t sym_cb)
> +target_ulong riscv_load_kernel_and_initrd(MachineState *machine,
> +                                          target_ulong kernel_start_addr,
> +                                          symbol_fn_t sym_cb)
>   {
>       const char *kernel_filename = machine->kernel_filename;
>       uint64_t kernel_load_base, kernel_entry;

I wonder if compilers/static analyzers might end complaining
because kernel_entry being set is not obvious.

Anyhow,
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +    void *fdt = machine->fdt;
>   
>       /*
>        * NB: Use low address not ELF entry point to ensure that the fw_dynamic
> @@ -188,21 +189,35 @@ target_ulong riscv_load_kernel(MachineState *machine,
>       if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
>                            NULL, &kernel_load_base, NULL, NULL, 0,
>                            EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
> -        return kernel_load_base;
> +        kernel_entry = kernel_load_base;
> +        goto out;
>       }
>   
>       if (load_uimage_as(kernel_filename, &kernel_entry, NULL, NULL,
>                          NULL, NULL, NULL) > 0) {
> -        return kernel_entry;
> +        goto out;
>       }
>   
>       if (load_image_targphys_as(kernel_filename, kernel_start_addr,
>                                  current_machine->ram_size, NULL) > 0) {
> -        return kernel_start_addr;
> +        kernel_entry = kernel_start_addr;
> +        goto out;
>       }
>   
>       error_report("could not load kernel '%s'", kernel_filename);
>       exit(1);
> +
> +out:
> +    if (machine->initrd_filename) {
> +        riscv_load_initrd(machine, kernel_entry);
> +    }
> +
> +    if (fdt && machine->kernel_cmdline && *machine->kernel_cmdline) {
> +        qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
> +                                machine->kernel_cmdline);
> +    }
> +
> +    return kernel_entry;
>   }

