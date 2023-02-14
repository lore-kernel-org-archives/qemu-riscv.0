Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRqvl-0002zL-0V
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 03:44:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pRqvj-0002yx-Tt
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 03:44:51 -0500
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pRqvh-00057G-VI
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 03:44:51 -0500
Received: by mail-oo1-xc2c.google.com with SMTP id
 c29-20020a4ad21d000000b00517a55a78d4so1446522oos.12
 for <qemu-riscv@nongnu.org>; Tue, 14 Feb 2023 00:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iVc1ecMuozBOFvbS3AUpmK4yab0tL+Aq/hqOkEADYvY=;
 b=nnPI8LlaScPH8HmzAFDztbAhg8hphxjm81GKC6cqemqtoH/nSxlG3M8jWEYX4wX5IJ
 bjxye6Pl/JORzCr2vArG+hftEV6aIRPa2l4Vhto545Ja6RbO6MG+WhbEsPTD/U82LowV
 7S6fYvGctceLX1X8y8o1lDq/l/PSeTDgLiXruJCj9M/RNiuoA0OXGMO+Erwoaw3iJzJ8
 M2URgc8axLJvir3T7//rJB/xRQ6I6ZzEiMnfghXu2v908pkX6c61I3O2tW3y5RTTO8vn
 kqK/L5ElGXIBUSe4dZRdq9fS6RF5r43f5VZ7rDVEcik/dbgno4F+DU+hlnqPxT3nPO9p
 /OHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iVc1ecMuozBOFvbS3AUpmK4yab0tL+Aq/hqOkEADYvY=;
 b=4g/h3s/1fTGFOhbGiANOcgpakYPOQb0ncOjR9+GE5M+9uKji4mJT5wv7SgyWQSKZlN
 Ej2PAzQXWa1c5q4rpxzo4fJqgN7OlDSggwQ39UC54FfsBQ1Q1mcUUInsvRxh7egNmvMY
 4nIkYEITShaG6Xzzb75ctMDuB1k2mgaYjGKXiIumd554y1CtjYdk+HPONFLf0aydTNKg
 C3XN4khQRw9Sk9iJ54iEqvW3ZJctznHUBWbwmi2QHmlFzm8IUBMiHFYWpoXHmqz8dtjU
 Iv1OviqmzsArJz8mbOrqlZiHxRkcPdGUThxSg73TGmYtdNKgaOmPNizrf4CeU5G0B/8T
 S9vA==
X-Gm-Message-State: AO0yUKVmWJQpvl/AYFN5J7aZZMEqWcDvIlksye3/86mNLmO0u2iFW+gp
 KuP/IHJTqxTZntWDHfeGpRBlMQ==
X-Google-Smtp-Source: AK7set/n7ol0zwJB0ffKU22AgMW7Y0iDYZUIMqkVzeUf7yrIvGcZsFyEDla1iyVPiUitHOH51OZWyQ==
X-Received: by 2002:a4a:dc8d:0:b0:517:637a:2073 with SMTP id
 g13-20020a4adc8d000000b00517637a2073mr460888oou.3.1676364288562; 
 Tue, 14 Feb 2023 00:44:48 -0800 (PST)
Received: from [192.168.68.107] ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a4aa682000000b0051ac0f54447sm5602810oom.33.2023.02.14.00.44.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 00:44:48 -0800 (PST)
Message-ID: <b5c4fb24-7bd2-a853-4116-58af222bbcad@ventanamicro.com>
Date: Tue, 14 Feb 2023 05:44:44 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V2 04/10] hw/riscv/virt: virt-acpi-build.c: Add basic ACPI
 tables
Content-Language: en-US
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Atish Kumar Patra <atishp@rivosinc.com>
References: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
 <20230213144038.2547584-5-sunilvl@ventanamicro.com>
 <9e7edd02-aa8e-c146-d67c-aa255a8aa6e5@ventanamicro.com>
 <Y+sDYFI+ku5/S1+J@sunil-laptop>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <Y+sDYFI+ku5/S1+J@sunil-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2c.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
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
X-List-Received-Date: Tue, 14 Feb 2023 08:44:52 -0000



