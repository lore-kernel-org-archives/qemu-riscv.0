Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329FECDB482
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 12:51:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qt618-00089M-5V; Wed, 18 Oct 2023 08:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qt617-00088m-9l
 for qemu-riscv@nongnu.org; Wed, 18 Oct 2023 08:51:17 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qt614-0004cJ-K6
 for qemu-riscv@nongnu.org; Wed, 18 Oct 2023 08:51:17 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-6bce254ba56so2961687b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 18 Oct 2023 05:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697633473; x=1698238273; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EBZBBDdf3HXDtGLWT/f+y7dfSuMJTv1x0dA0Nohhe54=;
 b=Dj8kOu3izNv0aJPJmq4U0qd7EUUraOhqj62oaq17wpaIzmqWIwitdKRfaylQZVunkq
 nGCEQK3G5zVRFkCdoB2REC97dF9NDtzEV+EGCDFQ0KbjpCTdvGtarh3MtrNH9uLx5yeu
 f8AkoQk9IkEJJ3LHKvlk2r4dxZkkD6eDQuh0N10comFGR+uqA65/uw58rQR74kTxd7pc
 VexcmWNgss7SiB+85RlvcJPmOKl04dUtyCgV39XYdta1R7nEwEduggXWd0rvhOznVGoC
 Pklm8Y5Y5Kjhnc8JJajHTNfF4TY987ZP9Vnp1qSNCN2I5YMGGNmfe8UhppweHHhcl5iJ
 evqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697633473; x=1698238273;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EBZBBDdf3HXDtGLWT/f+y7dfSuMJTv1x0dA0Nohhe54=;
 b=wzIb/m4J35nPd+wj276aiUzHUAFLp8009zxoeY77i2BRneNiR+dzjsIzCoKIazGFgG
 Mzh08nBwBkIFKu9o2nIomVXyM8WblBXEJc1U8thFqFW8O5Kxnnhi6BCCfZxXG3AvHk3Y
 ECAjHrc4FGBog8ItxBw/IQlyyYiYw7GdiMfwWapnZDYKbf+OrIBsFqWBq4pWZs0905wF
 Hg51paOYzOWmKYYuj5mYlhZp1ulH1xXETtKrDawP9IEiCTEawnXQ5oY2Z1qjfn0uN1gH
 urRP7ZTJ7PwfhtZ0uF5ZafVIdJNfEsRMmpePTPdI2iazX2TUkKGg7mXNSEb2Cpd1a4Ri
 hJYQ==
X-Gm-Message-State: AOJu0YzZcITt9U5Ekn3VtoC7ikbHX91xuTZMvvz4/w5MU6hU10jGsUlF
 WZrg593ll/NhPzf7N544C7MZ5Q==
X-Google-Smtp-Source: AGHT+IE1QM0fVyIq9YrnvX23yvimXIyin3cyPnWnwLkrtReC0O31IhaMOLtGZaeYEuw5jtOe51JKxA==
X-Received: by 2002:a05:6a00:854:b0:6be:43f8:4e0b with SMTP id
 q20-20020a056a00085400b006be43f84e0bmr5651333pfk.24.1697633472831; 
 Wed, 18 Oct 2023 05:51:12 -0700 (PDT)
Received: from [192.168.68.107] ([177.45.186.249])
 by smtp.gmail.com with ESMTPSA id
 z21-20020aa79f95000000b0063b898b3502sm3222315pfr.153.2023.10.18.05.51.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Oct 2023 05:51:12 -0700 (PDT)
Message-ID: <642eaef2-ebcb-4ae8-8fa7-b9e400b95903@ventanamicro.com>
Date: Wed, 18 Oct 2023 09:51:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] target/riscv: Remove misa_mxl validation
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov
 <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
References: <20231017185406.13381-1-akihiko.odaki@daynix.com>
 <20231017185406.13381-3-akihiko.odaki@daynix.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231017185406.13381-3-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42e.google.com
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



On 10/17/23 15:53, Akihiko Odaki wrote:
> It is initialized with a simple assignment and there is little room for
> error. In fact, the validation is even more complex.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/tcg/tcg-cpu.c | 13 ++-----------
>   1 file changed, 2 insertions(+), 11 deletions(-)
> 
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index a28918ab30..7f45e42000 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -148,7 +148,7 @@ static void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **errp)
>       }
>   }
>   
> -static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
> +static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu)
>   {
>       RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
>       CPUClass *cc = CPU_CLASS(mcc);
> @@ -168,11 +168,6 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
>       default:
>           g_assert_not_reached();
>       }
> -
> -    if (env->misa_mxl_max != env->misa_mxl) {
> -        error_setg(errp, "misa_mxl_max must be equal to misa_mxl");
> -        return;
> -    }
>   }
>   
>   static void riscv_cpu_validate_priv_spec(RISCVCPU *cpu, Error **errp)
> @@ -573,11 +568,7 @@ static bool tcg_cpu_realize(CPUState *cs, Error **errp)
>           return false;
>       }
>   
> -    riscv_cpu_validate_misa_mxl(cpu, &local_err);
> -    if (local_err != NULL) {
> -        error_propagate(errp, local_err);
> -        return false;
> -    }
> +    riscv_cpu_validate_misa_mxl(cpu);
>   
>       riscv_cpu_validate_priv_spec(cpu, &local_err);
>       if (local_err != NULL) {

