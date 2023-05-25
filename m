Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2DEC7EE2D
	for <qemu-riscv@archiver.kernel.org>; Thu, 25 May 2023 12:41:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2AHp-00043o-Qa; Thu, 25 May 2023 08:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q2AHo-00041g-4Z
 for qemu-riscv@nongnu.org; Thu, 25 May 2023 08:41:44 -0400
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q2AHm-00089A-81
 for qemu-riscv@nongnu.org; Thu, 25 May 2023 08:41:43 -0400
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-54fb3ef9c53so143634eaf.3
 for <qemu-riscv@nongnu.org>; Thu, 25 May 2023 05:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1685018501; x=1687610501;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A1DuGsboiO7C3tJrt5gITId84Nzocues+Ci56mm8b94=;
 b=kdHsCmEcgyU1ewUJC8Kmw7FBkDa1zcnpnqEuZIaC9+KdvMB/o/LFZpSmRP1DGSxl7I
 CuvRZus40IlFuYccOzx7+gkcf3hIv/DzNRgsaT3/NDU33tJCQCHO5Md72juHGVcCYZnl
 FpUGPewGBgDf0G6QYOmmzmuYKK1mvkcqxaFU9bqsABYDDwgFcvDDXIJPok4+DpqHH/Ki
 Z8UIO6xRmJIFzPWUAzMzEXELf6bTBU5BkL95P6oJNTo31qFDMtp5bt7meja39Kv6SAtV
 gVE1Nc1nN6uRc+5Rrt982pHcACv9tn0LuH6V3BmieWVk60O2gZNsTAql/TxojeSKqJjZ
 NSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685018501; x=1687610501;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A1DuGsboiO7C3tJrt5gITId84Nzocues+Ci56mm8b94=;
 b=j743mGouEkkb9O4cjgKLHo0NT07jgYRA+xgoPglSD2MrF2BRJKKI+cIb0x2najvY5W
 yrjmmGEAyMfTL1xtmyP0HrgiNV1XeeSIbYu1ZBILPpSOGkFOTXXe4AE/3tKmWn+ffb9W
 HTvEBSfs9huUYmTuAIsJ3wXac9ulUWiVLYEG8PLvkzPjQu70dXW9gB64bRCPC5+2DCi3
 8PKPQyFUOwaLZOPAwY4XZJaRY+THnONnEaMwixZW9KOrSvWFLZVCrWcF9T6UH3yqWOp/
 axEgy6vq96fg7tBfU9gL0olXdJneR+ulFijw99XkJIiyWMroaOsln3AHngaifD1bBjMS
 dMRw==
X-Gm-Message-State: AC+VfDxuXJSuxbqq7a6OvNjpG5FfDDFdFIY3Z+QOKuS9/4bS9P8Nfg6L
 BCb2KmENW3zFYmSPi8kZMnNPUw==
X-Google-Smtp-Source: ACHHUZ6/2z55564Tei5Ql9cVhguBUyVZtEJi52gz1rgqufoX79j7rt0aOCRHP+7bXFkCSMuyU64xww==
X-Received: by 2002:a4a:6f06:0:b0:547:4f15:6147 with SMTP id
 h6-20020a4a6f06000000b005474f156147mr7103805ooc.0.1685018500851; 
 Thu, 25 May 2023 05:41:40 -0700 (PDT)
Received: from [192.168.68.107] (200-162-225-121.static-corp.ajato.com.br.
 [200.162.225.121]) by smtp.gmail.com with ESMTPSA id
 x74-20020a4a414d000000b0055210b1a91csm427552ooa.3.2023.05.25.05.41.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 May 2023 05:41:40 -0700 (PDT)
Message-ID: <d809f465-53e7-5974-e64c-19994dd089c1@ventanamicro.com>
Date: Thu, 25 May 2023 09:41:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 3/4] target/riscv: Handle Smrnmi interrupt and
 exception.
Content-Language: en-US
To: Tommy Wu <tommy.wu@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: frank.chang@sifive.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org
References: <20230522131123.3498539-1-tommy.wu@sifive.com>
 <20230522131123.3498539-4-tommy.wu@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230522131123.3498539-4-tommy.wu@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc34.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
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



