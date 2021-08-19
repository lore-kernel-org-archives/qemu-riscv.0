Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mGbUx-000348-Ca
	for mharc-qemu-riscv@gnu.org; Thu, 19 Aug 2021 02:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mGbUv-0002yn-4K; Thu, 19 Aug 2021 02:25:53 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:45897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mGbUr-0003bH-4R; Thu, 19 Aug 2021 02:25:52 -0400
Received: by mail-io1-xd35.google.com with SMTP id e186so6220105iof.12;
 Wed, 18 Aug 2021 23:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0tm2e9sRdofeSC5bOq5As8GHVgYoAmhHYhFsBWSyOms=;
 b=i5MHPDTamUx85LBxIClLsXtJxxUicE+wjj8Lkecm98X8e1pctgyVAoNHpuzWh+3IBH
 8ATFWwTtYdJhWwDFlNfBDrShHvytfcSDHancSTr2Xr64xmrhIaJRKoRgiD63zczu6I32
 EwfWJ0Wou9KnPAi5l89j/UK6SRth402k/ahuWKdzC+eb3pT1AiwebMi8KZdnahNvXEi5
 L3U8tsxZxxRVKAa7Bp1SdoLZiotP9t3PCj7UYU0t9hLfvV8JvaVNo13Otn1051NL6+C9
 qfuwRpFtgV1nG9Igwkb+labJ5fod6nY9tD6XnqM3C/d5BBgAQ5bJCWIaT3DvcP+VMHYT
 ORaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0tm2e9sRdofeSC5bOq5As8GHVgYoAmhHYhFsBWSyOms=;
 b=O/OOzCDNx+8enlI9VeP0ne1OgrfTsT2jImJ5Fq6hI+WT18530vSKcMHYNJz+T9X346
 uS4pHWFpFpmQ+Zo7jb/Fn8rkMuSiwjRL1aAFGS4Ssha43R2x3LrGFmpYU407lPLN7gIt
 20x4yvlGP+yGj8tINGStiEskVavhOgwJXKL49cdCFYiDAtL1VMpUhgeIDAOuCX89db/j
 GqND8Gs9fWBsnv4MzKPpL7Kkvbys2hsWM2aIrpqoc5Gbm1jRGkWhHHGXPmIMtWy/1Dr5
 3YXe5jLkGWfflPxt2TYa4I90AqqE1+o9fkgqAjCxSnkpsqE+l6EqZxUhg3qPRU4z8AVk
 5AEQ==
X-Gm-Message-State: AOAM530OCzJGuDz69MKTnDpBgY01Dc+Sy+osH6VKp0bRG464L4f8o+t0
 T/RJlLntN3vP+Ikg7lM8/NyuBcTBI9piemy6UlQ=
X-Google-Smtp-Source: ABdhPJyiZ8Ibh6EZw1ta88xJekGizUp0SwONkuPHOvGo53o0EnClpJW1sQmN5iMFUar6eG6t+n6nCo+9mieqduPvz0Y=
X-Received: by 2002:a5d:850f:: with SMTP id q15mr10424851ion.118.1629354347673; 
 Wed, 18 Aug 2021 23:25:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210817211803.283639-1-richard.henderson@linaro.org>
 <20210817211803.283639-5-richard.henderson@linaro.org>
In-Reply-To: <20210817211803.283639-5-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 19 Aug 2021 16:25:21 +1000
Message-ID: <CAKmqyKNV8wvJogX2Uh=6Tp-0yFnfrSFU19UQ2uZb6Y2Py2gJxg@mail.gmail.com>
Subject: Re: [PATCH v2 04/21] target/riscv: Introduce DisasExtend and new
 helpers
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 liuzhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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
X-List-Received-Date: Thu, 19 Aug 2021 06:25:53 -0000

