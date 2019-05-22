Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hTGwV-0001jT-U3
	for mharc-qemu-riscv@gnu.org; Tue, 21 May 2019 22:25:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fintelia@gmail.com>) id 1hTGwS-0001j6-Os
	for qemu-riscv@nongnu.org; Tue, 21 May 2019 22:25:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fintelia@gmail.com>) id 1hTGwR-0000XF-Jo
	for qemu-riscv@nongnu.org; Tue, 21 May 2019 22:25:20 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:38509)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <fintelia@gmail.com>)
	id 1hTGwR-0000WH-86; Tue, 21 May 2019 22:25:19 -0400
Received: by mail-lj1-x242.google.com with SMTP id 14so581119ljj.5;
	Tue, 21 May 2019 19:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=16zG7cUNoHfSVg+l+wydyN8O/BA2HZBFDsWzrTUdtfU=;
	b=kljlvrB6eXuNvKUuK7jmWh7RzZZpMODX8YY8pmHjSrGcG428uF7oNlv1/3iUxnGlPV
	wJOTAA1P4drKzfoiNuDXk+2IPf1Ksfo8UEUMSO7MoKnWocQSar0DGNSBMxPOOTJAbshC
	c7r1Dw6GMaQS9KBHObQsPy5o++BeScaKNB0oCva9GN+nKxE2FGniAQDpdYTK5jMApYnU
	Y6u4U5rb6Q1thQMOfXn8VcIEo+6HR5RCqGLcpaQEsVfSXNk4rfHU5fzySBidjVcvsdWp
	d5JJCEzIoPR1HhYdjiWLeh+WyOvY4YFNX5iXpBdMj+X50AVGP2uHnNEILyPeZZHt7U46
	RGMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=16zG7cUNoHfSVg+l+wydyN8O/BA2HZBFDsWzrTUdtfU=;
	b=jclsAtNeSKvSXIc3YAxKX6NQUnxZiy2LaCADn8mnBK14o6K0FI5VpDIqyJjsYAZ9gv
	VLfgym+pH8XjHXsHIZbJXiJatT3q2Tv1qPwkC+kOtVgBEum+kcq+0oZhLsDld+OqaxUg
	CJXwLMWH242VL04zQcOUj+oxepIXfhPjaPspmEhtJzBTdtPi/oyf0lorPdW8NbNKkHXe
	uzjh0775d8ltM+nlkzaAO4q2Qw02whwDPqjPnndkEB3MqVp7jniztiK7ArlBNwouN5wz
	L2TjMpL4qfz2jrg1HrUVLyLOA/4WnxAMejK9gBo8jlhISpzyOWaFw2tWK0SOcxkrvmyr
	7ZAA==
X-Gm-Message-State: APjAAAVoVEnYj6Qr8+5bCTrQ+Oux4O8pctEjVTtcyTnGqV3G1nHv5oIm
	goac7aLbSCKQ4LtopXpiXCwtLLVS6npYCfeHPGo=
X-Google-Smtp-Source: APXvYqyr4tm2TmzRgXmfLepUbaVOxFNosks55b9KKlc3cvNOHwxOuC95eni0PrVZWxTsrb0Tr9bJvrzk3VhdK8MlvOM=
X-Received: by 2002:a2e:9953:: with SMTP id r19mr33058936ljj.67.1558491917014; 
	Tue, 21 May 2019 19:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190521104324.12835-1-Hesham.Almatary@cl.cam.ac.uk>
	<20190521104324.12835-5-Hesham.Almatary@cl.cam.ac.uk>
	<CAKmqyKOaPEC=YdbwJkqZJBwTw++_9Cum5HSChtfnx7_uOmZ_HQ@mail.gmail.com>
In-Reply-To: <CAKmqyKOaPEC=YdbwJkqZJBwTw++_9Cum5HSChtfnx7_uOmZ_HQ@mail.gmail.com>
From: Jonathan Behrens <fintelia@gmail.com>
Date: Tue, 21 May 2019 22:24:50 -0400
Message-ID: <CANnJOVG-fqEsRqOu3e8Jd=OanGwi2eEKPK0_AqGcMV28QzVz+g@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>, 
	"open list:RISC-V" <qemu-riscv@nongnu.org>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: multipart/alternative; boundary="000000000000195eb9058970ad62"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCHv3 5/5] RISC-V: Fix a PMP check
 with the correct access size
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
X-List-Received-Date: Wed, 22 May 2019 02:25:22 -0000

--000000000000195eb9058970ad62
Content-Type: text/plain; charset="UTF-8"

Hesham,

