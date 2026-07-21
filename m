Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6455CC44529
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 12:20:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wm9Sq-0001yD-5e; Tue, 21 Jul 2026 08:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1wm9So-0001xf-Sz
 for qemu-riscv@nongnu.org; Tue, 21 Jul 2026 08:20:46 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1wm9Sk-0003mS-HH
 for qemu-riscv@nongnu.org; Tue, 21 Jul 2026 08:20:46 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-cbb8b54fcf8so36078a12.0
 for <qemu-riscv@nongnu.org>; Tue, 21 Jul 2026 05:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1784636440; x=1785241240; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=XXIhvTqq9Eipcf9U4LdfAxixy8SIppPnstIw922mqg4=;
 b=SOsmK6ITznqW74AO2czBgJuPvJ9+mLNATGncLjrtv9yZ2x7YtA+bb9rmnN1UZrJ3JY
 eQnN6IDMdzh5AShZJg3YwCeRj0XKR1j0ABAgdl6g3BhrRFTOU2JYaciQEs8WKbtqGLlt
 cYY4j8p8ILiMCEjoQ2wI47Q5KNoVPX958BX1kxMmdiJQOhrzcg1jxwHB34c0lSwwwwZt
 3w83OOwn52YRz6OUfXQW3MhKmIsqLvvAnaK1wBYzc/pKIso0ak/skmRZTDgRUZs6Pak7
 UcMmhI+yah7YxxmQxoKSbx2ggNR4DhzC6hifQANAiYXl5Da1lRZ1zEzfw3mOtriOi7x9
 O2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784636440; x=1785241240;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XXIhvTqq9Eipcf9U4LdfAxixy8SIppPnstIw922mqg4=;
 b=WBYhBJcmKGIJtnL7e5URkzY0PTGKf6Cx7niP4PaoS6gi7o/8ujirVgLW1YLytaFLTM
 RhkNovFgLs4xu6L4bAzw/PXFJsrPAdBmLVpvAmogm6REEwIdL00vJsWFjbNhXtwG0jZ8
 Z4iTJRfhtfbE8XihalKIdKlSkoCU9+wiloMIkpHch+mmK6ydBQoaHyLnpKKqC2WP3xET
 gAzED1NNL9TXyueBQEFvDDnRY2dPrG/+d3QvepVW+8HDEpWqZlNpqA/0ox/dSh/R3NeA
 tlwj0b8bCw6eLsSSXENLD5D2G+qFtyRekAeaNhYj1o1mFSu+xSVfWem0mdJaznC8kYGh
 2dqA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rou5QXddLYyN/58EdYRmpSIcVrCk8RMlEeigzqiYrLgUDIkcZH0Z5VlHacV2LqCr0PDUd/BNV4FUt3/@nongnu.org
X-Gm-Message-State: AOJu0YxLr33jlDTpwGjVLAaY/yLXCe7jk0uQbd0/xX7TzWdHJeVRGRqk
 a07+troKJFZrqB+5lAeQ2TOSt8UCGJ7EPXs5zaUVkOnlBNOgJ2uxAIob+TXMNODOUlg=
X-Gm-Gg: AfdE7cmh635gWTCUDj4PSwmTcb0WDwtVilZtdxWSbFSi4y1q+SwiLY4TA9Mc/onuJDu
 Y81s8WI3kJfYq7LUm5cAGK+P+R7iKjK4z5hBQ6uop/OBhi4DTiszlEjvf1fmbIW1HSmc02JCdVa
 QlQsTArXcCekC+YnkhYt0qE5P1Phxkpco+Z9uhE91PDxz905uG0rWy5iEAvJfpFz0gjgkmGxNVV
 LVRwTiCiQJoynEiAnLpNsJE09qTV7Cxs9eyG2NT4B4X5vog7dQqAfRoqxPeX8UEPIHwjKRyfG0u
 cRZTuD1xsRq0yVhsiTaqjc8dGIIMBb4Th84Qty1vYaAWuu587BOPRN1v0bGY2XVJtXjkopAWjXc
 lgDEMq2cMh4Sb416YOratqzXxnfO5N7xY5GzP4GB5WDec3ID4iCaQxoGowli26IFVJEgVrfy6KP
 +SdBDHF5EukSiPb5bl3JSv+OF1+07OX8LlToTZzawAiXIG2hFLREgjAFwmScUbXahf88jXcUEOy
 yCH3Q==
