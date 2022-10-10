Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ohiVq-0003t8-7B
	for mharc-qemu-riscv@gnu.org; Sun, 09 Oct 2022 22:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ohiVk-0003m1-26; Sun, 09 Oct 2022 22:27:20 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:46687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ohiVi-00077V-9s; Sun, 09 Oct 2022 22:27:19 -0400
Received: by mail-pg1-x533.google.com with SMTP id 78so9181698pgb.13;
 Sun, 09 Oct 2022 19:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hYF0M3197sbfDCq7XeDcroDWgDDuL9YLI+RJgp9EjTM=;
 b=be+4IVfH03PT1dldn78yWMxLH//j2qtOfZDNQAxsJWkj7mWnmuR8O4B5Yfc0s0uBtj
 6dhgzBnw845LyeXiWGimPgMXzoVZvLHaWJ+56ovfpsBovijIzq5zsO3ImWShDwha16O6
 FFw7Zhk0CITZ//Gk13CTOpg4bjZ9jNCUX8i+X0/FlWWuYELsGQJ/Pe26GupGVBLMY7Ug
 ClOySb5liuRhvaAmd5EE1HCFa7G15PxKXvOnXNtivOjrH4+8baP4buzF2+/Ebp6Szhnr
 xgRIX5R8sh0baZied3F8ZsJOhKlxeWIuHpN4dm/XpdPmw9U2AOnjEKsF1YQN1vLC8eAn
 yjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hYF0M3197sbfDCq7XeDcroDWgDDuL9YLI+RJgp9EjTM=;
 b=cS1nkIEuFVLcisD9wiZXiexFCm24JX8BOC2WC/zpeace+YY8+4ZOG6b9sjWDSRClDe
 CG5hwmMqNFfRS1JJR6PQrE+6c0U0B1PAvEavO3u7/CauGFZog2cCskNjfJ4Nevs1yxs0
 mdo1BpIHT6ysuS0KzIFHHa6VcNKohSL/nFcVj7Y0z3LZ3ChZpzplAvOYMdgcUNaQEVZI
 9nmv/3HobSLNArdrsK17WsI8aLOQ2/sjwFjSo4qewe38jkKT3zbsWiIJk+gcBccsW0/d
 laUCd67AJtBCXev6i66R6e7sxO2Con64sLdGKU1xN4J0zdzWjAdbLf5mzHvR8ngU7byq
 Tlcw==
X-Gm-Message-State: ACrzQf1SmXCg1X/EO9eHNpaStXFwPi8x0pRO09kQYt1B0i55GKKn2s0P
 Er8A20Ee8WkNcN7DjJ3dCLSyTPQ8Q42Fd7pYIvw=
X-Google-Smtp-Source: AMsMyM5y7HXrZkT97oXBBGv8jEP40Sp+edZSsJ8PSarGb5rFipbdfLJrcqFFYPRE9cCE0/IOzfc+AbeJeF56EDYHNfI=
X-Received: by 2002:a63:ce43:0:b0:45b:d6ed:6c2 with SMTP id
 r3-20020a63ce43000000b0045bd6ed06c2mr14659887pgi.406.1665368836478; Sun, 09
 Oct 2022 19:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220922084107.2834285-1-tommy.wu@sifive.com>
 <20220922084107.2834285-3-tommy.wu@sifive.com>
In-Reply-To: <20220922084107.2834285-3-tommy.wu@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Oct 2022 12:26:50 +1000
Message-ID: <CAKmqyKOAYD_eigVNY48pgqZu0ytxGzt_4qj1CL_AzRuxP4TvJQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/riscv: sifive_e: Support the watchdog timer of
 HiFive 1 rev b.
To: Tommy Wu <tommy.wu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, bin.meng@windriver.com, jim.shu@sifive.com, 
 frank.chang@sifive.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x533.google.com
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
X-List-Received-Date: Mon, 10 Oct 2022 02:27:20 -0000

On Thu, Sep 22, 2022 at 6:45 PM Tommy Wu <tommy.wu@sifive.com> wrote:
>
> Create the AON device when we realize the sifive_e machine.
> This patch only implemented the functionality of the watchdog timer,
> not all the functionality of the AON device.
>
> Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
> ---
>  hw/riscv/Kconfig            | 1 +
>  hw/riscv/sifive_e.c         | 5 +++--
>  include/hw/riscv/sifive_e.h | 7 ++++---
>  3 files changed, 8 insertions(+), 5 deletions(-)
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
> index d65d2fd869..f9c05cfd3a 100644
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
> @@ -222,8 +223,8 @@ static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
>          RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, ms->smp.cpus,
>          RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
>          RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, false);

Newline here

> -    create_unimplemented_device("riscv.sifive.e.aon",
> -        memmap[SIFIVE_E_DEV_AON].base, memmap[SIFIVE_E_DEV_AON].size);
> +    sifive_e_aon_create(sys_mem, memmap[SIFIVE_E_DEV_AON].base,
> +        qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_E_AON_WDT_IRQ));

and here please

Otherwise:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>      sifive_e_prci_create(memmap[SIFIVE_E_DEV_PRCI].base);
>
>      /* GPIO */
> diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
> index 83604da805..7de2221564 100644
> --- a/include/hw/riscv/sifive_e.h
> +++ b/include/hw/riscv/sifive_e.h
> @@ -75,9 +75,10 @@ enum {
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

