Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfNG9-0006BF-TB
	for mharc-qemu-riscv@gnu.org; Thu, 23 Mar 2023 11:53:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfNG8-0006Aw-2r
 for qemu-riscv@nongnu.org; Thu, 23 Mar 2023 11:53:48 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfNG0-0007Vr-Np
 for qemu-riscv@nongnu.org; Thu, 23 Mar 2023 11:53:47 -0400
Received: by mail-pl1-x630.google.com with SMTP id o11so22730738ple.1
 for <qemu-riscv@nongnu.org>; Thu, 23 Mar 2023 08:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679586810;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DjJ03HJNwbjOJhLEqwT4w8MnmSGcVvdvFzpZtZD+8lw=;
 b=OkOKYhGhOMmQLFRNV7wDNKatLmU6AQAMubXDtVGwKjESIeRID4KOPTxvMFPUUfLlcE
 6Ye60VLX4r8bGm1M2QkD4zqWuuZON7YRnott2VjnTYPbAZviRgaP4Tc0yUi0qvSm6fx0
 2fi5qm8NasCgnA1YMFBql0QOCafEJxomC35h8qgeX4eMBfh4DOkaaMV6r9tJ8297u6Eg
 PFSSB/3yx8FCQD6wOJe3hTdTPOr+FPxRZ77KFo17aOlsNQWRmpH+uINW1rZGkHkaptEB
 gJKuc7gx5SwEf3JL1zQWRCw4QbEioovos07+geauZdiBNzKoxdctgXHhRxb1RqauqDNe
 shfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679586810;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DjJ03HJNwbjOJhLEqwT4w8MnmSGcVvdvFzpZtZD+8lw=;
 b=AvbLZ0N1FSBx+WkAv9Idmei/MCXtVdZRSou4mbXgxQHK+mYn5PldMeR3wIiyQUw7T7
 JQCkvBfL5hZY78TBkPOtBgxjO4C8ACrTCYMBPip7ZTwVvPCzYfkGyVN+SwRB2iZxW421
 EiBxoRLXVwHnalYP1S+w0W5kNo8UO/g+agYqqFlwCqa5bXMu5Cc5ZJp9mFspkQ1/3t+4
 fAu8UUWGyReC31EhyMIJhMnAXvvEwmTcU2sAjmd3cud8S7x9BqVx7vU5IHgiqkjn599t
 EZfPCQa9/bBdD++BcJdc4vb28zi4WloNWskgbhwR1QUn4QnOohA7Wvfs97uz5serwqBD
 QFgQ==
X-Gm-Message-State: AO0yUKWIkQe5HKfVFVMUT7Kr7Zk//+ClkIfkKP1WD1f5bPs2O/UPXsLa
 JQL4zENjzIN6G5ED0TEBdtW/OQ==
X-Google-Smtp-Source: AK7set/DNQnw+3+FL/dHXSDk/IKZ+AMu4pUoCzJTnYaBR7wG/ykcgwGw8EJRRp+3HyrOz2pSTgEb6w==
X-Received: by 2002:a05:6a20:8b26:b0:d9:e45d:95d6 with SMTP id
 l38-20020a056a208b2600b000d9e45d95d6mr31331pzh.35.1679586810158; 
 Thu, 23 Mar 2023 08:53:30 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:226e:47e1:b8cd:a957?
 ([2602:ae:1544:6601:226e:47e1:b8cd:a957])
 by smtp.gmail.com with ESMTPSA id
 x25-20020aa793b9000000b00627e87f51a5sm9592058pff.161.2023.03.23.08.53.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 08:53:29 -0700 (PDT)
Message-ID: <06d24ab8-bfca-6ade-4510-0bc961c97789@linaro.org>
Date: Thu, 23 Mar 2023 08:53:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 1/2] target/riscv: separate priv from mmu_idx
Content-Language: en-US
To: Fei Wu <fei2.wu@intel.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>
References: <20230323024412.324085-1-fei2.wu@intel.com>
 <20230323024412.324085-2-fei2.wu@intel.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230323024412.324085-2-fei2.wu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Thu, 23 Mar 2023 15:53:48 -0000

On 3/22/23 19:44, Fei Wu wrote:
> Currently it's assumed the 2 low bits of mmu_idx map to privilege mode,
> this assumption won't last as we are about to add more mmu_idx.
> 
> Signed-off-by: Fei Wu <fei2.wu@intel.com>
> ---
>   target/riscv/cpu.h                             | 1 -
>   target/riscv/cpu_helper.c                      | 2 +-
>   target/riscv/insn_trans/trans_privileged.c.inc | 2 +-
>   target/riscv/insn_trans/trans_xthead.c.inc     | 7 +------
>   target/riscv/translate.c                       | 3 +++
>   5 files changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 638e47c75a..66f7e3d1ba 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -623,7 +623,6 @@ G_NORETURN void riscv_raise_exception(CPURISCVState *env,
>   target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
>   void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
>   
> -#define TB_FLAGS_PRIV_MMU_MASK                3
>   #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
>   #define TB_FLAGS_MSTATUS_FS MSTATUS_FS
>   #define TB_FLAGS_MSTATUS_VS MSTATUS_VS
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index f88c503cf4..76e1b0100e 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -762,7 +762,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>        * (riscv_cpu_do_interrupt) is correct */
>       MemTxResult res;
>       MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
> -    int mode = mmu_idx & TB_FLAGS_PRIV_MMU_MASK;
> +    int mode = env->priv;

This is incorrect.  You must map back from mmu_idx to priv.
Recall the semantics of MPRV.

> diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
> index df504c3f2c..adfb53cb4c 100644
> --- a/target/riscv/insn_trans/trans_xthead.c.inc
> +++ b/target/riscv/insn_trans/trans_xthead.c.inc
> @@ -265,12 +265,7 @@ static bool trans_th_tst(DisasContext *ctx, arg_th_tst *a)
>   
>   static inline int priv_level(DisasContext *ctx)
>   {
> -#ifdef CONFIG_USER_ONLY
> -    return PRV_U;
> -#else
> -     /* Priv level is part of mem_idx. */
> -    return ctx->mem_idx & TB_FLAGS_PRIV_MMU_MASK;
> -#endif
> +    return ctx->priv;
>   }

I guess we aren't expecting optimization to remove dead system code?
That would be the only reason to keep the ifdef.

This function should be hoisted to translate.c, or simply replaced by the field access.

> @@ -1162,8 +1163,10 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>       } else {
>           ctx->virt_enabled = false;
>       }
> +    ctx->priv = env->priv;

Incorrect, as Zhiwei pointed out.
I gave you the changes required to TB_FLAGS...


r~

