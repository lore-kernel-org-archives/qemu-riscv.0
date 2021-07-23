Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m6nL9-00085k-64
	for mharc-qemu-riscv@gnu.org; Fri, 23 Jul 2021 01:03:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m6nL7-00084D-1D; Fri, 23 Jul 2021 01:03:13 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:36695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m6nL1-00051a-VW; Fri, 23 Jul 2021 01:03:11 -0400
Received: by mail-io1-xd30.google.com with SMTP id f11so1158178ioj.3;
 Thu, 22 Jul 2021 22:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UiJ2Cs923dLjiLorNvsRYNQaf9q2rzVrU0UIw/eddXo=;
 b=JY5NVJ9K4wD34w8XNYLh3Mm0jn4z1fcBurPGaPs9m+MvWWb4GZ91qroKM/OisMZE+8
 pRBs/88gWGxAS+GfgXXSX1Z7tW8Q8V38+YPH62gKebNkQK5mdQLfA2Igov1Tw/XYTIPw
 0byDnMOV13zL3U5O+QoNJGl1/aYHCpGayQSOinDWsJnYmd26HSSOHt4mqt076mQdxdst
 gKl5kSSEeiITh/XjsPtz3NucWAt3/TJwpcdmi2nO+B9+D8159nHwOAw5TJvoY8Izmr6K
 ZpMCPSVtW7dwyHFOpuBeeH/KUliJWGb6LYshWBJKq79wK62hRO9Tf9ai0S5jQcFyZLI1
 4A/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UiJ2Cs923dLjiLorNvsRYNQaf9q2rzVrU0UIw/eddXo=;
 b=m6rwb/B8+8VyIb+n85br5twp6HRYINcoTnwh2ujNBZKEMchbCi5ZhNWuT5HOSJUEDA
 PjRXIKtW6UeeoyoIrUc+dwdqc85FOTJ1wsrq5xcZa5VXEM3m6zo7ProqEQ7ojv2/o+jW
 3X61iGiUUQYOw9Kc0XaJea4ZUy6T2kx/xjnQOcliYg21FiW8SxF2/37cTA74yhna9xxq
 D+WzOew/fFOaAfwSFHG7INstH7iji9I8m/kHDM8y52HPLjfYJjO2+dReHmid9SnjGA96
 MGkGzEmNwWQm3//59q7aVLchb02oeaKAQS4+ZbCHXIRoBC6z/I3nIIt3qzI55QUjv/We
 OmLA==
X-Gm-Message-State: AOAM530Fj9LMnUV5DtdIcKiZp5ERMco01KcZCX9mHAOOyaWJFjTaEwVF
 oB7cdif3nPiyqSL3IfQ9yk0By3dcarV2vltlePI=
X-Google-Smtp-Source: ABdhPJxIA8qjdI8ZGCDS3P/LJ/t+gLtpHMlaqhGjMtbIdtGNpNCR0Iupw2iK2mvaqLbr6c2rI33pCYQflRTHN49IOBk=
X-Received: by 2002:a02:90d0:: with SMTP id c16mr2612136jag.106.1627016585346; 
 Thu, 22 Jul 2021 22:03:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210709042608.883256-1-richard.henderson@linaro.org>
 <20210709042608.883256-15-richard.henderson@linaro.org>
In-Reply-To: <20210709042608.883256-15-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 23 Jul 2021 15:02:39 +1000
Message-ID: <CAKmqyKNDz2P6Am10E097e6vvhahbSZU_x3hvtiOKJ6db=LiQjQ@mail.gmail.com>
Subject: Re: [PATCH 14/17] target/riscv: Tidy trans_rvh.c.inc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
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
X-List-Received-Date: Fri, 23 Jul 2021 05:03:13 -0000

