Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DDEC7EE29
	for <qemu-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 13:32:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7FjV-00017P-Qx; Thu, 08 Jun 2023 09:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q7FjS-00015O-4C
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 09:31:18 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q7FjO-0005hI-9C
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 09:31:17 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f736e0c9a8so4038805e9.2
 for <qemu-riscv@nongnu.org>; Thu, 08 Jun 2023 06:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686231072; x=1688823072;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gyq3hlEra/amA0hTcY4JEVhtuxnoJNcVcBECFOAjJ/4=;
 b=P87+ySX74gB551K/7t6Rm+hrf6z60xDISkl+Zq8bzG6Re/yyCjtKAlkIE7ftQRgAHB
 82Fmt0s2zJW5TJRS5Ve4zrgXaKPg3TAr9hD1icFtqxt+sIqG79goUyQts+PVbojMdwMm
 iWSkE09O2KrcGekgPtgUPFz5EHITq0G+9NhZIq4sL5sBf77nyfdK5cUbV7sUke+Yk31z
 NcaWWoJg3ZCEWZeR17vN/51RsZylS7SzxDWS8CFN2ZSwXZC27Es3Yv6Dh1xEom/JzCcl
 CvD6dvlNDqyGlsc0ngcm8hgt10B2GMpbA7pbJUhAdqQz0wqH/gpno2eVZAZBbs91onJ2
 Bb7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686231072; x=1688823072;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gyq3hlEra/amA0hTcY4JEVhtuxnoJNcVcBECFOAjJ/4=;
 b=GgEE8nxQrF294u/XnoLWgcfNNALiSOgl+aC1VNkjnkh3kHxs1+bFOzbIIeeGQDB1Qj
 33X0f/huKi5meC4inzbiZDzm/BgoauV94QJDZlXmueSgN4/n1bymZwF41nsyZgQOVxXl
 MQBvijocAq+XwQPStWGjlReXu52RqJrfj5fSdsmD/XKkIPcd2U+LapUu67PbNyssrwKT
 OgrySissTSBF5XUTf3AHTd7Td3szN1Y9a0Qa4rONXb8ryOfwBF4q4947f44DClBCzGsL
 cT7fPNsVrPFr3AUr4DX0Cu7dw32qCXr2nzY/1k4F73N/bAF75hwd4YRCabx/bWZqRnGX
 9lxQ==
X-Gm-Message-State: AC+VfDz3G304/Sg3LiwMuROMDIpuixMGXuPwhVfk5Da5C3OdhEeNECwb
 QopCZDT6dXIISa8sRQHIA8MWPA==
X-Google-Smtp-Source: ACHHUZ7e+694Je7w2yygElYMKLhpWADtdWnzwWzu4f5JktDJaMnquN3P7FYDZigd97V7v4q9cbyDfQ==
X-Received: by 2002:a1c:f20e:0:b0:3f6:784:9617 with SMTP id
 s14-20020a1cf20e000000b003f607849617mr1379728wmc.11.1686231072209; 
 Thu, 08 Jun 2023 06:31:12 -0700 (PDT)
Received: from localhost.localdomain ([176.176.169.168])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a05600c21c400b003f72d7dc66esm1997234wmj.13.2023.06.08.06.31.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 08 Jun 2023 06:31:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/5] misc: Enforce .[ch].inc extension for re-included
 .c/.h files
Date: Thu,  8 Jun 2023 15:31:03 +0200
Message-Id: <20230608133108.72655-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

Since v1:
- addressed Richard's easy review comments

Richard, this is what I had before looking at removing exec/helper*.
Posting in case it is useful enough before getting there.

--

Follow the convention to use the .inc extension for .c/.h files
re-included, as docummented in Coding Style since commit 6a0057aa22:

    If you do use template header files they should be named with
    the ``.c.inc`` or ``.h.inc`` suffix to make it clear they are
    being included for expansion.

Most of the codebase already uses this extension:

  $ git ls-files | fgrep .inc | wc -l
       155

Rename some files left over.

