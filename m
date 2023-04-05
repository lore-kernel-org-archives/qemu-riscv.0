Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjuyK-0002zu-HH
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 00:42:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjuyI-0002zY-Un; Wed, 05 Apr 2023 00:42:11 -0400
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjuyG-0000A0-TS; Wed, 05 Apr 2023 00:42:10 -0400
Received: by mail-ua1-x92b.google.com with SMTP id e12so24789160uaa.3;
 Tue, 04 Apr 2023 21:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680669727;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7RKS3qRVR9X13uJjgu1WIOkfNbB4dVTNOOGn0jwRjFM=;
 b=RiKMZCVPbepWHZZu/o0lH07tek5LJZHp23E3iPbCxrnxNW2/ge8HCvJGpmgZeNBx9c
 R42mzj/RAuI6dGAbOWIWoR5Opu8LJnq6zsm8ektEEe3hcjLcOBMy2946LCqH1YxUAbp2
 lPr2rYLLNskvbktfQM0HnjgFTbhzUoQyzeK7jdfCVkwLQEm7wqf+kwUf7+ACC0+P4T8f
 xvnpvpsCQgwoqmpHzakYQawgkHu04DwjMTLv18kunkO8crGH6WtokcWHQo9s4uyNBC/h
 r8OTQZ7cAEa8Zx2Nf+BmVlaRo4G8q5JQxcFjc8+G44dRdDBZVqknDyoQmo/gmCpjQ1SU
 80Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680669727;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7RKS3qRVR9X13uJjgu1WIOkfNbB4dVTNOOGn0jwRjFM=;
 b=TGXl0wZtpPKmdIHg09VTyk1JSz+Xmj4pVQtWUQQHyz++EYDR+lfFnKdinfyQJFKXwE
 +2unzqSyl5Wtk1NMnRaY2LzJbg0OMws/AQ07hoVDrX81RPiZuQDp2Xt0qlgJ5tjg0bed
 4w1U+CyPTwwazl2yuQZq0afXLg2UoHVGywUSEom8ikbY7MCgJ8v2zqqQv+4JGtBnXFNH
 tGTtpbXmGONe6JK1frqHIBYOJw7shRVT1tq9m0V0KB3uFAg73/dMDTY7AOjogIvISt7H
 HGHbgvH6hwbUKpRBKcENUVf8AH1bvmH1jc64TPv4kMRFwhMrGcWdF2V4u6FjuspB0nsg
 Tw0A==
X-Gm-Message-State: AAQBX9ehjrX7XDrwByXyr3OYYDn7k5i0fNyItDL1YEBmwNkDjbgC+xCG
 Wa4x6tOMX7wgm3iURfot6aUXB92e2MR710XJZbI=
X-Google-Smtp-Source: AKy350Zyo6SzXqjBJuGo0vHXD4CZEZfN2xTBhiV7MzBhTfHM1x5xELcbx2cGDJ7sgI7guCNdbEqB1CknHjVRW3Cc3Qo=
X-Received: by 2002:a9f:3110:0:b0:68a:a9d:13f5 with SMTP id
 m16-20020a9f3110000000b0068a0a9d13f5mr3461930uab.1.1680669727567; Tue, 04 Apr
 2023 21:42:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230404020653.18911-1-liweiwei@iscas.ac.cn>
 <20230404020653.18911-4-liweiwei@iscas.ac.cn>
In-Reply-To: <20230404020653.18911-4-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 14:41:40 +1000
Message-ID: <CAKmqyKNDXEQg8f+Vnz78rdpHBe=w-FNcX=U9kg7X-7v7MSTFXQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] target/riscv: Fix target address to update badaddr
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92b.google.com
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
X-List-Received-Date: Wed, 05 Apr 2023 04:42:11 -0000

