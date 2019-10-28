Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iP7PT-00054J-M1
	for mharc-qemu-riscv@gnu.org; Mon, 28 Oct 2019 11:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34439)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1iP7PP-0004wH-J4
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1iP7PN-0003ha-Rh
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:18 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:35214)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1iP7PN-0003gl-K5
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:17 -0400
Received: by mail-pg1-x530.google.com with SMTP id c8so7173180pgb.2
 for <qemu-riscv@nongnu.org>; Mon, 28 Oct 2019 08:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=FWutZqaKlOMCwD9mfXUehfygMNwllC1f40Q7KkfNmq0=;
 b=UrNpSqopBHkLgITH7t+pnmokMPAlpNAlkmk4xCi/wUjN5DLCdTpTLDXMLbEEXBDzCe
 DtiVf7vV8eKpaFl1J7wKBY5Si9SuH3FiJeqlKv/8fdLODyKVBo+O5aCJzgMti+4g63gO
 klVVAigz5IRV+ue0DZpz0ckf7djx8nAfmggWICKKICyPFK6iYC1lK6GKSIKsQsZgaV7W
 LKMT4fxWKDDXi00TNN53k3jL0y5XncqUTENpThFNzwOSq00qJYRVeV1Y1Xl8tlGhRAFP
 tlutiVBSq3FTM5fH9SeSmVsxgXtFMctcDT7xKA9e05YqNaMkA66UtEH7Eu+T7PRAvdhm
 UZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=FWutZqaKlOMCwD9mfXUehfygMNwllC1f40Q7KkfNmq0=;
 b=Vs3LVlgfvQXl1uaDAAgTPQwn+qTiFVfWVzdbk3tzuytnN9cg3LZYzeB/FCr1GcY4ez
 ZFeK7JXTGcOR7yqVDJb8HAX8e0FTUjHKG/nrqEssIZAKLJrp1T75Wto/ALgnuG2AlS6B
 JaCJprf9vFiNNWXT5Y9qwnjiDiPvKLg9amp+b+OPZmoTKTW8CUfVFDCcC0dVED8rhfIP
 2lBwZO2CNgYyknfv71juGTmbggpq/f6jQgFskIxAr4rui2YBZ+brn4fg2rvcU+qNoe1S
 9NMtpJxOILCIYvGD1raonv/WHJT3u8ecRZ0py7ql5yvQJHYpMKx80v/YEewrilUlb3EM
 7YxA==
X-Gm-Message-State: APjAAAXfyUcnKCpNP/BIS9J1FU5zNJ840MJ5X7NuTCrG1GrcShlpWuem
 EO0M+cs/9Bu1ew7hw3+Q4cDSPQ==
X-Google-Smtp-Source: APXvYqyVhzbKqXK5nqoDzpGDhFer1L4nvkB5E4Pc/LPVWNW33P6mfeztpoMsA9vzof8VB/f3wfWuxw==
X-Received: by 2002:a63:1c4:: with SMTP id 187mr21794646pgb.57.1572278295579; 
 Mon, 28 Oct 2019 08:58:15 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id p7sm11262841pjp.4.2019.10.28.08.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 08:58:14 -0700 (PDT)
Subject: [PULL] RISC-V Patches for the 4.2 Soft Freeze, Part 2
Date: Mon, 28 Oct 2019 08:48:44 -0700
Message-Id: <20191028154902.32491-1-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::530
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
X-List-Received-Date: Mon, 28 Oct 2019 15:58:22 -0000

merged tag 'for_upstream'
Primary key fingerprint: 0270 606B 6F3C DF3D 0B17  0970 C350 3912 AFBE 8E67
     Subkey fingerprint: 5D09 FD08 71C8 F85B 94CA  8A0D 281F 0DB8 D28D 5469
The following changes since commit 9bb73502321d46f4d320fa17aa38201445783fc4:

  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2019-10-28 13:32:40 +0000)

are available in the Git repository at:

  git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-4.2-sf2

for you to fetch changes up to 9667e53573f907d4fcd6accff1c8fe525544b749:

  target/riscv: PMP violation due to wrong size parameter (2019-10-28 08:46:33 -0700)

----------------------------------------------------------------
RISC-V Patches for the 4.2 Soft Freeze, Part 2

This patch set contains a handful of small fixes for RISC-V targets that
I'd like to target for the 4.2 soft freeze.  They include:

* A fix to allow the debugger to access the state of all privilege
  modes, as opposed to just the currently executing one.
* A pair of cleanups to implement cpu_do_transaction_failed.
* Fixes to the device tree.
* The addition of various memory regions to make the sifive_u machine
  more closely match the HiFive Unleashed board.
* Fixes to our GDB interface to allow CSRs to be accessed.
* A fix to a memory leak pointed out by coverity.
* A fix that prevents PMP checks from firing incorrectly.

This passes "make chcek" and boots Open Embedded for me.

----------------------------------------------------------------
Alistair Francis (8):
      riscv/sifive_u: Add L2-LIM cache memory
      riscv/sifive_u: Add QSPI memory region
      riscv/sifive_u: Manually define the machine
      riscv/sifive_u: Add the start-in-flash property
      riscv/virt: Manually define the machine
      riscv/virt: Add the PFlash CFI01 device
      riscv/virt: Jump to pflash if specified
      riscv/boot: Fix possible memory leak

Bin Meng (3):
      riscv: Skip checking CSR privilege level in debugger mode
      riscv: hw: Drop "clock-frequency" property of cpu nodes
      riscv: sifive_u: Add ethernet0 to the aliases node

Dayeol Lee (1):
      target/riscv: PMP violation due to wrong size parameter

Giuseppe Musacchio (1):
      linux-user/riscv: Propagate fault address

Jonathan Behrens (3):
      target/riscv: Tell gdbstub the correct number of CSRs
      target/riscv: Expose "priv" register for GDB for reads
      target/riscv: Make the priv register writable by GDB

Palmer Dabbelt (2):
      RISC-V: Handle bus errors in the page table walker
      RISC-V: Implement cpu_do_transaction_failed

 configure                       |   4 +-
 gdb-xml/riscv-32bit-virtual.xml |  11 ++++
 gdb-xml/riscv-64bit-virtual.xml |  11 ++++
 hw/riscv/Kconfig                |   1 +
 hw/riscv/boot.c                 |  11 ++--
 hw/riscv/sifive_u.c             | 105 ++++++++++++++++++++++++++------
 hw/riscv/spike.c                |   2 -
 hw/riscv/virt.c                 | 129 +++++++++++++++++++++++++++++++++++++---
 include/hw/riscv/sifive_u.h     |  12 +++-
 include/hw/riscv/spike.h        |   4 --
 include/hw/riscv/virt.h         |  14 +++--
 linux-user/riscv/cpu_loop.c     |   3 +-
 target/riscv/cpu.c              |   2 +-
 target/riscv/cpu.h              |   7 ++-
 target/riscv/cpu_helper.c       |  28 ++++++---
 target/riscv/csr.c              |   5 +-
 target/riscv/gdbstub.c          |  36 ++++++++++-
 target/riscv/pmp.c              |  13 +++-
 18 files changed, 334 insertions(+), 64 deletions(-)
 create mode 100644 gdb-xml/riscv-32bit-virtual.xml
 create mode 100644 gdb-xml/riscv-64bit-virtual.xml


