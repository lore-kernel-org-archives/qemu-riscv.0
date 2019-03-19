Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h62iw-0002dY-MG
	for mharc-qemu-riscv@gnu.org; Mon, 18 Mar 2019 20:35:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40539)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1h62iu-0002c7-Dw
	for qemu-riscv@nongnu.org; Mon, 18 Mar 2019 20:35:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1h62it-0006S3-5G
	for qemu-riscv@nongnu.org; Mon, 18 Mar 2019 20:35:20 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:38075)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1h62im-0006Dv-51; Mon, 18 Mar 2019 20:35:13 -0400
Received: by mail-lf1-x144.google.com with SMTP id a6so10699353lfl.5;
	Mon, 18 Mar 2019 17:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GdfvilF5z9cObR8x4HOtS6xiyEPKSA7FQObG3o7QHuo=;
	b=tO+9pAJRNj/V1ny85DLTjGLWnkOynVclPvW2p4NFlFzULhZMfVtDS4E8oSWQbEwoQd
	JPlr3FvKL/XJtw4bhwdNMeqWNBLzmKSgBsLHBt1kH00sr9h9BrkuAhOnCYN01lsRZ6ns
	yrsR/w9J5Z/u+mSfidM3F+vBXGsrwwCvt5q3ZW6lfljoE8vRPwIkDoexhCAQi7SFpIdP
	VfUze19W5fZAA5cMoJ8P6cdQ1yaaEuYla8TKTc4Gx9ziZWgpSL40IZzO5rMZ7Fefzfxw
	iN41FBBFd9g62fwc+hrW82awavGm7A6ixj3NJE4sKQi/etlRGlAFOoHf5MNGp3fzbVU8
	dwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GdfvilF5z9cObR8x4HOtS6xiyEPKSA7FQObG3o7QHuo=;
	b=XqaPYHaE738D+HkiM9tRhvg39t3O2ZI4PSGvjcf6l/iguVsYNSzBXaswtA7Fs3qPvc
	bI/Z3eGxJxPbCRy8wYDOEcOrD/sbeWyfJteb2gbu+MbZTwWjEvSr7PjOOdeirpslfebz
	TriP7FyyNzbf//SC8m+SDKe5mkSrJgUTmW0MNsO3q4pgoQhDDKTl9kxNJrkzKmf8J6ET
	uwfL8aMIdEqlbQMt0nm662ATxlpMkYXOOx/yH9CKxOJtVqJJJebGksGRQOBsWm6V2ZvI
	d4130ajHzcCRY/w/Q7BCvZJSIfCgIOlOhRsASe3OC4i/HVbxSqyjMYpwBM7QKFrexG/M
	eqtg==
X-Gm-Message-State: APjAAAVpQlwqDQPuMeOjxQt6tWhDwjljQZl6jHLF3C75UHmEm1FGH0W7
	B3oAm4vsWRiia0HcNdq6XSI5F9RX9lCI0erfoJk=
X-Google-Smtp-Source: APXvYqxw7p4wLg9jijAP3CkcpDk3cnNhQz/TFh99Iq2q2wSvBmO5vxFPvxxkUDexkU2+FtfHiuvyuSiT+DuzcWFXAO8=
X-Received: by 2002:ac2:42d4:: with SMTP id n20mr930966lfl.21.1552955694226;
	Mon, 18 Mar 2019 17:34:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1552699115.git.alistair.francis@wdc.com>
	<CAKmqyKNLrSZPVmSx9pz9Khfz0wKMsOmTkKN7L5rcVkSQcaW9jQ@mail.gmail.com>
In-Reply-To: <CAKmqyKNLrSZPVmSx9pz9Khfz0wKMsOmTkKN7L5rcVkSQcaW9jQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Mar 2019 17:33:38 -0700
Message-ID: <CAKmqyKNOsaUEBTQsqt68201oNyQxpry9x8+D-o_fijcy=VKAjg@mail.gmail.com>
To: "palmer@sifive.com" <palmer@sifive.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
	Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::144
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
X-List-Received-Date: Tue, 19 Mar 2019 00:35:21 -0000

On Fri, Mar 15, 2019 at 6:22 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Fri, Mar 15, 2019 at 6:19 PM Alistair Francis
> <Alistair.Francis@wdc.com> wrote:
> >
> > v3:
> >  - Add a patch to remove some dead code
> >  - Rebase on master
> > v2:
> >  - Add a patch for SiFive U SMP support
> >  - Rebase on master
> >
> > Alistair Francis (3):
> >   riscv: pmp: Log pmp access errors as guest errors
> >   riscv: sifive_u: Allow up to 4 CPUs to be created
> >   target/riscv: Remove unused struct
> >
> > Kito Cheng (1):
> >   RISC-V: linux-user support for RVE ABI
> >
> > Michael Clark (8):
> >   RISC-V: Replace __builtin_popcount with ctpop8 in PLIC
> >   RISC-V: Allow interrupt controllers to claim interrupts
> >   RISC-V: Remove unnecessary disassembler constraints
> >   elf: Add RISC-V PSABI ELF header defines
> >   RISC-V: Change local interrupts from edge to level
> >   RISC-V: Add support for vectored interrupts
> >   RISC-V: Convert trap debugging to trace events
> >   RISC-V: Update load reservation comment in do_interrupt

@Palmer

Any chance this can go in for 4.0? It's just bug fixes that have been
on list for a while. Without this series u-boot SMP won't work in
QEMU, see here:
https://lists.denx.de/pipermail/u-boot/2019-March/360899.html

Alistair

>
> Sorry, this series should be v3 in the title. I won't resend it, just pretend :)
>
> Alistair
>
> >
> >  Makefile.objs               |   1 +
> >  disas/riscv.c               | 138 -----------------------------
> >  hw/riscv/sifive_plic.c      |  19 +++-
> >  hw/riscv/sifive_u.c         |   5 +-
> >  include/elf.h               |  10 +++
> >  linux-user/riscv/cpu_loop.c |  15 +++-
> >  target/riscv/cpu.c          |   6 --
> >  target/riscv/cpu.h          |   6 ++
> >  target/riscv/cpu_helper.c   | 168 +++++++++++++++---------------------
> >  target/riscv/cpu_user.h     |   3 +-
> >  target/riscv/csr.c          |  22 ++---
> >  target/riscv/pmp.c          |  20 +++--
> >  target/riscv/trace-events   |   2 +
> >  13 files changed, 148 insertions(+), 267 deletions(-)
> >  create mode 100644 target/riscv/trace-events
> >
> > --
> > 2.21.0
> >

