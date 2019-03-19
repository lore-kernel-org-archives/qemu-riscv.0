Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6EUZ-0008AW-Sx
	for mharc-qemu-riscv@gnu.org; Tue, 19 Mar 2019 09:09:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45450)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6EUX-0007xp-Qm
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 09:09:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6EFx-0004Ej-2Z
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:54:14 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:35469)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h6EFw-0004Dp-RI
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:54:13 -0400
Received: by mail-pf1-x42f.google.com with SMTP id j5so13641489pfa.2
	for <qemu-riscv@nongnu.org>; Tue, 19 Mar 2019 05:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:mime-version:content-transfer-encoding:cc
	:from:to; bh=bThKygArB+cWCOFEKvsSZVIYpPB/ir+GcPISw7ru9dQ=;
	b=S/4vrSPYXh0ZoPuPNDYhdxP5fHJqwE2VIwTSQpkAUNKGGY2dQbDml3k/2+jFUGtHk2
	RFGDQiNQzXcpRI006rkARxiufcBK7zo8s8CJFpRuAqKxjb2P8hq4GVJ869uiBifEmh7b
	7Rr8/OUSZ46Um6/ssIa651n5awcK8I/ssWSEb/FkC32qb3i/Zoqf5ukr7SMlzfmNY7yt
	eiu3HJNIAJ5lUminSfRjVBU9gCA3Jvu7orGkRCybzpwip+4tWx3aKXYLM/Quz+//NWsb
	A2ffJ0zwWas1EECqP+nI8tphvwUhHK6giIoBvSAG7GICTcIUCCFJOJFKlWGfN99I6YAo
	AJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=bThKygArB+cWCOFEKvsSZVIYpPB/ir+GcPISw7ru9dQ=;
	b=L3xmXp10pJGtFOpNWmsCHl3T5kIzm3fzc84rmiUCvOXWMwvZSHIQ1JLm4/8uDuTDJq
	F6C0+sm8o45BZzMq+WExjVH9hEn7GQtYDIZuLguRfeMxpoDCaTmFpnL+WCprwli9QXjJ
	sHOMEoXhqjHp8Pn2c8x63eNxiB/1GVKL3xS78WiNw41F6yF53vcJWgKQKLMJQ4g/U09B
	WL8h9r2ODLV+2BN/JB6AZKy27txfmYrLbzUo9MgXC1JXSvvAf6i7/JN6UmCtlYyyR57D
	kB2pM1gJaXQMdG8NFPC53PT9w+nkGiYUYg6LWHRzttgob7qOg6zs2IhXEtY1+YAxTDJp
	9IFg==
X-Gm-Message-State: APjAAAXTVSsBChYXYiryNS4HdvHrogeZcDCLv/RHWXzTIZPkCjMGkr4J
	wHQM7WOa80pFG+l75R6zEbqsojrcXyUqN1L7
X-Google-Smtp-Source: APXvYqwSDtrofOvOgygAoyn9AD4oWqxLmK8g7VFmZ/vyTe5yJVmjzmsLuUy04v9F8aBRshKfz5EECA==
X-Received: by 2002:a63:2a09:: with SMTP id q9mr1708863pgq.397.1553000051404; 
	Tue, 19 Mar 2019 05:54:11 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-1cad-363a-ebbe-dac8-3f4c.dynamic-ip6.hinet.net.
	[2001:b011:7001:1cad:363a:ebbe:dac8:3f4c])
	by smtp.gmail.com with ESMTPSA id
	f2sm26908990pgn.43.2019.03.19.05.54.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Mar 2019 05:54:10 -0700 (PDT)
Date: Tue, 19 Mar 2019 05:47:44 -0700
Message-Id: <20190319124803.13826-1-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::42f
Subject: [Qemu-riscv] [PULL] RISC-V Patches for 4.0-rc0, Part 2
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
X-List-Received-Date: Tue, 19 Mar 2019 13:09:19 -0000

The following changes since commit 86e2fca2d7f163c50b80254e0afdd4e16378b3bb:

  Merge remote-tracking branch 'remotes/dgibson/tags/ppc-for-4.0-20190319' into staging (2019-03-19 10:52:45 +0000)

are available in the Git repository at:

  git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-4.0-rc0-2

