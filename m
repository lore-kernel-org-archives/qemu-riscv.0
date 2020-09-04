Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kEFnk-0006Mf-Eq
	for mharc-qemu-riscv@gnu.org; Fri, 04 Sep 2020 13:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kEFni-0006Kr-NJ; Fri, 04 Sep 2020 13:47:02 -0400
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742]:37868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kEFng-0007pQ-9n; Fri, 04 Sep 2020 13:47:02 -0400
Received: by mail-qk1-x742.google.com with SMTP id b14so7106009qkn.4;
 Fri, 04 Sep 2020 10:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VglmG65lYbuT3KFIPHB7uL7SOW1V6cPg35PHIJJbUIA=;
 b=MKIWNE5XedaVVnGJWM2oNeP/MKDT/o891fGSGnxxD7+jjlOr9ccNeBRPoBhtGJnX6z
 wrnmTYrU1gENxcedceOsUjtAIPk5+YHp038ZeZdq2hxOypptbWWrTqf3x9uxqqm3y+q4
 zNAQ81W0c9RtSNXaIiQtUy+yzUyvcVthlQnJOIU1irvgH6aEXpHxcLNUmHGy5Fd8F/wR
 bzVWUNYhlHAMd4Zn81/ilLEshkECdWlKco9oDQmFGafYlQwdK4cBfGuqw2XmYiaGWG6K
 Ige+qLL9tXCKVuK+rhi8zk35TPKQ4rlSDCEPdWXRB1ycn/vZDCFdcVro+HamaCm+odfm
 0Bmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VglmG65lYbuT3KFIPHB7uL7SOW1V6cPg35PHIJJbUIA=;
 b=badqkllXB8cQ8l6J/uZev/dNGN3Nmyq3VBuJSeP0IX6snZ+nBBeaRCtKqVz/CNk6lT
 f6trh6Z/90SVtcJIjYGqFeLKSjOryRU69QZfObPW5XBMO6ies8Cp8clMNYMdllDXAOk8
 GDeeE4zUkAToHxrw7u9XKzeLjES1NL72O1g9uaVoV6bF4V3Sqct5oVBuVIWv/EzCxlvE
 oMFr2VADSlCtK5xI673FjowBWsZ6XiB6sxg+7r+HVFvxTsrZU9Ppl9skLwrdcHH+aqRc
 mu/Gv7CUFoyjm5+3FWM3fThVA9YkHyM3Mxgtuv6mb94vQOPPfXHw/BSTbTTFkgG8P6eW
 1XQA==
X-Gm-Message-State: AOAM530z215wn8gHv4CoDiNDp3kxJCG6ZLzMvnMcj7/eMRn0+x8BtqH5
 3wRwmN0wfThGJvnbnALJK7TIu+cnexrKiU0taXk=
X-Google-Smtp-Source: ABdhPJxdCStpJpCKfdcdorSDUpbJXSI2Z9cKn3iuJ/zSgela2QnH+Es5wxAH6ofVwuW8QWvVgdk/OvwmrL9UA8Mq8b0=
X-Received: by 2002:ae9:f44c:: with SMTP id z12mr9019103qkl.339.1599241618973; 
 Fri, 04 Sep 2020 10:46:58 -0700 (PDT)
MIME-Version: 1.0
References: <1599129623-68957-1-git-send-email-bmeng.cn@gmail.com>
 <1599129623-68957-8-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1599129623-68957-8-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 4 Sep 2020 10:36:04 -0700
Message-ID: <CAKmqyKPzKAfgtLEeCYidQj5wSO8Kc3r=2WWOsW1+hTtSWW9kCw@mail.gmail.com>
Subject: Re: [PATCH 07/12] hw/riscv: Move riscv_htif model to hw/char
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::742;
 envelope-from=alistair23@gmail.com; helo=mail-qk1-x742.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Fri, 04 Sep 2020 17:47:03 -0000

