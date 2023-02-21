Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUUtd-0000CQ-Ps
	for mharc-qemu-riscv@gnu.org; Tue, 21 Feb 2023 10:49:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pUUtL-0008Ln-Js
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 10:49:20 -0500
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pUUtJ-00041F-Eb
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 10:49:19 -0500
Received: by mail-ot1-x329.google.com with SMTP id
 e18-20020a0568301e5200b00690e6abbf3fso1112509otj.13
 for <qemu-riscv@nongnu.org>; Tue, 21 Feb 2023 07:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8NjHTk6x2pNoAwsXR2czLGbBUh2XzSGwVxFZCFdad6M=;
 b=fIbsfcb+csTJwI9vwmBbjJK6nGQ/Zi3jlLLQjZbaMBwOBHIE1b1WD+Q9e5Ra5JuYgS
 ykBKY5aqw21GQdlYEVQGoU9CoZwNsoUtaiNlFTS1y/rnGMrIkfGYOiSuNvTOi4dg6v7o
 jGyX80xIDBcg+xhsaFRZKgzTHBpOpn9VSWpjc2G6EEjIENW37PnZU23GXIj0d9m46d6D
 T+OomouEGQq+fRYWLjcbABkTRyNMsxGx0luCMejlXlcTL4CkZTjtD6LyfZFJNnI56E9F
 dJXheBjF9rOUWY0n79bx3ZE6n/r9VDCnGKtilvoOTJ8QhOJ4XVuor8D+kclvkdS8MWND
 s5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8NjHTk6x2pNoAwsXR2czLGbBUh2XzSGwVxFZCFdad6M=;
 b=72UTTn7R+9Qr9jl3o7rwcluHt4rYsBQ/M6uMWTx0BhgmrY+LEIz7MN51cupVyv0l4U
 l8pYkAS4zVnG2PWyqnymWK4pux+61i9Uc9QHOckGGfrsPm+mbrtP+WPyIPxDa4uiwkSq
 J467Dp8VVrcl7gbQEO3I/LOi8s4jlZiWmTj288QZYn0Mh6tmKhKm/9AE7QTGwI//ddF7
 bqISIs+eQfK3kz6mhDt3ECrcu8DqStwEW4xTV4ytY0eORFwK0731ujteRRDl0823SMOB
 bcdIa14Wbt53s9x1PUKQ8PRvacrQw868829oT3z7g5p4CS2b0lUyvQP0RGtrtOgogf49
 NE2Q==
X-Gm-Message-State: AO0yUKXno3J7fQ2pvc1MR5f6EKEAq4ySBfZ0UYxuu0CiP0Uo2WMTjIs7
 +/FcI5Ly1YIGrqMF1Vl+gYYm/A==
X-Google-Smtp-Source: AK7set/trKZ/E7i3fxNeRR51HtmeRDtGnh/yB90Y0uXgDzFgTwM2wHw/nkGg/pKLxdmwzv14JkPYYw==
X-Received: by 2002:a05:6830:2705:b0:68b:b96b:ec5 with SMTP id
 j5-20020a056830270500b0068bb96b0ec5mr7845503otu.9.1676994556002; 
 Tue, 21 Feb 2023 07:49:16 -0800 (PST)
Received: from [192.168.68.107] ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a05683033c400b00693bddab6b0sm983233ott.31.2023.02.21.07.49.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 07:49:15 -0800 (PST)
Message-ID: <75c223c9-3709-0595-70f0-11e113d21323@ventanamicro.com>
Date: Tue, 21 Feb 2023 12:49:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v6 1/9] target/riscv: turn write_misa() into an official
 no-op
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, richard.henderson@linaro.org,
 Andrew Jones <ajones@ventanamicro.com>
References: <20230216215550.1011637-1-dbarboza@ventanamicro.com>
 <20230216215550.1011637-2-dbarboza@ventanamicro.com>
 <d2eee59a-0611-d260-53e5-fd6349642c21@linux.alibaba.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <d2eee59a-0611-d260-53e5-fd6349642c21@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x329.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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
X-List-Received-Date: Tue, 21 Feb 2023 15:49:24 -0000

Hey,

On 2/16/23 22:42, LIU Zhiwei wrote:
> 
> On 2023/2/17 5:55, Daniel Henrique Barboza wrote:
>> At this moment, and apparently since ever, we have no way of enabling
>> RISCV_FEATURE_MISA. This means that all the code from write_misa(), all
>> the nuts and bolts that handles how to write this CSR, has always been a
>> no-op as well because write_misa() will always exit earlier.
>>
>> This seems to be benign in the majority of cases. Booting an Ubuntu
>> 'virt' guest and logging all the calls to 'write_misa' shows that no
>> writes to MISA CSR was attempted. Writing MISA, i.e. enabling/disabling
>> RISC-V extensions after the machine is powered on, seems to be a niche
>> use.
>>
>> Before proceeding, let's recap what the spec says about MISA. It is a
>> CSR that is divided in 3 fields:
>>
>> - MXL, Machine XLEN, described as "may be writable";
>>
>> - MXLEN, the XLEN in M-mode, which is given by the setting of MXL or a
>> fixed value if MISA is zero;
>>
>> - Extensions is defined as "a WARL field that can contain writable bits
>> where the implementation allows the supported ISA to be modified"
>>
>> Thus what we have today (write_misa() being a no-op) is already a valid
>> spec implementation. We're not obliged to have a particular set of MISA
>> writable bits, and at this moment we have none.
> 
> Hi Daniel,
> 
> I see there has been a discussion on this topic. And as no-op has no harmfulness for current implementation.
> However, I still think we should make misa writable as default, which is also a valid spec implementation.
> 
> One reason is that may be we need to dynamic write  access for some cpus in the future. The other is we should
> make QEMU a more useful implementation, not just a legal implementation. We have done in many aspects on this direction.
> 
> I prefer your implementation before v4. It's not a complicated implementation. And I think the other extensions on QEMU currently
> can mostly be configurable already.

