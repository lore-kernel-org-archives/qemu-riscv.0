Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzG9l-0002Y3-Fc
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:40:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzG9h-0002XX-BC
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:40:02 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:35137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzG9e-0006qL-B4
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:40:01 -0500
Received: by mail-pj1-x102c.google.com with SMTP id b5so1312668pjl.0
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=VNxJfcazFhow5tlTwHNbLkJoFR4Zys8mq4Lym2fMYoU=;
 b=G5jv3x5Frou9eWvxsUo5R956nv8NwWXPvS/GSqjLm4y3ludCFbDQ9vgHJe2gYwOI6f
 SGrcqefWgAN6CE14wAyxmMIgAe64cKl+/a57lRt1dhmy56llgCM2Ky28QRCg+yuheUqa
 CTh5r/09RgPcD9VMXzSDHuJzf59XAnc5tNN6xnVCh4B9FsyUhmLazxC8Iu/cDYaBOoDX
 5ZDY7EUn+1ek+3YRULiUwa15NmUabDD4NlnS3hIGrHXuiiTJ5zBJENUf+sB9aSCTCZ+4
 3CRP/JE1BCXMP0O4RPusE1qIHinkLJnAYv2mddxxcQanAmscWr+X5Qp8WC/YmcbSALgW
 8e+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=VNxJfcazFhow5tlTwHNbLkJoFR4Zys8mq4Lym2fMYoU=;
 b=Qu8F9Y7dgCWCz560VWrukTWve3h2l9GHlbcGlC/49IscI8NUi2LB9/7+IoDsRR228r
 LugVkEgf1VJC7rwYFM/Bk8T7scyKnLr8I8n8QjaHMJCYP/IhOy8/jyKG0Uo80UFXbYay
 Y0yjF2a9VQrkTkU/iZrOFra94xLHRlh1pSjxc/5CAlDMbW8Ud9dy8yM9fsHXOZxSrfbs
 7ci8EvQ+etwoK5q7Sqbh+y8UdYy30aB5UllWcuIajjVyayXbJte60GhBH7FaMnPTJe9h
 Y95CWWOVl1jX7V25HRjeUqFy/Xwu74TIioTzx/d2y7yg64PU6dalpiPMxD50/6rOlLZ9
 5Tkw==
X-Gm-Message-State: AOAM530bfEk0y6Uq9Q7EIoB/++J3Dj3DdM4axtrO5fr+NMpNKnD5r6Jj
 Fa0UKBQi4pKZzdKetYpYjIt7Ew==
X-Google-Smtp-Source: ABdhPJwy434BRQmHDoh0u4+y3rxdVAApoldW2Usbw4BfwG3wanKHcIgM8kl2sf0Gohbmp+Ox+9FHew==
X-Received: by 2002:a17:90a:e2cb:: with SMTP id
 fr11mr3630438pjb.169.1610444395914; 
 Tue, 12 Jan 2021 01:39:55 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:39:55 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v6 00/72] support vector extension v1.0
Date: Tue, 12 Jan 2021 17:38:34 +0800
Message-Id: <20210112093950.17530-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jan 2021 09:40:02 -0000

From: Frank Chang <frank.chang@sifive.com>

This patchset implements the vector extension v1.0 for RISC-V on QEMU.

As vector extension specification is near to be ratified, this patchset is
sent as formal patchset for review.

The port is available here:
https://github.com/sifive/qemu/tree/rvv-1.0-upstream-v6

You can change the cpu argument: vext_spec to v1.0 (i.e. vext_spec=v1.0)
to run with RVV v1.0 instructions.

Note: This patchset depends on another patchset listed in Based-on
      section below so it might not able to be built unless the patchset
	  is applied.

Changelog:

v6
  * add vector floating-point reciprocal estimate instruction.
  * add vector floating-point reciprocal square-root estimate instruction.
  * update check rules for segment register groups, each segment register
    group has to follow overlap rules.
  * update viota.m instruction check rules.

