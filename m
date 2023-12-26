Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF800C46CD4
	for <qemu-riscv@archiver.kernel.org>; Tue, 26 Dec 2023 09:11:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rI3SU-0005yP-NE; Tue, 26 Dec 2023 04:10:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rI3ST-0005y4-Ht
 for qemu-riscv@nongnu.org; Tue, 26 Dec 2023 04:10:41 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rI3SR-0005tx-UN
 for qemu-riscv@nongnu.org; Tue, 26 Dec 2023 04:10:41 -0500
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1d422c9f894so22460745ad.3
 for <qemu-riscv@nongnu.org>; Tue, 26 Dec 2023 01:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1703581838; x=1704186638; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mo87ThT8zpRzFLT7CFeYA/PuMRY8PpwdibPow0743bc=;
 b=kOQzZZchkxEQtTDVO9ruguBY4HHLuAg2vMbcxi9JT1FozzhbHTu8eGTZ6VwqupDGR+
 dis95p0HOwmhYD6s48ftqktRkOfA0tuTEmHSf2TfW3smn5cWanaUHxZgVfe2VkPApV8H
 D4wESX+olgoG95uNrPSoL9nAWjOVKWBfIPdheJmF3eWhVFf2hOOPZ21Je/GldWbjA5cL
 Dzf9LSD6q9d2JJmu4h/chPHKKBIuOXG2+sCG0FrQkXADi8qEYXuvWA928k5+hXrdQIQl
 xf/w5jE14jS+Nmi2f/tpUg6gUg9nWB4yM1lYP4mI3bDTAfjCwJy0hPs1YRZ/hczlDxi0
 xAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703581838; x=1704186638;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mo87ThT8zpRzFLT7CFeYA/PuMRY8PpwdibPow0743bc=;
 b=McfOQQenuO0/IcrhAb1154RRnRxerQHl/LewXuVt15sFd8+3E5pRzzyIGJdbqfpNV1
 r2T/NlZSYmgBkU1LhbEpoJLO5ZTkrMPX2ZHAKu1aRTrcMYdppfa0sLN7poIy1BfTJMXt
 5txqzCwyDJUUR3bLmOuZOBT3+grB68M/3BSQyGQ6eglDimsNZ4kQ9E+eNoUIb2SiqQcV
 swQrhIHlGSLlnkwZslBp6+nlm2Iie+GK2r2eRoikX5Val/niy0chMzeHUDP0M6plx21z
 B4yJPCWdGtDnL+jyEej29w5/76uqxC2bqFiGnBMdI1EvKl17RRcknj9DqLl/kqn8CJ7e
 B1wA==
X-Gm-Message-State: AOJu0YyMfH1OAyxQ125Y63I2jxQNpDk5u0hZUZRSS28jWN3ZNXrmk38m
 3k+06fAlYdqgUPPUiPD6/3uycW47fCvSRw==
X-Google-Smtp-Source: AGHT+IFL/nq4K8DwFm+OjEO4ndItYAU30rsqYozp1vAh22BO8uu2O0mJ91XuKbKTK5mK/jkNo2RjCw==
X-Received: by 2002:a17:903:4290:b0:1d4:ad0:24ad with SMTP id
 ju16-20020a170903429000b001d40ad024admr6678876plb.28.1703581838037; 
 Tue, 26 Dec 2023 01:10:38 -0800 (PST)
Received: from [192.168.68.110] (201-69-66-51.dial-up.telesp.net.br.
 [201.69.66.51]) by smtp.gmail.com with ESMTPSA id
 ok13-20020a17090b1d4d00b0028aea6c24bcsm14284382pjb.53.2023.12.26.01.10.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Dec 2023 01:10:37 -0800 (PST)
Message-ID: <0a479e8b-c08d-43b9-be2c-d1e7c2372811@ventanamicro.com>
Date: Tue, 26 Dec 2023 06:10:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: Fix mcycle/minstret increment behavior
Content-Language: en-US
To: Xu Lu <luxu.kernel@bytedance.com>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, lihangjing@bytedance.com,
 xieyongji@bytedance.com
References: <20231226040500.82813-1-luxu.kernel@bytedance.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231226040500.82813-1-luxu.kernel@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62f.google.com
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



On 12/26/23 01:05, Xu Lu wrote:
> The mcycle/minstret counter's stop flag is mistakenly updated on a copy
> on stack. Thus the counter increments even when the CY/IR bit in the
> mcountinhibit register is set. This commit corrects its behavior.
> 

Good catch.

> Fixes: 3780e33732f88 (target/riscv: Support mcycle/minstret write operation)
> Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/csr.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index fde7ce1a5336..c50a33397c51 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -907,11 +907,11 @@ static int write_mhpmcounterh(CPURISCVState *env, int csrno, target_ulong val)
>   static RISCVException riscv_pmu_read_ctr(CPURISCVState *env, target_ulong *val,
>                                            bool upper_half, uint32_t ctr_idx)
>   {
> -    PMUCTRState counter = env->pmu_ctrs[ctr_idx];
> -    target_ulong ctr_prev = upper_half ? counter.mhpmcounterh_prev :
> -                                         counter.mhpmcounter_prev;
> -    target_ulong ctr_val = upper_half ? counter.mhpmcounterh_val :
> -                                        counter.mhpmcounter_val;
> +    PMUCTRState *counter = &env->pmu_ctrs[ctr_idx];
> +    target_ulong ctr_prev = upper_half ? counter->mhpmcounterh_prev :
> +                                         counter->mhpmcounter_prev;
> +    target_ulong ctr_val = upper_half ? counter->mhpmcounterh_val :
> +                                        counter->mhpmcounter_val;
>   
>       if (get_field(env->mcountinhibit, BIT(ctr_idx))) {
>           /*
> @@ -919,12 +919,12 @@ static RISCVException riscv_pmu_read_ctr(CPURISCVState *env, target_ulong *val,
>            * stop the icount counting. Just return the counter value written by
>            * the supervisor to indicate that counter was not incremented.
>            */
> -        if (!counter.started) {
> +        if (!counter->started) {
>               *val = ctr_val;
>               return RISCV_EXCP_NONE;
>           } else {
>               /* Mark that the counter has been stopped */
> -            counter.started = false;
> +            counter->started = false;
>           }
>       }
>   

