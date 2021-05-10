Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lg0IB-0007X4-Fs
	for mharc-qemu-riscv@gnu.org; Mon, 10 May 2021 03:25:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lg0I9-0007VY-PP; Mon, 10 May 2021 03:25:25 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:45019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lg0I6-00063p-WC; Mon, 10 May 2021 03:25:25 -0400
Received: by mail-il1-x132.google.com with SMTP id w13so1078841ilv.11;
 Mon, 10 May 2021 00:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M09Usr4CwkpPHK5Tr8jqz192WCB6Iq9Fn+BxYQksCBI=;
 b=pajVyZVlvz/1381r1vdStEvJfYWm9k1Hn38BD3Eo6AyHVPEmoHeXTjMOg1gMnir+Xk
 9XHGdwvsoUzqPc3QMLNSLMqcpdI+0FT9ZtFOOS5uPAGThZPRwbbqsNyaFNAwnkP94I3i
 RJOirs/t9ldl4bGiOIQXluNgZsKmRyc/FwzZwxB612AzDDvsqVHiDJZ/ctROR1gR+NU0
 29mGXClXXjjv43fAhZfMYHXb8jiICoCfLTkvj3OTdPxgFMZx78WI/jEoKd2UDGyTLf+5
 pQrTZ0ziSydWr1JA8+TdUwjX+pDJZ4azWV9jq+fO8vGH9ECfbURcsA5HoDtXVHyFoTgF
 8B6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M09Usr4CwkpPHK5Tr8jqz192WCB6Iq9Fn+BxYQksCBI=;
 b=YQdK6wKssuKmDw+aZ7mWGcze99TeKnsrbyA/i9eY3tYftwCv+hunH2BKcce+e0cdU3
 GpfiVp1Bp20tvQVfWyTBEyOMJorLe/EzKQ7VZhy4JgjEvT3qXvv26wvb63FfjqsyP8sb
 pWmKrCdyNiIA9QUoylotRf9Mzs9O1oq8YDAND8r2I2R7iDmlgJl0e2t21KiCJ8DSX95l
 4fx2K6QE2oArKZYiuMkbyl9Y+XfEzK3NPcD+n66nWZRDKArrkrXMRll5BZIfO9//xqvs
 0WppdDxD0gwrL3g5lzyUYlp4j1g8q1/BFeRFsx0R8WVi6QgmkBmZfON7EDpR88BeJldf
 ezpA==
X-Gm-Message-State: AOAM531tDpRH70O8K5fYYblZGAYM4mKr802hifIxAPESoyHe3pfIk0fd
 x7P1j6VOyKFHWYAaipsqLS0FAsg6VIg8v/4+CmP9a48j/N4mNA==
X-Google-Smtp-Source: ABdhPJyIfDk8zA+2/W7PolZiAZ+apYaeqxvm/E0C/Q+H6UHkY709+3bsLYpqTJaLFGh60IM8N07Cdd+Jnnoaj+G1F4M=
X-Received: by 2002:a05:6e02:6ca:: with SMTP id
 p10mr16716187ils.131.1620631521411; 
 Mon, 10 May 2021 00:25:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210505160620.15723-1-frank.chang@sifive.com>
 <20210505160620.15723-10-frank.chang@sifive.com>
In-Reply-To: <20210505160620.15723-10-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 May 2021 17:24:54 +1000
Message-ID: <CAKmqyKPCouiBhe=oFQE8jyLVGGsmb_v2A=YUVYdRZQxbnPF8mA@mail.gmail.com>
Subject: Re: [PATCH v6 09/17] target/riscv: rvb: single-bit instructions
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x132.google.com
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
X-List-Received-Date: Mon, 10 May 2021 07:25:26 -0000

