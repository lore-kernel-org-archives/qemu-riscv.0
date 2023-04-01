Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1piQQi-0003sy-Qr
	for mharc-qemu-riscv@gnu.org; Fri, 31 Mar 2023 21:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piQQh-0003sX-2h
 for qemu-riscv@nongnu.org; Fri, 31 Mar 2023 21:53:19 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piQQf-0002XO-7b
 for qemu-riscv@nongnu.org; Fri, 31 Mar 2023 21:53:18 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 h12-20020a17090aea8c00b0023d1311fab3so25302658pjz.1
 for <qemu-riscv@nongnu.org>; Fri, 31 Mar 2023 18:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680313996;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dvQdYQm60kdC0woncVYX8KkpM+a1FEo8clZV8tamiek=;
 b=W7qGU3nqladuZg7uq/xAJai+yupv+1bcNb9mW9B33aD1WgXH+LnyOJcm8telOrS0wZ
 rAG3LcQq7k3jOUT4Fv6/F6CQqSlP2ZdTquNQIaxgfcFCf7rnq+KOy8Rdr+x+Z5LbPF73
 VHv4+TtPwXPwGn/mLy2oEres7dhMk82EZCCVY6vRqFd0XMZDjSvcIu5bz7bzdix22MVr
 kVDmLCOANyT2elBWNW7NkAJCWYZfvPC5wjjtVM1h4FO9kWKXgayKF9zVvA8DxjnNOzb7
 zC4CC0CGceAB8q7h1+FJdqQn8VM6uirOzoNfcFa6QjN4ZzfOuuovoq4E5W5NltP8UPR1
 9NPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680313996;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dvQdYQm60kdC0woncVYX8KkpM+a1FEo8clZV8tamiek=;
 b=bteTvS6myALJinTEcXJfQwT1yCOcZnGS4oJl4b6B9H9Xb5GjhehKRAZAZ8hReDCf6Y
 Cn1n4NDdd8Gpfew1w+bY0m6AYl09hmqqwukSwj6w/VtEJEwnJoa/PJ/w09CYMhlVEOse
 hQNlqOr7QLLRh17/GLlEQMeEoQrdl4Vz4JPUQtuMCAdSBhYuxBVF0rPQi3wVgINaeXHH
 kAZd/EGOQ7hnY93SGcivqr1MTVb4VKF3tF4WfK+OUDcvWmEcSt39ypqmCkcEwqsr5hUb
 1MDgJqvk0wOXmv3+c6OVi8sRZiJO7ITttj2ZxChhCXr9oHvtwJvj95du+7ZXYnbrzoD5
 wkiw==
X-Gm-Message-State: AAQBX9fRbGXosufesHYNBbuLa+Cc22L47xf9zUstLBT1JHwzMf09XQGK
 ZTxXKAH9fVYn9Pqz4dKlsSP3/A==
X-Google-Smtp-Source: AKy350beTUHI4qGg8TEJUFLfoYYLcjmzOqlcLsq85P6FANqCqBh7Hk+5MwO3VmfYwocXkLMkS66RVQ==
X-Received: by 2002:a17:902:daca:b0:19f:3d59:e0ac with SMTP id
 q10-20020a170902daca00b0019f3d59e0acmr35948865plx.44.1680313995849; 
 Fri, 31 Mar 2023 18:53:15 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:b714:1fce:85fa:2fc7?
 ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 x6-20020a170902ea8600b0019aa5e0aadesm2185463plb.110.2023.03.31.18.53.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 18:53:15 -0700 (PDT)
Message-ID: <a7ad22bf-5b21-1941-0317-e2228cfd53f5@linaro.org>
Date: Fri, 31 Mar 2023 18:53:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 7/8] target/riscv: Enable PC-relative translation in
 system mode
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230331150609.114401-1-liweiwei@iscas.ac.cn>
 <20230331150609.114401-8-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230331150609.114401-8-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
X-List-Received-Date: Sat, 01 Apr 2023 01:53:19 -0000

On 3/31/23 08:06, Weiwei Li wrote:
> The existence of CF_PCREL can improve performance with the guest
> kernel's address space randomization.  Each guest process maps
> libc.so (et al) at a different virtual address, and this allows
> those translations to be shared.
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> Reviewed-by: LIU Zhiwei<zhiwei_liu@linux.alibaba.com>
> ---
>   target/riscv/cpu.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

