Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1he9g1-0004Qf-GG
	for mharc-qemu-riscv@gnu.org; Thu, 20 Jun 2019 22:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34301)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1he9fz-0004QP-0j
 for qemu-riscv@nongnu.org; Thu, 20 Jun 2019 22:53:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1he9fx-00035B-Rz
 for qemu-riscv@nongnu.org; Thu, 20 Jun 2019 22:53:18 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43376)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1he9fw-00031z-TY
 for qemu-riscv@nongnu.org; Thu, 20 Jun 2019 22:53:17 -0400
Received: by mail-pg1-f194.google.com with SMTP id f25so2589692pgv.10
 for <qemu-riscv@nongnu.org>; Thu, 20 Jun 2019 19:53:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=1sg7t4xVmFFuHBhmUA6Os6hJRKuxDj/Ex9oY3/bsjjI=;
 b=dzJ7wc5ZyPMm+jEnzLB5cnqzOfDGdPnHGOdOLCjjv0XA57v2BnfcP3smP1hb07lbxM
 8cGGqxmzJ4s5Xu7VyiVK1mmZM3X7VkiMHAve21z/1GdRjLDWOgur/8XDpjCzCdR4xsnY
 g4ftsyqKLa/nbxp/IxdEWxu0vRlNYA9TKiaRfsc65G5xDu4BNKXWpxXOlkYQIqlfRpkl
 mgvWsDgvBSoTlSsPkm7F2UjwLgidkTs9dcaKCcRu2XKNmp0ZZsnIPke6AQeRHq0oBZiF
 A0b6bCqNzCoB+LtbN4NNKBWCHJYJpa9vx1xTawKLOkcX+PVgLTs3UtMZAFMSWvzj2hzD
 ZUNQ==
X-Gm-Message-State: APjAAAXSB0RkPod7qb0V1KNbG5KGNOeX91mCfgTE3HXQlI5ZAR0wVK+E
 O+4LwnofqF4/pqYQcMrGAGxJWA==
X-Google-Smtp-Source: APXvYqz8z/bib8XbyJo4M6R/NWdCl4LDm2nD/3prLsl2GYZOGLt6dMeRHUliLKil+31uatJubdXvTQ==
X-Received: by 2002:a17:90a:2506:: with SMTP id
 j6mr3386592pje.129.1561085591310; 
 Thu, 20 Jun 2019 19:53:11 -0700 (PDT)
Received: from localhost (amx-tls3.starhub.net.sg. [203.116.164.13])
 by smtp.gmail.com with ESMTPSA id d19sm880546pjs.22.2019.06.20.19.53.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 19:53:10 -0700 (PDT)
Date: Thu, 20 Jun 2019 19:53:10 -0700 (PDT)
X-Google-Original-Date: Thu, 20 Jun 2019 19:39:53 PDT (-0700)
In-Reply-To: <CAEUhbmVf8jTtsZD-+2jcGah-kS+bPM6xdkSML2Qq_NTmeoU3zA@mail.gmail.com>
CC: alistair23@gmail.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-b2b4a62d-2575-4933-a1c9-dea2c5881abc@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.194
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
X-List-Received-Date: Fri, 21 Jun 2019 02:53:20 -0000

On Wed, 19 Jun 2019 06:42:21 PDT (-0700), bmeng.cn@gmail.com wrote:
> Hi Alistair,
>
> On Tue, Jun 18, 2019 at 1:15 AM Alistair Francis <alistair23@gmail.com> wrote:
>>
>> On Fri, Jun 14, 2019 at 8:30 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>> >
>> > This adds a reset opcode for sifive_test device to trigger a system
>> > reset for testing purpose.
>> >
>> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>> > ---
>> >
>> >  hw/riscv/sifive_test.c         | 4 ++++
>> >  include/hw/riscv/sifive_test.h | 3 ++-
>> >  2 files changed, 6 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/hw/riscv/sifive_test.c b/hw/riscv/sifive_test.c
>> > index 24a04d7..cd86831 100644
>> > --- a/hw/riscv/sifive_test.c
>> > +++ b/hw/riscv/sifive_test.c
>> > @@ -21,6 +21,7 @@
>> >  #include "qemu/osdep.h"
>> >  #include "hw/sysbus.h"
>> >  #include "qemu/module.h"
>> > +#include "sysemu/sysemu.h"
>> >  #include "target/riscv/cpu.h"
>> >  #include "hw/riscv/sifive_test.h"
>> >
>> > @@ -40,6 +41,9 @@ static void sifive_test_write(void *opaque, hwaddr addr,
>> >              exit(code);
>> >          case FINISHER_PASS:
>> >              exit(0);
>> > +        case FINISHER_RESET:
>> > +            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
>> > +            return;
>> >          default:
>> >              break;
>> >          }
>> > diff --git a/include/hw/riscv/sifive_test.h b/include/hw/riscv/sifive_test.h
>> > index 71d4c9f..c186a31 100644
>> > --- a/include/hw/riscv/sifive_test.h
>> > +++ b/include/hw/riscv/sifive_test.h
>> > @@ -34,7 +34,8 @@ typedef struct SiFiveTestState {
>> >
>> >  enum {
>> >      FINISHER_FAIL = 0x3333,
>> > -    FINISHER_PASS = 0x5555
>> > +    FINISHER_PASS = 0x5555,
>> > +    FINISHER_RESET = 0x7777
>>
>> Do you mind sharing where you got this value from? I can't find
>> details on this device in the SiFive manuals.
>>
>
> I don't think this is a device that actually exists on SiFive's
> chipset. It's hypothetical.

The device actually does exist in the hardware, but that's just an
implementation quirk.  Essentially what's going on here is that the RTL
contains this device, which has a register and then a behavioral verilog block
that causes simulations to terminate.  This is how we exit from tests in RTL
simulation, and we've just gone ahead and implemented the same device in QEMU
in order to make it easy to have compatibility with those bare-metal tests.
Due to how our design flow is set up we end up with exactly the same block in
the ASIC.  The register is still there, but the behavioral code to exit
simulations doesn't do anything so it's essentially just a useless device.
Since it's useless we don't bother writing it up in the ASIC documentation, but
it should be in the RTL documentation.

I'm not opposed to extending the interface in the suggested fashion, but I
wanted to check with the hardware team first to see if they're doing anything
with the other numbers.  I'm out of the office (and somewhat backed up on code
review) until July, so it might take a bit to dig through this.

