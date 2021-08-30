Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKZK0-0004Vt-4n
	for mharc-qemu-riscv@gnu.org; Mon, 30 Aug 2021 00:55:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKZJy-0004Vg-Tn; Mon, 30 Aug 2021 00:54:58 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:41970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKZJw-0007b3-Eg; Mon, 30 Aug 2021 00:54:58 -0400
Received: by mail-io1-xd33.google.com with SMTP id j18so18203943ioj.8;
 Sun, 29 Aug 2021 21:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cZWRea4DY6SKcyUaYtJH9XDqp0mSbe8e+F+lEim52kE=;
 b=j7c1jvsn0SboTE85okCIztwKXn476gTLH/vAaKo+jedutPK2hPvaYMUcT3zZ/+dGpD
 tZZ3NNMgKmDFlLPs6wtkW9xa6dG60qpT0CcvuUaGJM5TlS3ye13R/I87FbQ5srGZOl73
 NmLtsrkOsilstwXXpJ5qMpXj3qSvFEA7h49WlafDFyE0pI6i4upbpHF7ji87EvOHu+qE
 WdmRrwVjhjFaH+Yb7L95ZQ0nFZ+oALRs2DjHNZRb8i3uamVAjkURRbOzB0tkH8P1rA6o
 2F8/brcpYk7YIlBOIfBgXd1eNOQDwLHVmnnfZErmTrTNrxJ/81VIdEuLJ+rwH4AWjeP4
 18VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cZWRea4DY6SKcyUaYtJH9XDqp0mSbe8e+F+lEim52kE=;
 b=Gcj/c05BpRStogyW+0EuckA2sUXBzPhNCO+aLeLFuIr6OnwonODW3v9vA+5/+it6+2
 mAnD4NksK7FauO8XorqLBdWXsflnLU9kg5IT+Z1ny465AJYFhU70oIE9XybAZbQF3VSP
 tF93BBRAvp8LNV8QxEwmgrbWAUMdQYhuL/txQ2ZIir8ytnVfm5YliT485e3Yh55DQ5zt
 J7LJJTGgpi0SGMV0WjYJ81PjZsKsTe3S1YQt6Ixt8RYUcXysrUT9vp57zz0Rsk9i+R3E
 1SNRCETPFdkvYsW+XNdoY1GilYjua3cWH3HuVOfy2bAWbhxKk+IHLsWvfkKikwXKFNeR
 p/QQ==
X-Gm-Message-State: AOAM533Wv0JmvQ2UexowGuPGMTaqr8X/aW97OhMYuOgiWGs3JckVj2vm
 VUK5EtTT7YquCbGhHcDD9OS4rcu6/3Ddlz2hJaQ=
X-Google-Smtp-Source: ABdhPJw4VyhiQ9xwy4JtU53LOH7gbUWL1YfeizjHHGjN59b5XEf0/hrE8+4Htk/4kCMOag8LYLpqiyzBrA77LXc3VA8=
X-Received: by 2002:a02:90d0:: with SMTP id c16mr18617435jag.106.1630299294998; 
 Sun, 29 Aug 2021 21:54:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210823195529.560295-1-richard.henderson@linaro.org>
 <20210823195529.560295-24-richard.henderson@linaro.org>
In-Reply-To: <20210823195529.560295-24-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Aug 2021 14:54:28 +1000
Message-ID: <CAKmqyKNzk7u9Jif1iHe80db=3xjY6CeO+FK72410ogD3+J6q1g@mail.gmail.com>
Subject: Re: [PATCH v5 23/24] target/riscv: Tidy trans_rvh.c.inc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Mon, 30 Aug 2021 04:54:59 -0000

