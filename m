Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hyD47-0001Sr-7y
	for mharc-qemu-riscv@gnu.org; Thu, 15 Aug 2019 06:33:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53766)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1hyD43-0001Qu-Fx
 for qemu-riscv@nongnu.org; Thu, 15 Aug 2019 06:33:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1hyD40-0007TF-56
 for qemu-riscv@nongnu.org; Thu, 15 Aug 2019 06:33:03 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:40456)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1hyD40-0007Se-0I; Thu, 15 Aug 2019 06:33:00 -0400
Received: by mail-oi1-x241.google.com with SMTP id h21so1323492oie.7;
 Thu, 15 Aug 2019 03:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=JUpI7QSg4DLCetBObLBn0zKSmureTv/UOBB526fvB1c=;
 b=Dw+h2R0rG2QdZwQPl2rJO8U3MJdRAEltSzTq9uc2QuQzCXn8GqgmL3gCICja6tgMS9
 B2cBZ+9jJyeaSV5oz6DQi24/aeyDt7LPwouRXKoBzRb/LCtLvmKeObTK5NIUNLUx2H3r
 y4Em5ab/h0kjeYogs9qMzKC4JkEbEndmdYYSW4NmU+sd1Xc+0oHnb5hGXPez5Otr4fPX
 E3E/TCXHgQsjZxGbYMWLxJV/JxqR3LBrFjBVdImV6KpJaSU58HXHs4vNsyDQkM9Q0DpU
 Nwrz5zp722bM7VxmJ1b+5rqnIsoDZO4KKIIxdAvZFWvv470Yp8jcFf4lQ6q6LaLoynCl
 SIuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=JUpI7QSg4DLCetBObLBn0zKSmureTv/UOBB526fvB1c=;
 b=fZaCzP941aYP6k3k4FejC2/biUB6+wHeyhH2HoezaPzyOETq/PiWMEq6v3KkmyLJX2
 Wi07J4cPkCJqlruE97kXO1T0UTixrOD/3++f9tGjKiPyne4rpIYFzGYSzGAfok+h8kcN
 86RWuF0lMAP0WGKekB5039ifzRBkx/1tHCjQK5+yab9CcKjzBJnow/QSQFoCVXhR+7U3
 L0MhMr9e7I/M66s6DgVFPWa0WGKmOppS6vDMAcgcu9nzJM1PVAzkpzlRiOc262/b1d0U
 6fqHvqnW/oAxx+8aGpy752SLewCbCd0OTmbEKnvNUVI3eQFsJtKYKNxRFlw+dEOsNgrf
 gtlg==
X-Gm-Message-State: APjAAAVVr7GY/gXgvVTyBVqtP8Wzbtu8jkQruw3MhuqFHpA/tsJKI5sm
 EJ1v6MG8vVNmuC9YWKmOcFJjOBil5afgYElyNNc=
X-Google-Smtp-Source: APXvYqyzFs63mXB/X5ABsCpJId6g7zojC0sjR7AnBRTZsmKMHjC0GYpoZkENKvmvxXZKA1iich+cGYDJEw+ErlsQY9Y=
X-Received: by 2002:aca:4588:: with SMTP id s130mr945380oia.79.1565865178638; 
 Thu, 15 Aug 2019 03:32:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6830:10d7:0:0:0:0 with HTTP; Thu, 15 Aug 2019 03:32:57
 -0700 (PDT)
Received: by 2002:a05:6830:10d7:0:0:0:0 with HTTP; Thu, 15 Aug 2019 03:32:57
 -0700 (PDT)
In-Reply-To: <CAFEAcA9bDU4AWetkR4w4WLUzMW_MMy0CsVa5SibWqf85RyaX5g@mail.gmail.com>
References: <97a6ae9f-2845-4a3c-2a31-367787622268@c-sky.com>
 <CAKmqyKMqCKS_-rxZ2WYEn+m2gDom27rd2f2FCe0LmVs9brPcAQ@mail.gmail.com>
 <c502163b-ed8a-89d1-6437-9b0f49e88a84@c-sky.com>
 <CAKmqyKM5zneojhPe57h1+h3pav5kQxFaMnhNiwWRUa=nbzS3Ag@mail.gmail.com>
 <CAL1e-=hVLQWThYSm78bTCbQPfAABjx_rG9nEa9gV6PvSN8ge2w@mail.gmail.com>
 <CAFEAcA9bDU4AWetkR4w4WLUzMW_MMy0CsVa5SibWqf85RyaX5g@mail.gmail.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Thu, 15 Aug 2019 12:32:57 +0200
Message-ID: <CAL1e-=h1nqRYo4Xef6PF=XBJPn4Proh71q8QgWOvEwUBwEN7Tg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: bastian@mail.uni-paderborn.de, Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, LIU ZhiWei <zhiwei_liu@c-sky.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair23@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000bd2dc205902565f4"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
X-List-Received-Date: Thu, 15 Aug 2019 10:33:05 -0000