I don't have a strong opinion in this matter to be honest. My problems with the
existing code are:

- the code is untested. I cannot say that this was never tested, but I can say that
this has been mostly untested ever since introduced. Which is normal for a code that
is 'dormant'.

- the code is dormant and most likely with bugs, but it's still maintained. For
example we have e91a7227 ("target/riscv: Split misa.mxl and misa.ext") that had
to make changes here. So we have the upkeep but no benefits.

- we don't have an use case for it. Most OSes doesn't seem to care, and afaik no
applications seems to care either.


All this said, I think we can reach a consensus of keeping it if we can at least come
up with a way of testing it.


> 
> Your work is a good step towards to unify the configuration and the check.  I think two more steps we can go further.
> 
> 1) Remove RVI/RVF and the similar macros, and add fields for them in the configuration struct.
> 
> 2) Unify the check about configuration. write_misa and cpu_realize_fn can use the same check function.
> 
> 
> As we have done these two steps, I think we can go more closely for the profile extension.


Is this the extension you're taking about?

https://github.com/riscv/riscv-profiles/blob/main/profiles.adoc


This looks like a good reason to keep the code. Let's see if anyone else has an opinion
about it. We can do the improvements you mentioned above as a follow-up (this series was
really about removing RISC_FEATURE_*) if we decide to keep it.



Thanks,


Daniel

> 
> 
> Zhiwei
> 
>> Given that allowing the dormant code to write MISA can cause tricky bugs
>> to solve later on, and we don't have a particularly interesting case of
>> writing MISA to support today, and we're already not violating the
>> specification, let's erase all the body of write_misa() and turn it into
>> an official no-op instead of an accidental one. We'll keep consistent
>> with what we provide users today but with 50+ less lines to maintain.
>>
>> RISCV_FEATURE_MISA enum is erased in the process since there's no one
>> else using it.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> Reviewed-by: Bin Meng <bmeng@tinylab.org>
>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>> ---
>>   target/riscv/cpu.h |  1 -
>>   target/riscv/csr.c | 55 ----------------------------------------------
>>   2 files changed, 56 deletions(-)
>>
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 7128438d8e..01803a020d 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -89,7 +89,6 @@ enum {
>>       RISCV_FEATURE_MMU,
>>       RISCV_FEATURE_PMP,
>>       RISCV_FEATURE_EPMP,
>> -    RISCV_FEATURE_MISA,
>>       RISCV_FEATURE_DEBUG
>>   };
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index 1b0a0c1693..f7862ff4a4 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -1329,61 +1329,6 @@ static RISCVException read_misa(CPURISCVState *env, int csrno,
>>   static RISCVException write_misa(CPURISCVState *env, int csrno,
>>                                    target_ulong val)
>>   {
>> -    if (!riscv_feature(env, RISCV_FEATURE_MISA)) {
>> -        /* drop write to misa */
>> -        return RISCV_EXCP_NONE;
>> -    }
>> -
>> -    /* 'I' or 'E' must be present */
>> -    if (!(val & (RVI | RVE))) {
>> -        /* It is not, drop write to misa */
>> -        return RISCV_EXCP_NONE;
>> -    }
>> -
>> -    /* 'E' excludes all other extensions */
>> -    if (val & RVE) {
>> -        /* when we support 'E' we can do "val = RVE;" however
>> -         * for now we just drop writes if 'E' is present.
>> -         */
>> -        return RISCV_EXCP_NONE;
>> -    }
>> -
>> -    /*
>> -     * misa.MXL writes are not supported by QEMU.
>> -     * Drop writes to those bits.
>> -     */
>> -
>> -    /* Mask extensions that are not supported by this hart */
>> -    val &= env->misa_ext_mask;
>> -
>> -    /* Mask extensions that are not supported by QEMU */
>> -    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU | RVV);
>> -
>> -    /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
>> -    if ((val & RVD) && !(val & RVF)) {
>> -        val &= ~RVD;
>> -    }
>> -
>> -    /* Suppress 'C' if next instruction is not aligned
>> -     * TODO: this should check next_pc
>> -     */
>> -    if ((val & RVC) && (GETPC() & ~3) != 0) {
>> -        val &= ~RVC;
>> -    }
>> -
>> -    /* If nothing changed, do nothing. */
>> -    if (val == env->misa_ext) {
>> -        return RISCV_EXCP_NONE;
>> -    }
>> -
>> -    if (!(val & RVF)) {
>> -        env->mstatus &= ~MSTATUS_FS;
>> -    }
>> -
>> -    /* flush translation cache */
>> -    tb_flush(env_cpu(env));
>> -    env->misa_ext = val;
>> -    env->xl = riscv_cpu_mxl(env);
>>       return RISCV_EXCP_NONE;
>>   }

