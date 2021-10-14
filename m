Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mb2pY-00036S-TI
	for mharc-qemu-riscv@gnu.org; Thu, 14 Oct 2021 11:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mb2pX-00034c-E6
 for qemu-riscv@nongnu.org; Thu, 14 Oct 2021 11:39:39 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:43823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mb2pU-0001Ys-QR
 for qemu-riscv@nongnu.org; Thu, 14 Oct 2021 11:39:39 -0400
Received: by mail-pl1-x629.google.com with SMTP id y1so4428806plk.10
 for <qemu-riscv@nongnu.org>; Thu, 14 Oct 2021 08:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SgitbXgzY9ah7iLRULN8e9Eu0gKVxrlOCmd1cV+HGKI=;
 b=Z+pgTwboLcKN736RGQkOGkd6rVamT8K1fP+/4RtHWW8v+P3kvZ8z48mnnOPjyj4Yw2
 oJjtKVfyxm3cNMgELFxDWflPBXIloqMagQcytjqQjuDmstjYyLxXzVphQGh7P6BK/TKN
 CLe/uenZWGxkTZFpHUJE63W80P4BlPB8Q5/SJ0NG70ZIVmK+1ujYPVIIuxF7ktSxlO7b
 jnituNWKj7/Q07tLrkbE8P0xv9xAzxpbXbHGef8TJMy9B2xbLeoDbDYJsOnEUN2opc96
 dqRfgjXF/YlPoNB1vI0hjFRe30CTR04sL3upTwFqxq/AucUwbUUrzg5traJqzDTTLO/H
 ZbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SgitbXgzY9ah7iLRULN8e9Eu0gKVxrlOCmd1cV+HGKI=;
 b=gLAd6sNketxzc2/IAPJeakga7rmBnIGtsDkq5GVNGf3qPF262Zl28euV5KBRdFgIV/
 0UI2hRz5uEaIpt+EElzg05lj3JfSCUe+qjDY5QLFyPbVK++vghfDXSQd5pnqf+t+Dysl
 U0LTh25i0lRdlpLqL+8VRvrBjfODfsRFlwWWLB6PIrYI+F7Gt9Fm7GqdSqjgUguDXTqJ
 KJokd7XmlSr1W2cKNsyGs+Fj9Asf3kZ3Wjq5OqDbn8RuWYqtNcb4Dh3KJTU6QyYZh6mH
 y8NhX3lAtNarhd/1+TdyzxVExTBMQTFbThdVt8sFss60+WhHjD/U6hNFhlMS3Y8Aya2y
 PuPQ==
X-Gm-Message-State: AOAM532G0knS92+AVxZVGePOjjpi1Hv/vPYhXaXGih+2XU5b293g98dc
 d9HWdZc1DQYViXiKTbyTKVELDA==
X-Google-Smtp-Source: ABdhPJwL9MYtBqV/1Ks+kFra0VprgifRMV4Km3ab/gKAbpNaV9Dkk5O1h5+QQAUN95ERg/7BrhCp+A==
X-Received: by 2002:a17:902:8f90:b0:13e:a44e:2d3c with SMTP id
 z16-20020a1709028f9000b0013ea44e2d3cmr5694542plo.85.1634225975207; 
 Thu, 14 Oct 2021 08:39:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id a20sm2726621pfn.136.2021.10.14.08.39.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 08:39:34 -0700 (PDT)
Subject: Re: [PATCH v2 09/13] target/riscv: Replace DisasContext.w with
 DisasContext.ol
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 fabien.portas@grenoble-inp.org
References: <20211013205104.1031679-1-richard.henderson@linaro.org>
 <20211013205104.1031679-10-richard.henderson@linaro.org>
 <bb08b1eb-ab48-165a-ed49-72a9bf22fd75@c-sky.com>
 <420e773b-ca49-9130-8497-971269f6929c@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4386f5cf-71f8-f90c-3cd7-14c8e12c62b2@linaro.org>
Date: Thu, 14 Oct 2021 08:39:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <420e773b-ca49-9130-8497-971269f6929c@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Thu, 14 Oct 2021 15:39:39 -0000

On 10/14/21 1:57 AM, Frédéric Pétrot wrote:
>>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>>> index 5724a62bb0..6ab5c6aa58 100644
>>> --- a/target/riscv/translate.c
>>> +++ b/target/riscv/translate.c
>>> @@ -67,7 +67,7 @@ typedef struct DisasContext {
>>>           to any system register, which includes CSR_FRM, so we do not have
>>>           to reset this known value.  */
>>>        int frm;
>>> -    bool w;
>>> +    RISCVMXL ol;
>>
>> Why not directly use the xl?
> 
>    Hi Zhiwei,
> 
>    I am not speaking for Richard, but my understanding is that 'ol' is linked to
>    the instruction being translated, suffixed by 'w' in rv64 and 'w' and 'd' in
>    rv128, while 'xl' is the value in mstatus (or misa) depending on the register
>    size of the current execution (mxl, sxl, uxl).

Correct.


r~

