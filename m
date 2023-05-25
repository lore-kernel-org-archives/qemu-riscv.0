Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DAE4C77B7C
	for <qemu-riscv@archiver.kernel.org>; Thu, 25 May 2023 02:43:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q20wc-0003Wf-CT; Wed, 24 May 2023 22:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q20wb-0003WN-Fp; Wed, 24 May 2023 22:43:13 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q20wZ-0005iU-VT; Wed, 24 May 2023 22:43:13 -0400
Received: by mail-ua1-x92f.google.com with SMTP id
 a1e0cc1a2514c-783f17f0a00so144137241.2; 
 Wed, 24 May 2023 19:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684982590; x=1687574590;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XiX9qNYAZ1VZimJn7pCIEiClnSKWEiYTvEv6OTXFAHE=;
 b=l/bgNfBtueOQ/loIkXutT+CMlUHClzT/XGd8W31kicz6WpaOdmoUNSGIyha8qo0uok
 TClihd4N1UxaFgXtUczzi3bny0Vl+A/z0I544WU2doupIBXiisYhjM+QHI4/bqO38ehk
 2kxOpb2XvPIhWfKnWLcqSah/+AzSSrMVRvAPUsX/boMI1fTCUaD6EHW9VZTrvtVXhwBp
 L/LU+Kw1dIwGCZu6Mm0GTteK6SD9PGnwocAEHCOKOUcd1WgY/S/IY62+Ff2/DH0IJrmw
 pbmOZIhONLUcqTCE7AO8yMfShkoINqtICVMofPd7vRG75nz9PZwkKRXYfdj8joR6+GlS
 wFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684982590; x=1687574590;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XiX9qNYAZ1VZimJn7pCIEiClnSKWEiYTvEv6OTXFAHE=;
 b=I3PfvjU0eZRywM5HzKaEsfXVV0Oq9AggdylZRHHBb+oTaYFXOEYzFnuCB1MyvWXAZ0
 GABgmfCrDt30Qk7qt7MSI9v+TsDZGRRC2eSBbTqqMTlbIMAydHpEiIPmsMQXcNYUiO/7
 +o12qOGUMF7pWI5p7yNRiSornp3wX6l4KZ+qKbjvwaAWFvHEB9qq+OXunE2He8kabCDl
 QFPUF6TOIDUENeYCWBuLrH+YXjc6P/ypszDFR7qHzSmWmshUT3lX5BWeteQ0uVGhhHbL
 5g7BpjCzSp8QWPjfomh1RVMstFN5yovr6PC5S0PxlfZHIuWUEgiJ8JNGTjrTCio3WH/W
 TWmw==
X-Gm-Message-State: AC+VfDwBF3lFgDFlBelV7XQYGWf98+6mt4/Z43VvF5vZLgCYZ+kgtMVV
 mk4O0rr10rRB87xjYGfQ+IvlJ/GEJu93Ugk/4FUKwdNjfKwUERV6
X-Google-Smtp-Source: ACHHUZ4ZL+qoXl5x9+UofDEs9OhXJvQMTw5vj2A7hp3tmIRl4P3hKSe8nGQkS5yRCSJ5MS0WMZ44FnzowV8fv2YNk/A=
X-Received: by 2002:a67:f84d:0:b0:439:75fc:6489 with SMTP id
 b13-20020a67f84d000000b0043975fc6489mr108820vsp.3.1684982590215; Wed, 24 May
 2023 19:43:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230523084910.304679-1-tommy.wu@sifive.com>
 <20230523084910.304679-3-tommy.wu@sifive.com>
In-Reply-To: <20230523084910.304679-3-tommy.wu@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 25 May 2023 12:42:44 +1000
Message-ID: <CAKmqyKNMA51KPJktUKr+1iTreA1d=bczi_1sckbWsw7NVzSu9w@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] hw/riscv: sifive_e: Support the watchdog timer of
 HiFive 1 rev b.
To: Tommy Wu <tommy.wu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, bin.meng@windriver.com, jim.shu@sifive.com, 
 frank.chang@sifive.com, thuth@redhat.com, liweiwei@iscas.ac.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92f.google.com
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

On Tue, May 23, 2023 at 6:50=E2=80=AFPM Tommy Wu <tommy.wu@sifive.com> wrot=
e:
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
>  hw/riscv/sifive_e.c         | 13 +++++++++++--
>  include/hw/riscv/sifive_e.h |  8 +++++---
>  3 files changed, 17 insertions(+), 5 deletions(-)
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
> index 04939b60c3..731ed0e11d 100644
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
> @@ -223,8 +224,13 @@ static void sifive_e_soc_realize(DeviceState *dev, E=
rror **errp)
>          RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, ms->smp.cpus,
>          RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
>          RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, false);
> -    create_unimplemented_device("riscv.sifive.e.aon",
> -        memmap[SIFIVE_E_DEV_AON].base, memmap[SIFIVE_E_DEV_AON].size);
> +
> +    s->aon =3D qdev_new(TYPE_SIFIVE_E_AON);
> +    if (!sysbus_realize(SYS_BUS_DEVICE(s->aon), errp)) {
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(s->aon), 0, memmap[SIFIVE_E_DEV_AON].=
base);
> +
>      sifive_e_prci_create(memmap[SIFIVE_E_DEV_PRCI].base);
>
>      /* GPIO */
> @@ -245,6 +251,9 @@ static void sifive_e_soc_realize(DeviceState *dev, Er=
ror **errp)
>                             qdev_get_gpio_in(DEVICE(s->plic),
>                                              SIFIVE_E_GPIO0_IRQ0 + i));
>      }
> +    sysbus_connect_irq(SYS_BUS_DEVICE(s->aon), 0,
> +                       qdev_get_gpio_in(DEVICE(s->plic),
> +                                        SIFIVE_E_AON_WDT_IRQ));
>
>      sifive_uart_create(sys_mem, memmap[SIFIVE_E_DEV_UART0].base,
>          serial_hd(0), qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_E_UART0_I=
RQ));
> diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
> index b824a79e2d..a094b47e0b 100644
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

