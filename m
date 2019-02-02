Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gprzX-0007JQ-C9
	for mharc-qemu-riscv@gnu.org; Sat, 02 Feb 2019 04:53:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54983)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gprzU-0006zO-5q
	for qemu-riscv@nongnu.org; Sat, 02 Feb 2019 04:53:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gprq0-0005aE-7m
	for qemu-riscv@nongnu.org; Sat, 02 Feb 2019 04:43:50 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:36296)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gprpz-0005NF-JL
	for qemu-riscv@nongnu.org; Sat, 02 Feb 2019 04:43:47 -0500
Received: by mail-ed1-x52b.google.com with SMTP id f23so7492572edb.3
	for <qemu-riscv@nongnu.org>; Sat, 02 Feb 2019 01:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:cc:from:to;
	bh=Ogjb3WoVfjFHAc1lMhw1Z69lybA8Fd0Z21xJ9dOEL9M=;
	b=j5BmifxgMMp9gl3yXt567VenG1b1iQES9zL1tJzwV52tZVy/qNwLtmQwDyClmsYqi9
	BPyPTz8vAYAIdaqY3GEJE/owCCNBGSnjGbMcEeK64slz8SKLWIVq7YqdMoswZlcq2J7r
	Z6kRVQpVROKoMzw5H1f9xdcO7gUGiL/QPDWp113aex2h2QH9VULdENXUFqlw0qDajV0W
	oMZgg67h2fN4Lf8MKtv09oNYJO5MQ9DzoHvvq8u4ODdONZhyIaQwWk/9DggszjXdjbmo
	8eeLoGFCoPWyQEU1kcC4fYpTok05oPgM/nLDPa6vNgnnMvkBULbqJ/QVig+EdwPV9o3u
	XpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:cc:from:to;
	bh=Ogjb3WoVfjFHAc1lMhw1Z69lybA8Fd0Z21xJ9dOEL9M=;
	b=Pe8YF/o8f9G4dsSistZ+p66K6W3uKMh2EVoo2P2VbDRq2UUtLSOqCCROrVK3wRFfn2
	rvEgrkxbwOoN0Iji3+ngcdOICFSyDwosHB+UVrb7q/plcl95GoM0v33eztlXTw9jfD+y
	OZHAoCdu22GNzr9yskOJhvA+xQKiE6XmXTw8NzYpaEBqSSz1mmFpdiquYYYLuWzzI7dS
	f1CChOXISC1d4+5dc3wyFjJQK/QQvdwidY+4hIbFAsb7+5a7G+HSqtUfNb+tDajCTJiB
	AT9bLi6gC47b/cgq31z18Pd0Rw3CTZxj4oscnGsZxX/oGBvrrmaBeBRRcEf9KwGlrN8c
	QxIA==
X-Gm-Message-State: AJcUukf/zN2AUOgvgZvQ50MvsGZQ3a4+zIDRGKsg4U0F4E1y6D+2HkHC
	xnnBeJCiwrAXnjWf0zy4eMk1rxUBlx9BmQ==
X-Google-Smtp-Source: ALg8bN4fJ40mdLbAdid6IOZH709khWYjO/qfpleseqzj/wLmEbh2vUEyP2l4sj4xFEyb+92rG8ZKdQ==
X-Received: by 2002:a05:6402:511:: with SMTP id
	m17mr43033003edv.33.1549100617488; 
	Sat, 02 Feb 2019 01:43:37 -0800 (PST)
Received: from localhost ([2001:67c:1810:f051:fd32:55e2:f60b:183b])
	by smtp.gmail.com with ESMTPSA id
	g37sm2713511edb.85.2019.02.02.01.43.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Feb 2019 01:43:36 -0800 (PST)
Date: Sat,  2 Feb 2019 01:43:19 -0800
Message-Id: <20190202094329.22874-1-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::52b
Subject: [Qemu-riscv] [PULL] RISC-V Patches for 3.2, Part 3
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
X-List-Received-Date: Sat, 02 Feb 2019 09:53:38 -0000

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


