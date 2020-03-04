Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9dF6-0004UK-Hb
	for mharc-qemu-riscv@gnu.org; Wed, 04 Mar 2020 18:15:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44835)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1j9dF2-0004TJ-Qg
 for qemu-riscv@nongnu.org; Wed, 04 Mar 2020 18:15:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1j9dF0-00025d-LJ
 for qemu-riscv@nongnu.org; Wed, 04 Mar 2020 18:15:52 -0500
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43]:37106)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1j9dEv-0001zS-JJ; Wed, 04 Mar 2020 18:15:46 -0500
Received: by mail-vs1-xe43.google.com with SMTP id h5so2379796vsc.4;
 Wed, 04 Mar 2020 15:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CQrls7h8bDwIREuaDPg8cRDb7mIUTrUYSlyjMDFweyo=;
 b=EFfLkN2cnsVKMUiQKbbeBeasHPrp3e2Drjpf6I4p82ujRsr32etQ0+NJXBNYmWDZpO
 Fke53iwlSAwIy/IkrBbOS1Wxch/tXIh59W3QQUEPlwOEvG0605mkbE44XLYxiVaKhJ3d
 uJzKnoaZwfwaDo5+qORUsf74YLXOXwV2BUyd9douLHvMAM2uoxGF5rQ7vXpPTfSxjB3c
 sG3VfONOjkALXq5mCnD3BQbMw62zC+VTPgUv6/yLfRydCAnZJSQrV65UGUBVx6yRJZGz
 avxWTOOMlRnmrF6PGcESedcgirXvBISslH4HgHHsR6MWjrAI9nbrdydkEtJNFNlT7Pss
 1tsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CQrls7h8bDwIREuaDPg8cRDb7mIUTrUYSlyjMDFweyo=;
 b=NopffxJsM1lk7d3Yngx8I/A4fEuSHYnTC8EvDxPZsUhAwcwK6Dmyz2VMYdLWKoVUVK
 fXupJF/O1hkMeNewU9bThMeJW7JiRMgnBu4JK+d9lxIpdG/zbr1WY0WNHJ/ZxFwpiQhB
 vG5FOkXTEDUU5HE0I51WDbEmAp4lWbkI9ehJSO+s/QDIBrd2ywjWCepmSu/50zuca//I
 CgGzjC5gE98A3Go/SLPpTipWe0enWmyr5qoYuES3yvf42vhgMQqrIvoOeGfpa6rtICyc
 vHhVNM1LvQQOvnsZx871CNNd3U3agRTuBClMLTQD2zdqhjRO5KhdtkwjD/NUmDpbKvLW
 dgpw==
X-Gm-Message-State: ANhLgQ3hNHe+360LNafGz7fOmq1wqeObKCoVTGmhp7gQKCC13Pt2qHJp
 sNliJrXf5zEU7zUCtk+UWnKvvA2gLMpR0Jf4zxICiA==
X-Google-Smtp-Source: ADFU+vtorMJZRKNkJSu+5NivrR2rXkmc5vLhcN9b0PkTW2rnk2MRKK5jsW0DvQ29xR063LEudbYKHlB4IvUYGAD55wo=
X-Received: by 2002:a67:fa43:: with SMTP id j3mr2679702vsq.70.1583363744887;
 Wed, 04 Mar 2020 15:15:44 -0800 (PST)
MIME-Version: 1.0
References: <1581861317-30977-1-git-send-email-bmeng.cn@gmail.com>
 <mhng-fb3ea639-87e6-406b-a679-a568f6d7edf9@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-fb3ea639-87e6-406b-a679-a568f6d7edf9@palmerdabbelt-glaptop1>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 4 Mar 2020 15:08:04 -0800
Message-ID: <CAKmqyKON7GaEPqfA=Hex9TMcySJsy6oVo3aAC5UGQjO2we+tjg@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: sifive_u: Add a "serial" property for board
 serial number
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Bin Meng <bmeng.cn@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::e43
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
X-List-Received-Date: Wed, 04 Mar 2020 23:15:54 -0000

