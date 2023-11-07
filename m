Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE04DC4167B
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 12:28:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r0L8t-0005PP-IS; Tue, 07 Nov 2023 07:25:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0L8q-0005Hb-F2
 for qemu-riscv@nongnu.org; Tue, 07 Nov 2023 07:25:12 -0500
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0L8Z-0004eP-TK
 for qemu-riscv@nongnu.org; Tue, 07 Nov 2023 07:25:11 -0500
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50930f126b1so6921396e87.3
 for <qemu-riscv@nongnu.org>; Tue, 07 Nov 2023 04:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699359885; x=1699964685; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lq6opU8T8PFx7ZTVJ6rMapkVwbiBhNf+MD9y3Tusqoc=;
 b=hCxY7qm9Xo2XttNsPVLA08mmXt/7WKlQjqIaQNrpGAG4V/K7IRNIau9UcTQXnuzd9U
 eYmnk8slq7t9lgqd5sSZu17KZuZm4YR0ryw+o8MMlDfKowC6yyNxKBP5K2i0xlCnysg1
 mDeoRztmHjJgdVAnZx4mPgkhPDuHBnBs2Y6ryFwA880rYLjwXb++vfTrEtn9S7NUL8So
 6B7Yg0dQpKJL0atAvGZ4NUNPCgxddFb0aAarLoTcLFD2MzaaRuGl8beZQW2BoqoS5oQM
 CrR7jLRASPSn8Sa31jxLqnJoC6+ThQb6veCqsqQ7MDMfRckC5Y/ab/VAkxoo0UJVkDw9
 gHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699359885; x=1699964685;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lq6opU8T8PFx7ZTVJ6rMapkVwbiBhNf+MD9y3Tusqoc=;
 b=vmH2dVvVbzf32D+Bh7o6nAn1NXi/fkSpz4bh34jrydp4SMvvW0eXmlzRxYuC56UXbj
 G/TEeVP6ft4lPgF7nedCL0cx3UD5funCroe7+OVpjZikFB3+LE+oKbbtatehYc6TeZW3
 L1B7N237HHnPdaOzEGx0WgyozP2oqq9746sJTgps3nxeU2RRkXA5Hg4D6CjFMMtAEoGz
 9TZMJUKOqwtigyhSTnH4Fg/stydfa047cq84t96fYDrAygsAIfd8OLM3SCe2TO01LANe
 SLxs4CnJKJWz8HTZrw8l5IihPEngADNenOpsk+spoOQvtKg8lTBiPvfQPDQDzfRiEOAW
 G/2w==
X-Gm-Message-State: AOJu0YyuicpYkNddCGNOWJx1O4Jj+g91XKLJd5L9vJZNIs66lyMYtSEX
 ZKNGdQz8dsqYYxtLwFn49k/Amw==
X-Google-Smtp-Source: AGHT+IHQRTmhrKQSB6dLQq6uCZuMravr2Twfde1HqEidHH1aB+/3ae/ouErFXVhtG1eGn859yaEoCA==
X-Received: by 2002:a05:6512:324a:b0:4fa:5e76:7ad4 with SMTP id
 c10-20020a056512324a00b004fa5e767ad4mr20672697lfr.10.1699359885076; 
 Tue, 07 Nov 2023 04:24:45 -0800 (PST)
Received: from m1x-phil.lan ([176.187.216.69])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c459000b003fefaf299b6sm15683258wmo.38.2023.11.07.04.24.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Nov 2023 04:24:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 00/75] Misc HW/UI patches for 2023-11-07
Date: Tue,  7 Nov 2023 13:24:25 +0100
Message-ID: <20231107122442.58674-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x129.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

The following changes since commit bb541a7068d2eee51a9abbe2dedcdf27298b1872:

  Merge tag 'pull-pa-20231106' of https://gitlab.com/rth7680/qemu into staging (2023-11-07 15:01:17 +0800)

are available in the Git repository at:

  https://github.com/philmd/qemu.git tags/misc-cpus-20231107