I don't think this is quite right. If I understand correctly, PMP
permissions are only validated on TLB fills, not on all accesses. (Is
anyone able to confirm this?) If so, this function can't just validate the
range of a single access and then place the entire page into the TLB.
However, the current code is also wrong because an access should
succeed/fail based on the permissions only for the range it actually
touches even regardless of the permissions on the rest of the page. Now
that I think about it, I'd also expect that somewhere in the PMP logic
would flush the TLB every time any of the related control registers change
though I can't find anywhere that this is happening...

Sorry to keep raising complaints about this patch set, the interaction
between physical memory protection and paging is very subtle. Even some
real hardware has had errata related to it!

Jonathan

On Tue, May 21, 2019 at 6:33 PM Alistair Francis <alistair23@gmail.com>
wrote:

> On Tue, May 21, 2019 at 3:45 AM Hesham Almatary
> <Hesham.Almatary@cl.cam.ac.uk> wrote:
> >
> > The PMP check should be of the memory access size rather
> > than TARGET_PAGE_SIZE.
> >
> > Signed-off-by: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> Alistair
>
> > ---
> >  target/riscv/cpu_helper.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index d0b0f9cf88..ce1f47e4e3 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -410,7 +410,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address,
> int size,
> >
> >      if (riscv_feature(env, RISCV_FEATURE_PMP) &&
> >          (ret == TRANSLATE_SUCCESS) &&
> > -        !pmp_hart_has_privs(env, pa, TARGET_PAGE_SIZE, 1 <<
> access_type)) {
> > +        !pmp_hart_has_privs(env, pa, size, 1 << access_type)) {
> >          ret = TRANSLATE_PMP_FAIL;
> >      }
> >      if (ret == TRANSLATE_PMP_FAIL) {
> > --
> > 2.17.1
> >
> >
>
>

--000000000000195eb9058970ad62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hesham,</div><div><br></div><div> I don&#39;t think t=
his is quite right. If I understand correctly, PMP permissions are only val=
idated on TLB fills, not on all accesses. (Is anyone able to confirm this?)=
 If so, this function can&#39;t just validate the range of a single access =
and then place the entire page into the TLB. However, the current code is a=
lso wrong because an access should succeed/fail based on the permissions on=
ly for the range it actually touches even regardless of the permissions on =
the rest of the page. Now that I think about it, I&#39;d also expect that s=
omewhere in the PMP logic would
 flush the TLB every time any of the related control registers change=20
though I can&#39;t find anywhere that this is happening...</div><div><br></=
div><div>Sorry to keep raising complaints about this patch set, the interac=
tion between physical memory protection and paging is very subtle. Even  so=
me real hardware has had errata related to it!<br></div><div><br></div><div=
>Jonathan<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Tue, May 21, 2019 at 6:33 PM Alistair Francis &lt;<a =
href=3D"mailto:alistair23@gmail.com" target=3D"_blank">alistair23@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On Tue, May 21, 2019 at 3:45 AM Hesham Almatary<br>
&lt;<a href=3D"mailto:Hesham.Almatary@cl.cam.ac.uk" target=3D"_blank">Hesha=
m.Almatary@cl.cam.ac.uk</a>&gt; wrote:<br>
&gt;<br>
&gt; The PMP check should be of the memory access size rather<br>
&gt; than TARGET_PAGE_SIZE.<br>
&gt;<br>
&gt; Signed-off-by: Hesham Almatary &lt;<a href=3D"mailto:Hesham.Almatary@c=
l.cam.ac.uk" target=3D"_blank">Hesham.Almatary@cl.cam.ac.uk</a>&gt;<br>
<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
<br>
Alistair<br>
<br>
&gt; ---<br>
&gt;=C2=A0 target/riscv/cpu_helper.c | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c<br>
&gt; index d0b0f9cf88..ce1f47e4e3 100644<br>
&gt; --- a/target/riscv/cpu_helper.c<br>
&gt; +++ b/target/riscv/cpu_helper.c<br>
&gt; @@ -410,7 +410,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr addres=
s, int size,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (riscv_feature(env, RISCV_FEATURE_PMP) &amp;&am=
p;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (ret =3D=3D TRANSLATE_SUCCESS) &amp;=
&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 !pmp_hart_has_privs(env, pa, TARGET_PAGE_=
SIZE, 1 &lt;&lt; access_type)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 !pmp_hart_has_privs(env, pa, size, 1 &lt;=
&lt; access_type)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D TRANSLATE_PMP_FAIL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D TRANSLATE_PMP_FAIL) {<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt;<br>
<br>
</blockquote></div>

--000000000000195eb9058970ad62--

