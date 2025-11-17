Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FB1CEBF61
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 13:53:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vKzfP-00010q-C7; Mon, 17 Nov 2025 08:53:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vKzfN-00010S-IL
 for qemu-riscv@nongnu.org; Mon, 17 Nov 2025 08:53:13 -0500
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vKzfL-0006Av-1W
 for qemu-riscv@nongnu.org; Mon, 17 Nov 2025 08:53:13 -0500
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-7c6e815310aso2592686a34.0
 for <qemu-riscv@nongnu.org>; Mon, 17 Nov 2025 05:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1763387589; x=1763992389; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pKOwGlucEY0SY1j6P6zOF33hJTwbsCHI7p4R8JmoEr0=;
 b=ipD4qoYM6Qjt7gWQsG5/Yf7Bk05zbnYqNgUgIKcDnGNi+j3c4RB5fxY6m5GMI95tf/
 dJtXyZV+6rTMbxp3xk36EcwRaPRCtbV7rYitnlXpXE5w29n+Hagdw8YE7nRNYHjWbaWS
 tBJrwTKXfy71wwqe/r018W42mokb0rswhd68SLGtnZ7/Iz4iTkQjuCYJozqFvCVc45Qg
 BsWHIfr3WeyyKLhu6I5hvsSrYAEdm2Nhog8G8ogx3yYsskphTIm+M8IJHyhERCPQzIxo
 4Q1lh/bl4K8tlNCqDh5vLGaATh+Yx0zzt8FfZm6d9vwCGvxDmHlREC3KUQJJrdfmwj7X
 YFVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763387589; x=1763992389;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pKOwGlucEY0SY1j6P6zOF33hJTwbsCHI7p4R8JmoEr0=;
 b=FUsKDTpcNI8/Mrgfx2gFD1KuJ5ae0qWopLFQ0R7MCfLcCy0XZmYoxGizTZZ7MTHsKI
 KkJ3qkoJCW8tF8yGbxsstHEWcq10SlL4wUXJag3ejFieGdSFpJJAaqSArr4K5PjKcQUX
 k7Hl/q/6KRWL2kk97SPBNmsVtfm9nYjzM4p8+SWpoZTmnF2qedgvjPDRw+ZTYYRkvrYW
 VkHLZlzGFKLVW7plPT+zYSKrl0riBbWsTayE32pYkS8XcUu0SXy9QgRudoE4HAhFg7Bs
 q0F+aZJqQeOJmDCXx9lpelgWQ718bl8ijZ89F6d0m/Eywthb9bL9nkRmy3AXs7YRUY+0
 DFkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTyAvOf7YNYMa+W8UFJFDN2IutTtA1xZfnEy71sKstpsGJ2uTvOtYweXqe8maHJN/N0VuoqR1iw7gh@nongnu.org
X-Gm-Message-State: AOJu0Ywf7Vu09rBKZSRS+XY0oLxjpKkMguADtq3AHErAmmivjJT9/15i
 5tpo7TtaVjApwIEpZaq8IxxAE689Hze982yKVbP+v2ZaTs2QtTjtrt5h5FPj+qvQAOI=
X-Gm-Gg: ASbGnct1uVstlp6bsIesifrUDQ+tPPDl//fnyq3o+uFyeZiY6oev1IB0PZTVpdl+PLW
 M7BkPBIVwj0ZIVn3g+K9MTWKdgOm4t7HUxY39mTLfZ2xCShfOErIKncjexE7RQWcg0RQ6gN17kl
 mYEgHs6hVj/LJ3b3CJZMniWQIlh+BlJj9Tf6QnnhoMyM76l0ZPpBXbhnFE1lMLQlpIhTIF0kP+E
 VeSD2k9p1TKwvSD3CKOT31McsJDilKnz8/T1lChd5QstWtybXhmbCjGM9Qnx2FjMWEfTO6TbTeY
 5dg+OTxbtEPIPFyY4EH3J7yUFOeI/v+WS1UBjcUYGWwYW43UoIA3bhgjrfETSqgtCuCwSnyC6OY
 vjfmxmZE+pm5D9M2IhAx+WXNsXXNlkR/U4fg46uHgh90UeFCIeMchCkUEbvWrN6NNq2Qujihm+p
 wPc4I3qGy2xRdtZlBV/D4skr6DeNQndwF3pyz/
