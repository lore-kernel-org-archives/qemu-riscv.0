Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9ze9-00059r-9r
	for mharc-qemu-riscv@gnu.org; Tue, 18 Jan 2022 20:20:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9zdz-00059G-2P; Tue, 18 Jan 2022 20:20:12 -0500
Received: from [2607:f8b0:4864:20::d31] (port=45871
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9zdv-0008LW-RE; Tue, 18 Jan 2022 20:20:10 -0500
Received: by mail-io1-xd31.google.com with SMTP id s11so867036ioe.12;
 Tue, 18 Jan 2022 17:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iz+N7SB90OoIH2Jv0pGH3tBNweHUZqP9RUmrFiY8F7o=;
 b=SsBeMTx+EkLLMi9yFyX631nlz9qVRpig4RxOGMdlw2RULHAeY+3p6oBlR+ONmwqiaJ
 IF30RWu6POhe9Cl7kniSJ9fLTdyIiPrMVEu4/hYfy39DW7cMCb0W+Ka9rOFFpyADgQIM
 tuoB+B3NcZGwgMsrlvXxR2D3xPzWTIMj73ln5twS6CNdVOqZ1O/V3NpluuEUSo9vs7g9
 6QZQvmON26ei7RRy5RragF2dZQBEhZDG+aBC6flqKE4FhvKTxqSPvKP4YGD6BfhdmDvJ
 vxJQgd6sBF3YyhgsJz3m1khwf75JaFNRimHD0Rrw0YETyPiW8Mm2ZrB5yX3DtNB3YiOh
 1m7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iz+N7SB90OoIH2Jv0pGH3tBNweHUZqP9RUmrFiY8F7o=;
 b=Qic8/5pTr5iGsY7+t1u/oCoro7D7Vr9adjkkVLt559x/ygCp4I9sPmGud4SFDXGnJK
 MbE+CP0AIC7HUmHqFiy5vVxBv0esrhk3jc3sCJBBpYXv3cTFIsxuLDi/9RaeBIwUo8wM
 prbHWgKfyZFaCO0DKXcL3tfR38AW11cjOqRtYqIO6wtrfIWz6LQpbKn2LUQORXpucLE+
 yVsn+6zyWRjF4eIZfOjR0OtXWQOiUX6ceKDkIQRkGuTJhjzqdBdBm378IQ1zBruc61ix
 Qx55zZM1ikexqQamBD5JJsHs/CxJKFIuIwQ4Tmkj2GIfNI1kDH6ZA0ELlaMulY8IVDlL
 QhTg==
X-Gm-Message-State: AOAM532U05/7jQmXSivPGp70ibbouS0ApHKKYu0HBnsAi6GxzpvAJjRJ
 oYSdvptkdMg4TUpWqUa3BYS45hoatMTnLh69Uq4=
X-Google-Smtp-Source: ABdhPJwypagRbNCfl05K2SP2q6sWkIXfnnNB5Jghelr4Z8fYNkGiM5cgKINCQBLd0MCOi7TFy8Bpt1vznAAkY2xIVJo=
X-Received: by 2002:a02:6954:: with SMTP id e81mr13058882jac.63.1642555206016; 
 Tue, 18 Jan 2022 17:20:06 -0800 (PST)
MIME-Version: 1.0
References: <20220113202033.3320854-1-philipp.tomsich@vrull.eu>
 <20220113202033.3320854-2-philipp.tomsich@vrull.eu>
 <CAKmqyKOzVi9MiXt+2ESEr28EQ7M6wEyTon+a=h4do9fy4KN=Pw@mail.gmail.com>
 <CAAeLtUBJ4sSZaDqe1Z_431LMDtuQ996OLoE6t_Zh6TLH+_gPHg@mail.gmail.com>
In-Reply-To: <CAAeLtUBJ4sSZaDqe1Z_431LMDtuQ996OLoE6t_Zh6TLH+_gPHg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 19 Jan 2022 11:19:39 +1000
Message-ID: <CAKmqyKPcYBDJqQ88BZ3TDwiGz6=M3kfB2Bc8YXcQJ=+G0Og4gQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] target/riscv: Add XVentanaCondOps custom extension
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Greg Favor <gfavor@ventanamicro.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Kito Cheng <kito.cheng@sifive.com>
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
X-List-Received-Date: Wed, 19 Jan 2022 01:20:16 -0000

