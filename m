Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmYtA-0004qP-NL
	for mharc-qemu-riscv@gnu.org; Wed, 12 Apr 2023 07:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYt3-0004f6-JC
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 07:43:41 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYsz-0002N2-08
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 07:43:39 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d9so10668017wrb.11
 for <qemu-riscv@nongnu.org>; Wed, 12 Apr 2023 04:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681299815; x=1683891815;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ykP3xVI8pWw8u2pK+O7y+LoI+xmynxJAVrmltlOmv/M=;
 b=RXW8FibE1DM0PtrCDy1foCf3Qd39BmoeIzUGkb7lpPus8shNdJvHXV4vpppTmZ9Te/
 55sJaG+EbIwJTuuj/8SjfrDI8uQdVVFul6CKJu7mcU6lrUBPssKIg+Vp81oD+MXCtSLA
 f7LIaZwILVN9H3jXSnXHSW1RAMzAcVtmVCLJt8LLKhx09iOfMq9UVhuVfJLVOCxeMMGY
 1vGvojwXAafkGQNngPkxjagESymOJf6xyEc28dI9F/YiNgMDpcj2EEijkq467LCIEcVk
 8MGXRZnXfSHyR2/z1SCuOZh0p16/urbneYhRWRn03h9mfLdUld5tWHj3jRhf+WKmg/Kj
 6cig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681299815; x=1683891815;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ykP3xVI8pWw8u2pK+O7y+LoI+xmynxJAVrmltlOmv/M=;
 b=G9M7TVU6SImo/aT3y2WoYPwaMe7J7E+3tkU7nrWfqvHXuGIBnkOB2/DRORh2xDPI+x
 YGc6SPlBLTtSFk3OTLOSMXcUEC8mIOkx2oSDdXNKX+vB5C0TbdQDuC04skMc5dNZipWs
 pE8ACz4KJIyqLVW6APfi+pUWyjW9u8kKGGTVC8WFK1ZJ8w/18YWDNG9yOVh094OPWQMM
 cUKRU1Kz5BMEqPvrxTbss4UxBcpTMhBiYhPFzGUM/AKGbeyLxWysqJvIBL/xlmrRscM/
 iNGdJxbR6sTqRSeKXC0L5bZYzyiCz/j1nIvpNRRmzmfZGKJwBh9tde4mtXnN4wAI0liu
 C60Q==
X-Gm-Message-State: AAQBX9esEuWnLD+8a+F+mJ6//+PC4abkLHOVrbQTgsKGy1ab6KNSDpEP
 tlPcrtzLnqCkewo1y8xtgA1X3w==
X-Google-Smtp-Source: AKy350b5+u1LHdXiN+r/ZgeVha9/uu/GfJlIpcE3ps+RY/juZd9LFEAkmdCrNCNi2MScaadqj8r8HQ==
X-Received: by 2002:a5d:5683:0:b0:2f1:b67b:9f7d with SMTP id
 f3-20020a5d5683000000b002f1b67b9f7dmr7096337wrv.61.1681299815448; 
 Wed, 12 Apr 2023 04:43:35 -0700 (PDT)
Received: from stoup.hotel.gast (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d4289000000b002d21379bcabsm16980826wrq.110.2023.04.12.04.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 04:43:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 00/25] target/riscv: MSTATUS_SUM + cleanups
Date: Wed, 12 Apr 2023 13:43:08 +0200
Message-Id: <20230412114333.118895-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
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
X-List-Received-Date: Wed, 12 Apr 2023 11:43:42 -0000

v6: 20230325105429.1142530-1-richard.henderson@linaro.org

Changes for v7:
  * Rebase on Alistair's riscv-to-apply.next.
  * Replace priv_level() with ctx->priv in trans_xthead.c.inc (Zhiwei).


r~


Fei Wu (2):
  target/riscv: Separate priv from mmu_idx
  target/riscv: Reduce overhead of MSTATUS_SUM change

LIU Zhiwei (4):
  target/riscv: Extract virt enabled state from tb flags
  target/riscv: Add a general status enum for extensions
  target/riscv: Encode the FS and VS on a normal way for tb flags
  target/riscv: Add a tb flags field for vstart

Richard Henderson (19):
  target/riscv: Remove mstatus_hs_{fs, vs} from tb_flags
  accel/tcg: Add cpu_ld*_code_mmu
  target/riscv: Use cpu_ld*_code_mmu for HLVX
  target/riscv: Handle HLV, HSV via helpers
  target/riscv: Rename MMU_HYP_ACCESS_BIT to MMU_2STAGE_BIT
  target/riscv: Introduce mmuidx_sum
  target/riscv: Introduce mmuidx_priv
  target/riscv: Introduce mmuidx_2stage
  target/riscv: Move hstatus.spvp check to check_access_hlsv
  target/riscv: Set MMU_2STAGE_BIT in riscv_cpu_mmu_index
  target/riscv: Check SUM in the correct register
  target/riscv: Hoist second stage mode change to callers
  target/riscv: Hoist pbmte and hade out of the level loop
  target/riscv: Move leaf pte processing out of level loop
  target/riscv: Suppress pte update with is_debug
  target/riscv: Don't modify SUM with is_debug
  target/riscv: Merge checks for reserved pte flags
  target/riscv: Reorg access check in get_physical_address
  target/riscv: Reorg sum check in get_physical_address

 include/exec/cpu_ldst.h                       |   9 +
 target/riscv/cpu.h                            |  47 +-
 target/riscv/cpu_bits.h                       |  12 +-
 target/riscv/helper.h                         |  12 +-
 target/riscv/internals.h                      |  35 ++
 accel/tcg/cputlb.c                            |  48 +++
 accel/tcg/user-exec.c                         |  58 +++
 target/riscv/cpu.c                            |   2 +-
 target/riscv/cpu_helper.c                     | 403 +++++++++---------
 target/riscv/csr.c                            |  21 +-
 target/riscv/op_helper.c                      | 113 ++++-
 target/riscv/translate.c                      |  70 +--
 .../riscv/insn_trans/trans_privileged.c.inc   |   2 +-
 target/riscv/insn_trans/trans_rvf.c.inc       |   2 +-
 target/riscv/insn_trans/trans_rvh.c.inc       | 137 +++---
 target/riscv/insn_trans/trans_rvv.c.inc       |  22 +-
 target/riscv/insn_trans/trans_xthead.c.inc    |  14 +-
 17 files changed, 591 insertions(+), 416 deletions(-)

-- 
2.34.1