X-Google-Smtp-Source: AGHT+IG9FX3mNDVH5zLtWNSDQhhO50aWFuQSVHi+W/+GJOqnWnlqrs16xLLj3s890Kvy3V8v9jo+Dg==
X-Received: by 2002:a05:6808:86ab:b0:450:c976:496c with SMTP id
 5614622812f47-450c9764f15mr1165418b6e.3.1763387589350; 
 Mon, 17 Nov 2025 05:53:09 -0800 (PST)
Received: from [192.168.68.110] ([191.202.237.26])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7c73a29d72csm5356110a34.14.2025.11.17.05.53.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 05:53:08 -0800 (PST)
Message-ID: <90c8c636-44f2-42fa-804f-de00ac0c664e@ventanamicro.com>
Date: Mon, 17 Nov 2025 10:53:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] target/riscv: Update MISA.C for Zc* extensions
To: frank.chang@sifive.com, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Max Chou <max.chou@sifive.com>
References: <20251114090134.1125646-1-frank.chang@sifive.com>
 <20251114090134.1125646-2-frank.chang@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20251114090134.1125646-2-frank.chang@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x333.google.com
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



On 11/14/25 6:01 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> MISA.C is set if the following extensions are selected:
>    * Zca and not F.
>    * Zca, Zcf and F (but not D) is specified (RV32 only).
>    * Zca, Zcf and Zcd if D is specified (RV32 only).
>    * Zca, Zcd if D is specified (RV64 only).
> 
> Therefore, we need to set MISA.C according to the rules for Zc*
> extensions.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/tcg/tcg-cpu.c | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
> 
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 440626ddfad..da09a2417cc 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -1150,6 +1150,36 @@ static void riscv_cpu_enable_implied_rules(RISCVCPU *cpu)
>       }
>   }
>   
> +/*
> + * MISA.C is set if the following extensions are selected:
> + *   - Zca and not F.
> + *   - Zca, Zcf and F (but not D) is specified on RV32.
> + *   - Zca, Zcf and Zcd if D is specified on RV32.
> + *   - Zca, Zcd if D is specified on RV64.
> + */
> +static void riscv_cpu_update_misa_c(RISCVCPU *cpu)
> +{
> +    CPURISCVState *env = &cpu->env;
> +
> +    if (cpu->cfg.ext_zca && !riscv_has_ext(env, RVF)) {
> +        riscv_cpu_set_misa_ext(env, env->misa_ext | RVC);
> +        return;
> +    }
> +
> +    if (riscv_cpu_mxl(env) == MXL_RV32 &&
> +        cpu->cfg.ext_zca && cpu->cfg.ext_zcf &&
> +        riscv_has_ext(env, RVD) ? cpu->cfg.ext_zcd : riscv_has_ext(env, RVF)) {
> +        riscv_cpu_set_misa_ext(env, env->misa_ext | RVC);
> +        return;
> +    }
> +
> +    if (riscv_cpu_mxl(env) == MXL_RV64 &&
> +        cpu->cfg.ext_zca && cpu->cfg.ext_zcd) {
> +        riscv_cpu_set_misa_ext(env, env->misa_ext | RVC);
> +        return;
> +    }
> +}
> +
>   void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
>   {
>       CPURISCVState *env = &cpu->env;
> @@ -1157,6 +1187,7 @@ void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
>   
>       riscv_cpu_init_implied_exts_rules();
>       riscv_cpu_enable_implied_rules(cpu);
> +    riscv_cpu_update_misa_c(cpu);
>   
>       riscv_cpu_validate_misa_priv(env, &local_err);
>       if (local_err != NULL) {


