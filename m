Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtwj8-0002Jq-9x
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 10:45:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56464)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwj4-0002F4-JZ
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:45:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwj0-0006yQ-Oo
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:45:28 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:36667)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtwj0-0006Sn-Eu
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:45:26 -0500
Received: by mail-pg1-x543.google.com with SMTP id r124so1306211pgr.3
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 07:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:cc:from:to;
	bh=qlMhvYAOFI3D6uuQEpyabonaU4eIOLMPfvNOojZcFbo=;
	b=hXme8pvx03c6kxfz3WD/1dlGGbY/6qJPonoY032FBtea3oHBBrhPNn7Hocqm/eM+wU
	Py0Rb7+7E4j8wZJ1EIVKSoOdJ4k2C65Mq9nMedECbXtt74ebsszXzY7K7vS+g8RI5ff+
	c5sJEAlQw2CiP66RZrdVz7P5Ed7aDsIYh4su21+psTpzgZmBjTEjz8Y8SqXhy/pmCERV
	ZNq5z61oAiGqymjk1TyAydwHIMUJr+dyoxHMR7DDdzuK8ORoU7r8yDDBt7nmqCGHLe9B
	1jWMf2/+z71zPGAQrpSFhafBxmk24qaP4Fq88nflakXyMmYs4RWfFtSVVhj/mzFuIAPB
	VLYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:cc:from:to;
	bh=qlMhvYAOFI3D6uuQEpyabonaU4eIOLMPfvNOojZcFbo=;
	b=rMZ6rk6F0oef7IeI7m4CQbyofSyiIcjyUsKUEhaF4+QO6lRWzY91WBIZmsyarpSOnR
	60qNM9ufOU6yfzttj4xuqq1viiGCiVq5LuRyEir4wHpjet/raR1h09/kvC/YDeDd3E5D
	YrIiOK4Q0KvLSOyqgEbSePa7/CcVEzABzvWgUar7PBn9B7Iup/r47y1g5SlR7saHCNWI
	/X1H16MCRFyJAYJcAbx4NXdVpiQwsVSH6VRd87UAD7BaJeMAsxO+hVsdn88kCJopQODa
	sr64ptB6s0hJG4XV36atpJZPiSSRIKqZAPboZsLc+e6KWVBmsCXvRrincaM72iJvwzay
	P6fA==
X-Gm-Message-State: AHQUAuYcCsIpg8i6Nsftn5DK63vobXHqW8bw/3T/uTngOuDKrRT56mWd
	9theGrySK/P3HcCq/ao30nDpfXunoYk=
X-Google-Smtp-Source: AHgI3IY0l3D1kCkcoWE1HtQe84D+7YZjzBPNUa78R7VWxE8mhuCxULrod2xEKeAPS4pVwGaA1cKQQQ==
X-Received: by 2002:a63:e915:: with SMTP id i21mr965199pgh.409.1550072701861; 
	Wed, 13 Feb 2019 07:45:01 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	v11sm26350070pfa.49.2019.02.13.07.45.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 07:45:00 -0800 (PST)
Date: Wed, 13 Feb 2019 07:44:39 -0800
Message-Id: <20190213154450.14749-1-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-riscv] [PULL] RISC-V Patches for the 4.0 Soft Freeze, Part 1
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
X-List-Received-Date: Wed, 13 Feb 2019 15:45:32 -0000

merged tag 'pull-tcg-20190211'
Primary key fingerprint: 7A48 1E78 868B 4DB6 A85A  05C0 64DF 38E8 AF7E 215F
The following changes since commit 22c5f446514a2a4bb0dbe1fea26713da92fc85fa:

  Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20190211' into staging (2019-02-11 17:04:57 +0000)

are available in the Git repository at:

  git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-4.0-sf1

for you to fetch changes up to 40e46e516d90c2dfe8e8de3741c1c65f1b526502:

  riscv: Ensure the kernel start address is correctly cast (2019-02-11 15:56:22 -0800)

----------------------------------------------------------------
RISC-V Patches for the 4.0 Soft Freeze, Part 1

This patch set contains a handful of patches I've collected over the
last few weeks.  There's nothing really fundamental, but I thought it
would be good to send these out now as there are some other patch sets
on the mailing list that are getting ready to go.

As far as the actual patches, there's:

* A set that cleans up our FS dirty-mode handling.
* Support for writing MISA.
* The removal of Michael as a maintainer.
* A fix to {m,s}counteren handling.
* A fix to make sure the kernel's start address is computed correctly on
  32-bit targets.

This makes my "RISC-V Patches for 3.2, Part 3" pull request defunct, as
it contains the same patches but based on a newer master.  As usual,
I've tested this using a Fedora boot on the latest Linux.  This patch
set does not include Bastian's decodetree patches because there were
some merge conflicts and while I've cleaned them up I want to get a
round of review first.

----------------------------------------------------------------
Alistair Francis (2):
      RISC-V: Add priv_ver to DisasContext
      riscv: Ensure the kernel start address is correctly cast

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
 hw/riscv/sifive_e.c       |   2 +-
 hw/riscv/sifive_u.c       |   2 +-
 hw/riscv/spike.c          |   2 +-
 hw/riscv/virt.c           |   2 +-
 linux-user/riscv/signal.c |   4 +-
 target/riscv/cpu.c        |   2 +-
 target/riscv/cpu.h        |  31 ++---
 target/riscv/cpu_bits.h   |  11 ++
 target/riscv/cpu_helper.c |  10 +-
 target/riscv/csr.c        | 103 ++++++++++++----
 target/riscv/fpu_helper.c |   6 +-
 target/riscv/op_helper.c  |  47 +++++---
 target/riscv/translate.c  | 290 +++++++++++++++++++++++++++++++++++++++-------
 14 files changed, 400 insertions(+), 113 deletions(-)


