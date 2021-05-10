Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lg0JR-0000D5-PM
	for mharc-qemu-riscv@gnu.org; Mon, 10 May 2021 03:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lg0JP-00008y-TM; Mon, 10 May 2021 03:26:43 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:39710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lg0JO-0006nt-4a; Mon, 10 May 2021 03:26:43 -0400
Received: by mail-io1-xd2b.google.com with SMTP id k25so13855243iob.6;
 Mon, 10 May 2021 00:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KgVyZkDhkwwekl+2wuyn+oUiL4ZbZm1rQcGEQlclb3c=;
 b=ehuyO87Mh5sDMXgOVAh39KIHs+mltWCYVjrMBSv/3oF2rB/JhwVq1LveGx11HioUga
 8/qEtb+ApHB9QAXQ5s+DCw8prSO7qROMLU4QqSBEJo+3B4qxRQXGCxS81MLuVwDjcl1Y
 hbjNpepM2I7O2ZLoCWMU/ErJxzjnUtk8gZL5MhRXkSTzu46gkt9AiGM0FX3ilcRClafC
 PoJ9mF2DyoWMg9njnY7lMkiTrS4mVqswbwSeTKScqUzGZTYGXoyrnk6Rymjfl6K2OOgQ
 OlIkcXH/yzIBbz/BkjL3Z6CU8a+MNNfvXdciYR/u+wY3LF5/cEu/HS+oYyYduvbgiXU/
 ovcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KgVyZkDhkwwekl+2wuyn+oUiL4ZbZm1rQcGEQlclb3c=;
 b=J9wKlpeL3oOLJkXIXsLIUFMqcEovMdMpM3GhD29mAzbJs4BVQ3QHpJw1tNF7MnmRmv
 13aieBegwt/qLoalEJMU6D1/u3J2elQq6eguSyAjxVV98MO/2yTvu/AKWgR13QK26RX4
 CHRsAKVhLjWY6nIFQJZd7TVutZPvuNwKBUwzjo3dPx9OwRD7LrquRfDGbJAjJB1YutVO
 Hgt2cNdLIoIIyX4r8LEn0eGbrEzXmFTcmYp2CcVhSwa15SFx/nuQYViHyUA8KIv1oGdT
 pdLwXDcBOLDV5+4WtN9ebGG/a+w5VPcXXnemSW7ZM5gnF3tMRIdf/9EWv7HonVleWk/b
 ewdg==
X-Gm-Message-State: AOAM531dz4KTq3q/tlGJpIeVUsdXmDlFR3eH4llLMZsf99oMqMizv/J6
 qSup4mBPuOZrt2u6A1Oy5qI978ogx7PekMKnQmw=
X-Google-Smtp-Source: ABdhPJw+paMF5eZqe1xruqZCb14PJSVQAmHm4BfTsoNRl5Qyrs9dqaBX10qkDbSGEvmlSZij/+mkM2h6n29AwkgC3M4=
X-Received: by 2002:a5e:880b:: with SMTP id l11mr16820514ioj.42.1620631600680; 
 Mon, 10 May 2021 00:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210505160620.15723-1-frank.chang@sifive.com>
 <20210505160620.15723-11-frank.chang@sifive.com>
In-Reply-To: <20210505160620.15723-11-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 May 2021 17:26:12 +1000
Message-ID: <CAKmqyKP_QxkHSoF_a=o8bkLgSLS86p2A=Y0j-TN144i_ZQJhGg@mail.gmail.com>
Subject: Re: [PATCH v6 10/17] target/riscv: rvb: shift ones
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
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
X-List-Received-Date: Mon, 10 May 2021 07:26:44 -0000

