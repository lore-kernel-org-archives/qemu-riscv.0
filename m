Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hunBM-0003Tz-Dj
	for mharc-qemu-riscv@gnu.org; Mon, 05 Aug 2019 20:18:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35023)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hunBI-0003QO-Te
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 20:18:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hunBG-0002wk-Vd
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 20:18:24 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:34024)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hunBB-0002uX-9U; Mon, 05 Aug 2019 20:18:17 -0400
Received: by mail-lf1-x144.google.com with SMTP id b29so52226303lfq.1;
 Mon, 05 Aug 2019 17:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vc5snXniZkcoJWtJS8yGC0bGxrsO2LrNW352hKJbD+8=;
 b=hcxUkKMYR2GnV7b6D53u7LnFxLqMtEhUD6YWVIE9x+pXZL3fii2CZ2BAhADuNi54pQ
 iZpjedM6SiONx+6AO3DQeOIXdbq9V8D7Hn3B8BYCoa+E7SmPyTvupwbiX55zjjkDpCRC
 qvz4WkYEDO1xPeRQRI8XYeB7t1FCfKLsIFExWlH1iZBaSRJ5Ck2+7eatFszauJp96FNP
 Z4F8pggfEnQ4vyGLAHYI4YE+g3O6qv4DRpN68CO1k5FPf7eBHyekYrF8090VHeW7uIDr
 hWyqhxLaGgEne7MMnJBX+8l3sWdxyb5k9SWO/m96m5I5rHY6LlVf9rl+BCLMdNyfkXtc
 DlJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vc5snXniZkcoJWtJS8yGC0bGxrsO2LrNW352hKJbD+8=;
 b=G6Hk2/xfx7IwtcVDw9IaxkvVbJXkehphhNoEk7AN18Ii3iDxyncIcriLq2TWTMNd3g
 Aqecn5c4vvdhtBieB0gq5f7nsa/No5EGmiP8pIRG209PUPw1IESWPWLoA1YD9UYGamIf
 U1eAOXW3KefhRm4Pg5nDAgg8T6QpAQbn3ZqCWtF3728ZhQM58lvvr7jE57azM40OYaDy
 gXmOpUruSOieOngai7bjtvKyzlo+VjryB735vnzQxpf3tli8j7grEms2KNNF7QbVjJip
 5G/YBTyjT3EnTmrKZaibpIUjcjeeuhq9udDaE/nNPdCq42AOBa3YKpYDvX5R1gRNHm1P
 un8g==
X-Gm-Message-State: APjAAAVsSbAgjAFasexNMEjUu03u7S7F/2bjE6azKd2Qx/4EEsJ3JvzZ
 ycbxfcj+TxrHPb0+OopV6LROL88SKRortN3OQuanrFRO
X-Google-Smtp-Source: APXvYqzqtjPY3C0Mj99YMdIjTkZuJktLAVgH/8c37fX3GyukU6iCWnB7GvVebPmpy24z1GSobzB7WO4x7CF2l936hIE=
X-Received: by 2002:a19:c6d4:: with SMTP id w203mr227736lff.135.1565050696110; 
 Mon, 05 Aug 2019 17:18:16 -0700 (PDT)
MIME-Version: 1.0
References: <1565020823-24223-1-git-send-email-bmeng.cn@gmail.com>
 <1565020823-24223-4-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1565020823-24223-4-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 5 Aug 2019 17:14:36 -0700
Message-ID: <CAKmqyKO1r=wmT4vzw_8i41BPS3U5-Ei4JV7APqOCD7en1z4qig@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::144
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 03/28] riscv: Add a
 sifive_cpu.h to include both E and U cpu type defines
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
X-List-Received-Date: Tue, 06 Aug 2019 00:18:26 -0000

On Mon, Aug 5, 2019 at 9:07 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Group SiFive E and U cpu type defines into one header file.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  include/hw/riscv/sifive_cpu.h | 31 +++++++++++++++++++++++++++++++
>  include/hw/riscv/sifive_e.h   |  7 +------
>  include/hw/riscv/sifive_u.h   |  7 +------
>  3 files changed, 33 insertions(+), 12 deletions(-)
>  create mode 100644 include/hw/riscv/sifive_cpu.h
>
> diff --git a/include/hw/riscv/sifive_cpu.h b/include/hw/riscv/sifive_cpu.h
> new file mode 100644
> index 0000000..1367996
> --- /dev/null
> +++ b/include/hw/riscv/sifive_cpu.h
> @@ -0,0 +1,31 @@
> +/*
> + * SiFive CPU types
> + *
> + * Copyright (c) 2017 SiFive, Inc.
> + * Copyright (c) 2019 Bin Meng <bmeng.cn@gmail.com>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef HW_SIFIVE_CPU_H
> +#define HW_SIFIVE_CPU_H
> +
> +#if defined(TARGET_RISCV32)
> +#define SIFIVE_E_CPU TYPE_RISCV_CPU_SIFIVE_E31
> +#define SIFIVE_U_CPU TYPE_RISCV_CPU_SIFIVE_U34
> +#elif defined(TARGET_RISCV64)
> +#define SIFIVE_E_CPU TYPE_RISCV_CPU_SIFIVE_E51
> +#define SIFIVE_U_CPU TYPE_RISCV_CPU_SIFIVE_U54
> +#endif
> +
> +#endif /* HW_SIFIVE_CPU_H */
> diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
> index d175b24..e17cdfd 100644
> --- a/include/hw/riscv/sifive_e.h
> +++ b/include/hw/riscv/sifive_e.h
> @@ -19,6 +19,7 @@
>  #ifndef HW_SIFIVE_E_H
>  #define HW_SIFIVE_E_H
>
> +#include "hw/riscv/sifive_cpu.h"
>  #include "hw/riscv/sifive_gpio.h"
>
>  #define TYPE_RISCV_E_SOC "riscv.sifive.e.soc"
> @@ -83,10 +84,4 @@ enum {
>  #define SIFIVE_E_PLIC_CONTEXT_BASE 0x200000
>  #define SIFIVE_E_PLIC_CONTEXT_STRIDE 0x1000
>
> -#if defined(TARGET_RISCV32)
> -#define SIFIVE_E_CPU TYPE_RISCV_CPU_SIFIVE_E31
> -#elif defined(TARGET_RISCV64)
> -#define SIFIVE_E_CPU TYPE_RISCV_CPU_SIFIVE_E51
> -#endif
> -
>  #endif
> diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
> index 892f0ee..4abc621 100644
> --- a/include/hw/riscv/sifive_u.h
> +++ b/include/hw/riscv/sifive_u.h
> @@ -20,6 +20,7 @@
>  #define HW_SIFIVE_U_H
>
>  #include "hw/net/cadence_gem.h"
> +#include "hw/riscv/sifive_cpu.h"
>
>  #define TYPE_RISCV_U_SOC "riscv.sifive.u.soc"
>  #define RISCV_U_SOC(obj) \
> @@ -77,10 +78,4 @@ enum {
>  #define SIFIVE_U_PLIC_CONTEXT_BASE 0x200000
>  #define SIFIVE_U_PLIC_CONTEXT_STRIDE 0x1000
>
> -#if defined(TARGET_RISCV32)
> -#define SIFIVE_U_CPU TYPE_RISCV_CPU_SIFIVE_U34
> -#elif defined(TARGET_RISCV64)
> -#define SIFIVE_U_CPU TYPE_RISCV_CPU_SIFIVE_U54
> -#endif
> -
>  #endif
> --
> 2.7.4
>
>

