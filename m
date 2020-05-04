Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVVtY-0003AA-Hl
	for mharc-qemu-riscv@gnu.org; Mon, 04 May 2020 03:52:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1jVVtX-00039q-29
 for qemu-riscv@nongnu.org; Mon, 04 May 2020 03:52:07 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:35582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1jVVtU-00087g-EL
 for qemu-riscv@nongnu.org; Mon, 04 May 2020 03:52:06 -0400
Received: by mail-wm1-x342.google.com with SMTP id r26so7878547wmh.0
 for <qemu-riscv@nongnu.org>; Mon, 04 May 2020 00:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wo+dQR9tfFxRk/cLvdGpQZsi0vmzZ1euz/1uZifdHg8=;
 b=TbT3v8THdLMnuP2lINA9znEhCkeeWr6QNKcs08lp2j5xGThWizUZVqw14Mp6mttfox
 5773ecSi9rTT6qkH+69Tazh4JqnhWTrPf19WGOE2w9v1Qnn7etq73y+mW0RNQG0lLvS+
 myEmnwivXLxqWe6PvOpYVOX2MBCEibVTK0TJg69Z5xprWfw6erp/jXVCNkVloroHO6Fd
 w7coAIqN43nHvDZmmmTm3vdacXaBSSru0yygWsgMZMTZGdQYUPHaNeLsbaXly29t5VFe
 TQDaIL/uHupao5vASiLGF1ZwoPYSGlWNiSv45V9iBr1KINjOkmnlu1ruhzKABgNLpzNN
 gSIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wo+dQR9tfFxRk/cLvdGpQZsi0vmzZ1euz/1uZifdHg8=;
 b=mTCU9PBBKU1kSsXWrQWQ16/OqS6Ze9NknGvPzZ1cfNIICIC+TCqDoVrIxG0DgQK3Rf
 9LK90f0JX72vw/wZWh8seK4vSRQpfu18gW2Yo7MjlU0ccQMUhCSlgNQHyVY2dE0MPq5G
 O084SaAsC2Boyn6SCLOjdOLiHp6sDkKQ82gOPEJAe0B5TvAF4ehT7PDY4dEciX03UF04
 DAaQZS8Z2iRhkcnMmudoGiq9Vk5ILKrNB7p3+yBi/+h69nXnKyxYi9lii6X4nd3M/9H1
 tgRb6ZghYPImzQLYNKl7LtI3F+WaiJD8SGDli41iy0fRmbIsnzHUYZur1mtRNcroItev
 hqIw==
X-Gm-Message-State: AGi0PuYmNkxBKPYQKW32XSBuW3dBviRgPkMb3AxZC4wv9eiLsiN+vCbL
 zDuvhKzteHWOlRm9F3mCMpMsX14N6QX0LrfCwR4jQw==
X-Google-Smtp-Source: APiQypIKReiBYVl5YQMLWbSgD72L752H+mGGdWj1zfAmU9JqzWSSZuRCwhquS3JY6TMDRQr6J9E9N60s9rJGHqqUV3o=
X-Received: by 2002:a1c:4144:: with SMTP id o65mr13970157wma.78.1588578722225; 
 Mon, 04 May 2020 00:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <1588348254-7241-1-git-send-email-bmeng.cn@gmail.com>
 <1588348254-7241-2-git-send-email-bmeng.cn@gmail.com>
 <CAAhSdy06i1zb6_aedLn41rWDzrjyTcJ_T954DcwX7k2bM_VcVw@mail.gmail.com>
 <CAEUhbmXMcxZqk4RUjcWMG-5MCd-Z3wPn=ktQnHLA3Rvn01iq+g@mail.gmail.com>
In-Reply-To: <CAEUhbmXMcxZqk4RUjcWMG-5MCd-Z3wPn=ktQnHLA3Rvn01iq+g@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 4 May 2020 13:21:50 +0530
Message-ID: <CAAhSdy1kWxW6kyQiMd+-9ZkwMr9xFcZurU7HHoRTE0ST9rnq0Q@mail.gmail.com>
Subject: Re: [PATCH 1/5] roms/opensbi: Update to support building bios images
 for generic platform
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
 Anup Patel <Anup.Patel@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::342;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
