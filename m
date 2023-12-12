Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DC8C4332F
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 12:34:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rD1xk-0007Uk-Sw; Tue, 12 Dec 2023 07:34:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rD1xi-0007Tr-D4
 for qemu-riscv@nongnu.org; Tue, 12 Dec 2023 07:34:10 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rD1xf-0006ZK-Ib
 for qemu-riscv@nongnu.org; Tue, 12 Dec 2023 07:34:10 -0500
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a22eba5a290so61037166b.3
 for <qemu-riscv@nongnu.org>; Tue, 12 Dec 2023 04:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702384445; x=1702989245; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d9ApWyO7EhxgbNyFRXWeJAkAzhLur71apbGlg0VtMVw=;
 b=Vl/yD+UAG1OVHCq2Of1NIibmOR9BtGZhk5BEmC5BQ21iFGX7zi2S4HIRpTdxIFE6bF
 EK5QqIIMrgyRAt/a0x+ZB17zUuofWlrrJruEsbd4bPmNSbxi40YXE+/Fd0vFoT1PMREf
 WCCBnDv/nK0E28lMURTI2OtT9L/yG4hBvkBwLvsoXEAFWySrbSRrAZ0ER5m0xiUvUkCQ
 2K/dlg9Xo2VJfd14IXLe3YjRC5Gya7yJvN7gis59O7j9c8Kg9jGhFBIQfUPMz5JXQNSV
 /s2S5DVpnChwGhMT9qTHmF6RzbBucds8fLrSOou0njgJpsY84JPaSOFHMTcyLjwGhRz5
 xzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702384445; x=1702989245;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d9ApWyO7EhxgbNyFRXWeJAkAzhLur71apbGlg0VtMVw=;
 b=QS0Cr3tWodhuOzEsYOCBfxmrHNTMIbLysw+Mbk4jPHeTcFBU1Km206oFezQ/Tx/JXb
 F1qUIC9nP2psCJ3Tf0cEciYAKvSyQnWr3y2dYbywmLMRe4r6FhiZ54kjjqVBS/pRpSTe
 Zasn4jA2tddJp/w12axuKPGzEXd1Vw/8kiwH04I3+P6Ba7dRsm63Ym7IQVmoWa/s0ruC
 Z4IQUmky1uD70me+dNUixuq//0Rejz90Cuvf6Y09ySghohhRIfFkmT2u1J0/YlzjH+39
 3RyiJmoq8Op3vHdNvnnyCvQaWl298rxCuA+iUX5qF5tlPuZ5eYf25tEVs/A82bY5mCF9
 0QHg==
X-Gm-Message-State: AOJu0YxpMposlqkUl12EmVDol8R0jSeJCXpzoBHxGlp7JA3DhiPw3d59
 HSziJHAkVw9v4ReHA5MlRuuJWw==
X-Google-Smtp-Source: AGHT+IEX3TKxES/s8Fqshp5qZHHYjhMiqh1QW2pIMhu8bEDpGj5/3abCpUKZqgThz7RocA+rCG55WA==
X-Received: by 2002:a17:906:9c47:b0:9e0:5dab:a0f1 with SMTP id
 fg7-20020a1709069c4700b009e05daba0f1mr2377595ejc.36.1702384445562; 
 Tue, 12 Dec 2023 04:34:05 -0800 (PST)
Received: from m1x-phil.lan ([176.176.175.193])
 by smtp.gmail.com with ESMTPSA id
 tq14-20020a170907c50e00b00a1f83646eb6sm4767092ejc.149.2023.12.12.04.34.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Dec 2023 04:34:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, Brian Cain <bcain@quicinc.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 00/23] exec: Rework of various headers (user focused)
Date: Tue, 12 Dec 2023 13:33:36 +0100
Message-ID: <20231212123401.37493-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Hi,

These patches are extracted from a bigger work where
"exec/{exec,cpu,translate}-all.h" are split in various
specific APIs. This helped:
  - differenciate/build:
      . user VS system
      . target-specific VS generic
    which is necessary for heterogeneous build
  - reduced header pressure
  - clarify APIs

This series is focused on user (vs system) cleanups.
More useful changes will come after.

Since v1:
- Addressed Richard comments
- Added R-b tags

Regards,

Phil.

