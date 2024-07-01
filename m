Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3CBC2BD09
	for <qemu-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 15:10:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sOIfp-0002JS-RB; Mon, 01 Jul 2024 11:10:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOIfa-0002EP-QC
 for qemu-riscv@nongnu.org; Mon, 01 Jul 2024 11:10:23 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOIfZ-0003fD-2Y
 for qemu-riscv@nongnu.org; Mon, 01 Jul 2024 11:10:18 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-42564316479so19882295e9.2
 for <qemu-riscv@nongnu.org>; Mon, 01 Jul 2024 08:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719846614; x=1720451414; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F24z2j7x81l81dJYDR6KuJGiOKJMeNP+dVkqB+tPkfs=;
 b=Nl941wM8ffGj07F4Mm2MWbGg524RTQrhT7/x6E5gGU/boN6GgV9+JIGm4GdNCx6/fy
 wCMBnCc/wAR5GgtXzgwarQte9wcUpbqk2dY4cYqV2MaBOylABd7GI/lMg3w2R12gvniS
 zzQypu/9kK9g4N2eK54z02ngr25jcci8uSWVjoQGcKNVww5m5ke3H5iNGO9cOfKu7ekZ
 TDK8z9yqBA4J4WVlF7K7pEkUpaECqnIMK+fsVYKDJhKKlCyv77YalToSfCZcCheXCqBq
 OKQI4IF87300rBxsHRAczUIjAUpBS7YSXygBh/zTNYKjY2UYi4KwbHkui+fknQDfET3u
 wVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719846614; x=1720451414;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F24z2j7x81l81dJYDR6KuJGiOKJMeNP+dVkqB+tPkfs=;
 b=EEPwlUb/7lT00e8vvz+SJHDnlTj4xz1vcoVHwHPoWuNWgLEzKYAZEUw1nKnq9hjilY
 vlngulNjoTNS0gEQWkP/NHIPy7ck+623K18Tj13c4FRraVdfrXRrU8/uMcZNR2AqNoSm
 NrwHi8TozLC2pL7iTruOcShfWzsD2351iD70n9lvocD3xyu+ohNC2+0G106h2VQqF1HI
 OsuK+Y5cEeL1yWCaeeuWMarvL/iaEpFyZxGaGkvGRQSaCwfVF7aGTb5DMo1OpKTvxmbh
 xDObMy1fwRR7OIzrjmHURnXkjree9swcQmaHlo+laQYSu3G3Q0au9PWteeV7pWxhXgMZ
 1gXw==
X-Gm-Message-State: AOJu0YwXON3FapAWtyFzku9yNU4+uLHzbTmLn4mCnEXcT+FMgfC9gubZ
 lXl4tzJ83jI7T+LJRAWPrcZH9pv49mj0ndE5Isgyzx7xTXalQorXQfKA079UTEQ=
X-Google-Smtp-Source: AGHT+IFkNPQxKvjIlXFhaAf3iRfC8iv6NY+viWqwdK7ZWnVOB5yrgVTUPsNrFVKBLXaojOs+QLAfIQ==
X-Received: by 2002:a05:600c:1604:b0:425:5f0e:bb69 with SMTP id
 5b1f17b1804b1-4257a05f0a6mr37350135e9.38.1719846614385; 
 Mon, 01 Jul 2024 08:10:14 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.177.159])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0fba0bsm10256194f8f.69.2024.07.01.08.10.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 08:10:13 -0700 (PDT)
Message-ID: <2ea8672a-cf36-45c3-850b-f7513e9052a6@linaro.org>
Date: Mon, 1 Jul 2024 17:10:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] target/riscv: Correct SXL return value for RV32 in
 RV64 QEMU
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 dbarboza@ventanamicro.com, liwei1518@gmail.com, bmeng.cn@gmail.com,
 TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>
References: <20240701033722.954-1-zhiwei_liu@linux.alibaba.com>
 <20240701033722.954-4-zhiwei_liu@linux.alibaba.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240701033722.954-4-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

Hi Tiancheng, Zhiwei,

On 1/7/24 05:37, LIU Zhiwei wrote:
> From: TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>
> 
> Ensure that riscv_cpu_sxl returns MXL_RV32 when runningRV32 in an
> RV64 QEMU.
> 
> Signed-off-by: TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>
> Fixes: 05e6ca5e156 ("target/riscv: Ignore reserved bits in PTE for RV64")
> Reviewed-by: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
>   target/riscv/cpu.h | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 6fe0d712b4..36a712044a 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -668,8 +668,11 @@ static inline RISCVMXL riscv_cpu_sxl(CPURISCVState *env)
>   #ifdef CONFIG_USER_ONLY
>       return env->misa_mxl;
>   #else
> -    return get_field(env->mstatus, MSTATUS64_SXL);
> +    if (env->misa_mxl != MXL_RV32) {
> +        return get_field(env->mstatus, MSTATUS64_SXL);
> +    }
>   #endif
> +    return MXL_RV32;

Can we simplify the previous TARGET_RISCV32 ifdef'ry?

>   }
>   #endif
>   


