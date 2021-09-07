Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mNjqJ-0001kZ-BD
	for mharc-qemu-riscv@gnu.org; Tue, 07 Sep 2021 18:45:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mNjqD-0001k4-53; Tue, 07 Sep 2021 18:45:21 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:40923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mNjqB-0001R3-4B; Tue, 07 Sep 2021 18:45:20 -0400
Received: by mail-il1-x133.google.com with SMTP id a20so277032ilq.7;
 Tue, 07 Sep 2021 15:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CHMaAy/JFWUxyakTODorvN54HoTBpm8agQBfjxlDtrc=;
 b=gPs8Bebvh5a4jBIST02RHpsO38LG94qBpILC4nQ2rG5Of3oNlFMphRKdywHC7aBWO/
 nhiq/JDgFU/0Fwdc288HwI5lbOZ4wmfiMc8ytIbkErpmw38Q5637drLyqc4UmNZt6UxD
 mSOr9yS7usUyX47L3fVcyEnZaTBU759N3T+C4YePFXPeeYc/f3vnyryhRg2q60WpH1QR
 1SE0l4jibiftvkyF8dh8re8E+WIMMrQoeCfEMuG8PItYI3Z6wbfiAHt8bZIhGO9Dwrt6
 CoySB1WJWT8WgCa2ZlUesmvnHw53By7jIsi/MucpUmPVGbKIehD9hAHKf7lFKrhlSCpT
 j6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CHMaAy/JFWUxyakTODorvN54HoTBpm8agQBfjxlDtrc=;
 b=VWKV04PQ+YhCf+7AjEXZ90HOy3q4BPU+QpmRe1IsnxaQfvHvehQY3/nUQezbt6c7Ao
 88ZjqyjFwKPzD5MZyQpUthjY6qduNB3ReUBtyRFEzH7yFSTeeXwEmhJmzRe6EdV7k1QL
 kuSlBHqJeCd7J2vVstGHyJzw3Xn7jqCd+EbAdQf3kTSE2hgROJ5ShJ97tIpbus6cpyXe
 t48REnqzkzZiND0sNK9Au7lwpyzSvHv/b879ewOaby5Jv+GzCcK7La++/qIRgDgb9FSC
 947JxMScBpQNJ1Ytp5/1EoTtgWYRwI4kfb4vZeINN/H0wktOFE5slqGj7I/QuY5AWv0h
 SGVw==
X-Gm-Message-State: AOAM533GAl4AOMSazshQcSwffYEfTdiMSsAHKVqYH8PLDAh4TvqoVgFs
 /9/g8J1cKYtVA9skDTutKu3mkbWUB0X9Rltxejo=
X-Google-Smtp-Source: ABdhPJyLQHtWmvqo5YE0rNTFU9SCj5viWGlWOZfaWwUyBrXvju83Hjoo2d3iEPyvUjrBs1W0KLM0RwO+8ipW2j+OglA=
X-Received: by 2002:a92:2a04:: with SMTP id r4mr412249ile.221.1631054714919;
 Tue, 07 Sep 2021 15:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <069d6162f0bc2f4a4f5a44e73f6442b11c703c53.1630301632.git.alistair.francis@wdc.com>
 <84d5b1d5783d2e79eee69a2f7ac480cc0c070db3.1630301632.git.alistair.francis@wdc.com>
In-Reply-To: <84d5b1d5783d2e79eee69a2f7ac480cc0c070db3.1630301632.git.alistair.francis@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 8 Sep 2021 08:44:49 +1000
Message-ID: <CAKmqyKMBAm0L-NfEQr2j=t-fMBxoLT-SdEOYhkJLjuE-_tKcXA@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] hw/intc: ibex_timer: Convert the timer to use
 RISC-V CPU GPIO lines
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x133.google.com
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
X-List-Received-Date: Tue, 07 Sep 2021 22:45:22 -0000

On Mon, Aug 30, 2021 at 3:36 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Instead of using riscv_cpu_update_mip() let's instead use the new RISC-V
> CPU GPIO lines to set the timer MIP bits.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks!

Applied to riscv-to-apply.next

Alistair

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
> index 048aced0ec..f7cfcf1c3a 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -183,6 +183,9 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev=
_soc, Error **errp)
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer),
>                         0, qdev_get_gpio_in(DEVICE(&s->plic),
>                         IBEX_TIMER_TIMEREXPIRED0_0));
> +    qdev_connect_gpio_out(DEVICE(&s->timer), 0,
> +                          qdev_get_gpio_in(DEVICE(qemu_get_cpu(0)),
> +                                           IRQ_M_TIMER));
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
> --
> 2.31.1
>

