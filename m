Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcKO3-0005gS-9W
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 00:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcKNz-0005du-AL; Mon, 18 Oct 2021 00:36:31 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:39550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcKNx-0001fs-JU; Mon, 18 Oct 2021 00:36:31 -0400
Received: by mail-il1-x136.google.com with SMTP id w11so13528811ilv.6;
 Sun, 17 Oct 2021 21:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u0lG/ITfSWHGHwYdYUAp+IRzRQaltoeJY3tjT9FRyiQ=;
 b=okB0bErTrr6xlRmb+BhewTvbvATgnaGSkK5RnpFVigEQeOrvDbZSVqp0WqCsG0DpC6
 Cr1734qaL4C0ltdZp+3SfsimGibZPt3okZ4IzI//Vx0m1VYZEzXadROVVCN5ylKGoU5E
 JgDR+Vw6uc8/WHLVuXEXXThAQzXlwSfJTGXu4VA4moWPbANlCbBgDKdkJEZK4H6c4IE/
 qgX6TbHLlELB3Pwwqv1/lVO2IqoKeCt4GD0bYtvdspoDfgc9tmKHmNgVxgcIiVbeh1YQ
 WXebpTJOJA0Mqq3h/u6KVzWwZwiaoZWjJHmJaLF+BBNcxxRSK9DZ/EMZ++g9gY4bV5kV
 5oww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u0lG/ITfSWHGHwYdYUAp+IRzRQaltoeJY3tjT9FRyiQ=;
 b=Gd787DFnXtS9eocoCK+osRjcVNGWSfY9Esb6YE+4cI93zhfkxz4ykjCYsZoqQGniNg
 tZ6MVEATqU03xkTqNvkEl5UNApxnNzs0FJvlz9Hhll35mEXk5MbNXl+uefA66ofk4Bq3
 t2FFViU3pqOiD1IWUGTI0H4IVfMjdrLm9lecl5VoVLFhCTlWcM8KHWKXpPBJ1neLbRC0
 Y6FC5ov7fx+YzRpYhcbMz/P2Bqa/yx6GSRsyDrKPlPyiTgeCnaPqqtrz5hXJl+OKjHbX
 CNGkCxmGX9Sde+qldeWu6cAhuzQFt5nTaeds4eCNBsjwHlUj8+WdTCElPN4D8inZVtjW
 dImw==
X-Gm-Message-State: AOAM533Uu04iTmG7jYEWmUC9JloLmNbfNbxJC0iDXLqHa8EP/Vadb+QR
 dLIOYovFt97raf1yuFOaUQ3R6HrzvmUktiXl4XI=
X-Google-Smtp-Source: ABdhPJzgwX3ZUaofZXbWxMy4lQibcMoD6nUYHiNeKb4iY5H208RK87uxQ5m4udsMHn4HNfiT2RiDqe6FgWSVRcCJA4g=
X-Received: by 2002:a92:1a43:: with SMTP id z3mr12680167ill.46.1634531787090; 
 Sun, 17 Oct 2021 21:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <20211016171412.3163784-1-richard.henderson@linaro.org>
 <20211016171412.3163784-11-richard.henderson@linaro.org>
In-Reply-To: <20211016171412.3163784-11-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Oct 2021 14:36:01 +1000
Message-ID: <CAKmqyKMoxd=m3+2dJoeH6VBLrFdcpyaLDifXqgY5Yvu_LNJQhw@mail.gmail.com>
Subject: Re: [PATCH v3 10/14] target/riscv: Use gen_arith_per_ol for RVM
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Fabien Portas <fabien.portas@grenoble-inp.org>, 
 =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?= <frederic.petrot@univ-grenoble-alpes.fr>, 
 liuzhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
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
X-List-Received-Date: Mon, 18 Oct 2021 04:36:31 -0000

On Sun, Oct 17, 2021 at 3:27 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The multiply high-part instructions require a separate
> implementation for RV32 when TARGET_LONG_BITS == 64.
>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c                | 16 +++++++++++++++
>  target/riscv/insn_trans/trans_rvm.c.inc | 26 ++++++++++++++++++++++---
>  2 files changed, 39 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 172eea3935..8f5f39d143 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -428,6 +428,22 @@ static bool gen_arith(DisasContext *ctx, arg_r *a, DisasExtend ext,
>      return true;
>  }
>
> +static bool gen_arith_per_ol(DisasContext *ctx, arg_r *a, DisasExtend ext,
> +                             void (*f_tl)(TCGv, TCGv, TCGv),
> +                             void (*f_32)(TCGv, TCGv, TCGv))
> +{
> +    int olen = get_olen(ctx);
> +
> +    if (olen != TARGET_LONG_BITS) {
> +        if (olen == 32) {
> +            f_tl = f_32;
> +        } else {
> +            g_assert_not_reached();
> +        }
> +    }
> +    return gen_arith(ctx, a, ext, f_tl);
> +}
> +
>  static bool gen_shift_imm_fn(DisasContext *ctx, arg_shift *a, DisasExtend ext,
>                               void (*func)(TCGv, TCGv, target_long))
>  {
> diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
> index 9a1fe3c799..2af0e5c139 100644
> --- a/target/riscv/insn_trans/trans_rvm.c.inc
> +++ b/target/riscv/insn_trans/trans_rvm.c.inc
> @@ -33,10 +33,16 @@ static void gen_mulh(TCGv ret, TCGv s1, TCGv s2)
>      tcg_temp_free(discard);
>  }
>
> +static void gen_mulh_w(TCGv ret, TCGv s1, TCGv s2)
> +{
> +    tcg_gen_mul_tl(ret, s1, s2);
> +    tcg_gen_sari_tl(ret, ret, 32);
> +}
> +
>  static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
>  {
>      REQUIRE_EXT(ctx, RVM);
> -    return gen_arith(ctx, a, EXT_NONE, gen_mulh);
> +    return gen_arith_per_ol(ctx, a, EXT_SIGN, gen_mulh, gen_mulh_w);
>  }
>
>  static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
> @@ -54,10 +60,23 @@ static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
>      tcg_temp_free(rh);
>  }
>
> +static void gen_mulhsu_w(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    TCGv t1 = tcg_temp_new();
> +    TCGv t2 = tcg_temp_new();
> +
> +    tcg_gen_ext32s_tl(t1, arg1);
> +    tcg_gen_ext32u_tl(t2, arg2);
> +    tcg_gen_mul_tl(ret, t1, t2);
> +    tcg_temp_free(t1);
> +    tcg_temp_free(t2);
> +    tcg_gen_sari_tl(ret, ret, 32);
> +}
> +
>  static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
>  {
>      REQUIRE_EXT(ctx, RVM);
> -    return gen_arith(ctx, a, EXT_NONE, gen_mulhsu);
> +    return gen_arith_per_ol(ctx, a, EXT_NONE, gen_mulhsu, gen_mulhsu_w);
>  }
>
>  static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
> @@ -71,7 +90,8 @@ static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
>  static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
>  {
>      REQUIRE_EXT(ctx, RVM);
> -    return gen_arith(ctx, a, EXT_NONE, gen_mulhu);
> +    /* gen_mulh_w works for either sign as input. */
> +    return gen_arith_per_ol(ctx, a, EXT_ZERO, gen_mulhu, gen_mulh_w);
>  }
>
>  static void gen_div(TCGv ret, TCGv source1, TCGv source2)
> --
> 2.25.1
>
>

