Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4y6O-0004A6-2d
	for mharc-qemu-riscv@gnu.org; Fri, 15 Mar 2019 21:27:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1h4y6M-00047t-Bs
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 21:27:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1h4y3V-00074Y-IP
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 21:24:10 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:38813)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1h4y3Q-00073a-6J; Fri, 15 Mar 2019 21:24:06 -0400
Received: by mail-lj1-x242.google.com with SMTP id x13so9461121ljj.5;
	Fri, 15 Mar 2019 18:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gYKknCVF9TjR8Cevo9+FxT88c8X+h3FVjsPWJ08l8eo=;
	b=iz0tnbV8nUYQRMfKPfoTAPLACJTZOiF4A1tyQxsW96LQGkoK+WbamuB7OjVdBz24gX
	PzfXXSohALqvf95bMPxM2VbVFOx9YjXDgIOOK1RwenkgjRiidTlv2NX/DLAFReeclmYj
	XE5/TlQ+jUS40pJ9w9EgVaeVY5hRvmKPsGrhuLwvsqoqot9n6LGyjZgbfugA7yvD7Fyj
	11RvUNlIIEyIQyC3dDIiIDobxL26bILHrDAYiMWF8j57Qum9lQ0DUDRp1tfEtDMVgoJ5
	O3C71sEfB1ec6ljO3eGddB1hJ7gqf5hZ5TwwicMHnqem0s9KDYNtxcLKSOSd+16/XIJn
	nItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gYKknCVF9TjR8Cevo9+FxT88c8X+h3FVjsPWJ08l8eo=;
	b=RvldtgHtU8FQhgm0anFTjlpWMtIoAEwZwnLdS+Qhpc/3qv9Bogrzi6mhiEpGO1wNi2
	2Wn6Ea8wkg1VaZ2yqnPHvWpBQaYj1N1pJ/b/bCQ/72AmYKjBqKzA+B8eh18Q+BJOmhbo
	MHA3d1a9ZKDO7OHEvroHPzHSMED46Cez42x+BNqs6u1YX55LRZ5nHlKAW5woV0pC9Ddr
	v3LnRwJJc483Z7hBNci86wjhYEAchwG0P+xYu3Mmztnt1vXjxqBRufz8h+UidjLDOV+R
	l9rE3gVbFnkQqvIDmiV75l1n7+fjkboeOF1V1CRNGJKqN8g2E4GqAM4E7oh8oSUiv9pR
	X0Ug==
X-Gm-Message-State: APjAAAVc0HND5CSyzr7yUuWkYckms1YwPO4o2IUYyl2ug1afLGwf9vNc
	z+y7GaBKDbE1JAV7RhETD5RlufYW9ycdGZ4WuCY=
X-Google-Smtp-Source: APXvYqz7ASkY0PK2LgN6kSLEjYiJgsoWZLc4Z3DzIdpYFsoUxjRj1Pbb9jgdp9AO0XgHkxJrWPGfpRS85kJ4SgDdUuo=
X-Received: by 2002:a2e:6350:: with SMTP id x77mr1721975ljb.191.1552699442568; 
	Fri, 15 Mar 2019 18:24:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1552699115.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1552699115.git.alistair.francis@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Mar 2019 18:22:51 -0700
Message-ID: <CAKmqyKNLrSZPVmSx9pz9Khfz0wKMsOmTkKN7L5rcVkSQcaW9jQ@mail.gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
	"palmer@sifive.com" <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::242
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
X-List-Received-Date: Sat, 16 Mar 2019 01:27:07 -0000

On Fri, Mar 15, 2019 at 6:19 PM Alistair Francis
<Alistair.Francis@wdc.com> wrote:
>
> v3:
>  - Add a patch to remove some dead code
>  - Rebase on master
> v2:
>  - Add a patch for SiFive U SMP support
>  - Rebase on master
>
> Alistair Francis (3):
>   riscv: pmp: Log pmp access errors as guest errors
>   riscv: sifive_u: Allow up to 4 CPUs to be created
>   target/riscv: Remove unused struct
>
> Kito Cheng (1):
>   RISC-V: linux-user support for RVE ABI
>
> Michael Clark (8):
>   RISC-V: Replace __builtin_popcount with ctpop8 in PLIC
>   RISC-V: Allow interrupt controllers to claim interrupts
>   RISC-V: Remove unnecessary disassembler constraints
>   elf: Add RISC-V PSABI ELF header defines
>   RISC-V: Change local interrupts from edge to level
>   RISC-V: Add support for vectored interrupts
>   RISC-V: Convert trap debugging to trace events
>   RISC-V: Update load reservation comment in do_interrupt

Sorry, this series should be v3 in the title. I won't resend it, just pretend :)

Alistair

>
>  Makefile.objs               |   1 +
>  disas/riscv.c               | 138 -----------------------------
>  hw/riscv/sifive_plic.c      |  19 +++-
>  hw/riscv/sifive_u.c         |   5 +-
>  include/elf.h               |  10 +++
>  linux-user/riscv/cpu_loop.c |  15 +++-
>  target/riscv/cpu.c          |   6 --
>  target/riscv/cpu.h          |   6 ++
>  target/riscv/cpu_helper.c   | 168 +++++++++++++++---------------------
>  target/riscv/cpu_user.h     |   3 +-
>  target/riscv/csr.c          |  22 ++---
>  target/riscv/pmp.c          |  20 +++--
>  target/riscv/trace-events   |   2 +
>  13 files changed, 148 insertions(+), 267 deletions(-)
>  create mode 100644 target/riscv/trace-events
>
> --
> 2.21.0
>

