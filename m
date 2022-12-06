Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p2RzV-0005Z7-LB
	for mharc-qemu-riscv@gnu.org; Tue, 06 Dec 2022 02:03:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p2RzN-0005Xy-OH; Tue, 06 Dec 2022 02:03:37 -0500
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p2RzL-0008Eu-QC; Tue, 06 Dec 2022 02:03:37 -0500
Received: by mail-vs1-xe33.google.com with SMTP id q128so13319862vsa.13;
 Mon, 05 Dec 2022 23:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FiZih2iW4hNR1DeVI5ZOEVK0HsJdtfaKoHbTybS5xsg=;
 b=n4ziLsnNNr9xm6gKkJ5dJF1rqBsGyp4ZF2H22GHX4FmBaTqMpZ+FKE+K9OV59VFCIr
 e9eYWZoArTP0JyUhGSucG6/1gWP7uCNckrTYnloDqg0OqX/Tp+EiOTpVzp5e0xCsQsoL
 bOFWTBW6Qq+B4YSf4j5y8WYO6dhnhAcXuuh34pF9EoQdI0xARdykvsM1ks+aPwaWqq47
 RxjLpNyLk6iDuHrp9wfW3zfTLNq0I0r405xnIFYQACXGIP8u15L+2N3TNiIqK1Ksz5i+
 N+tPBs8Tx2tosEzlJH9JYY2dL+9P3ySC9S392NKlyJprmpxjav216DOk3Kiq/03BLJjr
 TBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FiZih2iW4hNR1DeVI5ZOEVK0HsJdtfaKoHbTybS5xsg=;
 b=TU5j+ELW0EhEaicbV9FGuUDmUTXRGigGg2GzcPHSNAAQaUvN9XrwwrGMcsKzeWY5zn
 AdgA9TxgMdJIG4UtxVc5whJK1hmk9M0+o0O8EOLGacfRkMjKq1vnAPTI2JbwFu3wWhCm
 +lTEjLg92VncCAW+4w/0CsOFlGPdaTBDeCRQjFrf5dJDZlwpcfx/8nPbFd1uune5g50N
 jRyOHn/u4sZtbJi7FvxrWiLqFLa457jlc6IH++UYUSmQpgYWGkfWjKTN4peaYGLhePxD
 iQh2xsu6umxc4AKO7Fe4qiqI46jVZBh5yIiIVE9r6EIZzZJlMHX+aLiby9klheLnu4x+
 EnCQ==
X-Gm-Message-State: ANoB5pngtV1An1aKga3cmed7iR+oxph9+hvKFKyQseugZEfo0Ve/35yE
 etbGmnOcBKAlkkyjuExZpjPD9UzZ9bYDl3xlPCxgVihbo7A=
X-Google-Smtp-Source: AA0mqf6GeTdvZqRNdDbYJbXdAk2NtRrtz4Z0ErNcxg9SRPSA1Od9gDYHKrUqr5UMjTvB2T2nh9KALs/kchmuyyxtkRY=
X-Received: by 2002:a05:6102:f09:b0:3a6:eec3:b246 with SMTP id
 v9-20020a0561020f0900b003a6eec3b246mr45492626vss.64.1670310213047; Mon, 05
 Dec 2022 23:03:33 -0800 (PST)
MIME-Version: 1.0
References: <20221130015444.1459842-1-tommy.wu@sifive.com>
 <20221130015444.1459842-3-tommy.wu@sifive.com>
In-Reply-To: <20221130015444.1459842-3-tommy.wu@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 6 Dec 2022 17:03:06 +1000
Message-ID: <CAKmqyKMqA6NLVSG6vAi93usz5a8FyW=gdEBMQbcTRiRdyLdn4g@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] hw/riscv: sifive_e: Support the watchdog timer of
 HiFive 1 rev b.
