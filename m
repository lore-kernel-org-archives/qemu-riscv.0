Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oGmI3-0005Qk-9c
	for mharc-qemu-riscv@gnu.org; Wed, 27 Jul 2022 15:01:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oGmHt-0005OT-Q1
 for qemu-riscv@nongnu.org; Wed, 27 Jul 2022 15:01:41 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:42522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oGmHr-0004JJ-Is
 for qemu-riscv@nongnu.org; Wed, 27 Jul 2022 15:01:41 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 d65-20020a17090a6f4700b001f303a97b14so3026615pjk.1
 for <qemu-riscv@nongnu.org>; Wed, 27 Jul 2022 12:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SFTW4afqMv8Iz6F882Kc1hdDJcateS79z6VX3Z8ZVH0=;
 b=CiJcnT4scWaKVCDeHM3WMmUgJ0nmTDv3fa2U/754LfCDdiKrIRCNKs2VSLJ4+f67e8
 1EcdvtL9+daNx0cyCvMYGQe1f25BoL+FBhp/NBJL/wV3e/R0ymyXh3/kIVX5kOT97BTh
 NcFYsnKPSNjS3v4to6qKD+XxSGg6k0hCcAdRA//Uf2uAW020BLGxhzvkdPD5oIYBNNd4
 zieAZ481vF6mQy4L/jtfxxOVbwQ7S9Bu7TOlRLdXJD6jyriRFj94WZX/mREPm2LqQsvT
 t3URVRb+HJAq9+grzZ+D6803NBQp1KWhj96flVm5zVK9oBps6518v1kbqS70cYa2p61U
 VLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SFTW4afqMv8Iz6F882Kc1hdDJcateS79z6VX3Z8ZVH0=;
 b=iB9BtucNpjKZoQs4DO4v3DIq3XyhxojDgLlopiqtRAzbfXuOjCoieXsC5yoOlpMsn3
 NHZ9VgfxWAvGVYP1L9wBdpfALykVT6NOE6HE2gWR31ihGrtOHvwEAEXBQImcGuECP6/3
 WgUbquuQYA8eEN2XmmN1pydH5e00jXykZOooIKYAAIcbcO92uLuaK4//rt9g0lFQAAWI
 5+8DYdWVcvXLV7hFHLVT9igWI6cdZEpd7QF+1ORoIdL5U2gMXxBNihkd4n2uw9XHtRPB
 Z3HiPT7yKLG90sPdYGkD70H/XXTtsKlMmNyxAeoo8L6/uBoS9q3vZJUcIdKLqTWH1WSJ
 SJXA==
X-Gm-Message-State: AJIora+wTZk65YIWbUR5Mob7PUq8l96/n8gZODjJYJk0nwkgi3ApxJcJ
 S2KBwssq/Lqz1ZwL17Tykn/tdkJwdZNfXQVTf5wTFw==
X-Google-Smtp-Source: AGRyM1tfdk8uWVWUdm25QzQmnaCvQJqairxYo1P8DvznJ3sBXkAlVmbh40FFzJMFN/TfjtLkXxrAjSjjuvRAfguCndw=
X-Received: by 2002:a17:902:da91:b0:16d:3bc2:ff49 with SMTP id
 j17-20020a170902da9100b0016d3bc2ff49mr22768807plx.85.1658948497866; Wed, 27
 Jul 2022 12:01:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220723090335.671105-1-atishp@rivosinc.com>
 <CAKmqyKP4jg5yoTfQX_=CcL9y5F9FtKBQ4OHH31KoD14T1H4mVA@mail.gmail.com>
In-Reply-To: <CAKmqyKP4jg5yoTfQX_=CcL9y5F9FtKBQ4OHH31KoD14T1H4mVA@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Wed, 27 Jul 2022 12:01:26 -0700
Message-ID: <CAHBxVyHku+yjKVVoD1aZMTsDDE2qER-qFm_gTt5OxL0P8sqEXw@mail.gmail.com>
Subject: Re: [PATCH] hw/intc: sifive_plic: Fix multi-socket plic configuraiton
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000ea999805e4ce0b55"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 27 Jul 2022 19:01:42 -0000

--000000000000ea999805e4ce0b55
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 27, 2022 at 5:23 AM Alistair Francis <alistair23@gmail.com>
wrote:

