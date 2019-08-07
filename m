Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvHig-0007e5-VR
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 04:54:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48595)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chihmin.chao@sifive.com>) id 1hvHid-0007dH-Pn
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 04:54:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1hvHib-0007Ql-N6
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 04:54:51 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:38354)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1hvHib-0007QE-EM
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 04:54:49 -0400
Received: by mail-ot1-x342.google.com with SMTP id d17so101410288oth.5
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 01:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NasqwgARd8VqeJUNiKe6yXRna1Oyz8d5wdX3A0iFcSM=;
 b=Hfy+1sA81qPuqLCEEY3zV+Jh5KipkcZFM4eHHUOO0iYUnDrTS9odESmefm624XPq7R
 SI2uYqg032mthAOAK/mXueOm2T1LqIb7dA5EO7p1EvoZnYeqcC3Uw0lUuxu/0rOZKrY5
 NfDA6R556XGxJ++ZAh0uThUiZ5b5jOGAJIwEoEGCcHLwTp0BivMbVvHf+7zAU3a7frGO
 RhVzvw9Jhxa/HKcckx95ZvblEi4n9PHeZus872MNjJyWJvJVQn1u8nrYnDUgX7ikFaXK
 UGEpXtMHfUJMZJmiR1+eskn9q/Hl4Z0tRVudxln2msi9NsvF/JekpcYQr/AMwLDZoGld
 RMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NasqwgARd8VqeJUNiKe6yXRna1Oyz8d5wdX3A0iFcSM=;
 b=cH0pRFI7qWj0dOnDw6A8e8X8cZjiizsBtGdkNQJnVIR2USOlwuKg+3INwJ4sgadkHN
 Np5ZWai27wEpU1L8Gvjjg7MhAhr1GtPsHoY8wg04B0apJ5nfEUHe/b3VJP2huAO1gkiP
 TeomaDlT6kIsv6rAR3EkXtBQWlNim9pPQFftHylc0Jsqa7mcKBmLh7sgL5DnQlJaCCi7
 7n/RABDxl/YskW2dcfj63wg6FQmQtHSFrsgTYeAT9i/CQFRT1eJcPn/I52Bm/nxP6Hri
 r4r6dkYFTJRBo/6E+fOox0xauntUfxZ2q1cBjE34l0SAmuvqzO3Rec4YYCYMcdiBrFSg
 E2SA==
X-Gm-Message-State: APjAAAW5fDLSMkR6UPtK35GyAQhPEglhFik2gKfj6nZqTfRGl0ruNggS
 tMrgCVq0BlVYVQzyYKtnds7psTCW4HO4rlj+h4YvkQ==
X-Google-Smtp-Source: APXvYqxzmAumR0YcMB/ITwbBV/92yIAV/Zl+GqaWtVNt3RpdKqbsTlfI/0CS6pIql8WXxG0SQz5DopAa5wqsQte7npo=
X-Received: by 2002:a02:a07:: with SMTP id 7mr9083419jaw.65.1565168087481;
 Wed, 07 Aug 2019 01:54:47 -0700 (PDT)
MIME-Version: 1.0
References: <1565163924-18621-1-git-send-email-bmeng.cn@gmail.com>
 <1565163924-18621-12-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1565163924-18621-12-git-send-email-bmeng.cn@gmail.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Wed, 7 Aug 2019 16:54:36 +0800
Message-ID: <CAEiOBXU9UXEGYjEDP-LJ5mEY-bF+OtMKt4O+LGJh9qQt3OPaew@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000de7a41058f8317db"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2 11/28] riscv: sifive:
 Rename sifive_prci.{c, h} to sifive_e_prci.{c, h}
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
X-List-Received-Date: Wed, 07 Aug 2019 08:54:54 -0000

