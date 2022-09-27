Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1od50X-0001g8-VP
	for mharc-qemu-riscv@gnu.org; Tue, 27 Sep 2022 03:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1od50V-0001bb-5Q
 for qemu-riscv@nongnu.org; Tue, 27 Sep 2022 03:27:56 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:39827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1od50Q-00011r-43
 for qemu-riscv@nongnu.org; Tue, 27 Sep 2022 03:27:54 -0400
Received: by mail-lj1-x22e.google.com with SMTP id b24so9941768ljk.6
 for <qemu-riscv@nongnu.org>; Tue, 27 Sep 2022 00:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=haCK0uGWBMhrQFtDRY/x3OWRzaddirzD4itaZfSn58A=;
 b=Z0hqLKQ9lQx4ewWkAbhZ8LvRpZZiiEIdjA5vtmD/qGlRIH8HBrt9T31Q3q74GsizHO
 LIflDPrw5gn7Q+lWy3jUtWH7L4UMMrPuLj4SrSz85paSeY38BmsF+kddzRGFNBYMAHW6
 k2qXfnVPjJDhfrJCEFNi/OEFpDoxENbtFdl/0XTf6KImoqHmF5zt4sHvEKlByYUZNX4f
 OIZ2e8YKwRn+RZGh+dhnklveuXyCFlcX763teBYv43Tb77sPkxL8f4+UnLH0XiCPzy5p
 YMtUdlY4oQzHWQihm1Dixi/lcSShp89Ix6iyb6qkyse/TWKssx84KIHcN3ToQTMFh1Fk
 i4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=haCK0uGWBMhrQFtDRY/x3OWRzaddirzD4itaZfSn58A=;
 b=avOUv1nJQTcpsMq3HaXd6J1jieZNqpMaiu4VlNfoYLe1I0NNo3BvyHw1KEwGd4cI71
 1trKOnlDBaOLKuCR9ibBxjBq7q+fA30qLM9HqNyKyD/XzEvcbuXmBsry3SSjAjj9lehf
 Hu+FYvuBLQ+DhrEWYuAE5jWhB3iTLC+s5VnYLqFTdhADUiV2uAMN8PpMOw99TGTjh6LH
 rlx9ZDXGluXyZdbYERXLFq+USx20bS1Lg4LkebWm/XHEZ3IE0t9xUeRgCH5aOAW6wsPs
 ERK4mc4KbzvkTmWVyAqg4YIcs1MfZH7rcjI4ZvnPqK0sWo6SG0t3wBvPW+TEXwiytl5Y
 7gjA==
X-Gm-Message-State: ACrzQf1NRfbNRfVa6C6n+CjfL3lbp7EiN66G99cS8GgJtPQkqHinxVj7
 of8pvcfT4ldOpvd9fk6LN5ZFaAce3/xe7WOI
X-Google-Smtp-Source: AMsMyM4h3e9maytCnOiZdTXUprE/Cr6FtJeKG+GuRssgJkOzAEb7pCWKrw1jpwKYDDoZ17kg6Io9hw==
X-Received: by 2002:a2e:6a04:0:b0:26c:3d75:5d84 with SMTP id
 f4-20020a2e6a04000000b0026c3d755d84mr9285320ljc.162.1664263668162; 
 Tue, 27 Sep 2022 00:27:48 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174]) by smtp.gmail.com with ESMTPSA id
 u24-20020ac24c38000000b004a1e104b269sm80047lfq.34.2022.09.27.00.27.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 00:27:47 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id b6so9925468ljr.10;
 Tue, 27 Sep 2022 00:27:46 -0700 (PDT)
X-Received: by 2002:a2e:7a15:0:b0:26c:6543:e4a9 with SMTP id
 v21-20020a2e7a15000000b0026c6543e4a9mr8655943ljc.204.1664263666129; Tue, 27
 Sep 2022 00:27:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220922084107.2834285-1-tommy.wu@sifive.com>
 <20220922084107.2834285-3-tommy.wu@sifive.com>
In-Reply-To: <20220922084107.2834285-3-tommy.wu@sifive.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Tue, 27 Sep 2022 15:27:34 +0800
X-Gmail-Original-Message-ID: <CANzO1D2=KsgCk9PLE5B6U7VX5Ytu=J_+fe2DbF6QFDHJJF5mAQ@mail.gmail.com>
Message-ID: <CANzO1D2=KsgCk9PLE5B6U7VX5Ytu=J_+fe2DbF6QFDHJJF5mAQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/riscv: sifive_e: Support the watchdog timer of
 HiFive 1 rev b.
To: Tommy Wu <tommy.wu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, bin.meng@windriver.com, jim.shu@sifive.com, 
 frank.chang@sifive.com
Content-Type: multipart/alternative; boundary="000000000000a1dfd805e9a39467"
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=frank.chang@sifive.com; helo=mail-lj1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 27 Sep 2022 07:27:56 -0000

--000000000000a1dfd805e9a39467
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Frank Chang <frank.chang@sifive.com>

