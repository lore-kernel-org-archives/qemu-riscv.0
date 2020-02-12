Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j1vqN-0001sj-1F
	for mharc-qemu-riscv@gnu.org; Wed, 12 Feb 2020 12:30:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43196)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j1vqK-0001s5-5R
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2020 12:30:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j1vqI-0000F0-R5
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2020 12:30:32 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:38173)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j1vqI-0000ER-JA
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2020 12:30:30 -0500
Received: by mail-pl1-x644.google.com with SMTP id t6so1211970plj.5
 for <qemu-riscv@nongnu.org>; Wed, 12 Feb 2020 09:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=4nc65UwGd7yoi1Os6ktRGrdFxX5zRBNyu0ATl7n0nPI=;
 b=RKGfwmBUd/DXdxlmRFv6i3tBsOqmFqg1ac4ezXC6vzFd70lfS7/WNAdijy7VV9OyzH
 y5HV2QegffJYGsDpmjg3PUs1KWLOZdswbD+tIuZEvQicuPinWSP1jxRcK72Tdf5tJ8Eo
 dIiRLVkSlKuVljn04p7x3m6Hv343Q8bUyNGvnHIRUCkZ5F6xlTzrKiYjcM3LW46QiCvO
 vr5O9qipEjtdLm3u4fclhpgC5M4CoyQn+AYXrY1jwb1VJRtwSSO6ikxmpxchfE1Eiyeg
 i34DYrp4mKX182VPbar0o0gOVL5bChcIBwFm8ebRD6YSKU6Lf2N3wm987Bp1vZ9nQbUn
 KI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=4nc65UwGd7yoi1Os6ktRGrdFxX5zRBNyu0ATl7n0nPI=;
 b=GpLVdbeTV/q4mfYY2az3wuRjSBj0s6buyEnhwExVCBaR8Jo4pUH0aDKd2KVxRPQQvN
 H2zklzjKkmP7onvcm83FSsuMNkWNONfMA66RlqiiF+LOX8FujUlAYu3rNohZZTCJ6VPj
 Q7CzC5xseFcc8fS4fri6cjm1fsB4CPLtw4i5Q7rbbhQRoDjBHqW/U9g9kFCSoWKz1hVR
 JlBPEz9vnWbldZwd+AmC3h/JFr+q10uuJ/tBKxfbdV9UAQrIX7003nL9aKKdnVLjHBLi
 27fYvu+C/wAlpDctbbBxyLkarTVKEMHJZVVndCaVow4IbmU3vwB7oR7/+bMDSLB9YHuD
 1O4w==
X-Gm-Message-State: APjAAAXR41Sundns18dsqo7LRIJBB5BYzoiVpPxDvS7yz9DCDF7dd5mx
 VDGs7hjma+CeEg+4+h2MljnZoA==
X-Google-Smtp-Source: APXvYqy1Nz5BgjS+6JGHow+6egv54/q4RJtsu6sQ7H340aJd6YSF9Nf6nsyWKp13wwLWednVtAHWbw==
X-Received: by 2002:a17:902:8bc3:: with SMTP id
 r3mr24869780plo.220.1581528628804; 
 Wed, 12 Feb 2020 09:30:28 -0800 (PST)
Received: from localhost ([2620:0:1000:fd28:dc94:91b3:e554:4ae7])
 by smtp.gmail.com with ESMTPSA id w18sm1572179pfq.167.2020.02.12.09.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 09:30:28 -0800 (PST)
Subject: [PULL] RISC-V Patches for the 5.0 Soft Freeze, Part 2
Date: Wed, 12 Feb 2020 09:29:16 -0800
Message-Id: <20200212172921.36796-1-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.225.g125e21ebc7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
X-List-Received-Date: Wed, 12 Feb 2020 17:30:33 -0000

The following changes since commit 81a23caf47956778c5a5056ad656d1ef92bf9659:

  Merge remote-tracking branch 'remotes/stefanha/tags/block-pull-request' into staging (2020-02-10 17:08:51 +0000)

are available in the Git repository at:

  git@github.com:palmer-dabbelt/qemu.git tags/riscv-for-master-5.0-sf2

for you to fetch changes up to 9c8fdcece53e05590441785ab22d91a22da36e29:

  MAINTAINERS: Add maintainer entry for Goldfish RTC (2020-02-10 12:01:39 -0800)

----------------------------------------------------------------
RISC-V Patches for the 5.0 Soft Freeze, Part 2

This is a fairly light-weight pull request, but I wanted to send it out to
avoid the Goldfish stuff getting buried as the next PR should contain the H
extension implementation.

As far as this PR goes, it contains:

* The addition of syscon device tree nodes for reboot and poweroff, which
  allows Linux to control QEMU without an additional driver.  The existing
  device was already compatible with the syscon interface.
* A fix to our GDB stub to avoid confusing XLEN and FLEN, specifically useful
  for rv32id-based systems.
* A device emulation for the Goldfish RTC device, a simple memory-mapped RTC.
* The addition of the Goldfish RTC device to the RISC-V virt board.

This passes "make check" and boots buildroot for me.

----------------------------------------------------------------

Peter: I'm sending hw/rtc code because it was suggested that the Goldfish
implementation gets handled via the RISC-V tree as our virt board is the only
user.  I'm happy to do things differently in the future (maybe send
goldfish-specific PRs?) if that's better for you.  Just LMK what makes sense, I
anticipate that this'll be a pretty low traffic device so I'm fine with pretty
much anything.

----------------------------------------------------------------
Anup Patel (4):
      riscv/virt: Add syscon reboot and poweroff DT nodes
      hw: rtc: Add Goldfish RTC device
      riscv: virt: Use Goldfish RTC device
      MAINTAINERS: Add maintainer entry for Goldfish RTC

Keith Packard (1):
      riscv: Separate FPU register size from core register size in gdbstub [v2]

 MAINTAINERS                   |   8 ++
 configure                     |   4 +-
 hw/riscv/Kconfig              |   1 +
 hw/riscv/virt.c               |  42 ++++++-
 hw/rtc/Kconfig                |   3 +
 hw/rtc/Makefile.objs          |   1 +
 hw/rtc/goldfish_rtc.c         | 285 ++++++++++++++++++++++++++++++++++++++++++
 hw/rtc/trace-events           |   4 +
 include/hw/riscv/virt.h       |   2 +
 include/hw/rtc/goldfish_rtc.h |  46 +++++++
 target/riscv/gdbstub.c        |  20 +--
 11 files changed, 401 insertions(+), 15 deletions(-)
 create mode 100644 hw/rtc/goldfish_rtc.c
 create mode 100644 include/hw/rtc/goldfish_rtc.h


