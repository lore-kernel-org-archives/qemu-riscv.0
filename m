Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAW3d-0002Pc-Da
	for mharc-qemu-riscv@gnu.org; Wed, 28 Dec 2022 08:01:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAW3V-0002IA-9Q
 for qemu-riscv@nongnu.org; Wed, 28 Dec 2022 08:01:19 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAW3T-0000Ng-5X
 for qemu-riscv@nongnu.org; Wed, 28 Dec 2022 08:01:12 -0500
Received: by mail-oi1-x22b.google.com with SMTP id r11so14735408oie.13
 for <qemu-riscv@nongnu.org>; Wed, 28 Dec 2022 05:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZjJWlXtJHpNx3YNNZKnrWRBasnCjNTwqg7PYC+4Zxkg=;
 b=BkE2Pfe/cXlCt3u7O6+DgYg/rQHg18ordBzQmFZjLgDqOEW0vSTgNUb8mvvmwK6oY4
 OhoNSdl4aLVK+bAOI75qPwgWt2jhRKdSJkTZ3koB3PRP2VM2+lhpLqv91qOPVyBp2dLb
 VCLV9+sWXrdos+P87GH7oEtCt7MJG93vV9UlZDFhe6EYZH5vGFEHvbjSNmVOSW1Dpe0X
 RUBexFkWRXStgGYkugbT7C+HLyUWODmqgJxA8LPZnpk2asPVGXdKQsAxQ6lLmsYPQcd5
 UX186IY35UTUBRWYAgIvDofAYaFlouu8HOs+FPO0kJmlvmaKBv/jazoC5Xzz4pGeLr1c
 xXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZjJWlXtJHpNx3YNNZKnrWRBasnCjNTwqg7PYC+4Zxkg=;
 b=xA1EdzqZoB8PzrkpEm639kNOinM7wQ3lK3OUn5aQmX++iTbNc2AjG0LeS/fl0gaey5
 zymYZ3yGvOuv12xqA0WWK/+OIlzPD5K7OhT7j8+fzrP2z3VdBydL2tnhf1kUnhPwUA0S
 WciFotsV2c5W78KA7+B8cZqEsU7iKohzI7CSdqUlUpjo/nXQTS5ujMQcRzSq2XPFdhZJ
 +UZ9aRgmNRzXW0JrBNozmtw01Ju9Zj4HwQC0C3u4y5sFcWZK/3D3vuN+Qza9Am0SGgFN
 YsXQ3JYRVPsRoWP5JrS7wlPdRw7fSkH1iZ3KusVKWexce7ssogfv++kGi3V31y8USH69
 t+2w==
X-Gm-Message-State: AFqh2kqH3eaE0AZMLmyqMV34hTs+XK4LS4w9fIUF67DFUW4dwLHHwbD6
 4NfMtwygdlmGUboK57koI8B/sw==
X-Google-Smtp-Source: AMrXdXu35/CXko3lyajBU/6lP7Wn3Mcsup9vQFGkZSWkbBrWzaiP+QJ5qJDJTlEPkzJQA6ZhcJccLA==
X-Received: by 2002:a05:6808:17a6:b0:361:1112:2e3a with SMTP id
 bg38-20020a05680817a600b0036111122e3amr15687930oib.17.1672232469706; 
 Wed, 28 Dec 2022 05:01:09 -0800 (PST)
Received: from [192.168.68.107] ([191.17.222.139])
 by smtp.gmail.com with ESMTPSA id
 125-20020aca0683000000b003547a3401e6sm6911103oig.43.2022.12.28.05.01.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 05:01:09 -0800 (PST)
Message-ID: <a07b8af4-123b-4e47-da51-c86b3cbe5054@ventanamicro.com>
Date: Wed, 28 Dec 2022 10:01:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 09/10] hw/riscv/boot.c: consolidate all kernel init in
 riscv_load_kernel()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bmeng@tinylab.org>
References: <20221228124242.184784-1-dbarboza@ventanamicro.com>
 <20221228124242.184784-10-dbarboza@ventanamicro.com>
 <77a6f2da-e56e-a099-e0a1-6a99c4a9f7c9@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <77a6f2da-e56e-a099-e0a1-6a99c4a9f7c9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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
X-List-Received-Date: Wed, 28 Dec 2022 13:01:20 -0000



On 12/28/22 09:56, Philippe Mathieu-Daudé wrote:
> On 28/12/22 13:42, Daniel Henrique Barboza wrote:
>> The microchip_icicle_kit, sifive_u, spike and virt boards are now doing
>> the same steps when '-kernel' is used:
>>
>> - execute load_kernel()
>> - load init_rd()
>> - write kernel_cmdline
>>
>> Let's fold everything inside riscv_load_kernel() to avoid code
>> repetition. Every other board that uses riscv_load_kernel() will have
>> this same behavior, including boards that doesn't have a valid FDT, so
>> we need to take care to not do FDT operations without checking it first.
>>
>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> Reviewed-by: Bin Meng <bmeng@tinylab.org>
>> ---
>>   hw/riscv/boot.c            | 21 ++++++++++++++++++---
>>   hw/riscv/microchip_pfsoc.c |  9 ---------
>>   hw/riscv/sifive_u.c        |  9 ---------
>>   hw/riscv/spike.c           |  9 ---------
>>   hw/riscv/virt.c            |  9 ---------
>>   5 files changed, 18 insertions(+), 39 deletions(-)
>>
>> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
>> index cd9c989edb..95f780a228 100644
>> --- a/hw/riscv/boot.c
>> +++ b/hw/riscv/boot.c
>> @@ -177,6 +177,7 @@ target_ulong riscv_load_kernel(MachineState *machine,
>>   {
>>       const char *kernel_filename = machine->kernel_filename;
>>       uint64_t kernel_load_base, kernel_entry;
>> +    void *fdt = machine->fdt;
>>         /*
>>        * NB: Use low address not ELF entry point to ensure that the fw_dynamic
>> @@ -188,21 +189,35 @@ target_ulong riscv_load_kernel(MachineState *machine,
>>       if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
>>                            NULL, &kernel_load_base, NULL, NULL, 0,
>>                            EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
>> -        return kernel_load_base;
>> +        kernel_entry = kernel_load_base;
>> +        goto out;
>>       }
>>         if (load_uimage_as(kernel_filename, &kernel_entry, NULL, NULL,
>>                          NULL, NULL, NULL) > 0) {
>> -        return kernel_entry;
>> +        goto out;
>>       }
>>         if (load_image_targphys_as(kernel_filename, kernel_start_addr,
>>                                  current_machine->ram_size, NULL) > 0) {
>> -        return kernel_start_addr;
>> +        kernel_entry = kernel_start_addr;
>> +        goto out;
>>       }
>>         error_report("could not load kernel '%s'", kernel_filename);
>>       exit(1);
>> +
>> +out:
>> +    if (machine->initrd_filename) {
>> +        riscv_load_initrd(machine, kernel_entry);
>> +    }
>> +
>> +    if (fdt && machine->kernel_cmdline && *machine->kernel_cmdline) {
>> +        qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
>> +                                machine->kernel_cmdline);
>> +    }
>> +
>> +    return kernel_entry;
>>   }
>
> Worth renaming as riscv_load_kernel_and_initrd()?

Hmmm, not a bad idea.  I'll re-send.


Daniel



