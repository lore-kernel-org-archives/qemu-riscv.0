Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mB5GF-000187-77
	for mharc-qemu-riscv@gnu.org; Tue, 03 Aug 2021 20:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mB5GD-00013o-BD; Tue, 03 Aug 2021 20:59:53 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:36460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mB5GB-0000Q6-Ar; Tue, 03 Aug 2021 20:59:53 -0400
Received: by mail-io1-xd35.google.com with SMTP id f11so577990ioj.3;
 Tue, 03 Aug 2021 17:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fUW0Sdb7XqHUTYRfX8JPpxPnuM5T10tfwXFnHbwDItI=;
 b=piAGsEbODEE23g/tsJ+BNJK8N3YREOcW42OJTHfkbiSW0iKtz0FwP2KJOhUcdg1uwf
 9Xy3LOKD1Pm83PXsBUJxYAjRzHmbc9CtqvHDHMSLfLyFjym177rIvw6ldGONx8jLkrvu
 fSd2p1ug8aguYxUtN591srU8dm5FjE8eu82ca0fuLp6tF7lcj0lLukrO/SqUFrg9K7Hb
 917iZ5K/fay3kRzbmEvzt0r5Dr9NrJkbRgc5Bi18LEY+WWnSN6IE4W2eEsvimufU+6Tm
 AiU9Z+ouQYaB7RxKtYYTTdG1nFk6unx4n2GTE8+omeZCi+ivyupIyH0EJsbnarbS/RgK
 4XVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fUW0Sdb7XqHUTYRfX8JPpxPnuM5T10tfwXFnHbwDItI=;
 b=rewXi0T0Us/Pbr1tJHssdOaTYU7EFH1iI9UQ3oubby2XdMzpAyaeAIJ+14m22zenAZ
 Y+tEsmL/0bjJoJ20vHQEGdCdqiBN6jykl7xvedxgBVh2LTHw8oihpRxgnqz44E10ivbc
 IycmmNnp2q4buv7zvQwC4wirbomkwm1+NbXG6reZAIf8UwrhOqb3+fUwr6E9nvAMjLJZ
 DyC9rH4BWzuOVNtQd+lNT7IDTw7v3DFnqjA9BkTAZK9/BsltfMAaBgivJzRyqSeEkTKk
 rw2BC3LoFy2a3TW9Il3E3shmYsMmqQk2PKqxzQlXotAAaCQP4ZhIio1hIuO5fVw81d+3
 oeFg==
X-Gm-Message-State: AOAM5328wuw4Dvj+XuV4RtrvFR/RXs1YtifdyrVcruc0N+5qQ64fKXz7
 44vGov/PXGfFVaZfAQxa2fuUEYuKcJqzFg4ZLZg=
X-Google-Smtp-Source: ABdhPJyXhCZhMHYKxmcOh2kEEiROSjXmf8TKc6+W6tLNSsh/4FaAM3yh+7BCLyd5e9M+1ef4XHPAI8A8wadbktw/MOk=
X-Received: by 2002:a02:cc22:: with SMTP id o2mr3912463jap.26.1628038788700;
 Tue, 03 Aug 2021 17:59:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210724122407.2486558-1-anup.patel@wdc.com>
 <20210724122407.2486558-2-anup.patel@wdc.com>
In-Reply-To: <20210724122407.2486558-2-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 4 Aug 2021 10:59:21 +1000
Message-ID: <CAKmqyKMaVkaGgrqwVmr+r+5QuZtTovpE526iruf+qTiZRp08hA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] hw/intc: Rename sifive_clint sources to
 riscv_aclint sources
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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
X-List-Received-Date: Wed, 04 Aug 2021 00:59:53 -0000

