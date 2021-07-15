Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m3wcr-0001G5-05
	for mharc-qemu-riscv@gnu.org; Thu, 15 Jul 2021 04:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m3wcj-0000w2-Di; Thu, 15 Jul 2021 04:21:38 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:45829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m3wcf-0007ay-S6; Thu, 15 Jul 2021 04:21:37 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id k184so7686457ybf.12;
 Thu, 15 Jul 2021 01:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dJddGFByf9kXpyhdOg9rWzH/44q2J3a22Xe9/LYnjLs=;
 b=J/lnP49CUf9HsXjKeKKS0sGu4TapCI6tNg/B9qtwHjXjd6wMYYEdf+nWa3P93nhDns
 y6GjoxSyBZDm0KlK7c5Rw08cEKlV2MQtpVA6xIEN8NhqcM0nV6D4vOIOfhr6i0sRx+ef
 I9umxLQBE695NLjKx3aHJgaxjZp21L1yIxN/K6lFcqNA17sT4Tny/jP1G1OJpTOHtgc/
 sd4wE95FOSTb9gotLCZyh+eE/MyisCu2GJEdEMs4kjj+YD65HYrFQ4sLic713/5LYoUo
 c+ING/xJ2iymGbMFD3Itposg/5qi4tgpjAEeA0V4sLafvhaLa/gqz87JedSmT3vBSXyX
 Qocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dJddGFByf9kXpyhdOg9rWzH/44q2J3a22Xe9/LYnjLs=;
 b=gkoO1GW5M5SBWyw4GwlUmqNucRkrY62MWSoSwEGbqXpcRWzHyDYAe+ShnyM6xaeqfp
 ScYbdnxwKKTjiYHEcX0PSL5OfsIbzXM/Hyh67mtfFDQmaoSrwCvgwVFlHEnEsRuZ2nfA
 pk0wFOqPVCnieEJZtOdRZPf1vtt4YnnSLfpWdPB+ioZnCODodbfHrMWK+A+QNg9quFSc
 4I4oeV1+8z/rN0mblVnoY6AI4QdvsgGCLZhuNnvNq0tboAHs/VC9A/Azp0y7j7qbNZ36
 6Fpskrg2UyyZ85DAMTEunLtlcZozd43w2sLmDhUWLnf8ivbGNOY3dkf4JvWjqPp0DDag
 yIrQ==
X-Gm-Message-State: AOAM533MuML0z4CYGUr7sv2blDmJILLlNOUiPWlWbJMETPlucVyc07rR
 M5NwRyKa19WLtWbM+EG+KQA0d68XrFDzHnH2FxU=
X-Google-Smtp-Source: ABdhPJz9Vse7kiGv08prYmTXEHqYEjZGwc0XRn+5DaoLexLiPEHZLI4o/lX5ZFP3CgQx7WB/+gLh7lPTmcHeuxKL6hE=
X-Received: by 2002:a25:be09:: with SMTP id h9mr3899461ybk.239.1626337292727; 
 Thu, 15 Jul 2021 01:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <5ebc64a6885af5cc3812beb71621cb7615556a1e.1626247467.git.alistair.francis@wdc.com>
 <569c788eabb3729d561635f17a03fc21d4effc8b.1626247467.git.alistair.francis@wdc.com>
In-Reply-To: <569c788eabb3729d561635f17a03fc21d4effc8b.1626247467.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 15 Jul 2021 16:21:21 +0800
Message-ID: <CAEUhbmXTbJ1mXrYoLV6FFq133HcN9GhD9cogPg+buWNOUJBvPw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] hw/intc: ibex_plic: Convert the PLIC to use RISC-V
 CPU GPIO lines
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
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
X-List-Received-Date: Thu, 15 Jul 2021 08:21:40 -0000

