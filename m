Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5EFC7EE25
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 11:12:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8fSK-0001sQ-ML; Mon, 12 Jun 2023 07:11:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1q8fSF-0001qE-4c
 for qemu-riscv@nongnu.org; Mon, 12 Jun 2023 07:11:23 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1q8fSD-0002UF-AG
 for qemu-riscv@nongnu.org; Mon, 12 Jun 2023 07:11:22 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-30fc50d843aso346214f8f.3
 for <qemu-riscv@nongnu.org>; Mon, 12 Jun 2023 04:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1686568279; x=1689160279;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NyFLrzWz7FZ7jf31uNa+SdfknmBXjXgcjyoOq5gIil0=;
 b=p2Dv7EbBiDyxVbFmPZ6lagflf/Qh7BMsSF7d/258wQuxyyloaDBQr9q9f3JxLzTONl
 uhTnwTmvWbT3ltmIXz34mftPtbNxdU1GcvSxbhEpfu23hlxcMHkxMTP8952yI5Qet/Qw
 zLNGoYJCLJsvjUf0wBhNq9Cj1RyoTOT0kvytAPxHNKL3lqJ2am6dT+QtkpjsgkzicHcK
 tZFNPav5VIpbdvwwjqLGSX44Nqo6oTQPe2PPaqDcD5xbqPKJbyekHsSA2qGXYwaZ0Nz5
 VPJFTOpmYmS//sIpMjBNAnKx0NgMT8Rwq4dfduHnl+yY5X0kdYv47T0/9hm8v1ixiww/
 svnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686568279; x=1689160279;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NyFLrzWz7FZ7jf31uNa+SdfknmBXjXgcjyoOq5gIil0=;
 b=IlgzfxaOr/4RA9LjvMxguLH2qfUU7LwMhh/DlDrDy3ugZBfT+HXvhuT+K137oe3DVr
 1XXQh16mm4Fqy16jlO5hiDAlCsTlWUE45XhzHZQAmfVEBgeuYLiY6YKoSDu1j6zQ1Ztx
 24ey/0OoQty1Orhp7clkybuIsbc6ATHimccqlsomp//qgI3b3eq6yD6JcMynpJwJJ6U1
 36i1HRXeeJnWkd8/DaEeq+mo3Yi5/gg9eGTaciRR2ENSgZJBwltXMg4w1qba3J2wod/w
 ne+uN7fDxXh+gLh2tFuDaBQsioNM+Ogd3ktypUsdoHV2mg344w2QC/B+gtsvX32ftQod
 AX9w==
X-Gm-Message-State: AC+VfDzG5oUUygyVcCBQ8xVXWEUJtibN6wu7hTj21nexvNIu9zg0aWuY
 DIaulj62GAUxMww07B6TwmMXYQWcv0Ngf0mXfU0BGw==
X-Google-Smtp-Source: ACHHUZ7y+BlESK/SH5FehbMoYH1j1PJpPxExmlnDeLCEw/ajPQWN3a79vlGU/QANq7CpxCwTcoLIgXNJIxcoNEFQHWY=
X-Received: by 2002:a5d:42cc:0:b0:309:32d1:59d8 with SMTP id
 t12-20020a5d42cc000000b0030932d159d8mr3827249wrr.64.1686568279329; Mon, 12
 Jun 2023 04:11:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230530131843.1186637-1-christoph.muellner@vrull.eu>
 <20230530131843.1186637-8-christoph.muellner@vrull.eu>
 <8b073dc8-982b-b4e1-9ee4-cbfb2d4feae6@linux.alibaba.com>
