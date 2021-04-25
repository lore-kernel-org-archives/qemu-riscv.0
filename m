Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1laoZ4-0004A9-Gc
	for mharc-qemu-riscv@gnu.org; Sun, 25 Apr 2021 19:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laoZ3-00049z-Dk
 for qemu-riscv@nongnu.org; Sun, 25 Apr 2021 19:53:25 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:33511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laoZ0-0007jq-VT
 for qemu-riscv@nongnu.org; Sun, 25 Apr 2021 19:53:25 -0400
Received: by mail-pf1-x431.google.com with SMTP id h11so6750250pfn.0
 for <qemu-riscv@nongnu.org>; Sun, 25 Apr 2021 16:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q4JCQATsxxkIpfy48Rs3s5iga118ITnK0uHNIcGHdEQ=;
 b=qegY1TQmwv0NHLcyq3LLpN1vpVzA4Uu9qQ3rjWnZOMp3GQvGXal6OVDXomGISWReWW
 /9G+MKaE3Bo8J+TEQIZcGVw7K4YCq2VsG39Gb4VakDWFGXo9lqSItFMlLdeC2JFrxBTX
 AtZe22oDd4m5xVWNllVGnLnUGvTB3FplIqNZX/vfpz5laNk0jWVlvLuU0U9Co4XZ1K00
 k0u0eGjGqBhpyhKfGyiy2X70SZM6izc5wo1sldBt5FnYsnhnBAmWR6Xeaz2FJrom0A3a
 nzfyA/fACOapY90c0mSABzXNJP0WVwhmd5IgbInj7UbcsPMsrj4HHf1cPgotgQ7oQI7z
 n+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q4JCQATsxxkIpfy48Rs3s5iga118ITnK0uHNIcGHdEQ=;
 b=oh3xifZ/ALsa0oyYdOPselg5xbTIJn/xsBuAQQDna4AWEcheI5T/unxZG4zqbNjtNe
 maM0Pi5VbZV9jt/R2kn/41EOM6wMzjsitnqoYenF8SANe4m04zxbs6awTrwqlS275GbJ
 bNbdo5LhZWHPw40tvCAlCF/vC2Z1JgV5H0C3SDWuUKq4Ah0+SN0WFYNS8kt/fIy2KbeJ
 TSzIy9Z73LJPX23+LNlSa+mtMDiS2HfSTy+oOHyxaNLhbzgJvLZPdQBMrimqNGq8cHAY
 oX3UxMHCa67A3gboK+hFh16OXu5p/OFsjSM8A4LfUEh5plqJ+f6Ejna93Yn5oLCUmkAP
 OnsQ==
X-Gm-Message-State: AOAM531Jr3CAOTOltuxrZ7q/GhN9ilETEKaCL9OPjcL5jB/MuGK8SO8I
 y1fnVAt/7DrCc2/nRhSN3k8qSg==
X-Google-Smtp-Source: ABdhPJzi6UpnKcNpFsUN46T0UGiInlfV1KErIDscfrEQ++IG11XEVM4RKa57QwR1HQGH74vpjEQkTA==
X-Received: by 2002:a63:d755:: with SMTP id w21mr14655232pgi.400.1619394797005; 
 Sun, 25 Apr 2021 16:53:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id w134sm10149017pfd.173.2021.04.25.16.53.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Apr 2021 16:53:16 -0700 (PDT)
Subject: Re: [PATCH v3 08/10] target/riscv: Consolidate RV32/64 32-bit
 instructions
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bmeng.cn@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <cover.1619234854.git.alistair.francis@wdc.com>
 <db709360e2be47d2f9c6483ab973fe4791aefa77.1619234854.git.alistair.francis@wdc.com>
 <2ea910ea-690a-bdac-bcdf-436bbe28964e@linaro.org>
 <CAKmqyKP5tuddPKiSOt1V6YyDjV+9VAM2vU=F1BvLgwXWHm=VKg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <13a345dc-4143-339e-1c7c-5f9a1cd7eac3@linaro.org>
Date: Sun, 25 Apr 2021 16:53:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKP5tuddPKiSOt1V6YyDjV+9VAM2vU=F1BvLgwXWHm=VKg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Sun, 25 Apr 2021 23:53:25 -0000

On 4/25/21 3:58 PM, Alistair Francis wrote:
> On Sun, Apr 25, 2021 at 3:08 AM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 4/23/21 8:34 PM, Alistair Francis wrote:
>>> --- a/target/riscv/translate.c
>>> +++ b/target/riscv/translate.c
>>> @@ -74,8 +74,6 @@ static inline bool has_ext(DisasContext *ctx, uint32_t ext)
>>>
>>>    #ifdef TARGET_RISCV32
>>>    # define is_32bit(ctx)  true
>>> -#elif defined(CONFIG_USER_ONLY)
>>> -# define is_32bit(ctx)  false
>>>    #else
>>>    static inline bool is_32bit(DisasContext *ctx)
>>>    {
>>
>> Rebase error?
> 
> This is required to avoid warnings/errors before this commit as
> `is_32bit()` isn't called until this patch.

If !defined(TARGET_RISCV32) && defined(CONFIG_USER_ONLY), then is_32bit *is* 
false.  This isn't system mode and it can't be changed.


r~

