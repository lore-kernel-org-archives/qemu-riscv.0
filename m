Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNDTc-00028b-Bw
	for mharc-qemu-riscv@gnu.org; Wed, 01 Feb 2023 08:48:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pNDTI-00025Q-9J
 for qemu-riscv@nongnu.org; Wed, 01 Feb 2023 08:48:31 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pNDTF-0001Sf-5k
 for qemu-riscv@nongnu.org; Wed, 01 Feb 2023 08:48:19 -0500
Received: by mail-ot1-x343.google.com with SMTP id
 n25-20020a9d7119000000b0068bd8c1e836so2180182otj.3
 for <qemu-riscv@nongnu.org>; Wed, 01 Feb 2023 05:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kaXPMi4b7GFZewaF0HokNp4H7RHh+Erht6PuTeQGn0I=;
 b=C/tUCTJMgGJFZtdzKj0nItqH6WjZwXNZ9Dko80gxNVKwNBaUs3tLtPvkKXwDMt1dK0
 wqKTkqT62Xp/7s1ULqGCt9rn55r9EzKsjVm08xpPubXVznnmCEqjtGk6IKDtCa1eqCH+
 ELWiPhpepdpplXX4Gga68PGnKI/t3nzeHsQRC92rbN0Oo+1zjg6gQ9U3g65Bu6AzOl6C
 chdZx+S5hbqCQJ4RgoadsBxJI4xqbieZw4VMLC13vwXdiPzQVKTi+A54/Yl5HoaiE1QX
 lHaiwAxELKaeB9xzXCniQHUOmKE/t+D/LZgsBgJb82t+7wW7Sru25s3ei5y8gOXoIKeV
 fNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kaXPMi4b7GFZewaF0HokNp4H7RHh+Erht6PuTeQGn0I=;
 b=xbyySbftOW8OUatCzf9AGP07Kxq++WBvf8jfn13hG6NlCkJBr5mB8oZeWESX1dfOgd
 iQTwqhls/w4EZfdhqMx7WyIfNY9AkKa0g4GgnqT1luSHKnJnqDSNF2r4rnouF0FxYxNf
 q9aEeZYfjHKL/A9NRWTonmRr2J/nm4OBZhVXYtAQXj0Ps+7WRUzocX3cPCDdXnh5L9jz
 h2Ct3XXDdvGt+OOKug2QI22teSGYSRnPd8zG/1ZHyhLaEyUhCcEpYmbPj7pQiVZEAkWk
 mbVQuB5nE+nVmmnd/pPac8Q40B6wa22yEi1YbViMT2YEOSYBi8nWyl5On1RMWMi50wQ7
 UyhA==
X-Gm-Message-State: AO0yUKX3AmrDQH5N4yRL11PVm0ahWt9RFLLRu/1A5kU/W7h38rBbbmip
 09w7goSkyXcJWxFDxeSx8irZeQ==
X-Google-Smtp-Source: AK7set9/u/zwvsOHQWDx1iDs8lIQ1mXF8Zlv8XAh0bAMpH38ltjjZ/8wU8fyLizvp8+IrMFJqNacfA==
X-Received: by 2002:a9d:71ca:0:b0:68d:48a9:85ec with SMTP id
 z10-20020a9d71ca000000b0068d48a985ecmr321259otj.24.1675259295154; 
 Wed, 01 Feb 2023 05:48:15 -0800 (PST)
Received: from [192.168.68.107] ([177.102.69.207])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a9d7309000000b0068d4292f4c0sm450836otk.35.2023.02.01.05.48.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 05:48:14 -0800 (PST)
Message-ID: <a3aab251-a90c-ea06-271d-ce02e3ee589c@ventanamicro.com>
Date: Wed, 1 Feb 2023 10:48:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v9 1/3] hw/riscv: clear kernel_entry higher bits from
 load_elf_ram_sym()
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>
References: <20230119213707.651533-1-dbarboza@ventanamicro.com>
 <20230119213707.651533-2-dbarboza@ventanamicro.com>
 <CAKmqyKPsZC64SsecFip20NhnwjKHRdw1nj-3=jYPU5Lu+urMTQ@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAKmqyKPsZC64SsecFip20NhnwjKHRdw1nj-3=jYPU5Lu+urMTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x343.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-List-Received-Date: Wed, 01 Feb 2023 13:48:35 -0000



