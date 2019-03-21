Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6zuO-0005tA-5B
	for mharc-qemu-riscv@gnu.org; Thu, 21 Mar 2019 11:47:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <npickito@gmail.com>) id 1h6zog-0004IJ-PO
	for qemu-riscv@nongnu.org; Thu, 21 Mar 2019 11:41:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <npickito@gmail.com>) id 1h6zof-00039e-2n
	for qemu-riscv@nongnu.org; Thu, 21 Mar 2019 11:41:14 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:37351)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <npickito@gmail.com>)
	id 1h6zoa-0002sg-7H; Thu, 21 Mar 2019 11:41:08 -0400
Received: by mail-wr1-x442.google.com with SMTP id w10so5658817wrm.4;
	Thu, 21 Mar 2019 08:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bMScFmq5sq4GH5tU1n2DPh5nEvTe5rclEAXMuW8tNms=;
	b=ZUGrJhJtcKcDB+fPIF7oPYoN+P8UW41h5mz3DTUP9Z/Vq4ban+craDtuk9R/Hi8Pfh
	qr2SL6T3f4kXPWyFg0SNSnI7Yj7HVBBzMPiR37hLUNrMvqmUSNQptJI7Q9k/2ruwOa9J
	Jnx6zJnSqK85fmZ3x76cnu12vm0VcrhpN8L/JKg5rtcN940YqAThdpeUZZ108sef91Gk
	pqYKB9IWtDh5lP6fYO4z1JQyTAfzuWoEfjiopIkYH4UZrei2SRVQCdVmJa3P7Wi8wuHJ
	gC1bNgQZdZ+aK/N+Z3l9KRNsgo+ATtTtOxqMRcfXV0N4dWgolYI+d3MRD4SAgKEIYgS8
	54Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bMScFmq5sq4GH5tU1n2DPh5nEvTe5rclEAXMuW8tNms=;
	b=BvDgjmqldp8o31z97NvHcr+8QLEOcUtZpnHOcqz+tTFyCTVBPFS+3z32sdb12P9lyH
	Lg4TF1uBztmrRG/Hb6YiEZJ/qxSi55GVZZjXppJX+scHYqD8o+o1h++E/MgARF4M0WyU
	WatdPIhl+ET/ijIgPdlZDG2+q8HMcHByzGmGRhrclYRfcHCWf/s874HYtQ+0paIVXQEI
	+DtuWu4uxsWuQjWNnOwpx4YxskIguh+Q51udMUqNnWKe5rDZ88VGVdXYhF9dFQM85/D2
	E3Q+kXEmDwT0nrdsK+nyq2BfMiEFbT+v8GRtAhu9kPp9xzftIX+f+nngEwmhhFuntGM2
	MsQw==
X-Gm-Message-State: APjAAAXlG1JSaa91NVmWa8FcAuvJkoRPkeCpDqf5pSq0UMkXx9sTTW/P
	WK3RP70GwJ4PUbdQLOgJPNgmPTXnzb0UED+vzKY=
X-Google-Smtp-Source: APXvYqwneZF+ZId8FOAIblyQ4mXUtHA61kEW2WMTakWT3iUyPbFCsu89/fI8ErB3Q9ofnazx2y4nKCXUbR8ufleTWjc=
X-Received: by 2002:a05:6000:124a:: with SMTP id
	j10mr3176197wrx.24.1553182866290; 
	Thu, 21 Mar 2019 08:41:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190321145920.20897-1-palmer@sifive.com>
In-Reply-To: <20190321145920.20897-1-palmer@sifive.com>
From: Kito Cheng <kito.cheng@gmail.com>
Date: Thu, 21 Mar 2019 23:40:55 +0800
Message-ID: <CA+yXCZB+i2rT2dXnh2A68K_rMSiG9WOx8wpLXW6Ebu-CHh3a2Q@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000043e1c05849c9179"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
X-Mailman-Approved-At: Thu, 21 Mar 2019 11:47:06 -0400
Subject: Re: [Qemu-riscv] [PATCH] target/riscv: Zero extend the inputs of
 divuw and remuw
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Mar 2019 15:41:16 -0000

--000000000000043e1c05849c9179
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Verified with gcc testsuite on rv64gc, no new regression introduced, and
get less fails.

Palmer Dabbelt <palmer@sifive.com>=E6=96=BC 2019=E5=B9=B43=E6=9C=8821=E6=97=
=A5 =E9=80=B1=E5=9B=9B=EF=BC=8C22:59=E5=AF=AB=E9=81=93=EF=BC=9A

