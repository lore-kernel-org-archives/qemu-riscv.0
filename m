Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1klEec-0007mV-9U
	for mharc-qemu-riscv@gnu.org; Fri, 04 Dec 2020 12:14:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1klEdA-0007Xp-Dc
 for qemu-riscv@nongnu.org; Fri, 04 Dec 2020 12:12:33 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:34516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1klEbP-0006lT-J5
 for qemu-riscv@nongnu.org; Fri, 04 Dec 2020 12:12:14 -0500
Received: by mail-oi1-x22c.google.com with SMTP id s75so3823903oih.1
 for <qemu-riscv@nongnu.org>; Fri, 04 Dec 2020 09:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7W/tyy/845wO9IwOfj4WyncDe7nxDA17WQrzXbrEXxg=;
 b=HCzLuzIff9JyIg5GZUnQelravulSMjRBrgcHlwzurTE7CQTYX6VFjnkTHArWH834U2
 FJdl3JcWgupyL0i6MVgrq9fXCS+IOvBgOS8evXU5f4ZvJAHDmhY6U3Gx7RLJt4AsBC5l
 +Y+1WKT/YJKdfWKfpFiZ8G7p42r5zOKKSFgTqEJc8TAY8m1omLl9C8YwgVp6po2dckRB
 CblJ96CD+hzFdeDFgYCUIAOrFJphAu9JzXxg0q26Pl9esAAhVl7yE/Jp97pE1jx6UG11
 FYl/dTY5IbvqjM51XRrCvNoerkIeqhjUdN1qZzpzChGhOTQTF1cv9nAJyefL/RpcN1nT
 Vn4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7W/tyy/845wO9IwOfj4WyncDe7nxDA17WQrzXbrEXxg=;
 b=rhbsQ5MZPZoMfcr/i6OPQwDUj9u2cKCFSYIblteDoCAfrDQnM2lexe2/bDV+mvZd0K
 YRdl3/hJ+zekMI8xakRyntXOWUkSPahRH/96qqYtRy3hSFhRE9Rszieds9AStj0lRZGa
 GJaTXAZ+MV4azjvbVnovjfNtnHrj2NSDxtzfhEdG5ERpM05l95amA3u3B31rtIwE/rxZ
 Qe5E4Be7ZPDq/u2wPdmLPTJXL6m2cSGEwAJpSmXXs7i5rcmRAgLUGDnM0EoJ8Zc5Pyly
 654ALxD9sjMyhsCzcIKxHvwVQEVOIg9IIP4KfHTPuAatzcZKC5sKNuwIdUaxoVAHBajW
 pEKw==
X-Gm-Message-State: AOAM530OPXDRkIm0Qo1CSlmdrIx3b+HA4PyCg+bwgmJfdw1QwBFxfMS5
 QYGw0ssP6sK35I/gQtvEaHyTngutct2aS3dqJxEe0Q==
X-Google-Smtp-Source: ABdhPJxQpIorAjh5D5tK467V57yK2x52+TMxqKvrL19Kfb6K/K289j3KeygDiuHy6vhMKtJk6Jp6hN9NKJA7Zp+yBac=
X-Received: by 2002:aca:383:: with SMTP id 125mr3826682oid.122.1607101812392; 
 Fri, 04 Dec 2020 09:10:12 -0800 (PST)
MIME-Version: 1.0
References: <20201118083044.13992-1-frank.chang@sifive.com>
 <20201118083044.13992-9-frank.chang@sifive.com>
 <299ed3c1-fcb1-aa34-a595-5f86b8466d18@linaro.org>
 <bbcbfa1c-b34d-147e-a100-cbc998512fe3@linaro.org>
In-Reply-To: <bbcbfa1c-b34d-147e-a100-cbc998512fe3@linaro.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Sat, 5 Dec 2020 01:10:00 +0800
Message-ID: <CAE_xrPi3YoUyKXvxDhdsTJkE7G__yRvfSpEHmEXj9GPKb4dQ-g@mail.gmail.com>
Subject: Re: [RFC 08/15] target/riscv: rvb: single-bit instructions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
Content-Type: multipart/alternative; boundary="000000000000a5648205b5a68cb0"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=frank.chang@sifive.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
X-List-Received-Date: Fri, 04 Dec 2020 17:12:37 -0000

