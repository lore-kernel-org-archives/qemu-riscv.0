Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMYUS-00072S-LX
	for mharc-qemu-riscv@gnu.org; Mon, 30 Jan 2023 13:02:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pMYUQ-0006z5-C9
 for qemu-riscv@nongnu.org; Mon, 30 Jan 2023 13:02:46 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pMYUN-0007OU-OD
 for qemu-riscv@nongnu.org; Mon, 30 Jan 2023 13:02:46 -0500
Received: by mail-oi1-x231.google.com with SMTP id bx13so4963152oib.13
 for <qemu-riscv@nongnu.org>; Mon, 30 Jan 2023 10:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XkU+dxTizISrH4C9HBXyrdCMr37p46Jb8WbJwKo35ZQ=;
 b=ZEWaNyVxAFcjMRW4ibDXC3SjsYqcX2RAuKIkEWaVtlDJ/27oVDXWkrlobuGmTkUgX1
 yylCL96n4GeOECaXbsGguUPqMPmkw7aNhYJos0OfdGDYQCYuDIQDAdlfqomd+M99zVgC
 pWiARJi82iBKvATKwW6tQQMsLTPAUtxmMhDkoSoV1kYhz7P6rYaqV+waexMUpOzSQnNC
 45ZkXQ0egUqQlsdcn6GHrE5yVa6625HR/WZPM8fI7cXLVQadN5ift5WWzqvjO1aPvTII
 MlANHo57KkLMTsqJGZbsg9VJdoEaFFO/Im+4nAmYq1tJOxeNEvSW8+lOO7rUTuczENQV
 vx9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XkU+dxTizISrH4C9HBXyrdCMr37p46Jb8WbJwKo35ZQ=;
 b=KaNRmZEUca05/rElSAaezUuJWVE2D1McVrcbtOJ5vdg0CoMTq3V/LqAPB7RBzQjHN/
 34AxDMjZ00gEwO7ZqlKFeaxyDe4qrfmddKO2BpE3l3xx5/4/zaFjkgk2yeRxOCw7o0/k
 V5ArgBci6Xy6pzIBiC17K39EG6SPiXcgTFcwpO33E+lzD2EWIJgsmNKuoQr5yHscZi/+
 UzETh6FsEnovqeRyhDPK2m02AArSbwrVpmdW9CU2jvCWH5v9ikiwcOYSYEa1YUK5Zgul
 KnLKuPgFs5OHk03/zUPAd+OWydouQ5rCCYhGB3eLg6Zk4wrDJo6SvkEdfmuWpbea3OXB
 tKVA==
X-Gm-Message-State: AO0yUKVliHRXLFro8fvK2t9za/d8PaorxampEMA7QX6xCmEtyVdgTakJ
 v9d0iwIFdEJSJtum0BzXBOcUTA==
X-Google-Smtp-Source: AK7set9QtexFpqOnOUyjEGGjkXDgeMu4oy8vqU79kqsV9xv1GmnrQyzpNY9QK6y694hH/Dx9HxAkTw==
X-Received: by 2002:aca:bec5:0:b0:378:7b4:93f5 with SMTP id
 o188-20020acabec5000000b0037807b493f5mr3388204oif.55.1675101761598; 
 Mon, 30 Jan 2023 10:02:41 -0800 (PST)
Received: from [192.168.68.107] (200-148-13-157.dsl.telesp.net.br.
 [200.148.13.157]) by smtp.gmail.com with ESMTPSA id
 n4-20020a9d4d04000000b0068bcd200247sm2104611otf.75.2023.01.30.10.02.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 10:02:41 -0800 (PST)
