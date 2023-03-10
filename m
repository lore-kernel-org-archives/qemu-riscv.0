Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1paUCw-0002XL-DJ
	for mharc-qemu-riscv@gnu.org; Thu, 09 Mar 2023 23:18:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1paUCu-0002Wo-83; Thu, 09 Mar 2023 23:18:16 -0500
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1paUCs-0005EH-Da; Thu, 09 Mar 2023 23:18:15 -0500
Received: by mail-vs1-xe2d.google.com with SMTP id d7so3617614vsj.2;
 Thu, 09 Mar 2023 20:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678421892;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2q0Jafov6kUZR8tyjsO+Csu6RGx6hFW3jb968e4aVuU=;
 b=ZMX/hpURIkQbxE1c4/xkB3cgRzXrGrZuQdxCL9H9wpH1J0Sj5o08PqaMKK45Cf5oPM
 sAc163VGrp1YA/UL0lwDGDKZB0CC7U6PyqbwCeijgTZQQIlQGFDBpAm24+rl5wriWaj4
 mZ9nr2lLpbJXZulO2/t7KUziZUMJxc42b90SZNKfeSIbfGoOlp4uYNNnQY/2pyuJlNgI
 CXQQCXV+M28qozXM4TpYAvyhwfGTwZTTByBoJEdKen8IyivIADQmtE8r0XF2qI+DrEGZ
 OWg4hCuiIiV4OlO2/DFsUhUWmKn4QdfBKp7UmG3EFdJsHZwkRzIYqReRw+oWczvo9OE6
 eTcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678421892;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2q0Jafov6kUZR8tyjsO+Csu6RGx6hFW3jb968e4aVuU=;
 b=ovpGw3XVGfnzxKoPQ1GH9C5AT572vvOz1EYJtI9fY62yS7aaEsiBHdWnvnTFtTPoFC
 IHvJ/wRlgXZi6morB9yJpDQe+Dtqrks6gqTEr/pf8vob017OxEM1HYg5AZYuBEaEo6Qs
 ChmHgDOv4R3cJV5ICrvaAFaBtd7eKsgkaqrtrzoy4rnQZ8ptAa71jLwaSfGIZDzBRxlF
 EIFih7rB/xXex+AY2Zkz9z98QqOjqXsY9acqGFFg6mSyQQe4WpGQcBsjC9Jc6s3wXfUF
 eG1JRsvTAfa+r6zw7Nev8U5hgrgRKC37PZpCv39x5GFgcNbC0sTc4zoABAKeTHyyxjzj
 wjew==
X-Gm-Message-State: AO0yUKXbbwWE7v9FyTigOOQfP5teWVr9nRw6yEyHlSgp5KVkBSg72wPc
 v7RQSHC5DGTXtXQkRraZdlswhrTkapUDtd9Qet8=
X-Google-Smtp-Source: AK7set87Eb0lCVWgEIVBE4MAXB95JLxhw34L9nosEDOWjzMMiyDtu+3eQoI2bGHJ8KaZpUaE4zGVFdwS+97bwqcfOP8=
X-Received: by 2002:a67:fd7a:0:b0:416:f1ea:1001 with SMTP id
 h26-20020a67fd7a000000b00416f1ea1001mr16314222vsa.5.1678421891880; Thu, 09
 Mar 2023 20:18:11 -0800 (PST)
MIME-Version: 1.0
References: <20230227090228.17117-1-ivan.klokov@syntacore.com>
In-Reply-To: <20230227090228.17117-1-ivan.klokov@syntacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 10 Mar 2023 14:17:45 +1000
Message-ID: <CAKmqyKMbr5ZTOmjyHLgjh266upSFDOgZUCo95OHk80REC+m6fg@mail.gmail.com>
Subject: Re: [PATCH] Fix slli_uw decoding
To: Ivan Klokov <ivan.klokov@syntacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Alistair.Francis@wdc.com, 
 palmer@dabbelt.com, philipp.tomsich@vrull.eu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2d.google.com
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
X-List-Received-Date: Fri, 10 Mar 2023 04:18:16 -0000

On Mon, Feb 27, 2023 at 7:06=E2=80=AFPM Ivan Klokov <ivan.klokov@syntacore.=
com> wrote:
>
> The decoding of the slli_uw currently contains decoding
> error: shamt part of opcode has six bits, not five.
>
> Fixes 3de1fb71("target/riscv: update disas.c for xnor/orn/andn and slli.u=
w")
>
> Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  disas/riscv.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index ddda687c13..03cfefb0d3 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -1647,7 +1647,7 @@ const rv_opcode_data opcode_data[] =3D {
>      { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
>      { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
>      { "cpopw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> -    { "slli.uw", rv_codec_i_sh5, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
> +    { "slli.uw", rv_codec_i_sh6, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
>      { "add.uw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>      { "rolw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>      { "rorw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> @@ -2617,10 +2617,10 @@ static void decode_inst_opcode(rv_decode *dec, rv=
_isa isa)
>              switch (((inst >> 12) & 0b111)) {
>              case 0: op =3D rv_op_addiw; break;
>              case 1:
> -                switch (((inst >> 25) & 0b1111111)) {
> +                switch (((inst >> 26) & 0b111111)) {
>                  case 0: op =3D rv_op_slliw; break;
> -                case 4: op =3D rv_op_slli_uw; break;
> -                case 48:
> +                case 2: op =3D rv_op_slli_uw; break;
> +                case 24:
>                      switch ((inst >> 20) & 0b11111) {
>                      case 0b00000: op =3D rv_op_clzw; break;
>                      case 0b00001: op =3D rv_op_ctzw; break;
> --
> 2.34.1
>
>

