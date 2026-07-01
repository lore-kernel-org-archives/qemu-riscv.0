Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701EAC43458
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 03:07:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1welG2-0005mV-IW; Tue, 30 Jun 2026 23:05:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welFq-0005fK-Ue
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 23:04:50 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welFn-0002mk-0R
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 23:04:49 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-37fad5eca09so935312a91.1
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 20:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782875085; x=1783479885; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/SGysHL0tHY5nuKtNT/6ZJIQ+bDCVVtRXZiayTu4xco=;
 b=lQNYq9IhwEdKnw8NfyRRg1rz1OECkA2IBT5L4Go3uTKkhiVzxuwjimfthTSxZ5OGDk
 U6mtYsWmFoqYXklPA86azRPNXNKFfiY0BAWfh3X0X97QVVGySsf+4YotDXAeziQEeCGG
 +PKqLRFWOn0rknuAi3+oWVq2XqPm/Q+0QkJf7/Dy3k2jCa15kgTlXlAFUMTcY09WwI7s
 afG3qP6rqOgwAz/CWAfwGH7Kw3RhAmOiWB8EU64XF/vWWsvvZ6p2RJhMpueKIDzR7SJA
 57DV/XjKu73dkJLUyPaZaCMTIE3JIM7O6lo676vpQscSi1pPAZW+nZ8LDYp8wlwRyzlk
 feUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782875085; x=1783479885;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/SGysHL0tHY5nuKtNT/6ZJIQ+bDCVVtRXZiayTu4xco=;
 b=hNbwANGYNPJaIxh4wP3Pv9gC1c2iES9vG5U5cEvZBYB2ZPtJYvP1eESI8He9HPqKEw
 Aduw6w1414/ed4CKD4XyJ47L+WjlrrcKw+XMMXS3S8Gtd+gDyLHRckR2pn7KAPReaBBA
 ngqV2fL7b5TDDOtjiSEXyq1ziVMAZlG9XsrDPijnwnhzE+YzMEgKoOJXRTUONQ/wsRtS
 qYEFt5bXGgJ0vb7Aqc4jL26cI0wP/No9DS/mLM9D2n6Gbq7i4bXPGBltmtXx6/Nj9QxO
 jzjgeV1kzAI8MyaY0L65jyeWNdxzdFoSf/wAitcgh+L1eaphHwyoKFgxvH0IvA3RP2oO
 7O6w==
X-Forwarded-Encrypted: i=1;
 AHgh+RqRZjimDoIWArVSTKOcZSOdLSY6PceLpAdFvW4h6XGVozSAJZYjWJkwI8puVz/RG3GTze+bk9FHY4ws@nongnu.org
X-Gm-Message-State: AOJu0Ywc3CBXRVnJrK9Lj4bqp+/7qgPJmt4oXmNhM6CJ6wWUnyhniSqz
 h0CE+uLdh38wrjK412J5XplDJuLC22VhG44o6wXb3UklpiVMuZwaJ0ZbsOTbVmRP2sM=
X-Gm-Gg: AfdE7cmFUsMwXmKmfNXGCOGU1TC0I7hdilDZ05SwMmtzkNNvehT8KgceBUsReH4fY0i
 kerxVwvIsI0wySLzCt8Cl/IYUmuDz8TKG+YF4f7mfRrqch0ccOql9peB3Y9QNkbYx26FQnhoZ4d
 mtgEgtpwjsAmMlfCaScjwmAzouhXB73/4QrSEDyBfN5DTucOqufwvHWKyn1XIfmLPh+3gwh6H5A
 AbT5G+gJMjat5Czh3THQ4VWYPCyV4ioa1XyAFxUk7G+nb+ZOLmIzAyhzlFs/HjS+NPxUciLDTkw
 IgUv7QMkqCSh/BFupNjznXmmWNjvbVA5Nto8NbuJQ0LMNqqJuoebVnO4HPFtn/sVBnSmdhi4leK
 69LvpXNuyLJa9nbZx652fEtRrCKrAICaEcb0Au4AhNucncv6t5FN9MwH5CGngZN/zl93AlVhnzw
 iMKkceBkPkZJe/wC5WfNcHKctQyEpRWcqGnYfH8JjslzivouRdWw==