--000000000000de7a41058f8317db
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 7, 2019 at 3:49 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> Current SiFive PRCI model only works with sifive_e machine, as it
> only emulates registers or PRCI block in the FE310 SoC.
>
> Rename the file name to make it clear that it is for sifive_e.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>
> Changes in v2: None
>
>  hw/riscv/Makefile.objs                              |  2 +-
>  hw/riscv/sifive_e.c                                 |  4 ++--
>  hw/riscv/{sifive_prci.c => sifive_e_prci.c}         | 14 +++++++-------
>  include/hw/riscv/{sifive_prci.h => sifive_e_prci.h} | 14 +++++++-------
>  4 files changed, 17 insertions(+), 17 deletions(-)
>  rename hw/riscv/{sifive_prci.c => sifive_e_prci.c} (90%)
>  rename include/hw/riscv/{sifive_prci.h => sifive_e_prci.h} (82%)
>
> diff --git a/hw/riscv/Makefile.objs b/hw/riscv/Makefile.objs
> index eb9d4f9..c859697 100644
> --- a/hw/riscv/Makefile.objs
> +++ b/hw/riscv/Makefile.objs
> @@ -2,9 +2,9 @@ obj-y += boot.o
>  obj-$(CONFIG_SPIKE) += riscv_htif.o
>  obj-$(CONFIG_HART) += riscv_hart.o
>  obj-$(CONFIG_SIFIVE_E) += sifive_e.o
> +obj-$(CONFIG_SIFIVE_E) += sifive_e_prci.o
>  obj-$(CONFIG_SIFIVE) += sifive_clint.o
>  obj-$(CONFIG_SIFIVE) += sifive_gpio.o
> -obj-$(CONFIG_SIFIVE) += sifive_prci.o
>  obj-$(CONFIG_SIFIVE) += sifive_plic.o
>  obj-$(CONFIG_SIFIVE) += sifive_test.o
>  obj-$(CONFIG_SIFIVE_U) += sifive_u.o
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index 2a499d8..2d67670 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -41,9 +41,9 @@
>  #include "hw/riscv/riscv_hart.h"
>  #include "hw/riscv/sifive_plic.h"
>  #include "hw/riscv/sifive_clint.h"
> -#include "hw/riscv/sifive_prci.h"
>  #include "hw/riscv/sifive_uart.h"
>  #include "hw/riscv/sifive_e.h"
> +#include "hw/riscv/sifive_e_prci.h"
>  #include "hw/riscv/boot.h"
>  #include "chardev/char.h"
>  #include "sysemu/arch_init.h"
> @@ -174,7 +174,7 @@ static void riscv_sifive_e_soc_realize(DeviceState
> *dev, Error **errp)
>          SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE);
>      sifive_mmio_emulate(sys_mem, "riscv.sifive.e.aon",
>          memmap[SIFIVE_E_AON].base, memmap[SIFIVE_E_AON].size);
> -    sifive_prci_create(memmap[SIFIVE_E_PRCI].base);
> +    sifive_e_prci_create(memmap[SIFIVE_E_PRCI].base);
>
>      /* GPIO */
>
>
I  think adding infix to function name is sufficient and keeping the
filename the same may be better.
The U board PRCI or variant implementation in future could be included in
the same files with different create function

chihmin



