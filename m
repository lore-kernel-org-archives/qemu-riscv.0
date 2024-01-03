Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72289C47073
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 20:19:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rL7gx-00070a-9j; Wed, 03 Jan 2024 15:18:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rL7gv-0006zw-16
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 15:18:17 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rL7gs-00047D-3G
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 15:18:16 -0500
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-5ce07cf1e5dso2745339a12.2
 for <qemu-riscv@nongnu.org>; Wed, 03 Jan 2024 12:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704313090; x=1704917890; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LYwHhkS10BREvm3LEClw/yV4nIB1UtqPyjpQJ4n1gPk=;
 b=auqZApkGAEdhdjyxXlc/rDHpoUlf7dQksaGqAOmBHTvBz+KeIX8sLudf9SHFImY3Af
 lG8PmE+1cTNOyJUMYVOw4hHEC2NF2pGE9qWQ7drp9YtYs7FScD6k4hLaQeBGcIzoX6sA
 z1cgCWpbblI+EX4jjNo79qZXnMcOlaZuTCw6VUI00u1fWtpXiDv+vm6z+beF7cFj6AxC
 o42S9Siea6j8Vs2zTBcTVEmiBLEp3fgWupYA2ljCWOyOcRSw7o9UB3MPjE9muSe5Nuoi
 VfU+Tqk7yxWUGSVEdx6l13PNjg+mpPcrNVDvQ9wQd+IR+IO6xTSPS+aSVSyRbxsUU6vQ
 2HFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704313090; x=1704917890;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LYwHhkS10BREvm3LEClw/yV4nIB1UtqPyjpQJ4n1gPk=;
 b=rvTbs/vDBHhAYMaYL9c0hnYRHP/z9xO+Hso/58GzgNqIF0+vMAI+Ag4H0ZdGXT4myK
 1eQzPC6ZGcE3xzYi8Zj80y0jWXOoIsADkHQNUBLy8WcdjQZZ5EJy5OMHA6UFyPevglBs
 GLLQzOIskHjbcI5Ek+17SNlqNk39ljuTmdIMDTAPFXTHmtptpsW5oxWOveZfH6hwXIRk
 2++WZm87KaNIv0e8/ck0XXYf2/OdeslPfl4/Bdqwo56gdqhVYrcx00F+errTRhHRBhyl
 tVPUXca/vlV0R9Zg20fUyu6gzQCT63QfMCLUSbAFgWoRw+PWHmnIF5r7R9bzffAh8P9U
 Vs2g==
X-Gm-Message-State: AOJu0Yx8zt8fTj39ZGYYoVxnmTt7rqtgDXKkrJ7q3hIMMxw9sk9d98Bm
 ChNwfNxY3WEJiXOV+i15X1IJIZknH3BDlA==
X-Google-Smtp-Source: AGHT+IHWkf/oqRMnWgQ6XTlKOhhaxOGdgouS3Oiximzaq6jUEWEnSRQ/moSafv4Vkw9Q7zPDXQOEDQ==
X-Received: by 2002:a05:6a20:548b:b0:198:e62f:6340 with SMTP id
 i11-20020a056a20548b00b00198e62f6340mr934334pzk.25.1704313090645; 
 Wed, 03 Jan 2024 12:18:10 -0800 (PST)
Received: from [192.168.68.110] ([189.79.21.107])
 by smtp.gmail.com with ESMTPSA id
 g30-20020aa79f1e000000b006d942f43140sm19529128pfr.34.2024.01.03.12.18.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jan 2024 12:18:10 -0800 (PST)
Message-ID: <21533886-8389-4701-b541-dca295cb2814@ventanamicro.com>
Date: Wed, 3 Jan 2024 17:18:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 4/5] target/riscv: Add cycle & instret privilege mode
 filtering support
Content-Language: en-US
To: Atish Patra <atishp@rivosinc.com>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org, Weiwei Li <liwei1518@gmail.com>, kaiwenxue1@gmail.com
References: <20231229004929.3842055-1-atishp@rivosinc.com>
 <20231229004929.3842055-5-atishp@rivosinc.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231229004929.3842055-5-atishp@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x536.google.com
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



On 12/28/23 21:49, Atish Patra wrote:
> From: Kaiwen Xue <kaiwenx@rivosinc.com>
> 
> QEMU only calculates dummy cycles and instructions, so there is no
> actual means to stop the icount in QEMU. Hence this patch merely adds
> the functionality of accessing the cfg registers, and cause no actual
> effects on the counting of cycle and instret counters.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
> ---
>   target/riscv/cpu.c |  1 +
>   target/riscv/csr.c | 83 ++++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 84 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 54395f95b299..d24f7ff8b55b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1297,6 +1297,7 @@ const char *riscv_get_misa_ext_description(uint32_t bit)
>   const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
>       /* Defaults for standard extensions */
>       MULTI_EXT_CFG_BOOL("sscofpmf", ext_sscofpmf, false),
> +    MULTI_EXT_CFG_BOOL("smcntrpmf", ext_smcntrpmf, false),


