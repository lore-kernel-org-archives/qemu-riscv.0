Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcetk-0001sO-Co
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 22:30:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcete-0001rd-S2
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 22:30:34 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:37605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcetc-0007n6-Ed
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 22:30:33 -0400
Received: by mail-pl1-x62f.google.com with SMTP id n11so12625689plf.4
 for <qemu-riscv@nongnu.org>; Mon, 18 Oct 2021 19:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g1OkJgT58HCVtjqFIvW5ZqAnpVF/dZIenDTg8izTsx8=;
 b=m5PfmQ9E0aX1tzPHt8+Yof49X19KmGJ4jmQf1YyIdgUnegh4kK/tHqntzBV68SjT1d
 T7yu/06vW3hYr/14CKJKygMIMMHjbftN0CAmn7NNPqJOW0DWcSjsJxM6Ri5g4q1puMKG
 /V3ObvSXdVsXoIPay/inigIvepjNp3e1JF7FfsUHhAidgVZ9WPsnh8RE7HnHlxvF7AuP
 hBfPgevBMHLciJfmM8r3ait2bKnWOCTC27YwrPA99RxjxSziBB8sWAbtQtOqPvVFgO7o
 0UuSua69+d72WSI1XuvP6bpEMo1yRkhfsdxTyeOSSh92P+TwMUHsTsRaHpzcQlh4xbSc
 6Iig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g1OkJgT58HCVtjqFIvW5ZqAnpVF/dZIenDTg8izTsx8=;
 b=qNS7U8VMzgmOhfWwJ92wUlrvNtj+aT9jVWbxC7MzA/F5sCLxWCZf+EaMPIKZZC7SBl
 k8BcVLLK/cAXPv1Q1pIaLGXOa6pyJ+m5gNPmOhmCpjMWOFN3j4KATCCaSZlXi11N1KN2
 4TsW51KNO1hyKXoAbspTQv0cjMMFAMdUPGNLmVytWGv/7WDD2W4hSUB08rgir0DiAewk
 XAJEdi+yEYWb+KmTWf5mPpGfBrp3aB5aGYpF/fpASWVa/6cBICQ2b3qOQRzElRpGeyYU
 HMK/olRONg7H3myQXEN71w/pMeXVI82Iz31/kVdA7QuNRekKtp3RnLi7aISqzM533Ykc
 U9SA==
X-Gm-Message-State: AOAM5334ZxI2LQAt3mdiCDIVVWwwVGM5oYE3wTxrMUKQkvBpO6k50RP5
 3jCMbpBwkvbOZL4If8k6QfE7Wg==
X-Google-Smtp-Source: ABdhPJy5X+cPYDVrj4q48ylEzVqaHorkqHC330bT8OYxUT13ziJwX6IHgxPyIZ+UjvvW45a/bKyRwg==
X-Received: by 2002:a17:90b:390d:: with SMTP id
 ob13mr3168891pjb.49.1634610630510; 
 Mon, 18 Oct 2021 19:30:30 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g7sm10175134pgp.17.2021.10.18.19.30.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 19:30:30 -0700 (PDT)
Subject: Re: [PATCH v4 09/16] target/riscv: Replace DisasContext.w with
 DisasContext.ol
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com
References: <20211019000108.3678724-1-richard.henderson@linaro.org>
 <20211019000108.3678724-10-richard.henderson@linaro.org>
 <676f2c83-8ca4-a131-97fb-0d16c61131a2@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b12508bc-68eb-5e86-8e0f-1a27f7173c54@linaro.org>
Date: Mon, 18 Oct 2021 19:30:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <676f2c83-8ca4-a131-97fb-0d16c61131a2@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Oct 2021 02:30:35 -0000

On 10/18/21 7:24 PM, LIU Zhiwei wrote:
>> @@ -223,10 +238,15 @@ static TCGv dest_gpr(DisasContext *ctx, int reg_num)
>>   static void gen_set_gpr(DisasContext *ctx, int reg_num, TCGv t)
>>   {
>>       if (reg_num != 0) {
>> -        if (ctx->w) {
>> +        switch (get_ol(ctx)) {
>> +        case MXL_RV32:
>>               tcg_gen_ext32s_tl(cpu_gpr[reg_num], t);
>> -        } else {
>> +            break;
>> +        case MXL_RV64:
>>               tcg_gen_mov_tl(cpu_gpr[reg_num], t);
>> +            break;
>> +        default:
>> +            g_assert_not_reached();
>>           }
>>       }
>>   }
> 
> The dest_gpr currently will force call gen_set_gpr.  However, many cases for MXL_RV64,  
> dest_gpr will return a global TCG variable and don't need to call gen_set_gpr.

In the MXL_RV64 case to which you refer, tcg_gen_mov_tl will be presented with a nop move, 
and will emit no code.  Similarly for TARGET_RISCV32 and the use of tcg_gen_ext32s_tl, 
which will expand to tcg_gen_mov_i32.

> And even x0 can avoid to call gen_set_gpr.  I don't find a good way to utilize this point.

You shouldn't special case x0 unless absolutely necessary.  We check for it here so that 
we do not have to scatter many checks across the code base.


r~

