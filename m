Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i0Zkq-000853-IK
	for mharc-qemu-riscv@gnu.org; Wed, 21 Aug 2019 19:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47224)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fintelia@gmail.com>) id 1i0Zkm-00084U-N8
 for qemu-riscv@nongnu.org; Wed, 21 Aug 2019 19:10:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fintelia@gmail.com>) id 1i0Zkk-0007SJ-Qs
 for qemu-riscv@nongnu.org; Wed, 21 Aug 2019 19:10:56 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:38156)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <fintelia@gmail.com>)
 id 1i0Zkk-0007R2-Fw; Wed, 21 Aug 2019 19:10:54 -0400
Received: by mail-lf1-x143.google.com with SMTP id h28so3059645lfj.5;
 Wed, 21 Aug 2019 16:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D+h2/vD1IqOJbT4fBJlcA13Mv/QGR6RAxBRfM98uZ28=;
 b=F/AUwsrCmLmUtc2gsZE1OXXX7ELwnwQPsNCxWX5henShAl8a/hj4dL+ZHSp453WC7v
 TBpp9hPQIFyRlDNVSgUasD42LltHr1c8S+aIwR0LRRJSRvUzKClDDlb0JbOZR4M2BIFy
 4CaW4DfuU6xsVf60kNroh/aQXrlGRlkNbNmAW9kbIFojGq4JT9pwis0mgeGDmZO71aZz
 Iq8i1jYMKiWZUBGvlDCAqFMpJuvIP9s28seU0tfMpH42boESOPyFIqanTGTnpTeRQDEC
 J4zDEjnj4ny0BAGMVoMPWBBgzKI8kFcRDBKv3cqq+wEk+IEfE+RguLd8tZBXHREAqyxZ
 7Tqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D+h2/vD1IqOJbT4fBJlcA13Mv/QGR6RAxBRfM98uZ28=;
 b=md+OW1+xt7sd3b+NWeA6/0OALp4FaJ5faZ+2jnwrWbS+DOekjuMzulTXaQKKZWEW7B
 No1bUvWIdHpydjzUc2yg7WVw4cok8BeQ98mdh/T3ZyioDXzpRuKsRVsZUvCP07FdPdHG
 uv5DiwdCLx/bY8Sfec2OCXgs5FrCbEDyxI0SWMmNcVJhqhBP+sOMOHDOdqOl8kilMmA5
 wVkba2IIvBN6Y7GpSZOxfB0UuZVnXF6+GQAp/d0fQ0ivMjPC3O/NUmdboPYGCDWe//q1
 Di9mYNznuSiizlB6qFsFpxje8HiXL8V3BOfu3Gj0Ge1M3giJ0GovQD2PyS88+3oRWhKR
 r7sA==
X-Gm-Message-State: APjAAAWQhgwEMXf9W/OsfWU1qXXYqtalEiN7ZuY86gQ5W8Nur9Y7G3Wc
 X5l0bIjPITsJzlm6KRdZD1SaxD2yJuDjR/u0weQ=
X-Google-Smtp-Source: APXvYqyPg0yy0qnlra3MHOwc6eXfutN/BsAAxAeyAM9B49QAIGJKd5d4oI5ARKvzuYu8HH+JGTUyGE1lJEG5d77vRv8=
X-Received: by 2002:ac2:44ce:: with SMTP id d14mr20002211lfm.143.1566429051763; 
 Wed, 21 Aug 2019 16:10:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmqyKM44ZAHgc5cYAiAXXtVG=dMcX1i7FLn+2mMwM1Av4Gqzg@mail.gmail.com>
 <mhng-04cdd93a-df3e-4de0-b1f5-0365f2be0fab@palmer-si-x1c4>
