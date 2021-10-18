Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcLhW-0003Bj-6b
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 02:00:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcLhR-00038i-1v; Mon, 18 Oct 2021 02:00:41 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:34782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcLhF-0006vi-Vf; Mon, 18 Oct 2021 02:00:33 -0400
Received: by mail-io1-xd35.google.com with SMTP id i189so14922322ioa.1;
 Sun, 17 Oct 2021 23:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/Lw10rOoWxW7Vx+g4jVR6aX2YKfcr6jwkr27SQOXtYo=;
 b=NU8xrM8vg7VpKgHvNlglXkZQBfi4TKwXnrn7w5jJ6yhXB4NoGDnuCwk9lLXUxAG/2Q
 0QwXMXJLCfYSJks6ee9sCMpB8KykhdZghss8ED5jQTnYj4sboMOkwda/VUWLvDKy8JdD
 Ko9ERhGBc+HN7nQKzDkjbXdAQyhqvLwqGGHHxNaHjsIifvzv3FFdNDRRNqaIAK9fjife
 oIH0RIuvKcC0pgptQ9W9qrpQIK/SXV63arLN62VOZgy73RNWYrW4XDLz1YLI0m4m8sEI
 AtuNoquAqNaPZnahQ7wWbeq92ZeUfdgB/kAZYz6ZtVVOcnSCISRsNCZkhK8twoaXdKNi
 HlgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Lw10rOoWxW7Vx+g4jVR6aX2YKfcr6jwkr27SQOXtYo=;
 b=vg5grSLmbDsK+Aj6+Sl8zZYf5Bqgy39EhYHE/m7VNtGMGmw4CVoMWRxwGNib2D6NFn
 WCBwlu6rTF4XAgCzNDoX1fQKH980g92aMMf8LEiDegehtWJ3b/xXOJoqTCawSDA0+Rjv
 USfkxuiuDJalkEuOLebbaUJpYNuiN/SW/wRR54tVGFggV0Kh71DxgEGxjez2ucM7A2Uy
 8P0T+R4YXzgYOYNKalqj2fPr4ijZWOZBEFlL8bRhjrOJafR7oMZGwDu92sNcRsb1tubj
 AKSjiJ7nuJ0VWluz4KRL1yN1ZVrukv9k75y4r2ndzbd9RCKRdyDLPWMApwjlJrTk7Ttr
 M6Dw==
X-Gm-Message-State: AOAM533+LI4jzdgKPNftNfdG0Y4otEQ3k8pMGNDt5UuhJD3xH9BkZmUJ
 yz2QEhA+j8FHCSh/0ANn3S5e/3FiqJkiOlk/Ank=
X-Google-Smtp-Source: ABdhPJwxh5xSvKqjYX5Yj142OoXRr7VDi6rAtK/pN9GEqjyPLpKO0/wLhsA6k0pfXLH1cBB7rQjjQJh1oc2xRdyOElQ=
X-Received: by 2002:a05:6602:2e8c:: with SMTP id
 m12mr12537486iow.91.1634536828192; 
 Sun, 17 Oct 2021 23:00:28 -0700 (PDT)
MIME-Version: 1.0
References: <20211015074627.3957162-1-frank.chang@sifive.com>
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Oct 2021 16:00:02 +1000
Message-ID: <CAKmqyKMf3QUi9HGK4rx6fJBh6_YvpPYDpf-u5pgrx6VE58ORWw@mail.gmail.com>
Subject: Re: [PATCH v8 00/78] support vector extension v1.0
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 18 Oct 2021 06:00:42 -0000

On Fri, Oct 15, 2021 at 5:48 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> This patchset implements the vector extension v1.0 for RISC-V on QEMU.
>
> RVV v1.0 spec is now fronzen for public review:
> https://github.com/riscv/riscv-v-spec/releases/tag/v1.0
>
> The port is available here:
> https://github.com/sifive/qemu/tree/rvv-1.0-upstream-v8
>
> RVV v1.0 can be enabled with -cpu option: v=true and specify vext_spec
> option to v1.0 (i.e. vext_spec=v1.0)

It doesn't seem like this series made it to the general QEMU list. You
might want to check to see what happened there.

Alistair

