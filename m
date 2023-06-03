Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1D3C77B7A
	for <qemu-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 02:36:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q5H6C-0000JY-AQ; Fri, 02 Jun 2023 22:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H69-0000Hp-Sp
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:34:34 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H65-0004gg-Km
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:34:33 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-25692ff86cdso2203731a91.2
 for <qemu-riscv@nongnu.org>; Fri, 02 Jun 2023 19:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759668; x=1688351668;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LNrixbLD1quRMNEgIizrIMayF2Yoe90LdRAg5aS0aAQ=;
 b=C8JmZqCU7VLXmCWp4P20R365pD9D7yw1h6kHYO5gltWYWLbftAotZNkbIwOcYYfxrH
 4R/r0L8D0U7qDeprFiJ2R0Z4uooLhw3HYbLiwlV6e+zqEai2tgRoU4Wto/V1ZdCpcHb2
 9KVCHwdVp5oG973LE7zCbV2EU4hiIofgaeMJfrxlSYrcS+CXGh0B5QQBRwcwCRAvjv4g
 unTqtME3Ir0jditOSvurhvb+DSHys3UTDRzdfJgiYUKN2f5rQJCKssaHF7GBd9G6auVq
 pB8+UJgqx/6Fm9jPeTJdcY2jMp4hgEUvvRP35tlL1uQA/bsnw3MBkJqxrnaIdBvqisqt
 paBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759668; x=1688351668;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LNrixbLD1quRMNEgIizrIMayF2Yoe90LdRAg5aS0aAQ=;
 b=kVtgKef0NsfuEo+JJpO93BzmAyFgmS17tc8U42Ntc4rGXftiLqZtRPVeYUucKmY2cr
 aB2I/yuYClWnnLCOqRkNkUOcO68/FJQD+bYUIFakEk3c+3RPc5N30QjV+Ud51QHOj8jL
 1T3OQEHGMOxYXtEk14ZorIsANZ/CpBveG8SPVYyfc9IInFt5+4vFT2RVTVX+YAxOY0fe
 8SPlc1GX0u5R6vAJ2PXE71PM6vXZSL3rhzQvq5gNoueaHA4K0eG7FDvgNClvTdhvuTyC
 WftSBOQLHlLSx3hdBV7gN4Ns/VR0S12iAN2+DUTGnY+fXG9vhBJtKdgnW/PRgNJBlOlt
 yUGQ==
X-Gm-Message-State: AC+VfDx5ugZbVcZ4EwCYUigwhUpZ5Als87xgGq6NV3I5BRwdNtRjlSSG
 yF+rv80DwRCEtHxiptt2jEJYWw==
X-Google-Smtp-Source: ACHHUZ7i+OPyExYXB6oyYzzYIXvHPwzOFGvPoMmnEYCziotWOqknu0FmNW/ITNk7kIBTXltChgUn5g==
X-Received: by 2002:a17:90a:578a:b0:252:dd86:9c46 with SMTP id
 g10-20020a17090a578a00b00252dd869c46mr1690691pji.31.1685759667840; 
 Fri, 02 Jun 2023 19:34:27 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 00/35] crypto: Provide aes-round.h and host accel
Date: Fri,  2 Jun 2023 19:33:51 -0700
Message-Id: <20230603023426.1064431-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Inspired by Ard Biesheuvel's RFC patches for accelerating AES
under emulation, provide a set of primitives that maps between
the guest and host fragments.

There is a small guest correctness test case.

I think the end result is quite a bit cleaner, since the logic
is now centralized, rather than spread across 4 different guests.

Further work could clean up crypto/aes.c itself to use these
instead of the tables directly.  I'm sure that's just an ultimate
fallback when an appropriate system library is not available, and
so not terribly important, but it could still significantly reduce
the amount of code we carry.

I would imagine structuring a polynomial multiplication header
in a similar way.  There are 4 or 5 versions of those spread across
the different guests.

Anyway, please review.


r~