In-Reply-To: <mhng-04cdd93a-df3e-4de0-b1f5-0365f2be0fab@palmer-si-x1c4>
From: Jonathan Behrens <fintelia@gmail.com>
Date: Wed, 21 Aug 2019 19:10:25 -0400
Message-ID: <CANnJOVF_KwuXLD14EY+y+sVvchfBD=Y884=9YzW_8FwsSNd++g@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Alistair Francis <alistair23@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 bastian@mail.uni-paderborn.de, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, zhiwei_liu@c-sky.com, 
 aleksandar.m.mail@gmail.com
Content-Type: multipart/alternative; boundary="0000000000003242330590a8af80"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::143
Subject: Re: [Qemu-riscv] [Qemu-devel] RISC-V: Vector && DSP Extension
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
X-List-Received-Date: Wed, 21 Aug 2019 23:10:58 -0000

--0000000000003242330590a8af80
Content-Type: text/plain; charset="UTF-8"

Is there a reason to guarantee support of a particular draft extension
version once it has been superseded by a subsequent version? I understand
why it was done for priv-1.9.1, but going forward I'm skeptical there will
be much/any code out in the wild that depends on old draft versions of
extensions. The main reason people seem interested in implementing
extensions in QEMU is to test them before going through the trouble of
manufacturing hardware, and I don't really see why anyone would want to
test a design that is no longer under consideration.

Jonathan

On Wed, Aug 21, 2019 at 3:31 PM Palmer Dabbelt <palmer@sifive.com> wrote:

