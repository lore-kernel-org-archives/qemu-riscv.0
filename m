Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2465BEB64D7
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 11:11:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBZDa-0005sL-Qm; Tue, 20 Jun 2023 07:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDY-0005p1-Jb
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 07:08:12 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDT-00049P-DZ
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 07:08:12 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b47354c658so35680661fa.1
 for <qemu-riscv@nongnu.org>; Tue, 20 Jun 2023 04:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259282; x=1689851282;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D5/vYkPDFLt1l7Tb4jfX3kGecL1wjKktKxnAYE4Wl7w=;
 b=DrFKpuiSuoDaGlmoBvnDuTXfInP2X8Gn1/2CkjfD+VLmZflb1ynXXVkV9untygF2F1
 VnBcZ1aGZhBj5M+I+kxapZsxzcSh0KTnex+KbE/tqCYY5ngslnlfu9c+D1kNFdconI6y
 HfNuqMb6WeM8aOXmB4MsK09xkAaxLNFKhN6u7pbYqJzA8a/OAtH8WHLl7DTdUjNtnvBh
 1Xzjgjfwo/8+AHCS/hxfJPonrPYagTmFqfr96yzxUqc4Qhf3o9bxv65Nnur+6o2Z8gA1
 qMxfrNhjvt+Thl+twJBtC/7lAqZMaqI6CzBl28hi3GnU89zC8bn/oOq8X5XEyrjtGMt1
 eS0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259282; x=1689851282;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D5/vYkPDFLt1l7Tb4jfX3kGecL1wjKktKxnAYE4Wl7w=;
 b=H7pmaYdPt4quBrN5oHvBICCw0Kjaiwyx6XkLks+IJn7JCrcBlAoxpXThCZarOR0qVE
 8brFpaQY2oJr9SQPf0tFGsv0GMf0ipwLfqWWxHikjEOY5SGhlAHyTaa1frfaQGV8GVXA
 isvkE4BXDJmztwYVI5pQhjOUtutcGwo7Av044MgPkMLgBtiDoGww1yLKm3sk5/WyHrf2
 6X8prwg4slzN0tIbC7KIPRwYxB9yqSS7MSEQ9Swy8MmrabtH0afK3K51WsnahDQMfxkb
 0vGf8x1efJ5y1USpruRm6VtCoFBK/N3EuEE9id1scOLAZGfJeZIUEbae94E5sWNQYDXH
 j6OA==
X-Gm-Message-State: AC+VfDxX+WpGJbc1usxZSwn00si8rG5RzxLGYDqAd199Nz9QBaXIoIU0
 dFrwSBwCxe+Ul64o1dtf+BxrLg==
X-Google-Smtp-Source: ACHHUZ7YcONPPMNY8twjre72Uikbijf+Vg8SeWQKn0EzFzNf5hiIEvI6EJeZdQw3xEh1B2A6Bg5ckw==
X-Received: by 2002:a2e:9217:0:b0:2b3:5002:8255 with SMTP id
 k23-20020a2e9217000000b002b350028255mr8335591ljg.39.1687259281924; 
 Tue, 20 Jun 2023 04:08:01 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170906711100b009884f015a44sm1170687ejj.49.2023.06.20.04.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:08:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 00/37] crypto: Provide aes-round.h and host accel
Date: Tue, 20 Jun 2023 13:07:21 +0200
Message-Id: <20230620110758.787479-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x229.google.com
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