v5
  * refactor RVV v1.0 check functions.
    (Thanks to Richard Henderson's bitwise tricks.)
  * relax RV_VLEN_MAX to 1024-bits.
  * implement vstart CSR's behaviors.
  * trigger illegal instruction exception if frm is not valid for
    vector floating-point instructions.
  * rebase on riscv-to-apply.next.

v4
  * remove explicit float flmul variable in DisasContext.
  * replace floating-point calculations with shift operations to
    improve performance.
  * relax RV_VLEN_MAX to 512-bits.

v3
  * apply nan-box helpers from Richard Henderson.
  * remove fp16 api changes as they are sent independently in another
    pathcset by Chih-Min Chao.
  * remove all tail elements clear functions as tail elements can
    retain unchanged for either VTA set to undisturbed or agnostic.
  * add fp16 nan-box check generator function.
  * add floating-point rounding mode enum.
  * replace flmul arithmetic with shifts to avoid floating-point
    conversions.
  * add Zvqmac extension.
  * replace gdbstub vector register xml files with dynamic generator.
  * bumped to RVV v1.0.
  * RVV v1.0 related changes:
    * add vl<nf>re<eew>.v and vs<nf>r.v vector whole register
      load/store instructions
    * add vrgatherei16 instruction.
    * rearranged bits in vtype to make vlmul bits into a contiguous
      field.

v2
  * drop v0.7.1 support.
  * replace invisible return check macros with functions.
  * move mark_vs_dirty() to translators.
  * add SSTATUS_VS flag for s-mode.
  * nan-box scalar fp register for floating-point operations.
  * add gdbstub files for vector registers to allow system-mode
    debugging with GDB.

Based-on: <1596102747-20226-1-git-send-email-chihmin.chao@sifive.com/>

Frank Chang (66):
  target/riscv: drop vector 0.7.1 and add 1.0 support
  target/riscv: Use FIELD_EX32() to extract wd field
  target/riscv: rvv-1.0: introduce writable misa.v field
  target/riscv: rvv-1.0: add translation-time vector context status
  target/riscv: rvv-1.0: remove rvv related codes from fcsr registers
  target/riscv: rvv-1.0: check MSTATUS_VS when accessing vector csr
    registers
  target/riscv: rvv-1.0: remove MLEN calculations
  target/riscv: rvv-1.0: add fractional LMUL
  target/riscv: rvv-1.0: add VMA and VTA
  target/riscv: rvv-1.0: update check functions
  target/riscv: introduce more imm value modes in translator functions
  target/riscv: rvv:1.0: add translation-time nan-box helper function
  target/riscv: rvv-1.0: configure instructions
  target/riscv: rvv-1.0: stride load and store instructions
  target/riscv: rvv-1.0: index load and store instructions
  target/riscv: rvv-1.0: fix address index overflow bug of indexed
    load/store insns
  target/riscv: rvv-1.0: fault-only-first unit stride load
  target/riscv: rvv-1.0: amo operations
  target/riscv: rvv-1.0: load/store whole register instructions
  target/riscv: rvv-1.0: update vext_max_elems() for load/store insns
  target/riscv: rvv-1.0: take fractional LMUL into vector max elements
    calculation
  target/riscv: rvv-1.0: floating-point square-root instruction
  target/riscv: rvv-1.0: floating-point classify instructions
  target/riscv: rvv-1.0: mask population count instruction
  target/riscv: rvv-1.0: find-first-set mask bit instruction
  target/riscv: rvv-1.0: set-X-first mask bit instructions
  target/riscv: rvv-1.0: iota instruction
  target/riscv: rvv-1.0: element index instruction
  target/riscv: rvv-1.0: allow load element with sign-extended
  target/riscv: rvv-1.0: register gather instructions
  target/riscv: rvv-1.0: integer scalar move instructions
  target/riscv: rvv-1.0: floating-point move instruction
  target/riscv: rvv-1.0: floating-point scalar move instructions
  target/riscv: rvv-1.0: whole register move instructions
  target/riscv: rvv-1.0: integer extension instructions
  target/riscv: rvv-1.0: single-width averaging add and subtract
    instructions
  target/riscv: rvv-1.0: single-width bit shift instructions
  target/riscv: rvv-1.0: integer add-with-carry/subtract-with-borrow
  target/riscv: rvv-1.0: narrowing integer right shift instructions
  target/riscv: rvv-1.0: widening integer multiply-add instructions
  target/riscv: rvv-1.0: single-width saturating add and subtract
    instructions
  target/riscv: rvv-1.0: integer comparison instructions
  target/riscv: rvv-1.0: floating-point compare instructions
  target/riscv: rvv-1.0: mask-register logical instructions
  target/riscv: rvv-1.0: slide instructions
  target/riscv: rvv-1.0: floating-point slide instructions
  target/riscv: rvv-1.0: narrowing fixed-point clip instructions
  target/riscv: rvv-1.0: single-width floating-point reduction
  target/riscv: rvv-1.0: widening floating-point reduction instructions
  target/riscv: rvv-1.0: single-width scaling shift instructions
  target/riscv: rvv-1.0: remove widening saturating scaled multiply-add
  target/riscv: rvv-1.0: remove vmford.vv and vmford.vf
  target/riscv: rvv-1.0: remove integer extract instruction
  target/riscv: rvv-1.0: floating-point min/max instructions
  target/riscv: introduce floating-point rounding mode enum
  target/riscv: rvv-1.0: floating-point/integer type-convert
    instructions
  target/riscv: rvv-1.0: widening floating-point/integer type-convert
  target/riscv: add "set round to odd" rounding mode helper function
  target/riscv: rvv-1.0: narrowing floating-point/integer type-convert
  target/riscv: rvv-1.0: relax RV_VLEN_MAX to 1024-bits
  target/riscv: rvv-1.0: implement vstart CSR
  target/riscv: rvv-1.0: trigger illegal instruction exception if frm is
    not valid
  target/riscv: rvv-1.0: set mstatus.SD bit when writing vector CSRs
  target/riscv: rvv-1.0: floating-point reciprocal square-root estimate
    instruction
  target/riscv: rvv-1.0: floating-point reciprocal estimate instruction
  target/riscv: set mstatus.SD bit when writing fp CSRs

Greentime Hu (1):
  target/riscv: rvv-1.0: add vlenb register

Hsiangkai Wang (2):
  target/riscv: gdb: modify gdb csr xml file to align with csr register
    map
  target/riscv: gdb: support vector registers for rv64 & rv32

LIU Zhiwei (3):
  target/riscv: rvv-1.0: add mstatus VS field
  target/riscv: rvv-1.0: add sstatus VS field
  target/riscv: rvv-1.0: add vcsr register

 gdb-xml/riscv-32bit-csr.xml             |   18 +-
 gdb-xml/riscv-64bit-csr.xml             |   18 +-
 target/riscv/cpu.c                      |   11 +-
 target/riscv/cpu.h                      |   98 +-
 target/riscv/cpu_bits.h                 |   10 +
 target/riscv/cpu_helper.c               |   15 +-
 target/riscv/csr.c                      |   85 +-
 target/riscv/fpu_helper.c               |   17 +-
 target/riscv/gdbstub.c                  |  177 +-
 target/riscv/helper.h                   |  503 ++-
 target/riscv/insn32-64.decode           |   18 +-
 target/riscv/insn32.decode              |  290 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 2475 ++++++++++-----
 target/riscv/internals.h                |   24 +-
 target/riscv/translate.c                |   72 +-
 target/riscv/vector_helper.c            | 3690 ++++++++++++-----------
 16 files changed, 4531 insertions(+), 2990 deletions(-)

--
2.17.1


