Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E45C282DE
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 12:41:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tshrz-0008Kq-Ed; Thu, 13 Mar 2025 08:41:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tshrs-0008G8-GO
 for qemu-riscv@nongnu.org; Thu, 13 Mar 2025 08:40:56 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tshrn-0003TQ-5v
 for qemu-riscv@nongnu.org; Thu, 13 Mar 2025 08:40:56 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2254e0b4b79so23308505ad.2
 for <qemu-riscv@nongnu.org>; Thu, 13 Mar 2025 05:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1741869649; x=1742474449; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J19oiaHRBrxvp66mVfLeas4kFW3rCdjeeeMEfGJnHiM=;
 b=X4w7Twg/KKwGuLl4ArbmPaTfD9QwtJBsijM+k/hQ9BmF8rZn9eGlDT2u4r5jYZed/W
 7BbcYUgmUczPc791TS6jPj4ffNxoauB2O8okShFjXcqkvx5l8o/ltCYMdq3aq2p+m4P6
 VWBCfMJspt96ciSTWm3GuMB47XbSsKZ8Dm5tkNOIYr/bI+OL9n1Inei6bIN9WvhSRhQl
 oegUciQbAFqjsFR/JK8dX2VVTyZTl7xGrJ43HHyDUwDkxlSsRvrBUXPGBWskjWkWPQ5r
 CGp5iWwm9jTE2KELnWXcj51EoZVVU3UxMGIPqIyetMM5mvwQtT5rjfcr6TvM2SdqomKp
 Rl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741869649; x=1742474449;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J19oiaHRBrxvp66mVfLeas4kFW3rCdjeeeMEfGJnHiM=;
 b=q9uSwuvN7w2MSZbk0UVnkUXbroprMiuClAzZDz7u04dCypAN30kMcWOO6bOAa2a7lb
 ix1gOjrnUQZWdI6XqkY/9HgxxSlLa5s/dXFPNKd8PlnL3SO/51dYOQowdzyi1NEqcKwN
 co3sOYFans67wgCQ+0wr3elEmqyZyPDbJHNioIlUzgXa1djjutJxQ8I2m0PQzar1YeEa
 d5YVv1nXVSkFig1mVCOTB/Knn1tV6p2klr0kST9w74gZJkRpcmkUMuO/8EIRLy8zeDsu
 rGe1GeUc7kA8nwLNDLHWZAMYOGi4Q3SIqWjmF6M4P/FF34TlmcLsAUvJgZIjrXJ86iBc
 0Ngg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVu7caNkJd+jh3z9OfeI7ouK5SSoSm4MEEAPwjzbfacoDbPowrihT/6Kg11l8b3WD6vtcwC/kp09eHJ@nongnu.org
X-Gm-Message-State: AOJu0YxG1lNEWVq9mdFzmUgKGQ3lSq3PlvgxJv/arvmuVMDBVRe0LVdI
 lJ3NRnMT+IMJmOV6Vbm/oA1n7LOuwJqf8PHdWAPx+WmS+5yljAjX/Y1/kg921GY=
X-Gm-Gg: ASbGncv/Ypz5FQrdOeSIuQ8OFeiQHYNNqfKbALrIfGjZRB71QZjgFYdywFbnRUV8Ze6
 0mqqK/OF5FqcOwrvNl9+c/Dp07+8Z6xKN2lp8/Um/j16WSFAoaZjS6ph10OcMX0bprxP4kiD0Vq
 3llxi1BXMvoKFh7GEHJKlof0FHOj0KWnTlC9EqmPLQKgKPqF9yKoLKvDrKh9Xf3ft8DN+RkTNJF
 +PXCs3jMZJWyb4Dpb3TYrl+v7KyQ0JniuCFZlA7rBF9vwXKqQilbi4qupBaIBKwAFpjWgzJ9XxE
 Pe2N+qWLU2uepDSdE51V5ZQ5pHwCWi6bYgU8CJuOFbvusWoGSb/Vxbcjr4A=
X-Google-Smtp-Source: AGHT+IF3ffiiVNOpG7IY+bsmK2wH4MUOzNVcFite/qI8jWvmGFlHkkgAdnt+u5RP+Carkmhrzuv+GQ==
X-Received: by 2002:a17:903:1788:b0:220:f87d:9d5b with SMTP id
 d9443c01a7336-22428a8ca41mr405050855ad.24.1741869649427; 
 Thu, 13 Mar 2025 05:40:49 -0700 (PDT)
Received: from [192.168.68.110] ([177.170.117.79])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-225c6ba6c6bsm12057265ad.150.2025.03.13.05.40.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 05:40:48 -0700 (PDT)
Message-ID: <194d1c63-e2af-45fd-94fa-0336b0b53faa@ventanamicro.com>
Date: Thu, 13 Mar 2025 09:40:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] target/riscv: pmp: fix checks on writes to pmpcfg in
 Smepmp MML mode
