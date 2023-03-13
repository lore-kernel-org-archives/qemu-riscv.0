Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pbpmf-0001YJ-EU
	for mharc-qemu-riscv@gnu.org; Mon, 13 Mar 2023 17:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pbpmd-0001Xx-QI
 for qemu-riscv@nongnu.org; Mon, 13 Mar 2023 17:32:43 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pbpmb-0001WZ-Sd
 for qemu-riscv@nongnu.org; Mon, 13 Mar 2023 17:32:43 -0400
Received: by mail-oi1-x231.google.com with SMTP id e21so10510862oie.1
 for <qemu-riscv@nongnu.org>; Mon, 13 Mar 2023 14:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678743160;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1gP7K2huonoSUFwLAvx3zz+AnPWSEeWFy71zwz7u9KU=;
 b=IeRcrBM5EGuAeSHSjCgOSomriW1+MvH1wP0Nx0PezAc/EbBd5swtA/1maAFDi9f0eL
 Ne4a5SWJMSHmvrEL3vx3AKbx746/TFDbvx6cKT6cUUnwGt5F4ksHPR+h1lLS4p7Gd61X
 7p8/veGFfoEVfWD+Mci8LklHAoZm7H0FxqRaJ6VHYlZV1v/HLfslaJO8K+47oxP07Vzs
 SANiXxXsAguhKuQWwEVzg/7blbB+QDGL1U0bQ3H357B0oIukK6cw0SSHqCBdH1x0jygh
 LLGRRo/wOTbY2jfeB2M2JQbBZG03Nt23S8feaAFqegLdnT9oJ5IfIYEZykmF/SrG+gcu
 Z2ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678743160;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1gP7K2huonoSUFwLAvx3zz+AnPWSEeWFy71zwz7u9KU=;
 b=B0yQrGTfUdwpzj6j8HsYl9StrIuHTbBqGebC/6q8seqJxL/s3GJARSsPMiLhvQrcVu
 gpaEVKwmXLwVwMvwNsBPubmfYYP4DwBnUWE2u36eT2b/TgqjFC8VCOCtp8lWoRRwK1o0
 hJw7DSImhXEgrqWC4c8lsMwHbXhQpWE8fSGS+buP8ZOAnghAmDye+7F61iyBIo8Oet/d
 UzIYMyXAEk89Hu3bo5d2nVHghbAjWj16J5pbr/rnSPxWYGCnWc9LGAPzzAmcAfae1EcU
 qDh8uRIeZd2VIcZqd7Q4Gbj6Rppe4dyhRcuieFHEWm9VdFi7qy+kyWXnxOX5/9CRbrUU
 r26w==
X-Gm-Message-State: AO0yUKX4V3Pej9tbzcZZrGop1wYdV5lXxLMK/L4cXxjAQthXY4a1IVzv
 qArX8/P3UWNJng/EIBcyQSTYjw==
X-Google-Smtp-Source: AK7set/Xlzuy23bJBOJdcTLJd21H3ejDinL/PNDMK4kBGhzXhFMeuTxWikTfAb4hLHuOKSgS6s3mYg==
X-Received: by 2002:aca:674a:0:b0:35e:d286:231a with SMTP id
 b10-20020aca674a000000b0035ed286231amr844810oiy.22.1678743160175; 
 Mon, 13 Mar 2023 14:32:40 -0700 (PDT)
Received: from [192.168.68.107] ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 z189-20020aca33c6000000b0037fa61eb1dasm240813oiz.47.2023.03.13.14.32.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 14:32:39 -0700 (PDT)
Message-ID: <f5fdb5a8-51a0-6218-117d-1e9c327a75aa@ventanamicro.com>
Date: Mon, 13 Mar 2023 18:32:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/1] hw/riscv: Fix max size limit when put initrd to RAM
To: Anup Patel <apatel@ventanamicro.com>, Hang Xu <xuhang@eswincomputing.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@rivosinc.com,
 alistair.francis@wdc.com
References: <20230313021826.6898-1-xuhang@eswincomputing.com>
 <20230313021826.6898-2-xuhang@eswincomputing.com>
 <CAK9=C2XpTZwJUTj-C1=QG6Ww_B5rwKSZDW741Z9qNtdVY=vP2g@mail.gmail.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAK9=C2XpTZwJUTj-C1=QG6Ww_B5rwKSZDW741Z9qNtdVY=vP2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Mon, 13 Mar 2023 21:32:44 -0000