X-List-Received-Date: Mon, 04 May 2020 07:52:07 -0000

On Mon, May 4, 2020 at 12:46 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Anup,
>
> On Sun, May 3, 2020 at 12:38 PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Fri, May 1, 2020 at 9:26 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > The RISC-V generic platform is a flattened device tree (FDT) based
> > > platform where all platform specific functionality is provided based
> > > on FDT passed by previous booting stage. The support was added in
> > > upstream opensbi recently.
> > >
> > > Bring the QEMU roms/opensbi submodule to the upstream opensbi commit:
> > > commit 4f18c6e55049 ("platform: generic: Add Sifive FU540 TLB flush range limit override")
> > > with the following changes since v0.7 release:
> > >
> > >   1bb00ab lib: No need to provide default PMP region using platform callbacks
> > >   a9eac67 include: sbi_platform: Combine reboot and shutdown into one callback
> > >   6585fab lib: utils: Add SiFive test device
> > >   4781545 platform: Add Nuclei UX600 platform
> > >   3a326af scripts: adapt binary archive script for Nuclei UX600
> > >   5bdf022 firmware: fw_base: Remove CSR_MTVEC update check
> > >   e6c1345 lib: utils/serial: Skip baudrate config if input frequency is zero
> > >   01a8c8e lib: utils: Improve fdt_parse_uart8250() API
> > >   0a0093b lib: utils: Add fdt_parse_uart8250_node() function
> > >   243b0d0 lib: utils: Remove redundant clint_ipi_sync() declaration
> > >   e3ad7c1 lib: utils: Rename fdt_parse_clint() to fdt_parse_compat_addr()
> > >   a39cd6f lib: utils: Add FDT match table based node lookup
> > >   dd33b9e lib: utils: Make fdt_get_node_addr_size() public function
> > >   66185b3 lib: utils: Add fdt_parse_sifive_uart_node() function
> > >   19e966b lib: utils: Add fdt_parse_hart_id() function
> > >   44dd7be lib: utils: Add fdt_parse_max_hart_id() API
> > >   f0eb503 lib: utils: Add fdt_parse_plic_node() function
> > >   1ac794c include: Add array_size() macro
> > >   8ff2b94 lib: utils: Add simple FDT timer framework
> > >   76f0f81 lib: utils: Add simple FDT ipi framework
> > >   75322a6 lib: utils: Add simple FDT irqchip framework
> > >   76a8940 lib: utils: Add simple FDT serial framework
> > >   7cc6fa4 lib: utils: Add simple FDT reset framework
> > >   4d06353 firmware: fw_base: Introduce optional fw_platform_init()
> > >   f1aa9e5 platform: Add generic FDT based platform support
> > >   1f21b99 lib: sbi: Print platform hart count at boot time
> > >   2ba7087 scripts: Add generic platform to create-binary-archive.sh
> > >   4f18c6e platform: generic: Add Sifive FU540 TLB flush range limit override
> > >
> > > Update our Makefile to build the generic platform instead of building
> > > virt and sifive_u separately.
> > >
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > ---
> > >
> > >  roms/Makefile | 30 ++++++++----------------------
> > >  roms/opensbi  |  2 +-
> > >  2 files changed, 9 insertions(+), 23 deletions(-)
> > >
> > > diff --git a/roms/Makefile b/roms/Makefile
> > > index f9acf39..cb00628 100644
> > > --- a/roms/Makefile
> > > +++ b/roms/Makefile
> > > @@ -64,10 +64,8 @@ default help:
> > >         @echo "  u-boot.e500        -- update u-boot.e500"
> > >         @echo "  u-boot.sam460      -- update u-boot.sam460"
> > >         @echo "  efi                -- update UEFI (edk2) platform firmware"
> > > -       @echo "  opensbi32-virt     -- update OpenSBI for 32-bit virt machine"
> > > -       @echo "  opensbi64-virt     -- update OpenSBI for 64-bit virt machine"
> > > -       @echo "  opensbi32-sifive_u -- update OpenSBI for 32-bit sifive_u machine"
> > > -       @echo "  opensbi64-sifive_u -- update OpenSBI for 64-bit sifive_u machine"
> > > +       @echo "  opensbi32-generic  -- update OpenSBI for 32-bit generic machine"
> > > +       @echo "  opensbi64-generic  -- update OpenSBI for 64-bit generic machine"
> > >         @echo "  bios-microvm       -- update bios-microvm.bin (qboot)"
> > >         @echo "  clean              -- delete the files generated by the previous" \
> > >                                       "build targets"
> > > @@ -170,29 +168,17 @@ skiboot:
> > >  efi: edk2-basetools
> > >         $(MAKE) -f Makefile.edk2
> > >
> > > -opensbi32-virt:
> > > +opensbi32-generic:
> > >         $(MAKE) -C opensbi \
> > >                 CROSS_COMPILE=$(riscv32_cross_prefix) \
> > > -               PLATFORM="qemu/virt"
> > > -       cp opensbi/build/platform/qemu/virt/firmware/fw_jump.bin ../pc-bios/opensbi-riscv32-virt-fw_jump.bin
> > > +               PLATFORM="generic"
> > > +       cp opensbi/build/platform/generic/firmware/fw_jump.bin ../pc-bios/opensbi-riscv32-generic-fw_jump.bin
> >
> > I think you should copy fw_jump.elf as well because QEMU Spike
> > platform needs it.
> >
>
> I believe we intended only to ship default bios images for virt and
> sifive_u. Spike bios image was not shipped in previous QEMU version
> too.