On Wed, Jan 19, 2022 at 9:22 AM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> Alistair,
>
> Some of us (the merit almost exclusively goes to Kito) have been
> working towards a similar policy for GCC/binutils and LLVM.
> This currently lives in:
>    https://github.com/riscv-non-isa/riscv-toolchain-conventions/pull/17

Ah cool! We can use that as a good starting point.

>
> A few comments & a question below.
>
> Thanks,
> Philipp.
>
> On Tue, 18 Jan 2022 at 23:53, Alistair Francis <alistair23@gmail.com> wro=
te:
> >
> > On Fri, Jan 14, 2022 at 6:22 AM Philipp Tomsich
> > <philipp.tomsich@vrull.eu> wrote:
> > >
> > > This adds the decoder and translation for the XVentanaCondOps custom
> > > extension (vendor-defined by Ventana Micro Systems), which is
> > > documented at https://github.com/ventanamicro/ventana-custom-extensio=
ns/releases/download/v1.0.0/ventana-custom-extensions-v1.0.0.pdf
> > >
> > > This commit then also adds a guard-function (has_XVentanaCondOps_p)
> > > and the decoder function to the table of decoders, enabling the
> > > support for the XVentanaCondOps extension.
> > >
> > > Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> >
> > This looks reasonable to me.
> >
> > I'm going to leave this for a bit in case there are any more comments.
> >
> > I was a little worried that taking vendor extensions isn't the right
> > move, as we might get stuck with a large number of them. But this is
> > pretty self contained and I think with the growing RISC-V interest
> > it's something we will eventually need to support.
> >
> > I'm going to update the QEMU RISC-V wiki page with this to make the
> > position clear (comments very welcome)
> >
> > =3D=3D=3D RISC-V Extensions =3D=3D=3D
> > As RISC-V has a range of possible extensions, QEMU has guidelines for
> > supporting them all.
> >
> > If an extension is frozen or ratified by the RISC-V foundation, it can
> > be supported in QEMU.
> >
> > If an official RISC-V foundation extension is in a reasonable draft
> > state, that is not too many changes are still expected, it can be
> > supported experimentally by QEMU. Experimental support means it must
> > be disabled by default and marked with a "x-" in the properties. QEMU
> > will only support the latest version of patches submitted for a draft
> > extension. A draft extension can also be removed at any time if it
> > conflicts with other extensions.
> >
> > QEMU will also support vendor extensions. Vendor extensions must be
> > disabled by default, but can be enabled for specific vendor CPUs and
> > boards. Vendor extensions must be maintained and tested by the vendor.
>
> I guess I should create a v3 with appropriate paths in the MAINTAINERS fi=
le?

Hmm... Good point. I don't think you have to if you don't want to.

My point here was more to just make it clear that upstream QEMU is not
a dumping ground for vendor extensions to get them maintained by
someone else. Obviously we won't purposely break things just for fun.
There is an expectation that the vendor tests their extensions and
responds to bug reports and things like that.

