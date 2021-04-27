Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lbHv8-0003o7-HE
	for mharc-qemu-riscv@gnu.org; Tue, 27 Apr 2021 03:14:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <0xc0de0125@gmail.com>)
 id 1lbHv6-0003mx-MB; Tue, 27 Apr 2021 03:14:08 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:55852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <0xc0de0125@gmail.com>)
 id 1lbHv2-0006BE-5E; Tue, 27 Apr 2021 03:14:08 -0400
Received: by mail-pj1-x1033.google.com with SMTP id s14so23546303pjl.5;
 Tue, 27 Apr 2021 00:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x9Z6z8NQtmBLereJz5jU1+LCMBsIKqUnTGpj2b1DYyU=;
 b=eJ/OJ9uFrd9ugbRx7pLV8aaEajNvWvrSm6fmnPlzChVuXODgR4B5LuGpyKycbM7pdJ
 a4uZtC3y+w8BwgWXF2z5WkXIJ7laL+CjyWIg6Rwj1qq7cawB5EuMvaj58/IZrzCAlUFo
 PpRISfpEqLOxVu6kKboVbVAxIdEdz/tZ+4jPOWcJ6W8eKU6QbB7nIc2xaE4s3yGIEPOr
 St9gVDE8v9TFizGxoShE4IRXAr4riPqcDNFHdBbRlYx+omP8Y9i5GrqedIjKndi0Chs9
 Vz+TiS8F9eC3KR8ZFb97SSOBdvQ/r1FwEKPNDQYljlheMTj0NZq3SlNYuHu1GmAC4liY
 wu4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x9Z6z8NQtmBLereJz5jU1+LCMBsIKqUnTGpj2b1DYyU=;
 b=kDJ2A6xRrRABPDv6DVh3s++38cR9pDqhBgnivzDKmlAN2Pf57riggNoELaUlaYXUu4
 ZEHU6UYII4yy0L2JImaCawMRHnHIkXOK87pVM7Gc/TtFmP6qQEBKCpTugYcdvob+qo8G
 8gAn+CnphUrNCg2tM2h6jXdGMtkn/Rvdi5fd7TwLIfpIH8uZ1ddJULkEdh87oePOo7TW
 kJIVXvcfzHqmVjgc0U0Kte7GJ0hyHK3T7KdO+49qjK+IpaGd4Qhk5s0QwOkpkbZBdIe1
 tQcTBqKBmdT22StB/P9LBvtHC5Z4r4qL7DvXpnkZlEQx5feRwZBH5h+2AfEgwaRu/Gy6
 B6NA==
X-Gm-Message-State: AOAM531qpnKhaS7n0JL2D+iwbQrKq6xVFRRVA5dF7clfNlMwN1psjUvs
 ZL3LUba9yl7Ufz9TvqSRmi5o1iFGkni6XpIKGic=
X-Google-Smtp-Source: ABdhPJw7NPv4h7uMuNIv7dlwMBoHoJpY2iLLp8jCyzYRQhN+P3m63D7ZLdwoItxoPyCr2Sw7LPB9ftPPxFjlsz6n3jY=
X-Received: by 2002:a17:90a:1150:: with SMTP id
 d16mr18579696pje.47.1619507640314; 
 Tue, 27 Apr 2021 00:14:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210421041400.22243-1-frank.chang@sifive.com>
 <20210421041400.22243-3-frank.chang@sifive.com>
 <CAKmqyKNVc6gRz5NZEYEWLJdqZ99MJ9=CVuk7Q0fmJhVb_rDhNA@mail.gmail.com>
In-Reply-To: <CAKmqyKNVc6gRz5NZEYEWLJdqZ99MJ9=CVuk7Q0fmJhVb_rDhNA@mail.gmail.com>
From: Frank Chang <0xc0de0125@gmail.com>
Date: Tue, 27 Apr 2021 15:13:49 +0800
Message-ID: <CANzO1D32WTT9su3-hiAEU9x+K3jHw-S3-N1eOpdbWMHF6N+7kg@mail.gmail.com>
Subject: Re: [PATCH v5 02/17] target/riscv: rvb: count leading/trailing zeros
To: Alistair Francis <alistair23@gmail.com>
Cc: Frank Chang <frank.chang@sifive.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
Content-Type: multipart/alternative; boundary="0000000000009cb02105c0ef0146"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=0xc0de0125@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Apr 2021 07:14:08 -0000

