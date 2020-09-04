Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kEFdq-0005xZ-Fi
	for mharc-qemu-riscv@gnu.org; Fri, 04 Sep 2020 13:36:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kEFdo-0005xF-FC; Fri, 04 Sep 2020 13:36:48 -0400
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:40529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kEFdm-0006aw-NG; Fri, 04 Sep 2020 13:36:48 -0400
Received: by mail-qk1-x743.google.com with SMTP id w16so7052572qkj.7;
 Fri, 04 Sep 2020 10:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aLFgdwHSKWo6/QJKySfrLCTemjnfCQL03waWC2X/MdE=;
 b=hVmdgPeQjZQLdpFZD+AVffzsU+AUc7JeLcRYS19/GRCigDuvokTFrDhW6Aym9NMNa6
 x3L1SFgqA/UZWs+5DjIhS07i2ql0UooBtS9orLrE05cTCbU2Kf7mPfQLW4rml5yMMafz
 licEasGm1Pcj8n0HJIKDuXe3fbKLcnMG+iIjAfTMzeadxnb9w2+pa0oaCkNJpnKc4iAO
 AZGNX0OoA7U654azjUoNyhiMuiU82X46C1ljpUF/GDJzGH0DOPjX50yHkOfzVmpsN+MF
 sKG12+14003aspW7i+ouEhivx1zz97wWXwqbisC3FXBNoSisLGGiTrQYqQyotBGoK5I4
 0coA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aLFgdwHSKWo6/QJKySfrLCTemjnfCQL03waWC2X/MdE=;
 b=ToHrxusPtR46UGKTanGgwq+UIFg96oindK9a1HpgFjzHmxg/qsHEfRzxf3swIKrR16
 jwQZ50ibLYvVVqqeP0rKUeFIsWs8kEMlTy3kGF9i2VDNv2SpQrlUUo7Aov6LIlCoxylx
 9S3dUFZND5q8SZsf9ut7q1VoCBepvfU2oCx97WwQBrh8UOHr/DKub8ygEK7dPCeu2nbe
 I4hk1IZA4hWK6ZJyVsHXHd6PIkuKqErICUcKr26OHQUfp+nGDIh1aXEJJpwxDPoILl+d
 B03+qq/IzuVJnnL0j3CZsWuYbe0VQCyr/WHbRNz+DE0Qj2UjgajzG9nKBP2SQ041mp7o
 no7g==
X-Gm-Message-State: AOAM531azk1rCxRU0Dtc0YpwlXrMepmRUCGsJet+0Dt/CIdkkCstJqX1
 nQIxCNrwA9LaSgSCiSw3sG+v/bJ8xOgTQXpwvOI=
X-Google-Smtp-Source: ABdhPJxR4aQPGrxOQi13qAS8vQqDjTbfX6S6HrzZgpHgg3OmZVDCCwjq+04H/thx53Y+0zmyBvj1++l96WqlvL6TLew=
X-Received: by 2002:a37:a5ca:: with SMTP id o193mr8998229qke.126.1599241005194; 
 Fri, 04 Sep 2020 10:36:45 -0700 (PDT)
MIME-Version: 1.0
References: <1599129623-68957-1-git-send-email-bmeng.cn@gmail.com>
 <1599129623-68957-3-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1599129623-68957-3-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 4 Sep 2020 10:25:50 -0700
Message-ID: <CAKmqyKMpX1nEF70i=8aEvwBmPvzcVCGNmu8NLUd99_k+JhGkCQ@mail.gmail.com>
Subject: Re: [PATCH 02/12] hw/riscv: Move sifive_u_prci model to hw/misc
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::743;
 envelope-from=alistair23@gmail.com; helo=mail-qk1-x743.google.com
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
X-List-Received-Date: Fri, 04 Sep 2020 17:36:48 -0000

