Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvgbr-0000k3-C3
	for mharc-qemu-riscv@gnu.org; Thu, 08 Aug 2019 07:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44560)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1hvgbp-0000go-Et
 for qemu-riscv@nongnu.org; Thu, 08 Aug 2019 07:29:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1hvgbo-0000z9-6r
 for qemu-riscv@nongnu.org; Thu, 08 Aug 2019 07:29:29 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:36736)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1hvgbl-0000y5-MD; Thu, 08 Aug 2019 07:29:25 -0400
Received: by mail-ot1-x329.google.com with SMTP id r6so117092737oti.3;
 Thu, 08 Aug 2019 04:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=65T6irR93j3o1VJcC82y3rfX/tr7CMxrI07g2y2C2D8=;
 b=lw8HkL41ObGdPfULnTR4ObPDSIITp9VSjynNiA4G4vsoX1ATCjNxES4rH9Yx1rQBP4
 6jspzObs5UkPKVQsvDptu/tOcxo1s6trIPYcfK9vrGX0MiwN+ZWPfgvZlnDSqNsugrV/
 iocymHcid0bkDrfQz7vTorvVru8A8eSg8ekdu7E8B9vnhR+Vx5GP6shaOMuMsiyJpI+D
 ysI/0f6IoL4XPT1E4Ccexhpg4N1Jh7EOtTrXaeo4mb9jmUI3LQCKEAoBHTKo6q4Bha1j
 Qm/Kk+BbLYs8xbRfdbgSUnlNyo31QN9qOAEAnxQFS86J7SRQtXv6oQ10DytAutIY5Z4J
 GwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=65T6irR93j3o1VJcC82y3rfX/tr7CMxrI07g2y2C2D8=;
 b=IylGpSqH4I7bMRVTiS/ol8GixHBKTeY8am9jOrIn6V9WVoMFQ9Vjb55rmYJuEgKvUF
 NrI9gZ+4Gg+1OWMceUBnwLNAwveuhP5Be2nB+C4BQLK1q+9DaUh+F0ZobHYq1n0XNk7V
 8kVv8b8NVJJS+OuX9Xo7RumZgpF4cv/awqwAV2654o3Cosr5SdZ1zl46h3zg2fuRZotU
 CucEM/x5u8g+Mi6ss8ObE2r/MDusITJmyolY2dfDPSZ6XU665XCLon+/aO7/xoPQecjk
 3vkXoPq4Oy7o787rsYpM5KwNS1VMMxoUF4MCei2c2Ovmkn7xass6uzCprEb0rAwK/LLJ
 RUSg==
X-Gm-Message-State: APjAAAVq31NbIYHfsZBaoHJB5F1gsvSrn/qTKh5EcHLSzMMQSwHGnYYG
 qXPRtj8me8k8SD/wzLJtb5z6Akvq24IHHkqs5Ac=
X-Google-Smtp-Source: APXvYqybs91oDjdeadFRoI4qIHVBQcyjiBy5qxm7UrdGTvV51z+nRjaGhL5PhB/xNTIuuMxQMYYN9CZrO90GCGrZsG4=
X-Received: by 2002:a9d:6ad7:: with SMTP id m23mr1501828otq.306.1565263764509; 
 Thu, 08 Aug 2019 04:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <97a6ae9f-2845-4a3c-2a31-367787622268@c-sky.com>
In-Reply-To: <97a6ae9f-2845-4a3c-2a31-367787622268@c-sky.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Thu, 8 Aug 2019 13:29:13 +0200
Message-ID: <CAL1e-=jceerbvam57mmXoKWHzepB-qUFL08gBEnSws_ohewLzw@mail.gmail.com>
To: liuzhiwei <zhiwei_liu@c-sky.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@sifive.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 sagark@eecs.berkeley.edu, 
 bastian@mail.uni-paderborn.de, Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000a9d8e4058f995eeb"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::329
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
X-List-Received-Date: Thu, 08 Aug 2019 11:29:30 -0000

--000000000000a9d8e4058f995eeb
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 8, 2019 at 11:52 AM liuzhiwei <zhiwei_liu@c-sky.com> wrote:

> Hi all,
>
>     My workmate  and I have been working on Vector & Dsp extension, and
> I'd like to share develop status  with folks.
>
>     The spec references for  Vector extension is riscv-v-spec-0.7.1, and
> riscv-p-spec-0.5 for DSP extension.


