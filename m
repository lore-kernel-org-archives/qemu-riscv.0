Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECCCC5AD2C
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 01:34:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wssQB-0000Hm-Rz; Sat, 08 Aug 2026 21:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wssQA-0000Go-7T
 for qemu-riscv@nongnu.org; Sat, 08 Aug 2026 21:33:50 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wssQ7-0002FG-83
 for qemu-riscv@nongnu.org; Sat, 08 Aug 2026 21:33:49 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-39266382df6so766004a91.3
 for <qemu-riscv@nongnu.org>; Sat, 08 Aug 2026 18:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786239225; x=1786844025; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=v0FyagFrGkfBHkmCNDww1GehkD91RAc2FVyJ6d+h1z4=;
 b=vPly/DzaKMdAu/OtSIwWszJYbfmaJlyPfFfJCklzvy0tE0UvAH+bzHyUH0u77b1CmS
 HNRnGdg6BmpbmxydOJkdcRKvOY0psKna9/H+pVz1tkqRiCvr0bXsEFbDXGqrg6YL5XPx
 lWoV0t85TJDeX4zXwAGWnKEx2o4c+3oXfILO56QcVi2uXTU/oaQL3HgE4A8ZfJSNwv32
 rQkGQ7Gpqhxn64LJTyV6jHRLbv7sUr6Vb7GzP+JdRffJiXnL41qQREzIp42duDRqMrZk
 c2peIHhIp2mDIYYQPhdBipPkpiWfhfg7nImENKjml4vQbM2UfP+gXvkthdc3h3aGUgnY
 D/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786239225; x=1786844025;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=v0FyagFrGkfBHkmCNDww1GehkD91RAc2FVyJ6d+h1z4=;
 b=WMtNs/EygKfKef9CRtyAPNdr/KSAmJPIVMvd8iLqGnAezGsTHTZYCdl8JtUtks5pv2
 YPcXQ1LMdP6m9bfkFPSM9ucmDeIq2TfWEzBbtDoYhF2ONRT9JnAcgLemHtl1cW4Kv9Pi
 znT9U3cCoyLYsgCIO5o84Bpv5ZqSJKSKW3OOm6s/wwcWDZQpKCE62VMYNgwdq0MRxPGg
 RBk/4N+hzAPDtM+NMvgBDy6zadhS8rf4HpomqGMgxaaZPG5QGCvxnwRTG1i7J7YXhbwS
 kaRSljXwfzGK/JSzjl1NV+5wnpdDi4TiXRTfsdkTtwaWf2dzRtnoKDDLmrMqBDt2V7dU
 KcIg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpGTJGDYgtH5uu7XBCB2zLL4L4RD6FRtL1p+4dbFQszqH5+mUNehW6OGjIt0V4S4j30o6eJKpa+n6px@nongnu.org
X-Gm-Message-State: AOJu0Yzw4+RUvIlEQUlyUK59HP5oDX73oJxE/kVWXw51NC3y9EDoAOiW
 D9KV3LtKyBfnL1goAbPT38aEZRbQ9GKzdhQWCcOPp+/DNophdM6aMZcv/4FSdB5FN68=
X-Gm-Gg: AR+sD12IsARLJFVT7ItvJDuibcIClXUzYEsy9HocU0LCMqQFgxme3sPoFRGpyjISZlb
 rfLQTnRIxCZ6TZObbQWDmcsuCWofh1TxOW02ceLVat3+S8mh7TS5baJb5ZLzxhRAlNVNhJLH4zg
 oomqZix0k1VtShli6UX8FCXs0rvlPKZs2UErGD6U7uhDrbbnMgznb6qqR3fI5OMZ1XPwRUfJzSU
 ow8SETJExKF0YVMdwc6yqIrho5Uq+Craw8TVUMpgNc+KC0534RGBixEU5Ai2UYOL0eYx8Kl3HRm
 +m8tGxxjioqHPeMZFxjtZXv/+sPJSFfpOU+Kqc2A61fmigrmO1Xj6hqIq1WqNyxkajb/z3ubk6Y
 HBApSLA6WVvflw7806hzcYYGoj8MF97fyi8UcZd/zu8xgEaURw+K0vIN3GNAcNb+mvvLOhcGnfh
 FzIe2ooaQfQqTzLUsYY0Y9DETgyRRM0GO5djPMwD0lj0kPbCGbsCankOxJQxHDHw4p8g9NCelGH
 72CQN73zk37bfSVDzYiNkaA5IE4Td4=
X-Received: by 2002:a17:90b:2d44:b0:38e:63de:730d with SMTP id
 98e67ed59e1d1-3903c598974mr33826777a91.3.1786239225292; 
 Sat, 08 Aug 2026 18:33:45 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39085de8ddcsm10067927a91.6.2026.08.08.18.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Aug 2026 18:33:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: 17746591750@163.com, laurent@vivier.eu, philmd@mailo.com,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH 0/9] disas: Updates for capstone v6
Date: Sat,  8 Aug 2026 18:33:34 -0700
Message-ID: <20260809013343.664966-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Capstone v6-alpha10 is coming along nicely, and may be able
to replace some of the other disassemblers that we have.

Some targets (alpha, hppa, xtensa) that v6 purports to support
are still in terrible shape.  At least for alpha and hppa that
is presumably because the LLVM support that these claim to be
derived from is not yet in upstream LLVM.


r~


Richard Henderson (9):
  target/riscv: Improve riscv_has_ext
  disas/capstone: Allow for cap_insn_unit > length
  target/riscv: Enable disassembly via capstone
  target/sh4: Enable disassembly via capstone
  target/tricore: Enable disassembly via capstone
  target/loongarch: Enable disassembly via capstone
  target/s390x: Update capstone disassembly to v6
  target/m68k: Enable disassembly via capstone
  target/mips: Enable disassembly via capstone

 include/disas/capstone.h | 115 +++++++++++++++++++++++++++++++++++++--
 target/riscv/cpu.h       |   2 +-
 disas/capstone.c         |  29 +++++++++-
 target/loongarch/cpu.c   |   8 +++
 target/m68k/cpu.c        |  65 +++++++++++++++++++++-
 target/mips/cpu.c        |  60 ++++++++++++++++++--
 target/riscv/cpu.c       |  81 ++++++++++++++++++++++++++-
 target/s390x/cpu.c       |   4 +-
 target/sh4/cpu.c         |  14 +++++
 target/tricore/cpu.c     |  31 +++++++++++
 10 files changed, 393 insertions(+), 16 deletions(-)

-- 
2.43.0


