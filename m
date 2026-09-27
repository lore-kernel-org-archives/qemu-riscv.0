Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF11EC98324
	for <qemu-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 08:25:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xAkCg-0003qL-3m; Sun, 27 Sep 2026 04:25:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xAkCe-0003nE-Sg
 for qemu-riscv@nongnu.org; Sun, 27 Sep 2026 04:25:44 -0400
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xAkCc-0004eb-Lt
 for qemu-riscv@nongnu.org; Sun, 27 Sep 2026 04:25:44 -0400
Received: by mail-pj2-x0f.google.com with SMTP id
 98e67ed59e1d1-396ccb1a98fso1594386a91.1
 for <qemu-riscv@nongnu.org>; Sun, 27 Sep 2026 01:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1790497541; x=1791102341; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=MOyXiJNBTs/nKevNB5D/8e/tc9Z7knlblFQrY7PdDfE=;
 b=LvZQl68UpGexWDQpDk+yQtZ3hbhkPSKKtd5WY/ag/I7jym2qw0cyDBDv5Wk6q9Euqp
 pJQ0iyHHLyxDMKCYysB3CpmWacNOrXQqO6g0yH815KioUZQCVZHX5lja0Q1pc39L48dL
 /b90cOnq8rUsFSEPwgF9+Ybe0O8y+Dd23OwQ4aBMxJZy721IpjZySzR1lzX8RBMdzcRj
 wNZhGOcT6gxSYw1+FPPHYqcPJpabNhSmU7RlkDZ0/cIgmV13mi9Npsw+YVBeFNagF7ba
 TalIguy5MwAgbDhDrGPclQsFIHzQw13wShPH1BNX0GZ7K9KM1TkJQ1IzwBeY8AOYHc7Q
 4mtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790497541; x=1791102341;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MOyXiJNBTs/nKevNB5D/8e/tc9Z7knlblFQrY7PdDfE=;
 b=RJgsHO0U1fjkWpUqxn15sjul08oZ8QhpTA0cdSZ+4cCssDrJnZrzc85YpV/MBiUtLK
 3hFeAKiIixfmDCFL5wx0TJ0V813evacDYYS4jTyMne0A7u5uqmVeaxaZrvGt9GMlR5JL
 YT0xvwoEIQ9shqCIJgswYqQMG15WfSkdywwIruc4UJlPdmZhTRW4H3HqGwgQxYJrPaca
 bU/wfdVBFQW1grDlSkutlnCvBCEBN64lOFs1gR3IDNGHpQ+AnPkzd/rRgSbhPXuBtArq
 qtiB3hpijNyN5LJh7RyJh4QTnosptJfHXLTiaEhjA7ddIW+QVC8iyUCSKXbCLuqGLrVW
 0Wdw==
X-Forwarded-Encrypted: i=1;
 AKwUvByNoo5SMXSOkGA5pJY3/kJphnrkNSqcS1c8GO4niBLyZi8HA9yJU9vPCh84/VbouYOHKweaaino3H0W@nongnu.org
X-Gm-Message-State: AFq9FYJIBLAGS9globvshkiGbQHYigTLoHrrZFN6Rda2j4HhiHUxquvh
 K1LRMg2FDBFgEYFinpaiP6x6mUqjmjco4uWZRtMsoQV5U8YLEzP7yIHCvRSTwjQvC40=
X-Gm-Gg: AYBFou0CDzpDuHwaxvsv+//yAoKhkbRAUZ0Q/t0AiASKZ+0JEZRUXvqWlSLcDkoD91Y
 QzksB4YEF5VEOGQxCWQgT7z5bfFlibA3AHKAl/xF/O7yJ99Ek+y/yCQuxQM+OYDkN1GYeH9Lm6X
 YYApnpK6/p6HiVzd6grOLTLZ65NKIAshzY5k7hBJdgabZKBMeDd8LsOlJopKXv3UyF+2S1wycoA
 w8czUD4yDL7HCySLXR6jhiv2I5h0xNw5p2y8c0Iz9fRPKvxijM51gTgrWsVVus6hzTAazVdYsWS
 B71rtYj8edc1g4x84CFJAGGr+cAZEAph1tFf9DpuHfgdWUY3K7KzvbIhBCXxto0C+Hu9+dKORJO
 UEbsKjsisbpyKu35/18Mm332o1ZXWp6weJO8JNgqsaB5f9uilnoo9cV2RYEy9aI2zqd+HWhI8F/
 wrafgoeWfe/5/gjaKctydwhGQ0MjMkEl0/t/IMnFI+1iEyq7S6YwXXW1f6z746wCZJSM6tJJH6A
 FcUmgB8iq6Hge+pWLJTWXonodKapYisROpKtut2eo4xTUhr7Y3AwWak3rnsMiWVRf2VgZmLvw==
X-Received: by 2002:a17:90a:acf:b0:3a0:d9ae:4f6a with SMTP id
 98e67ed59e1d1-3a0d9ae55eamr2172986a91.4.1790497540476; 
 Sun, 27 Sep 2026 01:25:40 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a0b9357f64sm14498871a91.3.2026.09.27.01.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2026 01:25:40 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Max Chou <max.chou@sifive.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Subject: [PATCH v4 0/6] target/riscv: Add SiFive Xsfvqmaccdod/Xsfvqmaccqoq
 int8 matmul extensions
Date: Sun, 27 Sep 2026 16:25:28 +0800
Message-ID: <20260927082534.3228237-1-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::f;
 envelope-from=max.chou@sifive.com; helo=mail-pj2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Changes since v3:<20260830160335.3441069-1-max.chou@sifive.com>
 - Rebase to riscv-to-apply.next branch (commit f6d35d5)
 - Modified patch 6 to align the new meson build system of tests

Changes since v2:<20260812174417.2468981-1-max.chou@sifive.com>
 - Rebase to riscv-to-apply.next branch (commit aee18ec)
 - Modified patch 5 to align the new disas flow

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
 disas/riscv-xsf-op.c.inc                    |  11 +
 disas/riscv-xsf.c                           |  49 ++++
 disas/riscv-xsf.h                           |  16 ++
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
 tests/tcg/riscv64/system/meson.build        |   7 +
 tests/tcg/riscv64/test-xsfvqmacc.S          | 260 ++++++++++++++++++++
 20 files changed, 677 insertions(+), 15 deletions(-)
 create mode 100644 disas/riscv-xsf-op.c.inc
 create mode 100644 disas/riscv-xsf.c
 create mode 100644 disas/riscv-xsf.h
 create mode 100644 target/riscv/tcg/insn_trans/trans_xsf.c.inc
 create mode 100644 target/riscv/tcg/xsf_helper.c
 create mode 100644 target/riscv/xsf.decode
 create mode 100644 tests/tcg/riscv64/test-xsfvqmacc.S

-- 
2.43.0


