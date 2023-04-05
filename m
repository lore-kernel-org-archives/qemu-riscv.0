Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjzbR-0004z2-BP
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 05:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pjzbP-0004yk-Rc
 for qemu-riscv@nongnu.org; Wed, 05 Apr 2023 05:38:51 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pjzbM-00082e-Hh
 for qemu-riscv@nongnu.org; Wed, 05 Apr 2023 05:38:51 -0400
Received: by mail-oi1-x236.google.com with SMTP id r16so26136512oij.5
 for <qemu-riscv@nongnu.org>; Wed, 05 Apr 2023 02:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680687526;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ajJGqwfcEblMvMwj7bXrSlKFEhxQBhyxnuN+nUuvY9g=;
 b=cPXTmlUce7ATYsNLx4om7/uxO7USOS/WR4wYVxYp6+CT/KAIeY+z8QSVONVFzSPyq4
 Ei0fAAGXm/ddhWVkS1Rwkc21mennw8slHTZePC06VToM+BGrJI4AwEV8jswabkjAnYGm
 Int49maa6C+5+1choZ1XYeuP4NS8uaX7nPPXCRNRJpmWpMRGhDEdKq7iAxvlJFxk/p87
 x47ugdFa9gjU6PA8QEGEjcBiW0olDoywopQl5qUCVU9f5hE22NCjAxkI/4uyv52DhzJz
 xEhrasy4f36Kv81tC3SxeWGNqwQ9I66VwDHnPBhc2GB4WqooLQH3m/0MzfAotxdY/AHN
 9wVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680687526;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ajJGqwfcEblMvMwj7bXrSlKFEhxQBhyxnuN+nUuvY9g=;
 b=yzAYLCwz20z/5zZShxKRRIN0/ilMWaPVz90Ya3f11PVoPJ6DE+GpR7655/FwX4QG+q
 3pWF/BI6NqAC3BGBLgUM5+eAi8+X69DjarfSc5yR15bUT54iJORc4seeFGIIsu2kOSE1
 VzwK2B9CBTxrnuEPaUI5khv2gmybktaS/MrMKmlkF9aU94P9P2W0OwOFmQhqFfewhqbZ
 FpsrU8eik8zpSZ8sOhJVEbXVSObj/qSfhOOL5DKpDQdW3d/nEXiQLKW9YfBbbjuk4zXY
 zHPGnglC8S4KziZhrmmDuzoIDZ8eJelAA77GLSLh0nzD7zZXvpYjsdtWwd46x2KGjTjU
 OALg==
X-Gm-Message-State: AAQBX9f6tu5qO3MvzEsYRMM7Vk4FfbXUDRYYPnQpdbDHC/yt1X6G7Ds8
 GTipxgLjuJTaD2Mr8NVEgy/IDw==
X-Google-Smtp-Source: AKy350bqQjHGNDZTjP6ABuz3tJI2HiblduKN2fGq5df+TlIurJs6YTfeeKVVbVO539caFwhFbcPhkA==
X-Received: by 2002:aca:120e:0:b0:386:9c8a:e729 with SMTP id
 14-20020aca120e000000b003869c8ae729mr1800725ois.17.1680687526539; 
 Wed, 05 Apr 2023 02:38:46 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 u188-20020a4a57c5000000b00541269a2fcesm4384369ooa.25.2023.04.05.02.38.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 02:38:46 -0700 (PDT)
Message-ID: <b17e58dc-f530-1730-5e1d-070edcd1f950@ventanamicro.com>
Date: Wed, 5 Apr 2023 06:38:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 1/1] hw/riscv: Fix max size limit when put initrd to RAM
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>,
 Hang Xu <xuhang@eswincomputing.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@rivosinc.com,
 alistair.francis@wdc.com
References: <20230313021826.6898-1-xuhang@eswincomputing.com>
 <20230313021826.6898-2-xuhang@eswincomputing.com>
 <CAKmqyKNuA-4SpfN+RNDo8wOFgVuD-s-tXGOg+1po4KYW8KfhUQ@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAKmqyKNuA-4SpfN+RNDo8wOFgVuD-s-tXGOg+1po4KYW8KfhUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.925,
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
X-List-Received-Date: Wed, 05 Apr 2023 09:38:52 -0000



On 4/5/23 02:53, Alistair Francis wrote:
> On Mon, Mar 13, 2023 at 11:12 PM Hang Xu <xuhang@eswincomputing.com> wrote:
>>
>> Because the starting address of ram is not necessarily 0,
>> the remaining free space in ram is
>> ram_size - (start - ram_base) instead of ram_size-start.
> 
> I think this could be clearer. It's not clear here that you mean the
> free space after the kernel (for in the initrd).
> 
>>
>> Signed-off-by: Hang Xu <xuhang@eswincomputing.com>
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
> 
> This doesn't seem right. If machine->ram_size is greater then the
> board can support we should tell the user and have them set a correct
> size

'ram_size' here is the size of the memory block that the board will use to put
initrd into.

Perhaps this var can be renamed to 'ram_block_size' or 'memmap_size' for clarity.


Daniel

> 
>> +    start = kernel_entry + MIN(ram_size / 2, 128 * MiB);
>> +    max_initrd = ram_size - (start - ram_base);
> 
> Good catch. Passing the base address of memory is a good move here.
> 
> Alistair
> 
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