> diff --git a/hw/riscv/sifive_prci.c b/hw/riscv/sifive_e_prci.c
> similarity index 90%
> rename from hw/riscv/sifive_prci.c
> rename to hw/riscv/sifive_e_prci.c
> index f406682..acb914d 100644
> --- a/hw/riscv/sifive_prci.c
> +++ b/hw/riscv/sifive_e_prci.c
> @@ -1,5 +1,5 @@
>  /*
> - * QEMU SiFive PRCI (Power, Reset, Clock, Interrupt)
> + * QEMU SiFive E PRCI (Power, Reset, Clock, Interrupt)
>   *
>   * Copyright (c) 2017 SiFive, Inc.
>   *
> @@ -22,7 +22,7 @@
>  #include "hw/sysbus.h"
>  #include "qemu/module.h"
>  #include "target/riscv/cpu.h"
> -#include "hw/riscv/sifive_prci.h"
> +#include "hw/riscv/sifive_e_prci.h"
>
>  static uint64_t sifive_prci_read(void *opaque, hwaddr addr, unsigned int
> size)
>  {
> @@ -82,10 +82,10 @@ static const MemoryRegionOps sifive_prci_ops = {
>
>  static void sifive_prci_init(Object *obj)
>  {
> -    SiFivePRCIState *s = SIFIVE_PRCI(obj);
> +    SiFivePRCIState *s = SIFIVE_E_PRCI(obj);
>
>      memory_region_init_io(&s->mmio, obj, &sifive_prci_ops, s,
> -                          TYPE_SIFIVE_PRCI, 0x8000);
> +                          TYPE_SIFIVE_E_PRCI, 0x8000);
>      sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
>
>      s->hfrosccfg = (SIFIVE_PRCI_HFROSCCFG_RDY | SIFIVE_PRCI_HFROSCCFG_EN);
> @@ -97,7 +97,7 @@ static void sifive_prci_init(Object *obj)
>  }
>
>  static const TypeInfo sifive_prci_info = {
> -    .name          = TYPE_SIFIVE_PRCI,
> +    .name          = TYPE_SIFIVE_E_PRCI,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(SiFivePRCIState),
>      .instance_init = sifive_prci_init,
> @@ -114,9 +114,9 @@ type_init(sifive_prci_register_types)
>  /*
>   * Create PRCI device.
>   */
> -DeviceState *sifive_prci_create(hwaddr addr)
> +DeviceState *sifive_e_prci_create(hwaddr addr)
>  {
> -    DeviceState *dev = qdev_create(NULL, TYPE_SIFIVE_PRCI);
> +    DeviceState *dev = qdev_create(NULL, TYPE_SIFIVE_E_PRCI);
>      qdev_init_nofail(dev);
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
>      return dev;
> diff --git a/include/hw/riscv/sifive_prci.h
> b/include/hw/riscv/sifive_e_prci.h
> similarity index 82%
> rename from include/hw/riscv/sifive_prci.h
> rename to include/hw/riscv/sifive_e_prci.h
> index bd51c4a..7932fe7 100644
> --- a/include/hw/riscv/sifive_prci.h
> +++ b/include/hw/riscv/sifive_e_prci.h
> @@ -1,5 +1,5 @@
>  /*
> - * QEMU SiFive PRCI (Power, Reset, Clock, Interrupt) interface
> + * QEMU SiFive E PRCI (Power, Reset, Clock, Interrupt) interface
>   *
>   * Copyright (c) 2017 SiFive, Inc.
>   *
> @@ -16,8 +16,8 @@
>   * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>
> -#ifndef HW_SIFIVE_PRCI_H
> -#define HW_SIFIVE_PRCI_H
> +#ifndef HW_SIFIVE_E_PRCI_H
> +#define HW_SIFIVE_E_PRCI_H
>
>  enum {
>      SIFIVE_PRCI_HFROSCCFG   = 0x0,
> @@ -47,10 +47,10 @@ enum {
>      SIFIVE_PRCI_PLLOUTDIV_DIV1  = (1 << 8)
>  };
>
> -#define TYPE_SIFIVE_PRCI "riscv.sifive.prci"
> +#define TYPE_SIFIVE_E_PRCI      "riscv.sifive.e.prci"
>
> -#define SIFIVE_PRCI(obj) \
> -    OBJECT_CHECK(SiFivePRCIState, (obj), TYPE_SIFIVE_PRCI)
> +#define SIFIVE_E_PRCI(obj) \
> +    OBJECT_CHECK(SiFivePRCIState, (obj), TYPE_SIFIVE_E_PRCI)
>
>  typedef struct SiFivePRCIState {
>      /*< private >*/
> @@ -64,6 +64,6 @@ typedef struct SiFivePRCIState {
>      uint32_t plloutdiv;
>  } SiFivePRCIState;
>
> -DeviceState *sifive_prci_create(hwaddr addr);
> +DeviceState *sifive_e_prci_create(hwaddr addr);
>
>  #endif
> --
> 2.7.4
>
>
>

--000000000000de7a41058f8317db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 7, 2019 at 3:49 PM Bin Me=
ng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Current SiFi=
ve PRCI model only works with sifive_e machine, as it<br>
only emulates registers or PRCI block in the FE310 SoC.<br>
<br>
Rename the file name to make it clear that it is for sifive_e.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com" target=3D=
"_blank">bmeng.cn@gmail.com</a>&gt;<br>
---<br>
<br>
Changes in v2: None<br>
<br>
=C2=A0hw/riscv/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br=
>
=C2=A0hw/riscv/sifive_e.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 4 ++--<br>
=C2=A0hw/riscv/{sifive_prci.c =3D&gt; sifive_e_prci.c}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 14 +++++++-------<br>
=C2=A0include/hw/riscv/{sifive_prci.h =3D&gt; sifive_e_prci.h} | 14 +++++++=
-------<br>
=C2=A04 files changed, 17 insertions(+), 17 deletions(-)<br>
=C2=A0rename hw/riscv/{sifive_prci.c =3D&gt; sifive_e_prci.c} (90%)<br>
=C2=A0rename include/hw/riscv/{sifive_prci.h =3D&gt; sifive_e_prci.h} (82%)=
<br>
<br>
diff --git a/hw/riscv/Makefile.objs b/hw/riscv/Makefile.objs<br>
index eb9d4f9..c859697 100644<br>
--- a/hw/riscv/Makefile.objs<br>
+++ b/hw/riscv/Makefile.objs<br>
@@ -2,9 +2,9 @@ obj-y +=3D boot.o<br>
=C2=A0obj-$(CONFIG_SPIKE) +=3D riscv_htif.o<br>
=C2=A0obj-$(CONFIG_HART) +=3D riscv_hart.o<br>
=C2=A0obj-$(CONFIG_SIFIVE_E) +=3D sifive_e.o<br>
+obj-$(CONFIG_SIFIVE_E) +=3D sifive_e_prci.o<br>
=C2=A0obj-$(CONFIG_SIFIVE) +=3D sifive_clint.o<br>
=C2=A0obj-$(CONFIG_SIFIVE) +=3D sifive_gpio.o<br>
-obj-$(CONFIG_SIFIVE) +=3D sifive_prci.o<br>
=C2=A0obj-$(CONFIG_SIFIVE) +=3D sifive_plic.o<br>
=C2=A0obj-$(CONFIG_SIFIVE) +=3D sifive_test.o<br>
=C2=A0obj-$(CONFIG_SIFIVE_U) +=3D sifive_u.o<br>
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c<br>
index 2a499d8..2d67670 100644<br>
--- a/hw/riscv/sifive_e.c<br>
+++ b/hw/riscv/sifive_e.c<br>
@@ -41,9 +41,9 @@<br>
=C2=A0#include &quot;hw/riscv/riscv_hart.h&quot;<br>
=C2=A0#include &quot;hw/riscv/sifive_plic.h&quot;<br>
=C2=A0#include &quot;hw/riscv/sifive_clint.h&quot;<br>
-#include &quot;hw/riscv/sifive_prci.h&quot;<br>
=C2=A0#include &quot;hw/riscv/sifive_uart.h&quot;<br>
=C2=A0#include &quot;hw/riscv/sifive_e.h&quot;<br>
+#include &quot;hw/riscv/sifive_e_prci.h&quot;<br>
=C2=A0#include &quot;hw/riscv/boot.h&quot;<br>
=C2=A0#include &quot;chardev/char.h&quot;<br>
=C2=A0#include &quot;sysemu/arch_init.h&quot;<br>
@@ -174,7 +174,7 @@ static void riscv_sifive_e_soc_realize(DeviceState *dev=
, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIF=
IVE_TIME_BASE);<br>
=C2=A0 =C2=A0 =C2=A0sifive_mmio_emulate(sys_mem, &quot;riscv.sifive.e.aon&q=
uot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memmap[SIFIVE_E_AON].base, memmap[SIFIVE_=
E_AON].size);<br>
-=C2=A0 =C2=A0 sifive_prci_create(memmap[SIFIVE_E_PRCI].base);<br>
+=C2=A0 =C2=A0 sifive_e_prci_create(memmap[SIFIVE_E_PRCI].base);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* GPIO */<br>
<br></blockquote><div><br></div><div>I=C2=A0 think adding infix to function=
 name is sufficient and keeping the filename the same may be better.</div><=
div>The U board PRCI or variant implementation in future could be included =
in the same files with different create function</div><div><br></div><div>c=
hihmin</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
diff --git a/hw/riscv/sifive_prci.c b/hw/riscv/sifive_e_prci.c<br>
similarity index 90%<br>
rename from hw/riscv/sifive_prci.c<br>
rename to hw/riscv/sifive_e_prci.c<br>
index f406682..acb914d 100644<br>
--- a/hw/riscv/sifive_prci.c<br>
+++ b/hw/riscv/sifive_e_prci.c<br>
@@ -1,5 +1,5 @@<br>
=C2=A0/*<br>
- * QEMU SiFive PRCI (Power, Reset, Clock, Interrupt)<br>
+ * QEMU SiFive E PRCI (Power, Reset, Clock, Interrupt)<br>
=C2=A0 *<br>
=C2=A0 * Copyright (c) 2017 SiFive, Inc.<br>
=C2=A0 *<br>
@@ -22,7 +22,7 @@<br>
=C2=A0#include &quot;hw/sysbus.h&quot;<br>
=C2=A0#include &quot;qemu/module.h&quot;<br>
=C2=A0#include &quot;target/riscv/cpu.h&quot;<br>
-#include &quot;hw/riscv/sifive_prci.h&quot;<br>
+#include &quot;hw/riscv/sifive_e_prci.h&quot;<br>
<br>
=C2=A0static uint64_t sifive_prci_read(void *opaque, hwaddr addr, unsigned =
int size)<br>
=C2=A0{<br>
@@ -82,10 +82,10 @@ static const MemoryRegionOps sifive_prci_ops =3D {<br>
<br>
=C2=A0static void sifive_prci_init(Object *obj)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 SiFivePRCIState *s =3D SIFIVE_PRCI(obj);<br>
+=C2=A0 =C2=A0 SiFivePRCIState *s =3D SIFIVE_E_PRCI(obj);<br>
<br>
=C2=A0 =C2=A0 =C2=A0memory_region_init_io(&amp;s-&gt;mmio, obj, &amp;sifive=
_prci_ops, s,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 TYPE_SIFIVE_PRCI, 0x8000);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 TYPE_SIFIVE_E_PRCI, 0x8000);<br>
=C2=A0 =C2=A0 =C2=A0sysbus_init_mmio(SYS_BUS_DEVICE(obj), &amp;s-&gt;mmio);=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;hfrosccfg =3D (SIFIVE_PRCI_HFROSCCFG_RDY | SIFIVE=
_PRCI_HFROSCCFG_EN);<br>
@@ -97,7 +97,7 @@ static void sifive_prci_init(Object *obj)<br>
=C2=A0}<br>
<br>
=C2=A0static const TypeInfo sifive_prci_info =3D {<br>
-=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SIFIVE_PRCI=
,<br>
+=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SIFIVE_E_PR=
CI,<br>
=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEV=
ICE,<br>
=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(SiFivePRCIState),<br>
=C2=A0 =C2=A0 =C2=A0.instance_init =3D sifive_prci_init,<br>
@@ -114,9 +114,9 @@ type_init(sifive_prci_register_types)<br>
=C2=A0/*<br>
=C2=A0 * Create PRCI device.<br>
=C2=A0 */<br>
-DeviceState *sifive_prci_create(hwaddr addr)<br>
+DeviceState *sifive_e_prci_create(hwaddr addr)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 DeviceState *dev =3D qdev_create(NULL, TYPE_SIFIVE_PRCI);<br=
>
+=C2=A0 =C2=A0 DeviceState *dev =3D qdev_create(NULL, TYPE_SIFIVE_E_PRCI);<=
br>
=C2=A0 =C2=A0 =C2=A0qdev_init_nofail(dev);<br>
=C2=A0 =C2=A0 =C2=A0sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);<br>
=C2=A0 =C2=A0 =C2=A0return dev;<br>
diff --git a/include/hw/riscv/sifive_prci.h b/include/hw/riscv/sifive_e_prc=
i.h<br>
similarity index 82%<br>
rename from include/hw/riscv/sifive_prci.h<br>
rename to include/hw/riscv/sifive_e_prci.h<br>
index bd51c4a..7932fe7 100644<br>
--- a/include/hw/riscv/sifive_prci.h<br>
+++ b/include/hw/riscv/sifive_e_prci.h<br>
@@ -1,5 +1,5 @@<br>
=C2=A0/*<br>
- * QEMU SiFive PRCI (Power, Reset, Clock, Interrupt) interface<br>
+ * QEMU SiFive E PRCI (Power, Reset, Clock, Interrupt) interface<br>
=C2=A0 *<br>
=C2=A0 * Copyright (c) 2017 SiFive, Inc.<br>
=C2=A0 *<br>
@@ -16,8 +16,8 @@<br>
=C2=A0 * this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gnu.org/=
licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/licenses=
/</a>&gt;.<br>
=C2=A0 */<br>
<br>
-#ifndef HW_SIFIVE_PRCI_H<br>
-#define HW_SIFIVE_PRCI_H<br>
+#ifndef HW_SIFIVE_E_PRCI_H<br>
+#define HW_SIFIVE_E_PRCI_H<br>
<br>
=C2=A0enum {<br>
=C2=A0 =C2=A0 =C2=A0SIFIVE_PRCI_HFROSCCFG=C2=A0 =C2=A0=3D 0x0,<br>
@@ -47,10 +47,10 @@ enum {<br>
=C2=A0 =C2=A0 =C2=A0SIFIVE_PRCI_PLLOUTDIV_DIV1=C2=A0 =3D (1 &lt;&lt; 8)<br>
=C2=A0};<br>
<br>
-#define TYPE_SIFIVE_PRCI &quot;riscv.sifive.prci&quot;<br>
+#define TYPE_SIFIVE_E_PRCI=C2=A0 =C2=A0 =C2=A0 &quot;riscv.sifive.e.prci&q=
uot;<br>
<br>
-#define SIFIVE_PRCI(obj) \<br>
-=C2=A0 =C2=A0 OBJECT_CHECK(SiFivePRCIState, (obj), TYPE_SIFIVE_PRCI)<br>
+#define SIFIVE_E_PRCI(obj) \<br>
+=C2=A0 =C2=A0 OBJECT_CHECK(SiFivePRCIState, (obj), TYPE_SIFIVE_E_PRCI)<br>
<br>
=C2=A0typedef struct SiFivePRCIState {<br>
=C2=A0 =C2=A0 =C2=A0/*&lt; private &gt;*/<br>
@@ -64,6 +64,6 @@ typedef struct SiFivePRCIState {<br>
=C2=A0 =C2=A0 =C2=A0uint32_t plloutdiv;<br>
=C2=A0} SiFivePRCIState;<br>
<br>
-DeviceState *sifive_prci_create(hwaddr addr);<br>
+DeviceState *sifive_e_prci_create(hwaddr addr);<br>
<br>
=C2=A0#endif<br>
-- <br>
2.7.4<br>
<br>
<br>
</blockquote></div></div>

--000000000000de7a41058f8317db--

