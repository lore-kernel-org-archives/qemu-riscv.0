Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvjGW-0007jM-UQ
	for mharc-qemu-riscv@gnu.org; Thu, 08 Aug 2019 10:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54138)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1hvjGS-0007il-Ec
 for qemu-riscv@nongnu.org; Thu, 08 Aug 2019 10:19:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1hvjGQ-0003lF-MA
 for qemu-riscv@nongnu.org; Thu, 08 Aug 2019 10:19:36 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:45584)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1hvjGQ-0003kz-Dr; Thu, 08 Aug 2019 10:19:34 -0400
Received: by mail-ot1-x344.google.com with SMTP id x21so25930736otq.12;
 Thu, 08 Aug 2019 07:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jsFUs6K0zG+KDJOHz22gh70VBT5Y02ynQTJTLc1Ukak=;
 b=sfaN0EC7a9EO+kLhc/cyC1bYm1LdlG1+jPYulfG7KkFCi3qdPoYFnEs8N2knN1tC0x
 ZSkrutzxNznCQXhXVcykjkf8rzQEXsdDWvikVLAcdTMErji6H1Ia+ZqxOgi61hYzaC+7
 jlf53amoTE6/sjBO0+7/foluBgUhT3kXgBru53j1P2VuYkJk4nfquTDEcL4H7EWFw1et
 nMFct2gwUtVHlxCizeYqRcCfiJyrlj1X2mdGHj0Imu/T26F5OBTDQbMu9Ds+RGJMcikM
 v0UX5XiHUL5hfWU9d1SLvslF6aESaZjHcCvULtFxhB0Ny2bBzIubvD0q14Q8kSKCAQTt
 UkGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jsFUs6K0zG+KDJOHz22gh70VBT5Y02ynQTJTLc1Ukak=;
 b=ZpAwn7JVM3wFhlQv1TfvKLhQ3xtdjG9nfB1XciwgLbM2lmUBkgYjugMaPDuXXToqve
 vpWPZITQiF91ZM8JeFuRd966ES6pKKARIn6FZmkKE4uB8yswLWJZ3cf0t4ertiO1ahKE
 rgdyqvZnLxVth6LxLhM26rtBdnPs3wDUuVrjJoIEDEAdb0s7tLYxcSw2Q+wvNvOZtroR
 /0pC2Hb0qApdQ76n3PcbCO8hmbMLMOvGS0hlo4q+CV3Rf3tb4gHBb672QDw09s2HwhpA
 9Vmrgi5tBAW+5PVAoxdep2PFdHEXP80CyVsvf+EFYGDfMZS8h9tmTRWkxD+4J5nCv/Bz
 QWCg==
X-Gm-Message-State: APjAAAUSYheTZWDvBsSmBqv24tMQSKZ5nPV/NZ2r/3b8FzenmrVRMhPV
 iK9sMyUjZGjb8w9L+rDuSeHTxinjGiS2Ra7MrH4=
X-Google-Smtp-Source: APXvYqxVPlswE15IIn5Mcr0/7UCby3Wj+fcOg4OmOi9K0fiq/wQHPOfcPclS2ugQY1WBFtYPOmVTONjwpTz6K2BrWls=
X-Received: by 2002:a9d:5cc1:: with SMTP id r1mr13830926oti.341.1565273973643; 
 Thu, 08 Aug 2019 07:19:33 -0700 (PDT)
MIME-Version: 1.0
References: <97a6ae9f-2845-4a3c-2a31-367787622268@c-sky.com>
 <CAL1e-=jceerbvam57mmXoKWHzepB-qUFL08gBEnSws_ohewLzw@mail.gmail.com>
 <CAEiOBXVDg-oaqWDpzFrsPjzt8jdmLt7DskG4=zXwYVUb+5=tfg@mail.gmail.com>
In-Reply-To: <CAEiOBXVDg-oaqWDpzFrsPjzt8jdmLt7DskG4=zXwYVUb+5=tfg@mail.gmail.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Thu, 8 Aug 2019 16:19:22 +0200
Message-ID: <CAL1e-=iKYyWRkrOgEQ0ji67W1cfYc6iH-fPsF1wpYS84M46NNw@mail.gmail.com>
To: Chih-Min Chao <chihmin.chao@sifive.com>
Cc: liuzhiwei <zhiwei_liu@c-sky.com>, Peter Maydell <peter.maydell@linaro.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 bastian@mail.uni-paderborn.de, Palmer Dabbelt <palmer@sifive.com>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: multipart/alternative; boundary="0000000000002ce16e058f9bbf03"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
X-List-Received-Date: Thu, 08 Aug 2019 14:19:39 -0000