> While running the GCC test suite against 4.0.0-rc0, Kito found a
> regression introduced by the decodetree conversion that caused divuw and
> remuw to sign-extend their inputs.  The ISA manual says they are
> supposed to be zero extended:
>
>     DIVW and DIVUW instructions are only valid for RV64, and divide the
>     lower 32 bits of rs1 by the lower 32 bits of rs2, treating them as
>     signed and unsigned integers respectively, placing the 32-bit
>     quotient in rd, sign-extended to 64 bits. REMW and REMUW
>     instructions are only valid for RV64, and provide the corresponding
>     signed and unsigned remainder operations respectively.  Both REMW
>     and REMUW always sign-extend the 32-bit result to 64 bits, including
>     on a divide by zero.
>
> Here's Kito's reduced test case from the GCC test suite
>
>     unsigned calc_mp(unsigned mod)
>     {
>          unsigned a,b,c;
>          c=3D-1;
>          a=3Dc/mod;
>          b=3D0-a*mod;
>          if (b > mod) { a +=3D 1; b-=3Dmod; }
>          return b;
>     }
>
>     int main(int argc, char *argv[])
>     {
>          unsigned x =3D 1234;
>          unsigned y =3D calc_mp(x);
>
>          if ((sizeof (y) =3D=3D 4 && y !=3D 680)
>       || (sizeof (y) =3D=3D 2 && y !=3D 134))
>     abort ();
>          exit (0);
>     }
>
> I haven't done any other testing on this, but it does fix the test case.
>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> ---
>  target/riscv/insn_trans/trans_rvm.inc.c |  4 ++--
>  target/riscv/translate.c                | 21 +++++++++++++++++++++
>  2 files changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvm.inc.c
> b/target/riscv/insn_trans/trans_rvm.inc.c
> index 204af225f8f3..47cd6edc72a1 100644
> --- a/target/riscv/insn_trans/trans_rvm.inc.c
> +++ b/target/riscv/insn_trans/trans_rvm.inc.c
> @@ -103,7 +103,7 @@ static bool trans_divw(DisasContext *ctx, arg_divw *a=
)
>  static bool trans_divuw(DisasContext *ctx, arg_divuw *a)
>  {
>      REQUIRE_EXT(ctx, RVM);
> -    return gen_arith_div_w(ctx, a, &gen_divu);
> +    return gen_arith_div_uw(ctx, a, &gen_divu);
>  }
>
>  static bool trans_remw(DisasContext *ctx, arg_remw *a)
> @@ -115,6 +115,6 @@ static bool trans_remw(DisasContext *ctx, arg_remw *a=
)
>  static bool trans_remuw(DisasContext *ctx, arg_remuw *a)
>  {
>      REQUIRE_EXT(ctx, RVM);
> -    return gen_arith_div_w(ctx, a, &gen_remu);
> +    return gen_arith_div_uw(ctx, a, &gen_remu);
>  }
>  #endif
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 049fa65c6611..dd763647ea55 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -600,6 +600,27 @@ static bool gen_arith_div_w(DisasContext *ctx, arg_r
> *a,
>      return true;
>  }
>
> +static bool gen_arith_div_uw(DisasContext *ctx, arg_r *a,
> +                            void(*func)(TCGv, TCGv, TCGv))
> +{
> +    TCGv source1, source2;
> +    source1 =3D tcg_temp_new();
> +    source2 =3D tcg_temp_new();
> +
> +    gen_get_gpr(source1, a->rs1);
> +    gen_get_gpr(source2, a->rs2);
> +    tcg_gen_ext32u_tl(source1, source1);
> +    tcg_gen_ext32u_tl(source2, source2);
> +
> +    (*func)(source1, source1, source2);
> +
> +    tcg_gen_ext32s_tl(source1, source1);
> +    gen_set_gpr(a->rd, source1);
> +    tcg_temp_free(source1);
> +    tcg_temp_free(source2);
> +    return true;
> +}
> +
>  #endif
>
>  static bool gen_arith(DisasContext *ctx, arg_r *a,
> --
> 2.19.2
>
>

--000000000000043e1c05849c9179
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Verified with gcc testsuite on rv64gc, no new regres=
sion introduced, and get less fails.</div></div><div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">Palmer Dabbelt &lt;<a href=
=3D"mailto:palmer@sifive.com">palmer@sifive.com</a>&gt;=E6=96=BC 2019=E5=B9=
=B43=E6=9C=8821=E6=97=A5 =E9=80=B1=E5=9B=9B=EF=BC=8C22:59=E5=AF=AB=E9=81=93=
=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">While running the GCC tes=
t suite against 4.0.0-rc0, Kito found a<br>
regression introduced by the decodetree conversion that caused divuw and<br=
>
remuw to sign-extend their inputs.=C2=A0 The ISA manual says they are<br>
supposed to be zero extended:<br>
<br>
=C2=A0 =C2=A0 DIVW and DIVUW instructions are only valid for RV64, and divi=
de the<br>
=C2=A0 =C2=A0 lower 32 bits of rs1 by the lower 32 bits of rs2, treating th=
em as<br>
=C2=A0 =C2=A0 signed and unsigned integers respectively, placing the 32-bit=
<br>
=C2=A0 =C2=A0 quotient in rd, sign-extended to 64 bits. REMW and REMUW<br>
=C2=A0 =C2=A0 instructions are only valid for RV64, and provide the corresp=
onding<br>
=C2=A0 =C2=A0 signed and unsigned remainder operations respectively.=C2=A0 =
Both REMW<br>
=C2=A0 =C2=A0 and REMUW always sign-extend the 32-bit result to 64 bits, in=
cluding<br>
=C2=A0 =C2=A0 on a divide by zero.<br>
<br>
Here&#39;s Kito&#39;s reduced test case from the GCC test suite<br>
<br>
=C2=A0 =C2=A0 unsigned calc_mp(unsigned mod)<br>
=C2=A0 =C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned a,b,c;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c=3D-1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a=3Dc/mod;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b=3D0-a*mod;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (b &gt; mod) { a +=3D 1; b-=3Dmod; }<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return b;<br>
=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 int main(int argc, char *argv[])<br>
=C2=A0 =C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned x =3D 1234;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned y =3D calc_mp(x);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((sizeof (y) =3D=3D 4 &amp;&amp; y !=
=3D 680)<br>
=C2=A0 =C2=A0 =C2=A0 || (sizeof (y) =3D=3D 2 &amp;&amp; y !=3D 134))<br>
=C2=A0 =C2=A0 abort ();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit (0);<br>
=C2=A0 =C2=A0 }<br>
<br>
I haven&#39;t done any other testing on this, but it does fix the test case=
.<br>
<br>
Signed-off-by: Palmer Dabbelt &lt;<a href=3D"mailto:palmer@sifive.com" targ=
et=3D"_blank">palmer@sifive.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/insn_trans/trans_rvm.inc.c |=C2=A0 4 ++--<br>
=C2=A0target/riscv/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 21 +++++++++++++++++++++<br>
=C2=A02 files changed, 23 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/target/riscv/insn_trans/trans_rvm.inc.c b/target/riscv/insn_tr=
ans/trans_rvm.inc.c<br>
index 204af225f8f3..47cd6edc72a1 100644<br>
--- a/target/riscv/insn_trans/trans_rvm.inc.c<br>
+++ b/target/riscv/insn_trans/trans_rvm.inc.c<br>
@@ -103,7 +103,7 @@ static bool trans_divw(DisasContext *ctx, arg_divw *a)<=
br>
=C2=A0static bool trans_divuw(DisasContext *ctx, arg_divuw *a)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0REQUIRE_EXT(ctx, RVM);<br>
-=C2=A0 =C2=A0 return gen_arith_div_w(ctx, a, &amp;gen_divu);<br>
+=C2=A0 =C2=A0 return gen_arith_div_uw(ctx, a, &amp;gen_divu);<br>
=C2=A0}<br>
<br>
=C2=A0static bool trans_remw(DisasContext *ctx, arg_remw *a)<br>
@@ -115,6 +115,6 @@ static bool trans_remw(DisasContext *ctx, arg_remw *a)<=
br>
=C2=A0static bool trans_remuw(DisasContext *ctx, arg_remuw *a)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0REQUIRE_EXT(ctx, RVM);<br>
-=C2=A0 =C2=A0 return gen_arith_div_w(ctx, a, &amp;gen_remu);<br>
+=C2=A0 =C2=A0 return gen_arith_div_uw(ctx, a, &amp;gen_remu);<br>
=C2=A0}<br>
=C2=A0#endif<br>
diff --git a/target/riscv/translate.c b/target/riscv/translate.c<br>
index 049fa65c6611..dd763647ea55 100644<br>
--- a/target/riscv/translate.c<br>
+++ b/target/riscv/translate.c<br>
@@ -600,6 +600,27 @@ static bool gen_arith_div_w(DisasContext *ctx, arg_r *=
a,<br>
=C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0}<br>
<br>
+static bool gen_arith_div_uw(DisasContext *ctx, arg_r *a,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 void(*func)(TCGv, TCGv, TCGv))<br>
+{<br>
+=C2=A0 =C2=A0 TCGv source1, source2;<br>
+=C2=A0 =C2=A0 source1 =3D tcg_temp_new();<br>
+=C2=A0 =C2=A0 source2 =3D tcg_temp_new();<br>
+<br>
+=C2=A0 =C2=A0 gen_get_gpr(source1, a-&gt;rs1);<br>
+=C2=A0 =C2=A0 gen_get_gpr(source2, a-&gt;rs2);<br>
+=C2=A0 =C2=A0 tcg_gen_ext32u_tl(source1, source1);<br>
+=C2=A0 =C2=A0 tcg_gen_ext32u_tl(source2, source2);<br>
+<br>
+=C2=A0 =C2=A0 (*func)(source1, source1, source2);<br>
+<br>
+=C2=A0 =C2=A0 tcg_gen_ext32s_tl(source1, source1);<br>
+=C2=A0 =C2=A0 gen_set_gpr(a-&gt;rd, source1);<br>
+=C2=A0 =C2=A0 tcg_temp_free(source1);<br>
+=C2=A0 =C2=A0 tcg_temp_free(source2);<br>
+=C2=A0 =C2=A0 return true;<br>
+}<br>
+<br>
=C2=A0#endif<br>
<br>
=C2=A0static bool gen_arith(DisasContext *ctx, arg_r *a,<br>
-- <br>
2.19.2<br>
<br>
</blockquote></div></div>

--000000000000043e1c05849c9179--

