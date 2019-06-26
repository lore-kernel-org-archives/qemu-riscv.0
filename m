Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hg1Ja-0005HG-6v
	for mharc-qemu-riscv@gnu.org; Wed, 26 Jun 2019 02:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45519)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hg1JW-0005Gy-Ay
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2019 02:21:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hg1JV-0008Q0-3h
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2019 02:21:50 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:40409)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hg1JU-0008NO-Jm
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2019 02:21:49 -0400
Received: by mail-pl1-f194.google.com with SMTP id a93so830387pla.7
 for <qemu-riscv@nongnu.org>; Tue, 25 Jun 2019 23:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=aN/2Vh9ZPP07h/k99QUK7ZDOeVOUlatwM53Z7anOO8Y=;
 b=aTbJnpPtXjt0BGFhjvZzlrPVPqSewVDDn8KK+60oMbqeehYuPT4Re9IUyclhFvOt6Z
 YHO8qcB5RR1i+xEQq/BVDFOwrp/GRWORxSpB9Uv+Z0aJ4Sk8OjNj28ysBCSurAMyB6Lh
 5vxEnfHTmrE9LlHHNQqwHsbRrFdAgemow2foJ8L39ZqHURC5BlgOJWpTaFIpHThUA6Kv
 cWQSBRVG9AYPazI31OYgRwcMptSFtDltlbQze0PgfiwcHvPSxVz5ukgX0+qo8hTItwNn
 plUjHPEQJO25jg9mUIYbopzzanBJp6TTWINGZ/pyenqFpd+pQ0+RbSSvYtoQd7R6fsXI
 tnWg==
X-Gm-Message-State: APjAAAXNzoyrC5w+4f0tfkAjtEQhRAdAAb84fwzXiBtmmIYVUts61qsx
 uUNdCjI0ctmzL13sNyXzhUBc4w==
X-Google-Smtp-Source: APXvYqwZ3pqAieQDr0pnACRWILhi/vtTWGA+7orzvEjTwYWQXh4K+NVg+kh60ATp9sUxHOZtiRC7VA==
X-Received: by 2002:a17:902:7041:: with SMTP id
 h1mr3368287plt.133.1561530106195; 
 Tue, 25 Jun 2019 23:21:46 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id y193sm15990683pgd.41.2019.06.25.23.21.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 23:21:45 -0700 (PDT)
Date: Tue, 25 Jun 2019 23:21:45 -0700 (PDT)
X-Google-Original-Date: Tue, 25 Jun 2019 23:20:59 PDT (-0700)
In-Reply-To: <CAKmqyKOpxtB7SrT2i_UjVsE38=nzf1_q0fmYPhJ4D716j3ZriQ@mail.gmail.com>
CC: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-3fc228c8-dcb7-4353-af88-1b6e038cb6f0@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.214.194
Subject: Re: [Qemu-riscv] [PATCH v1 0/5] RISC-V: Add firmware loading
 support and default
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
X-List-Received-Date: Wed, 26 Jun 2019 06:21:52 -0000

On Tue, 25 Jun 2019 10:06:33 PDT (-0700), alistair23@gmail.com wrote:
> On Mon, Jun 24, 2019 at 3:14 PM Alistair Francis
> <alistair.francis@wdc.com> wrote:
>>
>> This series consolidates the current RISC-V kernel loading
>> impelementation while also adding support for the -bios option and more
>> advanced kernel image types.
>>
>> After consolidating the kernel loading we can extend the boot loader to
>> support a -bios option. We can also extend the kernel loading options to
>> support not just ELF files but other standard formats.
>>
>> Finally we can include the OpenSBI firmware for QEMU users.
>>
>> To avoid breakages we have not changed the default behaviour of QEMU.
>> The plan is to change the default though, which is why an entry to the
>> qemu-deprecated.texi file has been added as well as a new warning.
>>
>> After this series QEMU 4.1 has three options:
>>  1. ``-bios none`` - This is the current default behavior if no -bios option
>>       is included. QEMU will not automatically load any firmware. It is up
>>       to the user to load all the images they need.
>>  2. ``-bios default`` - In a future QEMU release this will become the default
>>       behaviour if no -bios option is specified. This option will load the
>>       default OpenSBI firmware automatically. The firmware is included with
>>       the QEMU release and no user interaction is required. All a user needs
>>       to do is specify the kernel they want to boot with the -kernel option
>>  3. ``-bios <file>`` - Tells QEMU to load the specified file as the firmwrae.
>>
>> All users should transition to using a -bios option. We can start
>> updating all documentation after the release of 4.1.
>>
>> At the end of this series and the transition period we are in the good
>> place of no longer requiring users to build firmware to boot a kernel.
>> Instead users can just run QEMU with the -kernel option and everything
>> will work. They can also override the firmware with their own using
>> the -bios option. Using "-bios none" will result in no firmware being
>> loaded (as it is today).
>>
>
> @Palmer Dabbelt can this go in your 4.1 PR? It has been reviewed and tested.

I don't see any reason why not.  It's top of my list, after I get through my
first pass at email.

>
> Alistair
>
>>
>> Alistair Francis (5):
>>   hw/riscv: Split out the boot functions
>>   hw/riscv: Add support for loading a firmware
>>   hw/riscv: Extend the kernel loading support
>>   roms: Add OpenSBI version 0.3
>>   hw/riscv: Load OpenSBI as the default firmware
>>
>>  .gitmodules                                  |   3 +
>>  Makefile                                     |   5 +-
>>  hw/riscv/Makefile.objs                       |   1 +
>>  hw/riscv/boot.c                              | 154 +++++++++++++++++++
>>  hw/riscv/sifive_e.c                          |  17 +-
>>  hw/riscv/sifive_u.c                          |  22 +--
>>  hw/riscv/spike.c                             |  21 +--
>>  hw/riscv/virt.c                              |  60 ++------
>>  include/hw/riscv/boot.h                      |  32 ++++
>>  pc-bios/opensbi-riscv32-virt-fw_jump.bin     | Bin 0 -> 28848 bytes
>>  pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin | Bin 0 -> 28904 bytes
>>  pc-bios/opensbi-riscv64-virt-fw_jump.bin     | Bin 0 -> 28904 bytes
>>  qemu-deprecated.texi                         |  20 +++
>>  roms/Makefile                                |  48 ++++--
>>  roms/opensbi                                 |   1 +
>>  15 files changed, 278 insertions(+), 106 deletions(-)
>>  create mode 100644 hw/riscv/boot.c
>>  create mode 100644 include/hw/riscv/boot.h
>>  create mode 100644 pc-bios/opensbi-riscv32-virt-fw_jump.bin
>>  create mode 100644 pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
>>  create mode 100644 pc-bios/opensbi-riscv64-virt-fw_jump.bin
>>  create mode 160000 roms/opensbi
>>
>> --
>> 2.22.0
>>

