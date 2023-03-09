Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1paI9n-0002Sk-M1
	for mharc-qemu-riscv@gnu.org; Thu, 09 Mar 2023 10:26:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1paI9j-0002Qc-OD
 for qemu-riscv@nongnu.org; Thu, 09 Mar 2023 10:26:12 -0500
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1paI9f-0007NC-7X
 for qemu-riscv@nongnu.org; Thu, 09 Mar 2023 10:26:09 -0500
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-176d93cd0daso2672103fac.4
 for <qemu-riscv@nongnu.org>; Thu, 09 Mar 2023 07:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678375565;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2LPCtpMluYElYKx4kdSb4vYJwV6jUzBWF8jg9WRIbhM=;
 b=OOxxtPxa1HKagwC2tEWVjHk8s/4lAVw7CcC7d7C5JZlw2MiFJaBc/vJFCf5x3Mlnm4
 JEFwbHQxcMIA8mDvoJwfrk7oCAu2qzSZgjHt2uUO7tHZnxTnbKF9H5tYJq9AldQiMdtO
 JQwnhOg9m3OHpNz+b6HBovw3r+ZaKZNTBqgBPfVNaNjsF/Ki3Ylfhqx2byEXMfRQuJYr
 ArFk+6YqQNfik+AxqcA/xAHUqrRy1Nfv2/RcCasHCH9VoA5ue/kKylzzh2RDsm4zSSiY
 ciFXvN2Q+Gfw+OJ99KBVaxkPIpAyUJOusB8L3wKv6862PtLyabjnA8QmI6En84pxVF//
 EBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678375565;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2LPCtpMluYElYKx4kdSb4vYJwV6jUzBWF8jg9WRIbhM=;
 b=6odJC03s31TwwoDF3bHw8UdmL+1TUIgd1q9RuXHPEjcI5pTtws6jjOcCn538gLJnTW
 D0N/2JnJSFcWoOVTkuvnwnyBUR932UaemTxKhE23JY7qHwFwRSei9jcQyrg8ZI7X338q
 ZRC6Hu/VPovIG8UwXgUcsk6oVcHverZ74eMgBsGWBiNmIz+4hgoPpfNEExU50a5tuA5o
 wPUKUeD87T3an1sXyib7SxgFeIKyHBCNiLma55wylCT5pZdVweVmLQqdDjpZXx3yvu/q
 zzHskl8pQlboWzp6KjJOJu7Cb7XYPT4PiXd5wIMr4f8kASmfjeRNj1pbW21Zckkc7Zj6
 qLyg==
X-Gm-Message-State: AO0yUKUQX6T+wfQNgEmIhpD64nxxLgr/O2upKhj6JkImN4xTJ1YICHZF
 X4QEOzvnzOUV+WnS1zz0AMzhzw==
X-Google-Smtp-Source: AK7set+Zl7wj0/VSGM4EfOKe5pFjGoKWpTu7gcmNLJ+3kUOo0wHFolQMP4KzI6MJ/3LEFi+cFfnGGQ==
X-Received: by 2002:a05:6870:8194:b0:172:289c:102 with SMTP id
 k20-20020a056870819400b00172289c0102mr13005934oae.17.1678375564539; 
 Thu, 09 Mar 2023 07:26:04 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 m29-20020a4a391d000000b00517a7ac36c8sm7475304ooa.24.2023.03.09.07.26.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 07:26:04 -0800 (PST)
Message-ID: <f60610a7-4c09-3217-a88c-3d39c5662143@ventanamicro.com>
Date: Thu, 9 Mar 2023 12:26:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 03/10] target/riscv: allow MISA writes as experimental
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Cc: qemu-riscv@nongnu.org, bmeng@tinylab.org, liweiwei@iscas.ac.cn,
 palmer@rivosinc.com
References: <20230222185205.355361-1-dbarboza@ventanamicro.com>
 <20230222185205.355361-4-dbarboza@ventanamicro.com>
 <87bbfaef-92df-52d7-da48-ff25a3c508a4@linux.alibaba.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <87bbfaef-92df-52d7-da48-ff25a3c508a4@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x31.google.com
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
X-List-Received-Date: Thu, 09 Mar 2023 15:26:14 -0000



