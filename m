Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m6p0D-0006WU-FY
	for mharc-qemu-riscv@gnu.org; Fri, 23 Jul 2021 02:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m6p0B-0006VV-Iz; Fri, 23 Jul 2021 02:49:43 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:41552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m6p09-0001kF-SV; Fri, 23 Jul 2021 02:49:43 -0400
Received: by mail-io1-xd30.google.com with SMTP id r6so1315886ioj.8;
 Thu, 22 Jul 2021 23:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2CH9A/tfe+xMt3Y7V7bY7+S5mOk+r4qtWWfwZSVA5JI=;
 b=iI9plTLfbMp+yveUx9CEEBrH8vfu3GMX7+8/zPwzQpE9m3wxlfp8DfrIbEQO5fFRfV
 9LeVB0fvML1M4sG+iHqARfZbjwqCKDXCbr/IBeFXDKNl5V/H5Iasn2DYzteGQ4J9TzWm
 +Kd+pCSMkhPz3utLpg9r3WSdgCZq5/0nplatLM9IvYOiCFSC5R+4ZtBTSwsvQ/6jUfmH
 la4IhUK843t1uTuszmE2/88EIKz/K+94lQWIFRChVJ334NncsM5sUAByOB/ucsZ7yMDf
 nOY1p4oEZ58zB6MsVaL5CB+1/0fVnLbDiIvhGnXmDLDAakaxwtVf2OyJqgsQQRHS7dYj
 RrhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2CH9A/tfe+xMt3Y7V7bY7+S5mOk+r4qtWWfwZSVA5JI=;
 b=XCP5FDggrSIGg8bACFFXy70fltv4LdZuqh3IGa2GOUAx8ClpzGtdX5uAnoVuAMMs1B
 1Fk1GFUfiJKG2aaifJSedt58iCYB0YEaxx/+qhyonvwStexfTlYOYfGSNj9sEmC2rlgn
 Zjf5gtuYjaUA/bKBwSaKTiBmtT+IWsCikTHUKMdb5RLEkv7KyTAGH7gnuXYlK36oZeMZ
 P1AuvLEvIumO4w3ZntCk41YrBNJUHqufb3elg+dQ3vbTSG0Q9QkbP2bJ4Es2Xh6hZCh1
 bPv0ak0PrdQlLz7inZ2seWk72+gvTWpponXIqIp2cWMwKZ0h0OXGEXdVNM1Dsi3/5Aeo
 91gQ==
X-Gm-Message-State: AOAM532yljDSSZfF3Br0pZaIHVFbCieqP7csbAS2wkJoPb/dVfbSCQLs
 0gtyTPBWaDKwaoH5LJsNW/EWpJtvc70/o2r+rCI=
X-Google-Smtp-Source: ABdhPJz7WKdFJc36bPDRAp/SdFCETc0Vpt5ZuoeqmlFdAvUvhyudvNuHz+H2HF4/lBYcxtXq3jTZjrx1YRqwALYLwcI=
X-Received: by 2002:a6b:f101:: with SMTP id e1mr2841276iog.118.1627022980409; 
 Thu, 22 Jul 2021 23:49:40 -0700 (PDT)
MIME-Version: 1.0
References: <5ebc64a6885af5cc3812beb71621cb7615556a1e.1626247467.git.alistair.francis@wdc.com>
 <78eb66f16d6096a60479759e2c1deb524c39757e.1626247467.git.alistair.francis@wdc.com>
 <CAEUhbmUKULm0kc8xeKyh+4uUT+fBW6juRh7mmVSB+uD56rxuKw@mail.gmail.com>
In-Reply-To: <CAEUhbmUKULm0kc8xeKyh+4uUT+fBW6juRh7mmVSB+uD56rxuKw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 23 Jul 2021 16:49:14 +1000
Message-ID: <CAKmqyKOPns5F6Na0VOBaBuH+rXzU=CDrxV7=XWAH+bYGfN1kYQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] hw/intc: ibex_timer: Convert the timer to use
 RISC-V CPU GPIO lines
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Fri, 23 Jul 2021 06:49:43 -0000

