Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oWDms-0006K5-4d
	for mharc-qemu-riscv@gnu.org; Thu, 08 Sep 2022 05:25:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oWDmi-0006Jb-W1; Thu, 08 Sep 2022 05:25:21 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:43945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oWDmh-0001en-3M; Thu, 08 Sep 2022 05:25:20 -0400
Received: by mail-pg1-x52b.google.com with SMTP id v4so16122736pgi.10;
 Thu, 08 Sep 2022 02:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=Lzc+PT5oBaDdpy8usVnSBeDJwMn+V9sWNc1Y+I38FbY=;
 b=o88+xJgmynbeA2SuwGjA1rTRO5xTVDL+hNvogKMUaGQr2rsP+pZOrEhLC3KN2LW1Yn
 CIn6lMXL/kLWJu9uyHYI0xgYB9wl7JfR8weUUhd32HPI/9H0QmztxpPxRdEyS5PArd4J
 fbA+NB3bSv9dtuu6tH/cGE1U4/t2VoBRhCRv3X+AfGMjhM4GUT6nwKTHZq8ocgXhYfg+
 42u+KZcMz97PVuNC+jiatPE2Jrqek7o3Cnqhnf5ica0oiBfCOhbfKbzWcC8t6m3M+/N4
 5xEJ8BkxHhKclHnK2IVlhiOi3Lj4YJOUE5jjLeq9ZbLlHOLMH34xjImhGWzYHLC3AqjK
 rjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Lzc+PT5oBaDdpy8usVnSBeDJwMn+V9sWNc1Y+I38FbY=;
 b=m3TY8jn/Ehz17yWIoFseu6reD7IvDllvYRouYZtZqC53ZrT6LzDdI8F727y4BYjWQ2
 0/bbg/41lQA5RoM1chKJENMeV5emda/8OfFts1FE5NvSTP7aUcey+ZsaZlt9tXnno9p0
 0HmnLchJiM6CssuDYir7Fe9QGxDvouJBQwnIdSnqBE0o9IwsBFxMA+DE0fmWyZyWc5hk
 aR4RufaL5XnTw5P51BCnmxi2LxPhruRi3RcfMpXM7T1TvvH+LvtCsHLKTfcSy63EDlZF
 oxm6oOpIbzvZWBn2gTpek7Ezq4nmRhgk0JSoVFQXRcwsl3ep7qy+oV7gSVUy7650DB82
 nYAQ==
X-Gm-Message-State: ACgBeo3OIyFWiRwJwXM75ts9QE9JCCWbZ3Cvzd2lb/jPXgow7kpwAaUO
 S44w3yPBU8Rwlus0+cOavX0tjbTGXNl6zre/O7o=
X-Google-Smtp-Source: AA6agR70Vh+4EFkHxjg3/aooQPDbjvbji7YwyyFKTIhAxRDwwHrhLmCRkcrMDnqQMyGrB0Zq3AesHxpBAWAvi0/Pumo=
X-Received: by 2002:a63:5b15:0:b0:42b:bb74:a2da with SMTP id
 p21-20020a635b15000000b0042bbb74a2damr7074497pgb.406.1662629117174; Thu, 08
 Sep 2022 02:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220812131304.1674484-1-philipp.tomsich@vrull.eu>
 <20220812131304.1674484-2-philipp.tomsich@vrull.eu>
 <CAFEAcA9tQDu_4N+6QKhX66R5PtddXWkL-zmn1vDTDdQceCtHdA@mail.gmail.com>
 <CAAeLtUDmvuje+cLB6j+_JjUt3TQaEoJYRypjd=dMNwkFsD0sDA@mail.gmail.com>
In-Reply-To: <CAAeLtUDmvuje+cLB6j+_JjUt3TQaEoJYRypjd=dMNwkFsD0sDA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 8 Sep 2022 11:24:50 +0200
Message-ID: <CAKmqyKMCUyTtTarDcXjxjTDe7JapuegxMB9x57rtG+7rNELVQg@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: fence: reconcile with specification
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x52b.google.com
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
X-List-Received-Date: Thu, 08 Sep 2022 09:25:24 -0000

