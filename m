Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHOrx-0001H3-1V
	for mharc-qemu-riscv@gnu.org; Mon, 16 Jan 2023 07:45:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pHOrp-0001Fj-8e
 for qemu-riscv@nongnu.org; Mon, 16 Jan 2023 07:45:40 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pHOrm-0006RN-Tp
 for qemu-riscv@nongnu.org; Mon, 16 Jan 2023 07:45:36 -0500
Received: by mail-ot1-x343.google.com with SMTP id
 cc13-20020a05683061cd00b00684b8cf2f4dso7833882otb.12
 for <qemu-riscv@nongnu.org>; Mon, 16 Jan 2023 04:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KE91TYLWyiD6yHTxNJUq3DQXstHHwUD4q0xYP1meHdg=;
 b=VEF6BYhK2oFREsQdleTy8M20XUjOjXeOcjzLVQxVhhGQJNV9bAoYivQJT/XS4aGphV
 qDNhcx4RLODT9VMIZpeHniLg0GZ2IIMPspKUhSW6yughvzJfN/1GSJh5Mky0cxTTr2/Z
 fsNxKYwC9O8qJRkhPXVO+W1y8rsuR9e6tgggyxx8GQCiK7QHsaa2nhmR8h0dRlz8+VVl
 +kSyKRKDLGTLNr4Un1h7ct8KAXBTlK07xvDRmclPdBwax923wetNjoPk0obQMpPGZ6GZ
 Vb8YGo5Cwk/U9mLA/MB7Rr510NDsUOp3d3UozjrpqTF6VwKxItK7rD3ZXSWi5IojsyBl
 8sLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KE91TYLWyiD6yHTxNJUq3DQXstHHwUD4q0xYP1meHdg=;
 b=Mjum5qYVzm9109LLAyEtGp3GNc8lPkKo8+x3NSULyo4MJcpOL3WWPiBdE5EZkazFn/
 VcZIv3LSbdo9Ply8V+lOKmi1DoItSdfFWeow9YNm14/jRHaIhIo+t3fNkmsBQT5yQ/yc
 C0enED7LwehN1w4AHlDfxcQQDvuXHcaNjCp6G9MlL8RrlBvefvILnB+tO7TQhSWHmb2m
 DM3M1i7lTZK+DGgl2rZBcSSeE/DYUpF+P/a8hcq76bNWB6s66aYFg9PARI/Kyg/oMP80
 zbOIgdaltjTsgO5begC4MWaNBasf2fDT7MHTywfrrr11uJPs77euoLMxmXhDMdWOWCK5
 siIQ==
X-Gm-Message-State: AFqh2koGF8UAjoQPi7Kh2wRYiGok9SsjJYt0Ut/Zxzp1dehBYxXbbOnz
 DIf7LFVoMj3QmXPVe1bo0rUEJg==
X-Google-Smtp-Source: AMrXdXsrXOt+XqOgfqVA9kishfCc3Hl3sO7FadaC4VzCfyDw2IFTSrRVkL616JfxuCaOju95Km0ozQ==
X-Received: by 2002:a05:6830:6502:b0:66e:316b:a603 with SMTP id
 cm2-20020a056830650200b0066e316ba603mr53941500otb.3.1673873133091; 
 Mon, 16 Jan 2023 04:45:33 -0800 (PST)
Received: from [192.168.68.107] ([191.17.222.2])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a0568302a1200b0066f7e1188f0sm14573779otu.68.2023.01.16.04.45.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 04:45:32 -0800 (PST)
Message-ID: <61fd483d-5d3a-587b-5c98-4b81afe21d7d@ventanamicro.com>
Date: Mon, 16 Jan 2023 09:45:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v8 3/3] hw/riscv: clear kernel_entry higher bits in
 load_elf_ram_sym()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bmeng.cn@gmail.com>
References: <20230116122948.757515-1-dbarboza@ventanamicro.com>
 <20230116122948.757515-4-dbarboza@ventanamicro.com>
 <a4b7fd13-4bd0-0e7a-4650-7164e1a76053@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <a4b7fd13-4bd0-0e7a-4650-7164e1a76053@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x343.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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
X-List-Received-Date: Mon, 16 Jan 2023 12:45:41 -0000



On 1/16/23 09:37, Philippe Mathieu-Daudé wrote:
> On 16/1/23 13:29, Daniel Henrique Barboza wrote:
>> Recent hw/risc/boot.c changes caused a regression in an use case with
>> the Xvisor hypervisor. Running a 32 bit QEMU guest with '-kernel'
>> stopped working. The reason seems to be that Xvisor is using 64 bit to
>> encode the 32 bit addresses from the guest, and load_elf_ram_sym() is
>> sign-extending the result with '1's [1].
>>
>> Use a translate_fn() callback to be called by load_elf_ram_sym() and
>> return only the 32 bits address if we're running a 32 bit CPU.
>>
>> [1] https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02281.html
>>
>> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Suggested-by: Bin Meng <bmeng.cn@gmail.com>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   hw/riscv/boot.c            | 20 +++++++++++++++++++-
>>   hw/riscv/microchip_pfsoc.c |  4 ++--
>>   hw/riscv/opentitan.c       |  3 ++-
>>   hw/riscv/sifive_e.c        |  3 ++-
>>   hw/riscv/sifive_u.c        |  4 ++--
>>   hw/riscv/spike.c           |  2 +-
>>   hw/riscv/virt.c            |  4 ++--
>>   include/hw/riscv/boot.h    |  1 +
>>   target/riscv/cpu_bits.h    |  1 +
>>   9 files changed, 32 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
>> index e868fb6ade..0fd39df7f3 100644
>> --- a/hw/riscv/boot.c
>> +++ b/hw/riscv/boot.c
>> @@ -213,7 +213,24 @@ static void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
>>       }
>>   }
>>   +static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
>> +{
>> +    RISCVHartArrayState *harts = opaque;
>> +
>> +    /*
>> +     * For 32 bit CPUs, kernel_load_base is sign-extended (i.e.
>> +     * it can be padded with '1's) if the hypervisor is using
>> +     * 64 bit addresses with 32 bit guests.
>> +     */
>> +    if (riscv_is_32bit(harts)) {
>
> Maybe move the comment within the if() and add " so remove the sign
> extension by truncating to 32-bit".
>
>> +        return extract64(addr, 0, RV32_KERNEL_ADDR_LEN);
>
> For 32-bit maybe a definition is not necessary, I asked before
> you used 24-bit in the previous version. As the maintainer prefer :)

That was unintentional. I missed a 'f' in that 0x0fffffff, which I noticed only
now when doing this version. It's curious because Alistair mentioned that
the patch apparently solved the bug ....

I don't mind creating a macro for the 32 bit value. If we decide it's unneeded
I can remove it and just put a '32' there. I'll also make the comment change
you mentioned above.


Thanks,


Daniel

>
>> +    }
>> +
>> +    return addr;
>> +}
>
>> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
>> index 8b0d7e20ea..8fcaeae342 100644
>> --- a/target/riscv/cpu_bits.h
>> +++ b/target/riscv/cpu_bits.h
>> @@ -751,6 +751,7 @@ typedef enum RISCVException {
>>   #define MENVCFG_STCE                       (1ULL << 63)
>>     /* For RV32 */
>> +#define RV32_KERNEL_ADDR_LEN               32
>>   #define MENVCFGH_PBMTE                     BIT(30)
>>   #define MENVCFGH_STCE                      BIT(31)
>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>
>


