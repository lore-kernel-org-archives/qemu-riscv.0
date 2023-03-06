Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZIwX-0006Mw-2t
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 17:04:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwV-0006GT-NL
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 17:04:27 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwT-0006nj-Dn
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 17:04:27 -0500
Received: by mail-pl1-x62c.google.com with SMTP id a9so12050085plh.11
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 14:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678140263;
 h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
 :subject:from:to:cc:subject:date:message-id:reply-to;
 bh=14uPfJspXFxhR3+JPnfl/MwVSK2Hq2CRqo5BnAXm5qU=;
 b=oqAAFl0Q7fcCfzwWPWus6SEElvJCbuZKOKTcMROpjpBHqqYQW6tNlHzW4j3roTP34D
 inA9s6mz1vZzm1oeiWB056+xnAh9rkH8ZwhFO3f/+lDsJEgQyeJeZccWNNGXT9dQmH3M
 qz1N5Wa5QHhZAoBZTWJ17tIqLk16a0OgQbgOHlFEWEsuX4ZM4xefrcLDNqMf9PwLL/lS
 wkzwfbemOlTn6MtthZj+0SmBeOu9p8ikcCaASEdZIpPnLPrDXsRwGUxlxM7k7JDFQBUe
 mQy0lypt+TXjVqTEymQpnom/jBZTIcr3hplRlO5vZ+W7WCjikz/WUxFcwV6+XVecjdiX
 +jXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678140263;
 h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
 :subject:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=14uPfJspXFxhR3+JPnfl/MwVSK2Hq2CRqo5BnAXm5qU=;
 b=eN1XbMCoH94ECVJ3vlIc79Oqec0NDnDKLK9CrihHtxAnOG3n7W/tpqX2IwO0qyfUy0
 ageYJ5kn7pImueKmCnpIuzgmfna+OmVHKeE+VtkkrLua2UAB59zROJAo/sy/OTkt62Ja
 tfEXPjXU8fLVk0Er8vSNk7dH1onNYqt6Omdejf+Fx4fAc0z7/flhqEhT6mfUp8GgJMgT
 dOhdEKCDUOc5+PfZ3gNJ063he0ULRyvkmn5mHoYa9UPa2PC4zikuIVPCXPDW5sJ20rB9
 SHBKI82uAOXpfSNYPayFPQyikeD/MeP0aXhyzD2Lr2pHTY807kdwZb6vtmjt1+/udxFZ
 yV9g==
X-Gm-Message-State: AO0yUKVj/uwSATWSdhq/k+uI72Aq7QDl3cafas1Vamf52q4jUawAiTPL
 fHcFxXLJLP8efdoN6EYlJmPm7l0fKc+ry9GiZHg=
X-Google-Smtp-Source: AK7set/qkcLeM5vrXoFrbV5ADeV/8NIxzEjSakfFVO/XC2tsVGPuzXIWnqHqGNyAvsLxlIZNab5CMA==
X-Received: by 2002:a05:6a20:258a:b0:cb:7958:7071 with SMTP id
 k10-20020a056a20258a00b000cb79587071mr14158601pzd.19.1678140263185; 
 Mon, 06 Mar 2023 14:04:23 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 x8-20020aa79188000000b005dc70330d9bsm6735611pfa.26.2023.03.06.14.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 14:04:22 -0800 (PST)
Subject: [PULL 00/22] Sixth RISC-V PR for 8.0
Date: Mon,  6 Mar 2023 14:02:37 -0800
Message-Id: <20230306220259.7748-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Mar 2023 22:04:27 -0000

The following changes since commit 2946e1af2704bf6584f57d4e3aec49d1d5f3ecc0:

  configure: Disable thread-safety warnings on macOS (2023-03-04 14:03:46 +0000)

are available in the Git repository at:

  https://gitlab.com/palmer-dabbelt/qemu.git tags/pull-riscv-to-apply-20230306

for you to fetch changes up to 47fc340010335bc2549bc1f07e5fd85d86a2b9f9:

  MAINTAINERS: Add entry for RISC-V ACPI (2023-03-06 11:35:08 -0800)

----------------------------------------------------------------
Sixth RISC-V PR for 8.0

* Support for the Zicbiom, ZCicboz, and Zicbop extensions.
* OpenSBI has been updated to version 1.2, see
  <https://github.com/riscv-software-src/opensbi/releases/tag/v1.2> for
  the release notes.
