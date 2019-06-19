Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hdc0m-0006AN-9g
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jun 2019 10:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34652)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hdc0h-0005uw-U6
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2019 10:56:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hdbnT-0004BH-Q5
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2019 10:42:50 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:37918)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hdbnR-00046j-KX; Wed, 19 Jun 2019 10:42:45 -0400
Received: by mail-ed1-x544.google.com with SMTP id r12so25401296edo.5;
 Wed, 19 Jun 2019 07:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h2vkCkvykHaLWXR5z6CCLD3PMw69h+AfbOyy25hOpi8=;
 b=i+abylgV4RehHNW7tGrRRlgf023r+/JwrKuzfvLtSBgVAe1KiXlgLLSUp5pWgGwpoI
 I7ph3ErXjXEOPfbR5GLb3BycDpR6IvsCIhUJEDGuxbgJDN3nsqLHaY1qC4YlxcpPiaXa
 CGvfOtLjBEXMfpM02ypHP4a85hFLgfSvkadBJtb4D2KKYZ1TDXERhVX6LfGg4kx6ZRuV
 FNs415ADbmWp6raTcOqz8UZCC+Wma4iXvX6oduiFw38dmbxh3E0VTDJiyGMLCzyNAeL9
 aIHpwrbGn46Ygtsh9YDFCQaPCnmnUryyAwoEezeMj9CwXd4jLkwu8Zk1hNVxRL78XIcO
 uEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h2vkCkvykHaLWXR5z6CCLD3PMw69h+AfbOyy25hOpi8=;
 b=LiGlNKFIScWnyXblian2IFvKhRjmFllMcgYxgJA5PpW0PJDC6e6TtW9uEK9dyC6AM0
 Ia9+RUbww4qwSpfpiekWc2jbcx9NuKaNp4mTRcWTr7rmQlpKUld1xae0qqOqLLzNs1lh
 era1D8mX+aHRsZZOFXEqcAI3OxNmy/vM8L6HBeXrncjZrvTUZx5CFhHcc57BV31r1pSo
 0RVIqXz5LNVitQVYDDuJtIjb8ypvq/VLSVwS5aYiizFuySVJRTYgd0ZiK31zO7Mte/Rw
 O2mCXp/R739Kxhl/fnqpZN5SnUl2tDp/0eangOLOA3pAje58QiW42WaQY+JbUE87nM3u
 81Gw==
X-Gm-Message-State: APjAAAUMHgdfgaQDCw2sUj4Qu6dwpTE2ViWc5ZQCIP7y41ZUx2WL5bW7
 cGjSsKcNGXDwaXtSpeUfQ1zcLYA2ZbIgf+c5jBc=
X-Google-Smtp-Source: APXvYqxDt4hmegmzZY/GnCoMEZAKFuIpoRXnxW4cVoeA23DfrFoWJW99TJ0Im4f/2yVkYrLwBukDLhe+4WkTMltYEhg=
X-Received: by 2002:a17:906:4f8f:: with SMTP id
 o15mr6478965eju.129.1560955363577; 
 Wed, 19 Jun 2019 07:42:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1560904640.git.alistair.francis@wdc.com>
 <CAEUhbmViJpKtiNXm7CYdF7SPRkOPkvpXJ5+We2m9tZSK_BWi-g@mail.gmail.com>
 <CAKmqyKM4UU+CPKu07AK65bNofbbxxaRkSACqoV_vfFEaH-195A@mail.gmail.com>
In-Reply-To: <CAKmqyKM4UU+CPKu07AK65bNofbbxxaRkSACqoV_vfFEaH-195A@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 19 Jun 2019 22:42:30 +0800
Message-ID: <CAEUhbmUwAVLXY9SSoryWBDeNL8gUfBCE+xweSSmuE9KwzWeX=w@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::544
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
X-List-Received-Date: Wed, 19 Jun 2019 14:56:29 -0000

On Wed, Jun 19, 2019 at 10:30 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Wed, Jun 19, 2019 at 7:26 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Wed, Jun 19, 2019 at 8:56 AM Alistair Francis
> > <alistair.francis@wdc.com> wrote:
> > >
> > > This is an RFC as it will break ALL current users! See below for details.
> > >
> > > This series consolidates the current RISC-V kernel loading
> > > impelementation while also adding support for the -bios option and more
> > > advanced kernel image types.
> > >
> > > After consolidating the kernel loading we can extend the boot loader to
> > > support a -bios option. We can also extend the kernel loading options to
> > > support not just ELF files but other standard formats.
> > >
> > > Finally we can include the OpenSBI firmware by default for QEMU users.
> > >
> > > At the end of this series we are in the good place of no longer
> > > requiring users to build firmware to boot a kernel. Instead users can
> > > just run QEMu with the -kernel option and everything will work. They can
> >
> > This is great. I like booting kernel directly for testing without
> > bothering the firmware stuff.
>
> That's the goal! Now we just need to not break everything.
>
> >
> > > also override the firmware with their own using the -bios option. Using
> > > "-bios none" will result in no firmware being loaded (as it is today).
> > >
> > > !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
> > >
> > > Unfortunately this series (patch 5 specifically) results in all current
> > > Linux boots being broken as users are already loading in their own
> > > firmware, which overlaps with the now included default. They will
> > > see this error:
> > >
> > >   rom: requested regions overlap (rom phdr #0: ./images/qemuriscv64/fw_jump.elf. free=0x0000000080008090, addr=0x0000000080000000)
> > >   qemu-system-riscv64: rom check and register reset failed
> > >
> > > If a current user specieifies "-bios none" their flow will continue
> > > working. A user can instead no longer load their firmware and
> > > use the default or they can load their firmware with the -bios option.
> > >
> > > At the moment the best idea I have to not break all users is to only
> > > include the default firmware if the user specifies "-bios opensbi".
> > > That is change the default to not loading the firmware. Then we can work
> > > on updating documentation and maybe in future change the default to
> > > include a firmware and anyone who doesn't want a default firmware can
> > > specify "-bios none".
> > >
> > > Any other ideas on how to not break everything?
> > >
> > >
> > >
> > > Alistair Francis (5):
> > >   hw/riscv: Split out the boot functions
> > >   hw/riscv: Add support for loading a firmware
> > >   hw/riscv: Extend the kernel loading support
> > >   roms: Add OpenSBI version 0.3
> > >   hw/riscv: Load OpenSBI as the default firmware
> > >
> > >  .gitmodules                         |   3 +
> > >  Makefile                            |   3 +-
> > >  configure                           |   1 +
> > >  hw/riscv/Makefile.objs              |   1 +
> > >  hw/riscv/boot.c                     | 143 ++++++++++++++++++++++++++++
> > >  hw/riscv/sifive_e.c                 |  17 +---
> > >  hw/riscv/sifive_u.c                 |  19 +---
> > >  hw/riscv/spike.c                    |  21 +---
> > >  hw/riscv/virt.c                     |  54 ++---------
> > >  include/hw/riscv/boot.h             |  30 ++++++
> > >  pc-bios/opensbi-riscv32-fw_jump.elf | Bin 0 -> 197988 bytes
> > >  pc-bios/opensbi-riscv64-fw_jump.elf | Bin 0 -> 200192 bytes
> >
> > Since we are considering adding "bios" images, I prefer to add the
> > pure binary images instead of ELF images here.
>
> I didn't think about that. Can we just boot them in QEMU like we do
> with the ELFs?

Yes, use load_image_targphys() instead of load_elf().

Regards,
Bin

