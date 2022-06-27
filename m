Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o5jv9-0007Vq-F7
	for mharc-qemu-riscv@gnu.org; Mon, 27 Jun 2022 04:16:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1o5jv7-0007U3-Sx
 for qemu-riscv@nongnu.org; Mon, 27 Jun 2022 04:16:33 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:42840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1o5jv4-0007BP-U8
 for qemu-riscv@nongnu.org; Mon, 27 Jun 2022 04:16:33 -0400
Received: by mail-qv1-xf35.google.com with SMTP id 65so3048340qva.9
 for <qemu-riscv@nongnu.org>; Mon, 27 Jun 2022 01:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NVOr3NL84Ac3K/7JoBoBosDNJ46Lx2g+qz0drFiRprc=;
 b=MknjWiwsVMfLI4wAxiTUMduXUqCM6AfgWl3CROGPRvH3AN8dTkrdW7K46OOcPZNhFy
 lQFQiR0edXfxl4gcPoFIIajhPP8YIN5bt6JtflsXAUOAFLFtgNLbD0Eaw/+1L3ez9m9G
 ZpBk6pGaAAvJeQH/PCFxPgMR12+xr8O5gnKfN6K6PqX0af6F+h4yf16KfvdPuGYZ7Vs5
 zrT9X/RwQRyufNlDitQxd8UZP/z46izDpgIXKsSCLzFkHDs33reYJjJMeA/1kA6xE4nu
 GnoDlaad0bvaZDxLHuevlPbAPZqVrCG2wlQ77vKKZivMbC1LDUZ22ShpRb5sxoyezVhC
 Uxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NVOr3NL84Ac3K/7JoBoBosDNJ46Lx2g+qz0drFiRprc=;
 b=BB4mFJOFGi03S9ab0d6mIySCfr6ObKYfnVJ1vd4QfcElfiHiScnpjMHNr1DRv4Yxpa
 STBzR6Aag04PpkjpXak+P+pZVeZKx+WlPOE0v2vdEbKbK5W08DqkoYucdzkb1Lur5Ukq
 R9188VONmQlA0CYO3u8Mhdf4T0sDUmXOusszLpKIhssg+9L9A4W5eAWqFmJzq75HICMM
 fgYg+IcV0HG/hScltrl/nQGU4+SZQ+/W5mLaOkAfas085RGdJiYPlfONzoytwNmXs4rX
 VXZjO0uAgh7Rgmx+eXb+Wsccd1S72bi1I42axAKPt4Lflaytq2oiuLzUM3nP4jLEmvDl
 uJJg==
X-Gm-Message-State: AJIora8u/QCjvRUQalu0ra53OxUtVdXpXMUsMbewA7UmlwUOTkClubL9
 i5FRZGhYSuRir+HhqE9ldAX85pzCFVa7RfCmBAeXKw==
X-Google-Smtp-Source: AGRyM1vBXLP2G0jdsvMuUKwSx3sD3h3O4EgVRK39j+5WN3N/HBvWnMOViLdlGJePVMBb+YcXfmvCXq4N2ZEwGqLyUXs=
X-Received: by 2002:a05:622a:d0:b0:305:c643:68fe with SMTP id
 p16-20020a05622a00d000b00305c64368femr8247282qtw.232.1656317786909; Mon, 27
 Jun 2022 01:16:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220623152907.1606964-1-christoph.muellner@vrull.eu>
 <CAKmqyKN2A1kMNdNpDg0wy+1uC3cz0o7sc0SWt6m01jo4DZe6xQ@mail.gmail.com>
In-Reply-To: <CAKmqyKN2A1kMNdNpDg0wy+1uC3cz0o7sc0SWt6m01jo4DZe6xQ@mail.gmail.com>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Mon, 27 Jun 2022 10:16:15 +0200
Message-ID: <CAEg0e7hc6t75eK93TZAiFAVwuJXiZQn6d7FMiS+Y=BaDNg7Pgg@mail.gmail.com>
Subject: Re: [RFC PATCH v3] RISC-V: Add Zawrs ISA extension support
To: Alistair Francis <alistair23@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner@vrull.eu>, 
 Aaron Durbin <adurbin@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000005305c505e2698933"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-qv1-xf35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
