Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcKPm-0006kQ-Sv
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 00:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcKPl-0006id-EP; Mon, 18 Oct 2021 00:38:21 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:45705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcKPh-0003Ts-NH; Mon, 18 Oct 2021 00:38:21 -0400
Received: by mail-il1-x12c.google.com with SMTP id i11so13500227ila.12;
 Sun, 17 Oct 2021 21:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U+CjwRVSCtc+kXWSbm1pP0/myfu7EfvDF8aD73c//oo=;
 b=pLqugSFKzh3EXp/49jZ7EHYAhLdm8qp1b6apbwCbRY5ZDEcNXwZs/IJH8FW907fW1S
 fivjhJm+C4W64XLLvTDnHuuMYMl+5vz7EF8tKw48h7DG3EgJhVoI2mjpg8rFIyYKev5+
 L7BMvMF95JlnXt3GeuACnUw2LHM5oxd43C/70arsSjZUU6Xzu8RLWR1uELcNIhfjqZDu
 YFIR6al3+g6Eulzq1sB0NhXRHQGGBwgCNRa5eeVbEyHNaKdIk6pdY4gHKDnY280b+TG4
 BgnBbahlbpbfEuqQZQyuzgso3hzdCeRwv1hMq/ai1O39kQikn1Me2f89A+nN5Kxp+KhM
 jaSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U+CjwRVSCtc+kXWSbm1pP0/myfu7EfvDF8aD73c//oo=;
 b=fDm1Qgvm5r557aWiaLMmjWXVF+90DHm9Wu0WNlb1nkuZhJlmC6Y+1U/rp9c3BYkHJ/
 FHIMLWtNPqhKa5vzwTeDqT6El5WXczdWW4vtm86Qrzv4H3Mhl4dX61ZNxvAXorL674tr
 4MyWEXgF51nWwcB20U5ktHspaaorYOq+w5pxVabZnzyNOKrrLRB1yTB1Tq48786MH6q5
 /sjNtq9trwU8oPFQPFCWXxLsWsABANddHmSinep/GCP0ZLOuCOM1Ps8MjKhAii51FSQl
 5mk4GFTW/Q5MccrCSrK0n8ZHIKiI6qZlisBlBD1pBjLydpT+D1FSydQ7axhjMfLSGIy3
 +kNQ==
X-Gm-Message-State: AOAM53334JwNipg/ZRmQoklEmBO3j4kQo/FKLT8h+Q6+xRzY05I/Piqg
 uO4A+lfGn0+3TmXaPuT6vIL3XINYsqonglKgOQ8=
X-Google-Smtp-Source: ABdhPJyAA7/275IklbCq908Oa6nU4UafON6pT9UEs9g4428Oyk08wxZIVYUdDEWMkf3UHFTtoaMiAWTGe1wmgd9aBow=
X-Received: by 2002:a05:6e02:1402:: with SMTP id
 n2mr12946141ilo.208.1634531896080; 
 Sun, 17 Oct 2021 21:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211016171412.3163784-1-richard.henderson@linaro.org>
 <20211016171412.3163784-13-richard.henderson@linaro.org>
In-Reply-To: <20211016171412.3163784-13-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Oct 2021 14:37:49 +1000
Message-ID: <CAKmqyKP6U7KajkZvG8WaqpwZy+HOPxKq5Ve0b-E9HLpb_-xr7w@mail.gmail.com>
Subject: Re: [PATCH v3 12/14] target/riscv: Use gen_unary_per_ol for RVB
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Fabien Portas <fabien.portas@grenoble-inp.org>, 
 =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?= <frederic.petrot@univ-grenoble-alpes.fr>, 
 liuzhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12c.google.com
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
X-List-Received-Date: Mon, 18 Oct 2021 04:38:21 -0000