for you to fetch changes up to 95a40c44501b5e3b8d1922ea37f30142981b2b34:

  dump: Add close fd on error return to avoid resource leak (2023-11-07 13:08:49 +0100)

Few checkpatch warnings in target/i386/hvf/x86_emu.c are deliberately ignored.

----------------------------------------------------------------
Misc hardware patch queue

HW emulation:
- PMBus fixes and tests (Titus)
- IDE fixes and tests (Fiona)
- New ADM1266 sensor (Titus)
- Better error propagation in PCI-ISA i82378 (Philippe)
- Declare SD model QOM types using DEFINE_TYPES macro (Philippe)

Topology:
- Fix CPUState::nr_cores calculation (Zhuocheng Ding and Zhao Liu)

Monitor:
- Synchronize CPU state in 'info lapic' (Dongli Zhang)

QOM:
- Have 'cpu-qom.h' target-agnostic (Philippe)
- Move ArchCPUClass definition to each target's cpu.h (Philippe)
- Call object_class_is_abstract once in cpu_class_by_name (Philippe)

UI:
- Use correct key names in titles on MacOS / SDL2 (Adrian)

MIPS:
- Fix MSA BZ/BNZ and TX79 LQ/SQ opcodes (Philippe)

Nios2:
- Create IRQs *after* vCPU is realized (Philippe)

PPC:
- Restrict KVM objects to system emulation (Philippe)
- Move target-specific definitions out of 'cpu-qom.h' (Philippe)

S390X:
- Make hw/s390x/css.h and hw/s390x/sclp.h headers target agnostic (Philippe)

X86:
- HVF & KVM cleanups (Philippe)

Various targets:
- Use env_archcpu() to optimize (Philippe)

Misc:
- Few global variable shadowing removed (Philippe)
- Introduce cpu_exec_reset_hold and factor tcg_cpu_reset_hold out (Philippe)
- Remove few more 'softmmu' mentions (Philippe)
- Fix and cleanup in vl.c (Akihiko & Marc-André)
- Resource leak fix in dump (Zongmin Zhou)
- MAINTAINERS updates (Thomas, Daniel)

----------------------------------------------------------------

Adrian Wowk (1):
  ui/sdl2: use correct key names in win title on mac

Akihiko Odaki (1):
  vl: Free machine list

Daniel P. Berrangé (1):
  MAINTAINERS: update libvirt devel mailing list address

Dongli Zhang (1):
  target/i386/monitor: synchronize cpu state for lapic info

Fiona Ebner (2):
  hw/ide: reset: cancel async DMA operation before resetting state
  tests/qtest: ahci-test: add test exposing reset issue with pending
    callback

Marc-André Lureau (1):
  vl: constify default_list

