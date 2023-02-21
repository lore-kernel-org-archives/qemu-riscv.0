Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUbV0-0007Gw-8Q
	for mharc-qemu-riscv@gnu.org; Tue, 21 Feb 2023 17:52:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbUv-0007ES-EO
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 17:52:33 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbUs-000438-2z
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 17:52:32 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 m14-20020a7bce0e000000b003e00c739ce4so4064800wmc.5
 for <qemu-riscv@nongnu.org>; Tue, 21 Feb 2023 14:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UkapH1HyOnuaqetgt7KpKr6Iu4KTKCV+EwmiZ712lss=;
 b=bjMm5f014sEJQ1U4QZIQxdRoxR3uyo8a9u345fdUj1zkZN3xY9dvnSplAh+PlZzh3g
 HwwfSaDraTISNMwObympxBVyu/ENyXtAiL85B0RhZ7YkLGz3Q8HWDsYfj385Ufjlpx5j
 +jM0k2NH54SPFy6foJMO27XPMWNFqvYji+YgdQSnjrvg6zmyagEeTFcZBHXEVRa2HMUj
 NeFvt3RFy47kSu0KsE68EgcjfoGJ7Jw4g7B689At1FKt1gzaYvhqD2K2k+H/J6SXj1te
 IhDxy+4nSE/k+t+MZL+FfpNk6sauOesEtqmAyWnCxj8Id992ENevAQxvVOyIitNfgNHV
 cdJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UkapH1HyOnuaqetgt7KpKr6Iu4KTKCV+EwmiZ712lss=;
 b=ex7Ixlcv2/FGNOhUG+P1VP+9wxAqXwZzsadhs9bWaQHsXRqySEGYCNd8QD3JJl61Kz
 HsmqHUqPdoD1rmBXhjS3utQoxtupMOGajMBi2cX59ITchmqJzMGSWpZnUZZBufM/Aav5
 bm2IFowAN2WH7BUL877RnooeBx8s01TSWkvzYrUzWbzbwXmPLsZb3G4pjcX8hfFWPVc5
 A80sBCdxOBAEcm3M3aRvwNfVFnGU8v6anm32RXx461taFbgE9+4PKgp7g7i0Z+PA1+3a
 kDy3GVRYgeagq1Tn67lnyh/T+km3d5YBeXSXghhMECDC+L6Sa7Ih9u2K5XSD56NQtUlq
 dYcw==
X-Gm-Message-State: AO0yUKVeWesbRmQJ/PONyAiJ+O+sy3AacE6+y0OjNLfUkbPjvoBbgkcL
 5cqsNWYGv0xx1xx6vzjUwesoFw==
X-Google-Smtp-Source: AK7set8ccJHd+DQnO2Vdhj2QlV8IBRrWE3q1oAJrYUIIyI3N95/FRsagD9oY6xZT2GfWvEw6NSaeqQ==
X-Received: by 2002:a05:600c:340a:b0:3e7:5142:cf17 with SMTP id
 y10-20020a05600c340a00b003e75142cf17mr3141563wmp.18.1677019948040; 
 Tue, 21 Feb 2023 14:52:28 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a05600c4f4600b003df245cd853sm7625736wmq.44.2023.02.21.14.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 14:52:27 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4771E1FFB7;
 Tue, 21 Feb 2023 22:52:27 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 nicolas.eder@lauterbach.com, Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, mads@ynddal.dk,
 Marek Vasut <marex@denx.de>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, Bin Meng <bin.meng@windriver.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Hildenbrand <david@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v3 00/24] gdbstub: re-organise to for better compilation
 behaviour
Date: Tue, 21 Feb 2023 22:52:03 +0000
Message-Id: <20230221225227.3735319-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 21 Feb 2023 22:52:34 -0000

I was motivated to sort this out while working on my register API
which is target agnostic but ran into the weeds when trying to link up
with the gdbstub. This was due to us building gdbstub for every single
target we support due to a few ABI sensitive bits that require CPU
specific information. This series does a bunch of surgery to break the
monolithic file apart into its constituent parts as well as simplify
the headers to users can avoid bringing in more dependencies than they
need.

I had hoped to go all the way and conditionally compile syscalls only
for the two ABIs (32 and 64 bit) unfortunately I was unable to the
appropriate meson-foo to make that happen.

Other than a minor re-org of the patches and addressing review
comments (see bellow ---) the only new patches are the ones to split
target_ulong into its own header and remove the remaining cpu-def
requirements from syscall handling.

The following patches need review:

gdbstub: split out softmmu/user specifics for syscall handling
include: split target_long definition from cpu-defs
testing: probe gdb for supported architectures ahead of time
gdbstub: only compile gdbstub twice for whole build
gdbstub: rationalise signal mapping in softmmu

Alex Bennée (23):
  gdbstub/internals.h: clean up include guard
  gdbstub: fix-up copyright and license files
  gdbstub: define separate user/system structures
  gdbstub: move GDBState to shared internals header
  includes: move tb_flush into its own header
  gdbstub: move fromhex/tohex routines to internals
  gdbstub: make various helpers visible to the rest of the module
  gdbstub: move chunk of softmmu functionality to own file
  gdbstub: move chunks of user code into own files
  gdbstub: rationalise signal mapping in softmmu
  gdbstub: abstract target specific details from gdb_put_packet_binary
  gdbstub: specialise handle_query_attached
  gdbstub: specialise target_memory_rw_debug
  gdbstub: introduce gdb_get_max_cpus
  gdbstub: specialise stub_can_reverse
  gdbstub: fix address type of gdb_set_cpu_pc
  gdbstub: don't use target_ulong while handling registers
  gdbstub: move register helpers into standalone include
  gdbstub: move syscall handling to new file
  gdbstub: only compile gdbstub twice for whole build
  testing: probe gdb for supported architectures ahead of time
  include: split target_long definition from cpu-defs
  gdbstub: split out softmmu/user specifics for syscall handling

