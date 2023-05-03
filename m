Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6aS-0006iK-GY
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:07:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Zr-0004z6-Gd
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:04 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Zn-0005Yo-J6
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:03 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3062d764455so2202413f8f.3
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097618; x=1685689618;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1Pfe+CP4qQ+vpFCCjhXT+4NLt0v40Y1a0bullRiniiE=;
 b=tHx2p72dvbcg9N8wlxk1GKFv610gI1+XCBgBzkmQkC/UJMWBVO5r4Dj3ZhZ3bhxw5+
 JqEE8QVLNjLO3K5nf+4HLc2VACFnol9zOo9SSAa1yuU9E1A9O9bNnSmzrHwx8stMErVl
 w9Z0XuF08kLNn7ZmWJPDoectfQPI9Nkvc1so6PYZOSZqWG2vT9IXgSuaH70seEDbYLsz
 YCGihb5BOUWA91R3JZjKeKU3onBgGRCiYF2aL+gJWZuBy5Z/lXUyw3d6kcLI/f6rpxU4
 Xz1Lx8pyR8o6mOOjtScPTeMxjZrfBxoxZ+UmuFe6vCsgD3TE/xO/+FfpM3XLDPHq2wb+
 oRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097618; x=1685689618;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1Pfe+CP4qQ+vpFCCjhXT+4NLt0v40Y1a0bullRiniiE=;
 b=LQ2Ho3PFiU7zi7VcnKvREs9LyY3l+2F0f4N7OGuRFcetpMpT1o47wwje1/wRyCuq7h
 8eQgvFWYHwnPaC2rvT1O53xjqE3mUJnwMKPtT6Ka3Erojy8PVeDcIxF02FdMVcjLABXB
 IjI4YI0e8F11KGPT24l9wulOckrqj57Aj0a3HpSojdLkaSbJnYUs8BRl8IGt30VYd8Je
 gOZs+XF1fSRYvbnV+T7Qv7HcEB77aD8dbErdQQyYrEHQlOUIS3EQCwZy6lhl8kpqHVGP
 pHgRlKL8Vnrx31Nx4dJQleL3OBuVhJ5MmEcGuD1lrTgx6PiNljy1dz3pWEwHacJQNI/4
 RUMA==
X-Gm-Message-State: AC+VfDxx7idK//nu8+wNbm2n9F8WDhIVjm0JkyiyuzgNvFGFhL1imhcz
 ogy3DqqnwyZSLm3QJ58drNGvQA==
X-Google-Smtp-Source: ACHHUZ5bjPOMB2COQTPICDx0dUOgKooATadj9exb6l6vZOtj+f58p/oR/fz8ecJ1p5UO+SnkWnUi/A==
X-Received: by 2002:adf:f509:0:b0:306:2e05:f9ec with SMTP id
 q9-20020adff509000000b003062e05f9ecmr5962604wro.66.1683097617650; 
 Wed, 03 May 2023 00:06:57 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:06:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 00/57] tcg: Improve atomicity support
Date: Wed,  3 May 2023 08:05:59 +0100
Message-Id: <20230503070656.1746170-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
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
X-List-Received-Date: Wed, 03 May 2023 07:07:04 -0000

v1: https://lore.kernel.org/qemu-devel/20221118094754.242910-1-richard.henderson@linaro.org/
v2: https://lore.kernel.org/qemu-devel/20230216025739.1211680-1-richard.henderson@linaro.org/
v3: https://lore.kernel.org/qemu-devel/20230425193146.2106111-1-richard.henderson@linaro.org/

Based-on: 20230503065729.1745843-1-richard.henderson@linaro.org
("[PATCH v4 00/54] tcg: Simplify calls to load/store helpers")

The main objective here is to support Arm FEAT_LSE2, which says that any
single memory access that does not cross a 16-byte boundary is atomic.
This is the MO_ATOM_WITHIN16 control.

