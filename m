Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9xnq-0001HN-BG
	for mharc-qemu-riscv@gnu.org; Tue, 18 Jan 2022 18:22:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1n9xni-0001Gx-Un
 for qemu-riscv@nongnu.org; Tue, 18 Jan 2022 18:22:07 -0500
Received: from [2a00:1450:4864:20::334] (port=42799
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1n9xnf-000262-Vb
 for qemu-riscv@nongnu.org; Tue, 18 Jan 2022 18:22:06 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 ay4-20020a05600c1e0400b0034a81a94607so1796694wmb.1
 for <qemu-riscv@nongnu.org>; Tue, 18 Jan 2022 15:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lbItkDUzDl3N9mFn9oMmLoa3vpB8Dv4nRbZ9vM3coho=;
 b=P/4UdzLyezxy1Qkc0Y3336Ib6opqJYLVCrGaIibL52yj07a5P0RFru5BRpzyduU+XP
 PH8MgHHoIlM1USoNJMrlc7btCQetFmFhHz9f5+p8lqpMbZ9icmTMgX98DVCbli7p3Xo7
 uUdTub7Iq/92+xS7LAcFlLXJEshnSY2NXpdMdhjD+O74DJTnqR8aaBMUZDXyEHZjbs2u
 PHWQrLuT+vez0vnUHvchDdDxdpNn2RC5wum4+nls5I8VsPmP46J2VJpboZ77wm0WNe51
 O3YjzkGEbuVIWiebkW6taU8KG70QSJbcM/cJt7NcvKqEqWsWBbtn3S2XOrBvJFobkCO2
 4T0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lbItkDUzDl3N9mFn9oMmLoa3vpB8Dv4nRbZ9vM3coho=;
 b=BevEwseFBLyCcF11/GEnMTZpBmgoyBiDox6HBG9WFq2gGZ9rfGlnOxMqS7bTtZmUik
 ctPT7Iy0amrpPGK96bOO5BvLwvVkZTdXLR0GzgkwJGUQeJ4qogfNniG7MqapcdMtuQbM
 GxbbU7acttOgC1pKsq3mfmo52inOPnzwxAYuM8f1IEHeuTwXkGiA44Xz5F9rmw162Bhq
 dgzZcp/8Oe4itAfY/kOqfNvhpKT9DYeRH4i7NOEYU2Dog0dOhaugNS2gaQcff0pu9xru
 uncN76VfgEE7C/vU7azMeaY7F84RHwiLJVfBE5VYd6+PdWic354nswgxZ6VV5bJFbD5p
 rFXg==
X-Gm-Message-State: AOAM530uY0CoD/7UPdDhja6KhBlENysCtLJBX88jg+l3AErCT4f3ZVdq
 3/OSROgCZ5ks8PatsInu8e1ZMhttRfCnDxraOpF58w==
X-Google-Smtp-Source: ABdhPJwS8hBWbDLotD9/jbD/35B0/+5fUfF/+JPHe/RrTZGesxp59//jXgPkjJc2YnPuph94q8dyi6NgPuaNDHnmxhc=
X-Received: by 2002:a5d:464b:: with SMTP id j11mr4043522wrs.120.1642548120293; 
 Tue, 18 Jan 2022 15:22:00 -0800 (PST)
MIME-Version: 1.0
References: <20220113202033.3320854-1-philipp.tomsich@vrull.eu>
 <20220113202033.3320854-2-philipp.tomsich@vrull.eu>
 <CAKmqyKOzVi9MiXt+2ESEr28EQ7M6wEyTon+a=h4do9fy4KN=Pw@mail.gmail.com>
In-Reply-To: <CAKmqyKOzVi9MiXt+2ESEr28EQ7M6wEyTon+a=h4do9fy4KN=Pw@mail.gmail.com>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Wed, 19 Jan 2022 00:21:47 +0100
Message-ID: <CAAeLtUBJ4sSZaDqe1Z_431LMDtuQ996OLoE6t_Zh6TLH+_gPHg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] target/riscv: Add XVentanaCondOps custom extension
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Greg Favor <gfavor@ventanamicro.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Kito Cheng <kito.cheng@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-wm1-x334.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 18 Jan 2022 23:22:07 -0000

Alistair,

Some of us (the merit almost exclusively goes to Kito) have been
working towards a similar policy for GCC/binutils and LLVM.
This currently lives in:
   https://github.com/riscv-non-isa/riscv-toolchain-conventions/pull/17

A few comments & a question below.

Thanks,
Philipp.

