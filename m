Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVWXk-0008TZ-Pb
	for mharc-qemu-riscv@gnu.org; Fri, 24 Feb 2023 06:47:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVWXj-0008T8-S5
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 06:47:15 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVWXi-00089l-2D
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 06:47:15 -0500
Received: by mail-ot1-x32c.google.com with SMTP id
 a14-20020a056830100e00b00690ed91749aso3759493otp.7
 for <qemu-riscv@nongnu.org>; Fri, 24 Feb 2023 03:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xnu0lQWbxM3QuoFjEH/gUFRKWyvnJmSZu2oHAczcHKU=;
 b=c8vxNLBS/RcfCstR0RB7Vc0xiaQGpRGD+yNXwAaxuiRVjdnuDnUsGfxDbOn2XDOi1U
 IJEkKVOVAv6XM6X7NyUU/hUgN+AhVIPE+OIfZ4n3M5LM1zfWGZQIe+x5ou8i71TvrM/y
 uOwJT92rBk3LNEqiNzZjzVsvttsgMN/SspkSpNB/juFCyt8uyGRDQE6o1xY3qIzkMX6r
 PKpIkvMiUFIN1YYlT8cu7rVcjy3q6DuclFZlr5kMqbeWYVGDDicXTkOyxMov+5dLCmh8
 fcRQNZnm1NT4NvH87c5vAsCaS4WaZPgoSqEWkRS4qrSbq6S+PF49kPOWhvA+rILw3SsT
 ER0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xnu0lQWbxM3QuoFjEH/gUFRKWyvnJmSZu2oHAczcHKU=;
 b=dtwhfc8J+URJCwG5lg6+Xl7FeMoiGc2q/vKmix0PRzI9wWZDBu9JYsxYuheaHfTz5I
 qNahjRZJS623pjl6MwdA/RQ1FR4ltQRo3p133EHkTMBGdzCIN81l7r5++BTgagqmHgd6
 3n1HaZGaOW4nytbQ18vbPdEFteLrMWBdIjvkPfieRetQd0ValW3jVhWDL5KhEHLZHggI
 yLUzJs4QcTXlyxj3rUhA+COsyYFND1GGv9L8S3UQFWLu/zIjT26j8Rv2KNEjZ915Nnxz
 SgA8yXAUYK7ABdTWv8LgjQQyaqvM43/thpxsEN9AEwr539cu1F9qvr1I1W6hy4ZVUFmf
 Lcgw==
X-Gm-Message-State: AO0yUKU6fPFajzZaEiC8zB02Lb92hys5aWQWwVXGhnTFjq2lrXWn3mUB
 WGPWt0GgNJUDa5132Rn3OFJ1Tw==
X-Google-Smtp-Source: AK7set+MeJgDbQnDrHtZLQtiN7wkOUOxAqWjZpGLQAOZAfbLQceojzNJ6Hj6ONQOd9hBi8KYeAjjRw==
X-Received: by 2002:a9d:852:0:b0:68d:416e:3d9d with SMTP id
 76-20020a9d0852000000b0068d416e3d9dmr7917487oty.7.1677239232656; 
 Fri, 24 Feb 2023 03:47:12 -0800 (PST)
Received: from ?IPV6:2804:7f0:bcc0:a2b4:12ba:56fa:c61d:cd8f?
 ([2804:7f0:bcc0:a2b4:12ba:56fa:c61d:cd8f])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a9d3e11000000b0068bd3001922sm3339938otd.45.2023.02.24.03.47.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 03:47:12 -0800 (PST)
Message-ID: <e14979dc-7383-84d5-ab03-5bd535752c82@ventanamicro.com>
Date: Fri, 24 Feb 2023 08:47:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 3/6] target/riscv: Add csr support for svadu
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230224040852.37109-1-liweiwei@iscas.ac.cn>
 <20230224040852.37109-4-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230224040852.37109-4-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
X-List-Received-Date: Fri, 24 Feb 2023 11:47:16 -0000



