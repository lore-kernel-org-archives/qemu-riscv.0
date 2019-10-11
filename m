Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iJ4AJ-0001co-H2
	for mharc-qemu-riscv@gnu.org; Fri, 11 Oct 2019 19:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38143)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dayeol@berkeley.edu>) id 1iJ4AG-0001by-ON
 for qemu-riscv@nongnu.org; Fri, 11 Oct 2019 19:17:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dayeol@berkeley.edu>) id 1iJ4AE-0002Eg-Se
 for qemu-riscv@nongnu.org; Fri, 11 Oct 2019 19:17:40 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:42974)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dayeol@berkeley.edu>) id 1iJ4AD-0002DV-2L
 for qemu-riscv@nongnu.org; Fri, 11 Oct 2019 19:17:38 -0400
Received: by mail-pf1-x444.google.com with SMTP id q12so6928153pff.9
 for <qemu-riscv@nongnu.org>; Fri, 11 Oct 2019 16:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=berkeley-edu.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WqqbTIAy+kfymfY7HkIZ00SnVjzCr6un7JnhABIzqoM=;
 b=MGQLcawiaRcn+4K840jk+UHH+OyWbQT0KGhbgC94OCMOn6803UyZdmo2gOfLGje+2N
 K4vsYaYNT7QDY93YkvUCxn1rY+zqt1Cupg/7iJ0/+h/qAKpwD4CjSCix6uawbP0XLw2p
 1urUdbR99TSFxxjVIXCyjC10sDzZINp9PIF1EPyBJ3Z2hA1rAgRmjfaYfHhxR2R4s/Xy
 T1PZp8O92BNwu6yEu/uu+QHQFAOXnuTAPfs7mPlJy6PmR9QvB6+5r/hR9TyciAn3vUnu
 p/jnhYiSVM/MGtyWjCcNIx6/NIxaX1bZ5NSvcj7FSU/waRXI9RsPh3TD2WjrD2NAxxfw
 T/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WqqbTIAy+kfymfY7HkIZ00SnVjzCr6un7JnhABIzqoM=;
 b=fQOyZVLOeqo3LmRQC19JUn1qmhbHINVu7qaoi2BXHSohLzIH+5mNxSURSjqW+Ntq4A
 6fJ6FiZJOcc75eF11wcoEg5sQLIqSq845qRdQx2WYlGIkR6qB6LyANr42cuiDGd/oW4T
 tnZF4CEU7yUAwel6+ZXeGwHd8Sged0ZQbFi/Mdn19ApcmXvU6ecPqatZz6A/xQ1DajtD
 2mMzKHar94+rBq/4CS2rX4JFNCVHw10alUnAmfLqVsT368j5BTDHcLXPZLKMqIhN17CW
 qiw0sM8V28SKIP6on9X7JCzMO8/Eh7LaZPgo+0taFTu4cCfm+JlT2cExmZ+oYkuVj0lX
 8tAA==
X-Gm-Message-State: APjAAAW/u6gsHzm1Ap2KWyE4rBV3E7Ae6WLbVBBOFqDw5xgAB52yDCnc
 8iIgBitUDQybMsr4G3m1c64tQenBjyg7Y+mRSl97Zw==
X-Google-Smtp-Source: APXvYqwywFjpVpY4fX+LhgHydWhqDVf1u0VRAKcGuXi0vj/NL6kwNvtSXLcXpWPUxeUD6T7wkGkXJWBtC7XgmjL4aQA=
X-Received: by 2002:a63:1521:: with SMTP id v33mr1072460pgl.273.1570835854898; 
 Fri, 11 Oct 2019 16:17:34 -0700 (PDT)
MIME-Version: 1.0
References: <LqVBb_I--3-1@tuta.io>
 <CAKmqyKNh-jgg-LWHp4RMM9vaaMNr7qHtNSVYs9OFXhvJ-+7RXA@mail.gmail.com>
In-Reply-To: <CAKmqyKNh-jgg-LWHp4RMM9vaaMNr7qHtNSVYs9OFXhvJ-+7RXA@mail.gmail.com>
From: Dayeol Lee <dayeol@berkeley.edu>
Date: Fri, 11 Oct 2019 16:17:24 -0700
Message-ID: <CACjxMEsUrDqSZNHdLEXoOAbNFmyT+iNjjTqSDBDBZ-NgdggJqA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] target/riscv/pmp: Fix bug preventing
To: Alistair Francis <alistair23@gmail.com>
Cc: Chris Williams <diodesign@tuta.io>, Palmer Dabbelt <palmer@sifive.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qemu Riscv <qemu-riscv@nongnu.org>, Qemu Devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000021d5920594aab983"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
X-List-Received-Date: Fri, 11 Oct 2019 23:17:42 -0000

--00000000000021d5920594aab983
Content-Type: text/plain; charset="UTF-8"

Hi, Alistair,

Thank you for reminding me.
I already had the local patch, so I re-submitted the patch.
Please let me know if that's fair enough (or you have any other comments)

Thanks,

Dayeol

