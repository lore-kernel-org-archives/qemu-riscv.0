Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lO9vK-00057B-Qu
	for mharc-qemu-riscv@gnu.org; Sun, 21 Mar 2021 22:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lO9vJ-000546-4k
 for qemu-riscv@nongnu.org; Sun, 21 Mar 2021 22:04:05 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:36739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lO9vH-0006dr-2e
 for qemu-riscv@nongnu.org; Sun, 21 Mar 2021 22:04:04 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 g8-20020a9d6c480000b02901b65ca2432cso14446934otq.3
 for <qemu-riscv@nongnu.org>; Sun, 21 Mar 2021 19:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yi7wEPT/0JeMmRMsZaUzJ+IFIcElHTLJbNHh31Z7aSQ=;
 b=NSBUgffWgU42CVlQuAYlI56PgfcRxkGK6qRCILmf77sG6hY3FhZZfRL/0fDTOLdDxz
 7YRWDBdOLWCfKe4r8M3B8O0breHSZBLUbYUS5gIL/yzpe1XUZg+qfKsCj1ioRpZ6rf4s
 EcfFJKwNkCl2L8J06TwiMRGs0A0il1bT3Ry0ubGbWNkSsrpihU1nzvykNU88xryzwHED
 z4LAmUkZIJ7YK0M3MxNeGZ5nXkXEjxcH7y4fGEpgZGcirJQpfkpz3OZCtNP+dCwm9Oa9
 WDC9l/qGbqTFvM6T/sQesMVfF2F4NwGAxBNvfqr0BAFhzWNOptq2W1OTi4Q06+lPInHS
 zHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yi7wEPT/0JeMmRMsZaUzJ+IFIcElHTLJbNHh31Z7aSQ=;
 b=Z7dDqbsbHUEqCbsjl1V2+4nWOc5as9wP2EASzNk4cz94MNy3awdtz/ZDhWOCra82xV
 cbSQKWhDC2qIWd2LQL0lP6q8UqJevTQ5fRrS7MRNk+odFla0zMVIinH03Hgp1H4gjKj1
 uSHJMmMeBZud353VqscBHzb0pKkMnkZ/vyUVrKS2nF2FK7VdVkMey4UfAyS/BxvuBwHg
 rG8PSXtyF92yldh8kYpo+CqApybqNyHebE4hWumfNc08O16AYyeJY0PIKu7T6hncQzPH
 JlbK1YH+3TiKTsMPEOIffGpGCav4sXWije+wOiT7K69jycFY8ajz+GWRq8s16I6UIvvQ
 Ns/w==
X-Gm-Message-State: AOAM533c9y0DEdoc8ppbnloe3D+oee73IoGgvNJjCC/TCfW6A/72cdZo
 X3BxwXxMTBbk6IV4QyfkeveBg9y7LdwtaDRpPINpkQ==
X-Google-Smtp-Source: ABdhPJwzHboI9ga9kfw2RJ2wSnKHJCITYDX7ymZF+a+SRsCFy+cFBlzJ9TQenCRaBNa1lj0LGm8UTmAkcysfkzYUoHs=
X-Received: by 2002:a9d:63d6:: with SMTP id e22mr9730314otl.188.1616378640557; 
 Sun, 21 Mar 2021 19:04:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210309072925.4314-1-frank.chang@sifive.com>
 <CAKmqyKN0BDEXeJ-C-P4mRR6e+kKTYtxQoDomiu9ZCH3b_=HJnw@mail.gmail.com>
In-Reply-To: <CAKmqyKN0BDEXeJ-C-P4mRR6e+kKTYtxQoDomiu9ZCH3b_=HJnw@mail.gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Mon, 22 Mar 2021 10:03:49 +0800
Message-ID: <CAE_xrPj9hUbMXQEFB+TUFMyTTs2bzJxwxoAjLyCVm=prJOnUZg@mail.gmail.com>
Subject: Re: [RFC 0/1] target/riscv: add RNMI support
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000b17b1c05be167ac4"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=frank.chang@sifive.com; helo=mail-ot1-x32a.google.com
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
X-List-Received-Date: Mon, 22 Mar 2021 02:04:05 -0000

--000000000000b17b1c05be167ac4
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 19, 2021 at 9:30 PM Alistair Francis <alistair23@gmail.com>
wrote:

> On Tue, Mar 9, 2021 at 2:31 AM <frank.chang@sifive.com> wrote:
> >
> > From: Frank Chang <frank.chang@sifive.com>
> >
> > This patchset add suport of Resumable NMI (RNMI) in RISC-V.
> >
> > There are four new CSRs and one new instruction added to allow NMI to be
> > resumable in RISC-V, which are:
> >
> > =============================================================
> >   * mnscratch (0x350)
> >   * mnepc     (0x351)
> >   * mncause   (0x352)
> >   * mnstatus  (0x353)
> > =============================================================
> >   * mnret: To return from RNMI interrupt/exception handler.
> > =============================================================
> >
> > RNMI also has higher priority than any other interrupts or exceptions
> > and cannot be disable by software.
> >
> > RNMI may be used to route to other devices such as Bus Error Unit or
> > Watchdog Timer in the future.
> >
> > The interrupt/exception trap handler addresses of RNMI are
> > implementation defined.
> >
> > The technical proposal of RNMI can be found:
> > https://lists.riscv.org/g/tech-privileged/message/421
> >
> > The port is available here:
> > https://github.com/sifive/qemu/tree/nmi-upstream-v1
> >
> > To enable RNMI feature, add cpu argument: 'rnmi=true' and specify
> > RNMI interrupt/exception handler addresses with 'rnmi_irqvec' and
> > 'rnmi_excpvec' arguments, e.g.
> >     -cpu rv64,rnmi=true,rnmi_irqvec=0x2000,rnmi_excpvec=0x3000
>
> Can you include details about the software you are using and how I can
> test this?
>
> Alistair
>