--000000000000a5648205b5a68cb0
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 20, 2020 at 5:04 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 11/19/20 12:35 PM, Richard Henderson wrote:
> > On 11/18/20 12:29 AM, frank.chang@sifive.com wrote:
> >> +static bool trans_sbset(DisasContext *ctx, arg_sbset *a)
> >> +{
> >> +    REQUIRE_EXT(ctx, RVB);
> >> +    return gen_arith(ctx, a, &gen_sbset);
> >> +}
> >> +
> >> +static bool trans_sbseti(DisasContext *ctx, arg_sbseti *a)
> >> +{
> >> +    REQUIRE_EXT(ctx, RVB);
> >> +    return gen_arith_shamt_tl(ctx, a, &gen_sbset);
> >> +}
> >> +
> >> +static bool trans_sbclr(DisasContext *ctx, arg_sbclr *a)
> >> +{
> >> +    REQUIRE_EXT(ctx, RVB);
> >> +    return gen_arith(ctx, a, &gen_sbclr);
> >> +}
> >
> > Coming back to my re-use of code thing, these should use gen_shift.  That
> > handles the truncate of source2 to the shift amount.
> >
> >> +static bool trans_sbclri(DisasContext *ctx, arg_sbclri *a)
> >> +{
> >> +    REQUIRE_EXT(ctx, RVB);
> >> +    return gen_arith_shamt_tl(ctx, a, &gen_sbclr);
> >> +}
> >> +
> >> +static bool trans_sbinv(DisasContext *ctx, arg_sbinv *a)
> >> +{
> >> +    REQUIRE_EXT(ctx, RVB);
> >> +    return gen_arith(ctx, a, &gen_sbinv);
> >> +}
> >> +
> >> +static bool trans_sbinvi(DisasContext *ctx, arg_sbinvi *a)
> >> +{
> >> +    REQUIRE_EXT(ctx, RVB);
> >> +    return gen_arith_shamt_tl(ctx, a, &gen_sbinv);
> >> +}
> >
> > I think there ought to be a gen_shifti for these.
>
> Hmm.  I just realized that gen_shifti would have a generator callback with
> a
> constant argument, a-la tcg_gen_shli_tl.
>
> I don't know if it's worth duplicating gen_sbclr et al for a constant
> argument.
>  And the sloi/sroi insns besides.  Perhaps a gen_shifti_var helper instead?
>
> Let me know what you think, but at the moment we're left with an
> incoherent set
> of helpers that seem split along lines that are less than ideal.
>
>
> r~
>

Thanks Richard and sorry for the late reply.....

If we can have gen_shift(), gen_shifti(), gen_shiftw() and gen_shiftiw(),
then we can eliminate the needs of:
gen_arith_shamt_tl(), gen_sbop_shamt(), gen_sbopw_shamt()
and gen_sbopw_common()
and most of the *w version generators can be removed, too.

For *w version, we just need to call gen_shiftw() or gen_shiftiw()
with the reused non-*w version generator.
For example:

  static bool trans_sbclrw(DisasContext *ctx, arg_sbclrw *a)
  {
      REQUIRE_EXT(ctx, RVB);
      return gen_shiftw(ctx, a, &gen_sbclr);
  }

  static bool trans_sbclriw(DisasContext *ctx, arg_sbclriw *a)
  {
      REQUIRE_EXT(ctx, RVB);
      return gen_shiftiw(ctx, a, &gen_sbclr);
  }

both of which can reuse gen_sbclr() generator:

  static void gen_sbclr(TCGv ret, TCGv arg1, TCGv shamt)
  {
      TCGv t = tcg_temp_new();
      tcg_gen_movi_tl(t, 1);
      tcg_gen_shl_tl(t, t, shamt);
      tcg_gen_andc_tl(ret, arg1, t);
      tcg_temp_free(t);
  }