On 1/31/23 21:16, Alistair Francis wrote:
> On Fri, Jan 20, 2023 at 7:38 AM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>>
>> load_elf_ram_sym() will sign-extend 32 bit addresses. If a 32 bit
>> QEMU guest happens to be running in a hypervisor that are using 64
>> bits to encode its address, kernel_entry can be padded with '1's
>> and create problems [1].
>>
>> Use a translate_fn() callback to be called by load_elf_ram_sym() and
>> return only the 32 bits address if we're running a 32 bit CPU.
>>
>> [1] https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02281.html
>>
>> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Suggested-by: Bin Meng <bmeng.cn@gmail.com>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   hw/riscv/boot.c            | 20 +++++++++++++++++++-
>>   hw/riscv/microchip_pfsoc.c |  3 ++-
>>   hw/riscv/opentitan.c       |  3 ++-
>>   hw/riscv/sifive_e.c        |  3 ++-
>>   hw/riscv/sifive_u.c        |  3 ++-
>>   hw/riscv/spike.c           |  3 ++-
>>   hw/riscv/virt.c            |  3 ++-
>>   include/hw/riscv/boot.h    |  1 +
>>   8 files changed, 32 insertions(+), 7 deletions(-)
>>
>> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
>> index 2594276223..46fc7adccf 100644
>> --- a/hw/riscv/boot.c
>> +++ b/hw/riscv/boot.c
>> @@ -173,7 +173,24 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
>>       exit(1);
>>   }
>>
>> +static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
>> +{
>> +    RISCVHartArrayState *harts = opaque;
>> +
>> +    if (riscv_is_32bit(harts)) {
>> +        /*
>> +         * For 32 bit CPUs, kernel_load_base is sign-extended
>> +         * (i.e. it can be padded with '1's) by load_elf().
>> +         * Remove the sign extension by truncating to 32-bit.
>> +         */
>> +        return extract64(addr, 0, 32);
>> +    }
>> +
>> +    return addr;
> 
> So.... After all that, this doesn't actually mask pentry from
> load_elf_ram_sym(), so it doesn't help.

Interesting. And it has to do with how load_elf() is handling it. All these
load_elf() functions will end up in either load_elf64() or load_elf32(), which
in turn will call glue(load_elf, SZ) from include/hw/elf_ops.h.

In that function, pentry is calculated right at the start:


     if (pentry)
         *pentry = (uint64_t)(elf_sword)ehdr.e_entry;


And then, down below, the translation function is used:

             if (translate_fn) {
                 addr = translate_fn(translate_opaque, ph->p_paddr);
                 glue(elf_reloc, SZ)(&ehdr, fd, must_swab,  translate_fn,
                                     translate_opaque, data, ph, elf_machine);
             } else {
                 addr = ph->p_paddr;
             }

And 'pentry' is only recalculated if we do NOT have a translate_fn:


             /* the entry pointer in the ELF header is a virtual
              * address, if the text segments paddr and vaddr differ
              * we need to adjust the entry */
             if (pentry && !translate_fn &&
                     ph->p_vaddr != ph->p_paddr &&
                     ehdr.e_entry >= ph->p_vaddr &&
                     ehdr.e_entry < ph->p_vaddr + ph->p_filesz &&
                     ph->p_flags & PF_X) {
                 *pentry = ehdr.e_entry - ph->p_vaddr + ph->p_paddr;
             }


I can't say whether this is an oversight or intended, but in the end it's a given
that pentry is not being affected by translate_fn() as we thought it would - meaning
that we're still passing the sign-extension along.

I'll mention this in the commit message for future reference.




> 
>> +}
>> +
>>   target_ulong riscv_load_kernel(MachineState *machine,
>> +                               RISCVHartArrayState *harts,
>>                                  target_ulong kernel_start_addr,
>>                                  symbol_fn_t sym_cb)
>>   {
>> @@ -189,7 +206,8 @@ target_ulong riscv_load_kernel(MachineState *machine,
>>        * the (expected) load address load address. This allows kernels to have
>>        * separate SBI and ELF entry points (used by FreeBSD, for example).
>>        */
>> -    if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
>> +    if (load_elf_ram_sym(kernel_filename, NULL,
>> +                         translate_kernel_address, harts,
>>                            NULL, &kernel_load_base, NULL, NULL, 0,
>>                            EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
> 
> I think we just need to add the mask here


I saw in other machines that we can retrieve 'kernel_low' using the parameter
right after kernel_load_base. This worked for me to boot a 32 bit 'virt' machine
with -kernel:


-    if (load_elf_ram_sym(kernel_filename, NULL,
-                         translate_kernel_address, harts,
-                         NULL, &kernel_load_base, NULL, NULL, 0,
+    if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL, NULL,
+                         &kernel_load_base, &kernel_low, NULL, 0,
                           EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
          kernel_entry = kernel_load_base;
+
+        if (riscv_is_32bit(harts)) {
+            kernel_entry = kernel_low;
+        }


I don't have your failing use case here so it would be up for you to be 'adventurous'
and see if this would fix the problem you're seeing. If you'd rather get this over
with we can just mask it out and call it day.


Thanks,

Daniel



> 
> Alistair
> 
>>           return kernel_load_base;
>> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
>> index 82ae5e7023..bdefeb3cbb 100644
>> --- a/hw/riscv/microchip_pfsoc.c
>> +++ b/hw/riscv/microchip_pfsoc.c
>> @@ -629,7 +629,8 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
>>           kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc.u_cpus,
>>                                                            firmware_end_addr);
>>
>> -        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
>> +        kernel_entry = riscv_load_kernel(machine, &s->soc.u_cpus,
>> +                                         kernel_start_addr, NULL);
>>
>>           if (machine->initrd_filename) {
>>               riscv_load_initrd(machine, kernel_entry);
>> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
>> index 64d5d435b9..2731138c41 100644
>> --- a/hw/riscv/opentitan.c
>> +++ b/hw/riscv/opentitan.c
>> @@ -101,7 +101,8 @@ static void opentitan_board_init(MachineState *machine)
>>       }
>>
>>       if (machine->kernel_filename) {
>> -        riscv_load_kernel(machine, memmap[IBEX_DEV_RAM].base, NULL);
>> +        riscv_load_kernel(machine, &s->soc.cpus,
>> +                          memmap[IBEX_DEV_RAM].base, NULL);
>>       }
>>   }
>>
>> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
>> index 3e3f4b0088..1a7d381514 100644
>> --- a/hw/riscv/sifive_e.c
>> +++ b/hw/riscv/sifive_e.c
>> @@ -114,7 +114,8 @@ static void sifive_e_machine_init(MachineState *machine)
>>                             memmap[SIFIVE_E_DEV_MROM].base, &address_space_memory);
>>
>>       if (machine->kernel_filename) {
>> -        riscv_load_kernel(machine, memmap[SIFIVE_E_DEV_DTIM].base, NULL);
>> +        riscv_load_kernel(machine, &s->soc.cpus,
>> +                          memmap[SIFIVE_E_DEV_DTIM].base, NULL);
>>       }
>>   }
>>
>> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
>> index 2fb6ee231f..83dfe09877 100644
>> --- a/hw/riscv/sifive_u.c
>> +++ b/hw/riscv/sifive_u.c
>> @@ -598,7 +598,8 @@ static void sifive_u_machine_init(MachineState *machine)
>>           kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc.u_cpus,
>>                                                            firmware_end_addr);
>>
>> -        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
>> +        kernel_entry = riscv_load_kernel(machine, &s->soc.u_cpus,
>> +                                         kernel_start_addr, NULL);
>>
>>           if (machine->initrd_filename) {
>>               riscv_load_initrd(machine, kernel_entry);
>> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
>> index badc11ec43..2bcc50d90d 100644
>> --- a/hw/riscv/spike.c
>> +++ b/hw/riscv/spike.c
>> @@ -305,7 +305,8 @@ static void spike_board_init(MachineState *machine)
>>           kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
>>                                                            firmware_end_addr);
>>
>> -        kernel_entry = riscv_load_kernel(machine, kernel_start_addr,
>> +        kernel_entry = riscv_load_kernel(machine, &s->soc[0],
>> +                                         kernel_start_addr,
>>                                            htif_symbol_callback);
>>
>>           if (machine->initrd_filename) {
>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>> index 4a11b4b010..ac173a6ed6 100644
>> --- a/hw/riscv/virt.c
>> +++ b/hw/riscv/virt.c
>> @@ -1274,7 +1274,8 @@ static void virt_machine_done(Notifier *notifier, void *data)
>>           kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
>>                                                            firmware_end_addr);
>>
>> -        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
>> +        kernel_entry = riscv_load_kernel(machine, &s->soc[0],
>> +                                         kernel_start_addr, NULL);
>>
>>           if (machine->initrd_filename) {
>>               riscv_load_initrd(machine, kernel_entry);
>> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
>> index f94653a09b..105706bf25 100644
>> --- a/include/hw/riscv/boot.h
>> +++ b/include/hw/riscv/boot.h
>> @@ -44,6 +44,7 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
>>                                    hwaddr firmware_load_addr,
>>                                    symbol_fn_t sym_cb);
>>   target_ulong riscv_load_kernel(MachineState *machine,
>> +                               RISCVHartArrayState *harts,
>>                                  target_ulong firmware_end_addr,
>>                                  symbol_fn_t sym_cb);
>>   void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
>> --
>> 2.39.0
>>
>>