On 3/9/23 03:11, LIU Zhiwei wrote:
> 
> On 2023/2/23 2:51, Daniel Henrique Barboza wrote:
>> At this moment, and apparently since ever, we have no way of enabling
>> RISCV_FEATURE_MISA. This means that all the code from write_misa(), all
>> the nuts and bolts that handles how to properly write this CSR, has
>> always been a no-op as well because write_misa() will always exit
>> earlier.
>>
>> This seems to be benign in the majority of cases. Booting an Ubuntu
>> 'virt' guest and logging all the calls to 'write_misa' shows that no
>> writes to MISA CSR was attempted. Writing MISA, i.e. enabling/disabling
>> RISC-V extensions after the machine is powered on, seems to be a niche
>> use.
>>
>> After discussions in the mailing list, most notably in [1], we reached
>> the consensus that this code is not suited to be exposed to users
>> because it's not well tested, but at the same time removing it is a bit
>> extreme because we would like to fix it, and it's easier to do so with
>> the code available to use instead of fetching it from git log.
>>
>> The approach taken here is to get rid of RISCV_FEATURE_MISA altogether
>> and use a new experimental flag called x-misa-w. The default value is
>> false, meaning that we're keeping the existing behavior of doing nothing
>> if a write_misa() is attempted. As with any existing experimental flag,
>> x-misa-w is also a temporary flag that we need to remove once we fix
>> write_misa().
>>
>> [1] https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg05092.html
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu.c | 6 ++++++
>>   target/riscv/cpu.h | 2 +-
>>   target/riscv/csr.c | 2 +-
>>   3 files changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 93b52b826c..1d637b1acd 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -1210,6 +1210,12 @@ static Property riscv_cpu_properties[] = {
>>       DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
>>       DEFINE_PROP_BOOL("rvv_ma_all_1s", RISCVCPU, cfg.rvv_ma_all_1s, false),
>> +
>> +    /*
>> +     * write_misa() is marked as experimental for now so mark
>> +     * it with -x and default to 'false'.
>> +     */
>> +    DEFINE_PROP_BOOL("x-misa-w", RISCVCPU, cfg.misa_w, false),
> 
> Just a question  I got when I reviewed another patch set:
> 
> Why put x-misa-w to riscv_cpu_properties instead of riscv_cpu_extensions?

I didn't think too much about it to be honest. I copied what was being done
with the now old RISCV_FEATURE_DEBUG. It made sense to me because x-misa-w
isn't a RISC-V extension but a property of our model.

I don't oppose moving it to a better place. Just be aware that this a property
that we're planning to eventually remove.


Thanks,


Daniel


> 
> I think this property should have a fixed value for a named cpu(such as sifive_e). Therefore IMHO, putting x-misa-w into riscv_cpu_extensions is more proper. At the same time,  the debug, rvv_ta_all_1s, rvv_ma_all_1s, resetvec properties should be moved to riscv_cpu_extentions. I am not sure why we should give the marchid/mipid/mvendorid option for named cpus. Maybe @Frank knows.
> 
> Have I missed something?
> 
> Zhiwei
> 
>>       DEFINE_PROP_END_OF_LIST(),
>>   };
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 215423499e..9d3304bcda 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -89,7 +89,6 @@ enum {
>>       RISCV_FEATURE_MMU,
>>       RISCV_FEATURE_PMP,
>>       RISCV_FEATURE_EPMP,
>> -    RISCV_FEATURE_MISA,
>>       RISCV_FEATURE_DEBUG
>>   };
>> @@ -498,6 +497,7 @@ struct RISCVCPUConfig {
>>       bool pmp;
>>       bool epmp;
>>       bool debug;
>> +    bool misa_w;
>>       bool short_isa_string;
>>   };
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index e149b453da..3cb8d2ffad 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -1329,7 +1329,7 @@ static RISCVException read_misa(CPURISCVState *env, int csrno,
>>   static RISCVException write_misa(CPURISCVState *env, int csrno,
>>                                    target_ulong val)
>>   {
>> -    if (!riscv_feature(env, RISCV_FEATURE_MISA)) {
>> +    if (!riscv_cpu_cfg(env)->misa_w) {
>>           /* drop write to misa */
>>           return RISCV_EXCP_NONE;
>>       }

