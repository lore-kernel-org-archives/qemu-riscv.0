Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lghul-0008M0-WF
	for mharc-qemu-riscv@gnu.org; Wed, 12 May 2021 02:00:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lghuj-0008Ln-0p; Wed, 12 May 2021 02:00:10 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:45568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lghug-0004Cr-07; Wed, 12 May 2021 02:00:08 -0400
Received: by mail-pf1-x436.google.com with SMTP id i190so17691772pfc.12;
 Tue, 11 May 2021 23:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DEdEmD0ozeiTapDiuurZ7PJsN/pCMoOD45EFBE05LUg=;
 b=HmMkLoSzt7T+FEwOSRfMhIaXtE2fdUuc3SNhI5BXw2ovAID/0Elq6UVS2N1U4e5qRF
 TBV6wffJM5995z6LeOp3VNDMRDyDUMm5ZlmxRLyllrKdlqlMinjHPk9tHV5Ew6d9CuU9
 gHj7GVfy/gs32rPUtnCFbyWarBUVamfW8vm8LeCMhkQCe0j6Qzal5gTj07yp+eKoylyd
 cWrA5WpHuWP9n6qN77xr2pYYPEnGdLd7Nd2O83ShP+ODXSEG1a57is3ct++EX8yH0ZBC
 Ur6cDMxG4RrjN/FDyF2La6RlkIdCORecFvJP/Fs66jLFReoywx0s3nonkG2hQhqH4wJR
 +TQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DEdEmD0ozeiTapDiuurZ7PJsN/pCMoOD45EFBE05LUg=;
 b=qGcebUuEpptql+pPd/wlO95PnlrInEedR/H4wqzVhCXf7xxE0hSYM6sS8G7a21MrNc
 LsyxG/epj35FMe4Dw85btFDZfnA0VKqtWXii2RbuuJ+z/iURfc0ry1SJn8bUXdPpW5UI
 fn9zDlYwheDDMh5QAkNaQ/hFKcEsjiik33n+x8evATCQfVOxBwRNBe3oBo44VvIxRknD
 XN4Y6sDqS0sI4zhzc/VajPauYNElH9pFO9+YmExN89oNJ3Z5Jsor6hse9YRM45/cKSP6
 oO77cZcrsJyKJQ27UcGPFd94OOjT2Vvfk44TRxW3FAJm5Jg8TDpHuYOywS2hFSxaE9fu
 whJg==
X-Gm-Message-State: AOAM533tQ4yF8bm0s6/KMkLdALwYcWU33UHthz9d19yRFMPzzQ6etVN7
 iOgleCX/rZJ/JJ5cvIgdRgK3C4+dGIw8UVzFOk0=
X-Google-Smtp-Source: ABdhPJx9exYvKrFSVtBAcNp3f/g7DW9uRFNKXlz5k6wrwYgp1wu/QwolJcpBAN4p/+njzXQpWzVrfw2lRK6wMougtX8=
X-Received: by 2002:a62:f202:0:b029:28e:96e7:a084 with SMTP id
 m2-20020a62f2020000b029028e96e7a084mr34295266pfh.59.1620799204114; Tue, 11
 May 2021 23:00:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210428041848.12982-1-space.monkey.delivers@gmail.com>
 <20210428041848.12982-6-space.monkey.delivers@gmail.com>
In-Reply-To: <20210428041848.12982-6-space.monkey.delivers@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 12 May 2021 15:59:37 +1000
Message-ID: <CAKmqyKMUB4_x7pu=-ymwiBcO7bebTXxOE1-2fzdzdkj9caobfg@mail.gmail.com>
Subject: Re: [PATCH v8 5/6] [RISCV_PM] Implement address masking functions
 required for RISC-V Pointer Masking extension
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 space.monkey.delivers@gmail.com, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Dave Smith <kupokupokupopo@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 12 May 2021 06:00:10 -0000

