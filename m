Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ophTK-00072Q-Om
	for mharc-qemu-riscv@gnu.org; Mon, 31 Oct 2022 22:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1ophTJ-000724-IM
 for qemu-riscv@nongnu.org; Mon, 31 Oct 2022 22:57:49 -0400
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1ophTH-0008F2-Jg
 for qemu-riscv@nongnu.org; Mon, 31 Oct 2022 22:57:49 -0400
Received: by mail-vs1-xe2a.google.com with SMTP id k1so12786976vsc.13
 for <qemu-riscv@nongnu.org>; Mon, 31 Oct 2022 19:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=H40mkT8zih3q9cXYoSgMtD5t3c5mWMHflv9IKyMy5cA=;
 b=ITZsTt6ogO7X+yhy0mmD5W5hTI/l4ND602XHodFET2rl3YaAhM/es2PR1n5AfzS/za
 1lIa2d6+kc3+OX13AuYxOH4NZ+OMqvH29xJH3w3duaIspwga2uVtmJ/X+tUtyJna64vJ
 g3T/k7mAH+AOHHIKD/OJj9eYJAnvEQT6IaGAwE1z1FULLWKwcU15MJkKWknl9tFaGOeD
 2xWXDS12BY5gTI2W3aOtIJbuzD+N5U5gT+AVvdZs3dX3ldNtRdSrIh7jvB4ZGPbI/wgR
 vXEodyGnrd4nJ7toW7aWQjxu3w+IyeqmFAtGKZOKnZvW/V8FdsJMcrtAsRlZx57pqlFT
 /1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H40mkT8zih3q9cXYoSgMtD5t3c5mWMHflv9IKyMy5cA=;
 b=l8D39cPTIpcLcFl4/Dot52xxYkjOHuVX4QIDdOoBWqacBqxAHhKINLCIzKg6yf6uiR
 AQpavNwRqisW5dvH4lPWAj3h7bwVChDnUn08lRYDc+lu0yN9xbkTNJeu9IOG6f28eb/5
 ThBOUGVWw67xH9HK8C4PAaOrdWIVuB2chGH+yhl4cjoEulacWrKXUbTOW8t8ajgxfv54
 PFJNN/mjnm4ryEh9oO+HXRuVj/s0Gixim8s//L5O//SicZLhZ5Hg25aZKsiQletSg5F4
 v0/HzyA55PhtCotSwqwoTBFZNW3RhfI/Ghl3CVR97RShOo61lKLyY1rIsSUW8J0R6J/v
 Xnkg==
X-Gm-Message-State: ACrzQf3yDYWDWtY2Sj+ghEDuXHNaORTZCkd05r47U09x5UF9+IHVnd7m
 gwrncD/qwSzLdz7m33bz5yo2RGVK6lEstim6ho1tQw==
X-Google-Smtp-Source: AMsMyM6IWsd7fTooLUJ6uSaG9U6IC/Bv3jyeRV/ybKA6weGNBHW8csR7k/K544q+QgDv6JfFzMB8F0OwV56+qp4O9WU=
X-Received: by 2002:a05:6102:212:b0:3ac:9213:c96c with SMTP id
 z18-20020a056102021200b003ac9213c96cmr4579774vsp.78.1667271466583; Mon, 31
 Oct 2022 19:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220922084107.2834285-1-tommy.wu@sifive.com>
 <20220922084107.2834285-3-tommy.wu@sifive.com>
 <CAKmqyKOAYD_eigVNY48pgqZu0ytxGzt_4qj1CL_AzRuxP4TvJQ@mail.gmail.com>
In-Reply-To: <CAKmqyKOAYD_eigVNY48pgqZu0ytxGzt_4qj1CL_AzRuxP4TvJQ@mail.gmail.com>
From: Tommy Wu <tommy.wu@sifive.com>
Date: Tue, 1 Nov 2022 10:57:35 +0800
Message-ID: <CANj3q_mXZYdAK0gutBebxJ_LDtZMLcrMn6MoFdo7vJxsNTzkmQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/riscv: sifive_e: Support the watchdog timer of
 HiFive 1 rev b.
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, bin.meng@windriver.com, jim.shu@sifive.com, 
 frank.chang@sifive.com
Content-Type: multipart/alternative; boundary="000000000000829e6005ec5fe3a0"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=tommy.wu@sifive.com; helo=mail-vs1-xe2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Nov 2022 02:57:49 -0000

--000000000000829e6005ec5fe3a0
Content-Type: text/plain; charset="UTF-8"

Hi Alistair,

>>          RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, false);
> Newline here
>>  +        qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_E_AON_WDT_IRQ));
> and here please
I've deleted the public create function and added newlines in patch v2.
Thank you for the review !

Regards,
Tommy

On Mon, Oct 10, 2022 at 10:27 AM Alistair Francis <alistair23@gmail.com>
wrote:

