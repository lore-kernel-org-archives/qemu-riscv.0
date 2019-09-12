Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i8Q97-0003hY-PA
	for mharc-qemu-riscv@gnu.org; Thu, 12 Sep 2019 10:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47888)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i8Q94-0003cf-G3
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2019 10:32:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i8Q93-0004ia-6p
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2019 10:32:26 -0400
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841]:45038)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i8Q93-0004hh-0I
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2019 10:32:25 -0400
Received: by mail-qt1-x841.google.com with SMTP id u40so29814925qth.11
 for <qemu-riscv@nongnu.org>; Thu, 12 Sep 2019 07:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uBS103W/hIPtIJjDYmCrdnuJp0w4ne1F6jD7wH4AyKY=;
 b=IkfdzM6ieVxOJZC3DxVjzB4gLzt+mlX5MBmC1cUwDx5BxB9bkV7OCzc6OIA5D38gv0
 5Hytio2sJbZVahpsPLk1+WV9uO/X17K0Euxc84fcc+Y3IHYna4voNoD/Y5daQr4/wnlL
 G3dzGFiJdcZCdycahBMINwC+MN93DKl9A0IWxu9Cf1WjL17UN0meYaOgs/Y+zDUUCXqr
 7Lv4/72KLM+3omSuvF4z6I+mB7IhAz8of3jFzTcuRutb7ZeZWSMj6FYunwzQnRFpnX/P
 wPim+Gr77fxruHb9/hKZF5h8fjm7grzplR8J3V3vizq/2pQtPDjPjRad3jmpekZz9uhW
 XJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uBS103W/hIPtIJjDYmCrdnuJp0w4ne1F6jD7wH4AyKY=;
 b=OoVjcykRtuVqx1FR7DQ92c9zbObABjFHViUGh4FR+1MiNNUdukNLRmA76iKKtxjGXD
 Iif6PT7iVZdUohj9iMkl6ZeUwyejhAbsGW0NUlj3qdy/rISJtB41atJHPVaQX6kgDiIw
 LAldB/iZ7SuGmebmQyo3M1ZZJE7fj/NBzvOY5NO/Bg0PDbuhFG3w9p965nSebMhgZuRY
 mPo4u72M4hw1hIBdlW9hI2lLpO5O3QsklCWrbhkmdS8PblQS6u6hZPJZWIazXG5VEVAK
 9yKdivPKmGQSGL6lg6sCKNSNtnOFw/udZtdBQueAXztiLaOLJ99g3cM2KpFKTIbW8r5V
 s9Qw==
X-Gm-Message-State: APjAAAXaEcF7zbBzvYWFqs2HcAQ2rhCizYzEw07wn45NcTqulTOJp35d
 AZiR4gCz6Zp76zU7oPjolvFyzA==
X-Google-Smtp-Source: APXvYqzzEKObUH+pYBq70hPKUjcOFt4JmrAf48u7z0pZgkb9qxu+9fjDTjLQG6Ic3lyfTGsf+nttGg==
X-Received: by 2002:aed:2da4:: with SMTP id i33mr8293066qtd.320.1568298743578; 
 Thu, 12 Sep 2019 07:32:23 -0700 (PDT)
Received: from [172.20.5.51] ([67.69.50.154])
 by smtp.gmail.com with ESMTPSA id c131sm11327881qke.24.2019.09.12.07.32.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Sep 2019 07:32:22 -0700 (PDT)
To: liuzhiwei <zhiwei_liu@c-sky.com>, Alistair.Francis@wdc.com,
 palmer@sifive.com, sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 riku.voipio@iki.fi, laurent@vivier.eu, wenmeng_zhang@c-sky.com
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, wxy194768@alibaba-inc.com
References: <1568183141-67641-1-git-send-email-zhiwei_liu@c-sky.com>
 <1568183141-67641-7-git-send-email-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <78f805d4-720f-6777-bf91-4b4aaf0a15a3@linaro.org>
Date: Thu, 12 Sep 2019 10:32:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1568183141-67641-7-git-send-email-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::841
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2 06/17] RISC-V: add vector
 extension fault-only-first implementation
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Sep 2019 14:32:28 -0000

On 9/11/19 2:25 AM, liuzhiwei wrote:
> diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
> index 12aa3c0..d673fa5 100644
> --- a/linux-user/riscv/cpu_loop.c
> +++ b/linux-user/riscv/cpu_loop.c
> @@ -41,6 +41,13 @@ void cpu_loop(CPURISCVState *env)
>          sigcode = 0;
>          sigaddr = 0;
>  
> +        if (env->foflag) {
> +            if (env->vfp.vl != 0) {
> +                env->foflag = false;
> +                env->pc += 4;
> +                continue;
> +            }
> +        }
>          switch (trapnr) {
>          case EXCP_INTERRUPT:
>              /* just indicate that signals should be handled asap */
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index e32b612..405caf6 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -521,6 +521,13 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>          [PRV_H] = RISCV_EXCP_H_ECALL,
>          [PRV_M] = RISCV_EXCP_M_ECALL
>      };
> +    if (env->foflag) {
> +        if (env->vfp.vl != 0) {
> +            env->foflag = false;
> +            env->pc += 4;
> +            return;
> +        }
> +    }

I renew my objection to this FOFLAG mechanism.  I believe, but have no proof,
that this will race between different types of interrupts.  Once again I
present the ARM SVE first-fault helpers as proof that there is another way.

Otherwise, all of the same comments from the normal loads apply.


r~