On Fri, Aug 12, 2022 at 4:19 PM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> Happy to lower it back into the decode file.
> However, I initially pulled it up into the trans-function to more
> closely match the ISA specification: there is only one FENCE
> instruction with 3 arguments (FM, PRED, and SUCC).
> One might argue that the decode table for "RV32I Base Instruction Set"
> in the specification lists FENCE.TSO as a separate instruction, but
> the normative text doesn't (and FENCE overlaps FENCE.TSO in the
> tabular representation) =E2=80=94 so I would consider the table as
> informative.
>
> I'll wait until we see what consensus emerges from the discussion.

From the discussion on patch 1 it seems that QEMU ignoring these
fields (current behaviour) is correct

Alistair

>
> Philipp.
>
> On Fri, 12 Aug 2022 at 15:21, Peter Maydell <peter.maydell@linaro.org> wr=
ote:
> >
> > On Fri, 12 Aug 2022 at 14:17, Philipp Tomsich <philipp.tomsich@vrull.eu=
> wrote:
> > >
> > > Our decoding of fence-instructions is problematic in respect to the
> > > RISC-V ISA specification:
> > > - rs and rd are ignored, but need to be 0
> > > - fm is ignored
> > >
> > > This change adjusts the decode pattern to enfore rs and rd being 0,
> > > and validates the fm-field (together with pred/succ for FENCE.TSO) to
> > > determine whether a reserved instruction is specified.
> > >
> > > While the specification allows UNSPECIFIED behaviour for reserved
> > > instructions, we now always raise an illegal instruction exception.
> > >
> > > Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> > >
> > > ---
> > >
> > >  target/riscv/insn32.decode              |  2 +-
> > >  target/riscv/insn_trans/trans_rvi.c.inc | 19 ++++++++++++++++++-
> > >  2 files changed, 19 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> > > index 089128c3dc..4e53df1b62 100644
> > > --- a/target/riscv/insn32.decode
> > > +++ b/target/riscv/insn32.decode
> > > @@ -150,7 +150,7 @@ srl      0000000 .....    ..... 101 ..... 0110011=
 @r
> > >  sra      0100000 .....    ..... 101 ..... 0110011 @r
> > >  or       0000000 .....    ..... 110 ..... 0110011 @r
> > >  and      0000000 .....    ..... 111 ..... 0110011 @r
> > > -fence    ---- pred:4 succ:4 ----- 000 ----- 0001111
> > > +fence    fm:4 pred:4 succ:4 00000 000 00000 0001111
> > >  fence_i  000000000000     00000 001 00000 0001111
> > >  csrrw    ............     ..... 001 ..... 1110011 @csr
> > >  csrrs    ............     ..... 010 ..... 1110011 @csr
> > > diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/i=
nsn_trans/trans_rvi.c.inc
> > > index ca8e3d1ea1..515bb3b22a 100644
> > > --- a/target/riscv/insn_trans/trans_rvi.c.inc
> > > +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> > > @@ -795,7 +795,24 @@ static bool trans_srad(DisasContext *ctx, arg_sr=
ad *a)
> > >
> > >  static bool trans_fence(DisasContext *ctx, arg_fence *a)
> > >  {
> > > -    /* FENCE is a full memory barrier. */
> > > +    switch (a->fm) {
> > > +    case 0b0000:
> > > +         /* normal fence */
> > > +         break;
> > > +
> > > +    case 0b0001:
> > > +         /* FENCE.TSO requires PRED and SUCC to be RW */
> > > +         if (a->pred !=3D 0xb0011 || a->succ !=3D 0b0011) {
> > > +            return false;
> > > +         }
> > > +         break;
> > > +
> > > +    default:
> > > +        /* reserved for future use */
> > > +        return false;
> > > +    }
> >
> > I think it would be neater to do this decode in the
> > .decode file, rather than by hand in the trans function.
> >
> > thanks
> > -- PMM
>

