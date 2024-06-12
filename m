Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C02C27C53
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 08:14:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sHJ7o-0001zZ-Av; Wed, 12 Jun 2024 04:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1sHJ7m-0001z5-Sd
 for qemu-riscv@nongnu.org; Wed, 12 Jun 2024 04:14:30 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1sHJ7k-0006Ed-Qg
 for qemu-riscv@nongnu.org; Wed, 12 Jun 2024 04:14:30 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1f47f07acd3so60142665ad.0
 for <qemu-riscv@nongnu.org>; Wed, 12 Jun 2024 01:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1718180067; x=1718784867; darn=nongnu.org;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z8WTAPoocSujgw+1vjVdkNZkdKXDTPGs5Nu9dYO12uI=;
 b=ir6avT+L23KzBHOG4dB+EMaaVPkpWV8nLE4w2fwHi5z1PRLCbvwAx19p6bpDpuXUZW
 yKcRWqxaw0xb7o45isdX1uqXXr0TqoSe5bTdnBzOZkDELlOYccx1yLt6yRj6sXmyZTby
 ssRzvKWg916E3xZk8NbfJZW3knZqLF30ySXSrVrteoikh1iejUaBIMHDZZdnO51v7gx5
 MMM2TNh5R9bz7c9LWPrEC2Bo6ln24m4lXfaC1JEviHB4qVv3SQLdwZ1DZ/LA/CDf0pQk
 5HDCQrQC3S4ujHtRL22N4pr/tAmCxraTKr1LnS3ZF4GrQxC5hx7iVZyz8zBP49B0rr+x
 jXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718180067; x=1718784867;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z8WTAPoocSujgw+1vjVdkNZkdKXDTPGs5Nu9dYO12uI=;
 b=Tax28P65g0eCXDSfJoleVvM5JWXpB9k/776GOwBDrOUnn8Dnw/vXuL7t7ULmPRk24Y
 tudNKleo1geull6AUPr51kDbPmDRE9n60D17pNxlv/4ITwYo4cwO1hwK5OaydP9YYiXP
 v8xTjSvKKGMKjjKC0qfWLish7V2//gNnn+daSPsk/6gMh0z3wY52/T3+RrOZeKxlUOqE
 ipuMvbPN629oSVGxML4/ixZvkvNpsZWNrCH4d4oVmIhl3+JUmpumiskTldSnM14Bvfj5
 bVrWj9NII3zQNm4N8B16GIZtvr7kcSeQvxEBn7sX2cfa/+a6GvY1xy+iYjnS571BCPUr
 Ft2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfr5FaoaW7g+cGi4wrNuwE1S3YmOfUsliztP5Zc1qyBPuznGh6bI1Z/n3e+hHW/eXQmy/QuMhqdYgmvg3B2uAQPZs6ceU=
X-Gm-Message-State: AOJu0YypYyZWcShM2TiSmMr67bNmiWJYLT0AO59bISRsRPUS7SmnkjD+
 P2hd1gwBjbGOuD8gpvo7kKAAQmsSohMvHUtsKR4jvSYlq6/Eb0PMrKKPFpT3+rI=
X-Google-Smtp-Source: AGHT+IHpJ3n9Dto21jsN0MAUUu5lp0InCj5RbA/NLbWLzvOdUThw5f5te0m8HSP/zy6SCDAKfDjMOA==
X-Received: by 2002:a17:902:d4c1:b0:1f6:ea71:34ee with SMTP id
 d9443c01a7336-1f83b5eba66mr11254755ad.16.1718180066907; 
 Wed, 12 Jun 2024 01:14:26 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f8393e8e53sm11363875ad.16.2024.06.12.01.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 01:14:26 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs),
 qemu-ppc@nongnu.org (open list:PowerPC TCG CPUs),
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs),
 Jim Shu <jim.shu@sifive.com>
Subject: [RFC PATCH 00/16] Implements RISC-V WorldGuard extension v0.4
Date: Wed, 12 Jun 2024 16:14:00 +0800
Message-Id: <20240612081416.29704-1-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=jim.shu@sifive.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This patchset implements Smwg/Smwgd/Sswg CPU extension and wgChecker
device defined in WorldGuard spec v0.4.

The WG v0.4 spec could be found here:
https://lists.riscv.org/g/security/attachment/711/0/worldguard_rvia_spec-v0.4.pdf