On Thu, Jul 15, 2021 at 6:21 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Wed, Jul 14, 2021 at 3:25 PM Alistair Francis
> <alistair.francis@wdc.com> wrote:
> >
> > Instead of using riscv_cpu_update_mip() let's instead use the new RISC-=
V
> > CPU GPIO lines to set the timer MIP bits.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  include/hw/timer/ibex_timer.h |  2 ++
> >  hw/riscv/opentitan.c          |  3 +++
> >  hw/timer/ibex_timer.c         | 17 ++++++++++++-----
> >  3 files changed, 17 insertions(+), 5 deletions(-)
> >
> > diff --git a/include/hw/timer/ibex_timer.h b/include/hw/timer/ibex_time=
r.h
> > index 6a43537003..b6f69b38ee 100644
> > --- a/include/hw/timer/ibex_timer.h
> > +++ b/include/hw/timer/ibex_timer.h
> > @@ -48,5 +48,7 @@ struct IbexTimerState {
> >      uint32_t timebase_freq;
> >
> >      qemu_irq irq;
> > +
> > +    qemu_irq m_timer_irq;
> >  };
> >  #endif /* HW_IBEX_TIMER_H */
> > diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> > index 88a0200972..fb0750c16f 100644
> > --- a/hw/riscv/opentitan.c
> > +++ b/hw/riscv/opentitan.c
> > @@ -176,6 +176,9 @@ static void lowrisc_ibex_soc_realize(DeviceState *d=
ev_soc, Error **errp)
> >      sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer),
> >                         0, qdev_get_gpio_in(DEVICE(&s->plic),
> >                         IBEX_TIMER_TIMEREXPIRED0_0));
> > +    qdev_connect_gpio_out_named(DEVICE(&s->timer), NULL, 0,
>
> nits: use qdev_connect_gpio_out
>
> > +                                qdev_get_gpio_in(DEVICE(qemu_get_cpu(0=
)),
>
> Does this timer device only support one CPU?

Yes, it does.

Alistair

>
> > +                                                 IRQ_M_TIMER));
> >
> >      create_unimplemented_device("riscv.lowrisc.ibex.gpio",
> >          memmap[IBEX_DEV_GPIO].base, memmap[IBEX_DEV_GPIO].size);
> > diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c
> > index 5befb53506..66e1f8e48c 100644
> > --- a/hw/timer/ibex_timer.c
> > +++ b/hw/timer/ibex_timer.c
> > @@ -77,7 +77,7 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
> >          /*
> >           * If the mtimecmp was in the past raise the interrupt now.
> >           */
> > -        riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
> > +        qemu_irq_raise(s->m_timer_irq);
> >          if (s->timer_intr_enable & R_INTR_ENABLE_IE_0_MASK) {
> >              s->timer_intr_state |=3D R_INTR_STATE_IS_0_MASK;
> >              qemu_set_irq(s->irq, true);
> > @@ -86,7 +86,7 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
> >      }
> >
> >      /* Setup a timer to trigger the interrupt in the future */
> > -    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(0));
> > +    qemu_irq_lower(s->m_timer_irq);
> >      qemu_set_irq(s->irq, false);
> >
> >      diff =3D cpu->env.timecmp - now;
> > @@ -106,10 +106,8 @@ static void ibex_timer_update_irqs(IbexTimerState =
*s)
> >  static void ibex_timer_cb(void *opaque)
> >  {
> >      IbexTimerState *s =3D opaque;
> > -    CPUState *cs =3D qemu_get_cpu(0);
> > -    RISCVCPU *cpu =3D RISCV_CPU(cs);
> >
> > -    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
> > +    qemu_irq_raise(s->m_timer_irq);
> >      if (s->timer_intr_enable & R_INTR_ENABLE_IE_0_MASK) {
> >          s->timer_intr_state |=3D R_INTR_STATE_IS_0_MASK;
> >          qemu_set_irq(s->irq, true);
> > @@ -280,12 +278,21 @@ static void ibex_timer_init(Object *obj)
> >      sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
> >  }
> >
> > +static void ibex_timer_realize(DeviceState *dev, Error **errp)
> > +{
> > +    IbexTimerState *s =3D IBEX_TIMER(dev);
> > +
> > +    qdev_init_gpio_out(dev, &s->m_timer_irq, 1);
> > +}
> > +
> > +
> >  static void ibex_timer_class_init(ObjectClass *klass, void *data)
> >  {
> >      DeviceClass *dc =3D DEVICE_CLASS(klass);
> >
> >      dc->reset =3D ibex_timer_reset;
> >      dc->vmsd =3D &vmstate_ibex_timer;
> > +    dc->realize =3D ibex_timer_realize;
> >      device_class_set_props(dc, ibex_timer_properties);
> >  }
> >
>
> Regards,
> Bin

