Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B75FC02182
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 18:22:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1taItP-0006tv-Kz; Tue, 21 Jan 2025 13:22:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taItJ-0006o6-SG
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 13:22:22 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taItE-0000S0-9k
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 13:22:21 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-436202dd7f6so69204105e9.0
 for <qemu-riscv@nongnu.org>; Tue, 21 Jan 2025 10:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737483732; x=1738088532; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mrPZQDzms8mBGEhRALhXb1qTfXO5XhH+ZdNL3PgKFa0=;
 b=zX9HnhOusO/Ax8yrJqyEH3h2gaEO+BHYWXxGg96FrwukLHPId7yh9IxiJpqT5FOxLg
 lQWJQk6z+Z/3Zvrh1yZevhO70bRs3iq5FAvvDRcTTKiwrxA6q3XtycKFkgTqHZqK1nVq
 AJq8bqVx8w7aedJg+cPKOnpMFZMiTjdD6IJ0usxMGV0Gf0pZzUVCNkG5Qk/V7tJs5A8D
 8eV5YjVzk7UfsVsLyVk0FXaFrazPl7mLiFhbgoNelNHI/rCXRL17viP6tBHsoEMeEw4S
 rvEDWKqM6SdSTfmLm7ctSwVfhhoIDOP1NtrhRhexYdx9n0zm82bFayHQaf056WMhuwNZ
 K99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737483732; x=1738088532;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mrPZQDzms8mBGEhRALhXb1qTfXO5XhH+ZdNL3PgKFa0=;
 b=pT/KlzAhk1iDeTFDx/Fq6FM13WWEk0Na88zCdzZwY3vEsMWPHxwiJxnxwupLQ7yPeb
 IMbof6h+nL/f3XiJxlH4CqussoezxgqyrxYliaKi9+YKMnOYfsX1xSLixMm+qXSxduDf
 rygP4vBMGdu+rJ6gCCP6JSp8NrtFsrLJWtFOdJHmRrW5dWcMQ9S6rGhbrSG1Y1jov/YY
 xqTydqOKTXM2URRj+g6FzmwsWcehxbnA89cQwe9xI5yb0wZ8kdgZ0LF3bnOGeyWgeIaY
 phgl0E/GRfPC6J2FZ0zpuh+5TgLr4vpmBaoXONBUTv8Ti84/qtPpxnLKX5mZKKcMOnFJ
 Hg9Q==
X-Gm-Message-State: AOJu0Yy1YdG59kpYgkJ/YI0OM97/uN7HJ/8NHA9wK3ZywAzNRrprYhla
 v+qR3WD/fff1UbSqiga57kn9hlNbXF55rRlisw/2aGCCFPcXTYZqtWZlmFeaHso=
X-Gm-Gg: ASbGncuGe0/Fvr2lvWsvxw0ZwOVnhix4I+HFqs9z/igpE36UQjp7TEBPF0NwPg+X4V0
 NegxXQSrvIT+wXvHMUoHcAkC/wXdjSIeGZqKsklukJAbkRkZeEX4iHWGwiHojFVbti68v6qu02/
 z+cbZ1IxZhwtmZQg8Bhj2udLy5Q1WGeaRz4k60mPzbOt0nSxe/HwDpOOgX5P81s8fbfbiTPU7/X
 AEjCPa719DE3Qa60S3XnEhB/M01d9rTe1QVmVLLLcfJsafwUMKY+dbG/L5fbi73Z/qpqy2Kcpj3
 1fnFWyj4ugQsi/oArCeVVcS1nqAYNkB7wlrnew==
X-Google-Smtp-Source: AGHT+IGOUjAg7lHe1XSgaS53ATmwTHEppR1Rhy9SaB4yEw6eDuKOJmxDboSWjFPRyeVawAGT4+edUw==
X-Received: by 2002:a05:600c:1da1:b0:434:a202:7a0d with SMTP id
 5b1f17b1804b1-4389141c227mr153198725e9.22.1737483731964; 
 Tue, 21 Jan 2025 10:22:11 -0800 (PST)
Received: from [192.168.69.181] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43890408a66sm191775905e9.5.2025.01.21.10.22.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2025 10:22:11 -0800 (PST)
Message-ID: <93f508f5-d38c-4565-be45-eeec3428208a@linaro.org>
Date: Tue, 21 Jan 2025 19:22:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] target/riscv/debug.c: use wp size = 4 for 32-bit
 CPUs
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org
References: <20250121170626.1992570-1-dbarboza@ventanamicro.com>
 <20250121170626.1992570-2-dbarboza@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250121170626.1992570-2-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 21/1/25 18:06, Daniel Henrique Barboza wrote:
> The mcontrol select bit (19) is always zero, meaning our triggers will
> always match virtual addresses. In this condition, if the user does not
> specify a size for the trigger, the access size defaults to XLEN.
> 
> At this moment we're using def_size = 8 regardless of CPU XLEN. Use
> def_size = 4 in case we're running 32 bits.
> 
> Fixes: 95799e36c1 ("target/riscv: Add initial support for the Sdtrig extension")
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/debug.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index f6241a80be..9db4048523 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -478,7 +478,7 @@ static void type2_breakpoint_insert(CPURISCVState *env, target_ulong index)
>       bool enabled = type2_breakpoint_enabled(ctrl);
>       CPUState *cs = env_cpu(env);
>       int flags = BP_CPU | BP_STOP_BEFORE_ACCESS;
> -    uint32_t size;
> +    uint32_t size, def_size;
>   
>       if (!enabled) {
>           return;
> @@ -501,7 +501,9 @@ static void type2_breakpoint_insert(CPURISCVState *env, target_ulong index)
>               cpu_watchpoint_insert(cs, addr, size, flags,
>                                     &env->cpu_watchpoint[index]);
>           } else {
> -            cpu_watchpoint_insert(cs, addr, 8, flags,
> +            def_size = riscv_cpu_mxl(env) == MXL_RV64 ? 8 : 4;

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