Philippe Mathieu-Daudé (51):
  tests/vm/ubuntu.aarch64: Correct comment about TCG specific delay
  tests/unit/test-seccomp: Remove mentions of softmmu in test names
  accel/tcg: Declare tcg_flush_jmp_cache() in 'exec/tb-flush.h'
  accel: Introduce cpu_exec_reset_hold()
  accel/tcg: Factor tcg_cpu_reset_hold() out
  target: Unify QOM style
  target: Mention 'cpu-qom.h' is target agnostic
  target/arm: Move internal declarations from 'cpu-qom.h' to 'cpu.h'
  target/ppc: Remove CPU_RESOLVING_TYPE from 'cpu-qom.h'
  target/riscv: Remove CPU_RESOLVING_TYPE from 'cpu-qom.h'
  target: Declare FOO_CPU_TYPE_NAME/SUFFIX in 'cpu-qom.h'
  target/hexagon: Declare QOM definitions in 'cpu-qom.h'
  target/loongarch: Declare QOM definitions in 'cpu-qom.h'
  target/nios2: Declare QOM definitions in 'cpu-qom.h'
  target/openrisc: Declare QOM definitions in 'cpu-qom.h'
  target/riscv: Move TYPE_RISCV_CPU_BASE definition to 'cpu.h'
  target/ppc: Use env_archcpu() in helper_book3s_msgsndp()
  target/riscv: Use env_archcpu() in [check_]nanbox()
  target/s390x: Use env_archcpu() in handle_diag_308()
  target/xtensa: Use env_archcpu() in update_c[compare|count]()
  target/i386/hvf: Use x86_cpu in simulate_[rdmsr|wrmsr]()
  target/i386/hvf: Use env_archcpu() in simulate_[rdmsr/wrmsr]()
  target/i386/hvf: Use CPUState typedef
  target/i386/hvf: Rename 'CPUState *cpu' variable as 'cs'
  target/i386/hvf: Rename 'X86CPU *x86_cpu' variable as 'cpu'
  target/i386/kvm: Correct comment in kvm_cpu_realize()
  target/mips: Fix MSA BZ/BNZ opcodes displacement
  target/mips: Fix TX79 LQ/SQ opcodes
  sysemu/kvm: Restrict kvmppc_get_radix_page_info() to ppc targets
  hw/ppc/e500: Restrict ppce500_init_mpic_kvm() to KVM
  target/ppc: Restrict KVM objects to system emulation
  target/ppc: Prohibit target specific KVM prototypes on user emulation
  target/ppc: Define powerpc_pm_insn_t in 'internal.h'
  target/ppc: Move ppc_cpu_class_by_name() declaration to 'cpu.h'
  target/ppc: Move PowerPCCPUClass definition to 'cpu.h'
  target/ppc: Move powerpc_excp_t definition to 'cpu.h'
  target/ppc: Move powerpc_mmu_t definition to 'cpu.h'
  target/ppc: Move powerpc_input_t definition to 'cpu.h'
  hw/s390x/css: Have css_do_sic() take S390CPU instead of CPUS390XState
  hw/s390x/sclp: Have sclp_service_call[_protected]() take S390CPU*
  target/s390x/cpu: Restrict cpu_get_tb_cpu_state() definition to TCG
  target/s390x/cpu: Restrict CPUS390XState declaration to 'cpu.h'
  target/nios2: Create IRQs *after* accelerator vCPU is realized
  target: Move ArchCPUClass definition to 'cpu.h'
  target/alpha: Tidy up alpha_cpu_class_by_name()
  hw/cpu: Call object_class_is_abstract() once in cpu_class_by_name()
  exec/cpu: Have cpu_exec_realize() return a boolean
  hw/cpu: Clean up global variable shadowing
  hw/loader: Clean up global variable shadowing in rom_add_file()
  hw/isa/i82378: Propagate error if PC_SPEAKER device creation failed
  hw/sd: Declare QOM types using DEFINE_TYPES() macro

Thomas Huth (4):
  MAINTAINERS: Add include/hw/timer/tmu012.h to the SH4 R2D section
  MAINTAINERS: Add the CAN documentation file to the CAN section
  MAINTAINERS: Add include/hw/xtensa/mx_pic.h to the XTFPGA machine
    section
  MAINTAINERS: Add more guest-agent related files to the corresponding
    section

Titus Rwantare (8):
  hw/i2c: pmbus add support for block receive
  hw/i2c: pmbus: add vout mode bitfields
  hw/i2c: pmbus: add fan support
  hw/i2c: pmbus: add VCAP register
  hw/sensor: add ADM1266 device model
  tests/qtest: add tests for ADM1266
  hw/i2c: pmbus: immediately clear faults on request
  hw/i2c: pmbus: reset page register for out of range reads

Zhao Liu (3):
  hw/i386: Fix comment style in topology.h
  tests/unit: Rename test-x86-cpuid.c to test-x86-topo.c
  hw/cpu: Update the comments of nr_cores and nr_dies

Zhuocheng Ding (1):
  system/cpus: Fix CPUState.nr_cores' calculation