On Fri, Jul 9, 2021 at 2:52 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Exit early if check_access fails.
> Split out do_hlv, do_hsv, do_hlvx subroutines.
> Use gpr_src, gpr_dst in the new subroutines.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn32.decode              |   1 +
>  target/riscv/insn_trans/trans_rvh.c.inc | 264 +++++-------------------
>  2 files changed, 55 insertions(+), 210 deletions(-)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index f09f8d5faf..2cd921d51c 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -42,6 +42,7 @@
>  &j    imm rd
>  &r    rd rs1 rs2
>  &r2   rd rs1
> +&r2_s rs1 rs2
>  &s    imm rs1 rs2
>  &u    imm rd
>  &shift     shamt rs1 rd
> diff --git a/target/riscv/insn_trans/trans_rvh.c.inc b/target/riscv/insn_trans/trans_rvh.c.inc
> index 6b5edf82b7..dac732024b 100644
> --- a/target/riscv/insn_trans/trans_rvh.c.inc
> +++ b/target/riscv/insn_trans/trans_rvh.c.inc
> @@ -17,281 +17,137 @@
>   */
>
>  #ifndef CONFIG_USER_ONLY
> -static void check_access(DisasContext *ctx) {
> +static bool check_access(DisasContext *ctx)
> +{
>      if (!ctx->hlsx) {
>          if (ctx->virt_enabled) {
>              generate_exception(ctx, RISCV_EXCP_VIRT_INSTRUCTION_FAULT);
>          } else {
>              generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
>          }
> +        return false;
>      }
> +    return true;
>  }
>  #endif
>
> +static bool do_hlv(DisasContext *ctx, arg_r2 *a, MemOp mop)
> +{
> +#ifdef CONFIG_USER_ONLY
> +    return false;
> +#else
> +    if (check_access(ctx)) {
> +        TCGv dest = gpr_dst(ctx, a->rd);
> +        TCGv addr = gpr_src(ctx, a->rs1);
> +        int mem_idx = ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
> +        tcg_gen_qemu_ld_tl(dest, addr, mem_idx, mop);
> +    }
> +    return true;
> +#endif
> +}
> +
>  static bool trans_hlv_b(DisasContext *ctx, arg_hlv_b *a)
>  {
>      REQUIRE_EXT(ctx, RVH);
> -#ifndef CONFIG_USER_ONLY
> -    TCGv t0 = tcg_temp_new();
> -    TCGv t1 = tcg_temp_new();
> -
> -    check_access(ctx);
> -
> -    gen_get_gpr(t0, a->rs1);
> -
> -    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_SB);
> -    gen_set_gpr(a->rd, t1);
> -
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
> -    return true;
> -#else
> -    return false;
> -#endif
> +    return do_hlv(ctx, a, MO_SB);
>  }
>
>  static bool trans_hlv_h(DisasContext *ctx, arg_hlv_h *a)
>  {
>      REQUIRE_EXT(ctx, RVH);
> -#ifndef CONFIG_USER_ONLY
> -    TCGv t0 = tcg_temp_new();
> -    TCGv t1 = tcg_temp_new();
> -
> -    check_access(ctx);
> -
> -    gen_get_gpr(t0, a->rs1);
> -
> -    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TESW);
> -    gen_set_gpr(a->rd, t1);
> -
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
> -    return true;
> -#else
> -    return false;
> -#endif
> +    return do_hlv(ctx, a, MO_TESW);
>  }
>
>  static bool trans_hlv_w(DisasContext *ctx, arg_hlv_w *a)
>  {
>      REQUIRE_EXT(ctx, RVH);
> -#ifndef CONFIG_USER_ONLY
> -    TCGv t0 = tcg_temp_new();
> -    TCGv t1 = tcg_temp_new();
> -
> -    check_access(ctx);
> -
> -    gen_get_gpr(t0, a->rs1);
> -
> -    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TESL);
> -    gen_set_gpr(a->rd, t1);
> -
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
> -    return true;
> -#else
> -    return false;
> -#endif
> +    return do_hlv(ctx, a, MO_TESL);
>  }
>
>  static bool trans_hlv_bu(DisasContext *ctx, arg_hlv_bu *a)
>  {
>      REQUIRE_EXT(ctx, RVH);
> -#ifndef CONFIG_USER_ONLY
> -    TCGv t0 = tcg_temp_new();
> -    TCGv t1 = tcg_temp_new();
> -
> -    check_access(ctx);
> -
> -    gen_get_gpr(t0, a->rs1);
> -
> -    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_UB);
> -    gen_set_gpr(a->rd, t1);
> -
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
> -    return true;
> -#else
> -    return false;
> -#endif
> +    return do_hlv(ctx, a, MO_UB);
>  }
>
>  static bool trans_hlv_hu(DisasContext *ctx, arg_hlv_hu *a)
>  {
>      REQUIRE_EXT(ctx, RVH);
> -#ifndef CONFIG_USER_ONLY
> -    TCGv t0 = tcg_temp_new();
> -    TCGv t1 = tcg_temp_new();
> +    return do_hlv(ctx, a, MO_TEUW);
> +}
>
> -    check_access(ctx);
> -
> -    gen_get_gpr(t0, a->rs1);
> -    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TEUW);
> -    gen_set_gpr(a->rd, t1);
> -
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
> -    return true;
> -#else
> +static bool do_hsv(DisasContext *ctx, arg_r2_s *a, MemOp mop)
> +{
> +#ifdef CONFIG_USER_ONLY
>      return false;
> +#else
> +    if (check_access(ctx)) {
> +        TCGv addr = gpr_src(ctx, a->rs1);
> +        TCGv data = gpr_src(ctx, a->rs2);
> +        int mem_idx = ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
> +        tcg_gen_qemu_ld_tl(data, addr, mem_idx, mop);
> +    }
> +    return true;
>  #endif
>  }
>
>  static bool trans_hsv_b(DisasContext *ctx, arg_hsv_b *a)
>  {
>      REQUIRE_EXT(ctx, RVH);
> -#ifndef CONFIG_USER_ONLY
> -    TCGv t0 = tcg_temp_new();
> -    TCGv dat = tcg_temp_new();
> -
> -    check_access(ctx);
> -
> -    gen_get_gpr(t0, a->rs1);
> -    gen_get_gpr(dat, a->rs2);
> -
> -    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_SB);
> -
> -    tcg_temp_free(t0);
> -    tcg_temp_free(dat);
> -    return true;
> -#else
> -    return false;
> -#endif
> +    return do_hsv(ctx, a, MO_SB);
>  }
>
>  static bool trans_hsv_h(DisasContext *ctx, arg_hsv_h *a)
>  {
>      REQUIRE_EXT(ctx, RVH);
> -#ifndef CONFIG_USER_ONLY
> -    TCGv t0 = tcg_temp_new();
> -    TCGv dat = tcg_temp_new();
> -
> -    check_access(ctx);
> -
> -    gen_get_gpr(t0, a->rs1);
> -    gen_get_gpr(dat, a->rs2);
> -
> -    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TESW);
> -
> -    tcg_temp_free(t0);
> -    tcg_temp_free(dat);
> -    return true;
> -#else
> -    return false;
> -#endif
> +    return do_hsv(ctx, a, MO_TESW);
>  }
>
>  static bool trans_hsv_w(DisasContext *ctx, arg_hsv_w *a)
>  {
>      REQUIRE_EXT(ctx, RVH);
> -#ifndef CONFIG_USER_ONLY
> -    TCGv t0 = tcg_temp_new();
> -    TCGv dat = tcg_temp_new();
> -
> -    check_access(ctx);
> -
> -    gen_get_gpr(t0, a->rs1);
> -    gen_get_gpr(dat, a->rs2);
> -
> -    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TESL);
> -
> -    tcg_temp_free(t0);
> -    tcg_temp_free(dat);
> -    return true;
> -#else
> -    return false;
> -#endif
> +    return do_hsv(ctx, a, MO_TESL);
>  }
>
>  static bool trans_hlv_wu(DisasContext *ctx, arg_hlv_wu *a)
>  {
>      REQUIRE_64BIT(ctx);
>      REQUIRE_EXT(ctx, RVH);
> -
> -#ifndef CONFIG_USER_ONLY
> -    TCGv t0 = tcg_temp_new();
> -    TCGv t1 = tcg_temp_new();
> -
> -    check_access(ctx);
> -
> -    gen_get_gpr(t0, a->rs1);
> -
> -    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TEUL);
> -    gen_set_gpr(a->rd, t1);
> -
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
> -    return true;
> -#else
> -    return false;
> -#endif
> +    return do_hlv(ctx, a, MO_TEUL);
>  }
>
>  static bool trans_hlv_d(DisasContext *ctx, arg_hlv_d *a)
>  {
>      REQUIRE_64BIT(ctx);
>      REQUIRE_EXT(ctx, RVH);
> -
> -#ifndef CONFIG_USER_ONLY
> -    TCGv t0 = tcg_temp_new();
> -    TCGv t1 = tcg_temp_new();
> -
> -    check_access(ctx);
> -
> -    gen_get_gpr(t0, a->rs1);
> -
> -    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TEQ);
> -    gen_set_gpr(a->rd, t1);
> -
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
> -    return true;
> -#else
> -    return false;
> -#endif
> +    return do_hlv(ctx, a, MO_TEQ);
>  }
>
>  static bool trans_hsv_d(DisasContext *ctx, arg_hsv_d *a)
>  {
>      REQUIRE_64BIT(ctx);
>      REQUIRE_EXT(ctx, RVH);
> +    return do_hsv(ctx, a, MO_TEQ);
> +}
>
>  #ifndef CONFIG_USER_ONLY
> -    TCGv t0 = tcg_temp_new();
> -    TCGv dat = tcg_temp_new();
> -
> -    check_access(ctx);
> -
> -    gen_get_gpr(t0, a->rs1);
> -    gen_get_gpr(dat, a->rs2);
> -
> -    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TEQ);
> -
> -    tcg_temp_free(t0);
> -    tcg_temp_free(dat);
> +static bool do_hlvx(DisasContext *ctx, arg_r2 *a,
> +                    void (*func)(TCGv, TCGv_env, TCGv))
> +{
> +    if (check_access(ctx)) {
> +        TCGv dest = gpr_dst(ctx, a->rd);
> +        TCGv addr = gpr_src(ctx, a->rs1);
> +        func(dest, cpu_env, addr);
> +    }
>      return true;
> -#else
> -    return false;
> -#endif
>  }
> +#endif
>
>  static bool trans_hlvx_hu(DisasContext *ctx, arg_hlvx_hu *a)
>  {
>      REQUIRE_EXT(ctx, RVH);
>  #ifndef CONFIG_USER_ONLY
> -    TCGv t0 = tcg_temp_new();
> -    TCGv t1 = tcg_temp_new();
> -
> -    check_access(ctx);
> -
> -    gen_get_gpr(t0, a->rs1);
> -
> -    gen_helper_hyp_hlvx_hu(t1, cpu_env, t0);
> -    gen_set_gpr(a->rd, t1);
> -
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
> -    return true;
> +    return do_hlvx(ctx, a, gen_helper_hyp_hlvx_hu);
>  #else
>      return false;
>  #endif
> @@ -301,19 +157,7 @@ static bool trans_hlvx_wu(DisasContext *ctx, arg_hlvx_wu *a)
>  {
>      REQUIRE_EXT(ctx, RVH);
>  #ifndef CONFIG_USER_ONLY
> -    TCGv t0 = tcg_temp_new();
> -    TCGv t1 = tcg_temp_new();
> -
> -    check_access(ctx);
> -
> -    gen_get_gpr(t0, a->rs1);
> -
> -    gen_helper_hyp_hlvx_wu(t1, cpu_env, t0);
> -    gen_set_gpr(a->rd, t1);
> -
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
> -    return true;
> +    return do_hlvx(ctx, a, gen_helper_hyp_hlvx_wu);
>  #else
>      return false;
>  #endif
> --
> 2.25.1
>
>

