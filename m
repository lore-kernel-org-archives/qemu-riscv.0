Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mAKwB-0008Vd-56
	for mharc-qemu-riscv@gnu.org; Sun, 01 Aug 2021 19:32:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mAKw9-0008VN-Tg; Sun, 01 Aug 2021 19:32:05 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:34534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mAKw8-0005iy-3k; Sun, 01 Aug 2021 19:32:05 -0400
Received: by mail-io1-xd29.google.com with SMTP id y200so18292081iof.1;
 Sun, 01 Aug 2021 16:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MDxeFyCPSfFfyXGn9dQqcQM/ddarMCgIB9h2T/sN1qA=;
 b=r78wCWubKexl+KZlJ3SUhhOPAG/9ZJ7GbFvf0CHCkh13b6WEA8/oteNXzAeuoCK/LB
 hl44A5sfqo6UwaVzHHYZbMio5f7PzrTh3FBuqzOry66DFCYCANODJx6ponQ1oQ54F7H6
 Xy9lxne+wsChpQe/IShBIRh1B+xOEkSyj1Kh6zMtJY2u/spB4/w53+YdSivNISVKFKUE
 yf7Z/JvhvCyXxNrK1jgCT6Hu5Cl/hlU2nhiJ+rUWkW6SVYg5GZic2TpFvat37dVV3DpJ
 iSrtaLRwuD0C5zLJJDME9/wOLxTZjcm86NDps9NvKnstFlpr3MW34bEYJCC1aZI1BO86
 X4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MDxeFyCPSfFfyXGn9dQqcQM/ddarMCgIB9h2T/sN1qA=;
 b=UcHVBPeyYdrY1edcm8YrrnfwgNd+OF+7TtNxapymANYTu72zfljlXI8Km1yy2f1rbp
 +YMYjQy8YyzgJOU03jvtc/H6dxpxH6SH8S8DYhbDGt07rfRCIsTVxGD+Wcvard8NICRp
 a5WYGUuaGDeX7wqSVf17c0ZCJjklO29Ro0opesnc0DHRY9VZL381Cv7ng2udMvXAI8+9
 ilR5IF6s0nEjSVHfJYRgbOhQS35pVR8/6LSLG8noILVhzFEC4vH6QWWoWJBcKho2wBj4
 f/ysRKrfMeDblwDCRZXb/h6jHoQROFsek5JVuPFX7lZaaAbBWgiPuELu/ig0CFUnkFcj
 i6lQ==
X-Gm-Message-State: AOAM530EPKsKRmq1LxEQKTXTLxgIY4NgoTGIdUTA3CUa4CQSbqt9ui9A
 Qmu7rJvl2xh8jRMz9hHTivhBFV2qHdhccDyABfM=
X-Google-Smtp-Source: ABdhPJwZt6kz7WIaexMr1P/kZ0XVlimFc5Atv6bxqQ0/pClSQ4GlcpSsDoSxqoNiv5Pkgmzdj6fhXcVvn7BaWltltew=
X-Received: by 2002:a6b:ef19:: with SMTP id k25mr4626883ioh.42.1627860722413; 
 Sun, 01 Aug 2021 16:32:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210731190229.137483-1-vijai@behindbytes.com>
 <CAKmqyKN7HfVHDNpB+QmRuC-0vpPXfQ2EZk-x1PZJWt-HOdPJjw@mail.gmail.com>
In-Reply-To: <CAKmqyKN7HfVHDNpB+QmRuC-0vpPXfQ2EZk-x1PZJWt-HOdPJjw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 2 Aug 2021 09:31:36 +1000
Message-ID: <CAKmqyKNHSQVs6CtPwmdrHyUTGtqJ6gCJvGajWTQBHKXGMC6JOw@mail.gmail.com>
Subject: Re: [PATCH] hw/char: Add config for shakti uart
To: Vijai Kumar K <vijai@behindbytes.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
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
X-List-Received-Date: Sun, 01 Aug 2021 23:32:06 -0000

On Mon, Aug 2, 2021 at 8:36 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Sun, Aug 1, 2021 at 5:03 AM Vijai Kumar K <vijai@behindbytes.com> wrote:
> >
> > Use a dedicated UART config(CONFIG_SHAKTI_UART) to select
> > shakti uart.
> >
> > Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> Alistair
>
> > ---
> >  hw/char/Kconfig     | 3 +++
> >  hw/char/meson.build | 2 +-
> >  hw/riscv/Kconfig    | 5 +----
> >  3 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/hw/char/Kconfig b/hw/char/Kconfig
> > index 2e4f620b13..6b6cf2fc1d 100644
> > --- a/hw/char/Kconfig
> > +++ b/hw/char/Kconfig
> > @@ -68,3 +68,6 @@ config SIFIVE_UART
> >
> >  config GOLDFISH_TTY
> >      bool
> > +
> > +config SHAKTI_UART
> > +    bool
> > diff --git a/hw/char/meson.build b/hw/char/meson.build
> > index 8361d0ab28..7b594f51b8 100644
> > --- a/hw/char/meson.build
> > +++ b/hw/char/meson.build
> > @@ -16,7 +16,7 @@ softmmu_ss.add(when: 'CONFIG_SERIAL', if_true: files('serial.c'))
> >  softmmu_ss.add(when: 'CONFIG_SERIAL_ISA', if_true: files('serial-isa.c'))
> >  softmmu_ss.add(when: 'CONFIG_SERIAL_PCI', if_true: files('serial-pci.c'))
> >  softmmu_ss.add(when: 'CONFIG_SERIAL_PCI_MULTI', if_true: files('serial-pci-multi.c'))
> > -softmmu_ss.add(when: 'CONFIG_SHAKTI', if_true: files('shakti_uart.c'))
> > +softmmu_ss.add(when: 'CONFIG_SHAKTI_UART', if_true: files('shakti_uart.c'))
> >  softmmu_ss.add(when: 'CONFIG_VIRTIO_SERIAL', if_true: files('virtio-console.c'))
> >  softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen_console.c'))
> >  softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_uartlite.c'))
> > diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> > index 0590f443fd..ff75add6f3 100644
> > --- a/hw/riscv/Kconfig
> > +++ b/hw/riscv/Kconfig
> > @@ -22,13 +22,10 @@ config OPENTITAN
> >      select IBEX
> >      select UNIMP
> >
> > -config SHAKTI
> > -    bool
> > -
> >  config SHAKTI_C
> >      bool
> >      select UNIMP
> > -    select SHAKTI
> > +    select SHAKTI_UART
> >      select SIFIVE_CLINT
> >      select SIFIVE_PLIC
> >
> > --
> > 2.25.1
> >
> >
> >

