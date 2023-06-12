Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6ADC7EE23
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 03:39:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8YOq-0002fR-BN; Sun, 11 Jun 2023 23:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8YOm-0002cy-Tk; Sun, 11 Jun 2023 23:39:22 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8YOl-0000lg-91; Sun, 11 Jun 2023 23:39:20 -0400
Received: by mail-ua1-x92f.google.com with SMTP id
 a1e0cc1a2514c-784f7f7deddso1352216241.3; 
 Sun, 11 Jun 2023 20:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686541158; x=1689133158;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZDusm5XzJ/ClYO6w3firj2ibdKm6Mi+Frksty+EI6Cs=;
 b=cSda+DUX7nCthsTqooXooGi1pQEATjcqMMB0/4xDeJ/Wa1sDbieD9JMgH7FrSxLgJ9
 OFj6FsUwtohGtu6QdeKjnglwS7dD+z/WL9r1c23JnobxLhXPO+/C+SmJGvIG9NDOOg5l
 qJAGRntV+frK/M0SB9jALnHMFVyVhTCtBSjnK1/HSep/I8wOn9uGyBf+6H9Vit68w9q8
 8wWi07kLHzsp9DqQ3Y7pubSQPXrT2OEszbrSaEGYJxtRX7WgbLiXwWyCKAGjHlCqsMsr
 YkzmrD39kdRVAVFx50Evun8YykhCM99Ic2rlQfmEeubDMKpxj0f8O8Cuf/jytUjdK9fN
 570w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686541158; x=1689133158;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZDusm5XzJ/ClYO6w3firj2ibdKm6Mi+Frksty+EI6Cs=;
 b=NcdhK/f2pANDvlktaHqXhnjDAL4pLOHnFXl0RtAl8xBgPofXMAHWKopXfkPfyVlvs0
 09HGZ3vm2UeQVx97UdXr7yM/T+ptZLXcMm9UY1vFQnVgB6zpvHZKb9QBwTkkZcttldbb
 pcFd7U7ao1htXU/oGwVt450y2cT/5IMCYP4DSa/66yiovEOUOWJVeG8Wxv3LmS5bg5Ig
 X4vKwV19xlFcHYYLbefcNr080/Kj6EZ0czblUto7AwJpJ2fP0vwJ8C3uESdQEoAF59Lt
 qnIpXVx2y6OQC9FU3TQtLGnBOPqTQrl5rKv0KCb8L6iq8pJv10rn5x8A1Dk8USL8ENhW
 zqfQ==
X-Gm-Message-State: AC+VfDwjMtbSPhZGGxBFDqi2gt6QuhaflSzUbRnGBTSVluTjI5Nx6UXl
 zEv1fZV/Fn9rx9pXu51jCvkkh3yyEQaT+q3L9xk=
X-Google-Smtp-Source: ACHHUZ6F56uc2UtR+Actx7/Fx/DFlffdAaDsRcGBfply/8ZXbO3XqbXiTWjXbv5goekWzylwt1emN+TD2WtapwMtMiU=
X-Received: by 2002:a05:6102:490:b0:434:66e3:74b4 with SMTP id
 n16-20020a056102049000b0043466e374b4mr2881813vsa.8.1686541157614; Sun, 11 Jun
 2023 20:39:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230530131843.1186637-1-christoph.muellner@vrull.eu>
 <20230530131843.1186637-9-christoph.muellner@vrull.eu>
