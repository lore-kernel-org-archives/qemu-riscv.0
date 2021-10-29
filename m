Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgNjZ-000419-P5
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 04:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNjY-00040u-53
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 04:59:32 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:39505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNjV-0004SF-GO
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 04:59:31 -0400
Received: by mail-pg1-x52f.google.com with SMTP id g184so9293874pgc.6
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 01:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uI/Ie3CHVkZ4Vow8bv/bbAuIBGc22yOWqXHtYCcoSM8=;
 b=GHa1w+GOdtkds4gie/oUTX+1ALJXD0ZZbYn0py6Fh0bZVKgcpzp5LnUdrMjM1V+uXY
 Q5q0XCsCoVwBDK9kzWq80FexugCtg3ZQhjfNimnBEDO5ZVYQpnXpIZlfFB25jxTcaCef
 lZhdHi9wGRGV2cjpbCD1PBBa8CFCNzf8LYR0zkzVYR+4BnMnQIAmVt8//LWX25w5+IBb
 y5k3WkWI4RJO+f5ZScIzjwipdqdHFGXB60lgzoctfqosibz7DUTU37ox5HwzEACPEO8W
 FkfcZBKYyi9cTBD86LkjX1lSRHR+s7BEJLqFDpb+oVNgeQ69tkvw2eAR9xqnQl0lME0t
 640w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uI/Ie3CHVkZ4Vow8bv/bbAuIBGc22yOWqXHtYCcoSM8=;
 b=DScOBem/VyMkj0aFPN1768ONQo39zexxDv9tel2mxhP9SB13vifc/G+s6nlJW153l9
 k0b5KOVn5kiCbEJ3Z3QOdTKQqlpXF/75dH3bSXwX4ukWE2HwdfdrcHlyL9zNfQW1Z4Fa
 ET7+8Nsd617/TSRFVJreIDgDudw43WdVwRfWCkFGmFUtv6/rz/Lyn/7hEgqsneNxGRp2
 C/YRqmHAAKBC/P9qbQcqU16e7JBTJS89LyBtOo1EGWra4QbntmlibtKO6qAb/gSGdpi0
 MJ/OcPHSv08cQ0GsNcDsewMgaPygoB1EKAZshoYa+z/XwPedXd4/DugkKzHuaFyr2ttX
 DNJw==
X-Gm-Message-State: AOAM533+uuuQPliyIPqrdu9CuxEJQPfsYVY81rGXYp81FGvcwsw/dlYF
 uRpNoWb7vgiYizgpa2QswnNi0Q==
X-Google-Smtp-Source: ABdhPJztCMX+DC/k84oRWuJPWsJsc4RO5n6FmeLuHNSjfYpGRacd8ig5H0qi8S5C/fnesWX4C89nMQ==
X-Received: by 2002:a63:af54:: with SMTP id s20mr7045912pgo.284.1635497967165; 
 Fri, 29 Oct 2021 01:59:27 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.01.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 01:59:26 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v9 00/76] support vector extension v1.0
Date: Fri, 29 Oct 2021 16:58:05 +0800
Message-Id: <20211029085922.255197-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52f.google.com
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
X-List-Received-Date: Fri, 29 Oct 2021 08:59:32 -0000

From: Frank Chang <frank.chang@sifive.com>

This patchset implements the vector extension v1.0 for RISC-V on QEMU.

RVV v1.0 spec is now fronzen for public review:
https://github.com/riscv/riscv-v-spec/releases/tag/v1.0

The port is available here:
https://github.com/sifive/qemu/tree/rvv-1.0-upstream-v9

RVV v1.0 can be enabled with -cpu option: v=true and specify vext_spec
option to v1.0 (i.e. vext_spec=v1.0)

Note: This patchset depends on other patchsets listed in Based-on
      section below so it is not able to be built unless those patchsets
      are applied.

Changelog:

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

Frank Chang (71):
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
 target/riscv/insn_trans/trans_rvv.c.inc | 2424 +++++++++------
 target/riscv/internals.h                |   24 +-
 target/riscv/translate.c                |   71 +-
 target/riscv/vector_helper.c            | 3601 ++++++++++++-----------
 13 files changed, 4150 insertions(+), 3091 deletions(-)

--
2.25.1


