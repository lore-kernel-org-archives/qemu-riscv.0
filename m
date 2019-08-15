Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hy4bl-00060e-MJ
	for mharc-qemu-riscv@gnu.org; Wed, 14 Aug 2019 21:31:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41845)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1hy4bi-00060A-FG
 for qemu-riscv@nongnu.org; Wed, 14 Aug 2019 21:31:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hy4bh-0005mz-84
 for qemu-riscv@nongnu.org; Wed, 14 Aug 2019 21:31:14 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:39176)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hy4bg-0005lo-Vv; Wed, 14 Aug 2019 21:31:13 -0400
Received: by mail-ed1-x544.google.com with SMTP id g8so860151edm.6;
 Wed, 14 Aug 2019 18:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6vvz9ApcA9pgDfQfHSMw5AtqukPjtkRFYVFa7YGh+E4=;
 b=ReiGh+XtIJHOY9tTl6Mt36nH306a5XVCJHOsPOxSgPuMWxd3bCQYCaiY7X2jRuDpTa
 eFvxR+xv6PnTnslHsP5GzYzwll8nwgcEwoOM/oueQ0buDO6j3RksAt5K/phZh4nP1sV0
 CktNKFRpoepHr/0UQtlrZ+kWhkOR92XhGHjULiCm53IKYgJXLL1UEklg8/lfgzAWCBOD
 J77KzDiwzapWLzbbE/iBNYnu/Nb4XwOpSxy2/NFG7NwdqeVb9enUfzsdwQrh026a9CLW
 lUSOCjqp6FzMIXwVZCgZix8aMycQg1EzWwnmsdm8qQ3qvgLbeRNJlb3naGodsUcmFcVV
 6sBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6vvz9ApcA9pgDfQfHSMw5AtqukPjtkRFYVFa7YGh+E4=;
 b=cCYC5SDpOfVzmcUj7CtwYuxxxymk9ZluoaUfPl8K6v0H6+THVuGrsTt6NZNDqglbID
 NuxvErAqpC9dUCRiwflxUWnawlBvOVZhFvjiZzIdiKt/oGMKr6hk7xyK13P912VuW5NY
 IaRo9JInWlSPEOVgHI86RIkM+6R1fDEtblH3+YuMhS3z5FBVOFvd7zcpQ+2j6BTYsv5v
 1lRsZCHi41m85LXHmjHpsbS5yFBYtq9u/ibV/Xufz+HB9sBsLsWiXCp1pLYBvcRROIj7
 xFpDfkBEvKqSq9JpfmiAuiCLhCs91bxS8oemLKw4zOFrM/b/Z0SqAEryBzYMuob8X5OC
 odUQ==
X-Gm-Message-State: APjAAAU84ozdlw2fANJQMOEKQ7LCD4DDi+JHGc3OObSS3JMLeQWMbYtn
 zKvXBFMWvix27y4TgOrkhpS5PlGWLScv9Ah4je4=
X-Google-Smtp-Source: APXvYqyGpKnkGnxO1CQJO98zacq6OO+CdwT2fRBumi7qeTfT7UfIGWVOux3zjQ0JRqvNaP77mW1qi4qSsm+PeahRdos=
X-Received: by 2002:a17:906:f742:: with SMTP id
 jp2mr2107926ejb.87.1565832671261; 
 Wed, 14 Aug 2019 18:31:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAEUhbmU8s5cEt4J-ae0wqfgFHEWe=YWQaDn_Au_MhtK1J7OntA@mail.gmail.com>
 <mhng-b7d8bc3c-3d03-4b2a-910f-8a9ceb18a046@palmer-si-x1c4>
