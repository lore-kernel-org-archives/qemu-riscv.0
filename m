Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65775EB64D8
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 16:17:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qCMze-0008NV-1L; Thu, 22 Jun 2023 12:17:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qCMzc-0008NA-OH
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 12:17:08 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qCMza-0004Uo-K0
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 12:17:08 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1b505665e2fso6084265ad.0
 for <qemu-riscv@nongnu.org>; Thu, 22 Jun 2023 09:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1687450625; x=1690042625;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oN1bCqFACiZtQkQX6mBHX9BRWXW0TjLz+xz+ybtIqwc=;
 b=Uvy8b3dnks4bGvVrOk32tfnFFN7UtAicSUWYHExQRBIjFy90H1rajeRASR6Q2ZCduD
 X+qSDCEFT2KvLlAu9o0g8gCQKWw5S8YAYnLi9pKR0DaWvbToTXxMddpVoJyABte/M7sW
 z1dPjhgHuPHNuojIOmLZ9B3belB+txg9kbcspSLacvdT+prHoTtbqLCUIC4JlKdiOC1e
 Cz7k1PNaa3NLgRQ8BwojYSMTFEOLVslo5NeIyK5W21/X9xiuM3Jngc8fPSQ1YDlLcB32
 /YI/mT/Rc7yeqyo3WVJnbk8gh+2sPaGXRmi2Jq4Y+ORvhBkNlR6ULuVDIV3C2ZjSb04g
 KNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687450625; x=1690042625;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oN1bCqFACiZtQkQX6mBHX9BRWXW0TjLz+xz+ybtIqwc=;
 b=KVDGDv+LC52Qdn8BpCZsMj66PW4XPXCab6Ywj/UcfM2sge1fls9EIMb+EX7s59MP+y
 Z2QPJlD9WowoNT2KDhb2uU/VXSkzCu81HGEH64UtY2qRexnXwfrH8rst2GvtQUor6qRK
 V3vbQafF/4Jvn9QQvbZAM9m5+4fZ0mTrIoAX84rtxjOAs7MaEJR0FgCIHhfa+4lHGUE8
 fCdJDXi8wF9RdhBrGWqejEpCfso0LnH9cN0ZuMsgfO7QSiHgl5n6ybPeb5njCghIxnXH
 u6aUxV+tQNWTFxz37cNI+rjYHCUL3aWD81Ri0MAyjoH8Fs84ROdA/hHbMIDQNUrxZd+p
 PU7Q==
X-Gm-Message-State: AC+VfDyIrpbD3d3mEWOIc8X1udkRYNzUwkQHw5x5HGV5XlQvC5OpNd7a
 5VamEw2Mt051Sv4Ly/pe5glCWg==
X-Google-Smtp-Source: ACHHUZ7G2JeJzsfIVCXT6FVqm2TzFEuGN7Z6PphBd+FoFBIeaeJa/lZFQTqfTOGLXyzDrLqVLo4FtA==
X-Received: by 2002:a17:903:32c4:b0:1b1:76c2:2966 with SMTP id
 i4-20020a17090332c400b001b176c22966mr24991113plr.20.1687450624656; 
 Thu, 22 Jun 2023 09:17:04 -0700 (PDT)
Received: from MaxdeMBP.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 c1-20020a170902d48100b001b3f039f8a8sm5609683plg.61.2023.06.22.09.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 09:17:04 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com,
	Max Chou <max.chou@sifive.com>
Subject: [PATCH v4 00/17] Add RISC-V vector cryptographic instruction set
 support
Date: Fri, 23 Jun 2023 00:16:16 +0800
Message-Id: <20230622161646.32005-1-max.chou@sifive.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x633.google.com
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

This patchset provides an implementation for Zvbb, Zvbc, Zvkned, Zvknh, Zvksh, Zvkg, and Zvksed of the draft RISC-V vector cryptography extensions as per the v20230620 version of the specification(1) (168e7b4).
This is an update to the patchset submitted to qemu-devel on Thu, 22 Jun 2023 05:49:20 -0700,

v2:

    squashed commits into one commit per extension with separate commits for
    each refactoring
    unified trans_rvzvk*.c.inc files into one trans_rvvk.c.inc
    style fixes in insn32.decode and other files
    added macros for EGS values in translation functions.
    updated from v20230303 to v20230407 of the spec:
        Zvkb has been split into Zvbb and Zvbc
        vbrev, vclz, vctz, vcpop and vwsll have been added to Zvbb.

v3:

    New patch 03/19 removes redundant “cpu_vl == 0” checks from trans_rvv.c.inc
    Introduction of new tcg ops has been factored out of patch 11/19 and into 09/19
        These ops are now added to non riscv-specific files

v4:

    New patch 08/17 fixes the tcg_gen_gvec_andcs temporary variable issue
    Patch 09/17 fixes imm mode for vror.vi
    Rebased to riscv-to-apply.next branch (de395bb):
        Replace vstart constraint checking by TCG op
    Verified by code examples provided by vector crypto spec repository (riscv-crypto)

As v20230620 is a frozen version, we are not expecting any significant changes to the specification or this patch series.

Please note that the Zvkt data-independent execution latency extension (and all extensions including it) has not been implemented, and we would recommend not using these patches in an environment where timing attacks are an issue.

Work performed by Dickon, Lawrence, Nazar, Kiran, and William from Codethink sponsored by SiFive, as well as Max Chou and Frank Chang from SiFive.

    https://github.com/riscv/riscv-crypto/releases

Thanks to those who have already reviewed:

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

Max Chou (4):
  tcg: Fix temporary variable in tcg_gen_gvec_andcs
  crypto: Create sm4_subword
  crypto: Add SM4 constant parameter CK
  target/riscv: Add Zvksed ISA extension support

Nazar Kazakov (5):
  target/riscv: Remove redundant "cpu_vl == 0" checks
  target/riscv: Move vector translation checks
  target/riscv: Add Zvkned ISA extension support
  target/riscv: Add Zvkg ISA extension support
  target/riscv: Expose Zvk* and Zvb[b,c] cpu properties

 crypto/sm4.c                             |   10 +
 include/crypto/sm4.h                     |    9 +
 target/arm/tcg/crypto_helper.c           |   10 +-
 target/riscv/cpu.c                       |   37 +
 target/riscv/cpu_cfg.h                   |    8 +
 target/riscv/helper.h                    |   95 ++
 target/riscv/insn32.decode               |   58 ++
 target/riscv/insn_trans/trans_rvv.c.inc  |  171 ++--
 target/riscv/insn_trans/trans_rvvk.c.inc |  585 ++++++++++++
 target/riscv/meson.build                 |    4 +-
 target/riscv/op_helper.c                 |    6 +
 target/riscv/translate.c                 |    1 +
 target/riscv/vcrypto_helper.c            | 1052 ++++++++++++++++++++++
 target/riscv/vector_helper.c             |  243 +----
 target/riscv/vector_internals.c          |   81 ++
 target/riscv/vector_internals.h          |  228 +++++
 tcg/tcg-op-gvec.c                        |    2 +-
 17 files changed, 2244 insertions(+), 356 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvvk.c.inc
 create mode 100644 target/riscv/vcrypto_helper.c
 create mode 100644 target/riscv/vector_internals.c
 create mode 100644 target/riscv/vector_internals.h

-- 
2.31.1