To: =?UTF-8?Q?Lo=C3=AFc_Lefort?= <loic@rivosinc.com>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 qemu-riscv@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20250225160052.39564-1-loic@rivosinc.com>
 <20250225160052.39564-4-loic@rivosinc.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250225160052.39564-4-loic@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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



On 2/25/25 1:00 PM, Loïc Lefort wrote:
> With Machine Mode Lockdown (mseccfg.MML) set and RLB not set, checks on pmpcfg
> writes would match the wrong cases of Smepmp truth table.
> 
> The existing code allows writes for the following cases:
> - L=1, X=0: cases 8, 10, 12, 14
> - L=0, RWX!=WX: cases 0-2, 4-6
> This leaves cases 3, 7, 9, 11, 13, 15 for which writes are ignored.
> 
>  From the Smepmp specification: "Adding a rule with executable privileges that
> either is M-mode-only or a locked Shared-Region is not possible (...)" This
> description matches cases 9-11, 13 of the truth table.
> 
> This commit implements an explicit check for these cases by using
> pmp_get_epmp_operation to convert between PMP configuration and Smepmp truth
> table cases.
> 
> Signed-off-by: Loïc Lefort <loic@rivosinc.com>
> ---


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/pmp.c | 81 ++++++++++++++++++++++++----------------------
>   1 file changed, 43 insertions(+), 38 deletions(-)
> 
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index b7f1430ff8..e0ea436f8e 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -75,6 +75,44 @@ static int pmp_is_readonly(CPURISCVState *env, uint32_t pmp_index)
>       return pmp_is_locked(env, pmp_index) && !MSECCFG_RLB_ISSET(env);
>   }
>   
> +/*
> + * Check whether `val` is an invalid Smepmp config value
> + */
> +static int pmp_is_invalid_smepmp_cfg(CPURISCVState *env, uint8_t val)
> +{
> +    /* No check if mseccfg.MML is not set or if mseccfg.RLB is set */
> +    if (!MSECCFG_MML_ISSET(env) || MSECCFG_RLB_ISSET(env)) {
> +        return 0;
> +    }
> +
> +    /*
> +     * Adding a rule with executable privileges that either is M-mode-only
> +     * or a locked Shared-Region is not possible
> +     */
> +    switch (pmp_get_smepmp_operation(val)) {
> +    case 0:
> +    case 1:
> +    case 2:
> +    case 3:
> +    case 4:
> +    case 5:
> +    case 6:
> +    case 7:
> +    case 8:
> +    case 12:
> +    case 14:
> +    case 15:
> +        return 0;
> +    case 9:
> +    case 10:
> +    case 11:
> +    case 13:
> +        return 1;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
>   /*
>    * Count the number of active rules.
>    */
> @@ -103,46 +141,13 @@ static inline uint8_t pmp_read_cfg(CPURISCVState *env, uint32_t pmp_index)
>   static bool pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
>   {
>       if (pmp_index < MAX_RISCV_PMPS) {
> -        bool readonly = true;
> -
> -        if (riscv_cpu_cfg(env)->ext_smepmp) {
> -            /* mseccfg.RLB is set */
> -            if (MSECCFG_RLB_ISSET(env)) {
> -                readonly = false;
> -            }
> -
> -            /* mseccfg.MML is not set */
> -            if (!MSECCFG_MML_ISSET(env) && !pmp_is_readonly(env, pmp_index)) {
> -                readonly = false;
> -            }
> -
> -            /* mseccfg.MML is set */
> -            if (MSECCFG_MML_ISSET(env)) {
> -                /* not adding execute bit */
> -                if ((val & PMP_LOCK) != 0 && (val & PMP_EXEC) != PMP_EXEC) {
> -                    readonly = false;
> -                }
> -                /* shared region and not adding X bit */
> -                if ((val & PMP_LOCK) != PMP_LOCK &&
> -                    (val & 0x7) != (PMP_WRITE | PMP_EXEC)) {
> -                    readonly = false;
> -                }
> -            }
> -        } else {
> -            if (!pmp_is_readonly(env, pmp_index)) {
> -                readonly = false;
> -            }
> -        }
> -
> -        if (readonly) {
> +        if (pmp_is_readonly(env, pmp_index)) {
>               qemu_log_mask(LOG_GUEST_ERROR,
>                             "ignoring pmpcfg write - read only\n");
> -        } else if (env->pmp_state.pmp[pmp_index].cfg_reg != val) {
> -            /* If !mseccfg.MML then ignore writes with encoding RW=01 */
> -            if ((val & PMP_WRITE) && !(val & PMP_READ) &&
> -                !MSECCFG_MML_ISSET(env)) {
> -                return false;
> -            }
> +        } else if (pmp_is_invalid_smepmp_cfg(env, val)) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "ignoring pmpcfg write - invalid\n");
> +        } else {
>               env->pmp_state.pmp[pmp_index].cfg_reg = val;
>               pmp_update_rule_addr(env, pmp_index);
>               return true;


