Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6ILE-0001r6-52
	for mharc-qemu-riscv@gnu.org; Tue, 19 Mar 2019 13:15:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1h6ILB-0001pP-ED
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 13:15:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1h6ILA-0000NO-8N
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 13:15:53 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:42899)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1h6IL6-0000Gl-Do; Tue, 19 Mar 2019 13:15:48 -0400
Received: by mail-lj1-x242.google.com with SMTP id v22so12310444lje.9;
	Tue, 19 Mar 2019 10:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lFbr9Ht5SpKtqZWoegR7YdKXlQQR++QLkvtX7mXYD6Y=;
	b=hPd7kH9EnMDd4xHKSYQ/yZX8x+8SPY2Fs+gabkSg+laBk3yJ2BjUT9iC7J++lu6gZW
	a/vxk040S5kQ4zKjCtePvDpEMw/DuKYjLzTJWNtOTuPLIQ/mZ6GkYJh966KVF4lS6Gv9
	GPrW3WWzxVw6ALwXNbbjgx28bRLVXs9nbAUT3cnCErTrak0Uva+aAN+JDikIniEtXDqA
	0qy7O6A34u8GWA9vJuf/ZtACq/I284sBlPUc9N+6b3aYObrnx5vn7Hr8/uLuQTWGPldd
	1/q0S2fsCyAt2w/a3Yra5cr5gz918yWiHgt0DdaNgDzd8hvkiXHuPTGt5gqFrZe8Gd5C
	yAtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lFbr9Ht5SpKtqZWoegR7YdKXlQQR++QLkvtX7mXYD6Y=;
	b=HgyHMpBoh0kew7JG1+LKt/M6OKHrFHIoR09cqOwbuwifmRmh/rq+zFc6tjM96fC+IP
	QdIXFJhk7fKalg9NoJiyUE4Jh3n77i2Qi/ZXa5ddMLK6erYlORzakW9WpRAVvlhqfODL
	3FoR868a/XbsjhEDol1+/SpT3N1xTfkRmJtlS80Ccay4HEgo5gGdtYFWPtgeYRhPagnu
	c68W5WzRzvON0BYvGvM0vFlf5VYsO5gLw44tqtonNJfVCbedodBInsSeOCYE69iBJf47
	4uVMTkrqdhlYzvRnEUE/dqsGHf7v9n8kbGR82lOqYCxkC/0zMtuGZXan/dW48Yc8LBqe
	jldw==
X-Gm-Message-State: APjAAAW5p1NfBZCizPny6IS1mGwEgOHKLURyJpq+kyBcX8pvmzdc/kfP
	6Jlnr1uBnDgaxYeP8fW0ekU6CJhZ1y6IdXdlM20=
X-Google-Smtp-Source: APXvYqxK7TaWWBYrM+XDaiQsXyJM/gnWuCSt5WRmqFEjkJwCgoTlolJB1zA0L7Qwnfw7Sq+m1zzSOry3EoJOOHLS0vY=
X-Received: by 2002:a2e:380c:: with SMTP id f12mr2119298lja.116.1553015745990; 
	Tue, 19 Mar 2019 10:15:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmqyKNOsaUEBTQsqt68201oNyQxpry9x8+D-o_fijcy=VKAjg@mail.gmail.com>
	<mhng-e1bd5995-bca4-4656-bd21-6086123a064b@palmer-si-x1c4>
In-Reply-To: <mhng-e1bd5995-bca4-4656-bd21-6086123a064b@palmer-si-x1c4>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Mar 2019 10:14:28 -0700
Message-ID: <CAKmqyKNjOfSuo6-uwESx7d5RyG3icvetcNBXk6REKxDaajKePQ@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>, 
	Alistair Francis <Alistair.Francis@wdc.com>
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
X-List-Received-Date: Tue, 19 Mar 2019 17:15:55 -0000

On Mon, Mar 18, 2019 at 8:41 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Mon, 18 Mar 2019 17:33:38 PDT (-0700), alistair23@gmail.com wrote:
> > On Fri, Mar 15, 2019 at 6:22 PM Alistair Francis <alistair23@gmail.com> wrote:
> >>
> >> On Fri, Mar 15, 2019 at 6:19 PM Alistair Francis
> >> <Alistair.Francis@wdc.com> wrote:
> >> >
> >> > v3:
> >> >  - Add a patch to remove some dead code
> >> >  - Rebase on master
> >> > v2:
> >> >  - Add a patch for SiFive U SMP support
> >> >  - Rebase on master
> >> >
> >> > Alistair Francis (3):
> >> >   riscv: pmp: Log pmp access errors as guest errors
> >> >   riscv: sifive_u: Allow up to 4 CPUs to be created
> >> >   target/riscv: Remove unused struct
> >> >
> >> > Kito Cheng (1):
> >> >   RISC-V: linux-user support for RVE ABI
> >> >
> >> > Michael Clark (8):
> >> >   RISC-V: Replace __builtin_popcount with ctpop8 in PLIC
> >> >   RISC-V: Allow interrupt controllers to claim interrupts
> >> >   RISC-V: Remove unnecessary disassembler constraints
> >> >   elf: Add RISC-V PSABI ELF header defines
> >> >   RISC-V: Change local interrupts from edge to level
> >> >   RISC-V: Add support for vectored interrupts
> >> >   RISC-V: Convert trap debugging to trace events
> >> >   RISC-V: Update load reservation comment in do_interrupt
> >
> > @Palmer
> >
> > Any chance this can go in for 4.0? It's just bug fixes that have been
> > on list for a while. Without this series u-boot SMP won't work in
> > QEMU, see here:
> > https://lists.denx.de/pipermail/u-boot/2019-March/360899.html
>
> That was my plan.  Since they're all bug fixes I was more worried about getting
> everything together on the decodetree front.  I'm hoping to get another PR out
> later this week that collects all the bug fixes we have floating around for
> rc1.

Awesome! Thanks for getting all the patches in.

Alistair

>
> >
> > Alistair
> >
> >>
> >> Sorry, this series should be v3 in the title. I won't resend it, just pretend :)
> >>
> >> Alistair
> >>
> >> >
> >> >  Makefile.objs               |   1 +
> >> >  disas/riscv.c               | 138 -----------------------------
> >> >  hw/riscv/sifive_plic.c      |  19 +++-
> >> >  hw/riscv/sifive_u.c         |   5 +-
> >> >  include/elf.h               |  10 +++
> >> >  linux-user/riscv/cpu_loop.c |  15 +++-
> >> >  target/riscv/cpu.c          |   6 --
> >> >  target/riscv/cpu.h          |   6 ++
> >> >  target/riscv/cpu_helper.c   | 168 +++++++++++++++---------------------
> >> >  target/riscv/cpu_user.h     |   3 +-
> >> >  target/riscv/csr.c          |  22 ++---
> >> >  target/riscv/pmp.c          |  20 +++--
> >> >  target/riscv/trace-events   |   2 +
> >> >  13 files changed, 148 insertions(+), 267 deletions(-)
> >> >  create mode 100644 target/riscv/trace-events
> >> >
> >> > --
> >> > 2.21.0
> >> >

