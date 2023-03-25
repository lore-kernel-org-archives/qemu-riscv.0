Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pg2e5-0001Y7-8E
	for mharc-qemu-riscv@gnu.org; Sat, 25 Mar 2023 08:05:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2e3-0001Xw-Fg
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 08:05:15 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2e1-0005xc-Gn
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 08:05:15 -0400
Received: by mail-pl1-x635.google.com with SMTP id o2so4156523plg.4
 for <qemu-riscv@nongnu.org>; Sat, 25 Mar 2023 05:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679745911;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T6DOxXgfwhVuuid1sN36FXalvakPDo5GNjQuqYwE/1Y=;
 b=lRdtQIKQJzA91KS3VsHpo1vNX5VTi4M42nhNWVGVJ6TZaRgArX/VnL6euxo3ve9SLk
 Ps3eod562xqQ9SzTjYle8AA5PXXX9xtJ0yO8aNvVbaAycrfi2406EmqEqkYydSWIkgo7
 mY9bl8tQ7SNzU/cRFHVq1k/binOcbRECobbCWQKO3gl00NxSVRPOEdSLMLkAoVRptBcn
 zPglRJ/pCNbKmsQ33g3GIAntxwSFHIpJNpukocq8qDRSIFPpRmv3e0nu6jvGSQ/iwEPw
 ytjn0nUGGDdMKMdfayvJHlr+nPYCijF1VCWYOQ4CJ9jhtryn7U2hJz8yUIe1NnwCWyDO
 4SoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679745911;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T6DOxXgfwhVuuid1sN36FXalvakPDo5GNjQuqYwE/1Y=;
 b=H1IoNwaLRa2mHcSvx6XOzmY1uM1A7SkX/10mN6iJnpnKHSRf+x0eCB0VNXDNj64tvr
 AdXMqF2FqxzUbAvaosKF4zz72jAuhnuYdnKPo21qoxug2wGNfGAYokrRqChoXBIamy+K
 mhXyP+8sGjk4PxWGxI+cSkxTTDFAgqIlApxebSnvUDIQn/0mSJOBGl7KNuHyNSwcY+Po
 NceZ0A1a86xFh5ufLh4hhLCackE18OxUa7Q+h9TkZuwzbqLGvU18yFLK82/q36lp1Nkj
 aKBqN4pcYWTRs7gk5qRUpTDgzVOtkB8G7fd44ac5+d2CAJxcb+VlnNQ9RrqcvUDm4f9Q
 6PTg==
X-Gm-Message-State: AAQBX9d19P9rYvYr+A14SWRbJvnpgShbUiw1njZ8l8xZz48hX+1nJyM7
 64rjCLl9wp6q14OkQ/pu/bc8GrgUkQBj+eINu6A=
X-Google-Smtp-Source: AKy350ZRq+TNFZi6CpoozgM+/E0hN/fux0ZoCILZmPfEhyvTrNpw4eRq4OgfsxnTV2BmIaBdI44K6A==
X-Received: by 2002:a17:90b:1c0c:b0:23f:78d6:b5cc with SMTP id
 oc12-20020a17090b1c0c00b0023f78d6b5ccmr5513185pjb.38.1679741671081; 
 Sat, 25 Mar 2023 03:54:31 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Subject: [PATCH v6 00/25] target/riscv: MSTATUS_SUM + cleanups
Date: Sat, 25 Mar 2023 03:54:04 -0700
Message-Id: <20230325105429.1142530-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 25 Mar 2023 12:05:15 -0000

This builds on Fei and Zhiwei's SUM and TB_FLAGS changes.

  * Reclaim 5 TB_FLAGS bits, since we nearly ran out.

  * Using cpu_mmu_index(env, true) is insufficient to implement
    HLVX properly.  While that chooses the correct mmu_idx, it
    does not perform the read with execute permission.
    I add a new tcg interface to perform a read-for-execute with
    an arbitrary mmu_idx.  This is still not 100% compliant, but
    it's closer.

  * Handle mstatus.MPV in cpu_mmu_index.
  * Use vsstatus.SUM when required for MMUIdx_S_SUM.
  * Cleanups for get_physical_address.

While this passes check-avocado, I'm sure that's insufficient.
Please have a close look.


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
  target/riscv: Remove mstatus_hs_{fs,vs} from tb_flags
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
 target/riscv/cpu.h                            |  47 ++-
 target/riscv/cpu_bits.h                       |  12 +-
 target/riscv/helper.h                         |  12 +-
 target/riscv/internals.h                      |  35 ++
 accel/tcg/cputlb.c                            |  48 +++
 accel/tcg/user-exec.c                         |  58 +++
 target/riscv/cpu.c                            |   2 +-
 target/riscv/cpu_helper.c                     | 393 +++++++++---------
 target/riscv/csr.c                            |  21 +-
 target/riscv/op_helper.c                      | 113 ++++-
 target/riscv/translate.c                      |  72 ++--
 .../riscv/insn_trans/trans_privileged.c.inc   |   2 +-
 target/riscv/insn_trans/trans_rvf.c.inc       |   2 +-
 target/riscv/insn_trans/trans_rvh.c.inc       | 135 +++---
 target/riscv/insn_trans/trans_rvv.c.inc       |  22 +-
 target/riscv/insn_trans/trans_xthead.c.inc    |   7 +-
 17 files changed, 595 insertions(+), 395 deletions(-)

-- 
2.34.1


