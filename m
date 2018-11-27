Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRkcy-000730-9g
	for mharc-qemu-riscv@gnu.org; Tue, 27 Nov 2018 16:10:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37466)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gRkcu-00070m-Ik
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:10:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gRkct-0005pT-8C
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:10:36 -0500
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:36455)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gRkcq-0005kG-Az; Tue, 27 Nov 2018 16:10:32 -0500
Received: by mail-lj1-x241.google.com with SMTP id g11-v6so21416002ljk.3;
	Tue, 27 Nov 2018 13:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mXlP15GYGF49SSW2wX133YZcrwU58JMYZCrWupd0qDU=;
	b=SRontJoB5NU3mBDEVW8eYRhQ0AWS/V7jgXjIXqXZSZAlf9AkBnmIOAeHClD4TvYvnM
	u7VSoum1P0GhVYG4tnaABO6kTO4jlCr6m6PLQdHxm1BnEH2tg5e306PLH8lY2W5Osfrz
	Hvo1LFrQdfHnQepqCUzYtBEIxfVUQ0kNzceNq2DVaE5EiwxcY/pveIki0PIkNx6ksvkY
	0TWy+dUwPF4GdA6vTuOiG+i4y+b3aT9AgQlab3gsuyC9ZD9RSoY6PoJolADXRbRKb2CX
	XljEzSg7srrBmNkL949EsGlO8Sr/AagP/ZImDmChQLUQ1Pssh/ETts5Jyy+0d3NlstkZ
	5ZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mXlP15GYGF49SSW2wX133YZcrwU58JMYZCrWupd0qDU=;
	b=QCZEew4X6vbW607EopbCZjAwtMdbf7sueQax8BVMiCA0zV969V1RZVXagmJRfF0uYf
	BrI2cs2r3moe2HJEB54L9liMsaaBqLNtyegJtT69BhAxnFrppnELxegHxZRkvTbifMg/
	9O41Lhqn5pEmcEy/L3UXzUxAez/i+h1g48rFOBRZOvvB+MgvSPXkdnWDtc7iYof5iPSo
	Q6JPw5gDntKWzaRYt78ntWtJpeQ441EzSOvxd+rhVxqmX/SIRPfdUyC7x5cpod0vbCtC
	z+2juVXNCkUATo+VMU5MojvSbQpCmxEjUW0oZUzpQ/xUgiUvkuHfif/z1dXhXf+3V0gq
	IFmQ==
X-Gm-Message-State: AA+aEWbMMQ4lnRTaCPSL4sUAE48VvBSKh49m2Oisr0pCFq2YvhJ1VDDX
	l+WbzktbLtM1CfK7hrMxQ0u2m/v5zdD5LIlYBos=
X-Google-Smtp-Source: AFSGD/UGZ/7uDaQsloJ2vTSTsWmExitF90ig3lc8JcOMr3dI34HUpEMxvVVMzwx7hQ5PlY5O3XQNMsh3N2fcK1gNu0I=
X-Received: by 2002:a2e:4218:: with SMTP id
	p24-v6mr20895931lja.58.1543353030522; 
	Tue, 27 Nov 2018 13:10:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1543352682.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1543352682.git.alistair.francis@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 27 Nov 2018 13:10:02 -0800
Message-ID: <CAKmqyKMoFoCGdGrEju2fiJRujbdm2Vw4Juke3K3ryFzgPmo-eQ@mail.gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::241
Subject: Re: [Qemu-riscv] [RFC v2 00/24] Add RISC-V TCG backend support
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
X-List-Received-Date: Tue, 27 Nov 2018 21:10:39 -0000

On Tue, Nov 27, 2018 at 1:06 PM Alistair Francis
<Alistair.Francis@wdc.com> wrote:

It looks like the cover was lost, here it is:

This patch set adds RISC-V backend support to QEMU. This is based on
Michael Clark's original work with some patches ontop.

This has been slightly tested and can run other architecture softmmu
code for a number of instructions but eventually QEMU will do something
it shouldn't.

I haven't tested linux user support at all yet. I think Michael had that
working reliably though and hopefully my changes haven't broken it. I'll
test both a lot more before I send a full patchset.

There are still some todos in the code (there is missing instructions
and byte swapping) and I'll have to rebase this ontop of Richard's TCG
work. In the meantime I wanted to try and keep the ball rolling though.

There are two WIP patches at the end of the series that I am not sure
about, so they have been kept seperate from the series for the time
being.

This branch can be found here:
https://github.com/alistair23/qemu/tree/mainline/alistair/tcg-backend-upstream.next

The working version with Michael's orignal patch and work ontop can be
found here:
https://github.com/alistair23/qemu/tree/mainline/alistair/tcg-backend.next

RFC v2:
 - A large number of changes based on Richard's feedback


>
>
> Alistair Francis (24):
>   elf.h: Add the RISCV ELF magic numbers
>   linux-user: Add host dependency for RISC-V 32-bit
>   linux-user: Add host dependency for RISC-V 64-bit
>   exec: Add RISC-V GCC poison macro
>   riscv: Add the tcg-target header file
>   riscv: Add the tcg target registers
>   riscv: tcg-target: Add support for the constraints
>   riscv: tcg-target: Add the immediate encoders
>   riscv: tcg-target: Add the instruction emitters
>   riscv: tcg-target: Add the relocation functions
>   riscv: tcg-target: Add the mov and movi instruction
>   riscv: tcg-target: Add the extract instructions
>   riscv: tcg-target: Add the out load and store instructions
>   riscv: tcg-target: Add branch and jump instructions
>   riscv: tcg-target: Add slowpath load and store instructions
>   riscv: tcg-target: Add direct load and store instructions
>   riscv: tcg-target: Add the out op decoder
>   riscv: tcg-target: Add the prologue generation and register the JIT
>   riscv: tcg-target: Add the target init code
>   tcg: Add RISC-V cpu signal handler
>   dias: Add RISC-V support
>   configure: Add support for building RISC-V host
>   WIP: Add missing instructions
>   WIP: Try to patch longer branches
>
>  accel/tcg/user-exec.c             |   75 ++
>  configure                         |   12 +-
>  disas.c                           |   10 +-
>  include/elf.h                     |   55 +
>  include/exec/poison.h             |    1 +
>  linux-user/host/riscv32/hostdep.h |   11 +
>  linux-user/host/riscv64/hostdep.h |   11 +
>  tcg/riscv/tcg-target.h            |  173 +++
>  tcg/riscv/tcg-target.inc.c        | 1890 +++++++++++++++++++++++++++++
>  9 files changed, 2234 insertions(+), 4 deletions(-)
>  create mode 100644 linux-user/host/riscv32/hostdep.h
>  create mode 100644 linux-user/host/riscv64/hostdep.h
>  create mode 100644 tcg/riscv/tcg-target.h
>  create mode 100644 tcg/riscv/tcg-target.inc.c
>
> --
> 2.19.1
>