Hello, Liu.

I will not answer your questions directly, however I want to bring to you
and others another perspective on this situation.

First, please provide the link to the specifications. Via Google, I found
that "riscv-v-spec-0.7.1" is titled "Working draft of the proposed RISC-V V
vector extension". I could not find "riscv-p-spec-0.5".

I am not sure what the QEMU policy towards "working draft proposal" type of
specification is. Peter, can you perhaps clarify that or any other related
issue?

I would advice some caution in these cases. The major issue is backward
compatibility, but there are other issues too. Let's say, fairness. If we
let emulation of a component based on a "working draft proposal" be
integrated into QEMU, this will set a precedent, and many other developer
would rightfully ask for their contributions based on drafts to be
integrated into QEMU. Our policy should be as equal as possible to all
contribution, large or small, riscv or alpha, cpu or device, tcg or kvm -
in my honest opinion. QEMU upstream should not be a collecting place for
all imaginable experimentations, certain criteria on what is appropriate
for upstreaming exist and must continue to exist.

Yours,
Aleksandar




> The code of vector extension is
> ready and under testing,  the first patch will be sent about two weeks
> later. After that we will forward working on DSP extension, and send the
> first patch in middle  October.
>
>      Could the maintainers  tell me whether the specs referenced are
> appropriate? Is anyone working on these extensions?  I'd like to get
> your status, and maybe discuss questions and work togather.
>
> Best Regards
>
> LIU Zhiwei
>
>
>
>

--000000000000a9d8e4058f995eeb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 8, 2019 at 11:52 AM liuzh=
iwei &lt;<a href=3D"mailto:zhiwei_liu@c-sky.com">zhiwei_liu@c-sky.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi all=
,<br>
<br>
=C2=A0=C2=A0=C2=A0 My workmate=C2=A0 and I have been working on Vector &amp=
; Dsp extension, and <br>
I&#39;d like to share develop status=C2=A0 with folks.<br>
<br>
=C2=A0=C2=A0=C2=A0 The spec references for=C2=A0 Vector extension is riscv-=
v-spec-0.7.1, and <br>
riscv-p-spec-0.5 for DSP extension.</blockquote><div><br></div><div>Hello, =
Liu.</div><div><br></div><div>I will not answer your questions directly, ho=
wever I want to bring to you and others another perspective on this situati=
on.</div><div><br></div><div>First, please provide the link to the specific=
ations. Via Google, I found that &quot;riscv-v-spec-0.7.1&quot; is titled &=
quot;<span style=3D"color:rgb(36,41,46);font-family:-apple-system,BlinkMacS=
ystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color=
 Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;;font-si=
ze:16px">Working draft of the proposed RISC-V V vector extension</span>&quo=
t;. I could not find &quot;riscv-p-spec-0.5&quot;.</div><div><br></div><div=
>I am not sure what the QEMU policy towards &quot;working draft proposal&qu=
ot; type of specification is. Peter, can you perhaps clarify that or any ot=
her related issue?</div><div><br></div><div>I would advice some caution in =
these cases. The major issue is backward compatibility, but there are other=
 issues too. Let&#39;s say, fairness. If we let emulation of a component ba=
sed on a &quot;working draft proposal&quot; be integrated into QEMU, this w=
ill set a precedent, and many other developer would rightfully ask for thei=
r contributions based on drafts to be integrated into QEMU. Our policy shou=
ld be as equal as possible to all contribution, large or small, riscv or al=
pha, cpu or device, tcg or kvm - in my honest opinion. QEMU upstream should=
 not be a collecting place for all imaginable experimentations, certain cri=
teria on what is appropriate for upstreaming exist and must continue to exi=
st.</div><div><br></div><div>Yours,</div><div>Aleksandar</div><div><br></di=
v><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">The code of vector extension is <br>
ready and under testing,=C2=A0 the first patch will be sent about two weeks=
 <br>
later. After that we will forward working on DSP extension, and send the <b=
r>
first patch in middle=C2=A0 October.<br>
<br>
=C2=A0=C2=A0 =C2=A0 Could the maintainers=C2=A0 tell me whether the specs r=
eferenced are <br>
appropriate? Is anyone working on these extensions?=C2=A0 I&#39;d like to g=
et <br>
your status, and maybe discuss questions and work togather.<br>
<br>
Best Regards<br>
<br>
LIU Zhiwei<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000a9d8e4058f995eeb--

