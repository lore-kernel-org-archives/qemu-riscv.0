Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrWxO-0000DK-CC
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:03:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWxL-0000BM-Au
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:03:53 -0500
Received: from [2607:f8b0:4864:20::42f] (port=45744
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWxH-0008JN-A1
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:03:50 -0500
Received: by mail-pf1-x42f.google.com with SMTP id x131so15262204pfc.12
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+Djtk7MO02/6vQwaS5Jddg5et6k9rh0KiNtGBda+diQ=;
 b=QJDrQKxL4LeThPzeob4iCXAIqJ1bvxP57fdsxuu3B0W/aBiGJnS4qq3vbxZF0muS29
 +Xg18sgwUupu88lWoiAtOtKXMRmo0kNiddmgLqTrVtMOI/SYqttpQ4kx4au31MM6G8FZ
 8YSOPTVkou2/KipHstWFnPYX1a3PDhmLe9xV9thIAtxhvLdvue7PTpbC9KXCaikkfbMR
 43EogAYK7ELz5Kx4gTnDy/8yQpMfJFpZsQCceSLjMl0Nonb4bNYA2dNLhi8XkzRj9PSW
 nP/4E5ZZw3PTpxIDswKPu98Dxa6MSYD7f7HpCgufFvc4ZQdL4XBWmihartQ8pAmTRtT4
 8TaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+Djtk7MO02/6vQwaS5Jddg5et6k9rh0KiNtGBda+diQ=;
 b=1HnAUw7G42kyKOnGScoSKDLQbDbA6nHUA71r8NlkYsSDlKK/BX6q+/eOWkDn+E4ZB4
 CJ0RFZb0YMuSz7dr+CES7Vc1pb5G6hTcrN/HciLVKiDqZKMvlqz3tVzP5ZjHaXqzc8ne
 o2bKcIzI9zwLXRLT736rnD4isxxeQH8LrCjfZ4RAsUj9m2HmnIzHUT7db4E1CZH+8ejk
 g1u0W1HG2xSa4lP8gXK8hfhWaKdhRkMSz6UuuNV3yWc70IboZdkJfnxiRjmkN6WTyQq3
 WwIpRx3YYiDkm9qQTHSjzWLRE7eD/CQTvOxJBZVKboJ5dDPtKHNDEkyW23H8m66xclsN
 fsHA==
X-Gm-Message-State: AOAM533BxePgdbTbWl4vT9Gv5dIntSJR/vJIykxHNZFyWaEsXbo02szw
 kcnseFVO0RBgco7WTfNBhM1SFw==
X-Google-Smtp-Source: ABdhPJwfhYAmDvNyRkAsoSqZObVRbcz8YPwelKR3pWAgF3olMTToOrCVgqkQPlsVKRCaM2elOMd3bQ==
X-Received: by 2002:a05:6a00:2311:b0:431:c19f:2a93 with SMTP id
 h17-20020a056a00231100b00431c19f2a93mr36671021pfh.11.1638155025034; 
 Sun, 28 Nov 2021 19:03:45 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:03:44 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v10 00/77] support vector extension v1.0
Date: Mon, 29 Nov 2021 11:02:20 +0800
Message-Id: <20211129030340.429689-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 29 Nov 2021 03:03:53 -0000

From: Frank Chang <frank.chang@sifive.com>

This patchset implements the vector extension v1.0 for RISC-V on QEMU.

RVV v1.0 spec is now fronzen for public review:
https://github.com/riscv/riscv-v-spec/releases/tag/v1.0

The port is available here:
https://github.com/sifive/qemu/tree/rvv-1.0-upstream-v10

RVV v1.0 can be enabled with -cpu option: v=true and specify vext_spec
option to v1.0 (i.e. vext_spec=v1.0)

Note: This patchset depends on other patchsets listed in Based-on
      section below so it is not able to be built unless those patchsets
      are applied.

Changelog:

v10
  * Add ELEN checks for widening and narrowing instructions.

v9
  * Remove explicitly set mstatus.SD patches as mstatus.SD is now
    set in add_status_sd().
  * Rebase on riscv-to-apply.next branch.

v8
  * Use {get,dest}_gpr APIs.
  * remove vector AMO instructions.
  * rename vpopc.m to vcpop.m.
  * rename vle1.v and vse1.v to vlm.v and vsm.v.
  * rename vmandnot.mm and vmornot.mm to vmandn.mm and vmorn.mm.

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

Based-on: <20211021160847.2748577-1-frank.chang@sifive.com>
Based-on: <20211021162956.2772656-1-frank.chang@sifive.com>

Frank Chang (72):
  target/riscv: drop vector 0.7.1 and add 1.0 support
  target/riscv: Use FIELD_EX32() to extract wd field
  target/riscv: rvv-1.0: set mstatus.SD bit if mstatus.VS is dirty
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
  target/riscv: rvv-1.0: remove amo operations instructions
  target/riscv: rvv-1.0: configure instructions
  target/riscv: rvv-1.0: stride load and store instructions
  target/riscv: rvv-1.0: index load and store instructions
  target/riscv: rvv-1.0: fix address index overflow bug of indexed
    load/store insns
  target/riscv: rvv-1.0: fault-only-first unit stride load
  target/riscv: rvv-1.0: load/store whole register instructions
  target/riscv: rvv-1.0: update vext_max_elems() for load/store insns
  target/riscv: rvv-1.0: take fractional LMUL into vector max elements
    calculation
  target/riscv: rvv-1.0: floating-point square-root instruction
  target/riscv: rvv-1.0: floating-point classify instructions
  target/riscv: rvv-1.0: count population in mask instruction
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
  target/riscv: rvv-1.0: floating-point reciprocal square-root estimate
    instruction
  target/riscv: rvv-1.0: floating-point reciprocal estimate instruction
  target/riscv: rvv-1.0: rename r2_zimm to r2_zimm11
  target/riscv: rvv-1.0: add vsetivli instruction
  target/riscv: rvv-1.0: add evl parameter to vext_ldst_us()
  target/riscv: rvv-1.0: add vector unit-stride mask load/store insns
  target/riscv: rvv-1.0: rename vmandnot.mm and vmornot.mm to vmandn.mm
    and vmorn.mm
  target/riscv: rvv-1.0: update opivv_vadc_check() comment
  target/riscv: rvv-1.0: Add ELEN checks for widening and narrowing
    instructions

Greentime Hu (1):
  target/riscv: rvv-1.0: add vlenb register

Hsiangkai Wang (1):
  target/riscv: gdb: support vector registers for rv64 & rv32

LIU Zhiwei (3):
  target/riscv: rvv-1.0: add mstatus VS field
  target/riscv: rvv-1.0: add sstatus VS field
  target/riscv: rvv-1.0: add vcsr register

 target/riscv/cpu.c                      |   18 +-
 target/riscv/cpu.h                      |   61 +-
 target/riscv/cpu_bits.h                 |   10 +
 target/riscv/cpu_helper.c               |   39 +-
 target/riscv/csr.c                      |   63 +-
 target/riscv/fpu_helper.c               |   17 +-
 target/riscv/gdbstub.c                  |  184 ++
 target/riscv/helper.h                   |  435 ++-
 target/riscv/insn32.decode              |  294 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 2429 +++++++++------
 target/riscv/internals.h                |   24 +-
 target/riscv/translate.c                |   73 +-
 target/riscv/vector_helper.c            | 3601 ++++++++++++-----------
 13 files changed, 4157 insertions(+), 3091 deletions(-)

--
2.25.1


