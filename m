Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gyXdk-0003e3-3D
	for mharc-qemu-riscv@gnu.org; Tue, 26 Feb 2019 02:59:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33947)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amagdy.afifi@gmail.com>) id 1gyXdh-0003cR-C2
	for qemu-riscv@nongnu.org; Tue, 26 Feb 2019 02:58:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <amagdy.afifi@gmail.com>) id 1gyXde-0002VR-BM
	for qemu-riscv@nongnu.org; Tue, 26 Feb 2019 02:58:55 -0500
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:45016)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <amagdy.afifi@gmail.com>)
	id 1gyXdQ-0002L0-Kr; Tue, 26 Feb 2019 02:58:41 -0500
Received: by mail-qt1-x82e.google.com with SMTP id d2so13784194qti.11;
	Mon, 25 Feb 2019 23:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3IUc14uheTWaqOYKAFfq3q945/onEE5QgNjQxrpuTCo=;
	b=flxfeJ6hUBIjlHDpuT7hv7PH1uTGE1xDQp10LmJmSDSqd4AtDytmCqGfPklRQeub+I
	WlMIl2xuBF+F0hC2U7hquG9hPqE2tzZhBDecmFEOublPiDX60m1SkB1oVanBnt9wRyFe
	asTj5DQImJPGb4SDl3UvJ6iUZtxZfIgUlPHXGb9XHespFDFjG0NPgddsxs+GBF4QgXbo
	9rmybuzwc2NNZ2FzS1o7gUb4OoMlfVaK/ec7LIpdgzjWfqV2W5CzpbGdbEqyLLYVyTeg
	hqXiMFsnuTmuOjehwNbbljSU62YigPaKa2yDNDsd6R4uBFsnkNudThOQZCzkrex6dLoZ
	yOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3IUc14uheTWaqOYKAFfq3q945/onEE5QgNjQxrpuTCo=;
	b=WGjjIHJl+QzHw1cZZQ6AOgHyjSmTAKVrmjVofLiPD9tJOJm38FSjkECDpPXfQEQZP4
	REb28Jwaipyw1hYpjmn0hAlthnI1CFUQwC8NTGFtvAzt2owVJ4U5XAqkc0bwQPthqlon
	+RNvFi3fn+Ur++XjzrXVEooKa9UChsWYFbwDfL41ui8M+XtxTZCGaOCm5imxAdM/vpdB
	aBhMRdwJf7adw9UTVfl39mPQPSx1/zBRmMW2TXbvJ5YmFtKakurVvj+MrXw8RbjZ91hM
	B3T2iOxZEMnBwuuuEZIVdAqFtj/ZAvd/IXTmu3qXpL1wdKpkMlrqs0cuJUOEm78JFfzB
	oRNw==
X-Gm-Message-State: AHQUAubJ8HVXbJgwPXWvSGRWTV40jLBtvojE0+PTl2dDqqPCBTJ61+Vh
	wiVNWafnRam2sxs0d+mM0miUtv03uaTOtIWyYZc=
X-Google-Smtp-Source: AHgI3IaEzLQDJMDS6aknhVqEQ3phqDZb2svYfOGMgQ1XtTb1IOc+HMJVUlqPZBY7npC0UVegoTPjSBjHSH/l/TAtHyI=
X-Received: by 2002:ac8:2827:: with SMTP id 36mr16775633qtq.359.1551167917757; 
	Mon, 25 Feb 2019 23:58:37 -0800 (PST)
MIME-Version: 1.0
References: <20190222162555.13764-1-amagdy.afifi@gmail.com>
	<20190222162555.13764-2-amagdy.afifi@gmail.com>
	<f782bdde-2a42-c612-5769-1cde42e7c2a4@linaro.org>
	<CAKV=O7mWBKQzVJRJT-bGW0Ojvb7eFraGniqG1-qPidZWHtp8Ew@mail.gmail.com>
	<bf134899-fa0b-2a27-dffd-92369805fd50@linaro.org>
In-Reply-To: <bf134899-fa0b-2a27-dffd-92369805fd50@linaro.org>
From: Amed Magdy <amagdy.afifi@gmail.com>
Date: Tue, 26 Feb 2019 09:58:25 +0200
Message-ID: <CAKV=O7n02WMfgmfFqtC9OBgHppPYVO4RXPnKyfU8y872Lnr=zQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu, 
	kbastian@mail.uni-paderborn.de, palmer@sifive.com, mjc@sifive.com, 
	Alistair.Francis@wdc.com
Content-Type: multipart/alternative; boundary="000000000000b99b620582c76ca0"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::82e
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] riscv: Add proper alignment
 check and pending 'C' extension upon misa writes
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
X-List-Received-Date: Tue, 26 Feb 2019 07:58:58 -0000

--000000000000b99b620582c76ca0
Content-Type: text/plain; charset="UTF-8"

> > It seems to me that the C extension can be enabled at any point, since
> if C is
> > off, you know that the next insn is aligned modulo 4.
> >
>

 Ok, This is mostly right. When C extension is enabled 32-bit base
