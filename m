Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdKfa-0003NQ-VX
	for mharc-qemu-riscv@gnu.org; Wed, 20 Oct 2021 19:06:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdKfW-0003ML-B4; Wed, 20 Oct 2021 19:06:46 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:45681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdKfU-0001Ff-Fy; Wed, 20 Oct 2021 19:06:45 -0400
Received: by mail-il1-x132.google.com with SMTP id i6so6651776ila.12;
 Wed, 20 Oct 2021 16:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=886RvTmtbPHVNW9HOaetnKBFKW1WgdxBDqqtpCMxS2w=;
 b=J+lZFlbPeGFVp+9Lvwi5jgLymchcAbGKQN1fCCKC4ZB42kjtP10HIq+a0fCAr94WNA
 Jm+C0cpcLcxtzZNS+T0eufCTXnV3WjzcwglW46bfwQcJE4QUXnDMnL9/2qUxkJYTuuow
 Fgx++6hurTYmKwaDvY2L/Q5YKvHorcY/zYQ+PqihJL+4b7rr7/yl0sPgQPWH4ywAGM3k
 ZrzEI+n5CrqiTrcRoPNj26vV+emQWCecdHYh/UGtUhPe/hfVnQ+vLGqKc8SIZweGMo5s
 mkGAhDmugxnL/ruiktynIoCULnsXBrrlV3obQXawv3lNxrSZKOzB2t9mPg3lllSfK1UO
 iVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=886RvTmtbPHVNW9HOaetnKBFKW1WgdxBDqqtpCMxS2w=;
 b=p0h7B9ER5oOfTncDJ1P/K0Icq0jkgZonXHWMQO5C9xD1GmzRVKFewNWbSeeJ+AZc8F
 6dIkQJ4y1MyEZW5LKAcjfqwk8jfwgRkLc+GAttPnpzJZyOfsahZOCUeFN+ksjFa/bjjC
 pzFT7FzR4mQuuUoxjVYI0+6FavUuiwbBbJHRElGxO9Z6h9KiPaKnYRAQ0b3w0+s94vNF
 flgKZmAZJmC+XXmofD+7h4pOjekaDhvc++wLxMA0YiKJ8kIqvW09eV+G0llayPTTD4hE
 1di9lnx2xhifa7N47g+aKI8IZHwWAz3HPJZqzWMICj558X1Dr7w/bw2Z4+h93WOB3OJp
 lmOQ==
X-Gm-Message-State: AOAM530Kua27JgP6aD2CeczYlXV8ZwQA1w4tUMOkFIQNLP/5jT3god4r
 /bWBvcwIz2l6Ndp1nqjSB4huQYCQCDfbvV3sSnk=
X-Google-Smtp-Source: ABdhPJz9r+9Mfrkf/Mu2wuLy/EKZ9nFYeZown61ve2Im1naKe5Nl3e7wRLWgjpB5y3LfFDiC8fvmiWCdY4CIM8m7Ev8=
X-Received: by 2002:a05:6e02:1402:: with SMTP id
 n2mr1298758ilo.208.1634771202920; 
 Wed, 20 Oct 2021 16:06:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211020014112.7336-1-bmeng.cn@gmail.com>
 <20211020014112.7336-2-bmeng.cn@gmail.com>
In-Reply-To: <20211020014112.7336-2-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Oct 2021 09:06:16 +1000
Message-ID: <CAKmqyKPb34YJ9zO1abNY4W=+Uv-6JQfrBh3u9xSoRY82o2JY3A@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] hw/riscv: microchip_pfsoc: Use MachineState::ram
 and MachineClass::default_ram_id
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x132.google.com
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Oct 2021 23:06:48 -0000