Thanks, I'll include that in my next version patchset.

Frank Chang


>
> >
> > Frank Chang (1):
> >   target/riscv: add support of RNMI
> >
> >  target/riscv/cpu.c                            | 40 +++++++++++++
> >  target/riscv/cpu.h                            | 16 ++++-
> >  target/riscv/cpu_bits.h                       | 19 ++++++
> >  target/riscv/cpu_helper.c                     | 47 +++++++++++++--
> >  target/riscv/csr.c                            | 59 +++++++++++++++++++
> >  target/riscv/helper.h                         |  1 +
> >  target/riscv/insn32.decode                    |  3 +
> >  .../riscv/insn_trans/trans_privileged.c.inc   | 13 ++++
> >  target/riscv/op_helper.c                      | 31 ++++++++++
> >  9 files changed, 224 insertions(+), 5 deletions(-)
> >
> > --
> > 2.17.1
> >
> >
>

--000000000000b17b1c05be167ac4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Mar 19, 2021 at 9:30 PM Alistair =
Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a=
>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Tue, Mar 9, 2021 at 2:31 AM &lt;<a href=3D"mailt=
o:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a>&gt; =
wrote:<br>
&gt;<br>
&gt; From: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com" target=
=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt;<br>
&gt; This patchset add suport of Resumable NMI (RNMI) in RISC-V.<br>
&gt;<br>
&gt; There are four new CSRs and one new instruction added to allow NMI to =
be<br>
&gt; resumable in RISC-V, which are:<br>
&gt;<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;=C2=A0 =C2=A0* mnscratch (0x350)<br>
&gt;=C2=A0 =C2=A0* mnepc=C2=A0 =C2=A0 =C2=A0(0x351)<br>
&gt;=C2=A0 =C2=A0* mncause=C2=A0 =C2=A0(0x352)<br>
&gt;=C2=A0 =C2=A0* mnstatus=C2=A0 (0x353)<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;=C2=A0 =C2=A0* mnret: To return from RNMI interrupt/exception handler.<=
br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;<br>
&gt; RNMI also has higher priority than any other interrupts or exceptions<=
br>
&gt; and cannot be disable by software.<br>
&gt;<br>
&gt; RNMI may be used to route to other devices such as Bus Error Unit or<b=
r>
&gt; Watchdog Timer in the future.<br>
&gt;<br>
&gt; The interrupt/exception trap handler addresses of RNMI are<br>
&gt; implementation defined.<br>
&gt;<br>
&gt; The technical proposal of RNMI can be found:<br>
&gt; <a href=3D"https://lists.riscv.org/g/tech-privileged/message/421" rel=
=3D"noreferrer" target=3D"_blank">https://lists.riscv.org/g/tech-privileged=
/message/421</a><br>
&gt;<br>
&gt; The port is available here:<br>
&gt; <a href=3D"https://github.com/sifive/qemu/tree/nmi-upstream-v1" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/sifive/qemu/tree/nmi-upst=
ream-v1</a><br>
&gt;<br>
&gt; To enable RNMI feature, add cpu argument: &#39;rnmi=3Dtrue&#39; and sp=
ecify<br>
&gt; RNMI interrupt/exception handler addresses with &#39;rnmi_irqvec&#39; =
and<br>
&gt; &#39;rnmi_excpvec&#39; arguments, e.g.<br>
&gt;=C2=A0 =C2=A0 =C2=A0-cpu rv64,rnmi=3Dtrue,rnmi_irqvec=3D0x2000,rnmi_exc=
pvec=3D0x3000<br>
<br>
Can you include details about the software you are using and how I can<br>
test this?<br>
<br>
Alistair<br></blockquote><div><br></div><div>Thanks, I&#39;ll include that =
in my next version patchset.</div><div><br></div><div>Frank Chang</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; Frank Chang (1):<br>
&gt;=C2=A0 =C2=A0target/riscv: add support of RNMI<br>
&gt;<br>
&gt;=C2=A0 target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 40 +++++++++++++<br>
&gt;=C2=A0 target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 16 ++++-<br>
&gt;=C2=A0 target/riscv/cpu_bits.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 19 ++++++<br>
&gt;=C2=A0 target/riscv/cpu_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 47 +++++++++++++--<br>
&gt;=C2=A0 target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 59 +++++++++++++++++=
++<br>
&gt;=C2=A0 target/riscv/helper.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 target/riscv/insn32.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +<br>
&gt;=C2=A0 .../riscv/insn_trans/trans_privileged.c.inc=C2=A0 =C2=A0| 13 +++=
+<br>
&gt;=C2=A0 target/riscv/op_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 31 ++++++++++<br>
&gt;=C2=A0 9 files changed, 224 insertions(+), 5 deletions(-)<br>
&gt;<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt;<br>
</blockquote></div></div>

--000000000000b17b1c05be167ac4--

