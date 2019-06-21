Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1heSGk-0001Mq-DB
	for mharc-qemu-riscv@gnu.org; Fri, 21 Jun 2019 18:44:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58983)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1heSGe-0001KI-QZ
 for qemu-riscv@nongnu.org; Fri, 21 Jun 2019 18:44:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1heSGc-0007OJ-Pl
 for qemu-riscv@nongnu.org; Fri, 21 Jun 2019 18:44:24 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:37494)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1heSGc-00074K-1D; Fri, 21 Jun 2019 18:44:22 -0400
Received: by mail-lj1-x243.google.com with SMTP id 131so7322381ljf.4;
 Fri, 21 Jun 2019 15:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L5AWhO6epyI0RH7T8aqGR8TYkVzCpsn7+Xt2/HVyta4=;
 b=gl5rDFgUGtyouty6kKDrd6XQaBr6RH6scrSSnF4tPTrdMnzqePCd6Za3xVEfWrekDY
 eJqraw8HSLqZKsGEtCEppJha3Vp1lNaiHYQiEyzOA2BUDD69DTjGTYIEqUnCxCXA5NTK
 AHnj6dzT23hKwFG4i2Llp/T9JJkDiVL2bEFNO8/Bk57/RioCMRkrGTstl/6Gk2tUC2nz
 YsdoCQCqs3selHmS5MaNEcdIMpcne7Z2jVhgM0jNlZmK0jTPZFu2XjAU3VMIgInCSrE2
 AISEVCW5Ev7Od7zmGbbVB0uQUn9PZQWvFu0MBHDrLe3wrri0RtZoR8RIyuw5BhnEwRwX
 yNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L5AWhO6epyI0RH7T8aqGR8TYkVzCpsn7+Xt2/HVyta4=;
 b=SqypF57GOVx/QDjf7YE+FaLEY6mQTTcm1WYzYfXNm6WT4pk+MdIjHmUIcgnrK/7HLf
 PQpdvO3nGe13bCvYh7InZjBD8zmG5voVZnJvUpVjKW2ewISbov5aTzLFLaWNeFmrf0dG
 JlRVFjvZApRpLRBHAodgkm4JFQDDZ0itTV7p/1mc3pBnoqCv/5M97S1L0vMf3+vSJ6qj
 CvB2oCZQmODcBcIJhdXRTmDIHEGsro9eFiECO4Mk3tndL+sqyGqLyAZPSZ2hIpUqPKaq
 3atn3s04K/Es5QV0cTKINocC3ZZ2lfI7IPGp+hFYce4oWneVcNYEtYR2hMG7MJYMk5Qw
 TRzA==
X-Gm-Message-State: APjAAAWQnlj5uOmOSYSPriTYnWLR8kagN/Ra1tOzIYwBnOgMPxDWsvf0
 eSyuAeZW7BqQIEew4gwLabUEuxcY0jjVmw47U+Q=
X-Google-Smtp-Source: APXvYqzrn6g1ZTbSKjmQTrOdP2EFeHW/j28ZUUJtRYxzyzWtVdUL6LgkXmUPRJd343dajuhy9JX26GiDzNFeZuZBDh4=
X-Received: by 2002:a2e:6e0e:: with SMTP id j14mr8072460ljc.85.1561157048217; 
 Fri, 21 Jun 2019 15:44:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1560904640.git.alistair.francis@wdc.com>
 <2fd2fa66cf561d8041f75351c28ed025828c56ff.1560904640.git.alistair.francis@wdc.com>
 <CAAhSdy12uKV14cdxvUniSLFw_iF5WNKjoLCanS3Bs=33w-c9xA@mail.gmail.com>
 <CAEUhbmXYfdAojDtNxXz8XYRk0X1jt+qLB6oVP1pFKNcjWjeh5w@mail.gmail.com>
 <CAKmqyKPSsFQw0xoeoP7376UpS6LWN1T5Kc53Q7tStZsgwKiNiQ@mail.gmail.com>
 <CAEUhbmVWYHfRDu+EO_V6OC6kOr2cB8aecyJRQUYZPDoxbB4Wag@mail.gmail.com>
In-Reply-To: <CAEUhbmVWYHfRDu+EO_V6OC6kOr2cB8aecyJRQUYZPDoxbB4Wag@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 21 Jun 2019 15:41:16 -0700
Message-ID: <CAKmqyKNt1+o6_GBeSQ+Pj0eRKBvyHjNRRPfgbQdx5mU9+Ffj+Q@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@sifive.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::243
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
X-List-Received-Date: Fri, 21 Jun 2019 22:44:26 -0000

On Thu, Jun 20, 2019 at 10:42 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Thu, Jun 20, 2019 at 2:30 AM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Wed, Jun 19, 2019 at 8:18 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > On Wed, Jun 19, 2019 at 1:14 PM Anup Patel <anup@brainfault.org> wrote:
> > > >
> > > > On Wed, Jun 19, 2019 at 6:24 AM Alistair Francis
> > > > <alistair.francis@wdc.com> wrote:
> > > > >
> > > > > Add OpenSBI version 0.3 as a git submodule and as a prebult binary.
> > > > >
> > > > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > > > ---
> > > > >  .gitmodules                         |   3 +++
> > > > >  Makefile                            |   3 ++-
> > > > >  configure                           |   1 +
> > > > >  pc-bios/opensbi-riscv32-fw_jump.elf | Bin 0 -> 197988 bytes
> > > > >  pc-bios/opensbi-riscv64-fw_jump.elf | Bin 0 -> 200192 bytes
> > > > >  roms/Makefile                       |  17 +++++++++++++++++
> > > > >  roms/opensbi                        |   1 +
> > > > >  7 files changed, 24 insertions(+), 1 deletion(-)
> > > > >  create mode 100644 pc-bios/opensbi-riscv32-fw_jump.elf
> > > > >  create mode 100644 pc-bios/opensbi-riscv64-fw_jump.elf
> > > > >  create mode 160000 roms/opensbi
> > > > >
> > > >
> > > > The OpenSBI firmwares are platform specific so we should have
> > > > machine directory under pc-bios/ directory
> > > >
> > > > So for virt machine we will have:
> > > > pc-bios/riscv32/virt/fw_jump.elf
> > > > pc-bios/riscv64/virt/fw_jump.elf
> >
> > I have updated the names to indicate the machine. The pc-bios directly
> > appears to be flat (at least for binaries) so I don't want to add
> > subdirectories.
> >
>
> Should we include pre-built OpenSBI "bios" for "sifive_u" machine too?

Yep, I am doing that now.

Alistair

>
> > >
> > > And we should only integrate plain binary image for "bios" images here.
> > >
> > > pc-bios/riscv32/virt/fw_jump.bin
> > > pc-bios/riscv64/virt/fw_jump.bin
> >
> > Yep, fixed.
> >
>
> Regards,
> Bin

