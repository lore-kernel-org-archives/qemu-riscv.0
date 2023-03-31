Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1piMTI-0004Oz-VY
	for mharc-qemu-riscv@gnu.org; Fri, 31 Mar 2023 17:39:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piMTD-0004ON-Fv
 for qemu-riscv@nongnu.org; Fri, 31 Mar 2023 17:39:40 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piMTA-0008G8-Mw
 for qemu-riscv@nongnu.org; Fri, 31 Mar 2023 17:39:38 -0400
Received: by mail-pg1-x535.google.com with SMTP id 185so3076930pgc.10
 for <qemu-riscv@nongnu.org>; Fri, 31 Mar 2023 14:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680298775;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CaGmExSWj58hDGWMMaUKv/km5RE49jbQ+ZbqUY/ia3A=;
 b=RYXxt8oIv2iKZr3JBnMDkiGPGpDokRlajp2435m1wIX9xgEAyxuK41xXZD04ecI46l
 humu/qbQz+ytTH9od7zOnq43L8mJz0Diqr/Mt6z0SYmGyj8+gpMCLOXPcOwVZ9dfRkn6
 ZuQrvAWNkLb7fvowI1jMmVstqtiiLIeKo7/cXhN4Gb0DZYNU8UyEBBglw8uPvSC07/Zs
 576cVyASImcZLZBLtg/RkOQ5LGxNsX0Ia5gZ+GGD1UxGOccn77t+EBTSIw9Fe9uc95fC
 bwvRUebsHTbJKxCfNY2oxgICF6loS65ygaCsSx9Gyq+sU963sHIi5WNzmS08+ml7xobA
 l1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680298775;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CaGmExSWj58hDGWMMaUKv/km5RE49jbQ+ZbqUY/ia3A=;
 b=TiQImLMmn1evheCKV2X3R8LoUa2JW3gExldac5WrH42X9rQ2B42pO/c1ZvtLnkgvwb
 L7JYxTLfknD2iNEIMEBMylGpcDWTFeFhlaLTyrPOpCRXFlHDz+IQTvqcRpDbbBE4IJ0E
 K5hsOiJPw04H9YGlH9zhp1dLxS1+eOHGfTgnqqF1/35H6QDc7JktwmRrU/b4nip6YrUX
 eFl5G3OQiuksBvKDjfNy3MVe0LCP+Fjr+LN8gONrt99BmmDkGpGtQGpAe6pKqQM/w1Hv
 SoTlNNvKz6qukYpUpjp8qT9iqKgDZqxFSgd55kDTSbAQeJqrVxmhaUuJMqGVEgS/HenC
 c2Iw==
X-Gm-Message-State: AAQBX9ev9UT9tWGnbtbeAQJvU2aTkL4Idsup9iRZ3+rvSyB8Gwh40alz
 8Wu8qwIA3p/S2nd0TIEGDhf41Q==
X-Google-Smtp-Source: AKy350bcNSupX6OEYfKhiTs1vHjZgiiu8jjJrG9QrYCWqX5gEvUFNR3N6R2rriY0S8DdNY5jfxF9cQ==
X-Received: by 2002:aa7:9ec1:0:b0:62d:9037:b883 with SMTP id
 r1-20020aa79ec1000000b0062d9037b883mr16971241pfq.6.1680298774661; 
 Fri, 31 Mar 2023 14:39:34 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:b714:1fce:85fa:2fc7?
 ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 d17-20020aa78e51000000b006089fb79f1esm2307038pfr.96.2023.03.31.14.39.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 14:39:34 -0700 (PDT)
Message-ID: <07f6b2a9-1f07-40f8-13f7-1fd15652e11c@linaro.org>
Date: Fri, 31 Mar 2023 14:39:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] riscv: Add support for the Zfa extension
Content-Language: en-US
To: =?UTF-8?Q?Christoph_M=c3=bcllner?= <christoph.muellner@vrull.eu>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Jeff Law <jeffreyalaw@gmail.com>, Tsukasa OI <research_trasio@irq.a4lg.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20230327080026.3266574-1-christoph.muellner@vrull.eu>
 <b02cc37d-8a51-fed3-5a93-4d9f3873b5ae@linaro.org>
 <CAEg0e7jvqcH42rR_TXZHzQjw_5+Cr-NyhuB_pUQUkLNDngxprA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAEg0e7jvqcH42rR_TXZHzQjw_5+Cr-NyhuB_pUQUkLNDngxprA@mail.gmail.com>
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
X-List-Received-Date: Fri, 31 Mar 2023 21:39:40 -0000

On 3/31/23 11:22, Christoph Müllner wrote:
> On Mon, Mar 27, 2023 at 7:18 PM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 3/27/23 01:00, Christoph Muellner wrote:
>>> +uint64_t helper_fminm_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>>> +{
>>> +    float32 frs1 = check_nanbox_s(env, rs1);
>>> +    float32 frs2 = check_nanbox_s(env, rs2);
>>> +
>>> +    if (float32_is_any_nan(frs1) || float32_is_any_nan(frs2)) {
>>> +        return float32_default_nan(&env->fp_status);
>>> +    }
>>> +
>>> +    return nanbox_s(env, float32_minimum_number(frs1, frs2, &env->fp_status));
>>> +}
>>
>> Better to set and clear fp_status->default_nan_mode around the operation.
> 
> I don't see how this can help:
> * default_nan_mode defines if the default_nan is generated or if the
> operand's NaN should be used
> * RISC-V has default_nan_mode always set to true (operations should
> return the a canonical NaN and not propagate NaN values)
> * That also does not help to eliminate the is_any_nan() tests, because
> float*_minimum_number() and float*_minnum() return the non-NaN number
> if (only) one operand is NaN
> 
> Am I missing something?

Oh goodness, I did mis-read this.

But if you need a nan when an input is a nan, then float32_min instead of 
float32_minimum_number (which goes out of its way to select the non-nan result) is the 
correct function to use.


r~

