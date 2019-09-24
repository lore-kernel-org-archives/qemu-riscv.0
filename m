Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iCj2z-0002wc-Cx
	for mharc-qemu-riscv@gnu.org; Tue, 24 Sep 2019 07:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42563)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iCj2v-0002ua-Hw
 for qemu-riscv@nongnu.org; Tue, 24 Sep 2019 07:31:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iCj2t-0005XO-NG
 for qemu-riscv@nongnu.org; Tue, 24 Sep 2019 07:31:53 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:46506)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iCj2t-0005Wa-G8
 for qemu-riscv@nongnu.org; Tue, 24 Sep 2019 07:31:51 -0400
Received: by mail-oi1-x242.google.com with SMTP id k25so1275019oiw.13
 for <qemu-riscv@nongnu.org>; Tue, 24 Sep 2019 04:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZX/sfhc/UD7CgQ9oz2If/j5Rjj05DiSODMTlkmUefsA=;
 b=tCVn6uMXjX0k3NyeqcRdshSU5XoA/viR1pXp8BghSrysbeUUMm2Qy1BaiMptmqhYtR
 neUydApAr2pDdiSd83Xro6Ifl7XXRwTMq8vha2Ug+0kciI9Y4gdfWXY8ruhx/0zUnzjG
 sKd6GDcHzSVy9gLiad35Pb/FE1e1XH6h9XY02WsJpqUdF6BbGXrYWZ8onTweZc2ghmaF
 75fjq4XfJ4P0CMEdeYyyUBI9AZ6AVruD2dDWpYk9ldhj8Sal5C4wVRT2MnplzimqnhR5
 KWlri/eUKBiyPZ2Bl9E0Es8j1bxrdDiZf5cQ2pa3hASoBio9AqpMrQyj9cP4u154uINt
 KUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZX/sfhc/UD7CgQ9oz2If/j5Rjj05DiSODMTlkmUefsA=;
 b=F783z72SsufXeHTDSKM2RswG8Ewj4EoTz23LCU9CIUY60Hm3I84l+oyFOMPgFaMWvn
 6oUVHnUSAc4PEwLkEmuYXthWeUOaWZxFW4vsYmsorSW8pZd6qgfacR78TDfKjlFLDJU0
 BeC49P37FNVgR/qUWuCTfHJbzuKVvQ3poTjajPEskrWEaRwseG4X2ghNWfJ1ZwMpvPfh
 wkwSyii1a17RBk58p8gMobaAtDWWw6EQMkLBQScin1V3fkhCpJ0i9CunpnnmW9JbOB04
 BTxGAWnaXs1vsTqtmLTZwOGsbw5DciVcIG/fUnC0VHx9AuqY6G7QbDSo8czfTI7dun43
 /HBg==
X-Gm-Message-State: APjAAAWw8pjmcJj6dYWM6Rvzs0z10MqJ2FjM6MNSStmjNDHnbhq9Jfhm
 WWgvMI5eaHlL0l3MUlyyqtNZ3XpGDzoTzJU/7hptsg==
X-Google-Smtp-Source: APXvYqwXw6YYiajd/OKORTyQ0C+H/EI1PpISIsDvE+ZwLTiWtbc/emSjnRubEy4FE/qCeLhw9RqypefVY+lt1pYdZkc=
X-Received: by 2002:aca:b48a:: with SMTP id d132mr1676947oif.98.1569324710181; 
 Tue, 24 Sep 2019 04:31:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190924084201.107958-1-anup.patel@wdc.com>
 <20190924084201.107958-2-anup.patel@wdc.com>
 <CAFEAcA-cm2GaKHg7_VcSb-OHp8GA9KuWiyWbc6r3F1p7tLc35A@mail.gmail.com>
 <MN2PR04MB60610CCAEED38F30F9B274208D840@MN2PR04MB6061.namprd04.prod.outlook.com>
In-Reply-To: <MN2PR04MB60610CCAEED38F30F9B274208D840@MN2PR04MB6061.namprd04.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Sep 2019 12:31:38 +0100
Message-ID: <CAFEAcA_nG5F-bXykXPmgXuiM-i0jHvm-BvHVF1CvjpBeNHOjRA@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw: timer: Add Goldfish RTC device
To: Anup Patel <Anup.Patel@wdc.com>
Cc: Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Atish Patra <Atish.Patra@wdc.com>, 
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
X-List-Received-Date: Tue, 24 Sep 2019 11:31:56 -0000

