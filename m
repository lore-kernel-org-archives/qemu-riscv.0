Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lbGsJ-0004WI-Fp
	for mharc-qemu-riscv@gnu.org; Tue, 27 Apr 2021 02:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lbGsE-0004UA-Op; Tue, 27 Apr 2021 02:07:06 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:36591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lbGs9-0001YJ-Ob; Tue, 27 Apr 2021 02:07:06 -0400
Received: by mail-il1-x136.google.com with SMTP id p15so12935733iln.3;
 Mon, 26 Apr 2021 23:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qyEH9SqsCJ2OV07r/M1nS4yBPuNlD/2JhuHC6IPsU+Y=;
 b=Fw9QNtwTjmbNUpSUrlDdZzcwXTAKmpE8MupnSWCnfEHdqy/3A7FfbIGbVrnX0llzxS
 MaYcMwbFbeHj0y/CTxQ/utH2bFFBCuLlsui/SmEQI0dwUGtkrx14Yq6bSreF3Qn9hdHN
 HiJDmXNEgOFoXw1GM67aRHfofYFo/eyCW6hfbXnXNE/lh42pGYVop599B3yobXkuYYsk
 5zVDegcrkH8lzErhaG63rgG6j6oORm/zHiYwZfdZtvz6nC5yEBSOXYkXUi9LAHEpuM1P
 E9Uoa8NnL8m1yCx5+21pw9Eh9ng/c+Iv0I3DlZGewWzSHKmm9bNxbnrOg751ANBEm9VY
 09xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qyEH9SqsCJ2OV07r/M1nS4yBPuNlD/2JhuHC6IPsU+Y=;
 b=nRtqm3L3SEPqqInVrlXVa4A2+Ws+9d5tw3X8+F1RrySLSK4wDdCI3CEEyZRrT3qUQE
 Q8z/m85hSIhNAp7PyZ4Dvs6oHXbzicPSt50oQRr+ajBjJG/5bjJmRYqKnCx+mK7xL4Eh
 JUD8eb10zKMKIoih+lIrvOXA4ogzYAUkJW3wlroaOtKMv5TKoZak5upQ7RxaVUcUWCqa
 IVrmvkcj6TDBnYdjhKWZJB/Cob4tPKeJkX0GPdbDLU3WXVnKtFGjriiJqguNNX2qqD/v
 8gzGx2i6NZ88Gp58Hoxj4UCHAnJMcecC+KzPNnGaBsn2deZpMfF8oF4bUEe1JveG6+Rq
 frBQ==
X-Gm-Message-State: AOAM532yYQqtTRakTZ97zK55kgMkKmkVScPFbyeOp3XHxMaiBwyAoIkj
 5Mey2k2b+o4DsImEXx5zao9Kl9FlGsvVXCcNNd8=
X-Google-Smtp-Source: ABdhPJxWgH/Hhh1+nk44xFln2pNxKEiHJ2TYs2ZWoFxkahOaZ3gSwwh/Wpo2lFqp9GjTqvUSpxh83ZdAQHviwOo6SMQ=
X-Received: by 2002:a92:d90f:: with SMTP id s15mr16946997iln.227.1619503620488; 
 Mon, 26 Apr 2021 23:07:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210421041400.22243-1-frank.chang@sifive.com>
 <20210421041400.22243-8-frank.chang@sifive.com>
In-Reply-To: <20210421041400.22243-8-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 27 Apr 2021 16:06:33 +1000
Message-ID: <CAKmqyKPPQYr+chW7ndT_P1u+vzqNf-v8YhptJ_O=pmcqmo6TsQ@mail.gmail.com>
Subject: Re: [PATCH v5 07/17] target/riscv: rvb: sign-extend instructions
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
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
X-List-Received-Date: Tue, 27 Apr 2021 06:07:08 -0000

On Wed, Apr 21, 2021 at 2:20 PM <frank.chang@sifive.com> wrote:
>
> From: Kito Cheng <kito.cheng@sifive.com>
>
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn32.decode              |  2 ++
>  target/riscv/insn_trans/trans_rvb.c.inc | 12 ++++++++++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index d64326fd864..938c23088eb 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -598,6 +598,8 @@ vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
>  clz        011000 000000 ..... 001 ..... 0010011 @r2
>  ctz        011000 000001 ..... 001 ..... 0010011 @r2
>  cpop       011000 000010 ..... 001 ..... 0010011 @r2
> +sext_b     011000 000100 ..... 001 ..... 0010011 @r2
> +sext_h     011000 000101 ..... 001 ..... 0010011 @r2
>
>  andn       0100000 .......... 111 ..... 0110011 @r
>  orn        0100000 .......... 110 ..... 0110011 @r
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index 2aa4515fe31..1496996a660 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -95,6 +95,18 @@ static bool trans_maxu(DisasContext *ctx, arg_maxu *a)
>      return gen_arith(ctx, a, tcg_gen_umax_tl);
>  }
>
> +static bool trans_sext_b(DisasContext *ctx, arg_sext_b *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_unary(ctx, a, tcg_gen_ext8s_tl);
> +}
> +
> +static bool trans_sext_h(DisasContext *ctx, arg_sext_h *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_unary(ctx, a, tcg_gen_ext16s_tl);
> +}
> +
>  /* RV64-only instructions */
>  #ifdef TARGET_RISCV64
>
> --
> 2.17.1
>
>

