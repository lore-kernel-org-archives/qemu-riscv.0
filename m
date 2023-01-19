Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIY5B-0005If-2X
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 11:48:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIY59-0005IE-2H
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 11:48:07 -0500
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIY57-0000Cj-4C
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 11:48:06 -0500
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-15f944494ccso3175742fac.8
 for <qemu-riscv@nongnu.org>; Thu, 19 Jan 2023 08:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7IjGwceFrorEQWODkaJ+qujMdCxUhiZTDcNwBtO4cCs=;
 b=liR+LRDsaEnd1dgpaffjlk0rFPNtRChunkKb9Ky95H+e71FLY/Gtw7PHSO3wqCoqXH
 ca2iytGtcI/F8ol2X1XbVggC0dACOowC2WLyD9aw6tpHFpjdbZlYyaRrFLmiEGwXrWpd
 JG5kTuOVwzuMgCuM2j0VohoJfhpYn18WSwCzoOgxnS//najb02hkHQnXLVPeGN9OyXf8
 CzLdUm/tgawmeSFMe/MRc3ZezV0USlCtj7Zx5Jrf2kE2WJsCwBUWCxbskBa4M3Hjz3M6
 kX3CgW9fkrVr4rUqBuciwWcVApz/NwQPnU4wwS/4sgg6+IH/BIOFZOt0wtOKTZLDgK5t
 Vbiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7IjGwceFrorEQWODkaJ+qujMdCxUhiZTDcNwBtO4cCs=;
 b=30NXR/ItX08iyIFKMC213Q6FNxGO7qxOB9fnKk7kzcau0eNbMuF7i2CLL+3ka4tyax
 clqPLQ8zI09WMZ+aA8KpHX+TOOM7WQoFGN6iaby7L7cvF1kGviDNhBIYu5GkSCDbiqyO
 O/Yc03SF97OURw+f/CnjVYXyCM1e1VEltGk1QuCqZ8RJ9Q1UxzN+4vBM4T3IUucwrsgJ
 FN1sYSO8lG0QyOYO1gZJ4tt5+E3GO4R+cma9EkuPWK03yzNWWjFuuYevPbQMyNYSK749
 WZ3tAQdlK0WRdROopembclosfUwbqBcIYDouNuuRGCBcKyqG9aj2ZcyNFmaAeeOGqeAf
 lGyA==
X-Gm-Message-State: AFqh2kq/l3XftBg3LA6coiEnNzITa/ox+SMl/Lh6Gzsn6yFpRLvkjs3W
 E7fwzsdhpmn3WYCZNuENj2XzDw==
X-Google-Smtp-Source: AMrXdXtcvxtakR5L5av+htXdmiRmxsBg5Q4zrG5FepI3esNrX0hNbbLSh1i74HRHMKWXRRI/I8tdPw==
X-Received: by 2002:a05:6871:42c9:b0:142:83f9:fa0 with SMTP id
 lt9-20020a05687142c900b0014283f90fa0mr6340206oab.11.1674146883028; 
 Thu, 19 Jan 2023 08:48:03 -0800 (PST)
Received: from [192.168.68.107] ([191.17.222.2])
 by smtp.gmail.com with ESMTPSA id
 bd13-20020a056870d78d00b0014fe4867dc7sm20114788oab.56.2023.01.19.08.48.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 08:48:02 -0800 (PST)
Message-ID: <253a083d-d31c-7c83-7d78-835d736c27a6@ventanamicro.com>
Date: Thu, 19 Jan 2023 13:47:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 3/6] hw/riscv: simplify riscv_compute_fdt_addr()
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 philmd@linaro.org
References: <20230116173420.1146808-1-dbarboza@ventanamicro.com>
 <20230116173420.1146808-4-dbarboza@ventanamicro.com>
 <CAKmqyKMBjVjxL=YCprrQe4Hy5DXy4riOi4zwExxWG+nW7hx_AQ@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAKmqyKMBjVjxL=YCprrQe4Hy5DXy4riOi4zwExxWG+nW7hx_AQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2d.google.com
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
X-List-Received-Date: Thu, 19 Jan 2023 16:48:07 -0000



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

Checking the code from microchip-icicle-kit I see that the minimal ram_size is
1.5Gb. In fact the machine would not allow anything less:

$ ./qemu-system-riscv64 -M microchip-icicle-kit -m 512M
qemu-system-riscv64: Invalid RAM size, should be bigger than 1.5 GiB

The reasoning is in its machine_class_init():

====
      * Map 513 MiB high memory, the mimimum required high memory size, because
      * HSS will do memory test against the high memory address range regardless
      * of physical memory installed.
====

This also means that this machine is putting the FDT in the wrong spot every time, since
1.5Gb is going to hit in the gap between the low and hi memory every time and the start
of the hi area is 64Gb away.


I believe this is yet another reason to create a specific helper to deal
with the FDT of this machine. I'll re-send with this change.


Daniel

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


