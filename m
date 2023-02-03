Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pO3AW-0003L9-Aa
	for mharc-qemu-riscv@gnu.org; Fri, 03 Feb 2023 16:00:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pO3AT-0003HZ-NY
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 16:00:21 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pO3AR-0002Jx-Fd
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 16:00:21 -0500
Received: by mail-ot1-x344.google.com with SMTP id
 k91-20020a9d19e4000000b0068bca1294aaso1746975otk.8
 for <qemu-riscv@nongnu.org>; Fri, 03 Feb 2023 13:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aWnD9tdCHRdV+yAeg4nQ1LbB9djqmstLbrP9dGNEO0M=;
 b=PBHEqQpkr4uxLyPSDnd4odlX1hqT0XY6htB0SoxJpTCTqmKYYmBoBQWn0Cnu7Ocb/e
 uPinKUJ9oT3lL3R0h5VlquJ1vmRp1v1TPOtsnqw4jWCKz87s2NCh0oHWbQ7sIzcIImiN
 uT3/qACK3yQ2Rw2CUflzC6LWgkWtmGfEpbWD21exudWGgnDYSP/KZEiybKOG91qrQLBk
 j1kABzQmBuraJprFiD7p0mgm+SZ6Ebf+SbfbM/IGZguxGBy6giTRu8QbNLmYUQYXhhbR
 KLIAYb3cABeqTdMX8XYFBQFVYcwYkJZD9z2NY8QOQSm6+bV9FeGpFzMRdi3EYlOS1vcM
 v6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aWnD9tdCHRdV+yAeg4nQ1LbB9djqmstLbrP9dGNEO0M=;
 b=LmFFmWl478j0IJTqYOksqZ8ES/XLCsxirRVXKdfX4Ab+3edA9HV0BvnTI/0SA5fhLl
 EGSAS8ZXfe77whb2TTR38RhxXSS8j6nSVfYrcnuMjjOd/3bT9Cfxq4cyS5lHunxmjGMA
 2SD8UyzZUZ16mPSz5Xeu32uLqTvl8T+YpG9JvxYdengjIui8Isdm1LoiIPCEx82KllX3
 6CLjsn0yzBivP3eg43jhUNaqmCfe0LAOjNAZ6Bq9WDc+JJVorhIApiS8lyd6tBXyV3P6
 7pFsYh0m7TbmcbBqOOEY5f83NiCEtHwICeL3LRLDLcKrW28QSYfhZN6C/6S3+1cXOGto
 RDDg==
X-Gm-Message-State: AO0yUKWBTmG2af9L489b4ybV5KtSHG94bSeIoO2B2CPYeApP7SwvZi76
 iMfDeroRJSaZL+fPpzMebnE63g==
X-Google-Smtp-Source: AK7set9ODg7e2U+v3mAHAsrOcS+ymiD4WREpTMRH31h5SQhMSPb9dwNrY2lyJxm4jD2xRfBPEbxPXA==
X-Received: by 2002:a9d:4783:0:b0:68b:e2cd:9362 with SMTP id
 b3-20020a9d4783000000b0068be2cd9362mr6046027otf.33.1675458016903; 
 Fri, 03 Feb 2023 13:00:16 -0800 (PST)
Received: from [192.168.68.107] ([177.102.69.207])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a056830135000b0068bc476d777sm1590297otq.13.2023.02.03.13.00.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 13:00:16 -0800 (PST)
Message-ID: <e7d32c5f-a996-2d50-9362-3223c546d136@ventanamicro.com>
Date: Fri, 3 Feb 2023 18:00:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v10 1/3] hw/riscv: handle 32 bit CPUs kernel_addr in
 riscv_load_kernel()
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
References: <20230202135810.1657792-1-dbarboza@ventanamicro.com>
 <20230202135810.1657792-2-dbarboza@ventanamicro.com>
 <CAEUhbmW01vUZNdAcXQ0b-7GUgH70q9eyWJH7kG+Mph4uJJeWnA@mail.gmail.com>
 <51896f68-d902-ee07-295d-5809c9c66e60@ventanamicro.com>
 <CAEUhbmVN3Pw8794tq2H3X5amexhptnrZaLdG0MHyON6fyac-AA@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAEUhbmVN3Pw8794tq2H3X5amexhptnrZaLdG0MHyON6fyac-AA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x344.google.com
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
X-List-Received-Date: Fri, 03 Feb 2023 21:00:22 -0000

Hey,

