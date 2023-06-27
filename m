Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCEB9EB64DC
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 17:19:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qECKl-000654-TN; Tue, 27 Jun 2023 13:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qECKg-000631-F6
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 13:18:27 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qECKc-0006Qa-S2
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 13:18:25 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1b7dd061e9aso20321255ad.2
 for <qemu-riscv@nongnu.org>; Tue, 27 Jun 2023 10:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1687886300; x=1690478300;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3lIqOENk5juRyzhciAVRZS8zFTvywNKCesFzSYCjFmE=;
 b=fdFbNgx8uuLFrseofA6NkyYOP2fF5UxW8ik/nunr8F4oLUq0qd/IlnrI3rIc8viN6V
 izVN2GjPgC5SUOgRkbSEY/+WdpHIGZQ+cG684sdsi2uBxAA72tMrGuUmDSmPVhMAyWEz
 SsQEe87OVMGOboTHJFKdnkw2TLOBXVROwWncz95HRSzkmLf+lOZfK0u8BfeRT/8mqnnl
 U+qJtVpfbj1PwFE8T1NIlwlqjcmJDCZxwvBxhEty6hxMlEonz6baNPZv5gnTGxrCglgl
 /ciITikssQ0/l/Yqvcot7Ft8it9I1IAyhLl5EMQDTvskoN/QRDz10m54t/B9c9iexq/o
 8VHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687886300; x=1690478300;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3lIqOENk5juRyzhciAVRZS8zFTvywNKCesFzSYCjFmE=;
 b=L6m6XtZ9PsK7VQ6TNDIwwGA5aJJM9bxersPYWp4kIiwfdCp4aGhq06Kcxd52cPdGyE
 77v8iFnH8XkNmC4LAno91LlLpkhagmGVOYq8Lj/pzmBgmBZEuTkutH0MTUy6mJA0+wAt
 iOJCWrc7AH2PmMEyhdiYcI4aLd6hFp/vPpJ6kkKzHkRVqzEGD0END/vRQCb66dBxVFYY
 AHHu4P9lA80LUxaIZolSWDkyBLXU+J3QPQa953wrkZUpnbUDubyFb71wRcI1jZ/ukrz0
 1K/UCjow8SHu1Q7yi+x8/9jIhkNqspApBSOvs2wvc/Fn6EGAciBu3TOnPGrKp95q1sXo
 Hm9g==
X-Gm-Message-State: AC+VfDxLNPb3EbysYpJjW2ZtM5LswFdwu1xIj6L/3lbd2Tt6RkrY8QZr
 /WplBt7iO0HT2xzMTH9Vy8HU/A==
X-Google-Smtp-Source: ACHHUZ5lOnHSRpSx4I2fVDoBByzO3aKYV1R6Tt8vv6LVSJ+uHxmjuucSxGiA/wYUNGkW4sNQNwg4Xg==
X-Received: by 2002:a17:902:efca:b0:1b8:2b99:33df with SMTP id
 ja10-20020a170902efca00b001b82b9933dfmr1046995plb.63.1687886299891; 
 Tue, 27 Jun 2023 10:18:19 -0700 (PDT)
Received: from MaxdeMBP.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 jb13-20020a170903258d00b001b8052d58a0sm3796145plb.305.2023.06.27.10.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 10:18:19 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com,
	Max Chou <max.chou@sifive.com>
Subject: [PATCH v5 00/15] Add RISC-V vector cryptographic instruction set
 support
Date: Wed, 28 Jun 2023 01:17:31 +0800
Message-Id: <20230627171759.64653-1-max.chou@sifive.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x62e.google.com
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

This patchset provides an implementation for Zvbb, Zvbc, Zvkned, Zvknh,
Zvksh, Zvkg, and Zvksed of the draft RISC-V vector cryptography
extensions as per the v20230620 version of the specification(1)(168e7b4).
This is an update to the patchset submitted to qemu-devel on
Tue, 27 Jun 2023 09:43:24 -0700

Based-on: 20230620110758.787479-1-richard.henderson@linaro.org
([PATCH v3 00/37] crypto: Provide aes-round.h and host accel)

v2:

    Squashed commits into one commit per extension with separate
    commits for each refactoring.
    Unified trans_rvzvk*.c.inc files into one trans_rvvk.c.inc.
    Style fixes in insn32.decode and other files.
    Added macros for EGS values in translation functions.
    Updated from v20230303 to v20230407 of the spec:
        Zvkb has been split into Zvbb and Zvbc.
        vbrev, vclz, vctz, vcpop and vwsll have been added to Zvbb.

v3:

    New patch 03/19 removes redundant “cpu_vl == 0” checks from
    trans_rvv.c.inc.
    Introduction of new tcg ops has been factored out of patch 11/19
    and into 09/19.
        These ops are now added to non riscv-specific files.

v4:

    New patch 08/17 fixes the tcg_gen_gvec_andcs temporary variable
    issue.
    Patch 09/17 fixes imm mode for vror.vi.
    Rebased to riscv-to-apply.next branch (de395bb):
        Replace vstart constraint checking by TCG op.
    Verified by code examples provided by vector crypto spec repository
    (riscv-crypto).

