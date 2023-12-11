Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B7AC4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 21:27:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rCnhN-0000dm-1A; Mon, 11 Dec 2023 16:20:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rCnhK-0000cy-Id
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:20:19 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rCnhE-0005Am-CU
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:20:18 -0500
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a1e116f2072so1021092966b.0
 for <qemu-riscv@nongnu.org>; Mon, 11 Dec 2023 13:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702329610; x=1702934410; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zyD776fcn4JziH1GJLbJJRuMyU18zRNqnHFMyBj+0TA=;
 b=mWI8ru+M8Oo0CAXLDwPF3oAVXxh6SIzYcBHc3WElEVte+6dn7fAK8mj5+wpfvPQuG6
 AkEUeGzCKRekWN6oVN+DsFjipCLIznOtTfY0JqEjXgtlXdm5RSv9jvB2i+CikwAfpsoE
 /pz3jicBhxtMyrm25V3GvCuNpp+heOfGzu9ux3h0Csjjbs7G6pQdIrgyCmLXsZWGvYLJ
 wQZUHSIf2VM5GEhBFs8uydDKRY1mlUwAUCHKEIW9+GB9JpVs0RMC7CwLtBOuMM7x1/IF
 93ohJAx79wR9k0UKfLKoU+WO/6qcIxrWBn+emikDbOP7gIS8Ppp2S8nwBhIL/unN8e6m
 ii8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702329610; x=1702934410;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zyD776fcn4JziH1GJLbJJRuMyU18zRNqnHFMyBj+0TA=;
 b=NNLv/WAGoszyJlPmaNaH3vv3a4xBnVLm7dUhLREqsWMgIWpQXJH8zsSDFVhTtNm3J+
 QwpmYfgdcygS3BRtD1rwMZvdx8Knt9Fo9tgrtvRLUd6qJ4rmWUbagg7rBV4onHL4QaBl
 cjGHTvixtFaQBqB24eftcFSwFoCu03HFAbFV3u7Vi/w91pjDxUoj8yKtrJsFIFUdSBbS
 WI2pmChzBqXQM3dqXeJo4pNlJRQnYQZRG3iOSA6B592PYknqJjjhPbsa8/M+TDzJ6s+4
 IkLnO3qegSd4uKaWtMQvJGxKixdkz2B5Vk4X00iXxm6jgJ4xw7lZzVOf4kjCfASYUGzZ
 mbsQ==
X-Gm-Message-State: AOJu0Yykh0Qmqx7yCdRMpIX1bpE7ursNBHydbWY6FMXJt+KV7qXly2jk
 wyYokGrj3ZKpiQvs88j9JV1rYg==
X-Google-Smtp-Source: AGHT+IHeiRtafPqQMB1v6Lk/OrgDkhsDHVwqcnGopmK3HPUNpMBDgB7R0kuY1RJDNUkzKnKzGMRX9g==
X-Received: by 2002:a17:906:13:b0:9a9:f0e6:904e with SMTP id
 19-20020a170906001300b009a9f0e6904emr3955274eja.16.1702329610416; 
 Mon, 11 Dec 2023 13:20:10 -0800 (PST)
Received: from m1x-phil.lan ([176.176.175.193])
 by smtp.gmail.com with ESMTPSA id
 tm8-20020a170907c38800b00a1e30528af3sm5268706ejc.47.2023.12.11.13.20.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 11 Dec 2023 13:20:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Claudio Fontana <cfontana@suse.de>,
 Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/24] exec: Rework of various headers (user focused)
Date: Mon, 11 Dec 2023 22:19:37 +0100
Message-ID: <20231211212003.21686-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Regards,

Phil.

