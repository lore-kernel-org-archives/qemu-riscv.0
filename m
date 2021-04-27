Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lbGos-0001lV-UQ
	for mharc-qemu-riscv@gnu.org; Tue, 27 Apr 2021 02:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lbGoq-0001il-KX; Tue, 27 Apr 2021 02:03:36 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:33754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lbGom-0008DS-R8; Tue, 27 Apr 2021 02:03:36 -0400
Received: by mail-io1-xd31.google.com with SMTP id a11so6127531ioo.0;
 Mon, 26 Apr 2021 23:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wrPA7TwF6Fy1CaGZHBJbZtEH3Mi7HdXw8RX9lEBKjBI=;
 b=WjhmXr/KwQS9ZAWDh5av9dzq7Tb99NNrG1JVEBFLYYuTHRPC0bZXmrY0lJo84cTtOl
 EhiA+dD83OV6I1Jjy5bbugCodinad7xxyiMg2cmG8HMbDdmxa4qsRooxmttEVKC6drl2
 Aj6FRaM+MWZNzW4iAxIPoHwe3BUQ16m5J8IvmCb3RkrxXBJpVB3itVMP5S8dtLlPegLR
 x88eE0H7V/bpfms++9TABfxLuK2/+3ncUQV3ZklGyzJS9B7dI4cBx4+whg5EdWlGyDe1
 7smfcvX5hLD2zhQNezgbblMl4QGuka7tGdjZyuvmFqimHCnmwxKzjuIYudxcLRsKL4W6
 SewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wrPA7TwF6Fy1CaGZHBJbZtEH3Mi7HdXw8RX9lEBKjBI=;
 b=ciIeAy6aJw4HnoTjXeJbm48YHhx6/+0X6etZpOcw/JyH9yHRNdS/ngAzCKfjS10WxF
 RzLGMRA8jPKzO8q7QnZVI1k4g2TH/f61unSJkRrCJgVp17WZjCFnvJATBQE2dr0JhsF8
 qFRzkOYQ8Xg7yDpndUz26tzjGkTOsI2AWVjA98quOSMfL9WOq5e8qeSUeb73gYpMhx4a
 AjRTIH3LCsqg9YEKRC5EUgeLFuxzjeCUXTz0m0OoIERe3hYGVWzPIGs6XmM7YkvSCC1r
 NAH075qroKOLkpy3aRxYGlncyIoel7EfgcmfOjXN1VcDK7RulEX7pVJnPEs6vwAYgZ1g
 zmIw==
X-Gm-Message-State: AOAM533UrVFLbnG00PzfsaV0aMl3tED/bk/2j5DKe8FCu1INQlkJ/iqr
 iFAF2CxkPTdIH9J9Z9ZjEGLnQ5o+eTv6+D50RYM=
X-Google-Smtp-Source: ABdhPJx+Bc3E+RAt9I4Ch9wYyM2FutGFr2Jnu/7/sfkFNqLIv99BwlE1bXgM4uQCVqlOG8ijqHE6ZBx6Ph3p2Nn/Et4=
X-Received: by 2002:a05:6602:180c:: with SMTP id
 t12mr11495681ioh.42.1619503410587; 
 Mon, 26 Apr 2021 23:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210421041400.22243-1-frank.chang@sifive.com>
 <20210421041400.22243-4-frank.chang@sifive.com>
In-Reply-To: <20210421041400.22243-4-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 27 Apr 2021 16:03:04 +1000
Message-ID: <CAKmqyKNeQnxpyb-1gNWa41dmGkOSm8DeUGNwdHyZebLsicP1Xg@mail.gmail.com>
Subject: Re: [PATCH v5 03/17] target/riscv: rvb: count bits set
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
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
X-List-Received-Date: Tue, 27 Apr 2021 06:03:37 -0000

On Wed, Apr 21, 2021 at 2:18 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn32-64.decode           |  1 +
>  target/riscv/insn32.decode              |  1 +
>  target/riscv/insn_trans/trans_rvb.c.inc | 12 ++++++++++++
>  target/riscv/translate.c                |  6 ++++++
>  4 files changed, 20 insertions(+)
>
> diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
> index f4c42720fc7..89498a9a28a 100644
> --- a/target/riscv/insn32-64.decode
> +++ b/target/riscv/insn32-64.decode
> @@ -90,3 +90,4 @@ hsv_d     0110111  .....   ..... 100 00000 1110011 @r2_s
>  # *** RV64B Standard Extension (in addition to RV32B) ***
>  clzw       0110000 00000 ..... 001 ..... 0011011 @r2
>  ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
> +cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 8fe838cf0d0..0e321da37f4 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -597,3 +597,4 @@ vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
>  # *** RV32B Standard Extension ***
>  clz        011000 000000 ..... 001 ..... 0010011 @r2
>  ctz        011000 000001 ..... 001 ..... 0010011 @r2
> +cpop       011000 000010 ..... 001 ..... 0010011 @r2
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index 76788c2f353..dbbd94e1015 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -29,6 +29,12 @@ static bool trans_ctz(DisasContext *ctx, arg_ctz *a)
>      return gen_unary(ctx, a, gen_ctz);
>  }
>
> +static bool trans_cpop(DisasContext *ctx, arg_cpop *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_unary(ctx, a, tcg_gen_ctpop_tl);
> +}
> +
>  /* RV64-only instructions */
>  #ifdef TARGET_RISCV64
>
> @@ -44,4 +50,10 @@ static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a)
>      return gen_unary(ctx, a, gen_ctzw);
>  }
>
> +static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_unary(ctx, a, gen_cpopw);
> +}
> +
>  #endif
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 4648c422f42..b20a58c63b4 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -551,6 +551,12 @@ static void gen_clzw(TCGv ret, TCGv arg1)
>      tcg_gen_subi_i64(ret, ret, 32);
>  }
>
> +static void gen_cpopw(TCGv ret, TCGv arg1)
> +{
> +    tcg_gen_ext32u_tl(arg1, arg1);
> +    tcg_gen_ctpop_tl(ret, arg1);
> +}
> +
>  #endif
>
>  static bool gen_arith(DisasContext *ctx, arg_r *a,
> --
> 2.17.1
>
>