On Tue, Apr 4, 2023 at 12:08=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> Compute the target address before storing it into badaddr
> when mis-aligned exception is triggered.
> Use a target_pc temp to store the target address to avoid
> the confusing operation that udpate target address into
> cpu_pc before misalign check, then update it into badaddr
> and restore cpu_pc to current pc if exception is triggered.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvi.c.inc | 23 ++++++++++++++++-------
>  target/riscv/translate.c                | 21 ++++++++++-----------
>  2 files changed, 26 insertions(+), 18 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
> index 4ad54e8a49..cc72864d32 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -51,25 +51,30 @@ static bool trans_jal(DisasContext *ctx, arg_jal *a)
>  static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
>  {
>      TCGLabel *misaligned =3D NULL;
> +    TCGv target_pc =3D tcg_temp_new();
>
> -    tcg_gen_addi_tl(cpu_pc, get_gpr(ctx, a->rs1, EXT_NONE), a->imm);
> -    tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
> +    tcg_gen_addi_tl(target_pc, get_gpr(ctx, a->rs1, EXT_NONE), a->imm);
> +    tcg_gen_andi_tl(target_pc, target_pc, (target_ulong)-2);
> +
> +    if (get_xl(ctx) =3D=3D MXL_RV32) {
> +        tcg_gen_ext32s_tl(target_pc, target_pc);
> +    }
>
> -    gen_set_pc(ctx, cpu_pc);
>      if (!has_ext(ctx, RVC)) {
>          TCGv t0 =3D tcg_temp_new();
>
>          misaligned =3D gen_new_label();
> -        tcg_gen_andi_tl(t0, cpu_pc, 0x2);
> +        tcg_gen_andi_tl(t0, target_pc, 0x2);
>          tcg_gen_brcondi_tl(TCG_COND_NE, t0, 0x0, misaligned);
>      }
>
>      gen_set_gpri(ctx, a->rd, ctx->pc_succ_insn);
> +    tcg_gen_mov_tl(cpu_pc, target_pc);
>      lookup_and_goto_ptr(ctx);
>
>      if (misaligned) {
>          gen_set_label(misaligned);
> -        gen_exception_inst_addr_mis(ctx);
> +        gen_exception_inst_addr_mis(ctx, target_pc);
>      }
>      ctx->base.is_jmp =3D DISAS_NORETURN;
>
> @@ -153,6 +158,7 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, T=
CGCond cond)
>      TCGLabel *l =3D gen_new_label();
>      TCGv src1 =3D get_gpr(ctx, a->rs1, EXT_SIGN);
>      TCGv src2 =3D get_gpr(ctx, a->rs2, EXT_SIGN);
> +    target_ulong next_pc;
>
>      if (get_xl(ctx) =3D=3D MXL_RV128) {
>          TCGv src1h =3D get_gprh(ctx, a->rs1);
> @@ -169,9 +175,12 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, =
TCGCond cond)
>
>      gen_set_label(l); /* branch taken */
>
> -    if (!has_ext(ctx, RVC) && ((ctx->base.pc_next + a->imm) & 0x3)) {
> +    next_pc =3D ctx->base.pc_next + a->imm;
> +    if (!has_ext(ctx, RVC) && (next_pc & 0x3)) {
>          /* misaligned */
> -        gen_exception_inst_addr_mis(ctx);
> +        TCGv target_pc =3D tcg_temp_new();
> +        gen_pc_plus_diff(target_pc, ctx, next_pc);
> +        gen_exception_inst_addr_mis(ctx, target_pc);
>      } else {
>          gen_goto_tb(ctx, 0, ctx->base.pc_next + a->imm);
>      }
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 0ee8ee147d..d434fedb37 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -222,21 +222,18 @@ static void decode_save_opc(DisasContext *ctx)
>      ctx->insn_start =3D NULL;
>  }
>
> -static void gen_set_pc_imm(DisasContext *ctx, target_ulong dest)
> +static void gen_pc_plus_diff(TCGv target, DisasContext *ctx,
> +                              target_ulong dest)
>  {
>      if (get_xl(ctx) =3D=3D MXL_RV32) {
>          dest =3D (int32_t)dest;
>      }
> -    tcg_gen_movi_tl(cpu_pc, dest);
> +    tcg_gen_movi_tl(target, dest);
>  }
>
> -static void gen_set_pc(DisasContext *ctx, TCGv dest)
> +static void gen_set_pc_imm(DisasContext *ctx, target_ulong dest)
>  {
> -    if (get_xl(ctx) =3D=3D MXL_RV32) {
> -        tcg_gen_ext32s_tl(cpu_pc, dest);
> -    } else {
> -        tcg_gen_mov_tl(cpu_pc, dest);
> -    }
> +    gen_pc_plus_diff(cpu_pc, ctx, dest);
>  }
>
>  static void generate_exception(DisasContext *ctx, int excp)
> @@ -257,9 +254,9 @@ static void gen_exception_illegal(DisasContext *ctx)
>      }
>  }
>
> -static void gen_exception_inst_addr_mis(DisasContext *ctx)
> +static void gen_exception_inst_addr_mis(DisasContext *ctx, TCGv target)
>  {
> -    tcg_gen_st_tl(cpu_pc, cpu_env, offsetof(CPURISCVState, badaddr));
> +    tcg_gen_st_tl(target, cpu_env, offsetof(CPURISCVState, badaddr));
>      generate_exception(ctx, RISCV_EXCP_INST_ADDR_MIS);
>  }
>
> @@ -551,7 +548,9 @@ static void gen_jal(DisasContext *ctx, int rd, target=
_ulong imm)
>      next_pc =3D ctx->base.pc_next + imm;
>      if (!has_ext(ctx, RVC)) {
>          if ((next_pc & 0x3) !=3D 0) {
> -            gen_exception_inst_addr_mis(ctx);
> +            TCGv target_pc =3D tcg_temp_new();
> +            gen_pc_plus_diff(target_pc, ctx, next_pc);
> +            gen_exception_inst_addr_mis(ctx, target_pc);
>              return;
>          }
>      }
> --
> 2.25.1
>
>