> On Thu, Sep 22, 2022 at 6:45 PM Tommy Wu <tommy.wu@sifive.com> wrote:
> >
> > Create the AON device when we realize the sifive_e machine.
> > This patch only implemented the functionality of the watchdog timer,
> > not all the functionality of the AON device.
> >
> > Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
> > ---
> >  hw/riscv/Kconfig            | 1 +
> >  hw/riscv/sifive_e.c         | 5 +++--
> >  include/hw/riscv/sifive_e.h | 7 ++++---
> >  3 files changed, 8 insertions(+), 5 deletions(-)
> >
> > diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> > index 79ff61c464..50890b1b75 100644
> > --- a/hw/riscv/Kconfig
> > +++ b/hw/riscv/Kconfig
> > @@ -59,6 +59,7 @@ config SIFIVE_E
> >      select SIFIVE_PLIC
> >      select SIFIVE_UART
> >      select SIFIVE_E_PRCI
> > +    select SIFIVE_E_AON
> >      select UNIMP
> >
> >  config SIFIVE_U
> > diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> > index d65d2fd869..f9c05cfd3a 100644
> > --- a/hw/riscv/sifive_e.c
> > +++ b/hw/riscv/sifive_e.c
> > @@ -45,6 +45,7 @@
> >  #include "hw/intc/riscv_aclint.h"
> >  #include "hw/intc/sifive_plic.h"
> >  #include "hw/misc/sifive_e_prci.h"
> > +#include "hw/misc/sifive_e_aon.h"
> >  #include "chardev/char.h"
> >  #include "sysemu/sysemu.h"
> >
> > @@ -222,8 +223,8 @@ static void sifive_e_soc_realize(DeviceState *dev,
> Error **errp)
> >          RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, ms->smp.cpus,
> >          RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
> >          RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, false);
>
> Newline here
>
> > -    create_unimplemented_device("riscv.sifive.e.aon",
> > -        memmap[SIFIVE_E_DEV_AON].base, memmap[SIFIVE_E_DEV_AON].size);
> > +    sifive_e_aon_create(sys_mem, memmap[SIFIVE_E_DEV_AON].base,
> > +        qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_E_AON_WDT_IRQ));
>
> and here please
>
> Otherwise:
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> Alistair
>
> >      sifive_e_prci_create(memmap[SIFIVE_E_DEV_PRCI].base);
> >
> >      /* GPIO */
> > diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
> > index 83604da805..7de2221564 100644
> > --- a/include/hw/riscv/sifive_e.h
> > +++ b/include/hw/riscv/sifive_e.h
> > @@ -75,9 +75,10 @@ enum {
> >  };
> >
> >  enum {
> > -    SIFIVE_E_UART0_IRQ  = 3,
> > -    SIFIVE_E_UART1_IRQ  = 4,
> > -    SIFIVE_E_GPIO0_IRQ0 = 8
> > +    SIFIVE_E_AON_WDT_IRQ  = 1,
> > +    SIFIVE_E_UART0_IRQ    = 3,
> > +    SIFIVE_E_UART1_IRQ    = 4,
> > +    SIFIVE_E_GPIO0_IRQ0   = 8
> >  };
> >
> >  #define SIFIVE_E_PLIC_HART_CONFIG "M"
> > --
> > 2.27.0
> >
> >
>

--000000000000829e6005ec5fe3a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Alistair,<div><br></div><div><div class=3D"gmail-HOEnZb=
 gmail-adM"><div class=3D"gmail-im" style=3D"color:rgb(80,0,80)"><div class=
