Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mVR7P-0004Xi-Sm
	for mharc-qemu-riscv@gnu.org; Wed, 29 Sep 2021 00:22:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mVR7N-0004Wc-Lz; Wed, 29 Sep 2021 00:22:53 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:46630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mVR7K-0007dU-5y; Wed, 29 Sep 2021 00:22:53 -0400
Received: by mail-io1-xd36.google.com with SMTP id d18so1425386iof.13;
 Tue, 28 Sep 2021 21:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qn4bs1VCkkFJYFwR8JCR7cfsGMHJePAeZabIEsARBlg=;
 b=IZxBi/DyWUbf5Ktqs2X2tbxvxTQRyK2MxzuYB3sQ8C3clo43C2kIDVcAZY6tfyb97y
 urhozfiOAKf5WgP29lB3VRi30HQo+0SNquzC4mMDHrzs//0xJPYcFuMbzy9Mi6YedYi4
 9L/Y/ABq4DRykABTG7Z0e5djzCMfZ4jqoi7vnVj8viPKqd5xReDk1OBo6lLxqr8L/LU9
 f0U8fzShRfe2+VfgMNI0k+S2q3KLawuoUDbgCtIGSddV6z/nUv58ep8qmX3K1GuUi4ow
 rSMukJNcG8ALzkukRy7anLz2H9lfSCUSdWffy9I38JKwO7ia6yY+3GiULTVlY1qYngOs
 X+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qn4bs1VCkkFJYFwR8JCR7cfsGMHJePAeZabIEsARBlg=;
 b=mlJSMVEwz0Zyj4aEzB91dxKh0O3M9E53zdbYTiMA+zeGaOtLsyH33L9FLg+yVJcR32
 jcAiBaLl92Z78C5k+L+RkV7+91/bAQEBYDNUSe0fdAJzVmk7c/KtmMu/Y8RAUSqg/yTe
 xUnnM0gzNu9nHTTiiAQEyV+/X+YNE5mA8UONUnLdklGbqYQCdskeLaZZ4spLxQFuwhA4
 piK1FfEUi2e9YzuKZ32j6hZRxa7HaXwHOspn0wIPaRV2/ugQIhky/L0Oj+8nLHekeCdw
 q8Xoi+HmrNZUAGX+UabzSUSj+Jwv9U4mdE6WPDvHLb4t4Pheo8EExxG9iGB2vBaq89Pv
 aAdA==
X-Gm-Message-State: AOAM532WwPcWsBaVrEgu9WliN+xg8H3IM3P/KhlA/DCB+ixpPrCi0QQW
 sDiuV40Ualz33C56dtQ3tBrY9bD4Betfz9yw5KM=
X-Google-Smtp-Source: ABdhPJzh7MWxz1mQzFiRqIN7K2l+E6qNphg4/qd9Gr5yh3iemKA+Y2PeAsPRNJUQ44R/3P3uvDG8gmb58tHUYXTlCPE=
X-Received: by 2002:a05:6602:4a:: with SMTP id
 z10mr6438804ioz.16.1632889368389; 
 Tue, 28 Sep 2021 21:22:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210831110603.338681-1-anup.patel@wdc.com>
 <CAAhSdy1FdqtY6ubuK3SMqJk8Wb2Bbu26QhR6TMoDZqo=uZzVyg@mail.gmail.com>
In-Reply-To: <CAAhSdy1FdqtY6ubuK3SMqJk8Wb2Bbu26QhR6TMoDZqo=uZzVyg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 29 Sep 2021 14:22:22 +1000
Message-ID: <CAKmqyKO9P_rOhfd8g+r3yBJ-s76QckLQhRsub6DwTrxQB2gQ7Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] QEMU RISC-V ACLINT Support
To: Anup Patel <anup@brainfault.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Anup Patel <anup.patel@wdc.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 29 Sep 2021 04:22:53 -0000

On Wed, Sep 29, 2021 at 2:09 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Tue, Aug 31, 2021 at 4:36 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > The RISC-V Advanced Core Local Interruptor (ACLINT) is an improvement
> > over the SiFive CLINT but also maintains backward compatibility with
> > the SiFive CLINT.
> >
> > Latest RISC-V ACLINT specification (will be frozen soon) can be found at:
> > https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc
> >
> > This series:
> > 1) Replaces SiFive CLINT implementation with RISC-V ACLINT
> > 2) Refactors RISC-V virt machine FDT generation
> > 3) Adds optional full ACLINT support in QEMU RISC-V virt machine
> >
> > This series can be found in the riscv_aclint_v4 branch at:
> > https://github.com/avpatel/qemu.git
> >
> > Changes since v3:
> >  - Rebased on Alistair's CPU GPIO pins v3 series
> >  - Replaced error_report() in PATCH2 with qemu_log_mask()
> >
> > Changes since v2:
> >  - Addresed nit comments in PATCH2
> >  - Update SSWI device emulation to match final ACLINT draft specification
> >
> > Changes since v1:
> >  - Split PATCH1 into two patches where one patch renames CLINT sources
> >    and another patch updates the implementation
> >  - Addressed comments from Alistar and Bin
> >
> > Anup Patel (4):
> >   hw/intc: Rename sifive_clint sources to riscv_aclint sources
> >   hw/intc: Upgrade the SiFive CLINT implementation to RISC-V ACLINT
> >   hw/riscv: virt: Re-factor FDT generation
> >   hw/riscv: virt: Add optional ACLINT support to virt machine
> >
> >  docs/system/riscv/virt.rst     |  10 +
> >  hw/intc/Kconfig                |   2 +-
> >  hw/intc/meson.build            |   2 +-
> >  hw/intc/riscv_aclint.c         | 460 +++++++++++++++++++++++
> >  hw/intc/sifive_clint.c         | 315 ----------------
> >  hw/riscv/Kconfig               |  12 +-
> >  hw/riscv/microchip_pfsoc.c     |  11 +-
> >  hw/riscv/shakti_c.c            |  13 +-
> >  hw/riscv/sifive_e.c            |  13 +-
> >  hw/riscv/sifive_u.c            |  11 +-
> >  hw/riscv/spike.c               |  16 +-
> >  hw/riscv/virt.c                | 652 ++++++++++++++++++++++-----------
> >  include/hw/intc/riscv_aclint.h |  80 ++++
> >  include/hw/intc/sifive_clint.h |  62 ----
> >  include/hw/riscv/virt.h        |   2 +
> >  15 files changed, 1047 insertions(+), 614 deletions(-)
> >  create mode 100644 hw/intc/riscv_aclint.c
> >  delete mode 100644 hw/intc/sifive_clint.c
> >  create mode 100644 include/hw/intc/riscv_aclint.h
> >  delete mode 100644 include/hw/intc/sifive_clint.h
> >
> > --
> > 2.25.1
> >
>
> Ping ??

Sorry, it looks like I forgot to reply indicating the status. This has
been merged into master

Alistair

>
> Regards,
> Anup
>

