Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8318DC001B0
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 09:15:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qWCch-00025T-VA; Wed, 16 Aug 2023 05:15:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qWCcb-000254-6L
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 05:15:21 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qWCcX-0005sq-Av
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 05:15:20 -0400
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-56ce936f7c0so4473916eaf.3
 for <qemu-riscv@nongnu.org>; Wed, 16 Aug 2023 02:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692177315; x=1692782115;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JkqMYbzFh8jDK06nJ+rN9IfFUiT7E31HVB50sPrnOL0=;
 b=V0km+NmXrsE/bZ/KdhqG3DsLHvQ6jLzf2+NJd+M5u57Cbqbt61iBnClySlYWQ9Abg3
 9CQBHrEuZcFpnm4Xy4znei+F/JhVgojoiVJOUW66EM5hdxemKsv+7Se9BKQbqp9ykAOw
 VH+9gzWUrEjrQv4m2yvLY2l+wjKDq3rI/aoV9Nob+DEGrFzVvoqnWmSPWKa0y47eey9t
 6eByX57iqZS5XWZ4x/qNaC1htgiDqfMvks4nr5oNKHyGXQH4h2hFoBa86KJpI5jdeJoR
 Rt6CEiX5G5Ps5Ck2+3Xz1/L6LfO2abApXrtjvzcVCK8jifbQ8ornrZ7OmxYumf0B1Yj0
 A6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692177315; x=1692782115;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JkqMYbzFh8jDK06nJ+rN9IfFUiT7E31HVB50sPrnOL0=;
 b=kRw0B9eeMmpUvH/ABWW53fKDnwlnxjIs6WgDEd4qmp0ogyU27XR95RwLCkjXvWu9vM
 c8vSH9q8nNg3ESG74JKAUGE+vn4wSS8vMWBhSVWIiS5BYOiUFGWlLa5lSdjFcuRGrB5J
 X2D+chZ/JyS7Cj4RR4zVIH63quYyK7Ak7qedF7TDA/+e/exISivSqm//hn8BaGkmxeUv
 /ebeIxNxFK5uDh/mG7JZ+LRi2OZoRBof6wteF0YI/sMWoE+Psp772SUmr1PZ+Kj+df7I
 b+gAsz0Bnp7x+j7RauHVjfdMpq7fM0aQ6mto3NFdWNuwfGz17WqNYjig2WJfv7PboBoV
 LXuw==
X-Gm-Message-State: AOJu0YwCrQqjZU7hvFvVssa38ZdjBKPe8xm8lo8iPykLOIO+QYP+KRXS
 uA+R4bUe9EGeALwz2iH+fnh5Rw==
X-Google-Smtp-Source: AGHT+IGaUW+DwiFLsR3nSNKBUSvbJuFdTfxncFBF5NdZ4ZGPXWn3Tqvf04TUqODU9zLI8jHle8b33A==
X-Received: by 2002:a05:6870:b428:b0:1bb:8842:7b5c with SMTP id
 x40-20020a056870b42800b001bb88427b5cmr1520216oap.43.1692177315231; 
 Wed, 16 Aug 2023 02:15:15 -0700 (PDT)
Received: from [192.168.68.108] (189-69-160-189.dial-up.telesp.net.br.
 [189.69.160.189]) by smtp.gmail.com with ESMTPSA id
 q3-20020a9d6643000000b006b94aba1f0bsm6036005otm.43.2023.08.16.02.15.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Aug 2023 02:15:14 -0700 (PDT)
Message-ID: <d9fa9c2f-29cb-d186-3023-29a16918aecc@ventanamicro.com>
Date: Wed, 16 Aug 2023 06:15:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] target/riscv: Update CSR bits name for svadu extension
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230815022442.25032-1-liweiwei@iscas.ac.cn>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230815022442.25032-1-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc31.google.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.045,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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



On 8/14/23 23:24, Weiwei Li wrote:
> The Svadu specification updated the name of the *envcfg bit from
> HADE to ADUE.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/cpu.c        |  4 ++--
>   target/riscv/cpu_bits.h   |  8 ++++----
>   target/riscv/cpu_helper.c |  4 ++--
>   target/riscv/csr.c        | 12 ++++++------
>   4 files changed, 14 insertions(+), 14 deletions(-)
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
> index 9f611d89bb..0ff6b59cff 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -861,11 +861,11 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>       }
>   
>       bool pbmte = env->menvcfg & MENVCFG_PBMTE;
> -    bool hade = env->menvcfg & MENVCFG_HADE;
> +    bool hade = env->menvcfg & MENVCFG_ADUE;

I suggest renaming the 'hade' var to 'adue' as well to avoid confusion.


Thanks,

Daniel

>   
>       if (first_stage && two_stage && env->virt_enabled) {
>           pbmte = pbmte && (env->henvcfg & HENVCFG_PBMTE);
> -        hade = hade && (env->henvcfg & HENVCFG_HADE);
> +        hade = hade && (env->henvcfg & HENVCFG_ADUE);
>       }
>   
>       int ptshift = (levels - 1) * ptidxbits;
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

