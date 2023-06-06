Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D121EC7EE24
	for <qemu-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 14:13:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6XQq-0003qp-G3; Tue, 06 Jun 2023 10:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6XQo-0003nq-Ml
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 10:13:06 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6XQi-0005UT-4l
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 10:13:06 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-30ae5f2ac94so6161442f8f.1
 for <qemu-riscv@nongnu.org>; Tue, 06 Jun 2023 07:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686060775; x=1688652775;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W04OLH0QJKfn19fH/wO2Mz30bJLZK/wIkX0NhoZFTMw=;
 b=z8pQQtX9UJxTFD2NiC4+90Qfcn2Y4lL6cwQhwWCOn1N0D4WdBv869uhpPbCbsDzZh4
 SsIbB+T/1kBEHpkBdyHgoRGR0SgDVbNmB6TpsyUb4K8pYFMPbMn/QXo+/voJGuSQagtb
 8D/NQQ1GoU6Q2HS7bRujqQw9PuTIwyagM2DOcq3sbdJG26wzPF/7GHGID5Kf+to+AJ9w
 rJ1Q1fQGzsAXRr0bcqgXDXD0ivzj127pna/Z6Ku4Fw+evsKX6hmX0fqx4yhGDmRtGpHR
 58qA0uZtvpebOV4u2koPPBxa4XpZcFsntcbPm5OtTb7mdDb0ACPnySR/trB3gRfluqm+
 ZxNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686060775; x=1688652775;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W04OLH0QJKfn19fH/wO2Mz30bJLZK/wIkX0NhoZFTMw=;
 b=jeEtOYhDp+hjWYI2i/Zdd6RpfzYgbElcNVG+BcoDvdgxiug5/Pp4lbTWYNqWwgze4I
 6wmZquO/W//qUs1xca6vW9HQWvALPFPrJZFKwzgXceLWnOwJLu+JVWWRnxbSE0qf9kR8
 Rfu57POAeYhctVBqEw4j3tkAfdD79fCv1kgy8A4DY/sb1PalIYy4BXBxyI6+mhH5aeLg
 trdkX6hlyUN2vXDm29O3Ghi0jZCBM9J4ySCehmqThjYxala2Huhic5ztbg8x+jYF5tNj
 hqHPxx53VD3Mql2LXCOeMeS8NvTpEacprse5X3cW0r/1IdA6tSpCM42xk3wOf/UOY67I
 GhnA==
X-Gm-Message-State: AC+VfDw5wlfFqn11UycAhE2/jqLLkYRMaofuproakt+grNedKeyAdA31
 IUgtEKvO7SDBJlbNn3F1HfJEHQ==
X-Google-Smtp-Source: ACHHUZ5Rwm11N9NMe7VjSccVa6raoQeNPrWWrfz85bwAcnSTi9r+/Pv0f/+e01WFWcv5oQbG1RIlyg==
X-Received: by 2002:a5d:428f:0:b0:30e:4b9b:7fcc with SMTP id
 k15-20020a5d428f000000b0030e4b9b7fccmr2104988wrq.32.1686060775487; 
 Tue, 06 Jun 2023 07:12:55 -0700 (PDT)
Received: from localhost.localdomain
 (vbo91-h01-176-184-50-104.dsl.sta.abo.bbox.fr. [176.184.50.104])
 by smtp.gmail.com with ESMTPSA id
 b9-20020a05600010c900b0030ae87bd3e3sm12755764wrx.18.2023.06.06.07.12.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 06 Jun 2023 07:12:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/5] misc: Enforce .[ch].inc extension for re-included .c/.h
 files
