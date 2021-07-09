Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1jKi-0002Wt-Mm
	for mharc-qemu-riscv@gnu.org; Fri, 09 Jul 2021 01:45:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m1jKh-0002Ty-LY; Fri, 09 Jul 2021 01:45:51 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:41860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m1jKe-0006Wz-Al; Fri, 09 Jul 2021 01:45:51 -0400
Received: by mail-il1-x130.google.com with SMTP id m3so2446086ilj.8;
 Thu, 08 Jul 2021 22:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hXVUmido4cxKAzN26xHLpzvLKvp6IiviOsbPENUkJDY=;
 b=lHiCVWVjvoYCmiQlzwRWeZocrgvunVn4Y/VGhzrUqZvrXr/rxs7OcZH+1u0X/yFmlC
 QH87MQBvRaUdsxbb92uOtVMWVSUa4VRp703D+r2KVl8aF06kA/+XFDxRgSFMYnjK23Rm
 ZwdzKi66FVl9h2LeueVrMnB5uCehGNt+H9LWgmn6IySdEwedPEehvjKNLsx2KAQA7HIi
 FblawnskrCcUlay8OowClPuDuGoSKjOFpNZY8Kl2LEab03j3kakpd0oWpJ5TzWMy5lTG
 HybezAQIpAlw4ThPj10e/YoV4f7F1dX+Df+ASftGhyd3GkPj5WzWTWbt9Er3/jRThMel
 b1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hXVUmido4cxKAzN26xHLpzvLKvp6IiviOsbPENUkJDY=;
 b=SAmmiUpzMixC0qFfC+iVsmi0n3RIIS3Lym57MjOxB44G9Kg8gPTYHwYqcOinvWbzkl
 BIZNewsLBGVzgobPAJnX+mywISu0CHcgTY315sJpW+w73IFfqJ9LTtqSAIjZEZY8SHnp
 XywpzikZPPVDOeRcs7HkQs4/Z6kEeLp2rGP/xfklSUxD87plITu2thTfNOPXQsUj/umu
 yo4Rp8aDEoUD23V/33nzi4wd2b17rqjiHmczuhajZ4vQip0gMI2y/rDU+eiTuowALvtD
 NzCm6JIK4VQbZRPv/205Vjuxko2k4LNoXLjjIlp7Uba45J25Id/lcL3kYQ4zkf/XqzPx
 XggQ==
X-Gm-Message-State: AOAM530j5rIgPTR/4j3wRKduvL6D+wq7bNFbIVzViJ90fmK6qs1Kbs/6
 4PvEBIJc5Z2Gce1dg6w249DbW+UzEYZuuvo31Ds=
X-Google-Smtp-Source: ABdhPJwOw+0fRngke84mNsfHUDojVA0yEYwk1k47v4BMlMPuUtw3eiOvRn+tvJdwYxS1vcZ/pvEux+lnL08gMuGHoLU=
X-Received: by 2002:a05:6e02:ecb:: with SMTP id
 i11mr22993212ilk.40.1625809546768; 
 Thu, 08 Jul 2021 22:45:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210709042608.883256-1-richard.henderson@linaro.org>
 <20210709042608.883256-3-richard.henderson@linaro.org>
In-Reply-To: <20210709042608.883256-3-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 9 Jul 2021 15:45:20 +1000
Message-ID: <CAKmqyKO_yBmRJNq5avy1J_dp4dqOEv15uhcErS2BY7pbP=ytJQ@mail.gmail.com>
Subject: Re: [PATCH 02/17] target/riscv: Introduce gpr_src, gpr_dst
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x130.google.com
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
X-List-Received-Date: Fri, 09 Jul 2021 05:45:52 -0000