In-Reply-To: <mhng-b7d8bc3c-3d03-4b2a-910f-8a9ceb18a046@palmer-si-x1c4>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 15 Aug 2019 09:30:59 +0800
Message-ID: <CAEUhbmVb-rfZ74mY_2QHTNw8R-FYTwxggHAPCCWviYpZZXNtAg@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: linux@roeck-us.net, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::544
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 1/3] riscv: sifive_u: Add
 support for loading initrd
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
X-List-Received-Date: Thu, 15 Aug 2019 01:31:15 -0000

Hi Palmer,

On Thu, Aug 15, 2019 at 1:06 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Mon, 12 Aug 2019 16:48:00 PDT (-0700), bmeng.cn@gmail.com wrote:
> > Hi Palmer,
> >
> > On Tue, Aug 13, 2019 at 6:45 AM Palmer Dabbelt <palmer@sifive.com> wrote:
> >>
> >> On Fri, 19 Jul 2019 06:40:43 PDT (-0700), linux@roeck-us.net wrote:
> >> > Add support for loading initrd with "-initrd <filename>"
> >> > to the sifive_u machine. This lets us boot into Linux without
> >> > disk drive.
> >> >
> >> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> >> > ---
> >> >  hw/riscv/sifive_u.c | 20 +++++++++++++++++---
> >> >  1 file changed, 17 insertions(+), 3 deletions(-)
> >> >
> >> > diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> >> > index 71b8083..0657046 100644
> >> > --- a/hw/riscv/sifive_u.c
> >> > +++ b/hw/riscv/sifive_u.c
> >> > @@ -67,7 +67,7 @@ static const struct MemmapEntry {
> >> >
> >> >  #define GEM_REVISION        0x10070109
> >> >
> >> > -static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
> >> > +static void *create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
> >> >      uint64_t mem_size, const char *cmdline)
> >> >  {
> >> >      void *fdt;
> >> > @@ -244,11 +244,14 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
> >> >          qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
> >> >      }
> >> >      g_free(nodename);
> >> > +
> >> > +    return fdt;
> >> >  }
> >> >
> >> >  static void riscv_sifive_u_init(MachineState *machine)
> >> >  {
> >> >      const struct MemmapEntry *memmap = sifive_u_memmap;
> >> > +    void *fdt;
> >> >
> >> >      SiFiveUState *s = g_new0(SiFiveUState, 1);
> >> >      MemoryRegion *system_memory = get_system_memory();
> >> > @@ -269,13 +272,24 @@ static void riscv_sifive_u_init(MachineState *machine)
> >> >                                  main_mem);
> >> >
> >> >      /* create device tree */
> >> > -    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline);
> >> > +    fdt = create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline);
> >> >
> >> >      riscv_find_and_load_firmware(machine, BIOS_FILENAME,
> >> >                                   memmap[SIFIVE_U_DRAM].base);
> >> >
> >> >      if (machine->kernel_filename) {
> >> > -        riscv_load_kernel(machine->kernel_filename);
> >> > +        uint64_t kernel_entry = riscv_load_kernel(machine->kernel_filename);
> >> > +
> >> > +        if (machine->initrd_filename) {
> >> > +            hwaddr start;
> >> > +            hwaddr end = riscv_load_initrd(machine->initrd_filename,
> >> > +                                           machine->ram_size, kernel_entry,
> >> > +                                           &start);
> >> > +            qemu_fdt_setprop_cell(fdt, "/chosen",
> >> > +                                  "linux,initrd-start", start);
> >> > +            qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
> >> > +                                  end);
> >> > +        }
> >> >      }
> >> >
> >> >      /* reset vector */
> >>
> >> Thanks.  I've queued all three of these.
> >>
> >
> > Ah, looks I did a duplicate.
> > http://patchwork.ozlabs.org/patch/1145247/
> >
> > Which git repo/branch should I rebase my series on?
>
> github.com/palmer-dabbelt/riscv-qemu -b for-master

I did not see branch "for-master" in the riscv-qemu repo. However I
did find the branch in the github.com/palmer-dabbelt/qemu repo.

I assume that's the correct one I should rebase my patch series on.

Regards,
Bin

