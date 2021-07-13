Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m3Aew-0006UV-VX
	for mharc-qemu-riscv@gnu.org; Tue, 13 Jul 2021 01:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1m3Aev-0006TA-Dw
 for qemu-riscv@nongnu.org; Tue, 13 Jul 2021 01:08:41 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1m3Aet-0004eF-EH
 for qemu-riscv@nongnu.org; Tue, 13 Jul 2021 01:08:41 -0400
Received: by mail-wr1-x429.google.com with SMTP id r11so23453405wro.9
 for <qemu-riscv@nongnu.org>; Mon, 12 Jul 2021 22:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hGKITZMuQWykn+nuptJW5bZMVk0A6lheh44dlerEhdw=;
 b=tSUvoN6dFPsBI1w9GwaRKDrMENRaEkCUyj/PBKcbP0HiEBvgP5ViSg1R1SUYONQ1DT
 94aLVoDpQ/z3xMyYVfCMPPZyZHbiB4oEfnnmXTYEWjXwbquW0mK1jeCVhesze0reB7qo
 qX7ebb0r9tGsWzT/qKWG3o212GPJ4YmmdHbNhBQ9BxvQ8Pko2VbT0jJvejgdKM6qIw1w
 XprOtKcwuyNpJTGPXIpaWf6XmFgYF3mYkw2Fk8JnJjH5M897MKV7umA32AlLgvdVIv7m
 1hvL4ZiBMpuq506Kxjmc2aWmukYWLQDe1025qAov1VOglBP/FSv5Nupv6lZLANh/X6di
 AgFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hGKITZMuQWykn+nuptJW5bZMVk0A6lheh44dlerEhdw=;
 b=ZuL73no67D62Q4mQr7YK8j4iXXzOWFh1w7xy58wdo6rLuev2ARvYozZskgjB5NkyJy
 Q03GE9g54xrf4AGzOFoAfR1/2jw0nbZ5e8JPrKeinmwfIfzBp1POY/RUzK5PsPjyIhj0
 H9ekizpABO4g5Pmfrwz7e/L1qKauvsE0M38fr7Te37WQBxI0cD7W6r9LlcYE7Ucsnhha
 bNUQep+2afU3WCg44tsky/NMDI0z0T94eRbJzBXXU7eZIpya0PidXvrztOEiprHplegr
 tjP/ndIvCaoCuDGc257+L2rz2ZswLx3bCh6l7Mk6rU0Ip/0ldOlYWnD3uGEnwxQz3Fuk
 OIcA==
X-Gm-Message-State: AOAM533mHZKGaoE/Zvxu0V5zAB13RJXvqxeIYDanoe3MXAuCJsguVEwD
 DT1mTAciRtTS9qyYK6YV50dCnEz9fyTdX3MNX4RRjg==
X-Google-Smtp-Source: ABdhPJxcQFEaZQjPFqrSPSNVWcbZucxcOPCuYx0w9iikvHhM/5e53hvTx+RUtdVjn0ot0GIo030/D6HvFAN5Uucshaw=
X-Received: by 2002:a5d:6e81:: with SMTP id k1mr3180625wrz.144.1626152917006; 
 Mon, 12 Jul 2021 22:08:37 -0700 (PDT)
MIME-Version: 1.0
References: <37f8680b1ae39de82f9594d8e7a0d9596de9be8b.1625801410.git.alistair.francis@wdc.com>
 <a5f2909ca7fd9637ad90da0be9661f1e718e3dc5.1625801410.git.alistair.francis@wdc.com>
In-Reply-To: <a5f2909ca7fd9637ad90da0be9661f1e718e3dc5.1625801410.git.alistair.francis@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 13 Jul 2021 10:38:25 +0530
Message-ID: <CAAhSdy3mFcQAjyAjoJO9rE4_rnxa3hVBNES6PzGNnpJWSj63NQ@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] hw/intc: sifive_plic: Convert the PLIC to use
 RISC-V CPU GPIO lines
To: Alistair Francis <alistair.francis@wdc.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::429;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 13 Jul 2021 05:08:41 -0000