On Fri, Jul 9, 2021 at 2:42 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> New helpers that do not force tcg globals into temps,
> returning a constant 0 for $zero as source and a new
> temp for $zero as destination.
>
> Use them in gen_arith_imm_{fn,tl}, gen_arith, gen_unary.
> These are simplest because no further temps required.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c | 83 ++++++++++++++++++++++------------------
>  1 file changed, 45 insertions(+), 38 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index bba5ad8ec4..2cfcb849b8 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -65,6 +65,8 @@ typedef struct DisasContext {
>      uint16_t mlen;
>      bool vl_eq_vlmax;
>      CPUState *cs;
> +    TCGv zero;
> +    TCGv sink;
>  } DisasContext;
>
>  static inline bool has_ext(DisasContext *ctx, uint32_t ext)
> @@ -202,6 +204,14 @@ static inline void gen_get_gpr(TCGv t, int reg_num)
>      }
>  }
>
> +static TCGv gpr_src(DisasContext *ctx, int reg_num)
> +{
> +    if (reg_num == 0) {
> +        return ctx->zero;
> +    }
> +    return cpu_gpr[reg_num];
> +}
> +
>  /* Wrapper for setting reg values - need to check of reg is zero since
>   * cpu_gpr[0] is not actually allocated. this is more for safety purposes,
>   * since we usually avoid calling the OP_TYPE_gen function if we see a write to
> @@ -214,6 +224,17 @@ static inline void gen_set_gpr(int reg_num_dst, TCGv t)
>      }
>  }
>
> +static TCGv gpr_dst(DisasContext *ctx, int reg_num)
> +{
> +    if (reg_num == 0) {
> +        if (ctx->sink == NULL) {
> +            ctx->sink = tcg_temp_new();
> +        }
> +        return ctx->sink;
> +    }
> +    return cpu_gpr[reg_num];
> +}
> +
>  static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
>  {
>      TCGv rl = tcg_temp_new();
> @@ -442,33 +463,21 @@ static int ex_rvc_shifti(DisasContext *ctx, int imm)
>  static bool gen_arith_imm_fn(DisasContext *ctx, arg_i *a,
>                               void (*func)(TCGv, TCGv, target_long))
>  {
> -    TCGv source1;
> -    source1 = tcg_temp_new();
> +    TCGv dest = gpr_dst(ctx, a->rd);
> +    TCGv src1 = gpr_src(ctx, a->rs1);
>
> -    gen_get_gpr(source1, a->rs1);
> -
> -    (*func)(source1, source1, a->imm);
> -
> -    gen_set_gpr(a->rd, source1);
> -    tcg_temp_free(source1);
> +    (*func)(dest, src1, a->imm);
>      return true;
>  }
>
>  static bool gen_arith_imm_tl(DisasContext *ctx, arg_i *a,
>                               void (*func)(TCGv, TCGv, TCGv))
>  {
> -    TCGv source1, source2;
> -    source1 = tcg_temp_new();
> -    source2 = tcg_temp_new();
> +    TCGv dest = gpr_dst(ctx, a->rd);
> +    TCGv src1 = gpr_src(ctx, a->rs1);
> +    TCGv src2 = tcg_constant_tl(a->imm);
>
> -    gen_get_gpr(source1, a->rs1);
> -    tcg_gen_movi_tl(source2, a->imm);
> -
> -    (*func)(source1, source1, source2);
> -
> -    gen_set_gpr(a->rd, source1);
> -    tcg_temp_free(source1);
> -    tcg_temp_free(source2);
> +    (*func)(dest, src1, src2);
>      return true;
>  }
>
> @@ -758,18 +767,11 @@ static void gen_add_uw(TCGv ret, TCGv arg1, TCGv arg2)
>  static bool gen_arith(DisasContext *ctx, arg_r *a,
>                        void(*func)(TCGv, TCGv, TCGv))
>  {
> -    TCGv source1, source2;
> -    source1 = tcg_temp_new();
> -    source2 = tcg_temp_new();
> +    TCGv dest = gpr_dst(ctx, a->rd);
> +    TCGv src1 = gpr_src(ctx, a->rs1);
> +    TCGv src2 = gpr_src(ctx, a->rs2);
>
> -    gen_get_gpr(source1, a->rs1);
> -    gen_get_gpr(source2, a->rs2);
> -
> -    (*func)(source1, source1, source2);
> -
> -    gen_set_gpr(a->rd, source1);
> -    tcg_temp_free(source1);
> -    tcg_temp_free(source2);
> +    (*func)(dest, src1, src2);
>      return true;
>  }
>
> @@ -871,14 +873,10 @@ static void gen_clz(TCGv ret, TCGv arg1)
>  static bool gen_unary(DisasContext *ctx, arg_r2 *a,
>                        void(*func)(TCGv, TCGv))
>  {
> -    TCGv source = tcg_temp_new();
> +    TCGv dest = gpr_dst(ctx, a->rd);
> +    TCGv src1 = gpr_src(ctx, a->rs1);
>
> -    gen_get_gpr(source, a->rs1);
> -
> -    (*func)(source, source);
> -
> -    gen_set_gpr(a->rd, source);
> -    tcg_temp_free(source);
> +    (*func)(dest, src1);
>      return true;
>  }
>
> @@ -952,8 +950,12 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->cs = cs;
>  }
>
> -static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
> +static void riscv_tr_tb_start(DisasContextBase *dcbase, CPUState *cpu)
>  {
> +    DisasContext *ctx = container_of(dcbase, DisasContext, base);
> +
> +    ctx->sink = NULL;
> +    ctx->zero = tcg_constant_tl(0);
>  }
>
>  static void riscv_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
> @@ -988,6 +990,11 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>      decode_opc(env, ctx, opcode16);
>      ctx->base.pc_next = ctx->pc_succ_insn;
>
> +    if (ctx->sink) {
> +        tcg_temp_free(ctx->sink);
> +        ctx->sink = NULL;
> +    }
> +
>      if (ctx->base.is_jmp == DISAS_NEXT) {
>          target_ulong page_start;
>
> --
> 2.25.1
>
>