Date: Tue,  6 Jun 2023 16:12:47 +0200
Message-Id: <20230606141252.95032-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
  bsd-user: Rename elfcore.c -> elfcore.c.inc
  target/arm: Rename helper template headers as '.h.inc'
  target/i386: Rename helper template headers as '.h.inc'
  target: Rename per-target 'helper.h' -> 'helper.h.inc'
  tests/tcg/aarch64: Rename bti-crt.inc.c -> bti-crt.c.inc

 docs/devel/tcg-ops.rst                                    | 2 +-
 include/exec/helper-gen.h                                 | 2 +-
 include/exec/helper-proto.h                               | 2 +-
 target/alpha/{helper.h => helper.h.inc}                   | 0
 target/arm/{helper.h => helper.h.inc}                     | 8 ++++----
 target/arm/tcg/{helper-a64.h => helper-a64.h.inc}         | 0
 target/arm/tcg/{helper-mve.h => helper-mve.h.inc}         | 0
 target/arm/tcg/{helper-sme.h => helper-sme.h.inc}         | 0
 target/arm/tcg/{helper-sve.h => helper-sve.h.inc}         | 0
 target/avr/{helper.h => helper.h.inc}                     | 0
 target/cris/{helper.h => helper.h.inc}                    | 0
 target/hexagon/{helper.h => helper.h.inc}                 | 0
 target/hppa/{helper.h => helper.h.inc}                    | 0
 target/i386/{helper.h => helper.h.inc}                    | 6 +++---
 target/i386/{ops_sse_header.h => ops_sse_header.h.inc}    | 0
 ...hift_helper_template.h => shift_helper_template.h.inc} | 0
 .../{cc_helper_template.h => cc_helper_template.h.inc}    | 0
 target/loongarch/{helper.h => helper.h.inc}               | 0
 target/m68k/{helper.h => helper.h.inc}                    | 0
 target/microblaze/{helper.h => helper.h.inc}              | 0
 target/mips/{helper.h => helper.h.inc}                    | 0
 target/nios2/{helper.h => helper.h.inc}                   | 0
 target/openrisc/{helper.h => helper.h.inc}                | 0
 target/ppc/{helper.h => helper.h.inc}                     | 0
 target/riscv/{helper.h => helper.h.inc}                   | 0
 target/rx/{helper.h => helper.h.inc}                      | 0
 target/s390x/{helper.h => helper.h.inc}                   | 0
 target/sh4/{helper.h => helper.h.inc}                     | 0
 target/sparc/{helper.h => helper.h.inc}                   | 0
 target/tricore/{helper.h => helper.h.inc}                 | 0
 target/xtensa/{helper.h => helper.h.inc}                  | 0
 bsd-user/elfload.c                                        | 2 +-
 target/alpha/translate.c                                  | 2 +-
 target/arm/machine.c                                      | 2 +-
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
 bsd-user/{elfcore.c => elfcore.c.inc}                     | 0
 tests/tcg/aarch64/{bti-crt.inc.c => bti-crt.c.inc}        | 0
 60 files changed, 43 insertions(+), 43 deletions(-)
 rename target/alpha/{helper.h => helper.h.inc} (100%)
 rename target/arm/{helper.h => helper.h.inc} (99%)
 rename target/arm/tcg/{helper-a64.h => helper-a64.h.inc} (100%)
 rename target/arm/tcg/{helper-mve.h => helper-mve.h.inc} (100%)
 rename target/arm/tcg/{helper-sme.h => helper-sme.h.inc} (100%)
 rename target/arm/tcg/{helper-sve.h => helper-sve.h.inc} (100%)
 rename target/avr/{helper.h => helper.h.inc} (100%)
 rename target/cris/{helper.h => helper.h.inc} (100%)
 rename target/hexagon/{helper.h => helper.h.inc} (100%)
 rename target/hppa/{helper.h => helper.h.inc} (100%)
 rename target/i386/{helper.h => helper.h.inc} (98%)
 rename target/i386/{ops_sse_header.h => ops_sse_header.h.inc} (100%)
 rename target/i386/{shift_helper_template.h => shift_helper_template.h.inc} (100%)
 rename target/i386/tcg/{cc_helper_template.h => cc_helper_template.h.inc} (100%)
 rename target/loongarch/{helper.h => helper.h.inc} (100%)
 rename target/m68k/{helper.h => helper.h.inc} (100%)
 rename target/microblaze/{helper.h => helper.h.inc} (100%)
 rename target/mips/{helper.h => helper.h.inc} (100%)
 rename target/nios2/{helper.h => helper.h.inc} (100%)
 rename target/openrisc/{helper.h => helper.h.inc} (100%)
 rename target/ppc/{helper.h => helper.h.inc} (100%)
 rename target/riscv/{helper.h => helper.h.inc} (100%)
 rename target/rx/{helper.h => helper.h.inc} (100%)
 rename target/s390x/{helper.h => helper.h.inc} (100%)
 rename target/sh4/{helper.h => helper.h.inc} (100%)
 rename target/sparc/{helper.h => helper.h.inc} (100%)
 rename target/tricore/{helper.h => helper.h.inc} (100%)
 rename target/xtensa/{helper.h => helper.h.inc} (100%)
 rename bsd-user/{elfcore.c => elfcore.c.inc} (100%)
 rename tests/tcg/aarch64/{bti-crt.inc.c => bti-crt.c.inc} (100%)

-- 
2.38.1