On Wed, Apr 28, 2021 at 2:23 PM Alexey Baturo <baturo.alexey@gmail.com> wrote:
>
> From: Anatoly Parshintsev <kupokupokupopo@gmail.com>
>
> Signed-off-by: Anatoly Parshintsev <kupokupokupopo@gmail.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/cpu.h       | 20 ++++++++++++++++++++
>  target/riscv/translate.c | 36 ++++++++++++++++++++++++++++++++++--
>  2 files changed, 54 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 19aa3b4769..2edfc59712 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -407,6 +407,8 @@ FIELD(TB_FLAGS, SEW, 5, 3)
>  FIELD(TB_FLAGS, VILL, 8, 1)
>  /* Is a Hypervisor instruction load/store allowed? */
>  FIELD(TB_FLAGS, HLSX, 9, 1)
> +/* If PointerMasking should be applied */
> +FIELD(TB_FLAGS, PM_ENABLED, 10, 1)
>
>  bool riscv_cpu_is_32bit(CPURISCVState *env);
>
> @@ -464,6 +466,24 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>              flags = FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
>          }
>      }
> +    if (riscv_has_ext(env, RVJ)) {
> +        int priv = cpu_mmu_index(env, false);

You will want to and this with TB_FLAGS_PRIV_MMU_MASK

Otherwise:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> +        bool pm_enabled = false;
> +        switch (priv) {
> +        case PRV_U:
> +            pm_enabled = env->mmte & U_PM_ENABLE;
> +            break;
> +        case PRV_S:
> +            pm_enabled = env->mmte & S_PM_ENABLE;
> +            break;
> +        case PRV_M:
> +            pm_enabled = env->mmte & M_PM_ENABLE;
> +            break;
> +        default:
> +            g_assert_not_reached();
> +        }
> +        flags = FIELD_DP32(flags, TB_FLAGS, PM_ENABLED, pm_enabled);
> +    }
>  #endif
>
>      *pflags = flags;
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 2e815a5912..37706d56d5 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -36,6 +36,9 @@ static TCGv cpu_gpr[32], cpu_pc, cpu_vl;
>  static TCGv_i64 cpu_fpr[32]; /* assume F and D extensions */
>  static TCGv load_res;
>  static TCGv load_val;
> +/* globals for PM CSRs */
> +static TCGv pm_mask[4];
> +static TCGv pm_base[4];
>
>  #include "exec/gen-icount.h"
>
> @@ -64,6 +67,10 @@ typedef struct DisasContext {
>      uint16_t vlen;
>      uint16_t mlen;
>      bool vl_eq_vlmax;
> +    /* PointerMasking extension */
> +    bool pm_enabled;
> +    TCGv pm_mask;
> +    TCGv pm_base;
>      CPUState *cs;
>  } DisasContext;
>
> @@ -90,13 +97,19 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)
>  }
>
>  /*
> - * Temp stub: generates address adjustment for PointerMasking
> + * Generates address adjustment for PointerMasking
>   */
>  static void gen_pm_adjust_address(DisasContext *s,
>                                    TCGv_i64      dst,
>                                    TCGv_i64      src)
>  {
> -    tcg_gen_mov_i64(dst, src);
> +    if (!s->pm_enabled) {
> +        /* Load unmodified address */
> +        tcg_gen_mov_i64(dst, src);
> +    } else {
> +        tcg_gen_andc_i64(dst, src, s->pm_mask);
> +        tcg_gen_or_i64(dst, dst, s->pm_base);
> +    }
>  }
>
>  /*
> @@ -657,6 +670,10 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->lmul = FIELD_EX32(tb_flags, TB_FLAGS, LMUL);
>      ctx->mlen = 1 << (ctx->sew  + 3 - ctx->lmul);
>      ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
> +    ctx->pm_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_ENABLED);
> +    int priv = cpu_mmu_index(env, false) & TB_FLAGS_PRIV_MMU_MASK;
> +    ctx->pm_mask = pm_mask[priv];
> +    ctx->pm_base = pm_base[priv];
>      ctx->cs = cs;
>  }
>
> @@ -777,4 +794,19 @@ void riscv_translate_init(void)
>                               "load_res");
>      load_val = tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, load_val),
>                               "load_val");
> +#ifndef CONFIG_USER_ONLY
> +    /* Assign PM CSRs to tcg globals */
> +    pm_mask[PRV_U] =
> +      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, upmmask), "upmmask");
> +    pm_base[PRV_U] =
> +      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, upmbase), "upmbase");
> +    pm_mask[PRV_S] =
> +      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, spmmask), "spmmask");
> +    pm_base[PRV_S] =
> +      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, spmbase), "spmbase");
> +    pm_mask[PRV_M] =
> +      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, mpmmask), "mpmmask");
> +    pm_base[PRV_M] =
> +      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, mpmbase), "mpmbase");
> +#endif
>  }
> --
> 2.20.1
>
>

