Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgujy-00082M-P4
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jun 2019 13:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54294)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgujs-0007zz-1V
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:32:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgujp-0008C4-Aw
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:32:43 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40711)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgujn-00089p-Kt
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:32:41 -0400
Received: by mail-pf1-f196.google.com with SMTP id p184so3323161pfp.7
 for <qemu-riscv@nongnu.org>; Fri, 28 Jun 2019 10:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=buH5xPczGJYp6K7ZUpL5RiWSZly1UsJzBysvYX/YB1s=;
 b=qZS0/Mz80LVjAcrDUnNt9zd+gRmOogAlP6dZQvcRDOJdeVwPvUXpDsHXj+I9m950cO
 TJe8BCGrKy3RnnS+0mQOLQIZQmTa6TBKKnikaaG8UbEuSPi/7LVpW0A26pdcPLt5U+UP
 STYZ7zeLWuwlgJ4DH/Dx+tk3TDcXt7XyvyjpaXbMitXX8EKO/snHxUo40k5DSODtT06H
 U1DRNbZ4Q8gqPL1mNBrWdoSyr+l70AyDq3aZJPWaOFJWjF8myZCzT6r8GpUU2eTuM/Kl
 kb9kloTIKbU7cxP5v9c2N/bveATXVPbQUb+JkICw5B2uDT6sMl7A2pr472lVCHzgrNlI
 Xi0w==
X-Gm-Message-State: APjAAAUdqvr8C8pnVm7QWdbpsWZkrNT+0ZDArFkWg3djc6+NbnEpGt5S
 2GyK1dooXuFaFahLNWFHYDrnLJpiftcsbw==
X-Google-Smtp-Source: APXvYqxB7tZ8LGao+tL+Ll7YHjIA4V8lMEiHsyJHWOzU/p/ov3yIVKedV7TDvXaml4QghyiAXfFuXA==
X-Received: by 2002:a63:ca07:: with SMTP id n7mr10320542pgi.165.1561743157808; 
 Fri, 28 Jun 2019 10:32:37 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id b8sm7242359pff.20.2019.06.28.10.32.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 10:32:37 -0700 (PDT)
Date: Fri, 28 Jun 2019 10:31:53 -0700
Message-Id: <20190628173227.31925-1-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.196
Subject: [Qemu-riscv] [PULL] RISC-V Patches for the 4.1 Soft Freeze,
 Part 2 v2
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
X-List-Received-Date: Fri, 28 Jun 2019 17:32:48 -0000

merged tag 'mips-queue-jun-21-2019'
The following changes since commit 474f3938d79ab36b9231c9ad3b5a9314c2aeacde:

  Merge remote-tracking branch 'remotes/amarkovic/tags/mips-queue-jun-21-2019' into staging (2019-06-21 15:40:50 +0100)

are available in the Git repository at:

  git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-4.1-sf1-v2

for you to fetch changes up to 56bf43fc565a2fa3e0a618ab45e1c82896d0782a:

  hw/riscv: Load OpenSBI as the default firmware (2019-06-28 10:10:30 -0700)

----------------------------------------------------------------
RISC-V Patches for the 4.1 Soft Freeze, Part 2 v2

This pull request contains a handful of patches that I'd like to target
for the 4.1 soft freeze.  There are a handful of new features:

* The -bios option now works sanely, including both a built-in copy of
  OpenSBI and the ability to load external versions.  Users no longer
  need to figure out how to build their own firmware.
* Support for the 1.11.0, the latest privileged specification.
* Support for reading and writing the PRCI registers.
* Better control over the ISA of the target machine.
* Support for the cpu-topology device tree node.

Additionally, there are a handful of bug fixes including:

* Load reservations are now broken by both store conditional and by
  scheduling, which fixes issues with parallel applications.
* Various fixes to the PMP implementation.
* Fixes to the 32-bit linux-user syscall ABI.
* Various fixes for instruction decodeing.
* A fix to the PCI device tree "bus-range" property.

This boots 32-bit and 64-bit OpenEmbedded.

Changes since v1 [riscv-for-master-4.1-sf1]:

* Contains a fix to the sifive_u OpenSBI integration.

