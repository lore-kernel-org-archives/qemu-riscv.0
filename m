Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWHj-0001Xx-CU
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:42:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWHh-0001Pa-JZ
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:42:49 -0500
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWHd-0004jI-Ms
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:42:49 -0500
Received: by mail-pj1-x1043.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so8919887pjb.1
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aSdSZoXanzTgHiZ8WDnCFrnwnqhaD0exhElRW6JfOMo=;
 b=QytBWJr0549HbrLCw3qW6jVOSfk6pOovCPBzscu6Hf22i+skwzOIUXbDGzpD09uqtn
 PEEcY9xEkDLMmZVOKq9XgRV8u/NxnJur8xBI+bcgcet012d2VA0H6L4vco0j2BoZlkEj
 1saXzas+h0grkNXR391THlFYqhTpvU44sxkbwxUwlP6XyD7l+g68rAH/q85T8lRXOwI2
 eS9dX2oWDFmbmTX6V54XhNgTHjEa/e+PjiMt+OzYgoJsoYap2o3YokSZCKOWCgBqdxGE
 yPMaC9EyteYb59FRVQA4f6qvbMIcpa3wqAHOIiiyRdfswdFs+u305V+qDO8rjE69Ei3r
 SlsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aSdSZoXanzTgHiZ8WDnCFrnwnqhaD0exhElRW6JfOMo=;
 b=RWOTt/Fv34zdogxTjdR3vqluwrUuic0j7uX/XqGwtiPJ5cYFgDgpwczObMtdy1Yujr
 AttxsXmCQm4pytymRqXrV11R2NwMNOaltm+8lokA1llX05qbrI7QpPRy/5v3FIm8vdHB
 +ymXxHPn1z6DX9aciHyrgJOHPT/vMTkWIw7UtAzqFzCcN44J8iOvpiDkvHoEZsnPQEI+
 iiTRRP87BFGuApshZLQxgQ1bMi2o32xb5DeUy1kTzOy8Vx0p/IPxdGMocVTz+gjk7rgN
 k9SDER84voM/pQth+YYTBfJQf5prsSbF5wZ4iweTpxxF6I3/5i37uWnzK8qhEFAEcAY0
 vWQg==
X-Gm-Message-State: AO0yUKVqkN4kfIximDpNVTm934kv0lbhSVjW0l+XFyLFIWD31ZYf9iCE
 lFQPaY0+DjaRbLBdV8bgGQGicA==
X-Google-Smtp-Source: AK7set/2ujarD1exflccFys3VoRCR/XbLyycV13K9A3iQvt6/OuuadIOhdrgipk9EpNRb2Z9C5hdzg==
X-Received: by 2002:a05:6a21:329e:b0:b8:a17c:75e4 with SMTP id
 yt30-20020a056a21329e00b000b8a17c75e4mr30276055pzb.48.1677476564139; 
 Sun, 26 Feb 2023 21:42:44 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:42:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 00/70] tcg: Remove tcg_const_*
Date: Sun, 26 Feb 2023 19:41:23 -1000
Message-Id: <20230227054233.390271-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:42:49 -0000

This completes the transition from tcg_const_* to
tcg_constant_* that started in 2020.

This isn't hard, but non-mechanical.  One must identify when the
variable is used only for the constant, or if it is also written
as a general purpose temporary.  For the most part, breaking this
apart makes the code easier to understand.

Based-on: 20230227052505.352889-1-richard.henderson@linaro.org
("[PATCH v2 00/76] tcg: Drop tcg_temp_free from translators")

which I've just realized is actualy based on v4 not v3 of

Message-Id: 20230227053701.368744-1-richard.henderson@linaro.org
("[PATCH v4 00/31] tcg: Simplify temporary usage")

so for avoidance of doubt:

https://gitlab.com/rth7680/qemu/-/tree/tcg-const (c44933e0)


r~


