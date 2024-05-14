Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD36CC04FFE
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 May 2024 09:11:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s6oBr-0001VZ-Hb; Tue, 14 May 2024 05:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1s6oBd-0001Uc-U4
 for qemu-riscv@nongnu.org; Tue, 14 May 2024 05:11:07 -0400
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1s6oBZ-0002s2-Ph
 for qemu-riscv@nongnu.org; Tue, 14 May 2024 05:11:05 -0400
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-5b277993a48so3054995eaf.1
 for <qemu-riscv@nongnu.org>; Tue, 14 May 2024 02:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1715677860; x=1716282660; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wFt2B2tmGMJZMVU9WuNI2mtLK6I1IwQaN12zG1udVDs=;
 b=jnULYbvzQkHhUBqGXhGRMlMk1hWZYuxmQfPegJAr+MvyndifAGlFtaOi6VGjhWP27p
 GxPUw29Va5WkvxPqoQYYXKhJghmMXnOYhUHtj+M9St7V4oLPEvixlwO3t7NR468nsIBf
 +/I92vN9gGnjaAlhyh8/v32WwCmo7XPoZSNxoIUQ5V1HNn+G7c1bFS+yCeMyHtVB1g/4
 3aTf+X7JxpokfgZNlmfKBfosk1Oq7G1xzO8+lveicv2RTb+4qgc2iij85TlChG33MOsZ
 sINTMsT+yWbBOFEWJxACmd17/bsAS65bKXF9DZs63u1YjZZOiFY4+SRj7vMq3+t09+Ec
 +AdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715677860; x=1716282660;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wFt2B2tmGMJZMVU9WuNI2mtLK6I1IwQaN12zG1udVDs=;
 b=IxUKKIDo3bXozIhb3XSinwbiR7XSSWAUWzc7S6uI0AHt5AS0brKmzu6TfzRBP21xuK
 NSw0AqVB8uL/rFhca1EjZbuzvHtdQVX3aClzrOvkPu+JPsJkaT/WA/suiQuS5ldUhZ4q
 tUPuXG5O+r+TMMxNGC3vpNmCaL5tjQCojk7/y4l3ZouyOS4i91I4e8/kJs7lJiBsMOv/
 MPxuSUbf9zx7UufGG4JyuMqyaq6WBacI45xRTtowNlvOE6dAt5xcDKCW1miLDfNCKWyQ
 fDYtRrOJkmC0p2SqTk/4koJsDoDCDwb+9FtuK1kCs4cpAGXx2LJvAWdT/gWMUvtRypnX
 JSxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxaegYCpeEpSzIJT/39pw9bqMpPkLdiZXtKFYmZOp8iAFqMinnbRtjbUS4Y9Mi6bQlg6jUJPWUbrsa8DuLhQHsP3FZIXw=
X-Gm-Message-State: AOJu0YyCSBaA95JotcdqDzUnfSnSwDUxbUlEczV1mtEQSjG3RQX0ntO3
 3iZrG9kC7nLzOomG+xNZxJrpGImXNNAW0urNMHiuBebhNjcGPLMNxjgk1i+9EeY=
X-Google-Smtp-Source: AGHT+IFwSqGeA5eWG79bjC1RGjAzgb6wDIiryQ4SH0yLb+ql0XeoO5VFrIbiVWtGjBtnidZEXL8rFA==
X-Received: by 2002:a05:6358:4285:b0:193:f936:633a with SMTP id
 e5c5f4694b2df-193f9366370mr954938155d.13.1715677860033; 
 Tue, 14 May 2024 02:11:00 -0700 (PDT)
Received: from [192.168.68.110] ([177.94.42.57])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-63411346dc1sm7870703a12.83.2024.05.14.02.10.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 02:10:59 -0700 (PDT)
Message-ID: <14e88990-963c-45ef-bf51-662d54857c6e@ventanamicro.com>
Date: Tue, 14 May 2024 06:10:53 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: rvzicbo: Fixup CBO extension register
 calculation
To: Alistair Francis <alistair23@gmail.com>, qemu-riscv@nongnu.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 bin.meng@windriver.com, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>, fabian.thomas@cispa.de,
 Bin Meng <bmeng.cn@gmail.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>
References: <20240514023910.301766-1-alistair.francis@wdc.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240514023910.301766-1-alistair.francis@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 5/13/24 23:39, Alistair Francis wrote:
> When running the instruction
> 
> ```
>      cbo.flush 0(x0)
> ```
> 
> QEMU would segfault.
> 
> The issue was in cpu_gpr[a->rs1] as QEMU does not have cpu_gpr[0]
> allocated.
> 
> In order to fix this let's use the existing get_address()
> helper. This also has the benefit of performing pointer mask
> calculations on the address specified in rs1.
> 
> The pointer masking specificiation specifically states:
> 
> """
> Cache Management Operations: All instructions in Zicbom, Zicbop and Zicboz
> """
> 
> So this is the correct behaviour and we previously have been incorrectly
> not masking the address.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reported-by: Fabian Thomas <fabian.thomas@cispa.de>
> Fixes: e05da09b7cfd ("target/riscv: implement Zicbom extension")
> ---

LGTM but I wonder if this is the same fix as this one sent by Phil a month
ago or so:

https://lore.kernel.org/qemu-riscv/20240419110514.69697-1-philmd@linaro.org/
("[PATCH] target/riscv: Use get_address() to get address with Zicbom extensions")


Thanks,

Daniel

>   target/riscv/insn_trans/trans_rvzicbo.c.inc | 16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvzicbo.c.inc b/target/riscv/insn_trans/trans_rvzicbo.c.inc
> index d5d7095903..15711c3140 100644
> --- a/target/riscv/insn_trans/trans_rvzicbo.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzicbo.c.inc
> @@ -31,27 +31,35 @@
>   static bool trans_cbo_clean(DisasContext *ctx, arg_cbo_clean *a)
>   {
>       REQUIRE_ZICBOM(ctx);
> -    gen_helper_cbo_clean_flush(tcg_env, cpu_gpr[a->rs1]);
> +    TCGv src = get_address(ctx, a->rs1, 0);
> +
> +    gen_helper_cbo_clean_flush(tcg_env, src);
>       return true;
>   }
>   
>   static bool trans_cbo_flush(DisasContext *ctx, arg_cbo_flush *a)
>   {
>       REQUIRE_ZICBOM(ctx);
> -    gen_helper_cbo_clean_flush(tcg_env, cpu_gpr[a->rs1]);
> +    TCGv src = get_address(ctx, a->rs1, 0);
> +
> +    gen_helper_cbo_clean_flush(tcg_env, src);
>       return true;
>   }
>   
>   static bool trans_cbo_inval(DisasContext *ctx, arg_cbo_inval *a)
>   {
>       REQUIRE_ZICBOM(ctx);
> -    gen_helper_cbo_inval(tcg_env, cpu_gpr[a->rs1]);
> +    TCGv src = get_address(ctx, a->rs1, 0);
> +
> +    gen_helper_cbo_inval(tcg_env, src);
>       return true;
>   }
>   
>   static bool trans_cbo_zero(DisasContext *ctx, arg_cbo_zero *a)
>   {
>       REQUIRE_ZICBOZ(ctx);
> -    gen_helper_cbo_zero(tcg_env, cpu_gpr[a->rs1]);
> +    TCGv src = get_address(ctx, a->rs1, 0);
> +
> +    gen_helper_cbo_zero(tcg_env, src);
>       return true;
>   }

