Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lbGqI-0002Ts-68
	for mharc-qemu-riscv@gnu.org; Tue, 27 Apr 2021 02:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lbGqE-0002T9-Nh; Tue, 27 Apr 2021 02:05:02 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:43877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lbGq9-0000Op-IQ; Tue, 27 Apr 2021 02:05:01 -0400
Received: by mail-io1-xd31.google.com with SMTP id v123so7438744ioe.10;
 Mon, 26 Apr 2021 23:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j82ZBCFtmFpGtfZbd/wkotfSV6p9ejvuZathFY8Cwbs=;
 b=EbPKHWwyXTw4FJU6ixqZ7TtdVm3wbYLNNb9i5YuRGwIQlTInTonSkuYV7GJ29IsYP4
 V+wVPPYHZHAedw86OBrKDXdevL0MKudcmGecpYEVnorKlNobYHK3TxaVcR6ajX3NqvZ0
 a9vKe2ErzwP4T8A48zKjtViHFZmzDckuM9VptGtFOqcXgxZsSoIfvGD1o0LOG/atkFFG
 Rgt77sLZqi6X8HIp6HejHHX6vUSlevDwD1GNPnpS7bpnujGyZEaUcxfOpJoTl3hhOKJe
 rsyXhdcSpSQbmat07diAbbKgPyUVvvZGWb572YTYlVKwpYb6syqFfmCRu43Xh5NuHQOD
 KSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j82ZBCFtmFpGtfZbd/wkotfSV6p9ejvuZathFY8Cwbs=;
 b=QXXB0dAJdp1E1z5Kj1PA5se4xPbXX09Iw9K9h4hqoOVkOZyimo1PBQgx7E6O22KENr
 dpGnmVbA9X10KdUMD90FSglvOWi7q/iwp46oflCe5FIejwZwmp+NgW/hq93RY6Idn4Mg
 rjrsJCNKxJ8FIGIOmdibCD2PDPt2mQ5upE0AKJ9BYiHKdcEUyGZrgw0Guc2aAav4uk+F
 bd6JKEF4J/Vb+NhqXtqch9xuxutdnzD4wGyBv7OqR26CWZjPOtplNxJEp0bdZitvfuJT
 6RAbx732obdYg7ciW0VRaKj34Zzwdn8EBu7LuOgiS9aAsLodVAo9778I2DohfZim/Eu4
 QxBw==
X-Gm-Message-State: AOAM533HVeUFOQjhcsQGzX4+zRswmVTDKoc8g6mPi3Da32NeNW7tZGu2
 6x96sXFpQa86N+x5dn+4oQrPIUgiH7nA8gLqW2/37/yy+c4=
X-Google-Smtp-Source: ABdhPJzKDxyyG0F07MPCqspd4MEBFCEHeYWAu2FlA1nG//F15SHYt3/JiIzRWeVVZ04IIFT0DrwEc8ooWNTTw8y4+3I=
X-Received: by 2002:a5d:878e:: with SMTP id f14mr18030272ion.176.1619503495085; 
 Mon, 26 Apr 2021 23:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210421041400.22243-1-frank.chang@sifive.com>
 <20210421041400.22243-5-frank.chang@sifive.com>
In-Reply-To: <20210421041400.22243-5-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 27 Apr 2021 16:04:28 +1000
Message-ID: <CAKmqyKMMOoZhcJe2KCZ=nFFd38M46td6v-KibUDFqWaS+XNoRA@mail.gmail.com>
Subject: Re: [PATCH v5 04/17] target/riscv: rvb: logic-with-negate
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
X-List-Received-Date: Tue, 27 Apr 2021 06:05:04 -0000

On Wed, Apr 21, 2021 at 2:17 PM <frank.chang@sifive.com> wrote:
>
> From: Kito Cheng <kito.cheng@sifive.com>
>
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn32.decode              |  4 ++++
>  target/riscv/insn_trans/trans_rvb.c.inc | 18 ++++++++++++++++++
>  2 files changed, 22 insertions(+)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 0e321da37f4..d0b3f109b4e 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -598,3 +598,7 @@ vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
>  clz        011000 000000 ..... 001 ..... 0010011 @r2
>  ctz        011000 000001 ..... 001 ..... 0010011 @r2
>  cpop       011000 000010 ..... 001 ..... 0010011 @r2
> +
> +andn       0100000 .......... 111 ..... 0110011 @r
> +orn        0100000 .......... 110 ..... 0110011 @r
> +xnor       0100000 .......... 100 ..... 0110011 @r
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index dbbd94e1015..73c4693a263 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -35,6 +35,24 @@ static bool trans_cpop(DisasContext *ctx, arg_cpop *a)
>      return gen_unary(ctx, a, tcg_gen_ctpop_tl);
>  }
>
> +static bool trans_andn(DisasContext *ctx, arg_andn *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_arith(ctx, a, tcg_gen_andc_tl);
> +}
> +
> +static bool trans_orn(DisasContext *ctx, arg_orn *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_arith(ctx, a, tcg_gen_orc_tl);
> +}
> +
> +static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_arith(ctx, a, tcg_gen_eqv_tl);
> +}
> +
>  /* RV64-only instructions */
>  #ifdef TARGET_RISCV64
>
> --
> 2.17.1
>
>

