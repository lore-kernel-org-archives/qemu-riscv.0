Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRwDW-0007L5-8M
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 09:23:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pRwDT-0007KY-7y
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 09:23:31 -0500
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pRwDR-0002BB-Ky
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 09:23:30 -0500
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-16df32f2ffdso8492754fac.1
 for <qemu-riscv@nongnu.org>; Tue, 14 Feb 2023 06:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4F00CTTwLY3038ca8rY5vafjy8fe+jHQBi5QB6/xEJs=;
 b=RkzNtHY0lisy7hDgWGcJLguKyJISqicplsYZJSBJy/u5vBdAkJ1iHslCO1G66D07wp
 +/F7HI2tU62+GvH+fsaPzH+eaH/H8Fm9BJOtlwrOP4mp05cecPOIMGxTerw459Sx7par
 Yg5QEUDKhxsdjbQxBHGt7YPL/5BPN+b9CcnCnuTcuuttSV6POgTyWnY6NzCjyL1ujTyV
 PDBLWuq6pY2iMB4xfL07wYQUWtgIPWb07b5clRYNBOL9f5f61mrEAbv7TlU8NfHTEWIZ
 FmWwFwsVE4+xGTSWuWAxyvgF6p/VnHaHK3WEYT4OqoTAz/xYvvfwi210NJ4yaydebEAA
 wFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4F00CTTwLY3038ca8rY5vafjy8fe+jHQBi5QB6/xEJs=;
 b=bW0d6TgGd9Eo1La2+BgxlEqkUlDkjoPoy9+SZ5+kZQ62nqGPXOhw4U+azcxLh4bd3X
 n0oiyKI/x/R+7aHp3rb8uvOXgEizjGTbndnTmVxgT4aSNApdV5nwFpXdtjTPECbeYUbE
 u/2r7wJP1rN6Jet90pMtjbuG5tw/0kwgqWArhQM+e859766cWPXOIY10nrUnyx3Kcauj
 9nW1kcgSTpgz5vzKYLp3JtxwbmUlr+FUBuMrJG+LocQlo4VrqijN8/FRrLDPoCzdQht+
 VFuSuHDMSyVc47qtVTBVD9vAFbq3Ad/dBNzFg7U6rxt7eNtfODvKH1YbLOnYcLSACP4j
 BZHA==
X-Gm-Message-State: AO0yUKWxurLyAyDf7ugyThapxUnKWfxYgIZ+yORtR//eiPPzSEFrnDaz
 mddw6eoMtYX5BJt5ort4W+eC0Q==
X-Google-Smtp-Source: AK7set9o5c9h7Zc0wUtKqSUeRR7eaCzjrd1mXiyokBsOLJ3Vzs6zyWnLfxvuxrMTbcTsiU/zB64LNg==
X-Received: by 2002:a05:6870:2413:b0:163:7563:41a0 with SMTP id
 n19-20020a056870241300b00163756341a0mr1402808oap.36.1676384606458; 
 Tue, 14 Feb 2023 06:23:26 -0800 (PST)
Received: from [192.168.68.107] ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a056870e14300b0014ff15936casm2239186oaa.40.2023.02.14.06.23.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 06:23:25 -0800 (PST)
Message-ID: <ad9ec4ae-d49e-a3eb-fe27-2130d5bbab07@ventanamicro.com>
Date: Tue, 14 Feb 2023 11:23:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Patch 05/14] target/riscv: Fix relationship between V, Zve*, F
 and D
Content-Language: en-US
To: weiwei <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230214083833.44205-1-liweiwei@iscas.ac.cn>
 <20230214083833.44205-6-liweiwei@iscas.ac.cn>
 <78ccde8a-4bbb-d000-de5b-dcb00a65a070@ventanamicro.com>
 <62413d42-4219-6eb9-4545-13a65750f0da@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <62413d42-4219-6eb9-4545-13a65750f0da@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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
X-List-Received-Date: Tue, 14 Feb 2023 14:23:31 -0000



On 2/14/23 10:40, weiwei wrote:
> 
> On 2023/2/14 21:21, Daniel Henrique Barboza wrote:
>>
>>
>> On 2/14/23 05:38, Weiwei Li wrote:
>>> Add dependence chain:
>>> *  V => Zve64d => Zve64f => Zve32f => F
>>> *  V => Zve64d => D
>>>
>>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>>> ---
>>>   target/riscv/cpu.c | 21 ++++++++++++++++++---
>>>   1 file changed, 18 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>> index 9a89bea2a3..4797ef9c42 100644
>>> --- a/target/riscv/cpu.c
>>> +++ b/target/riscv/cpu.c
>>> @@ -743,12 +743,27 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>>>           return;
>>>       }
>>>   -    if (cpu->cfg.ext_v && !cpu->cfg.ext_d) {
>>> -        error_setg(errp, "V extension requires D extension");
>>> +    /* The V vector extension depends on the Zve64d extension */
>>> +    if (cpu->cfg.ext_v) {
>>> +        cpu->cfg.ext_zve64d = true;
>>> +    }
>>> +
>>> +    /* The Zve64d extension depends on the Zve64f extension */
>>> +    if (cpu->cfg.ext_zve64d) {
>>> +        cpu->cfg.ext_zve64f = true;
>>> +    }
>>> +
>>> +    /* The Zve64f extension depends on the Zve32f extension */
>>> +    if (cpu->cfg.ext_zve64f) {
>>> +        cpu->cfg.ext_zve32f = true;
>>> +    }
>>> +
>>> +    if (cpu->cfg.ext_zve64d && !cpu->cfg.ext_d) {
>>> +        error_setg(errp, "Zve64d extensions require D extension");
>>>           return;
>>
>> I'll be honest and confess that I wrote a short essay about the problems I have
>> with this code. I gave up because in the end it's all stuff that we've been doing
>> for a long time in riscv_cpu_validate_set_extensions(). I'll see if I can work in
>> a redesign of that function and in how we're setting extensions automatically
>> without checking user input and so on.
>>
>> For now I'll say that this error message seems weird because Zve64d was set to true
>> without user input. So this ends up happening:
>>
>> $ ./qemu-system-riscv64 -M virt -cpu rv64,v=true,d=false
>> qemu-system-riscv64: Zve64d extensions require D extension
>>
>> It's weird because the user didn't enabled Zve64d but the error message is complaining
>> about it. Given that the root cause is that ext_v was set, and then we've set other
>> extensions under the hood, a saner error message in this case would be "V extension
>> requires D extension".
>>
>>
>> Thanks,
>>
>>
>> Daniel
> 
> Thanks for your comments.
> 
> V extension depends on Zve64d(which is actually parts of V). So Zve64d will be enabled when V is enabled.
> 
> And in fact, only the instructions in the Zve64d part of V require D extension.
> 
> To make it more readable, maybe it can be change to :
> 
> "Zve64d (or V) extension requires D extension"


Yes, that looks better to me. Thanks,


Daniel

> 
> Regards,
> 
> Weiwei Li
> 
>>
>>
>>
>>>       }
>>>   -    if ((cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) && !cpu->cfg.ext_f) {
>>> +    if (cpu->cfg.ext_zve32f && !cpu->cfg.ext_f) {
>>>           error_setg(errp, "Zve32f/Zve64f extensions require F extension");
>>>           return;
>>>       }
> 