While I'm touching all of this, a secondary objective is to handle the
atomicity of the IBM machines.  Both Power and s390x treat misaligned
accesses as atomic on the lsb of the pointer.  For instance, an 8-byte
access at ptr % 8 == 4 will appear as two atomic 4-byte accesses, and
ptr % 4 == 2 will appear as four 2-byte accesses.
This is the MO_ATOM_SUBALIGN control.

By default, acceses are atomic only if aligned, which is the current
behaviour of the tcg code generator (mostly, anyway, there were bugs).
This is the MO_ATOM_IFALIGN control.

Further, one can say that a large memory access is really a set of
contiguous smaller accesses, and we need not provide more atomicity
than that (modulo MO_ATOM_WITHIN16).  This is the MO_ATMAX_* control.

Changes for v4:
  - Rebase, fixing some conflicts.


r~


Richard Henderson (57):
  include/exec/memop: Add bits describing atomicity
  accel/tcg: Add cpu_in_serial_context
  accel/tcg: Introduce tlb_read_idx
  accel/tcg: Reorg system mode load helpers
  accel/tcg: Reorg system mode store helpers
  accel/tcg: Honor atomicity of loads
  accel/tcg: Honor atomicity of stores
  target/loongarch: Do not include tcg-ldst.h
  tcg: Unify helper_{be,le}_{ld,st}*
  accel/tcg: Implement helper_{ld,st}*_mmu for user-only
  tcg/tci: Use helper_{ld,st}*_mmu for user-only
  tcg: Add 128-bit guest memory primitives
  meson: Detect atomic128 support with optimization
  tcg/i386: Add have_atomic16
  accel/tcg: Use have_atomic16 in ldst_atomicity.c.inc
  accel/tcg: Add aarch64 specific support in ldst_atomicity
  tcg/aarch64: Detect have_lse, have_lse2 for linux
  tcg/aarch64: Detect have_lse, have_lse2 for darwin
  accel/tcg: Add have_lse2 support in ldst_atomicity
  tcg: Introduce TCG_OPF_TYPE_MASK
  tcg/i386: Use full load/store helpers in user-only mode
  tcg/aarch64: Use full load/store helpers in user-only mode
  tcg/ppc: Use full load/store helpers in user-only mode
  tcg/loongarch64: Use full load/store helpers in user-only mode
  tcg/riscv: Use full load/store helpers in user-only mode
  tcg/arm: Adjust constraints on qemu_ld/st
  tcg/arm: Use full load/store helpers in user-only mode
  tcg/mips: Use full load/store helpers in user-only mode
  tcg/s390x: Use full load/store helpers in user-only mode
  tcg/sparc64: Allocate %g2 as a third temporary
  tcg/sparc64: Rename tcg_out_movi_imm13 to tcg_out_movi_s13
  tcg/sparc64: Rename tcg_out_movi_imm32 to tcg_out_movi_u32
  tcg/sparc64: Split out tcg_out_movi_s32
  tcg/sparc64: Use standard slow path for softmmu
  accel/tcg: Remove helper_unaligned_{ld,st}
  tcg/loongarch64: Assert the host supports unaligned accesses
  tcg/loongarch64: Support softmmu unaligned accesses
  tcg/riscv: Support softmmu unaligned accesses
  tcg: Introduce tcg_target_has_memory_bswap
  tcg: Add INDEX_op_qemu_{ld,st}_i128
  tcg: Support TCG_TYPE_I128 in tcg_out_{ld,st}_helper_{args,ret}
  tcg: Introduce atom_and_align_for_opc
  tcg/i386: Use atom_and_align_for_opc
  tcg/aarch64: Use atom_and_align_for_opc
  tcg/arm: Use atom_and_align_for_opc
  tcg/loongarch64: Use atom_and_align_for_opc
  tcg/mips: Use atom_and_align_for_opc
  tcg/ppc: Use atom_and_align_for_opc
  tcg/riscv: Use atom_and_align_for_opc
  tcg/s390x: Use atom_and_align_for_opc
  tcg/sparc64: Use atom_and_align_for_opc
  tcg/i386: Honor 64-bit atomicity in 32-bit mode
  tcg/i386: Support 128-bit load/store with have_atomic16
  tcg/aarch64: Rename temporaries
  tcg/aarch64: Support 128-bit load/store
  tcg/ppc: Support 128-bit load/store
  tcg/s390x: Support 128-bit load/store

 accel/tcg/internal.h             |    5 +
 accel/tcg/tcg-runtime.h          |    3 +
 include/exec/cpu-defs.h          |    7 +-
 include/exec/cpu_ldst.h          |   26 +-
 include/exec/memop.h             |   36 +
 include/qemu/cpuid.h             |   18 +
 include/tcg/tcg-ldst.h           |   72 +-
 include/tcg/tcg-opc.h            |    8 +
 include/tcg/tcg.h                |   22 +-
 tcg/aarch64/tcg-target-con-set.h |    2 +
 tcg/aarch64/tcg-target.h         |    6 +-
 tcg/arm/tcg-target-con-set.h     |   16 +-
 tcg/arm/tcg-target-con-str.h     |    5 +-
 tcg/arm/tcg-target.h             |    3 +-
 tcg/i386/tcg-target.h            |    7 +-
 tcg/loongarch64/tcg-target.h     |    3 +-
 tcg/mips/tcg-target.h            |    4 +-
 tcg/ppc/tcg-target-con-set.h     |    2 +
 tcg/ppc/tcg-target-con-str.h     |    1 +
 tcg/ppc/tcg-target.h             |    4 +-
 tcg/riscv/tcg-target.h           |    4 +-
 tcg/s390x/tcg-target-con-set.h   |    2 +
 tcg/s390x/tcg-target.h           |    4 +-
 tcg/sparc64/tcg-target-con-set.h |    2 -
 tcg/sparc64/tcg-target-con-str.h |    1 -
 tcg/sparc64/tcg-target.h         |    4 +-
 tcg/tcg-internal.h               |    2 +
 tcg/tci/tcg-target.h             |    4 +-
 accel/tcg/cpu-exec-common.c      |    3 +
 accel/tcg/cputlb.c               | 1799 ++++++++++++++++++------------
 accel/tcg/tb-maint.c             |    2 +-
 accel/tcg/user-exec.c            |  489 +++++---
 target/loongarch/csr_helper.c    |    1 -
 target/loongarch/iocsr_helper.c  |    1 -
 tcg/optimize.c                   |   15 +-
 tcg/tcg-op.c                     |  265 +++--
 tcg/tcg.c                        |  270 ++++-
 tcg/tci.c                        |  150 +--
 accel/tcg/ldst_atomicity.c.inc   | 1373 +++++++++++++++++++++++
 docs/devel/loads-stores.rst      |   36 +-
 docs/devel/tcg-ops.rst           |   11 +-
 meson.build                      |   52 +-
 tcg/aarch64/tcg-target.c.inc     |  384 +++++--
 tcg/arm/tcg-target.c.inc         |  121 +-
 tcg/i386/tcg-target.c.inc        |  366 ++++--
 tcg/loongarch64/tcg-target.c.inc |   91 +-
 tcg/mips/tcg-target.c.inc        |  104 +-
 tcg/ppc/tcg-target.c.inc         |  261 +++--
 tcg/riscv/tcg-target.c.inc       |  132 +--
 tcg/s390x/tcg-target.c.inc       |  177 ++-
 tcg/sparc64/tcg-target.c.inc     |  714 ++++--------
 tcg/tci/tcg-target.c.inc         |    8 +-
 52 files changed, 4663 insertions(+), 2435 deletions(-)
 create mode 100644 accel/tcg/ldst_atomicity.c.inc

-- 
2.34.1


