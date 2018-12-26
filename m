Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gcCqz-0003oG-BL
	for mharc-qemu-riscv@gnu.org; Wed, 26 Dec 2018 12:20:21 -0500
Received: from eggs.gnu.org ([208.118.235.92]:47741)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gcCqw-0003k1-E6
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gcCqs-0007cx-II
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:17 -0500
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:33355)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gcCqs-0007cP-DC
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:14 -0500
Received: by mail-qt1-x82c.google.com with SMTP id l11so17884430qtp.0
	for <qemu-riscv@nongnu.org>; Wed, 26 Dec 2018 09:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:cc:from:to;
	bh=ACO3xZNidVZe/8lJl6dILcNtHXgshs90c10YxGoZDdw=;
	b=DAcouAhApCPvQvSWQFzxWWI85SyAmiLwhKR8Nr49XLwMz/Omf8VdVE/9fY9qlCQ7xO
	jeGR5FpoM1vEVy7QeuZf4Bi/aSh9i1acqf5WSrweGxkOAPMitZ1UaCAQPQ6SoibI0oK4
	OZxnIUKuOUJJP8BlFvTLDwGzrr1L7oaqvr46ZAtlMWcX0HSV81mgbj1hT53CvIMFoK77
	THvtp9OHWYMj4dFgL7C7cWQwtOlVqRGWUXPRT8KUhfAYQBU0P3Ebl1vGec/Ww4Zce3Rw
	9YjJkgS5pdEo/9RUUqHjWqEb6c3dg00qLVTJbVIZfohz5ja1A7OShlPGZQOqzJx64mFg
	bLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:cc:from:to;
	bh=ACO3xZNidVZe/8lJl6dILcNtHXgshs90c10YxGoZDdw=;
	b=aw9r/wuURsx+05PLl1vzC2dOhA4NSo8A1v/bni+rH822y8KKLIq86a9lUF9V3ZE1Mw
	bNmYn4wHcZlYfU9IY6BOYc8bFPpcfG2Io42LvECh7g/KfrBOSG6O1C46Lvq6iw+j6vSf
	gIHG9IiZWRIBZUvcOjGMIfaF3qrxCZ3ATPPiYGEOivt8h0pI90qLYQclxBTUVC+ra8hV
	9B4u7a3T29MUKWTSJa7jdrCuu/oinbtSusE8dPmImjd1SPhT0afqUWpI3QEBsCwhaJrX
	xzh6XjFU2od9xc1Fukj9tZBvYHMEgUEx9v/cZdHVCjBfxAa5bZIk43cRl4rzH83eexLp
	k0LQ==
X-Gm-Message-State: AJcUukef7tQ5BtmEDqGnAVEEgZS4Mgh7Ymf+Qm4/f5UnY41LdNhgAxdn
	RsBQSzSA/2E6Tc1ecuw2XTfhpotxfDM=
X-Google-Smtp-Source: ALg8bN6f0WtdJyz4qXRJXQogEW42po0YF0o0ubOxj9qN0bO35fRL0ceKIOAV7Uenupg0IrIAS+ucuw==
X-Received: by 2002:a0c:b5c8:: with SMTP id o8mr19779328qvf.213.1545844813424; 
	Wed, 26 Dec 2018 09:20:13 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
	by smtp.gmail.com with ESMTPSA id
	46sm15730551qtv.22.2018.12.26.09.20.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Dec 2018 09:20:12 -0800 (PST)
Date: Wed, 26 Dec 2018 09:19:51 -0800
Message-Id: <20181226172005.26990-1-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::82c
Subject: [Qemu-riscv] [PULL] RISC-V Changes for 3.2, Part 1
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
X-List-Received-Date: Wed, 26 Dec 2018 17:20:19 -0000

The following changes since commit b72566a4ffaddbc0c0c1f6f5ee91b42ab13ff429:

  Merge remote-tracking branch 'remotes/vivier2/tags/trivial-patches-pull-request' into staging (2018-12-19 15:31:02 +0000)

are available in the Git repository at:

  git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-3.2-part1

for you to fetch changes up to 7b91ae7d7944056c5e8045342e4039e978e43c82:

  MAINTAINERS: Mark RISC-V as Supported (2018-12-21 07:57:15 -0800)

----------------------------------------------------------------
RISC-V Changes for 3.2, Part 1

This pull request contains the first set of RISC-V patches I'd like to
target for the 3.2 development cycle.  It's really just a collection of
bug fixes with one major new feature: PCIe can now be attached to RISC-V
guests.

This has passed my usual test of booting the latest Linux RC into a
Fedora disk image on the virt machine.

----------------------------------------------------------------
Alistair Francis (4):
      hw/riscv/virt: Increase the number of interrupts
      hw/riscv/virt: Adjust memory layout spacing
      hw/riscv/virt: Connect the gpex PCIe
      riscv: Enable VGA and PCIE_VGA

Anup Patel (3):
      sifive_u: Add clock DT node for GEM ethernet
      sifive_u: Set 'clock-frequency' DT property for SiFive UART
      target/riscv/pmp.c: Fix pmp_decode_napot()

Mao Zhongyi (1):
      riscv/cpu: use device_class_set_parent_realize

Michael Clark (4):
      RISC-V: Add hartid and \n to interrupt logging
      RISC-V: Fix CLINT timecmp low 32-bit writes
      RISC-V: Fix PLIC pending bitfield reads
      RISC-V: Enable second UART on sifive_e and sifive_u

Nathaniel Graff (1):
      sifive_uart: Implement interrupt pending register

Palmer Dabbelt (1):
      MAINTAINERS: Mark RISC-V as Supported

 MAINTAINERS                         |   2 +-
 default-configs/riscv32-softmmu.mak |   8 +-
 default-configs/riscv64-softmmu.mak |   8 +-
 hw/riscv/sifive_clint.c             |   8 +-
 hw/riscv/sifive_e.c                 |   5 +-
 hw/riscv/sifive_plic.c              |   2 +-
 hw/riscv/sifive_u.c                 |  25 +++++-
 hw/riscv/sifive_uart.c              |  24 ++++--
 hw/riscv/virt.c                     | 147 +++++++++++++++++++++++++++++++++---
 include/hw/riscv/sifive_u.h         |   3 +-
 include/hw/riscv/sifive_uart.h      |   3 +
 include/hw/riscv/virt.h             |  15 +++-
 target/riscv/cpu.c                  |   4 +-
 target/riscv/cpu_helper.c           |  18 +++--
 target/riscv/pmp.c                  |   2 +-
 15 files changed, 231 insertions(+), 43 deletions(-)