for you to fetch changes up to a9ec1c76d57491602b4d3b521f898905825ca848:

  riscv: sifive_u: Correct UART0's IRQ in the device tree (2019-03-19 05:18:42 -0700)

----------------------------------------------------------------
RISC-V Patches for 4.0-rc0, Part 2

This patch set contains three major sources of bug fixes:

* Jim has added support for GDB XML files, as well as fixing access to
  CSRs via the GDB stub.
* Alistair has rebased a large set of fixes from Michael that were still
  in his patch queue.  These fix bugs all over our tree, including:
    * Logging of PMP errors.
    * User ABI cleanups and fixes, most notably on RVE guests.
    * Fixes for interrupt emulation fidelity.
    * Improvements to the emulation fidelity of the sifive_u machine.
* Bin Meng has improved the emulation fidelity of the SiFive UART, which
  now supports both TX and RX interrupts (as well as setting the correct
  interrupt line).

This should clear out the bug fix queue that piled up after the
decodetree conversion.

----------------------------------------------------------------
Alistair Francis (3):
      riscv: pmp: Log pmp access errors as guest errors
      riscv: sifive_u: Allow up to 4 CPUs to be created
      target/riscv: Remove unused struct

Bin Meng (2):
      riscv: sifive_uart: Generate TX interrupt
      riscv: sifive_u: Correct UART0's IRQ in the device tree

Jim Wilson (5):
      RISC-V: Add 32-bit gdb xml files.
      RISC-V: Add 64-bit gdb xml files.
      RISC-V: Fixes to CSR_* register macros.
      RISC-V: Add debug support for accessing CSRs.
      RISC-V: Add hooks to use the gdb xml files.

Kito Cheng (1):
      RISC-V: linux-user support for RVE ABI

Michael Clark (8):
      RISC-V: Replace __builtin_popcount with ctpop8 in PLIC
      RISC-V: Allow interrupt controllers to claim interrupts
      RISC-V: Remove unnecessary disassembler constraints
      elf: Add RISC-V PSABI ELF header defines
      RISC-V: Change local interrupts from edge to level
      RISC-V: Add support for vectored interrupts
      RISC-V: Convert trap debugging to trace events
      RISC-V: Update load reservation comment in do_interrupt

 Makefile.objs               |   1 +
 configure                   |   2 +
 disas/riscv.c               | 138 -----------------
 gdb-xml/riscv-32bit-cpu.xml |  47 ++++++
 gdb-xml/riscv-32bit-csr.xml | 250 +++++++++++++++++++++++++++++++
 gdb-xml/riscv-32bit-fpu.xml |  50 +++++++
 gdb-xml/riscv-64bit-cpu.xml |  47 ++++++
 gdb-xml/riscv-64bit-csr.xml | 250 +++++++++++++++++++++++++++++++
 gdb-xml/riscv-64bit-fpu.xml |  56 +++++++
 hw/riscv/sifive_plic.c      |  19 ++-
 hw/riscv/sifive_u.c         |   7 +-
 hw/riscv/sifive_uart.c      |   4 +-
 include/elf.h               |  10 ++
 linux-user/riscv/cpu_loop.c |  15 +-
 target/riscv/cpu.c          |  15 +-
 target/riscv/cpu.h          |  13 ++
 target/riscv/cpu_bits.h     |  35 ++++-
 target/riscv/cpu_helper.c   | 168 +++++++++------------
 target/riscv/cpu_user.h     |   3 +-
 target/riscv/csr.c          |  54 ++++---
 target/riscv/gdbstub.c      | 350 ++++++++++++++++++++++++++++++++++++++++++--
 target/riscv/pmp.c          |  20 ++-
 target/riscv/trace-events   |   2 +
 23 files changed, 1266 insertions(+), 290 deletions(-)
 create mode 100644 gdb-xml/riscv-32bit-cpu.xml
 create mode 100644 gdb-xml/riscv-32bit-csr.xml
 create mode 100644 gdb-xml/riscv-32bit-fpu.xml
 create mode 100644 gdb-xml/riscv-64bit-cpu.xml
 create mode 100644 gdb-xml/riscv-64bit-csr.xml
 create mode 100644 gdb-xml/riscv-64bit-fpu.xml
 create mode 100644 target/riscv/trace-events


