Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m3wct-0001Un-UD
	for mharc-qemu-riscv@gnu.org; Thu, 15 Jul 2021 04:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m3wcr-0001Ie-De; Thu, 15 Jul 2021 04:21:45 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:40661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m3wcp-0007ji-Eg; Thu, 15 Jul 2021 04:21:45 -0400
Received: by mail-yb1-xb33.google.com with SMTP id p22so7737508yba.7;
 Thu, 15 Jul 2021 01:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kcKms3E7D2OTx2ZJ+Y8HzAdPh2Cp1IbNVydl4clRSjs=;
 b=Mq2HUbDFiE0MRU3B0CCGLx0qNvw8UERpW6xjd4soUMgchY6X/IoA2FxpwSvJXst7Li
 xG9Nsf7d42d2IkOoCLTIoty7w5uLi8nhpyj5lGYV44GkcTYZfpb99JjIh1eG93JlcMt3
 NJERCVDY0bF4G9BkbwZmXx1Zmr7e41hYaDdBeRNlR91wRpoJO4Ov0Wj90LH10uzwEjOX
 c+fX0CM/shuym34Yn9bY/m/fZ+4dgiCtcp+0oVAGXCG3LH9OpRZkLvZjJvcok5YDK14t
 N9vCMjw/drAt+HpvKSCYFt9Z3BTfzUuNuFZ4nou9oD8wyyRnXmEi4ZJOghnmjb0XwMRm
 qtEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kcKms3E7D2OTx2ZJ+Y8HzAdPh2Cp1IbNVydl4clRSjs=;
 b=HMN1kordTdCCFWtpFIFDdNexVPAdQShD6q+4SJZ/vF1O2HWqDZAJcMRs5cYCePqN0c
 LK/1LngkcjJx0vhHOJtD5plInRqhAvkSW10YEJ7Mlc05cTDRul74E3SajUAua1AuDjMb
 BhKtn6hLtI8LHMNjh290cuxb6YZIIoGBD8iJzRZCl3PC0eqIQ9poKZOt9ZtWjfmDkCWI
 qs8OmR0d8XYhg02J8yXqppcj8X2Hv5/aVUry9iyMjBAdNBAtGKtKPavtWq9yau1ZOzU0
 auab6qGEWt5FylO6/9OgC+ynFfgYzTER0oCGOF3SprIm4EekKsFVtEGiLKnC9jyjUUQt
 yqKw==
X-Gm-Message-State: AOAM530oKz+Jg/oMf6lne85c+6hTLgCpuZE7T+g7EXJiEpnC9FdgtEwd
 Wvhsuc1oMHaW0dq5xF5nxvqkYduyO/b31v/WC2Q=
X-Google-Smtp-Source: ABdhPJx5UzKV5irJxDg3f04JpYyoRy5/2IBFJfeOa+ZS92yQYoAkK3Q1xQyPjTJR2D9C7Q05c2+J63v9nfvptDBNkHc=
X-Received: by 2002:a25:2c01:: with SMTP id s1mr4066088ybs.387.1626337302333; 
 Thu, 15 Jul 2021 01:21:42 -0700 (PDT)
MIME-Version: 1.0
References: <5ebc64a6885af5cc3812beb71621cb7615556a1e.1626247467.git.alistair.francis@wdc.com>
 <389a6f1d9b73c6a8ee7c2e62c8324ee0dc135302.1626247467.git.alistair.francis@wdc.com>