On Thu, Sep 3, 2020 at 3:41 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> This is an effort to clean up the hw/riscv directory. Ideally it
> should only contain the RISC-V SoC / machine codes plus generic
> codes. Let's move sifive_u_prci model to hw/misc directory.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  include/hw/{riscv => misc}/sifive_u_prci.h | 0
>  include/hw/riscv/sifive_u.h                | 2 +-
>  hw/{riscv => misc}/sifive_u_prci.c         | 2 +-
>  hw/misc/Kconfig                            | 3 +++
>  hw/misc/meson.build                        | 1 +
>  hw/riscv/Kconfig                           | 1 +
>  hw/riscv/meson.build                       | 1 -
>  7 files changed, 7 insertions(+), 3 deletions(-)
>  rename include/hw/{riscv => misc}/sifive_u_prci.h (100%)
>  rename hw/{riscv => misc}/sifive_u_prci.c (99%)
>
> diff --git a/include/hw/riscv/sifive_u_prci.h b/include/hw/misc/sifive_u_prci.h
> similarity index 100%
> rename from include/hw/riscv/sifive_u_prci.h
> rename to include/hw/misc/sifive_u_prci.h
> diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
> index 793000a..cbeb228 100644
> --- a/include/hw/riscv/sifive_u.h
> +++ b/include/hw/riscv/sifive_u.h
> @@ -24,8 +24,8 @@
>  #include "hw/riscv/riscv_hart.h"
>  #include "hw/riscv/sifive_cpu.h"
>  #include "hw/riscv/sifive_gpio.h"
> -#include "hw/riscv/sifive_u_prci.h"
>  #include "hw/riscv/sifive_u_otp.h"
> +#include "hw/misc/sifive_u_prci.h"
>
>  #define TYPE_RISCV_U_SOC "riscv.sifive.u.soc"
>  #define RISCV_U_SOC(obj) \
> diff --git a/hw/riscv/sifive_u_prci.c b/hw/misc/sifive_u_prci.c
> similarity index 99%
> rename from hw/riscv/sifive_u_prci.c
> rename to hw/misc/sifive_u_prci.c
> index 4fa590c..5d9d446 100644
> --- a/hw/riscv/sifive_u_prci.c
> +++ b/hw/misc/sifive_u_prci.c
> @@ -22,7 +22,7 @@
>  #include "hw/sysbus.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
> -#include "hw/riscv/sifive_u_prci.h"
> +#include "hw/misc/sifive_u_prci.h"
>
>  static uint64_t sifive_u_prci_read(void *opaque, hwaddr addr, unsigned int size)
>  {
> diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> index 5073986..65f3fdd 100644
> --- a/hw/misc/Kconfig
> +++ b/hw/misc/Kconfig
> @@ -137,4 +137,7 @@ config AVR_POWER
>  config SIFIVE_E_PRCI
>      bool
>
> +config SIFIVE_U_PRCI
> +    bool
> +
>  source macio/Kconfig
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index b6b2e57..9e9550e 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -23,6 +23,7 @@ softmmu_ss.add(when: 'CONFIG_MOS6522', if_true: files('mos6522.c'))
>
>  # RISC-V devices
>  softmmu_ss.add(when: 'CONFIG_SIFIVE_E_PRCI', if_true: files('sifive_e_prci.c'))
> +softmmu_ss.add(when: 'CONFIG_SIFIVE_U_PRCI', if_true: files('sifive_u_prci.c'))
>
>  # PKUnity SoC devices
>  softmmu_ss.add(when: 'CONFIG_PUV3', if_true: files('puv3_pm.c'))
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index 5855e99..109364b 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -24,6 +24,7 @@ config SIFIVE_U
>      select HART
>      select SIFIVE
>      select SIFIVE_PDMA
> +    select SIFIVE_U_PRCI
>      select UNIMP
>
>  config SPIKE
> diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
> index d73ea99..e6c8af0 100644
> --- a/hw/riscv/meson.build
> +++ b/hw/riscv/meson.build
> @@ -12,7 +12,6 @@ riscv_ss.add(when: 'CONFIG_SIFIVE', if_true: files('sifive_uart.c'))
>  riscv_ss.add(when: 'CONFIG_SIFIVE_E', if_true: files('sifive_e.c'))
>  riscv_ss.add(when: 'CONFIG_SIFIVE_U', if_true: files('sifive_u.c'))
>  riscv_ss.add(when: 'CONFIG_SIFIVE_U', if_true: files('sifive_u_otp.c'))
> -riscv_ss.add(when: 'CONFIG_SIFIVE_U', if_true: files('sifive_u_prci.c'))
>  riscv_ss.add(when: 'CONFIG_SPIKE', if_true: files('riscv_htif.c'))
>  riscv_ss.add(when: 'CONFIG_SPIKE', if_true: files('spike.c'))
>  riscv_ss.add(when: 'CONFIG_MICROCHIP_PFSOC', if_true: files('microchip_pfsoc.c'))
> --
> 2.7.4
>
>

