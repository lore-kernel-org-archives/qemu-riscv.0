Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mIm8T-000321-3M
	for mharc-qemu-riscv@gnu.org; Wed, 25 Aug 2021 02:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mIm8R-000305-U8; Wed, 25 Aug 2021 02:11:39 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:41558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mIm8Q-0007Os-1i; Wed, 25 Aug 2021 02:11:39 -0400
Received: by mail-io1-xd2c.google.com with SMTP id j18so29337495ioj.8;
 Tue, 24 Aug 2021 23:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bzQdR8bUe1m2f8zd9GMprj1FVuGieHgS2za2iAh1quk=;
 b=mdJBAj/kXIHcvkfbvEjfyfA1IKtkdRgG+pfoWhkesnoiuXB2grKp5HHiH3AjXaIUoV
 7RQk00XIlBU6iZt+mOmF631Ii8+z3Yg9EAj9AnQfcA6cehDezlkQHuonoctEbbuWy+Hs
 pRU6OkO6C5hkBCyFVWje5Dtm9c8igzzHFIRZuTnvkNPyzbl6nnldaRsgRd6s4lprzgi4
 sgUfWPzeOGo2oouY709fuOa4oPAivsKJaikJ/Sk/84NHbYc5yXlhHOS003rxAnfb8FmH
 QHb07eN6pOzIKrDXOicz0O5VJJtaQ/fXLwI1C/mz6nBwCF+obIakdupQJG+CvcuLpfrc
 mqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bzQdR8bUe1m2f8zd9GMprj1FVuGieHgS2za2iAh1quk=;
 b=ncOdH0OO52sNoI/2bnXl32kVZ+sRafUzVmHwdwpC3769DSefLQbwekOAlE7QrrY5LM
 Kmo2zXf4xaA2Dx5VgOsbPBGuc/cn2QkRNH4UNpspz6SX6PRfe06E0w/NKCIk+28qCEz8
 EQcSHoWSctu30zMA9Rb1N+za4TeHoEnBy5zHRwZf0wp0zXJ5n9+FoBHlVF7T4XZiF3hX
 CYd1cvWPRZOGyDJw4vhLRQwLvKBezCzrFKnpMP33u+sSXBBzJinrsw0HcYDAegW3U5M9
 x879l1PkYloCkZhNw3EbtOMoCu9fa32zdc98IILk54yxCmdvhef1PgkJ31v0XDVMAKmH
 qJCg==
X-Gm-Message-State: AOAM533J2tOIxQBj1x/2eoAvs6j8mVhvC4XpT3/mHDh7Lri2eF3zSQTu
 SJpzf1FyqKtf0/JQirvY6K/8SheNp2WZf+rUTR4=
X-Google-Smtp-Source: ABdhPJypdxKzSVptqUXzJm/Vv7EYYxr5Ms2LkZylm/AlqvXivfg7A3ZPb2O3XYj17kCCP5zdxUI9Xb1q7NQt7t951g0=
X-Received: by 2002:a02:c502:: with SMTP id s2mr38431435jam.135.1629871896653; 
 Tue, 24 Aug 2021 23:11:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210823195529.560295-1-richard.henderson@linaro.org>
 <20210823195529.560295-21-richard.henderson@linaro.org>
In-Reply-To: <20210823195529.560295-21-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 25 Aug 2021 16:11:10 +1000
Message-ID: <CAKmqyKNjMcGB_V9thbkhqBuJ6fb2pupe9R_z_81sADS+Ki4xTQ@mail.gmail.com>
Subject: Re: [PATCH v5 20/24] target/riscv: Use gen_shift_imm_fn for slli_uw
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2c.google.com
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
X-List-Received-Date: Wed, 25 Aug 2021 06:11:40 -0000

On Tue, Aug 24, 2021 at 6:09 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Always use tcg_gen_deposit_z_tl; the special case for
> shamt >= 32 is handled there.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvb.c.inc | 19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index b97c3ca5da..b72e76255c 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -635,21 +635,14 @@ static bool trans_add_uw(DisasContext *ctx, arg_add_uw *a)
>      return gen_arith(ctx, a, EXT_NONE, gen_add_uw);
>  }
>
> +static void gen_slli_uw(TCGv dest, TCGv src, target_long shamt)
> +{
> +    tcg_gen_deposit_z_tl(dest, src, shamt, MIN(32, TARGET_LONG_BITS - shamt));
> +}
> +
>  static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
>  {
>      REQUIRE_64BIT(ctx);
>      REQUIRE_EXT(ctx, RVB);
> -
> -    TCGv source1 = tcg_temp_new();
> -    gen_get_gpr(ctx, source1, a->rs1);
> -
> -    if (a->shamt < 32) {
> -        tcg_gen_deposit_z_tl(source1, source1, a->shamt, 32);
> -    } else {
> -        tcg_gen_shli_tl(source1, source1, a->shamt);
> -    }
> -
> -    gen_set_gpr(ctx, a->rd, source1);
> -    tcg_temp_free(source1);
> -    return true;
> +    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_slli_uw);
>  }
> --
> 2.25.1
>
>

