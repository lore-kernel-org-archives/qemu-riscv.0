Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m3tWL-0003Aq-Hx
	for mharc-qemu-riscv@gnu.org; Thu, 15 Jul 2021 01:02:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m3tWJ-00037j-Si; Thu, 15 Jul 2021 01:02:47 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:45923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m3tWI-0006Or-33; Thu, 15 Jul 2021 01:02:47 -0400
Received: by mail-il1-x12b.google.com with SMTP id b6so3850508iln.12;
 Wed, 14 Jul 2021 22:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3rc/voa4eUd7+Yh8EQMzVX0JR1lWNLGAgpspbRbiut8=;
 b=nPgKMLeNGmjV9FyKNRLYjv0AnoNCYTevYX3VECtPRRwR8M0gIERj4qdPYnJTUJaUDW
 CQ2BgxEHadV4X15gJQqHW5E6qFJOgGSycQwlZPxPTuQIm0hSt0taxm+2hRTaX+pvKSRT
 a777KK2eGQ8/iUGIGrH5BAB1mLceH/74iPJ1KeBM+F9IHZ76uBaYPMEZZWv8RPpTwp4Y
 q96xcdfObNCJsPU+noIne7+OSLrAh6cuOLk7TdTnZ2r9ZSvM8L5Dg5Wc/2q6bGx36Bvp
 7eMpZakJw05CrlgAJdQzWsc9l3j5tpIOWQaWMEzyZZR45UnPuw5Nz+nyatWgV3mkTd44
 LoXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3rc/voa4eUd7+Yh8EQMzVX0JR1lWNLGAgpspbRbiut8=;
 b=QP4n5Qx8AfauM8SX+MksYK9/rQke6a6HitcuA3ySZGtpPosodH9XmoevozlTxS0pw0
 9vvxCUqNIrKxM5f/SQRfBgY11abU/LJSjK320pQO8YkjZsGt1t9rgxEUfSuR7wjWznP0
 ju7r8iHJGuSydnWG9adzv22iehu9q+MhBhP8JIXe3ZusWuLAhTq8IaYQdnEgTNRKx5Bm
 aQvos53Z4kVeEcOeoPmUG+kMr/WnMlfBUfCod9vPfIzfhfzAcwjb5D6qpgpGvKfeSy/G
 5P47dTShE5P10JjSQl6B4GFKkHB9i8s+HSiY2S31lNw3PfOoGC7kqfczwtfD9Hvo7p7F
 TXvQ==
X-Gm-Message-State: AOAM531Ryiy5I+mu3KphIyd8v+oeo/GDrBuOB03mWeamwZF6GHvKnLv6
 FFHnI8lYbeHSYI1cSeHbQ2faKXh+ccp09nbQdTE=
X-Google-Smtp-Source: ABdhPJwVyaH/IAjAkWGRViRqhKPxHlydQ1rxUpAwfZW7eIweXE7lqeZdf9DImNKyZHJDKZmNtgC3TTdL5DvCAKZ51KA=
X-Received: by 2002:a92:c504:: with SMTP id r4mr1271870ilg.131.1626325364687; 
 Wed, 14 Jul 2021 22:02:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210709042608.883256-1-richard.henderson@linaro.org>
 <20210709042608.883256-16-richard.henderson@linaro.org>
In-Reply-To: <20210709042608.883256-16-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 15 Jul 2021 15:02:18 +1000
Message-ID: <CAKmqyKOoLjJyrTqbKt6AGxak-HNesf1h8b5yOw1yv4et=y-UjQ@mail.gmail.com>
Subject: Re: [PATCH 15/17] target/riscv: Use gen_arith for mulh and mulhu
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12b.google.com
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
X-List-Received-Date: Thu, 15 Jul 2021 05:02:48 -0000

On Fri, Jul 9, 2021 at 2:40 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Split out gen_mulh and gen_mulhu and use the common helper.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c                | 16 ++++++++++++++++
>  target/riscv/insn_trans/trans_rvm.c.inc | 24 ++----------------------
>  2 files changed, 18 insertions(+), 22 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 6ad40e43b0..8ff75a5798 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -235,6 +235,22 @@ static TCGv gpr_dst(DisasContext *ctx, int reg_num)
>      return cpu_gpr[reg_num];
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
> +static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
> +{
> +    TCGv discard = tcg_temp_new();
> +
> +    tcg_gen_mulu2_tl(discard, ret, s1, s2);
> +    tcg_temp_free(discard);
> +}
> +
>  static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
>  {
>      TCGv rl = tcg_temp_new();
> diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
> index 10ecc456fc..34220b824d 100644
> --- a/target/riscv/insn_trans/trans_rvm.c.inc
> +++ b/target/riscv/insn_trans/trans_rvm.c.inc
> @@ -28,17 +28,7 @@ static bool trans_mul(DisasContext *ctx, arg_mul *a)
>  static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
>  {
>      REQUIRE_EXT(ctx, RVM);
> -    TCGv source1 = tcg_temp_new();
> -    TCGv source2 = tcg_temp_new();
> -    gen_get_gpr(source1, a->rs1);
> -    gen_get_gpr(source2, a->rs2);
> -
> -    tcg_gen_muls2_tl(source2, source1, source1, source2);
> -
> -    gen_set_gpr(a->rd, source1);
> -    tcg_temp_free(source1);
> -    tcg_temp_free(source2);
> -    return true;
> +    return gen_arith(ctx, a, gen_mulh);
>  }
>
>  static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
> @@ -50,17 +40,7 @@ static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
>  static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
>  {
>      REQUIRE_EXT(ctx, RVM);
> -    TCGv source1 = tcg_temp_new();
> -    TCGv source2 = tcg_temp_new();
> -    gen_get_gpr(source1, a->rs1);
> -    gen_get_gpr(source2, a->rs2);
> -
> -    tcg_gen_mulu2_tl(source2, source1, source1, source2);
> -
> -    gen_set_gpr(a->rd, source1);
> -    tcg_temp_free(source1);
> -    tcg_temp_free(source2);
> -    return true;
> +    return gen_arith(ctx, a, gen_mulhu);
>  }
>
>  static bool trans_div(DisasContext *ctx, arg_div *a)
> --
> 2.25.1
>
>

