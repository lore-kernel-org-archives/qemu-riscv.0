Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ocuKq-0003uT-Q4
	for mharc-qemu-riscv@gnu.org; Mon, 26 Sep 2022 16:04:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tkng@rivosinc.com>) id 1ocuKk-0003nS-Io
 for qemu-riscv@nongnu.org; Mon, 26 Sep 2022 16:04:09 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:34759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tkng@rivosinc.com>) id 1ocuKi-0007k5-0d
 for qemu-riscv@nongnu.org; Mon, 26 Sep 2022 16:04:06 -0400
Received: by mail-pf1-x42f.google.com with SMTP id e68so7785262pfe.1
 for <qemu-riscv@nongnu.org>; Mon, 26 Sep 2022 13:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=x1Jivqm2LhOQAUXUW+/Q4KxscvZ0HVsPF2edJcT2p6I=;
 b=rotjd1+0LIl8apjGalPgnBLdt5B5T/C4CWnZvehPBde6FBAHZa8igWM+lWoNf/HQq6
 wPIwAbZzyvH+h090zxjm06HTZmiDecKYLYbJwil/IdHvxg9MgjFC8uiG+47xD0MVXbM9
 vv2Odu5g2qGyyqQbly233TsUGBepkmPBhJG+AX2Nzf/Q+qx1/SzKxAEe3ymrPvSw/nDu
 B4FRlg1ia9sGQmFYh9vt+WJs6rUQlJUF0SV1Kl+Y63Ss/NcwEVJ2ARzYUuunRNGr/lEv
 KbsqI60L0kWzEZ/rsEitEz9gpfUI1bC0U9ZDkfYY3eAfpZtXi2vZjfJWGkKoVFO21SAF
 R7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=x1Jivqm2LhOQAUXUW+/Q4KxscvZ0HVsPF2edJcT2p6I=;
 b=Jw1sTwavbPyM0WeD7bWgRM+s6I864tpnrGiTwLlUW2RKyYWuwNsyYL9+VFefNDzcfg
 LrczKYlL5NXx6UIQTNUx+XapVHmbreTC5fdcD9ICtOiCiFXWRzVTmyJOXJLBC/2nUuod
 yjZaAXWkFQraPc/yFJEIQmyez8/3sUPg7rAbW0I2UjQKaUbzX2OWZbN9z8BEheCnb5ou
 Rkqjp6FwiCZqJHxligu4wsX7CRHuANokD/SrE6i/EHo5Z7ZMU9qaRypUWErr9Wisd61A
 Y0j+gpco9eoeW7UvUj5K/9WmXix6iVwXEhFKNrREPXYJL+d5rUzFUnW1GkMr7eTJmg6O
 YkLg==
X-Gm-Message-State: ACrzQf1fg2kbLM947iDSNSyxAzPfop1Y768ANiBAgoq2tRLRh7NJWNWc
 IwluPC8UPwS/ox6SVzeEFTlmCBlVifZzW3BnbLZ0/Q==
X-Google-Smtp-Source: AMsMyM7mxVJw0OGEu3TVmDOOXbFUuIm6KiD6FABGOvPMdE39/zm3diH+Doop0ZyvZHfrWSwiVZl54lOPxtL1zQ2n+x8=
X-Received: by 2002:a63:a505:0:b0:438:675d:caee with SMTP id
 n5-20020a63a505000000b00438675dcaeemr22080937pgf.576.1664222641622; Mon, 26
 Sep 2022 13:04:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAB88-qPD2OAxeg4WA65utUmFj4Y=SceeFTuStpZS4pPWevdBXA@mail.gmail.com>
 <20220905131544.2xlaycrcyviufo5y@kamzik>
 <CAB88-qPOGVksP1ekqTjcGHbi2_iVzsW-b9wokgREEQJ8LgfU=Q@mail.gmail.com>
 <CALw707oeRt4+C9HTbzzt0RcP-FtYeh1vTh7meGY99vKQQnsktA@mail.gmail.com>
