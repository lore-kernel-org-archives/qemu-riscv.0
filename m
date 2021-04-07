Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lU8eL-0001V1-Id
	for mharc-qemu-riscv@gnu.org; Wed, 07 Apr 2021 09:55:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lU8eI-0001PG-2a; Wed, 07 Apr 2021 09:55:14 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:44649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lU8eD-0008KD-83; Wed, 07 Apr 2021 09:55:13 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id j206so11584427ybj.11;
 Wed, 07 Apr 2021 06:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GDEUoA2LjeUR3a6vBTacgTKP097lWdZLq2KQ6M1GuB4=;
 b=JbhvoZTGCaxjlYmHSjqieDUCCe07FMhOAqB30hqk8KWpcZcZ0+BdwCP3RM/D9b1Bbx
 sikaogaAVb72zRtVvhcpepAVTTXrqzbIXCNDHZIXtMA4hsD/1WrWnOErNmG9aFFd2Wvr
 6GVGKRJ6RSRpd4D1ZRzGH/zfpr2mAdA9phnxlWZptdMjMqszV845mO/bEH8a6hX+KkDQ
 Lq7suhyjjNoWfYW646QSWMJCGhJHO9R49wDxq3htRO328rpU0CUKqG4QrULSINI6hrsM
 3fy5rk+x2SeOf4eO1HxTgBL1VDtW+vUt7ln+TJYzdKfmjzqm8inUIB57Pbl81VDnlvUk
 +xqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GDEUoA2LjeUR3a6vBTacgTKP097lWdZLq2KQ6M1GuB4=;
 b=Ihzo500FOjkL+V9lHcUf5LqPTNnwpGZsMaFCo7C1rrvrHG8YKmYx+WtP54YywjSk1l
 2K4hdB4n8s0wKjk6V9vQms7/jN3wl20cW2ZsttXVt32a19o8NYB60zSrbMaiS3xGNkDe
 7RgcVxc1SewjhkQwT5nMwACXbR+O5uZSkASXnly0ltSXl4RLn9xCUJcfbDa79G1NN823
 1RoTZx/9kQ9Ns2pmRiCh1FeAd/jSmljhKEzTgByjhO2iwkCO4PUTtult4m6/sGz8IMvN
 ujlOdCZKUcfmFiUByWmY214CRIfLbbaQAZpKQIyiHUJsEW29JqQN9rllXc+GrtLj5mHO
 eHYA==
X-Gm-Message-State: AOAM533thUabugZc1aDhT9xFbiqc1qY3UDFCKQjWys/1SRVshJu/L2h0
 SHHwRXXUQfMW3nPrwak3Jm54jp+l87sSG+bzw1iFO7ek
X-Google-Smtp-Source: ABdhPJwjPV4q8zCJ8f8NXIuia09Htkes6eKTTfR6Y1YcrgUr0rQAv2QWnE5xGzfFvPF4cLv78oFLbjhZ16jGuor+3u0=
X-Received: by 2002:a25:d645:: with SMTP id n66mr4866030ybg.122.1617803707580; 
 Wed, 07 Apr 2021 06:55:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617367359.git.alistair.francis@wdc.com>
 <26fc95f280808909616ebb7a1e2a472443377ec1.1617367359.git.alistair.francis@wdc.com>
In-Reply-To: <26fc95f280808909616ebb7a1e2a472443377ec1.1617367359.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 7 Apr 2021 21:54:56 +0800
Message-ID: <CAEUhbmXnTiUdR0S1fW+JcTOKQ4_B34Aqsb8LB4GW5+xOmBwNpg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] sifive_u: Connect the SiFive PWM device
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>,
 jrestivo@draper.com, aclifford@draper.com, astrnad@draper.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2b.google.com
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
X-List-Received-Date: Wed, 07 Apr 2021 13:55:14 -0000

