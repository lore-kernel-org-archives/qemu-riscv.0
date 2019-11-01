Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iQZ2a-00039a-AA
	for mharc-qemu-riscv@gnu.org; Fri, 01 Nov 2019 11:40:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52864)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <anup@brainfault.org>) id 1iQZ2X-00038K-0m
 for qemu-riscv@nongnu.org; Fri, 01 Nov 2019 11:40:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <anup@brainfault.org>) id 1iQZ2V-0002uJ-VF
 for qemu-riscv@nongnu.org; Fri, 01 Nov 2019 11:40:40 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:39844)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <anup@brainfault.org>) id 1iQZ2V-0002Yu-Cj
 for qemu-riscv@nongnu.org; Fri, 01 Nov 2019 11:40:39 -0400
Received: by mail-wm1-x343.google.com with SMTP id t26so5349475wmi.4
 for <qemu-riscv@nongnu.org>; Fri, 01 Nov 2019 08:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PnyrLnNYEiZ0VCSsEhmvl+u74qow2KUegd4JUtRWIWk=;
 b=tVtACwLHj+qxRWiAqXGB2HJXrke2qTLCH3m1EuzS/+AskV3tcFxONlCCziwD9tEh29
 DlYABa8Lxp95Gb6jHa/jC/qajNjykgzOSg54vMpCiN5vbzuBZkUh2n2fYEQrcQEeFE+K
 7j9sWnSU37ixDQ1f0yE3PbhW54tTyo+ay6bz0P1rPdtBcsR+obWWn9VQ+SxzQvhAt8QL
 d8ncWRjpHleJW8YHoksOOD5jEPbNfHirhslGzmkOcMF2aLItgjiyRS/+fPejt/eEdnD1
 b8WlnUrY0Fl7x650alv7JEqAZvST2rhons4+wx8BRc80RSOCLx296guNcxARHBxlWX7z
 Rn+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PnyrLnNYEiZ0VCSsEhmvl+u74qow2KUegd4JUtRWIWk=;
 b=VN6fR6xGEJYhNUOBW99wqnZ0A0GwFdjepP4BhAAjShTJaltrgk7kTBJXp1cM9F+oj0
 /zp50Zudfm9cdr/uhsZQzhPpWpUIycNDRVcVnTI9HFJeioY9HVQd9FTHnvK0/MPvgecO
 +zwAuphCB2J9CaO/Toj3HtJlwKxL+ShWRBENHuVfWWku99e3NKUR0C+tYawTT/qqRGv5
 TgLrZlfs+fwp93WdPBnF/eanM8bt8goMxl5jUHXNesTP7OAJAxNQHfb/fiEcXqeXPL9X
 PY6gIu4izWHk+Xd76a1C0sGAxEa+SNrrkHrWmFZRHG7js75iFLM9M/Z995O0+Uv53x5E
 SICQ==
X-Gm-Message-State: APjAAAXLpiPATdSvLaCcexEW1rduiWn7UjNHww3AeblMpB1kLUs9HLtY
 vAvVrNlM9bjPgXcC3p29ifcOcYkhfFL0z1IAjIMeCg==
X-Google-Smtp-Source: APXvYqzEpqJU31nE+PcSBF0U/yI/nLRGdJQrnuHDJpPYoq1kBlHWsYFmYMJzGS96gMY68kHNghTRZwwr1rbmbGeH+mA=
X-Received: by 2002:a05:600c:2112:: with SMTP id
 u18mr10444612wml.177.1572622834966; 
 Fri, 01 Nov 2019 08:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <20191025042734.69244-1-anup.patel@wdc.com>
 <CAKmqyKMQz-OMFQRTdmpBpGMLiZ_ZM+UL5T5aAWZ5F1fC6vddOQ@mail.gmail.com>
In-Reply-To: <CAKmqyKMQz-OMFQRTdmpBpGMLiZ_ZM+UL5T5aAWZ5F1fC6vddOQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 1 Nov 2019 21:10:24 +0530
Message-ID: <CAAhSdy3sUb_r77NBvEQEAQ0EQB99=4jgAbH3ADOqvJ_iX+o8pg@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] RTC support for QEMU RISC-V virt machine
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@sifive.com>
Cc: Anup Patel <Anup.Patel@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Atish Patra <Atish.Patra@wdc.com>, 
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
X-List-Received-Date: Fri, 01 Nov 2019 15:40:42 -0000

On Tue, Oct 29, 2019 at 6:55 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Fri, Oct 25, 2019 at 6:28 AM Anup Patel <Anup.Patel@wdc.com> wrote:
> >
> > This series adds RTC device to QEMU RISC-V virt machine. We have
> > selected Goldfish RTC device model for this. It's a pretty simple
> > synthetic device with few MMIO registers and no dependency external
> > clock. The driver for Goldfish RTC is already available in Linux so
> > we just need to enable it in Kconfig for RISCV and also update Linux
> > defconfigs.
> >
> > We have tested this series with Linux-5.4-rc4 plus defconfig changes
> > available in 'goldfish_rtc_v2' branch of:
> > https://github.com/avpatel/linux.git
>
> @Peter Maydell this has been reviewed, do you mind taking this in you
> next PR? I don't see a maintainer for hw/rtc.

It would be great if this series can be taken for QEMU-4.2

Regards,
Anup

>
> Alistair
>
> >
> > Changes since v4:
> >  - Fixed typo in trace event usage
> >  - Moved goldfish_rtc.h to correct location
> >
> > Changes since v3:
> >  - Address all nit comments from Alistair
> >
> > Changes since v2:
> >  - Rebased on RTC code refactoring
> >
> > Changes since v1:
> >  - Implemented VMState save/restore callbacks
> >
> > Anup Patel (2):
> >   hw: rtc: Add Goldfish RTC device
> >   riscv: virt: Use Goldfish RTC device
> >
> >  hw/riscv/Kconfig              |   1 +
> >  hw/riscv/virt.c               |  15 ++
> >  hw/rtc/Kconfig                |   3 +
> >  hw/rtc/Makefile.objs          |   1 +
> >  hw/rtc/goldfish_rtc.c         | 288 ++++++++++++++++++++++++++++++++++
> >  hw/rtc/trace-events           |   4 +
> >  include/hw/riscv/virt.h       |   2 +
> >  include/hw/rtc/goldfish_rtc.h |  46 ++++++
> >  8 files changed, 360 insertions(+)
> >  create mode 100644 hw/rtc/goldfish_rtc.c
> >  create mode 100644 include/hw/rtc/goldfish_rtc.h
> >
> > --
> > 2.17.1
> >

