Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hdcM6-0005fs-EM
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jun 2019 11:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40421)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hdcM4-0005cJ-0k
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2019 11:18:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hdcLy-0006Kw-EG
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2019 11:18:30 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:38985)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hdcLu-0006Be-SA; Wed, 19 Jun 2019 11:18:24 -0400
Received: by mail-ed1-x544.google.com with SMTP id m10so27773611edv.6;
 Wed, 19 Jun 2019 08:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7U8x15Ygol6ToivrArynOYp6txXvxaeGK2YxgLl1UGM=;
 b=RBZzIIJLHxR3QRg2He2ht8kioDjZcw4E96Gf0zEYayXwIHgHWo8GWlLygqHWhAUglU
 qcgM2/nKNprbF7s3ANOOj068R7l8DzPHGGG5zReaI3GqvbeZXdyp01FhJ+AgSOguSzKf
 0o1346JTsNKu9UxzkKZc4pQSgnl+UZ5yRKbFsMCrtKsnW95JKsXbDx76GSxpp935Yyq+
 BQ8EJ4B3RDLaTVSXXCDcsiWcH7bg0pSfeQ9k0DD4/13IgR3QoJTkMULqZXZVSCsYmXvW
 fVnJ3qBhTanIhfNFXhF+bTJlVODaf+Y8WQ9xB5zTUlW3KLfywwGK6CZj1jAM7LKe+d43
 aW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7U8x15Ygol6ToivrArynOYp6txXvxaeGK2YxgLl1UGM=;
 b=ZulNYlGGVQK3KZk1pcRVFiVPJnVQlIZhfLP026/lZ5qklU4vSM1B0JEyIKOnhFftw1
 JvxwxXrCqjwuD73R/AgMyGGLSDlu5+LXO39vJ4tov0NmZaDT60f+1lSY0I7et/H6pNar
 zRUeiekPwVwn8d4t8HWM5WCJKcniVtJdR1MfbO0bvdeMjVQDh3uTE0OvVDx/rU0ZplZW
 cKC1iC/YuXuh7/ATe8Epg0zNLNrFiBfuZd/S2vnJxhiu/8CKu5fh2zWZDlRFMimcv/fF
 d/9YrOcat2ZmJalcCkX0+6OFx0MWa6VXrL8o/xkpsuvkC+Y3+Ozm5f2dhDMcOYsjn/p+
 b15g==
X-Gm-Message-State: APjAAAUDJ6sqOipNtqG5zyZjyKt/7Tzz60B01oLh5SxYE3I8V7ncfSMR
 mh3Ds9FrdmVQ2PNxCCFgeTyIlS1LcGuVkK3+FK0=
X-Google-Smtp-Source: APXvYqx7ongO0sh29usVxUbFne6vb7//im0Dx97b3A1jUFueAQbvquon2ni+3SnEx6GJdAZLrbxVnLYmA4ORybh6cSc=
X-Received: by 2002:a50:94e6:: with SMTP id t35mr94208723eda.137.1560957496029; 
 Wed, 19 Jun 2019 08:18:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1560904640.git.alistair.francis@wdc.com>
 <2fd2fa66cf561d8041f75351c28ed025828c56ff.1560904640.git.alistair.francis@wdc.com>
 <CAAhSdy12uKV14cdxvUniSLFw_iF5WNKjoLCanS3Bs=33w-c9xA@mail.gmail.com>
In-Reply-To: <CAAhSdy12uKV14cdxvUniSLFw_iF5WNKjoLCanS3Bs=33w-c9xA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 19 Jun 2019 23:18:05 +0800
Message-ID: <CAEUhbmXYfdAojDtNxXz8XYRk0X1jt+qLB6oVP1pFKNcjWjeh5w@mail.gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <alistair23@gmail.com>, 
 Palmer Dabbelt <palmer@sifive.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::544
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 4/5] roms: Add OpenSBI
 version 0.3
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
X-List-Received-Date: Wed, 19 Jun 2019 15:18:33 -0000

On Wed, Jun 19, 2019 at 1:14 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Wed, Jun 19, 2019 at 6:24 AM Alistair Francis
> <alistair.francis@wdc.com> wrote:
> >
> > Add OpenSBI version 0.3 as a git submodule and as a prebult binary.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  .gitmodules                         |   3 +++
> >  Makefile                            |   3 ++-
> >  configure                           |   1 +
> >  pc-bios/opensbi-riscv32-fw_jump.elf | Bin 0 -> 197988 bytes
> >  pc-bios/opensbi-riscv64-fw_jump.elf | Bin 0 -> 200192 bytes
> >  roms/Makefile                       |  17 +++++++++++++++++
> >  roms/opensbi                        |   1 +
> >  7 files changed, 24 insertions(+), 1 deletion(-)
> >  create mode 100644 pc-bios/opensbi-riscv32-fw_jump.elf
> >  create mode 100644 pc-bios/opensbi-riscv64-fw_jump.elf
> >  create mode 160000 roms/opensbi
> >
>
> The OpenSBI firmwares are platform specific so we should have
> machine directory under pc-bios/ directory
>
> So for virt machine we will have:
> pc-bios/riscv32/virt/fw_jump.elf
> pc-bios/riscv64/virt/fw_jump.elf

And we should only integrate plain binary image for "bios" images here.

pc-bios/riscv32/virt/fw_jump.bin
pc-bios/riscv64/virt/fw_jump.bin

Regards,
Bin

