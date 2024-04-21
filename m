Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6E1C4345F
	for <qemu-riscv@archiver.kernel.org>; Sun, 21 Apr 2024 17:00:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ryaXS-0007MN-BC; Sun, 21 Apr 2024 12:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ryaXQ-0007M0-Pd
 for qemu-riscv@nongnu.org; Sun, 21 Apr 2024 12:59:36 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ryaXP-0004LV-7T
 for qemu-riscv@nongnu.org; Sun, 21 Apr 2024 12:59:36 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6f043f9e6d7so3956572b3a.3
 for <qemu-riscv@nongnu.org>; Sun, 21 Apr 2024 09:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1713718772; x=1714323572; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0E7gtXOh4j0xndetgofvpbevu6Irg/HcGP8IRUZ82cs=;
 b=gmWE+4PBrHjjvrK0ATjqhn3igVV1qBaXEOOMRY70hu1UQ/zOf+T2vtvjBBbvg+GCKP
 oDXYQCO0thpDaXO28EuC8KoReRl/pN1bGN2WCiUS3a7kptv/Dc0u8/nUkJnMZDhR2WIT
 h+l9lh/pmFoj4vZz2eLwDcvbtdgNfIgjRoGpTZOPzkuH8TyRUHrthBhIEiiVK/0kS36Y
 I7zOig9DEDbLbANsgo+jDeW8Z6sn03K10FXZhG+K582DGwy93XkAx41FmxOqluNj3F7/
 5Y+9xrHjA83IAU6JDCkEnpKNERnqLM3xEarpqVgQNdxxu4NTcH55BjS+WhFwitIYOHNj
 o5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713718772; x=1714323572;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0E7gtXOh4j0xndetgofvpbevu6Irg/HcGP8IRUZ82cs=;
 b=xUvTPWnUoakCXwa9o48yOo4xF0P5UYtu+nR4TBb6cWtc81YgRjuKnqazPl1anmy+Xg
 r4omw40J4PWp5S1hvvN8+eVq9GuZskbH2PMz8z9+JzzOu1mGB/d7Iz2EVscaHKQ/LY0n
 6LKDh6EcymbXsjRt9FLuXfa/rNgoIZYI+8HxMqGswk4Qaaapo2h643RttbxZ5jzgM9Fg
 6UvsKr2h/9W4u1ZxwhCMzQEyjPBnR+o2dlAkB2nmFBJX9MyOMzRzWzjq9ZEQV2M3kWPK
 uuEdB8obvAAi5EiQ/NJLMCJI1SrN94GBTrWKGGmWIMkYVf1WV6j932OXD45waPqGbh48
 Qdfg==
X-Gm-Message-State: AOJu0Yw6CSwJ9Ex5Iniu8NOkHFRJwqHvNAExjjZ6Ott8v+IPFOSrjaI7
 p6uRQVJySuF+fAsLtvjShjMf513rnTb3wY5UmVcpbvRmAYiYBdWLTO8mgZfYMio/yFQsNAQVTHP
 h
X-Google-Smtp-Source: AGHT+IE4QLAEbtRRaytz5C1LdfWn4qK/4PPqoTw/AYbw7pC767UFeSigKSUwut/EQe9z4gaFm+1W/A==
X-Received: by 2002:a05:6a20:43a0:b0:1ac:f796:963c with SMTP id
 i32-20020a056a2043a000b001acf796963cmr5719964pzl.56.1713718772235; 
 Sun, 21 Apr 2024 09:59:32 -0700 (PDT)
Received: from [192.168.68.110] ([191.255.35.121])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a056a00214400b006ed0f719a5fsm6351141pfk.81.2024.04.21.09.59.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Apr 2024 09:59:31 -0700 (PDT)
Message-ID: <eef56ce4-3a57-4ed4-841f-bbe8528ff17b@ventanamicro.com>
Date: Sun, 21 Apr 2024 13:59:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: Use get_address() to get address with
 Zicbom extensions
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, Zhiwei Jiang <jiangzw@tecorigin.com>
References: <20240419110514.69697-1-philmd@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240419110514.69697-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42d.google.com
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



On 4/19/24 08:05, Philippe Mathieu-Daudé wrote:
> We need to use get_address() to get an address from cpu_gpr[],
> since $zero is "special" (NULL).
> 
> Fixes: e05da09b7c ("target/riscv: implement Zicbom extension")
> Reported-by: Zhiwei Jiang (姜智伟) <jiangzw@tecorigin.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/insn_trans/trans_rvzicbo.c.inc | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvzicbo.c.inc b/target/riscv/insn_trans/trans_rvzicbo.c.inc
> index d5d7095903..6f6b29598d 100644
> --- a/target/riscv/insn_trans/trans_rvzicbo.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzicbo.c.inc
> @@ -31,27 +31,27 @@
>   static bool trans_cbo_clean(DisasContext *ctx, arg_cbo_clean *a)
>   {
>       REQUIRE_ZICBOM(ctx);
> -    gen_helper_cbo_clean_flush(tcg_env, cpu_gpr[a->rs1]);
> +    gen_helper_cbo_clean_flush(tcg_env, get_address(ctx, a->rs1, 0));
>       return true;
>   }
>   
>   static bool trans_cbo_flush(DisasContext *ctx, arg_cbo_flush *a)
>   {
>       REQUIRE_ZICBOM(ctx);
> -    gen_helper_cbo_clean_flush(tcg_env, cpu_gpr[a->rs1]);
> +    gen_helper_cbo_clean_flush(tcg_env, get_address(ctx, a->rs1, 0));
>       return true;
>   }
>   
>   static bool trans_cbo_inval(DisasContext *ctx, arg_cbo_inval *a)
>   {
>       REQUIRE_ZICBOM(ctx);
> -    gen_helper_cbo_inval(tcg_env, cpu_gpr[a->rs1]);
> +    gen_helper_cbo_inval(tcg_env, get_address(ctx, a->rs1, 0));
>       return true;
>   }
>   
>   static bool trans_cbo_zero(DisasContext *ctx, arg_cbo_zero *a)
>   {
>       REQUIRE_ZICBOZ(ctx);
> -    gen_helper_cbo_zero(tcg_env, cpu_gpr[a->rs1]);
> +    gen_helper_cbo_zero(tcg_env, get_address(ctx, a->rs1, 0));
>       return true;
>   }

