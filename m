Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mplXp-00080f-FO
	for mharc-qemu-riscv@gnu.org; Wed, 24 Nov 2021 01:14:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mplXn-0007yR-7i; Wed, 24 Nov 2021 01:14:11 -0500
Received: from [2607:f8b0:4864:20::132] (port=42681
 helo=mail-il1-x132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mplXk-0000Gy-Aq; Wed, 24 Nov 2021 01:14:10 -0500
Received: by mail-il1-x132.google.com with SMTP id e8so1421734ilu.9;
 Tue, 23 Nov 2021 22:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5kCtERrFI0ia6mSMVajV/tcSUPmoeK++T+SFbo2sxsg=;
 b=Q8a460VXqrSSY+4rGzoz5esr2A5tTNyAgUJV7fx6hwEz/5zMJy+wcIt2H/upsFwDvO
 jXc7VUTCA1KP2ZAoBGeQr0Jn7Fm/B15XR+1Dl1PJNhBuzEBH1ejKP/msxdkpaIe5kfTo
 3Bq+IDwauIDxrp75F5fm6Xq+0MKUtoiHZ/qCC7s0svAULvb7Cz5LdWZWmKIIEryzUggS
 IU/2VnorjRF2yFoUBOy3jHg4AzKCEqU+OoDPdHr64gopiM+IBc2F04tLhTpYnf7Gfn3U
 O6oiEFBDbpvA3tFAdmPKCjvnH/833z00CY7NrqvXE6CxokKROkYGg1JGEsPf04pjLPiv
 2/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5kCtERrFI0ia6mSMVajV/tcSUPmoeK++T+SFbo2sxsg=;
 b=De2mV4Sez5atz27rZi5sJg/OHAqD/YJaL7AozRwt//0PFFufTc5caLHSrvw+I3hVrz
 yLUITYMiRSVr6MxcnHCXWCRAq2+yMoMZBdyJ+IdRIFd9TNQszdqOthmrqQtt+gyNqUJP
 +9bh4ikTHV9tdzuIlOol7M70gk15bOLALcOiF1u02R9Uz9aBHS68xsRCcuwDIm/RKdHh
 A2O/DfB2ZczAKnqg9tGBivJPtJS6RMHfGWaPilo4+CoYsnsWFNOkQGNlI8zacm5+I4Z6
 IvBsF0Vn/WjP8ZQDf5WIj/0lIGYllybvATUsgWFyqvixa6O45zGNqAESvlafFqPehKi4
 moFA==
X-Gm-Message-State: AOAM530rqoPgEG6ixZnrtuC7igkc4Pr5HfvqxuRbHJOSOXzQLvsfFtYR
 qGlnOHkFhwo4g14JYJL4s4jyqdqpsVf+AQTJMmY=
X-Google-Smtp-Source: ABdhPJws5Lw+a17f3oYlnzqSPcXt98Jev0pVDHns2uz31FK4yBD8/UmVDTiMqQnLrZW9fJrHO91Fhzq4vsBfTjYI1V0=
X-Received: by 2002:a05:6e02:1e02:: with SMTP id
 g2mr10661506ila.290.1637734447012; 
 Tue, 23 Nov 2021 22:14:07 -0800 (PST)
MIME-Version: 1.0
References: <20211112145902.205131-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211112145902.205131-11-frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <20211112145902.205131-11-frederic.petrot@univ-grenoble-alpes.fr>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 24 Nov 2021 16:13:40 +1000
Message-ID: <CAKmqyKMR8_-zq_SQ8RMUp+YH0JqWwkNaWvD39wiNShYv284p4A@mail.gmail.com>
Subject: Re: [PATCH v5 10/18] target/riscv: support for 128-bit bitwise
 instructions
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Fabien Portas <fabien.portas@grenoble-inp.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::132
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x132.google.com
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
X-List-Received-Date: Wed, 24 Nov 2021 06:14:11 -0000

On Sat, Nov 13, 2021 at 1:20 AM Fr=C3=A9d=C3=A9ric P=C3=A9trot
<frederic.petrot@univ-grenoble-alpes.fr> wrote:
>
> The 128-bit bitwise instructions do not need any function prototype chang=
e
> as the functions can be applied independently on the lower and upper part=
 of
> the registers.
>
> Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 554cf05084..508ae87985 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -448,7 +448,15 @@ static bool gen_logic_imm_fn(DisasContext *ctx, arg_=
i *a,
>
>      func(dest, src1, a->imm);
>
> -    gen_set_gpr(ctx, a->rd, dest);
> +    if (get_xl(ctx) =3D=3D MXL_RV128) {
> +        TCGv src1h =3D get_gprh(ctx, a->rs1);
> +        TCGv desth =3D dest_gprh(ctx, a->rd);
> +
> +        func(desth, src1h, -(a->imm < 0));
> +        gen_set_gpr128(ctx, a->rd, dest, desth);
> +    } else {
> +        gen_set_gpr(ctx, a->rd, dest);
> +    }
>
>      return true;
>  }
> @@ -462,7 +470,16 @@ static bool gen_logic(DisasContext *ctx, arg_r *a,
>
>      func(dest, src1, src2);
>
> -    gen_set_gpr(ctx, a->rd, dest);
> +    if (get_xl(ctx) =3D=3D MXL_RV128) {
> +        TCGv src1h =3D get_gprh(ctx, a->rs1);
> +        TCGv src2h =3D get_gprh(ctx, a->rs2);
> +        TCGv desth =3D dest_gprh(ctx, a->rd);
> +
> +        func(desth, src1h, src2h);
> +        gen_set_gpr128(ctx, a->rd, dest, desth);
> +    } else {
> +        gen_set_gpr(ctx, a->rd, dest);
> +    }
>
>      return true;
>  }
> --
> 2.33.1
>
>