In-Reply-To: <389a6f1d9b73c6a8ee7c2e62c8324ee0dc135302.1626247467.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 15 Jul 2021 16:21:30 +0800
Message-ID: <CAEUhbmWxO7JKWs81oCBhhvP+soEutEkvJ52j_fir4XMq6d6AkA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] hw/intc: sifive_plic: Convert the PLIC to use
 RISC-V CPU GPIO lines
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb33.google.com
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
X-List-Received-Date: Thu, 15 Jul 2021 08:21:46 -0000

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
>  include/hw/intc/sifive_plic.h |  4 ++++
>  hw/intc/sifive_plic.c         | 30 +++++++++++++++++++++++-------
>  hw/riscv/microchip_pfsoc.c    |  2 +-
>  hw/riscv/shakti_c.c           |  3 ++-
>  hw/riscv/sifive_e.c           |  2 +-
>  hw/riscv/sifive_u.c           |  2 +-
>  hw/riscv/virt.c               |  2 +-
>  7 files changed, 33 insertions(+), 12 deletions(-)
>
> diff --git a/include/hw/intc/sifive_plic.h b/include/hw/intc/sifive_plic.=
h
> index 1e451a270c..da1dc64c6d 100644
> --- a/include/hw/intc/sifive_plic.h
> +++ b/include/hw/intc/sifive_plic.h
> @@ -72,9 +72,13 @@ struct SiFivePLICState {
>      uint32_t context_base;
>      uint32_t context_stride;
>      uint32_t aperture_size;
> +
> +    qemu_irq *s_external_irqs;
> +    qemu_irq *m_external_irqs;

nits: it's better we put M-mode IRQs before S-mode IRQs.

>  };
>
>  DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
> +    uint32_t num_harts,
>      uint32_t hartid_base, uint32_t num_sources,
>      uint32_t num_priorities, uint32_t priority_base,
>      uint32_t pending_base, uint32_t enable_base,
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index 78903beb06..7a795f0a61 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -29,6 +29,7 @@
>  #include "hw/intc/sifive_plic.h"
>  #include "target/riscv/cpu.h"
>  #include "migration/vmstate.h"
> +#include "hw/irq.h"
>
>  #define RISCV_DEBUG_PLIC 0
>
> @@ -139,18 +140,14 @@ static void sifive_plic_update(SiFivePLICState *pli=
c)
>      for (addrid =3D 0; addrid < plic->num_addrs; addrid++) {
>          uint32_t hartid =3D plic->addr_config[addrid].hartid;
>          PLICMode mode =3D plic->addr_config[addrid].mode;
> -        CPUState *cpu =3D qemu_get_cpu(hartid);
> -        CPURISCVState *env =3D cpu ? cpu->env_ptr : NULL;
> -        if (!env) {
> -            continue;
> -        }
>          int level =3D sifive_plic_irqs_pending(plic, addrid);
> +
>          switch (mode) {
>          case PLICMode_M:
> -            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MEIP, BOOL_TO_MASK(=
level));
> +            qemu_set_irq(plic->m_external_irqs[hartid - plic->hartid_bas=
e], level);
>              break;
>          case PLICMode_S:
> -            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_SEIP, BOOL_TO_MASK(=
level));
> +            qemu_set_irq(plic->s_external_irqs[hartid - plic->hartid_bas=
e], level);
>              break;
>          default:
>              break;
> @@ -456,6 +453,12 @@ static void sifive_plic_realize(DeviceState *dev, Er=
ror **errp)
>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &plic->mmio);
>      qdev_init_gpio_in(dev, sifive_plic_irq_request, plic->num_sources);
>
> +    plic->s_external_irqs =3D g_malloc(sizeof(qemu_irq) * plic->num_hart=
s);
> +    qdev_init_gpio_out(dev, plic->s_external_irqs, plic->num_harts);
> +
> +    plic->m_external_irqs =3D g_malloc(sizeof(qemu_irq) * plic->num_hart=
s);
> +    qdev_init_gpio_out(dev, plic->m_external_irqs, plic->num_harts);
> +
>      /* We can't allow the supervisor to control SEIP as this would allow=
 the
>       * supervisor to clear a pending external interrupt which will resul=
t in
>       * lost a interrupt in the case a PLIC is attached. The SEIP bit mus=
t be
> @@ -520,6 +523,7 @@ type_init(sifive_plic_register_types)
>   * Create PLIC device.
>   */
>  DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
> +    uint32_t num_harts,
>      uint32_t hartid_base, uint32_t num_sources,
>      uint32_t num_priorities, uint32_t priority_base,
>      uint32_t pending_base, uint32_t enable_base,
> @@ -527,6 +531,8 @@ DeviceState *sifive_plic_create(hwaddr addr, char *ha=
rt_config,
>      uint32_t context_stride, uint32_t aperture_size)
>  {
>      DeviceState *dev =3D qdev_new(TYPE_SIFIVE_PLIC);
> +    int i;
> +
>      assert(enable_stride =3D=3D (enable_stride & -enable_stride));
>      assert(context_stride =3D=3D (context_stride & -context_stride));
>      qdev_prop_set_string(dev, "hart-config", hart_config);
> @@ -542,5 +548,15 @@ DeviceState *sifive_plic_create(hwaddr addr, char *h=
art_config,
>      qdev_prop_set_uint32(dev, "aperture-size", aperture_size);
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
> +
> +    for (i =3D 0; i < num_harts; i++) {
> +        CPUState *cpu =3D qemu_get_cpu(hartid_base + i);
> +
> +        qdev_connect_gpio_out_named(dev, NULL, i,

nits: use qdev_connect_gpio_out

> +                                    qdev_get_gpio_in(DEVICE(cpu), IRQ_S_=
EXT));
> +        qdev_connect_gpio_out_named(dev, NULL, num_harts + i,
> +                                    qdev_get_gpio_in(DEVICE(cpu), IRQ_M_=
EXT));
> +    }
> +
>      return dev;
>  }
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index eb8e79e0a1..eef55f69fd 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -274,7 +274,7 @@ static void microchip_pfsoc_soc_realize(DeviceState *=
dev, Error **errp)
>
>      /* PLIC */
>      s->plic =3D sifive_plic_create(memmap[MICROCHIP_PFSOC_PLIC].base,
> -        plic_hart_config, 0,
> +        plic_hart_config, ms->smp.cpus, 0,
>          MICROCHIP_PFSOC_PLIC_NUM_SOURCES,
>          MICROCHIP_PFSOC_PLIC_NUM_PRIORITIES,
>          MICROCHIP_PFSOC_PLIC_PRIORITY_BASE,
> diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
> index 18f70fadaa..09d4e1433e 100644
> --- a/hw/riscv/shakti_c.c
> +++ b/hw/riscv/shakti_c.c
> @@ -106,13 +106,14 @@ type_init(shakti_c_machine_type_info_register)
>
>  static void shakti_c_soc_state_realize(DeviceState *dev, Error **errp)
>  {
> +    MachineState *ms =3D MACHINE(qdev_get_machine());
>      ShaktiCSoCState *sss =3D RISCV_SHAKTI_SOC(dev);
>      MemoryRegion *system_memory =3D get_system_memory();
>
>      sysbus_realize(SYS_BUS_DEVICE(&sss->cpus), &error_abort);
>
>      sss->plic =3D sifive_plic_create(shakti_c_memmap[SHAKTI_C_PLIC].base=
,
> -        (char *)SHAKTI_C_PLIC_HART_CONFIG, 0,
> +        (char *)SHAKTI_C_PLIC_HART_CONFIG, ms->smp.cpus, 0,
>          SHAKTI_C_PLIC_NUM_SOURCES,
>          SHAKTI_C_PLIC_NUM_PRIORITIES,
>          SHAKTI_C_PLIC_PRIORITY_BASE,
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index ddc658c8d6..03bff21527 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -198,7 +198,7 @@ static void sifive_e_soc_realize(DeviceState *dev, Er=
ror **errp)
>
>      /* MMIO */
>      s->plic =3D sifive_plic_create(memmap[SIFIVE_E_DEV_PLIC].base,
> -        (char *)SIFIVE_E_PLIC_HART_CONFIG, 0,
> +        (char *)SIFIVE_E_PLIC_HART_CONFIG, ms->smp.cpus, 0,
>          SIFIVE_E_PLIC_NUM_SOURCES,
>          SIFIVE_E_PLIC_NUM_PRIORITIES,
>          SIFIVE_E_PLIC_PRIORITY_BASE,
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 273c86418c..6d1f9464c2 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -829,7 +829,7 @@ static void sifive_u_soc_realize(DeviceState *dev, Er=
ror **errp)
>
>      /* MMIO */
>      s->plic =3D sifive_plic_create(memmap[SIFIVE_U_DEV_PLIC].base,
> -        plic_hart_config, 0,
> +        plic_hart_config, ms->smp.cpus, 0,
>          SIFIVE_U_PLIC_NUM_SOURCES,
>          SIFIVE_U_PLIC_NUM_PRIORITIES,
>          SIFIVE_U_PLIC_PRIORITY_BASE,
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 4a3cd2599a..4db40bacae 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -619,7 +619,7 @@ static void virt_machine_init(MachineState *machine)
>          /* Per-socket PLIC */
>          s->plic[i] =3D sifive_plic_create(
>              memmap[VIRT_PLIC].base + i * memmap[VIRT_PLIC].size,
> -            plic_hart_config, base_hartid,
> +            plic_hart_config, hart_count, base_hartid,
>              VIRT_PLIC_NUM_SOURCES,
>              VIRT_PLIC_NUM_PRIORITIES,
>              VIRT_PLIC_PRIORITY_BASE,

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>