On Sun, Oct 17, 2021 at 3:29 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The count zeros instructions require a separate implementation
> for RV32 when TARGET_LONG_BITS == 64.
>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c                | 16 ++++++++++++
>  target/riscv/insn_trans/trans_rvb.c.inc | 33 ++++++++++++-------------
>  2 files changed, 32 insertions(+), 17 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 8f5f39d143..7286791c0f 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -511,6 +511,22 @@ static bool gen_unary(DisasContext *ctx, arg_r2 *a, DisasExtend ext,
>      return true;
>  }
>
> +static bool gen_unary_per_ol(DisasContext *ctx, arg_r2 *a, DisasExtend ext,
> +                             void (*f_tl)(TCGv, TCGv),
> +                             void (*f_32)(TCGv, TCGv))
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
> +    return gen_unary(ctx, a, ext, f_tl);
> +}
> +
>  static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
>  {
>      DisasContext *ctx = container_of(dcbase, DisasContext, base);
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index c62eea433a..0c2120428d 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -47,10 +47,18 @@ static void gen_clz(TCGv ret, TCGv arg1)
>      tcg_gen_clzi_tl(ret, arg1, TARGET_LONG_BITS);
>  }
>
> +static void gen_clzw(TCGv ret, TCGv arg1)
> +{
> +    TCGv t = tcg_temp_new();
> +    tcg_gen_shli_tl(t, arg1, 32);
> +    tcg_gen_clzi_tl(ret, t, 32);
> +    tcg_temp_free(t);
> +}
> +
>  static bool trans_clz(DisasContext *ctx, arg_clz *a)
>  {
>      REQUIRE_ZBB(ctx);
> -    return gen_unary(ctx, a, EXT_ZERO, gen_clz);
> +    return gen_unary_per_ol(ctx, a, EXT_NONE, gen_clz, gen_clzw);
>  }
>
>  static void gen_ctz(TCGv ret, TCGv arg1)
> @@ -58,10 +66,15 @@ static void gen_ctz(TCGv ret, TCGv arg1)
>      tcg_gen_ctzi_tl(ret, arg1, TARGET_LONG_BITS);
>  }
>
> +static void gen_ctzw(TCGv ret, TCGv arg1)
> +{
> +    tcg_gen_ctzi_tl(ret, arg1, 32);
> +}
> +
>  static bool trans_ctz(DisasContext *ctx, arg_ctz *a)
>  {
>      REQUIRE_ZBB(ctx);
> -    return gen_unary(ctx, a, EXT_ZERO, gen_ctz);
> +    return gen_unary_per_ol(ctx, a, EXT_ZERO, gen_ctz, gen_ctzw);
>  }
>
>  static bool trans_cpop(DisasContext *ctx, arg_cpop *a)
> @@ -314,14 +327,6 @@ static bool trans_zext_h_64(DisasContext *ctx, arg_zext_h_64 *a)
>      return gen_unary(ctx, a, EXT_NONE, tcg_gen_ext16u_tl);
>  }
>
> -static void gen_clzw(TCGv ret, TCGv arg1)
> -{
> -    TCGv t = tcg_temp_new();
> -    tcg_gen_shli_tl(t, arg1, 32);
> -    tcg_gen_clzi_tl(ret, t, 32);
> -    tcg_temp_free(t);
> -}
> -
>  static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
>  {
>      REQUIRE_64BIT(ctx);
> @@ -329,17 +334,11 @@ static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
>      return gen_unary(ctx, a, EXT_NONE, gen_clzw);
>  }
>
> -static void gen_ctzw(TCGv ret, TCGv arg1)
> -{
> -    tcg_gen_ori_tl(ret, arg1, (target_ulong)MAKE_64BIT_MASK(32, 32));
> -    tcg_gen_ctzi_tl(ret, ret, 64);
> -}
> -
>  static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a)
>  {
>      REQUIRE_64BIT(ctx);
>      REQUIRE_ZBB(ctx);
> -    return gen_unary(ctx, a, EXT_NONE, gen_ctzw);
> +    return gen_unary(ctx, a, EXT_ZERO, gen_ctzw);
>  }
>
>  static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
> --
> 2.25.1
>
>

