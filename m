Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvioZ-0001Ny-Ae
	for mharc-qemu-riscv@gnu.org; Thu, 08 Aug 2019 09:50:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54990)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chihmin.chao@sifive.com>) id 1hvioW-0001Jj-B2
 for qemu-riscv@nongnu.org; Thu, 08 Aug 2019 09:50:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1hvioS-0003ar-MS
 for qemu-riscv@nongnu.org; Thu, 08 Aug 2019 09:50:44 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:40195)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1hvimr-0002If-Rv
 for qemu-riscv@nongnu.org; Thu, 08 Aug 2019 09:50:38 -0400
Received: by mail-ot1-x341.google.com with SMTP id l15so61548141oth.7
 for <qemu-riscv@nongnu.org>; Thu, 08 Aug 2019 06:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NpsU4i3hOdSlC+nlL/yF35AxiEWrigBgskh4dJmO30E=;
 b=JQ1PaCaVsK5V34dSg/pn9mHcUGOrxkwsbTnRp9YOyUMo/PwmtgiEWNw+GjcC6BHrSU
 vA/EeSdBb2NVGdP8GzbZkiGlvkfZYMQ+J6tpqfFEuj9y5vIOxxa1QccmXNuASILMyIWK
 6IjsR307N5dfsQcLJGiNK1UYG6owUyX1I0gBjLrytnGuSbvZN3NoFZNSF3MvKUhJATNE
 Mom1O+d73fPwHmd48b1dEVODFAYRsoMUSSQClRziyQEOQgkGvA81LbBS5cmE9up8pg/N
 nYVq2/Hd0Q/ymZ4dilZvsDMAd0cOXlobZlxSu19Q4otUU+Mp9Wnuh/hpbxusHxCa31Ij
 uUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NpsU4i3hOdSlC+nlL/yF35AxiEWrigBgskh4dJmO30E=;
 b=hszp2YCZ0eZ4FLDXLTwsoggQ+IhqCOW8SmLuafGkEVhE1HmQjKMJtR9kPN5xjWPPPs
 a7nVqiK2dDkq0wjZJbSv1Ie9xIr9az8nerUisygRuE1Wd9T/3ful/WIW+TzBfpxg8ugs
 p2VduP6sY6eoTSQCjVakij87MIQ38uTmsZrwmIPUm13YEZ6KKOfYkykrI4+D3QTYLHBx
 o53HYPHi4+ENpac/WERfjPB/n4GX9ttIw2qQs74Tw4jFJf1ljCK5MW593SZFX+HoZMQN
 w7Lvb+2iOaEoJo8T3lO3pShtUfrlQ20M87iSFjTETxP9fKWzgc4uRv50EmxEqazcHEyw
 HEgA==
X-Gm-Message-State: APjAAAWVAIJs9A12xdq1VPEE3b8JXjpoUaZe098iKyihMXPgGihqOznA
 yArJPuKpADf9ZR0h3cFdiGZr7eBVJWkPy8zNORjT8g==
X-Google-Smtp-Source: APXvYqzWbXYpyJ0pxCr0jiUX0R4QxbwMx7nuUklHoTtDJ14IxxRArzmBHsIxZmY2HmzjKoLV6j+sOd+HA/yo9Z40+JE=
X-Received: by 2002:a5d:91d7:: with SMTP id k23mr4409741ior.163.1565272138853; 
 Thu, 08 Aug 2019 06:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <97a6ae9f-2845-4a3c-2a31-367787622268@c-sky.com>
 <CAL1e-=jceerbvam57mmXoKWHzepB-qUFL08gBEnSws_ohewLzw@mail.gmail.com>
In-Reply-To: <CAL1e-=jceerbvam57mmXoKWHzepB-qUFL08gBEnSws_ohewLzw@mail.gmail.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Thu, 8 Aug 2019 21:48:47 +0800
Message-ID: <CAEiOBXVDg-oaqWDpzFrsPjzt8jdmLt7DskG4=zXwYVUb+5=tfg@mail.gmail.com>
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Cc: liuzhiwei <zhiwei_liu@c-sky.com>, Peter Maydell <peter.maydell@linaro.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 bastian@mail.uni-paderborn.de, Palmer Dabbelt <palmer@sifive.com>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: multipart/alternative; boundary="000000000000d05ba3058f9b516f"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
X-List-Received-Date: Thu, 08 Aug 2019 13:50:46 -0000

