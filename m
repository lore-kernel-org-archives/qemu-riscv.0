Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8vkB-0000wj-Vb
	for mharc-qemu-riscv@gnu.org; Mon, 02 Mar 2020 19:49:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44690)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vk6-0000w4-Cv
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vk5-00045r-3K
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:02 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:34190)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j8vk4-00045J-Uo
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:01 -0500
Received: by mail-pf1-x42e.google.com with SMTP id y21so569815pfp.1
 for <qemu-riscv@nongnu.org>; Mon, 02 Mar 2020 16:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=hXvy4ghHCmI2AOaSUkFYWx1NZe3mIB7WOFd3+5BTrq0=;
 b=v8Rfav7JJfplslGmutDpYe5vA5Hagf7kEaLBPbPnFhkgIR3TEufwQM/d1xkTHuPFhr
 i1HEAUyjq1EOv+VaNlugsQRjbABAbIqvVVSiMHHKNGAfPB3lRnBFLIcXmxhDpx5RsU7l
 SaJV3VlhPK1mvW1KusDtd3HX1wSC4r4qrTZTFunBNKtOA0aTc76VsJD69VCBPp1K00eZ
 kHHY0cIIgqnIdQNVRJbtOfLrHnFJeCE6dzWwZ8u9Z5MykWx8heVDhj6av8h+lyWT8bxa
 KcxTBmIkfaZCKg330Sk0XzmcVYS8OMuolchewAxBjewOOG1XRgY6mCUoKoqH+EB1Z8X6
 Vawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=hXvy4ghHCmI2AOaSUkFYWx1NZe3mIB7WOFd3+5BTrq0=;
 b=BOiWMeTBVsvjjgAlb/+TQ8CFuKJyVCUGbc1aQFCaW736mMKk3CH88o7Cek73PJkvpQ
 Hf8o2qcIcyGFYKoSGorEBQppvhpkLHt4rbRVsHWB9hcIVuT6d3Fj0q0U7HRAUfkzbDm4
 Wrvtl6t4EM5IUOv4cssVGComqQ3qvhNi4IIqG1nv5UxxzTTe3qeezhyfhUA/wVYqa2nK
 Jjj1DnQ1t11LVvDgLCI7+Mi6teRHJweiosA4U9Y9fcGgBCyy7bbEXDyNd4dz0hn1kY+I
 i4RNc7l7eQLR7pY4gp7kM5kUJvmzjue0XP8zCKmhpzvwqpFAkKmavp/z9jtFcxpVae2D
 SKMQ==
X-Gm-Message-State: ANhLgQ0bcYiqVSyn6YxrigvsFlbqRD4DRQnxA4kCFN/ovgfS7hgUEvLt
 4IqXITtvfro5ypeVXCivVZotu/kczsG6wQ==
X-Google-Smtp-Source: ADFU+vsY8r3dEgMHJA9VO05T39SXyLZI3Z4FCXwj3vb0xd8G5Mx7QA9S9UjolcxML8FcSFWrKaeqNA==
X-Received: by 2002:a63:384e:: with SMTP id h14mr1497701pgn.295.1583196538019; 
 Mon, 02 Mar 2020 16:48:58 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id q6sm22038928pfh.127.2020.03.02.16.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 16:48:57 -0800 (PST)
Subject: [PULL] RISC-V Patches for the 5.0 Soft Freeze, Part 3
Date: Mon,  2 Mar 2020 16:48:10 -0800
Message-Id: <20200303004848.136788-1-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::42e
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
X-List-Received-Date: Tue, 03 Mar 2020 00:49:03 -0000

The following changes since commit 8b6b68e05b43f976714ca1d2afe01a64e1d82cba:

  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2020-02-27 19:15:15 +0000)

are available in the Git repository at:

  git@github.com:palmer-dabbelt/qemu.git tags/riscv-for-master-5.0-sf3

