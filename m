Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7aqG-0005DY-RN
	for mharc-qemu-riscv@gnu.org; Mon, 17 Aug 2020 04:50:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7aqE-0005Bn-V2
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:50:06 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:36909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7aqC-0004gH-0P
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:50:06 -0400
Received: by mail-pl1-x62f.google.com with SMTP id s14so1191544plp.4
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2020 01:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=YaRz00F3DdxFE8gRMGnGvA7xLPyskscbRKXD8PrH9lw=;
 b=Pn+FzaA/3eoynZQFDr6+pbZwzDAW0kJsw1VEI6PRa+di30+MW45dKXVMXkmEHj0n71
 e108Ghuo6NhjlDc5jkrSbpNUk4qmlzSq+sUAaD2EHcA8OPtxQGqBjcri9P5qZJnHuDeB
 2+qh5mD4wKsQKx3aUaXCvM9ntrMzcryB3X/Gk6coTmYP8DHhA/TEX9FlMWq+N1jAVQMU
 Flaif8GvtKoX6ZgRN3JttO4UA0A12x1VXzJGTtq3wLq8V+jL8z5wDtzeZELaJDKSqi0F
 EjXbYCiwMrkaED2XMBq5xgNIykNJMWqRr4RfwlExQOvzHD0rVoCfJDQr35bH+nEkTYJh
 pmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=YaRz00F3DdxFE8gRMGnGvA7xLPyskscbRKXD8PrH9lw=;
 b=LPANnsMaUh17B/C1tOJ+SuHNiqGBOWmC/bzLqG0QlpfTaDMSJolby8tdHcQ331ekyo
 2UA1pg4k9+zHn3wGGGYIBYQumnCxXvk2J3sCb7j5f1et3hqcgl5p2wLMxnfkorDKuhC+
 DYk/DdHXy7BugETUE/dk5LJjyWur/ef1ZTDoThzQbtGHKWAO0cOgM276dfm8BvCjYXT5
 ffB9LdyTyrEjpRBcTkfiavi4FmGvI2dKFt/0k5Ue1HojyGFP49k9zJUQvcWMeWwgmRnR
 YgXPbLa6nvStCQXZBPu785DRQvF3666SabSoYnIzVMlYI9+N5B4+mLGWdF8gFFPOR9eA
 f4Kw==
X-Gm-Message-State: AOAM53086vwtLzp6L315edC9gq2vMd88HOTtZfLa5ZhUyC7pCun8h2nm
 h2uMxbJUbiQX5Vlu2jyipYrxkA==
X-Google-Smtp-Source: ABdhPJwZuZLJvCZAw6JPc2stebg7Q5A+e8lP5RmaD8cKl50aZONipRM6UYuGuXA2lwfgw1XbJ1NcAw==
X-Received: by 2002:a17:90b:2092:: with SMTP id
 hb18mr12129512pjb.118.1597654201849; 
 Mon, 17 Aug 2020 01:50:01 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d9sm16478588pgv.45.2020.08.17.01.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:50:00 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>
Subject: [RFC v4 00/70] support vector extension v1.0
Date: Mon, 17 Aug 2020 16:48:45 +0800
Message-Id: <20200817084955.28793-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 17 Aug 2020 08:50:07 -0000

From: Frank Chang <frank.chang@sifive.com>

This patchset implements the vector extension v1.0 for RISC-V on QEMU.

This patchset is sent as RFC because RVV v1.0 is still in draft state.
v2 patchset was sent for RVV v0.9 and bumped to RVV v1.0 since v3 patchset.

The port is available here:
https://github.com/sifive/qemu/tree/rvv-1.0-upstream-v4

You can change the cpu argument: vext_spec to v1.0 (i.e. vext_spec=v1.0)
to run with RVV v1.0 instructions.

Note: This patchset depends on two other patchsets listed in Based-on
      section below so it might not able to be built unless those two
      patchsets are applied.

Changelog:

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

Based-on: <20200724002807.441147-1-richard.henderson@linaro.org/>
Based-on: <1596102747-20226-1-git-send-email-chihmin.chao@sifive.com/>

Frank Chang (62):
  target/riscv: drop vector 0.7.1 and add 1.0 support
  target/riscv: Use FIELD_EX32() to extract wd field
  target/riscv: rvv-1.0: introduce writable misa.v field
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
  target/riscv: rvv-1.0: add Zvqmac extension
  target/riscv: rvv-1.0: quad-widening integer multiply-add instructions
  target/riscv: rvv-1.0: single-width saturating add and subtract
    instructions
  target/riscv: rvv-1.0: integer comparison instructions
  target/riscv: use softfloat lib float16 comparison functions
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
  target/riscv: rvv-1.0: relax RV_VLEN_MAX to 512-bits

Greentime Hu (2):
  target/riscv: rvv-1.0: add vlenb register
  target/riscv: gdb: support vector registers for rv32

Hsiangkai Wang (2):
  target/riscv: gdb: modify gdb csr xml file to align with csr register
    map
  target/riscv: gdb: support vector registers for rv64

LIU Zhiwei (4):
  target/riscv: rvv-1.0: add mstatus VS field
  target/riscv: rvv-1.0: add sstatus VS field
  target/riscv: rvv-1.0: add translation-time vector context status
  target/riscv: rvv-1.0: add vcsr register

 gdb-xml/riscv-32bit-csr.xml             |   18 +-
 gdb-xml/riscv-64bit-csr.xml             |   18 +-
 target/riscv/cpu.c                      |   12 +-
 target/riscv/cpu.h                      |   97 +-
 target/riscv/cpu_bits.h                 |   10 +
 target/riscv/cpu_helper.c               |   16 +-
 target/riscv/csr.c                      |   73 +-
 target/riscv/fpu_helper.c               |   17 +-
 target/riscv/gdbstub.c                  |  126 +-
 target/riscv/helper.h                   |  523 ++--
 target/riscv/insn32-64.decode           |   18 +-
 target/riscv/insn32.decode              |  295 +-
 target/riscv/insn_trans/trans_rvv.inc.c | 2366 ++++++++++------
 target/riscv/internals.h                |   19 +-
 target/riscv/translate.c                |   68 +-
 target/riscv/vector_helper.c            | 3269 +++++++++++------------
 16 files changed, 4051 insertions(+), 2894 deletions(-)

--
2.17.1


