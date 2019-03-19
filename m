Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h65dM-0005GJ-1h
	for mharc-qemu-riscv@gnu.org; Mon, 18 Mar 2019 23:41:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55576)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h65dI-0005FT-Rf
	for qemu-riscv@nongnu.org; Mon, 18 Mar 2019 23:41:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h65dC-0007yI-3a
	for qemu-riscv@nongnu.org; Mon, 18 Mar 2019 23:41:41 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:34394)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h65dB-0007sk-Nq
	for qemu-riscv@nongnu.org; Mon, 18 Mar 2019 23:41:37 -0400
Received: by mail-pf1-x441.google.com with SMTP id v64so12734822pfb.1
	for <qemu-riscv@nongnu.org>; Mon, 18 Mar 2019 20:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=XIXPhdhId4Pu/TiauopjZGhBbOwjXC4qsc4fov5gtu8=;
	b=ZNgeSIFRChF2GHqC3mVz1K73oxccLSR84ZCnwmuxdGCer5xMVhWBWEbnKrXdGjcwFW
	9YjBzMsu7UDySgvXDfXSCiXV14U5sEu0p4AUAWgkrUoWnlH0ACXj/vZ6PGtaQru7JBKa
	Alj5u3pSFXaVqadJKJyfUDCRWyTtQwEPD52Luwq4x/0lwbefCrC5V7PkPKAPvCIKQmph
	B4uhRViKE4dV5VleUUWgwIPzQpdOYxgVRCkque5XCl/6n4b9CRQ0Xq6rxMe2ak9qyQLX
	6WGRIhLW77Yop0nmb8ezxUCUQBjdC9iAN/bqMyYAUvFCKpmK3cvqkmdgNOsAlJw2RABk
	Q6Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=XIXPhdhId4Pu/TiauopjZGhBbOwjXC4qsc4fov5gtu8=;
	b=U4zzjShtuW5FVTFB0r7R6LHsahwfz002cyildBcAoL6BgtEw/sgm9eJm5td+7GEim6
	mQVmierpe7oWaLxFTFBY5MTlniBkT3GG2ZYyeuBLbc0E4X1m1xvDEMmteLoPZ9pNWmKY
	mxctzByYE/xcrOMYMICTEmS9jK28DkFv1rhx2NDmZ+l7ls1+N5A33BaQK2aWB2voCRd5
	0DFJNomKMR8lS91Z3Kj3T3S40/Z6EUzwnnD95mwk7LyLljsOG1xZSFnHqMRTWN51/sBP
	/+hOb5vbF055wccSGGMnNEFqSNyzJqi4qzxZPghPU6ohsjXHdnxCSMVdgW9sRIkITFbA
	Ma4A==
X-Gm-Message-State: APjAAAUJoZrpsm9UL03Bxnz+bD/unVTRM3C4yxNMsb/Aot9WMlEoGlXo
	AN2qYYA2mzEoIldEWOXyPTD8UA==
X-Google-Smtp-Source: APXvYqwRenVN/Z70V5Hrn1GBvKXrXEi/7ynYfHXlvLMRxfXh04cvxGlPgYMWKUi9IsHEMEBwuFHLGg==
X-Received: by 2002:a63:181a:: with SMTP id y26mr20948970pgl.268.1552966874334;
	Mon, 18 Mar 2019 20:41:14 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-1cad-363a-ebbe-dac8-3f4c.dynamic-ip6.hinet.net.
	[2001:b011:7001:1cad:363a:ebbe:dac8:3f4c])
	by smtp.gmail.com with ESMTPSA id
	m17sm17754529pff.170.2019.03.18.20.41.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Mar 2019 20:41:13 -0700 (PDT)
Date: Mon, 18 Mar 2019 20:41:13 -0700 (PDT)
X-Google-Original-Date: Mon, 18 Mar 2019 20:40:24 PDT (-0700)
In-Reply-To: <CAKmqyKNOsaUEBTQsqt68201oNyQxpry9x8+D-o_fijcy=VKAjg@mail.gmail.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-e1bd5995-bca4-4656-bd21-6086123a064b@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-riscv] [PATCH v1 00/12] Upstream RISC-V fork patches,
 part 4
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Mar 2019 03:41:46 -0000

On Mon, 18 Mar 2019 17:33:38 PDT (-0700), alistair23@gmail.com wrote:
> On Fri, Mar 15, 2019 at 6:22 PM Alistair Francis <alistair23@gmail.com> wrote:
>>
>> On Fri, Mar 15, 2019 at 6:19 PM Alistair Francis
>> <Alistair.Francis@wdc.com> wrote:
>> >
>> > v3:
>> >  - Add a patch to remove some dead code
>> >  - Rebase on master
>> > v2:
>> >  - Add a patch for SiFive U SMP support
>> >  - Rebase on master
>> >
>> > Alistair Francis (3):
>> >   riscv: pmp: Log pmp access errors as guest errors
>> >   riscv: sifive_u: Allow up to 4 CPUs to be created
>> >   target/riscv: Remove unused struct
>> >
>> > Kito Cheng (1):
>> >   RISC-V: linux-user support for RVE ABI
>> >
>> > Michael Clark (8):
>> >   RISC-V: Replace __builtin_popcount with ctpop8 in PLIC
>> >   RISC-V: Allow interrupt controllers to claim interrupts
>> >   RISC-V: Remove unnecessary disassembler constraints
>> >   elf: Add RISC-V PSABI ELF header defines
>> >   RISC-V: Change local interrupts from edge to level
>> >   RISC-V: Add support for vectored interrupts
>> >   RISC-V: Convert trap debugging to trace events
>> >   RISC-V: Update load reservation comment in do_interrupt
>
> @Palmer
>
> Any chance this can go in for 4.0? It's just bug fixes that have been
> on list for a while. Without this series u-boot SMP won't work in
> QEMU, see here:
> https://lists.denx.de/pipermail/u-boot/2019-March/360899.html

That was my plan.  Since they're all bug fixes I was more worried about getting 
everything together on the decodetree front.  I'm hoping to get another PR out 
later this week that collects all the bug fixes we have floating around for 
rc1.

>
> Alistair
>
>>
>> Sorry, this series should be v3 in the title. I won't resend it, just pretend :)
>>
>> Alistair
>>
>> >
>> >  Makefile.objs               |   1 +
>> >  disas/riscv.c               | 138 -----------------------------
>> >  hw/riscv/sifive_plic.c      |  19 +++-
>> >  hw/riscv/sifive_u.c         |   5 +-
>> >  include/elf.h               |  10 +++
>> >  linux-user/riscv/cpu_loop.c |  15 +++-
>> >  target/riscv/cpu.c          |   6 --
>> >  target/riscv/cpu.h          |   6 ++
>> >  target/riscv/cpu_helper.c   | 168 +++++++++++++++---------------------
>> >  target/riscv/cpu_user.h     |   3 +-
>> >  target/riscv/csr.c          |  22 ++---
>> >  target/riscv/pmp.c          |  20 +++--
>> >  target/riscv/trace-events   |   2 +
>> >  13 files changed, 148 insertions(+), 267 deletions(-)
>> >  create mode 100644 target/riscv/trace-events
>> >
>> > --
>> > 2.21.0
>> >