--0000000000009cb02105c0ef0146
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alistair Francis <alistair23@gmail.com> =E6=96=BC 2021=E5=B9=B44=E6=9C=8827=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=882:05=E5=AF=AB=E9=81=93=EF=BC=
=9A

> On Wed, Apr 21, 2021 at 2:14 PM <frank.chang@sifive.com> wrote:
> >
> > From: Kito Cheng <kito.cheng@sifive.com>
> >
> > Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> > Signed-off-by: Frank Chang <frank.chang@sifive.com>
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  target/riscv/insn32-64.decode           |  4 +++
> >  target/riscv/insn32.decode              |  7 +++-
> >  target/riscv/insn_trans/trans_rvb.c.inc | 47 +++++++++++++++++++++++++
> >  target/riscv/translate.c                | 42 ++++++++++++++++++++++
> >  4 files changed, 99 insertions(+), 1 deletion(-)
> >  create mode 100644 target/riscv/insn_trans/trans_rvb.c.inc
> >
> > diff --git a/target/riscv/insn32-64.decode
> b/target/riscv/insn32-64.decode
> > index 8157dee8b7c..f4c42720fc7 100644
> > --- a/target/riscv/insn32-64.decode
> > +++ b/target/riscv/insn32-64.decode
> > @@ -86,3 +86,7 @@ fmv_d_x    1111001  00000 ..... 000 ..... 1010011 @r2
> >  hlv_wu    0110100  00001   ..... 100 ..... 1110011 @r2
> >  hlv_d     0110110  00000   ..... 100 ..... 1110011 @r2
> >  hsv_d     0110111  .....   ..... 100 00000 1110011 @r2_s
> > +
> > +# *** RV64B Standard Extension (in addition to RV32B) ***
> > +clzw       0110000 00000 ..... 001 ..... 0011011 @r2
> > +ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
> > diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> > index 3823b3ea800..8fe838cf0d0 100644
> > --- a/target/riscv/insn32.decode
> > +++ b/target/riscv/insn32.decode
> > @@ -40,6 +40,7 @@
> >  &i    imm rs1 rd
> >  &j    imm rd
> >  &r    rd rs1 rs2
> > +&r2   rd rs1
> >  &s    imm rs1 rs2
> >  &u    imm rd
> >  &shift     shamt rs1 rd
> > @@ -67,7 +68,7 @@
> >  @r4_rm   ..... ..  ..... ..... ... ..... ....... %rs3 %rs2 %rs1 %rm %r=
d
> >  @r_rm    .......   ..... ..... ... ..... ....... %rs2 %rs1 %rm %rd
> >  @r2_rm   .......   ..... ..... ... ..... ....... %rs1 %rm %rd
> > -@r2      .......   ..... ..... ... ..... ....... %rs1 %rd
> > +@r2      .......   ..... ..... ... ..... ....... &r2 %rs1 %rd
> >  @r2_nfvm ... ... vm:1 ..... ..... ... ..... ....... &r2nfvm %nf %rs1 %=
rd
> >  @r2_vm   ...... vm:1 ..... ..... ... ..... ....... &rmr %rs2 %rd
> >  @r1_vm   ...... vm:1 ..... ..... ... ..... ....... %rd
> > @@ -592,3 +593,7 @@ vcompress_vm    010111 - ..... ..... 010 .....
> 1010111 @r
> >
> >  vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
> >  vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
> > +
> > +# *** RV32B Standard Extension ***
> > +clz        011000 000000 ..... 001 ..... 0010011 @r2
> > +ctz        011000 000001 ..... 001 ..... 0010011 @r2
> > diff --git a/target/riscv/insn_trans/trans_rvb.c.inc
> b/target/riscv/insn_trans/trans_rvb.c.inc
> > new file mode 100644
> > index 00000000000..76788c2f353
> > --- /dev/null
> > +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> > @@ -0,0 +1,47 @@
> > +/*
> > + * RISC-V translation routines for the RVB Standard Extension.
> > + *
> > + * Copyright (c) 2020 Kito Cheng, kito.cheng@sifive.com
> > + * Copyright (c) 2020 Frank Chang, frank.chang@sifive.com
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
> > +static bool trans_clz(DisasContext *ctx, arg_clz *a)
> > +{
> > +    REQUIRE_EXT(ctx, RVB);
> > +    return gen_unary(ctx, a, gen_clz);
> > +}
> > +
> > +static bool trans_ctz(DisasContext *ctx, arg_ctz *a)
> > +{
> > +    REQUIRE_EXT(ctx, RVB);
> > +    return gen_unary(ctx, a, gen_ctz);
> > +}
> > +
> > +/* RV64-only instructions */
> > +#ifdef TARGET_RISCV64
> > +
> > +static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
> > +{
> > +    REQUIRE_EXT(ctx, RVB);
> > +    return gen_unary(ctx, a, gen_clzw);
> > +}
> > +
> > +static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a)
> > +{
> > +    REQUIRE_EXT(ctx, RVB);
> > +    return gen_unary(ctx, a, gen_ctzw);
> > +}
> > +
> > +#endif
> > diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> > index 2f9f5ccc621..4648c422f42 100644
> > --- a/target/riscv/translate.c
> > +++ b/target/riscv/translate.c
> > @@ -536,6 +536,23 @@ static bool gen_arith_div_uw(DisasContext *ctx,
> arg_r *a,
> >
> >  #endif
> >
> > +#ifdef TARGET_RISCV64
>
> Thanks for the patches!
>
> Unfortunately this will need to be rebased and updated. We don't want
> any more #ifdef's on the RISC-V xlen. The idea is to make the XLEN not
> just a compile time constant.
>
> The latest riscv-to-apply.next tree has changes to allow you to do
> this. See this commit for what this will look like:
>
> https://github.com/alistair23/qemu/commit/4965ae3f6f3838e651d1a33050b15b4=
ca3d822a0
>
> The changes should be in master after the 6.0 release.
>
> Alistair
>

Thanks, I will rebase my patchset.

Frank Chang


>
> > +
> > +static void gen_ctzw(TCGv ret, TCGv arg1)
> > +{
> > +    tcg_gen_ori_i64(ret, arg1, MAKE_64BIT_MASK(32, 32));
> > +    tcg_gen_ctzi_i64(ret, ret, 64);
> > +}
> > +
> > +static void gen_clzw(TCGv ret, TCGv arg1)
> > +{
> > +    tcg_gen_ext32u_i64(ret, arg1);
> > +    tcg_gen_clzi_i64(ret, ret, 64);
> > +    tcg_gen_subi_i64(ret, ret, 32);
> > +}
> > +
> > +#endif
> > +
> >  static bool gen_arith(DisasContext *ctx, arg_r *a,
> >                        void(*func)(TCGv, TCGv, TCGv))
> >  {
> > @@ -581,6 +598,30 @@ static uint32_t opcode_at(DisasContextBase *dcbase=
,
> target_ulong pc)
> >      return cpu_ldl_code(env, pc);
> >  }
> >
> > +static void gen_ctz(TCGv ret, TCGv arg1)
> > +{
> > +    tcg_gen_ctzi_tl(ret, arg1, TARGET_LONG_BITS);
> > +}
> > +
> > +static void gen_clz(TCGv ret, TCGv arg1)
> > +{
> > +    tcg_gen_clzi_tl(ret, arg1, TARGET_LONG_BITS);
> > +}
> > +
> > +static bool gen_unary(DisasContext *ctx, arg_r2 *a,
> > +                      void(*func)(TCGv, TCGv))
> > +{
> > +    TCGv source =3D tcg_temp_new();
> > +
> > +    gen_get_gpr(source, a->rs1);
> > +
> > +    (*func)(source, source);
> > +
> > +    gen_set_gpr(a->rd, source);
> > +    tcg_temp_free(source);
> > +    return true;
> > +}
> > +
> >  /* Include insn module translation function */
> >  #include "insn_trans/trans_rvi.c.inc"
> >  #include "insn_trans/trans_rvm.c.inc"
> > @@ -589,6 +630,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase,
> target_ulong pc)
> >  #include "insn_trans/trans_rvd.c.inc"
> >  #include "insn_trans/trans_rvh.c.inc"
> >  #include "insn_trans/trans_rvv.c.inc"
> > +#include "insn_trans/trans_rvb.c.inc"
> >  #include "insn_trans/trans_privileged.c.inc"
> >
> >  /* Include the auto-generated decoder for 16 bit insn */
> > --
> > 2.17.1
> >
> >
>
>

