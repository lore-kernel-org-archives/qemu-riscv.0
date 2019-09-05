Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i5x05-0006DW-38
	for mharc-qemu-riscv@gnu.org; Thu, 05 Sep 2019 15:00:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41681)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i5x00-0006Cn-Ac
 for qemu-riscv@nongnu.org; Thu, 05 Sep 2019 15:00:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i5wzy-0003Sy-KI
 for qemu-riscv@nongnu.org; Thu, 05 Sep 2019 15:00:52 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35383)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i5wzu-0003QX-8G
 for qemu-riscv@nongnu.org; Thu, 05 Sep 2019 15:00:47 -0400
Received: by mail-pf1-f196.google.com with SMTP id 205so2390660pfw.2
 for <qemu-riscv@nongnu.org>; Thu, 05 Sep 2019 12:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=tf5VoUHpIl0cyY+phCUalvQNDnk/AIZu9nPIzaFjdU0=;
 b=IwFvo9BpK7OT4FjehYi/Jm3634fKbLqoKk0VK4PpxKLcFb1szECI5KpphMl+mWTmD5
 /w7AhsnZCvn/hbc3FO5iII7rJ7OhSNWlmWJlCC5F08IJlF816EtngETtVQ7eIgdLhVk/
 1O2PC1BLy2nDgZW52kTxQHVtUxAq3rOp40itAMnHqMQtJ6c6EsVdj3HC7q48i1z0UCWu
 NHe0P7BW7TPObmTLykBBLaRFeZFijhqWGGKYZj+IuQJxaOf4r3+T1gTIvlB1HXogVOEX
 T1CnFRrXNwiX9KQyJ42QQnER+axy5jFGvRGfWD/00qQLhQ+0d/IcYpitDoql9PufKSdT
 jhWg==
X-Gm-Message-State: APjAAAVBV03aOKkjhJqWAC9jpUtNrRR0GNc8KTgUb26sC90A5t6Y/vzA
 yViyrW4XoBZKSPQ/OuUcA/a7Kg==
X-Google-Smtp-Source: APXvYqyl19+IuR6d0WckgPzSxn5rvZ8rUQt98qnoCvlL3sVetBrcc6LGwBzH+28tTIAmzgcSZV/F5A==
X-Received: by 2002:a17:90a:b383:: with SMTP id
 e3mr5558930pjr.85.1567710042609; 
 Thu, 05 Sep 2019 12:00:42 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id r3sm3341994pfr.101.2019.09.05.12.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 12:00:41 -0700 (PDT)
Date: Thu, 05 Sep 2019 12:00:41 -0700 (PDT)
X-Google-Original-Date: Thu, 05 Sep 2019 10:58:27 PDT (-0700)
In-Reply-To: <CAEUhbmWGHbBXO+NtkfxJc1tHNLKY_nLPKQ_L=MVsyuToZ02e9w@mail.gmail.com>
CC: alistair23@gmail.com, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-1e0d1887-7084-4997-bcc4-a254d05f629a@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.196
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v7 00/30] riscv: sifive_u:
 Improve the emulation fidelity of sifive_u machine
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
X-List-Received-Date: Thu, 05 Sep 2019 19:00:54 -0000

On Thu, 05 Sep 2019 08:25:46 PDT (-0700), bmeng.cn@gmail.com wrote:
> Hi Alistair,
>
> On Thu, Sep 5, 2019 at 3:50 AM Alistair Francis <alistair23@gmail.com> wrote:
>>
>> On Sat, Aug 31, 2019 at 7:54 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>> >
>> > As of today, the QEMU 'sifive_u' machine is a special target that does
>> > not boot the upstream OpenSBI/U-Boot firmware images built for the real
>> > SiFive HiFive Unleashed board. Hence OpenSBI supports a special platform
>> > "qemu/sifive_u". For U-Boot, the sifive_fu540_defconfig is referenced
>> > in the OpenSBI doc as its payload, but that does not boot at all due
>> > to various issues in current QEMU 'sifive_u' machine codes.
>> >
>> > This series aims to improve the emulation fidelity of sifive_u machine,
>> > so that the upstream OpenSBI, U-Boot and kernel images built for the
>> > SiFive HiFive Unleashed board can be used out of the box without any
>> > special hack.
>> >
>> > The major changes include:
>> > - Heterogeneous harts creation supported, so that we can create a CPU
>> >   that exactly mirrors the real hardware: 1 E51 + 4 U54.
>> > - Implemented a PRCI model for FU540
>> > - Implemented an OTP model for FU540, primarily used for storing serial
>> >   number of the board
>> > - Fixed GEM support that was seriously broken on sifive_u
>> > - Synced device tree with upstream Linux kernel on sifive_u
>> >
>> > OpenSBI v0.4 image built for sifive/fu540 is included as the default
>> > bios image for 'sifive_u' machine.
>> >
>> > The series is tested against OpenSBI v0.4 image for sifive/fu540
>> > paltform, U-Boot v2019.10-rc1 image for sifive_fu540_defconfig,
>> > and Linux kernel v5.3-rc3 image with the following patch:
>> >
>> > macb: Update compatibility string for SiFive FU540-C000 [1]
>> >
>> > OpenSBI + U-Boot, ping/tftpboot with U-Boot MACB driver works well.
>> > Boot Linux 64-bit defconfig image, verified that system console on
>> > the serial 0 and ping host work pretty well.
>> >
>> > An OpenSBI patch [2] was sent to drop the special "qemu/sifive_u" platform
>> > support in OpenSBI. The original plan was to get the drop patch applied
>> > after this QEMU series is merged. However after discussion in the OpenSBI
>> > mailing list, it seems the best option for us is to let OpenSBI continue
>> > shipping the special "qemu/sifive_u" platform support to work with QEMU
>> > version <= 4.1 and deprecate the support sometime in the future. A patch
>> > will need to be sent to OpenSBI mailing list to update its document.
>> >
>> > v4 is now rebased on Palmer's QEMU RISC-V repo "for-master" branch.
>> > Dropped the following v3 patch that was already done by someone else.
>> > - riscv: sifive_u: Generate an aliases node in the device tree
>> > - riscv: sifive_u: Support loading initramfs
>>
>> I'm having trouble applying this. Do you mind sharing a public git branch?
>
> So I see Palmer has rebased his "for-master" branch against QEMU
> master and now this patch series cannot be applied cleanly.
>
> Even worse, the current "for-master" branch has build errors for QEMU RISC-V.

Sorry, I haven't gotten around to fixing up the patch queue for now.  It's 
always OK to just send stuff against Peter's master, particularly if it's a big 
patch set like this, as that's more likely to be a stable base for testing.

