Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pw1Eq-0004zO-67
	for mharc-qemu-riscv@gnu.org; Mon, 08 May 2023 09:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pw1Eo-0004yv-2R
 for qemu-riscv@nongnu.org; Mon, 08 May 2023 09:49:14 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pw1Em-0003Gd-7O
 for qemu-riscv@nongnu.org; Mon, 08 May 2023 09:49:13 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3063b5f32aaso2897515f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 08 May 2023 06:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683553750; x=1686145750;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IGgQr3+pVtSwHz+pJNHOxqkBexjKhgxUvpEkUbe6oCI=;
 b=Y0CtSxBmSBs9XFGh9hsyHgGSvYkjzWBn+R7+I1wbhlF/xlBYnoV9EkZxmvbCLl28j4
 K/lj7x70GOzYuzl2//YMPxI9+MZs6y8scAYHz1GN9LktkPkhIy5msrPO6q9gpmtp9q2G
 Ffk4lUlVLZoHvSye7JWnYGe5YXIXpEyx2ONi40ZO1tvrHJ6EGD/uJfUB70j6jFZ/UZxb
 7DtOdnq/7UbywVNlTmZxQu1Sdq863LmTM+5ZTp7hwPG+vYu9pucnR4mijL9R059gbZmu
 LCUzLKpdytWmn44Oo1ddb3QqkJTXqI5yVZfDAvki2k7rYSpBBt03er8Xra9mYf2Pmyys
 hzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683553750; x=1686145750;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IGgQr3+pVtSwHz+pJNHOxqkBexjKhgxUvpEkUbe6oCI=;
 b=B6GBJDfWbF2ljX8jK+U8bZFGjeoly8sNJQReg0svRrpjv39EULeOn+ZzoxOV9uEF/d
 yZ7CIBcZ3OfscMaj4L+dVlZa2Mm+sVyrmo7zKAHaVB4fSvqpq3iOG9XxaFPM2EQzlxsz
 LfCaQQTH6IcbQ9Ino8N8+nCSlvikwLJVtlEyd8cNcLUKcyvOko8formZE5phMppV4Qg2
 d0Tu0qrExJfb+NGGjPjIlzjHlcHKNQ6Cf9AW8YMhzgcLFyvnMVm9YB3PWyt34qY6bB34
 hiHRM7HJbz8v72nNT8LLGgiDugsNTNlJuWY3nsjdnA99XZ1QxiI2BIyGn7iXK4yrJSCs
 PHWg==
X-Gm-Message-State: AC+VfDzQa0G/RZdgDpMc9QCu4mJMuKmZg7XUjRsRRlOPSJirZFM0M925
 E7uu23ISTs4xYZ3+z2zDzx7ZKw==
X-Google-Smtp-Source: ACHHUZ48VC1UjjzhT/XIek4hQkGk9toruhiQlxHIQmhRX6qvKehTVa21FoMV/uzG9ULwMRQEkj6nWw==
X-Received: by 2002:a5d:46cc:0:b0:307:1bba:ea61 with SMTP id
 g12-20020a5d46cc000000b003071bbaea61mr7511997wrs.44.1683553750427; 
 Mon, 08 May 2023 06:49:10 -0700 (PDT)
Received: from [10.248.102.233] (5d600b65.skybroadband.com. [93.96.11.101])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a5d4104000000b00304832cd960sm11279977wrp.10.2023.05.08.06.49.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 06:49:09 -0700 (PDT)
Message-ID: <3c37f8de-7d16-01f8-345f-67ff81ae0089@linaro.org>
Date: Mon, 8 May 2023 14:48:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 15/57] accel/tcg: Use have_atomic16 in
 ldst_atomicity.c.inc
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-16-richard.henderson@linaro.org>
 <CAFEAcA-qe+5+eDdjFUxrOqE4URwsBYdN7Q1_BLbAusGDnaudGw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-qe+5+eDdjFUxrOqE4URwsBYdN7Q1_BLbAusGDnaudGw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.802,
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
X-List-Received-Date: Mon, 08 May 2023 13:49:14 -0000

On 5/5/23 11:37, Peter Maydell wrote:
> On Wed, 3 May 2023 at 08:08, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Hosts using Intel and AMD AVX cpus are quite common.
>> Add fast paths through ldst_atomicity using this.
>>
>> Only enable with CONFIG_INT128; some older clang versions do not
>> support __int128_t, and the inline assembly won't work on structures.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   accel/tcg/ldst_atomicity.c.inc | 76 +++++++++++++++++++++++++++-------
>>   1 file changed, 60 insertions(+), 16 deletions(-)
> 
> Inline x86 asm in a bit of generic code seems rather awkward.
> Ideally the compiler should be doing this for us; failing
> that can we at least abstract out the operations to a
> set of functions that we can provide (or not provide)
> implementations of?

This was the best I could come up with, because of the fall through into other generic 
code.  Specific suggestions welcome.


r~


