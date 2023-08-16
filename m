Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFEB5C04A6A
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 14:30:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qWHXo-000728-NT; Wed, 16 Aug 2023 10:30:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qWHXl-00070f-2x
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 10:30:42 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qWHXi-0005F6-HA
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 10:30:40 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1c4c6717e61so2989807fac.1
 for <qemu-riscv@nongnu.org>; Wed, 16 Aug 2023 07:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692196235; x=1692801035;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XjNKwl8Qc1nrsG4trlgFsZ7QYGnKrYc56iHIo9r6SwI=;
 b=DcEkBwOOt1NHzvS4USGcs+L8a55WEVXQflvxL8R4RQnxmhRxr1IupNDH/DrrMnJivO
 HfVnSNYRqSbLWt1GJJYS+HT5Jzdx4VAVCvugTVFxBTqU5VXmYZNpqFkXxSkKgAFhlL3U
 7wzlOYLj/k/xxZdbG6yIaCgh16rmtjRnkZapblUIAArTUs+hEeB/A1gP2dQSgdazY2qw
 ajJP8uL/7j9FaXtd/1YuZ30cshA5+mQnnfYzMtTlzpWgwdbhuYOF6YA58CB5kWbYpc0t
 kUNNGkldxKZRv97QotU80M8x5S/vy/K6/DiFnmY+PCkbH1as+S5mwQIL8regw2HHF8Bn
 PZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692196235; x=1692801035;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XjNKwl8Qc1nrsG4trlgFsZ7QYGnKrYc56iHIo9r6SwI=;
 b=AuSUzindP3Poit+JlaxZZSrNQFKRXubTrIgcra8B6FkMdcRLy+dnVeyRGD8srnkiCd
 6wDL7Vl4fDtFc0mIGjX3LtnTlnt7aCpFr3ZH5SQ8AMW7/Vi/uKDNaul498Kjg/4beZmz
 8GL1TZsGT9+7fDVtUx3MdU2lodb7WXLRn2JZItaJF6ZhoQhV9ZBGCf0KM/MfNLtl/90d
 mxGkCUHMBERxIgDnm9T6GHZ04K7iKa297gY7dxh7+6RjdF1nIIkGXoip9myxdfugBiu/
 KiH/4EHwmu+iD3t2Ez+Iykcpc8aJpdRNp5cBjPSmIi3JZir6o+65Vp+pdzyA1QkruKTn
 ARvw==
X-Gm-Message-State: AOJu0YxVGrQh/5kDYqQ71yycdq8M3JXs5Z85n/JF5sTEKM+wFFV82Lq0
 4zETsecEo0YP/SCJpIm7C80fwg==
X-Google-Smtp-Source: AGHT+IGe5rbn57pcV5WvVMFRaVqzQn/8o/be4AqdrMj9UzCA4CC+sOY95dUCzD7HMiYDiMSUTIjeUQ==
X-Received: by 2002:a05:6870:a102:b0:1bf:295a:68a9 with SMTP id
 m2-20020a056870a10200b001bf295a68a9mr2493050oae.19.1692196235325; 
 Wed, 16 Aug 2023 07:30:35 -0700 (PDT)
Received: from [192.168.68.108] (189-69-160-189.dial-up.telesp.net.br.
 [189.69.160.189]) by smtp.gmail.com with ESMTPSA id
 e11-20020a4aaacb000000b0055516447257sm6015774oon.29.2023.08.16.07.30.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Aug 2023 07:30:35 -0700 (PDT)
Message-ID: <be5d0ca7-3ab2-a6d5-d30f-c10cd9afb0a3@ventanamicro.com>
Date: Wed, 16 Aug 2023 11:30:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] target/riscv: Update CSR bits name for svadu extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230816141916.66898-1-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230816141916.66898-1-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x35.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.165,
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



On 8/16/23 11:19, Weiwei Li wrote:
> The Svadu specification updated the name of the *envcfg bit from
> HADE to ADUE.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

