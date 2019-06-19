Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hdbba-0000Us-6D
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jun 2019 10:30:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57867)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hdbbY-0000Sd-Av
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2019 10:30:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hdbbX-0004u4-1r
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2019 10:30:28 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:40155)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hdbbT-0004jU-4z; Wed, 19 Jun 2019 10:30:23 -0400
Received: by mail-lj1-x242.google.com with SMTP id a21so3479138ljh.7;
 Wed, 19 Jun 2019 07:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GQeS01QZ2J0Fd6FspTGdoPD2uQOZXz6KHZnOuY1DEtY=;
 b=SueaBIZyckIRUQQCX+1E2zYhwQAic9t5z7u66YQDELNOtzngL1vTPgqHsMAlda66CY
 eWkCsTWR7Ko40D7vqVyZKc4SCjGJO5wD5coq89tCmLQxjLrICrRm0hTlgaIUn8y7sOdl
 2bH6LYmcDOLB0JA2kYcANdyHyjiZ1eVFnf0AFMxzjdQ0pfn2015RXlUmwoVk9UecU8MR
 5pxrl5t9AGoW8VZQWJ7J7zRKwfd5j/3U+NrVdDLR9Jg6E2fUNQKkYhOgfmUzpY6kBp+M
 eM8zh0jFpIDyxjL5tOObp4tCJ9ksHKUnC3NW76WEm7vP3ALVGAgc9QG5+uUOHLzaoUda
 9Ctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GQeS01QZ2J0Fd6FspTGdoPD2uQOZXz6KHZnOuY1DEtY=;
 b=hc63rm1V727mXARd0qySWGYgh8I8ZLQfYsifFKkP3nyqpJUE20AybSplizzLp/O9ej
 Iq94YBocJY185rmvzDjibFCHwpjwdv99reNo52e9bB1HQFU7oLl2Wk7SUNMpBD9lkVyO
 pNrRaPIAOWrP8ljGn7tCv3bKFigAiVWmLeHFKQJeYahurH5B32nwrKSd4J6yrWpTmOfh
 hHlyJdJ6OMhPTFj3QvdX9MW83PklBwfigx9zpZZwu/jpN32cUjcIbw7HLIxACNVpSQB1
 QEWA6pFL2vKZgN0sPLbKoswPKZiNRHGRZD/oGikVoole5oaIqJ15q3abNyjCZdTCv7ov
 pYzw==
X-Gm-Message-State: APjAAAX0S7c1eCIz32zI7jYFaSw5KOJvpCRRkBtHQRZvJMf5xKg69m3+
 OSyvska+YceYen0uHmZDNeJa/OShby5BH0QhQao=
X-Google-Smtp-Source: APXvYqyNU+XhczgqVxrsy1FJOWLwv0xyoVNAdpqYFcUquNwOrytWABCNxS0/WRuSFaX2lLPr8cLllu9ie3FyY54ErYU=
X-Received: by 2002:a2e:9188:: with SMTP id f8mr7019825ljg.33.1560954621778;
 Wed, 19 Jun 2019 07:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1560904640.git.alistair.francis@wdc.com>
 <CAEUhbmViJpKtiNXm7CYdF7SPRkOPkvpXJ5+We2m9tZSK_BWi-g@mail.gmail.com>
In-Reply-To: <CAEUhbmViJpKtiNXm7CYdF7SPRkOPkvpXJ5+We2m9tZSK_BWi-g@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 19 Jun 2019 07:29:55 -0700
Message-ID: <CAKmqyKM4UU+CPKu07AK65bNofbbxxaRkSACqoV_vfFEaH-195A@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 0/5] RISC-V: Add firmware
 loading support and default
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
X-List-Received-Date: Wed, 19 Jun 2019 14:30:29 -0000

On Wed, Jun 19, 2019 at 7:26 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Wed, Jun 19, 2019 at 8:56 AM Alistair Francis
> <alistair.francis@wdc.com> wrote:
> >
> > This is an RFC as it will break ALL current users! See below for details.
> >
> > This series consolidates the current RISC-V kernel loading
> > impelementation while also adding support for the -bios option and more
> > advanced kernel image types.
> >
> > After consolidating the kernel loading we can extend the boot loader to
> > support a -bios option. We can also extend the kernel loading options to
> > support not just ELF files but other standard formats.
> >
> > Finally we can include the OpenSBI firmware by default for QEMU users.
> >
> > At the end of this series we are in the good place of no longer
> > requiring users to build firmware to boot a kernel. Instead users can
> > just run QEMu with the -kernel option and everything will work. They can
>
> This is great. I like booting kernel directly for testing without
> bothering the firmware stuff.

That's the goal! Now we just need to not break everything.

>
> > also override the firmware with their own using the -bios option. Using
> > "-bios none" will result in no firmware being loaded (as it is today).
> >
> > !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
> >
> > Unfortunately this series (patch 5 specifically) results in all current
> > Linux boots being broken as users are already loading in their own
> > firmware, which overlaps with the now included default. They will
> > see this error:
> >
> >   rom: requested regions overlap (rom phdr #0: ./images/qemuriscv64/fw_jump.elf. free=0x0000000080008090, addr=0x0000000080000000)
> >   qemu-system-riscv64: rom check and register reset failed
> >
> > If a current user specieifies "-bios none" their flow will continue
> > working. A user can instead no longer load their firmware and
> > use the default or they can load their firmware with the -bios option.
> >
> > At the moment the best idea I have to not break all users is to only
> > include the default firmware if the user specifies "-bios opensbi".
> > That is change the default to not loading the firmware. Then we can work
> > on updating documentation and maybe in future change the default to
> > include a firmware and anyone who doesn't want a default firmware can
> > specify "-bios none".
> >
> > Any other ideas on how to not break everything?
> >
> >
> >
> > Alistair Francis (5):
> >   hw/riscv: Split out the boot functions
> >   hw/riscv: Add support for loading a firmware
> >   hw/riscv: Extend the kernel loading support
> >   roms: Add OpenSBI version 0.3
> >   hw/riscv: Load OpenSBI as the default firmware
> >
> >  .gitmodules                         |   3 +
> >  Makefile                            |   3 +-
> >  configure                           |   1 +
> >  hw/riscv/Makefile.objs              |   1 +
> >  hw/riscv/boot.c                     | 143 ++++++++++++++++++++++++++++
> >  hw/riscv/sifive_e.c                 |  17 +---
> >  hw/riscv/sifive_u.c                 |  19 +---
> >  hw/riscv/spike.c                    |  21 +---
> >  hw/riscv/virt.c                     |  54 ++---------
> >  include/hw/riscv/boot.h             |  30 ++++++
> >  pc-bios/opensbi-riscv32-fw_jump.elf | Bin 0 -> 197988 bytes
> >  pc-bios/opensbi-riscv64-fw_jump.elf | Bin 0 -> 200192 bytes
>
> Since we are considering adding "bios" images, I prefer to add the
> pure binary images instead of ELF images here.

I didn't think about that. Can we just boot them in QEMU like we do
with the ELFs?

Alistair

>
> >  roms/Makefile                       |  17 ++++
> >  roms/opensbi                        |   1 +
> >  14 files changed, 216 insertions(+), 94 deletions(-)
> >  create mode 100644 hw/riscv/boot.c
> >  create mode 100644 include/hw/riscv/boot.h
> >  create mode 100644 pc-bios/opensbi-riscv32-fw_jump.elf
> >  create mode 100644 pc-bios/opensbi-riscv64-fw_jump.elf
> >  create mode 160000 roms/opensbi
>
> Regards,
> Bin