On Tue, 18 Jan 2022 at 23:53, Alistair Francis <alistair23@gmail.com> wrote=
:
>
> On Fri, Jan 14, 2022 at 6:22 AM Philipp Tomsich
> <philipp.tomsich@vrull.eu> wrote:
> >
> > This adds the decoder and translation for the XVentanaCondOps custom
> > extension (vendor-defined by Ventana Micro Systems), which is
> > documented at https://github.com/ventanamicro/ventana-custom-extensions=
/releases/download/v1.0.0/ventana-custom-extensions-v1.0.0.pdf
> >
> > This commit then also adds a guard-function (has_XVentanaCondOps_p)
> > and the decoder function to the table of decoders, enabling the
> > support for the XVentanaCondOps extension.
> >
> > Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
>
> This looks reasonable to me.
>
> I'm going to leave this for a bit in case there are any more comments.
>
> I was a little worried that taking vendor extensions isn't the right
> move, as we might get stuck with a large number of them. But this is
> pretty self contained and I think with the growing RISC-V interest
> it's something we will eventually need to support.
>
> I'm going to update the QEMU RISC-V wiki page with this to make the
> position clear (comments very welcome)
>
> =3D=3D=3D RISC-V Extensions =3D=3D=3D
> As RISC-V has a range of possible extensions, QEMU has guidelines for
> supporting them all.
>
> If an extension is frozen or ratified by the RISC-V foundation, it can
> be supported in QEMU.
>
> If an official RISC-V foundation extension is in a reasonable draft
> state, that is not too many changes are still expected, it can be
> supported experimentally by QEMU. Experimental support means it must
> be disabled by default and marked with a "x-" in the properties. QEMU
> will only support the latest version of patches submitted for a draft
> extension. A draft extension can also be removed at any time if it
> conflicts with other extensions.
>
> QEMU will also support vendor extensions. Vendor extensions must be
> disabled by default, but can be enabled for specific vendor CPUs and
> boards. Vendor extensions must be maintained and tested by the vendor.

I guess I should create a v3 with appropriate paths in the MAINTAINERS file=
?

> Vendor extensions can not interfere with other extensions and can not
> be obtrusive to the RISC-V target code.