The gen_shift*() I have now are as follow:

  static bool gen_shift(DisasContext *ctx, arg_r *a,
                          void(*func)(TCGv, TCGv, TCGv))
  {
      TCGv source1 = tcg_temp_new();
      TCGv source2 = tcg_temp_new();

      gen_get_gpr(source1, a->rs1);
      gen_get_gpr(source2, a->rs2);

      tcg_gen_andi_tl(source2, source2, TARGET_LONG_BITS - 1);
      (*func)(source1, source1, source2);

      gen_set_gpr(a->rd, source1);
      tcg_temp_free(source1);
      tcg_temp_free(source2);
      return true;
  }

  static bool gen_shifti(DisasContext *ctx, arg_shift *a,
                          void(*func)(TCGv, TCGv, TCGv))
  {
      TCGv source1 = tcg_temp_new();
      TCGv source2 = tcg_temp_new();

     gen_get_gpr(source1, a->rs1);
     tcg_gen_movi_tl(source2, a->shamt);

      tcg_gen_andi_tl(source2, source2, TARGET_LONG_BITS - 1);
      (*func)(source1, source1, source2);

      gen_set_gpr(a->rd, source1);
      tcg_temp_free(source1);
      tcg_temp_free(source2);
      return true;
  }

  static bool gen_shiftw(DisasContext *ctx, arg_r *a,
                          void(*func)(TCGv, TCGv, TCGv))
  {
      TCGv source1 = tcg_temp_new();
      TCGv source2 = tcg_temp_new();

      gen_get_gpr(source1, a->rs1);
      gen_get_gpr(source2, a->rs2);

      tcg_gen_andi_tl(source2, source2, 31);
      (*func)(source1, source1, source2);
      tcg_gen_ext32s_tl(source1, source1);

      gen_set_gpr(a->rd, source1);
      tcg_temp_free(source1);
      tcg_temp_free(source2);
      return true;
  }

  static bool gen_shiftiw(DisasContext *ctx, arg_shift *a,
                          void(*func)(TCGv, TCGv, TCGv))
  {
      TCGv source1 = tcg_temp_new();
      TCGv source2 = tcg_temp_new();

     gen_get_gpr(source1, a->rs1);
     tcg_gen_movi_tl(source2, a->shamt);

     tcg_gen_andi_tl(source2, source2, 31);
     (*func)(source1, source1, source2);
     tcg_gen_ext32s_tl(source1, source1);

      gen_set_gpr(a->rd, source1);
      tcg_temp_free(source1);
      tcg_temp_free(source2);
      return true;
  }

They may be further merged as most of them are duplicate with only the
differences of:
gen_get_gpr(source2, a->rs2); vs. tcg_gen_movi_tl(source2, a->shamt);
TARGET_LONG_BITS - 1 vs. 31, and
tcg_gen_ext32s_tl(); to sign-extend the 32-bit return value for *w
instructions

Any thoughts?

Frank Chang

