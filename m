Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm2Rs-0004FM-5U
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 21:05:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Rl-00049m-9Y
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:05:21 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Rh-0000Uk-Kf
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:05:20 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 nh20-20020a17090b365400b0024496d637e1so11648924pjb.5
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 18:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175115;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BU8pcWRiinHwhD710nr3z2VglzWS0PXPOPu417eVzII=;
 b=H1qUOpVp0wTKlTOXkDdCCewjapk+WqHJybvPtiQGCsJyRJnoRyVRgfQ0RoTL2Hdyfd
 ORkoepTM2hTaRidEc38GVtmGuAw+aZDoO22bKUP5P6wGv2QposZXTv7AoNYI3A7lAQcS
 8fnySBRSLz8bF9R1/+O8w8GJG6JlYEzczsHYlneeInX3+UeAcmdMoxNXYzb/Mnm9tfCI
 bVGO1BgIqXUADvMf3CYbXpkOLNPAw8lDBqbLbkP1B2sTNldz9yOO/QOt9aIASF5TNFtp
 6U6VZnUBTw/jrlQiURXXyktOkq4WZR+uqC7uxWpck4L8I3NikLMTbhH/xO2BJne6RIuG
 Sd+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175115;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BU8pcWRiinHwhD710nr3z2VglzWS0PXPOPu417eVzII=;
 b=GTJ+RI6TnFhTJDfXcxOfKXqN+Xor8CV/nElTRzGs50RzwSZ2wdbb7Dwrcs+GEPq3i6
 xdipPRZ3VmMxKlLAK3dPWZFAasrl+dLcz3bJ4/DM4j4a+LZnGsPH0MDNTRoY9HmThRE5
 FiwNwwxs87eXr9aQLU4mmMaSk9PHk9OPEZpRuMJOzm/9l3thDz1xxqzt4t1BCviiO1/u
 1gN32hkwYJK84FQUsgzkt/nfHUxW++1PZJ/vT5s1s9l2L7jx2ERhbeO7WT2BDoKcMhrO
 FDOogmNRV1+hCVWZJx4QaWxdRdP/3fUVmbNJQJ3l32uVy9rwVgEImfH01qEXl4IFeg8N
 Lu4w==
X-Gm-Message-State: AAQBX9f59gJVZV5aY+gClIPkM845lcf9bywYahqxw75++kgAWevScWQ8
 3RKTcOZwBMxV2mcQzOYts+jS2Q==
X-Google-Smtp-Source: AKy350bR/3iUfc0L+c1yX5JID8xXiKNw2q7Bw8ZpJMsf+hn+VUSQjoo4SBAjds5+7/zLKG8EV1IC3g==
X-Received: by 2002:a05:6a20:389d:b0:d7:5f98:d2a3 with SMTP id
 n29-20020a056a20389d00b000d75f98d2a3mr828547pzf.54.1681175115096; 
 Mon, 10 Apr 2023 18:05:15 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:05:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 00/54] tcg: Simplify calls to load/store helpers
Date: Mon, 10 Apr 2023 18:04:18 -0700
Message-Id: <20230411010512.5375-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 11 Apr 2023 01:05:23 -0000

v1: https://lore.kernel.org/qemu-devel/20230408024314.3357414-1-richard.henderson@linaro.org/

There are several changes to the load/store helpers coming, and making
sure that those changes are properly reflected across all of the backends
was harrowing.

I have gone back and restarted by hoisting the code out of the backends
and into tcg.c.  We already have all of the parameters for the host
function call abi for "normal" helpers, we simply need to apply that to
the load/store slow path.

The major change for v2 is to rely on init_call_layout and TCGHelperInfo
for the helper_{ld,st}*_mmu family of functions.  While v1 worked ok for
the current 32 and 64-bit helpers, it quickly fell over when I tried to
extend it to the 128-bit helpers in my outstanding atomicity patch set.

Some of the patches are large, but take heart: the diffstat is only +83.
:-)


r~