for you to fetch changes up to 5f3616ccceb5d5c49f99838c78498e581fb42fc5:

  hw/riscv: Provide rdtime callback for TCG in CLINT emulation (2020-02-27 13:46:37 -0800)

----------------------------------------------------------------
RISC-V Patches for the 5.0 Soft Freeze, Part 3

This pull request is almost entirely an implementation of the draft hypervisor
extension.  This extension is still in draft and is expected to have
incompatible changes before being frozen, but we've had good luck managing
other RISC-V draft extensions in QEMU so far.

Additionally, there's a fix to PCI addressing and some improvements to the
M-mode timer.

This boots linux and passes make check for me.

----------------------------------------------------------------
Alistair Francis (35):
      target/riscv: Convert MIP CSR to target_ulong
      target/riscv: Add the Hypervisor extension
      target/riscv: Add the Hypervisor CSRs to CPUState
      target/riscv: Add support for the new execption numbers
      target/riscv: Rename the H irqs to VS irqs
      target/riscv: Add the virtulisation mode
      target/riscv: Add the force HS exception mode
      target/riscv: Fix CSR perm checking for HS mode
      target/riscv: Print priv and virt in disas log
      target/riscv: Dump Hypervisor registers if enabled
      target/riscv: Add Hypervisor CSR access functions
      target/riscv: Add Hypervisor virtual CSRs accesses
      target/riscv: Add Hypervisor machine CSRs accesses
      target/riscv: Add virtual register swapping function
      target/riscv: Set VS bits in mideleg for Hyp extension
      target/riscv: Extend the MIE CSR to support virtulisation
      target/riscv: Extend the SIP CSR to support virtulisation
      target/riscv: Add support for virtual interrupt setting
      target/ricsv: Flush the TLB on virtulisation mode changes
      target/riscv: Generate illegal instruction on WFI when V=1
      target/riscv: Add hypvervisor trap support
      target/riscv: Add Hypervisor trap return support
      target/riscv: Add hfence instructions
      target/riscv: Remove the hret instruction
      target/riscv: Only set TB flags with FP status if enabled
      target/riscv: Disable guest FP support based on virtual status
      target/riscv: Mark both sstatus and msstatus_hs as dirty
      target/riscv: Respect MPRV and SPRV for floating point ops
      target/riscv: Allow specifying MMU stage
      target/riscv: Implement second stage MMU
      target/riscv: Raise the new execptions when 2nd stage translation fails
      target/riscv: Set htval and mtval2 on execptions
      target/riscv: Add support for the 32-bit MSTATUSH CSR
      target/riscv: Add the MSTATUS_MPV_ISSET helper macro
      target/riscv: Allow enabling the Hypervisor extension

Anup Patel (2):
      target/riscv: Emulate TIME CSRs for privileged mode
      hw/riscv: Provide rdtime callback for TCG in CLINT emulation

Bin Meng (1):
      riscv: virt: Allow PCI address 0

 hw/riscv/sifive_clint.c                        |   6 +-
 hw/riscv/sifive_e.c                            |   2 +-
 hw/riscv/sifive_u.c                            |   2 +-
 hw/riscv/spike.c                               |   9 +-
 hw/riscv/virt.c                                |   3 +-
 include/hw/riscv/sifive_clint.h                |   3 +-
 target/riscv/cpu.c                             |  57 ++-
 target/riscv/cpu.h                             |  63 +++-
 target/riscv/cpu_bits.h                        | 111 ++++--
 target/riscv/cpu_helper.c                      | 486 ++++++++++++++++++++++---
 target/riscv/csr.c                             | 455 ++++++++++++++++++++++-
 target/riscv/gdbstub.c                         |  11 +-
 target/riscv/insn32.decode                     |  22 +-
 target/riscv/insn_trans/trans_privileged.inc.c |  45 ++-
 target/riscv/op_helper.c                       |  71 +++-
 target/riscv/translate.c                       |  35 ++
 16 files changed, 1240 insertions(+), 141 deletions(-)