instructions can be aligned on 2 bytes boundaries instead of 4 bytes only.
So multiple enables and disables of C bit at different code areas
theoretically may require this check on C extension enable. I'm not really
sure, may be this is might not  be a practical use scenario.

> It is only if the C extension is enabled, and you want to disable it,
> that is
> > when we must check to see if the next insn is aligned mod 4.  It is
> trivial to
> > arrange for a particular instruction to be aligned, via assembler
> directives.
> > So it seems silly to make the definition of the csr write to misa any
> more
> > complicated than it is.
>
>  I completely agree with you that C extension disable should have
alignment check.

>
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 960d2b0aa9..8726ef802e 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -370,10 +370,11 @@ static int write_misa(CPURISCVState *env, int
> csrno,
> > target_ulong val)
> >          val &= ~RVD;
> >    }
>
> > -    /* Suppress 'C' if next instruction is not aligned
> > -     * TODO: this should check next_pc
> > +    /*
> > +     * Suppress 'C' if next instruction is not aligned.
> > +     * We updated env->pc to the next insn in the translator.
> >      */
> > -    if ((val & RVC) && (GETPC() & ~3) != 0) {
> > +    if ((val & RVC) && (env->pc & ~3) != 0) {
> >         val &= ~RVC;
> >     }


 Just a hint, (env->pc & 3) instead of (env->pc & ~3) , right ?

>

 Thanks,
 Ahmed

--000000000000b99b620582c76ca0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><font color=3D"#741b47=
">&gt; It seems to me that the C extension can be enabled at any point, sin=
ce if C is<br>&gt; off, you know that the next insn is aligned modulo 4.<br=
>
&gt;<br></font></blockquote><div>=C2=A0</div><div>=C2=A0Ok, This is mostly =
right. When C extension is enabled 32-bit base instructions can be aligned =
on 2 bytes boundaries instead of 4 bytes only. So multiple enables and disa=
bles of C bit at different code areas theoretically may require this check =
on C extension enable. I&#39;m not really sure, may be this is might not=C2=
=A0 be a practical use scenario.</div><div><br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><font color=3D"#741b47">&gt; It is only if the =
C extension is enabled, and you want to disable it, that is<br>&gt; when we=
 must check to see if the next insn is aligned mod 4.=C2=A0 It is trivial t=
o<br>&gt; arrange for a particular instruction to be aligned, via assembler=
 directives.<br>&gt; So it seems silly to make the definition of the csr wr=
ite to misa any more<br>&gt; complicated than it is.</font><br>
<br></blockquote><div>=C2=A0I completely agree with you that C extension di=
sable should have alignment check.</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br><font color=3D"#741b47">&gt; diff --git a/target/riscv/csr.c b/target/r=
iscv/csr.c<br>&gt; index 960d2b0aa9..8726ef802e 100644<br>&gt; --- a/target=
/riscv/csr.c<br>&gt; +++ b/target/riscv/csr.c<br>&gt; @@ -370,10 +370,11 @@=
 static int write_misa(CPURISCVState *env, int csrno,<br>&gt; target_ulong =
val)<br>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val &amp;=3D ~RVD;<br>&gt;=
=C2=A0 =C2=A0 }<br>
<br>&gt; -=C2=A0 =C2=A0 /* Suppress &#39;C&#39; if next instruction is not =
aligned<br>&gt; -=C2=A0 =C2=A0 =C2=A0* TODO: this should check next_pc<br>&=
gt; +=C2=A0 =C2=A0 /*<br>&gt; +=C2=A0 =C2=A0 =C2=A0* Suppress &#39;C&#39; i=
f next instruction is not aligned.<br>&gt; +=C2=A0 =C2=A0 =C2=A0* We update=
d env-&gt;pc to the next insn in the translator.<br>&gt;=C2=A0 =C2=A0 =C2=
=A0 */<br>&gt; -=C2=A0 =C2=A0 if ((val &amp; RVC) &amp;&amp; (GETPC() &amp;=
 ~3) !=3D 0) {<br>&gt; +=C2=A0 =C2=A0 if ((val &amp; RVC) &amp;&amp; (env-&=
gt;pc &amp; ~3) !=3D 0) {<br>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val &amp=
;=3D ~RVC;<br>&gt;=C2=A0 =C2=A0 =C2=A0}</font></blockquote><div>=C2=A0</div=
><div>=C2=A0Just a hint, (<font color=3D"#000000">env-&gt;pc &amp; 3) inste=
ad of</font><span style=3D"color:rgb(116,27,71)">=C2=A0(</span><span style=
=3D"color:rgb(116,27,71)">env-&gt;pc &amp; ~3) </span><font color=3D"#00000=
0">, right ?</font></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
=C2=A0</blockquote><div>=C2=A0Thanks,</div><div>=C2=A0Ahmed=C2=A0</div></di=
v></div></div>

--000000000000b99b620582c76ca0--