As I said in patch 2 this declaration can happen there instead.


>       MULTI_EXT_CFG_BOOL("zifencei", ext_zifencei, true),
>       MULTI_EXT_CFG_BOOL("zicsr", ext_zicsr, true),
>       MULTI_EXT_CFG_BOOL("zihintntl", ext_zihintntl, true),
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 283468bbc652..618e801a7612 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -233,6 +233,27 @@ static RISCVException sscofpmf_32(CPURISCVState *env, int csrno)
>       return sscofpmf(env, csrno);
>   }
>   
> +static RISCVException smcntrpmf(CPURISCVState *env, int csrno)
> +{
> +    RISCVCPU *cpu = env_archcpu(env);
> +
> +    if (!cpu->cfg.ext_smcntrpmf) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }

env_archcpu() should be avoided when possible due to its overhead. You can use
riscv_cpu_cfg() to retrieve cpu->cfg using 'env':

> +    if (!riscv_cpu_cfg(env)->ext_smcntrpmf) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }


Thanks,

Daniel

> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException smcntrpmf_32(CPURISCVState *env, int csrno)
> +{
> +    if (riscv_cpu_mxl(env) != MXL_RV32) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    return smcntrpmf(env, csrno);
> +}
> +
> +
>   static RISCVException any(CPURISCVState *env, int csrno)
>   {
>       return RISCV_EXCP_NONE;
> @@ -818,6 +839,54 @@ static int read_hpmcounterh(CPURISCVState *env, int csrno, target_ulong *val)
>   
>   #else /* CONFIG_USER_ONLY */
>   
> +static int read_mcyclecfg(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->mcyclecfg;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int write_mcyclecfg(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    env->mcyclecfg = val;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int read_mcyclecfgh(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->mcyclecfgh;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int write_mcyclecfgh(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    env->mcyclecfgh = val;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int read_minstretcfg(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->minstretcfg;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int write_minstretcfg(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    env->minstretcfg = val;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int read_minstretcfgh(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->minstretcfgh;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int write_minstretcfgh(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    env->minstretcfgh = val;
> +    return RISCV_EXCP_NONE;
> +}
> +
>   static int read_mhpmevent(CPURISCVState *env, int csrno, target_ulong *val)
>   {
>       int evt_index = csrno - CSR_MCOUNTINHIBIT;
> @@ -4922,6 +4991,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>                                write_mcountinhibit,
>                                .min_priv_ver = PRIV_VERSION_1_11_0       },
>   
> +    [CSR_MCYCLECFG]      = { "mcyclecfg",   smcntrpmf, read_mcyclecfg,
> +                             write_mcyclecfg,
> +                             .min_priv_ver = PRIV_VERSION_1_12_0       },
> +    [CSR_MINSTRETCFG]    = { "minstretcfg", smcntrpmf, read_minstretcfg,
> +                             write_minstretcfg,
> +                             .min_priv_ver = PRIV_VERSION_1_12_0       },
> +
>       [CSR_MHPMEVENT3]     = { "mhpmevent3",     any,    read_mhpmevent,
>                                write_mhpmevent                           },
>       [CSR_MHPMEVENT4]     = { "mhpmevent4",     any,    read_mhpmevent,
> @@ -4981,6 +5057,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>       [CSR_MHPMEVENT31]    = { "mhpmevent31",    any,    read_mhpmevent,
>                                write_mhpmevent                           },
>   
> +    [CSR_MCYCLECFGH]     = { "mcyclecfgh",   smcntrpmf_32, read_mcyclecfgh,
> +                             write_mcyclecfgh,
> +                             .min_priv_ver = PRIV_VERSION_1_12_0        },
> +    [CSR_MINSTRETCFGH]   = { "minstretcfgh", smcntrpmf_32, read_minstretcfgh,
> +                             write_minstretcfgh,
> +                             .min_priv_ver = PRIV_VERSION_1_12_0        },
> +
>       [CSR_MHPMEVENT3H]    = { "mhpmevent3h",    sscofpmf_32,  read_mhpmeventh,
>                                write_mhpmeventh,
>                                .min_priv_ver = PRIV_VERSION_1_12_0        },

