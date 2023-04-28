Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1psKDN-0003jZ-Ua
	for mharc-qemu-riscv@gnu.org; Fri, 28 Apr 2023 05:16:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1psKDL-0003il-2h
 for qemu-riscv@nongnu.org; Fri, 28 Apr 2023 05:16:27 -0400
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1psKDJ-00031E-2B
 for qemu-riscv@nongnu.org; Fri, 28 Apr 2023 05:16:26 -0400
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-547705d6197so3774977eaf.3
 for <qemu-riscv@nongnu.org>; Fri, 28 Apr 2023 02:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682673383; x=1685265383;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xRmg9eVYql2OUqdZlilWVbXF+2u62ji2XGjw2/3sh78=;
 b=OT8rDwphKxMRg+/FSGGOZJXhFbpw2Vkw8LWe7yZBVGztdVbWXJfBihjxeQNdaH8Qcg
 MqFX4gXN5DWjbwDDS1XIaLFHvyoH82WWkilA2vw0P9vCVViNQ5U5RAVKL2NvB27kPN8J
 GgJLczEwN1ihO86u0berLAKkGIoq6dCcNibGTlOl4Dcfp6fNSIinGJG0n6BnEylv9tVf
 IgaGfTpIPMUrdBdmmhuVx+cISosjJCrok4aTwkNMudR4GL6SdDoPPkAdOWi8vd3LS8td
 nyw7FNq0KhVLCIgWPcMmYAopEf8WVGkQChEh4cI7/bx58mJ6VtqF1Z1NdBM/pfPYKhmt
 zL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682673383; x=1685265383;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xRmg9eVYql2OUqdZlilWVbXF+2u62ji2XGjw2/3sh78=;
 b=Kz88TX10RYBpkFXNd3166yy1p2yJRA8MiLxMOlL7rMKsA6uV+wTFASZe8RMst7lhBU
 yf+EgFWNghuT/HIPfCDTAh8qerlJhH8Lww+eNSmv9VtStlV7Q3lCHn+SmFBxWjlRFItO
 UwtyugvvHpB29V/QltyLodGj7Rjg7uMKF+8vWnRY2s2IjtjaHrRiN0ayFAMI0rXEhM2z
 ePX3KlM4Gi7bw+ZJkV4cv4EtRumdLzS8pvXCsHVReptXJrX30iSVeHbShUU/CE+6m6V2
 D4ZWO/7rK/NzhsWF1SkM3PJ6bZDcTI6GKfrx3tF8+XD9fzqTXlm0O44kLNBFjgD4BR55
 Bp7w==
X-Gm-Message-State: AC+VfDzzhLaxyqA2tRfek5PmKLfwzy3fIdOzlHhqINBcHY27OeYoqtAf
 +lqotUGUN+8z2yZGxqA/0EXT1w==
X-Google-Smtp-Source: ACHHUZ7Ygpx6uH8Zqv+38I6QnTokMOrKJC0MwcDjijIi73YoSJ1jaFV+3b9RoL7YkxgzVw2fcNNGMA==
X-Received: by 2002:a4a:df03:0:b0:541:f866:7548 with SMTP id
 i3-20020a4adf03000000b00541f8667548mr2302649oou.1.1682673382959; 
 Fri, 28 Apr 2023 02:16:22 -0700 (PDT)
Received: from [192.168.68.107] ([179.111.98.125])
 by smtp.gmail.com with ESMTPSA id
 s26-20020a4ae55a000000b00549efd1fc72sm3620356oot.35.2023.04.28.02.16.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 02:16:22 -0700 (PDT)
Message-ID: <9663e1bb-55a3-76f4-5c11-a51c7d8d3fe4@ventanamicro.com>
Date: Fri, 28 Apr 2023 06:16:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] target/riscv/vector_helper.c: make
 vext_set_tail_elems_1s() debug only
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230427205708.246679-1-dbarboza@ventanamicro.com>
 <20230427205708.246679-3-dbarboza@ventanamicro.com>
 <6d48f787-f4ce-e8af-ac2f-a99596c8a012@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <6d48f787-f4ce-e8af-ac2f-a99596c8a012@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc33.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 28 Apr 2023 09:16:27 -0000



On 4/27/23 22:22, Weiwei Li wrote:
> 
> On 2023/4/28 04:57, Daniel Henrique Barboza wrote:
>> Commit 3479a814 ("target/riscv: rvv-1.0: add VMA and VTA") added vma and
>> vta fields in the vtype register, while also defining that QEMU doesn't
>> need to have a tail agnostic policy to be compliant with the RVV spec.
>> It ended up removing all tail handling code as well. Later, commit
>> 752614ca ("target/riscv: rvv: Add tail agnostic for vector load / store
>> instructions") reintroduced the tail agnostic fill for vector load/store
>> instructions only.
>>
>> This puts QEMU in a situation where some functions are 1-filling the
>> tail elements and others don't. This is still a valid implementation,
>> but the process of 1-filling the tail elements takes valuable emulation
>> time that can be used doing anything else. If the spec doesn't demand a
>> specific tail-agostic policy, a proper software wouldn't expect any
>> policy to be in place. This means that, more often than not, the work
>> we're doing by 1-filling tail elements is wasted. We would be better of
>> if vext_set_tail_elems_1s() is removed entirely from the code.
>>
>> All this said, there's still a debug value associated with it. So,
>> instead of removing it, let's gate it with cpu->cfg.debug. This way
>> software can enable this code if desirable, but for the regular case we
>> shouldn't waste time with it.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/vector_helper.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
>> index 8e6c99e573..e0a292ac24 100644
>> --- a/target/riscv/vector_helper.c
>> +++ b/target/riscv/vector_helper.c
>> @@ -272,7 +272,7 @@ static void vext_set_tail_elems_1s(CPURISCVState *env, target_ulong vl,
>>       uint32_t vta = vext_vta(desc);
>>       int k;
>> -    if (vta == 0) {
>> +    if (vta == 0 || !riscv_cpu_cfg(env)->debug)  {
> 
> I think this is not correct. 'debug' property is used for debug spec. And this feature is controlled by another property 'rvv_ta_all_1s' .

You're right. I wasn't aware that this flag exists:


$ git grep 'rvv_ta_all_1s'
target/riscv/cpu.c:    DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
target/riscv/cpu.h:    bool rvv_ta_all_1s;
target/riscv/translate.c:    ctx->vta = FIELD_EX32(tb_flags, TB_FLAGS, VTA) && cpu->cfg.rvv_ta_all_1s;
target/riscv/translate.c:    ctx->cfg_vta_all_1s = cpu->cfg.rvv_ta_all_1s;




> 
> By the way, cfg.rvv_ta_all_1s have been ANDed intovta value. So additional check on it  is also unnecessary here.


Yes. We can drop this patch then since 'vta' is already accounting for ta_all_1s.


Thanks,

Daniel


> 
> Regards,
> 
> Weiwei Li
> 
>>           return;
>>       }
> 