In-Reply-To: <20230530131843.1186637-9-christoph.muellner@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Jun 2023 13:38:51 +1000
Message-ID: <CAKmqyKP4p7w4iLJxX3nYNzVdRkdCWaHR7nEhvyM9BocjZo=Dpg@mail.gmail.com>
Subject: Re: [PATCH 8/9] disas/riscv: Add support for XVentanaCondOps
To: Christoph Muellner <christoph.muellner@vrull.eu>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, May 30, 2023 at 11:23=E2=80=AFPM Christoph Muellner
<christoph.muellner@vrull.eu> wrote:
>
> From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
>
> This patch adds XVentanaCondOps support to the RISC-V disassembler.
>
> Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  disas/meson.build      |  5 ++++-
>  disas/riscv-xventana.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  disas/riscv-xventana.h | 18 ++++++++++++++++++
>  disas/riscv.c          |  4 ++++
>  4 files changed, 67 insertions(+), 1 deletion(-)
>  create mode 100644 disas/riscv-xventana.c
>  create mode 100644 disas/riscv-xventana.h
>
> diff --git a/disas/meson.build b/disas/meson.build
> index 832727e4b3..e0ee326411 100644
> --- a/disas/meson.build
> +++ b/disas/meson.build
> @@ -6,7 +6,10 @@ common_ss.add(when: 'CONFIG_M68K_DIS', if_true: files('m=
68k.c'))
>  common_ss.add(when: 'CONFIG_MICROBLAZE_DIS', if_true: files('microblaze.=
c'))
>  common_ss.add(when: 'CONFIG_MIPS_DIS', if_true: files('mips.c', 'nanomip=
s.c'))
>  common_ss.add(when: 'CONFIG_NIOS2_DIS', if_true: files('nios2.c'))
> -common_ss.add(when: 'CONFIG_RISCV_DIS', if_true: files('riscv.c'))
> +common_ss.add(when: 'CONFIG_RISCV_DIS', if_true: files(
> +    'riscv.c',
> +    'riscv-xventana.c'
> +))
>  common_ss.add(when: 'CONFIG_SH4_DIS', if_true: files('sh4.c'))
>  common_ss.add(when: 'CONFIG_SPARC_DIS', if_true: files('sparc.c'))
>  common_ss.add(when: 'CONFIG_XTENSA_DIS', if_true: files('xtensa.c'))
> diff --git a/disas/riscv-xventana.c b/disas/riscv-xventana.c
> new file mode 100644
> index 0000000000..a0224d1fb3
> --- /dev/null
> +++ b/disas/riscv-xventana.c
> @@ -0,0 +1,41 @@
> +/*
> + * QEMU RISC-V Disassembler for xventana.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "disas/riscv.h"
> +#include "disas/riscv-xventana.h"
> +
> +typedef enum {
> +    /* 0 is reserved for rv_op_illegal. */
> +    ventana_op_vt_maskc =3D 1,
> +    ventana_op_vt_maskcn =3D 2,
> +} rv_ventana_op;
> +
> +const rv_opcode_data ventana_opcode_data[] =3D {
> +    { "vt.illegal", rv_codec_illegal, rv_fmt_none, NULL, 0, 0, 0 },
> +    { "vt.maskc", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "vt.maskcn", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +};
> +
> +void decode_xventanacondops(rv_decode *dec, rv_isa isa)
> +{
> +    rv_inst inst =3D dec->inst;
> +    rv_opcode op =3D rv_op_illegal;
> +
> +    switch (((inst >> 0) & 0b11)) {
> +    case 3:
> +        switch (((inst >> 2) & 0b11111)) {
> +        case 30:
> +            switch (((inst >> 22) & 0b1111111000) | ((inst >> 12) & 0b00=
00000111)) {
> +            case 6: op =3D ventana_op_vt_maskc; break;
> +            case 7: op =3D ventana_op_vt_maskcn; break;
> +            }
> +            break;
> +        }
> +        break;
> +    }
> +
> +    dec->op =3D op;
> +}
> diff --git a/disas/riscv-xventana.h b/disas/riscv-xventana.h
> new file mode 100644
> index 0000000000..72be9ffa16
> --- /dev/null
> +++ b/disas/riscv-xventana.h
> @@ -0,0 +1,18 @@
> +/*
> + * QEMU disassembler -- RISC-V specific header (xventana*).
> + *
> + * Copyright (c) 2023 VRULL GmbH
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef DISAS_RISCV_XVENTANA_H
> +#define DISAS_RISCV_XVENTANA_H
> +
> +#include "disas/riscv.h"
> +
> +extern const rv_opcode_data ventana_opcode_data[];
> +
> +void decode_xventanacondops(rv_decode*, rv_isa);
> +
> +#endif /* DISAS_RISCV_XVENTANA_H */
> diff --git a/disas/riscv.c b/disas/riscv.c
> index db98e3ea6a..4f71333c45 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -22,6 +22,9 @@
>  #include "disas/riscv.h"
>  #include "target/riscv/cpu-config.h"
>
> +/* Vendor extensions */
> +#include "disas/riscv-xventana.h"
> +
>  typedef enum {
>      /* 0 is reserved for rv_op_illegal. */
>      rv_op_lui =3D 1,
> @@ -4614,6 +4617,7 @@ disasm_inst(char *buf, size_t buflen, rv_isa isa, u=
int64_t pc, rv_inst inst,
>          void (*decode_func)(rv_decode *, rv_isa);
>      } decoders[] =3D {
>          { always_true_p, rvi_opcode_data, decode_inst_opcode },
> +        { has_XVentanaCondOps_p, ventana_opcode_data, decode_xventanacon=
dops },
>      };
>
>      for (size_t i =3D 0; i < ARRAY_SIZE(decoders); i++) {
> --
> 2.40.1
>
>

