Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdyH9-0008TX-Bq
	for mharc-qemu-riscv@gnu.org; Fri, 22 Oct 2021 13:24:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdyH7-0008RS-KF
 for qemu-riscv@nongnu.org; Fri, 22 Oct 2021 13:24:13 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:37413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdyH4-00042l-DI
 for qemu-riscv@nongnu.org; Fri, 22 Oct 2021 13:24:13 -0400
Received: by mail-pg1-x52c.google.com with SMTP id s136so3933884pgs.4
 for <qemu-riscv@nongnu.org>; Fri, 22 Oct 2021 10:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ztn6u1xFqbdJ+65vWkEU+PC+ZdqmyRK/ANoFOwuoY94=;
 b=jQE3fpwfUHkim8E3gql/bO1JmRaKDvbdBtL1AJR+/KHaU7D77zNYM1H31W5rAJHspK
 EGo7UD+xwPlwjENrep1aqoAHF82l/mkV4qnSZxnZxf/tDItxSJBv3HmbLqljl3TgT2pA
 J3xyX/3JU5RyvCvruYcNGwnHpzeqg7+conKmQq4t9IjerSjjeAEJGsbFjKm5PPJBff2F
 tjjQiuPsDR6ZM/pKkd5EV9DIh2TahRgOJ9+h/rfwupn9As8Kf+6o2uD53D7IsYykqCLj
 WKKH6gAjxlKyL9VRBEFs1j/maPhwxbx8QvMhrJx7PeJ47RB1h+at6BgwOcqMa/XGQBtE
 kj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ztn6u1xFqbdJ+65vWkEU+PC+ZdqmyRK/ANoFOwuoY94=;
 b=Sgx6OZYHbEzgVwREzt1QU4um7gTGy70Y2mRztZ49iOMI0b8aOKDcICsApoFi7vRclh
 p2u2oXUUkP9kSyT1UIGAxeKBAoswK9CCe4cbZoDLrO6xNioQIGYT4ACEsOEfJT6S4Dcw
 VGoyZtF5Z9kBKnBxcWs4god1bBa0JnHOsL3kNxidf8gdwx2HdX1DDlVmq6iGH3AtDLMi
 pPElYqbRZBpmqY3cJHmyFA+1SJMrpElIqivMlJnfGW8vYihgefj2o78N43txVia0Pg3o
 0QeP9RaQcSZRJJCeC/N1h1FW3bGciCTllkFN5hlnrqXr9mmVowWQkkbgDRs+LPc77mFZ
 eQHA==
X-Gm-Message-State: AOAM531mkbBL4DQ2Ou0M6/rpg+4NWaDAUC4NOJpootCePAICXOgGWi6M
 xxQYvXzxdL//gQvoP52LHEh+4g==
X-Google-Smtp-Source: ABdhPJwU8fG5UzX2pjzVn+tcL3zmw35v7e/86o9snOyyPtHzK8cm0zBZ9tJTcUaFVGV8LfGE/LPj8g==
X-Received: by 2002:a65:6643:: with SMTP id z3mr822353pgv.16.1634923448956;
 Fri, 22 Oct 2021 10:24:08 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id f21sm3221255pfc.89.2021.10.22.10.24.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 10:24:08 -0700 (PDT)
Subject: Re: [RFC PATCH v1 2/2] Enable custom instruction suport for Andes A25
 and AX25 CPU model
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Ruinland ChuanTzu Tsai <ruinland@andestech.com>
Cc: ycliang@andestech.com, qemu-riscv@nongnu.org, alankao@andestech.com,
 wangjunqiang@iscas.ac.cn, dylan@andestech.com, alistair23@gmail.com,
 bmeng.cn@gmail.com, qemu-devel@nongnu.org
References: <20211021151136.721746-1-ruinland@andestech.com>
 <20211021151136.721746-2-ruinland@andestech.com>
 <00563f20-1867-6a4e-e9ea-a33ff85f058e@linaro.org>
 <YXJ69gaslRMnOSHm@ruinland-x1c> <875ytptgmy.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <45c316bf-df6e-5661-e0b4-87e75ee206a2@linaro.org>
Date: Fri, 22 Oct 2021 10:24:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <875ytptgmy.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.742,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 22 Oct 2021 17:24:13 -0000

On 10/22/21 4:52 AM, Alex Bennée wrote:
> 
> Ruinland ChuanTzu Tsai <ruinland@andestech.com> writes:
> 
>> On Thu, Oct 21, 2021 at 12:17:47PM -0700, Richard Henderson wrote:
>>> On 10/21/21 8:11 AM, Ruinland Chuan-Tzu Tsai wrote:
>>>> In this patch, we demonstrate how Andes Performance Extension(c) insn :
>>>> bfos and bfoz could be used with Andes CoDense : exec.it.
>>>>
> <snip>
>>>> +static int andes_v5_gen_codense_exec_it(CPURISCVState *env, DisasContext *ctx, arg_execit *a)
>>>> +{
>>>> +    uint32_t insn;
>>>> +    uint32_t imm_ex10 = a->imm_codense;
>>>> +    target_ulong uitb_val = 0;
>>>> +    riscv_csrrw(env, 0x800, &uitb_val, 0, 0);
>>>
>>> This won't work -- you can't access env during translation.  So all this
>>> faff around passing env through HartState is for naught.
>>
>> Sorry, please elaborate me a little bit more.
> 
> When dealing with translation you need to separate the translation phase
> from the execution phase. CPUEnv is the current run time state of the
> vCPU so the value that might be stored in it when you do translation
> could very well be different when the translation runs (or runs again).
> 
> The correct way to deal with this is by the use of translation flags...

Yes translation flags will be important for this, but first, the cpu state which you are 
reading here at translation time, which you are baking into this TranslationBlock 
forevermore, is (1) the uitb csr value and (2) the contents of the memory at the final 
address.

Both of these things might vary in between translation of the exec_it instruction and 
execution of the TranslationBlock.  At which point the translation you did earlier is wrong.

Avoiding these kinds of mistakes is exactly why we have *not* provided env to you at this 
point in translation.  Which is why all of the changes you did to recover env are also wrong.


r~

