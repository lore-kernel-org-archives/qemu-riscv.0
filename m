Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mVRAT-0006JL-WC
	for mharc-qemu-riscv@gnu.org; Wed, 29 Sep 2021 00:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mVRAS-0006GW-3R
 for qemu-riscv@nongnu.org; Wed, 29 Sep 2021 00:26:04 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:53198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mVRAQ-00021y-75
 for qemu-riscv@nongnu.org; Wed, 29 Sep 2021 00:26:03 -0400
Received: by mail-wm1-x32b.google.com with SMTP id b192so779777wmb.2
 for <qemu-riscv@nongnu.org>; Tue, 28 Sep 2021 21:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OwpMPM8E4nCsumnueWN5AOA2wjelAJqKY9zEtfMhRVQ=;
 b=RoduxWgxE0QMtCvrkrJ2hSAuPfftGrB9ROIw3zh0pWgEWEXtfW5klPZMD27Jkc8x6y
 NAxZc1SvuLkeyHKfvHQoCGAl4LbP2kSfWYOlAcysD2vFS72KcMIgA1hI+HtsIU8DzlCN
 V0zTCWH9RLK8Y6PfUTyDnUmNDgs44gopNJbBOtEHMZetlJPWpTnrBWuyKHKeNr0uCbdv
 HD9jb470FY0BsrRdDMrvUEXtehQmMquYWRvvFAD4PoIBKgXJorp0z2haJOnp/480YILB
 HQKkQz0hvubp952f0b7dh5pqVFjjRa0sX8VgkwiMALhSql4X1aB4PKwG6/+mHsKJb1Cp
 xOhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OwpMPM8E4nCsumnueWN5AOA2wjelAJqKY9zEtfMhRVQ=;
 b=SNKJtmRY0cQK1RF7YOWN2CoYH0es6fc71+/Mwo04A7a7xBnQ0ehucswQrrmBgJn8mB
 nSkdgFlQZMh5ThUNkBRKB2KwH0PsHsWRQ/I9EHPJudDU9jLoWD+YsPDjDw0ZHyB4ML9X
 Ch/IZJzierhFsAi6WoPriuM6NvnylBKz1vCMdqGEZCVfiju7oSxP3MSG/PHRNjNVlpFV
 7NYUbLz/k2WExFdXN6ayQ9i94LuSf/u0S6AGxx2VJrXRbm3jZHPa8lzMxxLQAK/mU8cz
 JFHCSid3g+yNBoFTbvW60ITsg+a0coEHN+HJW4sZ38nEknTgvLEANnOj2HVcNQOUlLDh
 4GOQ==
X-Gm-Message-State: AOAM532UdoeOLXelHi6t3dWntOjDqhsYGySzwKtO5v2M9jogCWpQaDKl
 9pHDyWnQc0Z5gvgg4pMHavUDX+X9d6AuQOB4MPVOKw==
X-Google-Smtp-Source: ABdhPJxepUCUSM3tnFLkF7RWXaEkE8iWDmH0XwYV6S22sVa31fnKynDMBA1g9Hix4uoRU1KQJmO3EVm+dDOI6rYX3Ps=
X-Received: by 2002:a7b:c753:: with SMTP id w19mr3991361wmk.61.1632889560682; 
 Tue, 28 Sep 2021 21:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210831110603.338681-1-anup.patel@wdc.com>
 <CAAhSdy1FdqtY6ubuK3SMqJk8Wb2Bbu26QhR6TMoDZqo=uZzVyg@mail.gmail.com>
 <CAKmqyKO9P_rOhfd8g+r3yBJ-s76QckLQhRsub6DwTrxQB2gQ7Q@mail.gmail.com>
In-Reply-To: <CAKmqyKO9P_rOhfd8g+r3yBJ-s76QckLQhRsub6DwTrxQB2gQ7Q@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Sep 2021 09:55:48 +0530
Message-ID: <CAAhSdy3cht8MWGyEuHR2M=pZYjOwfaJwb=j7BU66RHybrfgwTA@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] QEMU RISC-V ACLINT Support
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Anup Patel <anup.patel@wdc.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::32b;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 29 Sep 2021 04:26:04 -0000

On Wed, Sep 29, 2021 at 9:52 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Wed, Sep 29, 2021 at 2:09 PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Tue, Aug 31, 2021 at 4:36 PM Anup Patel <anup.patel@wdc.com> wrote:
> > >
> > > The RISC-V Advanced Core Local Interruptor (ACLINT) is an improvement
> > > over the SiFive CLINT but also maintains backward compatibility with
> > > the SiFive CLINT.
> > >
> > > Latest RISC-V ACLINT specification (will be frozen soon) can be found at:
> > > https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc
> > >
> > > This series:
> > > 1) Replaces SiFive CLINT implementation with RISC-V ACLINT
> > > 2) Refactors RISC-V virt machine FDT generation
> > > 3) Adds optional full ACLINT support in QEMU RISC-V virt machine
> > >
> > > This series can be found in the riscv_aclint_v4 branch at:
> > > https://github.com/avpatel/qemu.git
> > >
> > > Changes since v3:
> > >  - Rebased on Alistair's CPU GPIO pins v3 series
> > >  - Replaced error_report() in PATCH2 with qemu_log_mask()
> > >
> > > Changes since v2:
> > >  - Addresed nit comments in PATCH2
> > >  - Update SSWI device emulation to match final ACLINT draft specification
> > >
> > > Changes since v1:
> > >  - Split PATCH1 into two patches where one patch renames CLINT sources
> > >    and another patch updates the implementation
> > >  - Addressed comments from Alistar and Bin
> > >
> > > Anup Patel (4):
> > >   hw/intc: Rename sifive_clint sources to riscv_aclint sources
> > >   hw/intc: Upgrade the SiFive CLINT implementation to RISC-V ACLINT
> > >   hw/riscv: virt: Re-factor FDT generation
> > >   hw/riscv: virt: Add optional ACLINT support to virt machine
> > >
> > >  docs/system/riscv/virt.rst     |  10 +
> > >  hw/intc/Kconfig                |   2 +-
> > >  hw/intc/meson.build            |   2 +-
> > >  hw/intc/riscv_aclint.c         | 460 +++++++++++++++++++++++
> > >  hw/intc/sifive_clint.c         | 315 ----------------
> > >  hw/riscv/Kconfig               |  12 +-
> > >  hw/riscv/microchip_pfsoc.c     |  11 +-
> > >  hw/riscv/shakti_c.c            |  13 +-
> > >  hw/riscv/sifive_e.c            |  13 +-
> > >  hw/riscv/sifive_u.c            |  11 +-
> > >  hw/riscv/spike.c               |  16 +-
> > >  hw/riscv/virt.c                | 652 ++++++++++++++++++++++-----------
> > >  include/hw/intc/riscv_aclint.h |  80 ++++
> > >  include/hw/intc/sifive_clint.h |  62 ----
> > >  include/hw/riscv/virt.h        |   2 +
> > >  15 files changed, 1047 insertions(+), 614 deletions(-)
> > >  create mode 100644 hw/intc/riscv_aclint.c
> > >  delete mode 100644 hw/intc/sifive_clint.c
> > >  create mode 100644 include/hw/intc/riscv_aclint.h
> > >  delete mode 100644 include/hw/intc/sifive_clint.h
> > >
> > > --
> > > 2.25.1
> > >
> >
> > Ping ??
>
> Sorry, it looks like I forgot to reply indicating the status. This has
> been merged into master

Cool, thanks.

Regards,
Anup

>
> Alistair
>
> >
> > Regards,
> > Anup
> >

