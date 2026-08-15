Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF8AC5DF6D
	for <qemu-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 20:39:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvL8Q-00082G-Of; Sat, 15 Aug 2026 16:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvL8P-00081r-6i
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 16:37:41 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvL8N-00088n-8r
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 16:37:40 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-38d489b6b71so2257485a91.0
 for <qemu-riscv@nongnu.org>; Sat, 15 Aug 2026 13:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786826257; x=1787431057; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ZuciOKOCYHWBKlhHcQ1E1TSyVvA4vJCKA85h2XVJ3IY=;
 b=XGNuk6bYwSDP363ciVd8zdNZ61AVzo82MltR1HtdajajpcZPnopvHAoeKqh5XLMtkt
 OaZ3jOHVoQ6qQZSJgWMvuQ0Sfq5Jd4AiBT2NB/BmEAGS2eGzgEWZE9o5k9GFN3bhsbuu
 PPKYFHXu5MPOy/Hg+a5VL0PGe/Cfscni9rdxc+ICYRwiVQ7EvZEz6yeFdnEHinvRb2ob
 o8I11SYjoRIevernjUPtVKmYr1CIF0zTi6gvXnhdDbruu4QVUFU2FXfNqpnA+tOh1vh5
 8PXOxDTDajYYs28SKun1R9IrWtXT5DcRnOoaZ4lQk1E2fWDxOtld1DmUmUUSDi41ERXX
 JsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786826257; x=1787431057;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ZuciOKOCYHWBKlhHcQ1E1TSyVvA4vJCKA85h2XVJ3IY=;
 b=mqfQZKZ4XBKdZQQEc/P6SWUcQGpwyJR0KWpATRxON66yrf3QwXZSz5zwVN/ansD4ft
 zJC/C1FjPRZOMFIICi4WMt3SsNTT/ANGkJvWIh0zbkwq4HtNb0r+kAz5L8ljKnFFVUWQ
 T1Aeo5nYrqWm3gKZFGDXsrAnKZ21xvsPyyaNKg0vzepO6kUtfIGi7MzOgP41DlDDZjVz
 vsz3GBkeyy7pRPGTshu5o+dizkGGozZYDGHg5Ys0qsg8THmhFJfNmp2DJdD136f/ucaj
 TwQ+7tsI6gVgbUr6Sya2LA+qlFjR5py5XR/IRb9cvK/3LV0cLK2Bs3jO8LzpkCiavDip
 kCKw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrht+qHwbhWN3lEJD6aFwl8aoZ36pZITL6wAt3sqxsU8TQ4fmAZxCQamW5KJPEvhu1//RNgQ9/ShRPZ@nongnu.org
X-Gm-Message-State: AOJu0Yx1sXfELiXt9KtexFXcvBoN1XJyDkQ6znJl2mV7PH2FxqMJ/Emr
 qGr3C2kIa5CYhDVRHDou42HbvBvweDU9CazdfxcJmTBW95oSiBXNwOoZsN794OJJuuet05D9g7U
 umjab
X-Gm-Gg: AR+sD10F+IfVXdpeFVs8Pofg1ebUA4KrN6cGV/XzV7uuY7MiyPw2+StTzQgXIuuwPUH
 lvR8LU8/9LsNmvkiAs//TORP1nzn/5i2LrrZqn+I8TdPb8LcXp4xiwISyGZU1iPf1k8+6/3yl9v
 oYWYY06ePMHxibVP+RjpKnRrHpSIJL6dl9Hu0JKwzqWyLaToNF9ThXmiyxkEUVMsQRVmO1x/Zs1
 Q/lFIOGmiqMVvijcoaqAKGopAUeCoATuzLKojMYoH0gcmuiEvhDqr1748HbfCcyICPUqYT+bCy8
 TvZWS0zyKeDYm76EwcVwa7gK2a14vf+2pMVgycfI1Fd7xqk+UBjckwYIq63ov/2DBym88J16Fsu
 gJ/uykCq2hgYnrVVgTkMGrVP4qzwgpSM1lSRG6exg5Gzk4LflksR9sCs5EMz9hseAhjj7KnNjr8
 cTmCn0PhafGswXONAszpQS8dzL8jrxhi/iHJekoCGVMlqwjYxFetvncK27TREDdaqpik7TKdHm+
 PZyh1btSYjMDRvj+LgV1+n7KaLUiBzS
X-Received: by 2002:a17:90b:3b8c:b0:37d:ee77:78ac with SMTP id
 98e67ed59e1d1-3933bd0c331mr15103998a91.19.1786826257323; 
 Sat, 15 Aug 2026 13:37:37 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-394ea97207fsm7066853a91.1.2026.08.15.13.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 13:37:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC PATCH 00/18] accel/tcg: Change tlb_fill/probe_access to (addr,
 first, last) tuple
Date: Sat, 15 Aug 2026 13:37:12 -0700
Message-ID: <20260815203730.1468365-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

The driver for this RFC is
https://lore.kernel.org/qemu-devel/ce3a48b5-9847-4cc4-a02f-86db497c91ae@linaro.org/

Based-on: 20260815194549.1377505-1-richard.henderson@linaro.org
("[PATCH 00/23] target/riscv: Reorg vector load/store")

But also merged to master, so for avoidance of doubt:
https://gitlab.com/rth7680/qemu/-/commits/tcg-probe

Convert probe_access_full, probe_access_flags, and the backend tlb_fill
hooks, but not (yet) probe_access itself.  I'm less certain about that,
since its uses are (1) less complicated and (2) there's also a path,
which I can't prove isn't used but neither can I find, which avoids
both watchpoints and notdirty pages.

I've tweaked the riscv pmp check to use the new parameters.
The similar Armv8-M code is a bit more complicated to push through,
and I need to study it a bit more.

Thoughts?


r~


Richard Henderson (18):
  target/arm: Imply probe from allocation_tag_mem_probe
  target/arm: Simplify invalid page test in allocation_tag_mem_internal
  target/arm: Return struct from allocation_tag_mem_internal
  target/arm: Generalize probe argument to allocation_tag_mem_internal
  target/arm: Probe second page earlier in allocation_tag_mem_internal
  accel/tcg: Drop fault_size from user-only probe_access_internal
  accel/tcg: Replace size with first/last in probe_access_full
  accel/tcg: Replace size with first/last in probe_access_flags
  accel/tcg: Allow phost to be NULL in probe_access_flags
  accel/tcg: Replace size with first/last in probe_access_internal
  accel/tcg: Replace size with first/last in tlb_fill_align
  accel/tcg: Replace size with first/last in TCGCPUOps.tlb_fill*
  target/riscv: Move PMP_AMATCH_OFF check in pmp_hart_has_privs
  target/riscv: Return bool from pmp_is_in_range
  target/riscv: Use boolean logic in pmp_hart_has_privs
  target/riscv: Recognize watchpoints with first/last
  target/riscv: Pass first/last to get_physical_address_pmp
  target/riscv: Pass first/last to pmp_hart_has_privs

 include/accel/tcg/cpu-ops.h          |  16 +-
 include/accel/tcg/probe.h            |  27 ++-
 target/alpha/cpu.h                   |   2 +-
 target/arm/internals.h               |   5 +-
 target/arm/tcg/mte_helper.h          |  18 +-
 target/avr/cpu.h                     |   2 +-
 target/hppa/cpu.h                    |   5 +-
 target/i386/tcg/helper-tcg.h         |   2 +-
 target/loongarch/tcg/tcg_loongarch.h |   2 +-
 target/m68k/cpu.h                    |   2 +-
 target/microblaze/cpu.h              |   2 +-
 target/mips/tcg/tcg-internal.h       |   2 +-
 target/or1k/cpu.h                    |   2 +-
 target/ppc/internal.h                |   2 +-
 target/riscv/cpu.h                   |   2 +-
 target/riscv/tcg/pmp.h               |   5 +-
 target/s390x/s390x-internal.h        |   2 +-
 target/sh4/cpu.h                     |   2 +-
 target/sparc/cpu.h                   |   2 +-
 target/tricore/cpu.h                 |   2 +-
 target/xtensa/cpu.h                  |   2 +-
 accel/tcg/cputlb.c                   |  91 +++++----
 accel/tcg/user-exec.c                |  20 +-
 semihosting/uaccess.c                |  10 +-
 target/alpha/helper.c                |   2 +-
 target/arm/gdbstub64.c               |  10 +-
 target/arm/tcg/helper-a64.c          |   5 +-
 target/arm/tcg/mte_helper.c          | 273 +++++++++++++++++----------
 target/arm/tcg/sve_helper.c          |  10 +-
 target/arm/tcg/tlb_helper.c          |   5 +-
 target/avr/helper.c                  |   2 +-
 target/hexagon/cpu.c                 |   8 +-
 target/hppa/mem_helper.c             |   6 +-
 target/i386/tcg/system/excp_helper.c |   2 +-
 target/loongarch/tcg/tlb_helper.c    |   3 +-
 target/m68k/helper.c                 |   3 +-
 target/microblaze/helper.c           |   2 +-
 target/mips/tcg/ldst_helper.c        |   4 +-
 target/mips/tcg/system/tlb_helper.c  |   2 +-
 target/or1k/mmu.c                    |   2 +-
 target/ppc/mmu_helper.c              |   2 +-
 target/riscv/tcg/cpu_helper.c        |  53 +++---
 target/riscv/tcg/op_helper.c         |   5 +-
 target/riscv/tcg/pmp.c               |  66 +++----
 target/riscv/tcg/vector_helper.c     |  21 ++-
 target/rx/cpu.c                      |   2 +-
 target/s390x/tcg/excp_helper.c       |   2 +-
 target/s390x/tcg/mem_helper.c        |   4 +-
 target/sh4/helper.c                  |   2 +-
 target/sparc/mmu_helper.c            |   4 +-
 target/tricore/helper.c              |   2 +-
 target/xtensa/helper.c               |   2 +-
 52 files changed, 412 insertions(+), 319 deletions(-)

-- 
2.43.0


