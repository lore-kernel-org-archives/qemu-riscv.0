Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lS12z-0008BP-CK
	for mharc-qemu-riscv@gnu.org; Thu, 01 Apr 2021 13:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lS12y-0008BA-KS; Thu, 01 Apr 2021 13:23:56 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:39541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lS12w-00007g-BU; Thu, 01 Apr 2021 13:23:56 -0400
Received: by mail-io1-xd2c.google.com with SMTP id k25so2955304iob.6;
 Thu, 01 Apr 2021 10:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iNI4MXV9AvPVEMsvxYyHiTBPi/PqruCHD+d81KIpNBw=;
 b=LqBBR6rb2dW1nUXLVp/FICTGYL5E+PMu7CipKkIjXvmGbkiQCLnbyj8wYcFAUNR4t6
 050oNmMpE9+qdSo9ZaQjpEVaZ//DPY4sH6wyTN9q5h0CGnGcCnlcqRhBnzpIz8UXHZZI
 ZdbCj4qPqk0ZyTAOc39GM18rGAIprxqYoqwah1duzSin3qJmDJy37gUOptGqf2vNt0vc
 GCbto+lRWv4aKJVL1Zk6Y4Z8aWFFXklQeTAijg7/ccLGy1BVCep2o7AAGF8NMjq0IJxQ
 B8XmFnMgFPYMLz18S+fI5ktDOXZIv4iMJ+jY0mnucrx/vzoEYr9jOga4WknTJBdB4D7k
 rrCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iNI4MXV9AvPVEMsvxYyHiTBPi/PqruCHD+d81KIpNBw=;
 b=LD8M8QYczTquo3nGoLQoCqgq2beNEyo8iT+5rTTFoCG2kRmHpzwVDyVm631HtAsMft
 5WYzyalx1kxyms9FHqJ0bhZlbD7MRzqH9vq2u3nO81dM/5/KfnNpmp0Qbcnv60gRjIk5
 SL6qKXX0d9wwW7ntoUMqOtbCgedY6fKcazAOACH3bDPp8s3R6Nhr94guudqB7b9Fb+M3
 BmSk1OIt7QNr/cZlCjbKywBW2d2XA+OVDoXsWRr0n+9z+fbgJCERnad+11WYuGH+BerU
 lpCjfTA5BOXyc4zlQtTR5k7QlNiaq5fS4/WAbDm3hpdmyHd5Apsvf2yA/wo6SIkw4XQx
 Ilrw==
X-Gm-Message-State: AOAM531RvgZp7Ij9juemwP4ibLg8NndXKe4Q5mNSnPnLph0V+gaKrcDj
 dgkMaUlagSH/qXn4oYdxaC1NIIwutwZcrgA/R0I=
X-Google-Smtp-Source: ABdhPJy3DRLnQl98cgW+n1ntv7IUQr9NFi4AGGlYBOE4wSpjW58EgHoYDMPp94Vj/YcKOFy7JYjuMxzkmSbbuHAGeHg=
X-Received: by 2002:a5d:9496:: with SMTP id v22mr7654979ioj.175.1617297831786; 
 Thu, 01 Apr 2021 10:23:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210321050917.24621-1-vijai@behindbytes.com>
 <20210321050917.24621-3-vijai@behindbytes.com>
 <CAKmqyKPu44=w=upUxv=4JMjoF1vY4dXwFSFmPMA7FOZgY82d+g@mail.gmail.com>
 <1788e717742.b23f5ec42963.7150229126692558445@behindbytes.com>
In-Reply-To: <1788e717742.b23f5ec42963.7150229126692558445@behindbytes.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 1 Apr 2021 13:21:42 -0400
Message-ID: <CAKmqyKPUK-9rGVHuzUH5pFUusc-45cyxKeg0Ec1xp_m=v8GHbQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] riscv: Add initial support for Shakti C machine
To: Vijai Kumar K <vijai@behindbytes.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2c.google.com
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
X-List-Received-Date: Thu, 01 Apr 2021 17:23:56 -0000

