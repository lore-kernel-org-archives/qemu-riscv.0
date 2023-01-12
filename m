Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFxZT-000155-AK
	for mharc-qemu-riscv@gnu.org; Thu, 12 Jan 2023 08:24:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFxZQ-000141-Ij
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 08:24:41 -0500
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFxZO-0005Mb-Jm
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 08:24:39 -0500
Received: by mail-ot1-x32e.google.com with SMTP id
 y18-20020a0568301d9200b0067082cd4679so10556392oti.4
 for <qemu-riscv@nongnu.org>; Thu, 12 Jan 2023 05:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kgjfwn94DZluSXJskmTBBKz+fkftoBzh7Oxy72vvBwc=;
 b=FB6bY/qHvbJAOXuC1ejKiUnsvlMeGokzI6LhSQ11sTVv4zb5Vec5z/82A8X/DFITqr
 R2fCb31QplRSiWZFFr6FSvf5A+k7R92D5c7CBT7pML63rUjPBT/TvG39MLouN2A0GRc4
 vRc6SmhD3yTmTUYhNLyCoDuLui+zNTFuGzXvAFnswJy8SXQyPadv7Sw5tgAhZxMk5Qpg
 Yh7qdX1ka8EU34ronanfTp3y6CxXXvvY/BJ1ib3q2lTZ8vA9JO17lbZ3D5WKCAwkQTr6
 zdWrgiPrTdbe4RJCzPrCAPt3MX5PHWe5VBGAwCho2s32i1kLVl4wIGLuuFsLTyZexgtb
 oahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kgjfwn94DZluSXJskmTBBKz+fkftoBzh7Oxy72vvBwc=;
 b=fwWZw5eAqx94TrGSwBJeNNPKqcz9glikJaaJE7urod7hp36eODcI2mhvkSfrs4eHST
 og5S7USJ7b4cKt/4GdIcaYfkrFcHdOTm+V991APjgc7wgpJDF64F2aYfgNsmgJ7vxXhF
 UTQIvhTzNMLbPh8lIgPtOESmt1nTjFuUKISbGdkxFBcb5tip1tFaL4gqE4psD0/cpsMP
 usjFn7gOpIQf6/rzNQ5eawuWbWRTWAXnUElqWeI0QVr4SV66EsUbe6OMEcboX9WkhVgr
 o8N/oiKHDxjQVOWI++LdjSXccYs+x0OU0UxQ3f5vyN8UGw3lmq4/GVmnWbVYYt6LP24o
 YENg==
X-Gm-Message-State: AFqh2krRtJnCbsjberz8PzFgGjNn6V21NjtxFoVzvpiYLtqVvXP8SwqC
 i803AsM+PYdvSOwtZK0ZiuSlhg==
X-Google-Smtp-Source: AMrXdXv5PxpvpsUqteCSXlho94s+/hOgF4wxTtCGX/c/8kqXPjwkQCNrgNy9fwMF0GihztqGQwXQsg==
X-Received: by 2002:a9d:6d0e:0:b0:678:2963:3831 with SMTP id
 o14-20020a9d6d0e000000b0067829633831mr39166299otp.22.1673529877187; 
 Thu, 12 Jan 2023 05:24:37 -0800 (PST)
Received: from [192.168.68.107] ([191.17.222.2])
 by smtp.gmail.com with ESMTPSA id
 cg28-20020a056830631c00b006706247fdbfsm9269723otb.23.2023.01.12.05.24.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 05:24:36 -0800 (PST)
Message-ID: <07be21f4-ba88-1bdf-62c6-09adcf5dfecc@ventanamicro.com>
Date: Thu, 12 Jan 2023 10:24:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 10/11] hw/riscv/boot.c: consolidate all kernel init in
 riscv_load_kernel()
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20230102115241.25733-1-dbarboza@ventanamicro.com>
 <20230102115241.25733-11-dbarboza@ventanamicro.com>
 <CAKmqyKPri7asvqZ8wN4Bd-wjH+gwwMJJhiUd+=QZFV4RhWnyUQ@mail.gmail.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAKmqyKPri7asvqZ8wN4Bd-wjH+gwwMJJhiUd+=QZFV4RhWnyUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32e.google.com
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
X-List-Received-Date: Thu, 12 Jan 2023 13:24:41 -0000



On 1/11/23 21:34, Alistair Francis wrote:
> On Mon, Jan 2, 2023 at 9:55 PM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>> The microchip_icicle_kit, sifive_u, spike and virt boards are now doing
>> the same steps when '-kernel' is used:
>>
>> - execute load_kernel()
>> - load init_rd()
>> - write kernel_cmdline
>>
>> Let's fold everything inside riscv_load_kernel() to avoid code
>> repetition. To not change the behavior of boards that aren't calling
>> riscv_load_init(), add an 'load_initrd' flag to riscv_load_kernel() and
>> allow these boards to opt out from initrd loading.
>>
>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   hw/riscv/boot.c            | 22 +++++++++++++++++++---
>>   hw/riscv/microchip_pfsoc.c | 12 ++----------
>>   hw/riscv/opentitan.c       |  2 +-
>>   hw/riscv/sifive_e.c        |  3 ++-
>>   hw/riscv/sifive_u.c        | 12 ++----------
>>   hw/riscv/spike.c           | 11 +----------
>>   hw/riscv/virt.c            | 12 ++----------
>>   include/hw/riscv/boot.h    |  1 +
>>   8 files changed, 30 insertions(+), 45 deletions(-)
>>
>> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
>> index 2594276223..4888d5c1e0 100644
>> --- a/hw/riscv/boot.c
>> +++ b/hw/riscv/boot.c
>> @@ -175,10 +175,12 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
>>
>>   target_ulong riscv_load_kernel(MachineState *machine,
>>                                  target_ulong kernel_start_addr,
>> +                               bool load_initrd,
>>                                  symbol_fn_t sym_cb)
>>   {
>>       const char *kernel_filename = machine->kernel_filename;
>>       uint64_t kernel_load_base, kernel_entry;
>> +    void *fdt = machine->fdt;
>>
>>       g_assert(kernel_filename != NULL);
>>
>> @@ -192,21 +194,35 @@ target_ulong riscv_load_kernel(MachineState *machine,
>>       if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
>>                            NULL, &kernel_load_base, NULL, NULL, 0,
>>                            EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
>> -        return kernel_load_base;
>> +        kernel_entry = kernel_load_base;
> This breaks 32-bit Xvisor loading. It seems that for the 32-bit guest
> we get a value of 0xffffffff80000000.
>
> Previously the top bits would be lost as we return a target_ulong from
> this function, but with this change we pass the value
> 0xffffffff80000000 to riscv_load_initrd() which causes failures.
>
> This diff fixes the failure for me
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 4888d5c1e0..f08ed44b97 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -194,7 +194,7 @@ target_ulong riscv_load_kernel(MachineState *machine,
>      if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
>                           NULL, &kernel_load_base, NULL, NULL, 0,
>                           EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
> -        kernel_entry = kernel_load_base;
> +        kernel_entry = (target_ulong) kernel_load_base;
>          goto out;
>      }
>
>
> but I don't think that's the right fix. We should instead look at the
> CPU XLEN and drop the high bits if required.
>
> I'm going to drop this patch, do you mind looking into a proper fix?

Thanks for looking this up!

I 'll fix it and resend patches 10 and 11.

Daniel

>
> Alistair


