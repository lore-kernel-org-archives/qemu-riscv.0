Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfqBz-00035Y-KJ
	for mharc-qemu-riscv@gnu.org; Thu, 19 Nov 2020 15:06:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfqBg-0002yJ-Rq
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2020 15:05:54 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:36283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfqBV-0003aH-3H
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2020 15:05:47 -0500
Received: by mail-pf1-x42c.google.com with SMTP id a18so5540235pfl.3
 for <qemu-riscv@nongnu.org>; Thu, 19 Nov 2020 12:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Rr3KyYun0yWZZjrfv3IXWZILVlFgjI/okwl6enfSSMI=;
 b=o43dHapopcE2RJGUZonxN87iQSeM3Xf+N1lQEQ+V8+6Mh0qb9dYqpqPCm6acnuc49S
 yPWypGkqRXbffndZvpfZOQwsT2NMhWK8TV77o1xHYj1TyZWCh41y28dp3fpdRsUEsrTx
 cQ92XeaL2DioDD0zrewp17E9jnnu883DhToS3T3XD+HBDCyxplVS8pIn0/7FJhZ0a/Ad
 fLd0+hdYkR2wnIBoWKOl5KSc3Bfy1ukJylkK4Dlhd1cFkts/H1SOKNIFfzr04FwRYIgS
 poEJBA7thpGMw9WPyn6At3JlToRBg3sxan2/tfylD5BK4HsyzV+TIsY8AWyXP7jen6eY
 JWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Rr3KyYun0yWZZjrfv3IXWZILVlFgjI/okwl6enfSSMI=;
 b=F/4mfqiDU94o4hMz08j66dGYuz7jgQXqGzP5kRd9VIK1ugJm+3rTowwAKr/KRD2fN4
 F2o/ZGGJ5SjKwHNnqd/hz25PO6bt6mmgJuGD+E0XVH2QhULBSRIHsFL4tV04IqZfoQ5g
 ZqMsUyS59DKbZiC6e7kqnYZteM/5cebK5aBbjBIX3TJQvqSwLxzKANJMoBHGpc5a9LIu
 d3BFSw/JpLIoSx1/FaSyAAhRqnK8KvO5mkG6JMnDtodlnI4dhlI3hvqudHxS0Uabg5MU
 MqD6fWdrMzsIEGRcZ+Y4ygLQ1ouvyvViaA5QdbWUwxqgLr2gf3/frUgnLB7nuX+9vpK6
 /hQA==
X-Gm-Message-State: AOAM531xn9TqcKwyoN23rAu5/M7cQ8VkUz5rb9FQ+3y7Wl/BujdvwKQI
 uTma9GlBqb4LY2WYXM3BB5+yaQ==
X-Google-Smtp-Source: ABdhPJxOul1IqDoCZDtYVvM6S5nUqa5/H0JV/IvU17sbLCTIZD7efhyPBrRO8G4g5Y1/oGywdROsRw==
X-Received: by 2002:a17:90a:7ac2:: with SMTP id
 b2mr6358093pjl.226.1605816328058; 
 Thu, 19 Nov 2020 12:05:28 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id v19sm525922pgi.2.2020.11.19.12.05.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 12:05:27 -0800 (PST)
Subject: Re: [RFC 08/15] target/riscv: rvb: single-bit instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
References: <20201118083044.13992-1-frank.chang@sifive.com>
 <20201118083044.13992-9-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6f90ec2e-3862-a90d-453b-374806e00d39@linaro.org>
Date: Thu, 19 Nov 2020 12:05:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118083044.13992-9-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
X-List-Received-Date: Thu, 19 Nov 2020 20:06:00 -0000

On 11/18/20 12:29 AM, frank.chang@sifive.com wrote:
> +static void gen_sbop_shamt(TCGv ret, TCGv shamt)
> +{
> +    tcg_gen_andi_tl(ret, shamt, TARGET_LONG_BITS - 1);
> +}
> +
> +static void gen_sbop_common(TCGv ret, TCGv shamt)
> +{
> +    TCGv t;
> +    t = tcg_temp_new();

All of the places where you declare then initialize on the next line, please
merge them:

   TCGv t = tcg_temp_new();

It would be nice to share more code between the normal and *w versions.  As it
is, there's a *lot* of repetition with only TARGET_LONG_BITS vs 32 separating them.

> +    tcg_gen_not_tl(mask, mask);
> +    tcg_gen_and_tl(ret, arg1, mask);

andc.


r~

