Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIHxC-00040A-MF
	for mharc-qemu-riscv@gnu.org; Wed, 18 Jan 2023 18:34:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIHxB-0003zi-6g
 for qemu-riscv@nongnu.org; Wed, 18 Jan 2023 18:34:49 -0500
Received: from mail-oa1-x41.google.com ([2001:4860:4864:20::41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIHx9-0001tQ-As
 for qemu-riscv@nongnu.org; Wed, 18 Jan 2023 18:34:48 -0500
Received: by mail-oa1-x41.google.com with SMTP id
 586e51a60fabf-15ebfdf69adso836568fac.0
 for <qemu-riscv@nongnu.org>; Wed, 18 Jan 2023 15:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wgNU1Xh+K8IsXuabeBLqgeZkgdUbC7XlpmEoFtDGWn4=;
 b=RI7hqWwZDegu/nz0LPNfCXKJ9tOvil5rOHKAAgSpGl35OKNIbdzUgHw7EFlRR/qGlc
 8yoO1MT0e7SqWoiokCA1tr3I6BvMtz9IJS4xK6k9GcYsvTbbW5y4ed1d/5CbTMK7zdt8
 KvYB+2EA2h+7wOtXqh8/E8IYx1EtdcIaRQqvZwCh/I3cNjbxn4evtLCSLuUMNYQo87kM
 045pqmH6w4rI0nFCzZKiMAGyyMnp/V41Ajow/pXAGIxBH1jQc0QLTPkp/rORYM3tQKeC
 y81W8hgWi67Kmw/8qMaemsXZ46RfiFLruxY3UcVKFaXQevwqL4hIFmkrY1lXlvrOtLms
 ADhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wgNU1Xh+K8IsXuabeBLqgeZkgdUbC7XlpmEoFtDGWn4=;
 b=OCHJxqTLt6hoEljh+AvhglJeo/smSV6lRmduh3YMVYV67pLHvPOGfum9s9570Mutmg
 t7nsArTXfJj4OwBu3m6D8JJ84+WyJuvvCyT8FVIcODdgPjjFzo5MdYvv0qsOEQXx8jhC
 91vYZxypOM0XgmVk8GYkoTTXb5uczDhq7fApby/5OSkPRunGq2GucLLdxJEXsZs7sksA
 3+f8UCLT7yC4wfeUg8dtMMX4m2Gwz7f8eYutd46Vp0N2grysmHkIGSNp8TSfpJ1eoojh
 KjcpykFA+sE893Z/94UJE98JKrWCOZkFnp0iK5DG4QZvyjjkbrZVH3Q0xq24TaNDVhC1
 NicQ==
X-Gm-Message-State: AFqh2kraPGizyhiEzfoGGLkcm8OhDmHIqsaQ2MJ8fRYqgnKgW8dFSbgx
 yPI7ibUUu9aUIWiZTxqsq6CeaA==
X-Google-Smtp-Source: AMrXdXunysWxJFJD6+40UImxvaXnGtVNYgV3mPUvYU6+sqLsvncgY2idzqLO+oSeUmlsgSuC420Ujg==
X-Received: by 2002:a05:6870:289a:b0:15e:9b5b:e2c9 with SMTP id
 gy26-20020a056870289a00b0015e9b5be2c9mr5229234oab.3.1674084885661; 
 Wed, 18 Jan 2023 15:34:45 -0800 (PST)
Received: from [192.168.68.107] ([191.17.222.2])
 by smtp.gmail.com with ESMTPSA id
 em33-20020a0568705ba100b0014fd7e7c3fesm18998356oab.27.2023.01.18.15.34.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 15:34:45 -0800 (PST)
Message-ID: <99e76807-83db-e7f8-4c44-cd9c1f15441a@ventanamicro.com>
Date: Wed, 18 Jan 2023 20:34:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v8 3/3] hw/riscv: clear kernel_entry higher bits in
 load_elf_ram_sym()
To: Alistair Francis <alistair23@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bmeng.cn@gmail.com>
References: <20230116122948.757515-1-dbarboza@ventanamicro.com>
 <20230116122948.757515-4-dbarboza@ventanamicro.com>
 <a4b7fd13-4bd0-0e7a-4650-7164e1a76053@linaro.org>
 <61fd483d-5d3a-587b-5c98-4b81afe21d7d@ventanamicro.com>
 <CAKmqyKMaG0x1qtKc_HBjfZyLmR==Tg3-DdzPgzDhm0utmrRMOA@mail.gmail.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAKmqyKMaG0x1qtKc_HBjfZyLmR==Tg3-DdzPgzDhm0utmrRMOA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::41;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x41.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
X-List-Received-Date: Wed, 18 Jan 2023 23:34:49 -0000



On 1/18/23 19:45, Alistair Francis wrote:
> On Mon, Jan 16, 2023 at 10:46 PM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>>
>>
>> On 1/16/23 09:37, Philippe Mathieu-Daudé wrote:
>>> On 16/1/23 13:29, Daniel Henrique Barboza wrote:
>>>> Recent hw/risc/boot.c changes caused a regression in an use case with
>>>> the Xvisor hypervisor. Running a 32 bit QEMU guest with '-kernel'
>>>> stopped working. The reason seems to be that Xvisor is using 64 bit to
>>>> encode the 32 bit addresses from the guest, and load_elf_ram_sym() is
>>>> sign-extending the result with '1's [1].
>>>>
>>>> Use a translate_fn() callback to be called by load_elf_ram_sym() and
>>>> return only the 32 bits address if we're running a 32 bit CPU.
>>>>
>>>> [1] https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02281.html
>>>>
>>>> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>> Suggested-by: Bin Meng <bmeng.cn@gmail.com>
>>>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>>> ---
>>>>    hw/riscv/boot.c            | 20 +++++++++++++++++++-
>>>>    hw/riscv/microchip_pfsoc.c |  4 ++--
>>>>    hw/riscv/opentitan.c       |  3 ++-
>>>>    hw/riscv/sifive_e.c        |  3 ++-
>>>>    hw/riscv/sifive_u.c        |  4 ++--
>>>>    hw/riscv/spike.c           |  2 +-
>>>>    hw/riscv/virt.c            |  4 ++--
>>>>    include/hw/riscv/boot.h    |  1 +
>>>>    target/riscv/cpu_bits.h    |  1 +
>>>>    9 files changed, 32 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
>>>> index e868fb6ade..0fd39df7f3 100644
>>>> --- a/hw/riscv/boot.c
>>>> +++ b/hw/riscv/boot.c
>>>> @@ -213,7 +213,24 @@ static void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
>>>>        }
>>>>    }
>>>>    +static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
>>>> +{
>>>> +    RISCVHartArrayState *harts = opaque;
>>>> +
>>>> +    /*
>>>> +     * For 32 bit CPUs, kernel_load_base is sign-extended (i.e.
>>>> +     * it can be padded with '1's) if the hypervisor is using
>>>> +     * 64 bit addresses with 32 bit guests.
>>>> +     */
>>>> +    if (riscv_is_32bit(harts)) {
>>> Maybe move the comment within the if() and add " so remove the sign
>>> extension by truncating to 32-bit".
>>>
>>>> +        return extract64(addr, 0, RV32_KERNEL_ADDR_LEN);
>>> For 32-bit maybe a definition is not necessary, I asked before
>>> you used 24-bit in the previous version. As the maintainer prefer :)
>> That was unintentional. I missed a 'f' in that 0x0fffffff, which I noticed only
>> now when doing this version. It's curious because Alistair mentioned that
>> the patch apparently solved the bug ....
> I never tested it, I'm not sure if this solves the problem or not.
>
> This patch needs to be merged *before* the initrd patch (patch 1 of
> this series) to avoid breaking users.

Makes sense. I'll change it in v9.

Daniel

>> I don't mind creating a macro for the 32 bit value. If we decide it's unneeded
>> I can remove it and just put a '32' there. I'll also make the comment change
>> you mentioned above.
> I think 32 if fine, I don't think we need a macro
>
> Alistair
>
>>
>> Thanks,
>>
>>
>> Daniel
>>
>>>> +    }
>>>> +
>>>> +    return addr;
>>>> +}
>>>> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
>>>> index 8b0d7e20ea..8fcaeae342 100644
>>>> --- a/target/riscv/cpu_bits.h
>>>> +++ b/target/riscv/cpu_bits.h
>>>> @@ -751,6 +751,7 @@ typedef enum RISCVException {
>>>>    #define MENVCFG_STCE                       (1ULL << 63)
>>>>      /* For RV32 */
>>>> +#define RV32_KERNEL_ADDR_LEN               32
>>>>    #define MENVCFGH_PBMTE                     BIT(30)
>>>>    #define MENVCFGH_STCE                      BIT(31)
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>
>>>
>>


