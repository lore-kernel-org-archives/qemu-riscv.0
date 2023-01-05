Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDTL0-0006uX-La
	for mharc-qemu-riscv@gnu.org; Thu, 05 Jan 2023 11:43:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDTKx-0006r7-33
 for qemu-riscv@nongnu.org; Thu, 05 Jan 2023 11:43:27 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDTKt-0006w8-DE
 for qemu-riscv@nongnu.org; Thu, 05 Jan 2023 11:43:26 -0500
Received: by mail-wm1-x331.google.com with SMTP id ja17so28447456wmb.3
 for <qemu-riscv@nongnu.org>; Thu, 05 Jan 2023 08:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=andOexte/qTAbZAFNvqdK8ze6FjZMbbXg1AFTficNCU=;
 b=nAnw6qgJhq8wku70jVM9IaApWWFFDlQZYqXxbY7RN7xpas6S/MGksQWeGOqXcuXej6
 dXrNL0zkyQwiSGVv8cXH6ctjB0NteeVMf0OCa2sqmaO54YSe9OFn3j9/uN/SlaugzI3L
 lvN8y+53zz2Dg6+Ve00TWR2Cgl9judNjlSxjMiuLnim/8wD3ONyxGprrGKBYXYq71JHD
 /YZZBWVd8xMToRgwt968Sa497PzIfN9rdZuFVu8ZeIj9VgdxK17ne8BcPuGLn0lHMb6E
 vDfhwXQKMkbXP9gtQ+m/GXXFbI8IaCuwpQVNw5v72tAH4jo3j3nOkfrWX/2QEj/auBcV
 J6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=andOexte/qTAbZAFNvqdK8ze6FjZMbbXg1AFTficNCU=;
 b=EHrze1SDjuxnvviaukAT3YnTL4UoGE3VINh17T7z+sbsPLHX4fZQMCOs/cXbox7pDu
 rNX+dd9r1Lct1cWbshrcylHTcPa4s0+TV1r4FnshQ4IgpTsEqucYR7v1SqQ7Rt9jMqCr
 tnbsSbwOjvgaITL8NkdybylPnSw5MkfwJkHLNGLIVEgH/rmUYDmGCihA103WNsytRNRV
 d5F6O71HFNHHW06bBLDH23XgoGBL3senJtcL6B0ypI6Ust5EDNzYoURYkOJr4aIC2RLp
 Q883QVDzwbtaDKXRCl2BlszZYzBkCvHfGAWRox6XBAcWfvBM/6eua1NRBDr9NmsFKWns
 VHag==
X-Gm-Message-State: AFqh2krBdlgoGowIOpnoJcaJn20dZFm9Hf85F9yhILUSFgdW0sKFPZzc
 3g2pkVCsXlZXEwvasBAcOH0QGA==
X-Google-Smtp-Source: AMrXdXtnZ7VEIdFtdZt9Qp+5OjHDbkCcJOTLQpDWiJeO2j1kj6RkG6jkL0YD9EZF1j2xUgFML26PPQ==
X-Received: by 2002:a05:600c:1c85:b0:3d3:4b18:27c6 with SMTP id
 k5-20020a05600c1c8500b003d34b1827c6mr36137319wms.11.1672937001511; 
 Thu, 05 Jan 2023 08:43:21 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 he11-20020a05600c540b00b003d359aa353csm2851006wmb.45.2023.01.05.08.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:43:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5D4E91FFB7;
 Thu,  5 Jan 2023 16:43:20 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	alex.bennee@gmail.com
Cc: David Hildenbrand <david@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Greg Kurz <groug@kaod.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org
Subject: [PATCH v2 00/21] gdbstub: re-organise to for better compilation
 behaviour
Date: Thu,  5 Jan 2023 16:42:59 +0000
Message-Id: <20230105164320.2164095-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 05 Jan 2023 16:43:27 -0000

I was motivated to sort this out while working on my register API
which is target agnostic but ran into the weeds when trying to link up
with the gdbstub. This was due to us building gdbstub for every single
target we support due to a few ABI sensitive bits that require CPU
specific information. This series does a bunch of surgery to break the
monolithic file apart into its constituent parts as well as simplify
the headers to users can avoid bringing in more dependencies than they
need.

While the final result does increase the number of object files we
reduce the total size of them all. We could go even further if we
manage to build just 2 ABI binaries and sort out the magic to link
them in meson. I think this requires us to removing TARGET_LONG_BITS
from cpu-defs.h and exposing it to the build machinery.

Before:

  🕙16:36:31 alex.bennee@hackbox2:qemu.git/builds/reference  on  gdbstub/next [$?⇕] took 2s
  ➜  find . -iname "gdbstub*.o" -exec echo -n -e {}"\0" \; | du -hc --files0-from=- | tail -n 1
  12M     total
  🕙16:36:42 alex.bennee@hackbox2:qemu.git/builds/reference  on  gdbstub/next  [$?⇕]
  ➜  find . -iname "gdbstub*.o" | wc -l
  68

After:

  ➜  find . -iname "gdbstub*.o" -exec echo -n -e {}"\0" \; | du -hc --files0-from=- | tail -n 1
  4.0M    total
  🕙16:41:42 alex.bennee@hackbox2:qemu.git/builds/all  on  gdbstub/next [$?⇕] took 2s
  ➜  find . -iname "gdbstub*.o" | wc -l
  105

The following patches need review:

gdbstub: only compile gdbstub twice for whole build
gdbstub: move syscall handling to new file
gdbstub: move register helpers into standalone include
gdbstub: don't use target_ulong while handling registers
gdbstub: fix address type of gdb_set_cpu_pc
gdbstub: specialise stub_can_reverse
gdbstub: introduce gdb_get_max_cpus
gdbstub: specialise target_memory_rw_debug
gdbstub: specialise handle_query_attached
gdbstub: abstract target specific details from gdb_put_packet_binary
gdbstub: make various helpers visible to the rest of the module
gdbstub: move fromhex/tohex routines to internals
gdbstub: define separate user/system structures
target/arm: fix handling of HLT semihosting in system mode

Alex Bennée (20):
  gdbstub/internals.h: clean up include guard
  target/arm: fix handling of HLT semihosting in system mode
  gdbstub: fix-up copyright and license files
  gdbstub: define separate user/system structures
  gdbstub: move GDBState to shared internals header
  includes: move tb_flush into its own header
  gdbstub: move fromhex/tohex routines to internals
  gdbstub: make various helpers visible to the rest of the module
  gdbstub: move chunk of softmmu functionality to own file
  gdbstub: move chunks of user code into own files
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

Philippe Mathieu-Daudé (1):
  gdbstub: Make syscall_complete/[gs]et_reg target-agnostic typedefs

 gdbstub/internals.h                    |  207 ++-
 include/exec/exec-all.h                |    1 -
 include/exec/gdbstub.h                 |  208 ---
 include/exec/tb-flush.h                |   26 +
 include/gdbstub/helpers.h              |  103 ++
 include/gdbstub/syscalls.h             |  124 ++
 include/gdbstub/user.h                 |   43 +
 linux-user/user-internals.h            |    1 +
 accel/stubs/tcg-stub.c                 |    1 +
 accel/tcg/tb-maint.c                   |    1 +
 accel/tcg/translate-all.c              |    1 +
 cpu.c                                  |    1 +
 gdbstub/gdbstub.c                      | 1654 ++----------------------
 gdbstub/softmmu.c                      |  589 ++++++++-
 gdbstub/syscalls.c                     |  230 ++++
 gdbstub/user-target.c                  |  283 ++++
 gdbstub/user.c                         |  406 +++++-
 hw/ppc/spapr_hcall.c                   |    1 +
 linux-user/exit.c                      |    2 +-
 linux-user/main.c                      |    1 +
 linux-user/signal.c                    |    2 +-
 plugins/core.c                         |    1 +
 plugins/loader.c                       |    2 +-
 semihosting/arm-compat-semi.c          |    1 +
 semihosting/guestfd.c                  |    2 +-
 semihosting/syscalls.c                 |    3 +-
 softmmu/runstate.c                     |    2 +-
 target/alpha/gdbstub.c                 |    2 +-
 target/alpha/sys_helper.c              |    1 +
 target/arm/gdbstub.c                   |    1 +
 target/arm/gdbstub64.c                 |    2 +-
 target/arm/helper-a64.c                |    2 +-
 target/arm/m_helper.c                  |    2 +-
 target/arm/translate.c                 |    2 +-
 target/avr/gdbstub.c                   |    2 +-
 target/cris/gdbstub.c                  |    2 +-
 target/hexagon/gdbstub.c               |    2 +-
 target/hppa/gdbstub.c                  |    2 +-
 target/i386/gdbstub.c                  |    2 +-
 target/i386/whpx/whpx-all.c            |    2 +-
 target/loongarch/gdbstub.c             |    1 +
 target/m68k/gdbstub.c                  |    2 +-
 target/m68k/helper.c                   |    1 +
 target/m68k/m68k-semi.c                |    3 +-
 target/microblaze/gdbstub.c            |    2 +-
 target/mips/gdbstub.c                  |    2 +-
 target/mips/tcg/sysemu/mips-semi.c     |    3 +-
 target/nios2/cpu.c                     |    2 +-
 target/nios2/nios2-semi.c              |    3 +-
 target/openrisc/gdbstub.c              |    2 +-
 target/openrisc/interrupt.c            |    2 +-
 target/openrisc/mmu.c                  |    2 +-
 target/ppc/cpu_init.c                  |    2 +-
 target/ppc/gdbstub.c                   |    1 +
 target/riscv/csr.c                     |    1 +
 target/riscv/gdbstub.c                 |    1 +
 target/rx/gdbstub.c                    |    2 +-
 target/s390x/gdbstub.c                 |    1 +
 target/s390x/helper.c                  |    2 +-
 target/sh4/gdbstub.c                   |    2 +-
 target/sparc/gdbstub.c                 |    2 +-
 target/tricore/gdbstub.c               |    2 +-
 target/xtensa/core-dc232b.c            |    2 +-
 target/xtensa/core-dc233c.c            |    2 +-
 target/xtensa/core-de212.c             |    2 +-
 target/xtensa/core-de233_fpu.c         |    2 +-
 target/xtensa/core-dsp3400.c           |    2 +-
 target/xtensa/core-fsf.c               |    2 +-
 target/xtensa/core-lx106.c             |    2 +-
 target/xtensa/core-sample_controller.c |    2 +-
 target/xtensa/core-test_kc705_be.c     |    2 +-
 target/xtensa/core-test_mmuhifi_c3.c   |    2 +-
 target/xtensa/gdbstub.c                |    2 +-
 target/xtensa/helper.c                 |    2 +-
 MAINTAINERS                            |    1 +
 gdbstub/meson.build                    |   35 +-
 gdbstub/trace-events                   |    4 +-
 77 files changed, 2250 insertions(+), 1775 deletions(-)
 create mode 100644 include/exec/tb-flush.h
 create mode 100644 include/gdbstub/helpers.h
 create mode 100644 include/gdbstub/syscalls.h
 create mode 100644 include/gdbstub/user.h
 create mode 100644 gdbstub/syscalls.c
 create mode 100644 gdbstub/user-target.c

-- 
2.34.1


