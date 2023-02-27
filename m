Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWCG-0001RV-K7
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:37:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCE-0001MN-Kw
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:37:10 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCB-0002Ob-Fj
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:37:10 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 gi3-20020a17090b110300b0023762f642dcso5026617pjb.4
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B2k63odgqwCwMmlbN0Ay9HxzLH/H4RVV/EBr82yWI7k=;
 b=mI3JkLRNmk389spVlxsA6a+OCzUabjk1K20R4AyZ3J8IXm8U1Whi86fIordpk8z1E5
 caRRjwvaAkxhUBUo6jdI1TxMRqN9cDjBuLo6YepoG+wZFixrXpLzMTTiFa+rPTSnF7l9
 8r1+Z/J1fST0PVr2niMw8iZhggWvQCfIatZyuRLegB1kuyK2mRDDZiUJyf44VpVSvynH
 14mdRwL8/TRwza5iOR98b2rdY8qLbT0oqG8c72kea3luKfQixBSxKXP1iKje3F1/zNt9
 rvGAYA17WLbJ5HwAbaxpwul0pkIgo5H1aUvXGIjBp16Q3QcIxDYJqp5+GIBWVh5KKGD4
 i+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B2k63odgqwCwMmlbN0Ay9HxzLH/H4RVV/EBr82yWI7k=;
 b=TLyIreG5HrK4RuSaPN3CXxrEjv78gb7PHIO2nP+uF+UMlc3Y1ROUhVf3KUmWPxKg93
 eXSYca1zGHeEhaU991LrFs5vHYtjD52Fx3F5v4RuC9o8xQ0sE0Uk5pGPxyD2SvT3ZCHo
 1FBT+WYqHfwLkuCy5Mg/S0MBNOfkREkyMFtHx2dzvzux/aCaOqGVhS1FPEPpGq5I9rXG
 xA4VPbOzaVcIpXrb8WFxYgPLqkBj+P2ZNDNaNK4T/24CIRXRLAf1/zVkPfNjGTSGz5XU
 cf/W3bC7ZnyifOWYDnbbiaqXg7r8VP4I/62KrRNOY0YWKVtq1UmK4vyZgmsP0HmUBXTR
 y8oA==
X-Gm-Message-State: AO0yUKV/y8YnbO19S6Bb/gBmY8NFzA0NVb33m0AqWd3xyFSds1RXIl+A
 QMUvgyPVxLkjsoj+2f84sRfa1w==
X-Google-Smtp-Source: AK7set/eiKE8+fptFM7g3C63fSbeAWaExNklq88T02MtUtEIAgtEzgBCL9bysInUqtoJrSHrcPrGIw==
X-Received: by 2002:a05:6a20:9382:b0:cc:7faa:ae10 with SMTP id
 x2-20020a056a20938200b000cc7faaae10mr10906796pzh.54.1677476225919; 
 Sun, 26 Feb 2023 21:37:05 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:37:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v4 00/31] tcg: Simplify temporary usage
Date: Sun, 26 Feb 2023 19:36:30 -1000
Message-Id: <20230227053701.368744-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:37:11 -0000

The biggest pitfall for new users of TCG is the fact that "normal"
temporaries die at branches, and we must therefore use a different
"local" temporary in that case.

The following patch set changes that, so that the "normal" temporary
is the one that lives across branches, and there is a special temporary
that dies at the end of the extended basic block, and this special
case is reserved for tcg internals.

Changes for v4:
  * Add patch 23, target/hexagon/idef-parser: Drop gen_tmp_local

Patches lacking review:
  07-tcg-Add-liveness_pass_0.patch
  17-tcg-Don-t-re-use-TEMP_TB-temporaries.patch
  23-target-hexagon-idef-parser-Drop-gen_tmp_local.patch


r~