--0000000000002ce16e058f9bbf03
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 8, 2019 at 3:48 PM Chih-Min Chao <chihmin.chao@sifive.com>
wrote:

>
>
> On Thu, Aug 8, 2019 at 7:29 PM Aleksandar Markovic <
> aleksandar.m.mail@gmail.com> wrote:
>
>> On Thu, Aug 8, 2019 at 11:52 AM liuzhiwei <zhiwei_liu@c-sky.com> wrote:
>>
>> > Hi all,
>> >
>> >     My workmate  and I have been working on Vector & Dsp extension, and
>> > I'd like to share develop status  with folks.
>> >
>> >     The spec references for  Vector extension is riscv-v-spec-0.7.1, and
>> > riscv-p-spec-0.5 for DSP extension.
>>
>>
>> Hello, Liu.
>>
>> I will not answer your questions directly, however I want to bring to you
>> and others another perspective on this situation.
>>
>> First, please provide the link to the specifications. Via Google, I found
>> that "riscv-v-spec-0.7.1" is titled "Working draft of the proposed RISC-V
>> V
>> vector extension". I could not find "riscv-p-spec-0.5".
>>
>> I am not sure what the QEMU policy towards "working draft proposal" type
>> of
>> specification is. Peter, can you perhaps clarify that or any other related
>> issue?
>>
>
> Hi Aleksandar,
>
> As for riscv-v-spec 0.7.1, it is first stable spec for target software
> development
> though the name is working draft.
>

Hello, Chih-Min.

Too many unclear points here.

What does this sentence mean? What is "stable"? Is that the same as
"final"? If the document is stable, why the title "draft/proposal"? Can a
"draft" be stable? Can you, or anybody else, guarantee that the final
version of this document will not affect QEMU implementation, if it is done
by the current document? If not, why would you like QEMU upstream to
support something not fully specified? Why has the final document not been
released, if the situation is stable?.....

Yours,
Aleksandar

  The architecture skeleton is fix and most of
> work are focusing the issues related to micro-architecture implementation
> complexity.
> Sifive has released an open source implementation on spike simulation and
> Imperas also
> provides another implementation with its binary simulator.  I think it is
> worth to include the extension
> in Qemu at this moment.
>
> As for riscv-p-spec-0.5, I think Andes has fully supported this extension
> and should release more
> detailed spec in the near future (described Riscv Technical Update
> 2019/06).
> They have implement lots of DSP kernel based on this extension and also
> provided impressed
> performance result.  It is also worth to be reviewed (at least [RFC]) if
> the detailed  spec is public.
>
>
> ref:
>      1.
> https://content.riscv.org/wp-content/uploads/2019/06/17.40-Vector_RISCV-20190611-Vectors.pdf
>      2.
> https://content.riscv.org/wp-content/uploads/2019/06/17.20-P-ext-RVW-Zurich-20190611.pdf
>      3.
> https://content.riscv.org/wp-content/uploads/2019/06/10.05-TechCommitteeUpdate-June-2019-Copy.pdf
>
>
> chihmin
>
>
> I would advice some caution in these cases. The major issue is backward
>> compatibility, but there are other issues too. Let's say, fairness. If we
>> let emulation of a component based on a "working draft proposal" be
>> integrated into QEMU, this will set a precedent, and many other developer
>> would rightfully ask for their contributions based on drafts to be
>> integrated into QEMU. Our policy should be as equal as possible to all
>> contribution, large or small, riscv or alpha, cpu or device, tcg or kvm -
>> in my honest opinion. QEMU upstream should not be a collecting place for
>> all imaginable experimentations, certain criteria on what is appropriate
>> for upstreaming exist and must continue to exist.
>>
>> Yours,
>> Aleksandar
>>
>>
>>
>>
>> > The code of vector extension is
>> > ready and under testing,  the first patch will be sent about two weeks
>> > later. After that we will forward working on DSP extension, and send the
>> > first patch in middle  October.
>> >
>> >      Could the maintainers  tell me whether the specs referenced are
>> > appropriate? Is anyone working on these extensions?  I'd like to get
>> > your status, and maybe discuss questions and work togather.
>> >
>> > Best Regards
>> >
>> > LIU Zhiwei
>> >
>> >
>> >
>> >
>>
>

