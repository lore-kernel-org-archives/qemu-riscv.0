Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mTe4M-0008Ge-KF
	for mharc-qemu-riscv@gnu.org; Fri, 24 Sep 2021 01:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tangxingxin1008@gmail.com>)
 id 1mTe4G-0008GJ-Bt; Fri, 24 Sep 2021 01:48:19 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:38827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tangxingxin1008@gmail.com>)
 id 1mTe4E-0000zw-AK; Fri, 24 Sep 2021 01:48:15 -0400
Received: by mail-il1-x134.google.com with SMTP id q14so9140253ils.5;
 Thu, 23 Sep 2021 22:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D/ppLEq00UAH7ryAoBMY6Ta2gFtRm83gvNv8hfHhvds=;
 b=DGcefvHQQXSUILAQseuOArSaq6EEQmA0BDcYjMYICRopuF3Wrz9DQbJTqDDu6wMdAC
 5GS+J5jcDaBQJ4NQIEr6WUcEqUk2gAiBf0MyOgXjoJbZeU3jeSMZcD4HZ1I7mbdPw2+m
 zGw6EXlowXaH4w2mPDMep86hgbUn+dcMM0o3JlnW8Yl32hjeCEO2pMUwSmvU/X+ynnVL
 Q4+0FZZdxq0M9WVpjOn/Cetgz0adObRdE1/xfTaQTL05n1LeVP/2qrgZ8zhyOiF6l10A
 8IrjTVlNqPACBcvhvkk0X50wgRbHes89hd0Cxq2NIviCu0kWE8KUlnteEtYHmjQ9ZmZb
 bepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D/ppLEq00UAH7ryAoBMY6Ta2gFtRm83gvNv8hfHhvds=;
 b=qndQ4S+MoK/DqH4XariHIGiXIRmNd0IxuixYXamX6JG7aPyHvYLHDB4ccYVqp/HoNT
 l2X2twoWHZKutfZg/JCS9DbL7QCPfhl3Vfjd4CyZ6jwx+6iNQu6SYWKKAdFcYO0u+S2G
 6sBWMl+Y0ZcaHDlpjjbxHqExWKIVYRAV3wIKshn32P+YPrlatWKunmBNJAnsuJHxClVL
 50Ij//UkHi1dWn3u4bs/Y1G/FVLhYGj1QyLGOILqWCmY6RHqvUQDSliOB/p4/PuZBT/g
 jmiMrpGx/RHGAYLdS7ugRIUwQNdjwUO58LdSvFyfWL//yHOFLa6WFO0QWbxTkS59JkWn
 lwVA==
X-Gm-Message-State: AOAM530O9aOZ9s/PptXhqxSirjdazeXVB24QLAJvfR6c1SC7j2MgYCjc
 b+l95Oh19KrSuc9Jd5b2UDfAiObVEeQ0HmwjG54=
X-Google-Smtp-Source: ABdhPJw0pKC+Ac+Bzl6MVF4eocaeXWIymLrk2JCRLjtfjd04vJDZYn8s7blK83CJhBzO43rUOJIx1xCSUosh8WbR+WE=
X-Received: by 2002:a05:6e02:1588:: with SMTP id
 m8mr6841067ilu.188.1632462492104; 
 Thu, 23 Sep 2021 22:48:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210918062816.7546-1-tangxingxin1008@gmail.com>
 <CAKmqyKM2qM3pQaTN06S+TwWBCd2cB4pusex9z7NvdypZC7Nbiw@mail.gmail.com>
In-Reply-To: <CAKmqyKM2qM3pQaTN06S+TwWBCd2cB4pusex9z7NvdypZC7Nbiw@mail.gmail.com>
From: eric tang <tangxingxin1008@gmail.com>
Date: Fri, 24 Sep 2021 13:48:00 +0800
Message-ID: <CAE_nArV5ahZZ9gCFxyGn+PBhPf-aADGsCQgBWLDQjzuV_KNYeg@mail.gmail.com>
Subject: Re: [RFC 00/10] add the rest of riscv bitmapip-0.93 instructions
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: multipart/alternative; boundary="000000000000f37d3f05ccb74a15"
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=tangxingxin1008@gmail.com; helo=mail-il1-x134.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
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
X-List-Received-Date: Fri, 24 Sep 2021 05:48:21 -0000

--000000000000f37d3f05ccb74a15
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok, thanks. ^ ^!

Alistair Francis <alistair23@gmail.com> =E4=BA=8E2021=E5=B9=B49=E6=9C=8824=
=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=8812:39=E5=86=99=E9=81=93=EF=BC=
=9A

