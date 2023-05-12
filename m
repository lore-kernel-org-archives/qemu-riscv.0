Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDB4C77B7C
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 May 2023 12:43:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pxS5V-00087j-TL; Fri, 12 May 2023 08:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pxS5U-00085t-Ke
 for qemu-riscv@nongnu.org; Fri, 12 May 2023 08:41:32 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pxS5S-0006eN-Pp
 for qemu-riscv@nongnu.org; Fri, 12 May 2023 08:41:32 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6ab0bad2587so3790666a34.3
 for <qemu-riscv@nongnu.org>; Fri, 12 May 2023 05:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1683895287; x=1686487287;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q/+aROaXwOmzEz2TEvBmVccbrQdr6zz6zhGWf6F7VrU=;
 b=DeYkB/0VQbURUhQs5RtFrvtXdTM7J2+cLpKW4fydtwlupa8K+GjtzlEuy0vQpYmIMm
 IoHtR5RA+xV9WxaT3eoXRAENAm/29pl7er1/j1RAPw+EV17ypnYEdcscA1/6A4msIb2r
 W7y0VoBtazTybFUvbHS0bJP6BpZg8IEBYaJ/X8jW0ydm8IxSVGT4wAtXiw7x9fsGNRuh
 36tuI+orsq9Wo9pvTfPONl38hvxvBlYlOQ9B+WYLyrKUrAQNU7iVaGo5v26SSFWnf6bA
 E+3LGHp/gA68vLEdaiZo7gEJMHQe8nerZctNhd2fCCObdOThdhYhZZQBwHdxvW70822m
 +s2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683895287; x=1686487287;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q/+aROaXwOmzEz2TEvBmVccbrQdr6zz6zhGWf6F7VrU=;
 b=at+Zl7Tb75Wi+rB0CFpg7himXMwdBQc0xWBfoDjEE8C9T07tnYP7Q92LkR3USfHxLT
 dAEodaxKcqvuwRvw1QpJ+rTQ61dDtfq9CsKBaoevsRkb+lSNzEeP1qV1VIIWxHUbcOXo
 GM4kMJqkYEHTJOCwvydy2bmfragdix9EOZeZ0T1ypRU68oGGPiPca9SlANyfef1lN1cF
 WPfD6ZKYkdGk5QNbxd58R2iS70k4ICrnojKTTaoVecin9ynoZsq8ylGW2OVyOSoGsKY6
 DqOY00KU7/ekFB+hYZga7ORnuGF2UgAYn2gPYbZootnH8NYDrHPlyLtFZesYcBrmxqTt
 lkMg==
X-Gm-Message-State: AC+VfDxuf7O70mkwu24hcq7zHKntXwFFmmwesbH5QLH5YsPIpPkc4y0Q
 fAFaWcw5irKCmHx81Ilc473Ugg==
X-Google-Smtp-Source: ACHHUZ5diSNpWZotBqddY9tKbs/Z1Pdi5MT/RZQzQ2GNPHreK7T1zqCB0BPgYyGWdiBdeMp0zLXhKw==
X-Received: by 2002:a05:6830:1184:b0:6a4:402c:50bf with SMTP id
 u4-20020a056830118400b006a4402c50bfmr6867683otq.37.1683895287421; 
 Fri, 12 May 2023 05:41:27 -0700 (PDT)
Received: from [192.168.68.107] (189-46-207-53.dsl.telesp.net.br.
 [189.46.207.53]) by smtp.gmail.com with ESMTPSA id
 s14-20020a056830124e00b006a63283a9e5sm3784616otp.75.2023.05.12.05.41.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 May 2023 05:41:27 -0700 (PDT)
Message-ID: <f892567b-521c-5cbb-14df-e04f4e6415a5@ventanamicro.com>
Date: Fri, 12 May 2023 09:41:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v8 11/11] target/riscv: rework write_misa()
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230421132727.121462-1-dbarboza@ventanamicro.com>
 <20230421132727.121462-12-dbarboza@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230421132727.121462-12-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.845,
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

Alistair,


Since this is the only patch that is being contested is it possible to apply all
the other ones to riscv-to-apply.next?

I'm asking because I'm going to send more code that will affect cpu_init() and
riscv_cpu_realize() functions, and it would be easier if the cleanups were already
in 'next'. Otherwise I'll either have to base the new code on top of this pending
series or I'll base them under riscv-to-apply.next and we'll have to deal with
conflicts.


Thanks,

Daniel