I know that there is some interest to have the XtheadV (the
instructions previously known as vectors 0.7.1-draft) supported and we
have the reality of a deployed base that implements it in hardware.
This would conflict with the opcode space used by the standard RISC-V
vectors, so it makes for an interesting test case (even if just to
clarify our intent)...
Personally, I would like to avoid precluding inclusion of something
useful (of course, "Vendor extensions must be maintained and tested by
the vendor." has to apply!), if a vendor was going to step up and also
offers to maintain it.

So let's assume such a (very significant) addition were factored out
similarly, interfacing just through a hook in decode_op and
argument-parsing logic that ensures that the conflicting
standard-extension is turned off: would this still be acceptable under
this policy =E2=80=94 or would it trip the "obtrusive" condition?

>
> Alistair
>
> >
> > ---
> >
> > Changes in v2:
> > - Split off decode table into XVentanaCondOps.decode
> > - Wire up XVentanaCondOps in the decoder-table
> >
> >  target/riscv/XVentanaCondOps.decode           | 25 ++++++++++++
> >  target/riscv/cpu.c                            |  3 ++
> >  target/riscv/cpu.h                            |  3 ++
> >  .../insn_trans/trans_xventanacondops.inc      | 39 +++++++++++++++++++
> >  target/riscv/meson.build                      |  1 +
> >  target/riscv/translate.c                      | 13 +++++++
> >  6 files changed, 84 insertions(+)
> >  create mode 100644 target/riscv/XVentanaCondOps.decode
> >  create mode 100644 target/riscv/insn_trans/trans_xventanacondops.inc
> >
> > diff --git a/target/riscv/XVentanaCondOps.decode b/target/riscv/XVentan=
aCondOps.decode
> > new file mode 100644
> > index 0000000000..5aef7c3d72
> > --- /dev/null
> > +++ b/target/riscv/XVentanaCondOps.decode
> > @@ -0,0 +1,25 @@
> > +#
> > +# RISC-V translation routines for the XVentanaCondOps extension
> > +#
> > +# Copyright (c) 2022 Dr. Philipp Tomsich, philipp.tomsich@vrull.eu
> > +#
> > +# SPDX-License-Identifier: LGPL-2.1-or-later
> > +#
> > +# Reference: VTx-family custom instructions
> > +#            Custom ISA extensions for Ventana Micro Systems RISC-V co=
res
> > +#            (https://github.com/ventanamicro/ventana-custom-extension=
s/releases/download/v1.0.0/ventana-custom-extensions-v1.0.0.pdf)
> > +
> > +# Fields
> > +%rs2  20:5
> > +%rs1  15:5
> > +%rd    7:5
> > +
> > +# Argument sets
> > +&r    rd rs1 rs2  !extern
> > +
> > +# Formats
> > +@r         .......  ..... ..... ... ..... ....... &r                %r=
s2 %rs1 %rd
> > +
> > +# *** RV64 Custom-3 Extension ***
> > +vt_maskc   0000000  ..... ..... 110 ..... 1111011 @r
> > +vt_maskcn  0000000  ..... ..... 111 ..... 1111011 @r
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 9bc25d3055..fc8ab1dc2b 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -673,6 +673,9 @@ static Property riscv_cpu_properties[] =3D {
> >      DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
> >      DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
> >
> > +    /* Vendor-specific custom extensions */
> > +    DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCond=
Ops, false),
> > +
> >      /* These are experimental so mark with 'x-' */
> >      DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
> >      /* ePMP 0.9.3 */
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 4d63086765..ffde94fd1a 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -330,6 +330,9 @@ struct RISCVCPU {
> >          bool ext_zfh;
> >          bool ext_zfhmin;
> >
> > +        /* Vendor-specific custom extensions */
> > +        bool ext_XVentanaCondOps;
> > +
> >          char *priv_spec;
> >          char *user_spec;
> >          char *bext_spec;
> > diff --git a/target/riscv/insn_trans/trans_xventanacondops.inc b/target=
/riscv/insn_trans/trans_xventanacondops.inc
> > new file mode 100644
> > index 0000000000..b8a5d031b5
> > --- /dev/null
> > +++ b/target/riscv/insn_trans/trans_xventanacondops.inc
> > @@ -0,0 +1,39 @@
> > +/*
> > + * RISC-V translation routines for the XVentanaCondOps extension.
> > + *
> > + * Copyright (c) 2021-2022 VRULL GmbH.
> > + *
> > + * This program is free software; you can redistribute it and/or modif=
y it
> > + * under the terms and conditions of the GNU General Public License,
> > + * version 2 or later, as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope it will be useful, but WITH=
OUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY =
or
> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public Licen=
se for
> > + * more details.
> > + *
> > + * You should have received a copy of the GNU General Public License a=
long with
> > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > + */
> > +
> > +static bool gen_condmask(DisasContext *ctx, arg_r *a, TCGCond cond)
> > +{
> > +    TCGv dest =3D dest_gpr(ctx, a->rd);
> > +    TCGv src1 =3D get_gpr(ctx, a->rs1, EXT_NONE);
> > +    TCGv src2 =3D get_gpr(ctx, a->rs2, EXT_NONE);
> > +
> > +    tcg_gen_movcond_tl(cond, dest, src2, ctx->zero, src1, ctx->zero);
> > +
> > +    gen_set_gpr(ctx, a->rd, dest);
> > +    return true;
> > +}
> > +
> > +static bool trans_vt_maskc(DisasContext *ctx, arg_r *a)
> > +{
> > +    return gen_condmask(ctx, a, TCG_COND_NE);
> > +}
> > +
> > +static bool trans_vt_maskcn(DisasContext *ctx, arg_r *a)
> > +{
> > +    return gen_condmask(ctx, a, TCG_COND_EQ);
> > +}
> > diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> > index a32158da93..1f3a15398b 100644
> > --- a/target/riscv/meson.build
> > +++ b/target/riscv/meson.build
> > @@ -4,6 +4,7 @@ dir =3D meson.current_source_dir()
> >  gen =3D [
> >    decodetree.process('insn16.decode', extra_args: ['--static-decode=3D=
decode_insn16', '--insnwidth=3D16']),
> >    decodetree.process('insn32.decode', extra_args: '--static-decode=3Dd=
ecode_insn32'),
> > +  decodetree.process('XVentanaCondOps.decode', extra_args: '--static-d=
ecode=3Ddecode_XVentanaCodeOps'),
> >  ]
> >
> >  riscv_ss =3D ss.source_set()
> > diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> > index 2cbf9cbb6f..efdf8a7bdb 100644
> > --- a/target/riscv/translate.c
> > +++ b/target/riscv/translate.c
> > @@ -122,6 +122,15 @@ static inline bool always_true_p(CPURISCVState *en=
v  __attribute__((__unused__))
> >      return true;
> >  }
> >
> > +#define MATERIALISE_EXT_PREDICATE(ext)  \
> > +    static inline bool has_ ## ext ## _p(CPURISCVState *env, \
> > +                                         DisasContext *ctx  __attribut=
e__((__unused__)))  \
> > +    { \
> > +        return RISCV_CPU(ctx->cs)->cfg.ext_ ## ext ; \
> > +    }
> > +
> > +MATERIALISE_EXT_PREDICATE(XVentanaCondOps);
> > +
> >  #ifdef TARGET_RISCV32
> >  #define get_xl(ctx)    MXL_RV32
> >  #elif defined(CONFIG_USER_ONLY)
> > @@ -844,9 +853,12 @@ static uint32_t opcode_at(DisasContextBase *dcbase=
, target_ulong pc)
> >  #include "insn_trans/trans_rvb.c.inc"
> >  #include "insn_trans/trans_rvzfh.c.inc"
> >  #include "insn_trans/trans_privileged.c.inc"
> > +#include "insn_trans/trans_xventanacondops.inc"
> >
> >  /* Include the auto-generated decoder for 16 bit insn */
> >  #include "decode-insn16.c.inc"
> > +/* Include decoders for factored-out extensions */
> > +#include "decode-XVentanaCondOps.c.inc"
> >
> >  static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t=
 opcode)
> >  {
> > @@ -862,6 +874,7 @@ static void decode_opc(CPURISCVState *env, DisasCon=
text *ctx, uint16_t opcode)
> >          bool (*decode_func)(DisasContext *, uint32_t);
> >      } decoders[] =3D {
> >          { always_true_p,  decode_insn32 },
> > +        { has_XVentanaCondOps_p,  decode_XVentanaCodeOps },
> >      };
> >
> >      /* Check for compressed insn */
> > --
> > 2.33.1
> >
> >