Is there a specific reason for not shipping bios image for Spike machine ?

There were issues booting Linux on QEMU spike machine which are
now fixed and available in QEMU master. I think we should certainly
ship fw_jump.elf for Spike machine. This way we have OpenSBI generic
firmware available as a bios image for three QEMU machines(virt, sifive_u,
and spike).

Regards,
Anup

>
> > >
> > > -opensbi64-virt:
> > > +opensbi64-generic:
> > >         $(MAKE) -C opensbi \
> > >                 CROSS_COMPILE=$(riscv64_cross_prefix) \
> > > -               PLATFORM="qemu/virt"
> > > -       cp opensbi/build/platform/qemu/virt/firmware/fw_jump.bin ../pc-bios/opensbi-riscv64-virt-fw_jump.bin
> > > -
> > > -opensbi32-sifive_u:
> > > -       $(MAKE) -C opensbi \
> > > -               CROSS_COMPILE=$(riscv32_cross_prefix) \
> > > -               PLATFORM="sifive/fu540"
> > > -       cp opensbi/build/platform/sifive/fu540/firmware/fw_jump.bin ../pc-bios/opensbi-riscv32-sifive_u-fw_jump.bin
> > > -
> > > -opensbi64-sifive_u:
> > > -       $(MAKE) -C opensbi \
> > > -               CROSS_COMPILE=$(riscv64_cross_prefix) \
> > > -               PLATFORM="sifive/fu540"
> > > -       cp opensbi/build/platform/sifive/fu540/firmware/fw_jump.bin ../pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
> > > +               PLATFORM="generic"
> > > +       cp opensbi/build/platform/generic/firmware/fw_jump.bin ../pc-bios/opensbi-riscv64-generic-fw_jump.bin
> >
> > Same as above.
> >
> > >
> > >  bios-microvm:
> > >         $(MAKE) -C qboot
> > > diff --git a/roms/opensbi b/roms/opensbi
> > > index 9f1b72c..4f18c6e 160000
> > > --- a/roms/opensbi
> > > +++ b/roms/opensbi
> > > @@ -1 +1 @@
> > > -Subproject commit 9f1b72ce66d659e91013b358939e832fb27223f5
> > > +Subproject commit 4f18c6e55049d858c62e87d2605dd41c06956e4e
> > > --
> > > 2.7.4
> > >
> > >
> >
> > Otherwise looks good to me.
> >
> > Reviewed-by: Anup Patel <anup@brainfault.org>
>
> Regards,
> Bin

