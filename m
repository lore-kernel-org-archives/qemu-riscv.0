Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1olUHB-0006Jx-Gx
	for mharc-qemu-riscv@gnu.org; Thu, 20 Oct 2022 08:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olUFa-0003Rz-AK
 for qemu-riscv@nongnu.org; Thu, 20 Oct 2022 08:02:18 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:43877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olUFY-0005bb-4k
 for qemu-riscv@nongnu.org; Thu, 20 Oct 2022 08:02:13 -0400
Received: by mail-pg1-x535.google.com with SMTP id h185so18999235pgc.10
 for <qemu-riscv@nongnu.org>; Thu, 20 Oct 2022 05:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eoPrb5ciMJ3c8YUD2GOpOQn2Oc8LxXQ2TKNhI9xhVBw=;
 b=m9VR6ajirf1qmUvMhKfG6VRvWH5unrJ8Tqgjr8F8zqn2nKUc5oYt16rNH7I5glZWue
 ExLQuwTuWN/EIPerfaS0xjMqTuP7oe3e8bBX4rf9LpG5JFSQML/AWVy0kb1epLWoKu8r
 CpASg6Jzvv8aZkhp+O+i0XtvXM3PJ/6cMuir2uz4zH+3NYVFTdLzvtdgBjdGKSCdOe9J
 2vKFoVwDKcQ8xjghpum1DH2/G2USV0c3y6V7nFj/ARc9o221LQarsHkgCfESGHXDRPZV
 lVIp31Y0uBxrNi6sDvXCxvC+qopuTZ85COSxIEnfEC9tx8Bipk8YIT9JfyQDDrFTya/0
 1iCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eoPrb5ciMJ3c8YUD2GOpOQn2Oc8LxXQ2TKNhI9xhVBw=;
 b=u6s/AE3NAVfZgOwoV322INJ+txc5tMozExxbOjA2U20kyVHYdfwwJWQPlS2JERwVwl
 18jA96Znn8pQ7fSAcbttjAfFsprAoKJ6rR+fdblzMvRWi0OyHA9svnH1RB3z3mLXSS6l
 BcC7pUx/afTShP/iWhioQCTkfzHz9bXl4MhGAcsu/9XqXsB3+Ej6/ho61Wz5QRJKFP8C
 BoOzN8mfdehbESVRUw43ngV4d/5twQrd2L5fjduj+3jKZ5ncnXUsZOPWNDHYu+zxuKA4
 sVrwhTkOfkBPmHUkmsHUEcOINAGW70q4L26CX1b94pmwDlDsRc8rvz146D60kPbhUKi4
 u77A==
X-Gm-Message-State: ACrzQf1p8bOrShypjdifmBGaRUHROwQZL00igRru8epohE+rCA4zHssa
 gMiQWNf7/ylPmSsMuWprkhwtLA==
X-Google-Smtp-Source: AMsMyM6wC8XsS0LesqWDV1cWuq4rPD/STq/fU6xDIIzIZEHf+Vgazkqb3RSARpeAg6Ab3NbiDbVfOQ==
X-Received: by 2002:a65:4585:0:b0:464:4538:c0bc with SMTP id
 o5-20020a654585000000b004644538c0bcmr11656162pgq.455.1666267330552; 
 Thu, 20 Oct 2022 05:02:10 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 k33-20020a635621000000b00460a5c6304dsm3250334pgb.67.2022.10.20.05.02.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 05:02:09 -0700 (PDT)
Message-ID: <d4c0cda4-b62c-c9cd-8bf9-fe2f1dad032e@linaro.org>
Date: Thu, 20 Oct 2022 22:01:56 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [RFC PATCH 1/3] tcg/riscv: Fix base regsiter for qemu_ld/st
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 lzw194868@alibaba-inc.com
References: <20221020104154.4276-1-zhiwei_liu@linux.alibaba.com>
 <20221020104154.4276-2-zhiwei_liu@linux.alibaba.com>
 <4373f964-3336-d076-5284-d5a2983ddd88@linaro.org>
 <6c468fb2-c41e-a7dc-8fef-10185dffeca9@linux.alibaba.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <6c468fb2-c41e-a7dc-8fef-10185dffeca9@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
X-List-Received-Date: Thu, 20 Oct 2022 12:02:23 -0000

On 10/20/22 21:42, LIU Zhiwei wrote:
> 
> On 2022/10/20 19:18, Richard Henderson wrote:
>> On 10/20/22 20:41, LIU Zhiwei wrote:
>>> When guest base is zero, we should use addr_regl as base regiser instead of
>>> the initial register TCG_REG_TMP0.
>>>
>>> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>>> ---
>>>   tcg/riscv/tcg-target.c.inc | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
>>> index 81a83e45b1..32f4bc7bfc 100644
>>> --- a/tcg/riscv/tcg-target.c.inc
>>> +++ b/tcg/riscv/tcg-target.c.inc
>>> @@ -1185,6 +1185,8 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, 
>>> bool is_64)
>>>       }
>>>       if (guest_base != 0) {
>>>           tcg_out_opc_reg(s, OPC_ADD, base, TCG_GUEST_BASE_REG, addr_regl);
>>> +    } else {
>>> +        base = addr_regl;
>>>       }
>>
>> You're right that there's a bug here, where TMP0 remains uninitialized.  I think it 
>> would be better to reorg the other direction: begin with initializeing base = addr_regl, 
> 
> Do you mean only in user mode? I see TCG_REG_TMP0 has been used in tcg_out_tlb_load when  
> system mode.

Well, yes, since that's what you're patching here...


r~