> 
> v2:
> * rename hade variable name to adue suggested by Daniel
> 
>   target/riscv/cpu.c        |  4 ++--
>   target/riscv/cpu_bits.h   |  8 ++++----
>   target/riscv/cpu_helper.c |  6 +++---
>   target/riscv/csr.c        | 12 ++++++------
>   4 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6b93b04453..f04a985d55 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -875,9 +875,9 @@ static void riscv_cpu_reset_hold(Object *obj)
>       env->two_stage_lookup = false;
>   
>       env->menvcfg = (cpu->cfg.ext_svpbmt ? MENVCFG_PBMTE : 0) |
> -                   (cpu->cfg.ext_svadu ? MENVCFG_HADE : 0);
> +                   (cpu->cfg.ext_svadu ? MENVCFG_ADUE : 0);
>       env->henvcfg = (cpu->cfg.ext_svpbmt ? HENVCFG_PBMTE : 0) |
> -                   (cpu->cfg.ext_svadu ? HENVCFG_HADE : 0);
> +                   (cpu->cfg.ext_svadu ? HENVCFG_ADUE : 0);
>   
>       /* Initialized default priorities of local interrupts. */
>       for (i = 0; i < ARRAY_SIZE(env->miprio); i++) {
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 59f0ffd9e1..1c2ffae883 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -745,12 +745,12 @@ typedef enum RISCVException {
>   #define MENVCFG_CBIE                       (3UL << 4)
>   #define MENVCFG_CBCFE                      BIT(6)
>   #define MENVCFG_CBZE                       BIT(7)
> -#define MENVCFG_HADE                       (1ULL << 61)
> +#define MENVCFG_ADUE                       (1ULL << 61)
>   #define MENVCFG_PBMTE                      (1ULL << 62)
>   #define MENVCFG_STCE                       (1ULL << 63)
>   
>   /* For RV32 */
> -#define MENVCFGH_HADE                      BIT(29)
> +#define MENVCFGH_ADUE                      BIT(29)
>   #define MENVCFGH_PBMTE                     BIT(30)
>   #define MENVCFGH_STCE                      BIT(31)
>   
> @@ -763,12 +763,12 @@ typedef enum RISCVException {
>   #define HENVCFG_CBIE                       MENVCFG_CBIE
>   #define HENVCFG_CBCFE                      MENVCFG_CBCFE
>   #define HENVCFG_CBZE                       MENVCFG_CBZE
> -#define HENVCFG_HADE                       MENVCFG_HADE
> +#define HENVCFG_ADUE                       MENVCFG_ADUE
>   #define HENVCFG_PBMTE                      MENVCFG_PBMTE
>   #define HENVCFG_STCE                       MENVCFG_STCE
>   
>   /* For RV32 */
> -#define HENVCFGH_HADE                       MENVCFGH_HADE
> +#define HENVCFGH_ADUE                       MENVCFGH_ADUE
>   #define HENVCFGH_PBMTE                      MENVCFGH_PBMTE
>   #define HENVCFGH_STCE                       MENVCFGH_STCE
>   
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 9f611d89bb..3a02079290 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -861,11 +861,11 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>       }
>   
>       bool pbmte = env->menvcfg & MENVCFG_PBMTE;
> -    bool hade = env->menvcfg & MENVCFG_HADE;
> +    bool adue = env->menvcfg & MENVCFG_ADUE;
>   
>       if (first_stage && two_stage && env->virt_enabled) {
>           pbmte = pbmte && (env->henvcfg & HENVCFG_PBMTE);
> -        hade = hade && (env->henvcfg & HENVCFG_HADE);
> +        adue = adue && (env->henvcfg & HENVCFG_ADUE);
>       }
>   
>       int ptshift = (levels - 1) * ptidxbits;
> @@ -1026,7 +1026,7 @@ restart:
>   
>       /* Page table updates need to be atomic with MTTCG enabled */
>       if (updated_pte != pte && !is_debug) {
> -        if (!hade) {
> +        if (!adue) {
>               return TRANSLATE_FAIL;
>           }
>   
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index ea7585329e..b4c66dc8ca 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1951,7 +1951,7 @@ static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
>       if (riscv_cpu_mxl(env) == MXL_RV64) {
>           mask |= (cfg->ext_svpbmt ? MENVCFG_PBMTE : 0) |
>                   (cfg->ext_sstc ? MENVCFG_STCE : 0) |
> -                (cfg->ext_svadu ? MENVCFG_HADE : 0);
> +                (cfg->ext_svadu ? MENVCFG_ADUE : 0);
>       }
>       env->menvcfg = (env->menvcfg & ~mask) | (val & mask);
>   
> @@ -1971,7 +1971,7 @@ static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
>       const RISCVCPUConfig *cfg = riscv_cpu_cfg(env);
>       uint64_t mask = (cfg->ext_svpbmt ? MENVCFG_PBMTE : 0) |
>                       (cfg->ext_sstc ? MENVCFG_STCE : 0) |
> -                    (cfg->ext_svadu ? MENVCFG_HADE : 0);
> +                    (cfg->ext_svadu ? MENVCFG_ADUE : 0);
>       uint64_t valh = (uint64_t)val << 32;
>   
>       env->menvcfg = (env->menvcfg & ~mask) | (valh & mask);
> @@ -2023,7 +2023,7 @@ static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
>        * henvcfg.stce is read_only 0 when menvcfg.stce = 0
>        * henvcfg.hade is read_only 0 when menvcfg.hade = 0
>        */
> -    *val = env->henvcfg & (~(HENVCFG_PBMTE | HENVCFG_STCE | HENVCFG_HADE) |
> +    *val = env->henvcfg & (~(HENVCFG_PBMTE | HENVCFG_STCE | HENVCFG_ADUE) |
>                              env->menvcfg);
>       return RISCV_EXCP_NONE;
>   }
> @@ -2040,7 +2040,7 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
>       }
>   
>       if (riscv_cpu_mxl(env) == MXL_RV64) {
> -        mask |= env->menvcfg & (HENVCFG_PBMTE | HENVCFG_STCE | HENVCFG_HADE);
> +        mask |= env->menvcfg & (HENVCFG_PBMTE | HENVCFG_STCE | HENVCFG_ADUE);
>       }
>   
>       env->henvcfg = (env->henvcfg & ~mask) | (val & mask);
> @@ -2058,7 +2058,7 @@ static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
>           return ret;
>       }
>   
> -    *val = (env->henvcfg & (~(HENVCFG_PBMTE | HENVCFG_STCE | HENVCFG_HADE) |
> +    *val = (env->henvcfg & (~(HENVCFG_PBMTE | HENVCFG_STCE | HENVCFG_ADUE) |
>                               env->menvcfg)) >> 32;
>       return RISCV_EXCP_NONE;
>   }
> @@ -2067,7 +2067,7 @@ static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
>                                        target_ulong val)
>   {
>       uint64_t mask = env->menvcfg & (HENVCFG_PBMTE | HENVCFG_STCE |
> -                                    HENVCFG_HADE);
> +                                    HENVCFG_ADUE);
>       uint64_t valh = (uint64_t)val << 32;
>       RISCVException ret;
>   

