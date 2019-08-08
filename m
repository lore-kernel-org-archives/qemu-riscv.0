Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvixr-0005Xs-HZ
	for mharc-qemu-riscv@gnu.org; Thu, 08 Aug 2019 10:00:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58796)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chihmin.chao@sifive.com>) id 1hvixo-0005RK-EL
 for qemu-riscv@nongnu.org; Thu, 08 Aug 2019 10:00:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1hvixm-0001dz-Eq
 for qemu-riscv@nongnu.org; Thu, 08 Aug 2019 10:00:20 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:41769)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1hvixk-0001d3-Nt
 for qemu-riscv@nongnu.org; Thu, 08 Aug 2019 10:00:17 -0400
Received: by mail-ot1-x342.google.com with SMTP id o101so118934648ota.8
 for <qemu-riscv@nongnu.org>; Thu, 08 Aug 2019 07:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5Hw9bxFD9i04O5ml4rRUZAdxoo9EgWI9Gk4h6e91qJg=;
 b=Su/a/pJl2Ks582G6RhTVv5ullfWsYcVpnYhBc2V9WSBpTU0RBEn7uIicIQLU+sGY9h
 dAw4qC2026A2U6Ow4o4RRm+YmM7D2x1qgy8pKzwWghDPKIi1l5iMe+EZogGZbsC5sp8o
 SKgLbXNVHy5+TqdjdSCerWa8qmkgXaGvJgRZbLr4s9WXwNLhEvjgyWppPEBf86Ouadq+
 y9+Avox+8HK68J3SGU2arFkL8eZIf1ahVoDh6EMixe/mbSnl8dGtMvlWYwzn74h9rAxw
 +O5QK4RGFkIJl0/heVhQQ39BenxPfYHsAFa+IGKYkY11Kgvh+tELObZGTxPukA0RXUWS
 aTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5Hw9bxFD9i04O5ml4rRUZAdxoo9EgWI9Gk4h6e91qJg=;
 b=EbDcMMXNXGXiHsLecYnQOCJA8UjmPFRPmMLFQbAGnmuxaNfs7S5TBi0ppFw4MACYM8
 C/XDCl90XfEIv6T/DT49UpjJ9Uhptm8XEHlv3CSXVvvLSERJJrP3Jev2sXVg7+U+OBKL
 ZugXFqC2RvyIweOmis3ujlqnBp9oRZ9XgzihOPF/+xJszcHilZKuHahcuyjV6HheIsVG
 mv7z1sZ/NaxTeYmuTBkg/RzeF237RAQe8hC5yBU8iZtjs9n4fCvt9HhxhZcfFgZXVruq
 nfc9b4uOl6RfQX2t6p5R2VjUq8DVS2uXKEbKbi7n/HjJJN4z6li937LYNcO2H5jR/q43
 oPhw==
X-Gm-Message-State: APjAAAWAzinX9jOhFKtWTbUE8MkBgFh6ZJdZca1RumodkaHMXS/WcUKS
 e1/YMWQkO2guR8zNI4sfz1/1Fq8B7SaPE/ijXXkUjA==
X-Google-Smtp-Source: APXvYqyL3zCC/3M1DScoVoVO9kI3pBLHLLFvvSWcnCDDN2eTucNEdfKwxry+sEjRl8YPqJCxpxKh95DOl6ZuHoIJXrs=
X-Received: by 2002:a5e:a70b:: with SMTP id b11mr11256434iod.286.1565272815632; 
 Thu, 08 Aug 2019 07:00:15 -0700 (PDT)
MIME-Version: 1.0
References: <1565163924-18621-1-git-send-email-bmeng.cn@gmail.com>
 <1565163924-18621-12-git-send-email-bmeng.cn@gmail.com>
 <CAEiOBXU9UXEGYjEDP-LJ5mEY-bF+OtMKt4O+LGJh9qQt3OPaew@mail.gmail.com>
 <CAEUhbmUO2aFrGXbZDB4uXAKe9kq5NJuwS9mMM6-Pwvn_8h++aA@mail.gmail.com>
In-Reply-To: <CAEUhbmUO2aFrGXbZDB4uXAKe9kq5NJuwS9mMM6-Pwvn_8h++aA@mail.gmail.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Thu, 8 Aug 2019 22:00:04 +0800
Message-ID: <CAEiOBXXAvxSbDN-vLiwK2dtK_s8wm08MLb5yD7dVWvQpz-5=Yw@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000002734d5058f9b7a19"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2 11/28] riscv: sifive:
 Rename sifive_prci.{c, h} to sifive_e_prci.{c, h}
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
X-List-Received-Date: Thu, 08 Aug 2019 14:00:22 -0000

