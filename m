Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iQg7c-0007cj-CY
	for mharc-qemu-riscv@gnu.org; Fri, 01 Nov 2019 19:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41094)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iQg7Y-0007Wh-TS
 for qemu-riscv@nongnu.org; Fri, 01 Nov 2019 19:14:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iQg7W-0001Lo-CO
 for qemu-riscv@nongnu.org; Fri, 01 Nov 2019 19:14:20 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:39879)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iQg7V-0001Fi-VE
 for qemu-riscv@nongnu.org; Fri, 01 Nov 2019 19:14:18 -0400
Received: by mail-pg1-x542.google.com with SMTP id p12so7369092pgn.6
 for <qemu-riscv@nongnu.org>; Fri, 01 Nov 2019 16:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=I+tk50ZLrZFMT4YeonEpXu60V8yJzZKdvbFllb7MvIQ=;
 b=ufQl8eVhBqdW6CagWT5XAl3aOJeCcDZj4ee22dnUTn2stZ3xh5wfoFe9QLfkYSYu6g
 7Tm7W0lojmzi+LqQDGZCEx0H8Y6YP84uciRnEnwIMfVXrZo4ns6WGC3GX8VJ0m1DrTUp
 PnwHbSock0hfMVr1pamQbIpJ6gDhCbq+hf9k1elVwssq+uTSAPzNK9nbehuAUbuxIynw
 JNsUdl+i3AsL8Qda1ITYgW3b/sQclezYo7d3VpUx8dGXt5GMH1ePKAiG72WLCbrlWk+Y
 cqy4vUVxosnfOlfwVnvrznqO8poEBHHD5BY8Ad+ywQd061/u3so1oeq7KgZ/kKy459vk
 5Kuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=I+tk50ZLrZFMT4YeonEpXu60V8yJzZKdvbFllb7MvIQ=;
 b=J+b2a5UrLgrdLX9T/MmwztbB7PzmbSh14Jh7BVCOgBZoexAecgAVi0yytdorC49qy4
 VNco7FHcFAOmn3V7x5q8L9scB3PSm2oCpo7Y19D74KeFY+ranMXxVR7xkOTBsK/Lj6t1
 bV0e7iK9OAdoC0tpqHAUZVDZ7BpGKmRhuKV8JqDdKB+m79gbaLli6IFaQs7W/IyBvKcL
 mZX0LZ0mU2ZozE+bs2ZDpU7YHHj0F+5yKLcbblxKrZjMfenXnR16LIYGLV2KLtPHGFh7
 vjT143KaBgFjybWQ1P5Oh83OUOtaZzPr+cVZkNjVzniavSwp5VKdYuY5HGJjZIyqy7CY
 AXXQ==
X-Gm-Message-State: APjAAAWv+1/e2iQ7IdYd7x+VOswq/VgEGtxxLF9WG+atIgc7x7s52oWj
 xxz6IfnmsgHUVOvIbNODB6O+zXnP2g4=
X-Google-Smtp-Source: APXvYqzW0m7t50Wk8cntTsthNGlGbrH+ufYqNy3n18ynoXLw5wa3DL/IJpoTh/Gb7bLcKow0OdfDZQ==
X-Received: by 2002:a63:495b:: with SMTP id y27mr16083031pgk.438.1572650055248; 
 Fri, 01 Nov 2019 16:14:15 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id b59sm8490339pjc.14.2019.11.01.16.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 16:14:14 -0700 (PDT)
Date: Fri, 01 Nov 2019 16:14:14 -0700 (PDT)
X-Google-Original-Date: Fri, 01 Nov 2019 16:10:03 PDT (-0700)
Subject: Re: [PATCH v5 0/2] RTC support for QEMU RISC-V virt machine
In-Reply-To: <CAAhSdy3sUb_r77NBvEQEAQ0EQB99=4jgAbH3ADOqvJ_iX+o8pg@mail.gmail.com>
CC: qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Anup Patel <Anup.Patel@wdc.com>, qemu-devel@nongnu.org, 
 Atish Patra <Atish.Patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 alistair23@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: anup@brainfault.org, Peter Maydell <peter.maydell@linaro.org>
Message-ID: <mhng-111ec6b3-0e63-4f94-a1ed-8ddcd354b943@palmer-si-x1c4>
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
X-List-Received-Date: Fri, 01 Nov 2019 23:14:22 -0000

On Fri, 01 Nov 2019 08:40:24 PDT (-0700), anup@brainfault.org wrote:
> On Tue, Oct 29, 2019 at 6:55 PM Alistair Francis <alistair23@gmail.com> wrote:
>>
>> On Fri, Oct 25, 2019 at 6:28 AM Anup Patel <Anup.Patel@wdc.com> wrote:
>> >
>> > This series adds RTC device to QEMU RISC-V virt machine. We have
>> > selected Goldfish RTC device model for this. It's a pretty simple
>> > synthetic device with few MMIO registers and no dependency external
>> > clock. The driver for Goldfish RTC is already available in Linux so
>> > we just need to enable it in Kconfig for RISCV and also update Linux
>> > defconfigs.
>> >
>> > We have tested this series with Linux-5.4-rc4 plus defconfig changes
>> > available in 'goldfish_rtc_v2' branch of:
>> > https://github.com/avpatel/linux.git
>>
>> @Peter Maydell this has been reviewed, do you mind taking this in you
>> next PR? I don't see a maintainer for hw/rtc.
>
> It would be great if this series can be taken for QEMU-4.2

It doesn't look like there's anyone who maintains hw/rtc, so maybe that's why 
this has been going slowly?  I'd happy to PR it, but I don't really have the 
bandwidth to sign up to maintain more stuff right now.

>
> Regards,
> Anup
>
>>
>> Alistair
>>
>> >
>> > Changes since v4:
>> >  - Fixed typo in trace event usage
>> >  - Moved goldfish_rtc.h to correct location
>> >
>> > Changes since v3:
>> >  - Address all nit comments from Alistair
>> >
>> > Changes since v2:
>> >  - Rebased on RTC code refactoring
>> >
>> > Changes since v1:
>> >  - Implemented VMState save/restore callbacks
>> >
>> > Anup Patel (2):
>> >   hw: rtc: Add Goldfish RTC device
>> >   riscv: virt: Use Goldfish RTC device
>> >
>> >  hw/riscv/Kconfig              |   1 +
>> >  hw/riscv/virt.c               |  15 ++
>> >  hw/rtc/Kconfig                |   3 +
>> >  hw/rtc/Makefile.objs          |   1 +
>> >  hw/rtc/goldfish_rtc.c         | 288 ++++++++++++++++++++++++++++++++++
>> >  hw/rtc/trace-events           |   4 +
>> >  include/hw/riscv/virt.h       |   2 +
>> >  include/hw/rtc/goldfish_rtc.h |  46 ++++++
>> >  8 files changed, 360 insertions(+)
>> >  create mode 100644 hw/rtc/goldfish_rtc.c
>> >  create mode 100644 include/hw/rtc/goldfish_rtc.h
>> >
>> > --
>> > 2.17.1
>> >