Message-ID: <1a58ebfd-1ce8-2d2f-9e20-9d6d7c297185@ventanamicro.com>
Date: Mon, 30 Jan 2023 15:02:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 3/3] hw/riscv: change riscv_compute_fdt_addr() semantics
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
References: <20230126135219.1054658-1-dbarboza@ventanamicro.com>
 <20230126135219.1054658-4-dbarboza@ventanamicro.com>
 <CAEUhbmW7Yh_7UOjeoPKBhSF1P4axp6kggtSEj9BAty1q6Ed4QA@mail.gmail.com>
 <793f7432-4592-98a4-34e9-472c185be297@ventanamicro.com>
In-Reply-To: <793f7432-4592-98a4-34e9-472c185be297@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-List-Received-Date: Mon, 30 Jan 2023 18:02:46 -0000



On 1/30/23 14:16, Daniel Henrique Barboza wrote:
> 
> 
> On 1/29/23 02:45, Bin Meng wrote:
>> On Thu, Jan 26, 2023 at 9:54 PM Daniel Henrique Barboza
>> <dbarboza@ventanamicro.com> wrote:
>>>
>>> As it is now, riscv_compute_fdt_addr() is receiving a dram_base, a
>>> mem_size (which is defaulted to MachineState::ram_size in all boards)
>>> and the FDT pointer. And it makes a very important assumption: the DRAM
>>> interval dram_base + mem_size is contiguous. This is indeed the case for
>>> most boards that uses a FDT.
>>
>> s/uses/use
>>
>>>
>>> The Icicle Kit board works with 2 distinct RAM banks that are separated
>>> by a gap. We have a lower bank with 1GiB size, a gap follows, then at
>>> 64GiB the high memory starts. MachineClass::default_ram_size for this
>>> board is set to 1.5Gb, and machine_init() is enforcing it as minimal RAM
>>> size, meaning that there we'll always have at least 512 MiB in the Hi
>>> RAM area.
>>>
>>> Using riscv_compute_fdt_addr() in this board is weird because not only
>>> the board has sparse RAM, and it's calling it using the base address of
>>> the Lo RAM area, but it's also using a mem_size that we have guarantees
>>> that it will go up to the Hi RAM. All the function assumptions doesn't
>>> work for this board.
>>>
>>> In fact, what makes the function works at all in this case is a
>>> coincidence.  Commit 1a475d39ef54 introduced a 3GB boundary for the FDT,
>>> down from 4Gb, that is enforced if dram_base is lower than 3072 MiB. For
>>> the Icicle Kit board, memmap[MICROCHIP_PFSOC_DRAM_LO].base is 0x80000000
>>> (2 Gb) and it has a 1Gb size, so it will fall in the conditions to put
>>> the FDT under a 3Gb address, which happens to be exactly at the end of
>>> DRAM_LO. If the base address of the Lo area started later than 3Gb this
>>> function would be unusable by the board. Changing any assumptions inside
>>> riscv_compute_fdt_addr() can also break it by accident as well.
>>>
>>> Let's change riscv_compute_fdt_addr() semantics to be appropriate to the
>>> Icicle Kit board and for future boards that might have sparse RAM
>>> topologies to worry about:
>>>
>>> - relieve the condition that the dram_base + mem_size area is contiguous,
>>> since this is already not the case today;
>>>
>>> - receive an extra 'dram_size' size attribute that refers to a contiguous
>>> RAM block that the board wants the FDT to reside on.
>>>
>>> Together with 'mem_size' and 'fdt', which are now now being consumed by a
>>> MachineState pointer, we're able to make clear assumptions based on the
>>> DRAM block and total mem_size available to ensure that the FDT will be put
>>> in a valid RAM address.
>>>
>>
>> Well written commit message. Thanks!
>>
>>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>> ---
>>>   hw/riscv/boot.c            | 38 ++++++++++++++++++++++++++------------
>>>   hw/riscv/microchip_pfsoc.c |  3 ++-
>>>   hw/riscv/sifive_u.c        |  3 ++-
>>>   hw/riscv/spike.c           |  3 ++-
>>>   hw/riscv/virt.c            |  3 ++-
>>>   include/hw/riscv/boot.h    |  4 ++--
>>>   6 files changed, 36 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
>>> index a6f7b8ae8e..8f4991480b 100644
>>> --- a/hw/riscv/boot.c
>>> +++ b/hw/riscv/boot.c
>>> @@ -284,33 +284,47 @@ out:
>>>   }
>>>
>>>   /*
>>> - * The FDT should be put at the farthest point possible to
>>> - * avoid overwriting it with the kernel/initrd.
>>> + * This function makes an assumption that the DRAM interval
>>> + * 'dram_base' + 'dram_size' is contiguous.
>>>    *
>>> - * This function makes an assumption that the DRAM is
>>> - * contiguous. It also cares about 32-bit systems and
>>> - * will limit fdt_addr to be addressable by them even for
>>> - * 64-bit CPUs.
>>> + * Considering that 'dram_end' is the lowest value between
>>> + * the end of the DRAM block and MachineState->ram_size, the
>>> + * FDT location will vary according to 'dram_base':
>>> + *
>>> + * - if 'dram_base' is less that 3072 MiB, the FDT will be
>>> + * put at the lowest value between 3072 MiB and 'dram_end';
>>> + *
>>> + * - if 'dram_base' is higher than 3072 MiB, the FDT will be
>>> + * put at 'dram_end'.
>>>    *
>>>    * The FDT is fdt_packed() during the calculation.
>>>    */
>>> -uint32_t riscv_compute_fdt_addr(hwaddr dram_base, uint64_t mem_size,
>>> -                                void *fdt)
>>> +hwaddr riscv_compute_fdt_addr(hwaddr dram_base, hwaddr dram_size,
>>
>> Using hwaddr to represent a size looks weird. Although technically
>> they are the same ... I would leave this as it is.
> 
> I'll leave it as it was back in patch 2 (uint64_t).
> 
>>
>>> +                              MachineState *ms)
>>>   {
>>> -    uint64_t temp;
>>> -    hwaddr dram_end = dram_base + mem_size;
>>> -    int ret = fdt_pack(fdt);
>>> +    int ret = fdt_pack(ms->fdt);
>>> +    hwaddr dram_end, temp;
>>>       int fdtsize;
>>>
>>>       /* Should only fail if we've built a corrupted tree */
>>>       g_assert(ret == 0);
>>>
>>> -    fdtsize = fdt_totalsize(fdt);
>>> +    fdtsize = fdt_totalsize(ms->fdt);
>>>       if (fdtsize <= 0) {
>>>           error_report("invalid device-tree");
>>>           exit(1);
>>>       }
>>>
>>> +    /*
>>> +     * A dram_size == 0, usually from a MemMapEntry[].size element,
>>> +     * means that the DRAM block goes all the way to ms->ram_size.
>>> +     */
>>> +    if (dram_size == 0x0) {
>>> +        dram_end = dram_base + ms->ram_size;
>>> +    } else {
>>> +        dram_end = dram_base + MIN(ms->ram_size, dram_size);
>>> +    }
>>
>> How about:
>>
>> g_assert(dram_size < ms->ram_size);
> 
> I don't believe that dram_size > ms->ram_size should be an error. A board can
> have a declared MemMapEntry.size that is larger than its current setting of
> ms->ram_size.
> 
> 
>> dram_end = dram_base + (dram_size ? dram_size : ms->ram_size);
> 
> I can change the if/else statement up there for a ternary:
> 
> dram_end = dram_base + (dram_size ? ms->ram_size : MIN(ms->ram_size, dram_size))

This is an ooopsie. This ternary is doing the opposite of what it should do :/

I would do something like this, breaking in two lines to avoid 80+ chars in the
same line:

     dram_end = dram_base;
     dram_end += dram_size ? MIN(ms->ram_size, dram_size) : ms->ram_size;


Daniel

> 
> 
> Thanks,
> 
> Daniel
> 
>>
>>> +
>>>       /*
>>>        * We should put fdt as far as possible to avoid kernel/initrd overwriting
>>>        * its content. But it should be addressable by 32 bit system as well.
>>> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
>>> index a30203db85..e81bbd12df 100644
>>> --- a/hw/riscv/microchip_pfsoc.c
>>> +++ b/hw/riscv/microchip_pfsoc.c
>>> @@ -634,7 +634,8 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
>>>
>>>           /* Compute the fdt load address in dram */
>>>           fdt_load_addr = riscv_compute_fdt_addr(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
>>> -                                               machine->ram_size, machine->fdt);
>>> +                                               memmap[MICROCHIP_PFSOC_DRAM_LO].size,
>>> +                                               machine);
>>>           riscv_load_fdt(fdt_load_addr, machine->fdt);
>>>
>>>           /* Load the reset vector */
>>> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
>>> index 6bbdbe5fb7..ad3bb35b34 100644
>>> --- a/hw/riscv/sifive_u.c
>>> +++ b/hw/riscv/sifive_u.c
>>> @@ -609,7 +609,8 @@ static void sifive_u_machine_init(MachineState *machine)
>>>       }
>>>
>>>       fdt_load_addr = riscv_compute_fdt_addr(memmap[SIFIVE_U_DEV_DRAM].base,
>>> -                                           machine->ram_size, machine->fdt);
>>> +                                           memmap[SIFIVE_U_DEV_DRAM].size,
>>> +                                           machine);
>>>       riscv_load_fdt(fdt_load_addr, machine->fdt);
>>>
>>>       if (!riscv_is_32bit(&s->soc.u_cpus)) {
>>> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
>>> index ceebe34c5f..b5979eddd6 100644
>>> --- a/hw/riscv/spike.c
>>> +++ b/hw/riscv/spike.c
>>> @@ -317,7 +317,8 @@ static void spike_board_init(MachineState *machine)
>>>       }
>>>
>>>       fdt_load_addr = riscv_compute_fdt_addr(memmap[SPIKE_DRAM].base,
>>> -                                           machine->ram_size, machine->fdt);
>>> +                                           memmap[SPIKE_DRAM].size,
>>> +                                           machine);
>>>       riscv_load_fdt(fdt_load_addr, machine->fdt);
>>>
>>>       /* load the reset vector */
>>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>>> index 43fca597f0..f079a30b60 100644
>>> --- a/hw/riscv/virt.c
>>> +++ b/hw/riscv/virt.c
>>> @@ -1293,7 +1293,8 @@ static void virt_machine_done(Notifier *notifier, void *data)
>>>       }
>>>
>>>       fdt_load_addr = riscv_compute_fdt_addr(memmap[VIRT_DRAM].base,
>>> -                                           machine->ram_size, machine->fdt);
>>> +                                           memmap[VIRT_DRAM].size,
>>> +                                           machine);
>>>       riscv_load_fdt(fdt_load_addr, machine->fdt);
>>>
>>>       /* load the reset vector */
>>> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
>>> index 7babd669c7..a6099c2dc6 100644
>>> --- a/include/hw/riscv/boot.h
>>> +++ b/include/hw/riscv/boot.h
>>> @@ -48,8 +48,8 @@ target_ulong riscv_load_kernel(MachineState *machine,
>>>                                  target_ulong firmware_end_addr,
>>>                                  bool load_initrd,
>>>                                  symbol_fn_t sym_cb);
>>> -uint32_t riscv_compute_fdt_addr(hwaddr dram_start, uint64_t dram_size,
>>> -                                void *fdt);
>>> +hwaddr riscv_compute_fdt_addr(hwaddr dram_start, uint64_t dram_size,
>>> +                              MachineState *ms);
>>>   void riscv_load_fdt(hwaddr fdt_addr, void *fdt);
>>>   void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
>>>                                  hwaddr saddr,
>>> -- 
>>
>> Regards,
>> Bin

