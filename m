Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B19E7717F
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 13:55:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tNBXs-0001G0-5s; Mon, 16 Dec 2024 08:54:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tNBXj-0001Eb-T5
 for qemu-riscv@nongnu.org; Mon, 16 Dec 2024 08:53:52 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tNBXh-0005Tl-3f
 for qemu-riscv@nongnu.org; Mon, 16 Dec 2024 08:53:51 -0500
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-728d1a2f180so3034757b3a.1
 for <qemu-riscv@nongnu.org>; Mon, 16 Dec 2024 05:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1734357227; x=1734962027; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yaDCrhNFZ3VskkX9nHUszSgsRxopCsMl5xDPmeAyCJc=;
 b=RiBE71Rc/MXPzLh0+VLmNFyfbjeL/E8jieElaVj9pvC7DbZ1bYQVlXP16DkNtsoO/p
 qEZraa4SelexvYIdpPJnMm/f/cz2ggpXq6ZM2LaKQ9iFSfw1R3xMNcJoAo4m8SIEyBQ2
 T5rN6pP39mHFXFmqqe97GLjad4cYG70f18x3pJ3uMdDVx/w7uIlLAfRoJjjqal01bBoW
 QZPL1YTce59sDqPwp3JvSxC7syp0J/OAAXVnx5efFTvRHmJFsVpwYGx1OllZ6bIs4J0s
 2hCt7qpAXTAfGrjnNqcD7B+DLVYxjRpOu3pi2xTecpTelcoXSgqWQ90IEd8/h8Q9wDKb
 4RTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734357227; x=1734962027;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yaDCrhNFZ3VskkX9nHUszSgsRxopCsMl5xDPmeAyCJc=;
 b=ablAYLfDdc09tJr30+Kl6O0Qy8F8i9cFaxFGbaQIm9E0WKRRzG86Dr6PNZ6DzMIL6U
 d1fgLXUi9PznrUwIb0f1AfJ6fZ/7ztZD/qeeJ5ZByTMisaVdOv/+D77q8roo76utL1sR
 GC2gXOgb6YD1htpPjd+7t4vwzcQOI1tecE7OI7uzzgmxz42q7OBvP9/KcAnp0wdZBju/
 b20bDxxMtJzd4o2B9o8ScCMdAF4AzVN9yYkPJZgrxXX/efxFoRREDWEQoMyvjA4mrdah
 jzxsnYAIfczBG/F2frlMUsPyUy+Gk0i/XZkN2oQxMa6ACjRIUaL2qHnn1AILMZce4xSo
 374w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2csynS2x7rf5Xdcq7fQ3t8ZzQwZWBU/EkqAPNd5KInvwTib5XAi8DRFY+yu30Y4OUaRfUwZ06eRGE@nongnu.org
X-Gm-Message-State: AOJu0Yy97Kes9Uj+YfDdy4zOrFJp6c3VTYK7dVqBxJsMoTYqZWt82gqP
 hoDao4w8s2GNx8MCeigKlKhYEJstp+uaSfOu/APhqg/BTPnbGjf8Llr5CG58xBE=
X-Gm-Gg: ASbGncu+s9J+WBkWpGni6daV7oOjMNrKrQfGZzgoQEzxpFm1vRCmbv5ZCRt6ZdKvAgy
 cG6c3WNgJL5+g2n0wpJXQ8hjFQsvfAYambXmCaSv8CQMO1dY/lBAFihOlzFEokdSYKsU/vfxXTv
 D3bC19fgxGCA8tmeiZrK0xp0mvNd/cb1yFU2x4C5TlbZ8TYSNGYvGHCWJUxKFcWPD8FFB2ett0i
 G4ax4JZHRVpOSupHHveQofLB5VthZmCfKmuvQTERPApwEnYF0q45/Y5mE+YLLNxAN7f5Q==
X-Google-Smtp-Source: AGHT+IEWtWAfe7Nye2d08QH7Rck6AWUWZkxlEg6Yn1nCBSQ3Gu8FPgYDScB7I0hevMNLQqMVP2fUuw==
X-Received: by 2002:a05:6a00:2905:b0:724:db17:f975 with SMTP id
 d2e1a72fcca58-7290c74ca77mr20357409b3a.12.1734357227497; 
 Mon, 16 Dec 2024 05:53:47 -0800 (PST)
