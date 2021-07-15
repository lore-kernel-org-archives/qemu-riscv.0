Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m3wd3-0002KX-Nd
	for mharc-qemu-riscv@gnu.org; Thu, 15 Jul 2021 04:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m3wd1-0002Bq-Q7; Thu, 15 Jul 2021 04:21:55 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:36497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m3wd0-0007rg-06; Thu, 15 Jul 2021 04:21:55 -0400
Received: by mail-yb1-xb31.google.com with SMTP id v189so7770279ybg.3;
 Thu, 15 Jul 2021 01:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BfiXfXKTErfn1gaJS0X7zvEh4RsL0n5NHPiDERzs+aE=;
 b=M8qXxwgD3AbgBiSHWje1o1EXxKynOg4C4cPKTSi4Av59s4NiZyNy9RhAY/fzQklf4u
 vEzT4fXWrgMWKLm81fSXiE4QMmt/MaifVxAeA74g6M8abfcvX5RugZ4dIIiHWppjmraC
 ofiVOKqJ5Yl+zm1hkeTSjasAItevTrE/mAYupYu60PpIiDPS22SFKc03pVc1QcxW9zJs
 rRqIx1lbH7FwEmUIaEjTKNC0AalP27F1ZyZoNL1Tr1EqYAtfJ5n82rWA1RPCQfzesone
 qsSJmP8GrYVaCi7Ii0zU2mYMPAwodEByKt7hplvAyGQlSFckVvJTZp0Mh8hojTzEvJdL
 bk+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BfiXfXKTErfn1gaJS0X7zvEh4RsL0n5NHPiDERzs+aE=;
 b=B54Jp4KBJJkfPR14TqcUBNYfKb/J41FFJyTsTiGxhNqHriCe4BN8rJTd3RKU81ofGI
 /bW5ONymUIbh7g7Wb9m9ZFlMnKT/elJ+gPffM52iNWY3gw6rrBZHCXQDXIOcqqvHgW4n
 GOqJ+LF4krtFNoiEyticlRZ6RLVVCOoMmPmUcckY6CCpvbXYeIRK6oy/RAm2/mIFCA5q
 PddhWoFn7A4TivCT2lHORtcw5It3RBEb9DCznlXnFdQoi8PC86bpeX6HSQiCxP/CxiXU
 8piVt7jkhQnCWni5dyicm5JfgEmSlHIA860Glkbb4NdK1SX/O9sDw71PtUI4kd5CEvxN
 aO5A==
X-Gm-Message-State: AOAM530rSWfsSXaHckCAuZ+iCxurR37nLmI8tl8ozQl8jhEJUZx0G8jP
 i7F40mybmmoqWltyY5tENUaPSHhhsS45KSXW+iU=
X-Google-Smtp-Source: ABdhPJy52fW5rwKVp0e3JkSyJYtXKv5gvpyHSLIUNqVYQQUHNU2bv94HkmqdMmTaTra5tLTQctPP/YCy8Yjh2ANoCaQ=
X-Received: by 2002:a25:6c04:: with SMTP id h4mr3853250ybc.122.1626337312789; 
 Thu, 15 Jul 2021 01:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <5ebc64a6885af5cc3812beb71621cb7615556a1e.1626247467.git.alistair.francis@wdc.com>
 <78eb66f16d6096a60479759e2c1deb524c39757e.1626247467.git.alistair.francis@wdc.com>
In-Reply-To: <78eb66f16d6096a60479759e2c1deb524c39757e.1626247467.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 15 Jul 2021 16:21:41 +0800
Message-ID: <CAEUhbmUKULm0kc8xeKyh+4uUT+fBW6juRh7mmVSB+uD56rxuKw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] hw/intc: ibex_timer: Convert the timer to use
 RISC-V CPU GPIO lines
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 15 Jul 2021 08:21:56 -0000