On Thu, May 6, 2021 at 2:39 AM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn32.decode              | 17 +++++
>  target/riscv/insn_trans/trans_rvb.c.inc | 97 +++++++++++++++++++++++++
>  target/riscv/translate.c                | 61 ++++++++++++++++
>  3 files changed, 175 insertions(+)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 93619846349..433b601b934 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -676,6 +676,15 @@ min        0000101 .......... 100 ..... 0110011 @r
>  minu       0000101 .......... 101 ..... 0110011 @r
>  max        0000101 .......... 110 ..... 0110011 @r
>  maxu       0000101 .......... 111 ..... 0110011 @r
> +bset       0010100 .......... 001 ..... 0110011 @r
> +bclr       0100100 .......... 001 ..... 0110011 @r
> +binv       0110100 .......... 001 ..... 0110011 @r
> +bext       0100100 .......... 101 ..... 0110011 @r
> +
> +bseti      00101. ........... 001 ..... 0010011 @sh
> +bclri      01001. ........... 001 ..... 0010011 @sh
> +binvi      01101. ........... 001 ..... 0010011 @sh
> +bexti      01001. ........... 101 ..... 0010011 @sh
>
>  # *** RV64B Standard Extension (in addition to RV32B) ***
>  clzw       0110000 00000 ..... 001 ..... 0011011 @r2
> @@ -684,3 +693,11 @@ cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
>
>  packw      0000100 .......... 100 ..... 0111011 @r
>  packuw     0100100 .......... 100 ..... 0111011 @r
> +bsetw      0010100 .......... 001 ..... 0111011 @r
> +bclrw      0100100 .......... 001 ..... 0111011 @r
> +binvw      0110100 .......... 001 ..... 0111011 @r
> +bextw      0100100 .......... 101 ..... 0111011 @r
> +
> +bsetiw     0010100 .......... 001 ..... 0011011 @sh5
> +bclriw     0100100 .......... 001 ..... 0011011 @sh5
> +binviw     0110100 .......... 001 ..... 0011011 @sh5
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index 3d594e8cb40..69e5af44a18 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -107,6 +107,54 @@ static bool trans_sext_h(DisasContext *ctx, arg_sext_h *a)
>      return gen_unary(ctx, a, tcg_gen_ext16s_tl);
>  }
>
> +static bool trans_bset(DisasContext *ctx, arg_bset *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_shift(ctx, a, gen_bset);
> +}
> +
> +static bool trans_bseti(DisasContext *ctx, arg_bseti *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_shifti(ctx, a, gen_bset);
> +}
> +
> +static bool trans_bclr(DisasContext *ctx, arg_bclr *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_shift(ctx, a, gen_bclr);
> +}
> +
> +static bool trans_bclri(DisasContext *ctx, arg_bclri *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_shifti(ctx, a, gen_bclr);
> +}
> +
> +static bool trans_binv(DisasContext *ctx, arg_binv *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_shift(ctx, a, gen_binv);
> +}
> +
> +static bool trans_binvi(DisasContext *ctx, arg_binvi *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_shifti(ctx, a, gen_binv);
> +}
> +
> +static bool trans_bext(DisasContext *ctx, arg_bext *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_shift(ctx, a, gen_bext);
> +}
> +
> +static bool trans_bexti(DisasContext *ctx, arg_bexti *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_shifti(ctx, a, gen_bext);
> +}
> +
>  static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
>  {
>      REQUIRE_64BIT(ctx);
> @@ -141,3 +189,52 @@ static bool trans_packuw(DisasContext *ctx, arg_packuw *a)
>      REQUIRE_EXT(ctx, RVB);
>      return gen_arith(ctx, a, gen_packuw);
>  }
> +
> +static bool trans_bsetw(DisasContext *ctx, arg_bsetw *a)
> +{
> +    REQUIRE_64BIT(ctx);
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_shiftw(ctx, a, gen_bset);
> +}
> +
> +static bool trans_bsetiw(DisasContext *ctx, arg_bsetiw *a)
> +{
> +    REQUIRE_64BIT(ctx);
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_shiftiw(ctx, a, gen_bset);
> +}
> +
> +static bool trans_bclrw(DisasContext *ctx, arg_bclrw *a)
> +{
> +    REQUIRE_64BIT(ctx);
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_shiftw(ctx, a, gen_bclr);
> +}
> +
> +static bool trans_bclriw(DisasContext *ctx, arg_bclriw *a)
> +{
> +    REQUIRE_64BIT(ctx);
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_shiftiw(ctx, a, gen_bclr);
> +}
> +
> +static bool trans_binvw(DisasContext *ctx, arg_binvw *a)
> +{
> +    REQUIRE_64BIT(ctx);
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_shiftw(ctx, a, gen_binv);
> +}
> +
> +static bool trans_binviw(DisasContext *ctx, arg_binviw *a)
> +{
> +    REQUIRE_64BIT(ctx);
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_shiftiw(ctx, a, gen_binv);
> +}
> +
> +static bool trans_bextw(DisasContext *ctx, arg_bextw *a)
> +{
> +    REQUIRE_64BIT(ctx);
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_shiftw(ctx, a, gen_bext);
> +}
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 292cf09932d..e12240d1255 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -571,6 +571,48 @@ static void gen_packh(TCGv ret, TCGv arg1, TCGv arg2)
>      tcg_temp_free(t);
>  }
>
> +static void gen_sbop_mask(TCGv ret, TCGv shamt)
> +{
> +    tcg_gen_movi_tl(ret, 1);
> +    tcg_gen_shl_tl(ret, ret, shamt);
> +}
> +
> +static void gen_bset(TCGv ret, TCGv arg1, TCGv shamt)
> +{
> +    TCGv t = tcg_temp_new();
> +
> +    gen_sbop_mask(t, shamt);
> +    tcg_gen_or_tl(ret, arg1, t);
> +
> +    tcg_temp_free(t);
> +}
> +
> +static void gen_bclr(TCGv ret, TCGv arg1, TCGv shamt)
> +{
> +    TCGv t = tcg_temp_new();
> +
> +    gen_sbop_mask(t, shamt);
> +    tcg_gen_andc_tl(ret, arg1, t);
> +
> +    tcg_temp_free(t);
> +}
> +
> +static void gen_binv(TCGv ret, TCGv arg1, TCGv shamt)
> +{
> +    TCGv t = tcg_temp_new();
> +
> +    gen_sbop_mask(t, shamt);
> +    tcg_gen_xor_tl(ret, arg1, t);
> +
> +    tcg_temp_free(t);
> +}
> +
> +static void gen_bext(TCGv ret, TCGv arg1, TCGv shamt)
> +{
> +    tcg_gen_shr_tl(ret, arg1, shamt);
> +    tcg_gen_andi_tl(ret, ret, 1);
> +}
> +
>  static void gen_ctzw(TCGv ret, TCGv arg1)
>  {
>      tcg_gen_ori_tl(ret, arg1, (target_ulong)MAKE_64BIT_MASK(32, 32));
> @@ -673,6 +715,25 @@ static bool gen_shifti(DisasContext *ctx, arg_shift *a,
>      return true;
>  }
>
> +static bool gen_shiftw(DisasContext *ctx, arg_r *a,
> +                       void(*func)(TCGv, TCGv, TCGv))
> +{
> +    TCGv source1 = tcg_temp_new();
> +    TCGv source2 = tcg_temp_new();
> +
> +    gen_get_gpr(source1, a->rs1);
> +    gen_get_gpr(source2, a->rs2);
> +
> +    tcg_gen_andi_tl(source2, source2, 31);
> +    (*func)(source1, source1, source2);
> +    tcg_gen_ext32s_tl(source1, source1);
> +
> +    gen_set_gpr(a->rd, source1);
> +    tcg_temp_free(source1);
> +    tcg_temp_free(source2);
> +    return true;
> +}
> +
>  static bool gen_shiftiw(DisasContext *ctx, arg_shift *a,
>                          void(*func)(TCGv, TCGv, TCGv))
>  {
> --
> 2.17.1
>
>