In-Reply-To: <CALw707oeRt4+C9HTbzzt0RcP-FtYeh1vTh7meGY99vKQQnsktA@mail.gmail.com>
From: Tyler Ng <tkng@rivosinc.com>
Date: Mon, 26 Sep 2022 13:03:50 -0700
Message-ID: <CAB88-qPeGqcPHhCccxgTO__gh_spbzrbVNQ4Z-340E7T4mRBCw@mail.gmail.com>
Subject: Re: [PATCH 2/4] hw/intc: sifive_plic.c: Fix interrupt priority index.
To: Jim Shu <jim.shu@sifive.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000061a6d905e99a07bb"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=tkng@rivosinc.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 26 Sep 2022 20:04:09 -0000

--00000000000061a6d905e99a07bb
Content-Type: text/plain; charset="UTF-8"

Hi Jim,

Thanks for raising this comment. I think I understand where the confusion
happens and it's because in the OpenTitan machine (which uses the sifive
plic), it uses 0x00 as the priority base by default, which was the source
of the problems. I'll drop this commit in the next version.

-Tyler

On Sun, Sep 25, 2022 at 6:47 AM Jim Shu <jim.shu@sifive.com> wrote:

> Hi Tyler,
>
> This fix is incorrect.
>
> In PLIC spec, Interrupt Source Priority Memory Map is
> 0x000000: Reserved (interrupt source 0 does not exist)
> 0x000004: Interrupt source 1 priority
> 0x000008: Interrupt source 2 priority
>
> Current RISC-V machines (virt, sifive_u) use 0x4 as priority_base, so
> current formula "irq = ((addr - plic->priority_base) >> 2) + 1" will
> take offset 0x4 as IRQ source 1, which is correct.
> Your fix will cause the bug in existing machines.
>
> Thanks,
> Jim Shu
>
>
>
>
> On Tue, Sep 6, 2022 at 11:21 PM Tyler Ng <tkng@rivosinc.com> wrote:
> >
> > Here's the patch SHA that introduced the offset:
> 0feb4a7129eb4f120c75849ddc9e50495c50cb63
> >
> > -Tyler
> >
> > On Mon, Sep 5, 2022 at 6:15 AM Andrew Jones <ajones@ventanamicro.com>
> wrote:
> >>
> >> On Thu, Sep 01, 2022 at 03:50:06PM -0700, Tyler Ng wrote:
> >> > Fixes a bug in which the index of the interrupt priority is off by 1.
> >> > For example, using an IRQ number of 3 with a priority of 1 is
> supposed to set
> >> > plic->source_priority[2] = 1, but instead it sets
> >> > plic->source_priority[3] = 1. When an interrupt is claimed to be
> >> > serviced, it checks the index 2 instead of 3.
> >> >
> >> > Signed-off-by: Tyler Ng <tkng@rivosinc.com>
> >>
> >> Fixes tag?
> >>
> >> Thanks,
> >> drew
> >>
> >> > ---
> >> >  hw/intc/sifive_plic.c | 2 +-
> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >
> >> > diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> >> > index af4ae3630e..e75c47300a 100644
> >> > --- a/hw/intc/sifive_plic.c
> >> > +++ b/hw/intc/sifive_plic.c
> >> > @@ -178,7 +178,7 @@ static void sifive_plic_write(void *opaque, hwaddr
> >> > addr, uint64_t value,
> >> >      SiFivePLICState *plic = opaque;
> >> >
> >> >      if (addr_between(addr, plic->priority_base, plic->num_sources <<
> 2)) {
> >> > -        uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
> >> > +        uint32_t irq = ((addr - plic->priority_base) >> 2) + 0;
> >> >
> >> >          plic->source_priority[irq] = value & 7;
> >> >          sifive_plic_update(plic);
> >> > --
> >> > 2.30.2
> >> >
>

--00000000000061a6d905e99a07bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Jim,</div><div><br></div><div>Thanks for raising t=
his comment. I think I understand where the confusion happens and it&#39;s =
because in the OpenTitan machine (which uses the sifive plic), it uses 0x00=
 as the priority base by default, which was the source of the problems. I&#=
39;ll drop this commit in the next version.<br></div><div><div><br></div><d=
iv>-Tyler<br></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Sun, Sep 25, 2022 at 6:47 AM Jim Shu &lt;<a hre=
f=3D"mailto:jim.shu@sifive.com" target=3D"_blank">jim.shu@sifive.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Tyle=
r,<br>
<br>
This fix is incorrect.<br>
<br>
In PLIC spec, Interrupt Source Priority Memory Map is<br>
0x000000: Reserved (interrupt source 0 does not exist)<br>
0x000004: Interrupt source 1 priority<br>
0x000008: Interrupt source 2 priority<br>
<br>
Current RISC-V machines (virt, sifive_u) use 0x4 as priority_base, so<br>
current formula &quot;irq =3D ((addr - plic-&gt;priority_base) &gt;&gt; 2) =
+ 1&quot; will<br>
take offset 0x4 as IRQ source 1, which is correct.<br>
Your fix will cause the bug in existing machines.<br>
<br>
Thanks,<br>
Jim Shu<br>
<br>
<br>
<br>
<br>
On Tue, Sep 6, 2022 at 11:21 PM Tyler Ng &lt;<a href=3D"mailto:tkng@rivosin=
c.com" target=3D"_blank">tkng@rivosinc.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Here&#39;s the patch SHA that introduced the offset: 0feb4a7129eb4f120=
c75849ddc9e50495c50cb63<br>
&gt;<br>
&gt; -Tyler<br>
&gt;<br>
&gt; On Mon, Sep 5, 2022 at 6:15 AM Andrew Jones &lt;<a href=3D"mailto:ajon=
es@ventanamicro.com" target=3D"_blank">ajones@ventanamicro.com</a>&gt; wrot=
e:<br>
&gt;&gt;<br>
&gt;&gt; On Thu, Sep 01, 2022 at 03:50:06PM -0700, Tyler Ng wrote:<br>
&gt;&gt; &gt; Fixes a bug in which the index of the interrupt priority is o=
ff by 1.<br>
&gt;&gt; &gt; For example, using an IRQ number of 3 with a priority of 1 is=
 supposed to set<br>
&gt;&gt; &gt; plic-&gt;source_priority[2] =3D 1, but instead it sets<br>
&gt;&gt; &gt; plic-&gt;source_priority[3] =3D 1. When an interrupt is claim=
ed to be<br>
&gt;&gt; &gt; serviced, it checks the index 2 instead of 3.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Tyler Ng &lt;<a href=3D"mailto:tkng@rivosinc.c=
om" target=3D"_blank">tkng@rivosinc.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Fixes tag?<br>
&gt;&gt;<br>
&gt;&gt; Thanks,<br>
&gt;&gt; drew<br>
&gt;&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 hw/intc/sifive_plic.c | 2 +-<br>
&gt;&gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c<br=
>
&gt;&gt; &gt; index af4ae3630e..e75c47300a 100644<br>
&gt;&gt; &gt; --- a/hw/intc/sifive_plic.c<br>
&gt;&gt; &gt; +++ b/hw/intc/sifive_plic.c<br>
&gt;&gt; &gt; @@ -178,7 +178,7 @@ static void sifive_plic_write(void *opaqu=
e, hwaddr<br>
&gt;&gt; &gt; addr, uint64_t value,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 SiFivePLICState *plic =3D opaque;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (addr_between(addr, plic-&gt;priority_=
base, plic-&gt;num_sources &lt;&lt; 2)) {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t irq =3D ((addr - plic-&=
gt;priority_base) &gt;&gt; 2) + 1;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t irq =3D ((addr - plic-&=
gt;priority_base) &gt;&gt; 2) + 0;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 plic-&gt;source_priority[ir=
q] =3D value &amp; 7;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sifive_plic_update(plic);<b=
r>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.30.2<br>
&gt;&gt; &gt;<br>
</blockquote></div>

--00000000000061a6d905e99a07bb--

