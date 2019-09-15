Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i9YVQ-0002if-7t
	for mharc-qemu-riscv@gnu.org; Sun, 15 Sep 2019 13:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58575)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fintelia@gmail.com>) id 1i9YVM-0002iV-Tn
 for qemu-riscv@nongnu.org; Sun, 15 Sep 2019 13:40:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fintelia@gmail.com>) id 1i9YVL-0003t1-8m
 for qemu-riscv@nongnu.org; Sun, 15 Sep 2019 13:40:08 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:43655)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <fintelia@gmail.com>)
 id 1i9YVK-0003sC-UL; Sun, 15 Sep 2019 13:40:07 -0400
Received: by mail-lj1-x244.google.com with SMTP id d5so31597673lja.10;
 Sun, 15 Sep 2019 10:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ykrlz5Ss0wo0TxQhnZN46fo579cWIF2oGYskM8E/4ks=;
 b=AxGHQykHERo1IxeYiBazYZ/Mf1KOTRO0X9OcaVKS6m0EsTFmjBTb/cohpFZwWGfCeO
 zfZQWK1MMzLnLJs8pqnCx4LZum1s/T9dMOUCYEvRXPyLxPIjGaqjnnkW4fPkJOTmqigt
 BIlBvI5kU7lc03DGC0BwT3S44DJ1kVteRwKhv16TUTdqPKUu0Mpy2sI1eBHWE+r5JoC8
 a57yyr3W/8FwUUDimeTUZCbPtogj3u519WbOZ53Xaeep0V73e/ewE7X8MtMn2WBBKBen
 WtuVlLuLxIgq58e+/c6ZvTtAdsmYMMxFHTY9xyR9+Q2xftDjkKP6u+qMfUJUNN0hu3ul
 aHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ykrlz5Ss0wo0TxQhnZN46fo579cWIF2oGYskM8E/4ks=;
 b=R9XmWifiVHwM+QYAplZG+JKswGUyKwes91KTIq3920KdO2XHLZbJE2Ikg2w1hmkjSs
 oIRM467b7tI1KaZ2Uf4DQIZ8xUrN+1r2csfc0lXddUJgfGM/AFhoV1Ltv85ECdb5cI2k
 dKFv00LoReNdE5SSPJvnT+qOl/63j5B1wGgE6OY3WuJaPUxqO7rn/KuT/AHdOUj2Zedw
 TX39YvHaFlMS+W70hPMy5Y86XEtD2WvcsXOkbRCulGmJPe2Qn6KXoyRMC/5Ls5Kttvso
 8P4x3C68yYB2S6N86JCYHOlAwvbn79jwJ/SwVHCjFJZI6SZPQifEoq3ALF8CY8jhnMZ1
 vUdQ==
X-Gm-Message-State: APjAAAV0P8t8hEZYQUxK2ogKg8M4iStEt6SOo9jMM6zc+6akjbFl5Uwy
 1gn5Qq0FfCPYePXllypiRtYujN0VU7WPjjPxSlo=
X-Google-Smtp-Source: APXvYqy+38xGgiDuReot++Wdn5KPdY7XVOkfl7sE8e/JPfudsOmJFxp16ITAAJdxF6nb1i59J6V6zv72TR+8ir0bX3I=
X-Received: by 2002:a2e:3a0e:: with SMTP id h14mr14508610lja.161.1568569204781; 
 Sun, 15 Sep 2019 10:40:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAEUhbmV=v62a0CAHe2mt1Qzz0n+fESgVYDtjdoXfyhH6_j5zFw@mail.gmail.com>
 <mhng-da766f03-2535-4a8c-97aa-1f85f986bee3@palmer-si-x1e>
In-Reply-To: <mhng-da766f03-2535-4a8c-97aa-1f85f986bee3@palmer-si-x1e>
From: Jonathan Behrens <fintelia@gmail.com>
Date: Sun, 15 Sep 2019 13:39:38 -0400
Message-ID: <CANnJOVGRWepwwZPyOmF1O7azqKVYgB2ZSqLrh5qnye10Oi_M7Q@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000041b55205929afa60"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-riscv] [PATCH v8 18/32] riscv: sifive_u: Set the minimum
 number of cpus to 2
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
X-List-Received-Date: Sun, 15 Sep 2019 17:40:10 -0000

--00000000000041b55205929afa60
Content-Type: text/plain; charset="UTF-8"

