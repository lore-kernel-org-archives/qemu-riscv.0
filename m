Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIUWr-0000bd-S4
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 08:00:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIUWo-0000aM-Gx
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 08:00:27 -0500
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIUWm-0003CV-Hw
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 08:00:26 -0500
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-15ebfdf69adso2492840fac.0
 for <qemu-riscv@nongnu.org>; Thu, 19 Jan 2023 05:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GMaoQO0f2teLiXR4j+0EQO0p2xPbhhpWKBDRZJSUv3k=;
 b=CWmwXcmwOSNBCBCjqe7dCrUlYVx4/sISzOctr7gATjkhmiqRkR8jRrhCKYZkAUWBX/
 rhUWLkPF3bDC2yYFSS4gz2+P1kF5nSli+fQKc4c/71h8L2qU37sEPM5tjg4GHzOZgL8b
 RaVpqH/7Jm5FaA7JsMadZgzf3JmNUaMubNgNafA5JVp85cDZNMp5abbdkW18RKhqnDRT
 xmxBYIhyDuIdRAZGzhhAR6nUH0ZPxfSFSzvaem/iDl9fH5KczAixPvXJx7Vk8aXqxM0D
 171tU5J88bWWkom6GZ+aGUP8VDUqJPHQCDd7CQxyt62GW6pptu/Xe5+2UHtcULJObxj+
 U8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GMaoQO0f2teLiXR4j+0EQO0p2xPbhhpWKBDRZJSUv3k=;
 b=XJc8rW8FVXWndYarlCGVmbyvq1/KwspXRZhPN4yDU3ISXDV1y4lvygOYFXQ/RLyfoi
 +m/ol9T/XxJHGWqBlE8HAsxQQfRIz3mGsmBhGVyPjOyB9CZdMKcLX9bckoZrCYQBUUT5
 uHFCixUgn40PuhwG4k7XJqeiwONKWcBlBfE3hcuGxdv9N3OccegsWuGngYjlixpzpncH
 DbbchYbWIh0Z6qh79OI97q4TZSvuOMCFodfSSo2LdcteU0H6MZuBL4TVkva7WslCcIca
 STjCy/5fBwMrEslRL9B3IMV055fjLlq2w2fQPUrBiX3ItWb4k4uyrY7Wsu2/qq4Ggh8C
 6ziQ==
X-Gm-Message-State: AFqh2konN+R28nF3XdXnNmn6n3wybJlP9pa5nWaIlvCJZaS+hb8B6MwN
 Ro9OL5Z+guyOgfiquNESI1mgqg==
X-Google-Smtp-Source: AMrXdXsL8hNfb3h/wuSfT5GWZ0cHJd8HR6/6kv1FzKU8y3+blx6ElNU47p9o0G4LeeCZt4xCvuybGQ==
X-Received: by 2002:a05:6870:4947:b0:144:be2f:bea1 with SMTP id
 fl7-20020a056870494700b00144be2fbea1mr5379640oab.58.1674133222666; 
 Thu, 19 Jan 2023 05:00:22 -0800 (PST)
Received: from [192.168.68.107] ([191.17.222.2])
 by smtp.gmail.com with ESMTPSA id
 bx19-20020a056830601300b006619533d1ddsm13062746otb.76.2023.01.19.05.00.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 05:00:22 -0800 (PST)
Message-ID: <fa2ea49a-fb1c-542b-fd08-6b60eb85ac06@ventanamicro.com>
Date: Thu, 19 Jan 2023 10:00:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 3/6] hw/riscv: simplify riscv_compute_fdt_addr()
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 philmd@linaro.org
References: <20230116173420.1146808-1-dbarboza@ventanamicro.com>
 <20230116173420.1146808-4-dbarboza@ventanamicro.com>
 <CAKmqyKMBjVjxL=YCprrQe4Hy5DXy4riOi4zwExxWG+nW7hx_AQ@mail.gmail.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAKmqyKMBjVjxL=YCprrQe4Hy5DXy4riOi4zwExxWG+nW7hx_AQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x35.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
X-List-Received-Date: Thu, 19 Jan 2023 13:00:27 -0000



On 1/18/23 23:23, Alistair Francis wrote:
> On Tue, Jan 17, 2023 at 3:34 AM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>> All callers are using attributes from the MachineState object. Use a
>> pointer to it instead of passing dram_size (which is always
>> machine->ram_size) and fdt (always machine->fdt).
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   hw/riscv/boot.c            | 6 +++---
>>   hw/riscv/microchip_pfsoc.c | 4 ++--
>>   hw/riscv/sifive_u.c        | 4 ++--
>>   hw/riscv/spike.c           | 4 ++--
>>   hw/riscv/virt.c            | 3 +--
>>   include/hw/riscv/boot.h    | 2 +-
>>   6 files changed, 11 insertions(+), 12 deletions(-)
>>
>> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
>> index b213a32157..508da3f5c7 100644
>> --- a/hw/riscv/boot.c
>> +++ b/hw/riscv/boot.c
>> @@ -255,11 +255,11 @@ void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
>>    *
>>    * The FDT is fdt_packed() during the calculation.
>>    */
>> -uint32_t riscv_compute_fdt_addr(hwaddr dram_base, uint64_t mem_size,
>> -                                void *fdt)
>> +uint32_t riscv_compute_fdt_addr(MachineState *machine, hwaddr dram_base)
>>   {
>> +    void *fdt = machine->fdt;
>>       uint64_t temp;
>> -    hwaddr dram_end = dram_base + mem_size;
>> +    hwaddr dram_end = dram_base + machine->ram_size;
>>       int ret = fdt_pack(fdt);
>>       int fdtsize;
>>
>> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
>> index dcdbc2cac3..a53e48e996 100644
>> --- a/hw/riscv/microchip_pfsoc.c
>> +++ b/hw/riscv/microchip_pfsoc.c
>> @@ -641,8 +641,8 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
>>           }
>>
>>           /* Compute the fdt load address in dram */
>> -        fdt_load_addr = riscv_compute_fdt_addr(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
>> -                                              machine->ram_size, machine->fdt);
>> +        fdt_load_addr = riscv_compute_fdt_addr(machine,
>> +                                               memmap[MICROCHIP_PFSOC_DRAM_LO].base);
> I don't think this is correct here.
>
> So, first up I understand we don't correctly handle this today, *but*
> I see this change as a step in the wrong direction.
>
> The problem here is that ram is split over two areas. So if
> machine->ram_size is larger then 0x40000000 it is going to overflow
> MICROCHIP_PFSOC_DRAM_LO and jump to MICROCHIP_PFSOC_DRAM_HI
> (0x1000000000).

