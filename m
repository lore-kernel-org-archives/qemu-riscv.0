Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mAK4w-0000vY-DA
	for mharc-qemu-riscv@gnu.org; Sun, 01 Aug 2021 18:37:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mAK4u-0000np-M3; Sun, 01 Aug 2021 18:37:04 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:41830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mAK4t-0001xD-4A; Sun, 01 Aug 2021 18:37:04 -0400
Received: by mail-io1-xd2d.google.com with SMTP id r6so9890291ioj.8;
 Sun, 01 Aug 2021 15:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8dFdR8UmpJAujbDvswj07C3NwFrmKxgb0gK8Ku0cle8=;
 b=CA/vQ+Ain+lkIjd/6NGBYRyXdohN+11IbNcjxseTVI4U4g5NqAi84vcT9ddE8yOneS
 LBtW5rSOBGXQW69KfuVFrXEaK1pfjw7Z3SD9pTzqhUCDHLEaGL5hAuZTGaMSBnpDJoEc
 /3aPdVd6nr0YZUwAlKwJ6LTBTbVtLovtWOvA2FFTuKnLd2Y85P6SluWr+c6FoiZUyviU
 0zk1kKlFkCU7IQRwaF23U0n1OwFSXkSg/JMafN4t0PWFRNeBaQhTV2Q1mhH/jvDVEsHC
 aJEhorZOFfM1GJAlktsA7BDghRxf1WGCAlPI3SOAsq07qTi4Yig4/7GUFjvOvG+90V4A
 etLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8dFdR8UmpJAujbDvswj07C3NwFrmKxgb0gK8Ku0cle8=;
 b=p6G/A8EJdXJrZi3qOY50AFmlLOvA9vhMGASlrNRGs0MfXnpO+YBJLR73EwcvQcOMEZ
 jL3/9oPpv5crXQP/upkl//p5usc2fzEfkE7Ugrdi9Hr/sjevjwK1tjigayu5ZI8Y407j
 QZ+rLT41XeZ8AVj+4sLhPcBZSEkt6gHu2WtTdBLEgMtwgPvmsh2ItTa22jVhPEbtS5jR
 3SZMsVdwHi58bwvgsKuEk/hDHdkN1kWf7oEIxXUmgbkZccL/u5RcGe/+HR3iVmbTLyEQ
 af4DOG17TE2HGDO9KG9CRVXrjWK5IQoPcOhOo8qpeXqQegpbfLsrBDhra0/TF3OuJwkt
 rQhw==
X-Gm-Message-State: AOAM531I4IJmS7RcI7a+NBD412t39fckdbr0UyGlbyZdnkiXRVbfI0jS
 cEO+7pg38YzuIlQysin67TA1RTpNFGoAwT9Wi2I=
X-Google-Smtp-Source: ABdhPJwLBRAGBNwUN0lqPoaa3YCwFVrcAABPzQY3KJyp29uiWuHHYDWegCHWbwqrK62pp/8SdfNKPO5KwsoSPcXTGGI=
X-Received: by 2002:a05:6638:418f:: with SMTP id
 az15mr12095554jab.8.1627857421344; 
 Sun, 01 Aug 2021 15:37:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210731190229.137483-1-vijai@behindbytes.com>
In-Reply-To: <20210731190229.137483-1-vijai@behindbytes.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 2 Aug 2021 08:36:35 +1000
Message-ID: <CAKmqyKN7HfVHDNpB+QmRuC-0vpPXfQ2EZk-x1PZJWt-HOdPJjw@mail.gmail.com>
Subject: Re: [PATCH] hw/char: Add config for shakti uart
To: Vijai Kumar K <vijai@behindbytes.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2d.google.com
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
X-List-Received-Date: Sun, 01 Aug 2021 22:37:04 -0000

On Sun, Aug 1, 2021 at 5:03 AM Vijai Kumar K <vijai@behindbytes.com> wrote:
>
> Use a dedicated UART config(CONFIG_SHAKTI_UART) to select
> shakti uart.
>
> Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/char/Kconfig     | 3 +++
>  hw/char/meson.build | 2 +-
>  hw/riscv/Kconfig    | 5 +----
>  3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/hw/char/Kconfig b/hw/char/Kconfig
> index 2e4f620b13..6b6cf2fc1d 100644
> --- a/hw/char/Kconfig
> +++ b/hw/char/Kconfig
> @@ -68,3 +68,6 @@ config SIFIVE_UART
>
>  config GOLDFISH_TTY
>      bool
> +
> +config SHAKTI_UART
> +    bool
> diff --git a/hw/char/meson.build b/hw/char/meson.build
> index 8361d0ab28..7b594f51b8 100644
> --- a/hw/char/meson.build
> +++ b/hw/char/meson.build
> @@ -16,7 +16,7 @@ softmmu_ss.add(when: 'CONFIG_SERIAL', if_true: files('serial.c'))
>  softmmu_ss.add(when: 'CONFIG_SERIAL_ISA', if_true: files('serial-isa.c'))
>  softmmu_ss.add(when: 'CONFIG_SERIAL_PCI', if_true: files('serial-pci.c'))
>  softmmu_ss.add(when: 'CONFIG_SERIAL_PCI_MULTI', if_true: files('serial-pci-multi.c'))
> -softmmu_ss.add(when: 'CONFIG_SHAKTI', if_true: files('shakti_uart.c'))
> +softmmu_ss.add(when: 'CONFIG_SHAKTI_UART', if_true: files('shakti_uart.c'))
>  softmmu_ss.add(when: 'CONFIG_VIRTIO_SERIAL', if_true: files('virtio-console.c'))
>  softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen_console.c'))
>  softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_uartlite.c'))
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index 0590f443fd..ff75add6f3 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -22,13 +22,10 @@ config OPENTITAN
>      select IBEX
>      select UNIMP
>
> -config SHAKTI
> -    bool
> -
>  config SHAKTI_C
>      bool
>      select UNIMP
> -    select SHAKTI
> +    select SHAKTI_UART
>      select SIFIVE_CLINT
>      select SIFIVE_PLIC
>
> --
> 2.25.1
>
>
>