Has there been testing with "-smp 2"? A while back I thought I read that
the included uboot firmware was using a hard-coded device tree that
indicated 4+1 CPUs, which I would have expected to cause Linux boot issues?

Jonathan

On Sun, Sep 15, 2019 at 1:31 PM Palmer Dabbelt <palmer@sifive.com> wrote:

> On Sun, 15 Sep 2019 06:07:18 PDT (-0700), bmeng.cn@gmail.com wrote:
> > Hi Palmer,
> >
> > On Sun, Sep 15, 2019 at 3:00 AM Palmer Dabbelt <palmer@sifive.com>
> wrote:
> >>
> >> On Fri, 13 Sep 2019 08:25:21 PDT (-0700), bmeng.cn@gmail.com wrote:
> >> > Hi Palmer,
> >> >
> >> > On Fri, Sep 13, 2019 at 10:33 PM Palmer Dabbelt <palmer@sifive.com>
> wrote:
> >> >>
> >> >> On Fri, 06 Sep 2019 09:20:05 PDT (-0700), bmeng.cn@gmail.com wrote:
> >> >> > It is not useful if we only have one management CPU.
> >> >> >
> >> >> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> >> >> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> >> >> >
> >> >> > ---
> >> >> >
> >> >> > Changes in v8: None
> >> >> > Changes in v7: None
> >> >> > Changes in v6: None
> >> >> > Changes in v5: None
> >> >> > Changes in v4: None
> >> >> > Changes in v3:
> >> >> > - use management cpu count + 1 for the min_cpus
> >> >> >
> >> >> > Changes in v2:
> >> >> > - update the file header to indicate at least 2 harts are created
> >> >> >
> >> >> >  hw/riscv/sifive_u.c         | 4 +++-
> >> >> >  include/hw/riscv/sifive_u.h | 2 ++
> >> >> >  2 files changed, 5 insertions(+), 1 deletion(-)
> >> >> >
> >> >> > diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> >> >> > index 2947e06..2023b71 100644
> >> >> > --- a/hw/riscv/sifive_u.c
> >> >> > +++ b/hw/riscv/sifive_u.c
> >> >> > @@ -10,7 +10,8 @@
> >> >> >   * 1) CLINT (Core Level Interruptor)
> >> >> >   * 2) PLIC (Platform Level Interrupt Controller)
> >> >> >   *
> >> >> > - * This board currently uses a hardcoded devicetree that
> indicates one hart.
> >> >> > + * This board currently generates devicetree dynamically that
> indicates at least
> >> >> > + * two harts.
> >> >> >   *
> >> >> >   * This program is free software; you can redistribute it and/or
> modify it
> >> >> >   * under the terms and conditions of the GNU General Public
> License,
> >> >> > @@ -433,6 +434,7 @@ static void
> riscv_sifive_u_machine_init(MachineClass *mc)
> >> >> >       * management CPU.
> >> >> >       */
> >> >> >      mc->max_cpus = 4;
> >> >> > +    mc->min_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + 1;
> >> >> >  }
> >> >> >
> >> >> >  DEFINE_MACHINE("sifive_u", riscv_sifive_u_machine_init)
> >> >> > diff --git a/include/hw/riscv/sifive_u.h
> b/include/hw/riscv/sifive_u.h
> >> >> > index f25bad8..6d22741 100644
> >> >> > --- a/include/hw/riscv/sifive_u.h
> >> >> > +++ b/include/hw/riscv/sifive_u.h
> >> >> > @@ -69,6 +69,8 @@ enum {
> >> >> >      SIFIVE_U_GEM_CLOCK_FREQ = 125000000
> >> >> >  };
> >> >> >
> >> >> > +#define SIFIVE_U_MANAGEMENT_CPU_COUNT   1
> >> >> > +
> >> >> >  #define SIFIVE_U_PLIC_HART_CONFIG "MS"
> >> >> >  #define SIFIVE_U_PLIC_NUM_SOURCES 54
> >> >> >  #define SIFIVE_U_PLIC_NUM_PRIORITIES 7
> >> >>
> >> >> This fails "make check", so I'm going to squash in this
> >> >>
> >> >> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> >> >> index ca9f7fea41..adecbf1dd9 100644
> >> >> --- a/hw/riscv/sifive_u.c
> >> >> +++ b/hw/riscv/sifive_u.c
> >> >> @@ -528,6 +528,7 @@ static void
> riscv_sifive_u_machine_init(MachineClass *mc)
> >> >>      mc->init = riscv_sifive_u_init;
> >> >>      mc->max_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT +
> SIFIVE_U_COMPUTE_CPU_COUNT;
> >> >>      mc->min_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + 1;
> >> >> +    mc->default_cpus = mc->max_cpus;
> >> >
> >> > Thank you for fixing the 'make check'. Shouldn't it be:
> >> >
> >> > mc->default_cpus = mc->min_cpus;
> >>
> >> We have 5 harts on the board that this matches, so I figured that'd be
> the
> >> better default.
> >>
> >
> > Per my understanding mc->default_cpus is used when invoking QEMU
> > without passing '-smp n' (that's what 'make check' uses), and with the
> > updated sifive_u machine, '-smp 2' is the actual useful configuration
> > to boot Linux. For consistency with user experience on other machines,
> > without '-smp' means we want a uni-processor machine hence I would
> > suggest we set "mc->default_cpus = mc->min_cpus".
>
> OK, I've spun a v3.  I never sent out v2 but I had tagged it, unless
> there's
> any opposition I'll send this out when I'm back on normal internet.
>
>

--00000000000041b55205929afa60
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Has there been testing with &quot;-smp 2&quot;? A whi=
le back I thought I read that the included uboot firmware was using a hard-=
coded device tree that indicated 4+1 CPUs, which I would have expected to c=
ause Linux boot issues?</div><div><br></div><div>Jonathan<br></div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, =
Sep 15, 2019 at 1:31 PM Palmer Dabbelt &lt;<a href=3D"mailto:palmer@sifive.=
com">palmer@sifive.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On Sun, 15 Sep 2019 06:07:18 PDT (-0700), <a href=3D"=
mailto:bmeng.cn@gmail.com" target=3D"_blank">bmeng.cn@gmail.com</a> wrote:<=
br>
&gt; Hi Palmer,<br>
&gt;<br>
&gt; On Sun, Sep 15, 2019 at 3:00 AM Palmer Dabbelt &lt;<a href=3D"mailto:p=
almer@sifive.com" target=3D"_blank">palmer@sifive.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Fri, 13 Sep 2019 08:25:21 PDT (-0700), <a href=3D"mailto:bmeng.=
cn@gmail.com" target=3D"_blank">bmeng.cn@gmail.com</a> wrote:<br>
&gt;&gt; &gt; Hi Palmer,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Fri, Sep 13, 2019 at 10:33 PM Palmer Dabbelt &lt;<a href=
=3D"mailto:palmer@sifive.com" target=3D"_blank">palmer@sifive.com</a>&gt; w=
rote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Fri, 06 Sep 2019 09:20:05 PDT (-0700), <a href=3D"mail=
to:bmeng.cn@gmail.com" target=3D"_blank">bmeng.cn@gmail.com</a> wrote:<br>
&gt;&gt; &gt;&gt; &gt; It is not useful if we only have one management CPU.=
<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bmeng.=
cn@gmail.com" target=3D"_blank">bmeng.cn@gmail.com</a>&gt;<br>
&gt;&gt; &gt;&gt; &gt; Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:=
alistair.francis@wdc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt=
;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; ---<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Changes in v8: None<br>
&gt;&gt; &gt;&gt; &gt; Changes in v7: None<br>
&gt;&gt; &gt;&gt; &gt; Changes in v6: None<br>
&gt;&gt; &gt;&gt; &gt; Changes in v5: None<br>
&gt;&gt; &gt;&gt; &gt; Changes in v4: None<br>
&gt;&gt; &gt;&gt; &gt; Changes in v3:<br>
&gt;&gt; &gt;&gt; &gt; - use management cpu count + 1 for the min_cpus<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Changes in v2:<br>
&gt;&gt; &gt;&gt; &gt; - update the file header to indicate at least 2 hart=
s are created<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 hw/riscv/sifive_u.c=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 4 +++-<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 include/hw/riscv/sifive_u.h | 2 ++<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 2 files changed, 5 insertions(+), 1 deletion(-=
)<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u=
.c<br>
&gt;&gt; &gt;&gt; &gt; index 2947e06..2023b71 100644<br>
&gt;&gt; &gt;&gt; &gt; --- a/hw/riscv/sifive_u.c<br>
&gt;&gt; &gt;&gt; &gt; +++ b/hw/riscv/sifive_u.c<br>
&gt;&gt; &gt;&gt; &gt; @@ -10,7 +10,8 @@<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0* 1) CLINT (Core Level Interruptor)<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0* 2) PLIC (Platform Level Interrupt Cont=
roller)<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0*<br>
&gt;&gt; &gt;&gt; &gt; - * This board currently uses a hardcoded devicetree=
 that indicates one hart.<br>