On Wed, Oct 20, 2021 at 11:41 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Using memory_region_init_ram(), which can't possibly handle vhost-user,
> and can't work as expected with '-numa node,memdev' options.
>
> Use MachineState::ram instead of manually initializing RAM memory
> region, as well as by providing MachineClass::default_ram_id to
> opt in to memdev scheme.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> Changes in v2:
> - split RAM into low and high regions using aliases to machine->ram
> - rename mc->default_ram_id to "microchip.icicle.kit.ram"
>
>  hw/riscv/microchip_pfsoc.c | 36 ++++++++++++++++++++----------------
>  1 file changed, 20 insertions(+), 16 deletions(-)
>
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index e475b6d511..3fc8545562 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -463,7 +463,7 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
>      MemoryRegion *mem_low_alias = g_new(MemoryRegion, 1);
>      MemoryRegion *mem_high = g_new(MemoryRegion, 1);
>      MemoryRegion *mem_high_alias = g_new(MemoryRegion, 1);
> -    uint64_t mem_high_size;
> +    uint64_t mem_low_size, mem_high_size;
>      hwaddr firmware_load_addr;
>      const char *firmware_name;
>      bool kernel_as_payload = false;
> @@ -485,31 +485,34 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
>                              TYPE_MICROCHIP_PFSOC);
>      qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
>
> +    /* Split RAM into low and high regions using aliases to machine->ram */
> +    mem_low_size = memmap[MICROCHIP_PFSOC_DRAM_LO].size;
> +    mem_high_size = machine->ram_size - mem_low_size;
> +    memory_region_init_alias(mem_low, NULL,
> +                             "microchip.icicle.kit.ram_low", machine->ram,
> +                             0, mem_low_size);
> +    memory_region_init_alias(mem_high, NULL,
> +                             "microchip.icicle.kit.ram_high", machine->ram,
> +                             mem_low_size, mem_high_size);
> +
>      /* Register RAM */
> -    memory_region_init_ram(mem_low, NULL, "microchip.icicle.kit.ram_low",
> -                           memmap[MICROCHIP_PFSOC_DRAM_LO].size,
> -                           &error_fatal);
> -    memory_region_init_alias(mem_low_alias, NULL,
> -                             "microchip.icicle.kit.ram_low.alias",
> -                             mem_low, 0,
> -                             memmap[MICROCHIP_PFSOC_DRAM_LO_ALIAS].size);
>      memory_region_add_subregion(system_memory,
>                                  memmap[MICROCHIP_PFSOC_DRAM_LO].base,
>                                  mem_low);
> +    memory_region_add_subregion(system_memory,
> +                                memmap[MICROCHIP_PFSOC_DRAM_HI].base,
> +                                mem_high);
> +
> +    /* Create aliases for the low and high RAM regions */
> +    memory_region_init_alias(mem_low_alias, NULL,
> +                             "microchip.icicle.kit.ram_low.alias",
> +                             mem_low, 0, mem_low_size);
>      memory_region_add_subregion(system_memory,
>                                  memmap[MICROCHIP_PFSOC_DRAM_LO_ALIAS].base,
>                                  mem_low_alias);
> -
> -    mem_high_size = machine->ram_size - 1 * GiB;
> -
> -    memory_region_init_ram(mem_high, NULL, "microchip.icicle.kit.ram_high",
> -                           mem_high_size, &error_fatal);
>      memory_region_init_alias(mem_high_alias, NULL,
>                               "microchip.icicle.kit.ram_high.alias",
>                               mem_high, 0, mem_high_size);
> -    memory_region_add_subregion(system_memory,
> -                                memmap[MICROCHIP_PFSOC_DRAM_HI].base,
> -                                mem_high);
>      memory_region_add_subregion(system_memory,
>                                  memmap[MICROCHIP_PFSOC_DRAM_HI_ALIAS].base,
>                                  mem_high_alias);
> @@ -606,6 +609,7 @@ static void microchip_icicle_kit_machine_class_init(ObjectClass *oc, void *data)
>                     MICROCHIP_PFSOC_COMPUTE_CPU_COUNT;
>      mc->min_cpus = MICROCHIP_PFSOC_MANAGEMENT_CPU_COUNT + 1;
>      mc->default_cpus = mc->min_cpus;
> +    mc->default_ram_id = "microchip.icicle.kit.ram";
>
>      /*
>       * Map 513 MiB high memory, the mimimum required high memory size, because
> --
> 2.25.1
>
>