X-Received: by 2002:a05:6a20:9397:b0:3c3:83e8:c211 with SMTP id
 adf61e73a8af0-3c3ada1fe89mr19704643637.63.1784636440444; 
 Tue, 21 Jul 2026 05:20:40 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cb517aad95dsm5904568a12.7.2026.07.21.05.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 05:20:40 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Subject: [PATCH 0/5] target/riscv: Add SiFive Xsfvqmaccdod/Xsfvqmaccqoq int8
 matmul extensions
Date: Tue, 21 Jul 2026 20:20:28 +0800
Message-ID: <20260721122034.1567146-1-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=max.chou@sifive.com; helo=mail-pg1-x534.google.com
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

This patchset adds SiFive's custom int8 matrix-multiply vector
extensions Xsfvqmaccdod and Xsfvqmaccqoq. Each extension provides 4
signedness variants (unsigned/unsigned, signed/signed,
unsigned/signed, signed/unsigned) for a total of 8 instructions:
sf.vqmacc{u,,us,su}.{4x8x4,2x8x2}.

The toolchains support Xsfvqmaccdod/Xsfvqmaccqoq extensions:
 - LLVM 18.1.0
   - llvm/llvm-project#68295, commit d1985e3d1fed, merged 2023-10-20.
   https://github.com/llvm/llvm-project/pull/68295
 - GCC 15
   - commit 139bd3198a73 ("RISC-V: Add the mini support for SiFive extensions"), 2024-11-17.

References:
 - SiFive Int8 Matrix Multiplication Extensions Specification
   https://www.sifive.com/document-file/sifive-int8-matrix-multiplication-extensions-specification

Frank Chang (2):
  target/riscv: Add SiFive custom int8 matmul extension implied rules
  target/riscv: rvv: Add SiFive custom int8 matmul instructions

Jason Chien (1):
  disas/riscv: Add disassembler support for Xsfvqmaccdod/Xsfvqmaccqoq

Max Chou (2):
  target/riscv: Add cfg property for SiFive int8 matmul extensions
  tests/tcg/riscv64: Add tests for SiFive int8 matmul extensions

 MAINTAINERS                                 |   9 +
 disas/meson.build                           |   3 +-
 disas/riscv-xsf.c                           |  79 ++++++
 disas/riscv-xsf.h                           |  18 ++
 disas/riscv.c                               |   2 +
 disas/riscv.h                               |   1 +
 target/riscv/cpu.c                          |  21 ++
 target/riscv/cpu_cfg.h                      |   5 +
 target/riscv/cpu_cfg_fields.h.inc           |   2 +
 target/riscv/helper.h                       |  10 +
 target/riscv/meson.build                    |   1 +
 target/riscv/tcg/insn_trans/trans_xsf.c.inc |  98 ++++++++
 target/riscv/tcg/tcg-cpu.c                  |  16 ++
 target/riscv/tcg/translate.c                |   3 +
 target/riscv/tcg/vector_helper.c            |  74 ++++++
 target/riscv/xsf.decode                     |  30 +++
 tests/tcg/riscv64/Makefile.softmmu-target   |   7 +
 tests/tcg/riscv64/test-xsfvqmacc.S          | 260 ++++++++++++++++++++
 18 files changed, 638 insertions(+), 1 deletion(-)
 create mode 100644 disas/riscv-xsf.c
 create mode 100644 disas/riscv-xsf.h
 create mode 100644 target/riscv/tcg/insn_trans/trans_xsf.c.inc
 create mode 100644 target/riscv/xsf.decode
 create mode 100644 tests/tcg/riscv64/test-xsfvqmacc.S

-- 
2.55.0


