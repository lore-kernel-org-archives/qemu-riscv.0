Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E7EC7EE29
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 02:24:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7RnL-0002Qo-Ko; Thu, 08 Jun 2023 22:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RnL-0002Qf-2p
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:24:07 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RnJ-0005Wf-5F
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:24:06 -0400
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-38dec65ab50so218442b6e.2
 for <qemu-riscv@nongnu.org>; Thu, 08 Jun 2023 19:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277443; x=1688869443;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K1QHrfC3muBZTrJWbSHBrtxTXfHamZ3QZJ+ErRShsLk=;
 b=bwhI3GDIartHY6OsgqnQNXSDy20T30R2C56Cxx6PXr0rch3JTx04T1ommn/v6jBRV+
 Xj1BTvFgLVpS3f9E6bmp4Q0q74E/X3f8YQgdmzCXjleiLYH5xslSz3jmW9dEKbUcp4jG
 kGyPs5PrJCqLNvpCUlWaTzGc6SyzxSYTKqCnbyuCH2j7Em4dl4uhqT6cMdKM0oW7jSJm
 EQX1YCvfwH7wlJ8OepgvbgyBrjKm8PFCkDTzfCd63xtgfEewuE66tNIGUtA/3F9mCwT5
 xiZ8RzzOc2YbleKjgbxg/p1QHZUKRVKqat/OHGk71DKomuUsBn4J/Plfml7k7asRxU+R
 1JMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277443; x=1688869443;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K1QHrfC3muBZTrJWbSHBrtxTXfHamZ3QZJ+ErRShsLk=;
 b=fOqYQf2QnHS+Sz2CqyAu/NJDX+3IDMyYHdXFSIVuIDq0/EFUYr1LXKaSTJwAsnf89K
 NJ+t+Np3+x6Zr0E29Lp1wI69f4vQ4/jDHuOfBsHY4wsGC9iJa1xqhutMxfBqJ95Vx198
 Q4WQKjKTulHrLukyTBbrbNVvI7SjyE7RCHsVHwKa3AOXzl0r8HIqUnUFMRc0bgWRQkpX
 /WdXmoJOAOiaja3gqtCnYd0Wwh9RfdrhOfENnYWDOmVuzANmd7Ti6XSV1XUBBAUXM0AW
 2BI7PksXPaP5CJp4uqDg+k4FQUKipLer2vcdm4RMgdk6D+fPlHIe89Xt4rA3CoX0+nKb
 XrPA==
X-Gm-Message-State: AC+VfDwqsrhsvrp6dbr06tcaW0Jy9iXVB2s+ypngqnjRarA+5x4JosoT
 rS8j1/162t4LS2KWeo7WGOx2Bg==
X-Google-Smtp-Source: ACHHUZ5Ubl9CXV5PGNygbSHvEkjzfhQreuhwJuKS4jHquPGIULI+aWT7BUMiz0DgtvZZdcBVZArRcg==
X-Received: by 2002:a05:6808:997:b0:39a:abe8:afc3 with SMTP id
 a23-20020a056808099700b0039aabe8afc3mr307550oic.38.1686277443071; 
 Thu, 08 Jun 2023 19:24:03 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 00/38] crypto: Provide aes-round.h and host accel
Date: Thu,  8 Jun 2023 19:23:23 -0700
Message-Id: <20230609022401.684157-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Changes for v2:
  * Change aesenc_SB_SR -> aesenc_SB_SR_AK
  * Change aesdec_ISB_ISR -> aesdec_ISB_ISR_AK

  Both of these because if we have to provide a zero to x86 and ppc
  hosts, we can do that at the guest level just as easily as the host.
  Which allows x86 and ppc guests to provide the key their key.

  * Add aesdec_ISB_ISR_AK_IMC

  Provide a variation for the Power8 primitive.  Easy enough to do
  with two x86 instructions.

  * Add ppc host support.

  Nasty issues with <altivec.h>, fighting with builtins vs bswap,
  so everything is in inline asm.


r~


Richard Henderson (38):
  tcg/ppc: Define _CALL_AIX for clang on ppc64(be)
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

 meson.build                             |   9 +
 host/include/aarch64/host/aes-round.h   | 205 ++++++
 host/include/aarch64/host/cpuinfo.h     |   1 +
 host/include/generic/host/aes-round.h   |  33 +
 host/include/i386/host/aes-round.h      | 152 +++++
 host/include/i386/host/cpuinfo.h        |   1 +
 host/include/ppc/host/aes-round.h       | 181 ++++++
 host/include/ppc/host/cpuinfo.h         |  30 +
 host/include/ppc64/host/aes-round.h     |   1 +
 host/include/ppc64/host/cpuinfo.h       |   1 +
 host/include/x86_64/host/aes-round.h    |   1 +
 include/crypto/aes-round.h              | 164 +++++
 include/crypto/aes.h                    |  30 -
 target/arm/helper.h                     |   2 +
 target/i386/ops_sse.h                   |  60 +-
 tcg/ppc/tcg-target.h                    |  16 +-
 target/arm/tcg/sve.decode               |   4 +-
 crypto/aes.c                            | 796 ++++++++++++++++--------
 target/arm/tcg/crypto_helper.c          | 249 +++-----
 target/arm/tcg/translate-a64.c          |  13 +-
 target/arm/tcg/translate-neon.c         |   4 +-
 target/arm/tcg/translate-sve.c          |   8 +-
 target/ppc/int_helper.c                 |  50 +-
 target/riscv/crypto_helper.c            | 138 ++--
 tests/tcg/aarch64/test-aes.c            |  58 ++
 tests/tcg/i386/test-aes.c               |  68 ++
 tests/tcg/ppc64/test-aes.c              | 116 ++++
 tests/tcg/riscv64/test-aes.c            |  76 +++
 util/cpuinfo-aarch64.c                  |   2 +
 util/cpuinfo-i386.c                     |   3 +
 util/cpuinfo-ppc.c                      |  65 ++
 tcg/ppc/tcg-target.c.inc                |  67 +-
 tests/tcg/multiarch/test-aes-main.c.inc | 183 ++++++
 tests/tcg/aarch64/Makefile.target       |   4 +
 tests/tcg/i386/Makefile.target          |   4 +
 tests/tcg/ppc64/Makefile.target         |   1 +
 tests/tcg/riscv64/Makefile.target       |   4 +
 util/meson.build                        |   2 +
 38 files changed, 2074 insertions(+), 728 deletions(-)
 create mode 100644 host/include/aarch64/host/aes-round.h
 create mode 100644 host/include/generic/host/aes-round.h
 create mode 100644 host/include/i386/host/aes-round.h
 create mode 100644 host/include/ppc/host/aes-round.h
 create mode 100644 host/include/ppc/host/cpuinfo.h
 create mode 100644 host/include/ppc64/host/aes-round.h
 create mode 100644 host/include/ppc64/host/cpuinfo.h
 create mode 100644 host/include/x86_64/host/aes-round.h
 create mode 100644 include/crypto/aes-round.h
 create mode 100644 tests/tcg/aarch64/test-aes.c
 create mode 100644 tests/tcg/i386/test-aes.c
 create mode 100644 tests/tcg/ppc64/test-aes.c
 create mode 100644 tests/tcg/riscv64/test-aes.c
 create mode 100644 util/cpuinfo-ppc.c
 create mode 100644 tests/tcg/multiarch/test-aes-main.c.inc

-- 
2.34.1


