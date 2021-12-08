Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1muqdG-0001aY-9E
	for mharc-qemu-riscv@gnu.org; Wed, 08 Dec 2021 01:40:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1muqd3-0001YM-54; Wed, 08 Dec 2021 01:40:37 -0500
Received: from [2607:f8b0:4864:20::d31] (port=37620
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1muqcy-0001mK-Nr; Wed, 08 Dec 2021 01:40:36 -0500
Received: by mail-io1-xd31.google.com with SMTP id k21so1735767ioh.4;
 Tue, 07 Dec 2021 22:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k2d1COiBuoGKOPwOeR6V+bpMOBagEx1KqIXrrd5H7R8=;
 b=PuICgB+5UrHjTgOmUmfrybFUxNcaWFTz1kUAxgidA3JFkwARpTYyuP/1p2VvO4DM8G
 6BRzQOaV/wU5YbNRyJ2oBShQa7HmzcxGzMrt9fhyc8aWPxz5wSgHy1d8d0YZSH20QW6e
 CGYl6hZSXRme6ovQhxdoUmK5xEXigLmMDaNUVAfP+KRPp0TfyAfWw58n4t9PXH0lk2nW
 Lenr6MAvtOfeNjWe7kjFAcobC0b1u7upZ+VQ4f/K41BJ6+CC8jQcOesO967pYGZu2k8J
 O32QMIuJYVt23qsTRWeV8++FUKqe6KSuRnFnu/1SHlHPQ7tE4mrXtuLGQPOqMLMsVan9
 Ti0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k2d1COiBuoGKOPwOeR6V+bpMOBagEx1KqIXrrd5H7R8=;
 b=DTvxJzpAXXxeh61ajIa5mUJYLCeTTcB0Uxrqg04KrB3YVPTplCEsUH2Foqup9DLVv3
 lLNNDvUETT1ro5KufP7exK1ZqoQJMheWU8oyApoaDOjCUaOkJ2MHYiBxwJkNtt48+7Lu
 h2R80+VqdovBgDVRr8IKPwKfmhKCLKsmmxkC9Qc2yCbr+qfMefBDM3Vh8oxrPPMT87Eh
 MKcF79DloxyNQ3lHSoNF+PHo8Z4nPVjb9xeWau2SqUQ7CnvDwm/T9VUFy9cblVYumyMq
 se9LsvP3KMRGY7pRG6ti6/sPyhDlvbYbcBGEowjg12gogGXBkDl44l50Jrxq/cf4D7p2
 I1mQ==
X-Gm-Message-State: AOAM531R1lDinSq+QFrX2T7C5f3kfKkWawWktUEc+/NSXZHSqcolCji5
 8OblFNgU16EhJuiShlumvg0yfMknfEJ5tONR/X0=
X-Google-Smtp-Source: ABdhPJxoS8mvYweLDSKZsSS4r/R6Lk+e6Chz91sQLZraGVYLqZ914Ox/dalFt15ijC6+JRwDI7m6y3hWDsUVAwuakKo=
X-Received: by 2002:a6b:6802:: with SMTP id d2mr4083214ioc.187.1638945622429; 
 Tue, 07 Dec 2021 22:40:22 -0800 (PST)
MIME-Version: 1.0
References: <20211129030340.429689-1-frank.chang@sifive.com>
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 8 Dec 2021 16:39:55 +1000
Message-ID: <CAKmqyKPKZ9hkF5cncVf5bOJQ-wrTUA0YcR76xzQ+brxkUb=NiQ@mail.gmail.com>
Subject: Re: [PATCH v10 00/77] support vector extension v1.0
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 08 Dec 2021 06:40:42 -0000

On Mon, Nov 29, 2021 at 1:04 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> This patchset implements the vector extension v1.0 for RISC-V on QEMU.
>
> RVV v1.0 spec is now fronzen for public review:
> https://github.com/riscv/riscv-v-spec/releases/tag/v1.0
>
> The port is available here:
> https://github.com/sifive/qemu/tree/rvv-1.0-upstream-v10
>
> RVV v1.0 can be enabled with -cpu option: v=true and specify vext_spec
> option to v1.0 (i.e. vext_spec=v1.0)
>
> Note: This patchset depends on other patchsets listed in Based-on
>       section below so it is not able to be built unless those patchsets
>       are applied.

I think this is all reviewed now. Once your other patch sets are
merged just re-send this and I can apply it.

Alistair

>
> Changelog:
>
> v10
>   * Add ELEN checks for widening and narrowing instructions.
>
> v9
>   * Remove explicitly set mstatus.SD patches as mstatus.SD is now
>     set in add_status_sd().
>   * Rebase on riscv-to-apply.next branch.
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
> Based-on: <20211021160847.2748577-1-frank.chang@sifive.com>
> Based-on: <20211021162956.2772656-1-frank.chang@sifive.com>
>
> Frank Chang (72):
>   target/riscv: drop vector 0.7.1 and add 1.0 support
>   target/riscv: Use FIELD_EX32() to extract wd field
>   target/riscv: rvv-1.0: set mstatus.SD bit if mstatus.VS is dirty
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
>   target/riscv: rvv-1.0: floating-point reciprocal square-root estimate
>     instruction
>   target/riscv: rvv-1.0: floating-point reciprocal estimate instruction
>   target/riscv: rvv-1.0: rename r2_zimm to r2_zimm11
>   target/riscv: rvv-1.0: add vsetivli instruction
>   target/riscv: rvv-1.0: add evl parameter to vext_ldst_us()
>   target/riscv: rvv-1.0: add vector unit-stride mask load/store insns
>   target/riscv: rvv-1.0: rename vmandnot.mm and vmornot.mm to vmandn.mm
>     and vmorn.mm
>   target/riscv: rvv-1.0: update opivv_vadc_check() comment
>   target/riscv: rvv-1.0: Add ELEN checks for widening and narrowing
>     instructions
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
>  target/riscv/cpu.c                      |   18 +-
>  target/riscv/cpu.h                      |   61 +-
>  target/riscv/cpu_bits.h                 |   10 +
>  target/riscv/cpu_helper.c               |   39 +-
>  target/riscv/csr.c                      |   63 +-
>  target/riscv/fpu_helper.c               |   17 +-
>  target/riscv/gdbstub.c                  |  184 ++
>  target/riscv/helper.h                   |  435 ++-
>  target/riscv/insn32.decode              |  294 +-
>  target/riscv/insn_trans/trans_rvv.c.inc | 2429 +++++++++------
>  target/riscv/internals.h                |   24 +-
>  target/riscv/translate.c                |   73 +-
>  target/riscv/vector_helper.c            | 3601 ++++++++++++-----------
>  13 files changed, 4157 insertions(+), 3091 deletions(-)
>
> --
> 2.25.1
>
>

