Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmfqp-0004db-TR
	for mharc-qemu-riscv@gnu.org; Wed, 12 Apr 2023 15:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pmfqn-0004aX-UJ; Wed, 12 Apr 2023 15:09:49 -0400
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pmfqm-0007q2-6p; Wed, 12 Apr 2023 15:09:49 -0400
Received: by mail-oo1-xc33.google.com with SMTP id
 g26-20020a4adc9a000000b0053b9059edd5so1894675oou.3; 
 Wed, 12 Apr 2023 12:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681326585; x=1683918585;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=utAOF5zZ6rrfXlL46IwaxiFUmBfGfm5M0Zg0s4mqZlQ=;
 b=prcxXBZSBmQsW0IPza879YKLaX1Ki5Btj+LP7+bRGg2Y6ZcNwGKUFjdCEioyIup4gv
 k0+n78km6ge90eqg8PTxH/0Pb4q7LZQ5c9zkFTy/cgldITMx0SbUvI89lKFML+ctuQiX
 BW9gF4rjzCuux/35EVRj1emVR1V1gxm7vWPuzVvybJIbh4GpxsZQvYX8gemd+lhkqYSU
 BXOLzPKfWrzkGkI/bu8vR5NxVT7yFsQtn+33js2gOm4ncTnizfma8TjpleR4fcqmf90u
 T06s97Va/9ByccpeM+PmTxcWeSR5W0wwjQyckeP75ipTSds791icTdN6a0c/Uwes1nln
 M55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681326585; x=1683918585;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=utAOF5zZ6rrfXlL46IwaxiFUmBfGfm5M0Zg0s4mqZlQ=;
 b=Tsw096n7X/X1UMQzZZLsWVnmR7xoqxjCfS/ddIteFT+4JX0YfnIHzyYxStFQxlJm2h
 7RN+YLWjV25vdxPYm4kgvuu3Yyz25bRzKFNUli21gYwju6owVPPOaW4d4jjshEHPn8W4
 xNT9Tq40XrJORC+NmttJtximusyDjf+dwbjrRUCOyodc0Et60IPmPcUS5pJmN2xybcxu
 RXFeUXO7F6VZCYTn8H5ovPvptwdI7N5bXdx8WjmkmtyMokKy9res2CxTxbc+YbIp5AS8
 rAByKalUltriWw1KSq8YLNQmCNjQOoe9CPYCdYaPagzbMadi6ISd+ogfloaaswciFRRv
 TYfw==
X-Gm-Message-State: AAQBX9deqNLZR/LY/yHYcH/Zi2eDNjjDWqUkX/XIISHiMdQBtni3cXEs
 ztSBwmJ8A6VepqBOnL3wf0E=
X-Google-Smtp-Source: AKy350Zsu36J0Nt+cFbf6cdyByKT1bLohY42ThbGm88bweNdZ0IcmvUIlmc72296hsToMFP1jG9hQg==
X-Received: by 2002:a4a:520c:0:b0:53e:5644:95c6 with SMTP id
 d12-20020a4a520c000000b0053e564495c6mr3440698oob.3.1681326585478; 
 Wed, 12 Apr 2023 12:09:45 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 j41-20020a4a88ac000000b0053b88b03e24sm7349111ooa.18.2023.04.12.12.09.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 12:09:45 -0700 (PDT)
Message-ID: <64fd2939-c632-1f04-a9e6-8b0078a62b15@gmail.com>
Date: Wed, 12 Apr 2023 16:09:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 51/54] tcg/ppc: Remove unused constraints A, B, C, D
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-52-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230411010512.5375-52-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc33.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.083,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 12 Apr 2023 19:09:50 -0000



On 4/10/23 22:05, Richard Henderson wrote:
> These constraints have not been used for quite some time.
> 
> Fixes: 77b73de67632 ("Use rem/div[u]_i32 drop div[u]2_i32")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   tcg/ppc/tcg-target-con-str.h | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/tcg/ppc/tcg-target-con-str.h b/tcg/ppc/tcg-target-con-str.h
> index f3bf030bc3..9dcbc3df50 100644
> --- a/tcg/ppc/tcg-target-con-str.h
> +++ b/tcg/ppc/tcg-target-con-str.h
> @@ -10,10 +10,6 @@
>    */
>   REGS('r', ALL_GENERAL_REGS)
>   REGS('v', ALL_VECTOR_REGS)
> -REGS('A', 1u << TCG_REG_R3)
> -REGS('B', 1u << TCG_REG_R4)
> -REGS('C', 1u << TCG_REG_R5)
> -REGS('D', 1u << TCG_REG_R6)
>   
>   /*
>    * Define constraint letters for constants:

