Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980F7C369B9
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 08:18:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u4bPb-0005b7-Fr; Tue, 15 Apr 2025 04:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1u4bPZ-0005Rl-KC
 for qemu-riscv@nongnu.org; Tue, 15 Apr 2025 04:12:53 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1u4bPV-0001sY-HM
 for qemu-riscv@nongnu.org; Tue, 15 Apr 2025 04:12:53 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-22928d629faso50532175ad.3
 for <qemu-riscv@nongnu.org>; Tue, 15 Apr 2025 01:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1744704767; x=1745309567; darn=nongnu.org;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=27hFcsvMzgL0iuJXFP0FZSxmWFSUoHGEnflpa/ixsnI=;
 b=d09g+EOzlqeSK+SlJ3RmRka2NbOGo4sNnZXDce+Jw4vY7pjy3uzLz3ZvgynZDSBYnF
 vCA0CWsn7uMlXBqLs4qZSl5fjctipLQtswD6FWWsqPTzBad+oBbbi+Qzaq6A66lwBFaC
 5Pcl22K1JQAhDxPiMCkH+usCiJM5r+TSg6Ess/zYk9qI3KPfzHCDY79rNulYmssDlDQg
 lzKf1mg9IpECcVkHZCMOC6XDZTFH+Zov9C3/2QyhX2hLBi6ddqNVXaa71P01qFaOhdH/
 oeItcjNrEo3rx+9/GLN7cGfazO2QiT406xV2ia0FMrzRhwJxCR4U22zRHufmxnGkiNqQ
 NAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744704767; x=1745309567;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=27hFcsvMzgL0iuJXFP0FZSxmWFSUoHGEnflpa/ixsnI=;
 b=gk2BCj7GNzElo6D8jLdYP1qFJXbtZB6el6hs11kUdUwC/AuYAEvhtPBa4p2LQIaBrb
 wyeDlC8Xdsfton8Xb4mwxVVO1aHFWIUL4yUYzwBJ5syLnyOnmK7k0mZEop7FljO7ia03
 E/Q5pwLOcYyIwAwlmsLgEHfW+C74Oy3I33ReNSJFV8QsmCu3SN1tys7zbRn/k1odHyTU
 VJRqfzRAR2WxMivAQX7yCWKGWxPIejfo1QWwRA99uUojdnaSy1BV7Oir8IxWBiijJHkB
 PiWaU8zQOMFJvuVdjpa9pz+gxZ5TDDQACrPXlXebQxBGeiCI6G8v+WVl7JlihO92Sd8O
 GE8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQ91ucFgdny4GVKgPGjK5a95cePetLSk1hsHhTf3YjdqWw1t9UZvH+7YCRrpT2Ty/tXUAefFK4sy4c@nongnu.org
X-Gm-Message-State: AOJu0Yw+t8iUsN/fDPqsjhDew8QIoE2iGzSY6cYLia2AUdZmElKbnHPs
 OQiUpDEjELoUcXeEK0BlFVUyLmdBgnfTPLYeOAH7aqOII6Taceo340g61tV8iCg=
X-Gm-Gg: ASbGnctTxeIHnX1JSMX25N7irObd93etDAHbLJgR1+6IqH1846tFgxSAsZmGTmLOCUl
 lvhH9NiyYwMFOXN5sh07byfMef0HiJ4NymdG4LzHyk3Lx2aWAgQgjGhsDW3UUw7aBouFkZkW/Lc
 8QPTA3Bij+CLq0NTFzrqgLqj9VLV5leR4FjQIGfDNs1qmm9Qk/y5GGvw2x5nQWLNE7C8TgU1osB
 yXEoINhRXa2MlM2FJxmhBW3xJd9urisgHb2WmerwLvM0tWae0E7J7Cn5NzZQNEIxdDQqNpMRB7D
 KMEtVkq1ayRF0TaamQ94dYOCmyB0MCwLD2rthwTZNH4EN2+baqgTXiJ/AiJDH6k=
