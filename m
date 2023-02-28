Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWzrr-0001Xj-Sc
	for mharc-qemu-riscv@gnu.org; Tue, 28 Feb 2023 08:18:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pWzrj-0001Wk-L6
 for qemu-riscv@nongnu.org; Tue, 28 Feb 2023 08:18:01 -0500
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pWzrh-0002yN-13
 for qemu-riscv@nongnu.org; Tue, 28 Feb 2023 08:17:59 -0500
Received: by mail-oo1-xc29.google.com with SMTP id
 e12-20020a4ae0cc000000b00525034ca5e9so1547470oot.0
 for <qemu-riscv@nongnu.org>; Tue, 28 Feb 2023 05:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1677590275;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UjsIysRuG2FdTzIjcw0Pzp1D2ixWNVXPLkmwPaUxcP8=;
 b=V5DOGB3YSqZ+1391freZXe2nz13/sjMFWB3th0K4YHX6kOyLVy21pDp6C38no42q3w
 YtCPNYEOxRo9AOJzAWl0TGwKOQWiBrInXDx2BrhFMjlvipoFersNRZwdZRyOULka3S5z
 ChLMg4gX3gqpwdE/Md6fw+cidMMHQYzc+uX1zorrxGSG2yzpBm6IlYkFa8kw9EhjkUjW
 hLjL4slo04eaBwPnes0NZwZa6IvhXIlYMXEvifltwCKB3595o+CEb/hKhOsfFXU7OzQ/
 g4j3Rc0wNPsQWDo5rleRPzd3rociwxdyEhfZ238zxpQ7FZQELJ3Os8UeOiWeiSjuneur
 9K/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677590275;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UjsIysRuG2FdTzIjcw0Pzp1D2ixWNVXPLkmwPaUxcP8=;
 b=nWSTpGeVezpZlmfC/Vki4qCv3A8q4t2eqEJNAeYIM1rYIrkBDLk7L/vi8Wykz9q5AA
 dsXT5ZnRJrwUDxWiuXCChyYvpQf38ijPiwXQyy51O7PakxmziftnYXYVQhmoRwzjR1AF
 PXyrJMXts+nI5FMp21eI6zAXAfSsGY1HPpdGQz6Miyz1cRWNscDMWXtulzZrwP/Oam2x
 fNUJxix5E6sQAjSjkIejPDBOOql4DJKNrDWNZ/ENwZl9Nd5pAZ3MTFeR1H81jUmdTS9k
 T5sXZQNputqEfnHdu/Mw9k/oUfzmT1iiDtOw94JoDtEkkNzYZXj9x+U2t0/+ryhfRO5I
 tYZQ==
X-Gm-Message-State: AO0yUKVkc9cx5SQSHt75In++U/zEB5NTMT5/wJeEcZUnu2DCU0ubv8c8
 7nia/us9GadNYFTXGZr9ENUr4A==
X-Google-Smtp-Source: AK7set/LwRmbNXWT3ru6RLkzp3lvFnDI3kMh7tTev0X78xDgrkrB+h9TRvR47fG1zBT7V3Cns3FbVQ==
X-Received: by 2002:a4a:6b13:0:b0:525:c83:2f94 with SMTP id
 g19-20020a4a6b13000000b005250c832f94mr951506ooc.4.1677590275295; 
 Tue, 28 Feb 2023 05:17:55 -0800 (PST)
Received: from [192.168.68.107] ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 d17-20020a4a9191000000b0051ff746e2b2sm3731396ooh.8.2023.02.28.05.17.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 05:17:54 -0800 (PST)
Message-ID: <d0fec7fb-5750-23c8-30c1-68810a3678bd@ventanamicro.com>
Date: Tue, 28 Feb 2023 10:17:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] hw/riscv: Fix the bug of maximum size limit when put
 initrd to RAM
Content-Language: en-US
To: Hang Xu <xuhang@eswincomputing.com>, qemu-riscv <qemu-riscv@nongnu.org>
Cc: "alistair.francis" <alistair.francis@wdc.com>, bmeng <bmeng@tinylab.org>, 
 philmd <philmd@linaro.org>
References: <20230227023916.7374-1-xuhang@eswincomputing.com>
 <9450e987-13ee-449a-0726-f99662372268@ventanamicro.com>
 <2023022811441450576813@eswincomputing.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <2023022811441450576813@eswincomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc29.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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