Received: from [192.168.68.110] ([187.101.65.72])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72918ac52d7sm4717603b3a.3.2024.12.16.05.53.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 05:53:47 -0800 (PST)
Message-ID: <d5880ccb-fa39-4f50-b0a9-2dc5ae3cf470@ventanamicro.com>
Date: Mon, 16 Dec 2024 10:53:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/7] target/riscv: Add helper functions to calculate
 current number of masked bits for pointer masking
To: baturo.alexey@gmail.com
Cc: richard.henderson@linaro.org, zhiwei_liu@linux.alibaba.com,
 liwei1518@gmail.com, alistair23@gmail.com, frank.chang@sifive.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20241216121907.660504-1-baturo.alexey@gmail.com>
 <20241216121907.660504-4-baturo.alexey@gmail.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20241216121907.660504-4-baturo.alexey@gmail.com>
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



On 12/16/24 9:19 AM, baturo.alexey@gmail.com wrote:
> From: Alexey Baturo <baturo.alexey@gmail.com>
> 
> Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.h        |  5 +++
>   target/riscv/cpu_helper.c | 73 +++++++++++++++++++++++++++++++++++++++
>   2 files changed, 78 insertions(+)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 417ff45544..e7f346ff6b 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -768,8 +768,13 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
>   
>   bool riscv_cpu_is_32bit(RISCVCPU *cpu);
>   
> +bool riscv_cpu_virt_mem_enabled(CPURISCVState *env);
> +RISCVPmPmm riscv_pm_get_pmm(CPURISCVState *env);
> +uint32_t riscv_pm_get_pmlen(RISCVPmPmm pmm);
> +
>   RISCVException riscv_csrr(CPURISCVState *env, int csrno,
>                             target_ulong *ret_value);
> +
>   RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
>                              target_ulong *ret_value,
>                              target_ulong new_value, target_ulong write_mask);
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index dba04851d5..ed0d275e84 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -214,6 +214,79 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
>       *pflags = flags;
>   }
>   
> +RISCVPmPmm riscv_pm_get_pmm(CPURISCVState *env)
> +{
> +    RISCVPmPmm pmm = PMM_FIELD_DISABLED;
> +#ifndef CONFIG_USER_ONLY
> +    if (get_field(env->mstatus, MSTATUS_MPRV) &&
> +        get_field(env->mstatus, MSTATUS_MXR)) {
> +        return pmm;
> +    }
> +    int priv_mode = cpu_address_mode(env);
> +    /* Get current PMM field */
> +    switch (priv_mode) {
> +    case PRV_M:
> +        if (riscv_cpu_cfg(env)->ext_smmpm) {
> +            pmm = get_field(env->mseccfg, MSECCFG_PMM);
> +        }
> +        break;
> +    case PRV_S:
> +        if (riscv_cpu_cfg(env)->ext_smnpm) {
> +            if (get_field(env->mstatus, MSTATUS_MPV)) {
> +                pmm = get_field(env->henvcfg, HENVCFG_PMM);
> +            } else {
> +                pmm = get_field(env->menvcfg, MENVCFG_PMM);
> +            }
> +        }
> +        break;
> +    case PRV_U:
> +        if (riscv_has_ext(env, RVS)) {
> +            if (riscv_cpu_cfg(env)->ext_ssnpm) {
> +                pmm = get_field(env->senvcfg, SENVCFG_PMM);
> +            }
> +        } else {
> +            if (riscv_cpu_cfg(env)->ext_smnpm) {
> +                pmm = get_field(env->menvcfg, MENVCFG_PMM);
> +            }
> +        }
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +#endif
> +    return pmm;
> +}
> +
> +bool riscv_cpu_virt_mem_enabled(CPURISCVState *env)
> +{
> +    bool virt_mem_en = false;
> +#ifndef CONFIG_USER_ONLY
> +    int satp_mode = 0;
> +    int priv_mode = cpu_address_mode(env);
> +    if (riscv_cpu_mxl(env) == MXL_RV32) {
> +        satp_mode = get_field(env->satp, SATP32_MODE);
> +    } else {
> +        satp_mode = get_field(env->satp, SATP64_MODE);
> +    }
> +    virt_mem_en = ((satp_mode != VM_1_10_MBARE) && (priv_mode != PRV_M));
> +#endif
> +    return virt_mem_en;
> +}
> +
> +uint32_t riscv_pm_get_pmlen(RISCVPmPmm pmm)
> +{
> +    switch (pmm) {
> +    case PMM_FIELD_DISABLED:
> +        return 0;
> +    case PMM_FIELD_PMLEN7:
> +        return 7;
> +    case PMM_FIELD_PMLEN16:
> +        return 16;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
>   #ifndef CONFIG_USER_ONLY
>   
>   /*