On Sat, Jul 24, 2021 at 10:24 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> We will be upgrading SiFive CLINT implementation into RISC-V ACLINT
> implementation so let's first rename the sources.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/intc/Kconfig                                    |  2 +-
>  hw/intc/meson.build                                |  2 +-
>  hw/intc/{sifive_clint.c => riscv_aclint.c}         |  2 +-
>  hw/riscv/Kconfig                                   | 12 ++++++------
>  hw/riscv/microchip_pfsoc.c                         |  2 +-
>  hw/riscv/shakti_c.c                                |  2 +-
>  hw/riscv/sifive_e.c                                |  2 +-
>  hw/riscv/sifive_u.c                                |  2 +-
>  hw/riscv/spike.c                                   |  2 +-
>  hw/riscv/virt.c                                    |  2 +-
>  include/hw/intc/{sifive_clint.h => riscv_aclint.h} |  0
>  11 files changed, 15 insertions(+), 15 deletions(-)
>  rename hw/intc/{sifive_clint.c => riscv_aclint.c} (99%)
>  rename include/hw/intc/{sifive_clint.h => riscv_aclint.h} (100%)
>
> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
> index f4694088a4..78aed93c45 100644
> --- a/hw/intc/Kconfig
> +++ b/hw/intc/Kconfig
> @@ -62,7 +62,7 @@ config RX_ICU
>  config LOONGSON_LIOINTC
>      bool
>
> -config SIFIVE_CLINT
> +config RISCV_ACLINT
>      bool
>
>  config SIFIVE_PLIC
> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> index 6e52a166e3..9c9338a9e4 100644
> --- a/hw/intc/meson.build
> +++ b/hw/intc/meson.build
> @@ -46,7 +46,7 @@ specific_ss.add(when: 'CONFIG_RX_ICU', if_true: files('rx_icu.c'))
>  specific_ss.add(when: 'CONFIG_S390_FLIC', if_true: files('s390_flic.c'))
>  specific_ss.add(when: 'CONFIG_S390_FLIC_KVM', if_true: files('s390_flic_kvm.c'))
>  specific_ss.add(when: 'CONFIG_SH_INTC', if_true: files('sh_intc.c'))
> -specific_ss.add(when: 'CONFIG_SIFIVE_CLINT', if_true: files('sifive_clint.c'))
> +specific_ss.add(when: 'CONFIG_RISCV_ACLINT', if_true: files('riscv_aclint.c'))
>  specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true: files('sifive_plic.c'))
>  specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c'))
>  specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XICS'],
> diff --git a/hw/intc/sifive_clint.c b/hw/intc/riscv_aclint.c
> similarity index 99%
> rename from hw/intc/sifive_clint.c
> rename to hw/intc/riscv_aclint.c
> index 8a460fdf00..0f940e332b 100644
> --- a/hw/intc/sifive_clint.c
> +++ b/hw/intc/riscv_aclint.c
> @@ -26,7 +26,7 @@
>  #include "hw/sysbus.h"
>  #include "target/riscv/cpu.h"
>  #include "hw/qdev-properties.h"
> -#include "hw/intc/sifive_clint.h"
> +#include "hw/intc/riscv_aclint.h"
>  #include "qemu/timer.h"
>  #include "hw/irq.h"
>
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index 86957ec7b0..bfa46694b7 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -9,7 +9,7 @@ config MICROCHIP_PFSOC
>      select MCHP_PFSOC_MMUART
>      select MCHP_PFSOC_SYSREG
>      select MSI_NONBROKEN
> -    select SIFIVE_CLINT
> +    select RISCV_ACLINT
>      select SIFIVE_PDMA
>      select SIFIVE_PLIC
>      select UNIMP
> @@ -26,7 +26,7 @@ config SHAKTI_C
>      bool
>      select UNIMP
>      select SHAKTI
> -    select SIFIVE_CLINT
> +    select RISCV_ACLINT
>      select SIFIVE_PLIC
>
>  config RISCV_VIRT
> @@ -40,7 +40,7 @@ config RISCV_VIRT
>      select PCI_EXPRESS_GENERIC_BRIDGE
>      select PFLASH_CFI01
>      select SERIAL
> -    select SIFIVE_CLINT
> +    select RISCV_ACLINT
>      select SIFIVE_PLIC
>      select SIFIVE_TEST
>      select VIRTIO_MMIO
> @@ -49,7 +49,7 @@ config RISCV_VIRT
>  config SIFIVE_E
>      bool
>      select MSI_NONBROKEN
> -    select SIFIVE_CLINT
> +    select RISCV_ACLINT
>      select SIFIVE_GPIO
>      select SIFIVE_PLIC
>      select SIFIVE_UART
> @@ -60,7 +60,7 @@ config SIFIVE_U
>      bool
>      select CADENCE
>      select MSI_NONBROKEN
> -    select SIFIVE_CLINT
> +    select RISCV_ACLINT
>      select SIFIVE_GPIO
>      select SIFIVE_PDMA
>      select SIFIVE_PLIC
> @@ -76,5 +76,5 @@ config SPIKE
>      bool
>      select HTIF
>      select MSI_NONBROKEN
> -    select SIFIVE_CLINT
> +    select RISCV_ACLINT
>      select SIFIVE_PLIC
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index eef55f69fd..eed9e81355 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -49,7 +49,7 @@
>  #include "hw/riscv/boot.h"
>  #include "hw/riscv/riscv_hart.h"
>  #include "hw/riscv/microchip_pfsoc.h"
> -#include "hw/intc/sifive_clint.h"
> +#include "hw/intc/riscv_aclint.h"
>  #include "hw/intc/sifive_plic.h"
>  #include "sysemu/device_tree.h"
>  #include "sysemu/sysemu.h"
> diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
> index 09d4e1433e..f9f0a45651 100644
> --- a/hw/riscv/shakti_c.c
> +++ b/hw/riscv/shakti_c.c
> @@ -21,7 +21,7 @@
>  #include "hw/riscv/shakti_c.h"
>  #include "qapi/error.h"
>  #include "hw/intc/sifive_plic.h"
> -#include "hw/intc/sifive_clint.h"
> +#include "hw/intc/riscv_aclint.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/qdev-properties.h"
>  #include "exec/address-spaces.h"
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index 03bff21527..1c55435d8a 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -41,7 +41,7 @@
>  #include "hw/riscv/sifive_e.h"
>  #include "hw/riscv/boot.h"
>  #include "hw/char/sifive_uart.h"
> -#include "hw/intc/sifive_clint.h"
> +#include "hw/intc/riscv_aclint.h"
>  #include "hw/intc/sifive_plic.h"
>  #include "hw/misc/sifive_e_prci.h"
>  #include "chardev/char.h"
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index e4eeb25596..d1211e1c3d 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -51,7 +51,7 @@
>  #include "hw/riscv/sifive_u.h"
>  #include "hw/riscv/boot.h"
>  #include "hw/char/sifive_uart.h"
> -#include "hw/intc/sifive_clint.h"
> +#include "hw/intc/riscv_aclint.h"
>  #include "hw/intc/sifive_plic.h"
>  #include "chardev/char.h"
>  #include "net/eth.h"
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index fead77f0c4..f682b7ed4e 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -35,7 +35,7 @@
>  #include "hw/riscv/boot.h"
>  #include "hw/riscv/numa.h"
>  #include "hw/char/riscv_htif.h"
> -#include "hw/intc/sifive_clint.h"
> +#include "hw/intc/riscv_aclint.h"
>  #include "chardev/char.h"
>  #include "sysemu/arch_init.h"
>  #include "sysemu/device_tree.h"
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 4db40bacae..66de5d3767 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -32,7 +32,7 @@
>  #include "hw/riscv/virt.h"
>  #include "hw/riscv/boot.h"
>  #include "hw/riscv/numa.h"
> -#include "hw/intc/sifive_clint.h"
> +#include "hw/intc/riscv_aclint.h"
>  #include "hw/intc/sifive_plic.h"
>  #include "hw/misc/sifive_test.h"
>  #include "chardev/char.h"
> diff --git a/include/hw/intc/sifive_clint.h b/include/hw/intc/riscv_aclint.h
> similarity index 100%
> rename from include/hw/intc/sifive_clint.h
> rename to include/hw/intc/riscv_aclint.h
> --
> 2.25.1
>
>