Richard Henderson (70):
  target/arm: Use rmode >= 0 for need_rmode
  target/arm: Handle FPROUNDING_ODD in arm_rmode_to_sf
  target/arm: Improve arm_rmode_to_sf
  target/arm: Consistently use ARMFPRounding during translation
  target/arm: Create gen_set_rmode, gen_restore_rmode
  target/arm: Improve trans_BFCI
  target/arm: Avoid tcg_const_ptr in gen_sve_{ldr,str}
  target/arm: Avoid tcg_const_* in translate-mve.c
  target/arm: Avoid tcg_const_ptr in disas_simd_zip_trn
  target/arm: Avoid tcg_const_ptr in handle_vec_simd_sqshrn
  target/arm: Avoid tcg_const_ptr in handle_rev
  target/avr: Avoid use of tcg_const_i32 in SBIC, SBIS
  target/avr: Avoid use of tcg_const_i32 throughout
  target/cris: Avoid use of tcg_const_i32 throughout
  target/hexagon: Use tcg_constant_* for gen_constant_from_imm
  target/hexagon/idef-parser: Use gen_tmp for LPCFG
  target/hexagon/idef-parser: Use gen_tmp for gen_pred_assign
  target/hexagon/idef-parser: Use gen_tmp for gen_rvalue_pred
  target/hexagon/idef-parser: Use gen_constant for
    gen_extend_tcg_width_op
  target/hppa: Avoid tcg_const_i64 in trans_fid_f
  target/hppa: Avoid use of tcg_const_i32 throughout
  target/i386: Simplify POPF
  target/i386: Avoid use of tcg_const_* throughout
  target/m68k: Reject immediate as destination in gen_ea_mode
  target/m68k: Use tcg_constant_i32 in gen_ea_mode
  target/m68k: Avoid tcg_const_i32 when modified
  target/m68k: Avoid tcg_const_i32 in bfop_reg
  target/m68k: Avoid tcg_const_* throughout
  target/microblaze: Avoid tcg_const_* throughout
  target/mips: Split out gen_lxl
  target/mips: Split out gen_lxr
  target/mips: Avoid tcg_const_tl in gen_r6_ld
  target/mips: Avoid tcg_const_* throughout
  target/ppc: Split out gen_vx_vmul10
  target/ppc: Avoid tcg_const_i64 in do_vector_shift_quad
  target/ppc: Avoid tcg_const_i64 in do_vcntmb
  target/ppc: Avoid tcg_const_* in vmx-impl.c.inc
  target/ppc: Avoid tcg_const_* in xxeval
  target/ppc: Avoid tcg_const_* in vsx-impl.c.inc
  target/ppc: Avoid tcg_const_* in fp-impl.c.inc
  target/ppc: Avoid tcg_const_* in power8-pmu-regs.c.inc
  target/ppc: Rewrite trans_ADDG6S
  target/ppc: Fix gen_tlbsx_booke206
  target/ppc: Avoid tcg_const_* in translate.c
  target/riscv: Avoid tcg_const_*
  target/rx: Use tcg_gen_abs_i32
  target/rx: Use cpu_psw_z as temp in flags computation
  target/rx: Avoid tcg_const_i32 when new temp needed
  target/rx: Avoid tcg_const_i32
  target/s390x: Split out gen_ri2
  target/s390x: Avoid tcg_const_i64
  target/sh4: Avoid tcg_const_i32 for TAS.B
  target/sh4: Avoid tcg_const_i32
  tcg/sparc: Avoid tcg_const_tl in gen_edge
  target/sparc: Avoid tcg_const_{tl,i32}
  target/tricore: Split t_n as constant from temp as variable
  target/tricore: Rename t_off10 and use tcg_constant_i32
  target/tricore: Use min/max for saturate
  target/tricore: Use setcondi instead of explicit allocation
  target/tricore: Drop some temp initialization
  target/tricore: Avoid tcg_const_i32
  target/xtensa: Tidy translate_bb
  target/xtensa: Tidy translate_clamps
  target/xtensa: Avoid tcg_const_i32 in translate_l32r
  target/xtensa: Use tcg_gen_subfi_i32 in translate_sll
  target/xtensa: Split constant in bit shift
  target/xtensa: Avoid tcg_const_i32
  tcg: Replace tcg_const_i64 in tcg-op.c
  tcg: Drop tcg_const_*_vec
  tcg: Drop tcg_const_*

 include/tcg/tcg-op.h                        |   4 -
 include/tcg/tcg.h                           |  10 -
 target/arm/internals.h                      |  12 +-
 target/arm/translate.h                      |  17 +
 target/hexagon/idef-parser/parser-helpers.h |   6 -
 target/arm/translate-a64.c                  | 168 +++----
 target/arm/translate-mve.c                  |  56 +--
 target/arm/translate-sve.c                  |  28 +-
 target/arm/translate-vfp.c                  |  26 +-
 target/arm/translate.c                      |  13 +-
 target/arm/vfp_helper.c                     |  35 +-
 target/avr/translate.c                      |  48 +-
 target/cris/translate.c                     |  46 +-
 target/hexagon/idef-parser/parser-helpers.c |  49 +-
 target/hppa/translate.c                     |  35 +-
 target/i386/tcg/translate.c                 | 138 +++---
 target/m68k/translate.c                     | 235 +++++-----
 target/microblaze/translate.c               |  35 +-
 target/mips/tcg/mxu_translate.c             |   4 +-
 target/mips/tcg/translate.c                 | 282 +++++-------
 target/mips/tcg/tx79_translate.c            |   4 +-
 target/ppc/translate.c                      | 148 +++---
 target/riscv/translate.c                    |   4 +-
 target/rx/translate.c                       |  84 ++--
 target/s390x/tcg/translate.c                |  43 +-
 target/sh4/translate.c                      |  35 +-
 target/sparc/translate.c                    |  94 ++--
 target/tricore/translate.c                  | 476 ++++++++++----------
 target/xtensa/translate.c                   |  50 +-
 tcg/tcg-op-vec.c                            |  34 +-
 tcg/tcg-op.c                                |  12 +-
 tcg/tcg.c                                   |  16 -
 target/cris/translate_v10.c.inc             |  26 +-
 target/mips/tcg/micromips_translate.c.inc   |   4 +-
 target/mips/tcg/nanomips_translate.c.inc    |  16 +-
 target/ppc/power8-pmu-regs.c.inc            |   4 +-
 target/ppc/translate/fixedpoint-impl.c.inc  |  44 +-
 target/ppc/translate/fp-impl.c.inc          |  26 +-
 target/ppc/translate/vmx-impl.c.inc         | 130 +++---
 target/ppc/translate/vsx-impl.c.inc         |  36 +-
 target/riscv/insn_trans/trans_rvv.c.inc     |   4 +-
 target/riscv/insn_trans/trans_rvzfh.c.inc   |   2 +-
 tcg/i386/tcg-target.c.inc                   |   9 +-
 target/hexagon/idef-parser/idef-parser.y    |   2 +-
 44 files changed, 1158 insertions(+), 1392 deletions(-)

-- 
2.34.1


