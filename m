Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pI5G9-00051W-3b
	for mharc-qemu-riscv@gnu.org; Wed, 18 Jan 2023 05:01:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pI5Fs-0004zA-Ry
 for qemu-riscv@nongnu.org; Wed, 18 Jan 2023 05:01:16 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pI5Fr-0006h6-7J
 for qemu-riscv@nongnu.org; Wed, 18 Jan 2023 05:01:16 -0500
Received: by mail-oi1-x22e.google.com with SMTP id r9so3978084oig.12
 for <qemu-riscv@nongnu.org>; Wed, 18 Jan 2023 02:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T67x9w6UdHuzL2QCZjre2Ie8TXu2wkmLvuX/LMNjXi8=;
 b=jU3Gnqgs/keoPPt+Vjc74cw2ldqIvG3f5dHoOhuBm1OXmgO8Tlny4JZMfggxNkG40c
 QtF+2QCurEG0E2TjSCG0YbNxIAtyJNTly4ef519NMte39Yh/446Mpdt+2xw4GmHh9znG
 l5+HPEbcnN3F7/pFN+EUH+gdhtqygOlqw+17PO/CcxNwRg60/p+29GOq+YKbYIrSSwPf
 bwJJsCCIxIwLH1lRU3zBP9mFdxNI27PWXkH+vARFj1dz8J6xAWj7RROBJonQ9niY+IVL
 hQm5b3QGBDX46G83IRuRCsuyvUcI3A+fOCQ3ksoEvLwt4Lsvr6bK83lOYAVewDeVr9LQ
 HxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T67x9w6UdHuzL2QCZjre2Ie8TXu2wkmLvuX/LMNjXi8=;
 b=LozSfpNtrKVdmyHNgfOMvfeu5KVbDCREws3Ujwi6c1piRDmLkSJVUVsbP9Y6VP7ty1
 vji/L8wDdp7qwDZqFm+oXOnG9Uni0yDEojB6gboSFC5HLE/r9hezg57QVWYy/fxLEiT4
 mJefkPLG0C9m54czItJDxvzztixiozniC2LFGaQZlSCz4yi0FLqMpHIuFb1VnghzyrSf
 d9Ro/XVa6NZw59HwyODr0am6ER9Mh78aANAZogdZyAZm8K73KOLCcoM7MM8XjPOCS9fu
 76nukCJyFBw6Xmtp01tFTeD6SExkc6h72qDaPocT4Y2fWg/uViXqPgy7SCuhf9NUGy56
 zflQ==
X-Gm-Message-State: AFqh2kqpQRkEFabqp/47JuJ2+BHh/yPVV4JKaXr4Bd2DQIjuL+DNeycM
 CTkNs/bTms313YdKXG16ptz6BA==
X-Google-Smtp-Source: AMrXdXubiUFhZxYURkqjvRzOMKzeYBG70flkm2Qw7+vJ/u9N85EnL9HGB5zcwpnRZI7xzYlfcvTa5Q==
X-Received: by 2002:a05:6808:6044:b0:364:e7cc:eb7 with SMTP id
 dd4-20020a056808604400b00364e7cc0eb7mr2674180oib.59.1674036074098; 
 Wed, 18 Jan 2023 02:01:14 -0800 (PST)
Received: from [192.168.68.107] ([191.17.222.2])
 by smtp.gmail.com with ESMTPSA id
 v63-20020acaac42000000b003670342726fsm3871949oie.12.2023.01.18.02.01.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 02:01:13 -0800 (PST)
Message-ID: <f7645fdb-2d8c-487c-8c9a-2fa8efc9f515@ventanamicro.com>
Date: Wed, 18 Jan 2023 07:01:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] target/riscv: Remove helper_set_rod_rounding_mode
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bin.meng@windriver.com,
 abdulras@google.com
References: <20230115160657.3169274-1-richard.henderson@linaro.org>
 <20230115160657.3169274-3-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230115160657.3169274-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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
X-List-Received-Date: Wed, 18 Jan 2023 10:01:17 -0000
X-List-Received-Date: Wed, 18 Jan 2023 10:01:17 -0000



On 1/15/23 13:06, Richard Henderson wrote:
> The only setting of RISCV_FRM_ROD is from the vector unit,
> and now handled by helper_set_rounding_mode_chkfrm.
> This helper is now unused.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/helper.h     | 1 -
>   target/riscv/fpu_helper.c | 5 -----
>   target/riscv/translate.c  | 4 ----
>   3 files changed, 10 deletions(-)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 9792ab5086..58a30f03d6 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -4,7 +4,6 @@ DEF_HELPER_2(raise_exception, noreturn, env, i32)
>   /* Floating Point - rounding mode */
>   DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_WG, void, env, i32)
>   DEF_HELPER_FLAGS_2(set_rounding_mode_chkfrm, TCG_CALL_NO_WG, void, env, i32)
> -DEF_HELPER_FLAGS_1(set_rod_rounding_mode, TCG_CALL_NO_WG, void, env)
>   
>   /* Floating Point - fused */
>   DEF_HELPER_FLAGS_4(fmadd_s, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
> diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
> index 96817df8ef..449d236df6 100644
> --- a/target/riscv/fpu_helper.c
> +++ b/target/riscv/fpu_helper.c
> @@ -118,11 +118,6 @@ void helper_set_rounding_mode_chkfrm(CPURISCVState *env, uint32_t rm)
>       set_float_rounding_mode(softrm, &env->fp_status);
>   }
>   
> -void helper_set_rod_rounding_mode(CPURISCVState *env)
> -{
> -    set_float_rounding_mode(float_round_to_odd, &env->fp_status);
> -}
> -
>   static uint64_t do_fmadd_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2,
>                              uint64_t rs3, int flags)
>   {
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 493c3815e1..01cc30a365 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -672,10 +672,6 @@ static void gen_set_rm(DisasContext *ctx, int rm)
>       }
>       ctx->frm = rm;
>   
> -    if (rm == RISCV_FRM_ROD) {
> -        gen_helper_set_rod_rounding_mode(cpu_env);
> -        return;
> -    }
>       if (rm == RISCV_FRM_DYN) {
>           /* The helper will return only if frm valid. */
>           ctx->frm_valid = true;