>
> > Vendor extensions can not interfere with other extensions and can not
> > be obtrusive to the RISC-V target code.
>
> I know that there is some interest to have the XtheadV (the
> instructions previously known as vectors 0.7.1-draft) supported and we
> have the reality of a deployed base that implements it in hardware.
> This would conflict with the opcode space used by the standard RISC-V
> vectors, so it makes for an interesting test case (even if just to
> clarify our intent)...
> Personally, I would like to avoid precluding inclusion of something
> useful (of course, "Vendor extensions must be maintained and tested by
> the vendor." has to apply!), if a vendor was going to step up and also
> offers to maintain it.

Yeah... this is unfortunate. I agree that having the 0.7.1-draft
extensions supported would be great. There is hardware that supports
it.

I think this point still stands though. IF the XtheadV implementation
is self contained and doesn't interfere with the vector extensions,
then that's great and we can support it. If instead it adds a large
amount of conditionals to the released vector extension code then I
don't think we can take it.

There is some wiggle room, but the RISC-V tree already has enough
going on and very little reviewers. If in the future we get more
reviewers and testers we can re-evaulate what is acceptable, but for
now I think we need to be a little strict. (Hint to any companies to
give developers time to review)

>
> So let's assume such a (very significant) addition were factored out
> similarly, interfacing just through a hook in decode_op and
> argument-parsing logic that ensures that the conflicting
> standard-extension is turned off: would this still be acceptable under
> this policy =E2=80=94 or would it trip the "obtrusive" condition?

I think that would be acceptable, I wouldn't say that is obtrusive as
it's self contained.

Alistair

>
> >
> > Alistair
> >
> > >
> > > ---
> > >
> > > Changes in v2:
> > > - Split off decode table into XVentanaCondOps.decode
> > > - Wire up XVentanaCondOps in the decoder-table
> > >
> > >  target/riscv/XVentanaCondOps.decode           | 25 ++++++++++++
> > >  target/riscv/cpu.c                            |  3 ++
> > >  target/riscv/cpu.h                            |  3 ++
> > >  .../insn_trans/trans_xventanacondops.inc      | 39 +++++++++++++++++=
++
> > >  target/riscv/meson.build                      |  1 +
> > >  target/riscv/translate.c                      | 13 +++++++
> > >  6 files changed, 84 insertions(+)
> > >  create mode 100644 target/riscv/XVentanaCondOps.decode
> > >  create mode 100644 target/riscv/insn_trans/trans_xventanacondops.inc
> > >
> > > diff --git a/target/riscv/XVentanaCondOps.decode b/target/riscv/XVent=
anaCondOps.decode
> > > new file mode 100644
> > > index 0000000000..5aef7c3d72
> > > --- /dev/null
> > > +++ b/target/riscv/XVentanaCondOps.decode
> > > @@ -0,0 +1,25 @@
> > > +#
> > > +# RISC-V translation routines for the XVentanaCondOps extension
> > > +#
> > > +# Copyright (c) 2022 Dr. Philipp Tomsich, philipp.tomsich@vrull.eu
> > > +#
> > > +# SPDX-License-Identifier: LGPL-2.1-or-later
> > > +#
> > > +# Reference: VTx-family custom instructions
> > > +#            Custom ISA extensions for Ventana Micro Systems RISC-V =
cores
> > > +#            (https://github.com/ventanamicro/ventana-custom-extensi=
ons/releases/download/v1.0.0/ventana-custom-extensions-v1.0.0.pdf)
> > > +
> > > +# Fields
> > > +%rs2  20:5
> > > +%rs1  15:5
> > > +%rd    7:5
> > > +
> > > +# Argument sets
> > > +&r    rd rs1 rs2  !extern
> > > +
> > > +# Formats
> > > +@r         .......  ..... ..... ... ..... ....... &r                =
%rs2 %rs1 %rd
> > > +
> > > +# *** RV64 Custom-3 Extension ***
> > > +vt_maskc   0000000  ..... ..... 110 ..... 1111011 @r
> > > +vt_maskcn  0000000  ..... ..... 111 ..... 1111011 @r
> > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > index 9bc25d3055..fc8ab1dc2b 100644
> > > --- a/target/riscv/cpu.c
> > > +++ b/target/riscv/cpu.c
> > > @@ -673,6 +673,9 @@ static Property riscv_cpu_properties[] =3D {
> > >      DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
> > >      DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
> > >
> > > +    /* Vendor-specific custom extensions */
> > > +    DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCo=
ndOps, false),
> > > +
> > >      /* These are experimental so mark with 'x-' */
> > >      DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
> > >      /* ePMP 0.9.3 */
> > > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > > index 4d63086765..ffde94fd1a 100644
> > > --- a/target/riscv/cpu.h
> > > +++ b/target/riscv/cpu.h
> > > @@ -330,6 +330,9 @@ struct RISCVCPU {
> > >          bool ext_zfh;
> > >          bool ext_zfhmin;
> > >
> > > +        /* Vendor-specific custom extensions */
> > > +        bool ext_XVentanaCondOps;
> > > +
> > >          char *priv_spec;
> > >          char *user_spec;
> > >          char *bext_spec;
> > > diff --git a/target/riscv/insn_trans/trans_xventanacondops.inc b/targ=
et/riscv/insn_trans/trans_xventanacondops.inc
> > > new file mode 100644
> > > index 0000000000..b8a5d031b5
> > > --- /dev/null
> > > +++ b/target/riscv/insn_trans/trans_xventanacondops.inc
> > > @@ -0,0 +1,39 @@
> > > +/*
> > > + * RISC-V translation routines for the XVentanaCondOps extension.
> > > + *
> > > + * Copyright (c) 2021-2022 VRULL GmbH.
> > > + *
> > > + * This program is free software; you can redistribute it and/or mod=
ify it
> > > + * under the terms and conditions of the GNU General Public License,
> > > + * version 2 or later, as published by the Free Software Foundation.
> > > + *
> > > + * This program is distributed in the hope it will be useful, but WI=
THOUT
> > > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILIT=
Y or
> > > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public Lic=
ense for
> > > + * more details.
> > > + *
> > > + * You should have received a copy of the GNU General Public License=
 along with
> > > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > > + */
> > > +
> > > +static bool gen_condmask(DisasContext *ctx, arg_r *a, TCGCond cond)
> > > +{
> > > +    TCGv dest =3D dest_gpr(ctx, a->rd);
> > > +    TCGv src1 =3D get_gpr(ctx, a->rs1, EXT_NONE);
> > > +    TCGv src2 =3D get_gpr(ctx, a->rs2, EXT_NONE);
> > > +
> > > +    tcg_gen_movcond_tl(cond, dest, src2, ctx->zero, src1, ctx->zero)=
;
> > > +
> > > +    gen_set_gpr(ctx, a->rd, dest);
> > > +    return true;
> > > +}
> > > +
> > > +static bool trans_vt_maskc(DisasContext *ctx, arg_r *a)
> > > +{
> > > +    return gen_condmask(ctx, a, TCG_COND_NE);
> > > +}
> > > +
> > > +static bool trans_vt_maskcn(DisasContext *ctx, arg_r *a)
> > > +{
> > > +    return gen_condmask(ctx, a, TCG_COND_EQ);
> > > +}
> > > diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> > > index a32158da93..1f3a15398b 100644
> > > --- a/target/riscv/meson.build
> > > +++ b/target/riscv/meson.build
> > > @@ -4,6 +4,7 @@ dir =3D meson.current_source_dir()
> > >  gen =3D [
> > >    decodetree.process('insn16.decode', extra_args: ['--static-decode=
=3Ddecode_insn16', '--insnwidth=3D16']),
> > >    decodetree.process('insn32.decode', extra_args: '--static-decode=
=3Ddecode_insn32'),
> > > +  decodetree.process('XVentanaCondOps.decode', extra_args: '--static=
-decode=3Ddecode_XVentanaCodeOps'),
> > >  ]
> > >
> > >  riscv_ss =3D ss.source_set()
> > > diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> > > index 2cbf9cbb6f..efdf8a7bdb 100644
> > > --- a/target/riscv/translate.c
> > > +++ b/target/riscv/translate.c
> > > @@ -122,6 +122,15 @@ static inline bool always_true_p(CPURISCVState *=
env  __attribute__((__unused__))
> > >      return true;
> > >  }
> > >
> > > +#define MATERIALISE_EXT_PREDICATE(ext)  \
> > > +    static inline bool has_ ## ext ## _p(CPURISCVState *env, \
> > > +                                         DisasContext *ctx  __attrib=
ute__((__unused__)))  \
> > > +    { \
> > > +        return RISCV_CPU(ctx->cs)->cfg.ext_ ## ext ; \
> > > +    }
> > > +
> > > +MATERIALISE_EXT_PREDICATE(XVentanaCondOps);
> > > +
> > >  #ifdef TARGET_RISCV32
> > >  #define get_xl(ctx)    MXL_RV32
> > >  #elif defined(CONFIG_USER_ONLY)
> > > @@ -844,9 +853,12 @@ static uint32_t opcode_at(DisasContextBase *dcba=
se, target_ulong pc)
> > >  #include "insn_trans/trans_rvb.c.inc"
> > >  #include "insn_trans/trans_rvzfh.c.inc"
> > >  #include "insn_trans/trans_privileged.c.inc"
> > > +#include "insn_trans/trans_xventanacondops.inc"
> > >
> > >  /* Include the auto-generated decoder for 16 bit insn */
> > >  #include "decode-insn16.c.inc"
> > > +/* Include decoders for factored-out extensions */
> > > +#include "decode-XVentanaCondOps.c.inc"
> > >
> > >  static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16=
_t opcode)
> > >  {
> > > @@ -862,6 +874,7 @@ static void decode_opc(CPURISCVState *env, DisasC=
ontext *ctx, uint16_t opcode)
> > >          bool (*decode_func)(DisasContext *, uint32_t);
> > >      } decoders[] =3D {
> > >          { always_true_p,  decode_insn32 },
> > > +        { has_XVentanaCondOps_p,  decode_XVentanaCodeOps },
> > >      };
> > >
> > >      /* Check for compressed insn */
> > > --
> > > 2.33.1
> > >
> > >