On Thu, May 6, 2021 at 2:08 AM <frank.chang@sifive.com> wrote:
>
> From: Kito Cheng <kito.cheng@sifive.com>
>
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn32.decode              |  8 ++++
>  target/riscv/insn_trans/trans_rvb.c.inc | 52 +++++++++++++++++++++++++
>  target/riscv/translate.c                | 14 +++++++
>  3 files changed, 74 insertions(+)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 433b601b934..6bc9bbae9e0 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -680,11 +680,15 @@ bset       0010100 .......... 001 ..... 0110011 @r
>  bclr       0100100 .......... 001 ..... 0110011 @r
>  binv       0110100 .......... 001 ..... 0110011 @r
>  bext       0100100 .......... 101 ..... 0110011 @r
> +slo        0010000 .......... 001 ..... 0110011 @r
> +sro        0010000 .......... 101 ..... 0110011 @r
>
>  bseti      00101. ........... 001 ..... 0010011 @sh
>  bclri      01001. ........... 001 ..... 0010011 @sh
>  binvi      01101. ........... 001 ..... 0010011 @sh
>  bexti      01001. ........... 101 ..... 0010011 @sh
> +sloi       00100. ........... 001 ..... 0010011 @sh
> +sroi       00100. ........... 101 ..... 0010011 @sh
>
>  # *** RV64B Standard Extension (in addition to RV32B) ***
>  clzw       0110000 00000 ..... 001 ..... 0011011 @r2
> @@ -697,7 +701,11 @@ bsetw      0010100 .......... 001 ..... 0111011 @r
>  bclrw      0100100 .......... 001 ..... 0111011 @r
>  binvw      0110100 .......... 001 ..... 0111011 @r
>  bextw      0100100 .......... 101 ..... 0111011 @r
> +slow       0010000 .......... 001 ..... 0111011 @r
> +srow       0010000 .......... 101 ..... 0111011 @r
>
>  bsetiw     0010100 .......... 001 ..... 0011011 @sh5
>  bclriw     0100100 .......... 001 ..... 0011011 @sh5
>  binviw     0110100 .......... 001 ..... 0011011 @sh5
> +sloiw      0010000 .......... 001 ..... 0011011 @sh5
> +sroiw      0010000 .......... 101 ..... 0011011 @sh5
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index 69e5af44a18..28640322c43 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -155,6 +155,30 @@ static bool trans_bexti(DisasContext *ctx, arg_bexti *a)
>      return gen_shifti(ctx, a, gen_bext);
>  }
>
> +static bool trans_slo(DisasContext *ctx, arg_slo *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_shift(ctx, a, gen_slo);
> +}
> +
> +static bool trans_sloi(DisasContext *ctx, arg_sloi *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_shifti(ctx, a, gen_slo);
> +}
> +
> +static bool trans_sro(DisasContext *ctx, arg_sro *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_shift(ctx, a, gen_sro);
> +}
> +
> +static bool trans_sroi(DisasContext *ctx, arg_sroi *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_shifti(ctx, a, gen_sro);
> +}
> +
>  static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
>  {
>      REQUIRE_64BIT(ctx);
> @@ -238,3 +262,31 @@ static bool trans_bextw(DisasContext *ctx, arg_bextw *a)
>      REQUIRE_EXT(ctx, RVB);
>      return gen_shiftw(ctx, a, gen_bext);
>  }
> +
> +static bool trans_slow(DisasContext *ctx, arg_slow *a)
> +{
> +    REQUIRE_64BIT(ctx);
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_shiftw(ctx, a, gen_slo);
> +}
> +
> +static bool trans_sloiw(DisasContext *ctx, arg_sloiw *a)
> +{
> +    REQUIRE_64BIT(ctx);
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_shiftiw(ctx, a, gen_slo);
> +}
> +
> +static bool trans_srow(DisasContext *ctx, arg_srow *a)
> +{
> +    REQUIRE_64BIT(ctx);
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_shiftw(ctx, a, gen_sro);
> +}
> +
> +static bool trans_sroiw(DisasContext *ctx, arg_sroiw *a)
> +{
> +    REQUIRE_64BIT(ctx);
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_shiftiw(ctx, a, gen_sro);
> +}
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index e12240d1255..088cf9f7678 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -613,6 +613,20 @@ static void gen_bext(TCGv ret, TCGv arg1, TCGv shamt)
>      tcg_gen_andi_tl(ret, ret, 1);
>  }
>
> +static void gen_slo(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    tcg_gen_not_tl(ret, arg1);
> +    tcg_gen_shl_tl(ret, ret, arg2);
> +    tcg_gen_not_tl(ret, ret);
> +}
> +
> +static void gen_sro(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    tcg_gen_not_tl(ret, arg1);
> +    tcg_gen_shr_tl(ret, ret, arg2);
> +    tcg_gen_not_tl(ret, ret);
> +}
> +
>  static void gen_ctzw(TCGv ret, TCGv arg1)
>  {
>      tcg_gen_ori_tl(ret, arg1, (target_ulong)MAKE_64BIT_MASK(32, 32));
> --
> 2.17.1
>
>

