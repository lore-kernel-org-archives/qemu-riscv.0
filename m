Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A1AC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 00:50:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rJ14L-00074r-2a; Thu, 28 Dec 2023 19:49:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1rJ14I-000736-4B
 for qemu-riscv@nongnu.org; Thu, 28 Dec 2023 19:49:42 -0500
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1rJ14F-0003XZ-3e
 for qemu-riscv@nongnu.org; Thu, 28 Dec 2023 19:49:41 -0500
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-204ec50010eso767507fac.3
 for <qemu-riscv@nongnu.org>; Thu, 28 Dec 2023 16:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703810978; x=1704415778;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gvkcXGMKJhei6A4C5VxcjXDsgHP4Nqs2chK3cpMCHlw=;
 b=q0abwfHTdGdCr8XVdlXfgvRhcjSOYj2kF/nKq2w35Gwr0fZsXzBK+rKPXsa0PL1Ci8
 V8WCf8lxy1/0z2BT0ofsZzXm72BOOqlvN0e2gTAHeNM/uL4rh27+AwGy7nqint+stV1f
 X703vEoBWbXX7UhI5pGZvwwBjJ62XkHM7YbE1swB55c3dnDwssnfK8rexPYbOWPWV8DL
 dgp/6/33lqtTLMJ4L9RQPy7ggoTcq4AvgfkYvxwwIGzXTbSY2nUUDVNW1F6U5Di675Ah
 qhY76KSx+iHywD2dG1us5/nKd82h0jgKGo0YjGgc1tVbc2+0psBheSlsQkuAUpKT6r7L
 RVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703810978; x=1704415778;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gvkcXGMKJhei6A4C5VxcjXDsgHP4Nqs2chK3cpMCHlw=;
 b=jknYN02InNT5VFUg3EKuQs6WLZTBhL3yK401dLKVqGo4Eaue71rljqXZjlOeJdAMf+
 SPlJNKSutqzc/R17/sRKteCbZJ6s4tGKIWOKT+LyktVN+IZTHAjF5q7yY+eIVbf0rgyO
 FY3hp40aQ1tRkKVJEQnc0+rXntz8agnCO8rAMRKxODzGvJVN0B60LxqF2D6JJe8oEVOn
 4xP4eRv6QFMGaoMoqoXzwA6me2RiWCDXmKbianGinBmdS74NrAHidCP7rmXmMV2jpMXa
 mLG5zHRG/f7kfXNiy4sFZb1dotjMn4uIcsCA8F8TQz7JabEw56iakEX5Fe1RK8tSbD9J
 AcKA==
X-Gm-Message-State: AOJu0YxRGttuZEsM11aCJwlm0FCGhxFSA+Bf+1RhRFVSssqMZJOY8o8A
 ocTcfsTu6pflfJ9cqN+LjpKsucBtvkSKMQ==
X-Google-Smtp-Source: AGHT+IFDFsH38N4Fr6QwiwrXJhhnkFArHgjIiNHhews2+8PIMZxLWUatkO2qy50ABGGp+1pglHVwiA==
X-Received: by 2002:a05:6870:7087:b0:204:70b3:97d5 with SMTP id
 v7-20020a056870708700b0020470b397d5mr6922097oae.78.1703810977761; 
 Thu, 28 Dec 2023 16:49:37 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 ms25-20020a0568706b9900b0020463640518sm2636007oab.14.2023.12.28.16.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Dec 2023 16:49:37 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, kaiwenxue1@gmail.com
Subject: [v2 0/5] Add ISA extension smcntrpmf support 
Date: Thu, 28 Dec 2023 16:49:24 -0800
Message-Id: <20231229004929.3842055-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=atishp@rivosinc.com; helo=mail-oa1-x34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This patch series adds the support for RISC-V ISA extension smcntrpmf (cycle and
privilege mode filtering) [1]. It is based on Kevin's earlier work but improves
it by actually implement privilege mode filtering by tracking the privilege
mode switches. This enables the privilege mode filtering for mhpmcounters as
well. However, Smcntrpmf/Sscofpmf must be enabled to leverage this. This series
also modified to report the raw instruction count instead of virtual cpu time
based on the instruction count when icount is enabled. The former seems to be
the preferred approach for instruction count for other architectures as well.

Please let me know if anybody thinks that's incorrect.

The series is also available at


Changes from v1->v2:
1. Implemented actual mode filtering for both icount and host ticks mode.
1. Addressed comments in v1.
2. Added Kevin's personal email address.

[1] https://github.com/riscv/riscv-smcntrpmf
[2] https://github.com/atishp04/qemu/tree/smcntrpmf_v1

Atish Patra (2):
target/riscv: Fix the predicate functions for mhpmeventhX CSRs
target/riscv: Implement privilege mode filtering for cycle/instret

Kaiwen Xue (3):
target/riscv: Add cycle & instret privilege mode filtering properties
target/riscv: Add cycle & instret privilege mode filtering definitions
target/riscv: Add cycle & instret privilege mode filtering support

target/riscv/cpu.c        |   3 +-
target/riscv/cpu.h        |  17 +++
target/riscv/cpu_bits.h   |  29 +++++
target/riscv/cpu_cfg.h    |   1 +
target/riscv/cpu_helper.c |   9 +-
target/riscv/csr.c        | 245 ++++++++++++++++++++++++++++++--------
target/riscv/pmu.c        |  43 +++++++
target/riscv/pmu.h        |   2 +
8 files changed, 295 insertions(+), 54 deletions(-)

--
2.34.1


