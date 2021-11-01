Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhUdT-0008SW-Hv
	for mharc-qemu-riscv@gnu.org; Mon, 01 Nov 2021 06:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhUdP-0008Qd-6l
 for qemu-riscv@nongnu.org; Mon, 01 Nov 2021 06:33:47 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:45583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhUdM-0003No-It
 for qemu-riscv@nongnu.org; Mon, 01 Nov 2021 06:33:46 -0400
Received: by mail-qk1-x731.google.com with SMTP id n15so2533518qkp.12
 for <qemu-riscv@nongnu.org>; Mon, 01 Nov 2021 03:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XqTwYgWfqqdBL8jR9kDUhoTZjuVxGgC6hjG+4cnotaw=;
 b=nUnbkHk9O4lHsrUIeUy3vaI2tTnjCqTLQLqYyAXqEq/tuy51cTRd4P15Er9HEyKvUI
 GZbTkbcKO3ih6GpDWy3ELuWaW4D3MfE+RG8hj2Qf7qeEIToX0MsOiKaVYhlQjmWb2ob8
 DfazOhblDRsnQgYf+Qqktvz3MAAM2o4yMDLcYBnsYqBvfxMMpUStZtUdevrKdcah++o7
 HyQKZvU4lLawZC80NWFH1Kv/CrgBoFpbeDhO2FCxjOxWZ5Bfok0i2HLT1++WSNN6jLaO
 HxhpLHgFS6UP4rUctxwkeXk2kTieGbYWt+bla3jE2Zej+7+sbc+nB5OkTkNoxgGoXG9u
 IAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XqTwYgWfqqdBL8jR9kDUhoTZjuVxGgC6hjG+4cnotaw=;
 b=OA8ctmKrcaxjhGsU8S3DIQwrPL4QYHMsMQdBIvxC1+xMEaU6xGF2jAUi8RAdukYxnP
 YEYmNFDq0Dj6lNkkA4UV1BR5thsDinN5dl6nWhCu0b0ZVK9Wzt2vG3Xwr0sfE9wgQcPu
 oINor6H9aqDMXKVAAu8am9R4fl5/5bA+pjXY7/rJ2Kwtkv24BzQzHApko4MUr/Ws7Hk6
 NinhaQQZSMkMnwQYnHFZyGRV5xcdzrr23Rt49K45fNGzJiJHRpjPb+U3K1Z3szXZ9c+9
 foH92G0f/zhDrbw8+zesQFi8ziyUrhu+hViKQdLgm+/toBXQpyzaSm0cnFw+yxpbbpwy
 IC1g==
X-Gm-Message-State: AOAM530mJYPBDHWsvblIFtwbQcmLOaam4lcNLOee8et6Ct/y22SfLW1k
 gYR/c3avAoAkDlWTeG9fU2blWg==
X-Google-Smtp-Source: ABdhPJx4xCIt9AnbzQfInVQ1+a230bJd5LmoJHQm23z7mmzbj6elVQFVTvXuPojhPpcVpoOrMI/vJw==
X-Received: by 2002:a37:ae41:: with SMTP id x62mr22224402qke.241.1635762822452; 
 Mon, 01 Nov 2021 03:33:42 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id c3sm2893973qtx.53.2021.11.01.03.33.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 03:33:42 -0700 (PDT)
Subject: Re: [PATCH 02/13] target/riscv: Extend pc for runtime pc write
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
 <20211101100143.44356-3-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <03cbb2ba-3fc0-e904-6bf6-56ece9cf46b9@linaro.org>
Date: Mon, 1 Nov 2021 06:33:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101100143.44356-3-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x731.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.592,
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
X-List-Received-Date: Mon, 01 Nov 2021 10:33:48 -0000

On 11/1/21 6:01 AM, LIU Zhiwei wrote:
> In some cases, we must restore the guest PC to the address of the start of
> the TB, such as when the instruction counter hit zero. So extend pc register
> according to current xlen for these cases.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>   target/riscv/cpu.c        | 20 +++++++++++++++++---
>   target/riscv/cpu.h        |  2 ++
>   target/riscv/cpu_helper.c |  2 +-
>   3 files changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 7d53125dbc..7eefd4f6a6 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -319,7 +319,12 @@ static void riscv_cpu_set_pc(CPUState *cs, vaddr value)
>   {
>       RISCVCPU *cpu = RISCV_CPU(cs);
>       CPURISCVState *env = &cpu->env;
> -    env->pc = value;
> +
> +    if (cpu_get_xl(env) == MXL_RV32) {
> +        env->pc = (int32_t)value;
> +    } else {
> +        env->pc = value;
> +    }
>   }
>   

Good.

>   static void riscv_cpu_synchronize_from_tb(CPUState *cs,
> @@ -327,7 +332,12 @@ static void riscv_cpu_synchronize_from_tb(CPUState *cs,
>   {
>       RISCVCPU *cpu = RISCV_CPU(cs);
>       CPURISCVState *env = &cpu->env;
> -    env->pc = tb->pc;
> +
> +    if (cpu_get_xl(env) == MXL_RV32) {
> +        env->pc = (int32_t)tb->pc;
> +    } else {
> +        env->pc = tb->pc;
> +    }

Bad, since TB->PC should be extended properly.
Though this waits on a change to cpu_get_tb_cpu_state.

> @@ -348,7 +358,11 @@ static bool riscv_cpu_has_work(CPUState *cs)
>   void restore_state_to_opc(CPURISCVState *env, TranslationBlock *tb,
>                             target_ulong *data)
>   {
> -    env->pc = data[0];
> +   if (cpu_get_xl(env) == MXL_RV32) {
> +        env->pc = (int32_t)data[0];
> +    } else {
> +        env->pc = data[0];
> +    }

Likewise.


r~