--0000000000002734d5058f9b7a19
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 7, 2019 at 6:11 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> On Wed, Aug 7, 2019 at 4:54 PM Chih-Min Chao <chihmin.chao@sifive.com>
> wrote:
> >
> >
> >
> > On Wed, Aug 7, 2019 at 3:49 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>
> >> Current SiFive PRCI model only works with sifive_e machine, as it
> >> only emulates registers or PRCI block in the FE310 SoC.
> >>
> >> Rename the file name to make it clear that it is for sifive_e.
> >>
> >> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> >> ---
> >>
> >> Changes in v2: None
> >>
> >>  hw/riscv/Makefile.objs                              |  2 +-
> >>  hw/riscv/sifive_e.c                                 |  4 ++--
> >>  hw/riscv/{sifive_prci.c => sifive_e_prci.c}         | 14 +++++++-------
> >>  include/hw/riscv/{sifive_prci.h => sifive_e_prci.h} | 14 +++++++-------
> >>  4 files changed, 17 insertions(+), 17 deletions(-)
> >>  rename hw/riscv/{sifive_prci.c => sifive_e_prci.c} (90%)
> >>  rename include/hw/riscv/{sifive_prci.h => sifive_e_prci.h} (82%)
> >>
> >> diff --git a/hw/riscv/Makefile.objs b/hw/riscv/Makefile.objs
> >> index eb9d4f9..c859697 100644
> >> --- a/hw/riscv/Makefile.objs
> >> +++ b/hw/riscv/Makefile.objs
> >> @@ -2,9 +2,9 @@ obj-y += boot.o
> >>  obj-$(CONFIG_SPIKE) += riscv_htif.o
> >>  obj-$(CONFIG_HART) += riscv_hart.o
> >>  obj-$(CONFIG_SIFIVE_E) += sifive_e.o
> >> +obj-$(CONFIG_SIFIVE_E) += sifive_e_prci.o
> >>  obj-$(CONFIG_SIFIVE) += sifive_clint.o
> >>  obj-$(CONFIG_SIFIVE) += sifive_gpio.o
> >> -obj-$(CONFIG_SIFIVE) += sifive_prci.o
> >>  obj-$(CONFIG_SIFIVE) += sifive_plic.o
> >>  obj-$(CONFIG_SIFIVE) += sifive_test.o
> >>  obj-$(CONFIG_SIFIVE_U) += sifive_u.o
> >> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> >> index 2a499d8..2d67670 100644
> >> --- a/hw/riscv/sifive_e.c
> >> +++ b/hw/riscv/sifive_e.c
> >> @@ -41,9 +41,9 @@
> >>  #include "hw/riscv/riscv_hart.h"
> >>  #include "hw/riscv/sifive_plic.h"
> >>  #include "hw/riscv/sifive_clint.h"
> >> -#include "hw/riscv/sifive_prci.h"
> >>  #include "hw/riscv/sifive_uart.h"
> >>  #include "hw/riscv/sifive_e.h"
> >> +#include "hw/riscv/sifive_e_prci.h"
> >>  #include "hw/riscv/boot.h"
> >>  #include "chardev/char.h"
> >>  #include "sysemu/arch_init.h"
> >> @@ -174,7 +174,7 @@ static void riscv_sifive_e_soc_realize(DeviceState
> *dev, Error **errp)
> >>          SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE);
> >>      sifive_mmio_emulate(sys_mem, "riscv.sifive.e.aon",
> >>          memmap[SIFIVE_E_AON].base, memmap[SIFIVE_E_AON].size);
> >> -    sifive_prci_create(memmap[SIFIVE_E_PRCI].base);
> >> +    sifive_e_prci_create(memmap[SIFIVE_E_PRCI].base);
> >>
> >>      /* GPIO */
> >>
> >
> > I  think adding infix to function name is sufficient and keeping the
> filename the same may be better.
> > The U board PRCI or variant implementation in future could be included
> in the same files with different create function
> >
>
> I considered such approach when working on this one, but later I chose
> to implement a new file for SiFive U machine.
>
> The SiFive U and E PRCI blocks have different register blocks so if we
> put two variants into one file, their functions don't have much in
> common and we end up just merely physically put them into one file
> which does not bring too much benefit IMHO.
>
> Regards,
> Bin
>

agree that the difference between u and e prci are  a lot and it make sense
to separate it

Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>