>
> Note: This patchset depends on other patchsets listed in Based-on
>       section below so it is not able to be built unless those patchsets
>       are applied.
>
> Changelog:
>
> v8
>   * Use {get,dest}_gpr APIs.
>   * remove vector AMO instructions.
>   * rename vpopc.m to vcpop.m.
>   * rename vle1.v and vse1.v to vlm.v and vsm.v.
>   * rename vmandnot.mm and vmornot.mm to vmandn.mm and vmorn.mm.
>
> v7
>   * remove hardcoded GDB vector registers list.
>   * add vsetivli instruction.
>   * add vle1.v and vse1.v instructions.
>
> v6
>   * add vector floating-point reciprocal estimate instruction.
>   * add vector floating-point reciprocal square-root estimate instruction.
>   * update check rules for segment register groups, each segment register
>     group has to follow overlap rules.
>   * update viota.m instruction check rules.
>
> v5
>   * refactor RVV v1.0 check functions.
>     (Thanks to Richard Henderson's bitwise tricks.)
>   * relax RV_VLEN_MAX to 1024-bits.
>   * implement vstart CSR's behaviors.
>   * trigger illegal instruction exception if frm is not valid for
>     vector floating-point instructions.
>   * rebase on riscv-to-apply.next.
>
> v4
>   * remove explicit float flmul variable in DisasContext.
>   * replace floating-point calculations with shift operations to
>     improve performance.
>   * relax RV_VLEN_MAX to 512-bits.
>
> v3
>   * apply nan-box helpers from Richard Henderson.
>   * remove fp16 api changes as they are sent independently in another
>     pathcset by Chih-Min Chao.
>   * remove all tail elements clear functions as tail elements can
>     retain unchanged for either VTA set to undisturbed or agnostic.
>   * add fp16 nan-box check generator function.
>   * add floating-point rounding mode enum.
>   * replace flmul arithmetic with shifts to avoid floating-point
>     conversions.
>   * add Zvqmac extension.
>   * replace gdbstub vector register xml files with dynamic generator.
>   * bumped to RVV v1.0.
>   * RVV v1.0 related changes:
>     * add vl<nf>re<eew>.v and vs<nf>r.v vector whole register
>       load/store instructions
>     * add vrgatherei16 instruction.
>     * rearranged bits in vtype to make vlmul bits into a contiguous
>       field.
>
> v2
>   * drop v0.7.1 support.
>   * replace invisible return check macros with functions.
>   * move mark_vs_dirty() to translators.
>   * add SSTATUS_VS flag for s-mode.
>   * nan-box scalar fp register for floating-point operations.
>   * add gdbstub files for vector registers to allow system-mode
>     debugging with GDB.
>
> Based-on: <20211015065500.3850513-1-frank.chang@sifive.com>
> Based-on: <20211015070307.3860984-1-frank.chang@sifive.com>
>
> Frank Chang (73):
>   target/riscv: fix TB_FLAGS bits overlapping bug for rvv/rvh
>   target/riscv: drop vector 0.7.1 and add 1.0 support
>   target/riscv: Use FIELD_EX32() to extract wd field
>   target/riscv: rvv-1.0: introduce writable misa.v field
>   target/riscv: rvv-1.0: add translation-time vector context status
>   target/riscv: rvv-1.0: remove rvv related codes from fcsr registers
>   target/riscv: rvv-1.0: check MSTATUS_VS when accessing vector csr
>     registers
>   target/riscv: rvv-1.0: remove MLEN calculations
>   target/riscv: rvv-1.0: add fractional LMUL
>   target/riscv: rvv-1.0: add VMA and VTA
>   target/riscv: rvv-1.0: update check functions
>   target/riscv: introduce more imm value modes in translator functions
>   target/riscv: rvv:1.0: add translation-time nan-box helper function
>   target/riscv: rvv-1.0: remove amo operations instructions
>   target/riscv: rvv-1.0: configure instructions
>   target/riscv: rvv-1.0: stride load and store instructions
>   target/riscv: rvv-1.0: index load and store instructions
>   target/riscv: rvv-1.0: fix address index overflow bug of indexed
>     load/store insns
>   target/riscv: rvv-1.0: fault-only-first unit stride load
>   target/riscv: rvv-1.0: load/store whole register instructions
>   target/riscv: rvv-1.0: update vext_max_elems() for load/store insns
>   target/riscv: rvv-1.0: take fractional LMUL into vector max elements
>     calculation
>   target/riscv: rvv-1.0: floating-point square-root instruction
>   target/riscv: rvv-1.0: floating-point classify instructions
>   target/riscv: rvv-1.0: count population in mask instruction
>   target/riscv: rvv-1.0: find-first-set mask bit instruction
>   target/riscv: rvv-1.0: set-X-first mask bit instructions
>   target/riscv: rvv-1.0: iota instruction
>   target/riscv: rvv-1.0: element index instruction
>   target/riscv: rvv-1.0: allow load element with sign-extended
>   target/riscv: rvv-1.0: register gather instructions
>   target/riscv: rvv-1.0: integer scalar move instructions
>   target/riscv: rvv-1.0: floating-point move instruction
>   target/riscv: rvv-1.0: floating-point scalar move instructions
>   target/riscv: rvv-1.0: whole register move instructions
>   target/riscv: rvv-1.0: integer extension instructions
>   target/riscv: rvv-1.0: single-width averaging add and subtract
>     instructions
>   target/riscv: rvv-1.0: single-width bit shift instructions
>   target/riscv: rvv-1.0: integer add-with-carry/subtract-with-borrow
>   target/riscv: rvv-1.0: narrowing integer right shift instructions
>   target/riscv: rvv-1.0: widening integer multiply-add instructions
>   target/riscv: rvv-1.0: single-width saturating add and subtract
>     instructions
>   target/riscv: rvv-1.0: integer comparison instructions
>   target/riscv: rvv-1.0: floating-point compare instructions
>   target/riscv: rvv-1.0: mask-register logical instructions
>   target/riscv: rvv-1.0: slide instructions
>   target/riscv: rvv-1.0: floating-point slide instructions
>   target/riscv: rvv-1.0: narrowing fixed-point clip instructions
>   target/riscv: rvv-1.0: single-width floating-point reduction
>   target/riscv: rvv-1.0: widening floating-point reduction instructions
>   target/riscv: rvv-1.0: single-width scaling shift instructions
>   target/riscv: rvv-1.0: remove widening saturating scaled multiply-add
>   target/riscv: rvv-1.0: remove vmford.vv and vmford.vf
>   target/riscv: rvv-1.0: remove integer extract instruction
>   target/riscv: rvv-1.0: floating-point min/max instructions
>   target/riscv: introduce floating-point rounding mode enum
>   target/riscv: rvv-1.0: floating-point/integer type-convert
>     instructions
>   target/riscv: rvv-1.0: widening floating-point/integer type-convert
>   target/riscv: add "set round to odd" rounding mode helper function
>   target/riscv: rvv-1.0: narrowing floating-point/integer type-convert
>   target/riscv: rvv-1.0: relax RV_VLEN_MAX to 1024-bits
>   target/riscv: rvv-1.0: implement vstart CSR
>   target/riscv: rvv-1.0: trigger illegal instruction exception if frm is
>     not valid
>   target/riscv: rvv-1.0: set mstatus.SD bit when writing vector CSRs
>   target/riscv: rvv-1.0: floating-point reciprocal square-root estimate
>     instruction
>   target/riscv: rvv-1.0: floating-point reciprocal estimate instruction
>   target/riscv: set mstatus.SD bit when writing fp CSRs
>   target/riscv: rvv-1.0: rename r2_zimm to r2_zimm11
>   target/riscv: rvv-1.0: add vsetivli instruction
>   target/riscv: rvv-1.0: add evl parameter to vext_ldst_us()
>   target/riscv: rvv-1.0: add vector unit-stride mask load/store insns
>   target/riscv: rvv-1.0: rename vmandnot.mm and vmornot.mm to vmandn.mm
>     and vmorn.mm
>   target/riscv: rvv-1.0: update opivv_vadc_check() comment
>
> Greentime Hu (1):
>   target/riscv: rvv-1.0: add vlenb register
>
> Hsiangkai Wang (1):
>   target/riscv: gdb: support vector registers for rv64 & rv32
>
> LIU Zhiwei (3):
>   target/riscv: rvv-1.0: add mstatus VS field
>   target/riscv: rvv-1.0: add sstatus VS field
>   target/riscv: rvv-1.0: add vcsr register
>
>  target/riscv/cpu.c                      |   12 +-
>  target/riscv/cpu.h                      |   85 +-
>  target/riscv/cpu_bits.h                 |   10 +
>  target/riscv/cpu_helper.c               |   15 +-
>  target/riscv/csr.c                      |   92 +-
>  target/riscv/fpu_helper.c               |   17 +-
>  target/riscv/gdbstub.c                  |  184 ++
>  target/riscv/helper.h                   |  435 ++-
>  target/riscv/insn32.decode              |  294 +-
>  target/riscv/insn_trans/trans_rvv.c.inc | 2423 +++++++++------
>  target/riscv/internals.h                |   24 +-
>  target/riscv/translate.c                |   74 +-
>  target/riscv/vector_helper.c            | 3601 ++++++++++++-----------
>  13 files changed, 4176 insertions(+), 3090 deletions(-)
>
> --
> 2.25.1
>
>

