Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1wQh-0000aq-8e
	for mharc-qemu-riscv@gnu.org; Tue, 19 Jan 2021 14:12:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1wQV-0000Xa-H3; Tue, 19 Jan 2021 14:12:29 -0500
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:33494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1wQR-0006il-RN; Tue, 19 Jan 2021 14:12:27 -0500
Received: by mail-io1-xd29.google.com with SMTP id w18so41902030iot.0;
 Tue, 19 Jan 2021 11:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z6KbJZ8aDi0uWn8X9aUZe9RKYHNhwx8XwZ0G/B6OYtE=;
 b=j6UMtiaKphgEefnE0lezstDAKlff2DA1DoDS8ADby3CsadHcOrSyvEydtCwEX7CzrD
 CoWWntSpJ0SReIzBcq3Dcp1kKC8Vwy5MzEgPMo+xI3e1XiZ8xIAmDsiwRpK3KuiJTLJC
 ubfs2raKgLci+zKBLGS6r8M85A/Lf6bnXLRG4tskezNS9KP1AJfxGuDG4YaPgmK556zZ
 a10INaAqX7Fz8CH15W02YxZAynxQ4uC/3g4tcxEZK3DZvR9sAilq+O0iMseexuipt6rb
 VqkXeEnCMHD3MsKnq/ShGHDUMazHrKSXxiTce9FC+F+FtxfHFmYMT/Mt/45qC6Or1Qjq
 FWoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z6KbJZ8aDi0uWn8X9aUZe9RKYHNhwx8XwZ0G/B6OYtE=;
 b=GFmZetxhC6VfuTfy4+UsYdd6sLoEPtISt3ZC0WtdeCJSeNtkoqBjU5Uz3lSTVfKnJJ
 35/IpESOcl93+Hh7E/Ad7JW0qPmGKuEeigFHDf5Gkr8uvBe0IrGsUISqERLnq1QrvGH2
 oKRlY5iYX3rNuDpmh0W2wjnxWurlewCYat5lLKE4Fe5a08IK8PeuVgE9KvQnKfdMSgG3
 zw2ZcC9OAvM59aOYQaaHYK/exquK/KgRMmKC9zvQEELX+JpSsyH3eW4Gl8nZZb9hcLIO
 sWpn8oHF9U96AYQFaQE/eWXueCMy1c6/ETvpfndRun/jxiBGsEejekeFNnwl/CGVDtCg
 BwBA==
X-Gm-Message-State: AOAM531dB4B/qMv68GO0OSQbjVAhdJf7BGTfewfakcz5dgJ5R8eN4FWl
 iEWGnCDsjBOss3aUDtjgHqieBKzXPjnNgVZnTvg=
X-Google-Smtp-Source: ABdhPJyzHorb11MTdHa+JBV0XVo1vxL5+8zolFXZsQY0NeDlvmb8CF7/2bnfYSLPgevm7Gi0kAPXuJ8vZhaov+4LMmo=
X-Received: by 2002:a6b:4003:: with SMTP id k3mr4035507ioa.105.1611083542195; 
 Tue, 19 Jan 2021 11:12:22 -0800 (PST)
MIME-Version: 1.0
References: <20210112093950.17530-1-frank.chang@sifive.com>
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Jan 2021 11:11:56 -0800
Message-ID: <CAKmqyKMZ9CyAV1d5tA0Ww=NOFGYkKMu_EiDJEBs80=Q3mZQD0w@mail.gmail.com>
Subject: Re: [PATCH v6 00/72] support vector extension v1.0
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
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
X-List-Received-Date: Tue, 19 Jan 2021 19:12:34 -0000

On Tue, Jan 12, 2021 at 1:40 AM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> This patchset implements the vector extension v1.0 for RISC-V on QEMU.
>
> As vector extension specification is near to be ratified, this patchset is
> sent as formal patchset for review.

Do you know when the 1.0 spec will be released?

>
> The port is available here:
> https://github.com/sifive/qemu/tree/rvv-1.0-upstream-v6
>
> You can change the cpu argument: vext_spec to v1.0 (i.e. vext_spec=v1.0)
> to run with RVV v1.0 instructions.
>
> Note: This patchset depends on another patchset listed in Based-on
>       section below so it might not able to be built unless the patchset
>           is applied.

Has this been merged?

Alistair

>
> Changelog:
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
> Based-on: <1596102747-20226-1-git-send-email-chihmin.chao@sifive.com/>
>
> Frank Chang (66):
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
>   target/riscv: rvv-1.0: configure instructions
>   target/riscv: rvv-1.0: stride load and store instructions
>   target/riscv: rvv-1.0: index load and store instructions
>   target/riscv: rvv-1.0: fix address index overflow bug of indexed
>     load/store insns
>   target/riscv: rvv-1.0: fault-only-first unit stride load
>   target/riscv: rvv-1.0: amo operations
>   target/riscv: rvv-1.0: load/store whole register instructions
>   target/riscv: rvv-1.0: update vext_max_elems() for load/store insns
>   target/riscv: rvv-1.0: take fractional LMUL into vector max elements
>     calculation
>   target/riscv: rvv-1.0: floating-point square-root instruction
>   target/riscv: rvv-1.0: floating-point classify instructions
>   target/riscv: rvv-1.0: mask population count instruction
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
>
> Greentime Hu (1):
>   target/riscv: rvv-1.0: add vlenb register
>
> Hsiangkai Wang (2):
>   target/riscv: gdb: modify gdb csr xml file to align with csr register
>     map
>   target/riscv: gdb: support vector registers for rv64 & rv32
>
> LIU Zhiwei (3):
>   target/riscv: rvv-1.0: add mstatus VS field
>   target/riscv: rvv-1.0: add sstatus VS field
>   target/riscv: rvv-1.0: add vcsr register
>
>  gdb-xml/riscv-32bit-csr.xml             |   18 +-
>  gdb-xml/riscv-64bit-csr.xml             |   18 +-
>  target/riscv/cpu.c                      |   11 +-
>  target/riscv/cpu.h                      |   98 +-
>  target/riscv/cpu_bits.h                 |   10 +
>  target/riscv/cpu_helper.c               |   15 +-
>  target/riscv/csr.c                      |   85 +-
>  target/riscv/fpu_helper.c               |   17 +-
>  target/riscv/gdbstub.c                  |  177 +-
>  target/riscv/helper.h                   |  503 ++-
>  target/riscv/insn32-64.decode           |   18 +-
>  target/riscv/insn32.decode              |  290 +-
>  target/riscv/insn_trans/trans_rvv.c.inc | 2475 ++++++++++-----
>  target/riscv/internals.h                |   24 +-
>  target/riscv/translate.c                |   72 +-
>  target/riscv/vector_helper.c            | 3690 ++++++++++++-----------
>  16 files changed, 4531 insertions(+), 2990 deletions(-)
>
> --
> 2.17.1
>
>

