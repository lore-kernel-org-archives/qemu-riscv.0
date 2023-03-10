Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1paV9V-00036K-LV
	for mharc-qemu-riscv@gnu.org; Fri, 10 Mar 2023 00:18:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1paV9S-000361-98; Fri, 10 Mar 2023 00:18:46 -0500
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1paV9Q-0000ej-K7; Fri, 10 Mar 2023 00:18:45 -0500
Received: by mail-ua1-x933.google.com with SMTP id l24so2741059uac.12;
 Thu, 09 Mar 2023 21:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678425523;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lANvbT7kjdEzyFHk5+B1WtQKXzHaxPpFahW0x5cJLEc=;
 b=CeGWXurwQwvosnFbLI4lamZNsJMo319TU4yhtnNVwhZLgSIX59QFWvkR5UR1Vw6Kme
 tPdfEaMhcCMdxgSrvy8xrUs+iQeHQLIpwcDZNYf75HTs8kEBUUaMUhaKW7xiR2h/bwAq
 9uU8UZ57PwoMz/Vixz/CL8pKJ2hdldincHgr7qyKfPfj+Fm9JSt2m1GUMoSUQqWuJZzR
 +kXkDowLYa/SOyI6MfNMOYTIlcKOOdQ3P37tTieFfdK2MVGlrTBBQAcY36+u42eli5nt
 UxKn7LBbrlRWJrKq+h1Liub7JDNMAmVfRajPn9C0nu7LXujvogiXFpQ3xfvVg+45BOj8
 MYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678425523;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lANvbT7kjdEzyFHk5+B1WtQKXzHaxPpFahW0x5cJLEc=;
 b=gqe9bFDoTvIAzQ+uhwJNqEg2xP44GNIL0c2NxBEU2K9CRPnbnY8N8ijY9XSe36xSkX
 5T1MYF9wP5qrLiI5Z4/qlszXL2yJkHgo0QKEpugjBW3UQDK+rBdj0IZYADqIE1+xcSsN
 P+xTJjZ3L1QpwlTDxq2Ep/fQKXRqQ/Jz6AFKL0j3yVaku2KlwzFbSIBxvDhWP1QskiVr
 8wyREyx5Qvt+W1fCaruMUwhgNu2UMgQFRChj1Qie1gx2fTQGPIC7Mm+KVauXaxSuRTE2
 7YjaaocSmdWBXIOgxZBe5oUnls9wV2vijGpHKJC+/uZ2MOjb0/brKYHR6XSY1IIZ1t0Z
 2BEA==
X-Gm-Message-State: AO0yUKVZEh8fZu+IZDVzFre0V3yXulENvC1Flk7B2FSN1xyM3Bv/AHeH
 2WhDgMy27BXmEWncOzaZIkOCpRpz8hj4E+RO/ri9Trunw9qbWA==
X-Google-Smtp-Source: AK7set+yv3KGvvUAelpnwubQ1cxFGEH7IU7odmUp38uUIElaBmPUM4PYnfsABypcNuH//ozf2IWsM1oHl6x4oH6Ak+g=
X-Received: by 2002:ab0:14c5:0:b0:67a:2833:5ceb with SMTP id
 f5-20020ab014c5000000b0067a28335cebmr448234uae.0.1678425523158; Thu, 09 Mar
 2023 21:18:43 -0800 (PST)
MIME-Version: 1.0
References: <20230227090228.17117-1-ivan.klokov@syntacore.com>
In-Reply-To: <20230227090228.17117-1-ivan.klokov@syntacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 10 Mar 2023 15:18:00 +1000
Message-ID: <CAKmqyKNd9afrTJrtPgcg9rH-1iiNcpEOn9_86SSN_SC2_q6Taw@mail.gmail.com>
Subject: Re: [PATCH] Fix slli_uw decoding
To: Ivan Klokov <ivan.klokov@syntacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Alistair.Francis@wdc.com, 
 palmer@dabbelt.com, philipp.tomsich@vrull.eu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x933.google.com
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
X-List-Received-Date: Fri, 10 Mar 2023 05:18:47 -0000

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

Thanks!

Applied to riscv-to-apply.next

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