=3D"gmail-HOEnZb gmail-adM" style=3D"color:rgb(34,34,34)"><div class=3D"gma=
il-im" style=3D"color:rgb(80,0,80)">&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, false);<br><span style=3D"color:rgb=
(34,34,34)">&gt; Newline here</span><br></div><div class=3D"gmail-im" style=
=3D"color:rgb(80,0,80)"><span class=3D"gmail-im">&gt;&gt;=C2=A0 +=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 qdev_get_gpio_in(DEVICE(s-&gt;plic), SIFIVE_E_AON_WDT_IRQ=
));<br></span><span style=3D"color:rgb(34,34,34)">&gt; and here please</spa=
n><br style=3D"color:rgb(34,34,34)"></div></div></div></div></div><div>I&#3=
9;ve deleted the public create function and added newlines in patch v2.</di=
v><div>Thank you for the review !</div><div><br></div><div>Regards,=C2=A0</=
div><div>Tommy</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Mon, Oct 10, 2022 at 10:27 AM Alistair Francis &lt;<=
a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Sep 22, =
2022 at 6:45 PM Tommy Wu &lt;<a href=3D"mailto:tommy.wu@sifive.com" target=
=3D"_blank">tommy.wu@sifive.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Create the AON device when we realize the sifive_e machine.<br>
&gt; This patch only implemented the functionality of the watchdog timer,<b=
r>
&gt; not all the functionality of the AON device.<br>
&gt;<br>
&gt; Signed-off-by: Tommy Wu &lt;<a href=3D"mailto:tommy.wu@sifive.com" tar=
get=3D"_blank">tommy.wu@sifive.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/riscv/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<=
br>
&gt;=C2=A0 hw/riscv/sifive_e.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 +++--<b=
r>
&gt;=C2=A0 include/hw/riscv/sifive_e.h | 7 ++++---<br>
&gt;=C2=A0 3 files changed, 8 insertions(+), 5 deletions(-)<br>
&gt;<br>
&gt; diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig<br>
&gt; index 79ff61c464..50890b1b75 100644<br>
&gt; --- a/hw/riscv/Kconfig<br>
&gt; +++ b/hw/riscv/Kconfig<br>
&gt; @@ -59,6 +59,7 @@ config SIFIVE_E<br>
&gt;=C2=A0 =C2=A0 =C2=A0 select SIFIVE_PLIC<br>
&gt;=C2=A0 =C2=A0 =C2=A0 select SIFIVE_UART<br>
&gt;=C2=A0 =C2=A0 =C2=A0 select SIFIVE_E_PRCI<br>
&gt; +=C2=A0 =C2=A0 select SIFIVE_E_AON<br>
&gt;=C2=A0 =C2=A0 =C2=A0 select UNIMP<br>
&gt;<br>
&gt;=C2=A0 config SIFIVE_U<br>
&gt; diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c<br>
&gt; index d65d2fd869..f9c05cfd3a 100644<br>
&gt; --- a/hw/riscv/sifive_e.c<br>
&gt; +++ b/hw/riscv/sifive_e.c<br>
&gt; @@ -45,6 +45,7 @@<br>
&gt;=C2=A0 #include &quot;hw/intc/riscv_aclint.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/intc/sifive_plic.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/misc/sifive_e_prci.h&quot;<br>
&gt; +#include &quot;hw/misc/sifive_e_aon.h&quot;<br>
&gt;=C2=A0 #include &quot;chardev/char.h&quot;<br>
&gt;=C2=A0 #include &quot;sysemu/sysemu.h&quot;<br>
&gt;<br>
&gt; @@ -222,8 +223,8 @@ static void sifive_e_soc_realize(DeviceState *dev,=
 Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0,=
 ms-&gt;smp.cpus,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV=
_ACLINT_DEFAULT_MTIME,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, =
false);<br>
<br>
Newline here<br>
<br>
&gt; -=C2=A0 =C2=A0 create_unimplemented_device(&quot;riscv.sifive.e.aon&qu=
ot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 memmap[SIFIVE_E_DEV_AON].base, memmap[SIF=
IVE_E_DEV_AON].size);<br>
&gt; +=C2=A0 =C2=A0 sifive_e_aon_create(sys_mem, memmap[SIFIVE_E_DEV_AON].b=
ase,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_get_gpio_in(DEVICE(s-&gt;plic), SIFI=
VE_E_AON_WDT_IRQ));<br>
<br>
and here please<br>
<br>
Otherwise:<br>
<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
<br>
Alistair<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sifive_e_prci_create(memmap[SIFIVE_E_DEV_PRCI].bas=
e);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* GPIO */<br>
&gt; diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h=
<br>
&gt; index 83604da805..7de2221564 100644<br>
&gt; --- a/include/hw/riscv/sifive_e.h<br>
&gt; +++ b/include/hw/riscv/sifive_e.h<br>
&gt; @@ -75,9 +75,10 @@ enum {<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt;=C2=A0 enum {<br>
&gt; -=C2=A0 =C2=A0 SIFIVE_E_UART0_IRQ=C2=A0 =3D 3,<br>
&gt; -=C2=A0 =C2=A0 SIFIVE_E_UART1_IRQ=C2=A0 =3D 4,<br>
&gt; -=C2=A0 =C2=A0 SIFIVE_E_GPIO0_IRQ0 =3D 8<br>
&gt; +=C2=A0 =C2=A0 SIFIVE_E_AON_WDT_IRQ=C2=A0 =3D 1,<br>
&gt; +=C2=A0 =C2=A0 SIFIVE_E_UART0_IRQ=C2=A0 =C2=A0 =3D 3,<br>
&gt; +=C2=A0 =C2=A0 SIFIVE_E_UART1_IRQ=C2=A0 =C2=A0 =3D 4,<br>
&gt; +=C2=A0 =C2=A0 SIFIVE_E_GPIO0_IRQ0=C2=A0 =C2=A0=3D 8<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt;=C2=A0 #define SIFIVE_E_PLIC_HART_CONFIG &quot;M&quot;<br>
&gt; --<br>
&gt; 2.27.0<br>
&gt;<br>
&gt;<br>
</blockquote></div>

--000000000000829e6005ec5fe3a0--

