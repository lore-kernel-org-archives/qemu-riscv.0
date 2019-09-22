Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iBrTb-0001b0-4B
	for mharc-qemu-riscv@gnu.org; Sat, 21 Sep 2019 22:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34371)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1iBrTY-0001YG-Bs
 for qemu-riscv@nongnu.org; Sat, 21 Sep 2019 22:19:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1iBrTX-0004fO-5j
 for qemu-riscv@nongnu.org; Sat, 21 Sep 2019 22:19:48 -0400
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:43474)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1iBrTU-0004ep-Fc; Sat, 21 Sep 2019 22:19:44 -0400
Received: by mail-yb1-xb42.google.com with SMTP id m143so4125781ybf.10;
 Sat, 21 Sep 2019 19:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5TXMBFJyTzsMHF0WmjbpGFRjjVz7dsOcEaBtbNDlHQw=;
 b=q7U4GVl2j7cpZ2+rC7jr7zYzgvT3UTMJJPr5iS3uh7qB5vBC7h/kEx0bEqY+gbJLia
 9oo0LPylsyw0/vK0Hkbcjviv8MUV51E4eAe9SqY00QHTLPloongwSppQjz6O1aEsotlq
 McIIFpjEFt/GVS2Q0+l58MOYLlrVSLLKmNUhKHKjZ1wPCz8KO6e8oDZyMyLuuafHPC3y
 TYRih4wIlYDzjFXhAlomlJywdu1P8YRbV3abAs6HfPjv5P4hQRGsFn/27N6bcsu1GxBR
 BuONyfj70QE4J/Ighc6omrmSUrmJOlmBahPA/mUe1Olmw94MdO7ixppWQt5/DKF5KUNC
 s2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5TXMBFJyTzsMHF0WmjbpGFRjjVz7dsOcEaBtbNDlHQw=;
 b=GKfpMiezuAgZkwgt6LwoGSj/u4gjgJBW1TUUUealpts/oOAHCG2PpzQeLXsez1mBoZ
 AGkNcmjynEiUtUR+rMROvPe8iLHYI0SYts/F6TwvOsU6XNAGZoPK3wLGqmEkSlPgiRDw
 5h3AbuppFtqtaqWYe/RAVBFTTbwCqij4K7J/ZHmG3D34nulcCHI9qP4honxnx7JhYjbd
 2qUG9kuFWkdOJPqMQwAnqIO2w8diYIHx61q8pTfudzaHgmGKxyIbJfNDxS22lBM0xB4g
 FFp51o4mXWq7nD4f53JzaKWdPXSWCCyP1wUlRxujf016Rb3waD00EmCdCWcLsj9bJZOa
 lhYQ==
X-Gm-Message-State: APjAAAVJg64dRDGEB+xwlcG21uPl569c5yAPq75e2l/KnCw3Nw92l5MM
 T4q/uHWTXhbkcU1Yfy1n3lwYEenerTskjc05/cA=
X-Google-Smtp-Source: APXvYqwVyG8B4L2MebuuuePpAScnJP2syqKiTeDv7GdkZ/SSZAML5L+QJLV6RAfk1KlpP8+Jv0aoQibUy9/StBjy8WM=
X-Received: by 2002:a25:b911:: with SMTP id x17mr15163142ybj.29.1569118783462; 
 Sat, 21 Sep 2019 19:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1568931866.git.alistair.francis@wdc.com>
 <d3357e0b87cce025418f6383ce971246ded547bd.1568931866.git.alistair.francis@wdc.com>
 <CAEUhbmV7Ao6L25HM+8AJLP8unn=HhvdRc1Kt+tUQgRB4S4zsBQ@mail.gmail.com>
 <CAKmqyKO=PahfKej1Ch6=x3zcxN8R26Gkd9dsjScMSHPxitp=rA@mail.gmail.com>
In-Reply-To: <CAKmqyKO=PahfKej1Ch6=x3zcxN8R26Gkd9dsjScMSHPxitp=rA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 22 Sep 2019 10:19:31 +0800
Message-ID: <CAEUhbmVO=POsb+Jpy12w=WD-vLM9Km0YrryaGYc1PLYdSzka5A@mail.gmail.com>
Subject: Re: [PATCH v1 4/6] riscv/sifive_u: Add the start-in-flash property
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b42
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
X-List-Received-Date: Sun, 22 Sep 2019 02:19:49 -0000

