Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hr8Nc-0007RL-85
	for mharc-qemu-riscv@gnu.org; Fri, 26 Jul 2019 18:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60476)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <fintelia@gmail.com>) id 1hr8NY-0007Oy-Pw
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 18:07:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fintelia@gmail.com>) id 1hr8NC-0003mG-HB
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 18:07:41 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:36036)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <fintelia@gmail.com>)
 id 1hr8Mu-0003EF-I6; Fri, 26 Jul 2019 18:07:16 -0400
Received: by mail-lf1-x141.google.com with SMTP id q26so38102385lfc.3;
 Fri, 26 Jul 2019 15:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fCK+X2tcIS92/EKkLAEH9dGaJcfqMKXYLhoNNJJVB0E=;
 b=O0nt8Ejl+oPRGkmrZfNBwxsKHxdZzv+QdxkPU/NX4H7WbN7vdAPmmgJjM8yOre3ByD
 gwQCHluVRVan4jubv+QqI9K96vd70T20iz27uVqNhsLFopYiiP1+/x4s0xOnyZ6Mu79v
 CjFyGmaCZ9vS0BXAy0h+r8dQiEkuDGyddJH0GvBDpzzuj4TzeC2duH+YTkhsOZeofz6j
 1rQpkmG1BCyMpLa4U9+XS84sXVEKS5VrNkL8lu9Sq+zHozOOWlzZkot5A3W52SWOgXQ7
 l0g3pLtcffrABCIiCSkrunb38lQ5W8S9ruI3l4zO2xzQVsV99O812FD/XBgzuQxJ1ub2
 X8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fCK+X2tcIS92/EKkLAEH9dGaJcfqMKXYLhoNNJJVB0E=;
 b=jC2zPCkPxrufgIrLFzMV1WnR4yzs0jGjkx0ruL22I/eEfj0DyUtY3eqLNpBiLtdU/O
 P2jyHEOtTsuY/89G+LlwQxKbtymvpUZbdBt4NVphN3HXjnnSr4v+aZg5GD5RvflOSQsj
 rSETbOZekCxXk9DWw1GFgJ3iqBkr293suHyQSjrrrXsDL/9s2+LM8bZUlJUxf7F7NxCe
 A1TVTtptr6LPanT+lZaIkRxNG+RjTm2KSM4QN2JMYtTNlmURVyJC8AsUDPbVXvV2zp5X
 Vb/b8VlpY1JSzw+j4WGt8WyBgLHVTQ0pAFmSizCBVF/X9MU7/0FxUGZJLhlMJ0gvU81r
 2GJg==
X-Gm-Message-State: APjAAAW19ttx/bOP8sqsACOgyiZH3CYnblDs8MmEq2IcHazcilXGlgep
 qcteDlcg6XfIuoSNhB6oGHd7psTwPhWmV/qgi0Qm8KDg
X-Google-Smtp-Source: APXvYqwISxTqTXIUht4oVDWEipcjsRU9WorxiK6vadDCUb2C91FzAvg3Vc6HWd849PSWt9PH1e6BQykS+IdePdqbdb4=
X-Received: by 2002:a19:7006:: with SMTP id h6mr44830456lfc.5.1564174850508;
 Fri, 26 Jul 2019 14:00:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1564080680.git.alistair.francis@wdc.com>
 <b415f5b51e09418760b95e5c73fad5e68b97f173.1564080680.git.alistair.francis@wdc.com>
 <CANnJOVEyy7wb74eEucj5t=xonOvUFTPWuty9R+-KP0DLc+L7zQ@mail.gmail.com>
 <CAKmqyKOh-7LE5ry_RG56-TM0bqj_kckcK74W8kFLiPHrjjx7hw@mail.gmail.com>
In-Reply-To: <CAKmqyKOh-7LE5ry_RG56-TM0bqj_kckcK74W8kFLiPHrjjx7hw@mail.gmail.com>
From: Jonathan Behrens <fintelia@gmail.com>
Date: Fri, 26 Jul 2019 17:00:07 -0400
Message-ID: <CANnJOVHWmA_KcdOC4o_4Uq9vZmNR_Sdy0L0foqqr_FwJY7ULqQ@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@sifive.com>
Content-Type: multipart/alternative; boundary="00000000000054d069058e9bd69e"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::141
Subject: Re: [Qemu-riscv] [PATCH-4.2 v1 2/6] target/riscv: Remove strict
 perm checking for CSR R/W
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
X-List-Received-Date: Fri, 26 Jul 2019 22:07:58 -0000

--00000000000054d069058e9bd69e
Content-Type: text/plain; charset="UTF-8"

The remaining checks are not sufficient. If you look at the bottom of
csr.c, you'll see that for most of the M-mode CSRs the predicate is set to
"any" which unconditionally allows access regardless of privilege mode. The
S-mode CSR predicates similarly only check that supervisor mode exists, but
not that the processor is current running in that mode. I do agree with you
that using the register address to determine the required privilege mode is
a little strange, but RISC-V is designed so that bits 8 and 9 of the CSR
address encode that information: 0=U-mode, 1=S-mode, 2=HS-mode, 3=M-mode.

I also tested by booting RVirt <https://github.com/mit-pdos/RVirt> with a
Linux guest and found that this patch caused it to instantly crash because
guest CSR accesses weren't intercepted.

Jonathan

On Fri, Jul 26, 2019 at 4:28 PM Alistair Francis <alistair23@gmail.com>
wrote:

> On Thu, Jul 25, 2019 at 2:48 PM Jonathan Behrens <fintelia@gmail.com>
> wrote:
> >
> > Unless I'm missing something, this is the only place that QEMU checks
> the privilege level for read and writes to CSRs. The exact computation used
> here won't work with the hypervisor extension, but we also can't just get
> rid of privilege checking entirely...
>
> The csr_ops struct contains a checker function, so there are still
> some checks occurring. I haven't done negative testing on this patch,
> but the current check doesn't seem to make any sense so it should be
> removed. We can separately discuss adding more checks but this current
> way base don CSR address just seems strange.
>
> Alistair
>
> >
> > Jonathan
> >
> > On Thu, Jul 25, 2019 at 2:56 PM Alistair Francis <
> alistair.francis@wdc.com> wrote:
> >>
> >> The privledge check based on the CSR address mask 0x300 doesn't work
> >> when using Hypervisor extensions so remove the check
> >>
> >> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> >> ---
> >>  target/riscv/csr.c | 3 +--
> >>  1 file changed, 1 insertion(+), 2 deletions(-)
> >>
> >> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> >> index e0d4586760..af3b762c8b 100644
> >> --- a/target/riscv/csr.c
> >> +++ b/target/riscv/csr.c
> >> @@ -797,9 +797,8 @@ int riscv_csrrw(CPURISCVState *env, int csrno,
> target_ulong *ret_value,
> >>
> >>      /* check privileges and return -1 if check fails */
> >>  #if !defined(CONFIG_USER_ONLY)
> >> -    int csr_priv = get_field(csrno, 0x300);
> >>      int read_only = get_field(csrno, 0xC00) == 3;
> >> -    if ((write_mask && read_only) || (env->priv < csr_priv)) {
> >> +    if (write_mask && read_only) {
> >>          return -1;
> >>      }
> >>  #endif
> >> --
> >> 2.22.0
> >>
> >>
>

--00000000000054d069058e9bd69e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The remaining checks are not sufficient. If you look =
at the bottom of csr.c, you&#39;ll see that for most of the M-mode CSRs the=
 predicate is set to &quot;any&quot; which unconditionally allows access re=
gardless of privilege mode. The S-mode CSR predicates similarly only check =
that supervisor mode exists, but not that the processor is current running =
in that mode. I do agree with you that using the register address to determ=
ine the required privilege mode is a little strange, but RISC-V is designed=
 so that bits 8 and 9 of the CSR address encode that information: 0=3DU-mod=
e, 1=3DS-mode, 2=3DHS-mode, 3=3DM-mode.<br></div><div><br></div><div>I also=
 tested by booting <a href=3D"https://github.com/mit-pdos/RVirt">RVirt</a> =
 with a Linux guest and found that this patch caused it to instantly crash =
because guest CSR accesses weren&#39;t intercepted.</div><div><br></div><di=
v>Jonathan<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Fri, Jul 26, 2019 at 4:28 PM Alistair Francis &lt;<a=
 href=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Jul 25, 2=
019 at 2:48 PM Jonathan Behrens &lt;<a href=3D"mailto:fintelia@gmail.com" t=
arget=3D"_blank">fintelia@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Unless I&#39;m missing something, this is the only place that QEMU che=
cks the privilege level for read and writes to CSRs. The exact computation =
used here won&#39;t work with the hypervisor extension, but we also can&#39=
;t just get rid of privilege checking entirely...<br>
<br>
The csr_ops struct contains a checker function, so there are still<br>
some checks occurring. I haven&#39;t done negative testing on this patch,<b=
r>
but the current check doesn&#39;t seem to make any sense so it should be<br=
>
removed. We can separately discuss adding more checks but this current<br>
way base don CSR address just seems strange.<br>
<br>
Alistair<br>
<br>
&gt;<br>
&gt; Jonathan<br>
&gt;<br>
&gt; On Thu, Jul 25, 2019 at 2:56 PM Alistair Francis &lt;<a href=3D"mailto=
:alistair.francis@wdc.com" target=3D"_blank">alistair.francis@wdc.com</a>&g=
t; wrote:<br>
&gt;&gt;<br>
&gt;&gt; The privledge check based on the CSR address mask 0x300 doesn&#39;=
t work<br>
&gt;&gt; when using Hypervisor extensions so remove the check<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.fra=
ncis@wdc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 target/riscv/csr.c | 3 +--<br>
&gt;&gt;=C2=A0 1 file changed, 1 insertion(+), 2 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
&gt;&gt; index e0d4586760..af3b762c8b 100644<br>
&gt;&gt; --- a/target/riscv/csr.c<br>
&gt;&gt; +++ b/target/riscv/csr.c<br>
&gt;&gt; @@ -797,9 +797,8 @@ int riscv_csrrw(CPURISCVState *env, int csrno,=
 target_ulong *ret_value,<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /* check privileges and return -1 if check fai=
ls */<br>
&gt;&gt;=C2=A0 #if !defined(CONFIG_USER_ONLY)<br>
&gt;&gt; -=C2=A0 =C2=A0 int csr_priv =3D get_field(csrno, 0x300);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 int read_only =3D get_field(csrno, 0xC00) =3D=
=3D 3;<br>
&gt;&gt; -=C2=A0 =C2=A0 if ((write_mask &amp;&amp; read_only) || (env-&gt;p=
riv &lt; csr_priv)) {<br>
&gt;&gt; +=C2=A0 =C2=A0 if (write_mask &amp;&amp; read_only) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;=C2=A0 #endif<br>
&gt;&gt; --<br>
&gt;&gt; 2.22.0<br>
&gt;&gt;<br>
&gt;&gt;<br>
</blockquote></div>

--00000000000054d069058e9bd69e--

