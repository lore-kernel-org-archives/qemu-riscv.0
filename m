Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pBE7c-0003v0-GI
	for mharc-qemu-riscv@gnu.org; Fri, 30 Dec 2022 07:04:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pBE7a-0003uN-Tl
 for qemu-riscv@nongnu.org; Fri, 30 Dec 2022 07:04:22 -0500
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pBE7Y-0002BJ-BQ
 for qemu-riscv@nongnu.org; Fri, 30 Dec 2022 07:04:22 -0500
Received: by mail-oi1-x234.google.com with SMTP id s187so19268188oie.10
 for <qemu-riscv@nongnu.org>; Fri, 30 Dec 2022 04:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uKCtUqBhJq6IDY5EQutNhMR2zKeCeYIvEjtnvkC729M=;
 b=LP6fNO6jh4apVv/cQmPxnxUVEPyad/fkzkx6naV3STxEMcrpZM6Mq7LrKg2BEXtY1G
 6wqWmakTXP6JgMKnpYpp9gvrPjmRsmI1u4x+OSWctfn1fXiFYCtEsRJXCEqrEwttzhxM
 6i5/4gFDUl3sGNPNSqt3iqJd52AnDvewSRuVpWNec9Lv8ysOeczxylxWUVhDcT1afm0I
 PwJOzNIDiykv9iQTpg7LzsYhTZPvXT2qkYj1+iqrtiPqQq2OjCme8FpwnMz3abUfnlqs
 P5OhbnkWJ3CV8tQHseXoH6V9Liz63fzQCXLanc0pYHsKIaAsyYZTwh59MimXJ779E0As
 o+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uKCtUqBhJq6IDY5EQutNhMR2zKeCeYIvEjtnvkC729M=;
 b=Z61lJz6nUpY8dgcxMTRn+TNhGX9xm3IMyYCcDkRsUeoxPbDprAaAtl9l59FvVRgY0X
 M1oWiiRmO3v/LHv8U4W55NUi85StVnkFsQZWf3Bb/KeUR+51dLWdQEJ/TM9n51YufpAQ
 lJf4CmUcgEdJ2hlEaQrV7s2tOYZ4WEoWqSgQiprEJ22gwXLXyFJO6sO0kFYyh10iuCFf
 v49tr04T2r6XjKT9rYfLzUMc4+KLui1OOJxYX0TCclLVK/i8XEkxD1YCzQVavMR3jYLQ
 KGiOVeCiSKAtzORlzYR5xnzwAfPFFRawV2c3l+QxVLpUpEXoOd5mTax1OCcjk/HKOaeE
 Mo3A==
X-Gm-Message-State: AFqh2kr7ORQx+bdoVQZju2NOUQfc+H3kzgdW0bFigX1svtp/vWxeJgVr
 4b649jsIidqLE3Qd0jNtbBT+Pg==
X-Google-Smtp-Source: AMrXdXuVfTxLxteNWDN5bljc7fEB5fKG7Qx8ATmZBUxfgGouIdLKyA1shWh/bKoln8cM1vRzaUA0HA==
X-Received: by 2002:a05:6808:247:b0:361:24dd:1f4 with SMTP id
 m7-20020a056808024700b0036124dd01f4mr13930758oie.55.1672401858512; 
 Fri, 30 Dec 2022 04:04:18 -0800 (PST)
Received: from [192.168.68.107] ([191.17.222.139])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a544d85000000b0035474ff66b3sm8983534oix.35.2022.12.30.04.04.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Dec 2022 04:04:18 -0800 (PST)
Message-ID: <797aa177-bb3a-8333-7a2b-79ee799e2633@ventanamicro.com>
Date: Fri, 30 Dec 2022 09:04:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 10/11] hw/riscv/boot.c: introduce
 riscv_load_kernel_and_initrd()
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20221229181135.270661-1-dbarboza@ventanamicro.com>
 <20221229181135.270661-11-dbarboza@ventanamicro.com>
 <CAEUhbmVa8g-s0wD+EE6iZNXBfjD+M6edgq9vk7GdG2sx12J6Gg@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAEUhbmVa8g-s0wD+EE6iZNXBfjD+M6edgq9vk7GdG2sx12J6Gg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x234.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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
X-List-Received-Date: Fri, 30 Dec 2022 12:04:23 -0000



