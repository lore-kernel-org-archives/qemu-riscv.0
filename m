Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgyI9-0001hx-99
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jun 2019 17:20:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56385)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1hgyI4-0001hf-VR
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 17:20:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1hgyI2-0001Yf-Bx
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 17:20:15 -0400
Received: from rs224.mailgun.us ([209.61.151.224]:14075)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1hgyI1-0001PZ-TC
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 17:20:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=fintelia.io; q=dns/txt;
 s=pic; 
 t=1561756802; h=Content-Type: Cc: To: Subject: Message-ID: Date: From:
 In-Reply-To: References: MIME-Version: Sender;
 bh=sOaaz9ehXVtLaJs7o+cAz5g128v97stLg2oZGhziyxw=;
 b=v16YwgVH6thG8wSjR0tRQEX3rJa2i537xeEmsSrI8jCNtAyvumPi+n/flLGknKRB4LDuYTFb
 //qRFP7qqUYKvOp8tILWox5/nCk4zctQbrE3TkPkBEg2tBrcedNQA70UdHCDxtFHwfNutaNe
 tT06Ji0QAGkZQCG4YmwnLT51MlKTTRQ8aJf31CWWQV2N9t/x0MBvrCUZPhv5oEcrSP+XgFET
 cvQTgJU18Nm82bDTKry6hrf6azKLgMPPUewrQmfl2Ym1JMNCMKlZlcGME1yQ12AX0PQc+q+C
 jKCC7So1/mGmJOSgrN5MZPB6mHNHWqStQfgvGnk6o6r8umDpp4Tbfg==
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJkNjk0ZSIsICJxZW11LXJpc2N2QG5vbmdudS5vcmciLCAiOWI0ZTc2Il0=
Sender: jonathan@fintelia.io
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by mxa.mailgun.org with ESMTP id 5d168481.7f95dc3620b0-smtp-out-n01;
 Fri, 28 Jun 2019 21:20:01 -0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id p17so7345169ljg.1;
 Fri, 28 Jun 2019 14:20:01 -0700 (PDT)
X-Gm-Message-State: APjAAAVxrFFI9+EqYSFuew/TYKOZfoWXizkJHODqwACxiA1ZBUtv8f7l
 CjJY41DKYdRgk3VuEg2hHDaonYbnOjIQ+e/CMzI=
X-Google-Smtp-Source: APXvYqxD80lJ4QuEeoV0thdjhtCjUt2OOK0Fr3cfQDnIK3JCXr6QdQB0wqD+16BdXnO3JVNIkRGpd1AQEfloa2t17cA=
X-Received: by 2002:a2e:9a82:: with SMTP id p2mr7540697lji.64.1561756800146;
 Fri, 28 Jun 2019 14:20:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190628201133.14235-1-jonathan@fintelia.io>
 <CAKmqyKNKD4k-Z=-cbFwqnqRQV3e+EO0V0G-brYGeHW4ir0Z+yA@mail.gmail.com>
In-Reply-To: <CAKmqyKNKD4k-Z=-cbFwqnqRQV3e+EO0V0G-brYGeHW4ir0Z+yA@mail.gmail.com>
From: Jonathan Behrens <jonathan@fintelia.io>
Date: Fri, 28 Jun 2019 17:19:28 -0400
X-Gmail-Original-Message-ID: <CANnJOVHPR328jK0qEVpn5Tri5bUa4DvsTF8hZqJuac1nGicxRw@mail.gmail.com>
Message-ID: <CANnJOVHPR328jK0qEVpn5Tri5bUa4DvsTF8hZqJuac1nGicxRw@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Palmer Dabbelt <palmer@sifive.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: multipart/alternative; boundary="0000000000004c631e058c68d7f1"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.61.151.224
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] target/riscv: Hardwire
 mcounter.TM and upper bits of [m|s]counteren
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
X-List-Received-Date: Fri, 28 Jun 2019 21:20:18 -0000

--0000000000004c631e058c68d7f1
Content-Type: text/plain; charset="UTF-8"

> Can you wrap your commit message at ~70 lines?

Sure.

> Isn't CSR_TIME & 31 just 0? Can this just be changed 1 << 1 or even
better add a macro?

Any of those options work. Unless anyone feels strongly otherwise, I'll add
macros for the bits associated with the three named counters but not the
remaining 29 unnamed "high performance counters".

On Fri, Jun 28, 2019 at 5:03 PM Alistair Francis <alistair23@gmail.com>
wrote:

> On Fri, Jun 28, 2019 at 1:12 PM <jonathan@fintelia.io> wrote:
> >
> > From: Jonathan Behrens <jonathan@fintelia.io>
> >
> > QEMU currently always triggers an illegal instruction exception when code
> > attempts to read the time CSR. This is valid behavor, but only if the TM
> bit in
> > mcounteren is hardwired to zero. This change also corrects mcounteren
> and scounteren CSRs to be 32-bits on both
> > 32-bit and 64-bit targets.
>
> Thanks for the patch.
>
> Can you wrap your commit message at ~70 lines?
>
> >
> > Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
> > ---
> >  target/riscv/cpu.h | 4 ++--
> >  target/riscv/csr.c | 3 ++-
> >  2 files changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 0adb307f32..2d0cbe9c78 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -151,8 +151,8 @@ struct CPURISCVState {
> >      target_ulong mcause;
> >      target_ulong mtval;  /* since: priv-1.10.0 */
> >
> > -    target_ulong scounteren;
> > -    target_ulong mcounteren;
> > +    uint32_t scounteren;
> > +    uint32_t mcounteren;
> >
> >      target_ulong sscratch;
> >      target_ulong mscratch;
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index e0d4586760..89cf9734c3 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -473,7 +473,8 @@ static int write_mcounteren(CPURISCVState *env, int
> csrno, target_ulong val)
> >      if (env->priv_ver < PRIV_VERSION_1_10_0) {
> >          return -1;
> >      }
> > -    env->mcounteren = val;
> > +    /* mcounteren.TM is hardwired to zero, all other bits are writable
> */
> > +    env->mcounteren = val & ~(1 << (CSR_TIME & 31));
>
> Isn't CSR_TIME & 31 just 0? Can this just be changed 1 << 1 or even
> better add a macro?
>
> Otherwise this patch looks good :)
>
> Alistair
>
> >      return 0;
> >  }
> >
> > --
> > 2.22.0
> >
>

--0000000000004c631e058c68d7f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>&gt;=20
Can you wrap your commit message at ~70 lines?</div><div><br></div><div>Sur=
e.</div><div><br></div><div>&gt;=20
Isn&#39;t CSR_TIME &amp; 31 just 0? Can this just be changed 1 &lt;&lt; 1 o=
r even better add a macro?</div><div><br></div><div>Any of those options wo=
rk. Unless anyone feels strongly otherwise, I&#39;ll add macros for the bit=
s associated with the three named counters but not the remaining 29 unnamed=
 &quot;high performance counters&quot;.<br></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 28, 2019 at 5:=
03 PM Alistair Francis &lt;<a href=3D"mailto:alistair23@gmail.com" target=
=3D"_blank">alistair23@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Fri, Jun 28, 2019 at 1:12 PM &lt;<a hre=
f=3D"mailto:jonathan@fintelia.io" target=3D"_blank">jonathan@fintelia.io</a=
>&gt; wrote:<br>
&gt;<br>
&gt; From: Jonathan Behrens &lt;<a href=3D"mailto:jonathan@fintelia.io" tar=
get=3D"_blank">jonathan@fintelia.io</a>&gt;<br>
&gt;<br>
&gt; QEMU currently always triggers an illegal instruction exception when c=
ode<br>
&gt; attempts to read the time CSR. This is valid behavor, but only if the =
TM bit in<br>
&gt; mcounteren is hardwired to zero. This change also corrects mcounteren =
and scounteren CSRs to be 32-bits on both<br>
&gt; 32-bit and 64-bit targets.<br>
<br>
Thanks for the patch.<br>
<br>
Can you wrap your commit message at ~70 lines?<br>
<br>
&gt;<br>
&gt; Signed-off-by: Jonathan Behrens &lt;<a href=3D"mailto:jonathan@finteli=
a.io" target=3D"_blank">jonathan@fintelia.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 target/riscv/cpu.h | 4 ++--<br>
&gt;=C2=A0 target/riscv/csr.c | 3 ++-<br>
&gt;=C2=A0 2 files changed, 4 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
&gt; index 0adb307f32..2d0cbe9c78 100644<br>
&gt; --- a/target/riscv/cpu.h<br>
&gt; +++ b/target/riscv/cpu.h<br>
&gt; @@ -151,8 +151,8 @@ struct CPURISCVState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 target_ulong mcause;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 target_ulong mtval;=C2=A0 /* since: priv-1.10.0 */=
<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 target_ulong scounteren;<br>
&gt; -=C2=A0 =C2=A0 target_ulong mcounteren;<br>
&gt; +=C2=A0 =C2=A0 uint32_t scounteren;<br>
&gt; +=C2=A0 =C2=A0 uint32_t mcounteren;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 target_ulong sscratch;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 target_ulong mscratch;<br>
&gt; diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
&gt; index e0d4586760..89cf9734c3 100644<br>
&gt; --- a/target/riscv/csr.c<br>
&gt; +++ b/target/riscv/csr.c<br>
&gt; @@ -473,7 +473,8 @@ static int write_mcounteren(CPURISCVState *env, in=
t csrno, target_ulong val)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (env-&gt;priv_ver &lt; PRIV_VERSION_1_10_0) {<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 env-&gt;mcounteren =3D val;<br>
&gt; +=C2=A0 =C2=A0 /* mcounteren.TM is hardwired to zero, all other bits a=
re writable */<br>
&gt; +=C2=A0 =C2=A0 env-&gt;mcounteren =3D val &amp; ~(1 &lt;&lt; (CSR_TIME=
 &amp; 31));<br>
<br>
Isn&#39;t CSR_TIME &amp; 31 just 0? Can this just be changed 1 &lt;&lt; 1 o=
r even<br>
better add a macro?<br>
<br>
Otherwise this patch looks good :)<br>
<br>
Alistair<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; --<br>
&gt; 2.22.0<br>
&gt;<br>
</blockquote></div>

--0000000000004c631e058c68d7f1--