--000000000000d05ba3058f9b516f
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 8, 2019 at 7:29 PM Aleksandar Markovic <
aleksandar.m.mail@gmail.com> wrote:

> On Thu, Aug 8, 2019 at 11:52 AM liuzhiwei <zhiwei_liu@c-sky.com> wrote:
>
> > Hi all,
> >
> >     My workmate  and I have been working on Vector & Dsp extension, and
> > I'd like to share develop status  with folks.
> >
> >     The spec references for  Vector extension is riscv-v-spec-0.7.1, and
> > riscv-p-spec-0.5 for DSP extension.
>
>
> Hello, Liu.
>
> I will not answer your questions directly, however I want to bring to you
> and others another perspective on this situation.
>
> First, please provide the link to the specifications. Via Google, I found
> that "riscv-v-spec-0.7.1" is titled "Working draft of the proposed RISC-V V
> vector extension". I could not find "riscv-p-spec-0.5".
>
> I am not sure what the QEMU policy towards "working draft proposal" type of
> specification is. Peter, can you perhaps clarify that or any other related
> issue?
>

Hi Aleksandar,

As for riscv-v-spec 0.7.1, it is first stable spec for target software
development
though the name is working draft.  The architecture skeleton is fix and
most of
work are focusing the issues related to micro-architecture implementation
complexity.
Sifive has released an open source implementation on spike simulation and
Imperas also
provides another implementation with its binary simulator.  I think it is
worth to include the extension
in Qemu at this moment.

As for riscv-p-spec-0.5, I think Andes has fully supported this extension
and should release more
detailed spec in the near future (described Riscv Technical Update
2019/06).
They have implement lots of DSP kernel based on this extension and also
provided impressed
performance result.  It is also worth to be reviewed (at least [RFC]) if
the detailed  spec is public.


ref:
     1.
https://content.riscv.org/wp-content/uploads/2019/06/17.40-Vector_RISCV-20190611-Vectors.pdf
     2.
https://content.riscv.org/wp-content/uploads/2019/06/17.20-P-ext-RVW-Zurich-20190611.pdf
     3.
https://content.riscv.org/wp-content/uploads/2019/06/10.05-TechCommitteeUpdate-June-2019-Copy.pdf


chihmin


I would advice some caution in these cases. The major issue is backward
> compatibility, but there are other issues too. Let's say, fairness. If we
> let emulation of a component based on a "working draft proposal" be
> integrated into QEMU, this will set a precedent, and many other developer
> would rightfully ask for their contributions based on drafts to be
> integrated into QEMU. Our policy should be as equal as possible to all
> contribution, large or small, riscv or alpha, cpu or device, tcg or kvm -
> in my honest opinion. QEMU upstream should not be a collecting place for
> all imaginable experimentations, certain criteria on what is appropriate
> for upstreaming exist and must continue to exist.
>
> Yours,
> Aleksandar
>
>
>
>
> > The code of vector extension is
> > ready and under testing,  the first patch will be sent about two weeks
> > later. After that we will forward working on DSP extension, and send the
> > first patch in middle  October.
> >
> >      Could the maintainers  tell me whether the specs referenced are
> > appropriate? Is anyone working on these extensions?  I'd like to get
> > your status, and maybe discuss questions and work togather.
> >
> > Best Regards
> >
> > LIU Zhiwei
> >
> >
> >
> >
>

--000000000000d05ba3058f9b516f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 8, 2019 at 7:29 PM Aleksa=
ndar Markovic &lt;<a href=3D"mailto:aleksandar.m.mail@gmail.com">aleksandar=
.m.mail@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On Thu, Aug 8, 2019 at 11:52 AM liuzhiwei &lt;<a href=3D"m=
ailto:zhiwei_liu@c-sky.com" target=3D"_blank">zhiwei_liu@c-sky.com</a>&gt; =
wrote:<br>
<br>
&gt; Hi all,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0My workmate=C2=A0 and I have been working on Vector=
 &amp; Dsp extension, and<br>