--000000000000bd2dc205902565f4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

15.08.2019. 11.07, "Peter Maydell" <peter.maydell@linaro.org> =D1=98=D0=B5 =
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>
> On Thu, 15 Aug 2019 at 09:53, Aleksandar Markovic
> <aleksandar.m.mail@gmail.com> wrote:
> >
> > > We can accept draft
> > > extensions in QEMU as long as they are disabled by default.
>
> > Hi, Alistair, Palmer,
> >
> > Is this an official stance of QEMU community, or perhaps Alistair's
> > personal judgement, or maybe a rule within risv subcomunity?
>
> Alistair asked on a previous thread; my view was:
> https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg03364.html
> and nobody else spoke up disagreeing (summary: should at least be
> disabled-by-default and only enabled by setting an explicit
> property whose name should start with the 'x-' prefix).
>
> In general QEMU does sometimes introduce experimental extensions
> (we've had them in the block layer, for example) and so the 'x-'
> property to enable them is a reasonably established convention.
> I think it's a reasonable compromise to allow this sort of work
> to start and not have to live out-of-tree for a long time, without
> confusing users or getting into a situation where some QEMU
> versions behave differently or to obsolete drafts of a spec
> without it being clear from the command line that experimental
> extensions are being enabled.
>
> There is also an element of "submaintainer judgement" to be applied
> here -- upstream is probably not the place for a draft extension
> to be implemented if it is:
>  * still fast moving or subject to major changes of design direction
>  * major changes to the codebase (especially if it requires
>    changes to core code) that might later need to be redone
>    entirely differently
>  * still experimental
>

OK.

Thanks for detailed response.

Aleksandar

> thanks
> -- PMM

--000000000000bd2dc205902565f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
15.08.2019. 11.07, &quot;Peter Maydell&quot; &lt;<a href=3D"mailto:peter.ma=
ydell@linaro.org">peter.maydell@linaro.org</a>&gt; =D1=98=D0=B5 =D0=BD=D0=
=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:<br>
&gt;<br>
&gt; On Thu, 15 Aug 2019 at 09:53, Aleksandar Markovic<br>
&gt; &lt;<a href=3D"mailto:aleksandar.m.mail@gmail.com">aleksandar.m.mail@g=
mail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; &gt; We can accept draft<br>
&gt; &gt; &gt; extensions in QEMU as long as they are disabled by default.<=
br>
&gt;<br>
&gt; &gt; Hi, Alistair, Palmer,<br>
&gt; &gt;<br>
&gt; &gt; Is this an official stance of QEMU community, or perhaps Alistair=
&#39;s<br>
&gt; &gt; personal judgement, or maybe a rule within risv subcomunity?<br>
&gt;<br>
&gt; Alistair asked on a previous thread; my view was:<br>
&gt; <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg03=
364.html">https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg03364.ht=
ml</a><br>
&gt; and nobody else spoke up disagreeing (summary: should at least be<br>
&gt; disabled-by-default and only enabled by setting an explicit<br>
&gt; property whose name should start with the &#39;x-&#39; prefix).<br>
&gt;<br>
&gt; In general QEMU does sometimes introduce experimental extensions<br>
&gt; (we&#39;ve had them in the block layer, for example) and so the &#39;x=
-&#39;<br>
&gt; property to enable them is a reasonably established convention.<br>
&gt; I think it&#39;s a reasonable compromise to allow this sort of work<br=
>
&gt; to start and not have to live out-of-tree for a long time, without<br>
&gt; confusing users or getting into a situation where some QEMU<br>
&gt; versions behave differently or to obsolete drafts of a spec<br>
&gt; without it being clear from the command line that experimental<br>
&gt; extensions are being enabled.<br>
&gt;<br>
&gt; There is also an element of &quot;submaintainer judgement&quot; to be =
applied<br>
&gt; here -- upstream is probably not the place for a draft extension<br>
&gt; to be implemented if it is:<br>
&gt; =C2=A0* still fast moving or subject to major changes of design direct=
ion<br>
&gt; =C2=A0* major changes to the codebase (especially if it requires<br>
&gt; =C2=A0 =C2=A0changes to core code) that might later need to be redone<=
br>
&gt; =C2=A0 =C2=A0entirely differently<br>
&gt; =C2=A0* still experimental<br>
&gt;</p>
<p dir=3D"ltr">OK.</p>
<p dir=3D"ltr">Thanks for detailed response.</p>
<p dir=3D"ltr">Aleksandar</p>
<p dir=3D"ltr">&gt; thanks<br>
&gt; -- PMM<br>
</p>

--000000000000bd2dc205902565f4--

