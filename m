Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNKvx-0001vK-Eu
	for mharc-qemu-riscv@gnu.org; Tue, 29 Sep 2020 15:05:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKvv-0001v4-MH
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:05:03 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:34598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKvo-0001dM-EI
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:05:03 -0400
Received: by mail-pg1-x541.google.com with SMTP id u24so4650714pgi.1
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2020 12:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=lXNeWoCwEaWercn8+yG0daXu0Haw/UUjDZEMzvo6c+A=;
 b=Rb1TIXm+ezZ5kc0LKejmWQVhh6qOWaRBED6GuKUEc+vj2Yfhyia54i23APwkmpcy2/
 PrfbcA4X0eUZ5d6vxigCA9T9TgpKVqNvgw+sUD4gceBJZyyC761iqHc+CV1PW0QDESHZ
 JnSOEpYg0ecDdEkikpgagpOUcoUBP5CAHHi1/0zhzIv3zv0a/nPxMl95/96wHX3Eu4zO
 4ce4LpMXlq7QHhiRCQFGJqW3ClvDeUVDm+PFyngz6r5++68QuCOTMjyzUP7bOEfwyzlK
 t63Jtjt3Juspt6oREtL0PwtvEdnv3BNZItWOJCrWJmavHYdQqjtYN6JuHJLcktxqjdYe
 elJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=lXNeWoCwEaWercn8+yG0daXu0Haw/UUjDZEMzvo6c+A=;
 b=Td0BP5mzknuqNm8MEHWnqqTB5PLPwpAP5gwLwP/53U6673MtOcsVMHgt+tZ/G5K9Qj
 vVBHN8u4zkjiET5L2K9LCU3hlaIdxAZyU/YovGCAvirOrOZ4O0PMQKe+xWkt3mAO2ivF
 sOMEYOouhS9H05XE7J1rMJO6pd36e36ndPbQO3dN9twGj9IKNuNMzdM0aE8ZqPA2WnoT
 bo23W38O7KfOS25gYYejCTjESD3d28Oio2Jb0ssFgrQf7MaqSYQpTbpP1Zk6XEI7zX0c
 KoUuiQl4yrgPq4EEw+x+z0FJ5jM3TWG6tAN/JT2qb3woFYERjiBty8Xi65P8tnnL8gNn
 bSeA==
X-Gm-Message-State: AOAM5304ULOuM16X9UtUih6H1NZM5WfE7Xj6GwXNGu6SvAEWyn35fMvE
 1mUae3wxskN9bfvOejSbh27L6w==
X-Google-Smtp-Source: ABdhPJwwdISNMhAczzO3AaY8RNxV2nGMvsxospqwW1IX4jUdbzU+U07032Y7Q58WPtrnU7e3dGUJCw==
X-Received: by 2002:a17:902:9694:b029:d2:1b52:f46 with SMTP id
 n20-20020a1709029694b02900d21b520f46mr6229327plp.78.1601406294295; 
 Tue, 29 Sep 2020 12:04:54 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id v8sm6003950pgg.58.2020.09.29.12.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 12:04:53 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>
Subject: [RFC v5 00/68] support vector extension v1.0
Date: Wed, 30 Sep 2020 03:03:35 +0800
Message-Id: <20200929190448.31116-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 29 Sep 2020 19:05:03 -0000

From: Frank Chang <frank.chang@sifive.com>

This patchset implements the vector extension v1.0 for RISC-V on QEMU.

This patchset is sent as RFC because RVV v1.0 is still in draft state.
v2 patchset was sent for RVV v0.9 and bumped to RVV v1.0 since v3 patchset.

The port is available here:
https://github.com/sifive/qemu/tree/rvv-1.0-upstream-v5

You can change the cpu argument: vext_spec to v1.0 (i.e. vext_spec=v1.0)
to run with RVV v1.0 instructions.

Note: This patchset depends on two other patchsets listed in Based-on
      section below so it might not able to be built unless those two
      patchsets are applied.

Changelog:

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

Based-on: <20200909001647.532249-1-richard.henderson@linaro.org/>
Based-on: <1596102747-20226-1-git-send-email-chihmin.chao@sifive.com/>

Frank Chang (62):
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
  target/riscv: implement vstart CSR
  target/riscv: trigger illegal instruction exception if frm is not
    valid

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
 target/riscv/cpu.h                      |   95 +-
 target/riscv/cpu_bits.h                 |   10 +
 target/riscv/cpu_helper.c               |   16 +-
 target/riscv/csr.c                      |   79 +-
 target/riscv/fpu_helper.c               |   17 +-
 target/riscv/gdbstub.c                  |  172 +-
 target/riscv/helper.h                   |  495 ++--
 target/riscv/insn32-64.decode           |   18 +-
 target/riscv/insn32.decode              |  288 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 2430 +++++++++++------
 target/riscv/internals.h                |   22 +-
 target/riscv/translate.c                |   72 +-
 target/riscv/vector_helper.c            | 3316 +++++++++++------------
 16 files changed, 4118 insertions(+), 2959 deletions(-)

--
2.17.1