On 4/21/23 10:27, Daniel Henrique Barboza wrote:
> write_misa() must use as much common logic as possible. We want to open
> code just the bits that are exclusive to the CSR write operation and TCG
> internals.
> 
> Our validation is done with riscv_cpu_validate_set_extensions(), but we
> need a small tweak first. When enabling RVG we're doing:
> 
>          env->misa_ext |= RVI | RVM | RVA | RVF | RVD;
>          env->misa_ext_mask = env->misa_ext;
> 
> This works fine for realize() time but this can potentially overwrite
> env->misa_ext_mask if we reutilize the function for write_misa().
> 
> Instead of doing misa_ext_mask = misa_ext, sum up the RVG extensions in
> misa_ext_mask as well. This won't change realize() time behavior
> (misa_ext_mask will be == misa_ext) and will ensure that write_misa()
> won't change misa_ext_mask by accident.
> 
> After that, rewrite write_misa() to work as follows:
> 
> - mask the write using misa_ext_mask to avoid enabling unsupported
>    extensions;
> 
> - suppress RVC if the next insn isn't aligned;
> 
> - disable RVG if any of RVG dependencies are being disabled by the user;
> 
> - assign env->misa_ext and run riscv_cpu_validate_set_extensions(). On
>    error, rollback env->misa_ext to its original value;
> 
> - handle RVF and MSTATUS_FS and continue as usual.
> 
> Let's keep write_misa() as experimental for now until this logic gains
> enough mileage.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> ---
>   target/riscv/cpu.c |  4 ++--
>   target/riscv/cpu.h |  1 +
>   target/riscv/csr.c | 47 ++++++++++++++++++++--------------------------
>   3 files changed, 23 insertions(+), 29 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 7d407321aa..4fa720a39d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -944,7 +944,7 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
>    * Check consistency between chosen extensions while setting
>    * cpu->cfg accordingly.
>    */
> -static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
> +void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>   {
>       CPURISCVState *env = &cpu->env;
>       Error *local_err = NULL;
> @@ -960,7 +960,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           cpu->cfg.ext_ifencei = true;
>   
>           env->misa_ext |= RVI | RVM | RVA | RVF | RVD;
> -        env->misa_ext_mask = env->misa_ext;
> +        env->misa_ext_mask |= RVI | RVM | RVA | RVF | RVD;
>       }
>   
>       if (riscv_has_ext(env, RVI) && riscv_has_ext(env, RVE)) {
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 15423585d0..1f39edc687 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -548,6 +548,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                           bool probe, uintptr_t retaddr);
>   char *riscv_isa_string(RISCVCPU *cpu);
>   void riscv_cpu_list(void);
> +void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp);
>   
>   #define cpu_list riscv_cpu_list
>   #define cpu_mmu_index riscv_cpu_mmu_index
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 4451bd1263..4a3c57ea6f 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1387,39 +1387,18 @@ static RISCVException read_misa(CPURISCVState *env, int csrno,
>   static RISCVException write_misa(CPURISCVState *env, int csrno,
>                                    target_ulong val)
>   {
> +    RISCVCPU *cpu = env_archcpu(env);
> +    uint32_t orig_misa_ext = env->misa_ext;
> +    Error *local_err = NULL;
> +
>       if (!riscv_cpu_cfg(env)->misa_w) {
>           /* drop write to misa */
>           return RISCV_EXCP_NONE;
>       }
>   
> -    /* 'I' or 'E' must be present */
> -    if (!(val & (RVI | RVE))) {
> -        /* It is not, drop write to misa */
> -        return RISCV_EXCP_NONE;
> -    }
> -
> -    /* 'E' excludes all other extensions */
> -    if (val & RVE) {
> -        /*
> -         * when we support 'E' we can do "val = RVE;" however
> -         * for now we just drop writes if 'E' is present.
> -         */
> -        return RISCV_EXCP_NONE;
> -    }
> -
> -    /*
> -     * misa.MXL writes are not supported by QEMU.
> -     * Drop writes to those bits.
> -     */
> -
>       /* Mask extensions that are not supported by this hart */
>       val &= env->misa_ext_mask;
>   
> -    /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
> -    if ((val & RVD) && !(val & RVF)) {
> -        val &= ~RVD;
> -    }
> -
>       /*
>        * Suppress 'C' if next instruction is not aligned
>        * TODO: this should check next_pc
> @@ -1428,18 +1407,32 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
>           val &= ~RVC;
>       }
>   
> +    /* Disable RVG if any of its dependencies are disabled */
> +    if (!(val & RVI && val & RVM && val & RVA &&
> +          val & RVF && val & RVD)) {
> +        val &= ~RVG;
> +    }
> +
>       /* If nothing changed, do nothing. */
>       if (val == env->misa_ext) {
>           return RISCV_EXCP_NONE;
>       }
>   
> -    if (!(val & RVF)) {
> +    env->misa_ext = val;
> +    riscv_cpu_validate_set_extensions(cpu, &local_err);
> +    if (local_err != NULL) {
> +        /* Rollback on validation error */
> +        env->misa_ext = orig_misa_ext;
> +
> +        return RISCV_EXCP_NONE;
> +    }
> +
> +    if (!(env->misa_ext & RVF)) {
>           env->mstatus &= ~MSTATUS_FS;
>       }
>   
>       /* flush translation cache */
>       tb_flush(env_cpu(env));
> -    env->misa_ext = val;
>       env->xl = riscv_cpu_mxl(env);
>       return RISCV_EXCP_NONE;
>   }