On Sat, Sep 21, 2019 at 6:12 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Thu, Sep 19, 2019 at 10:15 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Fri, Sep 20, 2019 at 6:32 AM Alistair Francis
> > <alistair.francis@wdc.com> wrote:
> > >
> > > Add a property that when set to true QEMU will jump from the ROM code to
> > > the start of flash memory instead of DRAM which is the default
> > > behaviour.
> > >
> > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >  hw/riscv/sifive_u.c         | 27 +++++++++++++++++++++++++++
> > >  include/hw/riscv/sifive_u.h |  2 ++
> > >  2 files changed, 29 insertions(+)
> > >
> > > diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> > > index c3949fb316..b7cd3631cd 100644
> > > --- a/hw/riscv/sifive_u.c
> > > +++ b/hw/riscv/sifive_u.c
> > > @@ -373,6 +373,10 @@ static void riscv_sifive_u_init(MachineState *machine)
> > >                                         /* dtb: */
> > >      };
> > >
> > > +    if (s->start_in_flash) {
> > > +        reset_vec[6] = memmap[SIFIVE_U_FLASH0].base; /* start: .dword FLASH0_BASE */
> > > +    }
> > > +
> > >      /* copy in the reset vector in little_endian byte order */
> > >      for (i = 0; i < sizeof(reset_vec) >> 2; i++) {
> > >          reset_vec[i] = cpu_to_le32(reset_vec[i]);
> > > @@ -544,8 +548,31 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
> > >          memmap[SIFIVE_U_GEM_MGMT].base, memmap[SIFIVE_U_GEM_MGMT].size);
> > >  }
> > >
> > > +static bool virt_get_start_in_flash(Object *obj, Error **errp)
> > > +{
> > > +    SiFiveUState *s = RISCV_U_MACHINE(obj);
> > > +
> > > +    return s->start_in_flash;
> > > +}
> > > +
> > > +static void virt_set_start_in_flash(Object *obj, bool value, Error **errp)
> > > +{
> > > +    SiFiveUState *s = RISCV_U_MACHINE(obj);
> > > +
> > > +    s->start_in_flash = value;
> > > +}
> > > +
> > >  static void riscv_sifive_u_machine_instance_init(Object *obj)
> > >  {
> > > +    SiFiveUState *s = RISCV_U_MACHINE(obj);
> > > +
> > > +    s->start_in_flash = false;
> > > +    object_property_add_bool(obj, "start-in-flash", virt_get_start_in_flash,
> > > +                             virt_set_start_in_flash, NULL);
> > > +    object_property_set_description(obj, "start-in-flash",
> > > +                                    "Set on to tell QEMU's ROM to jump to " \
> > > +                                    "flash. Otherwise QEMU will jump to DRAM",
> > > +                                    NULL);
> > >
> > >  }
> > >
> > > diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
> > > index a921079fbe..2656b43c58 100644
> > > --- a/include/hw/riscv/sifive_u.h
> > > +++ b/include/hw/riscv/sifive_u.h
> > > @@ -57,6 +57,8 @@ typedef struct SiFiveUState {
> > >
> > >      void *fdt;
> > >      int fdt_size;
> > > +
> > > +    bool start_in_flash;
> > >  } SiFiveUState;
> > >
> > >  enum {
> >
> > This patch chose a different way from the one used in patch "[v1,6/6]
> > riscv/virt: Jump to pflash if specified":
> >
> > - this patch uses reset_vec[6] while patch [6/6] defines a variable start_addr
> > - this patch adds a "start-in-flash" property to the machine, while
> > patch [6/6] tests against drive IF_PFLASH
>
> Yes, we do it differently for the sifive_u board as the sifive_u board
> doesn't use pflash so there is no way to know if the user has loaded
> anything into the SPI memory.
>

OK.

> >
> > We should be consistent and I would prefer to use the patch [6/6] way.
> > On Unleashed an SPI flash is mounted so we cannot add a PFlash to
> > sifive_u machine like what was done on virt machine, so we should test
> > IF_MTD instead. Thoughts?
>
> How would we test that?
>
> Right now I am loading the binary in SPI with the -device loader
> option. The machine can't really know what is/isn't loaded there.
>
> It's not ideal, but I don't see a nicer way.

I think we need write a SiFive SPI model to support this in a clean
way. Ideally we should simulate the hardware boot workflow as
documented in the FU540 manual chapter 6 "Boot Process".

Regards,
Bin