Philippe Mathieu-Daudé (1):
  gdbstub: Make syscall_complete/[gs]et_reg target-agnostic typedefs

 MAINTAINERS                                   |    1 +
 configure                                     |    8 +
 gdbstub/internals.h                           |  214 ++-
 include/exec/cpu-defs.h                       |   19 +-
 include/exec/exec-all.h                       |    1 -
 include/exec/gdbstub.h                        |  208 ---
 include/exec/target_long.h                    |   42 +
 include/exec/tb-flush.h                       |   26 +
 include/gdbstub/helpers.h                     |  103 +
 include/gdbstub/syscalls.h                    |  124 ++
 include/gdbstub/user.h                        |   43 +
 linux-user/user-internals.h                   |    1 +
 accel/stubs/tcg-stub.c                        |    1 +
 accel/tcg/tb-maint.c                          |    1 +
 accel/tcg/translate-all.c                     |    1 +
 cpu.c                                         |    1 +
 gdbstub/gdbstub.c                             | 1654 ++---------------
 gdbstub/softmmu.c                             |  605 +++++-
 gdbstub/syscalls.c                            |  217 +++
 gdbstub/user-target.c                         |  281 +++
 gdbstub/user.c                                |  427 ++++-
 hw/ppc/spapr_hcall.c                          |    1 +
 linux-user/exit.c                             |    2 +-
 linux-user/main.c                             |    1 +
 linux-user/signal.c                           |    2 +-
 plugins/core.c                                |    1 +
 plugins/loader.c                              |    2 +-
 semihosting/arm-compat-semi.c                 |    1 +
 semihosting/guestfd.c                         |    2 +-
 semihosting/syscalls.c                        |    3 +-
 softmmu/runstate.c                            |    2 +-
 target/alpha/gdbstub.c                        |    2 +-
 target/alpha/sys_helper.c                     |    1 +
 target/arm/gdbstub.c                          |    1 +
 target/arm/gdbstub64.c                        |    2 +-
 target/arm/helper-a64.c                       |    2 +-
 target/arm/m_helper.c                         |    1 +
 target/avr/gdbstub.c                          |    2 +-
 target/cris/gdbstub.c                         |    2 +-
 target/hexagon/gdbstub.c                      |    2 +-
 target/hppa/gdbstub.c                         |    2 +-
 target/i386/gdbstub.c                         |    2 +-
 target/i386/whpx/whpx-all.c                   |    2 +-
 target/loongarch/gdbstub.c                    |    1 +
 target/m68k/gdbstub.c                         |    2 +-
 target/m68k/helper.c                          |    1 +
 target/m68k/m68k-semi.c                       |    3 +-
 target/microblaze/gdbstub.c                   |    2 +-
 target/mips/gdbstub.c                         |    2 +-
 target/mips/tcg/sysemu/mips-semi.c            |    3 +-
 target/nios2/cpu.c                            |    2 +-
 target/nios2/nios2-semi.c                     |    3 +-
 target/openrisc/gdbstub.c                     |    2 +-
 target/openrisc/interrupt.c                   |    2 +-
 target/openrisc/mmu.c                         |    2 +-
 target/ppc/cpu_init.c                         |    2 +-
 target/ppc/gdbstub.c                          |    1 +
 target/riscv/csr.c                            |    1 +
 target/riscv/gdbstub.c                        |    1 +
 target/rx/gdbstub.c                           |    2 +-
 target/s390x/gdbstub.c                        |    1 +
 target/s390x/helper.c                         |    2 +-
 target/sh4/gdbstub.c                          |    2 +-
 target/sparc/gdbstub.c                        |    2 +-
 target/tricore/gdbstub.c                      |    2 +-
 target/xtensa/core-dc232b.c                   |    2 +-
 target/xtensa/core-dc233c.c                   |    2 +-
 target/xtensa/core-de212.c                    |    2 +-
 target/xtensa/core-de233_fpu.c                |    2 +-
 target/xtensa/core-dsp3400.c                  |    2 +-
 target/xtensa/core-fsf.c                      |    2 +-
 target/xtensa/core-lx106.c                    |    2 +-
 target/xtensa/core-sample_controller.c        |    2 +-
 target/xtensa/core-test_kc705_be.c            |    2 +-
 target/xtensa/core-test_mmuhifi_c3.c          |    2 +-
 target/xtensa/gdbstub.c                       |    2 +-
 target/xtensa/helper.c                        |    2 +-
 gdbstub/meson.build                           |   33 +-
 gdbstub/trace-events                          |    4 +-
 scripts/probe-gdb-support.sh                  |   36 +
 target/xtensa/import_core.sh                  |    2 +-
 tests/tcg/aarch64/Makefile.target             |    2 +-
 tests/tcg/multiarch/Makefile.target           |    5 +
 .../multiarch/system/Makefile.softmmu-target  |    6 +-
 tests/tcg/s390x/Makefile.target               |    2 +-
 85 files changed, 2375 insertions(+), 1796 deletions(-)
 create mode 100644 include/exec/target_long.h
 create mode 100644 include/exec/tb-flush.h
 create mode 100644 include/gdbstub/helpers.h
 create mode 100644 include/gdbstub/syscalls.h
 create mode 100644 include/gdbstub/user.h
 create mode 100644 gdbstub/syscalls.c
 create mode 100644 gdbstub/user-target.c
 create mode 100755 scripts/probe-gdb-support.sh

-- 
2.39.1


