Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE9FEB64DD
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 03:15:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTD8P-0008Q3-O6; Mon, 07 Aug 2023 23:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8O-0008O6-D8
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 23:11:48 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8M-00006p-JR
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 23:11:48 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-686f0d66652so4949746b3a.2
 for <qemu-riscv@nongnu.org>; Mon, 07 Aug 2023 20:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691464304; x=1692069104;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=beXQyTRLGdD+zrgylrsHYTELdRMMXnrVVBuGcJOXCHg=;
 b=iDVMP18rzv9csWNh0WdGZIWaCPqWys/mxgMYr0W1vj2iiEHZhsjWfDozIi+ovBKLoX
 lkK6hFeyxu9BOv5x5CLNiWhIsPU8vduD6z2XaHrfJM6npn+om9dPKIvmCJU/0tB/VTBQ
 2OEc4RQrlNMH2Qzhs/BGRvabkZNxNG/OPQrOl0AvAlwb/qas79DvN8BDwdk/nN6BYAZv
 TcrMHSybUsvHVKYkK2wjCnX7iE9yK3J9/gkQ5j8kX9k9j98aDAlHDgajMWvipLGoRLnH
 RAoWhGvx1zw+tprzQA2lpZGT09axpFLngJnr2/ys/s16f1AG9xPjKkUrgZa2v4jZB2pt
 xSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691464304; x=1692069104;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=beXQyTRLGdD+zrgylrsHYTELdRMMXnrVVBuGcJOXCHg=;
 b=ZpJU44DQzvjF1MBaud97kOk9XsWOZfg+skURLeF4M7tVzXSVK8GhcUveWjCUrRq6tB
 chm9vszXIhGYsVSNiQDfQZQVAIS0B8cmSxORLub0wQM/0qw/gG1gypI5oOWWW+a1scU7
 VQVSk9N5SJS8W/dyU6/8JKablyF2dlGtaJLAzjzYd068mudKoN3QPJWPm1gir4VXi5U+
 vUjlnQjzLluS8lN3zwYD69Umn9+7sdgT2a9KvSBUN0//vw25LCgF7+2ZB3qhjt6iEGW4
 caCadWvAEJ7TCUKuE3bH3BxQfl0VkqEKBpAx1lDA8bCJpBVvZdVic0wAavaJayzOEyP2
 /k0w==
X-Gm-Message-State: AOJu0YyB7gq+B3PzplIKRJYcUlHCQKzPlbPIifPbtHdik0K8inCI9kdR
 ne42li4StOlsiA0k9zA8J1FCAg==
X-Google-Smtp-Source: AGHT+IFY1UNNC7Z5ZNw4sVuvfalGQnnnQH90DfIbJOd0I19n8g2gPOyaJWzBfCME22QH7j3EAkmNXg==
X-Received: by 2002:a05:6a20:549f:b0:12f:bc36:4c67 with SMTP id
 i31-20020a056a20549f00b0012fbc364c67mr14021987pzk.61.1691464304626; 
 Mon, 07 Aug 2023 20:11:44 -0700 (PDT)
Received: from stoup.. ([2602:47:d490:6901:e306:567a:e0a1:341])
 by smtp.gmail.com with ESMTPSA id
 g64-20020a636b43000000b0055bf96b11d9sm5639087pgc.89.2023.08.07.20.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 20:11:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH for-8.2 00/24] tcg: Introduce negsetcond opcodes
Date: Mon,  7 Aug 2023 20:11:19 -0700
Message-Id: <20230808031143.50925-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

Introduce two new setcond opcode variants which produce -1 instead
of 1 when the condition.  For most of our hosts, producing -1 is
just as easy as 1, and avoid requiring a separate negate instruction.

Use the new opcode in tcg/tcg-op-gvec.c for integral expansion of
generic vector operations.  I looked through target/ for obvious
pairings of setcond and neg.


r~


Richard Henderson (24):
  tcg: Introduce negsetcond opcodes
  tcg: Use tcg_gen_negsetcond_*
  target/alpha: Use tcg_gen_movcond_i64 in gen_fold_mzero
  target/arm: Use tcg_gen_negsetcond_*
  target/m68k: Use tcg_gen_negsetcond_*
  target/openrisc: Use tcg_gen_negsetcond_*
  target/ppc: Use tcg_gen_negsetcond_*
  target/sparc: Use tcg_gen_movcond_i64 in gen_edge
  target/tricore: Replace gen_cond_w with tcg_gen_negsetcond_tl
  tcg/ppc: Implement negsetcond_*
  tcg/ppc: Use the Set Boolean Extension
  tcg/aarch64: Implement negsetcond_*
  tcg/arm: Implement negsetcond_i32
  tcg/riscv: Implement negsetcond_*
  tcg/s390x: Implement negsetcond_*
  tcg/sparc64: Implement negsetcond_*
  tcg/i386: Merge tcg_out_brcond{32,64}
  tcg/i386: Merge tcg_out_setcond{32,64}
  tcg/i386: Merge tcg_out_movcond{32,64}
  tcg/i386: Add cf parameter to tcg_out_cmp
  tcg/i386: Use CMP+SBB in tcg_out_setcond
  tcg/i386: Clear dest first in tcg_out_setcond if possible
  tcg/i386: Use shift in tcg_out_setcond
  tcg/i386: Implement negsetcond_*

 docs/devel/tcg-ops.rst                     |   6 +
 include/tcg/tcg-op-common.h                |   4 +
 include/tcg/tcg-op.h                       |   2 +
 include/tcg/tcg-opc.h                      |   2 +
 include/tcg/tcg.h                          |   1 +
 tcg/aarch64/tcg-target.h                   |   2 +
 tcg/arm/tcg-target.h                       |   1 +
 tcg/i386/tcg-target.h                      |   2 +
 tcg/loongarch64/tcg-target.h               |   3 +
 tcg/mips/tcg-target.h                      |   2 +
 tcg/ppc/tcg-target.h                       |   2 +
 tcg/riscv/tcg-target.h                     |   2 +
 tcg/s390x/tcg-target.h                     |   2 +
 tcg/sparc64/tcg-target.h                   |   2 +
 tcg/tci/tcg-target.h                       |   2 +
 target/alpha/translate.c                   |   7 +-
 target/arm/tcg/translate-a64.c             |  22 +-
 target/arm/tcg/translate.c                 |  12 +-
 target/m68k/translate.c                    |  24 +-
 target/openrisc/translate.c                |   6 +-
 target/sparc/translate.c                   |  17 +-
 target/tricore/translate.c                 |  16 +-
 tcg/optimize.c                             |  41 +++-
 tcg/tcg-op-gvec.c                          |   6 +-
 tcg/tcg-op.c                               |  42 +++-
 tcg/tcg.c                                  |   6 +
 target/ppc/translate/fixedpoint-impl.c.inc |   6 +-
 target/ppc/translate/vmx-impl.c.inc        |   8 +-
 tcg/aarch64/tcg-target.c.inc               |  12 +
 tcg/arm/tcg-target.c.inc                   |   9 +
 tcg/i386/tcg-target.c.inc                  | 265 +++++++++++++--------
 tcg/ppc/tcg-target.c.inc                   | 149 ++++++++----
 tcg/riscv/tcg-target.c.inc                 |  45 ++++
 tcg/s390x/tcg-target.c.inc                 |  78 ++++--
 tcg/sparc64/tcg-target.c.inc               |  36 ++-
 35 files changed, 572 insertions(+), 270 deletions(-)

-- 
2.34.1


