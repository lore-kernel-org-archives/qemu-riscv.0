Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oG6bY-0002EX-EQ
	for mharc-qemu-riscv@gnu.org; Mon, 25 Jul 2022 18:31:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oG6bL-0002Ch-Cq
 for qemu-riscv@nongnu.org; Mon, 25 Jul 2022 18:30:59 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:53824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oG6bB-0000PU-R1
 for qemu-riscv@nongnu.org; Mon, 25 Jul 2022 18:30:53 -0400
Received: by mail-pj1-x1031.google.com with SMTP id li4so418655pjb.3
 for <qemu-riscv@nongnu.org>; Mon, 25 Jul 2022 15:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pAsgUqjp+kH5MijKCf2WqKZ7Oadnu9fvl3ipCXeZf+g=;
 b=DxPmGsk/WdXPP05y3YODBsGwyjMN4SqNZ9zucK9eYEyIIkd2C1IZCo0fYOC2ja8OXE
 fy5zYfMelhqRz67/APtFkgBYSM5kFUM4VxlS18hgP7UioUXzUOYfJ+Mf67lKRmcO5Nde
 YGRgQ+T0oBmY3KH5/j2C1FnqLy6AI2eQvvbLsbWl7NPALQTweR44oyFjiCXN82ojB70V
 zoMpzjTBKh+5PKDy4xC180pv2kWYC3MnbyJcUVPWZa7N17YPFsEciB9Ufx4lsMeEELlN
 4fot807cWwuV3jWL50GGBkfoopH9BJwzpBlOmIk+m8gQ6h7m3oABiO/vmAw8KG52J5OF
 BCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pAsgUqjp+kH5MijKCf2WqKZ7Oadnu9fvl3ipCXeZf+g=;
 b=SUZYQnT8CgEXrYTkcqRoDsrZy1zCodIt2xbGs6RRnLdi4mb5oMnQjBTa2YJBUh7wfW
 vqkT1bvEKbtQwZKQtn8mRy0ocN8iF9mEazLviJ5t7RS+wPl3klo7CCSq2Uhi9iPWX86Z
 kHRWFnDvOqVZMr2ha+ctCVm1G8mVcvpTYU1TTFSB+WB/69jpkQwhaG1vj8wTnJTTBakV
 4Sky1K/JoG8LrNmL/pH0F+UiYFeuh7ov3RhxIaHN+AbWezaA4l7QV5YqlLpaZdp1xAk3
 mUyWQo221sF+PkjO8G0EP/EXWIbxXfXuZ9MvwuOynUZl5OGgE/r78vLswzxS4qbsln1j
 EP0g==
X-Gm-Message-State: AJIora+UQRQzz1P14X059It+1LPbDKyk9zSyyJrN9FRKHaW3KPDMai07
 G9Bwg0u2ckNMK5UlRV+xMrq17wY9zE+jEkmdrkgz7w==
X-Google-Smtp-Source: AGRyM1vR3h3BrysMQvtZdPCpD0OQau0gQLilnjV1DzzoryueH6SRYp71I3PZuU17pCnjHVTYssxsGT1+ZBQydEjrMCc=
X-Received: by 2002:a17:90a:9409:b0:1f0:e171:f2bd with SMTP id
 r9-20020a17090a940900b001f0e171f2bdmr16057685pjo.245.1658788233495; Mon, 25
 Jul 2022 15:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220723090335.671105-1-atishp@rivosinc.com>
 <CAKmqyKODh+im_v2NJhRcYgeaYmvDS9BXW++RaOzEb9oQD53zKw@mail.gmail.com>
In-Reply-To: <CAKmqyKODh+im_v2NJhRcYgeaYmvDS9BXW++RaOzEb9oQD53zKw@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 25 Jul 2022 15:30:22 -0700
Message-ID: <CAHBxVyHP8HYytR4ifBZhSOkEPX+u1tGdoVu5jk+FanWbHgD0-w@mail.gmail.com>
Subject: Re: [PATCH] hw/intc: sifive_plic: Fix multi-socket plic configuraiton
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000006a5c3505e4a8bbe6"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 25 Jul 2022 22:30:59 -0000

--0000000000006a5c3505e4a8bbe6
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 24, 2022 at 6:14 PM Alistair Francis <alistair23@gmail.com>
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
>
> Can you share the -cpu options that causes the segfault? I'll add it
> to my test case
>
>
"-cpu rv64 -M virt -m 2G -smp 4 -object
memory-backend-ram,size=1G,policy=bind,host-nodes=0,id=ram-node0  \
-numa node,memdev=ram-node0   \
-object memory-backend-ram,size=1G,policy=bind,host-nodes=0,id=ram-node1 \
-numa node,memdev=ram-node1"

You also need to enable  CONFIG_NUMA in kernel.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> Alistair
>
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
> >                                    qdev_get_gpio_in(DEVICE(cpu),
> IRQ_M_EXT));
> >          }
> >          if (plic->addr_config[i].mode == PLICMode_S) {
> > --
> > 2.25.1
> >
> >
>

--0000000000006a5c3505e4a8bbe6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div dir=3D"lt=
r"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sun, Jul 24, 2022 at 6:14 PM Alistair Francis &lt;<a href=3D"mail=
to:alistair23@gmail.com" target=3D"_blank">alistair23@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sat, Jul =
23, 2022 at 7:22 PM Atish Patra &lt;<a href=3D"mailto:atishp@rivosinc.com" =
target=3D"_blank">atishp@rivosinc.com</a>&gt; wrote:<br>
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
<br>
Can you share the -cpu options that causes the segfault? I&#39;ll add it<br=
>
to my test case<br>
<br></blockquote><div><br></div><div>&quot;-cpu rv64 -M virt -m 2G -smp 4 -=
object memory-backend-ram,size=3D1G,policy=3Dbind,host-nodes=3D0,id=3Dram-n=
ode0=C2=A0 \<br>-numa node,memdev=3Dram-node0=C2=A0 =C2=A0\</div><div>-obje=
ct memory-backend-ram,size=3D1G,policy=3Dbind,host-nodes=3D0,id=3Dram-node1=
 \</div><div>-numa node,memdev=3Dram-node1&quot;<br></div><div><br></div><d=
iv>You also need to enable=C2=A0=C2=A0CONFIG_NUMA in kernel.</div><div><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
<br>
Alistair<br>
<br>
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
</div>

--0000000000006a5c3505e4a8bbe6--