Philippe Mathieu-Daudé (24):
  exec: Include 'cpu.h' before validating CPUArchState placement
  exec: Expose 'target_page.h' API to user emulation
  target: Define TCG_GUEST_DEFAULT_MO in 'cpu-param.h'
  accel: Include missing 'exec/cpu_ldst.h' header
  semihosting/uaccess: Avoid including 'cpu.h'
  semihosting/guestfd: Remove unused 'semihosting/uaccess.h' header
  host/load-extract: Include missing 'qemu/atomic.h' and 'qemu/int128.h'
  host/atomic128: Include missing 'qemu/atomic.h' header
  hw/ppc/spapr_hcall: Remove unused 'exec/exec-all.h' included header
  hw/misc/mips_itu: Remove unnecessary 'exec/exec-all.h' header
  hw/s390x/ipl: Remove unused 'exec/exec-all.h' included header
  target/i386: Include missing 'exec/exec-all.h' header
  accel/tcg: Include missing 'hw/core/cpu.h' header
  gdbstub: Include missing 'hw/core/cpu.h' header
  exec/cpu-all: Remove unused headers
  exec/cpu-all: Reduce 'qemu/rcu.h' header inclusion
  target/ppc/excp_helper: Avoid 'abi_ptr' in system emulation
  accel/tcg: Un-inline retaddr helpers to 'user-retaddr.h'
  exec/user: Do not include 'cpu.h' in 'abitypes.h'
  exec: Declare abi_ptr type in its own 'tcg/abi_ptr.h' header
  exec/cpu_ldst: Avoid including 'cpu.h'
  exec/cpu-all: Restrict inclusion of 'exec/user/guest-base.h'
  exec/cpu-all: Extract page-protection definitions to
    page-prot-common.h
  target: Restrict 'sysemu/reset.h' to system emulation

 meson.build                                   |  2 +-
 accel/tcg/user-retaddr.h                      | 28 ++++++++++
 bsd-user/bsd-mem.h                            |  1 +
 bsd-user/qemu.h                               |  1 +
 host/include/generic/host/atomic128-cas.h     |  2 +
 host/include/generic/host/atomic128-ldst.h    |  2 +
 .../generic/host/load-extract-al16-al8.h      |  3 ++
 include/exec/cpu-all.h                        | 50 +++---------------
 include/exec/cpu_ldst.h                       | 51 ++++---------------
 include/exec/exec-all.h                       |  1 +
 include/exec/page-prot-common.h               | 38 ++++++++++++++
 include/exec/ram_addr.h                       |  1 +
 include/exec/translator.h                     |  5 +-
 include/exec/user/abitypes.h                  |  9 +++-
 include/exec/user/guest-base.h                |  6 +++
 include/semihosting/uaccess.h                 |  3 +-
 include/tcg/abi_ptr.h                         | 32 ++++++++++++
 target/alpha/cpu-param.h                      |  3 ++
 target/alpha/cpu.h                            |  3 --
 target/arm/cpu-param.h                        |  8 +--
 target/arm/cpu.h                              |  4 +-
 target/avr/cpu-param.h                        |  2 +
 target/avr/cpu.h                              |  2 -
 target/hppa/cpu-param.h                       |  6 +++
 target/hppa/cpu.h                             |  6 ---
 target/i386/cpu-param.h                       |  3 ++
 target/i386/cpu.h                             |  3 --
 target/loongarch/cpu-param.h                  |  2 +
 target/loongarch/cpu.h                        |  2 -
 target/microblaze/cpu-param.h                 |  3 ++
 target/microblaze/cpu.h                       |  3 --
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
 target/s390x/cpu-param.h                      |  6 +++
 target/s390x/cpu.h                            |  3 --
 target/sparc/cpu-param.h                      | 23 +++++++++
 target/sparc/cpu.h                            | 23 ---------
 target/xtensa/cpu-param.h                     |  3 ++
 target/xtensa/cpu.h                           |  3 --
 accel/tcg/cpu-exec.c                          |  3 ++
 accel/tcg/cputlb.c                            |  2 +
 accel/tcg/tb-maint.c                          |  1 +
 accel/tcg/tcg-accel-ops.c                     |  2 +
 accel/tcg/translator.c                        |  1 +
 accel/tcg/user-exec.c                         |  2 +
 bsd-user/main.c                               |  1 +
 bsd-user/mmap.c                               |  1 +
 bsd-user/signal.c                             |  1 +
 cpu-target.c                                  |  1 +
 gdbstub/gdbstub.c                             |  1 +
 hw/misc/mips_itu.c                            |  3 +-
 hw/ppc/ppc440_bamboo.c                        |  1 +
 hw/ppc/sam460ex.c                             |  1 +
 hw/ppc/spapr_hcall.c                          |  1 -
 hw/ppc/virtex_ml507.c                         |  1 +
 hw/s390x/ipl.c                                |  1 -
 linux-user/arm/cpu_loop.c                     |  1 +
 linux-user/elfload.c                          |  2 +
 linux-user/main.c                             |  1 +
 linux-user/mmap.c                             |  1 +
 linux-user/nios2/cpu_loop.c                   |  1 +
 linux-user/signal.c                           |  1 +
 linux-user/syscall.c                          |  1 +
 page-target.c                                 | 43 ++++++++++++++++
 semihosting/guestfd.c                         |  1 -
 system/physmem.c                              | 36 +------------
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
 target/i386/cpu.c                             |  2 +-
 target/i386/tcg/fpu_helper.c                  |  1 +
 target/i386/tcg/sysemu/excp_helper.c          |  1 +
 target/loongarch/cpu.c                        |  2 +
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
 118 files changed, 332 insertions(+), 192 deletions(-)
 create mode 100644 accel/tcg/user-retaddr.h
 create mode 100644 include/exec/page-prot-common.h
 create mode 100644 include/tcg/abi_ptr.h
 create mode 100644 page-target.c

-- 
2.41.0