In-Reply-To: <8b073dc8-982b-b4e1-9ee4-cbfb2d4feae6@linux.alibaba.com>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Mon, 12 Jun 2023 13:11:05 +0200
Message-ID: <CAEg0e7jPCWMV5oBU4erp7GWnL0Rp9kyTA6nUhLot7B4VfML80Q@mail.gmail.com>
Subject: Re: [PATCH 7/9] disas/riscv: Provide infrastructure for vendor
 extensions
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, Jun 8, 2023 at 3:05=E2=80=AFPM LIU Zhiwei <zhiwei_liu@linux.alibaba=
.com> wrote:
>
>
> On 2023/5/30 21:18, Christoph Muellner wrote:
> > From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
> >
> > A previous patch provides a pointer to the RISCVCPUConfig data.
> > Let's use this to add the necessary code for vendor extensions.
> > This patch does not change the current behaviour, but clearly
> > defines how vendor extension support can be added to the disassembler.
> >
> > Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
> > ---
> >   disas/riscv.c | 34 ++++++++++++++++++++++++++++++----
> >   1 file changed, 30 insertions(+), 4 deletions(-)
> >
> > diff --git a/disas/riscv.c b/disas/riscv.c
> > index 086edee6a2..db98e3ea6a 100644
> > --- a/disas/riscv.c
> > +++ b/disas/riscv.c
> > @@ -20,6 +20,7 @@
> >   #include "qemu/osdep.h"
> >   #include "disas/dis-asm.h"
> >   #include "disas/riscv.h"
> > +#include "target/riscv/cpu-config.h"
> >
> >   typedef enum {
> >       /* 0 is reserved for rv_op_illegal. */
> > @@ -4599,13 +4600,38 @@ static void decode_inst_decompress(rv_decode *d=
ec, rv_isa isa)
> >   /* disassemble instruction */
> >
> >   static void
> > -disasm_inst(char *buf, size_t buflen, rv_isa isa, uint64_t pc, rv_inst=
 inst)
> > +disasm_inst(char *buf, size_t buflen, rv_isa isa, uint64_t pc, rv_inst=
 inst,
> > +            struct disassemble_info *info)
> >   {
> > +    RISCVCPUConfig *cfg =3D info->private_data;
> >       rv_decode dec =3D { 0 };
> >       dec.pc =3D pc;
> >       dec.inst =3D inst;
> > -    dec.opcode_data =3D rvi_opcode_data;
> > -    decode_inst_opcode(&dec, isa);
> > +
> > +    static const struct {
> > +        bool (*guard_func)(const RISCVCPUConfig *);
> > +        const rv_opcode_data *opcode_data;
> > +        void (*decode_func)(rv_decode *, rv_isa);
> > +    } decoders[] =3D {
> > +        { always_true_p, rvi_opcode_data, decode_inst_opcode },
> > +    };
> > +
> > +    for (size_t i =3D 0; i < ARRAY_SIZE(decoders); i++) {
> > +        bool (*guard_func)(const RISCVCPUConfig *) =3D decoders[i].gua=
rd_func;
> > +        const rv_opcode_data *opcode_data =3D decoders[i].opcode_data;
> > +        void (*decode_func)(rv_decode *, rv_isa) =3D decoders[i].decod=
e_func;
> > +
> > +        if (guard_func(cfg)) {
> > +            dec.opcode_data =3D opcode_data;
> > +            decode_func(&dec, isa);
> > +            if (dec.op !=3D rv_op_illegal)
> > +                break;
> > +        }
> > +    }
> > +
> > +    if (dec.op =3D=3D rv_op_illegal)
> > +        dec.opcode_data =3D rvi_opcode_data;
>
> Always enclose the if sentence.

Done.

Thanks,
Christoph

>
> Otherwise,
>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>
> > +
> >       decode_inst_operands(&dec, isa);
> >       decode_inst_decompress(&dec, isa);
> >       decode_inst_lift_pseudo(&dec);
> > @@ -4659,7 +4685,7 @@ print_insn_riscv(bfd_vma memaddr, struct disassem=
ble_info *info, rv_isa isa)
> >           break;
> >       }
> >
> > -    disasm_inst(buf, sizeof(buf), isa, memaddr, inst);
> > +    disasm_inst(buf, sizeof(buf), isa, memaddr, inst, info);
> >       (*info->fprintf_func)(info->stream, "%s", buf);
> >
> >       return len;