Philippe Mathieu-Daudé (5):
  hw/remote/proxy: Remove dubious 'event_notifier-posix.c' include
  tests/tcg/aarch64: Rename bti-crt.inc.c -> bti-crt.c.inc
  target/arm: Rename helper template headers as '.h.inc'
  target/i386: Rename helper template headers as '.h.inc'
  target: Bulk rename 'helper.h' -> 'helper.h.inc' for all targets

 include/exec/helper-gen.h                                 | 2 +-
 include/exec/helper-proto.h                               | 2 +-
 target/alpha/{helper.h => tcg/helper.h.inc}               | 0
 target/arm/tcg/{helper-a64.h => helper-a64.h.inc}         | 0
 target/arm/tcg/{helper-mve.h => helper-mve.h.inc}         | 0
 target/arm/tcg/{helper-sme.h => helper-sme.h.inc}         | 0
 target/arm/tcg/{helper-sve.h => helper-sve.h.inc}         | 0
 target/arm/{helper.h => tcg/helper.h.inc}                 | 8 ++++----
 target/avr/{helper.h => tcg/helper.h.inc}                 | 0
 target/cris/{helper.h => tcg/helper.h.inc}                | 0
 target/hexagon/{helper.h => tcg/helper.h.inc}             | 0
 target/hppa/{helper.h => tcg/helper.h.inc}                | 0
 .../{cc_helper_template.h => cc_helper_template.h.inc}    | 0
 target/i386/{helper.h => tcg/helper.h.inc}                | 6 +++---
 .../i386/{ops_sse_header.h => tcg/ops_sse_header.h.inc}   | 0
 .../shift_helper_template.h.inc}                          | 0
 target/loongarch/{helper.h => tcg/helper.h.inc}           | 0
 target/m68k/{helper.h => tcg/helper.h.inc}                | 0
 target/microblaze/{helper.h => tcg/helper.h.inc}          | 0
 target/mips/{helper.h => tcg/helper.h.inc}                | 0
 target/nios2/{helper.h => tcg/helper.h.inc}               | 0
 target/openrisc/{helper.h => tcg/helper.h.inc}            | 0
 target/ppc/{helper.h => tcg/helper.h.inc}                 | 0
 target/riscv/{helper.h => tcg/helper.h.inc}               | 0
 target/rx/{helper.h => tcg/helper.h.inc}                  | 0
 target/s390x/{helper.h => tcg/helper.h.inc}               | 0
 target/sh4/{helper.h => tcg/helper.h.inc}                 | 0
 target/sparc/{helper.h => tcg/helper.h.inc}               | 0
 target/tricore/{helper.h => tcg/helper.h.inc}             | 0
 target/xtensa/{helper.h => tcg/helper.h.inc}              | 0
 hw/remote/proxy.c                                         | 1 -
 target/alpha/translate.c                                  | 2 +-
 target/arm/tcg/translate.c                                | 2 +-
 target/avr/translate.c                                    | 2 +-
 target/cris/translate.c                                   | 2 +-
 target/hexagon/translate.c                                | 2 +-
 target/hppa/translate.c                                   | 2 +-
 target/i386/tcg/cc_helper.c                               | 8 ++++----
 target/i386/tcg/int_helper.c                              | 8 ++++----
 target/i386/tcg/translate.c                               | 2 +-
 target/loongarch/translate.c                              | 2 +-
 target/m68k/translate.c                                   | 2 +-
 target/microblaze/translate.c                             | 2 +-
 target/mips/tcg/translate.c                               | 2 +-
 target/nios2/translate.c                                  | 2 +-
 target/openrisc/translate.c                               | 2 +-
 target/ppc/translate.c                                    | 2 +-
 target/riscv/translate.c                                  | 2 +-
 target/rx/translate.c                                     | 2 +-
 target/s390x/tcg/translate.c                              | 2 +-
 target/sh4/translate.c                                    | 2 +-
 target/sparc/translate.c                                  | 2 +-
 target/tricore/translate.c                                | 2 +-
 target/xtensa/translate.c                                 | 2 +-
 tests/tcg/aarch64/bti-1.c                                 | 2 +-
 tests/tcg/aarch64/bti-3.c                                 | 2 +-
 tests/tcg/aarch64/{bti-crt.inc.c => bti-crt.c.inc}        | 0
 57 files changed, 40 insertions(+), 41 deletions(-)
 rename target/alpha/{helper.h => tcg/helper.h.inc} (100%)
 rename target/arm/tcg/{helper-a64.h => helper-a64.h.inc} (100%)
 rename target/arm/tcg/{helper-mve.h => helper-mve.h.inc} (100%)
 rename target/arm/tcg/{helper-sme.h => helper-sme.h.inc} (100%)
 rename target/arm/tcg/{helper-sve.h => helper-sve.h.inc} (100%)
 rename target/arm/{helper.h => tcg/helper.h.inc} (99%)
 rename target/avr/{helper.h => tcg/helper.h.inc} (100%)
 rename target/cris/{helper.h => tcg/helper.h.inc} (100%)
 rename target/hexagon/{helper.h => tcg/helper.h.inc} (100%)
 rename target/hppa/{helper.h => tcg/helper.h.inc} (100%)
 rename target/i386/tcg/{cc_helper_template.h => cc_helper_template.h.inc} (100%)
 rename target/i386/{helper.h => tcg/helper.h.inc} (98%)
 rename target/i386/{ops_sse_header.h => tcg/ops_sse_header.h.inc} (100%)
 rename target/i386/{shift_helper_template.h => tcg/shift_helper_template.h.inc} (100%)
 rename target/loongarch/{helper.h => tcg/helper.h.inc} (100%)
 rename target/m68k/{helper.h => tcg/helper.h.inc} (100%)
 rename target/microblaze/{helper.h => tcg/helper.h.inc} (100%)
 rename target/mips/{helper.h => tcg/helper.h.inc} (100%)
 rename target/nios2/{helper.h => tcg/helper.h.inc} (100%)
 rename target/openrisc/{helper.h => tcg/helper.h.inc} (100%)
 rename target/ppc/{helper.h => tcg/helper.h.inc} (100%)
 rename target/riscv/{helper.h => tcg/helper.h.inc} (100%)
 rename target/rx/{helper.h => tcg/helper.h.inc} (100%)
 rename target/s390x/{helper.h => tcg/helper.h.inc} (100%)
 rename target/sh4/{helper.h => tcg/helper.h.inc} (100%)
 rename target/sparc/{helper.h => tcg/helper.h.inc} (100%)
 rename target/tricore/{helper.h => tcg/helper.h.inc} (100%)
 rename target/xtensa/{helper.h => tcg/helper.h.inc} (100%)
 rename tests/tcg/aarch64/{bti-crt.inc.c => bti-crt.c.inc} (100%)

-- 
2.38.1