----------------------------------------------------------------
Alistair Francis (14):
      target/riscv: Allow setting ISA extensions via CPU props
      target/riscv: Restructure deprecatd CPUs
      target/riscv: Add the privledge spec version 1.11.0
      target/riscv: Add the mcountinhibit CSR
      target/riscv: Set privledge spec 1.11.0 as default
      qemu-deprecated.texi: Deprecate the RISC-V privledge spec 1.09.1
      target/riscv: Require either I or E base extension
      target/riscv: Remove user version information
      target/riscv: Add support for disabling/enabling Counters
      hw/riscv: Split out the boot functions
      hw/riscv: Add support for loading a firmware
      hw/riscv: Extend the kernel loading support
      roms: Add OpenSBI version 0.3
      hw/riscv: Load OpenSBI as the default firmware

Atish Patra (1):
      riscv: virt: Add cpu-topology DT node.

Bin Meng (3):
      riscv: virt: Correct pci "bus-range" encoding
      riscv: sifive_u: Do not create hard-coded phandles in DT
      riscv: sifive_u: Update the plic hart config to support multicore

Dayeol Lee (1):
      target/riscv: Fix PMP range boundary address bug

Hesham Almatary (6):
      RISC-V: Only Check PMP if MMU translation succeeds
      RISC-V: Raise access fault exceptions on PMP violations
      RISC-V: Check for the effective memory privilege mode during PMP checks
      RISC-V: Check PMP during Page Table Walks
      RISC-V: Fix a PMP bug where it succeeds even if PMP entry is off
      RISC-V: Fix a PMP check with the correct access size

Jim Wilson (1):
      RISC-V: Update syscall list for 32-bit support.

Joel Sing (1):
      RISC-V: Clear load reservations on context switch and SC

Michael Clark (2):
      target/riscv: Implement riscv_cpu_unassigned_access
      disas/riscv: Disassemble reserved compressed encodings as illegal

Nathaniel Graff (1):
      sifive_prci: Read and write PRCI registers

Palmer Dabbelt (3):
      RISC-V: Fix a memory leak when realizing a sifive_e
      RISC-V: Add support for the Zifencei extension
      RISC-V: Add support for the Zicsr extension

Wladimir J. van der Laan (1):
      disas/riscv: Fix `rdinstreth` constraint

 .gitmodules                                    |   3 +
 Makefile                                       |   5 +-
 disas/riscv.c                                  |  65 ++++++++---
 hw/riscv/Makefile.objs                         |   1 +
 hw/riscv/boot.c                                | 154 +++++++++++++++++++++++++
 hw/riscv/sifive_e.c                            |  30 ++---
 hw/riscv/sifive_prci.c                         |  49 ++++++--
 hw/riscv/sifive_u.c                            |  55 +++++----
 hw/riscv/spike.c                               |  21 +---
 hw/riscv/virt.c                                |  84 ++++++--------
 include/hw/riscv/boot.h                        |  32 +++++
 include/hw/riscv/sifive_e.h                    |   2 +
 include/hw/riscv/sifive_prci.h                 |  32 +++++
 linux-user/riscv/syscall_nr.h                  |  15 ++-
 pc-bios/opensbi-riscv32-virt-fw_jump.bin       | Bin 0 -> 28848 bytes
 pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin   | Bin 0 -> 28904 bytes
 pc-bios/opensbi-riscv64-virt-fw_jump.bin       | Bin 0 -> 28904 bytes
 qemu-deprecated.texi                           |  28 +++++
 roms/Makefile                                  |  48 ++++++--
 roms/opensbi                                   |   1 +
 target/riscv/cpu.c                             | 137 ++++++++++++++++------
 target/riscv/cpu.h                             |  33 ++++--
 target/riscv/cpu_bits.h                        |   1 +
 target/riscv/cpu_helper.c                      |  55 ++++++++-
 target/riscv/csr.c                             |  30 ++++-
 target/riscv/insn_trans/trans_privileged.inc.c |   2 +-
 target/riscv/insn_trans/trans_rva.inc.c        |   8 +-
 target/riscv/insn_trans/trans_rvi.inc.c        |   4 +
 target/riscv/pmp.c                             |  17 +--
 target/riscv/pmp.h                             |   2 +-
 target/riscv/translate.c                       |   3 +
 31 files changed, 705 insertions(+), 212 deletions(-)
 create mode 100644 hw/riscv/boot.c
 create mode 100644 include/hw/riscv/boot.h
 create mode 100644 pc-bios/opensbi-riscv32-virt-fw_jump.bin
 create mode 100644 pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
 create mode 100644 pc-bios/opensbi-riscv64-virt-fw_jump.bin
 create mode 160000 roms/opensbi
From Palmer Dabbelt <palmer@sifive.com> # This line is ignored.
From: Palmer Dabbelt <palmer@sifive.com>
Reply-To: 
Subject: 
In-Reply-To: 