On Fri, Jul 9, 2021 at 9:06 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Instead of using riscv_cpu_update_mip() let's instead use the new RISC-V
> CPU GPIO lines to set the external MIP bits.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/intc/sifive_plic.h |  4 ++++
>  hw/intc/sifive_plic.c         | 38 ++++++++++++++++++++++++++++-------
>  hw/riscv/microchip_pfsoc.c    |  2 +-
>  hw/riscv/shakti_c.c           |  3 ++-
>  hw/riscv/sifive_e.c           |  2 +-
>  hw/riscv/sifive_u.c           |  2 +-
>  hw/riscv/virt.c               |  3 ++-
>  7 files changed, 42 insertions(+), 12 deletions(-)
>
> diff --git a/include/hw/intc/sifive_plic.h b/include/hw/intc/sifive_plic.h
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
>  };
>
>  DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
> +    uint32_t num_harts,
>      uint32_t hartid_base, uint32_t num_sources,
>      uint32_t num_priorities, uint32_t priority_base,
>      uint32_t pending_base, uint32_t enable_base,
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index 78903beb06..dc17b55408 100644
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
> @@ -139,18 +140,22 @@ static void sifive_plic_update(SiFivePLICState *plic)
>      for (addrid = 0; addrid < plic->num_addrs; addrid++) {
>          uint32_t hartid = plic->addr_config[addrid].hartid;
>          PLICMode mode = plic->addr_config[addrid].mode;
> -        CPUState *cpu = qemu_get_cpu(hartid);
> -        CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
> -        if (!env) {
> -            continue;
> -        }
>          int level = sifive_plic_irqs_pending(plic, addrid);
> +
>          switch (mode) {
>          case PLICMode_M:
> -            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MEIP, BOOL_TO_MASK(level));
> +            if (level) {
> +                qemu_irq_raise(plic->m_external_irqs[hartid]);
> +            } else {
> +                qemu_irq_lower(plic->m_external_irqs[hartid]);
> +            }
>              break;
>          case PLICMode_S:
> -            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_SEIP, BOOL_TO_MASK(level));
> +            if (level) {
> +                qemu_irq_raise(plic->s_external_irqs[hartid]);
> +            } else {
> +                qemu_irq_lower(plic->s_external_irqs[hartid]);
> +            }
>              break;
>          default:
>              break;
> @@ -456,6 +461,12 @@ static void sifive_plic_realize(DeviceState *dev, Error **errp)
>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &plic->mmio);
>      qdev_init_gpio_in(dev, sifive_plic_irq_request, plic->num_sources);
>
> +    plic->s_external_irqs = g_malloc(sizeof(qemu_irq) * plic->num_harts);
> +    qdev_init_gpio_out(dev, plic->s_external_irqs, plic->num_harts);
> +
> +    plic->m_external_irqs = g_malloc(sizeof(qemu_irq) * plic->num_harts);
> +    qdev_init_gpio_out(dev, plic->m_external_irqs, plic->num_harts);
> +
>      /* We can't allow the supervisor to control SEIP as this would allow the
>       * supervisor to clear a pending external interrupt which will result in
>       * lost a interrupt in the case a PLIC is attached. The SEIP bit must be
> @@ -520,6 +531,7 @@ type_init(sifive_plic_register_types)
>   * Create PLIC device.
>   */
>  DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
> +    uint32_t num_harts,
>      uint32_t hartid_base, uint32_t num_sources,
>      uint32_t num_priorities, uint32_t priority_base,
>      uint32_t pending_base, uint32_t enable_base,
> @@ -527,6 +539,8 @@ DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
>      uint32_t context_stride, uint32_t aperture_size)
>  {
>      DeviceState *dev = qdev_new(TYPE_SIFIVE_PLIC);
> +    int i;
> +
>      assert(enable_stride == (enable_stride & -enable_stride));
>      assert(context_stride == (context_stride & -context_stride));
>      qdev_prop_set_string(dev, "hart-config", hart_config);
> @@ -542,5 +556,15 @@ DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
>      qdev_prop_set_uint32(dev, "aperture-size", aperture_size);
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
> +
> +    for (i = 0; i < num_harts; i++) {
> +        CPUState *cpu = qemu_get_cpu(hartid_base + i);
> +
> +        qdev_connect_gpio_out_named(dev, NULL, i,
> +                                    qdev_get_gpio_in(DEVICE(cpu), IRQ_S_EXT));
> +        qdev_connect_gpio_out_named(dev, NULL, num_harts + i,
> +                                    qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EXT));
> +    }
> +
>      return dev;
>  }
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index eb8e79e0a1..eef55f69fd 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -274,7 +274,7 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
>
>      /* PLIC */
>      s->plic = sifive_plic_create(memmap[MICROCHIP_PFSOC_PLIC].base,
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
> +    MachineState *ms = MACHINE(qdev_get_machine());
>      ShaktiCSoCState *sss = RISCV_SHAKTI_SOC(dev);
>      MemoryRegion *system_memory = get_system_memory();
>
>      sysbus_realize(SYS_BUS_DEVICE(&sss->cpus), &error_abort);
>
>      sss->plic = sifive_plic_create(shakti_c_memmap[SHAKTI_C_PLIC].base,
> -        (char *)SHAKTI_C_PLIC_HART_CONFIG, 0,
> +        (char *)SHAKTI_C_PLIC_HART_CONFIG, ms->smp.cpus, 0,
>          SHAKTI_C_PLIC_NUM_SOURCES,
>          SHAKTI_C_PLIC_NUM_PRIORITIES,
>          SHAKTI_C_PLIC_PRIORITY_BASE,
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index ddc658c8d6..03bff21527 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -198,7 +198,7 @@ static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
>
>      /* MMIO */
>      s->plic = sifive_plic_create(memmap[SIFIVE_E_DEV_PLIC].base,
> -        (char *)SIFIVE_E_PLIC_HART_CONFIG, 0,
> +        (char *)SIFIVE_E_PLIC_HART_CONFIG, ms->smp.cpus, 0,
>          SIFIVE_E_PLIC_NUM_SOURCES,
>          SIFIVE_E_PLIC_NUM_PRIORITIES,
>          SIFIVE_E_PLIC_PRIORITY_BASE,
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 273c86418c..6d1f9464c2 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -829,7 +829,7 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
>
>      /* MMIO */
>      s->plic = sifive_plic_create(memmap[SIFIVE_U_DEV_PLIC].base,
> -        plic_hart_config, 0,
> +        plic_hart_config, ms->smp.cpus, 0,
>          SIFIVE_U_PLIC_NUM_SOURCES,
>          SIFIVE_U_PLIC_NUM_PRIORITIES,
>          SIFIVE_U_PLIC_PRIORITY_BASE,
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 4a3cd2599a..8bbafae429 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -548,6 +548,7 @@ static void virt_machine_init(MachineState *machine)
>      MemoryRegion *system_memory = get_system_memory();
>      MemoryRegion *main_mem = g_new(MemoryRegion, 1);
>      MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
> +    MachineState *ms = MACHINE(qdev_get_machine());
>      char *plic_hart_config, *soc_name;
>      size_t plic_hart_config_len;
>      target_ulong start_addr = memmap[VIRT_DRAM].base;
> @@ -619,7 +620,7 @@ static void virt_machine_init(MachineState *machine)
>          /* Per-socket PLIC */
>          s->plic[i] = sifive_plic_create(
>              memmap[VIRT_PLIC].base + i * memmap[VIRT_PLIC].size,
> -            plic_hart_config, base_hartid,
> +            plic_hart_config, ms->smp.cpus, base_hartid,

Use "hart_count" instead of "ms->smp.cpus", otherwise it breaks multi-socket
support in virt machine.

>              VIRT_PLIC_NUM_SOURCES,
>              VIRT_PLIC_NUM_PRIORITIES,
>              VIRT_PLIC_PRIORITY_BASE,
> --
> 2.31.1
>
>

Regards,
Anup

