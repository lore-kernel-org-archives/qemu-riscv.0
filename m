Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mGtRh-0002GS-Qk
	for mharc-qemu-riscv@gnu.org; Thu, 19 Aug 2021 21:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mGtRg-0002GA-N7; Thu, 19 Aug 2021 21:35:44 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:36713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mGtRe-0003Sq-NU; Thu, 19 Aug 2021 21:35:44 -0400
Received: by mail-il1-x12f.google.com with SMTP id x5so7933222ill.3;
 Thu, 19 Aug 2021 18:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JAcApNmC+gp4+JQ8iPBzl66pmXmTl0+XqSNGGIRr6pc=;
 b=foXj2NXKOtFyBZbO7zsXLg+xf+HxGx32ghNI6nzZq06OE3F1STLVeDgSZyFLWVVX8O
 QJdO8KOiZMQbYRv1m+P34L/t4dg0GAmufKcB8IgEyN/5xl1khxmgMm8W24x/i83XtePN
 XvvpRmJ4hn7WhewQZNoE6dZGqiVXsCXZpJnCq5NCcauYTwk9ugXBfAgQxhGNwY6bRT+0
 QmtcgICBKeo2n8I1yaIHjjvRrX3EOJ82RG+44CG4rn7kOvZ7ruT6gJJ3q20ARnj1+5Z5
 LP3mXUbv21j/MmP9x7KT0ccAIIwfRXmp7ylT4PeDY1jqB6oU4L4iDAl92baF96v2VnU8
 oY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JAcApNmC+gp4+JQ8iPBzl66pmXmTl0+XqSNGGIRr6pc=;
 b=CHJR+YBAB9Uk1f5gnSZ+p4FZDViF0os5fVwY+uWzIIJ3N6WkKNl8M9VwFEvT+iOrvl
 JoKIDCM8V/vY33pedIW0LFG32D5iffKyoyXJ7ccdc3u7JVnfxgANUkjFK9nhmGcav7pM
 jj28X4IExqntgtyw9vKQ3XpbBevUXJ6lWxTIjC+b0M45Iq6rjAy1S9r4ZHZ9hNpm58Ks
 GILWVVqtaBbf6K+qmgmlh62R9WUKPMHMTK9gyksftuS0oUSz58Y5GScmND7Da+nUmTMf
 THjqXmSGBs9lu2XtruTV7zEWMCPvjZrp8HbKBDUJOGbjpjwZl0JdaTPCHJ2k5N9nEPKz
 IWBg==
X-Gm-Message-State: AOAM532lkP/K5ndNzsWkMRPqQZc8SmEoyCOqRdpsAq1Z47ljxrIgrH+A
 XwVmeLcHJc9lZ+t8jPKUmlGpQlQcSqWGDJo17O0=
X-Google-Smtp-Source: ABdhPJzmtdayPNE3ScE0e5YXBoQFmKdlc42QZONSQ5TpZmUZPH8I5OCSMKslLDSwdcL4KfN3yGWVrMY4i5KI6TbKO6w=
X-Received: by 2002:a92:8707:: with SMTP id m7mr11910115ild.177.1629423340638; 
 Thu, 19 Aug 2021 18:35:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210819090502.428068-1-richard.henderson@linaro.org>
 <20210819090502.428068-9-richard.henderson@linaro.org>
In-Reply-To: <20210819090502.428068-9-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 20 Aug 2021 11:35:11 +1000
Message-ID: <CAKmqyKOYiBB9NeiFgpX685ZtAHD22Q3j3+Qg7Yx-Gv0Jjn9OFg@mail.gmail.com>
Subject: Re: [PATCH v3 08/21] target/riscv: Move gen_* helpers for RVM
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12f.google.com
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
X-List-Received-Date: Fri, 20 Aug 2021 01:35:45 -0000