On Thu, Sep 3, 2020 at 3:48 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> This is an effort to clean up the hw/riscv directory. Ideally it
> should only contain the RISC-V SoC / machine codes plus generic
> codes. Let's move riscv_htif model to hw/char directory.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  include/hw/{riscv => char}/riscv_htif.h | 0
>  hw/{riscv => char}/riscv_htif.c         | 2 +-
>  hw/riscv/spike.c                        | 2 +-
>  hw/char/Kconfig                         | 3 +++
>  hw/char/meson.build                     | 1 +
>  hw/riscv/Kconfig                        | 3 ---
>  hw/riscv/meson.build                    | 1 -
>  7 files changed, 6 insertions(+), 6 deletions(-)
>  rename include/hw/{riscv => char}/riscv_htif.h (100%)
>  rename hw/{riscv => char}/riscv_htif.c (99%)
>
> diff --git a/include/hw/riscv/riscv_htif.h b/include/hw/char/riscv_htif.h
> similarity index 100%
> rename from include/hw/riscv/riscv_htif.h
> rename to include/hw/char/riscv_htif.h
> diff --git a/hw/riscv/riscv_htif.c b/hw/char/riscv_htif.c
> similarity index 99%
> rename from hw/riscv/riscv_htif.c
> rename to hw/char/riscv_htif.c
> index ca87a5c..ba1af1c 100644
> --- a/hw/riscv/riscv_htif.c
> +++ b/hw/char/riscv_htif.c
> @@ -24,10 +24,10 @@
>  #include "qapi/error.h"
>  #include "qemu/log.h"
>  #include "hw/sysbus.h"
> +#include "hw/char/riscv_htif.h"
>  #include "hw/char/serial.h"
>  #include "chardev/char.h"
>  #include "chardev/char-fe.h"
> -#include "hw/riscv/riscv_htif.h"
>  #include "qemu/timer.h"
>  #include "qemu/error-report.h"
>
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 59d9d87..3fd152a 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -31,11 +31,11 @@
>  #include "hw/loader.h"
>  #include "hw/sysbus.h"
>  #include "target/riscv/cpu.h"
> -#include "hw/riscv/riscv_htif.h"
>  #include "hw/riscv/riscv_hart.h"
>  #include "hw/riscv/spike.h"
>  #include "hw/riscv/boot.h"
>  #include "hw/riscv/numa.h"
> +#include "hw/char/riscv_htif.h"
>  #include "hw/intc/sifive_clint.h"
>  #include "chardev/char.h"
>  #include "sysemu/arch_init.h"
> diff --git a/hw/char/Kconfig b/hw/char/Kconfig
> index 1d64555..91da92f 100644
> --- a/hw/char/Kconfig
> +++ b/hw/char/Kconfig
> @@ -1,6 +1,9 @@
>  config ESCC
>      bool
>
> +config HTIF
> +    bool
> +
>  config PARALLEL
>      bool
>      default y
> diff --git a/hw/char/meson.build b/hw/char/meson.build
> index ae27932..3db623e 100644
> --- a/hw/char/meson.build
> +++ b/hw/char/meson.build
> @@ -34,6 +34,7 @@ softmmu_ss.add(when: 'CONFIG_SH4', if_true: files('sh_serial.c'))
>  softmmu_ss.add(when: 'CONFIG_STM32F2XX_USART', if_true: files('stm32f2xx_usart.c'))
>  softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_MMUART', if_true: files('mchp_pfsoc_mmuart.c'))
>
> +specific_ss.add(when: 'CONFIG_HTIF', if_true: files('riscv_htif.c'))
>  specific_ss.add(when: 'CONFIG_TERMINAL3270', if_true: files('terminal3270.c'))
>  specific_ss.add(when: 'CONFIG_VIRTIO', if_true: files('virtio-serial-bus.c'))
>  specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('spapr_vty.c'))
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index 23b7027..a0e256c 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -1,6 +1,3 @@
> -config HTIF
> -    bool
> -
>  config HART
>      bool
>
> diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
> index 535a142..619bf80 100644
> --- a/hw/riscv/meson.build
> +++ b/hw/riscv/meson.build
> @@ -8,7 +8,6 @@ riscv_ss.add(when: 'CONFIG_SIFIVE', if_true: files('sifive_test.c'))
>  riscv_ss.add(when: 'CONFIG_SIFIVE', if_true: files('sifive_uart.c'))
>  riscv_ss.add(when: 'CONFIG_SIFIVE_E', if_true: files('sifive_e.c'))
>  riscv_ss.add(when: 'CONFIG_SIFIVE_U', if_true: files('sifive_u.c'))
> -riscv_ss.add(when: 'CONFIG_SPIKE', if_true: files('riscv_htif.c'))
>  riscv_ss.add(when: 'CONFIG_SPIKE', if_true: files('spike.c'))
>  riscv_ss.add(when: 'CONFIG_MICROCHIP_PFSOC', if_true: files('microchip_pfsoc.c'))
>
> --
> 2.7.4
>
>

