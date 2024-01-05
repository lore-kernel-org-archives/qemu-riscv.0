Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C98CC46CD2
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 22:14:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLsRi-0007MX-Kb; Fri, 05 Jan 2024 17:13:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1rLsRh-0007MH-FU
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 17:13:41 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1rLsRf-0000zp-AH
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 17:13:41 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1d4ab4e65aeso6924145ad.0
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 14:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704492817; x=1705097617;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pKgc1bm3Elc9UEvatyj6R+RY4M7L5KCWqFAQsUR/DVc=;
 b=wwQDLpkFalf/pixf1XtFN40SAd6rvsn9Ex6ru6WtH7UN1MAZTU32yhJYTcUzEpN4Gp
 iIFAwu8OnWltF3SKQM/ait9SEoF94fFu54RWx+IHoXkP4M7h82HJvrBQ4q1Eulw3CnF5
 oci/UNOjDIo7wXqCeNUt74wQMjeO8Z5UElYRWkvUyHfRd532UGtQzB7MUOHf6LnqK5wd
 hK/qnGNxJ06Qn7b5ca3gyupvzh/ie3LjPm95FstcCvHYOeJ0EsUxyMMQvrvvXkbIrhic
 6GiAYbDI0Dbz+2yvSQa/XILTAG14raWyrN3OsXUiKlW+ch4LQlGGOx+s7eWv0pwe/QdS
 ZGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704492817; x=1705097617;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pKgc1bm3Elc9UEvatyj6R+RY4M7L5KCWqFAQsUR/DVc=;
 b=i/TtS5fXGLYY5Emj618LBsyM2P0qXhqnm0jn38NXcN3bwzNt2/BazD33S/GcTLM3Gf
 K5ndjN2lUOy3/DKytsUDe3D8PBgH15WD0dEMBDkNthuh1a6uAiumVVabQvnxPF+oyfBf
 4jg/slG7bykonewOS9dM+1EQNYyfYP2LujDI13UQp+h6Qqr+J+7dppzX/w1BVgcU4jZU
 wkwbdlty5PzWCF7ncCEb3+yzt7vJG3oHvyc85skosb4IG0KWJUk7791mHpK+/X41IGM/
 f2Rwrza3uaOcqbEN8D/IKe/BXV7bbtGVvQm8DY3BnB5nPXiEZjgDZ+9WA1q4jLgKqqre
 A+gg==
X-Gm-Message-State: AOJu0Yzu4ChDpDOXrBXuzy1ByMexeRV/TE3m4iVS7JjXypMJJNLsK8YV
 xwDWv2elQiuDNBwg26a9XgGRJaMfis7DXA==
X-Google-Smtp-Source: AGHT+IHixhuY6/fQhbuz0sHYKS1TYneuiDjiSiqh6jeoOlAqwwHWG0GXSa9XpNY6T/5C4qkSbzDj0Q==
X-Received: by 2002:a17:902:b202:b0:1d4:e22f:8424 with SMTP id
 t2-20020a170902b20200b001d4e22f8424mr185608plr.55.1704492817165; 
 Fri, 05 Jan 2024 14:13:37 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a1709029a9600b001d35223d0besm1850524plp.251.2024.01.05.14.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 14:13:36 -0800 (PST)
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
Subject: [PATCH v3 0/5] Add ISA extension smcntrpmf support 
Date: Fri,  5 Jan 2024 14:13:22 -0800
Message-Id: <20240105221327.176764-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x632.google.com
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