Yeah .... I'll add a new helper just to handle the microchip_pfsoc case which seems to
be the only RISC-V board that has sparse RAM.




>
> So we really want something like this
>
>          /* Compute the fdt load address in dram */
>          if (machine->ram_size > memmap[MICROCHIP_PFSOC_DRAM_LO].size) {
>              fdt_load_addr = riscv_load_fdt(memmap[MICROCHIP_PFSOC_DRAM_HI].base,
>                                             machine->ram_size -
> memmap[MICROCHIP_PFSOC_DRAM_LO].size,
>                                             machine->fdt);
>          } else {
>              fdt_load_addr = riscv_load_fdt(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
>                                             machine->ram_size,
>                                             machine->fdt);
>          }
>
> to handle overflowing MICROCHIP_PFSOC_DRAM_LO. While this patch is
> going in the wrong direction and making that more difficult
>
> Alistair
>
>
>
>>           riscv_load_fdt(fdt_load_addr, machine->fdt);
>>
>>           /* Load the reset vector */
>> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
>> index 626d4dc2f3..ebfddf161d 100644
>> --- a/hw/riscv/sifive_u.c
>> +++ b/hw/riscv/sifive_u.c
>> @@ -616,8 +616,8 @@ static void sifive_u_machine_init(MachineState *machine)
>>           kernel_entry = 0;
>>       }
>>
>> -    fdt_load_addr = riscv_compute_fdt_addr(memmap[SIFIVE_U_DEV_DRAM].base,
>> -                                           machine->ram_size, machine->fdt);
>> +    fdt_load_addr = riscv_compute_fdt_addr(machine,
>> +                                           memmap[SIFIVE_U_DEV_DRAM].base);
>>       riscv_load_fdt(fdt_load_addr, machine->fdt);
>>
>>       if (!riscv_is_32bit(&s->soc.u_cpus)) {
>> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
>> index 88b9fdfc36..afd581436b 100644
>> --- a/hw/riscv/spike.c
>> +++ b/hw/riscv/spike.c
>> @@ -324,8 +324,8 @@ static void spike_board_init(MachineState *machine)
>>           kernel_entry = 0;
>>       }
>>
>> -    fdt_load_addr = riscv_compute_fdt_addr(memmap[SPIKE_DRAM].base,
>> -                                           machine->ram_size, machine->fdt);
>> +    fdt_load_addr = riscv_compute_fdt_addr(machine,
>> +                                           memmap[SPIKE_DRAM].base);
>>       riscv_load_fdt(fdt_load_addr, machine->fdt);
>>
>>       /* load the reset vector */
>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>> index 839dfaa125..cbba0b8930 100644
>> --- a/hw/riscv/virt.c
>> +++ b/hw/riscv/virt.c
>> @@ -1307,8 +1307,7 @@ static void virt_machine_done(Notifier *notifier, void *data)
>>           start_addr = virt_memmap[VIRT_FLASH].base;
>>       }
>>
>> -    fdt_load_addr = riscv_compute_fdt_addr(memmap[VIRT_DRAM].base,
>> -                                           machine->ram_size, machine->fdt);
>> +    fdt_load_addr = riscv_compute_fdt_addr(machine, memmap[VIRT_DRAM].base);
>>       riscv_load_fdt(fdt_load_addr, machine->fdt);
>>
>>       /* load the reset vector */
>> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
>> index 9aea7b9c46..f933de88fb 100644
>> --- a/include/hw/riscv/boot.h
>> +++ b/include/hw/riscv/boot.h
>> @@ -47,7 +47,7 @@ target_ulong riscv_load_kernel(MachineState *machine,
>>                                  target_ulong firmware_end_addr,
>>                                  symbol_fn_t sym_cb);
>>   void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
>> -uint32_t riscv_compute_fdt_addr(hwaddr dram_start, uint64_t dram_size, void *fdt);
>> +uint32_t riscv_compute_fdt_addr(MachineState *machine, hwaddr dram_start);
>>   void riscv_load_fdt(uint32_t fdt_addr, void *fdt);
>>   void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
>>                                  hwaddr saddr,
>> --
>> 2.39.0
>>
>>


