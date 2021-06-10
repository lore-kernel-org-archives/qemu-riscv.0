Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrQWU-0000IH-To
	for mharc-qemu-riscv@gnu.org; Thu, 10 Jun 2021 15:39:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrQWQ-0000Gq-IS
 for qemu-riscv@nongnu.org; Thu, 10 Jun 2021 15:39:22 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:36531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrQWO-0008Gq-Ff
 for qemu-riscv@nongnu.org; Thu, 10 Jun 2021 15:39:22 -0400
Received: by mail-pl1-x634.google.com with SMTP id x10so1599558plg.3
 for <qemu-riscv@nongnu.org>; Thu, 10 Jun 2021 12:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mGAbPZiAGC/+KNfJETYxq9z5Q4Joi59lq/F85Jkr9TA=;
 b=LuqwLSq2ZwKB9PxSHyfaQQuWvMabsG/EBBAIHT1dJywl8EwlCBPBKhNz4NfOReEcdd
 kFlqvCMYww52wYl2B28IMfIZ/b0eQcG3u1Xo454O4rcGCXj/Xy0uiHeNDPdHoFwrzU+6
 V+IM/mZ8m27yFgislDVs5nHUVKqYl+P/8SoZHwuQqDt0qfBWmkT1024gi/AyhdsuFWW4
 ldi0s0Qoox6dyAQd6NJRcmUNCgwp1JET15BE3GduQ5NwK9b0HY2ik2dLnsnyJMjRFsAL
 4F3VQ02kJ7HI+szK4ITqTliIM4qZQnVPSgukIWo5Py4SBI+0WMyxRCumjojIcSPqyI+K
 F3Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mGAbPZiAGC/+KNfJETYxq9z5Q4Joi59lq/F85Jkr9TA=;
 b=jvRnM4YVsNka8m3al7k3IP4ENhHCgt0T1emVuV5tObVPMABjpfmhjXFtVe100yFsC2
 WlU5h+PWN4GZgL3Hn8vcET3vZwE7Skdh+rgxqUcQIeQLtlvc6x3NSJry9yXThZ3q/IUg
 OLuFPC5crrrUHttPEsoCyebS56gY0TrCt4waRd17HBPN4FH4Fo9VjgvcRWY04HwcY/lx
 0j6dhIYJQSbPhRwQQ1lniALQ528bApggz21yyq4XgM/ojMUFqopmn7AgigIQ7kDYydMI
 BczhlOO0WSguPXEeHZILcuzJLKB3dvUsYoRw160gvAvYXnFLk4LfNF16YYh7RMCQKrg3
 nt8g==
X-Gm-Message-State: AOAM531ZJMfV+72aF3GtIfX7PdEoeTrQDfAg4gbaD4otIN4xIyqAHbhj
 XcB43RW3wTZLYACJ+ydn/xoPIA==
X-Google-Smtp-Source: ABdhPJyYmKgcIDVz4uRb64iTRMqY2GzQUe2dMAVFjVtJ2GP1e8AWxiWhnFHMer0cMZAbvpr+L7ig5Q==
X-Received: by 2002:a17:90b:257:: with SMTP id
 fz23mr5170466pjb.140.1623353959075; 
 Thu, 10 Jun 2021 12:39:19 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 h12sm3472852pgn.54.2021.06.10.12.39.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 12:39:18 -0700 (PDT)
Subject: Re: [PATCH v2 04/37] target/riscv: 8-bit Addition & Subtraction
 Instruction
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 Palmer Dabbelt <palmerdabbelt@google.com>
References: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
 <20210610075908.3305506-5-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cdb22947-9ca7-9353-b189-a70a94d7c7ab@linaro.org>
Date: Thu, 10 Jun 2021 12:39:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210610075908.3305506-5-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
X-List-Received-Date: Thu, 10 Jun 2021 19:39:22 -0000

On 6/10/21 12:58 AM, LIU Zhiwei wrote:
>   include/tcg/tcg-op-gvec.h               |  6 ++
>   tcg/tcg-op-gvec.c                       | 47 ++++++++++++++++

Likewise, should be split from the larger patch.

> +static void gen_addv_mask_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b, TCGv_i32 m)
> +{
> +    TCGv_i32 t1 = tcg_temp_new_i32();
> +    TCGv_i32 t2 = tcg_temp_new_i32();
> +    TCGv_i32 t3 = tcg_temp_new_i32();
> +
> +    tcg_gen_andc_i32(t1, a, m);
> +    tcg_gen_andc_i32(t2, b, m);
> +    tcg_gen_xor_i32(t3, a, b);
> +    tcg_gen_add_i32(d, t1, t2);
> +    tcg_gen_and_i32(t3, t3, m);
> +    tcg_gen_xor_i32(d, d, t3);
> +
> +    tcg_temp_free_i32(t1);
> +    tcg_temp_free_i32(t2);
> +    tcg_temp_free_i32(t3);
> +}
> +
> +void tcg_gen_vec_add8_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
> +{
> +    TCGv_i32 m = tcg_constant_i32((int32_t)dup_const(MO_8, 0x80));
> +    gen_addv_mask_i32(d, a, b, m);
> +}

There will only ever be one use; we might as well merge them.
The cast is unnecessary.


r~

