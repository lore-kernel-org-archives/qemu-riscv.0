Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mznUi-00064h-SB
	for mharc-qemu-riscv@gnu.org; Tue, 21 Dec 2021 17:20:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mznUd-000630-8q; Tue, 21 Dec 2021 17:20:24 -0500
Received: from [2607:f8b0:4864:20::d2a] (port=37585
 helo=mail-io1-xd2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mznUZ-0007Bo-Tl; Tue, 21 Dec 2021 17:20:21 -0500
Received: by mail-io1-xd2a.google.com with SMTP id k21so444699ioh.4;
 Tue, 21 Dec 2021 14:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jsQ7m3ivUznDZE7iJVOX1DIzFUHeIAxG2ijhiRy6Gf8=;
 b=hbuKnOx0xULD9bPqkEU9cV8Z9loXth4QliK50Q/I20faJc2ZFu8wyJy4nmjvIP9jWb
 FgEpKZ1UPEesNzKbpDeR1ojdahj8FP0Ha+avZ4OSwZDW65nPr1yGFrcXylWG3cI/kiqm
 MXgLWKN5c69e9jLJt83iui5nhzqnS86q6J2wcPV/g+9ghY1CtBTUnqTp20sHl+cWurGg
 71lVpVTbDQLLK215MXU2YnxJePi9jhoewgXdDb1LX5vOrFXenZm2Ld69ASwHYOQzPtU4
 K7dZ8aqfYr2m4b+dZ7H5TZQ99IE53Gs2n/xOJMW7Sczv2hLaFEnenV9morKJdCTUZIst
 wqRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jsQ7m3ivUznDZE7iJVOX1DIzFUHeIAxG2ijhiRy6Gf8=;
 b=VWGn4qp1cN7OacI10BwuYvafHAmpFW6EmUvHiyElTygRDgV/9szIB9GNq4S4jKqyIG
 06F3OlndaOsDm1Heq/xr0qRDpBVz9a2oUfriMMycSgUp7SQxucMbw+IETIp95NtAzyIK
 ft+wEEIiGK1QfbMn5VrU5sBglzpsd52FEHt+MyJj6Zr4rCMx/ljI5Wwi8BuoR8LhqbBL
 +u6seDeeIQexWV4EfR6I+L5R+pzez+JzPWi6Rbz1Garr2eSb7/CKpCw2jO05YeL2g1sp
 bOtfLZV2DJBpD8HSzN/nhdKzc1CNeGKvMccQUtRl1einQXSxxR2GSQdKu5HX5vHN1uwE
 6Vkw==
X-Gm-Message-State: AOAM531Axt8tjPrOiOwm778M+81cWNcizlkvI3T28pFWJ9MxGFhAATBS
 5sssenwgwhxvlMVu9YwPn77CeF00HqR8RPPR8MM=
X-Google-Smtp-Source: ABdhPJxKh/wuRwxN2BYW0qOwRsnzgDSrwO1oQ3tMptANB9aUmdVWfujfIHPHb5diOq9D+iJ17zyBxDlVAuDRxJFNnio=
X-Received: by 2002:a05:6638:204c:: with SMTP id
 t12mr104441jaj.169.1640125218520; 
 Tue, 21 Dec 2021 14:20:18 -0800 (PST)
MIME-Version: 1.0
References: <20211221172157.2572503-1-vineetg@rivosinc.com>
In-Reply-To: <20211221172157.2572503-1-vineetg@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 22 Dec 2021 08:19:52 +1000
Message-ID: <CAKmqyKMBHB3egJptvARUqecvVQEDMXgfFN74_1s8y3F4rrPqiQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: make H-extension non-experimental
To: Vineet Gupta <vineetg@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 21 Dec 2021 22:20:26 -0000

On Wed, Dec 22, 2021 at 3:22 AM Vineet Gupta <vineetg@rivosinc.com> wrote:
>
> H-ext v1.0 was ratified recently as part of Privileged Spec 1.12.
> So move it out of experimental.
>
> [1] https://wiki.riscv.org/display/TECH/Recently+Ratified+Extensions
>
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>

Thanks for the patch!

There is already a similar patch on the mailing list though.

Alistair

> ---
>  target/riscv/cpu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6ef3314bced8..a582179b1773 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -640,12 +640,12 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
>      DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
>
> -    /* These are experimental so mark with 'x-' */
>      DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
>      DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
>      DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
>      DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
> -    DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
> +    DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, false),
> +    /* These are experimental so mark with 'x-' */
>      DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
>      /* ePMP 0.9.3 */
>      DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
> --
> 2.30.2
>
>

