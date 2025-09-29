Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDF6CAC5B5
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Sep 2025 14:41:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3F4M-0003el-Th; Mon, 29 Sep 2025 10:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v3F4F-0003cW-GB
 for qemu-riscv@nongnu.org; Mon, 29 Sep 2025 10:41:31 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v3F45-0001OU-Ck
 for qemu-riscv@nongnu.org; Mon, 29 Sep 2025 10:41:31 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-b5241e51764so4070186a12.1
 for <qemu-riscv@nongnu.org>; Mon, 29 Sep 2025 07:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759156872; x=1759761672; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MkzCGJhxmBl7pB+ADBh0H9ogb846oJxdcaEE8Qh58OA=;
 b=W2w7tfWXMHuF3azQwR0H8tP4awGwW5xh5AkikSG4A0HnL4bTC3J0c9ekWrSAB/Ruwl
 gvG572N6KlNnz6uODbIqc2BRD3sgqKeM8UShzKdKp4Vwr6Y++GqnLZ+YmNyf8cpn2tqZ
 OLj3RfkzVMqMBIzFRbnuI4dvXRWu0u5ufptUWfhOLHoveMOJ+TNYhmzyJBxpRKY34hEF
 4deTgkQvYgjOa97/Z0OXYWRW5KcQBsfthJBgJpzaII0SmtoFyFuwyHrllDgZ4Y8nWWYu
 Xvxdp/SHxz/cTmNoKvVYs6bmTsS137g1ctQkK/QWUorG6cbEHt2e87HMliMhVNSMjxX6
 Ak2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759156872; x=1759761672;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MkzCGJhxmBl7pB+ADBh0H9ogb846oJxdcaEE8Qh58OA=;
 b=hEX+3V/DBez8YF8eX6EpptYkyYHE20eYEEhH5eJeiE3P+QVMlUQkcyi65KmDlGWIRf
 ULh6PE1b9RduEeYAc7PaLpKxw8PralEamdMmQTC6yYPxAOhW/IpgpzIJkHkyd9BlaCYc
 oHIO5kubF88Rj41WM/TmSybicTt1W1+UD4WmAaDd9NSGK+IrgB3Y8pTBgkgp/ojsItm/
 fyqz53qqQkkWpeTY+QwAcfJFu38xw1K+4TlzQQ4QZdT6/4j97JNv+hgpBf92JOdBElmM
 Ys+G65d63C9Yh06fXXaX/CHNyBfV5W4R8zyWj17f+9HO7Qla4p+khytt0F7fZ99Veep1
 iCgg==
X-Gm-Message-State: AOJu0Yw62Pg2/2MxVWN8r2ZIDQIsmWhYWwGP6SdUdV8YwEry64D1AcXQ
 dy9hzCculHb+SHYO3ZiBE0nz1msykXjtBtmxFTplvgHcwG6rR3x0SKAYkvLrUQvevCc=
X-Gm-Gg: ASbGncunmcL/4UI0eALwwz5pMk//P6N4/ePPCA8pzAr8QknabKoGjh1E9+t3e+f+2ok
 dQGJyyCwPzunwFz4ze4spYZVGx0MZegOElgRwAS1gOGbqRpjnUl4ggIPVfgg5OJQvYKyzelYzJH
 QlAm9/XZOQL+qKr24WU4Ih46TNCeUE8oQ2ghMbd8LEeAWAsQqCWm2aMFpAPls4xD7rwD7CeHQIN
 FZ0FHyM2XXG0WVuWUF4imzIYDo8a/yrlpKLRxpCqRvUjpGo2UPmACsYWy95tG+52wlxgdvEEI4O
 jzjiFI3MV5x+Q+G8F5SyXPFeFCfhajzFFp5bsyomFlhSDLVdejdBdCvmq/yUlyOO7eWLQ/k2F6E
 fnAtkIeR1owicopg5yvoCtlTvn4JQ3U+hO8mII43D5HjuKVV927yLmeRgfA==
X-Google-Smtp-Source: AGHT+IHPy3QvNuZjOj6YBc+0r5YGXTW69E4S91z1ivN0tb6fevgW3Q5wqiYPN2nAFuNMgcVURiqjBA==
X-Received: by 2002:a17:90b:5627:b0:330:793a:4240 with SMTP id
 98e67ed59e1d1-3342a2c5d9cmr15797380a91.31.1759156872409; 
 Mon, 29 Sep 2025 07:41:12 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.157.132])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3341bd90332sm17219996a91.1.2025.09.29.07.41.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 07:41:12 -0700 (PDT)
Message-ID: <3fb026bf-3b33-4cfa-a20f-8e1d442e7902@linaro.org>
Date: Mon, 29 Sep 2025 07:41:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: Fix endianness swap on compressed
 instructions
To: Valentin Haudiquet <valentin.haudiquet@canonical.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-trivial@nongnu.org,
 zhiwei_liu@linux.alibaba.com, dbarboza@ventanamicro.com,
 liwei1518@gmail.com, alistair.francis@wdc.com, palmer@dabbelt.com,
 vhaudiquet <vhaudiquet343@hotmail.fr>
References: <20250929115543.1648157-1-valentin.haudiquet@canonical.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250929115543.1648157-1-valentin.haudiquet@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 9/29/25 04:55, Valentin Haudiquet wrote:
> From: vhaudiquet <vhaudiquet343@hotmail.fr>
> 
> Three instructions were not using the endianness swap flag, which resulted in a bug on big-endian architectures.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3131
> Buglink: https://bugs.launchpad.net/ubuntu/+source/qemu/+bug/2123828
> 
> Signed-off-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
> ---
>   target/riscv/insn_trans/trans_rvzce.c.inc | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Cc: qemu-stable@nongnu.org
Fixes: e0a3054f18e ("target/riscv: add support for Zcb extension")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> 
> diff --git a/target/riscv/insn_trans/trans_rvzce.c.inc b/target/riscv/insn_trans/trans_rvzce.c.inc
> index c77c2b927b..dd15af0f54 100644
> --- a/target/riscv/insn_trans/trans_rvzce.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzce.c.inc
> @@ -88,13 +88,13 @@ static bool trans_c_lbu(DisasContext *ctx, arg_c_lbu *a)
>   static bool trans_c_lhu(DisasContext *ctx, arg_c_lhu *a)
>   {
>       REQUIRE_ZCB(ctx);
> -    return gen_load(ctx, a, MO_UW);
> +    return gen_load(ctx, a, MO_TEUW);
>   }
>   
>   static bool trans_c_lh(DisasContext *ctx, arg_c_lh *a)
>   {
>       REQUIRE_ZCB(ctx);
> -    return gen_load(ctx, a, MO_SW);
> +    return gen_load(ctx, a, MO_TESW);
>   }
>   
>   static bool trans_c_sb(DisasContext *ctx, arg_c_sb *a)
> @@ -106,7 +106,7 @@ static bool trans_c_sb(DisasContext *ctx, arg_c_sb *a)
>   static bool trans_c_sh(DisasContext *ctx, arg_c_sh *a)
>   {
>       REQUIRE_ZCB(ctx);
> -    return gen_store(ctx, a, MO_UW);
> +    return gen_store(ctx, a, MO_TEUW);
>   }
>   
>   #define X_S0    8