On Wed, Mar 4, 2020 at 3:00 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Sun, 16 Feb 2020 05:55:17 PST (-0800), bmeng.cn@gmail.com wrote:
> > At present the board serial number is hard-coded to 1, and passed
> > to OTP model during initialization. Firmware (FSBL, U-Boot) uses
> > the serial number to generate a unique MAC address for the on-chip
> > ethernet controller. When multiple QEMU 'sifive_u' instances are
> > created and connected to the same subnet, they all have the same
> > MAC address hence it creates a unusable network.
> >
> > A new "serial" property is introduced to specify the board serial
> > number. When not given, the default serial number 1 is used.
> >
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> >
> > ---
> >
> > Changes in v2:
> > - Move setting OTP serial number property from riscv_sifive_u_soc_init()
> >   to riscv_sifive_u_soc_realize(), to fix the 'check-qtest-riscv' error.
> >   I am not really sure why doing so could fix the 'make check' error.
> >   The v1 patch worked fine and nothing seems wrong.
> >
> >  hw/riscv/sifive_u.c         | 21 ++++++++++++++++++++-
> >  include/hw/riscv/sifive_u.h |  1 +
> >  2 files changed, 21 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> > index 0e12b3c..ca561d3 100644
> > --- a/hw/riscv/sifive_u.c
> > +++ b/hw/riscv/sifive_u.c
> > @@ -34,6 +34,7 @@
> >  #include "qemu/log.h"
> >  #include "qemu/error-report.h"
> >  #include "qapi/error.h"
> > +#include "qapi/visitor.h"
> >  #include "hw/boards.h"
> >  #include "hw/loader.h"
> >  #include "hw/sysbus.h"
> > @@ -434,7 +435,6 @@ static void riscv_sifive_u_soc_init(Object *obj)
> >                            TYPE_SIFIVE_U_PRCI);
> >      sysbus_init_child_obj(obj, "otp", &s->otp, sizeof(s->otp),
> >                            TYPE_SIFIVE_U_OTP);
> > -    qdev_prop_set_uint32(DEVICE(&s->otp), "serial", OTP_SERIAL);
> >      sysbus_init_child_obj(obj, "gem", &s->gem, sizeof(s->gem),
> >                            TYPE_CADENCE_GEM);
> >  }
> > @@ -453,6 +453,18 @@ static void sifive_u_set_start_in_flash(Object *obj, bool value, Error **errp)
> >      s->start_in_flash = value;
> >  }
> >
> > +static void sifive_u_get_serial(Object *obj, Visitor *v, const char *name,
> > +                                void *opaque, Error **errp)
> > +{
> > +    visit_type_uint32(v, name, (uint32_t *)opaque, errp);
> > +}
> > +
> > +static void sifive_u_set_serial(Object *obj, Visitor *v, const char *name,
> > +                                void *opaque, Error **errp)
> > +{
> > +    visit_type_uint32(v, name, (uint32_t *)opaque, errp);
> > +}
> > +
> >  static void riscv_sifive_u_machine_instance_init(Object *obj)
> >  {
> >      SiFiveUState *s = RISCV_U_MACHINE(obj);
> > @@ -464,11 +476,17 @@ static void riscv_sifive_u_machine_instance_init(Object *obj)
> >                                      "Set on to tell QEMU's ROM to jump to " \
> >                                      "flash. Otherwise QEMU will jump to DRAM",
> >                                      NULL);
> > +
> > +    s->serial = OTP_SERIAL;
> > +    object_property_add(obj, "serial", "uint32", sifive_u_get_serial,
> > +                        sifive_u_set_serial, NULL, &s->serial, NULL);
> > +    object_property_set_description(obj, "serial", "Board serial number", NULL);
> >  }
> >
> >  static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
> >  {
> >      MachineState *ms = MACHINE(qdev_get_machine());
> > +    SiFiveUState *us = RISCV_U_MACHINE(ms);
> >      SiFiveUSoCState *s = RISCV_U_SOC(dev);
> >      const struct MemmapEntry *memmap = sifive_u_memmap;
> >      MemoryRegion *system_memory = get_system_memory();
> > @@ -554,6 +572,7 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
> >      object_property_set_bool(OBJECT(&s->prci), true, "realized", &err);
> >      sysbus_mmio_map(SYS_BUS_DEVICE(&s->prci), 0, memmap[SIFIVE_U_PRCI].base);
> >
> > +    qdev_prop_set_uint32(DEVICE(&s->otp), "serial", us->serial);
> >      object_property_set_bool(OBJECT(&s->otp), true, "realized", &err);
> >      sysbus_mmio_map(SYS_BUS_DEVICE(&s->otp), 0, memmap[SIFIVE_U_OTP].base);
> >
> > diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
> > index 82667b5..7cf742e 100644
> > --- a/include/hw/riscv/sifive_u.h
> > +++ b/include/hw/riscv/sifive_u.h
> > @@ -59,6 +59,7 @@ typedef struct SiFiveUState {
> >      int fdt_size;
> >
> >      bool start_in_flash;
> > +    uint32_t serial;
> >  } SiFiveUState;
> >
> >  enum {
>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
>
> Thanks.  This is in the queue for the soft freeze.

This patch isn't correct. The SoC gets the sifive_u machine state
which is a bad idea. If the SoC is ever user on a different machine
this will crash.

I have sent a patch series that adds a machine and SoC property instead.

Alistair

>