X-List-Received-Date: Mon, 27 Jun 2022 08:16:34 -0000

--0000000000005305c505e2698933
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2022 at 7:20 AM Alistair Francis <alistair23@gmail.com>
wrote:

> On Fri, Jun 24, 2022 at 1:31 AM Christoph Muellner
> <christoph.muellner@vrull.eu> wrote:
> >
> > This patch adds support for the Zawrs ISA extension.
> > Given the current (incomplete) implementation of reservation sets
> > there seems to be no way to provide a full emulation of the WRS
> > instruction (wake on reservation set invalidation or timeout or
> > interrupt). Therefore, we just pretend that an interrupt occured,
> > exit the execution loop and finally continue execution.
> >
> > The specification can be found here:
> > https://github.com/riscv/riscv-zawrs/blob/main/zawrs.adoc
> >
> > Note, that the Zawrs extension is not frozen or ratified yet.
> > Therefore this patch is an RFC and not intended to get merged.
> >
> > Changes since v2:
> > * Adjustments according to a specification change
> > * Inline REQUIRE_ZAWRS() since it has only one user
> >
> > Changes since v1:
> > * Adding zawrs to the ISA string that is passed to the kernel
> >
> > Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
> > ---
> >  target/riscv/cpu.c                          |  2 +
> >  target/riscv/cpu.h                          |  1 +
> >  target/riscv/insn32.decode                  |  4 ++
> >  target/riscv/insn_trans/trans_rvzawrs.c.inc | 54 +++++++++++++++++++++
> >  target/riscv/translate.c                    |  1 +
> >  5 files changed, 62 insertions(+)
> >  create mode 100644 target/riscv/insn_trans/trans_rvzawrs.c.inc
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 05e6521351..6cb00fadff 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -882,6 +882,7 @@ static Property riscv_cpu_extensions[] =3D {
> >      DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
> >      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
> >      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> > +    DEFINE_PROP_BOOL("zawrs", RISCVCPU, cfg.ext_zawrs, true),
>
> Would this be enabled by default?
>

The "true" was a personal preference (I prefer to keep the argument list
for QEMU short)
and I did not see any conflicts with existing behavior (no code should
break).
If you prefer otherwise or if I missed a policy I will change it.


>
> >      DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
> >      DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
> >      DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
> > @@ -1075,6 +1076,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu,
> char **isa_str, int max_str_len)
> >          ISA_EDATA_ENTRY(zicsr, ext_icsr),
> >          ISA_EDATA_ENTRY(zifencei, ext_ifencei),
> >          ISA_EDATA_ENTRY(zmmul, ext_zmmul),
> > +        ISA_EDATA_ENTRY(zawrs, ext_zawrs),
> >          ISA_EDATA_ENTRY(zfh, ext_zfh),
> >          ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
> >          ISA_EDATA_ENTRY(zfinx, ext_zfinx),
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 7d6397acdf..a22bc0fa09 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -380,6 +380,7 @@ struct RISCVCPUConfig {
> >      bool ext_h;
> >      bool ext_j;
> >      bool ext_v;
> > +    bool ext_zawrs;
> >      bool ext_zba;
> >      bool ext_zbb;
> >      bool ext_zbc;
> > diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> > index 4033565393..513ea227fe 100644
> > --- a/target/riscv/insn32.decode
> > +++ b/target/riscv/insn32.decode
> > @@ -711,6 +711,10 @@ vsetvli         0 ........... ..... 111 .....
> 1010111  @r2_zimm11
> >  vsetivli        11 .......... ..... 111 ..... 1010111  @r2_zimm10
> >  vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
> >
> > +# *** Zawrs Standard Extension ***
> > +wrs_nto    000000001101 00000 000 00000 1110011
> > +wrs_sto    000000011101 00000 000 00000 1110011
> > +
> >  # *** RV32 Zba Standard Extension ***
> >  sh1add     0010000 .......... 010 ..... 0110011 @r
> >  sh2add     0010000 .......... 100 ..... 0110011 @r
> > diff --git a/target/riscv/insn_trans/trans_rvzawrs.c.inc
> b/target/riscv/insn_trans/trans_rvzawrs.c.inc
> > new file mode 100644
> > index 0000000000..d0df56378e
> > --- /dev/null
> > +++ b/target/riscv/insn_trans/trans_rvzawrs.c.inc
> > @@ -0,0 +1,54 @@
> > +/*
> > + * RISC-V translation routines for the RISC-V Zawrs Extension.
> > + *
> > + * Copyright (c) 2022 Christoph Muellner, christoph.muellner@vrull.io
> > + *
> > + * This program is free software; you can redistribute it and/or modif=
y
> it
> > + * under the terms and conditions of the GNU General Public License,
> > + * version 2 or later, as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope it will be useful, but
> WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY =
or
> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
> License for
> > + * more details.
> > + *
> > + * You should have received a copy of the GNU General Public License
> along with
> > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > + */
> > +
> > +static bool trans_wrs(DisasContext *ctx)
> > +{
> > +    if (!ctx->cfg_ptr->ext_zawrs) {
> > +        return false;
> > +    }
> > +
> > +    /*
> > +     * We may continue if one or more of the following conditions are
> met:
> > +     * a) The reservation set is invalid
>
> Shouldn't this be valid?
>

The CPU is supposed to continue (stop waiting) when the reservation set
becomes invalid.
An earlier LR instruction registers a reservation set and the WRS.*
instructions wait until
this reservation set becomes invalided by a store from another hart to the
same reservation set.
So I think the description is correct.


>
> > +     * b) If WRS.STO, a short time since start of stall has elapsed
> > +     * c) An interrupt is observed
> > +     *
> > +     * A reservation set can be invalidated by any store to a reserved
> > +     * memory location. However, that's currently not implemented in
> QEMU.
> > +     * So let's just exit the CPU loop and pretend that an interrupt
> occured.
>
> We don't actually pretend an interrupt occurs though. It seems like
> it's valid to terminate the stall early, so we should just be able to
> do that.
>

The specification allows stopping the CPU stall if an interrupt occurs that
is disabled.
I think that would match the implemented behavior.

The latest spec update introduced the following sentence:
"While stalled, an implementation is permitted to occasionally terminate
the stall and complete execution for any reason."
I did not want to use this justification for the implementation, because of
the word "occasionally" (the correct word would
be "always" in the implementation). Do you prefer to use this sentence
instead?

Thanks,
Christoph




>
> Alistair
>
> > +     */
> > +
> > +    /* Clear the load reservation  (if any).  */
> > +    tcg_gen_movi_tl(load_res, -1);
> > +
> > +    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
> > +    tcg_gen_exit_tb(NULL, 0);
> > +    ctx->base.is_jmp =3D DISAS_NORETURN;
> > +
> > +    return true;
> > +}
> > +
> > +#define GEN_TRANS_WRS(insn)                                           =
 \
> > +static bool trans_ ## insn(DisasContext *ctx, arg_ ## insn *a)        =
 \
> > +{                                                                     =
 \
> > +       (void)a;                                                       =
 \
> > +       return trans_wrs(ctx);                                         =
 \
> > +}
> > +
> > +GEN_TRANS_WRS(wrs_nto)
> > +GEN_TRANS_WRS(wrs_sto)
> > diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> > index b151c20674..a4f07d5166 100644
> > --- a/target/riscv/translate.c
> > +++ b/target/riscv/translate.c
> > @@ -1007,6 +1007,7 @@ static uint32_t opcode_at(DisasContextBase
> *dcbase, target_ulong pc)
> >  #include "insn_trans/trans_rvh.c.inc"
> >  #include "insn_trans/trans_rvv.c.inc"
> >  #include "insn_trans/trans_rvb.c.inc"
> > +#include "insn_trans/trans_rvzawrs.c.inc"
> >  #include "insn_trans/trans_rvzfh.c.inc"
> >  #include "insn_trans/trans_rvk.c.inc"
> >  #include "insn_trans/trans_privileged.c.inc"
> > --
> > 2.35.3
> >
> >
>

--0000000000005305c505e2698933
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 27, 2022 at 7:20 AM Alist=
air Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Fri, Jun 24, 2022 at 1:31 AM Christoph Muellner<br>
&lt;<a href=3D"mailto:christoph.muellner@vrull.eu" target=3D"_blank">christ=
oph.muellner@vrull.eu</a>&gt; wrote:<br>
&gt;<br>
&gt; This patch adds support for the Zawrs ISA extension.<br>
&gt; Given the current (incomplete) implementation of reservation sets<br>
&gt; there seems to be no way to provide a full emulation of the WRS<br>
&gt; instruction (wake on reservation set invalidation or timeout or<br>
&gt; interrupt). Therefore, we just pretend that an interrupt occured,<br>
&gt; exit the execution loop and finally continue execution.<br>
&gt;<br>
&gt; The specification can be found here:<br>
&gt; <a href=3D"https://github.com/riscv/riscv-zawrs/blob/main/zawrs.adoc" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/riscv/riscv-zawrs/b=
lob/main/zawrs.adoc</a><br>
&gt;<br>
&gt; Note, that the Zawrs extension is not frozen or ratified yet.<br>
&gt; Therefore this patch is an RFC and not intended to get merged.<br>
&gt;<br>
&gt; Changes since v2:<br>
&gt; * Adjustments according to a specification change<br>
&gt; * Inline REQUIRE_ZAWRS() since it has only one user<br>
&gt;<br>
&gt; Changes since v1:<br>
&gt; * Adding zawrs to the ISA string that is passed to the kernel<br>
&gt;<br>
&gt; Signed-off-by: Christoph M=C3=BCllner &lt;<a href=3D"mailto:christoph.=
muellner@vrull.eu" target=3D"_blank">christoph.muellner@vrull.eu</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +<br>
&gt;=C2=A0 target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 target/riscv/insn32.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++<br>
&gt;=C2=A0 target/riscv/insn_trans/trans_rvzawrs.c.inc | 54 +++++++++++++++=
++++++<br>
&gt;=C2=A0 target/riscv/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 5 files changed, 62 insertions(+)<br>
&gt;=C2=A0 create mode 100644 target/riscv/insn_trans/trans_rvzawrs.c.inc<b=
r>
&gt;<br>
&gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
&gt; index 05e6521351..6cb00fadff 100644<br>
&gt; --- a/target/riscv/cpu.c<br>
&gt; +++ b/target/riscv/cpu.c<br>
&gt; @@ -882,6 +882,7 @@ static Property riscv_cpu_extensions[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;Counters&quot;, RISCVCPU, c=
fg.ext_counters, true),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;Zifencei&quot;, RISCVCPU, c=
fg.ext_ifencei, true),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;Zicsr&quot;, RISCVCPU, cfg.=
ext_icsr, true),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;zawrs&quot;, RISCVCPU, cfg.ext_z=
awrs, true),<br>
<br>
Would this be enabled by default?<br></blockquote><div><br></div><div>The &=
quot;true&quot; was a personal preference (I prefer to keep the argument li=
st for QEMU short)</div><div>and I did not see any conflicts with existing =
behavior (no code should break).</div><div>If you prefer otherwise or if I =
missed a policy I will change it.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;Zfh&quot;, RISCVCPU, cfg.ex=
t_zfh, false),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;Zfhmin&quot;, RISCVCPU, cfg=
.ext_zfhmin, false),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;Zve32f&quot;, RISCVCPU, cfg=
.ext_zve32f, false),<br>
&gt; @@ -1075,6 +1076,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, =
char **isa_str, int max_str_len)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zicsr, ext_icsr),<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zifencei, ext_ifence=
i),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zmmul, ext_zmmul),<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zawrs, ext_zawrs),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zfh, ext_zfh),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zfinx, ext_zfinx),<b=
r>
&gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
&gt; index 7d6397acdf..a22bc0fa09 100644<br>
&gt; --- a/target/riscv/cpu.h<br>
&gt; +++ b/target/riscv/cpu.h<br>
&gt; @@ -380,6 +380,7 @@ struct RISCVCPUConfig {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool ext_h;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool ext_j;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool ext_v;<br>
&gt; +=C2=A0 =C2=A0 bool ext_zawrs;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool ext_zba;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool ext_zbb;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool ext_zbc;<br>
&gt; diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode<b=
r>
&gt; index 4033565393..513ea227fe 100644<br>
&gt; --- a/target/riscv/insn32.decode<br>
&gt; +++ b/target/riscv/insn32.decode<br>
&gt; @@ -711,6 +711,10 @@ vsetvli=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 ......=
..... ..... 111 ..... 1010111=C2=A0 @r2_zimm11<br>
&gt;=C2=A0 vsetivli=C2=A0 =C2=A0 =C2=A0 =C2=A0 11 .......... ..... 111 ....=
. 1010111=C2=A0 @r2_zimm10<br>
&gt;=C2=A0 vsetvl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1000000 ..... ..... 111=
 ..... 1010111=C2=A0 @r<br>
&gt;<br>
&gt; +# *** Zawrs Standard Extension ***<br>
&gt; +wrs_nto=C2=A0 =C2=A0 000000001101 00000 000 00000 1110011<br>
&gt; +wrs_sto=C2=A0 =C2=A0 000000011101 00000 000 00000 1110011<br>
&gt; +<br>
&gt;=C2=A0 # *** RV32 Zba Standard Extension ***<br>
&gt;=C2=A0 sh1add=C2=A0 =C2=A0 =C2=A00010000 .......... 010 ..... 0110011 @=
r<br>
&gt;=C2=A0 sh2add=C2=A0 =C2=A0 =C2=A00010000 .......... 100 ..... 0110011 @=
r<br>
&gt; diff --git a/target/riscv/insn_trans/trans_rvzawrs.c.inc b/target/risc=
v/insn_trans/trans_rvzawrs.c.inc<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..d0df56378e<br>
&gt; --- /dev/null<br>
&gt; +++ b/target/riscv/insn_trans/trans_rvzawrs.c.inc<br>
&gt; @@ -0,0 +1,54 @@<br>
&gt; +/*<br>
&gt; + * RISC-V translation routines for the RISC-V Zawrs Extension.<br>
&gt; + *<br>
&gt; + * Copyright (c) 2022 Christoph Muellner, <a href=3D"mailto:christoph=
.muellner@vrull.io" target=3D"_blank">christoph.muellner@vrull.io</a><br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or modi=
fy it<br>
&gt; + * under the terms and conditions of the GNU General Public License,<=
br>
&gt; + * version 2 or later, as published by the Free Software Foundation.<=
br>
&gt; + *<br>
&gt; + * This program is distributed in the hope it will be useful, but WIT=
HOUT<br>
&gt; + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY=
 or<br>
&gt; + * FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU General Public=
 License for<br>
&gt; + * more details.<br>
&gt; + *<br>
&gt; + * You should have received a copy of the GNU General Public License =
along with<br>
&gt; + * this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gnu.org/=
licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/licenses=
/</a>&gt;.<br>
&gt; + */<br>
&gt; +<br>
&gt; +static bool trans_wrs(DisasContext *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 if (!ctx-&gt;cfg_ptr-&gt;ext_zawrs) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* We may continue if one or more of the following=
 conditions are met:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* a) The reservation set is invalid<br>
<br>
Shouldn&#39;t this be valid?<br></blockquote><div><br></div><div>The CPU is=
 supposed to continue (stop waiting) when the reservation set becomes inval=
id.</div><div>An earlier LR instruction registers a reservation set and the=
 WRS.* instructions wait until</div><div>this reservation set becomes inval=
ided by a store from another hart to the same reservation set.</div><div>So=
 I think the description is correct.</div><div>=C2=A0<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* b) If WRS.STO, a short time since start of stal=
