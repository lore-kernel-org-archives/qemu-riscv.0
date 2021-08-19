Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mGbZJ-00086R-Kw
	for mharc-qemu-riscv@gnu.org; Thu, 19 Aug 2021 02:30:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mGbZI-00082y-6u; Thu, 19 Aug 2021 02:30:24 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:40647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mGbZG-0007OD-Hl; Thu, 19 Aug 2021 02:30:23 -0400
Received: by mail-il1-x130.google.com with SMTP id u7so4863412ilk.7;
 Wed, 18 Aug 2021 23:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BG4aFpGUn6qG6N85vVVjACJOVk43H3zNv7i7IPFnBOI=;
 b=t573oo7FNPTmyT1s/+I0Ua42lmyGqLVMiI7SHoVT94pcZ726YadjfHb4qBYxtatp21
 /XW44Wig+OUS4PTi6Zg5k08Qgi0p7h7n19jRcg68byfTq6I6ki4z76zmDuLl69bK8Jhs
 3aDtxbd98xripw6/jRlKCBdnK3aNXEUF+MD3OUCl+VWx25zIfi01uoyydVUTxBU5R+k4
 UpIEFaNAci+2z+5htTFWrGPzyX2J8acyU83D6xHCu2HBJ756C5DosiFh30LGsaargwYR
 EsSWvCzQqbU2SbjulRui4PJCpk0JngtTjdrqKk1NWWIcVlcoNRO9yYF71lbSSmbriNEw
 6Oaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BG4aFpGUn6qG6N85vVVjACJOVk43H3zNv7i7IPFnBOI=;
 b=M0Sb5HJbq7adY8KU2W4zDZXStm0GhfQYr5c2Zow0x7+gEo2Mluz51ainlXMrC3PgbU
 rOQb7sbsYZKmu7Sgnp+0OICCB2vsWewvPt6VOME9T1LfU6qhyPo+zKaW1CBn5ONPW4DP
 U96rSut+/4PTZzfJXzOekogZUJfWH5t8h8M7CVJsRj3l678a/UoD97QfjvKGjKqlGqEt
 G0yiFiWqtxHOFHbl5xlT8CpIjiICiSIhqHaGQnVn53HAuflDxKY03x0VQXlRzChao2HI
 3Mj0hDRbh585l2ZQfnqLFZFFXU6diNDNOwjaBKgRwTMykGnxSzYYvwmz2zcVBdDRKg4Q
 a3/w==
X-Gm-Message-State: AOAM533ulyk6BSx34RbHnIwCSJpT9nUUbSgb4HzpyfWx/PkBhn+dDC7s
 mj3kmavxQwruXf3iFtW+mfmSWN2ldV09kRCreHU=
X-Google-Smtp-Source: ABdhPJywI/ucwwXqW+dB+2cGAKdEVANT2Tuxd23QMq5NEdskddxHCxr6laR5Ma+rN+OamdNTR2mkL5RcLjBz1rxCW/g=
X-Received: by 2002:a05:6e02:1044:: with SMTP id
 p4mr8609767ilj.227.1629354621322; 
 Wed, 18 Aug 2021 23:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210817211803.283639-1-richard.henderson@linaro.org>
 <20210817211803.283639-8-richard.henderson@linaro.org>
In-Reply-To: <20210817211803.283639-8-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 19 Aug 2021 16:29:55 +1000
Message-ID: <CAKmqyKPKjOq2O-Yd3dKfYZyT14o3AXYy4um5Ws+mQgGqwXDxNA@mail.gmail.com>
Subject: Re: [PATCH v2 07/21] target/riscv: Use gen_arith for mulh and mulhu
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 liuzhiwei <zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Thu, 19 Aug 2021 06:30:24 -0000

On Wed, Aug 18, 2021 at 7:23 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Split out gen_mulh and gen_mulhu and use the common helper.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvm.c.inc | 40 +++++++++++--------------
>  1 file changed, 18 insertions(+), 22 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
> index 3d93b24c25..80552be7a3 100644
> --- a/target/riscv/insn_trans/trans_rvm.c.inc
> +++ b/target/riscv/insn_trans/trans_rvm.c.inc
> @@ -25,20 +25,18 @@ static bool trans_mul(DisasContext *ctx, arg_mul *a)
>      return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl);
>  }
>
> +static void gen_mulh(TCGv ret, TCGv s1, TCGv s2)
> +{
> +    TCGv discard = tcg_temp_new();
> +
> +    tcg_gen_muls2_tl(discard, ret, s1, s2);
> +    tcg_temp_free(discard);
> +}
> +
>  static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
>  {
>      REQUIRE_EXT(ctx, RVM);
> -    TCGv source1 = tcg_temp_new();
> -    TCGv source2 = tcg_temp_new();
> -    gen_get_gpr(ctx, source1, a->rs1);
> -    gen_get_gpr(ctx, source2, a->rs2);
> -
> -    tcg_gen_muls2_tl(source2, source1, source1, source2);
> -
> -    gen_set_gpr(ctx, a->rd, source1);
> -    tcg_temp_free(source1);
> -    tcg_temp_free(source2);
> -    return true;
> +    return gen_arith(ctx, a, EXT_NONE, gen_mulh);
>  }
>
>  static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
> @@ -47,20 +45,18 @@ static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
>      return gen_arith(ctx, a, EXT_NONE, gen_mulhsu);
>  }
>
> +static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
> +{
> +    TCGv discard = tcg_temp_new();
> +
> +    tcg_gen_mulu2_tl(discard, ret, s1, s2);
> +    tcg_temp_free(discard);
> +}
> +
>  static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
>  {
>      REQUIRE_EXT(ctx, RVM);
> -    TCGv source1 = tcg_temp_new();
> -    TCGv source2 = tcg_temp_new();
> -    gen_get_gpr(ctx, source1, a->rs1);
> -    gen_get_gpr(ctx, source2, a->rs2);
> -
> -    tcg_gen_mulu2_tl(source2, source1, source1, source2);
> -
> -    gen_set_gpr(ctx, a->rd, source1);
> -    tcg_temp_free(source1);
> -    tcg_temp_free(source2);
> -    return true;
> +    return gen_arith(ctx, a, EXT_NONE, gen_mulhu);
>  }
>
>  static bool trans_div(DisasContext *ctx, arg_div *a)
> --
> 2.25.1
>
>

