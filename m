Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B75C87FD2
	for <qemu-riscv@archiver.kernel.org>; Sat,  2 Aug 2025 16:32:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uiF9c-0000Y4-6D; Sat, 02 Aug 2025 12:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uiF9a-0000WW-QW
 for qemu-riscv@nongnu.org; Sat, 02 Aug 2025 12:32:14 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uiF9Z-0000lg-8S
 for qemu-riscv@nongnu.org; Sat, 02 Aug 2025 12:32:14 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-b42099901baso2357267a12.2
 for <qemu-riscv@nongnu.org>; Sat, 02 Aug 2025 09:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1754152331; x=1754757131; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+26q3cKQV45xGY7nbkJnx3iETBJdsmToUPle7KKflwc=;
 b=ITGr0BqHPA301jM9mkyllkIhD/+jPXC/ObNCDMrnePRmK8/4XU9V+fprNqMh+X0c7U
 OJvEoqN9weS2PSgPh4wzZzNxpRijMlnKpACmCxqzvjsNn3r3r0JsZjqfko3jwYOF4jar
 WJI/nG5AJw+cAKyB8MJKoSwOyJFlMVsGZcZjPVa6LrK38d3OmVRvPRfTAlMf3Sj6m5UG
 IompUDmZOqJAX96YNjLHJX1pPHm+KaL/C3KJ2fr2q32rhYlhnWmLXEDfRBlAt7r7VtvF
 +QCTAn9/uZmIr19i0ozdrBoYEyz0wmES0ZEx1v1k9j7hqDZhE68ZU8IP6/U7Z/PrT2g/
 F+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754152331; x=1754757131;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+26q3cKQV45xGY7nbkJnx3iETBJdsmToUPle7KKflwc=;
 b=BYP8WmbWOkkPdRkrOeiKBn1X+Q62WMKOh0TC/j8Ltug7Dc34rwaxFQiP1l90nOmWK5
 xGi9OFjd66WK7m12pJO1XwXF/Ap1Ex+b6h37V1Ix6YsKWIPeaGWKjOofXWIoOIsQSZ8D
 RhcU4VWjXPTApYVRGFxZkKv8MKyBCi6CqVf27Ehm0z1xwQzEnw8PYBf8WMPI/8odavmd
 Gk94xn9cDPE+48aXr6EfdFz+TkSA5g/93hokYFn+KYcoTtl08P8AV837bBXOtU3wSTkY
 EN1KIxjvriN2o4y4ouPeJtpUkRMSeuXPmrWK9ztMEaVITHk6MdmTGsG/i4zrg5VMAwZH
 dsOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcH4a2nJe2KwECVip0lH1Rvqg8Cc/K4Jdj8kklNyBfY9SXHnknDzvXRHREg2z7xXj6rUU0fvg7TTs6@nongnu.org
X-Gm-Message-State: AOJu0YzIS8R10k3MGRL1LgoSpHvfbwlOb2+8t2H3LaTbaUekRStqLAit
 lZBNLymNOgACvferqdPxqfIgj0+RBKGPY/LpXSi1ytydWhW3GCvNfrfYzHVPBMIRNbI=
X-Gm-Gg: ASbGnctFwkDQeJfWTTg7PSImMLVBg89sYJ6SbqY3r1CzFKRonLzy1920ml6eeILoQpO
 oistC56Wyv2NZUbQ+t4G9DK3TkAx+QCxy/5ngaV+GDqrqerOVVbKtwmw1m1HsV9ZU0diiKaOxWK
 Q1GPQQf++Xhd7y/b/DbpiUIBTtrL0mB+WA6U84swYHCSvjQQNGADHS9YchDVhokP9/FkSFukacZ
 DZ8IbmfWiNZ/70WjFzL8SLzyN1yYUsXfBGRp37/TKewZC1WRGdIodUpD4jMmUnAE34CT1G0AFbu
 RfI+2c+tr8GMrglM9EpkOkYlJ4/uNWN/3ZlT5icDAxeCS5CYV7ykKvkW3jWIFavLYNYedWjWHk5
 sAQNLZynvAwX7RRg1IRjlPBdgCzSqW4/kdsM=