To enable WG in QEMU, pass "wg=on" as machine parameter to virt machine.
It enables both WG CPU CSRs to apply WID of CPU and wgCheckers on
the DRAM, FLASH, and UART to protect these resources.

This patchset contains 5 parts:

1. Commit  1: Bugfix of IOMMUMemoryRegion
2. Commit  2 ~ 3: Extend IOMMUMemoryRegion and MemTxAttr for WG support
3. Commit  4 ~ 11: Add WG global device and CPU extensions
4. Commit 12 ~ 15: Add WG checker device
5. Commit 16: Add WG support to the virt machine

Jim Shu (16):
  accel/tcg: Store section pointer in CPUTLBEntryFull
  accel/tcg: memory access from CPU will pass access_type to IOMMU
  exec: Add RISC-V WorldGuard WID to MemTxAttrs
  hw/misc: riscv_worldguard: Add RISC-V WorldGuard global config
  target/riscv: Add CPU options of WorldGuard CPU extension
  target/riscv: Add hard-coded CPU state of WG extension
  target/riscv: Add defines for WorldGuard CSRs
  target/riscv: Allow global WG config to set WG CPU callbacks
  target/riscv: Implement WorldGuard CSRs
  target/riscv: Add WID to MemTxAttrs of CPU memory transactions
  hw/misc: riscv_worldguard: Add API to enable WG extension of CPU
  hw/misc: riscv_wgchecker: Implement RISC-V WorldGuard Checker
  hw/misc: riscv_wgchecker: Implement wgchecker slot registers
  hw/misc: riscv_wgchecker: Implement correct block-access behavior
  hw/misc: riscv_wgchecker: Check the slot settings in translate
  hw/riscv: virt: Add WorldGuard support

 accel/tcg/cputlb.c                   |   34 +-
 docs/system/riscv/virt.rst           |   10 +
 hw/misc/Kconfig                      |    3 +
 hw/misc/meson.build                  |    1 +
 hw/misc/riscv_wgchecker.c            | 1161 ++++++++++++++++++++++++++
 hw/misc/riscv_worldguard.c           |  273 ++++++
 hw/misc/trace-events                 |    9 +
 hw/riscv/Kconfig                     |    1 +
 hw/riscv/virt.c                      |  163 +++-
 include/exec/exec-all.h              |   11 +-
 include/exec/memattrs.h              |    5 +
 include/hw/core/cpu.h                |    3 +
 include/hw/misc/riscv_worldguard.h   |  123 +++
 include/hw/riscv/virt.h              |   17 +-
 system/physmem.c                     |   16 +-
 target/alpha/helper.c                |    2 +-
 target/arm/tcg/tlb_helper.c          |    2 +-
 target/avr/helper.c                  |    2 +-
 target/cris/helper.c                 |    2 +-
 target/hppa/mem_helper.c             |    2 +-
 target/i386/tcg/sysemu/excp_helper.c |    3 +-
 target/loongarch/tcg/tlb_helper.c    |    2 +-
 target/m68k/helper.c                 |   10 +-
 target/microblaze/helper.c           |    8 +-
 target/mips/tcg/sysemu/tlb_helper.c  |    4 +-
 target/openrisc/mmu.c                |    2 +-
 target/ppc/mmu_helper.c              |    2 +-
 target/riscv/cpu.c                   |   16 +-
 target/riscv/cpu.h                   |   12 +
 target/riscv/cpu_bits.h              |    5 +
 target/riscv/cpu_cfg.h               |    5 +
 target/riscv/cpu_helper.c            |   69 +-
 target/riscv/csr.c                   |  107 +++
 target/riscv/tcg/tcg-cpu.c           |   11 +
 target/rx/cpu.c                      |    3 +-
 target/s390x/tcg/excp_helper.c       |    2 +-
 target/sh4/helper.c                  |    2 +-
 target/sparc/mmu_helper.c            |    6 +-
 target/tricore/helper.c              |    2 +-
 target/xtensa/helper.c               |    3 +-
 40 files changed, 2054 insertions(+), 60 deletions(-)
 create mode 100644 hw/misc/riscv_wgchecker.c
 create mode 100644 hw/misc/riscv_worldguard.c
 create mode 100644 include/hw/misc/riscv_worldguard.h

-- 
2.17.1