On 2/24/23 01:08, Weiwei Li wrote:
> Add ext_svadu property
> Add HADE field in *envcfg:
> * menvcfg.HADE is read-only zero if Svadu is not implemented.
> * henvcfg.HADE is read-only zero if menvcfg.HADE is zero.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.h      |  1 +
>   target/riscv/cpu_bits.h |  4 ++++
>   target/riscv/csr.c      | 17 +++++++++++------
>   3 files changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 7128438d8e..bd272c35d1 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -450,6 +450,7 @@ struct RISCVCPUConfig {
>       bool ext_zihintpause;
>       bool ext_smstateen;
>       bool ext_sstc;
> +    bool ext_svadu;
>       bool ext_svinval;
>       bool ext_svnapot;
>       bool ext_svpbmt;
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 8b0d7e20ea..fca7ef0cef 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -747,10 +747,12 @@ typedef enum RISCVException {
>   #define MENVCFG_CBIE                       (3UL << 4)
>   #define MENVCFG_CBCFE                      BIT(6)
>   #define MENVCFG_CBZE                       BIT(7)
> +#define MENVCFG_HADE                       (1ULL << 61)
>   #define MENVCFG_PBMTE                      (1ULL << 62)
>   #define MENVCFG_STCE                       (1ULL << 63)
>   
>   /* For RV32 */
> +#define MENVCFGH_HADE                      BIT(29)
>   #define MENVCFGH_PBMTE                     BIT(30)
>   #define MENVCFGH_STCE                      BIT(31)
>   
> @@ -763,10 +765,12 @@ typedef enum RISCVException {
>   #define HENVCFG_CBIE                       MENVCFG_CBIE
>   #define HENVCFG_CBCFE                      MENVCFG_CBCFE
>   #define HENVCFG_CBZE                       MENVCFG_CBZE
> +#define HENVCFG_HADE                       MENVCFG_HADE
>   #define HENVCFG_PBMTE                      MENVCFG_PBMTE
>   #define HENVCFG_STCE                       MENVCFG_STCE
>   
>   /* For RV32 */
> +#define HENVCFGH_HADE                       MENVCFGH_HADE
>   #define HENVCFGH_PBMTE                      MENVCFGH_PBMTE
>   #define HENVCFGH_STCE                       MENVCFGH_STCE
>   
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 02cb2c2bb7..63e140e8ad 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1890,7 +1890,8 @@ static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
>   
>       if (riscv_cpu_mxl(env) == MXL_RV64) {
>           mask |= (cfg->ext_svpbmt ? MENVCFG_PBMTE : 0) |
> -                (cfg->ext_sstc ? MENVCFG_STCE : 0);
> +                (cfg->ext_sstc ? MENVCFG_STCE : 0) |
> +                (cfg->ext_svadu ? MENVCFG_HADE : 0);
>       }
>       env->menvcfg = (env->menvcfg & ~mask) | (val & mask);
>   
> @@ -1909,7 +1910,8 @@ static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
>   {
>       RISCVCPUConfig *cfg = &env_archcpu(env)->cfg;
>       uint64_t mask = (cfg->ext_svpbmt ? MENVCFG_PBMTE : 0) |
> -                    (cfg->ext_sstc ? MENVCFG_STCE : 0);
> +                    (cfg->ext_sstc ? MENVCFG_STCE : 0) |
> +                    (cfg->ext_svadu ? MENVCFG_HADE : 0);
>       uint64_t valh = (uint64_t)val << 32;
>   
>       env->menvcfg = (env->menvcfg & ~mask) | (valh & mask);
> @@ -1959,8 +1961,10 @@ static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
>       /*
>        * henvcfg.pbmte is read_only 0 when menvcfg.pbmte = 0
>        * henvcfg.stce is read_only 0 when menvcfg.stce = 0
> +     * henvcfg.hade is read_only 0 when menvcfg.hade = 0
>        */
> -    *val = env->henvcfg & (~(HENVCFG_PBMTE | HENVCFG_STCE) | env->menvcfg);
> +    *val = env->henvcfg & (~(HENVCFG_PBMTE | HENVCFG_STCE | HENVCFG_HADE) |
> +                           env->menvcfg);
>       return RISCV_EXCP_NONE;
>   }
>   
> @@ -1976,7 +1980,7 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
>       }
>   
>       if (riscv_cpu_mxl(env) == MXL_RV64) {
> -        mask |= env->menvcfg & (HENVCFG_PBMTE | HENVCFG_STCE);
> +        mask |= env->menvcfg & (HENVCFG_PBMTE | HENVCFG_STCE | HENVCFG_HADE);
>       }
>   
>       env->henvcfg = (env->henvcfg & ~mask) | (val & mask);
> @@ -1994,7 +1998,7 @@ static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
>           return ret;
>       }
>   
> -    *val = (env->henvcfg & (~(HENVCFG_PBMTE | HENVCFG_STCE) |
> +    *val = (env->henvcfg & (~(HENVCFG_PBMTE | HENVCFG_STCE | HENVCFG_HADE) |
>                               env->menvcfg)) >> 32;
>       return RISCV_EXCP_NONE;
>   }
> @@ -2002,7 +2006,8 @@ static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
>   static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
>                                     target_ulong val)
>   {
> -    uint64_t mask = env->menvcfg & (HENVCFG_PBMTE | HENVCFG_STCE);
> +    uint64_t mask = env->menvcfg & (HENVCFG_PBMTE | HENVCFG_STCE |
> +                                    HENVCFG_HADE);
>       uint64_t valh = (uint64_t)val << 32;
>       RISCVException ret;
>   

