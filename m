Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1msOoR-0006dB-CW
	for mharc-qemu-riscv@gnu.org; Wed, 01 Dec 2021 07:34:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1msOoK-0006bk-SP; Wed, 01 Dec 2021 07:34:12 -0500
Received: from [2607:f8b0:4864:20::d2e] (port=40511
 helo=mail-io1-xd2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1msOoI-0006Bc-W3; Wed, 01 Dec 2021 07:34:08 -0500
Received: by mail-io1-xd2e.google.com with SMTP id p23so30552875iod.7;
 Wed, 01 Dec 2021 04:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=D6o1Ji1HKAF6wrxPPDsvDiar7aiDkhu0lf67UxZYEjA=;
 b=SYPNNiJcuE2Is89gnyFqFDFuaaYTCnj6MC3MGeHOVG8zQ4SEYtgcR2ojiVpGPHxwJZ
 3Jujcb+EH9PkGL9KnKFqgE1u2MXZwnS7o4mMu+rWAKbDdXDiD8gzZMzucEPWzOkWDIe1
 ECHwtdHtIVmdZzLVhNIwzd2UqXh2HzrMpdSeUF+Ss3svB/TGSuKvBWs1p+P1BOdn/YZk
 YNHEpD5Vv273AkvG8L2EWrtVvQswKNvpRyg9wO+7JvHi1mljI8o9k9TJ07cWgHxESQIB
 16DsYIEtN7S5FOTnxqGbFfhGwn6GR3W/e5U4eo4wAQceQru7GHm3e37aWTJn4ZRhfpSp
 ZkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=D6o1Ji1HKAF6wrxPPDsvDiar7aiDkhu0lf67UxZYEjA=;
 b=ez27zaL1hqjaDVKEROUMXO8kCnhNjw4j7tZn24qhg8/01bKfEXlI0SPhCk2U9k10+Y
 0Jq7v/aaD42uCxyU3Gxb+v1/88voSLq9A+0XmpG/Brs5pVRaLUmOAP+Nm+6DgJhnSbKh
 oNw7m3gJO+9Q74B65PaeCshAKWS0t9B7RpqgSMEE6IV0oPR1TjkY1zp+rdpaDEf1NW2m
 2Atr2CTwVRoF47QosRCP/8xTd9cTxtH8ED0nvzxqmz8ZAc/PIyHLp8v7lSKwU5r5R5Tj
 SnrOKLk51fb8s7l0P5wRCa4cjcZb6rk2FFSoaUUH+21upKyzhHWDy+WWzo50qqbOMPiO
 Facg==
X-Gm-Message-State: AOAM531DRBUpio5iNfkO2GmZzPTeQL5mzXLUvO8YBRv2LmjLx8EdriWa
 7AbB9YMtVJ9aJhZv8L6ByOFaKZyH0nW0md2MRbQ=
X-Google-Smtp-Source: ABdhPJyT1OKa3/ZlrFKUpCs+YXCXnM0y3hXPrje+zra7SDxWChCHuWOO8jGfLNzCDjAnTw3GEXSe09WGgf4meRBywMU=
X-Received: by 2002:a6b:6802:: with SMTP id d2mr7901599ioc.187.1638362044868; 
 Wed, 01 Dec 2021 04:34:04 -0800 (PST)
MIME-Version: 1.0
References: <20211128135719.50444-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211128135719.50444-9-frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <20211128135719.50444-9-frederic.petrot@univ-grenoble-alpes.fr>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 1 Dec 2021 22:33:39 +1000
Message-ID: <CAKmqyKNWUqi3iV-CAC+zKsz+5As_9jdMmZGJf=bfsqfJLbrFLg@mail.gmail.com>
Subject: Re: [PATCH v6 08/18] target/riscv: moving some insns close to similar
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
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
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
X-List-Received-Date: Wed, 01 Dec 2021 12:34:13 -0000

On Mon, Nov 29, 2021 at 12:05 AM Fr=C3=A9d=C3=A9ric P=C3=A9trot
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvi.c.inc | 34 ++++++++++++-------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
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
> --
> 2.34.0
>
>

