Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mGWfl-0006xh-Vj
	for mharc-qemu-riscv@gnu.org; Wed, 18 Aug 2021 21:16:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGWfk-0006wq-11
 for qemu-riscv@nongnu.org; Wed, 18 Aug 2021 21:16:44 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:35657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGWfh-0003lV-MF
 for qemu-riscv@nongnu.org; Wed, 18 Aug 2021 21:16:43 -0400
Received: by mail-pl1-x635.google.com with SMTP id c17so2987665plz.2
 for <qemu-riscv@nongnu.org>; Wed, 18 Aug 2021 18:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=miloZzkvCmOVI43VI7AnhCRYjRCMaYNZ3zvQ9uLjHfw=;
 b=mA5cBN0r8MSyTCm4mRppq5e+d1FahTsQX6co9kxDqVxFN6sKoxmOqC35/foYgV+wRh
 puaY5vEq304tO4Pd19fF/pyaT+ZKuHNBmEZzOGVRDOnprPRs7KPEubnvoLUgVZDpxedq
 m2gQHx+Hy+PfSnkjI7LmLO60JOtBErbSMN2q75dCi54yUUj9d8E3ca4hQ4DT92xNG/1r
 m/VfgW46HJ4/KS5K4/2It8uHysNkWJ1n7e4fxXWm2jyyfrcFE/n6ftOqwlNZrB+uaRU/
 PvLzmb+6KDs9hQCJRCUyMkZPFuVGwf5MGeDed5PSRrO9d2+HXLWNTIRgPPAqsvAsdyBs
 USmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=miloZzkvCmOVI43VI7AnhCRYjRCMaYNZ3zvQ9uLjHfw=;
 b=C7c5+aC+wvTcFTVS8XmynGFJgxiLQuMH5QY3at8fm/2je10xICmyirLARkezrypCPG
 amU9Q8YLJDFniUSNr+HcO4SlLIspgEPzwca7QCYs0Ok/NP+uw+dDTCYMSP9IPrtWgxuz
 8tU8iLTdLJMip7R6lFadnwIxJnFalviEVwDncw0YxuhmA8N0IiFXvTcgUJOU60N7GdB4
 3HOuHnu+5cZoHHoLkevXA65EF7BO/AvY8eN27B/yMm37CHKMwzxpzqQYh3Y+thUPZdX9
 +O5es7VNnxL0JQpD6BTssW4It7o49Q6LWLfDGn5VHstrjbMheAaJrrDyodqwY/aZZL1E
 /phA==
X-Gm-Message-State: AOAM533b4cp/VF9hMQnVNe02B0YPF5v/AQE/sQyfIB7v1Wo/b003JM/h
 8gKdN2n8aQ1fMVVLAeEERoZm0g==
X-Google-Smtp-Source: ABdhPJwAyxOtxFRNbjqj8oAjj8+7wX+IlC1SoS1pu+UXVywIhbEGbW8uYktU5mBh0qN5h83G2EtDUg==
X-Received: by 2002:a17:902:ced0:b029:12d:4ce1:ce3a with SMTP id
 d16-20020a170902ced0b029012d4ce1ce3amr9525738plg.0.1629335799083; 
 Wed, 18 Aug 2021 18:16:39 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id b5sm980604pjq.2.2021.08.18.18.16.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 18:16:38 -0700 (PDT)
Subject: Re: [PATCH v2 04/21] target/riscv: Introduce DisasExtend and new
 helpers
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>, liuzhiwei <zhiwei_liu@c-sky.com>
References: <20210817211803.283639-1-richard.henderson@linaro.org>
 <20210817211803.283639-5-richard.henderson@linaro.org>
 <CAEUhbmXT-Hbrm6YJMuyBtuQrB3D0wt3pkQHNpPCqB8m0Ek3PFg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <17aa85ef-b5b9-0bf8-dc81-c65b88440c5b@linaro.org>
Date: Wed, 18 Aug 2021 15:16:34 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmXT-Hbrm6YJMuyBtuQrB3D0wt3pkQHNpPCqB8m0Ek3PFg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
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
X-List-Received-Date: Thu, 19 Aug 2021 01:16:44 -0000

On 8/18/21 12:58 AM, Bin Meng wrote:
>> +static void gen_set_gpr(DisasContext *ctx, int reg_num, TCGv t)
>> +{
>> +    if (reg_num != 0) {
>> +        if (ctx->w) {
>> +            tcg_gen_ext32s_tl(cpu_gpr[reg_num], t);
> 
> What about zero extension?

All of the RV64 word instructions sign-extend the result.

>>   void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
>>   {
>> -    DisasContext ctx;
>> +    DisasContext ctx = { };
> 
> Why is this change? I believe we should explicitly initialize the ctx
> in riscv_tr_init_disas_context()

I considered it easier to zero-init the whole thing here.

r~

