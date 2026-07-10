Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EDFC44507
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 21:01:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiIEb-00011x-6a; Fri, 10 Jul 2026 16:54:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIEZ-00011V-7a
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:54:07 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIEX-0000ar-AO
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:54:06 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-8487b7b3fc8so957325b3a.3
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 13:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783716844; x=1784321644; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=fEZ0JdYQPiF4MtB15bZdOuQ7ReQG0VTLPTQcrU1J7Cc=;
 b=gysxetSOvhfUCa9SJXAnasldheiJfNqY5h6Nblfgas6/N7GMWKx4Eue7v8KMOJTq9T
 U+/whYnABGF5ylOpsp4Bs1yXf9mYjnfCTFPWig0tk7JoaCIca4qgeMlOZN/ZznPlX9ri
 +VmJSkLjqi+AlE2wFfnpM1vl3rgkbKiuZ/p6slwL4J7n/b8soeLhEKseUqsRmhhHz2Al
 UEJfbdi4+YlSDPLgdtvKhaHyTtQrI8sEQOD8h1pcaiuZECq906bcSHDK5Jo/ouJJIO5a
 ly/2LbuKmetYWUMRcBQ980VNY18qHWdXS4EgN82i8BI3uGRtxDzt6OIVkHHULueLjOnJ
 ogNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783716844; x=1784321644;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=fEZ0JdYQPiF4MtB15bZdOuQ7ReQG0VTLPTQcrU1J7Cc=;
 b=GxIxJeNQTb7GHqmX486ha32/HRQb2da3vaWl/sbPEx5twIxXD9kZv9hfSOgloao5kY
 rLYHdFe/JCSHJriScpIKjcXzD/rhmZ8l2nJZ3L6Gr3ZMFFNPzIbRTOPCtupclNS5fKzX
 lsH4MV/sM+lQZXrz9NFSXamktk5TL07e1YsZTJOKwOOxKJg5EMchyGSizL8sW4WFBK3e
 DBfurdvFSxvxmIcXw9PCVQvHVYobz9oSG2WQFw26aS8LLRVAEX1eKrmZjN7xectZKzGf
 CUBIDdheqJ+QVdAPnZn9UkmWECnbrHhwx6tfIQ3PGNKyO1M4eMvpAaZuW4vXVML11xmw
 B8ew==
X-Forwarded-Encrypted: i=1;
 AHgh+RqTdUyJZzaCbZJ5SjkSsiz8dow9SDFlP89qia9CDiS0DZG5jNGGqxnu7zGfng1ggDhwXaPQ8/4Lk/I3@nongnu.org
X-Gm-Message-State: AOJu0Yzd38xFC+VatyA0TGgM8DQQqrK0DydZhn19252W6O9gNxIR+D64
 MKCLdRR8eWe8e0Hm0KQXoBhASMIaB0RQUOLc+W27/tuKtslM1Q80GqYo09OUTr/OXDI=
X-Gm-Gg: AfdE7cnGZ5Nc4jfCcuzni6L0bLqmcfRU6UzELPSS94DBpkJxUaXcsRnepomUKAD42iw
 O70bLqliX6BVS/CVTUJzAU7oVcKw6kNJH0wiFU55ZgZGFju9IZOLvmXDP9GBnS/BCcTzSZEJAjO
 Ei5ql0BPyoOYjzSBi2sgJj+RKobbJbbatihqbyV6CXEZ2OVXX3CG68/4GXFEypkrx8PEaa7b2/F
 0wy+ttV5qXjQFzSM4kyPlsDJAF7hQW/N6gCljH4cbd4xYeNwIsPgcz2MLUFUa48UbeChNq5aSh7
 gFPZcd+PlTaiZNXifQapkM8R8sT17g2AULMZZ9i468655Nh1/DXClGrRKsHa2O997sIOHe+7M4s
 qGuVPD4n9OwQv+S8sD+3LY9bKzdm3Izd/x9WI64Zqtr7YTsVeIypOlxRbYQE4T4vUpaw6VxYtWr
 gWgDsMEOiMFDmIPVfuiQ==
X-Received: by 2002:a05:6a00:21cc:b0:848:7443:f2de with SMTP id
 d2e1a72fcca58-8488961c141mr519521b3a.13.1783716843457; 
 Fri, 10 Jul 2026 13:54:03 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6d76106sm10780574b3a.40.2026.07.10.13.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:54:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 00/51] accel/tcg: Use IntervalTree for breakpoints and
 watchpoints
Date: Fri, 10 Jul 2026 13:53:10 -0700
Message-ID: <20260710205401.836304-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

Changes for v3:
  - Handle ARMv6 BE-32 within debug_check_watchpoint.
  - Drop adjust_watchpoint_address.
  - Change cpu_watchpoint_insert from addr+len to first+last.
    - Change tlb_flush_range_by_mmuidx to use first+last.
    - Use tlb_flush_range_by_mmuidx in cpu_watchpoint_insert.


r~


Philippe Mathieu-Daudé (1):
  cpu: Define BreakpointFlags type

Richard Henderson (50):
  exec/breakpoint: Move BP declarations from hw/core/cpu.h
  exec/breakpoint: Merge watchpoint.h
  qemu/typedefs: Declare CPUBreakpoint and CPUWatchpoint globally
  hw/core/cpu: Remove exec/breakpoint.h include
  exec/breakpoint: Add CPUBreakpoint.id
  exec/watchpoint: Add CPUWatchpoint.id
  accel/tcg: Pass CPUBreakpoint to debug_check_breakpoint
  target/arm: Split is_wp out of bp_wp_matches
  target/arm: Use bp argument in arm_debug_check_breakpoint
  target/arm: Use wp argument in arm_debug_check_watchpoint
  target/riscv: Use bp argument in riscv_cpu_debug_check_breakpoint
  target/riscv: Use bp argument in riscv_cpu_debug_check_watchpoint
  target/xtensa: Use bp argument in xtensa_debug_check_breakpoint
  cpu: Use interval-tree for CPUBreakpoint
  target/arm: Make check_watchpoint_in_range static
  gdbstub: Report actual watchpoint trigger address
  cpu: Use interval-tree for CPUWatchpoint
  exec/breakpoint: Return the new bp from cpu_breakpoint_insert
  system: Remove cpu_watchpoint_insert error return path
  exec/breakpoint: Return the new wp from cpu_watchpoint_insert
  system: Validate flags in cpu_watchpoint_insert
  cpu-common: Validate flags in cpu_breakpoint_insert
  exec/breakpoint: Add CPUWatchpoint.hitlast
  exec/breakpoint: Merge CPUBreakpoint and CPUWatchpoint
  accel/tcg: Pass watchpoint hit to debug_excp_handler
  accel/tcg: Pass breakpoint hit to debug_excp_handler
  target/arm: Use CPUBreakpoint arg in arm_debug_excp_handler
  target/i386: Pass wp_hit to check_hw_breakpoints
  target/i386: Use CPUBreakpoint arg in breakpoint_handler
  target/ppc: Use CPUBreakpoint arg in breakpoint_handler
  target/ppc: Simplify ppc_cpu_debug_check_breakpoint
  target/ppc: Simplify ppc_cpu_debug_check_watchpoint
  target/s390x: Use CPUBreakpoint arg in breakpoint_handler
  target/riscv: Simplify riscv_cpu_debug_excp_handler
  target/riscv: Set badaddr in riscv_cpu_debug_excp_handler
  target/riscv: Merge riscv_cpu_debug_check_{break,watch}point
  target/xtensa: Restrict xtensa_breakpoint_handler to system mode
  target/xtensa: Rename xtensa_breakpoint_handler
  target/xtensa: Simplify xtensa_cpu_debug_excp_handler
  accel/tcg: Clear BP_WATCHPOINT_HIT after use
  accel/tcg: Merge CPUState.{break,watch}point_hit
  target/arm: Simplify v6 watchpoints
  accel/tcg: Remove TCGCPUOps.adjust_watchpoint_address
  accel/tcg: Move ALL_MMUIDX_BITS to hw/core/cpu.h
  accel/tcg: Drop stale assert for vaddr
  accel/tcg: Use addr/last in tlb_flush_range_locked
  target/arm: Be more defensive for invalid tlbi_aa64_get_range
  accel/tcg: Change tlb_flush_range_* to use addr/last
  system: Use tlb_flush_range_by_mmuidx in cpu_watchpoint_insert
  accel/tcg: Change cpu_watchpoint_insert to use addr/last

 include/accel/tcg/cpu-ops.h         |  17 +-
 include/exec/breakpoint.h           |  36 ++--
 include/exec/cputlb.h               |  12 +-
 include/exec/watchpoint.h           |  18 --
 include/hw/core/cpu.h               |  21 +--
 include/qemu/typedefs.h             |   1 +
 target/arm/cpu.h                    |   4 +-
 target/arm/internals.h              |  18 +-
 target/i386/cpu.h                   |   4 +-
 target/i386/tcg/helper-tcg.h        |   4 +-
 target/ppc/cpu.h                    |   4 +-
 target/ppc/internal.h               |   6 +-
 target/riscv/cpu.h                  |   4 +-
 target/riscv/debug.h                |   5 +-
 target/s390x/tcg/tcg_s390x.h        |   2 +-
 target/xtensa/cpu.h                 |   8 +-
 accel/tcg/cpu-exec.c                |  76 ++++----
 accel/tcg/cputlb.c                  | 113 ++++++------
 accel/tcg/tcg-accel-ops.c           |  37 ++--
 accel/tcg/user-exec-stub.c          |  19 +-
 accel/tcg/watchpoint.c              | 170 +++++++++---------
 accel/whpx/whpx-common.c            |   9 +-
 cpu-common.c                        |  68 +++----
 gdbstub/system.c                    |  49 +++---
 gdbstub/user.c                      |   9 +-
 hw/core/cpu-common.c                |   2 -
 linux-user/main.c                   |  14 +-
 system/watchpoint.c                 |  80 ++++-----
 target/arm/cpu.c                    |   1 -
 target/arm/debug_helper.c           |  14 +-
 target/arm/hvf/hvf.c                |   6 +-
 target/arm/hyp_gdbstub.c            |   7 +-
 target/arm/kvm.c                    |   5 +-
 target/arm/tcg/cpu-v7m.c            |   1 -
 target/arm/tcg/debug.c              | 263 +++++++++++++---------------
 target/arm/tcg/mte_helper.c         |   3 +-
 target/arm/tcg/tlb-insns.c          |  23 +--
 target/hppa/mem_helper.c            |   3 +-
 target/i386/cpu.c                   |   2 +-
 target/i386/kvm/kvm.c               |  11 +-
 target/i386/machine.c               |   2 +-
 target/i386/tcg/bpt_helper.c        |   2 +-
 target/i386/tcg/system/bpt_helper.c |  81 ++++-----
 target/i386/tcg/tcg-cpu.c           |   2 +-
 target/i386/whpx/whpx-all.c         |  15 +-
 target/loongarch/tcg/tlb_helper.c   |   5 +-
 target/ppc/cpu.c                    |   9 +-
 target/ppc/cpu_init.c               |   2 +-
 target/ppc/kvm.c                    |  14 +-
 target/ppc/mmu_helper.c             |   4 +-
 target/ppc/tcg-excp_helper.c        |  85 ++++-----
 target/riscv/cpu_helper.c           |   6 +-
 target/riscv/debug.c                | 159 +++--------------
 target/riscv/tcg/tcg-cpu.c          |   4 +-
 target/s390x/helper.c               |   1 -
 target/s390x/kvm/kvm.c              |   7 +-
 target/s390x/tcg/debug.c            |  28 +--
 target/xtensa/cpu.c                 |   2 +-
 target/xtensa/dbg_helper.c          |  31 ++--
 target/xtensa/helper.c              |  46 ++---
 60 files changed, 732 insertions(+), 922 deletions(-)
 delete mode 100644 include/exec/watchpoint.h

-- 
2.43.0