> On Sat, Jul 23, 2022 at 7:22 PM Atish Patra <atishp@rivosinc.com> wrote:
> >
> > Since commit 40244040a7ac, multi-socket configuration with plic is
> > broken as the hartid for second socket is calculated incorrectly.
> > The hartid stored in addr_config already includes the offset
> > for the base hartid for that socket. Adding it again would lead
> > to segfault while creating the plic device for the virt machine.
> > qdev_connect_gpio_out was also invoked with incorrect number of gpio
> > lines.
> >
> > Fixes: 40244040a7ac (hw/intc: sifive_plic: Avoid overflowing the
> addr_config buffer)
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  hw/intc/sifive_plic.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> > index 56d60e9ac935..fdac028a521f 100644
> > --- a/hw/intc/sifive_plic.c
> > +++ b/hw/intc/sifive_plic.c
> > @@ -454,10 +454,10 @@ DeviceState *sifive_plic_create(hwaddr addr, char
> *hart_config,
> >
> >      for (i = 0; i < plic->num_addrs; i++) {
> >          int cpu_num = plic->addr_config[i].hartid;
> > -        CPUState *cpu = qemu_get_cpu(hartid_base + cpu_num);
> > +        CPUState *cpu = qemu_get_cpu(cpu_num);
> >
> >          if (plic->addr_config[i].mode == PLICMode_M) {
> > -            qdev_connect_gpio_out(dev, num_harts + cpu_num,
> > +            qdev_connect_gpio_out(dev, cpu_num,
>
> Argh!
>
> I was trying to get this ready to go into 7.1. I have been working on
> updating my tests to catch this failure in the future as well.
>
> While testing this change I noticed that it breaks the noMMU test case.
>
> I think the correct fix is actually this (on top of your patch):
>
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index fdac028a52..af4ae3630e 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -457,7 +457,7 @@ DeviceState *sifive_plic_create(hwaddr addr, char
> *hart_config,
>         CPUState *cpu = qemu_get_cpu(cpu_num);
>
>         if (plic->addr_config[i].mode == PLICMode_M) {
> -            qdev_connect_gpio_out(dev, cpu_num,
> +            qdev_connect_gpio_out(dev, num_harts - plic->hartid_base +
> cpu_num,
>                                   qdev_get_gpio_in(DEVICE(cpu),
> IRQ_M_EXT));
>         }
>         if (plic->addr_config[i].mode == PLICMode_S) {
>
> The idea is that we need to increment the second argument to
> qdev_connect_gpio_out() for the PLICMode_M compared to the PLICMode_S
> case.
>
> This ensures that we do that correctly without breaking anything.
>
> How does that look to you?
>
>
Ahh yes. That makes sense.
Tested the updated change on multi-socket as well.


> Alistair
>
> >                                    qdev_get_gpio_in(DEVICE(cpu),
> IRQ_M_EXT));
> >          }
> >          if (plic->addr_config[i].mode == PLICMode_S) {
> > --
> > 2.25.1
> >
> >
>

--000000000000ea999805e4ce0b55
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 27, 2022 at 5:23 AM Alist=
air Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Sat, Jul 23, 2022 at 7:22 PM Atish Patra &lt;<a href=3D"mailto:atishp@r=
ivosinc.com" target=3D"_blank">atishp@rivosinc.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Since commit 40244040a7ac, multi-socket configuration with plic is<br>
&gt; broken as the hartid for second socket is calculated incorrectly.<br>
&gt; The hartid stored in addr_config already includes the offset<br>
&gt; for the base hartid for that socket. Adding it again would lead<br>
&gt; to segfault while creating the plic device for the virt machine.<br>
&gt; qdev_connect_gpio_out was also invoked with incorrect number of gpio<b=
r>
&gt; lines.<br>
&gt;<br>
&gt; Fixes: 40244040a7ac (hw/intc: sifive_plic: Avoid overflowing the addr_=
config buffer)<br>
&gt;<br>
&gt; Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atishp@rivosinc.com" =
target=3D"_blank">atishp@rivosinc.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/intc/sifive_plic.c | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c<br>
&gt; index 56d60e9ac935..fdac028a521f 100644<br>
&gt; --- a/hw/intc/sifive_plic.c<br>
&gt; +++ b/hw/intc/sifive_plic.c<br>
&gt; @@ -454,10 +454,10 @@ DeviceState *sifive_plic_create(hwaddr addr, cha=
r *hart_config,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; plic-&gt;num_addrs; i++) {<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int cpu_num =3D plic-&gt;addr_config=
[i].hartid;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 CPUState *cpu =3D qemu_get_cpu(hartid_bas=
e + cpu_num);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 CPUState *cpu =3D qemu_get_cpu(cpu_num);<=
br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (plic-&gt;addr_config[i].mode =3D=
=3D PLICMode_M) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_connect_gpio_out(dev, =
num_harts + cpu_num,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_connect_gpio_out(dev, =
cpu_num,<br>
<br>
Argh!<br>
<br>
I was trying to get this ready to go into 7.1. I have been working on<br>
updating my tests to catch this failure in the future as well.<br>
<br>
While testing this change I noticed that it breaks the noMMU test case.<br>
<br>
I think the correct fix is actually this (on top of your patch):<br>
<br>
diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c<br>
index fdac028a52..af4ae3630e 100644<br>
--- a/hw/intc/sifive_plic.c<br>
+++ b/hw/intc/sifive_plic.c<br>
@@ -457,7 +457,7 @@ DeviceState *sifive_plic_create(hwaddr addr, char<br>
*hart_config,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 CPUState *cpu =3D qemu_get_cpu(cpu_num);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (plic-&gt;addr_config[i].mode =3D=3D PLICMod=
e_M) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_connect_gpio_out(dev, cpu_n=
um,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_connect_gpio_out(dev, num_h=
arts - plic-&gt;hartid_base + cpu_num,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_get_gpio_in(DEVICE(cpu),=
 IRQ_M_EXT));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (plic-&gt;addr_config[i].mode =3D=3D PLICMod=
e_S) {<br>
<br>
The idea is that we need to increment the second argument to<br>
qdev_connect_gpio_out() for the PLICMode_M compared to the PLICMode_S<br>
case.<br>
<br>
This ensures that we do that correctly without breaking anything.<br>
<br>
How does that look to you?<br>
<br></blockquote><div><br></div><div>Ahh yes. That makes sense.</div><div>T=
ested the updated change on multi-socket as well.</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
Alistair<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_get_gpio_in(DE=
VICE(cpu), IRQ_M_EXT));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (plic-&gt;addr_config[i].mode =3D=
=3D PLICMode_S) {<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
</blockquote></div></div>

--000000000000ea999805e4ce0b55--