Richard Henderson (31):
  tcg: Adjust TCGContext.temps_in_use check
  accel/tcg: Pass max_insn to gen_intermediate_code by pointer
  accel/tcg: Use more accurate max_insns for tb_overflow
  tcg: Remove branch-to-next regardless of reference count
  tcg: Rename TEMP_LOCAL to TEMP_TB
  tcg: Use noinline for major tcg_gen_code subroutines
  tcg: Add liveness_pass_0
  tcg: Remove TEMP_NORMAL
  tcg: Pass TCGTempKind to tcg_temp_new_internal
  tcg: Use tcg_constant_i32 in tcg_gen_io_start
  tcg: Add tcg_gen_movi_ptr
  tcg: Add tcg_temp_ebb_new_{i32,i64,ptr}
  tcg: Use tcg_temp_ebb_new_* in tcg/
  tcg: Use tcg_constant_ptr in do_dup
  accel/tcg/plugin: Use tcg_temp_ebb_*
  accel/tcg/plugin: Tidy plugin_gen_disable_mem_helpers
  tcg: Don't re-use TEMP_TB temporaries
  tcg: Change default temp lifetime to TEMP_TB
  target/arm: Drop copies in gen_sve_{ldr,str}
  target/arm: Don't use tcg_temp_local_new_*
  target/cris: Don't use tcg_temp_local_new
  target/hexagon: Don't use tcg_temp_local_new_*
  target/hexagon/idef-parser: Drop gen_tmp_local
  target/hppa: Don't use tcg_temp_local_new
  target/i386: Don't use tcg_temp_local_new
  target/mips: Don't use tcg_temp_local_new
  target/ppc: Don't use tcg_temp_local_new
  target/xtensa: Don't use tcg_temp_local_new_*
  exec/gen-icount: Don't use tcg_temp_local_new_i32
  tcg: Remove tcg_temp_local_new_*, tcg_const_local_*
  tcg: Update docs/devel/tcg-ops.rst for temporary changes

 docs/devel/tcg-ops.rst                      | 230 +++++++++-------
 target/hexagon/idef-parser/README.rst       |   4 +-
 include/exec/gen-icount.h                   |  12 +-
 include/exec/translator.h                   |   4 +-
 include/tcg/tcg-op.h                        |   7 +-
 include/tcg/tcg.h                           |  64 ++---
 target/arm/translate-a64.h                  |   1 -
 target/hexagon/gen_tcg.h                    |   4 +-
 accel/tcg/plugin-gen.c                      |  32 +--
 accel/tcg/translate-all.c                   |   2 +-
 accel/tcg/translator.c                      |   6 +-
 target/alpha/translate.c                    |   2 +-
 target/arm/translate-a64.c                  |   6 -
 target/arm/translate-sve.c                  |  38 +--
 target/arm/translate.c                      |   8 +-
 target/avr/translate.c                      |   2 +-
 target/cris/translate.c                     |   8 +-
 target/hexagon/genptr.c                     |  16 +-
 target/hexagon/idef-parser/parser-helpers.c |  26 +-
 target/hexagon/translate.c                  |   4 +-
 target/hppa/translate.c                     |   5 +-
 target/i386/tcg/translate.c                 |  29 +-
 target/loongarch/translate.c                |   2 +-
 target/m68k/translate.c                     |   2 +-
 target/microblaze/translate.c               |   2 +-
 target/mips/tcg/translate.c                 |  59 ++---
 target/nios2/translate.c                    |   2 +-
 target/openrisc/translate.c                 |   2 +-
 target/ppc/translate.c                      |   8 +-
 target/riscv/translate.c                    |   2 +-
 target/rx/translate.c                       |   2 +-
 target/s390x/tcg/translate.c                |   2 +-
 target/sh4/translate.c                      |   2 +-
 target/sparc/translate.c                    |   2 +-
 target/tricore/translate.c                  |   2 +-
 target/xtensa/translate.c                   |  18 +-
 tcg/optimize.c                              |   2 +-
 tcg/tcg-op-gvec.c                           | 189 +++++++------
 tcg/tcg-op.c                                | 258 +++++++++---------
 tcg/tcg.c                                   | 280 ++++++++++++--------
 target/cris/translate_v10.c.inc             |  10 +-
 target/mips/tcg/nanomips_translate.c.inc    |   4 +-
 target/ppc/translate/spe-impl.c.inc         |   8 +-
 target/ppc/translate/vmx-impl.c.inc         |   4 +-
 target/hexagon/README                       |   8 +-
 target/hexagon/gen_tcg_funcs.py             |  18 +-
 46 files changed, 682 insertions(+), 716 deletions(-)

-- 
2.34.1


