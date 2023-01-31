Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMnOn-00046K-FS
	for mharc-qemu-riscv@gnu.org; Tue, 31 Jan 2023 04:57:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pMnOm-000464-FZ
 for qemu-riscv@nongnu.org; Tue, 31 Jan 2023 04:57:56 -0500
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pMnOk-00063M-Fy
 for qemu-riscv@nongnu.org; Tue, 31 Jan 2023 04:57:56 -0500
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1442977d77dso18647422fac.6
 for <qemu-riscv@nongnu.org>; Tue, 31 Jan 2023 01:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R5nNvif22PuzEtW9abRjbKLXYdjwEqDLqCnAyeHU/Ro=;
 b=RJhjgdRen14n+J2VvpUhX2DfnxCrJCv1LGucYBWdX80Gv+dMQBQYOuvBKGQhqDgGh4
 Na91ifuvUJvuh7gv1NoIIsdBEBHtUIE34hDqRdjahVV9iGYm9ZL1773LcoCHi0QcGQSi
 iJdThpEFvURYWueTcSTy52Hf5isiRdUR8BADwQcMdBPWUxo1pCTKel/4g1FvUPS+dzmL
 v7ChBtZHgbeaK5X0m/m+lLlOPntVdOjl/OqN4SVv86GLFraaiwUjxvJRwkRUWHUKAV4U
 TzJLUDbB8tnSdUyaqtiV1YWVOFj7+fgFoKAT5tfmjkcyCjxVkibDBL9vbjJHrwnxLlTX
 t18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R5nNvif22PuzEtW9abRjbKLXYdjwEqDLqCnAyeHU/Ro=;
 b=bCVYHuinEpJxIHPwK6F11YG7n6DwHNxw08ODiAxFzpqsCDV9ODMMeZ4jGs0qABLYTu
 7sFEMcN02EXzzpMTkope33WzXD9REMk/Wpv97NAPVJ5uLK+1OQq7EwDyOzqjX4X/6Zz3
 uBbBJCO+W/HlRhjvg4xm+PQHNII3xmzE96s1BOLBUM2b+eYT98uSuE7ZOcMFVLKiZTHD
 zRmg2U1HrU9brGbBjbdpJu6t/z1oCoQjsTY5QyuSsThNbUTgh8glSS9VwC3qrIIoM9b4
 Akk0hfQceU+h84qPcKlxK1HzSd23Fl2WjWNY/oksWzb9cVTdDCIwEo1zE6fNHxdRAUtb
 dmkg==
X-Gm-Message-State: AO0yUKW8w4IVE/fAa64GB35SOOXIpwxZykWM+IfuN/tD20dQlQSW0OH5
 Ei5RcPhx94K44bAGwqA51RrB6A==
X-Google-Smtp-Source: AK7set+o88VvbNstBY2Q6qjES7QJyGKiKr6to/fnIxhYo+2c9aWe8/MCLzRBpeyyXuZnIbKbW4tKjA==
X-Received: by 2002:a05:6870:d10f:b0:161:eec2:6b5 with SMTP id
 e15-20020a056870d10f00b00161eec206b5mr16200309oac.49.1675159071907; 
 Tue, 31 Jan 2023 01:57:51 -0800 (PST)
Received: from [192.168.68.107] (200-148-13-157.dsl.telesp.net.br.
 [200.148.13.157]) by smtp.gmail.com with ESMTPSA id
 k14-20020a056870350e00b0014813cc4a51sm5019723oah.29.2023.01.31.01.57.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 01:57:51 -0800 (PST)
Message-ID: <0be7a185-b023-31d4-d51e-a7dff59980ee@ventanamicro.com>
Date: Tue, 31 Jan 2023 06:57:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 3/3] hw/riscv: change riscv_compute_fdt_addr() semantics
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
References: <20230126135219.1054658-1-dbarboza@ventanamicro.com>
 <20230126135219.1054658-4-dbarboza@ventanamicro.com>
 <CAEUhbmW7Yh_7UOjeoPKBhSF1P4axp6kggtSEj9BAty1q6Ed4QA@mail.gmail.com>
 <793f7432-4592-98a4-34e9-472c185be297@ventanamicro.com>
 <CAEUhbmXiNS2cLcdvMLaZ4SUh-0=D7j-dsM+2TuQvF=0EO4xbdQ@mail.gmail.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAEUhbmXiNS2cLcdvMLaZ4SUh-0=D7j-dsM+2TuQvF=0EO4xbdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2b.google.com
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
X-List-Received-Date: Tue, 31 Jan 2023 09:57:56 -0000



