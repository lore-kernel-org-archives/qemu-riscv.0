Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRzHd-0003A7-CN
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 12:40:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pRzHb-00039I-9X
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 12:39:59 -0500
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pRzHZ-0005vZ-E5
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 12:39:59 -0500
Received: by mail-ot1-x32e.google.com with SMTP id
 x24-20020a9d4598000000b00690bf2011b2so431181ote.6
 for <qemu-riscv@nongnu.org>; Tue, 14 Feb 2023 09:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tlrTr5ZHgLSy10J7wvgufNXoH3mapoFZSUZcRmXccwY=;
 b=He3YfPX359eZvaz7MBymdPuPSTJmjY1a4o6TbI4oC52DJ876u5JdcwwTk8L+f04SJS
 sKoTIKQhA+qDzpuTwtWz+sgVd6VknnsjaO6rA1e3zFfhv10L5B04V8veiYH9yDU6ds/a
 ibAEjv3aoUbSLmJ6xxHlAvHUVMd8xl/F4C7jiql1KiPAxPitNziiloe5xWVUsFwWvMps
 qWa5fqad3zPDi7Rgv5rGgG0kAejDgAV5Y59UpZP3f/pyN2gCQKAsrEfpirD2amZCSF6z
 THzywKl2lzN0TllTKBlCCdIEaqYUgovfCYrBz2hXXBQ+wnv7jtDteNt57T691lwZuril
 UFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tlrTr5ZHgLSy10J7wvgufNXoH3mapoFZSUZcRmXccwY=;
 b=o8O3hRI7HJt7d/vFnHfBeY6BX6cGwbtwESdZ0LYpM+mG9bkUnrVKuqD6MHsdsALc9V
 Cq2oSWIiDawwp/kCHUGP5ia4G6d4f+hsrOr4X9BYBnud+3cEf3LyNvd0RNOPFDWg4WAU
 QoXet0/HgWiY23XcX8bZvRe4dISvnKuIaskyYlJ4rBCc6ba0aDQ9r2VmFVUS2hgW8pSc
 nEpHF82tkxouZqFBi4lCE2Pam1HM4LUskfE8uGlnC44kWkT12BVFwGs+4ia85ocrAzcc
 jKmun7nTk6AldFaGZua2LZGPNHkfARb/kAFc/pdJdXIxTz/PVXRJ7F4MRoC7OlDyaggs
 nMZw==
X-Gm-Message-State: AO0yUKWEFXB8Kc2ZwLd1zAQ6R6Dhy3rM0vh4QozAS/3VyAvnKpRKh3Pa
 4ajSBdR0tFu37hX/kAIg9akazQ==
X-Google-Smtp-Source: AK7set8plF/6BaFprQLmIYaWi7yO4EPeRITE319/RTx9ts6S52K5Q3DTDE3RL+hF6CHW8BEDnX+eew==
X-Received: by 2002:a9d:6409:0:b0:68b:cada:6817 with SMTP id
 h9-20020a9d6409000000b0068bcada6817mr1333813otl.12.1676396395865; 
 Tue, 14 Feb 2023 09:39:55 -0800 (PST)
Received: from [192.168.68.107] ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a9d7ac2000000b0068bcb44e7f5sm6514386otn.68.2023.02.14.09.39.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 09:39:55 -0800 (PST)
Message-ID: <6a4ce54c-73f7-1115-78b3-e8c55f8051b0@ventanamicro.com>
Date: Tue, 14 Feb 2023 14:39:52 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 02/11] target/riscv: allow users to actually write the
 MISA CSR
Content-Language: en-US
To: weiwei <liweiwei@iscas.ac.cn>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com
References: <20230210133635.589647-1-dbarboza@ventanamicro.com>
 <20230210133635.589647-3-dbarboza@ventanamicro.com>
 <2a0d5e1e-f2ff-6502-0f88-f6b3005bcaf3@iscas.ac.cn>
 <0d853c1b-7554-1813-693f-e31a62ef9298@ventanamicro.com>
 <4108972e-7598-af6a-a9cd-f42d4f3477fc@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <4108972e-7598-af6a-a9cd-f42d4f3477fc@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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
X-List-Received-Date: Tue, 14 Feb 2023 17:39:59 -0000