On Wed, Jul 14, 2021 at 3:25 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Instead of using riscv_cpu_update_mip() let's instead use the new RISC-V
> CPU GPIO lines to set the timer MIP bits.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/hw/timer/ibex_timer.h |  2 ++
>  hw/riscv/opentitan.c          |  3 +++
>  hw/timer/ibex_timer.c         | 17 ++++++++++++-----
>  3 files changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/include/hw/timer/ibex_timer.h b/include/hw/timer/ibex_timer.=
h
> index 6a43537003..b6f69b38ee 100644
> --- a/include/hw/timer/ibex_timer.h
> +++ b/include/hw/timer/ibex_timer.h
> @@ -48,5 +48,7 @@ struct IbexTimerState {
>      uint32_t timebase_freq;
>
>      qemu_irq irq;
> +
> +    qemu_irq m_timer_irq;
>  };
>  #endif /* HW_IBEX_TIMER_H */
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index 88a0200972..fb0750c16f 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -176,6 +176,9 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev=
_soc, Error **errp)
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer),
>                         0, qdev_get_gpio_in(DEVICE(&s->plic),
>                         IBEX_TIMER_TIMEREXPIRED0_0));
> +    qdev_connect_gpio_out_named(DEVICE(&s->timer), NULL, 0,

nits: use qdev_connect_gpio_out

> +                                qdev_get_gpio_in(DEVICE(qemu_get_cpu(0))=
,

Does this timer device only support one CPU?

> +                                                 IRQ_M_TIMER));
>
>      create_unimplemented_device("riscv.lowrisc.ibex.gpio",
>          memmap[IBEX_DEV_GPIO].base, memmap[IBEX_DEV_GPIO].size);
> diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c
> index 5befb53506..66e1f8e48c 100644
> --- a/hw/timer/ibex_timer.c
> +++ b/hw/timer/ibex_timer.c
> @@ -77,7 +77,7 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
>          /*
>           * If the mtimecmp was in the past raise the interrupt now.
>           */
> -        riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
> +        qemu_irq_raise(s->m_timer_irq);
>          if (s->timer_intr_enable & R_INTR_ENABLE_IE_0_MASK) {
>              s->timer_intr_state |=3D R_INTR_STATE_IS_0_MASK;
>              qemu_set_irq(s->irq, true);
> @@ -86,7 +86,7 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
>      }
>
>      /* Setup a timer to trigger the interrupt in the future */
> -    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(0));
> +    qemu_irq_lower(s->m_timer_irq);
>      qemu_set_irq(s->irq, false);
>
>      diff =3D cpu->env.timecmp - now;
> @@ -106,10 +106,8 @@ static void ibex_timer_update_irqs(IbexTimerState *s=
)
>  static void ibex_timer_cb(void *opaque)
>  {
>      IbexTimerState *s =3D opaque;
> -    CPUState *cs =3D qemu_get_cpu(0);
> -    RISCVCPU *cpu =3D RISCV_CPU(cs);
>
> -    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
> +    qemu_irq_raise(s->m_timer_irq);
>      if (s->timer_intr_enable & R_INTR_ENABLE_IE_0_MASK) {
>          s->timer_intr_state |=3D R_INTR_STATE_IS_0_MASK;
>          qemu_set_irq(s->irq, true);
> @@ -280,12 +278,21 @@ static void ibex_timer_init(Object *obj)
>      sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
>  }
>
> +static void ibex_timer_realize(DeviceState *dev, Error **errp)
> +{
> +    IbexTimerState *s =3D IBEX_TIMER(dev);
> +
> +    qdev_init_gpio_out(dev, &s->m_timer_irq, 1);
> +}
> +
> +
>  static void ibex_timer_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>
>      dc->reset =3D ibex_timer_reset;
>      dc->vmsd =3D &vmstate_ibex_timer;
> +    dc->realize =3D ibex_timer_realize;
>      device_class_set_props(dc, ibex_timer_properties);
>  }
>

Regards,
Bin