On 3/13/23 12:49, Anup Patel wrote:
> On Mon, Mar 13, 2023 at 7:49 AM Hang Xu <xuhang@eswincomputing.com> wrote:
>>
>> Because the starting address of ram is not necessarily 0,
>> the remaining free space in ram is
>> ram_size - (start - ram_base) instead of ram_size-start.
>>
>> Signed-off-by: Hang Xu <xuhang@eswincomputing.com>
> 
> What happens in-case a platform has multiple RAM banks ?

In this case the board must specify a contiguous RAM region to be used. It's
not restricted to a single RAM bank - as long as it is contiguous RAM it can
spam multiple RAM banks.

This was done to accomodate boards that has RAM gaps (at this moment the
microchip board) and where we can't use the whole RAM to determine where
to put the initrd/fdt.


Thanks,


Daniel


> 
> Regards,
> Anup
> 
>> ---
>>   hw/riscv/boot.c            | 19 +++++++++++++------
>>   hw/riscv/microchip_pfsoc.c |  5 ++++-
>>   hw/riscv/opentitan.c       |  2 +-
>>   hw/riscv/sifive_e.c        |  2 +-
>>   hw/riscv/sifive_u.c        |  5 ++++-
>>   hw/riscv/spike.c           |  5 ++++-
>>   hw/riscv/virt.c            |  5 ++++-
>>   include/hw/riscv/boot.h    |  2 ++
>>   8 files changed, 33 insertions(+), 12 deletions(-)
>>
>> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
>> index 52bf8e67de..cfbc376a82 100644
>> --- a/hw/riscv/boot.c
>> +++ b/hw/riscv/boot.c
>> @@ -173,13 +173,14 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
>>       exit(1);
>>   }
>>
>> -static void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
>> +static void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry,
>> +                              uint64_t ram_base, uint64_t ram_size)
>>   {
>>       const char *filename = machine->initrd_filename;
>> -    uint64_t mem_size = machine->ram_size;
>>       void *fdt = machine->fdt;
>>       hwaddr start, end;
>>       ssize_t size;
>> +    uint64_t max_initrd;
>>
>>       g_assert(filename != NULL);
>>
>> @@ -193,12 +194,16 @@ static void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
>>        * So for boards with less  than 256MB of RAM we put the initrd
>>        * halfway into RAM, and for boards with 256MB of RAM or more we put
>>        * the initrd at 128MB.
>> +     * A ram_size == 0, usually from a MemMapEntry[].size element,
>> +     * means that the RAM block goes all the way to ms->ram_size.
>>        */
>> -    start = kernel_entry + MIN(mem_size / 2, 128 * MiB);
>> +    ram_size = ram_size ? MIN(machine->ram_size, ram_size) : machine->ram_size;
>> +    start = kernel_entry + MIN(ram_size / 2, 128 * MiB);
>> +    max_initrd = ram_size - (start - ram_base);
>>
>> -    size = load_ramdisk(filename, start, mem_size - start);
>> +    size = load_ramdisk(filename, start, max_initrd);
>>       if (size == -1) {
>> -        size = load_image_targphys(filename, start, mem_size - start);
>> +        size = load_image_targphys(filename, start, max_initrd);
>>           if (size == -1) {
>>               error_report("could not load ramdisk '%s'", filename);
>>               exit(1);
>> @@ -217,6 +222,8 @@ target_ulong riscv_load_kernel(MachineState *machine,
>>                                  RISCVHartArrayState *harts,
>>                                  target_ulong kernel_start_addr,
>>                                  bool load_initrd,
>> +                               uint64_t ram_base,
>> +                               uint64_t ram_size,
>>                                  symbol_fn_t sym_cb)
>>   {
>>       const char *kernel_filename = machine->kernel_filename;
>> @@ -263,7 +270,7 @@ out:
>>       }
>>
>>       if (load_initrd && machine->initrd_filename) {
>> -        riscv_load_initrd(machine, kernel_entry);
>> +        riscv_load_initrd(machine, kernel_entry, ram_base, ram_size);
>>       }
>>
>>       if (fdt && machine->kernel_cmdline && *machine->kernel_cmdline) {
>> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
>> index e81bbd12df..b42d90b89e 100644
>> --- a/hw/riscv/microchip_pfsoc.c
>> +++ b/hw/riscv/microchip_pfsoc.c
>> @@ -630,7 +630,10 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
>>                                                            firmware_end_addr);
>>
>>           kernel_entry = riscv_load_kernel(machine, &s->soc.u_cpus,
>> -                                         kernel_start_addr, true, NULL);
>> +                                         kernel_start_addr, true,
>> +                                         memmap[MICROCHIP_PFSOC_DRAM_LO].base,
>> +                                         memmap[MICROCHIP_PFSOC_DRAM_LO].size,
>> +                                         NULL);
>>
>>           /* Compute the fdt load address in dram */
>>           fdt_load_addr = riscv_compute_fdt_addr(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
>> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
>> index b06944d382..bb663523d5 100644
>> --- a/hw/riscv/opentitan.c
>> +++ b/hw/riscv/opentitan.c
>> @@ -103,7 +103,7 @@ static void opentitan_board_init(MachineState *machine)
>>       if (machine->kernel_filename) {
>>           riscv_load_kernel(machine, &s->soc.cpus,
>>                             memmap[IBEX_DEV_RAM].base,
>> -                          false, NULL);
>> +                          false, 0, 0, NULL);
>>       }
>>   }
>>
>> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
>> index 04939b60c3..5b47d539a6 100644
>> --- a/hw/riscv/sifive_e.c
>> +++ b/hw/riscv/sifive_e.c
>> @@ -116,7 +116,7 @@ static void sifive_e_machine_init(MachineState *machine)
>>       if (machine->kernel_filename) {
>>           riscv_load_kernel(machine, &s->soc.cpus,
>>                             memmap[SIFIVE_E_DEV_DTIM].base,
>> -                          false, NULL);
>> +                          false, 0, 0, NULL);
>>       }
>>   }
>>
>> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
>> index 35a335b8d0..b45fdc968c 100644
>> --- a/hw/riscv/sifive_u.c
>> +++ b/hw/riscv/sifive_u.c
>> @@ -599,7 +599,10 @@ static void sifive_u_machine_init(MachineState *machine)
>>                                                            firmware_end_addr);
>>
>>           kernel_entry = riscv_load_kernel(machine, &s->soc.u_cpus,
>> -                                         kernel_start_addr, true, NULL);
>> +                                         kernel_start_addr, true,
>> +                                         memmap[SIFIVE_U_DEV_DRAM].base,
>> +                                         memmap[SIFIVE_U_DEV_DRAM].size,
>> +                                         NULL);
>>       } else {
>>          /*
>>           * If dynamic firmware is used, it doesn't know where is the next mode
>> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
>> index a584d5b3a2..e322ed8506 100644
>> --- a/hw/riscv/spike.c
>> +++ b/hw/riscv/spike.c
>> @@ -307,7 +307,10 @@ static void spike_board_init(MachineState *machine)
>>
>>           kernel_entry = riscv_load_kernel(machine, &s->soc[0],
>>                                            kernel_start_addr,
>> -                                         true, htif_symbol_callback);
>> +                                         true,
>> +                                         memmap[SPIKE_DRAM].base,
>> +                                         memmap[SPIKE_DRAM].size,
>> +                                         htif_symbol_callback);
>>       } else {
>>          /*
>>           * If dynamic firmware is used, it doesn't know where is the next mode
>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>> index 4e3efbee16..11f26b0dc0 100644
>> --- a/hw/riscv/virt.c
>> +++ b/hw/riscv/virt.c
>> @@ -1287,7 +1287,10 @@ static void virt_machine_done(Notifier *notifier, void *data)
>>                                                            firmware_end_addr);
>>
>>           kernel_entry = riscv_load_kernel(machine, &s->soc[0],
>> -                                         kernel_start_addr, true, NULL);
>> +                                         kernel_start_addr, true,
>> +                                         memmap[VIRT_DRAM].base,
>> +                                         memmap[VIRT_DRAM].size,
>> +                                         NULL);
>>       } else {
>>          /*
>>           * If dynamic firmware is used, it doesn't know where is the next mode
>> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
>> index a2e4ae9cb0..987e1add38 100644
>> --- a/include/hw/riscv/boot.h
>> +++ b/include/hw/riscv/boot.h
>> @@ -47,6 +47,8 @@ target_ulong riscv_load_kernel(MachineState *machine,
>>                                  RISCVHartArrayState *harts,
>>                                  target_ulong firmware_end_addr,
>>                                  bool load_initrd,
>> +                               uint64_t ram_base,
>> +                               uint64_t ram_size,
>>                                  symbol_fn_t sym_cb);
>>   uint64_t riscv_compute_fdt_addr(hwaddr dram_start, uint64_t dram_size,
>>                                   MachineState *ms);
>> --
>> 2.17.1
>>
>>

