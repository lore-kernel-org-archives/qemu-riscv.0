Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iRA4H-0000YQ-QA
	for mharc-qemu-riscv@gnu.org; Sun, 03 Nov 2019 02:12:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34138)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <anup@brainfault.org>) id 1iRA4F-0000Xq-1a
 for qemu-riscv@nongnu.org; Sun, 03 Nov 2019 02:12:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <anup@brainfault.org>) id 1iRA4D-000738-NK
 for qemu-riscv@nongnu.org; Sun, 03 Nov 2019 02:12:54 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:52798)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <anup@brainfault.org>) id 1iRA4D-00071n-C8
 for qemu-riscv@nongnu.org; Sun, 03 Nov 2019 02:12:53 -0500
Received: by mail-wm1-x344.google.com with SMTP id c17so6005924wmk.2
 for <qemu-riscv@nongnu.org>; Sun, 03 Nov 2019 00:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=To4ycopByR2i8bwttYMBs8mMexxs8pgOxnlAHibyyIM=;
 b=vtAFfr1Wnc+T6BDvgQi9fW/2xRzc9cj3mJ6uZfJmV/Ckyva7ucywGQkzL8q6sUKWwh
 alVIViumsdfrYZWSpvAExWvOti/XpE9jUeYa/h3QIcQSzkKEVtbJQBJPv3+6gGN7g2mY
 vCYjrswmknleGRKTwkGiIyT8Sj7zWnO/CrBY7xbNJ3kOgOdxW8wHCuOOMJoDs9cgoD5S
 3E8AW03+N+y+MollkgbOWzBuEyZ2psAJgqeuDM8Vg5+n8jgnhlBikvz7T1f7UlYtUWfl
 VLJVp4Q1IaV4jYfB86kIQ7k0pF36wK7Nd96aoWsuATkNWPmV0J4k9WeHUEQ9Aplyb4Iz
 3cpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=To4ycopByR2i8bwttYMBs8mMexxs8pgOxnlAHibyyIM=;
 b=b1B/QlFNhnuqcdgDuRjsLiSFZn6iTdHBqzRrTBAYYjl495sg4SjKwG+AQ/Qogt/gvF
 H0JdNXnwKwLMRvUFrrxlAt7vWxIhdk6/C9DHmy2arziNahj5IAixLI/zOj5pdEI3ggV7
 3KR8UgG9xo5dDw1ByyNDg2S9eNOL5Ld3sRgMa70hvYHUPLt6DWmlCQYwby5Uo6QmJq0L
 y3j9G5zdHAivKX9Wr7AGn1tXNLiROcNtMLxFYeLG+0n3YSKFZYJEVcaNMAEFhc+urCYF
 dMq8M+j0B8VT8UH0HXXC71RHfAza3tkXO7U0jtr85F7Hv5Qz22KtMKOV8hfBHiqmnrb8
 kZAQ==
X-Gm-Message-State: APjAAAU6fuZG46MxPZhyUSSOBBgEIzRnbm4xj4Jdc5W2KE8YvRIz6AgU
 iV8enufMsWov1aYZfc8WjXgCIM2u1JNtHpreycj6Eg==
X-Google-Smtp-Source: APXvYqxiDSPWTLHOa7H8ENKceesLoxdE5B3embH6pAcFmZdwqSZat4nf1COuJmwpDE71Sz5F0ciQYaIj5IH78DV8N3A=
X-Received: by 2002:a1c:4c10:: with SMTP id z16mr11885684wmf.24.1572765170534; 
 Sun, 03 Nov 2019 00:12:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy3sUb_r77NBvEQEAQ0EQB99=4jgAbH3ADOqvJ_iX+o8pg@mail.gmail.com>
 <mhng-111ec6b3-0e63-4f94-a1ed-8ddcd354b943@palmer-si-x1c4>
In-Reply-To: <mhng-111ec6b3-0e63-4f94-a1ed-8ddcd354b943@palmer-si-x1c4>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 3 Nov 2019 12:42:38 +0530
Message-ID: <CAAhSdy1MZPaNhHxR345bu4HOtDndd5eZWJp2eTwJSym+9NjD+w@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] RTC support for QEMU RISC-V virt machine
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Anup Patel <Anup.Patel@wdc.com>, 
 QEMU Developers <qemu-devel@nongnu.org>, Atish Patra <Atish.Patra@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
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
X-List-Received-Date: Sun, 03 Nov 2019 07:12:56 -0000

On Sat, Nov 2, 2019 at 4:44 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Fri, 01 Nov 2019 08:40:24 PDT (-0700), anup@brainfault.org wrote:
> > On Tue, Oct 29, 2019 at 6:55 PM Alistair Francis <alistair23@gmail.com> wrote:
> >>
> >> On Fri, Oct 25, 2019 at 6:28 AM Anup Patel <Anup.Patel@wdc.com> wrote:
> >> >
> >> > This series adds RTC device to QEMU RISC-V virt machine. We have
> >> > selected Goldfish RTC device model for this. It's a pretty simple
> >> > synthetic device with few MMIO registers and no dependency external
> >> > clock. The driver for Goldfish RTC is already available in Linux so
> >> > we just need to enable it in Kconfig for RISCV and also update Linux
> >> > defconfigs.
> >> >
> >> > We have tested this series with Linux-5.4-rc4 plus defconfig changes
> >> > available in 'goldfish_rtc_v2' branch of:
> >> > https://github.com/avpatel/linux.git
> >>
> >> @Peter Maydell this has been reviewed, do you mind taking this in you
> >> next PR? I don't see a maintainer for hw/rtc.
> >
> > It would be great if this series can be taken for QEMU-4.2
>
> It doesn't look like there's anyone who maintains hw/rtc, so maybe that's why
> this has been going slowly?  I'd happy to PR it, but I don't really have the
> bandwidth to sign up to maintain more stuff right now.

No problem, I will maintain Goldfish RTC emulation until someone else
is willing to maintain it.

Regards,
Anup

>
> >
> > Regards,
> > Anup
> >
> >>
> >> Alistair
> >>
> >> >
> >> > Changes since v4:
> >> >  - Fixed typo in trace event usage
> >> >  - Moved goldfish_rtc.h to correct location
> >> >
> >> > Changes since v3:
> >> >  - Address all nit comments from Alistair
> >> >
> >> > Changes since v2:
> >> >  - Rebased on RTC code refactoring
> >> >
> >> > Changes since v1:
> >> >  - Implemented VMState save/restore callbacks
> >> >
> >> > Anup Patel (2):
> >> >   hw: rtc: Add Goldfish RTC device
> >> >   riscv: virt: Use Goldfish RTC device
> >> >
> >> >  hw/riscv/Kconfig              |   1 +
> >> >  hw/riscv/virt.c               |  15 ++
> >> >  hw/rtc/Kconfig                |   3 +
> >> >  hw/rtc/Makefile.objs          |   1 +
> >> >  hw/rtc/goldfish_rtc.c         | 288 ++++++++++++++++++++++++++++++++++
> >> >  hw/rtc/trace-events           |   4 +
> >> >  include/hw/riscv/virt.h       |   2 +
> >> >  include/hw/rtc/goldfish_rtc.h |  46 ++++++
> >> >  8 files changed, 360 insertions(+)
> >> >  create mode 100644 hw/rtc/goldfish_rtc.c
> >> >  create mode 100644 include/hw/rtc/goldfish_rtc.h
> >> >
> >> > --
> >> > 2.17.1
> >> >