Richard Henderson (54):
  tcg: Replace if + tcg_abort with tcg_debug_assert
  tcg: Replace tcg_abort with g_assert_not_reached
  tcg: Split out tcg_out_ext8s
  tcg: Split out tcg_out_ext8u
  tcg: Split out tcg_out_ext16s
  tcg: Split out tcg_out_ext16u
  tcg: Split out tcg_out_ext32s
  tcg: Split out tcg_out_ext32u
  tcg: Split out tcg_out_exts_i32_i64
  tcg/loongarch64: Conditionalize tcg_out_exts_i32_i64
  tcg/mips: Conditionalize tcg_out_exts_i32_i64
  tcg/riscv: Conditionalize tcg_out_exts_i32_i64
  tcg: Split out tcg_out_extu_i32_i64
  tcg/i386: Conditionalize tcg_out_extu_i32_i64
  tcg: Split out tcg_out_extrl_i64_i32
  tcg: Introduce tcg_out_movext
  tcg: Introduce tcg_out_xchg
  tcg: Introduce tcg_out_movext2
  tcg: Clear TCGLabelQemuLdst on allocation
  tcg/i386: Rationalize args to tcg_out_qemu_{ld,st}
  tcg/aarch64: Rationalize args to tcg_out_qemu_{ld,st}
  tcg/arm: Rationalize args to tcg_out_qemu_{ld,st}
  tcg/mips: Rationalize args to tcg_out_qemu_{ld,st}
  tcg/loongarch64: Rationalize args to tcg_out_qemu_{ld,st}
  tcg/ppc: Rationalize args to tcg_out_qemu_{ld,st}
  tcg/s390x: Pass TCGType to tcg_out_qemu_{ld,st}
  tcg/riscv: Require TCG_TARGET_REG_BITS == 64
  tcg/riscv: Rationalize args to tcg_out_qemu_{ld,st}
  tcg/sparc64: Drop is_64 test from tcg_out_qemu_ld data return
  tcg/sparc64: Pass TCGType to tcg_out_qemu_{ld,st}
  tcg: Move TCGLabelQemuLdst to tcg.c
  tcg: Replace REG_P with arg_loc_reg_p
  tcg: Introduce arg_slot_stk_ofs
  tcg: Widen helper_*_st[bw]_mmu val arguments
  tcg: Add routines for calling slow-path helpers
  tcg/i386: Convert tcg_out_qemu_ld_slow_path
  tcg/i386: Convert tcg_out_qemu_st_slow_path
  tcg/aarch64: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/arm: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/loongarch64: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/mips: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/ppc: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/riscv: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/s390x: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/loongarch64: Simplify constraints on qemu_ld/st
  tcg/mips: Remove MO_BSWAP handling
  tcg/mips: Reorg tcg_out_tlb_load
  tcg/mips: Simplify constraints on qemu_ld/st
  tcg/ppc: Reorg tcg_out_tlb_read
  tcg/ppc: Adjust constraints on qemu_ld/st
  tcg/ppc: Remove unused constraints A, B, C, D
  tcg/riscv: Simplify constraints on qemu_ld/st
  tcg/s390x: Use ALGFR in constructing host address for qemu_ld/st
  tcg/s390x: Simplify constraints on qemu_ld/st

 include/tcg/tcg-ldst.h               |  10 +-
 include/tcg/tcg.h                    |   6 -
 tcg/loongarch64/tcg-target-con-set.h |   2 -
 tcg/loongarch64/tcg-target-con-str.h |   1 -
 tcg/mips/tcg-target-con-set.h        |  13 +-
 tcg/mips/tcg-target-con-str.h        |   2 -
 tcg/mips/tcg-target.h                |   4 +-
 tcg/ppc/tcg-target-con-set.h         |  11 +-
 tcg/ppc/tcg-target-con-str.h         |   6 -
 tcg/riscv/tcg-target-con-set.h       |   8 -
 tcg/riscv/tcg-target-con-str.h       |   1 -
 tcg/riscv/tcg-target.h               |  22 +-
 tcg/s390x/tcg-target-con-set.h       |   2 -
 tcg/s390x/tcg-target-con-str.h       |   1 -
 tcg/tcg-internal.h                   |   4 -
 accel/tcg/cputlb.c                   |   6 +-
 target/i386/tcg/translate.c          |  20 +-
 target/s390x/tcg/translate.c         |   4 +-
 tcg/optimize.c                       |  10 +-
 tcg/tcg.c                            | 707 +++++++++++++++++++++++-
 tcg/aarch64/tcg-target.c.inc         | 184 ++++---
 tcg/arm/tcg-target.c.inc             | 342 +++++-------
 tcg/i386/tcg-target.c.inc            | 359 +++++-------
 tcg/loongarch64/tcg-target.c.inc     | 271 ++++-----
 tcg/mips/tcg-target.c.inc            | 783 +++++++++------------------
 tcg/ppc/tcg-target.c.inc             | 465 ++++++++--------
 tcg/riscv/tcg-target.c.inc           | 372 +++++--------
 tcg/s390x/tcg-target.c.inc           | 249 ++++-----
 tcg/sparc64/tcg-target.c.inc         | 125 +++--
 tcg/tcg-ldst.c.inc                   |  15 +-
 tcg/tci/tcg-target.c.inc             | 116 +++-
 31 files changed, 2102 insertions(+), 2019 deletions(-)

-- 
2.34.1