--0000000000002ce16e058f9bbf03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 8, 2019 at 3:48 PM Chih-M=
in Chao &lt;<a href=3D"mailto:chihmin.chao@sifive.com">chihmin.chao@sifive.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 8, 2019 at 7:29 PM Ale=
ksandar Markovic &lt;<a href=3D"mailto:aleksandar.m.mail@gmail.com" target=
=3D"_blank">aleksandar.m.mail@gmail.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On Thu, Aug 8, 2019 at 11:52 AM liuz=
hiwei &lt;<a href=3D"mailto:zhiwei_liu@c-sky.com" target=3D"_blank">zhiwei_=
liu@c-sky.com</a>&gt; wrote:<br>
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
are development=C2=A0</div><div>though the name is working draft.</div></di=
v></div></blockquote><div><br></div><div>Hello, Chih-Min.</div><div><br></d=
iv><div>Too many unclear points here.</div><div><br></div><div>What does th=
is sentence mean? What is &quot;stable&quot;? Is that the same as &quot;fin=
al&quot;? If the document is stable, why the title &quot;draft/proposal&quo=
t;? Can a &quot;draft&quot; be stable? Can you, or anybody else, guarantee =
that the final version of this document will not affect QEMU implementation=
, if it is done by the current document? If not, why would you like QEMU up=
stream to support something not fully specified? Why has the final document=
 not been released, if the situation is stable?.....<br></div><div><br></di=
v><div>Yours,</div><div>Aleksandar</div><div><br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><=
div>=C2=A0 The architecture skeleton is fix and most of=C2=A0</div><div>wor=
k are focusing the issues related to micro-architecture implementation comp=
lexity.</div><div>Sifive has released an open source implementation on spik=
e simulation and Imperas also=C2=A0</div><div>provides another implementati=
on with its binary simulator.=C2=A0 I think it is worth to include the exte=
nsion</div><div>in Qemu at this moment.=C2=A0</div><div><br></div><div>As f=
or riscv-p-spec-0.5, I think Andes has fully supported this extension and s=
hould release more</div><div>detailed spec in the near future (described Ri=
scv Technical Update 2019/06).=C2=A0</div><div>They have implement lots of =
DSP kernel based on this extension and also provided impressed</div><div>pe=
rformance result.=C2=A0 It is also worth to be reviewed (at least [RFC]) if=
 the detailed=C2=A0 spec is public.</div><div><br></div><div><br></div><div=
>ref:</div><div>=C2=A0 =C2=A0 =C2=A01.=C2=A0<a href=3D"https://content.risc=
v.org/wp-content/uploads/2019/06/17.40-Vector_RISCV-20190611-Vectors.pdf" t=
arget=3D"_blank">https://content.riscv.org/wp-content/uploads/2019/06/17.40=
-Vector_RISCV-20190611-Vectors.pdf</a><br>=C2=A0 =C2=A0 =C2=A02.=C2=A0<a hr=
ef=3D"https://content.riscv.org/wp-content/uploads/2019/06/17.20-P-ext-RVW-=
Zurich-20190611.pdf" target=3D"_blank">https://content.riscv.org/wp-content=
/uploads/2019/06/17.20-P-ext-RVW-Zurich-20190611.pdf</a><br>=C2=A0 =C2=A0 =
=C2=A03.=C2=A0<a href=3D"https://content.riscv.org/wp-content/uploads/2019/=
06/10.05-TechCommitteeUpdate-June-2019-Copy.pdf" target=3D"_blank">https://=
content.riscv.org/wp-content/uploads/2019/06/10.05-TechCommitteeUpdate-June=
-2019-Copy.pdf</a></div><div><br></div><div><br></div><div>chihmin</div><di=
v><br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
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
</blockquote></div></div>

--0000000000002ce16e058f9bbf03--

