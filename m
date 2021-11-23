Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mpP2H-0002WS-HA
	for mharc-qemu-riscv@gnu.org; Tue, 23 Nov 2021 01:12:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mpP2F-0002TQ-J0; Tue, 23 Nov 2021 01:12:07 -0500
Received: from [2607:f8b0:4864:20::d31] (port=38885
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mpP2D-0006EV-Lw; Tue, 23 Nov 2021 01:12:07 -0500
Received: by mail-io1-xd31.google.com with SMTP id z18so26502080iof.5;
 Mon, 22 Nov 2021 22:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WM1RSl7KFJXX0nbeVSrju8jIcDpDZKfl7SXxYhBrF2g=;
 b=krjqmG/uum2qx8iSrkbNck2QJ83BCYFwAX9GhIaCN+Gzje6GWp9LeLFJEZryo0CB8h
 Ecd27DJ5oS0jSFCJk5UEnQysBp0d1vO93lYZCEG/uZ2Ou8ChdfM8uS0GFsqkD2q2SEWQ
 8lGAY8D4TfmhzRhOuN1OH4YTeOjnRW5XLSTwo7TNwU4gDBfHRpNDRiy2ZeWrJTglASJb
 S6PjZv421KOrrtFIHft7f/n4qvl94CqLe5063xcEEp7asVVT9PGGTg+mYaeTzskmUaub
 xnE8N4vWv8HX3ii1kiPixO8/XkQR2DvK8Gw/4BNAgCheoe8Ww2JfpzJN9dmKby6h1I5N
 sphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WM1RSl7KFJXX0nbeVSrju8jIcDpDZKfl7SXxYhBrF2g=;
 b=xWSVoeBmxe2K3gZvVGqnd1BqNUgTfXbn5uR8aTqOPmiVvVfniSAq32wF/XyPLsoGiZ
 KmXqu65o8j8y2+4AbIVhTn2UAwNMLfw48pA84BpkWeEmdF6kB+fiMWogwq3cxr0xcVEL
 QLfZ5yoQSG4EHVvRRQNqjOoKKICS/fT3ME2YEt3oykADSmocYKkF0Q/5lsQVYyTuSqQ3
 32h/MA/HAS+sVKwtKcKk5ER8jT1bqsonaHAq8PoIv6b2IZc7ttgZymrDPfnCnLM3AoyR
 gZ5ERbxFL02UJacOVjulGUfrLtY2Hht0aDwubTeOYVC7/r3WmUZ6/2j562oTpFBMP91K
 3cFw==
X-Gm-Message-State: AOAM531r15aEFLi5kbfgzu8bu5BRLOw2HvFoULMTY7i2ka2v3OubhaJM
 QPgSiYf/vmRAuKoMJfXZ0NFXq6WSz4/T2XD8000tLzbeeJWKKQ==
X-Google-Smtp-Source: ABdhPJwbJhRt4MqCEDYR98b4lrRDGOHp+z54dOCMvoTiqMuT0Jzkrq5M9xZfQDHykBp15321Z3oxLOVN3+clOER7IdM=
X-Received: by 2002:a05:6638:32a2:: with SMTP id
 f34mr2856323jav.63.1637647924198; 
 Mon, 22 Nov 2021 22:12:04 -0800 (PST)
MIME-Version: 1.0
References: <20211112145902.205131-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211112145902.205131-5-frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <20211112145902.205131-5-frederic.petrot@univ-grenoble-alpes.fr>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 23 Nov 2021 16:11:38 +1000
Message-ID: <CAKmqyKMOQ-QE0BATfiQyW9gR69TJkmem3y0HbxB+uOktUNxNAA@mail.gmail.com>
Subject: Re: [PATCH v5 04/18] target/riscv: additional macros to check
 instruction support
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
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
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
X-List-Received-Date: Tue, 23 Nov 2021 06:12:08 -0000

On Sat, Nov 13, 2021 at 1:08 AM Fr=C3=A9d=C3=A9ric P=C3=A9trot
<frederic.petrot@univ-grenoble-alpes.fr> wrote:
>
> Given that the 128-bit version of the riscv spec adds new instructions, a=
nd
> that some instructions that were previously only available in 64-bit mode
> are now available for both 64-bit and 128-bit, we added new macros to che=
ck
> for the processor mode during translation.
> Although RV128 is a superset of RV64, we keep for now the RV64 only tests
> for extensions other than RVI and RVM.
>
> Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 1d57bc97b5..d98bde9b6b 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -368,10 +368,22 @@ EX_SH(12)
>      }                              \
>  } while (0)
>
> -#define REQUIRE_64BIT(ctx) do {    \
> -    if (get_xl(ctx) < MXL_RV64) {  \
> -        return false;              \
> -    }                              \
> +#define REQUIRE_64BIT(ctx) do {     \
> +    if (get_xl(ctx) !=3D MXL_RV64) { \
> +        return false;               \
> +    }                               \
> +} while (0)
> +
> +#define REQUIRE_128BIT(ctx) do {    \
> +    if (get_xl(ctx) !=3D MXL_RV128) { \
> +        return false;               \
> +    }                               \
> +} while (0)
> +
> +#define REQUIRE_64_OR_128BIT(ctx) do { \
> +    if (get_xl(ctx) =3D=3D MXL_RV32) {     \
> +        return false;                  \
> +    }                                  \
>  } while (0)
>
>  static int ex_rvc_register(DisasContext *ctx, int reg)
> --
> 2.33.1
>
>