On Wed, Jul 14, 2021 at 3:25 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Instead of using riscv_cpu_update_mip() let's instead use the new RISC-V
> CPU GPIO lines to set the external MIP bits.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/hw/intc/ibex_plic.h |  2 ++
>  hw/intc/ibex_plic.c         | 17 ++++++-----------
>  hw/riscv/opentitan.c        |  8 ++++++++
>  3 files changed, 16 insertions(+), 11 deletions(-)
>
> diff --git a/include/hw/intc/ibex_plic.h b/include/hw/intc/ibex_plic.h
> index 7fc495db99..d596436e06 100644
> --- a/include/hw/intc/ibex_plic.h
> +++ b/include/hw/intc/ibex_plic.h
> @@ -60,6 +60,8 @@ struct IbexPlicState {
>      uint32_t threshold_base;
>
>      uint32_t claim_base;
> +
> +    qemu_irq *external_irqs;
>  };
>
>  #endif /* HW_IBEX_PLIC_H */
> diff --git a/hw/intc/ibex_plic.c b/hw/intc/ibex_plic.c
> index edf76e4f61..ff430356f8 100644
> --- a/hw/intc/ibex_plic.c
> +++ b/hw/intc/ibex_plic.c
> @@ -27,6 +27,7 @@
>  #include "target/riscv/cpu_bits.h"
>  #include "target/riscv/cpu.h"
>  #include "hw/intc/ibex_plic.h"
> +#include "hw/irq.h"
>
>  static bool addr_between(uint32_t addr, uint32_t base, uint32_t num)
>  {
> @@ -92,19 +93,10 @@ static bool ibex_plic_irqs_pending(IbexPlicState *s, =
uint32_t context)
>
>  static void ibex_plic_update(IbexPlicState *s)
>  {
> -    CPUState *cpu;
> -    int level, i;
> +    int i;
>
>      for (i =3D 0; i < s->num_cpus; i++) {
> -        cpu =3D qemu_get_cpu(i);
> -
> -        if (!cpu) {
> -            continue;
> -        }
> -
> -        level =3D ibex_plic_irqs_pending(s, 0);
> -
> -        riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MEIP, BOOL_TO_MASK(leve=
l));
> +        qemu_set_irq(s->external_irqs[i], ibex_plic_irqs_pending(s, 0));
>      }
>  }
>
> @@ -268,6 +260,9 @@ static void ibex_plic_realize(DeviceState *dev, Error=
 **errp)
>
>      qdev_init_gpio_in(dev, ibex_plic_irq_request, s->num_sources);
>
> +    s->external_irqs =3D g_malloc(sizeof(qemu_irq) * s->num_cpus);
> +    qdev_init_gpio_out(dev, s->external_irqs, s->num_cpus);
> +
>      /*
>       * We can't allow the supervisor to control SEIP as this would allow=
 the
>       * supervisor to clear a pending external interrupt which will resul=
t in
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index c5a7e3bacb..88a0200972 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -116,6 +116,7 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev=
_soc, Error **errp)
>      MachineState *ms =3D MACHINE(qdev_get_machine());
>      LowRISCIbexSoCState *s =3D RISCV_IBEX_SOC(dev_soc);
>      MemoryRegion *sys_mem =3D get_system_memory();
> +    int i;
>
>      object_property_set_str(OBJECT(&s->cpus), "cpu-type", ms->cpu_type,
>                              &error_abort);
> @@ -142,6 +143,13 @@ static void lowrisc_ibex_soc_realize(DeviceState *de=
v_soc, Error **errp)
>      }
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->plic), 0, memmap[IBEX_DEV_PLIC].b=
ase);
>
> +    for (i =3D 0; i < ms->smp.cpus; i++) {
> +        CPUState *cpu =3D qemu_get_cpu(i);
> +
> +        qdev_connect_gpio_out_named(DEVICE(&s->plic), NULL, 0,

I think this should be: qdev_connect_gpio(DEVICE(&s->plic), NULL, i,

> +                                    qdev_get_gpio_in(DEVICE(cpu), IRQ_M_=
EXT));
> +    }
> +
>      /* UART */
>      qdev_prop_set_chr(DEVICE(&(s->uart)), "chardev", serial_hd(0));
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->uart), errp)) {

Regards,
Bin