> On Thu, 15 Aug 2019 14:37:52 PDT (-0700), alistair23@gmail.com wrote:
> > On Thu, Aug 15, 2019 at 2:07 AM Peter Maydell <peter.maydell@linaro.org>
> wrote:
> >>
> >> On Thu, 15 Aug 2019 at 09:53, Aleksandar Markovic
> >> <aleksandar.m.mail@gmail.com> wrote:
> >> >
> >> > > We can accept draft
> >> > > extensions in QEMU as long as they are disabled by default.
> >>
> >> > Hi, Alistair, Palmer,
> >> >
> >> > Is this an official stance of QEMU community, or perhaps Alistair's
> >> > personal judgement, or maybe a rule within risv subcomunity?
> >>
> >> Alistair asked on a previous thread; my view was:
> >> https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg03364.html
> >> and nobody else spoke up disagreeing (summary: should at least be
> >> disabled-by-default and only enabled by setting an explicit
> >> property whose name should start with the 'x-' prefix).
> >
> > Agreed!
> >
> >>
> >> In general QEMU does sometimes introduce experimental extensions
> >> (we've had them in the block layer, for example) and so the 'x-'
> >> property to enable them is a reasonably established convention.
> >> I think it's a reasonable compromise to allow this sort of work
> >> to start and not have to live out-of-tree for a long time, without
> >> confusing users or getting into a situation where some QEMU
> >> versions behave differently or to obsolete drafts of a spec
> >> without it being clear from the command line that experimental
> >> extensions are being enabled.
> >>
> >> There is also an element of "submaintainer judgement" to be applied
> >> here -- upstream is probably not the place for a draft extension
> >> to be implemented if it is:
> >>  * still fast moving or subject to major changes of design direction
> >>  * major changes to the codebase (especially if it requires
> >>    changes to core code) that might later need to be redone
> >>    entirely differently
> >>  * still experimental
> >
> > Yep, agreed. For RISC-V I think this would extend to only allowing
> > extensions that have backing from the foundation and are under active
> > discussion.
>
> My general philosophy here is that we'll take anything written down in an
> official RISC-V ISA manual (ie, the ones actually released by the
> foundation).
> This provides a single source of truth for what an extension name /
> version
> means, which is important to avoid confusion.  If it's a ratified
> extension
> then I see no reason not to support it on my end.  For frozen extensions
> we
> should probably just wait the 45 days until they go up for a ratification
> vote,
> but I'd be happy to start reviewing patches then (or earlier :)).
>
> If the spec is a draft in the ISA manual then we need to worry about the
> support burden, which I don't have a fixed criteria for -- generally there
> shouldn't be issues here, but early drafts can be in a state where they're
> going to change extensively and are unlikely to be used by anyone.
> There's
> also the question of "what is an official release of a draft
> specification?".
>
> That's a bit awkward right now: the current ratified ISA manual contains
> version 0.3 of the hypervisor extension, but I just talked to Andrew and
> the
> plan is to remove the draft extensions from the ratified manuals because
> these
> drafts are old and the official manuals update slowly.  For now I guess
> we'll
> need an an-hoc way of determining if a draft extension has been officially
> versioned or not, which is a bit of a headache.
>
> We already have examples of supporting draft extensions, including
> priv-1.9.1.
> This does cause some pain for us on the QEMU side (CSR bits have different
> semantics between the specs), but there's 1.9.1 hardware out there and the
> port
> continues to be useful so I'd be in favor of keeping it around for now.  I
> suppose there is an implicit risk that draft extensions will be
> deprecated, but
> the "x-" prefix, draft status, and long deprecation period should be
> sufficient
> to inform users of the risk.  I wouldn't be opposed to adding a "this is a
> draft ISA" warning, but I feel like it might be a bit overkill.
>
> >
> > Alistair
> >
> >>
> >> thanks
> >> -- PMM
>
>

--0000000000003242330590a8af80
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Is there a reason to guarantee support of a particula=
r draft extension version once it has been superseded by a subsequent versi=
on? I understand why it was done for priv-1.9.1, but going forward I&#39;m =
skeptical there will be much/any code out in the wild that depends on old d=
raft versions of extensions. The main reason people seem interested in impl=
ementing extensions in QEMU is to test them before going through the troubl=
e of manufacturing hardware, and I don&#39;t really see why anyone would wa=
nt to test a design that is no longer under consideration. <br></div><div><=
br></div><div>Jonathan<br> </div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 21, 2019 at 3:31 PM Palmer Dab=
belt &lt;<a href=3D"mailto:palmer@sifive.com">palmer@sifive.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 15 A=
ug 2019 14:37:52 PDT (-0700), <a href=3D"mailto:alistair23@gmail.com" targe=
t=3D"_blank">alistair23@gmail.com</a> wrote:<br>
&gt; On Thu, Aug 15, 2019 at 2:07 AM Peter Maydell &lt;<a href=3D"mailto:pe=
ter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; =
wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Thu, 15 Aug 2019 at 09:53, Aleksandar Markovic<br>
&gt;&gt; &lt;<a href=3D"mailto:aleksandar.m.mail@gmail.com" target=3D"_blan=
k">aleksandar.m.mail@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt; We can accept draft<br>
&gt;&gt; &gt; &gt; extensions in QEMU as long as they are disabled by defau=
lt.<br>
&gt;&gt;<br>
&gt;&gt; &gt; Hi, Alistair, Palmer,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Is this an official stance of QEMU community, or perhaps Alis=
tair&#39;s<br>
&gt;&gt; &gt; personal judgement, or maybe a rule within risv subcomunity?<=
br>
&gt;&gt;<br>
&gt;&gt; Alistair asked on a previous thread; my view was:<br>
&gt;&gt; <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2019-07/m=
sg03364.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/ar=
chive/html/qemu-devel/2019-07/msg03364.html</a><br>
&gt;&gt; and nobody else spoke up disagreeing (summary: should at least be<=
br>
&gt;&gt; disabled-by-default and only enabled by setting an explicit<br>
&gt;&gt; property whose name should start with the &#39;x-&#39; prefix).<br=
>
&gt;<br>
&gt; Agreed!<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; In general QEMU does sometimes introduce experimental extensions<b=
r>
&gt;&gt; (we&#39;ve had them in the block layer, for example) and so the &#=
39;x-&#39;<br>
&gt;&gt; property to enable them is a reasonably established convention.<br=
>
&gt;&gt; I think it&#39;s a reasonable compromise to allow this sort of wor=
k<br>
&gt;&gt; to start and not have to live out-of-tree for a long time, without=
<br>
&gt;&gt; confusing users or getting into a situation where some QEMU<br>
&gt;&gt; versions behave differently or to obsolete drafts of a spec<br>
&gt;&gt; without it being clear from the command line that experimental<br>
&gt;&gt; extensions are being enabled.<br>
&gt;&gt;<br>
&gt;&gt; There is also an element of &quot;submaintainer judgement&quot; to=
 be applied<br>
&gt;&gt; here -- upstream is probably not the place for a draft extension<b=
r>
&gt;&gt; to be implemented if it is:<br>
&gt;&gt;=C2=A0 * still fast moving or subject to major changes of design di=
rection<br>
&gt;&gt;=C2=A0 * major changes to the codebase (especially if it requires<b=
r>
&gt;&gt;=C2=A0 =C2=A0 changes to core code) that might later need to be red=
one<br>
&gt;&gt;=C2=A0 =C2=A0 entirely differently<br>
&gt;&gt;=C2=A0 * still experimental<br>
&gt;<br>
&gt; Yep, agreed. For RISC-V I think this would extend to only allowing<br>
&gt; extensions that have backing from the foundation and are under active<=
br>
&gt; discussion.<br>
<br>
My general philosophy here is that we&#39;ll take anything written down in =
an <br>
official RISC-V ISA manual (ie, the ones actually released by the foundatio=
n).=C2=A0 <br>
This provides a single source of truth for what an extension name / version=
 <br>
means, which is important to avoid confusion.=C2=A0 If it&#39;s a ratified =
extension <br>
then I see no reason not to support it on my end.=C2=A0 For frozen extensio=
ns we <br>
should probably just wait the 45 days until they go up for a ratification v=
ote, <br>
but I&#39;d be happy to start reviewing patches then (or earlier :)).<br>
<br>
If the spec is a draft in the ISA manual then we need to worry about the <b=
r>
support burden, which I don&#39;t have a fixed criteria for -- generally th=
ere <br>
shouldn&#39;t be issues here, but early drafts can be in a state where they=
&#39;re <br>
going to change extensively and are unlikely to be used by anyone.=C2=A0 Th=
ere&#39;s <br>
also the question of &quot;what is an official release of a draft specifica=
tion?&quot;.=C2=A0 <br>
<br>
That&#39;s a bit awkward right now: the current ratified ISA manual contain=
s <br>
version 0.3 of the hypervisor extension, but I just talked to Andrew and th=
e <br>
plan is to remove the draft extensions from the ratified manuals because th=
ese <br>
drafts are old and the official manuals update slowly.=C2=A0 For now I gues=
s we&#39;ll <br>
need an an-hoc way of determining if a draft extension has been officially =
<br>
versioned or not, which is a bit of a headache.<br>
<br>
We already have examples of supporting draft extensions, including priv-1.9=
.1.=C2=A0 <br>
This does cause some pain for us on the QEMU side (CSR bits have different =
<br>
semantics between the specs), but there&#39;s 1.9.1 hardware out there and =
the port <br>
continues to be useful so I&#39;d be in favor of keeping it around for now.=
=C2=A0 I <br>
suppose there is an implicit risk that draft extensions will be deprecated,=
 but <br>
the &quot;x-&quot; prefix, draft status, and long deprecation period should=
 be sufficient <br>
to inform users of the risk.=C2=A0 I wouldn&#39;t be opposed to adding a &q=
uot;this is a <br>
draft ISA&quot; warning, but I feel like it might be a bit overkill.<br>
<br>
&gt;<br>
&gt; Alistair<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; thanks<br>
&gt;&gt; -- PMM<br>
<br>
</blockquote></div>

--0000000000003242330590a8af80--

