Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pQ3ag-0004oq-A5
	for mharc-qemu-riscv@gnu.org; Thu, 09 Feb 2023 04:51:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQ3af-0004ob-FO
 for qemu-riscv@nongnu.org; Thu, 09 Feb 2023 04:51:41 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQ3ac-0001fK-F1
 for qemu-riscv@nongnu.org; Thu, 09 Feb 2023 04:51:40 -0500
Received: by mail-oi1-x22e.google.com with SMTP id 20so1188624oix.5
 for <qemu-riscv@nongnu.org>; Thu, 09 Feb 2023 01:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ue2ZZcDSQs+H906Kb+OyhYBl32Zw+rvGJJ3KlqJX77Q=;
 b=j4xh508AF8sGZ94slpGsVkk9QmMGsypjxFucv46r5/bJ2WmI7tX6LGsWJ+SG6euRch
 1zH9nFJ2jxePouxfTXs7NaeF82G0Fj9bZLXvbOddRtLD263lVjlChjhw8faBma0oqG0t
 nONmBTW0S6rc9cWmmL0kpWNp2DAY4RFiOVpnWRrHPVOwecCIvpEPQn/bV6kYNm9t9hAv
 yOCCdzc4rjnkbKRIjQ4nmT3SfktBxDfC9bLXkPc/BUW9bBq0rGIuKLfSw4rdsGebabFa
 qu0bN9OfL5kpUeQtL4x9cMJdUCy2jhawi66NC/dHc86BrKhHT9Zef+NxWRUIaw6AlLhN
 cjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ue2ZZcDSQs+H906Kb+OyhYBl32Zw+rvGJJ3KlqJX77Q=;
 b=fzEt5E0FPAmJ/63jhUKl0OIn3wXT8mmYa9wWpAIqQpIQY9mU4wRfrSMymGEFXDBO9/
 fX4AFMwQGsywQaiRTTvtOLbWSlDKik0uzfWctGIytv5Sidq7tlsWg4YT7co7l0s48/8O
 bwNNbRysAIFpBU9op7OpNOZvxsXfsWSOaDa+6lsXnd1toI8rISIOSR3wWuwuUo2R50hF
 88GPFEwMfr3+6eko31i3QoU2iCOdhlyLjZZBigQqYp9x61VuCRz55pWVT8VzwMjFEFYx
 um5makS/1ce4WmS1Ysa0pqVH1k5A+KJJDtYDonSYzl2VfEa53Q5DJlwYhgsnN38Rfu32
 PFBA==
X-Gm-Message-State: AO0yUKX912qvPwgvXnp+BCxW+od8893pCSqc6nDr9SFHRyHrCNUn4YlQ
 V08UaD8KMKtwFv0vFwzLLXR+lQ==
X-Google-Smtp-Source: AK7set/fms9cMmOpuVPyvXUQD4fISs8V15BrubXAHNw+z5oXO4uVnG2+HNiFhJaaq9hK01cSoDj70A==
X-Received: by 2002:a54:470a:0:b0:364:eafd:2697 with SMTP id
 k10-20020a54470a000000b00364eafd2697mr4024706oik.58.1675936297007; 
 Thu, 09 Feb 2023 01:51:37 -0800 (PST)
Received: from [192.168.68.107] ([191.19.125.138])
 by smtp.gmail.com with ESMTPSA id
 q203-20020acad9d4000000b0037adc5702d4sm565583oig.38.2023.02.09.01.51.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 01:51:36 -0800 (PST)
Message-ID: <67782c1b-7195-f5f0-4839-0cbacebc43f9@ventanamicro.com>
Date: Thu, 9 Feb 2023 06:51:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] target/riscv: Smepmp: Skip applying default rules when
 address matches
Content-Language: en-US
To: Himanshu Chauhan <hchauhan@ventanamicro.com>, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20230209055206.229392-1-hchauhan@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230209055206.229392-1-hchauhan@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 09 Feb 2023 09:51:41 -0000



On 2/9/23 02:52, Himanshu Chauhan wrote:
> When MSECCFG.MML is set, after checking the address range in PMP if the
> asked permissions are not same as programmed in PMP, the default
> permissions are applied. This should only be the case when there
> is no matching address is found.
> 
> This patch skips applying default rules when matching address range
> is found. It returns the index of the match PMP entry.
> 
> fixes: 824cac681c3 (target/riscv: Fix PMP propagation for tlb)

Nit: tag starts with capital "F":

Fixes: 824cac681c3 (target/riscv: Fix PMP propagation for tlb)

> 
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/pmp.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index d85ad07caa..0dfdb35828 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -446,9 +446,12 @@ int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>                   }
>               }
>   
> -            if ((privs & *allowed_privs) == privs) {
> -                ret = i;
> -            }
> +            /*
> +             * If matching address range was found, the protection bits
> +             * defined with PMP must be used. We shouldn't fallback on
> +             * finding default privileges.
> +             */
> +            ret = i;
>               break;
>           }
>       }

