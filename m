Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6sSJ-0003uh-Ua
	for mharc-qemu-riscv@gnu.org; Wed, 26 Feb 2020 03:54:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49636)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rajnesh.kanwal49@gmail.com>) id 1j6sSG-0003mU-CB
 for qemu-riscv@nongnu.org; Wed, 26 Feb 2020 03:54:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rajnesh.kanwal49@gmail.com>) id 1j6sSE-0006U0-Sb
 for qemu-riscv@nongnu.org; Wed, 26 Feb 2020 03:54:08 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:36070)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rajnesh.kanwal49@gmail.com>)
 id 1j6sSE-0005w9-KD; Wed, 26 Feb 2020 03:54:06 -0500
Received: by mail-wm1-x342.google.com with SMTP id p17so2072333wma.1;
 Wed, 26 Feb 2020 00:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=77UeRA00tpxkV1oP3Uaprcm66fDND8K8Kbn82D8F8sI=;
 b=cGzDY6+qJSwMUfjXQRfIPDsuDJkbZfVWJ45UO1fANphlnv+PqqLJ/T0mRjAiKXO2sW
 mkXasrwcrgGU5wqkK2RGBKhznHoqs6/MYMQ2KjyWRdQbWvH2Z9sRiOPndZShoni9Rs9j
 Ur1E2TF1q/wJXmOT5FVoClvEkv+5qmV4+Qo7y/TxXnjiqn+g0nVvu6gvZIKiCP4MRRIa
 2p74v2uDHdqEw8LXJr7akCDCGRGQ1j/hwx9UoXmLZ8Ix+Qq7KuzGQN/gV5PColgdraoB
 Uh17l6znATA+qVugMpeJCxdtf6zeTz2+IwbdLsOm310z5X7kZaZn5h1gr/9V1Bg3s3nu
 Oxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=77UeRA00tpxkV1oP3Uaprcm66fDND8K8Kbn82D8F8sI=;
 b=Iw1Af1aFINNeKTzw3ySdNbr6F5bwFHdZe2b9tg5VO9gOSzE9gbQcAL5cEkhL6LNi0i
 nZ5/AewwJNuB7CF/lM/G7Lo5j3mGLT4cE+/vv1YrgxSUWybmwCXuSGwUSoxHhDyIuCwZ
 z5dOh8Z446eVTnKDmzWScFmDSU1dq7JBSjY4pD8UoXX44nJ16O8ByOC88N5LKQcpU4fs
 Hhrfk8GDILQLaqBd6YnuL6SDMs5LkgiA24bozBdXoAO4SCEqg3NN91uSeYcfJJ2+45tw
 RXrKyqb6VIOjQ1+QwbqiTb1cY1vBSUFU9O+kxThaaWwVKE20uQ8AcZVooVv3KrFDP0Zn
 7LNA==
X-Gm-Message-State: APjAAAXFNwUzJ16/qqg5yCoMAkdF9snp5kEWYOBQ4WmyPPhEfd0HJs38
 2Sseyuo1lSxccvVSynJvHMl+2LfqemhdNTp+FIo=
X-Google-Smtp-Source: APXvYqyCiUGq8ND2GaPq3aIjKu75/1asmEdplHV9kILRh6871ZhavHYRh5dIEJAmTBvRKu1HviycrRM6d6O3D6nwKaQ=
X-Received: by 2002:a05:600c:214f:: with SMTP id
 v15mr4302656wml.110.1582707239401; 
 Wed, 26 Feb 2020 00:53:59 -0800 (PST)
MIME-Version: 1.0
References: <0c4859f90948ba392da456c9e1daf8fde8f5b22e.1582453384.git.rajnesh.kanwal49@gmail.com>
 <CAC41xo0PWCZw4mrcEfRq9fv+b3mSk9sN0mWhFXPwgdD6LR8xnQ@mail.gmail.com>
 <CAKmqyKNn8V0yWA8t7dQeMwxcnmywDJoGKag9vQzwFruaygKL7Q@mail.gmail.com>