On Thu, Apr 1, 2021 at 1:18 PM Vijai Kumar K <vijai@behindbytes.com> wrote:
>
>
>
>
> ---- On Wed, 31 Mar 2021 21:05:47 +0530 Alistair Francis <alistair23@gmail.com> wrote ----
>
>  > On Sun, Mar 21, 2021 at 1:09 AM Vijai Kumar K <vijai@behindbytes.com> wrote:
>  > >
>  > > Add support for emulating Shakti reference platform based on C-class
>  > > running on arty-100T board.
>  > >
>  > > https://gitlab.com/shaktiproject/cores/shakti-soc/-/blob/master/README.rst
>  > >
>  > > Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>
>  > > ---
>  > >  MAINTAINERS                                 |   7 +
>  > >  default-configs/devices/riscv64-softmmu.mak |   1 +
>  > >  hw/riscv/Kconfig                            |  10 ++
>  > >  hw/riscv/meson.build                        |   1 +
>  > >  hw/riscv/shakti_c.c                         | 171 ++++++++++++++++++++
>  > >  include/hw/riscv/shakti_c.h                 |  74 +++++++++
>  > >  6 files changed, 264 insertions(+)
>  > >  create mode 100644 hw/riscv/shakti_c.c
>  > >  create mode 100644 include/hw/riscv/shakti_c.h
>  > >
>  > > diff --git a/MAINTAINERS b/MAINTAINERS
>  > > index 8e9f0d591e..9f71c4cc3f 100644
>  > > --- a/MAINTAINERS
>  > > +++ b/MAINTAINERS
>  > > @@ -1380,6 +1380,13 @@ F: include/hw/misc/mchp_pfsoc_dmc.h
>  > >  F: include/hw/misc/mchp_pfsoc_ioscb.h
>  > >  F: include/hw/misc/mchp_pfsoc_sysreg.h
>  > >
>  > > +Shakti C class SoC
>  > > +M: Vijai Kumar K <vijai@behindbytes.com>
>  > > +L: qemu-riscv@nongnu.org
>  > > +S: Supported
>  > > +F: hw/riscv/shakti_c.c
>  > > +F: include/hw/riscv/shakti_c.h
>  > > +
>  > >  SiFive Machines
>  > >  M: Alistair Francis <Alistair.Francis@wdc.com>
>  > >  M: Bin Meng <bin.meng@windriver.com>
>  > > diff --git a/default-configs/devices/riscv64-softmmu.mak b/default-configs/devices/riscv64-softmmu.mak
>  > > index d5eec75f05..bc69301fa4 100644
>  > > --- a/default-configs/devices/riscv64-softmmu.mak
>  > > +++ b/default-configs/devices/riscv64-softmmu.mak
>  > > @@ -13,3 +13,4 @@ CONFIG_SIFIVE_E=y
>  > >  CONFIG_SIFIVE_U=y
>  > >  CONFIG_RISCV_VIRT=y
>  > >  CONFIG_MICROCHIP_PFSOC=y
>  > > +CONFIG_SHAKTI_C=y
>  > > diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
>  > > index d139074b02..92a62b5ce9 100644
>  > > --- a/hw/riscv/Kconfig
>  > > +++ b/hw/riscv/Kconfig
>  > > @@ -19,6 +19,16 @@ config OPENTITAN
>  > >      select IBEX
>  > >      select UNIMP
>  > >
>  > > +config SHAKTI
>  > > +    bool
>  > > +
>  > > +config SHAKTI_C
>  > > +    bool
>  > > +    select UNIMP
>  > > +    select SHAKTI
>  > > +    select SIFIVE_CLINT
>  > > +    select SIFIVE_PLIC
>  > > +
>  > >  config RISCV_VIRT
>  > >      bool
>  > >      imply PCI_DEVICES
>  > > diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
>  > > index 275c0f7eb7..a97454661c 100644
>  > > --- a/hw/riscv/meson.build
>  > > +++ b/hw/riscv/meson.build
>  > > @@ -4,6 +4,7 @@ riscv_ss.add(files('numa.c'))
>  > >  riscv_ss.add(files('riscv_hart.c'))
>  > >  riscv_ss.add(when: 'CONFIG_OPENTITAN', if_true: files('opentitan.c'))
>  > >  riscv_ss.add(when: 'CONFIG_RISCV_VIRT', if_true: files('virt.c'))
>  > > +riscv_ss.add(when: 'CONFIG_SHAKTI_C', if_true: files('shakti_c.c'))
>  > >  riscv_ss.add(when: 'CONFIG_SIFIVE_E', if_true: files('sifive_e.c'))
>  > >  riscv_ss.add(when: 'CONFIG_SIFIVE_U', if_true: files('sifive_u.c'))
>  > >  riscv_ss.add(when: 'CONFIG_SPIKE', if_true: files('spike.c'))
>  > > diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
>  > > new file mode 100644
>  > > index 0000000000..45d0eedabd
>  > > --- /dev/null
>  > > +++ b/hw/riscv/shakti_c.c
>  > > @@ -0,0 +1,171 @@
>  > > +/*
>  > > + * Shakti C-class SoC emulation
>  > > + *
>  > > + * Copyright (c) 2021 Vijai Kumar K <vijai@behindbytes.com>
>  > > + *
>  > > + * This program is free software; you can redistribute it and/or modify it
>  > > + * under the terms and conditions of the GNU General Public License,
>  > > + * version 2 or later, as published by the Free Software Foundation.
>  > > + *
>  > > + * This program is distributed in the hope it will be useful, but WITHOUT
>  > > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>  > > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>  > > + * more details.
>  > > + *
>  > > + * You should have received a copy of the GNU General Public License along with
>  > > + * this program.  If not, see <http://www.gnu.org/licenses/>.
>  > > + */
>  > > +
>  > > +#include "qemu/osdep.h"
>  > > +#include "hw/boards.h"
>  > > +#include "hw/riscv/shakti_c.h"
>  > > +#include "qapi/error.h"
>  > > +#include "hw/intc/sifive_plic.h"
>  > > +#include "hw/intc/sifive_clint.h"
>  > > +#include "sysemu/sysemu.h"
>  > > +#include "hw/qdev-properties.h"
>  > > +#include "exec/address-spaces.h"
>  > > +#include "hw/riscv/boot.h"
>  > > +
>  > > +
>  > > +static const struct MemmapEntry {
>  > > +    hwaddr base;
>  > > +    hwaddr size;
>  > > +} shakti_c_memmap[] = {
>  > > +    [SHAKTI_C_ROM]   =  {  0x00001000,  0x2000   },
>  > > +    [SHAKTI_C_RAM]   =  {  0x80000000,  0x0      },
>  > > +    [SHAKTI_C_UART]  =  {  0x00011300,  0x00040  },
>  > > +    [SHAKTI_C_GPIO]  =  {  0x020d0000,  0x00100  },
>  > > +    [SHAKTI_C_PLIC]  =  {  0x0c000000,  0x20000  },
>  > > +    [SHAKTI_C_CLINT] =  {  0x02000000,  0xc0000  },
>  > > +    [SHAKTI_C_DEBUG] =  {  0x00000000,  0x00010  },
>  >
>  > What is this debug used for?
>
> I could not find the answer in docs. I got in touch with the developer and this is the response I got.
>
> "It where the debug self-loop lies. When halted by a debugger, the core executes a loop of [nop; j nop]. This loop is placed at the debug_loop location."
>
> This has no purpose in QEMU. It is there for sake of completion.

Hmm... Maybe let's just remove it then. If it's not being used, not
going to be used and not exposed to software there isn't much benefit
in keeping it.

Alistair

>
> Thanks,
> Vijai Kumar K