On 2/14/23 12:12, weiwei wrote:
> 
> On 2023/2/11 19:50, Daniel Henrique Barboza wrote:
>>
>>
>> On 2/10/23 23:43, weiwei wrote:
>>>
>>> On 2023/2/10 21:36, Daniel Henrique Barboza wrote:
>>>> At this moment, and apparently since ever, we have no way of enabling
>>>> RISCV_FEATURE_MISA. This means that all the code from write_misa(), all
>>>> the nuts and bolts that handles how to properly write this CSR, has
>>>> always been a no-op as well because write_misa() will always exit
>>>> earlier.
>>>>
>>>> This seems to be benign in the majority of cases. Booting an Ubuntu
>>>> 'virt' guest and logging all the calls to 'write_misa' shows that no
>>>> writes to MISA CSR was attempted. Writing MISA, i.e. enabling/disabling
>>>> RISC-V extensions after the machine is powered on, seems to be a niche
>>>> use.
>>>>
>>>> There is a good chance that the code in write_misa() hasn't been
>>>> properly tested. Allowing users to write MISA can open the floodgates of
>>>> new breeds of bugs. We could instead remove most (if not all) of
>>>> write_misa() since it's never used. Well, as a hardware emulator,
>>>> dealing with crashes because a register write went wrong is what we're
>>>> here for.
>>>>
>>>> Create a 'misa-w' CPU property to allow users to choose whether writes
>>>> to MISA should be allowed. The default is set to 'false' for all RISC-V
>>>> machines to keep compatibility with what we´ve been doing so far.
>>>>
>>>> Read cpu->cfg.misa_w directly in write_misa(), instead of executing
>>>> riscv_set_feature(RISCV_FEATURE_MISA) in riscv_cpu_realize(), that would
>>>> simply reflect the cpu->cfg.misa_w bool value in 'env->features' and
>>>> require a riscv_feature() call to read it back.
>>>>
>>>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>>> ---
>>>>   target/riscv/cpu.c | 1 +
>>>>   target/riscv/cpu.h | 1 +
>>>>   target/riscv/csr.c | 4 +++-
>>>>   3 files changed, 5 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>>> index 93b52b826c..69fb9e123f 100644
>>>> --- a/target/riscv/cpu.c
>>>> +++ b/target/riscv/cpu.c
>>>> @@ -1197,6 +1197,7 @@ static void register_cpu_props(DeviceState *dev)
>>>>   static Property riscv_cpu_properties[] = {
>>>>       DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
>>>> +    DEFINE_PROP_BOOL("misa-w", RISCVCPU, cfg.misa_w, false),
>>>>       DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
>>>>       DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCHID),
>>>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>>>> index 7128438d8e..103963b386 100644
>>>> --- a/target/riscv/cpu.h
>>>> +++ b/target/riscv/cpu.h
>>>> @@ -498,6 +498,7 @@ struct RISCVCPUConfig {
>>>>       bool pmp;
>>>>       bool epmp;
>>>>       bool debug;
>>>> +    bool misa_w;
>>>>       bool short_isa_string;
>>>>   };
>>>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>>>> index e149b453da..4f9cc501b2 100644
>>>> --- a/target/riscv/csr.c
>>>> +++ b/target/riscv/csr.c
>>>> @@ -1329,7 +1329,9 @@ static RISCVException read_misa(CPURISCVState *env, int csrno,
>>>>   static RISCVException write_misa(CPURISCVState *env, int csrno,
>>>>                                    target_ulong val)
>>>>   {
>>>> -    if (!riscv_feature(env, RISCV_FEATURE_MISA)) {
>>>> +    RISCVCPU *cpu = env_archcpu(env);
>>>> +
>>>> +    if (!cpu->cfg.misa_w) {
>>>
>>> It's Ok to get it directly from cfg. However, personally, I prefer to keep the non-isa features in a separate list.
>>
>> I don't mind a separated non-isa list. cpu->cfg has everything contained in it
>> though, ISA and non-ISA (e.g. vendor extensions that weren't ratified yet), and
>> the current RISCV_FEATURES_* list is just a duplicate of it that we need to
>> update it during riscv_cpu_realize().
>>
>> In my opinion we can spare the extra effort of keeping a separated, up-to-date
>> non-ISA extension/features list, by just reading everything from cfg.
>>
>>
>> Thanks,
>>
>>
>> Daniel
> 
> OK. It's  acceptable to me.
> 
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> 
> By the way, the riscv_cpu_cfg() in patch 4 can be used here.

Good point. I'll move patch 4 up so I can use that function here.



Daniel

> 
> Regards,
> 
> Weiwei Li
> 
>>
>>>
>>> Regards,
>>>
>>> Weiwei Li
>>>
>>>>           /* drop write to misa */
>>>>           return RISCV_EXCP_NONE;
>>>>       }
>>>
> 