--0000000000002734d5058f9b7a19
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 7, 2019 at 6:11 PM Bin Me=
ng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Aug =
7, 2019 at 4:54 PM Chih-Min Chao &lt;<a href=3D"mailto:chihmin.chao@sifive.=
com" target=3D"_blank">chihmin.chao@sifive.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Wed, Aug 7, 2019 at 3:49 PM Bin Meng &lt;<a href=3D"mailto:bmeng.cn=
@gmail.com" target=3D"_blank">bmeng.cn@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Current SiFive PRCI model only works with sifive_e machine, as it<=
br>
&gt;&gt; only emulates registers or PRCI block in the FE310 SoC.<br>
&gt;&gt;<br>
&gt;&gt; Rename the file name to make it clear that it is for sifive_e.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com" =
target=3D"_blank">bmeng.cn@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;<br>
&gt;&gt; Changes in v2: None<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 hw/riscv/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
2 +-<br>
&gt;&gt;=C2=A0 hw/riscv/sifive_e.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 4 ++--<br>
&gt;&gt;=C2=A0 hw/riscv/{sifive_prci.c =3D&gt; sifive_e_prci.c}=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 14 +++++++-------<br>
&gt;&gt;=C2=A0 include/hw/riscv/{sifive_prci.h =3D&gt; sifive_e_prci.h} | 1=
4 +++++++-------<br>
&gt;&gt;=C2=A0 4 files changed, 17 insertions(+), 17 deletions(-)<br>
&gt;&gt;=C2=A0 rename hw/riscv/{sifive_prci.c =3D&gt; sifive_e_prci.c} (90%=
)<br>
&gt;&gt;=C2=A0 rename include/hw/riscv/{sifive_prci.h =3D&gt; sifive_e_prci=
.h} (82%)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/hw/riscv/Makefile.objs b/hw/riscv/Makefile.objs<br>
&gt;&gt; index eb9d4f9..c859697 100644<br>
&gt;&gt; --- a/hw/riscv/Makefile.objs<br>
&gt;&gt; +++ b/hw/riscv/Makefile.objs<br>
&gt;&gt; @@ -2,9 +2,9 @@ obj-y +=3D boot.o<br>
&gt;&gt;=C2=A0 obj-$(CONFIG_SPIKE) +=3D riscv_htif.o<br>
&gt;&gt;=C2=A0 obj-$(CONFIG_HART) +=3D riscv_hart.o<br>
&gt;&gt;=C2=A0 obj-$(CONFIG_SIFIVE_E) +=3D sifive_e.o<br>
&gt;&gt; +obj-$(CONFIG_SIFIVE_E) +=3D sifive_e_prci.o<br>
&gt;&gt;=C2=A0 obj-$(CONFIG_SIFIVE) +=3D sifive_clint.o<br>
&gt;&gt;=C2=A0 obj-$(CONFIG_SIFIVE) +=3D sifive_gpio.o<br>
&gt;&gt; -obj-$(CONFIG_SIFIVE) +=3D sifive_prci.o<br>
&gt;&gt;=C2=A0 obj-$(CONFIG_SIFIVE) +=3D sifive_plic.o<br>
&gt;&gt;=C2=A0 obj-$(CONFIG_SIFIVE) +=3D sifive_test.o<br>
&gt;&gt;=C2=A0 obj-$(CONFIG_SIFIVE_U) +=3D sifive_u.o<br>
&gt;&gt; diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c<br>
&gt;&gt; index 2a499d8..2d67670 100644<br>
&gt;&gt; --- a/hw/riscv/sifive_e.c<br>
&gt;&gt; +++ b/hw/riscv/sifive_e.c<br>
&gt;&gt; @@ -41,9 +41,9 @@<br>
&gt;&gt;=C2=A0 #include &quot;hw/riscv/riscv_hart.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;hw/riscv/sifive_plic.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;hw/riscv/sifive_clint.h&quot;<br>
&gt;&gt; -#include &quot;hw/riscv/sifive_prci.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;hw/riscv/sifive_uart.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;hw/riscv/sifive_e.h&quot;<br>
&gt;&gt; +#include &quot;hw/riscv/sifive_e_prci.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;hw/riscv/boot.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;chardev/char.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;sysemu/arch_init.h&quot;<br>
&gt;&gt; @@ -174,7 +174,7 @@ static void riscv_sifive_e_soc_realize(DeviceS=
tate *dev, Error **errp)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SIFIVE_SIP_BASE, SIFIVE_TIMECMP_=
BASE, SIFIVE_TIME_BASE);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 sifive_mmio_emulate(sys_mem, &quot;riscv.sifiv=
e.e.aon&quot;,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memmap[SIFIVE_E_AON].base, memma=
p[SIFIVE_E_AON].size);<br>
&gt;&gt; -=C2=A0 =C2=A0 sifive_prci_create(memmap[SIFIVE_E_PRCI].base);<br>
&gt;&gt; +=C2=A0 =C2=A0 sifive_e_prci_create(memmap[SIFIVE_E_PRCI].base);<b=
r>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /* GPIO */<br>
&gt;&gt;<br>
&gt;<br>
&gt; I=C2=A0 think adding infix to function name is sufficient and keeping =
the filename the same may be better.<br>
&gt; The U board PRCI or variant implementation in future could be included=
 in the same files with different create function<br>
&gt;<br>
<br>
I considered such approach when working on this one, but later I chose<br>
to implement a new file for SiFive U machine.<br>
<br>
The SiFive U and E PRCI blocks have different register blocks so if we<br>
put two variants into one file, their functions don&#39;t have much in<br>
common and we end up just merely physically put them into one file<br>
which does not bring too much benefit IMHO.<br>
<br>
Regards,<br>
Bin<br></blockquote><div><br></div><div>agree that the difference between u=
 and e prci are=C2=A0 a lot and it make sense to separate it</div><div><br>=
</div><div><font color=3D"#000000"><span style=3D"letter-spacing:0.2px;whit=
e-space:nowrap">Reviewed-by: Chih-Min Chao &lt;<a href=3D"mailto:chihmin.ch=
ao@sifive.com">chihmin.chao@sifive.com</a>&gt;</span>=C2=A0</font></div></d=
iv></div>

--0000000000002734d5058f9b7a19--

