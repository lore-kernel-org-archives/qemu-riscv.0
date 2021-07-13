Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m39m0-0007ap-6Z
	for mharc-qemu-riscv@gnu.org; Tue, 13 Jul 2021 00:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m39ly-0007X5-13; Tue, 13 Jul 2021 00:11:54 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:42512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m39lw-0004mc-GA; Tue, 13 Jul 2021 00:11:53 -0400
Received: by mail-io1-xd30.google.com with SMTP id x10so6647420ion.9;
 Mon, 12 Jul 2021 21:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O3K1OjamQzEuGDpKoBgiSg1CQAV3h1YVVi0i3VMb/90=;
 b=GnwYNX6K1pIt6CLY/WMPfGQD/UsFIHx90+AvrOLNAelHGPelUCqYCMY6fV+gU57rIR
 441nsVkGy0a/bt9EYX1xpjoonEEPSMtkBUgyf6XUqk6690VuZM0fL4yDY+VrHBJ0GZOb
 lvHWlqKQQOnsgrS1F2ajPMXjnSYrnWtHYNG+PuFayau5zrT/OWTumpt3jXC41EhwIdEV
 xuM4y/UNurOTroDoYcBNrWsjKmW42mN419b4EhyonOgKK9KsU02m6Bp9vT3+Z0Jow71r
 XMD0O5bI1pQOJFFeY2htExJ1QgBUEBsqwMI+hu8iaIYzVDKoezbPT9NueMVSygU3K1Zj
 NXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O3K1OjamQzEuGDpKoBgiSg1CQAV3h1YVVi0i3VMb/90=;
 b=stneu+Kk85qV7DbM3CDn25y18BYavghGeGxjqHyiv+g0l+65PuhlppklRtxgiLN1/4
 x7QEe+3liFxmCNvurChED+KqR+EZBlOcCxP9pdhl0ppbFZZaWycHxGNvnfCXZ2N64dgE
 4j/7ZJMuSTqdI9UPtSdwcaGndEp0EdJh1g+8rni9TGDyb7umYS7j/Jizh2+a9y8V/kCm
 U8/B7IHyr6XYHrpuqsqzqRrzrPHt/QFotP4QWvS429fgQT542W79zMmUXnf0mxzO+HUX
 pjtRGPC302K/Wc8kiSOW5+Q1heknGfzb2lFHs/ETh7OEENH8XfVQYmWI87AmFqzUQPIJ
 OzPw==
X-Gm-Message-State: AOAM531R9v5WjpHVa/5FEBGptCKj/rMT2xJPXW295TLvK4kx5rlJJpah
 jqWsnDPRn90Q/ZOx1XIor2kJBuht44TjjUFlO9A=
X-Google-Smtp-Source: ABdhPJwBvTNvGn7gJD6x2Fpu8KlEnLLzmfryohRTr9k63qKblvwCaLiThkMAGPC1b4WRRFB9CHJKiXDDHRHF/mwz7r0=
X-Received: by 2002:a6b:7905:: with SMTP id i5mr1751626iop.175.1626149510995; 
 Mon, 12 Jul 2021 21:11:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210709042608.883256-1-richard.henderson@linaro.org>
 <20210709042608.883256-5-richard.henderson@linaro.org>
In-Reply-To: <20210709042608.883256-5-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 13 Jul 2021 14:11:25 +1000
Message-ID: <CAKmqyKOTh8bWQqzEy1AoOsMpEEo1iuFW-BPAU+TFVstsnnc7fg@mail.gmail.com>
Subject: Re: [PATCH 04/17] target/riscv: Use gpr_{src,
 dst} in word division operations
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
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
X-List-Received-Date: Tue, 13 Jul 2021 04:11:54 -0000

On Fri, Jul 9, 2021 at 2:44 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Allocate new temps to hold the source extensions, and
> extend directly from the source registers.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c | 46 +++++++++++++++++++---------------------
>  1 file changed, 22 insertions(+), 24 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index a60b198623..7dedfd548b 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -502,42 +502,40 @@ static void gen_mulw(TCGv ret, TCGv arg1, TCGv arg2)
>  static bool gen_arith_div_w(DisasContext *ctx, arg_r *a,
>                              void(*func)(TCGv, TCGv, TCGv))
>  {
> -    TCGv source1, source2;
> -    source1 = tcg_temp_new();
> -    source2 = tcg_temp_new();
> +    TCGv dest = gpr_dst(ctx, a->rd);
> +    TCGv src1 = gpr_src(ctx, a->rs1);
> +    TCGv src2 = gpr_src(ctx, a->rs2);
> +    TCGv ext1 = tcg_temp_new();
> +    TCGv ext2 = tcg_temp_new();
>
> -    gen_get_gpr(source1, a->rs1);
> -    gen_get_gpr(source2, a->rs2);
> -    tcg_gen_ext32s_tl(source1, source1);
> -    tcg_gen_ext32s_tl(source2, source2);
> +    tcg_gen_ext32s_tl(ext1, src1);
> +    tcg_gen_ext32s_tl(ext2, src2);
>
> -    (*func)(source1, source1, source2);
> +    (*func)(dest, ext1, ext2);
> +    tcg_temp_free(ext1);
> +    tcg_temp_free(ext2);
>
> -    tcg_gen_ext32s_tl(source1, source1);
> -    gen_set_gpr(a->rd, source1);
> -    tcg_temp_free(source1);
> -    tcg_temp_free(source2);
> +    tcg_gen_ext32s_tl(dest, dest);
>      return true;
>  }
>
>  static bool gen_arith_div_uw(DisasContext *ctx, arg_r *a,
>                              void(*func)(TCGv, TCGv, TCGv))
>  {
> -    TCGv source1, source2;
> -    source1 = tcg_temp_new();
> -    source2 = tcg_temp_new();
> +    TCGv dest = gpr_dst(ctx, a->rd);
> +    TCGv src1 = gpr_src(ctx, a->rs1);
> +    TCGv src2 = gpr_src(ctx, a->rs2);
> +    TCGv ext1 = tcg_temp_new();
> +    TCGv ext2 = tcg_temp_new();
>
> -    gen_get_gpr(source1, a->rs1);
> -    gen_get_gpr(source2, a->rs2);
> -    tcg_gen_ext32u_tl(source1, source1);
> -    tcg_gen_ext32u_tl(source2, source2);
> +    tcg_gen_ext32u_tl(ext1, src1);
> +    tcg_gen_ext32u_tl(ext2, src2);
>
> -    (*func)(source1, source1, source2);
> +    (*func)(dest, ext1, ext2);
> +    tcg_temp_free(ext1);
> +    tcg_temp_free(ext2);
>
> -    tcg_gen_ext32s_tl(source1, source1);
> -    gen_set_gpr(a->rd, source1);
> -    tcg_temp_free(source1);
> -    tcg_temp_free(source2);
> +    tcg_gen_ext32s_tl(dest, dest);
>      return true;
>  }
>
> --
> 2.25.1
>
>