On 1/30/23 22:00, Bin Meng wrote:
> On Tue, Jan 31, 2023 at 1:16 AM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>>
>>
>>
>> On 1/29/23 02:45, Bin Meng wrote:
>>> On Thu, Jan 26, 2023 at 9:54 PM Daniel Henrique Barboza
>>> <dbarboza@ventanamicro.com> wrote:
>>>>
>>>> As it is now, riscv_compute_fdt_addr() is receiving a dram_base, a
>>>> mem_size (which is defaulted to MachineState::ram_size in all boards)
>>>> and the FDT pointer. And it makes a very important assumption: the DRAM
>>>> interval dram_base + mem_size is contiguous. This is indeed the case for
>>>> most boards that uses a FDT.
>>>
>>> s/uses/use
>>>
>>>>
>>>> The Icicle Kit board works with 2 distinct RAM banks that are separated
>>>> by a gap. We have a lower bank with 1GiB size, a gap follows, then at
>>>> 64GiB the high memory starts. MachineClass::default_ram_size for this
>>>> board is set to 1.5Gb, and machine_init() is enforcing it as minimal RAM
>>>> size, meaning that there we'll always have at least 512 MiB in the Hi
>>>> RAM area.
>>>>
>>>> Using riscv_compute_fdt_addr() in this board is weird because not only
>>>> the board has sparse RAM, and it's calling it using the base address of
>>>> the Lo RAM area, but it's also using a mem_size that we have guarantees
>>>> that it will go up to the Hi RAM. All the function assumptions doesn't
>>>> work for this board.
>>>>
>>>> In fact, what makes the function works at all in this case is a
>>>> coincidence.  Commit 1a475d39ef54 introduced a 3GB boundary for the FDT,
>>>> down from 4Gb, that is enforced if dram_base is lower than 3072 MiB. For
>>>> the Icicle Kit board, memmap[MICROCHIP_PFSOC_DRAM_LO].base is 0x80000000
>>>> (2 Gb) and it has a 1Gb size, so it will fall in the conditions to put
>>>> the FDT under a 3Gb address, which happens to be exactly at the end of
>>>> DRAM_LO. If the base address of the Lo area started later than 3Gb this
>>>> function would be unusable by the board. Changing any assumptions inside
>>>> riscv_compute_fdt_addr() can also break it by accident as well.
>>>>
>>>> Let's change riscv_compute_fdt_addr() semantics to be appropriate to the
>>>> Icicle Kit board and for future boards that might have sparse RAM
>>>> topologies to worry about:
>>>>
>>>> - relieve the condition that the dram_base + mem_size area is contiguous,
>>>> since this is already not the case today;
>>>>
>>>> - receive an extra 'dram_size' size attribute that refers to a contiguous
>>>> RAM block that the board wants the FDT to reside on.
>>>>
>>>> Together with 'mem_size' and 'fdt', which are now now being consumed by a
>>>> MachineState pointer, we're able to make clear assumptions based on the
>>>> DRAM block and total mem_size available to ensure that the FDT will be put
>>>> in a valid RAM address.
>>>>
>>>
>>> Well written commit message. Thanks!
>>>
>>>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>>> ---
>>>>    hw/riscv/boot.c            | 38 ++++++++++++++++++++++++++------------
>>>>    hw/riscv/microchip_pfsoc.c |  3 ++-
>>>>    hw/riscv/sifive_u.c        |  3 ++-
>>>>    hw/riscv/spike.c           |  3 ++-
>>>>    hw/riscv/virt.c            |  3 ++-
>>>>    include/hw/riscv/boot.h    |  4 ++--
>>>>    6 files changed, 36 insertions(+), 18 deletions(-)
>>>>
>>>> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
>>>> index a6f7b8ae8e..8f4991480b 100644
>>>> --- a/hw/riscv/boot.c
>>>> +++ b/hw/riscv/boot.c
>>>> @@ -284,33 +284,47 @@ out:
>>>>    }
>>>>
>>>>    /*
>>>> - * The FDT should be put at the farthest point possible to
>>>> - * avoid overwriting it with the kernel/initrd.
>>>> + * This function makes an assumption that the DRAM interval
>>>> + * 'dram_base' + 'dram_size' is contiguous.
>>>>     *
>>>> - * This function makes an assumption that the DRAM is
>>>> - * contiguous. It also cares about 32-bit systems and
>>>> - * will limit fdt_addr to be addressable by them even for
>>>> - * 64-bit CPUs.
>>>> + * Considering that 'dram_end' is the lowest value between
>>>> + * the end of the DRAM block and MachineState->ram_size, the
>>>> + * FDT location will vary according to 'dram_base':
>>>> + *
>>>> + * - if 'dram_base' is less that 3072 MiB, the FDT will be
>>>> + * put at the lowest value between 3072 MiB and 'dram_end';
>>>> + *
>>>> + * - if 'dram_base' is higher than 3072 MiB, the FDT will be
>>>> + * put at 'dram_end'.
>>>>     *
>>>>     * The FDT is fdt_packed() during the calculation.
>>>>     */
>>>> -uint32_t riscv_compute_fdt_addr(hwaddr dram_base, uint64_t mem_size,
>>>> -                                void *fdt)
>>>> +hwaddr riscv_compute_fdt_addr(hwaddr dram_base, hwaddr dram_size,
>>>
>>> Using hwaddr to represent a size looks weird. Although technically
>>> they are the same ... I would leave this as it is.
>>
>> I'll leave it as it was back in patch 2 (uint64_t).
>>
>>>
>>>> +                              MachineState *ms)
>>>>    {
>>>> -    uint64_t temp;
>>>> -    hwaddr dram_end = dram_base + mem_size;
>>>> -    int ret = fdt_pack(fdt);
>>>> +    int ret = fdt_pack(ms->fdt);
>>>> +    hwaddr dram_end, temp;
>>>>        int fdtsize;
>>>>
>>>>        /* Should only fail if we've built a corrupted tree */
>>>>        g_assert(ret == 0);
>>>>
>>>> -    fdtsize = fdt_totalsize(fdt);
>>>> +    fdtsize = fdt_totalsize(ms->fdt);
>>>>        if (fdtsize <= 0) {
>>>>            error_report("invalid device-tree");
>>>>            exit(1);
>>>>        }
>>>>
>>>> +    /*
>>>> +     * A dram_size == 0, usually from a MemMapEntry[].size element,
>>>> +     * means that the DRAM block goes all the way to ms->ram_size.
>>>> +     */
>>>> +    if (dram_size == 0x0) {
>>>> +        dram_end = dram_base + ms->ram_size;
>>>> +    } else {
>>>> +        dram_end = dram_base + MIN(ms->ram_size, dram_size);
>>>> +    }
>>>
>>> How about:
>>>
>>> g_assert(dram_size < ms->ram_size);
>>
>> I don't believe that dram_size > ms->ram_size should be an error. A board can
>> have a declared MemMapEntry.size that is larger than its current setting of
>> ms->ram_size.
> 
> What use case is that? This updated function now has the assumption that:
> 
> 1. dram_size being 0 meaning contiguous system RAM region from dram_base
> 2. otherwise dram_size being the *first* contiguous system RAM region
> from dram_base

Yes, but that doesn't mean that dram_size is necessarily smaller than ms->ram_size.

We don't have any board where this happens today but let's pretend that the Icicle
Kit board didn't have the 1.5Gb minimal RAM restriction. Its first region has
dram_size 1Gb:

[MICROCHIP_PFSOC_DRAM_LO] =         { 0x80000000,   0x40000000 },

So, if I start the board with 512M, ms->ram_size = 512M and this assert will trigger
because dram_size = 1Gb.


Thanks,


Daniel


> 
> We can use g_assert(dram_size < ms->ram_size) to catch either case.
> 
>>
>>
>>> dram_end = dram_base + (dram_size ? dram_size : ms->ram_size);
>>
>> I can change the if/else statement up there for a ternary:
>>
>> dram_end = dram_base + (dram_size ? ms->ram_size : MIN(ms->ram_size, dram_size))
>>
> 
> Regards,
> Bin