v5:

    Imported aes-round.h for Zvkned extension.
        Rebased to 20230620110758.787479-1-richard.henderson@linaro.org
    Exposed the properties of v4 patch 17/17 to the patches that the
    extension was added.
    Removed v4 patch 08/17 that is queued to tcg-next.


As v20230620 is a frozen version, we are not expecting any significant
changes to the specification or this patch series.

Please note that the Zvkt data-independent execution latency extension
(and all extensions including it) has not been implemented, and we
would recommend not using these patches in an environment where timing
attacks are an issue.

Work performed by Dickon, Lawrence, Nazar, Kiran, and William from
Codethink sponsored by SiFive, as well as Max Chou and Frank Chang
from SiFive.

    https://github.com/riscv/riscv-crypto/releases

Thanks to those who have already reviewed:

    Daniel Henrique Barboza dbarboza@ventanamicro.com
        [PATCH v4 09/17] target/riscv: Add Zvbb ISA extension support
        [PATCH v4 10/17] target/riscv: Add Zvkned ISA extension support
        [PATCH v4 11/17] target/riscv: Add Zvknh ISA extension support
        [PATCH v4 12/17] target/riscv: Add Zvksh ISA extension support
        [PATCH v4 13/17] target/riscv: Add Zvkg ISA extension support
    Weiwei Li liweiwei@iscas.ac.cn
        [PATCH v3 01/19] target/riscv: Refactor some of the generic vector functionality
        [PATCH v3 02/19] target/riscv: Refactor vector-vector translation macro
        [PATCH v3 03/19] target/riscv: Remove redundant "cpu_vl == 0" checks
        [PATCH v3 05/19] target/riscv: Move vector translation checks
        [PATCH v3 06/19] target/riscv: Refactor translation of vector-widening instruction
        [PATCH v3 07/19] target/riscv: Refactor some of the generic vector functionality
        [PATCH v3 19/19] target/riscv: Expose Zvk* and Zvb[b, c] cpu properties
    Richard Henderson richard.henderson@linaro.org
        [PATCH v2 02/17] target/riscv: Refactor vector-vector translation macro
        [PATCH v2 04/17] target/riscv: Move vector translation checks
        [PATCH v2 05/17] target/riscv: Refactor translation of vector-widening instruction
        [PATCH v2 07/17] qemu/bitops.h: Limit rotate amounts
        [PATCH v2 08/17] qemu/host-utils.h: Add clz and ctz functions for lower-bit integers
        [PATCH v2 14/17] crypto: Create sm4_subword
    Alistair Francis alistair.francis@wdc.com
        [PATCH v2 02/17] target/riscv: Refactor vector-vector translation macro
    Philipp Tomsich philipp.tomsich@vrull.eu
        Various v1 reviews
    Christoph Müllner christoph.muellner@vrull.eu
        Various v1 reviews

Dickon Hood (2):
  target/riscv: Refactor translation of vector-widening instruction
  target/riscv: Add Zvbb ISA extension support

Kiran Ostrolenk (4):
  target/riscv: Refactor some of the generic vector functionality
  target/riscv: Refactor vector-vector translation macro
  target/riscv: Refactor some of the generic vector functionality
  target/riscv: Add Zvknh ISA extension support

Lawrence Hunter (2):
  target/riscv: Add Zvbc ISA extension support
  target/riscv: Add Zvksh ISA extension support

Max Chou (3):
  crypto: Create sm4_subword
  crypto: Add SM4 constant parameter CK
  target/riscv: Add Zvksed ISA extension support

Nazar Kazakov (4):
  target/riscv: Remove redundant "cpu_vl == 0" checks
  target/riscv: Move vector translation checks
  target/riscv: Add Zvkned ISA extension support
  target/riscv: Add Zvkg ISA extension support

 crypto/sm4.c                             |  10 +
 include/crypto/sm4.h                     |   9 +
 target/arm/tcg/crypto_helper.c           |  10 +-
 target/riscv/cpu.c                       |  37 +
 target/riscv/cpu_cfg.h                   |   8 +
 target/riscv/helper.h                    |  95 +++
 target/riscv/insn32.decode               |  58 ++
 target/riscv/insn_trans/trans_rvv.c.inc  | 171 ++--
 target/riscv/insn_trans/trans_rvvk.c.inc | 585 ++++++++++++++
 target/riscv/meson.build                 |   4 +-
 target/riscv/op_helper.c                 |   6 +
 target/riscv/translate.c                 |   1 +
 target/riscv/vcrypto_helper.c            | 953 +++++++++++++++++++++++
 target/riscv/vector_helper.c             | 243 +-----
 target/riscv/vector_internals.c          |  81 ++
 target/riscv/vector_internals.h          | 228 ++++++
 16 files changed, 2144 insertions(+), 355 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvvk.c.inc
 create mode 100644 target/riscv/vcrypto_helper.c
 create mode 100644 target/riscv/vector_internals.c
 create mode 100644 target/riscv/vector_internals.h

-- 
2.31.1