--0000000000009cb02105c0ef0146
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Alistair Francis &lt;<a href=3D"mailto:al=
istair23@gmail.com">alistair23@gmail.com</a>&gt; =E6=96=BC 2021=E5=B9=B44=
=E6=9C=8827=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=882:05=E5=AF=AB=E9=
=81=93=EF=BC=9A<br></div><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">On Wed, Apr 21, 2021 at 2:14 PM &lt;<a href=3D"m=
ailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a>&=
gt; wrote:<br>
&gt;<br>
&gt; From: Kito Cheng &lt;<a href=3D"mailto:kito.cheng@sifive.com" target=
=3D"_blank">kito.cheng@sifive.com</a>&gt;<br>
&gt;<br>
&gt; Signed-off-by: Kito Cheng &lt;<a href=3D"mailto:kito.cheng@sifive.com"=
 target=3D"_blank">kito.cheng@sifive.com</a>&gt;<br>
&gt; Signed-off-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.co=
m" target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt; Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson=
@linaro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 target/riscv/insn32-64.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 4 +++<br>
&gt;=C2=A0 target/riscv/insn32.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 7 +++-<br>
&gt;=C2=A0 target/riscv/insn_trans/trans_rvb.c.inc | 47 +++++++++++++++++++=
++++++<br>
&gt;=C2=A0 target/riscv/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 42 ++++++++++++++++++++++<br>
&gt;=C2=A0 4 files changed, 99 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 create mode 100644 target/riscv/insn_trans/trans_rvb.c.inc<br>
&gt;<br>
&gt; diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.de=
code<br>
&gt; index 8157dee8b7c..f4c42720fc7 100644<br>
&gt; --- a/target/riscv/insn32-64.decode<br>
&gt; +++ b/target/riscv/insn32-64.decode<br>
&gt; @@ -86,3 +86,7 @@ fmv_d_x=C2=A0 =C2=A0 1111001=C2=A0 00000 ..... 000 .=
.... 1010011 @r2<br>
&gt;=C2=A0 hlv_wu=C2=A0 =C2=A0 0110100=C2=A0 00001=C2=A0 =C2=A0..... 100 ..=
... 1110011 @r2<br>
&gt;=C2=A0 hlv_d=C2=A0 =C2=A0 =C2=A00110110=C2=A0 00000=C2=A0 =C2=A0..... 1=
00 ..... 1110011 @r2<br>
&gt;=C2=A0 hsv_d=C2=A0 =C2=A0 =C2=A00110111=C2=A0 .....=C2=A0 =C2=A0..... 1=
00 00000 1110011 @r2_s<br>
&gt; +<br>
&gt; +# *** RV64B Standard Extension (in addition to RV32B) ***<br>
&gt; +clzw=C2=A0 =C2=A0 =C2=A0 =C2=A00110000 00000 ..... 001 ..... 0011011 =
@r2<br>
&gt; +ctzw=C2=A0 =C2=A0 =C2=A0 =C2=A00110000 00001 ..... 001 ..... 0011011 =
@r2<br>
&gt; diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode<b=
r>
&gt; index 3823b3ea800..8fe838cf0d0 100644<br>
&gt; --- a/target/riscv/insn32.decode<br>
&gt; +++ b/target/riscv/insn32.decode<br>
&gt; @@ -40,6 +40,7 @@<br>
&gt;=C2=A0 &amp;i=C2=A0 =C2=A0 imm rs1 rd<br>
&gt;=C2=A0 &amp;j=C2=A0 =C2=A0 imm rd<br>
&gt;=C2=A0 &amp;r=C2=A0 =C2=A0 rd rs1 rs2<br>
&gt; +&amp;r2=C2=A0 =C2=A0rd rs1<br>
&gt;=C2=A0 &amp;s=C2=A0 =C2=A0 imm rs1 rs2<br>
&gt;=C2=A0 &amp;u=C2=A0 =C2=A0 imm rd<br>
&gt;=C2=A0 &amp;shift=C2=A0 =C2=A0 =C2=A0shamt rs1 rd<br>
&gt; @@ -67,7 +68,7 @@<br>
&gt;=C2=A0 @r4_rm=C2=A0 =C2=A0..... ..=C2=A0 ..... ..... ... ..... ....... =
%rs3 %rs2 %rs1 %rm %rd<br>
&gt;=C2=A0 @r_rm=C2=A0 =C2=A0 .......=C2=A0 =C2=A0..... ..... ... ..... ...=
.... %rs2 %rs1 %rm %rd<br>
&gt;=C2=A0 @r2_rm=C2=A0 =C2=A0.......=C2=A0 =C2=A0..... ..... ... ..... ...=
.... %rs1 %rm %rd<br>
&gt; -@r2=C2=A0 =C2=A0 =C2=A0 .......=C2=A0 =C2=A0..... ..... ... ..... ...=
.... %rs1 %rd<br>
&gt; +@r2=C2=A0 =C2=A0 =C2=A0 .......=C2=A0 =C2=A0..... ..... ... ..... ...=
.... &amp;r2 %rs1 %rd<br>
&gt;=C2=A0 @r2_nfvm ... ... vm:1 ..... ..... ... ..... ....... &amp;r2nfvm =
%nf %rs1 %rd<br>
&gt;=C2=A0 @r2_vm=C2=A0 =C2=A0...... vm:1 ..... ..... ... ..... ....... &am=
p;rmr %rs2 %rd<br>
&gt;=C2=A0 @r1_vm=C2=A0 =C2=A0...... vm:1 ..... ..... ... ..... ....... %rd=
<br>
&gt; @@ -592,3 +593,7 @@ vcompress_vm=C2=A0 =C2=A0 010111 - ..... ..... 010=
 ..... 1010111 @r<br>
