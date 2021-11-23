Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mpP1X-0001R6-Tk
	for mharc-qemu-riscv@gnu.org; Tue, 23 Nov 2021 01:11:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mpP1V-0001MI-Iq; Tue, 23 Nov 2021 01:11:21 -0500
Received: from [2607:f8b0:4864:20::134] (port=38745
 helo=mail-il1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mpP1U-0005kG-13; Tue, 23 Nov 2021 01:11:21 -0500
Received: by mail-il1-x134.google.com with SMTP id j21so15024461ila.5;
 Mon, 22 Nov 2021 22:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0VlDHeKOTsL6ImKFGjbELUE7dX22CTxE5ZeA+FgwdLI=;
 b=gzU6RIG0aKY9VoxTG/bFWC72GvbTQOxF7VT7MTrT9zlqW31YvW5PlDxFHCr3cei7VC
 jaw0sRLEqy8yZEZ0FbdPoDxtQkSSOxXAVMAz06AoOFrs9G6TIuNn+odYcUPqfqlIEItG
 9B9in3aImO+aFwuUBJUUbUIWVtd0jnkiJP6rLHp1PWX3eWdqUKj/EVOL2St2SP3/ZNBJ
 p1li8XArhhnz6rxt2+KeBApOp+fMJ6/2ZPOR7i8eKZfthKUO4cVp6G8e3QWGbIqXlhJM
 B2n5GLi7ncRMqVXZ1ZEc62S0UPWcoVbIv7FLUR0frKw0ehg1gdDz8bSmnELLrrRJS1vB
 dzgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0VlDHeKOTsL6ImKFGjbELUE7dX22CTxE5ZeA+FgwdLI=;
 b=z9Gxn2bexQ7dbMT8TUJAkIqGisHlKly4beqck6gF+GSHM+8PFuXnEvCEp5FnG1RRza
 0UAzI2DN7MucrQO/pcGskcZwRliHefckLhrwes/rpbXEx0HUkFfm2gBdrvLiLUERKMyw
 qfXzgQGtuYaEwXQ9DY2org0poVqEzKi0Nypn/TiqXD6Q8Asgvj+PyoWyDGBow8X4Jmn9
 eWPEtV+GBIG85WmnlInuxaRW04sf/nJlSCynKZMtCuN5HRkJrb+StEHgutxDqjqfGW1V
 RmjJ94vjRUHRlsvqpI0dDgIL0dCaL1edsBZi4o8K+trOy8mx6ivdIBzrXIRCWN3i4PJj
 +zvA==
X-Gm-Message-State: AOAM5321Tk/PGZ2Ql0Z3IntHIaZBh6eQJPp9nI34sO33FbOl+i3GcUSq
 /tf/VqzxxckTOt5w3oxhYyP0yDw4ZPbNAljnpos=
X-Google-Smtp-Source: ABdhPJyHN7+MlrEJz0YYj8emVVs5o4REYVefzidpT6AWjU3pitEUPNQaznVyqQy3b8Khw9WzPi3FohjTR0PylAKJQeo=
X-Received: by 2002:a05:6e02:1e02:: with SMTP id
 g2mr3326639ila.290.1637647878746; 
 Mon, 22 Nov 2021 22:11:18 -0800 (PST)
MIME-Version: 1.0
References: <20211112145902.205131-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211112145902.205131-9-frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <20211112145902.205131-9-frederic.petrot@univ-grenoble-alpes.fr>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 23 Nov 2021 16:10:52 +1000
Message-ID: <CAKmqyKM5-8uO55J6nNewRS9OwzQc7bWxDW+iXeih5egEe9rq1w@mail.gmail.com>
Subject: Re: [PATCH v5 08/18] target/riscv: moving some insns close to similar
 insns
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Fabien Portas <fabien.portas@grenoble-inp.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::134
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x134.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Nov 2021 06:11:22 -0000

On Sat, Nov 13, 2021 at 1:17 AM Fr=C3=A9d=C3=A9ric P=C3=A9trot
<frederic.petrot@univ-grenoble-alpes.fr> wrote:
>
> lwu and ld are functionally close to the other loads, but were after the
> stores in the source file.
> Similarly, xor was away from or and and by two arithmetic functions, whil=
e
> the immediate versions were nicely put together.
> This patch moves the aforementioned loads after lhu, and xor above or,
> where they more logically belong.
>
> Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/riscv/insn_trans/trans_rvi.c.inc | 34 ++++++++++++-------------
>  meson                                   |  2 +-
>  2 files changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
> index 51607b3d40..710f5e6a85 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -176,6 +176,18 @@ static bool trans_lhu(DisasContext *ctx, arg_lhu *a)
>      return gen_load(ctx, a, MO_TEUW);
>  }
>
> +static bool trans_lwu(DisasContext *ctx, arg_lwu *a)
> +{
> +    REQUIRE_64BIT(ctx);
> +    return gen_load(ctx, a, MO_TEUL);
> +}
> +
> +static bool trans_ld(DisasContext *ctx, arg_ld *a)
> +{
> +    REQUIRE_64BIT(ctx);
> +    return gen_load(ctx, a, MO_TEUQ);
> +}
> +
>  static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
>  {
>      TCGv addr =3D get_gpr(ctx, a->rs1, EXT_NONE);
> @@ -207,18 +219,6 @@ static bool trans_sw(DisasContext *ctx, arg_sw *a)
>      return gen_store(ctx, a, MO_TESL);
>  }
>
> -static bool trans_lwu(DisasContext *ctx, arg_lwu *a)
> -{
> -    REQUIRE_64BIT(ctx);
> -    return gen_load(ctx, a, MO_TEUL);
> -}
> -
> -static bool trans_ld(DisasContext *ctx, arg_ld *a)
> -{
> -    REQUIRE_64BIT(ctx);
> -    return gen_load(ctx, a, MO_TEUQ);
> -}
> -
>  static bool trans_sd(DisasContext *ctx, arg_sd *a)
>  {
>      REQUIRE_64BIT(ctx);
> @@ -317,11 +317,6 @@ static bool trans_sltu(DisasContext *ctx, arg_sltu *=
a)
>      return gen_arith(ctx, a, EXT_SIGN, gen_sltu);
>  }
>
> -static bool trans_xor(DisasContext *ctx, arg_xor *a)
> -{
> -    return gen_logic(ctx, a, tcg_gen_xor_tl);
> -}
> -
>  static bool trans_srl(DisasContext *ctx, arg_srl *a)
>  {
>      return gen_shift(ctx, a, EXT_ZERO, tcg_gen_shr_tl);
> @@ -332,6 +327,11 @@ static bool trans_sra(DisasContext *ctx, arg_sra *a)
>      return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl);
>  }
>
> +static bool trans_xor(DisasContext *ctx, arg_xor *a)
> +{
> +    return gen_logic(ctx, a, tcg_gen_xor_tl);
> +}
> +
>  static bool trans_or(DisasContext *ctx, arg_or *a)
>  {
>      return gen_logic(ctx, a, tcg_gen_or_tl);
> diff --git a/meson b/meson
> index 12f9f04ba0..b25d94e7c7 160000
> --- a/meson
> +++ b/meson
> @@ -1 +1 @@
> -Subproject commit 12f9f04ba0decfda425dbbf9a501084c153a2d18
> +Subproject commit b25d94e7c77fda05a7fdfe8afe562cf9760d69da

This shouldn't be here

Alistair

> --
> 2.33.1
>
>

