Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF960C47422
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Jan 2024 10:39:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rTJbp-0006i3-R1; Fri, 26 Jan 2024 05:38:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rTJbp-0006hC-9N
 for qemu-riscv@nongnu.org; Fri, 26 Jan 2024 05:38:53 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rTJbm-0006i0-6a
 for qemu-riscv@nongnu.org; Fri, 26 Jan 2024 05:38:52 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40e7065b692so2911005e9.3
 for <qemu-riscv@nongnu.org>; Fri, 26 Jan 2024 02:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706265528; x=1706870328; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mGEceRpzawgur6mwKEf1okcVHBJoqqu1g4hBfqZOOeY=;
 b=jmM5MHg+HCL/wFtSuS36zLq1iC8Tk85l10ycVUqQ86cB2Dg0y/FZgK/uT/UGsaPhG1
 7kVT80lp0p6nLtLtAtqmcltO2AZfF9GpslKko9+hNz6Yst8k5nL8UMv4mMMf++zS/+r/
 xevIdq6oFZtoFG3qK0z2E34VtMdf3WQFCj0kZj5t/XnXtSj99s0keLi6Kiyl0Fz8VmdI
 AlK44+PApKybOPMac6UYxyXFwWn7zf8D2MnW0GtWHZJMY2RjheZQND3bjwdzk36w5fow
 QCf7/Q3NAfVXh7o3uU1PWVbd0T1qkjSiCK7iYUXD+RYe2NmLo1ShOhk14HMk+IBBjJbj
 1Ayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706265528; x=1706870328;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mGEceRpzawgur6mwKEf1okcVHBJoqqu1g4hBfqZOOeY=;
 b=WGu+Q3RYfsvtClH482mRWN/wQkXvOqC1/y4L0pLyBr6d2HchidOs+SpnYQuJ2eU/6Y
 SIkkQJbPNhZc3VRzmTm5SUgEJW5+YxF8lrP0q+ANHYyiYPM3G+NCrJsc7CDQA25G4/Zp
 excvIqenjXVU0zr+sSbvuRFOQ0g1MaY114/Nb/hNeP3Hft7mZlpFOc9sJWtFpj8kxBWX
 GyndcqqqfaRRqkASRwoxjHx7WncJA+w7HNLbTjmkRVcXLw4y0gfSTajHwsN9cpaKVEYY
 d8FLtVyWJ0YqTTIABkDSbrZacn4b0EGL/JRC2iBDkN9CAbvRmgkui16Blmn8p2hto2Th
 hIhg==
X-Gm-Message-State: AOJu0YydT1HZk4xnpYVnsYHeSqK6cVzp01gFGIfZqmz7ScMU7/mI/Zhl
 kwdXjaGCly2YfHxCQxh0HwHwG3vL6gImY1Xqs0elWQMeSqx1+gtQQuvbodaMPRs=
X-Google-Smtp-Source: AGHT+IGgajcAerkUFRaQcgH0uxTDapYVMfxhQbjaSzODJ/d3kmOhpPq3X0OwB4NBBDnOhxOMLRHS+A==
X-Received: by 2002:a7b:c8c9:0:b0:40e:bffb:ba19 with SMTP id
 f9-20020a7bc8c9000000b0040ebffbba19mr731249wml.48.1706265528398; 
 Fri, 26 Jan 2024 02:38:48 -0800 (PST)
Received: from [192.168.69.100] ([176.176.142.39])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a05600c384d00b0040e4a7a7ca3sm1454671wmr.43.2024.01.26.02.38.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jan 2024 02:38:48 -0800 (PST)
Message-ID: <1128019c-adca-4cd4-aa73-937001ad990a@linaro.org>
Date: Fri, 26 Jan 2024 11:38:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] scripts/coccinelle: Add cpu_env.cocci_template script
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org
References: <20240125165648.49898-1-philmd@linaro.org>
 <20240125165648.49898-2-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240125165648.49898-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 25/1/24 17:56, Philippe Mathieu-Daudé wrote:
> Add a Coccinelle script to convert the following slow path
> (due to the QOM cast macro):
> 
>    &ARCH_CPU(..)->env
> 
> to the following fast path:
> 
>    cpu_env(..)
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   MAINTAINERS                               |  1 +
>   scripts/coccinelle/cpu_env.cocci_template | 60 +++++++++++++++++++++++
>   2 files changed, 61 insertions(+)
>   create mode 100644 scripts/coccinelle/cpu_env.cocci_template


> diff --git a/scripts/coccinelle/cpu_env.cocci_template b/scripts/coccinelle/cpu_env.cocci_template
> new file mode 100644
> index 0000000000..53aa3a1fea
> --- /dev/null
> +++ b/scripts/coccinelle/cpu_env.cocci_template
> @@ -0,0 +1,60 @@
> +/*
> +
> + Convert &ARCH_CPU(..)->env to use cpu_env(..).
> +
> + Rationale: ARCH_CPU() might be slow, being a QOM cast macro.
> +            cpu_env() is its fast equivalent.
> +
> + SPDX-License-Identifier: GPL-2.0-or-later
> + SPDX-FileCopyrightText: Linaro Ltd 2024
> + SPDX-FileContributor: Philippe Mathieu-Daudé
> +
> + Usage as of v8.2.0:
> +
> + $ for targetdir in target/*; do test -d $targetdir || continue; \
> +       export target=${targetdir:7}; \
> +       sed \
> +           -e "s/__CPUArchState__/$( \
> +               git grep -h --no-line-number '@env: #CPU.*State' \
> +                   target/$target/cpu.h \
> +               | sed -n -e 's/.*\(CPU.*State\).\?/\1/p')/g" \
> +           -e "s/__ARCHCPU__/$( \
> +               git grep -h --no-line-number OBJECT_DECLARE_CPU_TYPE.*CPU \
> +                   target/$target/cpu-qom.h \
> +               | sed -n -e 's/.*(\(.*\), .*, .*)/\1/p')/g" \
> +           -e "s/__ARCH_CPU__/$( \
> +               git grep -h --no-line-number OBJECT_DECLARE_CPU_TYPE.*CPU \
> +                   target/$target/cpu-qom.h \
> +               | sed -n -e 's/.*(.*, .*, \(.*\))/\1/p')/g" \
> +       < scripts/coccinelle/cpu_env.cocci_template \
> +       > $TMPDIR/cpu_env_$target.cocci; \
> +       for dir in hw target/$target; do \
> +           spatch --macro-file scripts/cocci-macro-file.h \
> +                  --sp-file $TMPDIR/cpu_env_$target.cocci \
> +                  --keep-comments \
> +                  --dir $dir \
> +                  --in-place; \
> +       done; \
> +   done
> +
> +*/
> +
> +@ CPUState_arg_used @
> +CPUState *cs;
> +identifier cpu;
> +identifier env;
> +@@
> +-   __ARCHCPU__ *cpu = __ARCH_CPU__(cs);

Here we remove ARCH_CPU(), ...

> +-   __CPUArchState__ *env = &cpu->env;
> ++   __CPUArchState__ *env = cpu_env(cs);
> +    ... when != cpu
> +
> +@ depends on never CPUState_arg_used @
> +identifier obj;
> +identifier cpu;
> +identifier env;
> +@@
> +-   __ARCHCPU__ *cpu = __ARCH_CPU__(obj);
> +-   __CPUArchState__ *env = &cpu->env;
> ++   __CPUArchState__ *env = cpu_env(CPU(obj));

... but here we just change it by a CPU() QOM call.
So this 2nd change is just style cleanup.

> +    ... when != cpu