On Fri, Apr 2, 2021 at 8:45 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/riscv/sifive_u.h | 14 +++++++++++++-
>  hw/riscv/sifive_u.c         | 23 ++++++++++++++++++++++-
>  2 files changed, 35 insertions(+), 2 deletions(-)
>
> diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
> index 2656b39808..6e0779562d 100644
> --- a/include/hw/riscv/sifive_u.h
> +++ b/include/hw/riscv/sifive_u.h
> @@ -27,6 +27,7 @@
>  #include "hw/misc/sifive_u_otp.h"
>  #include "hw/misc/sifive_u_prci.h"
>  #include "hw/ssi/sifive_spi.h"
> +#include "hw/timer/sifive_u_pwm.h"
>
>  #define TYPE_RISCV_U_SOC "riscv.sifive.u.soc"
>  #define RISCV_U_SOC(obj) \
> @@ -49,6 +50,7 @@ typedef struct SiFiveUSoCState {
>      SiFiveSPIState spi0;
>      SiFiveSPIState spi2;
>      CadenceGEMState gem;
> +    SiFiveUPwmState pwm[2];
>
>      uint32_t serial;
>      char *cpu_type;
> @@ -92,7 +94,9 @@ enum {
>      SIFIVE_U_DEV_FLASH0,
>      SIFIVE_U_DEV_DRAM,
>      SIFIVE_U_DEV_GEM,
> -    SIFIVE_U_DEV_GEM_MGMT
> +    SIFIVE_U_DEV_GEM_MGMT,
> +    SIFIVE_U_DEV_PWM0,
> +    SIFIVE_U_DEV_PWM1
>  };
>
>  enum {
> @@ -126,6 +130,14 @@ enum {
>      SIFIVE_U_PDMA_IRQ5 = 28,
>      SIFIVE_U_PDMA_IRQ6 = 29,
>      SIFIVE_U_PDMA_IRQ7 = 30,
> +    SIFIVE_U_DEV_PWM0_0 = 42,

These should be named as SIFIVE_U_PWM0_IRQ0, etc.

> +    SIFIVE_U_DEV_PWM0_1 = 43,
> +    SIFIVE_U_DEV_PWM0_2 = 44,
> +    SIFIVE_U_DEV_PWM0_3 = 45,
> +    SIFIVE_U_DEV_PWM1_0 = 46,
> +    SIFIVE_U_DEV_PWM1_1 = 47,
> +    SIFIVE_U_DEV_PWM1_2 = 48,
> +    SIFIVE_U_DEV_PWM1_3 = 49,
>      SIFIVE_U_QSPI0_IRQ = 51,
>      SIFIVE_U_GEM_IRQ = 53
>  };
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 7b59942369..ba36a91ef8 100644

Missing update on supported device lists at the beginning of this file

> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -74,6 +74,8 @@ static const MemMapEntry sifive_u_memmap[] = {
>      [SIFIVE_U_DEV_PRCI] =     { 0x10000000,     0x1000 },
>      [SIFIVE_U_DEV_UART0] =    { 0x10010000,     0x1000 },
>      [SIFIVE_U_DEV_UART1] =    { 0x10011000,     0x1000 },
> +    [SIFIVE_U_DEV_PWM0] =     { 0x10020000,     0x1000 },
> +    [SIFIVE_U_DEV_PWM1] =     { 0x10021000,     0x1000 },
>      [SIFIVE_U_DEV_QSPI0] =    { 0x10040000,     0x1000 },
>      [SIFIVE_U_DEV_QSPI2] =    { 0x10050000,     0x1000 },
>      [SIFIVE_U_DEV_GPIO] =     { 0x10060000,     0x1000 },
> @@ -757,6 +759,8 @@ static void sifive_u_soc_instance_init(Object *obj)
>      object_initialize_child(obj, "pdma", &s->dma, TYPE_SIFIVE_PDMA);
>      object_initialize_child(obj, "spi0", &s->spi0, TYPE_SIFIVE_SPI);
>      object_initialize_child(obj, "spi2", &s->spi2, TYPE_SIFIVE_SPI);
> +    object_initialize_child(obj, "pwm0", &s->pwm[0], TYPE_SIFIVE_U_PWM);
> +    object_initialize_child(obj, "pwm1", &s->pwm[1], TYPE_SIFIVE_U_PWM);
>  }
>
>  static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
> @@ -769,7 +773,7 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
>      MemoryRegion *l2lim_mem = g_new(MemoryRegion, 1);
>      char *plic_hart_config;
>      size_t plic_hart_config_len;
> -    int i;
> +    int i, j;
>      NICInfo *nd = &nd_table[0];
>
>      qdev_prop_set_uint32(DEVICE(&s->u_cpus), "num-harts", ms->smp.cpus - 1);
> @@ -896,6 +900,23 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->gem), 0,
>                         qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_U_GEM_IRQ));
>
> +    /* PWM */
> +    for (i = 0; i < 2; i++) {
> +        if (!sysbus_realize(SYS_BUS_DEVICE(&s->pwm[i]), errp)) {
> +            return;
> +        }
> +        sysbus_mmio_map(SYS_BUS_DEVICE(&s->pwm[i]), 0,
> +                                memmap[SIFIVE_U_DEV_PWM0].base + (0x1000 * i));
> +
> +        /* Connect PWM interrupts to the PLIC */
> +        for (j = 0; j < SIFIVE_U_PWM_IRQS; j++) {
> +            sysbus_connect_irq(SYS_BUS_DEVICE(&s->pwm[i]), j,
> +                               qdev_get_gpio_in(DEVICE(s->plic),
> +                                            SIFIVE_U_DEV_PWM0_0 +
> +                                                (i * SIFIVE_PDMA_IRQS) + j));
> +        }
> +    }
> +
>      create_unimplemented_device("riscv.sifive.u.gem-mgmt",
>          memmap[SIFIVE_U_DEV_GEM_MGMT].base, memmap[SIFIVE_U_DEV_GEM_MGMT].size);
>

The generation of the PWM device tree fragment part is missing.

Probably we need another patch to update the document on the support
status of PWM devices, and if possible how to test this, e.g.: in
Linux?

Regards,
Bin

