Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEB2EB64D7
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 02:08:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qC9jq-00030D-52; Wed, 21 Jun 2023 22:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qC9jo-0002zf-Pk; Wed, 21 Jun 2023 22:07:57 -0400
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qC9jn-0003Vz-5C; Wed, 21 Jun 2023 22:07:56 -0400
Received: by mail-vk1-xa2c.google.com with SMTP id
 71dfb90a1353d-460eb67244eso2411666e0c.1; 
 Wed, 21 Jun 2023 19:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687399674; x=1689991674;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/y7dXD9d2kBCoWZY6qt8G4LgB/Cs6uh+OABMz6VPrD4=;
 b=Me3zLPHGqhf9m8/i1FHPs5OwD3XPD34g6k54XAEesK+jYAhExC5ajTQPxsw2+cCEIr
 Up3jI7Pf+yqMXzPA5ZHQubEYk+laYULzVofdvFFsx0FH9LhLtoVcPrM0OdA+6XT4SjJu
 JqTchGJXO/dKrm74tYDmILxWrTarxWeuVUrWGwqowc2i1PSWBIi9MfEwB+KBJSyHv2NI
 sAbGqckneXqPJZJSH40VCeRVV6J9boSrKD+p2gaajTbVEolRBmjBEbovEt9LjN0xWuvK
 kPsz3CF9UAUzsALi/fnKYLUDMZtdRt2Ao94VYLr0swwYKObokXM5sl71/DCmxC78/GjD
 znTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687399674; x=1689991674;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/y7dXD9d2kBCoWZY6qt8G4LgB/Cs6uh+OABMz6VPrD4=;
 b=BMTu5p9MdNepoz5QwRUmjp5KifYjIql9YurrdmJVYh3EB3+2rM9AIh6HOvZJBA995R
 1/akzppLPMPlatdcafhZA1+W3Q5xmICNOkUqe/fhJFL2ByPoHfTb6v5Su8L5+Zm0xew3
 A9i4ZzjSXmFeffm7XNCZA0XF7Bx9EkoHCOP1h3bvOQjqpWpyx18WQ1SZvze8KSHxLKR+
 ZB+jaUay56SFMBYCpUzpd/svsLqWxIYZOUcgUPuNb2QnntTprwQebU7UwDLlh5K/Op94
 8mMOond3ZIoGuhPClqDYAnUyKPD/+/codYGBlb/ptArlNuZKk1IlUgUJ0tYdYFGhRL0h
 kblw==
X-Gm-Message-State: AC+VfDz0aUk+fwcLmOnrODghE58fqPklBllQQzzpGg6TZnIImxUZUFkh
 zhAZm/t41pn7UK6LMOlCyx1LknIGhTdSlvTLJiI=
X-Google-Smtp-Source: ACHHUZ492hV0x3jk1k3GmIi97W3xrGkctt4f5iCEaC0TOad23CBbNS9YmMmYRAAT0YbJicZhyVEFcdziLljf6PfGFxQ=
X-Received: by 2002:a67:e94b:0:b0:440:a3db:2d7b with SMTP id
 p11-20020a67e94b000000b00440a3db2d7bmr7489234vso.8.1687399673732; Wed, 21 Jun
 2023 19:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230608164542.3675619-1-tommy.wu@sifive.com>
 <20230608164542.3675619-3-tommy.wu@sifive.com>
In-Reply-To: <20230608164542.3675619-3-tommy.wu@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 22 Jun 2023 12:07:27 +1000
Message-ID: <CAKmqyKMo4t35vmM6ZnpNw+jEzLoq3kONmURpMb3ycxxJV8Kq3g@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] hw/riscv: sifive_e: Support the watchdog timer of
 HiFive 1 rev b.
To: Tommy Wu <tommy.wu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, bin.meng@windriver.com, jim.shu@sifive.com, 
 frank.chang@sifive.com, liweiwei@iscas.ac.cn, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Fri, Jun 9, 2023 at 2:46=E2=80=AFAM Tommy Wu <tommy.wu@sifive.com> wrote=