On 12/30/22 06:05, Bin Meng wrote:
> On Fri, Dec 30, 2022 at 2:47 AM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>> The microchip_icicle_kit, sifive_u, spike and virt boards are now doing
>> the same steps when '-kernel' is used:
>>
>> - execute load_kernel()
>> - load init_rd()
>> - write kernel_cmdline in the fdt
>>
>> Let's fold everything inside riscv_load_kernel() to avoid code
>> repetition. Every other board that uses riscv_load_kernel() will have
>> this same behavior, including boards that doesn't have a valid FDT, so
>> we need to take care to not do FDT operations without checking it first.
>>
>> Since we're now doing way more than just loading the kernel, rename
>> riscv_load_kernel() to riscv_load_kernel_and_initrd().
>>
>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   hw/riscv/boot.c            | 27 +++++++++++++++++++++------
>>   hw/riscv/microchip_pfsoc.c | 12 ++----------
>>   hw/riscv/opentitan.c       |  2 +-
>>   hw/riscv/sifive_e.c        |  3 ++-
>>   hw/riscv/sifive_u.c        | 12 ++----------
>>   hw/riscv/spike.c           | 14 +++-----------
>>   hw/riscv/virt.c            | 12 ++----------
>>   include/hw/riscv/boot.h    |  6 +++---
>>   8 files changed, 36 insertions(+), 52 deletions(-)
>>
>> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
>> index 5606ea6f43..d18262c302 100644
>> --- a/hw/riscv/boot.c
>> +++ b/hw/riscv/boot.c
>> @@ -171,12 +171,13 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
>>       exit(1);
>>   }
>>
>> -target_ulong riscv_load_kernel(MachineState *machine,
>> -                               target_ulong kernel_start_addr,
>> -                               symbol_fn_t sym_cb)
>> +target_ulong riscv_load_kernel_and_initrd(MachineState *machine,
>> +                                          target_ulong kernel_start_addr,
>> +                                          symbol_fn_t sym_cb)
> How about we keep the riscv_load_kernel() API, in case there is a need
> for machines that just want to load kernel only?
>
> Then introduce a new API riscv_load_kernel_and_initrd() to do both
> kernel and initrd loading?

What about an extra flag to riscv_load_kernel(), e.g:

riscv_load_kernel(MachineState *machine,  target_ulong kernel_start_addr,
                                 bool load_initrd, symbol_fn_t sym_cb)


And then machines that don't want to load initrd can opt out by using
load_initrd = false. The name of the flag would also make our intentions with
the API self explanatory (i.e. load_initrd makes load_kernel() loads initrd
as well).


Daniel