&gt;<br>
&gt;=C2=A0 vsetvli=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 ........... ..... 111=
 ..... 1010111=C2=A0 @r2_zimm<br>
&gt;=C2=A0 vsetvl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1000000 ..... ..... 111=
 ..... 1010111=C2=A0 @r<br>
&gt; +<br>
&gt; +# *** RV32B Standard Extension ***<br>
&gt; +clz=C2=A0 =C2=A0 =C2=A0 =C2=A0 011000 000000 ..... 001 ..... 0010011 =
@r2<br>
&gt; +ctz=C2=A0 =C2=A0 =C2=A0 =C2=A0 011000 000001 ..... 001 ..... 0010011 =
@r2<br>
&gt; diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/in=
sn_trans/trans_rvb.c.inc<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..76788c2f353<br>
&gt; --- /dev/null<br>
&gt; +++ b/target/riscv/insn_trans/trans_rvb.c.inc<br>
&gt; @@ -0,0 +1,47 @@<br>
&gt; +/*<br>
&gt; + * RISC-V translation routines for the RVB Standard Extension.<br>
&gt; + *<br>
&gt; + * Copyright (c) 2020 Kito Cheng, <a href=3D"mailto:kito.cheng@sifive=
.com" target=3D"_blank">kito.cheng@sifive.com</a><br>
&gt; + * Copyright (c) 2020 Frank Chang, <a href=3D"mailto:frank.chang@sifi=
ve.com" target=3D"_blank">frank.chang@sifive.com</a><br>
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
&gt; +static bool trans_clz(DisasContext *ctx, arg_clz *a)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 REQUIRE_EXT(ctx, RVB);<br>
&gt; +=C2=A0 =C2=A0 return gen_unary(ctx, a, gen_clz);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static bool trans_ctz(DisasContext *ctx, arg_ctz *a)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 REQUIRE_EXT(ctx, RVB);<br>
&gt; +=C2=A0 =C2=A0 return gen_unary(ctx, a, gen_ctz);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* RV64-only instructions */<br>
&gt; +#ifdef TARGET_RISCV64<br>
&gt; +<br>
&gt; +static bool trans_clzw(DisasContext *ctx, arg_clzw *a)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 REQUIRE_EXT(ctx, RVB);<br>
&gt; +=C2=A0 =C2=A0 return gen_unary(ctx, a, gen_clzw);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 REQUIRE_EXT(ctx, RVB);<br>
&gt; +=C2=A0 =C2=A0 return gen_unary(ctx, a, gen_ctzw);<br>
&gt; +}<br>
&gt; +<br>
&gt; +#endif<br>
&gt; diff --git a/target/riscv/translate.c b/target/riscv/translate.c<br>
&gt; index 2f9f5ccc621..4648c422f42 100644<br>
&gt; --- a/target/riscv/translate.c<br>
&gt; +++ b/target/riscv/translate.c<br>
&gt; @@ -536,6 +536,23 @@ static bool gen_arith_div_uw(DisasContext *ctx, a=
rg_r *a,<br>
&gt;<br>
&gt;=C2=A0 #endif<br>
&gt;<br>
&gt; +#ifdef TARGET_RISCV64<br>
<br>
Thanks for the patches!<br>
<br>
Unfortunately this will need to be rebased and updated. We don&#39;t want<b=
r>
any more #ifdef&#39;s on the RISC-V xlen. The idea is to make the XLEN not<=
br>
just a compile time constant.<br>
<br>
The latest riscv-to-apply.next tree has changes to allow you to do<br>
this. See this commit for what this will look like:<br>
<a href=3D"https://github.com/alistair23/qemu/commit/4965ae3f6f3838e651d1a3=
3050b15b4ca3d822a0" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/alistair23/qemu/commit/4965ae3f6f3838e651d1a33050b15b4ca3d822a0</a><br>
<br>
The changes should be in master after the 6.0 release.<br>
<br>
Alistair<br></blockquote><div><br></div><div>Thanks, I will rebase my patch=
set.</div><div><br></div><div>Frank Chang</div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +<br>
&gt; +static void gen_ctzw(TCGv ret, TCGv arg1)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 tcg_gen_ori_i64(ret, arg1, MAKE_64BIT_MASK(32, 32));<br=
>
&gt; +=C2=A0 =C2=A0 tcg_gen_ctzi_i64(ret, ret, 64);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void gen_clzw(TCGv ret, TCGv arg1)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 tcg_gen_ext32u_i64(ret, arg1);<br>
&gt; +=C2=A0 =C2=A0 tcg_gen_clzi_i64(ret, ret, 64);<br>
&gt; +=C2=A0 =C2=A0 tcg_gen_subi_i64(ret, ret, 32);<br>
&gt; +}<br>
&gt; +<br>
&gt; +#endif<br>
&gt; +<br>
&gt;=C2=A0 static bool gen_arith(DisasContext *ctx, arg_r *a,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 void(*func)(TCGv, TCGv, TCGv))<br>
&gt;=C2=A0 {<br>
&gt; @@ -581,6 +598,30 @@ static uint32_t opcode_at(DisasContextBase *dcbas=
e, target_ulong pc)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return cpu_ldl_code(env, pc);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +static void gen_ctz(TCGv ret, TCGv arg1)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 tcg_gen_ctzi_tl(ret, arg1, TARGET_LONG_BITS);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void gen_clz(TCGv ret, TCGv arg1)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 tcg_gen_clzi_tl(ret, arg1, TARGET_LONG_BITS);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static bool gen_unary(DisasContext *ctx, arg_r2 *a,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 void(*func)(TCGv, TCGv))<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 TCGv source =3D tcg_temp_new();<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 gen_get_gpr(source, a-&gt;rs1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 (*func)(source, source);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 gen_set_gpr(a-&gt;rd, source);<br>
&gt; +=C2=A0 =C2=A0 tcg_temp_free(source);<br>
&gt; +=C2=A0 =C2=A0 return true;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 /* Include insn module translation function */<br>
&gt;=C2=A0 #include &quot;insn_trans/trans_rvi.c.inc&quot;<br>
&gt;=C2=A0 #include &quot;insn_trans/trans_rvm.c.inc&quot;<br>
&gt; @@ -589,6 +630,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase=
, target_ulong pc)<br>
&gt;=C2=A0 #include &quot;insn_trans/trans_rvd.c.inc&quot;<br>
&gt;=C2=A0 #include &quot;insn_trans/trans_rvh.c.inc&quot;<br>
&gt;=C2=A0 #include &quot;insn_trans/trans_rvv.c.inc&quot;<br>
&gt; +#include &quot;insn_trans/trans_rvb.c.inc&quot;<br>
&gt;=C2=A0 #include &quot;insn_trans/trans_privileged.c.inc&quot;<br>
&gt;<br>
&gt;=C2=A0 /* Include the auto-generated decoder for 16 bit insn */<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt;<br>
<br>
</blockquote></div></div>

--0000000000009cb02105c0ef0146--