On Wed, Aug 18, 2021 at 7:23 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Introduce get_gpr, dest_gpr, temp_new -- new helpers that do not force
> tcg globals into temps, returning a constant 0 for $zero as source and
> a new temp for $zero as destination.
>
> Introduce ctx->w for simplifying word operations, such as addw.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c | 102 +++++++++++++++++++++++++++++++--------
>  1 file changed, 82 insertions(+), 20 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index d540c85a1a..d5cf5e5826 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -39,15 +39,25 @@ static TCGv load_val;
>
>  #include "exec/gen-icount.h"
>
> +/*
> + * If an operation is being performed on less than TARGET_LONG_BITS,
> + * it may require the inputs to be sign- or zero-extended; which will
> + * depend on the exact operation being performed.
> + */
> +typedef enum {
> +    EXT_NONE,
> +    EXT_SIGN,
> +    EXT_ZERO,
> +} DisasExtend;
> +
>  typedef struct DisasContext {
>      DisasContextBase base;
>      /* pc_succ_insn points to the instruction following base.pc_next */
>      target_ulong pc_succ_insn;
>      target_ulong priv_ver;
> -    bool virt_enabled;
> +    target_ulong misa;
>      uint32_t opcode;
>      uint32_t mstatus_fs;
> -    target_ulong misa;
>      uint32_t mem_idx;
>      /* Remember the rounding mode encoded in the previous fp instruction,
>         which we have already installed into env->fp_status.  Or -1 for
> @@ -55,6 +65,8 @@ typedef struct DisasContext {
>         to any system register, which includes CSR_FRM, so we do not have
>         to reset this known value.  */
>      int frm;
> +    bool w;
> +    bool virt_enabled;
>      bool ext_ifencei;
>      bool hlsx;
>      /* vector extension */
> @@ -64,7 +76,10 @@ typedef struct DisasContext {
>      uint16_t vlen;
>      uint16_t mlen;
>      bool vl_eq_vlmax;
> +    uint8_t ntemp;
>      CPUState *cs;
> +    TCGv zero;
> +    TCGv temp[4];
>  } DisasContext;
>
>  static inline bool has_ext(DisasContext *ctx, uint32_t ext)
> @@ -172,27 +187,64 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
>      }
>  }
>
> -/* Wrapper for getting reg values - need to check of reg is zero since
> - * cpu_gpr[0] is not actually allocated
> +/*
> + * Wrappers for getting reg values.
> + *
> + * The $zero register does not have cpu_gpr[0] allocated -- we supply the
> + * constant zero as a source, and an uninitialized sink as destination.
> + *
> + * Further, we may provide an extension for word operations.
>   */
> -static void gen_get_gpr(DisasContext *ctx, TCGv t, int reg_num)
> +static TCGv temp_new(DisasContext *ctx)
>  {
> -    if (reg_num == 0) {
> -        tcg_gen_movi_tl(t, 0);
> -    } else {
> -        tcg_gen_mov_tl(t, cpu_gpr[reg_num]);
> -    }
> +    assert(ctx->ntemp < ARRAY_SIZE(ctx->temp));
> +    return ctx->temp[ctx->ntemp++] = tcg_temp_new();
>  }
>
> -/* Wrapper for setting reg values - need to check of reg is zero since
> - * cpu_gpr[0] is not actually allocated. this is more for safety purposes,
> - * since we usually avoid calling the OP_TYPE_gen function if we see a write to
> - * $zero
> - */
> -static void gen_set_gpr(DisasContext *ctx, int reg_num_dst, TCGv t)
> +static TCGv get_gpr(DisasContext *ctx, int reg_num, DisasExtend ext)
>  {
> -    if (reg_num_dst != 0) {
> -        tcg_gen_mov_tl(cpu_gpr[reg_num_dst], t);
> +    TCGv t;
> +
> +    if (reg_num == 0) {
> +        return ctx->zero;
> +    }
> +
> +    switch (ctx->w ? ext : EXT_NONE) {
> +    case EXT_NONE:
> +        return cpu_gpr[reg_num];
> +    case EXT_SIGN:
> +        t = temp_new(ctx);
> +        tcg_gen_ext32s_tl(t, cpu_gpr[reg_num]);
> +        return t;
> +    case EXT_ZERO:
> +        t = temp_new(ctx);
> +        tcg_gen_ext32u_tl(t, cpu_gpr[reg_num]);
> +        return t;
> +    }
> +    g_assert_not_reached();
> +}
> +
> +static void gen_get_gpr(DisasContext *ctx, TCGv t, int reg_num)
> +{
> +    tcg_gen_mov_tl(t, get_gpr(ctx, reg_num, EXT_NONE));
> +}
> +
> +static TCGv __attribute__((unused)) dest_gpr(DisasContext *ctx, int reg_num)
> +{
> +    if (reg_num == 0 || ctx->w) {
> +        return temp_new(ctx);
> +    }
> +    return cpu_gpr[reg_num];
> +}
> +
> +static void gen_set_gpr(DisasContext *ctx, int reg_num, TCGv t)
> +{
> +    if (reg_num != 0) {
> +        if (ctx->w) {
> +            tcg_gen_ext32s_tl(cpu_gpr[reg_num], t);
> +        } else {
> +            tcg_gen_mov_tl(cpu_gpr[reg_num], t);
> +        }
>      }
>  }
>
> @@ -927,8 +979,11 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->cs = cs;
>  }
>
> -static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
> +static void riscv_tr_tb_start(DisasContextBase *dcbase, CPUState *cpu)
>  {
> +    DisasContext *ctx = container_of(dcbase, DisasContext, base);
> +
> +    ctx->zero = tcg_constant_tl(0);
>  }
>
>  static void riscv_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
> @@ -946,6 +1001,13 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>
>      decode_opc(env, ctx, opcode16);
>      ctx->base.pc_next = ctx->pc_succ_insn;
> +    ctx->w = false;
> +
> +    for (int i = ctx->ntemp - 1; i >= 0; --i) {
> +        tcg_temp_free(ctx->temp[i]);
> +        ctx->temp[i] = NULL;
> +    }
> +    ctx->ntemp = 0;
>
>      if (ctx->base.is_jmp == DISAS_NEXT) {
>          target_ulong page_start;
> @@ -997,7 +1059,7 @@ static const TranslatorOps riscv_tr_ops = {
>
>  void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
>  {
> -    DisasContext ctx;
> +    DisasContext ctx = { };
>
>      translator_loop(&riscv_tr_ops, &ctx.base, cs, tb, max_insns);
>  }
> --
> 2.25.1
>
>