&gt;&gt; &gt;&gt; &gt; + * This board currently generates devicetree dynami=
cally that indicates at least<br>
&gt;&gt; &gt;&gt; &gt; + * two harts.<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0*<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0* This program is free software; you can=
 redistribute it and/or modify it<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0* under the terms and conditions of the =
GNU General Public License,<br>
&gt;&gt; &gt;&gt; &gt; @@ -433,6 +434,7 @@ static void riscv_sifive_u_machi=
ne_init(MachineClass *mc)<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* management CPU.<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 mc-&gt;max_cpus =3D 4;<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 mc-&gt;min_cpus =3D SIFIVE_U_MANAGEME=
NT_CPU_COUNT + 1;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 DEFINE_MACHINE(&quot;sifive_u&quot;, riscv_sif=
ive_u_machine_init)<br>
&gt;&gt; &gt;&gt; &gt; diff --git a/include/hw/riscv/sifive_u.h b/include/h=
w/riscv/sifive_u.h<br>
&gt;&gt; &gt;&gt; &gt; index f25bad8..6d22741 100644<br>
&gt;&gt; &gt;&gt; &gt; --- a/include/hw/riscv/sifive_u.h<br>
&gt;&gt; &gt;&gt; &gt; +++ b/include/hw/riscv/sifive_u.h<br>
&gt;&gt; &gt;&gt; &gt; @@ -69,6 +69,8 @@ enum {<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 SIFIVE_U_GEM_CLOCK_FREQ =3D 1250=
00000<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 };<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; +#define SIFIVE_U_MANAGEMENT_CPU_COUNT=C2=A0 =C2=A01=
<br>
&gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 #define SIFIVE_U_PLIC_HART_CONFIG &quot;MS&quo=
t;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 #define SIFIVE_U_PLIC_NUM_SOURCES 54<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 #define SIFIVE_U_PLIC_NUM_PRIORITIES 7<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; This fails &quot;make check&quot;, so I&#39;m going to sq=
uash in this<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c<br=
>
&gt;&gt; &gt;&gt; index ca9f7fea41..adecbf1dd9 100644<br>
&gt;&gt; &gt;&gt; --- a/hw/riscv/sifive_u.c<br>
&gt;&gt; &gt;&gt; +++ b/hw/riscv/sifive_u.c<br>
&gt;&gt; &gt;&gt; @@ -528,6 +528,7 @@ static void riscv_sifive_u_machine_in=
it(MachineClass *mc)<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 mc-&gt;init =3D riscv_sifive_u_init;<=
br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 mc-&gt;max_cpus =3D SIFIVE_U_MANAGEME=
NT_CPU_COUNT + SIFIVE_U_COMPUTE_CPU_COUNT;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 mc-&gt;min_cpus =3D SIFIVE_U_MANAGEME=
NT_CPU_COUNT + 1;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 mc-&gt;default_cpus =3D mc-&gt;max_cpus;<b=
r>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Thank you for fixing the &#39;make check&#39;. Shouldn&#39;t =
it be:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; mc-&gt;default_cpus =3D mc-&gt;min_cpus;<br>
&gt;&gt;<br>
&gt;&gt; We have 5 harts on the board that this matches, so I figured that&=
#39;d be the<br>
&gt;&gt; better default.<br>
&gt;&gt;<br>
&gt;<br>
&gt; Per my understanding mc-&gt;default_cpus is used when invoking QEMU<br=
>
&gt; without passing &#39;-smp n&#39; (that&#39;s what &#39;make check&#39;=
 uses), and with the<br>
&gt; updated sifive_u machine, &#39;-smp 2&#39; is the actual useful config=
uration<br>
&gt; to boot Linux. For consistency with user experience on other machines,=
<br>
&gt; without &#39;-smp&#39; means we want a uni-processor machine hence I w=
ould<br>
&gt; suggest we set &quot;mc-&gt;default_cpus =3D mc-&gt;min_cpus&quot;.<br=
>
<br>
OK, I&#39;ve spun a v3.=C2=A0 I never sent out v2 but I had tagged it, unle=
ss there&#39;s <br>
any opposition I&#39;ll send this out when I&#39;m back on normal internet.=
<br>
<br>
</blockquote></div>

--00000000000041b55205929afa60--