* Support for setting the virtual address width (ie, sv39/sv48/sv57) on
  the command line.
* Support for ACPI on RISC-V.

----------------------------------------------------------------
Sorry for the flurry of late pull requests, but we had a few stragglers
(ACPI due to reviews and OpenSBI due to the CI failures, the others I'd
largely just missed).  I don't intend on sending anything else for the
soft freeze, this is already well past late enough for me ;)

I'm not exactly sure what happened, but this tag managed to pass CI
<https://gitlab.com/palmer-dabbelt/qemu/-/pipelines/797833683> despite
me not really doing anything to fix the timeouts -- hopefully that was
just a result of me having gotten unlucky or missing a larger timeout in
my fork, but sorry if I've managed to screw something up.

I have no merge conflicts and the tests are passing locally.  I've got a
CI run here
<https://gitlab.com/palmer-dabbelt/qemu/-/pipelines/797922220>, but I
figured I'd just send this now given that I had one pass from just the
tag.

----------------------------------------------------------------
Alexandre Ghiti (5):
      riscv: Pass Object to register_cpu_props instead of DeviceState
      riscv: Change type of valid_vm_1_10_[32|64] to bool
      riscv: Allow user to set the satp mode
      riscv: Introduce satp mode hw capabilities
      riscv: Correctly set the device-tree entry 'mmu-type'

Anup Patel (1):
      hw/riscv/virt.c: add cbo[mz]-block-size fdt properties

Bin Meng (1):
      roms/opensbi: Upgrade from v1.1 to v1.2

Christoph Muellner (3):
      target/riscv: implement Zicboz extension
      target/riscv: implement Zicbom extension
      target/riscv: add Zicbop cbo.prefetch{i, r, m} placeholder

Ivan Klokov (1):
      disas/riscv Fix ctzw disassemble

Mayuresh Chitale (2):
      target/riscv: cpu: Implement get_arch_id callback
      hw: intc: Use cpu_by_arch_id to fetch CPU state

Palmer Dabbelt (1):
      gitlab/opensbi: Move to docker:stable

Sunil V L (8):
      hw/riscv/virt: Add OEM_ID and OEM_TABLE_ID fields
      hw/riscv/virt: Add a switch to disable ACPI
      hw/riscv/virt: Add memmap pointer to RiscVVirtState
      hw/riscv/virt: Enable basic ACPI infrastructure
      hw/riscv/virt: virt-acpi-build.c: Add RINTC in MADT
      hw/riscv/virt: virt-acpi-build.c: Add RHCT Table
      hw/riscv/virt.c: Initialize the ACPI tables
      MAINTAINERS: Add entry for RISC-V ACPI

 .gitlab-ci.d/opensbi.yml                       |   4 +-
 .gitlab-ci.d/opensbi/Dockerfile                |   1 +
 MAINTAINERS                                    |  18 +-
 disas/riscv.c                                  |   2 +-
 hw/intc/riscv_aclint.c                         |  16 +-
 hw/intc/riscv_aplic.c                          |   4 +-
 hw/intc/riscv_imsic.c                          |   6 +-
 hw/riscv/Kconfig                               |   1 +
 hw/riscv/meson.build                           |   1 +
 hw/riscv/virt-acpi-build.c                     | 416 +++++++++++++++++++++++++
 hw/riscv/virt.c                                |  70 ++++-
 include/hw/riscv/virt.h                        |   6 +
 pc-bios/opensbi-riscv32-generic-fw_dynamic.bin | Bin 117704 -> 123072 bytes
 pc-bios/opensbi-riscv64-generic-fw_dynamic.bin | Bin 115344 -> 121800 bytes
 roms/opensbi                                   |   2 +-
 target/riscv/cpu.c                             | 303 +++++++++++++++++-
 target/riscv/cpu.h                             |  29 ++
 target/riscv/csr.c                             |  29 +-
 target/riscv/helper.h                          |   5 +
 target/riscv/insn32.decode                     |  16 +-
 target/riscv/insn_trans/trans_rvzicbo.c.inc    |  57 ++++
 target/riscv/op_helper.c                       | 135 ++++++++
 target/riscv/translate.c                       |   1 +
 23 files changed, 1061 insertions(+), 61 deletions(-)
 create mode 100644 hw/riscv/virt-acpi-build.c
 create mode 100644 target/riscv/insn_trans/trans_rvzicbo.c.inc


