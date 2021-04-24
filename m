Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1laLlT-000474-SY
	for mharc-qemu-riscv@gnu.org; Sat, 24 Apr 2021 13:08:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laLlS-00046n-52
 for qemu-riscv@nongnu.org; Sat, 24 Apr 2021 13:08:18 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:36540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laLlP-0003SN-N3
 for qemu-riscv@nongnu.org; Sat, 24 Apr 2021 13:08:17 -0400
Received: by mail-pg1-x530.google.com with SMTP id j7so27890073pgi.3
 for <qemu-riscv@nongnu.org>; Sat, 24 Apr 2021 10:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hNF5OxEPE4tuzlqPGkY4f3+ZzRjAxr7dpZTNhwje4Ms=;
 b=J8ELAfL9sJxR4vI7GVy3A9QG7vj98iTWzuk0/XztvGjdvmdGH2/BHg1qxtUZgJrw+z
 FqKq38Us/LG1EUo7NT/m1Quyb4w0Ra6RpD6AhDciJLMhuh+xLTgJT+SJpAYYKtggehCx
 mLCqisFKPgPxABsavgS0MFSAaA8OMrtJcqTXvh9CPJEuGipacZaqcoW1upSCanokGHqm
 RLrYHTc0v7ripkyDbt+hZHWUYLCcCtNwaiaC5vbAVEWlaQ4ah+8fpXXE2V5n2lC4xp/F
 QBg9jzwzSRDtI/3Hzmy0gu/8S61Xv74S5Er8J7ZTxIVOJfY+dIp0k9Axvw0Ooza53UIE
 29nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hNF5OxEPE4tuzlqPGkY4f3+ZzRjAxr7dpZTNhwje4Ms=;
 b=jydSiCRyHUY2TTjT/Bf4RLTXvM/VZsFyKYlUsaQX9vnUrYnf/b3RztOFYAyMD1dohh
 aq9OaO3yoQsq9H0T2tlUq3pOrlZdx2MICX1monN7oadRKzxSVI8srxkS94ErlOOTkb7k
 kXuwXUvyZiEL4phZwnxnaCCWcWzKlWr//o1IGoV4kp+td5BobtvX0oE9ua/fpQ9BtMDm
 f7XPpM9wtFjPpNI0OBAaYk0afnBIvyfHOcZszd75SWqh0m68kbcdM0Lt8mDZkmzxzsA2
 2/cEN/Vn1kvY8MOA1xfZ56mBKsWTgagQeqRPjD6TXPBwowZ9jX42v/Nd7HQkUMXVfpUb
 Z13A==
X-Gm-Message-State: AOAM532PRkOWB8gGV4JEUznDxR4Q4aQELCD8iSfzCj7twDoOrhw6imPT
 SSdP6DdXparaOLdIBx+cQjeomA==
X-Google-Smtp-Source: ABdhPJxnfS6buSTwWG0dm+nKNgMCL2AbZsqS153Ltk7S8bM60ooiVym8Nm5yzFJY0wBy6dmnWJPJ9w==
X-Received: by 2002:a63:d04b:: with SMTP id s11mr9584293pgi.92.1619284093608; 
 Sat, 24 Apr 2021 10:08:13 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id u7sm7631985pjx.8.2021.04.24.10.08.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 10:08:13 -0700 (PDT)
Subject: Re: [PATCH v3 08/10] target/riscv: Consolidate RV32/64 32-bit
 instructions
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1619234854.git.alistair.francis@wdc.com>
 <db709360e2be47d2f9c6483ab973fe4791aefa77.1619234854.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2ea910ea-690a-bdac-bcdf-436bbe28964e@linaro.org>
Date: Sat, 24 Apr 2021 10:08:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <db709360e2be47d2f9c6483ab973fe4791aefa77.1619234854.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
X-List-Received-Date: Sat, 24 Apr 2021 17:08:18 -0000

On 4/23/21 8:34 PM, Alistair Francis wrote:
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -74,8 +74,6 @@ static inline bool has_ext(DisasContext *ctx, uint32_t ext)
>   
>   #ifdef TARGET_RISCV32
>   # define is_32bit(ctx)  true
> -#elif defined(CONFIG_USER_ONLY)
> -# define is_32bit(ctx)  false
>   #else
>   static inline bool is_32bit(DisasContext *ctx)
>   {

Rebase error?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

