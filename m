Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38E6C5B572
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 17:44:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuD0L-0002o8-3k; Wed, 12 Aug 2026 13:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1wuD0C-0002mY-Qu
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 13:44:34 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1wuD06-0007bJ-O7
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 13:44:30 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-38dcbade417so1448371a91.1
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 10:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1786556665; x=1787161465; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=GyF8fZRKjJsM2WXRwhvhipDGxr7CwUs79mRbQANUMTU=;
 b=TdaSPWiCLA9teWf1mYCREiafc8Vp8NN/0zWQ8UY39ZOxCuIMwKRvMGMu6H7uyVs5Uu
 BfWFaEKs8WzFZIyCh12EtxDufzn8XMQZGyVdc1NTehcPR1BwCEx9IMRXkdq8Uy2mLytR
 xL55MxWSLU6Oj49SOMMKLdqNq885jmZP5SqGbGXxtya6uPIea4ZLVsUcmQYvk0fvb7Cy
 0paX7gShr8arDJ/MmdpNpR4uJ91Ahcqj65F1Nl1q+N39OP/Gx+5gi8R6IaPgUyx4FSfV
 cO4NRs9QcbQT+RJfclnxIAEXmx3kX0Xd8NoD0WSbYQWTPvkuIBX4G17QEvVYz6o/y49B
 4krQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786556665; x=1787161465;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GyF8fZRKjJsM2WXRwhvhipDGxr7CwUs79mRbQANUMTU=;
 b=oDCPqSBQ5MIz5HkZcxhdgIBP6QOZL1ynW2HoJpoxuTeR98VvNCvlz6zYUT9Urd/3Wx
 rtchK9fthJuwBlRlTXrm/kgAWaCVm7MToK2DgG6m21WaPs6YjenzAtZe7krVFzDU9O4l
 //QieDC6BbMGtUXSZ1wr59BRaA/OyirHlR81KXbVLvRcsby6yAlt46DYCeJ9zz9cf2gn
 Wp1CVGUYEi93b6dOKNU7GMW/IoxpfllJeDTJ1jJ/fOWhiG079DzL6HvOJLbrzg7siNvB
 4cJGlcZOtpbdDcaOm7v6WKS4wQSMxcRwjzxqoFLzgvFCxD6vrV7bald+xIVrAmMa6Iui
 XDDQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqutMTwQLYa/eeq4HhhHHN2UQS95WFRBM/J8Xewkqf34AjoAvzbCIdmU4zDnjjH+NKm79dSNkxcBZMs@nongnu.org
X-Gm-Message-State: AOJu0Yx199nfvB+gMUwmP0kJWgcCsI6y+yh5mjlILLQkLjEV54MDG8fB
 eQXLOnZ8EBn+PHFr3kdDsw29ydyh+fnFUnQSKQZp7Ei+4s4xZNAegIDC3SWf0YuehlQ=
X-Gm-Gg: AR+sD109qp+2i1kOG8J7XAlvZPPanbfiHFldldkXFoNfcMfHTfH5NhoH3QQZ6v6rczA
 r41CbcqRilOPhVzLw1mrakrtaOfeSgPry3aIdToZySYupqTJK6U+8jEWrZFRukcdknD6caYM/9w
 blpEpz0cfYIyHdlyz706yu2cgr8L3Cr43DVrb4Cm6Rf77hjMzT8f2OIAFIg1L54U4270H37xit9
 l9Emp6dgxta7pz0Toj6hH8iXL2p2py8YXt35FE9o3r6asytZK2sMBkSjkIS5Kpj6iGknga6eNA2
 Rn3RrmzTmFpSO+BbF6XLlBkFeqM0emyetjucJoMJFcA0duKFdHT0crGAjNPzg+QYig50RTRJWFI
 ZgHwbQ6HOMi58tPttnctgPn4xgbWCAdZxwMjZN0vYpYA/5qMLs8yDEZCogv5rKo92+1RGrxhojD
 9dbV25jgnUPZtlKDYejAFrMJJptZUIZzzOpuq6Y4Y31+hA6tMGF2IiDd0eu17BsMOGR4lQG4ATB
 Fer89IzkAeg3BQJvtOnTN37FY9ZthXfft6Vg4FgI4KmlF2H1CdyKutqk7EEzAR5
