Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC668C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 00:29:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rMzxI-0001TZ-Do; Mon, 08 Jan 2024 19:26:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1rMzxG-0001Sf-St
 for qemu-riscv@nongnu.org; Mon, 08 Jan 2024 19:26:54 -0500
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1rMzxC-0001ZR-F0
 for qemu-riscv@nongnu.org; Mon, 08 Jan 2024 19:26:53 -0500
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-204e1203a22so1321218fac.1
 for <qemu-riscv@nongnu.org>; Mon, 08 Jan 2024 16:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704760006; x=1705364806;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ApE7CLYzLqgoD1C9KPKGqQyHZO2Lh1Vk/eQTUlTrEVg=;
 b=HwCh7HbKz7eCm1GM3+uKqEFe8DiRyD2Zv7F7ecW+4jXJIvz9OmJxengcWgNEkhsUrg
 Q+5to87d5Iawydf/gDOFr4Rl3PJv2NheFWFGPY86k4X4x6oikzYJPPRHOhe0Uk7fmoAQ
 on0b5o5wVAtAPm4ASk5vqyvtotKpD5/A3IMDfGwPLAaOYwq+xjF3PnQyTdFjCaGbRAf2
 uE7e/tPjyZ+ndmN0i17LGmOZkl/7Gd3yeiRvpinZZviNBB1VAD3m7Jr6e7HDDo+5GcS8
 fnfPhez0VE9FlscPoai2k0+3+OabLc5URAX+thhMYfwMHuiuVoHt5kUmg0C+0excV9EI
 owIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704760006; x=1705364806;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ApE7CLYzLqgoD1C9KPKGqQyHZO2Lh1Vk/eQTUlTrEVg=;
 b=H4zQEWltwTSDgB+CYD34OII654n8Cb+AXcAa3t0ycC854DxbHrAHxhfIv+tM67JrPh
 2hPQfM1iAOnwQQwsmGauaGV3eJJPTVjMAud3TD/p1U/EgLT8EoTUykaSdj1UgBamel8/
 PrZ4jPKAO+RmliiWe8yX7L76cr7rBu4v1l0ycbXn2a3tr86LTgAJPX907nA1RFPZpmte
 fLU74LPoUyomNg2iZ+LD04RNbFqxD+mVoJs4k00JYJhnmA/8q7OuYuNFNXUzkvmxH4ML
 1Z5s8NsJznHiuSvXXjE3MQ8KfvUXHc7HQtwOzQBXe2+ndj3TrhOs/qW/s6dgSs4GwLn3
 HxLA==
X-Gm-Message-State: AOJu0YzaAsN4gcAGu7yBRtOVF0v3oz4paLbxupwAA3HWO5K8pHYISoFu
 uTv2aR5fojlXYusDDR6eOXliCIEvYoQNUg==
X-Google-Smtp-Source: AGHT+IGiGYOS68NrDaZ9vJBFDY275Xb6E7550V7MOeD+OAG1hhB0pqmwlOw8AYfQoTIDgsZ53tlydQ==
X-Received: by 2002:a05:6870:4611:b0:1fb:75b:99ba with SMTP id
 z17-20020a056870461100b001fb075b99bamr5477105oao.105.1704760006434; 
 Mon, 08 Jan 2024 16:26:46 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 wp12-20020a056871a9cc00b002042cafdc52sm219917oab.2.2024.01.08.16.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 16:26:46 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: 
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 kaiwenxue1@gmail.com
Subject: [PATCH v4 0/5] Add ISA extension smcntrpmf support 
Date: Mon,  8 Jan 2024 16:25:49 -0800
Message-Id: <20240109002554.646572-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=atishp@rivosinc.com; helo=mail-oa1-x35.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

Changes from v3->v4:
1. Fixed the ordering of the ISA extension names in isa_edata_arr.
2. Added RB tags.

Changes from v2->v3:
1. Fixed the rebasing error in PATCH2.
2. Added RB tags.
3. Addressed other review comments. 

Changes from v1->v2:
1. Implemented actual mode filtering for both icount and host ticks mode.
1. Addressed comments in v1.
2. Added Kevin's personal email address.

[1] https://github.com/riscv/riscv-smcntrpmf
[2] https://github.com/atishp04/qemu/tree/smcntrpmf_v3

Atish Patra (2):
target/riscv: Fix the predicate functions for mhpmeventhX CSRs
target/riscv: Implement privilege mode filtering for cycle/instret

Kaiwen Xue (3):
target/riscv: Add cycle & instret privilege mode filtering properties
target/riscv: Add cycle & instret privilege mode filtering definitions
target/riscv: Add cycle & instret privilege mode filtering support

target/riscv/cpu.c        |   2 +
target/riscv/cpu.h        |  17 +++
target/riscv/cpu_bits.h   |  29 +++++
target/riscv/cpu_cfg.h    |   1 +
target/riscv/cpu_helper.c |   9 +-
target/riscv/csr.c        | 242 ++++++++++++++++++++++++++++++--------
target/riscv/pmu.c        |  43 +++++++
target/riscv/pmu.h        |   2 +
8 files changed, 292 insertions(+), 53 deletions(-)

--
2.34.1