Richard Henderson (35):
  tests/multiarch: Add test-aes
  target/arm: Move aesmc and aesimc tables to crypto/aes.c
  crypto/aes: Add constants for ShiftRows, InvShiftRows
  crypto: Add aesenc_SB_SR
  target/i386: Use aesenc_SB_SR
  target/arm: Demultiplex AESE and AESMC
  target/arm: Use aesenc_SB_SR
  target/ppc: Use aesenc_SB_SR
  target/riscv: Use aesenc_SB_SR
  crypto: Add aesdec_ISB_ISR
  target/i386: Use aesdec_ISB_ISR
  target/arm: Use aesdec_ISB_ISR
  target/ppc: Use aesdec_ISB_ISR
  target/riscv: Use aesdec_ISB_ISR
  crypto: Add aesenc_MC
  target/arm: Use aesenc_MC
  crypto: Add aesdec_IMC
  target/i386: Use aesdec_IMC
  target/arm: Use aesdec_IMC
  target/riscv: Use aesdec_IMC
  crypto: Add aesenc_SB_SR_MC_AK
  target/i386: Use aesenc_SB_SR_MC_AK
  target/ppc: Use aesenc_SB_SR_MC_AK
  target/riscv: Use aesenc_SB_SR_MC_AK
  crypto: Add aesdec_ISB_ISR_IMC_AK
  target/i386: Use aesdec_ISB_ISR_IMC_AK
  target/riscv: Use aesdec_ISB_ISR_IMC_AK
  crypto: Add aesdec_ISB_ISR_AK_IMC
  target/ppc: Use aesdec_ISB_ISR_AK_IMC
  host/include/i386: Implement aes-round.h
  host/include/aarch64: Implement aes-round.h
  crypto: Remove AES_shifts, AES_ishifts
  crypto: Implement aesdec_IMC with AES_imc_rot
  crypto: Remove AES_imc
  crypto: Unexport AES_*_rot, AES_TeN, AES_TdN

 host/include/aarch64/host/aes-round.h   | 204 ++++++
 host/include/aarch64/host/cpuinfo.h     |   1 +
 host/include/generic/host/aes-round.h   |  36 ++
 host/include/i386/host/aes-round.h      | 148 +++++
 host/include/i386/host/cpuinfo.h        |   1 +
 host/include/x86_64/host/aes-round.h    |   1 +
 include/crypto/aes-round.h              | 158 +++++
 include/crypto/aes.h                    |  30 -
 target/arm/helper.h                     |   2 +
 target/i386/ops_sse.h                   |  64 +-
 target/arm/tcg/sve.decode               |   4 +-
 crypto/aes.c                            | 808 ++++++++++++++++--------
 target/arm/tcg/crypto_helper.c          | 245 +++----
 target/arm/tcg/translate-a64.c          |  13 +-
 target/arm/tcg/translate-neon.c         |   4 +-
 target/arm/tcg/translate-sve.c          |   8 +-
 target/ppc/int_helper.c                 |  58 +-
 target/riscv/crypto_helper.c            | 142 ++---
 tests/tcg/aarch64/test-aes.c            |  58 ++
 tests/tcg/i386/test-aes.c               |  68 ++
 tests/tcg/ppc64/test-aes.c              | 116 ++++
 tests/tcg/riscv64/test-aes.c            |  76 +++
 util/cpuinfo-aarch64.c                  |   2 +
 util/cpuinfo-i386.c                     |   3 +
 tests/tcg/multiarch/test-aes-main.c.inc | 183 ++++++
 tests/tcg/aarch64/Makefile.target       |   4 +
 tests/tcg/i386/Makefile.target          |   4 +
 tests/tcg/ppc64/Makefile.target         |   1 +
 tests/tcg/riscv64/Makefile.target       |   4 +
 29 files changed, 1776 insertions(+), 670 deletions(-)
 create mode 100644 host/include/aarch64/host/aes-round.h
 create mode 100644 host/include/generic/host/aes-round.h
 create mode 100644 host/include/i386/host/aes-round.h
 create mode 100644 host/include/x86_64/host/aes-round.h
 create mode 100644 include/crypto/aes-round.h
 create mode 100644 tests/tcg/aarch64/test-aes.c
 create mode 100644 tests/tcg/i386/test-aes.c
 create mode 100644 tests/tcg/ppc64/test-aes.c
 create mode 100644 tests/tcg/riscv64/test-aes.c
 create mode 100644 tests/tcg/multiarch/test-aes-main.c.inc

-- 
2.34.1


