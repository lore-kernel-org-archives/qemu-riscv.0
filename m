Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEFDEB64DA
	for <qemu-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 09:19:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q9Mek-0004wH-SZ; Wed, 14 Jun 2023 05:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q9Meg-0004vS-Dq
 for qemu-riscv@nongnu.org; Wed, 14 Jun 2023 05:19:06 -0400
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q9Mee-0000IT-Mj
 for qemu-riscv@nongnu.org; Wed, 14 Jun 2023 05:19:06 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-55b3a245359so422580eaf.2
 for <qemu-riscv@nongnu.org>; Wed, 14 Jun 2023 02:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686734343; x=1689326343;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5JEgOJ09Khtdu2sUoH4u3A9FuOUCz+DrFGiiDYEfKpc=;
 b=CM1iLXABpqN1OQKOpJoKCJRonaA+BIo5vbLOGtB6RP9zJjROT5A1LL3xNftBRAubdu
 vMru+TW62KgJlm8U3ZYY3Ie3Y9hrvbPcZuOXfGlLmV1c5J8vdiHZrjgvmCGKro4cJX59
 CBIfeu2nxvx4GU6WygMbkK2+Scr95DBclvjFneT3Hf8i/wjIqGVuUFcFUd6jCA/rG+sP
 aiC5KTeoJSmWGmyWzVHAbcmVfwAhTRE1qFAwDy2X23QPFgLp0R1q7QiKlP+mLXjy7P1E
 /1lAZwdvIxi8/jIA6jwZHLj5XxzbUZRKDA+WJwddcDBaMr8/dE2sgCrZtRI3+IRxiIAm
 1Ppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686734343; x=1689326343;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5JEgOJ09Khtdu2sUoH4u3A9FuOUCz+DrFGiiDYEfKpc=;
 b=fh08idFRhpvU5oUnrgaIfhn6VOe29oVdAf1Xam79PUwKT/JuKsb4sHGdZ3hJJhncOa
 wTUeXlnbOJZ7joqozefr8DybMvfdnrOWcX+qn7wqEgQpTf8bARoumXCDlZheYLjfhtnK
 xPuh0C2Ar0VavsaEfU63Wfy2sa7tRtuumxcA3nlcpnG4NBo3i/AtdM19By+Wgst8kj+s
 uHD4gyQjzvzyUj/8SmBB9p1ooMzn9DSyI8W89eNbV12vF4Q4cfrhaHd8kmHgYAol6piC
 dmeSNpjsIcTFPYSpvDPrODOhozL9jGEbpBZfO4/jjm8USLqYsXjFfDRoc15k/EYG/6Zd
 AeeQ==
X-Gm-Message-State: AC+VfDx8QWDRXDy6kOyvcP0zo5OCwBFSsAvXOFbZhUvSJyK84s3AP79Y
 qC36j7z4Tabcr390BxC+qKqYZ0OodljtVYbgjJ8=
X-Google-Smtp-Source: ACHHUZ4cZw+KD5Lqp5guTsOAcEb6wb9VeeeGsEIwgvOtRAE+GMrxoobmT1eh3fvIUxYLj1S2CD5bvw==
X-Received: by 2002:a54:4d84:0:b0:398:444f:a3d2 with SMTP id
 y4-20020a544d84000000b00398444fa3d2mr9931544oix.20.1686734343589; 
 Wed, 14 Jun 2023 02:19:03 -0700 (PDT)
Received: from [192.168.68.107] ([177.170.117.210])
 by smtp.gmail.com with ESMTPSA id
 k82-20020aca3d55000000b0039c61686a4bsm6152057oia.35.2023.06.14.02.19.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jun 2023 02:19:03 -0700 (PDT)
Message-ID: <1b5c8ff9-5b80-c6ed-a12a-619587983634@ventanamicro.com>
Date: Wed, 14 Jun 2023 06:18:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] target/riscv: update cur_pmbase/pmmask based on mode
 affected by MPRV
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230614032547.35895-1-liweiwei@iscas.ac.cn>
 <20230614032547.35895-3-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230614032547.35895-3-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc29.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
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



