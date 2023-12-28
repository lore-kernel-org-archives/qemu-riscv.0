Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1CCC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 Dec 2023 23:35:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rIzuO-0007ev-84; Thu, 28 Dec 2023 18:35:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIzuN-0007eg-EI
 for qemu-riscv@nongnu.org; Thu, 28 Dec 2023 18:35:23 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIzuL-0001Sl-PE
 for qemu-riscv@nongnu.org; Thu, 28 Dec 2023 18:35:23 -0500
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-5bdbe2de25fso5028073a12.3
 for <qemu-riscv@nongnu.org>; Thu, 28 Dec 2023 15:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703806520; x=1704411320; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W2CVuWjc0aHfQ2kxa8isvUI7TnL7fKIOqCue126Pnis=;
 b=zhqcNRMoUXCCwCgc6yyqBNnCTa8TQ8H/z0oT+Slwp8S+QIxgbQW7TrrBMXgr2tqML6
 1UYV41i9+Z7VCTd1WAcI9P869aHcmuwNg0dXVDjRYpckRdjG/m8K5fxSKgPHEyMnenLZ
 laGUtK9HHpTzH9muNmPvs951BIDc5VyDvojXYf5D9cczG4Rz7XOmVDBbr3KDwsPmpum7
 2wkgk6wNv9ydt9OQpT6+mtdJUgVVbIe4AVzoqeoU6tWvUQJkG/xannJVDeE7VGYkubEq
 MnvGPJolBq8Z1OVt7g2ApwPjpKAQ4tJ3JOoQ1OniWxT6zohCthcYMR2HOUwpwDhT4vG4
 LDow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703806520; x=1704411320;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W2CVuWjc0aHfQ2kxa8isvUI7TnL7fKIOqCue126Pnis=;
 b=RTn/sCXSOM9pr5/qdbxfaj6KgT2C+jKumEOr9mwmfVQw4dZ0lqf37ErKpzJ9G4ZYrM
 43/tbGViZLaBEev9J31IYz4ecuuyc4oNOz796naaq6HDy/MAulQ5Ye0Eg5FtcbXPZSEV
 mCJPU0245PKPqWOQXg/Ertikh6dQHjfvHQzh2bKz5V9VY9zWrg2mrVOAaREPTQAa045B
 dyQeOnnqUaXjA0H+Yc01eGyPmse9fewfmH4optKpRCTfxpr5D3YMdiXlNmlWknP1V8WP
 RiVLYZ/Mfx638WdXHNoeFinn2rm0Q31DY0cdKj1fzIZEtoljyBjDmwHAB40QvnvCMOlu
 VwiA==
X-Gm-Message-State: AOJu0YwMG0BPFAXn4UseU85QYnrhGZyYa0c9O5rrm/523HeTeqd3YB6A
 KBmMEhtl/kri8BRnpJZIilylz3XpDEffPQ==
X-Google-Smtp-Source: AGHT+IGwZbxNDOHL1fj5BFEnqxoeXRhlxPqAm5pA9TtMUKc1GgjZ/Ko773iRlU35YJSkRaClZy7+UQ==
X-Received: by 2002:a05:6a20:3caa:b0:196:23dd:15c5 with SMTP id
 b42-20020a056a203caa00b0019623dd15c5mr3828975pzj.113.1703806520397; 
 Thu, 28 Dec 2023 15:35:20 -0800 (PST)
Received: from ?IPV6:2001:8003:c020:6900:324d:cbc2:5f8b:3a9d?
 ([2001:8003:c020:6900:324d:cbc2:5f8b:3a9d])
 by smtp.gmail.com with ESMTPSA id
 e27-20020a056a0000db00b006d9bf71461asm7105954pfj.86.2023.12.28.15.35.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Dec 2023 15:35:20 -0800 (PST)
Message-ID: <127b5fc3-b852-4d5c-b53b-1fafcf22cd1f@linaro.org>
Date: Fri, 29 Dec 2023 10:35:15 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] target/riscv: Add helper functions to calculate
 current number of masked bits for pointer masking
Content-Language: en-US
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20231224044812.2072140-1-me@deliversmonkey.space>
 <20231224044812.2072140-4-me@deliversmonkey.space>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231224044812.2072140-4-me@deliversmonkey.space>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 12/24/23 15:48, Alexey Baturo wrote:
> From: Alexey Baturo <baturo.alexey@gmail.com>
> 
> Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
> ---
>   target/riscv/cpu.h        |  4 +++
>   target/riscv/cpu_helper.c | 54 +++++++++++++++++++++++++++++++++++++++
>   2 files changed, 58 insertions(+)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index bd379ee653..c607a94bba 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -672,6 +672,10 @@ static inline uint32_t vext_get_vlmax(RISCVCPU *cpu, target_ulong vtype)
>   void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
>                             uint64_t *cs_base, uint32_t *pflags);
>   
> +bool riscv_cpu_bare_mode(CPURISCVState *env);
> +RISCVPmPmm riscv_pm_get_pmm(CPURISCVState *env);
> +int riscv_pm_get_pmlen(RISCVPmPmm pmm);
> +
>   RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
>                              target_ulong *ret_value,
>                              target_ulong new_value, target_ulong write_mask);
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index a3d477d226..47f325294e 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -139,6 +139,60 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
>       *pflags = flags;
>   }
>   
> +RISCVPmPmm riscv_pm_get_pmm(CPURISCVState *env)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    int priv_mode = cpu_address_mode(env);
> +    int pmm = 0;
> +    /* Get current PMM field */
> +    switch (priv_mode) {
> +    case PRV_M:
> +        pmm = riscv_cpu_cfg(env)->ext_smmpm ?
> +                  get_field(env->mseccfg, MSECCFG_PMM) : PMM_FIELD_DISABLED;
> +        break;
> +    case PRV_S:
> +        pmm = riscv_cpu_cfg(env)->ext_smnpm ?
> +                  get_field(env->menvcfg, MENVCFG_PMM) : PMM_FIELD_DISABLED;
> +        break;
> +    case PRV_U:
> +        pmm = riscv_cpu_cfg(env)->ext_ssnpm ?
> +                  get_field(env->senvcfg, SENVCFG_PMM) : PMM_FIELD_DISABLED;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +    return pmm;
> +#endif
> +}
> +
> +bool riscv_cpu_bare_mode(CPURISCVState *env)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    int satp_mode = 0;
> +    if (riscv_cpu_mxl(env) == MXL_RV32) {
> +        satp_mode = get_field(env->satp, SATP32_MODE);
> +    } else {
> +        satp_mode = get_field(env->satp, SATP64_MODE);
> +    }
> +    return (satp_mode == VM_1_10_MBARE);
> +#endif
> +}

You can't leave these with no return statement for CONFIG_USER_ONLY.
You probably don't need the ifdef at all, come to that.


r~

