Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAE2C61DB9
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 05:10:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzSNY-0002Rc-Fj; Thu, 27 Aug 2026 01:10:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSNX-0002RF-24
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 01:10:19 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSNT-0003yb-L3
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 01:10:18 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-3966791a6eeso415929a91.3
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 22:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787807414; x=1788412214; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=U0GeqQ+RGSdjpn23RnRlwS7n66mf1Vtk0bCrAtGxWPU=;
 b=JYU540DUQuMUAR5ERF+e9zzPy1V8F/B4u6OvuEW0RB7IUdFfwJ/aNn8Iw9o1WM1PV/
 QtSOxpfkDNdb2jCTCO5JO0NlcqN79gJBwVLvOw7RGyrfD0/wtMOuL8BLKUOuUbtkQYKN
 I2ctQb9utfhcBYCuHr8scETsHjgC6aADDocdncuHRdEXixnJIyesEsJTIRS28RpD952S
 SU/K43PPYvONpyCHXyzRJFBDHaXS8UVl5GtbYNv89dWGf65P/eMu90G213YkjsN9eO0A
 Q00UUy+9Et6vsZSjAtoTb6yz9Ubv0BmOgiCJABsoKT0m7FuFNDnzpRFg1U+58IBHDPh2
 dHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787807414; x=1788412214;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=U0GeqQ+RGSdjpn23RnRlwS7n66mf1Vtk0bCrAtGxWPU=;
 b=DagX2dd1V1u5dPLb58sHDhPcsz8NJnrXSwnVqzGYRc/oFF5+CoDd/pwWXqM1U0SWB7
 oIfL7tXT6xXsEKRxbVhqLnJhbP60e1uZ8xb3X6N47B4Q9RBCzyzs/O69IiPRlSyKiqso
 kpG1vEVRze6fqyVBxJmX3PalW2CkQiJGBeqIpDDAwznO6nu7ZVoHWb9DHbb5tIRMo4BZ
 wvGy3OY9jvzuACACwJz9ALfG1C1Y1R1Y08/nczd62OJ3gzOJB3JQUMCAjH6oHSOhfWYJ
 HhP4PmoG7iR1g8UvTmPEieiwP5KSGW0urAtbmVpQTHCZBuctywgO51Orj0cqvU77xppy
 tttw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rogvk/qVX1JUlBsnfIFAOYSywbCcxvKpipSlpmU1orMjBZ2s3pw59ngjS7BQrqR5z/k0ge+QFEXbUvu@nongnu.org
X-Gm-Message-State: AFuF++m0sApmpkkbgyAnd29y3Rm5DfA9CDQzXmd5EqZvWwRgAAhEMcWL
 xBn92kaZf5ljym4aeKjxrP94Gku5AARcfz0CUpseaN35sZIlX5yyDUYV
X-Gm-Gg: AR+sD114PhRlTIDukHW81fqYfw5lMR3uu7CCxvulg2EuE6keg7K/2oBqn5xVfFG/3gV
 Vjr6MFKcTQcQUtoK082CGIVst1bc0DXyiJipqlpr2D5lfb9NPD7O2+E+ESJjE5fHH2BHtNy9+IM
 1BCEn8XMwk+oy510nq+dK/4DpSGHW5ZDr4G72cxqyGuKns8eqJ7tyvtB1YqRJPvoqn4BrvV6kOn
 i5pWcKWz5ObCwq1VITpH7YdPcoVje0pQWMP14f8CmYCu74knSFPISYsIHzEnhNOIRv3pI/1QcwT
 dhubhSqdFCUbx0hEHAkgi7Bt6rfqkzzCewPj7HOWY97eQ3rMN/Fy5AzueshF2DwMrN+1iwR8lgs
 vAlVKuA4A3cdVePteEcnshZQGjjvsstWARRA7NYHGOaB5HxbxdS+WV+8xetF/VHu1thRJHe8ibS
 HGVBJtmiDqxJxYHJtxBv+TqEMWe1Pu0wZLS0gDHHhOq6viKeZJz3UYSPZAA34XtDbMaKAaJpsxD
 0dig5E0p1vV7oJxyvKvMYpLpqW73+1nXjIaVAyuKQFIvHvUKb2gSrAviKqbM2sIq6ZWGjEqvxZx
 RBYxxcsROoa6WKKqSZEy
X-Received: by 2002:a17:90b:4c09:b0:37f:e177:f58 with SMTP id
 98e67ed59e1d1-3966d3dcdb1mr23283816a91.9.1787807414025; 
 Wed, 26 Aug 2026 22:10:14 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39670599275sm2210473a91.0.2026.08.26.22.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 22:10:11 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: [PATCH 00/12] tests/tcg: Multiarch tests for riscv64
Date: Thu, 27 Aug 2026 14:39:39 +0930
Message-ID: <20260827050953.67184-1-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

When testing Richard's TCG RVV changes I went down the rabbit hole that
is tests/tcg/multiarch. Out the other side is this series, which enables
the multiarch and record/replay tests for riscv64, and fixes the
memory-sve aarch64 test while adding a memory-rvv test for riscv64.

The first half of the series performs some housekeeping on the semihost
tests and the softmmu makefile in tests/tcg/riscv64. The second half
enables the multiarch tests, and looks at the vectorised memory.c test.

The final patch adds a very coarse check for vectorisation by grepping
objdump for vector loads and stores. Although it's not the neatest, it
would have caught the regression in memory-sve, so it is worthwhile
having in the tree.

Joel Stanley (12):
  tests/tcg/riscv64: Include stdint.h in semicall.h
  tests/tcg/riscv64: Clean up semicall.h inline asm
  tests/tcg/riscv64: Boot semihost tests with -bios none -kernel
  tests/tcg/riscv64: Update semihosting linker script
  tests/tcg/riscv64: Rework rules for semihost tests
  tests/tcg/riscv64: Enable multiarch system tests
  tests/tcg/riscv64: Enable memory record and replay test
  tests/tcg/aarch64: Don't leak memory-sve CFLAGS
  tests/tcg/multiarch: Fix vectorisation of memory test
  tests/tcg/riscv64: Enable vectorised memory test
  configure: Provide OBJDUMP to the tcg tests
  tests/tcg: Check vector memory tests contain vector ops

 configure                                 |  11 ++
 tests/tcg/riscv64/semicall.h              |  12 +-
 tests/tcg/multiarch/system/memory.c       | 113 ++++++++----------
 tests/tcg/riscv64/system.c                |  30 +++++
 tests/tcg/Makefile.target                 |  10 +-
 tests/tcg/aarch64/Makefile.softmmu-target |   3 +-
 tests/tcg/riscv64/Makefile.softmmu-target | 134 +++++++++++++---------
 tests/tcg/riscv64/boot.S                  |  23 ++++
 tests/tcg/riscv64/semihost.ld             |  47 ++++++--
 9 files changed, 251 insertions(+), 132 deletions(-)
 create mode 100644 tests/tcg/riscv64/system.c
 create mode 100644 tests/tcg/riscv64/boot.S

-- 
2.47.3