On Thu, Sep 22, 2022 at 4:41 PM Tommy Wu <tommy.wu@sifive.com> wrote:

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
> @@ -222,8 +223,8 @@ static void sifive_e_soc_realize(DeviceState *dev,
> Error **errp)
>          RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, ms->smp.cpus,
>          RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
>          RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, false);
> -    create_unimplemented_device("riscv.sifive.e.aon",
> -        memmap[SIFIVE_E_DEV_AON].base, memmap[SIFIVE_E_DEV_AON].size);
> +    sifive_e_aon_create(sys_mem, memmap[SIFIVE_E_DEV_AON].base,
> +        qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_E_AON_WDT_IRQ));
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
>

--000000000000a1dfd805e9a39467
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Frank Chang &lt;<a href=3D"mailto:frank.chang=
@sifive.com">frank.chang@sifive.com</a>&gt;<br></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 22, 2022 at 4:41=
 PM Tommy Wu &lt;<a href=3D"mailto:tommy.wu@sifive.com">tommy.wu@sifive.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Create the AON device when we realize the sifive_e machine.<br>
This patch only implemented the functionality of the watchdog timer,<br>
not all the functionality of the AON device.<br>
<br>
Signed-off-by: Tommy Wu &lt;<a href=3D"mailto:tommy.wu@sifive.com" target=
=3D"_blank">tommy.wu@sifive.com</a>&gt;<br>
---<br>
=C2=A0hw/riscv/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
=C2=A0hw/riscv/sifive_e.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 +++--<br>
=C2=A0include/hw/riscv/sifive_e.h | 7 ++++---<br>
=C2=A03 files changed, 8 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig<br>
index 79ff61c464..50890b1b75 100644<br>
--- a/hw/riscv/Kconfig<br>
+++ b/hw/riscv/Kconfig<br>
@@ -59,6 +59,7 @@ config SIFIVE_E<br>
=C2=A0 =C2=A0 =C2=A0select SIFIVE_PLIC<br>
=C2=A0 =C2=A0 =C2=A0select SIFIVE_UART<br>
=C2=A0 =C2=A0 =C2=A0select SIFIVE_E_PRCI<br>
+=C2=A0 =C2=A0 select SIFIVE_E_AON<br>
=C2=A0 =C2=A0 =C2=A0select UNIMP<br>
<br>
=C2=A0config SIFIVE_U<br>
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c<br>
index d65d2fd869..f9c05cfd3a 100644<br>
--- a/hw/riscv/sifive_e.c<br>
+++ b/hw/riscv/sifive_e.c<br>
@@ -45,6 +45,7 @@<br>
=C2=A0#include &quot;hw/intc/riscv_aclint.h&quot;<br>
=C2=A0#include &quot;hw/intc/sifive_plic.h&quot;<br>
=C2=A0#include &quot;hw/misc/sifive_e_prci.h&quot;<br>
+#include &quot;hw/misc/sifive_e_aon.h&quot;<br>
=C2=A0#include &quot;chardev/char.h&quot;<br>
=C2=A0#include &quot;sysemu/sysemu.h&quot;<br>
<br>
@@ -222,8 +223,8 @@ static void sifive_e_soc_realize(DeviceState *dev, Erro=
r **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, ms-&=
gt;smp.cpus,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLI=
NT_DEFAULT_MTIME,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, false=
);<br>
-=C2=A0 =C2=A0 create_unimplemented_device(&quot;riscv.sifive.e.aon&quot;,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 memmap[SIFIVE_E_DEV_AON].base, memmap[SIFIVE_E=
_DEV_AON].size);<br>
+=C2=A0 =C2=A0 sifive_e_aon_create(sys_mem, memmap[SIFIVE_E_DEV_AON].base,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_get_gpio_in(DEVICE(s-&gt;plic), SIFIVE_E_=
AON_WDT_IRQ));<br>
=C2=A0 =C2=A0 =C2=A0sifive_e_prci_create(memmap[SIFIVE_E_DEV_PRCI].base);<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0/* GPIO */<br>
diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h<br>
index 83604da805..7de2221564 100644<br>
--- a/include/hw/riscv/sifive_e.h<br>
+++ b/include/hw/riscv/sifive_e.h<br>
@@ -75,9 +75,10 @@ enum {<br>
=C2=A0};<br>
<br>
=C2=A0enum {<br>
-=C2=A0 =C2=A0 SIFIVE_E_UART0_IRQ=C2=A0 =3D 3,<br>
-=C2=A0 =C2=A0 SIFIVE_E_UART1_IRQ=C2=A0 =3D 4,<br>
-=C2=A0 =C2=A0 SIFIVE_E_GPIO0_IRQ0 =3D 8<br>
+=C2=A0 =C2=A0 SIFIVE_E_AON_WDT_IRQ=C2=A0 =3D 1,<br>
+=C2=A0 =C2=A0 SIFIVE_E_UART0_IRQ=C2=A0 =C2=A0 =3D 3,<br>
+=C2=A0 =C2=A0 SIFIVE_E_UART1_IRQ=C2=A0 =C2=A0 =3D 4,<br>
+=C2=A0 =C2=A0 SIFIVE_E_GPIO0_IRQ0=C2=A0 =C2=A0=3D 8<br>
=C2=A0};<br>
<br>
=C2=A0#define SIFIVE_E_PLIC_HART_CONFIG &quot;M&quot;<br>
-- <br>
2.27.0<br>
<br>
<br>
</blockquote></div>

--000000000000a1dfd805e9a39467--