:
>
> Create the AON device when we realize the sifive_e machine.
> This patch only implemented the functionality of the watchdog timer,
> not all the functionality of the AON device.
>
> Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/Kconfig            |  1 +
>  hw/riscv/sifive_e.c         | 17 +++++++++++++++--
>  include/hw/riscv/sifive_e.h |  9 ++++++---
>  3 files changed, 22 insertions(+), 5 deletions(-)
>
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index 6528ebfa3a..b6a5eb4452 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -60,6 +60,7 @@ config SIFIVE_E
>      select SIFIVE_PLIC
>      select SIFIVE_UART
>      select SIFIVE_E_PRCI
> +    select SIFIVE_E_AON
>      select UNIMP
>
>  config SIFIVE_U
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index 04939b60c3..0d37adc542 100644
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
> @@ -185,6 +186,8 @@ static void sifive_e_soc_init(Object *obj)
>      object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x1004, &error=
_abort);
>      object_initialize_child(obj, "riscv.sifive.e.gpio0", &s->gpio,
>                              TYPE_SIFIVE_GPIO);
> +    object_initialize_child(obj, "riscv.sifive.e.aon", &s->aon,
> +                            TYPE_SIFIVE_E_AON);
>  }
>
>  static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
> @@ -223,10 +226,17 @@ static void sifive_e_soc_realize(DeviceState *dev, =
Error **errp)
>          RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, ms->smp.cpus,
>          RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
>          RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, false);
> -    create_unimplemented_device("riscv.sifive.e.aon",
> -        memmap[SIFIVE_E_DEV_AON].base, memmap[SIFIVE_E_DEV_AON].size);
>      sifive_e_prci_create(memmap[SIFIVE_E_DEV_PRCI].base);
>
> +    /* AON */
> +
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->aon), errp)) {
> +        return;
> +    }
> +
> +    /* Map AON registers */
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->aon), 0, memmap[SIFIVE_E_DEV_AON]=
.base);
> +
>      /* GPIO */
>
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
> @@ -245,6 +255,9 @@ static void sifive_e_soc_realize(DeviceState *dev, Er=
ror **errp)
>                             qdev_get_gpio_in(DEVICE(s->plic),
>                                              SIFIVE_E_GPIO0_IRQ0 + i));
>      }
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->aon), 0,
> +                       qdev_get_gpio_in(DEVICE(s->plic),
> +                                        SIFIVE_E_AON_WDT_IRQ));
>
>      sifive_uart_create(sys_mem, memmap[SIFIVE_E_DEV_UART0].base,
>          serial_hd(0), qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_E_UART0_I=
RQ));
> diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
> index b824a79e2d..31180a680e 100644
> --- a/include/hw/riscv/sifive_e.h
> +++ b/include/hw/riscv/sifive_e.h
> @@ -22,6 +22,7 @@
>  #include "hw/riscv/riscv_hart.h"
>  #include "hw/riscv/sifive_cpu.h"
>  #include "hw/gpio/sifive_gpio.h"
> +#include "hw/misc/sifive_e_aon.h"
>  #include "hw/boards.h"
>
>  #define TYPE_RISCV_E_SOC "riscv.sifive.e.soc"
> @@ -35,6 +36,7 @@ typedef struct SiFiveESoCState {
>      /*< public >*/
>      RISCVHartArrayState cpus;
>      DeviceState *plic;
> +    SiFiveEAONState aon;
>      SIFIVEGPIOState gpio;
>      MemoryRegion xip_mem;
>      MemoryRegion mask_rom;
> @@ -76,9 +78,10 @@ enum {
>  };
>
>  enum {
> -    SIFIVE_E_UART0_IRQ  =3D 3,
> -    SIFIVE_E_UART1_IRQ  =3D 4,
> -    SIFIVE_E_GPIO0_IRQ0 =3D 8
> +    SIFIVE_E_AON_WDT_IRQ  =3D 1,
> +    SIFIVE_E_UART0_IRQ    =3D 3,
> +    SIFIVE_E_UART1_IRQ    =3D 4,
> +    SIFIVE_E_GPIO0_IRQ0   =3D 8
>  };
>
>  #define SIFIVE_E_PLIC_HART_CONFIG "M"
> --
> 2.27.0
>
>

