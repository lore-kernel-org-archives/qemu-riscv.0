Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hF3WJ-0007Y4-MP
	for mharc-qemu-riscv@gnu.org; Fri, 12 Apr 2019 17:15:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53429)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fintelia@gmail.com>) id 1hF3WE-0007VY-34
	for qemu-riscv@nongnu.org; Fri, 12 Apr 2019 17:15:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fintelia@gmail.com>) id 1hF3W9-0001ng-QJ
	for qemu-riscv@nongnu.org; Fri, 12 Apr 2019 17:15:28 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:36592)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <fintelia@gmail.com>)
	id 1hF3Vu-0001cI-9Z; Fri, 12 Apr 2019 17:15:10 -0400
Received: by mail-lf1-x144.google.com with SMTP id u17so8540884lfi.3;
	Fri, 12 Apr 2019 14:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MfyNgsgC4DlTdcjLD+NXILuSu1rvA1GabN0BxqymjlE=;
	b=Dd6O+qMn29ykF9RgdxoZLjFwEklNBSyHs2w8qkEbjS64i2E8cweCU594HmHDvRbVu0
	gv3WcPifTDmY8z0h/Xt1vdUjdRoA2C2fYlTzphXJKQCy9KKGb3LNBfF7C4WiPrK1S2eL
	qDgNtUo4aEDMohWzqoKDtJ5vjU1yxohRmc6NaCJKPl4+Lh4tqRTBJhIU9aaUHJlPZ1xw
	SswdAujUILRke9EyCqkVOUL0shRO8Bp6zjdsh69xjNgScBRpn+N1NlwvbaG1kWyX007c
	z6W6OblYVgKcbPTenYgyBRofg8V7u+ENXiMc/RMGOd/GHfDEuZGTswFc7YU1n9g+wZBF
	e/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MfyNgsgC4DlTdcjLD+NXILuSu1rvA1GabN0BxqymjlE=;
	b=k3EZVyb84m8QWLYKLEYL3SQUK9GhtfL9DHDsV+2+TSIT+fqA7W0g6X7p0eVv0EKrIR
	sfRKb/3Nu1kwbQ/KPtIRyLQyPrDuVPxmzojzMK7vUBEnIK28N7xspGXf68R7GU4erVuv
	6RfsKzzOCr63I0hDxsI0soiCkBamLkSXRSkkbMjpK5lAsb1ZlSwv8HFZJJXigbj7DD2J
	Gha/i5Umg9xLrmojrFcISpsLAZVxul2RDOmpyflFvNcYUMdOvJhTtZFa3jVdcnPANQ77
	WN6tB0/N3x2d7rJVYv4kWw0gv8o1NQ1nkydkMdqXJhP0BHVCjSO2cEwICAa2eBf26lED
	se6w==
X-Gm-Message-State: APjAAAVI/cebVHR7XWWCXXE/ILU2HSie6VAgZmR66V+HRy2tz6erlJul
	xZk1Gf2sQmHzf11I5BsUpFq63jA7PKdh/8HCK10=
X-Google-Smtp-Source: APXvYqwsVJSb5yC1aQjQmEfi/t19RPQYYJpGuEbK+iLf/U7mkxKebrpkCmjB7QcOc5WscwBpD5BpCnwJhp7upZdwS6I=
X-Received: by 2002:ac2:485a:: with SMTP id 26mr5827018lfy.128.1555103707107; 
	Fri, 12 Apr 2019 14:15:07 -0700 (PDT)
MIME-Version: 1.0
References: <CANnJOVHadZt5Vho5sy6FGVgUW_yvYZg7BGDiGJFtRBCquyOXZA@mail.gmail.com>
	<CAKmqyKNVno+jR_PYxgnyqQOSQFCn_ai7GH+hYPgaO=fkqHDa6A@mail.gmail.com>
In-Reply-To: <CAKmqyKNVno+jR_PYxgnyqQOSQFCn_ai7GH+hYPgaO=fkqHDa6A@mail.gmail.com>
From: Jonathan Behrens <fintelia@gmail.com>
Date: Fri, 12 Apr 2019 17:14:40 -0400
Message-ID: <CANnJOVHprai3DLd=PunsVDGUwaGvvA4ynou5_LhyGVztTf-tNQ@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>, 
	Alistair Francis <Alistair.Francis@wdc.com>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>, 
	Sagar Karandikar <sagark@eecs.berkeley.edu>