&gt; I&#39;d like to share develop status=C2=A0 with folks.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0The spec references for=C2=A0 Vector extension is r=
iscv-v-spec-0.7.1, and<br>
&gt; riscv-p-spec-0.5 for DSP extension.<br>
<br>
<br>
Hello, Liu.<br>
<br>
I will not answer your questions directly, however I want to bring to you<b=
r>
and others another perspective on this situation.<br>
<br>
First, please provide the link to the specifications. Via Google, I found<b=
r>
that &quot;riscv-v-spec-0.7.1&quot; is titled &quot;Working draft of the pr=
oposed RISC-V V<br>
vector extension&quot;. I could not find &quot;riscv-p-spec-0.5&quot;.<br>
<br>
I am not sure what the QEMU policy towards &quot;working draft proposal&quo=
t; type of<br>
specification is. Peter, can you perhaps clarify that or any other related<=
br>
issue?<br></blockquote><div><br></div>Hi=C2=A0Aleksandar,=C2=A0<div><br></d=
iv><div>As for riscv-v-spec 0.7.1, it is first stable spec for target softw=
are development=C2=A0</div><div>though the name is working draft.=C2=A0 The=
 architecture skeleton is fix and most of=C2=A0</div><div>work are focusing=
 the issues related to micro-architecture implementation complexity.</div><=
div>Sifive has released an open source implementation on spike simulation a=
nd Imperas also=C2=A0</div><div>provides another implementation with its bi=
nary simulator.=C2=A0 I think it is worth to include the extension</div><di=
v>in Qemu at this moment.=C2=A0</div><div><br></div><div>As for riscv-p-spe=
c-0.5, I think Andes has fully supported this extension and should release =
more</div><div>detailed spec in the near future (described Riscv Technical =
Update 2019/06).=C2=A0</div><div>They have implement lots of DSP kernel bas=
ed on this extension and also provided impressed</div><div>performance resu=
lt.=C2=A0 It is also worth to be reviewed (at least [RFC]) if the detailed=
=C2=A0 spec is public.</div><div><br></div><div><br></div><div>ref:</div><d=
iv>=C2=A0 =C2=A0 =C2=A01.=C2=A0<a href=3D"https://content.riscv.org/wp-cont=
ent/uploads/2019/06/17.40-Vector_RISCV-20190611-Vectors.pdf">https://conten=
t.riscv.org/wp-content/uploads/2019/06/17.40-Vector_RISCV-20190611-Vectors.=
pdf</a><br>=C2=A0 =C2=A0 =C2=A02.=C2=A0<a href=3D"https://content.riscv.org=
/wp-content/uploads/2019/06/17.20-P-ext-RVW-Zurich-20190611.pdf">https://co=
ntent.riscv.org/wp-content/uploads/2019/06/17.20-P-ext-RVW-Zurich-20190611.=
pdf</a><br>=C2=A0 =C2=A0 =C2=A03.=C2=A0<a href=3D"https://content.riscv.org=
/wp-content/uploads/2019/06/10.05-TechCommitteeUpdate-June-2019-Copy.pdf">h=
ttps://content.riscv.org/wp-content/uploads/2019/06/10.05-TechCommitteeUpda=
te-June-2019-Copy.pdf</a></div><div><br></div><div><br></div><div>chihmin</=
div><div><br></div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
I would advice some caution in these cases. The major issue is backward<br>
compatibility, but there are other issues too. Let&#39;s say, fairness. If =
we<br>
let emulation of a component based on a &quot;working draft proposal&quot; =
be<br>
integrated into QEMU, this will set a precedent, and many other developer<b=
r>
would rightfully ask for their contributions based on drafts to be<br>
integrated into QEMU. Our policy should be as equal as possible to all<br>
contribution, large or small, riscv or alpha, cpu or device, tcg or kvm -<b=
r>
in my honest opinion. QEMU upstream should not be a collecting place for<br=
>
all imaginable experimentations, certain criteria on what is appropriate<br=
>
for upstreaming exist and must continue to exist.<br>
<br>
Yours,<br>
Aleksandar<br>
<br>
<br>
<br>
<br>
&gt; The code of vector extension is<br>
&gt; ready and under testing,=C2=A0 the first patch will be sent about two =
weeks<br>
&gt; later. After that we will forward working on DSP extension, and send t=
he<br>
&gt; first patch in middle=C2=A0 October.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Could the maintainers=C2=A0 tell me whether the sp=
ecs referenced are<br>
&gt; appropriate? Is anyone working on these extensions?=C2=A0 I&#39;d like=
 to get<br>
&gt; your status, and maybe discuss questions and work togather.<br>
&gt;<br>
&gt; Best Regards<br>
&gt;<br>
&gt; LIU Zhiwei<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
</blockquote></div></div>

--000000000000d05ba3058f9b516f--

