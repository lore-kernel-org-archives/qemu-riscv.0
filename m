Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B900C369C2
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 22:05:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u8R9z-0001Pe-Np; Fri, 25 Apr 2025 18:04:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u8R7z-0006DU-R7
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 18:02:36 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u8R7x-0001RG-N1
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 18:02:35 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-739525d4e12so2514525b3a.3
 for <qemu-riscv@nongnu.org>; Fri, 25 Apr 2025 15:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1745618552; x=1746223352; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=axez90JHWERTG5QTyuIzr6EezXEXtdJEqVd26XET/xU=;
 b=bJD5DQMr5WVxh9Bu94NZw5vSb4WczJg/OFWMpqj36opfh0323oPstxddQk0sqna1q0
 Hd4bYfAdf+m1ktqrA4z+jP4CFsG7JdEFvGai7Ne2Ga9R4mHtE5kxFuuN8kg4eR4YzJUI
 nQ/9y1cX4CYoBLpFLeV1psVWIYhX9W/X9ktAxMNQ23WCTpxZgVagM7SyQob13EQ3gapg
 HlZe/H4jd5GFszEQoJlNZxdA4+TMBKO0trIUD+EgfbmAXbPzkHr8ZoqkXfbxhVRAk8aR
 oN/pyQJr2JzHsbvFtsSesCrtm7wV9bSDxTxLaOLA5BnSy9RWnyqKJO8jaCkt6zrdK4nR
 S8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745618552; x=1746223352;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=axez90JHWERTG5QTyuIzr6EezXEXtdJEqVd26XET/xU=;
 b=ImF0EmCj7fMNaglyxcro0mPuQ+Z1rGOCmSyGP9isIj9sj9gqLwkwwLzEMGygr822Tf
 a9Emom2N2IWHJwsGvSh0YZQYZNfNiw2skZLg/nLPxkCjOjElKq6bGnyo3ctf+pFU4E4y
 o2qJFnu6/AwtYwVvcnaTKK+YChg+gBr2uqEB8aR4xILEpdwsXzVwSORu2+NHOUJzJiEU
 pxrVvyZvgd6Z2wb8aNOsnsnlWGfc9LLaQjAx6q7fsvxr3WhiBnWp6hCURDuPf8bGLImz
 8acuQ9Zg7SZdbqMUu4eAA4JO0HX7LXwEorkafhp9w3iZZAfA2jNFMlBYvPoL+NU5I6dd
 GssQ==
X-Gm-Message-State: AOJu0YxzvoSFg9JeHIdwqKhrT/GWO8X5tbt1w2ESumL0yDvES0nZ+vR4
 lhjtTJZN9h3H89G5I8DgFxnmzsy9HkO2MfTk6sZ9BEVOanVhUGl1e5NZozai8Lo=
X-Gm-Gg: ASbGncsL3wbYCDLid3rl4ajvyeoxVwghYoK92rkdTUwZi6VzmtDFSaMj+75DtoLMPmH
 dM82vfy1nywfYk/zif22ldl2MEFYbHh0PeUKy7KTcpu0gnv31a7herqO9bwK+YmYadE9+DUHKi/
 /9Afcnc0iv0SK0kZQaX3attfUAIvcuh5x9JcemLtVlSZVEtActiz1+79uiT1gX/Gb8+dAI0hX14
 GxfeaWgw9hZ1N7Q3OJITqUjqXDf/9MaRdekv8prlgS25OFYNoX5VKkanry6Rs/jFvpGNRA4zOMT
 WWrrDARgFokDH70S4PKeR1slUzPsYbrptpQPAUh/ZImDFxrYbpv0idVba7mPocuRZA==
X-Google-Smtp-Source: AGHT+IHKaNShR2wnFVQclSPv5yDMKKNgRbAykYIPQrHuL4CmEKcox8ETr6vQCniGOWEyk2IM+BsAaQ==
X-Received: by 2002:a05:6a00:4644:b0:73d:fefb:325 with SMTP id
 d2e1a72fcca58-73fd6af5a42mr4928354b3a.5.1745618551617; 
 Fri, 25 Apr 2025 15:02:31 -0700 (PDT)
Received: from [192.168.68.110] ([152.234.125.33])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25941387sm3683725b3a.70.2025.04.25.15.02.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 15:02:31 -0700 (PDT)
Message-ID: <451616c2-5594-4d12-82ea-63ef7bbecd22@ventanamicro.com>
Date: Fri, 25 Apr 2025 19:02:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH alternate 1/2] target/riscv: Update pc before csrw, csrrw
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com
References: <20250425165055.807801-1-richard.henderson@linaro.org>
 <20250425165055.807801-2-richard.henderson@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250425165055.807801-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 4/25/25 1:50 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/insn_trans/trans_rvi.c.inc | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index b9c7160468..a367fecf7e 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -992,6 +992,7 @@ static bool do_csrw(DisasContext *ctx, int rc, TCGv src)
>       TCGv_i32 csr = tcg_constant_i32(rc);
>   
>       translator_io_start(&ctx->base);
> +    gen_update_pc(ctx, 0);
>       gen_helper_csrw(tcg_env, csr, src);
>       return do_csr_post(ctx);
>   }
> @@ -1002,6 +1003,7 @@ static bool do_csrrw(DisasContext *ctx, int rd, int rc, TCGv src, TCGv mask)
>       TCGv_i32 csr = tcg_constant_i32(rc);
>   
>       translator_io_start(&ctx->base);
> +    gen_update_pc(ctx, 0);
>       gen_helper_csrrw(dest, tcg_env, csr, src, mask);
>       gen_set_gpr(ctx, rd, dest);
>       return do_csr_post(ctx);
> @@ -1025,6 +1027,7 @@ static bool do_csrw_i128(DisasContext *ctx, int rc, TCGv srcl, TCGv srch)
>       TCGv_i32 csr = tcg_constant_i32(rc);
>   
>       translator_io_start(&ctx->base);
> +    gen_update_pc(ctx, 0);
>       gen_helper_csrw_i128(tcg_env, csr, srcl, srch);
>       return do_csr_post(ctx);
>   }
> @@ -1037,6 +1040,7 @@ static bool do_csrrw_i128(DisasContext *ctx, int rd, int rc,
>       TCGv_i32 csr = tcg_constant_i32(rc);
>   
>       translator_io_start(&ctx->base);
> +    gen_update_pc(ctx, 0);
>       gen_helper_csrrw_i128(destl, tcg_env, csr, srcl, srch, maskl, maskh);
>       tcg_gen_ld_tl(desth, tcg_env, offsetof(CPURISCVState, retxh));
>       gen_set_gpr128(ctx, rd, destl, desth);