On 2/3/23 07:45, Bin Meng wrote:
> Hi Daniel,
> 
> On Fri, Feb 3, 2023 at 6:31 PM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>>
>>
>>
>> On 2/3/23 02:39, Bin Meng wrote:
>>> On Thu, Feb 2, 2023 at 9:58 PM Daniel Henrique Barboza
>>> <dbarboza@ventanamicro.com> wrote:
>>>>
>>>> load_elf_ram_sym() will sign-extend 32 bit addresses. If a 32 bit QEMU
>>>> guest happens to be running in a hypervisor that are using 64 bits to
>>>> encode its address, kernel_entry can be padded with '1's and create
>>>> problems [1].
>>>
>>> Still this commit message is inaccurate. It's not
>>>
>>> "a 32-bit QEMU guest happens to running in a hypervisor that are using
>>> 64 bits to encode tis address"
>>>
>>> as a 32-bit ELF can only hold a 32-bit address, but it's the QEMU ELF
>>> loader that does the sign extension and returns the address as
>>> uint64_t. It has nothing to do with hypervisor too.
>>
>>
>> Yeah I'm still focusing too much on the use case instead of the root of the
>> problem (sign-extension from QEMU elf).
>>
>>>
>>>>
>>>> Using a translate_fn() callback in load_elf_ram_sym() to filter the
>>>> padding from the address doesn't work. A more detailed explanation can
>>>> be found in [2]. The short version is that glue(load_elf, SZ), from
>>>> include/hw/elf_ops.h, will calculate 'pentry' (mapped into the
>>>> 'kernel_load_base' var in riscv_load_Kernel()) before using
>>>> translate_fn(), and will not recalculate it after executing it. This
>>>> means that the callback does not prevent the padding from
>>>> kernel_load_base to appear.
>>>>
>>>> Let's instead use a kernel_low var to capture the 'lowaddr' value from
>>>> load_elf_ram_sim(), and return it when we're dealing with 32 bit CPUs.
>>>
>>> Looking at the prototype of load_elf_ram_sym() it has
>>>
>>> ssize_t load_elf_ram_sym(const char *filename,
>>>                            uint64_t (*elf_note_fn)(void *, void *, bool),
>>>                            uint64_t (*translate_fn)(void *, uint64_t),
>>>                            void *translate_opaque, uint64_t *pentry,
>>>                            uint64_t *lowaddr, uint64_t *highaddr,
>>>                            uint32_t *pflags, int big_endian, int elf_machine,
>>>                            int clear_lsb, int data_swab,
>>>                            AddressSpace *as, bool load_rom, symbol_fn_t sym_cb)
>>>
>>> So kernel_low is the "highaddr" parameter, not the 'lowaddr' value.
>>
>> And for some reason I thought kernel_base_addr was being used as 'pentry'. kernel_base_addr
>> is already 'lowaddr'. Guess I'll have to rewrite the commit message. And revisit why my
>> test case worked for riscv32 (I probably didn't use an ELF image ...)
>>
>> And the only way out seems to be filtering the bits from lowaddr. I'll do that.
>>
> 
> Can you check as to why QEMU ELF loader does the sign extension?
> 
> I personally don't know why. Maybe the ELF loader does something wrong.


I took a look and didn't find out why. I checked that in the ELF specification some
file headers can indicate a sign extension. E.g. R_X86_64_32S for example is described as
"Direct 32 bit zero extended". Note that the use of the tags are dependent on how the
ELF was built, so we would need the exact ELF to check for that. All I can say is that
there is a sign extension going on, in the 'lowaddr' field, and that translate_fn()
wasn't enough to filter it out. I can't say whether this is intended or a bug.


But going back a little, this whole situation happened in v5 because, in the next
patch, riscv_load_initrd() started to receive an uint64_t (kernel_entry) instead of
receiving a target_ulong like it was doing before. This behavior change, which was
accidental, not only revealed this sign-extension behavior but also potentially changed
what riscv_load_initrd() is receiving from load_uimage_as() the same way it's
impacting load_elf_ram_sym(). The third load option, load_image_targphys_as(), is
already using a target_ulong (kernel_start_addr) as return value so it's not
impacted.

I believe Alistair suggested to clear bits instead of just doing a target_ulong
cast for a reason (I guess we're trying to gate all 32/64 bit CPU logic using a
direct approach such as checking the CPU directly), but I also think we should
clear bits for all 'kernel_entry' possibilities, not just the one that comes from
load_elf_ram_sym(), to be consistent in all three cases. We might be even avoiding
a future headache from load_uimage_as().



Thoughts?


Daniel


[1] https://github.com/riscv-non-isa/riscv-elf-psabi-doc/blob/master/riscv-elf.adoc

> 
> Regards,
> Bin