X-Received: by 2002:a17:90b:4d10:b0:380:71eb:4014 with SMTP id
 98e67ed59e1d1-3930141279bmr6372687a91.15.1786556664981; 
 Wed, 12 Aug 2026 10:44:24 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3931db13c3bsm13210a91.3.2026.08.12.10.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 10:44:24 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Max Chou <max.chou@sifive.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Subject: [PATCH v2 0/6] target/riscv: Add SiFive Xsfvqmaccdod/Xsfvqmaccqoq
 int8 matmul extensions
Date: Thu, 13 Aug 2026 01:44:10 +0800
Message-ID: <20260812174417.2468981-1-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=max.chou@sifive.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Changes since v1:<20260721122034.1567146-1-max.chou@sifive.com>
 - Rebase to master branch (commit 84f0721)
 - Reformat riscv_multi_ext_implied_rules to list one rule per
   line before adding XSFVQMACCDOD_IMPLIED/XSFVQMACCQOQ_IMPLIED, so
   future additions to the array are a pure append instead of
   reflowing whatever line they land on. Split out into its own
   patch. (Thanks for Daniel Henrique Barboza's suggestion)
 - Move the SiFive int8 matmul helper out of the shared
   vector_helper.c and into a new target/riscv/tcg/xsf_helper.c,
   so vendor-specific code no longer lives in common vector-helper
   code. (Thanks for Daniel Henrique Barboza's suggestion)

rnax

Frank Chang (2):
  target/riscv/cpu: Add SiFive custom int8 matmul extension implied
    rules
  target/riscv: rvv: Add SiFive custom int8 matmul instructions

Jason Chien (1):
  disas/riscv: Add disassembler support for Xsfvqmaccdod/Xsfvqmaccqoq

Max Chou (3):
  target/riscv: Add cfg property for SiFive int8 matmul extensions
  target/riscv/cpu: List one implied-ext rule per line
  tests/tcg/riscv64: Add tests for SiFive int8 matmul extensions

 MAINTAINERS                                 |  10 +
 disas/meson.build                           |   3 +-
 disas/riscv-xsf.c                           |  79 ++++++
 disas/riscv-xsf.h                           |  18 ++
 disas/riscv.c                               |   2 +
 disas/riscv.h                               |   1 +
 target/riscv/cpu.c                          |  80 ++++--
 target/riscv/cpu_cfg.h                      |   5 +
 target/riscv/cpu_cfg_fields.h.inc           |   2 +
 target/riscv/helper.h                       |  10 +
 target/riscv/meson.build                    |   1 +
 target/riscv/tcg/insn_trans/trans_xsf.c.inc |  98 ++++++++
 target/riscv/tcg/meson.build                |   1 +
 target/riscv/tcg/tcg-cpu.c                  |  16 ++
 target/riscv/tcg/translate.c                |   3 +
 target/riscv/tcg/xsf_helper.c               |  87 +++++++
 target/riscv/xsf.decode                     |  30 +++
 tests/tcg/riscv64/Makefile.softmmu-target   |   7 +
 tests/tcg/riscv64/test-xsfvqmacc.S          | 260 ++++++++++++++++++++
 19 files changed, 698 insertions(+), 15 deletions(-)
 create mode 100644 disas/riscv-xsf.c
 create mode 100644 disas/riscv-xsf.h
 create mode 100644 target/riscv/tcg/insn_trans/trans_xsf.c.inc
 create mode 100644 target/riscv/tcg/xsf_helper.c
 create mode 100644 target/riscv/xsf.decode
 create mode 100644 tests/tcg/riscv64/test-xsfvqmacc.S

-- 
2.43.0