On 2/14/23 00:43, Sunil V L wrote:
> On Mon, Feb 13, 2023 at 03:48:04PM -0300, Daniel Henrique Barboza wrote:
>> Sunil,
>>
>> This patch is a bit confusing to me. You're using functions that doesn't exist
>> in the code base yet (build_madt and build_rhct) because they are introduced
>> in later patches. This also means that this patch is not being compiled tested,
>> because otherwise it would throw a compile error. And the build of the file only
>> happens after patch 8.
>>
> My intention was to add the caller also in the same patch where the
> function is added. I think I missed it when I split. Thanks!
> 
>> Now, there is no hard rule in QEMU that dictates that every patch must be compile
>> tested, but nevertheless this is a good rule to follow that makes our lives easier
>> when bisecting and cherry-pick individual patches.
>>
>> My suggestion for this patch is:
>>
>> - squash both patches 7 and 8 into this patch to allow the file to be built;
>>
> Sure.
> 
>> - remove the code that is referring to stuff that you haven't add yet:
>>
>> $ git diff
>> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
>> index 3c4da6c385..eb17029b64 100644
>> --- a/hw/riscv/virt-acpi-build.c
>> +++ b/hw/riscv/virt-acpi-build.c
>> @@ -156,12 +156,6 @@ virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
>>       acpi_add_table(table_offsets, tables_blob);
>>       build_fadt_rev6(tables_blob, tables->linker, s, dsdt);
>> -    acpi_add_table(table_offsets, tables_blob);
>> -    build_madt(tables_blob, tables->linker, s);
>> -
>> -    acpi_add_table(table_offsets, tables_blob);
>> -    build_rhct(tables_blob, tables->linker, s);
>> -
>>       /* XSDT is pointed to by RSDP */
>>       xsdt = tables_blob->len;
>>       build_xsdt(tables_blob, tables->linker, table_offsets, s->oem_id,
>>
>>
>> - in patch 5, add back the lines in virt_acpi_build() that uses build_madt();
>>
>> - in patch 6, add back the lines in virt_acpi_build() that uses build_rhct();
>>
>>
>> This will make this patch to be compiled and built right away without interfering with
>> the end result of the series.
>>
> Thanks!
>   
>>
>> One more suggestion:
>>
>>
>> On 2/13/23 11:40, Sunil V L wrote:
>>> Add few basic ACPI tables and DSDT with few devices in a
>>> new file virt-acpi-build.c.
>>>
>>> These are mostly leveraged from arm64.
>>
>> Quick rant that you've already heard: I don't really understand why there is so
>> much ACPI code duplication everywhere. I really don't. E.g. acpi_align_size() is
>> copied verbatim in hw/arm/virt-acpi-build.c, hw/i386/acpi-build.c and
>> hw/loongarch/acpi-build.c. I don't see why we can't have a common file in hw/acpi
>> with helpers and so on that every ACPI architecture can use, and then the
>> individual drivers for each arch can have its own magic sauce.
>>
> I completely agree that we better avoid duplication But I am bit
> hesitant in this case because,
> 1) Low level functions which help in creating the namespace/static
> tables are already common (ex: aml_append)
> 
> 2) Using these basic routines, individual platforms can create the
> namespace with appropriate devices and the methods.
> 
> ACPI name space is tightly coupled with a platform. While there may be
> common devices like processors, uart etc, there can be difference in the
> ACPI methods for each of those devices. For ex: CPU objects for one
> platform may support _LPI method. uart may support _DSD for one platform
> and other may use totally different UART. If we have to create common routines,
> we will have to decide on all parameters the common function would need for
> different platforms. Same concern with fw_cfg/virtio etc which look same
> now but in future one platform can add a new method for these devices.
> 
> IMHO, even though it looks like we have the same function in each architecture
> currently, this model allows us to have platforms with different devices with
> different methods/features. Creating common routines now would probably make
> them difficult to use in future.
> 
> acpi_align_size() is a simple wrapper. We don't need it if we directly
> use the common function.
> 
> Since I see insistence let me try moving few functions like fw_cfg (virtio, pci in
> future) to a common file in hw/acpi.

Nah. Doing that now will make this series rely on acks for every other ACPI arch to
push the RISC-V side.

Let's make this happen as is now to get ACPI in RISC-V working. We can think about
reducing overall ACPI duplication later. IMO it's enough for now to, mention in this
commit msg, which bits of the arm64 virt-acpi-build.c you changed for this RISC-V
version.


Thanks,

Daniel

>   
>> All this said, instead of mentioning "this is mostly leveraged from arm64", you
>> can make a brief summary of the changes you've done from the arm64 version. This
>> will help guide the review into focusing on the novel code you're adding and
>> ignore the copied bits.
>>
> Sure.
> 
> Thanks!
> Sunil

