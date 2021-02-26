Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFTep-00052h-W3
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:19:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTeo-00052H-5D
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:19:10 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:44408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTel-0000Hq-O2
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:19:09 -0500
Received: by mail-pf1-x42f.google.com with SMTP id t29so5302871pfg.11
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=nMrbM3n/lG7OiO8Hu2eXnLa/MHZwMHcfa7cH5Fjd0e0=;
 b=TIW4PBn9wmS9TOzEJqWg6cJZukYktOuvyV7SYVobnPtrlxgNB5TNqMGmmDS/j2lt6w
 C41dS7C6NI4okL1E3Zypz98Kgowni+BhDDSNRk2qi05VDjR3FHANQ8ZFmsZk/+HWC1Fm
 AanlykZHffKAvwr/uNhu6YhjyE8a80kL3sBXd9otVrbTEMVh6lbFGQNZzLP4td8UcQo9
 OZQVKrd3w2zbLYLlxnzcS4QrhqLWEpHvk0mHh3hciOsLO3O4z9lLcn1ahVCMZ8iqeV6v
 rm3Rqk0OjTtDvpf5x6nxiVltxPeBBUWHaKDVdCS/voyLUVIoo10u5wL99TdBk3rBh35f
 /3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=nMrbM3n/lG7OiO8Hu2eXnLa/MHZwMHcfa7cH5Fjd0e0=;
 b=cxqv28y1nKAvRs1vcPow3kIaLOSTTqlXa0QnDP8z5tgyOG0bJinDEs4vaNo6wHLT+G
 NdBhl6Ti/2LLWlMzdsOwlLRJekM7+agmP9UVbPe0OpdvZUC4tlGpapmkXpxugcbWiWIl
 2Rv1kAgoLPowL3c7EepxGVOcxpuZ/JGXV5TA5yZntEGRt24iDgJY3Stcih3/xTp5dG63
 BVXPAtPzI8zqed1XQKQT/9ankWxmxUVmOYyGU8MglXEpxoMYeew14Vt5wdjGsm9NbVLy
 mbYG0ZDaS9d7ov9Cl63LsPn22P9YQUzFYZBd1eRWCRedMLlGmDE/UiUOdvUN80J8evvb
 odNQ==
X-Gm-Message-State: AOAM532uRhzvYme2dJiTg4keOPktTFMSC6afffM6Pd6kvk71XD4i7Mov
 AbVk/w9pkkLGEkLQxwyIFfQJCw==
X-Google-Smtp-Source: ABdhPJyQzQVRz4v/3aq9LV+t7jGu0w/m9MwcSDvnL8O3C7SPwf/Q9iLOviU9uCrEtFtJADfd5LsC2A==
X-Received: by 2002:a05:6a00:c1:b029:1ee:1add:baf8 with SMTP id
 e1-20020a056a0000c1b02901ee1addbaf8mr998109pfj.64.1614309545418; 
 Thu, 25 Feb 2021 19:19:05 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:19:05 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v7 00/75] support vector extension v1.0
Date: Fri, 26 Feb 2021 11:17:44 +0800
Message-Id: <20210226031902.23656-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42f.google.com
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
X-List-Received-Date: Fri, 26 Feb 2021 03:19:10 -0000

From: Frank Chang <frank.chang@sifive.com>

This patchset implements the vector extension v1.0 for RISC-V on QEMU.

The port is available here:
https://github.com/sifive/qemu/tree/rvv-1.0-upstream-v7

You can change the cpu argument: vext_spec to v1.0 (i.e. vext_spec=v1.0)
to run with RVV v1.0 instructions.

Note: This patchset depends on another patchset listed in Based-on
      section below so it might not able to be built unless the patchset
      is applied.

Changelog:

v7
  * remove hardcoded GDB vector registers list.
  * add vsetivli instruction.
  * add vle1.v and vse1.v instructions.

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

Frank Chang (70):
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
  target/riscv: rvv-1.0: rename r2_zimm to r2_zimm11
  target/riscv: rvv-1.0: add vsetivli instruction
  target/riscv: rvv-1.0: add evl parameter to vext_ldst_us()
  target/riscv: rvv-1.0: add vector unit-stride mask load/store insns

Greentime Hu (1):
  target/riscv: rvv-1.0: add vlenb register

Hsiangkai Wang (1):
  target/riscv: gdb: support vector registers for rv64 & rv32

LIU Zhiwei (3):
  target/riscv: rvv-1.0: add mstatus VS field
  target/riscv: rvv-1.0: add sstatus VS field
  target/riscv: rvv-1.0: add vcsr register

 target/riscv/cpu.c                      |   12 +-
 target/riscv/cpu.h                      |   75 +-
 target/riscv/cpu_bits.h                 |   10 +
 target/riscv/cpu_helper.c               |   15 +-
 target/riscv/csr.c                      |   85 +-
 target/riscv/fpu_helper.c               |   17 +-
 target/riscv/gdbstub.c                  |  184 ++
 target/riscv/helper.h                   |  505 ++-
 target/riscv/insn32-64.decode           |   18 +-
 target/riscv/insn32.decode              |  300 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 2529 ++++++++++-----
 target/riscv/internals.h                |   24 +-
 target/riscv/translate.c                |   72 +-
 target/riscv/vector_helper.c            | 3729 ++++++++++++-----------
 14 files changed, 4594 insertions(+), 2981 deletions(-)

--
2.17.1


