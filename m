Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iSl1T-0005cs-MP
	for mharc-qemu-riscv@gnu.org; Thu, 07 Nov 2019 11:52:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45114)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iSl1Q-0005X0-9Y
 for qemu-riscv@nongnu.org; Thu, 07 Nov 2019 11:52:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iSl1O-0002xG-NO
 for qemu-riscv@nongnu.org; Thu, 07 Nov 2019 11:52:35 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:34445)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iSl1O-0002wm-6i
 for qemu-riscv@nongnu.org; Thu, 07 Nov 2019 11:52:34 -0500
Received: by mail-pg1-x542.google.com with SMTP id e4so2461269pgs.1
 for <qemu-riscv@nongnu.org>; Thu, 07 Nov 2019 08:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=KQCtLcefXWN3Ffga/uquHl+0Zn6mwEYpVn1eJIc/dDM=;
 b=sTqJPxQyUZkgeRjSYG5u/UEeZopFo/XxJQ99wgv42BJ+ZP16qiEvEKTy+lDvCvA6Lc
 P7RkXdOiBfaByNfKkccVzUH1TDhBhBtQxveBLkcVBJQj9SSpL/73v1nnw6rBF9Wge8Ah
 3NM+TuXeh0yC65yAmBhVUB49bzGlPDtz/ctH4v3DiHZ6DmevmCddIaeebfs6k34/v+yv
 +wvVcB2q8tyteLEIz77jj3PzsCwfS8D+V8l/7F8mPrAa/WUt0wCqaG6YKru+Fvtytg1W
 26Nv8R2U0kxWT1v3xIt1rQqNfMhdU7fYrGBVU5CCYZMiko1y9pb8a0Q9SrH12vHHNXYp
 vXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=KQCtLcefXWN3Ffga/uquHl+0Zn6mwEYpVn1eJIc/dDM=;
 b=LVHvAVPB60g9fDX8HqbIut/xKGtrYESxGXXiySMSWr2QyJovFCBSsesmwfpT9QyruV
 +aAGoUJ5oyP+w6E1UakLG8KolZBhMDV1FLEGYhn7h9dhxxxdi+og/fyL9KHJhZHvCZ+U
 VOcS1KMS0bj++peUf5e4qnsGjwRzHJdkdLLHEDxOHw9QcFwggWBzzvC/67Lo3w8zEPC7
 zw8ADY1sBPgCAjewGOdwb8cTGETyNvqgDdbX0h9+dt/4F11tHh9KWPlp1Wi0bvFoSCju
 pdU1OFA5x0HV+qZFlSAymRrS/aPbJ6szFy9T2atDP7oL1kRtzIt2ibfUJC6Svs9+Zftj
 B4kQ==
X-Gm-Message-State: APjAAAW3wH1KXAJsGbmc9cVZWVkaOTagcOWyhLpsZYu5oHVGJ+/1m+sA
 wFMe1BDbrqHVT1k5O2EuT8ieUg==
X-Google-Smtp-Source: APXvYqxMH83l8Efo2BQC35h3P36kNgNcb/5nXZ0kAGYX3XgQPumNcc02056VVwv/BUKexO5QVcC9VQ==
X-Received: by 2002:a65:664e:: with SMTP id z14mr5530898pgv.201.1573145552458; 
 Thu, 07 Nov 2019 08:52:32 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id m13sm2536669pga.70.2019.11.07.08.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 08:52:31 -0800 (PST)
Date: Thu, 07 Nov 2019 08:52:31 -0800 (PST)
X-Google-Original-Date: Thu, 07 Nov 2019 08:34:14 PST (-0800)
Subject: Re: [PATCH v8 0/3] RTC support for QEMU RISC-V virt machine
In-Reply-To: <20191106115602.74299-1-anup.patel@wdc.com>
CC: Peter Maydell <peter.maydell@linaro.org>, palmer@sifive.com,
 Alistair Francis <Alistair.Francis@wdc.com>, sagark@eecs.berkeley.edu,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 qemu-riscv@nongnu.org, anup@brainfault.org, Anup Patel <Anup.Patel@wdc.com>,
 qemu-devel@nongnu.org, 
 Atish Patra <Atish.Patra@wdc.com>, philmd@redhat.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Anup Patel <Anup.Patel@wdc.com>
Message-ID: <mhng-fceb5aa2-7610-421a-b350-d939ace5fee2@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
X-List-Received-Date: Thu, 07 Nov 2019 16:52:38 -0000

On Wed, 06 Nov 2019 03:56:29 PST (-0800), Anup Patel wrote:
> This series adds RTC device to QEMU RISC-V virt machine. We have
> selected Goldfish RTC device model for this. It's a pretty simple
> synthetic device with few MMIO registers and no dependency external
> clock. The driver for Goldfish RTC is already available in Linux so
> we just need to enable it in Kconfig for RISCV and also update Linux
> defconfigs.
>
> We have tested this series with Linux-5.4-rc4 plus defconfig changes
> available in 'goldfish_rtc_v2' branch of:
> https://github.com/avpatel/linux.git
>
> Changes since v7:
>  - Fix broken "stdout-path" in "/chosen" DT node of virt machine
>
> Changes since v6:
>  - Rebased on latest QEMU master
>  - Addressed all nit comments from Philippe Mathieu-Daude
>
> Changes since v5:
>  - Rebased on latest QEMU master
>  - Added maintainer entry for Goldfish RTC
>
> Changes since v4:
>  - Fixed typo in trace event usage
>  - Moved goldfish_rtc.h to correct location
>
> Changes since v3:
>  - Address all nit comments from Alistair
>
> Changes since v2:
>  - Rebased on RTC code refactoring
>
> Changes since v1:
>  - Implemented VMState save/restore callbacks
>
> Anup Patel (3):
>   hw: rtc: Add Goldfish RTC device
>   riscv: virt: Use Goldfish RTC device
>   MAINTAINERS: Add maintainer entry for Goldfish RTC
>
>  MAINTAINERS                   |   8 +
>  hw/riscv/Kconfig              |   1 +
>  hw/riscv/virt.c               |  16 ++
>  hw/rtc/Kconfig                |   3 +
>  hw/rtc/Makefile.objs          |   1 +
>  hw/rtc/goldfish_rtc.c         | 285 ++++++++++++++++++++++++++++++++++
>  hw/rtc/trace-events           |   4 +
>  include/hw/riscv/virt.h       |   2 +
>  include/hw/rtc/goldfish_rtc.h |  46 ++++++
>  9 files changed, 366 insertions(+)
>  create mode 100644 hw/rtc/goldfish_rtc.c
>  create mode 100644 include/hw/rtc/goldfish_rtc.h

Thanks.  I've updated the patches on my queue, LMK if there are any more 
changes!