>
>>   {
>>       const char *kernel_filename = machine->kernel_filename;
>>       uint64_t kernel_load_base, kernel_entry;
>> +    void *fdt = machine->fdt;
>>
>>       g_assert(kernel_filename != NULL);
>>
>> @@ -190,21 +191,35 @@ target_ulong riscv_load_kernel(MachineState *machine,
>>       if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
>>                            NULL, &kernel_load_base, NULL, NULL, 0,
>>                            EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
>> -        return kernel_load_base;
>> +        kernel_entry = kernel_load_base;
>> +        goto out;
>>       }
>>
>>       if (load_uimage_as(kernel_filename, &kernel_entry, NULL, NULL,
>>                          NULL, NULL, NULL) > 0) {
>> -        return kernel_entry;
>> +        goto out;
>>       }
>>
>>       if (load_image_targphys_as(kernel_filename, kernel_start_addr,
>>                                  current_machine->ram_size, NULL) > 0) {
>> -        return kernel_start_addr;
>> +        kernel_entry = kernel_start_addr;
>> +        goto out;
>>       }
>>
>>       error_report("could not load kernel '%s'", kernel_filename);
>>       exit(1);
>> +
>> +out:
>> +    if (machine->initrd_filename) {
>> +        riscv_load_initrd(machine, kernel_entry);
>> +    }
>> +
>> +    if (fdt && machine->kernel_cmdline && *machine->kernel_cmdline) {
>> +        qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
>> +                                machine->kernel_cmdline);
>> +    }
>> +
>> +    return kernel_entry;
>>   }
>>
>>   void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
>> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
>> index 82ae5e7023..b64631f166 100644
>> --- a/hw/riscv/microchip_pfsoc.c
>> +++ b/hw/riscv/microchip_pfsoc.c
>> @@ -629,16 +629,8 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
>>           kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc.u_cpus,
>>                                                            firmware_end_addr);
>>
>> -        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
>> -
>> -        if (machine->initrd_filename) {
>> -            riscv_load_initrd(machine, kernel_entry);
>> -        }
>> -
>> -        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
>> -            qemu_fdt_setprop_string(machine->fdt, "/chosen",
>> -                                    "bootargs", machine->kernel_cmdline);
>> -        }
>> +        kernel_entry = riscv_load_kernel_and_initrd(machine, kernel_start_addr,
>> +                                                    NULL);
>>
>>           /* Compute the fdt load address in dram */
>>           fdt_load_addr = riscv_load_fdt(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
>> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
>> index 64d5d435b9..0818d9610c 100644
>> --- a/hw/riscv/opentitan.c
>> +++ b/hw/riscv/opentitan.c
>> @@ -101,7 +101,7 @@ static void opentitan_board_init(MachineState *machine)
>>       }
>>
>>       if (machine->kernel_filename) {
>> -        riscv_load_kernel(machine, memmap[IBEX_DEV_RAM].base, NULL);
>> +        riscv_load_kernel_and_initrd(machine, memmap[IBEX_DEV_RAM].base, NULL);
>>       }
>>   }
>>
>> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
>> index 3e3f4b0088..e22628b623 100644
>> --- a/hw/riscv/sifive_e.c
>> +++ b/hw/riscv/sifive_e.c
>> @@ -114,7 +114,8 @@ static void sifive_e_machine_init(MachineState *machine)
>>                             memmap[SIFIVE_E_DEV_MROM].base, &address_space_memory);
>>
>>       if (machine->kernel_filename) {
>> -        riscv_load_kernel(machine, memmap[SIFIVE_E_DEV_DTIM].base, NULL);
>> +        riscv_load_kernel_and_initrd(machine, memmap[SIFIVE_E_DEV_DTIM].base,
>> +                                     NULL);
>>       }
>>   }
>>
>> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
>> index bac394c959..b6fb715a9f 100644
>> --- a/hw/riscv/sifive_u.c
>> +++ b/hw/riscv/sifive_u.c
>> @@ -598,16 +598,8 @@ static void sifive_u_machine_init(MachineState *machine)
>>           kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc.u_cpus,
>>                                                            firmware_end_addr);
>>
>> -        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
>> -
>> -        if (machine->initrd_filename) {
>> -            riscv_load_initrd(machine, kernel_entry);
>> -        }
>> -
>> -        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
>> -            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
>> -                                    machine->kernel_cmdline);
>> -        }
>> +        kernel_entry = riscv_load_kernel_and_initrd(machine, kernel_start_addr,
>> +                                                    NULL);
>>       } else {
>>          /*
>>           * If dynamic firmware is used, it doesn't know where is the next mode
>> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
>> index bff9475686..cccfeb4fce 100644
>> --- a/hw/riscv/spike.c
>> +++ b/hw/riscv/spike.c
>> @@ -307,17 +307,9 @@ static void spike_board_init(MachineState *machine)
>>           kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
>>                                                            firmware_end_addr);
>>
>> -        kernel_entry = riscv_load_kernel(machine, kernel_start_addr,
>> -                                         htif_symbol_callback);
>> -
>> -        if (machine->initrd_filename) {
>> -            riscv_load_initrd(machine, kernel_entry);
>> -        }
>> -
>> -        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
>> -            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
>> -                                    machine->kernel_cmdline);
>> -        }
>> +        kernel_entry = riscv_load_kernel_and_initrd(machine,
>> +                                                    kernel_start_addr,
>> +                                                    htif_symbol_callback);
>>       } else {
>>          /*
>>           * If dynamic firmware is used, it doesn't know where is the next mode
>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>> index c8e35f861e..eadf057940 100644
>> --- a/hw/riscv/virt.c
>> +++ b/hw/riscv/virt.c
>> @@ -1281,16 +1281,8 @@ static void virt_machine_done(Notifier *notifier, void *data)
>>           kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
>>                                                            firmware_end_addr);
>>
>> -        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
>> -
>> -        if (machine->initrd_filename) {
>> -            riscv_load_initrd(machine, kernel_entry);
>> -        }
>> -
>> -        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
>> -            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
>> -                                    machine->kernel_cmdline);
>> -        }
>> +        kernel_entry = riscv_load_kernel_and_initrd(machine, kernel_start_addr,
>> +                                                    NULL);
>>       } else {
>>          /*
>>           * If dynamic firmware is used, it doesn't know where is the next mode
>> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
>> index f94653a09b..16b86450d3 100644
>> --- a/include/hw/riscv/boot.h
>> +++ b/include/hw/riscv/boot.h
>> @@ -43,9 +43,9 @@ char *riscv_find_firmware(const char *firmware_filename,
>>   target_ulong riscv_load_firmware(const char *firmware_filename,
>>                                    hwaddr firmware_load_addr,
>>                                    symbol_fn_t sym_cb);
>> -target_ulong riscv_load_kernel(MachineState *machine,
>> -                               target_ulong firmware_end_addr,
>> -                               symbol_fn_t sym_cb);
>> +target_ulong riscv_load_kernel_and_initrd(MachineState *machine,
>> +                                          target_ulong firmware_end_addr,
>> +                                          symbol_fn_t sym_cb);
>>   void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
>>   uint64_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
>>   void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
>> --
> Regards,
> Bin