On 6/14/23 00:25, Weiwei Li wrote:
> Pointer mask is also affected by MPRV which means cur_pmbase/pmmask
> should also take MPRV into consideration. As pointer mask for instruction
> is not supported currently, so we can directly update cur_pmbase/pmmask
> based on address related mode and xlen affected by MPRV now.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu_helper.c |  7 +++++--
>   target/riscv/csr.c        | 27 ++++++++++++++++++++-------
>   2 files changed, 25 insertions(+), 9 deletions(-)
> 
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index f85113a3db..2321f9132f 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -148,13 +148,16 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>   void riscv_cpu_update_mask(CPURISCVState *env)
>   {
>       target_ulong mask = 0, base = 0;
> +    RISCVMXL xl = env->xl;
>       /*
>        * TODO: Current RVJ spec does not specify
>        * how the extension interacts with XLEN.
>        */
>   #ifndef CONFIG_USER_ONLY
> +    int mode = cpu_address_mode(env);
> +    xl = cpu_get_xl(env, mode);
>       if (riscv_has_ext(env, RVJ)) {
> -        switch (env->priv) {
> +        switch (mode) {
>           case PRV_M:
>               if (env->mmte & M_PM_ENABLE) {
>                   mask = env->mpmmask;
> @@ -178,7 +181,7 @@ void riscv_cpu_update_mask(CPURISCVState *env)
>           }
>       }
>   #endif
> -    if (env->xl == MXL_RV32) {
> +    if (xl == MXL_RV32) {
>           env->cur_pmmask = mask & UINT32_MAX;
>           env->cur_pmbase = base & UINT32_MAX;
>       } else {
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 58499b5afc..63cc5d7e2d 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1335,8 +1335,9 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>        */
>       if (env->debugger) {
>           env->xl = cpu_recompute_xl(env);
> -        riscv_cpu_update_mask(env);
>       }
> +
> +    riscv_cpu_update_mask(env);
>       return RISCV_EXCP_NONE;
>   }
>   
> @@ -3639,7 +3640,7 @@ static RISCVException write_mpmmask(CPURISCVState *env, int csrno,
>       uint64_t mstatus;
>   
>       env->mpmmask = val;
> -    if ((env->priv == PRV_M) && (env->mmte & M_PM_ENABLE)) {
> +    if ((cpu_address_mode(env) == PRV_M) && (env->mmte & M_PM_ENABLE)) {
>           env->cur_pmmask = val;
>       }
>       env->mmte |= EXT_STATUS_DIRTY;
> @@ -3667,8 +3668,11 @@ static RISCVException write_spmmask(CPURISCVState *env, int csrno,
>           return RISCV_EXCP_NONE;
>       }
>       env->spmmask = val;
> -    if ((env->priv == PRV_S) && (env->mmte & S_PM_ENABLE)) {
> +    if ((cpu_address_mode(env) == PRV_S) && (env->mmte & S_PM_ENABLE)) {
>           env->cur_pmmask = val;
> +        if (cpu_get_xl(env, PRV_S) == MXL_RV32) {
> +            env->cur_pmmask &= UINT32_MAX;
> +        }
>       }
>       env->mmte |= EXT_STATUS_DIRTY;
>   
> @@ -3695,8 +3699,11 @@ static RISCVException write_upmmask(CPURISCVState *env, int csrno,
>           return RISCV_EXCP_NONE;
>       }
>       env->upmmask = val;
> -    if ((env->priv == PRV_U) && (env->mmte & U_PM_ENABLE)) {
> +    if ((cpu_address_mode(env) == PRV_U) && (env->mmte & U_PM_ENABLE)) {
>           env->cur_pmmask = val;
> +        if (cpu_get_xl(env, PRV_U) == MXL_RV32) {
> +            env->cur_pmmask &= UINT32_MAX;
> +        }
>       }
>       env->mmte |= EXT_STATUS_DIRTY;
>   
> @@ -3719,7 +3726,7 @@ static RISCVException write_mpmbase(CPURISCVState *env, int csrno,
>       uint64_t mstatus;
>   
>       env->mpmbase = val;
> -    if ((env->priv == PRV_M) && (env->mmte & M_PM_ENABLE)) {
> +    if ((cpu_address_mode(env) == PRV_M) && (env->mmte & M_PM_ENABLE)) {
>           env->cur_pmbase = val;
>       }
>       env->mmte |= EXT_STATUS_DIRTY;
> @@ -3747,8 +3754,11 @@ static RISCVException write_spmbase(CPURISCVState *env, int csrno,
>           return RISCV_EXCP_NONE;
>       }
>       env->spmbase = val;
> -    if ((env->priv == PRV_S) && (env->mmte & S_PM_ENABLE)) {
> +    if ((cpu_address_mode(env) == PRV_S) && (env->mmte & S_PM_ENABLE)) {
>           env->cur_pmbase = val;
> +        if (cpu_get_xl(env, PRV_S) == MXL_RV32) {
> +            env->cur_pmbase &= UINT32_MAX;
> +        }
>       }
>       env->mmte |= EXT_STATUS_DIRTY;
>   
> @@ -3775,8 +3785,11 @@ static RISCVException write_upmbase(CPURISCVState *env, int csrno,
>           return RISCV_EXCP_NONE;
>       }
>       env->upmbase = val;
> -    if ((env->priv == PRV_U) && (env->mmte & U_PM_ENABLE)) {
> +    if ((cpu_address_mode(env) == PRV_U) && (env->mmte & U_PM_ENABLE)) {
>           env->cur_pmbase = val;
> +        if (cpu_get_xl(env, PRV_U) == MXL_RV32) {
> +            env->cur_pmbase &= UINT32_MAX;
> +        }
>       }
>       env->mmte |= EXT_STATUS_DIRTY;
>   