X-List-Received-Date: Tue, 28 Feb 2023 13:18:01 -0000



On 2/28/23 00:44, Hang Xu wrote:
> Hi,
> On 2023-02-27 21:29,  Daniel Henrique Barboza wrote:
>>
>> Hi,
>>
>> On 2/26/23 23:39, Hang Xu wrote:
>>> The space available for initrd is "ram_size + ram_base - start"
>>> instead of "ram_size - start"
>>>
>>> Signed-off-by: Hang Xu <xuhang@eswincomputing.com>
>>> ---
>>>     hw/riscv/boot.c            | 8 +++++---
>>>     hw/riscv/microchip_pfsoc.c | 2 +-
>>>     hw/riscv/sifive_u.c        | 2 +-
>>>     hw/riscv/spike.c           | 2 +-
>>>     hw/riscv/virt.c            | 2 +-
>>>     include/hw/riscv/boot.h    | 3 ++-
>>>     6 files changed, 11 insertions(+), 8 deletions(-)
>>
>> You'll need to rebase this patch with current master. riscv_load_initrd() is a static
>> function inside target/riscv/boot.c since 8b64475bd529, which landed upstream today.
>>
> 
> Thanks,I'll rebase this patch with the current master later.
> 
>> One more thing:
>>
>>>
>>> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
>>> index c7e0e50bd8..749dba5360 100644
>>> --- a/hw/riscv/boot.c
>>> +++ b/hw/riscv/boot.c
>>> @@ -209,7 +209,8 @@ target_ulong riscv_load_kernel(MachineState *machine,
>>>         exit(1);
>>>     }
>>>    
>>> -void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
>>> +void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry,
>>> +                       uint64_t mem_base)
>>>     {
>>>         const char *filename = machine->initrd_filename;
>>>         uint64_t mem_size = machine->ram_size;
>>> @@ -231,10 +232,11 @@ void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
>>>          * the initrd at 128MB.
>>>          */
>>>         start = kernel_entry + MIN(mem_size / 2, 128 * MiB);
>>> +    uint64_t max_size = mem_size + mem_base - start;
>>>    
>>> -    size = load_ramdisk(filename, start, mem_size - start);
>>> +    size = load_ramdisk(filename, start, max_size);
>>
>>
>> I don't understand this logic. If we want initrd to be loaded at 'start', and we have a
>> total amount of RAM of mem_size (since it's == machine->ram_size), then the initrd can't
>> really be bigger than mem_size - start.
>>
>> It would help if you can clarify a bit more on what's the initrd maximum size limit bug
>> you're seeing. There is a chance that the problem is with how we're calculating 'start'.
>>
>>
>> Thanks,
>>
>> Daniel
> 
> Yes, we can get the total size of ram, but the starting address of ram is not necessarily 0x0, so the maximum absolute address of ram is 'ram_base + ram_size',
> 'start' is an absolute address, not an offset in ram.
> Therefore, the remaining size in ram is "ram_base + ram_size - start".
> For example:
> RAM starting address: ram_base=0x40000000,RAM size: ram_size=0x20000000,then the range address of ram is 0x40000000~0x60000000
> initrd start position: start=0x5000000,
> Then according to the previous calculation method, the remaining available size of ram (also the maximum size of initrd): max_size=ram_size - ram_base = -0x20000000,  which is wrong.


Yeah, that makes sense. mem_size - start is giving a bogus result because 'start'
is not an offset of the RAM block in which initrd would be inserted.

However there's still one problem here. We're assuming that (mem_size - start) is
contiguous RAM. It is not. The PolarFire SOC board has two RAM blocks that are
separated with a gap and mem_size is the sum of the two regions. We had some
FDT changes based on that (see commit 4b402886ac89732f9,  "hw/riscv: change
riscv_compute_fdt_addr() semantics").

Note that this patch doesn't take that into account either.

> Maybe everyone used to set ram_size to a large value when starting qemu, so the error did not come out.

That's probably what is happening.

There are a few alternatives here. I see boards from other archs using a
theoretical/architectural max initrd size limit here, not an actual value that
can vary with the board memmap and kernel size. E.g. x86 defaults max initrd
size to UINT32_MAX.

If we want to fix what we already have then I suggest to go to a similar route
that riscv_compute_fdt_addr() is doing. We would need not just dram_base, but
also dram_size. And 'dram_size' in that case would be the amount of contiguous
RAM we have in the MemMapEntry.

Assuming we have dram_base and dram_size, and the caveat of dram_size == 0 meaning
that the block goes to the end of RAM (see riscv_compute_fdt_addr()), this patch
would become something like:

     start = kernel_entry + MIN(mem_size / 2, 128 * MiB);

     max_initrd = dram_size - (dram_base - start);

     size = load_ramdisk(filename, start, max_initrd);



Thanks,


Daniel


> In fact, the remaining available size of ram (also the maximum size of initrd): max_size = ram_base + ram_size - start=0x10000000
> 
> Thanks,
> Hang Xu
>>
>>
>>
>>
>>>         if (size == -1) {
>>> -        size = load_image_targphys(filename, start, mem_size - start);
>>> +        size = load_image_targphys(filename, start, max_size);
>>>             if (size == -1) {
>>>                 error_report("could not load ramdisk '%s'", filename);
>>>                 exit(1);
>>> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
>>> index 2b91e49561..965d155fd3 100644
>>> --- a/hw/riscv/microchip_pfsoc.c
>>> +++ b/hw/riscv/microchip_pfsoc.c
>>> @@ -632,7 +632,7 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
>>>             kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
>>>    
>>>             if (machine->initrd_filename) {
>>> -            riscv_load_initrd(machine, kernel_entry);
>>> +            riscv_load_initrd(machine, kernel_entry, memmap[MICROCHIP_PFSOC_DRAM_LO].base);
>>>             }
>>>    
>>>             if (machine->kernel_cmdline && *machine->kernel_cmdline) {
>>> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
>>> index d3ab7a9cda..aa5d5bc610 100644
>>> --- a/hw/riscv/sifive_u.c
>>> +++ b/hw/riscv/sifive_u.c
>>> @@ -601,7 +601,7 @@ static void sifive_u_machine_init(MachineState *machine)
>>>             kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
>>>    
>>>             if (machine->initrd_filename) {
>>> -            riscv_load_initrd(machine, kernel_entry);
>>> +            riscv_load_initrd(machine, kernel_entry, memmap[SIFIVE_U_DEV_DRAM].base);
>>>             }
>>>    
>>>             if (machine->kernel_cmdline && *machine->kernel_cmdline) {
>>> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
>>> index cc3f6dac17..729f6f91fd 100644
>>> --- a/hw/riscv/spike.c
>>> +++ b/hw/riscv/spike.c
>>> @@ -309,7 +309,7 @@ static void spike_board_init(MachineState *machine)
>>>                                              htif_symbol_callback);
>>>    
>>>             if (machine->initrd_filename) {
>>> -            riscv_load_initrd(machine, kernel_entry);
>>> +            riscv_load_initrd(machine, kernel_entry, memmap[SPIKE_DRAM].base);
>>>             }
>>>    
>>>             if (machine->kernel_cmdline && *machine->kernel_cmdline) {
>>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>>> index b81081c70b..2342de646e 100644
>>> --- a/hw/riscv/virt.c
>>> +++ b/hw/riscv/virt.c
>>> @@ -1280,7 +1280,7 @@ static void virt_machine_done(Notifier *notifier, void *data)
>>>             kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
>>>    
>>>             if (machine->initrd_filename) {
>>> -            riscv_load_initrd(machine, kernel_entry);
>>> +            riscv_load_initrd(machine, kernel_entry, memmap[VIRT_DRAM].base);
>>>             }
>>>    
>>>             if (machine->kernel_cmdline && *machine->kernel_cmdline) {
>>> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
>>> index 511390f60e..14db53ef13 100644
>>> --- a/include/hw/riscv/boot.h
>>> +++ b/include/hw/riscv/boot.h
>>> @@ -46,7 +46,8 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
>>>     target_ulong riscv_load_kernel(MachineState *machine,
>>>                                    target_ulong firmware_end_addr,
>>>                                    symbol_fn_t sym_cb);
>>> -void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
>>> +void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry,
>>> +                       uint64_t mem_base);
>>>     uint64_t riscv_compute_fdt_addr(hwaddr dram_start, uint64_t dram_size,
>>>                                     MachineState *ms);
>>>     void riscv_load_fdt(hwaddr fdt_addr, void *fdt);

