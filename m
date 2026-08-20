Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15BCC5DF81
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 13:04:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wx2RQ-0008VN-5l; Thu, 20 Aug 2026 09:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wx2RN-0008Ug-GT
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 09:04:18 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wx2RL-0006kh-DX
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 09:04:17 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-381c51fde6bso2574927a91.2
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 06:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787231054; x=1787835854; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=pq/Xy8a92/t8aqkyQP4yLvUfAo1eSGhZVQ/Pjs1ehTs=;
 b=Qs/yRRR5hWZqbB/5kxINY+E3BuSDGBOdn+g5zVxpNXgdUPdBLnWkEwK+X7hbUQb2y6
 TGWgqYMTELxBL3wR3+Y5TbVflBykwlB1SSetyrOzk/VVmZC3qrxdFVT++z8PoEqskz+a
 s+qM2ElA82tNB9pkaSECc6VTE5PZEod+6js4ZJpwJ8lnXocceQtKviMDSeD3nBYMiJNj
 VmzzeCNZvANfH6rLL4xEa5T10Dvt1TA+mAKJABTQQmNtfBt8g0FtDFqNsN02945KrHZa
 r+z97XDSeM3DgwTB5hX0KcpIf5IUxd0HsVw4FrQYKOnOFBX278KXGtUJfjMLf1qXRHpI
 VOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787231054; x=1787835854;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pq/Xy8a92/t8aqkyQP4yLvUfAo1eSGhZVQ/Pjs1ehTs=;
 b=Oqs19g6X7i1PLFvFJGxuklZA/aL/4ngMb4nZEnhgPXLDI2uoBmnU6SCorsc1eN31Bv
 0JYcS1FGJSRXf+gFmf+PD0LUL5M+XsZQUpdrcBeggZgK9VcSL5L6plY0ahAWTZhEg8Rc
 axMfFxlGGgSDDJZ8HVVBhlZ/gpmBxrHhZwVvcWzhYjMhU4uRv/hSh2Hs9qgwua5JyEwQ
 pI79AMJp8A8F5FLmhifVkNGjKDczzCpy1AvZPCRsz4qb1Nr3C768K3HwvKlV0dsjzrka
 mRdLFjGT1yCpFf/0hVckpyAEEq1meC1837DCFmEkhYD4N3z9vwNtMlGd8WlgN/H5V0v3
 pQ/A==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrh/IwZQnvAS0a+gk1n5OP3k3AOdFyQGAKq4jRtu8FAuFoCfy04HAhIkVI++/O63An/tg3X5JIyn9EF@nongnu.org
X-Gm-Message-State: AFuF++nROgCNN7H9PL4k5VPRG31sSE3mttk/JeWzYTQ48yFTiHD3UYux
 N715AToZdOaWZ1n3/nPqMzY2PMTNxDzjpMPQ97L2l5OyV2ytDB4HqHqQVLvHja/Z
X-Gm-Gg: AR+sD10YVXebKbS230iXs6iwE1nkEHQk+RNkLss0qfz43mUfJlLho4Jjsafa1Awidmt
 Ab3LSJzJH2ToyGMwjIIQ29fArMKX3ejGpCkVIksCYRE7Cio8MW+MuIhYLd2YztbpisroG8eggtL
 GzPKc+oiY+gScH8ldbj6E5e2RkemUTBAeDwTQQhC0Ab0jgcDxbKBD16EWC3nzQsXm1HYo9hIbFY
 cM9/e9+90v1Bfh9yNo9eG47Q7D1C3bIWFHEckEk2i2CdiygnIj452aU+T0czw5CWPP4xn1DVETf
 8uqMGElq6F3mqBAvBfbRxwuU30IZPSTrSFPmtJX1UNq1a+FpUTtg+Zkv6f8maeGVAB5Iml1T+RF
 3uUauFH5ZbHC3FhtvWlKaL+MjyEbyNUiaKQADROfLzb93TUQAq7NZ2iqF+xz5oCZMn+f8dC41+Y
 kZYJ7Vd5E4ePOz5hVVzAZRijJYIC/sxgEpuOHoPq9M1wSV0OMX6BvxFN5Cbk2UnE4kUCU2ED2EM
 NRpz/64sidZMgPFby3FROpDmsc8xnTDyQrqIN2SCHHhzJooAoKowM5+P6rmPWABIA5pQSLM84h/
 F5xJP9EqqD9k+eo/G/B1vQ==
X-Received: by 2002:a17:90b:4a05:b0:37f:c22a:c188 with SMTP id
 98e67ed59e1d1-39580a80a65mr23947640a91.4.1787231053611; 
 Thu, 20 Aug 2026 06:04:13 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3957faf6849sm6451915a91.10.2026.08.20.06.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2026 06:04:12 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 0/2] tests/tcg/riscv64: Add vector load and store tests
Date: Thu, 20 Aug 2026 22:32:19 +0930
Message-ID: <20260820130223.2762-1-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x102f.google.com
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

Hi Richard, I was testing your riscv vector load/store series and
noticed there were some regressions with page crossing loads and stores.
We don't have any tests for that in the tree, so I wrote some.

The tests trigger assertions in linux-user for me:

  $ make -C build/tests/tcg/riscv64-linux-user run-test-rvv-ldst
  make: Entering directory 'build/tests/tcg/riscv64-linux-user'
    TEST    test-rvv-ldst on riscv64
  **
  ERROR:../accel/tcg/user-exec.c:810:probe_access: assertion failed: (-(addr | TARGET_PAGE_MASK) >= size)
  timeout: the monitored command dumped core
  Aborted
  make: *** [Makefile:223: run-test-rvv-ldst] Error 134
  make: Leaving directory 'build/tests/tcg/riscv64-linux-user'

I wrote the assembly one first before realising a C version would be
easy enough to do too. I'm not sure about using memcmp to check (in case
it's vectorised) so perhaps that's where the asm wins. I can tidy them
up and send the preferred version if we decide to put it in the tree.

Joel Stanley (2):
  tests/tcg/riscv64: Vector load test
  tests/tcg/riscv64: Add intrinsics version of test-rvv-ldst

 tests/tcg/riscv64/test-rvv-ldst-intrinsics.c |  66 ++++++++++
 tests/tcg/riscv64/Makefile.target            |  19 +++
 tests/tcg/riscv64/test-rvv-ldst.S            | 131 +++++++++++++++++++
 3 files changed, 216 insertions(+)
 create mode 100644 tests/tcg/riscv64/test-rvv-ldst-intrinsics.c
 create mode 100644 tests/tcg/riscv64/test-rvv-ldst.S

-- 
2.53.0