X-Google-Smtp-Source: AGHT+IEO6Hg8e1tjs94HjZgWAxO2S3kqEfSzKzfMlBv4rxd65BJezi5Ed6VZP2ySIzRkvUY3x288Aw==
X-Received: by 2002:a17:903:1b0b:b0:21f:4649:fd49 with SMTP id
 d9443c01a7336-22bea4fd04emr224348365ad.49.1744704767114; 
 Tue, 15 Apr 2025 01:12:47 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22ac7c95cd1sm111082335ad.150.2025.04.15.01.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 01:12:46 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>, Helge Deller <deller@gmx.de>,
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
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
 qemu-ppc@nongnu.org (open list:PowerPC TCG CPUs),
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs),
 Jim Shu <jim.shu@sifive.com>
Subject: [PATCH 00/17] Implements RISC-V WorldGuard extension v0.4
Date: Tue, 15 Apr 2025 16:12:14 +0800
Message-Id: <20250415081231.21186-1-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=jim.shu@sifive.com; helo=mail-pl1-x62b.google.com
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
3. Commit  4 ~ 12: Add WG global device and CPU extensions
4. Commit 13 ~ 16: Add WG checker device
5. Commit 17: Add WG support to the virt machine

QEMU code can be found at [1]

[1] https://github.com/cwshu/qemu/tree/riscv-wg-v1

--

Changed since RFCv1:
- Rebase to latest QEMU (v10.0.0-rc3)
- Add the description of HW config and CPU option of WG in the
  virt machine documentation
- Expose CPU options of WG after WG CPU code has been implemented
- Change 'mwid' and 'mwidlist' options to experimental options
- Change 'world_id' to unsigned int type + bit field.

Jim Shu (17):
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
  target/riscv: Expose CPU options of WorldGuard
  hw/misc: riscv_worldguard: Add API to enable WG extension of CPU
  hw/misc: riscv_wgchecker: Implement RISC-V WorldGuard Checker
  hw/misc: riscv_wgchecker: Implement wgchecker slot registers
  hw/misc: riscv_wgchecker: Implement correct block-access behavior
  hw/misc: riscv_wgchecker: Check the slot settings in translate
  hw/riscv: virt: Add WorldGuard support

 accel/tcg/cputlb.c                   |   36 +-
 docs/system/riscv/virt.rst           |   20 +
 hw/misc/Kconfig                      |    3 +
 hw/misc/meson.build                  |    1 +
 hw/misc/riscv_wgchecker.c            | 1160 ++++++++++++++++++++++++++
 hw/misc/riscv_worldguard.c           |  272 ++++++
 hw/misc/trace-events                 |    9 +
 hw/riscv/Kconfig                     |    1 +
 hw/riscv/virt.c                      |  163 +++-
 include/exec/cputlb.h                |   11 +-
 include/exec/exec-all.h              |    3 +-
 include/exec/memattrs.h              |    8 +-
 include/hw/core/cpu.h                |    3 +
 include/hw/misc/riscv_worldguard.h   |  123 +++
 include/hw/riscv/virt.h              |   15 +-
 system/physmem.c                     |   16 +-
 target/alpha/helper.c                |    2 +-
 target/avr/helper.c                  |    2 +-
 target/hppa/mem_helper.c             |    1 -
 target/i386/tcg/system/excp_helper.c |    3 +-
 target/loongarch/tcg/tlb_helper.c    |    2 +-
 target/m68k/helper.c                 |   10 +-
 target/microblaze/helper.c           |    8 +-
 target/mips/tcg/system/tlb_helper.c  |    4 +-
 target/openrisc/mmu.c                |    2 +-
 target/ppc/mmu_helper.c              |    2 +-
 target/riscv/cpu.c                   |   17 +-
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
 39 files changed, 2063 insertions(+), 61 deletions(-)
 create mode 100644 hw/misc/riscv_wgchecker.c
 create mode 100644 hw/misc/riscv_worldguard.c
 create mode 100644 include/hw/misc/riscv_worldguard.h

-- 
2.17.1


