Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mI3Ff-00024G-Uy
	for mharc-qemu-riscv@gnu.org; Mon, 23 Aug 2021 02:16:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mI3Fd-00023E-Sb; Mon, 23 Aug 2021 02:16:05 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:47051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mI3FZ-0004n3-Gb; Mon, 23 Aug 2021 02:16:05 -0400
Received: by mail-io1-xd30.google.com with SMTP id b200so20395026iof.13;
 Sun, 22 Aug 2021 23:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FGD3JQAahgt5CgzXMcbxTm8tWfmXE1YBSh39pUPMlAM=;
 b=X7orxtv+MxMiTt/s2+LildcGit+wpJqHmINXVczxe2cha1nCCppWjGUEbYURiSHiMW
 +SsWlk9eC4Ipzk5hvFzG+Zi5EN4aRPs+6f7fF2gutPf35Shvv7PkybjwzL0+SpiUIxWg
 LjzmoQ8xgfdevBP7JR9Izjnci2G+9WWSYtVMGtrXVNfkNLUZV+BpmNRge1j9j8hLs6Vn
 GQjNw2QGkTSrD4+gkfik/a3Wz7db6do2ICCt7zUsrWvK3h+eRLQSyfQ1KnmeY8Yunrfe
 mJGZJpDegQES4Szb/ypUkXbTpJUN21LUhK2R7RUaWUIvFevu3AffYhWI6o2jKvixciSj
 6OZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FGD3JQAahgt5CgzXMcbxTm8tWfmXE1YBSh39pUPMlAM=;
 b=sG0IcpPjtSXHN+II33W197rN6Mj6vPwbAimmaGKLx8BhrscIUBYOfVfX2iV/9bjkNy
 sYp3s36/gcm7CmGXGs6Zbw4+wK87lfQM1UI2ckOilQFlq9hp9otx8en7DnFtX1LE3r2M
 JMO9AYjx3jVZUo4EqxNkA0a6MsMgdpJMkDe+u+DKODO2Ocn88OPJr1jpbhFJdwEwaotw
 E1nOoeUY1IMRibCShYZOpqdCpt9p8Fc6rPe+fwFOq8vF3m1adzg+JkT1epyGOr5NA04k
 c3aMpWLRdvfRDHf4M6+9X1XSjpGjbUk9Svu0cllt6/sOfEzaWvL530G/McI7/oZWCgI0
 HZIA==
X-Gm-Message-State: AOAM532zdGDyLixrJCGbn9KPWtBI36Hu1+mW/kXq/yg/T2C81mJ6bVuG
 75f+AonXuRMg22ACoWF8HacAoWu+M519d9F/D7I=
X-Google-Smtp-Source: ABdhPJwbGBIJKU/AEX+8fQdwW4WB7hBuYn43xEW207F6rH414BzABL2zTG28LZZXWnAXr9Dr43cLEZdKQj9MZcms24M=
X-Received: by 2002:a5d:850f:: with SMTP id q15mr25595469ion.118.1629699359697; 
 Sun, 22 Aug 2021 23:15:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210820174257.548286-1-richard.henderson@linaro.org>
 <20210820174257.548286-12-richard.henderson@linaro.org>
In-Reply-To: <20210820174257.548286-12-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Aug 2021 16:15:33 +1000
Message-ID: <CAKmqyKMO7Z5TpQhHukFPA-GabuVTAMbsfWw5-RYmes5Mf-+GBg@mail.gmail.com>
Subject: Re: [PATCH v4 11/21] target/riscv: Add DisasExtend to gen_unary
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>
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
X-List-Received-Date: Mon, 23 Aug 2021 06:16:06 -0000