On Tue, Aug 24, 2021 at 6:07 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Exit early if check_access fails.
> Split out do_hlv, do_hsv, do_hlvx subroutines.
> Use dest_gpr, get_gpr in the new subroutines.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn32.decode              |   1 +
>  target/riscv/insn_trans/trans_rvh.c.inc | 266 +++++-------------------
>  2 files changed, 57 insertions(+), 210 deletions(-)
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
> diff --git a/target/riscv/insn_trans/trans_rvh.c.inc b/target/riscv/insn_=
trans/trans_rvh.c.inc
> index 585eb1d87e..ecbf77ff9c 100644
> --- a/target/riscv/insn_trans/trans_rvh.c.inc
> +++ b/target/riscv/insn_trans/trans_rvh.c.inc
> @@ -17,281 +17,139 @@
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
> +        TCGv dest =3D dest_gpr(ctx, a->rd);
> +        TCGv addr =3D get_gpr(ctx, a->rs1, EXT_NONE);
> +        int mem_idx =3D ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
> +        tcg_gen_qemu_ld_tl(dest, addr, mem_idx, mop);
> +        gen_set_gpr(ctx, a->rd, dest);
> +    }
> +    return true;
> +#endif
> +}
> +
>  static bool trans_hlv_b(DisasContext *ctx, arg_hlv_b *a)
>  {
>      REQUIRE_EXT(ctx, RVH);
> -#ifndef CONFIG_USER_ONLY
> -    TCGv t0 =3D tcg_temp_new();
> -    TCGv t1 =3D tcg_temp_new();
> -
> -    check_access(ctx);
> -
> -    gen_get_gpr(ctx, t0, a->rs1);
> -
> -    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_M=
ASK, MO_SB);
> -    gen_set_gpr(ctx, a->rd, t1);
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
> -    TCGv t0 =3D tcg_temp_new();
> -    TCGv t1 =3D tcg_temp_new();
> -
> -    check_access(ctx);
> -
> -    gen_get_gpr(ctx, t0, a->rs1);
> -
> -    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_M=
ASK, MO_TESW);
> -    gen_set_gpr(ctx, a->rd, t1);
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
> -    TCGv t0 =3D tcg_temp_new();
> -    TCGv t1 =3D tcg_temp_new();
> -
> -    check_access(ctx);
> -
> -    gen_get_gpr(ctx, t0, a->rs1);
> -
> -    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_M=
ASK, MO_TESL);
> -    gen_set_gpr(ctx, a->rd, t1);
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
> -    TCGv t0 =3D tcg_temp_new();
> -    TCGv t1 =3D tcg_temp_new();
> -
> -    check_access(ctx);
> -
> -    gen_get_gpr(ctx, t0, a->rs1);
> -
> -    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_M=
ASK, MO_UB);
> -    gen_set_gpr(ctx, a->rd, t1);
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
> -    TCGv t0 =3D tcg_temp_new();
> -    TCGv t1 =3D tcg_temp_new();
> +    return do_hlv(ctx, a, MO_TEUW);
> +}
>
> -    check_access(ctx);
> -
> -    gen_get_gpr(ctx, t0, a->rs1);
> -    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_M=
ASK, MO_TEUW);
> -    gen_set_gpr(ctx, a->rd, t1);
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
> +        TCGv addr =3D get_gpr(ctx, a->rs1, EXT_NONE);
> +        TCGv data =3D get_gpr(ctx, a->rs2, EXT_NONE);
> +        int mem_idx =3D ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
> +        tcg_gen_qemu_st_tl(data, addr, mem_idx, mop);
> +    }
> +    return true;
>  #endif
>  }
>
>  static bool trans_hsv_b(DisasContext *ctx, arg_hsv_b *a)
>  {
>      REQUIRE_EXT(ctx, RVH);
> -#ifndef CONFIG_USER_ONLY
> -    TCGv t0 =3D tcg_temp_new();
> -    TCGv dat =3D tcg_temp_new();
> -
> -    check_access(ctx);
> -
> -    gen_get_gpr(ctx, t0, a->rs1);
> -    gen_get_gpr(ctx, dat, a->rs2);
> -
> -    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_=
MASK, MO_SB);
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
> -    TCGv t0 =3D tcg_temp_new();
> -    TCGv dat =3D tcg_temp_new();
> -
> -    check_access(ctx);
> -
> -    gen_get_gpr(ctx, t0, a->rs1);
> -    gen_get_gpr(ctx, dat, a->rs2);
> -
> -    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_=
MASK, MO_TESW);
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
> -    TCGv t0 =3D tcg_temp_new();
> -    TCGv dat =3D tcg_temp_new();
> -
> -    check_access(ctx);
> -
> -    gen_get_gpr(ctx, t0, a->rs1);
> -    gen_get_gpr(ctx, dat, a->rs2);
> -
> -    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_=
MASK, MO_TESL);
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
> -    TCGv t0 =3D tcg_temp_new();
> -    TCGv t1 =3D tcg_temp_new();
> -
> -    check_access(ctx);
> -
> -    gen_get_gpr(ctx, t0, a->rs1);
> -
> -    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_M=
ASK, MO_TEUL);
> -    gen_set_gpr(ctx, a->rd, t1);
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
> -    TCGv t0 =3D tcg_temp_new();
> -    TCGv t1 =3D tcg_temp_new();
> -
> -    check_access(ctx);
> -
> -    gen_get_gpr(ctx, t0, a->rs1);
> -
> -    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_M=
ASK, MO_TEQ);
> -    gen_set_gpr(ctx, a->rd, t1);
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
> -    TCGv t0 =3D tcg_temp_new();
> -    TCGv dat =3D tcg_temp_new();
> -
> -    check_access(ctx);
> -
> -    gen_get_gpr(ctx, t0, a->rs1);
> -    gen_get_gpr(ctx, dat, a->rs2);
> -
> -    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_=
MASK, MO_TEQ);
> -
> -    tcg_temp_free(t0);
> -    tcg_temp_free(dat);
> +static bool do_hlvx(DisasContext *ctx, arg_r2 *a,
> +                    void (*func)(TCGv, TCGv_env, TCGv))
> +{
> +    if (check_access(ctx)) {
> +        TCGv dest =3D dest_gpr(ctx, a->rd);
> +        TCGv addr =3D get_gpr(ctx, a->rs1, EXT_NONE);
> +        func(dest, cpu_env, addr);
> +        gen_set_gpr(ctx, a->rd, dest);
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
> -    TCGv t0 =3D tcg_temp_new();
> -    TCGv t1 =3D tcg_temp_new();
> -
> -    check_access(ctx);
> -
> -    gen_get_gpr(ctx, t0, a->rs1);
> -
> -    gen_helper_hyp_hlvx_hu(t1, cpu_env, t0);
> -    gen_set_gpr(ctx, a->rd, t1);
> -
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
> -    return true;
> +    return do_hlvx(ctx, a, gen_helper_hyp_hlvx_hu);
>  #else
>      return false;
>  #endif
> @@ -301,19 +159,7 @@ static bool trans_hlvx_wu(DisasContext *ctx, arg_hlv=
x_wu *a)
>  {
>      REQUIRE_EXT(ctx, RVH);
>  #ifndef CONFIG_USER_ONLY
> -    TCGv t0 =3D tcg_temp_new();
> -    TCGv t1 =3D tcg_temp_new();
> -
> -    check_access(ctx);
> -
> -    gen_get_gpr(ctx, t0, a->rs1);
> -
> -    gen_helper_hyp_hlvx_wu(t1, cpu_env, t0);
> -    gen_set_gpr(ctx, a->rd, t1);
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

