Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iCSUv-0001Qw-0h
	for mharc-qemu-riscv@gnu.org; Mon, 23 Sep 2019 13:51:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44906)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iCSUq-0001Ms-IO
 for qemu-riscv@nongnu.org; Mon, 23 Sep 2019 13:51:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iCSUp-0000bu-8x
 for qemu-riscv@nongnu.org; Mon, 23 Sep 2019 13:51:36 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:35358)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iCSUm-0000aZ-99; Mon, 23 Sep 2019 13:51:32 -0400
Received: by mail-lf1-x143.google.com with SMTP id w6so10823302lfl.2;
 Mon, 23 Sep 2019 10:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j1CwaIDVtGWgTnaphy6fYlnTg9p45sCsdj1Kuq5CM9k=;
 b=gBxq1YA2TpNYSW/Mv7QvRi9NszzUM4aL37SOKBjrKqw1hEF2adje+WjFNiC5K+UKYh
 CysW7QNQXiQ6CpPErBxnHeORUwP+GqkxnuseTlO/AwvLL6Tw1LHlXH2gLa9DKnzhAXZa
 hIeNzlnBgLZBgvBi+zRRGQdIBLGFca0etIrzgKK+pGmd3o5CTQJKf4zqIOJJShqp1bs9
 2V4SNf+x0Pgog3itA9HfYW0rqLurFr9Vop22DjiR/mFR75R6/um4+Ahw2YZp5449Lejy
 rbgXFkxKEhT+dHRs1WRQ13wt6fPrE2FOKKW41QS2KPhs5peEQuHEeX60V5rZD8VS63t4
 UChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j1CwaIDVtGWgTnaphy6fYlnTg9p45sCsdj1Kuq5CM9k=;
 b=iz1PfWx3gBWPLSG9sZPMqwS4lN/vdnRFXfvVHdxay8WJDZ4X5Gqlz2zKfN0lE8qvf4
 VGSRQ/z2Dh6LC4svFXz8/f/a4u8qsfzD8CgaF95MuueuKu3pJTGUFqPAk+Yryljk7q8h
 SyhE94y8bmo4/x6FU1YZzSCcNiPcqLPUEKiodsrCkWRzexudmKB86ptH1wSeVbiHlu9z
 Q4qDiDynDngwrGhcCUAR1ngrfzCpr9i+a1lr9ex02LxMPOd040TeKNxbvdOznBSceXDT
 AvvnJMeFBE2NidYLCD1xHzzkxfvKOGRwFQ2y6NhjV8jSsdtEfNBmBT2++/M4fbcrusym
 IJ8g==
X-Gm-Message-State: APjAAAUj9wGqkbEVISC/xyL+kth/cMD1HzngY1uXvZiPRlTaa7JelvWT
 mKamNhaBM715FLUZGPHxlWxQQ5KdOTDpMcpmoEI=
X-Google-Smtp-Source: APXvYqy0SO4rmf/AYGTYs8j7ZVj2icqj7aDp6CrVUFsJ7DrJfIr+kawYVg6bNuHIE/TILFP9msx2by7i5ig9I+Sbg1Q=
X-Received: by 2002:ac2:5e9e:: with SMTP id b30mr479425lfq.5.1569261090254;
 Mon, 23 Sep 2019 10:51:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1568931866.git.alistair.francis@wdc.com>
 <d3357e0b87cce025418f6383ce971246ded547bd.1568931866.git.alistair.francis@wdc.com>
 <CAEUhbmV7Ao6L25HM+8AJLP8unn=HhvdRc1Kt+tUQgRB4S4zsBQ@mail.gmail.com>
 <CAKmqyKO=PahfKej1Ch6=x3zcxN8R26Gkd9dsjScMSHPxitp=rA@mail.gmail.com>
 <CAEUhbmVO=POsb+Jpy12w=WD-vLM9Km0YrryaGYc1PLYdSzka5A@mail.gmail.com>
In-Reply-To: <CAEUhbmVO=POsb+Jpy12w=WD-vLM9Km0YrryaGYc1PLYdSzka5A@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Sep 2019 10:51:01 -0700
Message-ID: <CAKmqyKMf+KFQGZCZ9oGLAeGeQkSdrinXDSkpWEGRVjgjDfPAtg@mail.gmail.com>
Subject: Re: [PATCH v1 4/6] riscv/sifive_u: Add the start-in-flash property
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@sifive.com>, Chih-Min Chao <chihmin.chao@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::143
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
X-List-Received-Date: Mon, 23 Sep 2019 17:51:39 -0000