On Thu, Aug 19, 2021 at 7:08 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move these helpers near their use by the trans_*
> functions within insn_trans/trans_rvm.c.inc.
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c                | 115 ------------------------
>  target/riscv/insn_trans/trans_rvm.c.inc | 115 ++++++++++++++++++++++++
>  2 files changed, 115 insertions(+), 115 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index bc40b9c701..7fbacfa6ee 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -249,121 +249,6 @@ static void gen_set_gpr(DisasContext *ctx, int reg_=
num, TCGv t)
>      }
>  }
>
> -static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
> -{
> -    TCGv rl =3D tcg_temp_new();
> -    TCGv rh =3D tcg_temp_new();
> -
> -    tcg_gen_mulu2_tl(rl, rh, arg1, arg2);
> -    /* fix up for one negative */
> -    tcg_gen_sari_tl(rl, arg1, TARGET_LONG_BITS - 1);
> -    tcg_gen_and_tl(rl, rl, arg2);
> -    tcg_gen_sub_tl(ret, rh, rl);
> -
> -    tcg_temp_free(rl);
> -    tcg_temp_free(rh);
> -}
> -
> -static void gen_div(TCGv ret, TCGv source1, TCGv source2)
> -{
> -    TCGv temp1, temp2, zero, one, mone, min;
> -
> -    /*
> -     * Handle by altering args to tcg_gen_div to produce req'd results:
> -     * For overflow: want source1 in temp1 and 1 in temp2
> -     * For div by zero: want -1 in temp1 and 1 in temp2 -> -1 result
> -     */
> -    temp1 =3D tcg_temp_new();
> -    temp2 =3D tcg_temp_new();
> -    zero =3D tcg_constant_tl(0);
> -    one =3D tcg_constant_tl(1);
> -    mone =3D tcg_constant_tl(-1);
> -    min =3D tcg_constant_tl(1ull << (TARGET_LONG_BITS - 1));
> -
> -    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
> -    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
> -    tcg_gen_and_tl(temp1, temp1, temp2); /* temp1 =3D overflow */
> -    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, zero); /* temp2 =3D =
div0 */
> -    tcg_gen_or_tl(temp2, temp2, temp1);  /* temp2 =3D overflow | div0 */
> -
> -    /* if div by zero, set temp1 to -1, else source1. */
> -    tcg_gen_movcond_tl(TCG_COND_EQ, temp1, source2, zero, mone, source1)=
;
> -
> -    /* if overflow or div by zero, set temp2 to 1, else source2 */
> -    tcg_gen_movcond_tl(TCG_COND_NE, temp2, temp2, zero, one, source2);
> -
> -    tcg_gen_div_tl(ret, temp1, temp2);
> -
> -    tcg_temp_free(temp1);
> -    tcg_temp_free(temp2);
> -}
> -
> -static void gen_divu(TCGv ret, TCGv source1, TCGv source2)
> -{
> -    TCGv temp1, temp2, zero, one, max;
> -
> -    temp1 =3D tcg_temp_new();
> -    temp2 =3D tcg_temp_new();
> -    zero =3D tcg_constant_tl(0);
> -    one =3D tcg_constant_tl(1);
> -    max =3D tcg_constant_tl(~0);
> -
> -    tcg_gen_movcond_tl(TCG_COND_EQ, temp1, source2, zero, max, source1);
> -    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, source2);
> -    tcg_gen_divu_tl(ret, temp1, temp2);
> -
> -    tcg_temp_free(temp1);
> -    tcg_temp_free(temp2);
> -}
> -
> -static void gen_rem(TCGv ret, TCGv source1, TCGv source2)
> -{
> -    TCGv temp1, temp2, zero, one, mone, min;
> -
> -    temp1 =3D tcg_temp_new();
> -    temp2 =3D tcg_temp_new();
> -    zero =3D tcg_constant_tl(0);
> -    one =3D tcg_constant_tl(1);
> -    mone =3D tcg_constant_tl(-1);
> -    min =3D tcg_constant_tl(1ull << (TARGET_LONG_BITS - 1));
> -
> -    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
> -    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
> -    tcg_gen_and_tl(temp1, temp1, temp2); /* temp1 =3D overflow */
> -    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, zero); /* temp2 =3D =
div0 */
> -    tcg_gen_or_tl(temp2, temp2, temp1);  /* temp2 =3D overflow | div0 */
> -
> -    /*
> -     * if overflow or div by zero, set temp2 to 1, else source2
> -     * this automatically takes care of returning the original
> -     * dividend for div by zero.
> -     */
> -    tcg_gen_movcond_tl(TCG_COND_NE, temp2, temp2, zero, one, source2);
> -
> -    tcg_gen_rem_tl(ret, source1, temp2);
> -
> -    tcg_temp_free(temp1);
> -    tcg_temp_free(temp2);
> -}
> -
> -static void gen_remu(TCGv ret, TCGv source1, TCGv source2)
> -{
> -    TCGv temp2, zero, one;
> -
> -    temp2 =3D tcg_temp_new();
> -    zero =3D tcg_constant_tl(0);
> -    one =3D tcg_constant_tl(1);
> -
> -    /*
> -     * if div by zero, set temp2 to 1, else source2
> -     * this automatically takes care of returning the original dividend.
> -     */
> -    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, source2);
> -    tcg_gen_remu_tl(ret, source1, temp2);
> -
> -    tcg_temp_free(temp2);
> -}
> -
>  static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
>  {
>      target_ulong next_pc;
> diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_=
trans/trans_rvm.c.inc
> index 80552be7a3..28bdfbca70 100644
> --- a/target/riscv/insn_trans/trans_rvm.c.inc
> +++ b/target/riscv/insn_trans/trans_rvm.c.inc
> @@ -39,6 +39,21 @@ static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
>      return gen_arith(ctx, a, EXT_NONE, gen_mulh);
>  }
>
> +static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    TCGv rl =3D tcg_temp_new();
> +    TCGv rh =3D tcg_temp_new();
> +
> +    tcg_gen_mulu2_tl(rl, rh, arg1, arg2);
> +    /* fix up for one negative */
> +    tcg_gen_sari_tl(rl, arg1, TARGET_LONG_BITS - 1);
> +    tcg_gen_and_tl(rl, rl, arg2);
> +    tcg_gen_sub_tl(ret, rh, rl);
> +
> +    tcg_temp_free(rl);
> +    tcg_temp_free(rh);
> +}
> +
>  static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
>  {
>      REQUIRE_EXT(ctx, RVM);
> @@ -59,24 +74,124 @@ static bool trans_mulhu(DisasContext *ctx, arg_mulhu=
 *a)
>      return gen_arith(ctx, a, EXT_NONE, gen_mulhu);
>  }
>
> +static void gen_div(TCGv ret, TCGv source1, TCGv source2)
> +{
> +    TCGv temp1, temp2, zero, one, mone, min;
> +
> +    /*
> +     * Handle by altering args to tcg_gen_div to produce req'd results:
> +     * For overflow: want source1 in temp1 and 1 in temp2
> +     * For div by zero: want -1 in temp1 and 1 in temp2 -> -1 result
> +     */
> +    temp1 =3D tcg_temp_new();
> +    temp2 =3D tcg_temp_new();
> +    zero =3D tcg_constant_tl(0);
> +    one =3D tcg_constant_tl(1);
> +    mone =3D tcg_constant_tl(-1);
> +    min =3D tcg_constant_tl(1ull << (TARGET_LONG_BITS - 1));
> +
> +    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
> +    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
> +    tcg_gen_and_tl(temp1, temp1, temp2); /* temp1 =3D overflow */
> +    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, zero); /* temp2 =3D =
div0 */
> +    tcg_gen_or_tl(temp2, temp2, temp1);  /* temp2 =3D overflow | div0 */
> +
> +    /* if div by zero, set temp1 to -1, else source1. */
> +    tcg_gen_movcond_tl(TCG_COND_EQ, temp1, source2, zero, mone, source1)=
;
> +
> +    /* if overflow or div by zero, set temp2 to 1, else source2 */
> +    tcg_gen_movcond_tl(TCG_COND_NE, temp2, temp2, zero, one, source2);
> +
> +    tcg_gen_div_tl(ret, temp1, temp2);
> +
> +    tcg_temp_free(temp1);
> +    tcg_temp_free(temp2);
> +}
> +
>  static bool trans_div(DisasContext *ctx, arg_div *a)
>  {
>      REQUIRE_EXT(ctx, RVM);
>      return gen_arith(ctx, a, EXT_SIGN, gen_div);
>  }
>
> +static void gen_divu(TCGv ret, TCGv source1, TCGv source2)
> +{
> +    TCGv temp1, temp2, zero, one, max;
> +
> +    temp1 =3D tcg_temp_new();
> +    temp2 =3D tcg_temp_new();
> +    zero =3D tcg_constant_tl(0);
> +    one =3D tcg_constant_tl(1);
> +    max =3D tcg_constant_tl(~0);
> +
> +    tcg_gen_movcond_tl(TCG_COND_EQ, temp1, source2, zero, max, source1);
> +    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, source2);
> +    tcg_gen_divu_tl(ret, temp1, temp2);
> +
> +    tcg_temp_free(temp1);
> +    tcg_temp_free(temp2);
> +}
> +
>  static bool trans_divu(DisasContext *ctx, arg_divu *a)
>  {
>      REQUIRE_EXT(ctx, RVM);
>      return gen_arith(ctx, a, EXT_ZERO, gen_divu);
>  }
>
> +static void gen_rem(TCGv ret, TCGv source1, TCGv source2)
> +{
> +    TCGv temp1, temp2, zero, one, mone, min;
> +
> +    temp1 =3D tcg_temp_new();
> +    temp2 =3D tcg_temp_new();
> +    zero =3D tcg_constant_tl(0);
> +    one =3D tcg_constant_tl(1);
> +    mone =3D tcg_constant_tl(-1);
> +    min =3D tcg_constant_tl(1ull << (TARGET_LONG_BITS - 1));
> +
> +    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
> +    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
> +    tcg_gen_and_tl(temp1, temp1, temp2); /* temp1 =3D overflow */
> +    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, zero); /* temp2 =3D =
div0 */
> +    tcg_gen_or_tl(temp2, temp2, temp1);  /* temp2 =3D overflow | div0 */
> +
> +    /*
> +     * if overflow or div by zero, set temp2 to 1, else source2
> +     * this automatically takes care of returning the original
> +     * dividend for div by zero.
> +     */
> +    tcg_gen_movcond_tl(TCG_COND_NE, temp2, temp2, zero, one, source2);
> +
> +    tcg_gen_rem_tl(ret, source1, temp2);
> +
> +    tcg_temp_free(temp1);
> +    tcg_temp_free(temp2);
> +}
> +
>  static bool trans_rem(DisasContext *ctx, arg_rem *a)
>  {
>      REQUIRE_EXT(ctx, RVM);
>      return gen_arith(ctx, a, EXT_SIGN, gen_rem);
>  }
>
> +static void gen_remu(TCGv ret, TCGv source1, TCGv source2)
> +{
> +    TCGv temp2, zero, one;
> +
> +    temp2 =3D tcg_temp_new();
> +    zero =3D tcg_constant_tl(0);
> +    one =3D tcg_constant_tl(1);
> +
> +    /*
> +     * if div by zero, set temp2 to 1, else source2
> +     * this automatically takes care of returning the original dividend.
> +     */
> +    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, source2);
> +    tcg_gen_remu_tl(ret, source1, temp2);
> +
> +    tcg_temp_free(temp2);
> +}
> +
>  static bool trans_remu(DisasContext *ctx, arg_remu *a)
>  {
>      REQUIRE_EXT(ctx, RVM);
> --
> 2.25.1
>
>