X-Received: by 2002:a17:902:f642:b0:2b0:badc:c9cf with SMTP id
 d9443c01a7336-2ca448b0478mr33221795ad.13.1782875085092; 
 Tue, 30 Jun 2026 20:04:45 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ca37c74261sm23758085ad.22.2026.06.30.20.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 20:04:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: shivangu@linux.ibm.com,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 00/17] accel/tcg: Use IntervalTree for breakpoints and
 watchpoints
Date: Tue, 30 Jun 2026 20:04:26 -0700
Message-ID: <20260701030443.1382447-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Follow-up to 20260630171555.114844-1-shivangu@linux.ibm.com
("[RFC PATCH 0/2] change cpu->breakpoints to a GTree")

Beyond using interval-tree for breakpoints:

  - Pass the matching breakpoint to the target debug hook,
  - Allow the target to record an id/index for each BP or WP
    so that the target doesn't have to search for which item
    triggered, so that the target doesn't have to search again.
  - Convert both BP and WP to IntervalTree.


r~


Richard Henderson (17):
  accel/tcg: Pass CPUBreakpoint to debug_check_breakpoint
  accel/tcg: Constify CPUWatchpoint for debug_check_watchpoint
  cpu: Move cpu_breakpoint_test out of line
  exec/breakpoint: Move BP declarations from hw/core/cpu.h
  qemu/typedefs: Declare CPUBreakpoint and CPUWatchpoint globally
  *: Add missing include of exec/breakpoint.h
  hw/core/cpu: Remove exec/breakpoint.h include
  exec/breakpoint: Introduce BP_CPU_ID_SHIFT
  target/arm: Split is_wp out of bp_wp_matches
  target/arm: Set ID for watchpoints and breakpoints
  target/arm: Use bp argument in arm_debug_check_breakpoint
  target/arm: Use wp argument in arm_debug_check_watchpoint
  target/riscv: Set ID for watchpoints and breakpoints
  target/riscv: Use bp argument in riscv_cpu_debug_check_breakpoint
  target/riscv: Use bp argument in riscv_cpu_debug_check_watchpoint
  target/xtensa: Use BP_CPU_ID_SHIFT
  cpu: Use interval-tree for CPUBreakpoint

 include/accel/tcg/cpu-ops.h         |   4 +-
 include/exec/breakpoint.h           |  39 ++++++++--
 include/hw/core/cpu.h               |  39 +---------
 include/qemu/typedefs.h             |   2 +
 target/arm/internals.h              |   4 +-
 target/ppc/internal.h               |   4 +-
 target/riscv/debug.h                |   4 +-
 target/xtensa/cpu.h                 |   2 +-
 accel/tcg/cpu-exec.c                |  48 ++++++------
 accel/tcg/tcg-accel-ops.c           |   1 +
 cpu-common.c                        |  54 ++++++++-----
 gdbstub/system.c                    |   1 +
 gdbstub/user.c                      |   1 +
 hw/core/cpu-common.c                |   1 -
 linux-user/main.c                   |  13 +++-
 system/watchpoint.c                 |   1 +
 target/arm/tcg/debug.c              |  76 ++++--------------
 target/i386/cpu.c                   |   1 +
 target/i386/kvm/kvm.c               |   1 +
 target/i386/machine.c               |   1 +
 target/i386/tcg/system/bpt_helper.c |   1 +
 target/i386/tcg/tcg-cpu.c           |   2 +-
 target/ppc/cpu.c                    |   1 +
 target/ppc/tcg-excp_helper.c        |   4 +-
 target/riscv/debug.c                | 116 ++++++----------------------
 target/xtensa/dbg_helper.c          |  19 ++---
 target/xtensa/helper.c              |   1 +
 27 files changed, 174 insertions(+), 267 deletions(-)

-- 
2.43.0


