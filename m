Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mGJH8-0006tE-QO
	for mharc-qemu-riscv@gnu.org; Wed, 18 Aug 2021 06:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGJH6-0006sj-SM; Wed, 18 Aug 2021 06:58:24 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:39723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGJH5-00043Q-3m; Wed, 18 Aug 2021 06:58:24 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id a126so4424678ybg.6;
 Wed, 18 Aug 2021 03:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wfmfof+qnReF7WXHkIFgkUJvCuJ2TJ1yMk1x7q4WkKY=;
 b=jx4fxHIw4bA9aDdOCaE8trQKjZ9tm5M1lhgsG2osHxsOqXQIkO+1QK9A7JKrvGqb7X
 bUI7fOm3OFolLrWb10GA4M0GiYXCPeiAgixsRXl4i6qR6/Pofb4fSdncmRdUaiBdBhNR
 7ksQb9WU8Ta/+MUkG8gMLLnP/1Op9dgT6d9fOKVPN2PWC1OvMnI35f+hrrcxXtU5HtL8
 b2YflrTnLo13NBWm57o/e3u5rD1XROw5b2rQRjvwRukOMmuq0mfsFGsanXnvkPL00uee
 1zG/SFCB02iMODkPEXwe85MM89tQ+T3oL8mJdMpRBc/HXeJAsN2mzE0rHf3SKvs7fwmg
 qUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wfmfof+qnReF7WXHkIFgkUJvCuJ2TJ1yMk1x7q4WkKY=;
 b=VIk5lestShB6KZjBAJ2aF1C06EyKPlTxNoR7vLWnUj/BgkOwKzSAB1ria4kOoUVfXb
 WXB2TKhuJnzJPorLIWdICA4KvjCb42myviGgZtSXMU9Gv/D2LcFEXR2Ab7U3m6ustQXF
 BF0kNtMbdOn3q+1ZJuZDalw1Xjxamm9XkDf6GeEPFqX6iwIqiGr15Wwv1b3yl/V3fAWX
 KPWj2iBdhJjQTyb5YZdOWVUqXaaeyzmqiMoedx4hBGypWzcgIeNBDw/KK5AZjUDMKLQ0
 2w3Mu1YWesU9tbyeZJNFwBL9kZy2SMJFftCNQSj7MXtiQ0sTkG0VzfEy4a3Aak7AwAxh
 ipqg==
X-Gm-Message-State: AOAM533BZEUMppR5NDIiDwPge60T4FRNWIEQDAvHeVs4rm0xV6l5vgqc
 mkuYIJGbcOO5WPhwW58VALTPEbZUCyoX9R2w2/Y=
X-Google-Smtp-Source: ABdhPJwaQl++QUMbyUEKnTH/uAWpFf6x/CsO+QWE/Zkw/owqMJkeCAj1Q88M4ZTMjK34hkil6TD4Mru4IfF+pr7AEgk=
X-Received: by 2002:a25:be09:: with SMTP id h9mr11236489ybk.239.1629284301809; 
 Wed, 18 Aug 2021 03:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210817211803.283639-1-richard.henderson@linaro.org>
 <20210817211803.283639-5-richard.henderson@linaro.org>
In-Reply-To: <20210817211803.283639-5-richard.henderson@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 18 Aug 2021 18:58:10 +0800
Message-ID: <CAEUhbmXT-Hbrm6YJMuyBtuQrB3D0wt3pkQHNpPCqB8m0Ek3PFg@mail.gmail.com>
Subject: Re: [PATCH v2 04/21] target/riscv: Introduce DisasExtend and new
 helpers
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 liuzhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 18 Aug 2021 10:58:25 -0000

On Wed, Aug 18, 2021 at 5:22 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Introduce get_gpr, dest_gpr, temp_new -- new helpers that do not force
> tcg globals into temps, returning a constant 0 for $zero as source and
> a new temp for $zero as destination.
>
> Introduce ctx->w for simplifying word operations, such as addw.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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

Why is 4? Is it enough? Perhaps a comment here is needed here?

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

What about zero extension?

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

This is better to be done in riscv_tr_init_disas_context() where ctx
members are initialized.

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

Why is this change? I believe we should explicitly initialize the ctx
in riscv_tr_init_disas_context()

>
>      translator_loop(&riscv_tr_ops, &ctx.base, cs, tb, max_insns);
>  }
> --

Regards,
Bin

