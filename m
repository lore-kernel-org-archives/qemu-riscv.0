Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gaNGy-0001FY-5Z
	for mharc-qemu-riscv@gnu.org; Fri, 21 Dec 2018 11:03:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52689)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gaNGw-0001FD-8Q
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:03:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gaNGv-0003xT-GD
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:03:34 -0500
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:39165)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gaNGv-0003wu-Ac
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:03:33 -0500
Received: by mail-qt1-x82e.google.com with SMTP id u47so1596615qtj.6
	for <qemu-riscv@nongnu.org>; Fri, 21 Dec 2018 08:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:cc:from:to;
	bh=ACO3xZNidVZe/8lJl6dILcNtHXgshs90c10YxGoZDdw=;
	b=m6osPkrjRIu6a3iNHn6MtUW1XCASEenefbGAoK8mOG816ItfYf65/lKbj9EF9Q7K3L
	WHUkH1LDGpJzMKqBE7SicS9eLGFEv/KvHVwyTryAmvwgLG7cqeH4VNIUj8tJe/oGHQ9k
	DSiHndLzTw05J7fyyaSHJdwpeKLUFskPZzI0DykuhyBLnzABEFkSpevOVoOZkDIxDnmY
	RknpnmO+RB5LNueETX0uq2CAyWxqeb+mm78mpPLJDc5QvNGRTeOWLZl4InYNyJYK+CBl
	ErmjgwG0AOJBmSl3TMe1sMqgPJzUp/K2XRdIWGeXqHeq4SDe8AjwJQcu7BDIM2kXr2io
	f/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:cc:from:to;
	bh=ACO3xZNidVZe/8lJl6dILcNtHXgshs90c10YxGoZDdw=;
	b=uGLfl2gBNgLLxt2Hz9Ur5D7b3SasFgYOsP1EX9ZoJZQWfvJiZl6/FiCM3H37HvFLbv
	piBxOkbKestTu/k0dsQ/quwU3Zz6lmqPd+frFb6xGTJkrUrRDodYqQaN4W/UZy9KZB7V
	RuR4nVqg1Sl1Cay1C5/335TYd2pRSv+NM+X6IAsEskvzRyRFfcveSukqUUhePCDchSC6
	5cBlFMcaAWO6k4R9jitA1JqzDb+3sdhMJGYYUVN6MbSL/R0dlcmzIj8Nn3eucaIyGIew
	Hfa8dBSi0sXsmf5KLV0exX2k0/Hw3QamlOJZm8cjp2pZnNtvfmwF8bUOhuy4/yxs6JqF
	tPTg==
X-Gm-Message-State: AA+aEWZKlATqORHi+AlIQcweXQmDkfqWB8XgO8B7FyHA8bW8yEpFvxng
	31l+nBxMCueb+pT0ggHGP6dmW7dt9lA=
X-Google-Smtp-Source: ALg8bN6r3Hz+1BmKWUDJGKqDBuQmHQ8GvdtflpBSDPVcX2ztZF0mWYW0rLgpWVeVIanvecT8/jRx4Q==
X-Received: by 2002:ac8:d03:: with SMTP id q3mr2896551qti.387.1545408212517;
	Fri, 21 Dec 2018 08:03:32 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
	by smtp.gmail.com with ESMTPSA id
	k22sm4472666qtm.73.2018.12.21.08.03.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Dec 2018 08:03:31 -0800 (PST)
Date: Fri, 21 Dec 2018 08:02:53 -0800
Message-Id: <20181221160307.14819-1-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
Cc: qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::82e
Subject: [Qemu-riscv] [PR RFC] RISC-V Changes for 3.2, Part 1
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
X-List-Received-Date: Fri, 21 Dec 2018 16:03:35 -0000

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