l has elapsed<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* c) An interrupt is observed<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* A reservation set can be invalidated by any sto=
re to a reserved<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* memory location. However, that&#39;s currently =
not implemented in QEMU.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* So let&#39;s just exit the CPU loop and pretend=
 that an interrupt occured.<br>
<br>
We don&#39;t actually pretend an interrupt occurs though. It seems like<br>
it&#39;s valid to terminate the stall early, so we should just be able to<b=
r>
do that.<br></blockquote><div><br></div><div>The specification allows stopp=
ing the CPU stall if an interrupt occurs that is disabled.</div><div>I thin=
k that would match the implemented behavior.</div><div><br></div><div>The l=
atest spec update introduced the following sentence:</div><div>&quot;While =
stalled, an implementation is permitted to occasionally terminate the stall=
 and complete execution for any reason.&quot;</div><div>I did not want to u=
se this justification for the implementation, because of the word &quot;occ=
asionally&quot; (the correct word would</div><div>be &quot;always&quot; in =
the implementation). Do you prefer to use this sentence instead?</div><div>=
<br></div><div>Thanks,</div><div>Christoph</div><div><br></div><div><br></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Alistair<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Clear the load reservation=C2=A0 (if any).=C2=A0 */<=
br>
&gt; +=C2=A0 =C2=A0 tcg_gen_movi_tl(load_res, -1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 gen_set_pc_imm(ctx, ctx-&gt;pc_succ_insn);<br>
&gt; +=C2=A0 =C2=A0 tcg_gen_exit_tb(NULL, 0);<br>
&gt; +=C2=A0 =C2=A0 ctx-&gt;base.is_jmp =3D DISAS_NORETURN;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return true;<br>
&gt; +}<br>
&gt; +<br>
&gt; +#define GEN_TRANS_WRS(insn)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +static bool trans_ ## insn(DisasContext *ctx, arg_ ## insn *a)=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0(void)a;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return trans_wrs(ctx);=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +}<br>
&gt; +<br>
&gt; +GEN_TRANS_WRS(wrs_nto)<br>
&gt; +GEN_TRANS_WRS(wrs_sto)<br>
&gt; diff --git a/target/riscv/translate.c b/target/riscv/translate.c<br>
&gt; index b151c20674..a4f07d5166 100644<br>
&gt; --- a/target/riscv/translate.c<br>
&gt; +++ b/target/riscv/translate.c<br>
&gt; @@ -1007,6 +1007,7 @@ static uint32_t opcode_at(DisasContextBase *dcba=
se, target_ulong pc)<br>
&gt;=C2=A0 #include &quot;insn_trans/trans_rvh.c.inc&quot;<br>
&gt;=C2=A0 #include &quot;insn_trans/trans_rvv.c.inc&quot;<br>
&gt;=C2=A0 #include &quot;insn_trans/trans_rvb.c.inc&quot;<br>
&gt; +#include &quot;insn_trans/trans_rvzawrs.c.inc&quot;<br>
&gt;=C2=A0 #include &quot;insn_trans/trans_rvzfh.c.inc&quot;<br>
&gt;=C2=A0 #include &quot;insn_trans/trans_rvk.c.inc&quot;<br>
&gt;=C2=A0 #include &quot;insn_trans/trans_privileged.c.inc&quot;<br>
&gt; --<br>
&gt; 2.35.3<br>
&gt;<br>
&gt;<br>
</blockquote></div></div>

--0000000000005305c505e2698933--