On 5/22/23 10:11, Tommy Wu wrote:
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
> ---
>   target/riscv/cpu_helper.c | 60 +++++++++++++++++++++++++++++++++++----
>   1 file changed, 55 insertions(+), 5 deletions(-)
> 
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index cc7898f103..7bdea0d2ca 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -405,6 +405,19 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *env)
>   {
>       int virq;
>       uint64_t irqs, pending, mie, hsie, vsie;
> +    RISCVCPU *cpu = env_archcpu(env);
> +
> +    /* Priority: RNMI > Other interrupt. */
> +    if (cpu->cfg.ext_smrnmi) {

Since you're using "cpu" just to read a cfg flag you can use the 'riscv_cpu_cfg(env)'
inline to avoid a call to env_archcpu():

>       int virq;
>       uint64_t irqs, pending, mie, hsie, vsie;
> +
> +    /* Priority: RNMI > Other interrupt. */
> +    if (riscv_cpu_cfg(env)->ext_smrnmi) {


> +        /* If mnstatus.NMIE == 0, all interrupts are disabled. */
> +        if (!get_field(env->mnstatus, MNSTATUS_NMIE)) {
> +            return RISCV_EXCP_NONE;
> +        }
> +
> +        if (env->rnmip) {
> +            return ctz64(env->rnmip); /* since non-zero */
> +        }
> +    }
>   
>       /* Determine interrupt enable state of all privilege modes */
>       if (env->virt_enabled) {
> @@ -451,7 +464,9 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *env)
>   
>   bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>   {
> -    if (interrupt_request & CPU_INTERRUPT_HARD) {
> +    uint32_t mask = CPU_INTERRUPT_HARD | CPU_INTERRUPT_RNMI;
> +
> +    if (interrupt_request & mask) {
>           RISCVCPU *cpu = RISCV_CPU(cs);
>           CPURISCVState *env = &cpu->env;
>           int interruptno = riscv_cpu_local_irq_pending(env);
> @@ -1613,6 +1628,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>       CPURISCVState *env = &cpu->env;
>       bool write_gva = false;
>       uint64_t s;
> +    int mode;
>   
>       /*
>        * cs->exception is 32-bits wide unlike mcause which is XLEN-bits wide
> @@ -1625,6 +1641,22 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>       target_ulong tinst = 0;
>       target_ulong htval = 0;
>       target_ulong mtval2 = 0;
> +    bool nmi_execp = false;
> +
> +    if (cpu->cfg.ext_smrnmi) {
> +        if (env->rnmip && async) {

You're not using an 'else' clause for this if, so I suggest avoiding this nested
'if' by doing everything in the same conditional:

> +    if (cpu->cfg.ext_smrnmi && env->rnmip && async) {

As a bonus you'll also avoid an extra indent level.


Thanks,


Daniel



> +            env->mnstatus = set_field(env->mnstatus, MNSTATUS_NMIE, false);
> +            env->mnstatus = set_field(env->mnstatus, MNSTATUS_MNPV,
> +                                      env->virt_enabled);
> +            env->mnstatus = set_field(env->mnstatus, MNSTATUS_MNPP,
> +                                      env->priv);
> +            env->mncause = cause | ((target_ulong)1U << (TARGET_LONG_BITS - 1));
> +            env->mnepc = env->pc;
> +            env->pc = env->rnmi_irqvec;
> +            riscv_cpu_set_mode(env, PRV_M);
> +            goto handled;
> +        }
> +    }
>   
>       if  (cause == RISCV_EXCP_SEMIHOST) {
>           do_common_semihosting(cs);
> @@ -1711,8 +1743,20 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>                     __func__, env->mhartid, async, cause, env->pc, tval,
>                     riscv_cpu_get_trap_name(cause, async));
>   
> -    if (env->priv <= PRV_S &&
> -            cause < TARGET_LONG_BITS && ((deleg >> cause) & 1)) {
> +    mode = env->priv <= PRV_S &&
> +        cause < TARGET_LONG_BITS && ((deleg >> cause) & 1) ? PRV_S : PRV_M;
> +
> +    /*
> +     * If the hart encounters an exception while executing in M-mode,
> +     * with the mnstatus.NMIE bit clear, the program counter is set to
> +     * the RNMI exception trap handler address.
> +     */
> +    nmi_execp = cpu->cfg.ext_smrnmi &&
> +                !get_field(env->mnstatus, MNSTATUS_NMIE) &&
> +                !async &&
> +                mode == PRV_M;
> +
> +    if (mode == PRV_S) {
>           /* handle the trap in S-mode */
>           if (riscv_has_ext(env, RVH)) {
>               uint64_t hdeleg = async ? env->hideleg : env->hedeleg;
> @@ -1787,8 +1831,12 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>           env->mtval = tval;
>           env->mtval2 = mtval2;
>           env->mtinst = tinst;
> -        env->pc = (env->mtvec >> 2 << 2) +
> -                  ((async && (env->mtvec & 3) == 1) ? cause * 4 : 0);
> +        if (cpu->cfg.ext_smrnmi && nmi_execp) {
> +            env->pc = env->rnmi_excpvec;
> +        } else {
> +            env->pc = (env->mtvec >> 2 << 2) +
> +                      ((async && (env->mtvec & 3) == 1) ? cause * 4 : 0);
> +        }
>           riscv_cpu_set_mode(env, PRV_M);
>       }
>   
> @@ -1801,6 +1849,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>   
>       env->two_stage_lookup = false;
>       env->two_stage_indirect_lookup = false;
> +
> +handled:
>   #endif
>       cs->exception_index = RISCV_EXCP_NONE; /* mark handled to qemu */
>   }