Zongmin Zhou (1):
  dump: Add close fd on error return to avoid resource leak

 MAINTAINERS                                   |  12 +-
 include/exec/cpu-common.h                     |   3 -
 include/exec/tb-flush.h                       |   2 +
 include/hw/core/cpu.h                         |  20 +-
 include/hw/i2c/pmbus_device.h                 |  17 ++
 include/hw/i386/topology.h                    |  33 +--
 include/hw/loader.h                           |   2 +-
 include/hw/ppc/ppc.h                          |   2 +-
 include/hw/s390x/css.h                        |   2 +-
 include/hw/s390x/sclp.h                       |   5 +-
 include/sysemu/accel-ops.h                    |   1 +
 include/sysemu/kvm.h                          |   1 -
 target/alpha/cpu-qom.h                        |  21 +-
 target/alpha/cpu.h                            |  17 +-
 target/arm/cpu-qom.h                          |  61 +----
 target/arm/cpu.h                              |  49 +++-
 target/arm/internals.h                        |   6 +
 target/avr/cpu-qom.h                          |  20 +-
 target/avr/cpu.h                              |  18 +-
 target/cris/cpu-qom.h                         |  24 +-
 target/cris/cpu.h                             |  20 +-
 target/hexagon/cpu-qom.h                      |  27 ++
 target/hexagon/cpu.h                          |  20 +-
 target/hppa/cpu-qom.h                         |  20 +-
 target/hppa/cpu.h                             |  16 +-
 target/i386/cpu-qom.h                         |  42 +--
 target/i386/cpu.h                             |  43 ++-
 target/i386/hvf/x86_emu.h                     |   4 +-
 target/loongarch/cpu-qom.h                    |  23 ++
 target/loongarch/cpu.h                        |  14 +-
 target/m68k/cpu-qom.h                         |  21 +-
 target/m68k/cpu.h                             |  17 +-
 target/microblaze/cpu-qom.h                   |  20 +-
 target/microblaze/cpu.h                       |  15 +-
 target/mips/cpu-qom.h                         |  23 +-
 target/mips/cpu.h                             |  21 +-
 target/nios2/cpu-qom.h                        |  18 ++
 target/nios2/cpu.h                            |  11 +-
 target/openrisc/cpu-qom.h                     |  21 ++
 target/openrisc/cpu.h                         |  14 +-
 target/ppc/cpu-qom.h                          | 164 +----------
 target/ppc/cpu.h                              | 145 +++++++++-
 target/ppc/internal.h                         |   9 +
 target/ppc/kvm_ppc.h                          |   4 +
 target/riscv/cpu-qom.h                        |  26 +-
 target/riscv/cpu.h                            |  26 +-
 target/riscv/internals.h                      |   8 +-
 target/rx/cpu-qom.h                           |  20 +-
 target/rx/cpu.h                               |  18 +-
 target/s390x/cpu-qom.h                        |  41 +--
 target/s390x/cpu.h                            |  45 +++-
 target/s390x/cpu_models.h                     |   8 +-
 target/sh4/cpu-qom.h                          |  28 +-
 target/sh4/cpu.h                              |  24 +-
 target/sparc/cpu-qom.h                        |  23 +-
 target/sparc/cpu.h                            |  22 +-
 target/tricore/cpu-qom.h                      |  15 +-
 target/tricore/cpu.h                          |  10 +-
 target/xtensa/cpu-qom.h                       |  26 +-
 target/xtensa/cpu.h                           |  24 +-
 target/mips/tcg/msa.decode                    |   4 +-
 target/mips/tcg/tx79.decode                   |   2 +-
 accel/stubs/tcg-stub.c                        |   4 -
 accel/tcg/cputlb.c                            |   1 +
 accel/tcg/tcg-accel-ops.c                     |   9 +
 accel/tcg/translate-all.c                     |   8 -
 accel/tcg/user-exec-stub.c                    |   4 +
 bsd-user/main.c                               |   2 +-
 cpu-common.c                                  |   6 +-
 cpu-target.c                                  |   6 +-
 dump/dump.c                                   |   1 +
 hw/core/cpu-common.c                          |  19 +-
 hw/core/loader.c                              |   4 +-
 hw/i2c/pmbus_device.c                         | 237 +++++++++++++++-
 hw/ide/core.c                                 |  14 +-
 hw/isa/i82378.c                               |   4 +-
 hw/ppc/e500.c                                 |   4 +
 hw/s390x/css.c                                |   3 +-
 hw/s390x/sclp.c                               |   7 +-
 hw/sd/aspeed_sdhci.c                          |  19 +-
 hw/sd/bcm2835_sdhost.c                        |  33 +--
 hw/sd/cadence_sdhci.c                         |  21 +-
 hw/sd/core.c                                  |  19 +-
 hw/sd/npcm7xx_sdhci.c                         |  21 +-
 hw/sd/pl181.c                                 |  35 ++-
 hw/sd/pxa2xx_mmci.c                           |  35 ++-
 hw/sd/sd.c                                    |  37 ++-
 hw/sd/sdhci-pci.c                             |  25 +-
 hw/sd/ssi-sd.c                                |  19 +-
 hw/sensor/adm1266.c                           | 254 ++++++++++++++++++
 linux-user/main.c                             |   2 +-
 plugins/core.c                                |   1 -
 system/cpus.c                                 |   9 +-
 system/vl.c                                   |   5 +-
 target/alpha/cpu.c                            |  10 +-
 target/arm/cpu.c                              |   3 +-
 target/avr/cpu.c                              |   3 +-
 target/cris/cpu.c                             |   3 +-
 target/hexagon/cpu.c                          |   3 +-
 target/i386/cpu.c                             |   9 +-
 target/i386/hvf/hvf.c                         |   4 +-
 target/i386/hvf/x86_emu.c                     | 111 ++++----
 target/i386/kvm/kvm-cpu.c                     |   1 +
 target/i386/monitor.c                         |   5 +
 target/loongarch/cpu.c                        |   3 +-
 target/m68k/cpu.c                             |   3 +-
 target/nios2/cpu.c                            |  16 +-
 target/openrisc/cpu.c                         |   3 +-
 target/ppc/excp_helper.c                      |   2 +-
 target/ppc/kvm-stub.c                         |  19 --
 target/ppc/kvm.c                              |   4 +-
 target/riscv/cpu.c                            |   3 +-
 target/rx/cpu.c                               |   6 +-
 target/s390x/cpu_models.c                     |   2 +-
 target/s390x/diag.c                           |   2 +-
 target/s390x/kvm/kvm.c                        |   6 +-
 target/s390x/tcg/misc_helper.c                |   5 +-
 target/sh4/cpu.c                              |   3 -
 target/tricore/cpu.c                          |   3 +-
 target/xtensa/cpu.c                           |   3 +-
 target/xtensa/op_helper.c                     |   4 +-
 tests/qtest/adm1266-test.c                    | 122 +++++++++
 tests/qtest/ahci-test.c                       |  86 +++++-
 tests/qtest/max34451-test.c                   |  24 ++
 tests/unit/test-seccomp.c                     |  24 +-
 .../{test-x86-cpuid.c => test-x86-topo.c}     |   2 +-
 ui/sdl2.c                                     |   8 +
 hw/arm/Kconfig                                |   1 +
 hw/sensor/Kconfig                             |   5 +
 hw/sensor/meson.build                         |   1 +
 target/ppc/meson.build                        |   2 +-
 tests/qtest/meson.build                       |   1 +
 tests/unit/meson.build                        |   4 +-
 tests/vm/ubuntu.aarch64                       |   2 +-
 134 files changed, 1722 insertions(+), 1085 deletions(-)
 create mode 100644 target/hexagon/cpu-qom.h
 create mode 100644 target/loongarch/cpu-qom.h
 create mode 100644 target/nios2/cpu-qom.h
 create mode 100644 target/openrisc/cpu-qom.h
 create mode 100644 hw/sensor/adm1266.c
 delete mode 100644 target/ppc/kvm-stub.c
 create mode 100644 tests/qtest/adm1266-test.c
 rename tests/unit/{test-x86-cpuid.c => test-x86-topo.c} (99%)

-- 
2.41.0