--000000000000a5648205b5a68cb0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Nov 20, 2020 at 5:04 AM Richard H=
enderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hender=
son@linaro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On 11/19/20 12:35 PM, Richard Hend=
erson wrote:<br>
&gt; On 11/18/20 12:29 AM, <a href=3D"mailto:frank.chang@sifive.com" target=
=3D"_blank">frank.chang@sifive.com</a> wrote:<br>
&gt;&gt; +static bool trans_sbset(DisasContext *ctx, arg_sbset *a)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 REQUIRE_EXT(ctx, RVB);<br>
&gt;&gt; +=C2=A0 =C2=A0 return gen_arith(ctx, a, &amp;gen_sbset);<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static bool trans_sbseti(DisasContext *ctx, arg_sbseti *a)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 REQUIRE_EXT(ctx, RVB);<br>
&gt;&gt; +=C2=A0 =C2=A0 return gen_arith_shamt_tl(ctx, a, &amp;gen_sbset);<=
br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static bool trans_sbclr(DisasContext *ctx, arg_sbclr *a)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 REQUIRE_EXT(ctx, RVB);<br>
&gt;&gt; +=C2=A0 =C2=A0 return gen_arith(ctx, a, &amp;gen_sbclr);<br>
&gt;&gt; +}<br>
&gt; <br>
&gt; Coming back to my re-use of code thing, these should use gen_shift.=C2=
=A0 That<br>
&gt; handles the truncate of source2 to the shift amount.<br>
&gt; <br>
&gt;&gt; +static bool trans_sbclri(DisasContext *ctx, arg_sbclri *a)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 REQUIRE_EXT(ctx, RVB);<br>
&gt;&gt; +=C2=A0 =C2=A0 return gen_arith_shamt_tl(ctx, a, &amp;gen_sbclr);<=
br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static bool trans_sbinv(DisasContext *ctx, arg_sbinv *a)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 REQUIRE_EXT(ctx, RVB);<br>
&gt;&gt; +=C2=A0 =C2=A0 return gen_arith(ctx, a, &amp;gen_sbinv);<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static bool trans_sbinvi(DisasContext *ctx, arg_sbinvi *a)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 REQUIRE_EXT(ctx, RVB);<br>
&gt;&gt; +=C2=A0 =C2=A0 return gen_arith_shamt_tl(ctx, a, &amp;gen_sbinv);<=
br>
&gt;&gt; +}<br>
&gt; <br>
&gt; I think there ought to be a gen_shifti for these.<br>
<br>
Hmm.=C2=A0 I just realized that gen_shifti would have a generator callback =
with a<br>
constant argument, a-la tcg_gen_shli_tl.<br>
<br>
I don&#39;t know if it&#39;s worth duplicating gen_sbclr et al for a consta=
nt argument.<br>
=C2=A0And the sloi/sroi insns besides.=C2=A0 Perhaps a gen_shifti_var helpe=
r instead?<br>
<br>
Let me know what you think, but at the moment we&#39;re left with an incohe=
rent set<br>
of helpers that seem split along lines that are less than ideal.<br>
<br>
<br>
r~<br></blockquote><div><br></div><div>Thanks Richard and sorry for the lat=
e reply.....</div><div><br></div><div>If we can have gen_shift(), gen_shift=
i(), gen_shiftw() and gen_shiftiw(),</div><div>then we can eliminate the ne=
eds of:</div><div>gen_arith_shamt_tl(),=C2=A0gen_sbop_shamt(), gen_sbopw_sh=
amt() and=C2=A0gen_sbopw_common()</div><div>and most of the *w version gene=
rators can be removed, too.</div><div><br></div><div>For *w version, we jus=
t need to call gen_shiftw() or gen_shiftiw()</div><div>with the reused=C2=
=A0non-*w version=C2=A0generator.</div><div>For example:</div><div><br></di=
v><div>=C2=A0 static bool trans_sbclrw(DisasContext *ctx, arg_sbclrw *a)<br=
>=C2=A0 {<br>=C2=A0 =C2=A0 =C2=A0 REQUIRE_EXT(ctx, RVB);<br>=C2=A0 =C2=A0 =
=C2=A0 return gen_shiftw(ctx, a, &amp;gen_sbclr);<br>=C2=A0 }<br><br>=C2=A0=
 static bool trans_sbclriw(DisasContext *ctx, arg_sbclriw *a)<br>=C2=A0 {<b=
r>=C2=A0 =C2=A0 =C2=A0 REQUIRE_EXT(ctx, RVB);<br>=C2=A0 =C2=A0 =C2=A0 retur=
n gen_shiftiw(ctx, a, &amp;gen_sbclr);<br>=C2=A0 }<br></div><div><br></div>=
<div>both of which can reuse gen_sbclr() generator:</div><div><br></div><di=
v>=C2=A0 static void gen_sbclr(TCGv ret, TCGv arg1, TCGv shamt)<br>=C2=A0 {=
<br>=C2=A0 =C2=A0 =C2=A0 TCGv t =3D tcg_temp_new();<br>=C2=A0 =C2=A0 =C2=A0=
 tcg_gen_movi_tl(t, 1);<br>=C2=A0 =C2=A0 =C2=A0 tcg_gen_shl_tl(t, t, shamt)=
;<br>=C2=A0 =C2=A0 =C2=A0 tcg_gen_andc_tl(ret, arg1, t);<br>=C2=A0 =C2=A0 =
=C2=A0 tcg_temp_free(t);<br>=C2=A0 }<br></div><div><br></div><div>The gen_s=
hift*() I have now are as follow:</div><div><br></div><div>=C2=A0 static bo=
ol gen_shift(DisasContext *ctx, arg_r *a,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void(*func)(=
TCGv, TCGv, TCGv))<br>=C2=A0 {<br>=C2=A0 =C2=A0 =C2=A0 TCGv source1 =3D tcg=
_temp_new();<br>=C2=A0 =C2=A0 =C2=A0 TCGv source2 =3D tcg_temp_new();<br><b=
r>=C2=A0 =C2=A0 =C2=A0 gen_get_gpr(source1, a-&gt;rs1);<br>=C2=A0 =C2=A0 =
=C2=A0 gen_get_gpr(source2, a-&gt;rs2);<br><br>=C2=A0 =C2=A0 =C2=A0 tcg_gen=
_andi_tl(source2, source2, TARGET_LONG_BITS - 1);<br>=C2=A0 =C2=A0 =C2=A0 (=
*func)(source1, source1, source2);<br><br>=C2=A0 =C2=A0 =C2=A0 gen_set_gpr(=
a-&gt;rd, source1);<br>=C2=A0 =C2=A0 =C2=A0 tcg_temp_free(source1);<br>=C2=
=A0 =C2=A0 =C2=A0 tcg_temp_free(source2);<br>=C2=A0 =C2=A0 =C2=A0 return tr=
ue;<br>=C2=A0 }<br><br>=C2=A0 static bool gen_shifti(DisasContext *ctx, arg=
_shift *a,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void(*func)(TCGv, TCGv, TCGv))<br>=C2=A0 {<=
br>=C2=A0 =C2=A0 =C2=A0 TCGv source1 =3D tcg_temp_new();<br>=C2=A0 =C2=A0 =
=C2=A0 TCGv source2 =3D tcg_temp_new();<br><br>=C2=A0=C2=A0  =C2=A0 gen_get=
_gpr(source1, a-&gt;rs1);<br>=C2=A0 =C2=A0=C2=A0  tcg_gen_movi_tl(source2, =
a-&gt;shamt);<br><br>=C2=A0 =C2=A0 =C2=A0 tcg_gen_andi_tl(source2, source2,=
 TARGET_LONG_BITS - 1);<br>=C2=A0 =C2=A0 =C2=A0 (*func)(source1, source1, s=
ource2);<br><br>=C2=A0 =C2=A0 =C2=A0 gen_set_gpr(a-&gt;rd, source1);<br>=C2=
=A0 =C2=A0 =C2=A0 tcg_temp_free(source1);<br>=C2=A0 =C2=A0 =C2=A0 tcg_temp_=
free(source2);<br>=C2=A0 =C2=A0 =C2=A0 return true;<br>=C2=A0 }<br><br>=C2=
=A0 static bool gen_shiftw(DisasContext *ctx, arg_r *a,<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 void(*func)(TCGv, TCGv, TCGv))<br>=C2=A0 {<br>=C2=A0 =C2=A0 =C2=A0 TCGv=
 source1 =3D tcg_temp_new();<br>=C2=A0 =C2=A0 =C2=A0 TCGv source2 =3D tcg_t=
emp_new();<br><br>=C2=A0 =C2=A0 =C2=A0 gen_get_gpr(source1, a-&gt;rs1);<br>=
=C2=A0 =C2=A0 =C2=A0 gen_get_gpr(source2, a-&gt;rs2);<br><br>=C2=A0 =C2=A0 =
=C2=A0 tcg_gen_andi_tl(source2, source2, 31);<br>=C2=A0 =C2=A0 =C2=A0 (*fun=
c)(source1, source1, source2);<br>=C2=A0 =C2=A0 =C2=A0 tcg_gen_ext32s_tl(so=
urce1, source1);<br><br>=C2=A0 =C2=A0 =C2=A0 gen_set_gpr(a-&gt;rd, source1)=
;<br>=C2=A0 =C2=A0 =C2=A0 tcg_temp_free(source1);<br>=C2=A0 =C2=A0 =C2=A0 t=
cg_temp_free(source2);<br>=C2=A0 =C2=A0 =C2=A0 return true;<br>=C2=A0 }<br>=
<br>=C2=A0 static bool gen_shiftiw(DisasContext *ctx, arg_shift *a,<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 void(*func)(TCGv, TCGv, TCGv))<br>=C2=A0 {<br>=C2=A0 =C2=A0 =
=C2=A0 TCGv source1 =3D tcg_temp_new();<br>=C2=A0 =C2=A0 =C2=A0 TCGv source=
2 =3D tcg_temp_new();<br><br>=C2=A0 =C2=A0=C2=A0  gen_get_gpr(source1, a-&g=
t;rs1);<br>=C2=A0=C2=A0  =C2=A0 tcg_gen_movi_tl(source2, a-&gt;shamt);<br><=
br>=C2=A0 =C2=A0=C2=A0  tcg_gen_andi_tl(source2, source2, 31);<br>=C2=A0 =
=C2=A0=C2=A0  (*func)(source1, source1, source2);<br>=C2=A0 =C2=A0 =C2=A0tc=
g_gen_ext32s_tl(source1, source1);<br><br>=C2=A0 =C2=A0 =C2=A0 gen_set_gpr(=
a-&gt;rd, source1);<br>=C2=A0 =C2=A0 =C2=A0 tcg_temp_free(source1);<br>=C2=
=A0 =C2=A0 =C2=A0 tcg_temp_free(source2);<br>=C2=A0 =C2=A0 =C2=A0 return tr=
ue;<br>=C2=A0 }<br></div><div><br></div><div>They may be further merged as =
most of them are duplicate with only the differences of:</div><div>gen_get_=
gpr(source2, a-&gt;rs2); vs.=C2=A0tcg_gen_movi_tl(source2, a-&gt;shamt);<br=
></div><div>TARGET_LONG_BITS - 1 vs. 31, and</div><div>tcg_gen_ext32s_tl();=
 to sign-extend the 32-bit return value for *w instructions</div><div><br><=
/div><div>Any thoughts?</div><div><br></div><div>Frank Chang</div></div></d=
iv>

--000000000000a5648205b5a68cb0--

