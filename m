Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31040C98318
	for <qemu-riscv@archiver.kernel.org>; Sat, 26 Sep 2026 11:09:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xAQGe-0007z5-7w; Sat, 26 Sep 2026 07:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAQGd-0007yp-2c
 for qemu-riscv@nongnu.org; Sat, 26 Sep 2026 07:08:31 -0400
Received: from mail-dl2-x10.google.com ([2607:f8b0:4864:38::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAQGb-0002j8-B2
 for qemu-riscv@nongnu.org; Sat, 26 Sep 2026 07:08:30 -0400
Received: by mail-dl2-x10.google.com with SMTP id
 a92af1059eb24-142dd04be84so2042503c88.3
 for <qemu-riscv@nongnu.org>; Sat, 26 Sep 2026 04:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790420908; x=1791025708; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=iTUw37RZ2rQmplsSv2IkOJUv3J4TNp7i7p/qBLIspCY=;
 b=p9sHDE4TVkklut+T64U6+tfvMRg7rvGsQ3Mu0ueFodeEs2mKfizRJubQ6LCg1VGqM/
 aYcZGKcsJCKPNDi8Uqh+vhuhWekng0lf8a4ASqkdMJfJFIVEe7ZOBAg28VadHxmbjVvT
 /cYGmozZboWC7GiD0SP+ikR6CRGgap5akElyGV4qSRn4cHy/lj6sZCaFtL0hMWGzjIia
 hxOuVl4FBSSXU2o5ofEBtS0X0PydRP9RCaOp420Mkkah3SticdsCWsw/GBZYVuceNVlf
 w86X7S7tsCDbPn0gWzsM6ji4eo4kNZfAIk+syfAWkJg2w9dKU4ZCoYq5eu0EtQ4uHLBZ
 Gxag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790420908; x=1791025708;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=iTUw37RZ2rQmplsSv2IkOJUv3J4TNp7i7p/qBLIspCY=;
 b=dM9+Phrar9SIIVn6qLZl8r7KG3YXhMgTU2UUJ1dJ9itS4GBRl+6UA0DPK1C4/Cbd39
 nhWLiwY61y4yJ+O+leZR0nlJVoG4TwJp7QjzWYGCbF4gnodCAqjDRVdkyOlY2S6sk+wx
 tf4zuO4MDg7hTZ2veqjovCSh1LP2upbBG4kQRQu1GU4GqdOgiI2Kep7+dO+ZnbZQL4Ak
 9zHq3yHGFi0axtUkzilVgxGWh9PXn154BfqzheVRZBxFy67T0GRiFRe3TjSCLILHLP1Q
 LEBwAHxyTzfRcRwQT847BBTS6CBRagblabYdH6mnocVkhL8WklUsETHtiqKFiGVPMB9H
 J/fw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxuwi42fGiPt+bFV7cVGC77Ij7lpwy+PuMRx+eqxzlI3QUE9a5r5scKGVMQHKvtxBSNbEzvVFYp3Reh@nongnu.org
X-Gm-Message-State: AFuF++nIHBaJXMAqjYntk4fM31AnG5qIony9/QwP0Uh5wHQmWL9Cg76Q
 foNp/bKVa4Kezlx5TCVmzJ5AFBBKUG2q8MCyiQs3tY0YPIhEj/RCAU5O
X-Gm-Gg: AYBFou2caEi/xtjyY5nGF8bj4248K1tN9mCev+sHw8cFOD+oBhHP321b+3CD5jMvEQO
 /430ZaL/Jl7sz81WlagyH+qV+dGohaeIGdGSZLxx1KCrYPZeDWKTIyAhr83IV5f4ocwW4G+Cj/x
 84hjflPWioG/Iqjs5Tr9YSCp1aYmiKcRkFaR7ynUrfcmbVX5gXZpUBfFPMaw55MAY3Y6eSjmSho
 WyQa9Khd/P9qKDYpOyuEwSZ0zMPlmNICB+ayVa9zEgFOltcBVcF5t798hGX29S5/G47bI58fqCK
 1Mwi69CF/D9lQ0nlN2VVpPZLLA8RYxtcdwRWf9a5qY51tUHAG4URS+r5YhMfWM5MKgOUvm0Or46
 69msh/VApoVJJE2rXWG2SBV097oVfYK/I2rwfRCuWD4BJofRqZ5Sf4QkgzyTPfynRsLoY956UQg
 TJkF7w9pjZIcZG2nWOLS/THRHKTag0QfWdtSAeuxPVKGEWIUam882S2ubMzHDKDtRHjisSCSSCP
 cccRU4DlitR/ncunMr9CLEmv0H9tQJJOPk7t+DnZw==
X-Received: by 2002:a05:7022:2606:b0:12d:d972:b96e with SMTP id
 a92af1059eb24-146ce67f6cfmr3491660c88.20.1790420907465; 
 Sat, 26 Sep 2026 04:08:27 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-145a7318afcsm11414045c88.0.2026.09.26.04.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 04:08:26 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Brian Cain <brian.cain@oss.qualcomm.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Song Gao <17746591750@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Philippe Mathieu-Daude <philmd@mailo.com>, Ani Sinha <anisinha@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Chao Liu <chao.liu@processmission.com>, Weiwei Li <liwei1518@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH 0/9] treewide: uniquify colliding helper symbols
Date: Sat, 26 Sep 2026 19:08:08 +0800
Message-ID: <20260926110818.1912-1-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::10;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

A combined qemu-system binary cannot export the same C symbol from two targets.
This series prefixes TCG helpers and virt ACPI setup functions that still use a
short name another target already exports.

- Prefix leftover i386 TCG raise_exception to i386_raise_exception. Rename the C
  raise_exception family globals to i386_raise_exception*, and keep the short
  names as static inline wrappers in helper-tcg.h. Wrappers still call
  raise_interrupt2.
- Prefix helper_wait on RX, Hexagon, and MIPS. Hexagon also takes the resume PC
  as vaddr.
- Prefix ARM raise_exception to arm_raise_exception and keep the short name as a
  static inline wrapper.
- Prefix virt_acpi_setup and virt_is_acpi_enabled on ARM, RISC-V, and LoongArch
  virt. Leave the ARM trace event virt_acpi_setup unchanged. Leave RISC-V
  file-local virt_acpi_build* names unchanged.
- Rename RISC-V TCG crc32, crc32c, and wfi to riscv_crc32, riscv_crc32c, and
  riscv_wfi. ARM already exports helper_crc32, helper_crc32c, and helper_wfi.

Yonggang Luo (9):
  target/i386: convert raise_exception to i386_raise_exception
  target/rx: rename helper_wait to helper_rx_wait
  target/hexagon: rename helper_wait to helper_hexagon_wait
  target/arm: rename raise_exception to arm_raise_exception
  target/mips: rename helper_wait to helper_mips_wait
  hw/arm/virt: prefix ACPI helpers with arm_virt_
  hw/riscv/virt: prefix ACPI helpers with riscv_virt_
  hw/loongarch/virt: prefix ACPI helper with loongarch_virt_
  target/riscv: uniquify TCG crc32, crc32c, and wfi helper names

 hw/arm/virt-acpi-build.c                      |  4 +-
 hw/arm/virt.c                                 | 12 +++---
 hw/loongarch/virt-acpi-build.c                |  6 +--
 hw/loongarch/virt.c                           |  2 +-
 hw/riscv/virt-acpi-build.c                    |  2 +-
 hw/riscv/virt.c                               |  6 +--
 include/hw/arm/virt.h                         |  4 +-
 include/hw/loongarch/virt.h                   |  2 +-
 include/hw/riscv/virt.h                       |  4 +-
 target/arm/internals.h                        | 27 ++++++++----
 target/arm/tcg-stubs.c                        |  4 +-
 target/arm/tcg/op_helper.c                    | 10 ++---
 target/hexagon/gen_tcg_sys.h                  |  2 +-
 target/hexagon/helper.h                       |  2 +-
 target/hexagon/op_helper.c                    |  8 ++--
 target/i386/helper.h                          |  2 +-
 target/i386/tcg/excp_helper.c                 | 18 ++++----
 target/i386/tcg/helper-tcg.h                  | 42 +++++++++++++++----
 target/i386/tcg/translate.c                   |  2 +-
 target/mips/helper.h                          |  2 +-
 target/mips/tcg/exception.c                   |  2 +-
 target/mips/tcg/translate.c                   |  2 +-
 target/riscv/helper.h                         |  6 +--
 target/riscv/tcg/bitmanip_helper.c            |  4 +-
 .../tcg/insn_trans/trans_privileged.c.inc     |  2 +-
 target/riscv/tcg/insn_trans/trans_xlrbr.c.inc |  4 +-
 target/riscv/tcg/op_helper.c                  |  2 +-
 target/rx/helper.h                            |  2 +-
 target/rx/op_helper.c                         |  2 +-
 target/rx/translate.c                         |  2 +-
 30 files changed, 115 insertions(+), 74 deletions(-)

-- 
2.52.0.windows.1