To: Tommy Wu <tommy.wu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, bin.meng@windriver.com, jim.shu@sifive.com, 
 frank.chang@sifive.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe33.google.com
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
X-List-Received-Date: Tue, 06 Dec 2022 07:03:39 -0000

On Wed, Nov 30, 2022 at 11:56 AM Tommy Wu <tommy.wu@sifive.com> wrote:
>
> Create the AON device when we realize the sifive_e machine.
> This patch only implemented the functionality of the watchdog timer,
> not all the functionality of the AON device.
>
> Signed-off-by: Tommy Wu <tommy.wu@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/Kconfig            |  1 +
>  hw/riscv/sifive_e.c         | 13 +++++++++++--
>  include/hw/riscv/sifive_e.h |  8 +++++---
>  3 files changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index 79ff61c464..50890b1b75 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -59,6 +59,7 @@ config SIFIVE_E
>      select SIFIVE_PLIC
>      select SIFIVE_UART
>      select SIFIVE_E_PRCI
> +    select SIFIVE_E_AON
>      select UNIMP
>
>  config SIFIVE_U
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index d65d2fd869..c866ffe232 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -45,6 +45,7 @@
>  #include "hw/intc/riscv_aclint.h"
>  #include "hw/intc/sifive_plic.h"
>  #include "hw/misc/sifive_e_prci.h"
> +#include "hw/misc/sifive_e_aon.h"
>  #include "chardev/char.h"
>  #include "sysemu/sysemu.h"
>
> @@ -222,8 +223,13 @@ static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
>          RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, ms->smp.cpus,
>          RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
>          RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, false);
> -    create_unimplemented_device("riscv.sifive.e.aon",
> -        memmap[SIFIVE_E_DEV_AON].base, memmap[SIFIVE_E_DEV_AON].size);
> +
> +    s->aon = qdev_new(TYPE_SIFIVE_E_AON);
> +    if (!sysbus_realize(SYS_BUS_DEVICE(s->aon), errp)) {
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(s->aon), 0, memmap[SIFIVE_E_DEV_AON].base);
> +
>      sifive_e_prci_create(memmap[SIFIVE_E_DEV_PRCI].base);
>
>      /* GPIO */
> @@ -244,6 +250,9 @@ static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
>                             qdev_get_gpio_in(DEVICE(s->plic),
>                                              SIFIVE_E_GPIO0_IRQ0 + i));
>      }
> +    sysbus_connect_irq(SYS_BUS_DEVICE(s->aon), 0,
> +                       qdev_get_gpio_in(DEVICE(s->plic),
> +                                        SIFIVE_E_AON_WDT_IRQ));
>
>      sifive_uart_create(sys_mem, memmap[SIFIVE_E_DEV_UART0].base,
>          serial_hd(0), qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_E_UART0_IRQ));
> diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
> index d738745925..e2de1564a7 100644
> --- a/include/hw/riscv/sifive_e.h
> +++ b/include/hw/riscv/sifive_e.h
> @@ -35,6 +35,7 @@ typedef struct SiFiveESoCState {
>      /*< public >*/
>      RISCVHartArrayState cpus;
>      DeviceState *plic;
> +    DeviceState *aon;
>      SIFIVEGPIOState gpio;
>      MemoryRegion xip_mem;
>      MemoryRegion mask_rom;
> @@ -76,9 +77,10 @@ enum {
>  };
>
>  enum {
> -    SIFIVE_E_UART0_IRQ  = 3,
> -    SIFIVE_E_UART1_IRQ  = 4,
> -    SIFIVE_E_GPIO0_IRQ0 = 8
> +    SIFIVE_E_AON_WDT_IRQ  = 1,
> +    SIFIVE_E_UART0_IRQ    = 3,
> +    SIFIVE_E_UART1_IRQ    = 4,
> +    SIFIVE_E_GPIO0_IRQ0   = 8
>  };
>
>  #define SIFIVE_E_PLIC_HART_CONFIG "M"
> --
> 2.27.0
>
>