On Sat, Sep 21, 2019 at 7:19 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Sat, Sep 21, 2019 at 6:12 AM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Thu, Sep 19, 2019 at 10:15 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > On Fri, Sep 20, 2019 at 6:32 AM Alistair Francis
> > > <alistair.francis@wdc.com> wrote:
> > > >
> > > > Add a property that when set to true QEMU will jump from the ROM code to
> > > > the start of flash memory instead of DRAM which is the default
> > > > behaviour.
> > > >
> > > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > > ---
> > > >  hw/riscv/sifive_u.c         | 27 +++++++++++++++++++++++++++
> > > >  include/hw/riscv/sifive_u.h |  2 ++
> > > >  2 files changed, 29 insertions(+)
> > > >
> > > > diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> > > > index c3949fb316..b7cd3631cd 100644
> > > > --- a/hw/riscv/sifive_u.c
> > > > +++ b/hw/riscv/sifive_u.c
> > > > @@ -373,6 +373,10 @@ static void riscv_sifive_u_init(MachineState *machine)
> > > >                                         /* dtb: */
> > > >      };
> > > >
> > > > +    if (s->start_in_flash) {
> > > > +        reset_vec[6] = memmap[SIFIVE_U_FLASH0].base; /* start: .dword FLASH0_BASE */
> > > > +    }
> > > > +
> > > >      /* copy in the reset vector in little_endian byte order */
> > > >      for (i = 0; i < sizeof(reset_vec) >> 2; i++) {
> > > >          reset_vec[i] = cpu_to_le32(reset_vec[i]);
> > > > @@ -544,8 +548,31 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
> > > >          memmap[SIFIVE_U_GEM_MGMT].base, memmap[SIFIVE_U_GEM_MGMT].size);
> > > >  }
> > > >
> > > > +static bool virt_get_start_in_flash(Object *obj, Error **errp)
> > > > +{
> > > > +    SiFiveUState *s = RISCV_U_MACHINE(obj);
> > > > +
> > > > +    return s->start_in_flash;
> > > > +}
> > > > +
> > > > +static void virt_set_start_in_flash(Object *obj, bool value, Error **errp)
> > > > +{
> > > > +    SiFiveUState *s = RISCV_U_MACHINE(obj);
> > > > +
> > > > +    s->start_in_flash = value;
> > > > +}
> > > > +
> > > >  static void riscv_sifive_u_machine_instance_init(Object *obj)
> > > >  {
> > > > +    SiFiveUState *s = RISCV_U_MACHINE(obj);
> > > > +
> > > > +    s->start_in_flash = false;
> > > > +    object_property_add_bool(obj, "start-in-flash", virt_get_start_in_flash,
> > > > +                             virt_set_start_in_flash, NULL);
> > > > +    object_property_set_description(obj, "start-in-flash",
> > > > +                                    "Set on to tell QEMU's ROM to jump to " \
> > > > +                                    "flash. Otherwise QEMU will jump to DRAM",
> > > > +                                    NULL);
> > > >
> > > >  }
> > > >
> > > > diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
> > > > index a921079fbe..2656b43c58 100644
> > > > --- a/include/hw/riscv/sifive_u.h
> > > > +++ b/include/hw/riscv/sifive_u.h
> > > > @@ -57,6 +57,8 @@ typedef struct SiFiveUState {
> > > >
> > > >      void *fdt;
> > > >      int fdt_size;
> > > > +
> > > > +    bool start_in_flash;
> > > >  } SiFiveUState;
> > > >
> > > >  enum {
> > >
> > > This patch chose a different way from the one used in patch "[v1,6/6]
> > > riscv/virt: Jump to pflash if specified":
> > >
> > > - this patch uses reset_vec[6] while patch [6/6] defines a variable start_addr
> > > - this patch adds a "start-in-flash" property to the machine, while
> > > patch [6/6] tests against drive IF_PFLASH
> >
> > Yes, we do it differently for the sifive_u board as the sifive_u board
> > doesn't use pflash so there is no way to know if the user has loaded
> > anything into the SPI memory.
> >
>
> OK.
>
> > >
> > > We should be consistent and I would prefer to use the patch [6/6] way.
> > > On Unleashed an SPI flash is mounted so we cannot add a PFlash to
> > > sifive_u machine like what was done on virt machine, so we should test
> > > IF_MTD instead. Thoughts?
> >
> > How would we test that?
> >
> > Right now I am loading the binary in SPI with the -device loader
> > option. The machine can't really know what is/isn't loaded there.
> >
> > It's not ideal, but I don't see a nicer way.
>
> I think we need write a SiFive SPI model to support this in a clean
> way. Ideally we should simulate the hardware boot workflow as
> documented in the FU540 manual chapter 6 "Boot Process".

I really didn't want to do this. For me it's low priority and there
are enough other things to work on rather then adding SiFive device
models. Maybe someone who works at SiFive would be able to do this?

My hope with this series is that we could unblock firmware developers
(oreboot and coreboot) while the SPI model is written.

Alistair

>
> Regards,
> Bin