On Fri, Oct 11, 2019 at 3:24 PM Alistair Francis <alistair23@gmail.com>
wrote:

> On Sun, Oct 6, 2019 at 1:32 AM Chris Williams <diodesign@tuta.io> wrote:
> >
> > Hello. I hope you don't mind me resubmitting this patch. Please let me
> know if
>
> Not at all!
>
> Thanks for the patch.
>
> In future if people don't respond you can just keep pinging your patch.
>
> > I've formatted it incorrectly or if it needs more explanation. My
> previous
> > attempt probably wasn't formatted quite right. This is my first time
> > contributing to Qemu, so I'm keen to get it right - thanks.
>
> This whole paragraph should not be in the commit. It can go below the
> line though.
>
> Also please use `git format-patch` to format the patch and then `git
> send-email` to send the patch. There is a whole heap of detail here:
> https://wiki.qemu.org/Contribute/SubmitAPatch
>
> >
> > This fixes an issue that prevents a RISC-V CPU from executing
> instructions
> > immediately from the base address of a PMP TOR region.
> >
> > When jumping to an instruction in a PMP TOR region, pmp_hart_has_privs()
> is
> > called to validate the access. If this instruction is the very first
> word of a
> > PMP TOR region, at address 0 relative to the start address of the
> region, then
> > the access will fail. This is because pmp_hart_has_privs() is called
> with size
> > 0 to perform this validation, causing this check...
> >
> > e = pmp_is_in_range(env, i, addr + size - 1);
> >
> > ... to fail, as (addr + size - 1) falls below the base address of the PMP
> > region. Really, the access should succeed. For example, if I have a
> region
> > spanning 0x80d96000 to 0x88d95fff and the CPU jumps to 0x80d96000, then:
> >
> > s = 0x80d96000
> > e = 0x80d95fff
> >
> > And the validation fails. The size check proposed below catches these
> zero-size
> > instruction fetch access probes. The word alignment in pmpaddr{0-15} and
> > earlier instruction alignment checks should prevent the execution of
> > instructions over the upper boundary of the PMP region, though I'm happy
> to give
> > this more attention if this is a concern.
>
> This seems like a similar issue to this patch as well:
>
> https://lore.kernel.org/qemu-devel/20191007052813.25814-1-dayeol@berkeley.edu/
>
> From that discussion:
>
> "In general, size 0 means "unknown size".  In this case, the one tlb
> lookup is
> going to be used by lots of instructions -- everything that fits on the
> page."
>
> Richard's last comment seems like a better fix:
>
> "You certainly could do
>
>     if (size == 0) {
>         size = -(addr | TARGET_PAGE_MASK);
>     }
>
> to assume that all bytes from addr to the end of the page are accessed.
> That
> would avoid changing too much of the rest of the logic.
>
> That said, this code will continue to not work for mis-aligned boundaries."
>
> So I don't think this is the correct solution. I'm not sure if Dayeol
> is planning on sending a follow up version. If not feel free to send
> it.
>
> >
> > Signed-off-by: Chris Williams <diodesign@tuta.io <mailto:
> diodesign@tuta.io>>
>
> It looks like this is a HTML patch, also ensure all patches are just
> plain text, `git send-email` will do this.
>
> Thanks for the patch though! Please send any more fixes that you find :)
>
> Alistair
>
> >
> > diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> > index d4f1007109..9308672e20 100644
> > --- a/target/riscv/pmp.c
> > +++ b/target/riscv/pmp.c
> > @@ -235,8 +235,9 @@ bool pmp_hart_has_privs(CPURISCVState *env,
> target_ulong
> > addr,
> >      /* 1.10 draft priv spec states there is an implicit order
> >           from low to high */
> >      for (i = 0; i < MAX_RISCV_PMPS; i++) {
> > +        /* catch zero-size instruction checks */
> >          s = pmp_is_in_range(env, i, addr);
> > -        e = pmp_is_in_range(env, i, addr + size - 1);
> > +        e = pmp_is_in_range(env, i, (size == 0) ? addr : addr + size -
> 1);
> >
> >          /* partially inside */
> >          if ((s + e) == 1) {
> >
> >
>

--00000000000021d5920594aab983
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Alistair,=C2=A0<div><br><div>Thank you for reminding m=
e.<div>I already had the local patch, so I re-submitted the patch.</div></d=
iv></div><div>Please let me know if that&#39;s fair enough (or you have any=
 other comments)<br></div><div><br></div><div>Thanks,</div><div><br></div><=
div>Dayeol</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Oct 11, 2019 at 3:24 PM Alistair Francis &lt;<a hre=
f=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun, Oct 6, 2019 a=
t 1:32 AM Chris Williams &lt;<a href=3D"mailto:diodesign@tuta.io" target=3D=
"_blank">diodesign@tuta.io</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello. I hope you don&#39;t mind me resubmitting this patch. Please le=
t me know if<br>
<br>
Not at all!<br>
<br>
Thanks for the patch.<br>
<br>
In future if people don&#39;t respond you can just keep pinging your patch.=
<br>
<br>
&gt; I&#39;ve formatted it incorrectly or if it needs more explanation. My =
previous<br>
&gt; attempt probably wasn&#39;t formatted quite right. This is my first ti=
me<br>
&gt; contributing to Qemu, so I&#39;m keen to get it right - thanks.<br>
<br>
This whole paragraph should not be in the commit. It can go below the<br>
line though.<br>
<br>
Also please use `git format-patch` to format the patch and then `git<br>
send-email` to send the patch. There is a whole heap of detail here:<br>
<a href=3D"https://wiki.qemu.org/Contribute/SubmitAPatch" rel=3D"noreferrer=
" target=3D"_blank">https://wiki.qemu.org/Contribute/SubmitAPatch</a><br>
<br>
&gt;<br>
&gt; This fixes an issue that prevents a RISC-V CPU from executing instruct=
ions<br>
&gt; immediately from the base address of a PMP TOR region.<br>
&gt;<br>
&gt; When jumping to an instruction in a PMP TOR region, pmp_hart_has_privs=
() is<br>
&gt; called to validate the access. If this instruction is the very first w=
ord of a<br>
&gt; PMP TOR region, at address 0 relative to the start address of the regi=
on, then<br>
&gt; the access will fail. This is because pmp_hart_has_privs() is called w=
ith size<br>
&gt; 0 to perform this validation, causing this check...<br>
&gt;<br>
&gt; e =3D pmp_is_in_range(env, i, addr + size - 1);<br>
&gt;<br>
&gt; ... to fail, as (addr + size - 1) falls below the base address of the =
PMP<br>
&gt; region. Really, the access should succeed. For example, if I have a re=
gion<br>
&gt; spanning 0x80d96000 to 0x88d95fff and the CPU jumps to 0x80d96000, the=
n:<br>
&gt;<br>
&gt; s =3D 0x80d96000<br>
&gt; e =3D 0x80d95fff<br>
&gt;<br>
&gt; And the validation fails. The size check proposed below catches these =
zero-size<br>
&gt; instruction fetch access probes. The word alignment in pmpaddr{0-15} a=
nd<br>
&gt; earlier instruction alignment checks should prevent the execution of<b=
r>
&gt; instructions over the upper boundary of the PMP region, though I&#39;m=
 happy to give<br>
&gt; this more attention if this is a concern.<br>
<br>
This seems like a similar issue to this patch as well:<br>
<a href=3D"https://lore.kernel.org/qemu-devel/20191007052813.25814-1-dayeol=
@berkeley.edu/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.or=
g/qemu-devel/20191007052813.25814-1-dayeol@berkeley.edu/</a><br>
<br>
From that discussion:<br>
<br>
&quot;In general, size 0 means &quot;unknown size&quot;.=C2=A0 In this case=
, the one tlb lookup is<br>
going to be used by lots of instructions -- everything that fits on the pag=
e.&quot;<br>
<br>
Richard&#39;s last comment seems like a better fix:<br>
<br>
&quot;You certainly could do<br>
<br>
=C2=A0 =C2=A0 if (size =3D=3D 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D -(addr | TARGET_PAGE_MASK);<br>
=C2=A0 =C2=A0 }<br>
<br>
to assume that all bytes from addr to the end of the page are accessed.=C2=
=A0 That<br>
would avoid changing too much of the rest of the logic.<br>
<br>
That said, this code will continue to not work for mis-aligned boundaries.&=
quot;<br>
<br>
So I don&#39;t think this is the correct solution. I&#39;m not sure if Daye=
ol<br>
is planning on sending a follow up version. If not feel free to send<br>
it.<br>
<br>
&gt;<br>
&gt; Signed-off-by: Chris Williams &lt;<a href=3D"mailto:diodesign@tuta.io"=
 target=3D"_blank">diodesign@tuta.io</a> &lt;mailto:<a href=3D"mailto:diode=
sign@tuta.io" target=3D"_blank">diodesign@tuta.io</a>&gt;&gt;<br>
<br>
It looks like this is a HTML patch, also ensure all patches are just<br>
plain text, `git send-email` will do this.<br>
<br>
Thanks for the patch though! Please send any more fixes that you find :)<br=
>
<br>
Alistair<br>
<br>
&gt;<br>
&gt; diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c<br>
&gt; index d4f1007109..9308672e20 100644<br>
&gt; --- a/target/riscv/pmp.c<br>
&gt; +++ b/target/riscv/pmp.c<br>
&gt; @@ -235,8 +235,9 @@ bool pmp_hart_has_privs(CPURISCVState *env, target=
_ulong<br>
&gt; addr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* 1.10 draft priv spec states there is an implici=
t order<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from low to high */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; MAX_RISCV_PMPS; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* catch zero-size instruction checks */<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D pmp_is_in_range(env, i, addr);=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 e =3D pmp_is_in_range(env, i, addr + size=
 - 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 e =3D pmp_is_in_range(env, i, (size =3D=
=3D 0) ? addr : addr + size - 1);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* partially inside */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((s + e) =3D=3D 1) {<br>
&gt;<br>
&gt;<br>
</blockquote></div>

--00000000000021d5920594aab983--

