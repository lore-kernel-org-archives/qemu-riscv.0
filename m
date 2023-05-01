Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ptOB0-0000oj-05
	for mharc-qemu-riscv@gnu.org; Mon, 01 May 2023 03:42:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptOAv-0000mu-BL
 for qemu-riscv@nongnu.org; Mon, 01 May 2023 03:42:23 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptOAt-0005Hm-9H
 for qemu-riscv@nongnu.org; Mon, 01 May 2023 03:42:21 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-2f3fe12de15so1211264f8f.3
 for <qemu-riscv@nongnu.org>; Mon, 01 May 2023 00:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682926937; x=1685518937;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sEK/UyQxvH/3fSw2l1tQqWXyFiev0uVxiXsEMYLzmXI=;
 b=qPlZRWhh3TJ7GVSdzorgbV9W1kPXJiH+IPVOiQ9DMjaKbrM6x90DuNntKLgsHekPb9
 LFvrWPVAQM+JlVoZq0KbtQut4u371/Iq4GZkXAOodw2MsXKgGtWfFNYLECBoddnODU0Q
 03t9H07/NVDb0Y6bZ6/dyz/V7RbokEwZvU5pezC0cajp+yDHodwUgDsE4Dqpa6mxFM2N
 hzSfKDisNjQxPlpD0nnvA9MDx7HcuteVtlhiP7tncYy1xckmAr3XXLOi/jQVTZHz3dxQ
 4kNfzFTjPubzIosb3fBVOHgcNuf06DGJ+5JD8bdXEoSWfQNA8gY1t9Tsu1m2vQOrXRLE
 +lsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682926937; x=1685518937;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sEK/UyQxvH/3fSw2l1tQqWXyFiev0uVxiXsEMYLzmXI=;
 b=IuGFDknufXa2ZSHU/5SacRISjR+FHOhGRmsywxS+VbBly5PVb3rZdznU9lTKsKe9a7
 nav2vkqSIeDfhf3P0FTKihTJ/W3jijoT1U1uj1jMDlxh1GqnZvGRUu9H7qKAuhbVB2HV
 l80KAk7Z6Dn8M3Lg/T/TRWjs7VoaX6J2ELGPmzY8JSY4R5cU25H3+58bBN4FsaMPRqG/
 7QmZx71CH4w9cZtRrcrD1q9O0S+OEbi3avbmeNX9I8McS8G1tiaWOUfkL0TYRDW1IRD8
 cBfciGqce0QPC0G4wAdcZwFg2ob03JB1KTXj+vhHVOwY+Gu2VGKEyNo1I8UAp+PNkjp8
 cJHw==
X-Gm-Message-State: AC+VfDzBl62tcBvsZQa7X/zGs3cHl5ILpYoBSXu8UdM1+NPqM+Zz2Ko0
 f+ewkxE3+AxWPwlVwrrrqgZVQw==
X-Google-Smtp-Source: ACHHUZ7nvUjXZzbFQrECnczduxwd63XgGwahfXMasF8r4zmItucNJ0E85TM/Cu3Mk9mpcMg8GmREpQ==
X-Received: by 2002:a5d:65c2:0:b0:2fe:c0ea:18b5 with SMTP id
 e2-20020a5d65c2000000b002fec0ea18b5mr8086651wrw.35.1682926937531; 
 Mon, 01 May 2023 00:42:17 -0700 (PDT)
Received: from [10.175.90.180] ([86.111.162.250])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a5d4f92000000b002c7163660a9sm27476781wru.105.2023.05.01.00.42.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 00:42:17 -0700 (PDT)
Message-ID: <8ae3e772-c5c2-42ad-ffeb-f594f81b6a48@linaro.org>
Date: Mon, 1 May 2023 08:42:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 06/57] tcg/i386: Generalize multi-part load overlap test
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
 <20230424054105.1579315-7-richard.henderson@linaro.org>
 <92b3252a-fd8a-91c6-c90a-3a858fd126fe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <92b3252a-fd8a-91c6-c90a-3a858fd126fe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
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
X-List-Received-Date: Mon, 01 May 2023 07:42:24 -0000

On 4/29/23 14:01, Philippe Mathieu-Daudé wrote:
> On 24/4/23 07:40, Richard Henderson wrote:
>> Test for both base and index; use datahi as a temporary, overwritten
>> by the final load.  Always perform the loads in ascending order, so
>> that any (user-only) fault sees the correct address.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/i386/tcg-target.c.inc | 31 +++++++++++++++----------------
>>   1 file changed, 15 insertions(+), 16 deletions(-)
>>
>> diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
>> index b986109d77..794d440a9e 100644
>> --- a/tcg/i386/tcg-target.c.inc
>> +++ b/tcg/i386/tcg-target.c.inc
>> @@ -2223,23 +2223,22 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, 
>> TCGReg datahi,
>>           if (TCG_TARGET_REG_BITS == 64) {
>>               tcg_out_modrm_sib_offset(s, movop + P_REXW + seg, datalo,
>>                                        base, index, 0, ofs);
>> +            break;
>> +        }
>> +        if (use_movbe) {
>> +            TCGReg t = datalo;
>> +            datalo = datahi;
>> +            datahi = t;
>> +        }
>> +        if (base == datalo || index == datalo) {
>> +            tcg_out_modrm_sib_offset(s, OPC_LEA, datahi, base, index, 0, ofs);
>> +            tcg_out_modrm_offset(s, movop + seg, datalo, datahi, 0);
>> +            tcg_out_modrm_offset(s, movop + seg, datahi, datahi, 4);
> 
> LGTM but I'd rather have someone fluent with x86 review this one...

The original address is (base + (index << 0) + ofs).

If datalo overlaps either base or index, then we can't use the same form of address for 
the second load for datahi.  So we "Load Effective Address" to perform the computation of 
the original address once, storing into datahi as temporary (we are guaranteed that datalo 
!= datahi because they're both outputs).  After that, the two addresses that we want are 
(datahi + 0) and (datahi + 4).


r~