Philippe Mathieu-Daudé (23):
  exec: Include 'cpu.h' before validating CPUArchState placement
  exec: Expose 'target_page.h' API to user emulation
  target: Define TCG_GUEST_DEFAULT_MO in 'cpu-param.h'
  accel: Include missing 'exec/cpu_ldst.h' header
  gdbstub: Include missing 'hw/core/cpu.h' header
  semihosting/uaccess: Avoid including 'cpu.h'
  semihosting/guestfd: Remove unused 'semihosting/uaccess.h' header
  host/load-extract: Include missing 'qemu/atomic.h' and 'qemu/int128.h'
  host/atomic128: Include missing 'qemu/atomic.h' header
  target/i386: Include missing 'exec/exec-all.h' header
  accel/tcg: Include missing 'hw/core/cpu.h' header
  exec/cpu-all: Remove unused 'qemu/thread.h' header
  exec/cpu-all: Reduce 'qemu/rcu.h' header inclusion
  exec/cpu-all: Remove unused tswapls() definitions
  exec: Declare target_words_bigendian() in 'exec/tswap.h'
  exec: Move [b]tswapl() declarations to 'exec/user/tswap-target.h'
  target/ppc/excp_helper: Avoid 'abi_ptr' in system emulation
  accel/tcg: Un-inline retaddr helpers to 'user-retaddr.h'
  exec/user: Do not include 'cpu.h' in 'abitypes.h'
  exec: Declare abi_ptr type in its own 'abi_ptr.h' header
  exec/cpu-all: Restrict inclusion of 'exec/user/guest-base.h'
  exec/cpu-all: Extract page-protection definitions to
    page-prot-common.h
  exec/cpu_ldst: Avoid including 'cpu.h'

 meson.build                                   |  2 +-
 accel/tcg/user-retaddr.h                      | 28 +++++++++
 bsd-user/bsd-mem.h                            |  1 +
 bsd-user/freebsd/target_os_elf.h              |  1 +
 bsd-user/freebsd/target_os_stack.h            |  1 +
 bsd-user/netbsd/target_os_elf.h               |  1 +
 bsd-user/openbsd/target_os_elf.h              |  1 +
 bsd-user/qemu.h                               |  1 +
 host/include/generic/host/atomic128-cas.h     |  2 +
 host/include/generic/host/atomic128-ldst.h    |  2 +
 .../generic/host/load-extract-al16-al8.h      |  3 +
 include/exec/abi_ptr.h                        | 33 +++++++++++
 include/exec/cpu-all.h                        | 59 ++-----------------
 include/exec/cpu_ldst.h                       | 52 ++++------------
 include/exec/exec-all.h                       |  1 +
 include/exec/page-prot-common.h               | 38 ++++++++++++
 include/exec/ram_addr.h                       |  1 +
 include/exec/translator.h                     |  5 +-
 include/exec/tswap.h                          | 12 +++-
 include/exec/user/abitypes.h                  |  8 ++-
 include/exec/user/guest-base.h                |  6 ++
 include/exec/user/tswap-target.h              | 22 +++++++
 include/hw/core/cpu.h                         | 11 ----
 include/semihosting/uaccess.h                 |  3 +-
 target/alpha/cpu-param.h                      |  3 +
 target/alpha/cpu.h                            |  3 -
 target/arm/cpu-param.h                        |  8 ++-
 target/arm/cpu.h                              |  4 +-
 target/avr/cpu-param.h                        |  2 +
 target/avr/cpu.h                              |  2 -
 target/hppa/cpu-param.h                       |  8 +++
 target/hppa/cpu.h                             |  6 --
 target/i386/cpu-param.h                       |  3 +
 target/i386/cpu.h                             |  3 -
 target/loongarch/cpu-param.h                  |  2 +
 target/loongarch/cpu.h                        |  2 -
 target/microblaze/cpu-param.h                 |  3 +
 target/microblaze/cpu.h                       |  3 -
 target/mips/cpu-param.h                       |  2 +
 target/mips/cpu.h                             |  2 -
 target/openrisc/cpu-param.h                   |  2 +
 target/openrisc/cpu.h                         |  2 -
 target/ppc/cpu-param.h                        |  2 +
 target/ppc/cpu.h                              |  2 -
 target/ppc/internal.h                         |  1 +
 target/ppc/mmu-radix64.h                      |  2 +
 target/riscv/cpu-param.h                      |  2 +
 target/riscv/cpu.h                            |  2 -
 target/s390x/cpu-param.h                      |  6 ++
 target/s390x/cpu.h                            |  3 -
 target/sparc/cpu-param.h                      | 23 ++++++++
 target/sparc/cpu.h                            | 23 --------
 target/xtensa/cpu-param.h                     |  3 +
 target/xtensa/cpu.h                           |  3 -
 accel/tcg/cpu-exec.c                          |  3 +
 accel/tcg/cputlb.c                            |  2 +
 accel/tcg/tb-maint.c                          |  1 +
 accel/tcg/tcg-accel-ops.c                     |  2 +
 accel/tcg/translator.c                        |  1 +
 accel/tcg/user-exec.c                         |  2 +
 bsd-user/main.c                               |  1 +
 bsd-user/mmap.c                               |  1 +
 bsd-user/signal.c                             |  2 +
 bsd-user/strace.c                             |  1 +
 cpu-target.c                                  |  2 +
 disas/disas.c                                 |  1 +
 gdbstub/gdbstub.c                             |  1 +
 hw/audio/virtio-snd.c                         |  2 +-
 hw/core/cpu-sysemu.c                          |  2 +-
 hw/core/generic-loader.c                      |  2 +-
 hw/display/vga.c                              |  2 +-
 hw/ppc/ppc440_bamboo.c                        |  1 +
 hw/ppc/sam460ex.c                             |  1 +
 hw/ppc/virtex_ml507.c                         |  1 +
 hw/virtio/virtio.c                            |  1 +
 linux-user/arm/cpu_loop.c                     |  1 +
 linux-user/elfload.c                          |  3 +
 linux-user/i386/signal.c                      |  1 +
 linux-user/main.c                             |  1 +
 linux-user/mmap.c                             |  1 +
 linux-user/nios2/cpu_loop.c                   |  1 +
 linux-user/ppc/signal.c                       |  1 +
 linux-user/signal.c                           |  1 +
 linux-user/syscall.c                          |  1 +
 page-target.c                                 | 43 ++++++++++++++
 semihosting/guestfd.c                         |  5 +-
 system/physmem.c                              | 36 +----------
 target/alpha/helper.c                         |  1 +
 target/arm/ptw.c                              |  1 +
 target/arm/tcg/m_helper.c                     |  1 +
 target/arm/tcg/mte_helper.c                   |  1 +
 target/arm/tcg/sve_helper.c                   |  1 +
 target/avr/helper.c                           |  1 +
 target/cris/mmu.c                             |  1 +
 target/hexagon/translate.c                    |  1 +
 target/hppa/mem_helper.c                      |  1 +
 target/hppa/translate.c                       |  1 +
 target/i386/tcg/fpu_helper.c                  |  1 +
 target/i386/tcg/sysemu/excp_helper.c          |  1 +
 target/loongarch/tlb_helper.c                 |  1 +
 target/m68k/helper.c                          |  1 +
 target/microblaze/cpu.c                       |  1 +
 target/microblaze/helper.c                    |  1 +
 target/microblaze/mmu.c                       |  1 +
 target/microblaze/translate.c                 |  1 +
 target/mips/sysemu/physaddr.c                 |  1 +
 target/mips/tcg/sysemu/tlb_helper.c           |  1 +
 target/nios2/helper.c                         |  1 +
 target/nios2/mmu.c                            |  1 +
 target/nios2/translate.c                      |  1 +
 target/openrisc/mmu.c                         |  1 +
 target/ppc/excp_helper.c                      |  2 +-
 target/ppc/mmu-hash32.c                       |  1 +
 target/ppc/mmu-hash64.c                       |  1 +
 target/ppc/mmu-radix64.c                      |  1 +
 target/ppc/mmu_common.c                       |  1 +
 target/ppc/mmu_helper.c                       |  1 +
 target/riscv/cpu_helper.c                     |  1 +
 target/riscv/pmp.c                            |  1 +
 target/riscv/vector_helper.c                  |  1 +
 target/rx/cpu.c                               |  1 +
 target/s390x/mmu_helper.c                     |  1 +
 target/s390x/tcg/mem_helper.c                 |  1 +
 target/sh4/helper.c                           |  1 +
 target/sparc/ldst_helper.c                    |  1 +
 target/sparc/mmu_helper.c                     |  1 +
 target/tricore/helper.c                       |  1 +
 target/xtensa/mmu_helper.c                    |  1 +
 target/xtensa/op_helper.c                     |  1 +
 129 files changed, 380 insertions(+), 216 deletions(-)
 create mode 100644 accel/tcg/user-retaddr.h
 create mode 100644 include/exec/abi_ptr.h
 create mode 100644 include/exec/page-prot-common.h
 create mode 100644 include/exec/user/tswap-target.h
 create mode 100644 page-target.c

-- 
2.41.0


