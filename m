Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gi1Ci-0008QZ-A0
	for mharc-qemu-riscv@gnu.org; Fri, 11 Jan 2019 13:06:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45586)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gi1Cf-0008Q8-6K
	for qemu-riscv@nongnu.org; Fri, 11 Jan 2019 13:06:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gi1Ce-0002dn-7e
	for qemu-riscv@nongnu.org; Fri, 11 Jan 2019 13:06:45 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:44755)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gi1Ce-0002YH-1A
	for qemu-riscv@nongnu.org; Fri, 11 Jan 2019 13:06:44 -0500
Received: by mail-pg1-x541.google.com with SMTP id t13so6603869pgr.11
	for <qemu-riscv@nongnu.org>; Fri, 11 Jan 2019 10:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:cc:from:to;
	bh=fG9djmS/ffsYGNO1RV6F3zTkHePxcjLtDeb/ipXeY7I=;
	b=l1psY/0mGcezMS30j+siz1amB+Ryn0TEq9TlhYZifqRohxJtgBWNnFa0CI7bBuJ7Ut
	gGf5qHBOcp6Yyf3fBUfFix8FVhhL3gZZuqIK9QnUPKSInWsWDQXFyTKIYwO8WpMkXQtP
	Lt6s+4dBgUuVoGAs5Ffn+NFbxmFIla46We0m4uIuGftZxkRXXVxl7qw+K8AGk0Mj7bVn
	eQzrqUnpqAJKkTKJ5HWH1fSNXllFsuKcHNQI3GJbeuJ7U4lEdIjQfFU0NSHwje/Ma1/e
	DpFkq/Yhvug3FbRQF3A5rkrRsMS2vZdWf2ACeNwItkzTDBhCXKFewp9kqIxsy1mwEU9+
	2vlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:cc:from:to;
	bh=fG9djmS/ffsYGNO1RV6F3zTkHePxcjLtDeb/ipXeY7I=;
	b=hlEH15e5p3u0bIO/Ae9hnrtCb6sCr/jK4moWoEpbTRcOjJvRj828p9DHHUpXzjfNAj
	QyC+c6IILj6u/IhBo/a5BzOqY6gv966mIgQ8pTs7JRFF/oDo8Ef97BvHTvNtvXR5zNdx
	RgAmXgCfsyiApK8Cd5tJeKUIZXKEqfxUIARFocSj7tXU50Fk0FyrjgXP0K+KybMZj29r
	wqwQvjldr1TvJzJ4JgE54zNcLZvjKHBeAEx8wICvuxYWhMx4a5vZLRc0SqjSogvLEqOu
	b3ZD/nScC/ycvi0dWIlIP8JUbH10cM205IFMzZv5DS1LXGKnITX5ghNQ9aROWzJvETnj
	WCcg==
X-Gm-Message-State: AJcUukfOdE7DK7lTbtDk9YYAuEStHS79ngSu6z84vTpB8x5PhTHAfxIF
	/Wb/kkRHus0ho0h78/L4xcT9YeTMGmU=
X-Google-Smtp-Source: ALg8bN6vhEJICefJ69JNXQ0LwLAILmGEZtOk9vrKMGHktJFHKhJ1rGDCgN958DlcxrM9WwZnzxeH5Q==
X-Received: by 2002:a63:f141:: with SMTP id o1mr14433059pgk.134.1547229996217; 
	Fri, 11 Jan 2019 10:06:36 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	m67sm110314962pfm.73.2019.01.11.10.06.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Jan 2019 10:06:35 -0800 (PST)
Date: Fri, 11 Jan 2019 10:06:26 -0800
Message-Id: <20190111180630.6433-1-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-riscv] [PULL] RISC-V Updates for 3.2, Part 2
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
X-List-Received-Date: Fri, 11 Jan 2019 18:06:46 -0000

The following changes since commit 147923b1a901a0370f83a0f4c58ec1baffef22f0:

  Merge remote-tracking branch 'remotes/kraxel/tags/usb-20190108-pull-request' into staging (2019-01-08 16:07:32 +0000)

are available in the Git repository at:

  git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-3.2-part2

for you to fetch changes up to f7cdfa38f37e0985457ac03c3238861144a58b4c:

  default-configs: Enable USB support for RISC-V machines (2019-01-09 17:34:10 -0800)

----------------------------------------------------------------
RISC-V Updates for 3.2, Part 2

This patch set contains a handful of Michael's CSR-related cleanups,
which should allow us to proceed with more outstanding bug fixes that
depend on them.

Additionally, there is a patch that turns on USB.  This works for me
when the kernel has the appropriate drivers (which will soon be in
defconfig) and I pass

    -device usb-ehci
    -drive id=my_usb_disk,file=usbdisk.img,if=none,format=raw
    -device usb-storage,drive=my_usb_disk

to QEMU.

----------------------------------------------------------------
Alistair Francis (1):
      default-configs: Enable USB support for RISC-V machines

Michael Clark (3):
      RISC-V: Implement modular CSR helper interface
      RISC-V: Implement atomic mip/sip CSR updates
      RISC-V: Implement existential predicates for CSRs

 default-configs/riscv32-softmmu.mak |   1 +
 default-configs/riscv64-softmmu.mak |   1 +
 target/riscv/Makefile.objs          |   2 +-
 target/riscv/cpu.c                  |   6 +
 target/riscv/cpu.h                  |  41 +-
 target/riscv/cpu_helper.c           |   7 +-
 target/riscv/csr.c                  | 863 ++++++++++++++++++++++++++++++++++++
 target/riscv/gdbstub.c              |  10 +-
 target/riscv/op_helper.c            | 613 +------------------------
 9 files changed, 935 insertions(+), 609 deletions(-)
 create mode 100644 target/riscv/csr.c