Content-Type: multipart/alternative; boundary="0000000000000d16c205865bcc46"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::144
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] target/riscv: Do not allow
 sfence.vma from user mode
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Apr 2019 21:15:31 -0000

--0000000000000d16c205865bcc46
Content-Type: text/plain; charset="UTF-8"

Just to double check, nothing further on this is need from me, right? It is
set to be merged onto the master branch once the 4.0 release is out?

Jonathan

On Wed, Apr 3, 2019 at 7:11 PM Alistair Francis <alistair23@gmail.com>
wrote:

> On Mon, Apr 1, 2019 at 1:39 PM Jonathan Behrens <fintelia@gmail.com>
> wrote:
> >
> > The 'sfence.vma' instruction is privileged, and should only ever be
> allowed
> > when executing in supervisor mode or higher.
> >
> > Jonathan
> >
> > Signed-off-by: Jonathan Behrens <fintelia@gmail.com>
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> Alistair
>
> > ---
> >  target/riscv/op_helper.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> > index b7dc18a41e..644d0fb35f 100644
> > --- a/target/riscv/op_helper.c
> > +++ b/target/riscv/op_helper.c
> > @@ -145,9 +145,10 @@ void helper_tlb_flush(CPURISCVState *env)
> >  {
> >      RISCVCPU *cpu = riscv_env_get_cpu(env);
> >      CPUState *cs = CPU(cpu);
> > -    if (env->priv == PRV_S &&
> > -        env->priv_ver >= PRIV_VERSION_1_10_0 &&
> > -        get_field(env->mstatus, MSTATUS_TVM)) {
> > +    if (!(env->priv >= PRV_S) ||
> > +        (env->priv == PRV_S &&
> > +         env->priv_ver >= PRIV_VERSION_1_10_0 &&
> > +         get_field(env->mstatus, MSTATUS_TVM))) {
> >          riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
> >      } else {
> >          tlb_flush(cs);
> > --
> > 2.20.1
>

--0000000000000d16c205865bcc46
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Just to double check, nothing further on this is need=
 from me, right? It is set to be merged onto the master branch once the 4.0=
 release is out?</div><div><br></div><div>Jonathan<br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 3, =
2019 at 7:11 PM Alistair Francis &lt;<a href=3D"mailto:alistair23@gmail.com=
">alistair23@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On Mon, Apr 1, 2019 at 1:39 PM Jonathan Behrens &lt;<=
a href=3D"mailto:fintelia@gmail.com" target=3D"_blank">fintelia@gmail.com</=
a>&gt; wrote:<br>
&gt;<br>
&gt; The &#39;sfence.vma&#39; instruction is privileged, and should only ev=
er be allowed<br>
&gt; when executing in supervisor mode or higher.<br>
&gt;<br>
&gt; Jonathan<br>
&gt;<br>
&gt; Signed-off-by: Jonathan Behrens &lt;<a href=3D"mailto:fintelia@gmail.c=
om" target=3D"_blank">fintelia@gmail.com</a>&gt;<br>
<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
<br>
Alistair<br>
<br>
&gt; ---<br>
&gt;=C2=A0 target/riscv/op_helper.c | 7 ++++---<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c<br>
&gt; index b7dc18a41e..644d0fb35f 100644<br>
&gt; --- a/target/riscv/op_helper.c<br>
&gt; +++ b/target/riscv/op_helper.c<br>
&gt; @@ -145,9 +145,10 @@ void helper_tlb_flush(CPURISCVState *env)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 RISCVCPU *cpu =3D riscv_env_get_cpu(env);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 CPUState *cs =3D CPU(cpu);<br>
&gt; -=C2=A0 =C2=A0 if (env-&gt;priv =3D=3D PRV_S &amp;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;priv_ver &gt;=3D PRIV_VERSION_1_1=
0_0 &amp;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 get_field(env-&gt;mstatus, MSTATUS_TVM)) =
{<br>
&gt; +=C2=A0 =C2=A0 if (!(env-&gt;priv &gt;=3D PRV_S) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;priv =3D=3D PRV_S &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;priv_ver &gt;=3D PRIV_VERSI=
ON_1_10_0 &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_field(env-&gt;mstatus, MSTATUS_=
TVM))) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_raise_exception(env, RISCV_EXC=
P_ILLEGAL_INST, GETPC());<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tlb_flush(cs);<br>
&gt; --<br>
&gt; 2.20.1<br>
</blockquote></div>

--0000000000000d16c205865bcc46--