On Tue, 24 Sep 2019 at 12:17, Anup Patel <Anup.Patel@wdc.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Peter Maydell <peter.maydell@linaro.org>
> > Sent: Tuesday, September 24, 2019 3:21 PM
> > To: Anup Patel <Anup.Patel@wdc.com>
> > Cc: Palmer Dabbelt <palmer@sifive.com>; Alistair Francis
> > <Alistair.Francis@wdc.com>; Sagar Karandikar <sagark@eecs.berkeley.edu>;
> > Bastian Koppelmann <kbastian@mail.uni-paderborn.de>; Atish Patra
> > <Atish.Patra@wdc.com>; qemu-riscv@nongnu.org; qemu-
> > devel@nongnu.org; Anup Patel <anup@brainfault.org>
> > Subject: Re: [PATCH 1/2] hw: timer: Add Goldfish RTC device
> >
> > On Tue, 24 Sep 2019 at 09:45, Anup Patel <Anup.Patel@wdc.com> wrote:
> > >
> > > This patch adds model for Google Goldfish virtual platform RTC device.
> > >
> > > We will be adding Goldfish RTC device to the QEMU RISC-V virt machine
> > > for providing real date-time to Guest Linux. The corresponding Linux
> > > driver for Goldfish RTC device is already available in upstream Linux.
> > >
> > > For now, VM migration support is not available for Goldfish RTC device
> > > but it will be added later when we implement VM migration for KVM RISC-
> > V.
> > >
> > > Signed-off-by: Anup Patel <anup.patel@wdc.com>

> > > ---
> > > +
> > > +static Property goldfish_rtc_properties[] = {
> > > +    DEFINE_PROP_UINT64("tick-offset", GoldfishRTCState, tick_offset, 0),
> > > +    DEFINE_PROP_UINT64("alarm-next", GoldfishRTCState, alarm_next, 0),
> > > +    DEFINE_PROP_UINT32("alarm-running", GoldfishRTCState,
> > alarm_running, 0),
> > > +    DEFINE_PROP_UINT32("irq-pending", GoldfishRTCState, irq_pending,
> > 0),
> > > +    DEFINE_PROP_UINT32("irq-enabled", GoldfishRTCState, irq_enabled,
> > 0),
> > > +    DEFINE_PROP_END_OF_LIST(),
> > > +};
> >
> > What are all these properties trying to do ?
>
> Argh, I forgot to remove these before sending.
>
> I will drop these in next revision.
>
> >
> > > +
> > > +static void goldfish_rtc_class_init(ObjectClass *klass, void *data) {
> > > +    DeviceClass *dc = DEVICE_CLASS(klass);
> > > +    dc->props = goldfish_rtc_properties;
> >
> > Missing reset function.
>
> Sure, I will add it. I got confused because I saw reset function in HPET
> but not in PL031.

Yeah, the lack of reset is a bug in the pl031. I did have
a draft set of patches where I tried to fix that, but I
got stuck because it was a bit unclear what I ought to be
resetting. In a real hardware pl031 there is no persistent
storage of the RTC value -- it's just a 1Hz counter, really,
and guest firmware will write to it on startup (from some
other real RTC). In QEMU we use it as a sort of "RTC for a
VM", and back it with the QEMU RTC clock, so it doesn't
behave quite as the hardware does but more like "view that
you'd see from a combination of h/w and firmware behaviour".

TLDR: don't use the pl031 code as a good model of how to do an RTC,
it has some definite flaws. x86 or ppc RTC handling is
probably a better place to look.

Another random question -- is there an existing RTC device
we could put in the riscv board rather than adding a new
model of this goldfish device? Put another way, what are
the merits of using goldfish in particular?

We should probably document this device in docs/specs since it's
a pure-virtual device. (You have a link to the URL for the
GOLDFISH-VIRTUAL-HARDWARE.TXT for the android emulator, but that
doesn't seem to match the implementation here -- the doc says the
alarm registers are non-functional but this code does something with
them.)

> > If you don't want to implement migration support now you should at least
> > put in something that block migration.
> > (Personally I prefer to just write the vmstate, it's as easy as writing the code
> > to block migrations.)
>
> Okay, I will add vmstate.
>
> Is there a way to unit test the vmstate part ?
> OR
> Are you fine if we test-n-fix it later ?

Test and fix later is fine. That said, I've just remembered
that for an RTC migration is potentially a tricky area
because you typically don't want a vmsave-vmload to
give you the same RTC value after load that there was on
store, you want it to still be following the host RTC.
We got that wrong on the PL031 and had to put in some ugly
workarounds to maintain migration compatibility when we fixed it.
So maybe it would be better to mark as non-migratable for now.

thanks
-- PMM