Changes for v3:
  * Move host/include/*/{,crypto/}aes-round.h.
  * Add some r-b.

Patches missing r-b:
  02-tests-multiarch-Add-test-aes.patch
  05-crypto-Add-aesenc_SB_SR_AK.patch
  08-target-arm-Use-aesenc_SB_SR_AK.patch
  10-target-riscv-Use-aesenc_SB_SR_AK.patch
  11-crypto-Add-aesdec_ISB_ISR_AK.patch
  13-target-arm-Use-aesdec_ISB_ISR_AK.patch
  15-target-riscv-Use-aesdec_ISB_ISR_AK.patch
  16-crypto-Add-aesenc_MC.patch
  17-target-arm-Use-aesenc_MC.patch
  18-crypto-Add-aesdec_IMC.patch
  19-target-i386-Use-aesdec_IMC.patch
  20-target-arm-Use-aesdec_IMC.patch
  21-target-riscv-Use-aesdec_IMC.patch
  22-crypto-Add-aesenc_SB_SR_MC_AK.patch
  23-target-i386-Use-aesenc_SB_SR_MC_AK.patch
  25-target-riscv-Use-aesenc_SB_SR_MC_AK.patch
  26-crypto-Add-aesdec_ISB_ISR_IMC_AK.patch
  27-target-i386-Use-aesdec_ISB_ISR_IMC_AK.patch
  28-target-riscv-Use-aesdec_ISB_ISR_IMC_AK.patch
  35-host-include-i386-Implement-aes-round.h.patch
  36-host-include-aarch64-Implement-aes-round.h.patch


r~


Richard Henderson (37):
  util: Add cpuinfo-ppc.c
  tests/multiarch: Add test-aes
  target/arm: Move aesmc and aesimc tables to crypto/aes.c
  crypto/aes: Add constants for ShiftRows, InvShiftRows
  crypto: Add aesenc_SB_SR_AK
  target/i386: Use aesenc_SB_SR_AK
  target/arm: Demultiplex AESE and AESMC
  target/arm: Use aesenc_SB_SR_AK
  target/ppc: Use aesenc_SB_SR_AK
  target/riscv: Use aesenc_SB_SR_AK
  crypto: Add aesdec_ISB_ISR_AK
  target/i386: Use aesdec_ISB_ISR_AK
  target/arm: Use aesdec_ISB_ISR_AK
  target/ppc: Use aesdec_ISB_ISR_AK
  target/riscv: Use aesdec_ISB_ISR_AK
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
  crypto: Remove AES_shifts, AES_ishifts
  crypto: Implement aesdec_IMC with AES_imc_rot
  crypto: Remove AES_imc
  crypto: Unexport AES_*_rot, AES_TeN, AES_TdN
  host/include/i386: Implement aes-round.h
  host/include/aarch64: Implement aes-round.h
  host/include/ppc: Implement aes-round.h

 MAINTAINERS                                  |   1 +
 meson.build                                  |   9 +
 host/include/aarch64/host/cpuinfo.h          |   1 +
 host/include/aarch64/host/crypto/aes-round.h | 205 +++++
 host/include/generic/host/crypto/aes-round.h |  33 +
 host/include/i386/host/cpuinfo.h             |   1 +
 host/include/i386/host/crypto/aes-round.h    | 152 ++++
 host/include/ppc/host/cpuinfo.h              |  30 +
 host/include/ppc/host/crypto/aes-round.h     | 182 +++++
 host/include/ppc64/host/cpuinfo.h            |   1 +
 host/include/ppc64/host/crypto/aes-round.h   |   1 +
 host/include/x86_64/host/crypto/aes-round.h  |   1 +
 include/crypto/aes-round.h                   | 164 ++++
 include/crypto/aes.h                         |  30 -
 target/arm/helper.h                          |   2 +
 target/i386/ops_sse.h                        |  60 +-
 tcg/ppc/tcg-target.h                         |  16 +-
 target/arm/tcg/sve.decode                    |   4 +-
 crypto/aes.c                                 | 808 ++++++++++++-------
 target/arm/tcg/crypto_helper.c               | 249 ++----
 target/arm/tcg/translate-a64.c               |  13 +-
 target/arm/tcg/translate-neon.c              |   4 +-
 target/arm/tcg/translate-sve.c               |   8 +-
 target/ppc/int_helper.c                      |  50 +-
 target/riscv/crypto_helper.c                 | 138 +---
 tests/tcg/aarch64/test-aes.c                 |  58 ++
 tests/tcg/i386/test-aes.c                    |  68 ++
 tests/tcg/ppc64/test-aes.c                   | 116 +++
 tests/tcg/riscv64/test-aes.c                 |  76 ++
 util/cpuinfo-aarch64.c                       |   2 +
 util/cpuinfo-i386.c                          |   3 +
 util/cpuinfo-ppc.c                           |  64 ++
 tcg/ppc/tcg-target.c.inc                     |  44 +-
 tests/tcg/multiarch/test-aes-main.c.inc      | 183 +++++
 tests/tcg/aarch64/Makefile.target            |   4 +
 tests/tcg/i386/Makefile.target               |   4 +
 tests/tcg/ppc64/Makefile.target              |   1 +
 tests/tcg/riscv64/Makefile.target            |  13 +
 util/meson.build                             |   2 +
 39 files changed, 2080 insertions(+), 721 deletions(-)
 create mode 100644 host/include/aarch64/host/crypto/aes-round.h
 create mode 100644 host/include/generic/host/crypto/aes-round.h
 create mode 100644 host/include/i386/host/crypto/aes-round.h
 create mode 100644 host/include/ppc/host/cpuinfo.h
 create mode 100644 host/include/ppc/host/crypto/aes-round.h
 create mode 100644 host/include/ppc64/host/cpuinfo.h
 create mode 100644 host/include/ppc64/host/crypto/aes-round.h
 create mode 100644 host/include/x86_64/host/crypto/aes-round.h
 create mode 100644 include/crypto/aes-round.h
 create mode 100644 tests/tcg/aarch64/test-aes.c
 create mode 100644 tests/tcg/i386/test-aes.c
 create mode 100644 tests/tcg/ppc64/test-aes.c
 create mode 100644 tests/tcg/riscv64/test-aes.c
 create mode 100644 util/cpuinfo-ppc.c
 create mode 100644 tests/tcg/multiarch/test-aes-main.c.inc

-- 
2.34.1