X-Google-Smtp-Source: AGHT+IG4Z2Lh2GRXPcu6a0ZzF5sf6PEvF3sYk57VsDuVde8n6BgImwD55vgDcpOfPEOutQqQMCLpwg==
X-Received: by 2002:a17:902:e54c:b0:240:8704:fb9 with SMTP id
 d9443c01a7336-242470647bemr57290845ad.53.1754152331443; 
 Sat, 02 Aug 2025 09:32:11 -0700 (PDT)
Received: from [192.168.68.110] ([177.170.244.6])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f63dc4ea9sm10217940a91.15.2025.08.02.09.32.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Aug 2025 09:32:10 -0700 (PDT)
Message-ID: <7b5c615d-0a74-4310-9eaa-db9c9bddc984@ventanamicro.com>
Date: Sat, 2 Aug 2025 13:32:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/11] semihosting/arm-compat-semi: remove
 common_semi_sys_exit_extended
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, richard.henderson@linaro.org,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20250801232609.2744557-1-pierrick.bouvier@linaro.org>
 <20250801232609.2744557-5-pierrick.bouvier@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20250801232609.2744557-5-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x52c.google.com
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



On 8/1/25 8:26 PM, Pierrick Bouvier wrote:
> This allows to get rid of sizeof(target_ulong) for riscv, without
> changing the semantic.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/arm/common-semi-target.h   | 5 -----
>   target/riscv/common-semi-target.h | 5 -----
>   semihosting/arm-compat-semi.c     | 4 +++-
>   3 files changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/target/arm/common-semi-target.h b/target/arm/common-semi-target.h
> index da51f2d7f54..7ebd2136d93 100644
> --- a/target/arm/common-semi-target.h
> +++ b/target/arm/common-semi-target.h
> @@ -34,11 +34,6 @@ static inline void common_semi_set_ret(CPUState *cs, target_ulong ret)
>       }
>   }
>   
> -static inline bool common_semi_sys_exit_extended(CPUState *cs, int nr)
> -{
> -    return nr == TARGET_SYS_EXIT_EXTENDED || is_a64(cpu_env(cs));
> -}
> -
>   static inline bool is_64bit_semihosting(CPUArchState *env)
>   {
>       return is_a64(env);
> diff --git a/target/riscv/common-semi-target.h b/target/riscv/common-semi-target.h
> index 7c8a59e0cc3..63bbcd2d5fa 100644
> --- a/target/riscv/common-semi-target.h
> +++ b/target/riscv/common-semi-target.h
> @@ -25,11 +25,6 @@ static inline void common_semi_set_ret(CPUState *cs, target_ulong ret)
>       env->gpr[xA0] = ret;
>   }
>   
> -static inline bool common_semi_sys_exit_extended(CPUState *cs, int nr)
> -{
> -    return (nr == TARGET_SYS_EXIT_EXTENDED || sizeof(target_ulong) == 8);
> -}
> -
>   static inline bool is_64bit_semihosting(CPUArchState *env)
>   {
>       return riscv_cpu_mxl(env) != MXL_RV32;
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> index 3f653c6e7a9..ef57d7205c8 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -755,7 +755,9 @@ void do_common_semihosting(CPUState *cs)
>       {
>           uint32_t ret;
>   
> -        if (common_semi_sys_exit_extended(cs, nr)) {
> +        bool extended = (nr == TARGET_SYS_EXIT_EXTENDED ||
> +                         is_64bit_semihosting(cpu_env(cs)));
> +        if (extended) {
>               /*
>                * The A64 version of SYS_EXIT takes a parameter block,
>                * so the application-exit type can return a subcode which


