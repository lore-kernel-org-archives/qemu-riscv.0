Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hdarM-0004x1-4K
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jun 2019 09:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45396)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hdarJ-0004wu-Ap
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2019 09:42:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hdarH-0006kk-F5
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2019 09:42:40 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:45889)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hdarG-0006gq-H2; Wed, 19 Jun 2019 09:42:38 -0400
Received: by mail-ed1-x544.google.com with SMTP id a14so27251413edv.12;
 Wed, 19 Jun 2019 06:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cz/1tMxK/u38eUP4Z5C29NBuegDdX7uFFCtexupzeEg=;
 b=jH9tEc4XPW78JsgmAtoScMw7V0sJS3e5Q3p0UdxJH6EkY9rQJFfSWeMrLY48jxTfva
 fjjurnyVXc5/mAqzi6Q/XdcEOy2Da9tfaZhXbJQjzS9G+JkGTOlnbi7k6Dmp2pCNTxaP
 U+oyYLo2ZizvbGgcMNVKjQQpwbQZCnuWSAL0GY5xP4CyGTFLPD2K9O3KC+dUEvMd66U7
 4uajEyMRR/8pr00km1HKFiWpp8SssuuknB7pz68vhuMIvQkpuJURc/pA1yq/QlgE/+WC
 vbbBGzbQyIbW2hUTn8cl23fxdG+9l5RQJ3lAG+sl7FBPLEkHURccYrMEY2k0BosMaIJR
 dA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cz/1tMxK/u38eUP4Z5C29NBuegDdX7uFFCtexupzeEg=;
 b=eEFfWLADiINegPieVuMjFE9oxdljjn8xoz7PasiNChrO+Y/f3Hd1f9zwiphWy1bI98
 KDpHjazcdJUuT2oXo8mimdKsONQ+qhdfZLU7D/InZhx5zxE53KBUDsYWmkjYGkmJpGw4
 WqJGcwryqNesdww2ZJQXMlswCxtkHKZp7zENIHcDj1nMYv19T4nzoMEX/TxC7VLgx64v
 5gmL7MMsYWhpVPcRr1iaHhDYJehcFZxKhZL5C9kcAHq0PrTxjkQ6QaVoCgtzP5bA8Fl3
 WmnH17IRgWbuCbeU7aGG/iTYu41qRYtnoXsr41cNRsPA46UQmfNKm1zv7GxyySUkk3XE
 sVtQ==
X-Gm-Message-State: APjAAAWdgarntQGKALVkQytNAh39ieZFvBiQfFR+uNSB9fbQkRN/x3hi
 DTbk53wtebENpPNZMLNbXNvlNAXbEOTSlnw7PIE=
X-Google-Smtp-Source: APXvYqzYAB9KTqVCk9YT/B0pEEdvAHx96m6vBtu9P1cCzhUUI9OWcOVIqDhYtSWzP3j+9UOo+kPclz40FpLzGw8eKhM=
X-Received: by 2002:a50:94e6:: with SMTP id t35mr93612105eda.137.1560951754875; 
 Wed, 19 Jun 2019 06:42:34 -0700 (PDT)
MIME-Version: 1.0
References: <1560525351-590-1-git-send-email-bmeng.cn@gmail.com>
 <CAKmqyKMVH9MCPRD3DYm9-O59H2=DVXA8L9Sa3pNsYs=wbZRiug@mail.gmail.com>
In-Reply-To: <CAKmqyKMVH9MCPRD3DYm9-O59H2=DVXA8L9Sa3pNsYs=wbZRiug@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 19 Jun 2019 21:42:21 +0800
Message-ID: <CAEUhbmVf8jTtsZD-+2jcGah-kS+bPM6xdkSML2Qq_NTmeoU3zA@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::544
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] riscv: sifive_test: Add reset
 functionality
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
X-List-Received-Date: Wed, 19 Jun 2019 13:42:42 -0000

Hi Alistair,

On Tue, Jun 18, 2019 at 1:15 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Fri, Jun 14, 2019 at 8:30 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > This adds a reset opcode for sifive_test device to trigger a system
> > reset for testing purpose.
> >
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> > ---
> >
> >  hw/riscv/sifive_test.c         | 4 ++++
> >  include/hw/riscv/sifive_test.h | 3 ++-
> >  2 files changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/riscv/sifive_test.c b/hw/riscv/sifive_test.c
> > index 24a04d7..cd86831 100644
> > --- a/hw/riscv/sifive_test.c
> > +++ b/hw/riscv/sifive_test.c
> > @@ -21,6 +21,7 @@
> >  #include "qemu/osdep.h"
> >  #include "hw/sysbus.h"
> >  #include "qemu/module.h"
> > +#include "sysemu/sysemu.h"
> >  #include "target/riscv/cpu.h"
> >  #include "hw/riscv/sifive_test.h"
> >
> > @@ -40,6 +41,9 @@ static void sifive_test_write(void *opaque, hwaddr addr,
> >              exit(code);
> >          case FINISHER_PASS:
> >              exit(0);
> > +        case FINISHER_RESET:
> > +            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> > +            return;
> >          default:
> >              break;
> >          }
> > diff --git a/include/hw/riscv/sifive_test.h b/include/hw/riscv/sifive_test.h
> > index 71d4c9f..c186a31 100644
> > --- a/include/hw/riscv/sifive_test.h
> > +++ b/include/hw/riscv/sifive_test.h
> > @@ -34,7 +34,8 @@ typedef struct SiFiveTestState {
> >
> >  enum {
> >      FINISHER_FAIL = 0x3333,
> > -    FINISHER_PASS = 0x5555
> > +    FINISHER_PASS = 0x5555,
> > +    FINISHER_RESET = 0x7777
>
> Do you mind sharing where you got this value from? I can't find
> details on this device in the SiFive manuals.
>

I don't think this is a device that actually exists on SiFive's
chipset. It's hypothetical.

Regards,
Bin