In-Reply-To: <CAKmqyKNn8V0yWA8t7dQeMwxcnmywDJoGKag9vQzwFruaygKL7Q@mail.gmail.com>
From: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
Date: Wed, 26 Feb 2020 13:52:52 +0500
Message-ID: <CAHfcQ+HiNB+Tch2_EVS74_ii-NhUEXMFYCf1R_0nrRfvuRxqgQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/riscv: Fix VS mode interrupts forwarding.
To: Alistair Francis <alistair23@gmail.com>
Cc: Jose Martins <josemartins90@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000c9bbdd059f76be0d"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
X-List-Received-Date: Wed, 26 Feb 2020 08:54:10 -0000

--000000000000c9bbdd059f76be0d
Content-Type: text/plain; charset="UTF-8"

Here is the link to the patch
https://lists.nongnu.org/archive/html/qemu-riscv/2020-01/msg00191.html

-Rajnesh

On Tue, Feb 25, 2020 at 12:06 AM Alistair Francis <alistair23@gmail.com>
wrote:

> On Sun, Feb 23, 2020 at 11:23 AM Jose Martins <josemartins90@gmail.com>
> wrote:
> >
> > Hello rajnesh,
> >
> > I had already submitted almost this exact patch a few weeks ago.
>
> To QEMU? I don't see the patch.
>
> Alistair
>
> >
> > Jose
> >
> > On Sun, 23 Feb 2020 at 13:51, <rajnesh.kanwal49@gmail.com> wrote:
> > >
> > > From: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> > >
> > > Currently riscv_cpu_local_irq_pending is used to find out pending
> > > interrupt and VS mode interrupts are being shifted to represent
> > > S mode interrupts in this function. So when the cause returned by
> > > this function is passed to riscv_cpu_do_interrupt to actually
> > > forward the interrupt, the VS mode forwarding check does not work
> > > as intended and interrupt is actually forwarded to hypervisor. This
> > > patch fixes this issue.
> > >
> > > Signed-off-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> > > ---
> > >  target/riscv/cpu_helper.c | 9 ++++++++-
> > >  1 file changed, 8 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > > index b9e90dfd9a..59535ecba6 100644
> > > --- a/target/riscv/cpu_helper.c
> > > +++ b/target/riscv/cpu_helper.c
> > > @@ -46,7 +46,7 @@ static int riscv_cpu_local_irq_pending(CPURISCVState
> *env)
> > >      target_ulong pending = env->mip & env->mie &
> > >                                 ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
> > >      target_ulong vspending = (env->mip & env->mie &
> > > -                              (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)) >>
> 1;
> > > +                              (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP));
> > >
> > >      target_ulong mie    = env->priv < PRV_M ||
> > >                            (env->priv == PRV_M && mstatus_mie);
> > > @@ -900,6 +900,13 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> > >
> > >              if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) &
> 1) &&
> > >                  !force_hs_execp) {
> > > +                /*
> > > +                 * See if we need to adjust cause. Yes if its VS mode
> interrupt
> > > +                 * no if hypervisor has delegated one of hs mode's
> interrupt
> > > +                 */
> > > +                if (cause == IRQ_VS_TIMER || cause == IRQ_VS_SOFT ||
> > > +                    cause == IRQ_VS_EXT)
> > > +                    cause = cause - 1;
> > >                  /* Trap to VS mode */
> > >              } else if (riscv_cpu_virt_enabled(env)) {
> > >                  /* Trap into HS mode, from virt */
> > > --
> > > 2.17.1
> > >
> > >
> >
>

--000000000000c9bbdd059f76be0d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Here is the link to the patch <br><a href=3D"https://=
lists.nongnu.org/archive/html/qemu-riscv/2020-01/msg00191.html">https://lis=
ts.nongnu.org/archive/html/qemu-riscv/2020-01/msg00191.html</a><br><br></di=
v>-Rajnesh<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Feb 25, 2020 at 12:06 AM Alistair Francis &lt;<a hr=
ef=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun, Feb 23, 2020=
 at 11:23 AM Jose Martins &lt;<a href=3D"mailto:josemartins90@gmail.com" ta=
rget=3D"_blank">josemartins90@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello rajnesh,<br>
&gt;<br>
&gt; I had already submitted almost this exact patch a few weeks ago.<br>
<br>
To QEMU? I don&#39;t see the patch.<br>
<br>
Alistair<br>
<br>
&gt;<br>
&gt; Jose<br>
&gt;<br>
&gt; On Sun, 23 Feb 2020 at 13:51, &lt;<a href=3D"mailto:rajnesh.kanwal49@g=
mail.com" target=3D"_blank">rajnesh.kanwal49@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; From: Rajnesh Kanwal &lt;<a href=3D"mailto:rajnesh.kanwal49@gmail=
.com" target=3D"_blank">rajnesh.kanwal49@gmail.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Currently riscv_cpu_local_irq_pending is used to find out pending=
<br>
&gt; &gt; interrupt and VS mode interrupts are being shifted to represent<b=
r>
&gt; &gt; S mode interrupts in this function. So when the cause returned by=
<br>
&gt; &gt; this function is passed to riscv_cpu_do_interrupt to actually<br>
&gt; &gt; forward the interrupt, the VS mode forwarding check does not work=
<br>
&gt; &gt; as intended and interrupt is actually forwarded to hypervisor. Th=
is<br>
&gt; &gt; patch fixes this issue.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Rajnesh Kanwal &lt;<a href=3D"mailto:rajnesh.kanwa=
l49@gmail.com" target=3D"_blank">rajnesh.kanwal49@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 target/riscv/cpu_helper.c | 9 ++++++++-<br>
&gt; &gt;=C2=A0 1 file changed, 8 insertions(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.=
c<br>
&gt; &gt; index b9e90dfd9a..59535ecba6 100644<br>
&gt; &gt; --- a/target/riscv/cpu_helper.c<br>
&gt; &gt; +++ b/target/riscv/cpu_helper.c<br>
&gt; &gt; @@ -46,7 +46,7 @@ static int riscv_cpu_local_irq_pending(CPURISCV=
State *env)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 target_ulong pending =3D env-&gt;mip &amp; en=
v-&gt;mie &amp;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~(MIP_VSSIP | MIP_VSTIP=
 | MIP_VSEIP);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 target_ulong vspending =3D (env-&gt;mip &amp;=
 env-&gt;mie &amp;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (MIP_VSSIP | MIP_VSTIP | MIP_VSEI=
P)) &gt;&gt; 1;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (MIP_VSSIP | MIP_VSTIP | MIP_VSEI=
P));<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 target_ulong mie=C2=A0 =C2=A0 =3D env-&gt;pri=
v &lt; PRV_M ||<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;priv =3D=3D PRV_M &amp;&amp; mstat=
us_mie);<br>
&gt; &gt; @@ -900,6 +900,13 @@ void riscv_cpu_do_interrupt(CPUState *cs)<br=
>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (riscv_cpu_vir=
t_enabled(env) &amp;&amp; ((hdeleg &gt;&gt; cause) &amp; 1) &amp;&amp;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !fo=
rce_hs_execp) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* =
See if we need to adjust cause. Yes if its VS mode interrupt<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* =
no if hypervisor has delegated one of hs mode&#39;s interrupt<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/=
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (caus=
e =3D=3D IRQ_VS_TIMER || cause =3D=3D IRQ_VS_SOFT ||<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 cause =3D=3D IRQ_VS_EXT)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 cause =3D cause - 1;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* =
Trap to VS mode */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (riscv_=
cpu_virt_enabled(env)) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* =
Trap into HS mode, from virt */<br>
&gt; &gt; --<br>
&gt; &gt; 2.17.1<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
</blockquote></div>

--000000000000c9bbdd059f76be0d--