On Sat, Aug 21, 2021 at 3:50 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use ctx->w for ctpopw, which is the only one that can
> re-use the generic algorithm for the narrow operation.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c                | 14 ++++++--------
>  target/riscv/insn_trans/trans_rvb.c.inc | 24 +++++++++---------------
>  2 files changed, 15 insertions(+), 23 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 09853530c4..785e9e58cc 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -478,17 +478,15 @@ static bool gen_shiftiw(DisasContext *ctx, arg_shift *a,
>      return true;
>  }
>
> -static bool gen_unary(DisasContext *ctx, arg_r2 *a,
> -                      void(*func)(TCGv, TCGv))
> +static bool gen_unary(DisasContext *ctx, arg_r2 *a, DisasExtend ext,
> +                      void (*func)(TCGv, TCGv))
>  {
> -    TCGv source = tcg_temp_new();
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, ext);
>
> -    gen_get_gpr(ctx, source, a->rs1);
> +    func(dest, src1);
>
> -    (*func)(source, source);
> -
> -    gen_set_gpr(ctx, a->rd, source);
> -    tcg_temp_free(source);
> +    gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
>
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index 73f088be23..e255678fff 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -26,7 +26,7 @@ static void gen_clz(TCGv ret, TCGv arg1)
>  static bool trans_clz(DisasContext *ctx, arg_clz *a)
>  {
>      REQUIRE_EXT(ctx, RVB);
> -    return gen_unary(ctx, a, gen_clz);
> +    return gen_unary(ctx, a, EXT_ZERO, gen_clz);
>  }
>
>  static void gen_ctz(TCGv ret, TCGv arg1)
> @@ -37,13 +37,13 @@ static void gen_ctz(TCGv ret, TCGv arg1)
>  static bool trans_ctz(DisasContext *ctx, arg_ctz *a)
>  {
>      REQUIRE_EXT(ctx, RVB);
> -    return gen_unary(ctx, a, gen_ctz);
> +    return gen_unary(ctx, a, EXT_ZERO, gen_ctz);
>  }
>
>  static bool trans_cpop(DisasContext *ctx, arg_cpop *a)
>  {
>      REQUIRE_EXT(ctx, RVB);
> -    return gen_unary(ctx, a, tcg_gen_ctpop_tl);
> +    return gen_unary(ctx, a, EXT_ZERO, tcg_gen_ctpop_tl);
>  }
>
>  static bool trans_andn(DisasContext *ctx, arg_andn *a)
> @@ -132,13 +132,13 @@ static bool trans_maxu(DisasContext *ctx, arg_maxu *a)
>  static bool trans_sext_b(DisasContext *ctx, arg_sext_b *a)
>  {
>      REQUIRE_EXT(ctx, RVB);
> -    return gen_unary(ctx, a, tcg_gen_ext8s_tl);
> +    return gen_unary(ctx, a, EXT_NONE, tcg_gen_ext8s_tl);
>  }
>
>  static bool trans_sext_h(DisasContext *ctx, arg_sext_h *a)
>  {
>      REQUIRE_EXT(ctx, RVB);
> -    return gen_unary(ctx, a, tcg_gen_ext16s_tl);
> +    return gen_unary(ctx, a, EXT_NONE, tcg_gen_ext16s_tl);
>  }
>
>  static void gen_sbop_mask(TCGv ret, TCGv shamt)
> @@ -366,7 +366,6 @@ GEN_TRANS_SHADD(3)
>
>  static void gen_clzw(TCGv ret, TCGv arg1)
>  {
> -    tcg_gen_ext32u_tl(ret, arg1);
>      tcg_gen_clzi_tl(ret, ret, 64);
>      tcg_gen_subi_tl(ret, ret, 32);
>  }
> @@ -375,7 +374,7 @@ static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
>  {
>      REQUIRE_64BIT(ctx);
>      REQUIRE_EXT(ctx, RVB);
> -    return gen_unary(ctx, a, gen_clzw);
> +    return gen_unary(ctx, a, EXT_ZERO, gen_clzw);
>  }
>
>  static void gen_ctzw(TCGv ret, TCGv arg1)
> @@ -388,20 +387,15 @@ static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a)
>  {
>      REQUIRE_64BIT(ctx);
>      REQUIRE_EXT(ctx, RVB);
> -    return gen_unary(ctx, a, gen_ctzw);
> -}
> -
> -static void gen_cpopw(TCGv ret, TCGv arg1)
> -{
> -    tcg_gen_ext32u_tl(arg1, arg1);
> -    tcg_gen_ctpop_tl(ret, arg1);
> +    return gen_unary(ctx, a, EXT_NONE, gen_ctzw);
>  }
>
>  static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
>  {
>      REQUIRE_64BIT(ctx);
>      REQUIRE_EXT(ctx, RVB);
> -    return gen_unary(ctx, a, gen_cpopw);
> +    ctx->w = true;
> +    return gen_unary(ctx, a, EXT_ZERO, tcg_gen_ctpop_tl);
>  }
>
>  static void gen_packw(TCGv ret, TCGv arg1, TCGv arg2)
> --
> 2.25.1
>
>