> On Sat, Sep 18, 2021 at 6:20 PM Eric Tang <tangxingxin1008@gmail.com>
> wrote:
> >
> > These patches fixed some issues about srow/sroiw/clzw instructions and
> > add the rest of riscv bitmapip-0.93 instructions except fsri/fsriw &
> > bext/bdep & bextw/bdepw for opcode coding or name conflict problems. Th=
e
> > problems had been fixed in riscv bitmapip-1.0 version.
> >
> > I have tested these bitmapip instructions, passed by compare the result=
s
> > that produced by qemu and spike.
> >
> > Please review and give your opinion kindly :)
>
> Hey Eric,
>
> Thanks for the patches!
>
> Unfortunately there is already a series "target/riscv: Update QEmu for
> Zb[abcs] 1.0.0"
> (https://www.mail-archive.com/qemu-devel@nongnu.org/msg839086.html)
> that adds support for the v1.0.0 bit manip extension. That has been
> reviewed and queued to be merged.
>
> If you have fixes or features that apply on top of that please send
> them though :)
>
> Alistair
>
> >
> > Eric Tang (10):
> >   target/riscv: rvb: fixed an error about srow/sroiw instructions
> >   target/riscv: rvb: add carry-less multiply instructions
> >   target/riscv: rvb: add cmix/cmov instructions
> >   target/riscv: rvb: add generalized shuffle instructions
> >   target/riscv: rvb: add crossbar permutation instructions
> >   target/riscv: rvb: add bfp/bfpw instructions
> >   target/riscv: rvb: add CRC instructions
> >   target/riscv: rvb: add bit-matrix instructions
> >   target/riscv: rvb: fixed an issue about clzw instruction
> >   target/riscv: rvb: add funnel shfit instructions
> >
> >  target/riscv/bitmanip_helper.c          | 351 ++++++++++++++++++++++++
> >  target/riscv/helper.h                   |  28 ++
> >  target/riscv/insn32.decode              |  36 +++
> >  target/riscv/insn_trans/trans_rvb.c.inc | 215 ++++++++++++++-
> >  target/riscv/translate.c                |  14 +
> >  5 files changed, 641 insertions(+), 3 deletions(-)
> >
> > --
> > 2.17.1
> >
> >
>

--000000000000f37d3f05ccb74a15
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ok, thanks. ^ ^!</div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">Alistair Francis &lt;<a href=3D"mailto:ali=
stair23@gmail.com">alistair23@gmail.com</a>&gt; =E4=BA=8E2021=E5=B9=B49=E6=
=9C=8824=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=8812:39=E5=86=99=E9=81=
=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
Sat, Sep 18, 2021 at 6:20 PM Eric Tang &lt;<a href=3D"mailto:tangxingxin100=
8@gmail.com" target=3D"_blank">tangxingxin1008@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; These patches fixed some issues about srow/sroiw/clzw instructions and=
<br>
&gt; add the rest of riscv bitmapip-0.93 instructions except fsri/fsriw &am=
p;<br>
&gt; bext/bdep &amp; bextw/bdepw for opcode coding or name conflict problem=
s. The<br>
&gt; problems had been fixed in riscv bitmapip-1.0 version.<br>
&gt;<br>
&gt; I have tested these bitmapip instructions, passed by compare the resul=
ts<br>
&gt; that produced by qemu and spike.<br>
&gt;<br>
&gt; Please review and give your opinion kindly :)<br>
<br>
Hey Eric,<br>
<br>
Thanks for the patches!<br>
<br>
Unfortunately there is already a series &quot;target/riscv: Update QEmu for=
<br>
Zb[abcs] 1.0.0&quot;<br>
(<a href=3D"https://www.mail-archive.com/qemu-devel@nongnu.org/msg839086.ht=
ml" rel=3D"noreferrer" target=3D"_blank">https://www.mail-archive.com/qemu-=
devel@nongnu.org/msg839086.html</a>)<br>
that adds support for the v1.0.0 bit manip extension. That has been<br>
reviewed and queued to be merged.<br>
<br>
If you have fixes or features that apply on top of that please send<br>
them though :)<br>
<br>
Alistair<br>
<br>
&gt;<br>
&gt; Eric Tang (10):<br>
&gt;=C2=A0 =C2=A0target/riscv: rvb: fixed an error about srow/sroiw instruc=
tions<br>
&gt;=C2=A0 =C2=A0target/riscv: rvb: add carry-less multiply instructions<br=
>
&gt;=C2=A0 =C2=A0target/riscv: rvb: add cmix/cmov instructions<br>
&gt;=C2=A0 =C2=A0target/riscv: rvb: add generalized shuffle instructions<br=
>
&gt;=C2=A0 =C2=A0target/riscv: rvb: add crossbar permutation instructions<b=
r>
&gt;=C2=A0 =C2=A0target/riscv: rvb: add bfp/bfpw instructions<br>
&gt;=C2=A0 =C2=A0target/riscv: rvb: add CRC instructions<br>
&gt;=C2=A0 =C2=A0target/riscv: rvb: add bit-matrix instructions<br>
&gt;=C2=A0 =C2=A0target/riscv: rvb: fixed an issue about clzw instruction<b=
r>
&gt;=C2=A0 =C2=A0target/riscv: rvb: add funnel shfit instructions<br>
&gt;<br>
&gt;=C2=A0 target/riscv/bitmanip_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 351 ++++++++++++++++++++++++<br>
&gt;=C2=A0 target/riscv/helper.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 28 ++<br>
&gt;=C2=A0 target/riscv/insn32.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 36 +++<br>
&gt;=C2=A0 target/riscv/insn_trans/trans_rvb.c.inc | 215 ++++++++++++++-<br=
>
&gt;=C2=A0 target/riscv/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 14 +<br>
&gt;=C2=A0 5 files changed, 641 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt;<br>
</blockquote></div>

--000000000000f37d3f05ccb74a15--

