Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gotnL-0004rX-3Q
	for mharc-qemu-riscv@gnu.org; Wed, 30 Jan 2019 12:37:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38452)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gotn6-0004gb-Mz
	for qemu-riscv@nongnu.org; Wed, 30 Jan 2019 12:36:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gotn4-00007C-6J
	for qemu-riscv@nongnu.org; Wed, 30 Jan 2019 12:36:48 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:40330)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gotn3-0008L8-Ue
	for qemu-riscv@nongnu.org; Wed, 30 Jan 2019 12:36:46 -0500
Received: by mail-pf1-x42a.google.com with SMTP id i12so131503pfo.7
	for <qemu-riscv@nongnu.org>; Wed, 30 Jan 2019 09:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:cc:from:to;
	bh=Ogjb3WoVfjFHAc1lMhw1Z69lybA8Fd0Z21xJ9dOEL9M=;
	b=C1GiUN8BCICDFxv+kp0d2RM7M8rXu4jR0mQ/s6rEs88kEnFSfJU6t1ddAhzuY9JNt1
	dEErra1k5lTzHl0U2QE81ETOoM/PapY7BvfmMEVzGYEwNizPO41mYnrYOhX3hY0ppK2O
	qQWkyq4HpDsNArPcixiqKC+3BC+KMRlm+px7IBtpf3TLThnqdBVS2lB9QtY3wn9cZkw2
	Yp4HTM2V5a/YRGC4dZm/WzSfZkknX8YpDNTsGzauTL1i83fplc29+o/x9tYrmSQzduy2
	ZOxYcq2BD/QCzGCVmSQ6YKU/esLO+LPa2rLwKm2f5E8oo/0BrmS5vwvtvJoeWfRKs/Gf
	bhmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:cc:from:to;
	bh=Ogjb3WoVfjFHAc1lMhw1Z69lybA8Fd0Z21xJ9dOEL9M=;
	b=tioGJhJAwylhvkCK21UiThI4rqtW1rWuchWYmhVrQoZDIout8J7GxEVkqV91kTdp+d
	u/OIg/NM9byNdHSFGb4cyrqTaD70G/HQB2WZnwO4DNG2S+Gc9fBUwEHwGvT7MNjm7ZO1
	sTbKicf095MaepTYKF4CFpAJQ2EdSbKMrYEEut+A+5colA3smq5ttGyMmrmRUdaxViqu
	HhsujQ71lvA06iwTv+RYTt9orZ3xk2I47TrbX1bmxBUoyvrmO7Hqx3hp6JYZkJJ0k9c8
	do/4d27AYj6w8OI+8/f/A4HBb3dzgo1W5kxUvnM43jI4QYcUsUA1bRor3yTshqydv2X0
	6BZw==
X-Gm-Message-State: AJcUukfAI4LgV4I4Q4Cw5LPLxLourdgd6E/PXXr+0vfY259I0vIF4ceX
	4b3ajrJHe9CDwL9HsQGiFHV7lxJmmEo=
X-Google-Smtp-Source: ALg8bN5ufdpxIrLEi6BafOQQ3+4sK5+Q4PuxJLn67Y8qk0kRZjyX6UpaGY/I36SpY70W0Ezi4v4xyg==
X-Received: by 2002:a63:5d20:: with SMTP id r32mr28637234pgb.329.1548869774577;
	Wed, 30 Jan 2019 09:36:14 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	w88sm4274593pfk.11.2019.01.30.09.36.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 09:36:13 -0800 (PST)
Date: Wed, 30 Jan 2019 09:35:51 -0800
Message-Id: <20190130173601.3268-1-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
Cc: qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::42a
Subject: [Qemu-riscv] [PR RFC] RISC-V Patches for 3.2, Part 3
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
X-List-Received-Date: Wed, 30 Jan 2019 17:36:50 -0000

The following changes since commit 5385a5988c8a55bebdc878c05b96648579b5d6e0:

  hw/virtio/virtio-balloon: zero-initialize the virtio_balloon_config struct (2019-01-21 17:20:36 +0000)

are available in the Git repository at:

  git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-3.2-part3

for you to fetch changes up to 461ab9de46d085a37b0da6f096aadc4e0dda4d4c:

  target/riscv: fix counter-enable checks in ctr() (2019-01-29 11:33:38 -0800)

----------------------------------------------------------------
RISC-V Patches for 3.2, Part 3

This patch set contains a handful of patches I've collected over the
last few weeks.  There's nothing really fundamental, but I thought it
would be good to send these out now as there are some other patch sets
on the mailing list that are getting ready to go.

As far as the actual patches, there's:

* A set that cleans up our FS dirty-mode handling.
* Support for writing MISA.
* The removal of Michael as a maintainer.
* A fix to {m,s}counteren handling.

This passes my standard "boots Fedora" test case.

----------------------------------------------------------------
Alistair Francis (1):
      RISC-V: Add priv_ver to DisasContext

Michael Clark (5):
      RISC-V: Implement mstatus.TSR/TW/TVM
      RISC-V: Use riscv prefix consistently on cpu helpers
      RISC-V: Add misa to DisasContext
      RISC-V: Add misa.MAFD checks to translate
      RISC-V: Add misa runtime write support

Palmer Dabbelt (1):
      MAINTAINERS: Remove Michael Clark as a RISC-V Maintainer

Richard Henderson (2):
      RISC-V: Split out mstatus_fs from tb_flags
      RISC-V: Mark mstatus.fs dirty

Xi Wang (1):
      target/riscv: fix counter-enable checks in ctr()

 MAINTAINERS               |   1 -
 linux-user/riscv/signal.c |   4 +-
 target/riscv/cpu.c        |   2 +-
 target/riscv/cpu.h        |  31 ++---
 target/riscv/cpu_bits.h   |  11 ++
 target/riscv/cpu_helper.c |  10 +-
 target/riscv/csr.c        | 103 ++++++++++++----
 target/riscv/fpu_helper.c |   6 +-
 target/riscv/op_helper.c  |  47 +++++---
 target/riscv/translate.c  | 290 +++++++++++++++++++++++++++++++++++++++-------
 10 files changed, 396 insertions(+), 109 deletions(-)


