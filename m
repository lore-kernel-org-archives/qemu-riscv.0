Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbJ7H-0006gP-4T
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 05:03:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbJ7F-0006bM-JX
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 05:03:01 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:46735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbJ79-0007cF-Ep
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 05:02:59 -0400
Received: by mail-pl1-x62b.google.com with SMTP id 21so5969406plo.13
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 02:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FzwFj0qe8v65uFXL0v/CP6f40tb135R/gdzCG/gD7WM=;
 b=eOjV5bjKMRMQVVjw0ppJaDkmu/HZNkiHGIHunyRaY1SkqFYWhdO9UkIKd4o9M29kFw
 4NjA9KLZ3avGdGUbtfengEnbCAPDGeI/wmVO2D5avVkn7iPjtAJ65jsimHtZvBQ2rDVJ
 /nPmVvYLL+GG9ccXFYrxoa/ZYOwyaP1bmzPKRAcX+LrVvB38P3OHLy1kgqMrYXlNpfJ5
 s6sgrd/Dx3bDHe/0jtKZNfRQB7Kus5eB1/yJq4hgNM1a95Q+rlYJWR84X8L0QBkAGqXF
 wdCcf5KXMdPDUvqoZGGUaehBaMCbOH7Zi9WmQjF3FAefDnCVzOap8zCM0jYUyVLb3UPu
 dr/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FzwFj0qe8v65uFXL0v/CP6f40tb135R/gdzCG/gD7WM=;
 b=X9vccH+zeVPF5GE+c0CcLheU7ANIV/tbnOz6/MVlVROGhCELeM/r1iHBwI9FDD/kLJ
 QOesmgLXgPZmru69vjDeUc8ugRcCM1m7clNlr1RsAQd8q1TRgGB6SwidZwVwMQ4ZBCFS
 rOSpBkGnkumuTMz9GIrRLtm8u98Sq6hmbJEvpHJ23Zlch/F3u6SL14K7cRQjmXT2wyvw
 4ftP8IXsH1mBLWbixzxIHzd04Rb2aV9IqZ7gYkLtVEMHDpJT1fww2x2q4hyoYzA6pCB/
 h6cpa2d6ebAG0k48IZobIQCRGdiS93cgJDJZBX/a0mXtV05dY07oAOYSIh+xan8dnTyY
 AnzQ==
X-Gm-Message-State: AOAM53277X2oPZ5yxg8rnQsXFy0EnnWi1qZNy7TGODGMYDlXg2OxykWo
 0WsFyYmdYtV+rUq7NIb4LguRpt4LJ/TFX5Ao
X-Google-Smtp-Source: ABdhPJyv/Bgtu7cqt3I4XDejs4rGm4Cgsl7T92XBzi9+PB+ioWkgDoDBerZiR2fUNK15fuKsVOkd4g==
X-Received: by 2002:a17:90b:38c6:: with SMTP id
 nn6mr2932658pjb.246.1634288573637; 
 Fri, 15 Oct 2021 02:02:53 -0700 (PDT)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com.
 [209.85.216.51])
 by smtp.gmail.com with ESMTPSA id u12sm4216666pgi.21.2021.10.15.02.02.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 02:02:53 -0700 (PDT)
Received: by mail-pj1-f51.google.com with SMTP id np13so6748099pjb.4;
 Fri, 15 Oct 2021 02:02:52 -0700 (PDT)
X-Received: by 2002:a17:902:e313:b0:13f:1866:aa86 with SMTP id
 q19-20020a170902e31300b0013f1866aa86mr9917755plc.55.1634288572477; Fri, 15
 Oct 2021 02:02:52 -0700 (PDT)
MIME-Version: 1.0
References: <20211015074627.3957162-1-frank.chang@sifive.com>
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Fri, 15 Oct 2021 17:02:41 +0800
X-Gmail-Original-Message-ID: <CANzO1D16NphX_aUrmsrYHUwjx75O=ED7cPu_5e3QNYgWwR=m+Q@mail.gmail.com>
Message-ID: <CANzO1D16NphX_aUrmsrYHUwjx75O=ED7cPu_5e3QNYgWwR=m+Q@mail.gmail.com>
Subject: Re: [PATCH v8 00/78] support vector extension v1.0
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000d2b86505ce6075eb"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
X-List-Received-Date: Fri, 15 Oct 2021 09:03:01 -0000

--000000000000d2b86505ce6075eb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<frank.chang@sifive.com> =E6=96=BC 2021=E5=B9=B410=E6=9C=8815=E6=97=A5 =E9=
=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:48=E5=AF=AB=E9=81=93=EF=BC=9A

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
> RVV v1.0 can be enabled with -cpu option: v=3Dtrue and specify vext_spec
> option to v1.0 (i.e. vext_spec=3Dv1.0)
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
>   * add vector floating-point reciprocal square-root estimate instruction=
.
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
>
I notice that there are couple of unexpected patches being incldued in this
series:

* [PATCH 18/76] target/riscv: rvv-1.0: configure instructions
* [PATCH 19/76] target/riscv: rvv-1.0: stride load and store instructions
* [PATCH 20/76] target/riscv: rvv-1.0: index load and store instructions
* [PATCH 21/76] target/riscv: rvv-1.0: fix address index overflow bug of
indexed load/store insns
* [PATCH 22/76] target/riscv: rvv-1.0: fault-only-first unit stride load
* [PATCH 23/76] target/riscv: rvv-1.0: amo operations

It's probably because I had dirty content in my directory which I didn't
aware of :(
Please ignore them.
Or I can resend the patchset if that's more convenient to review.
Sorry for the confusion.

Regards,
Frank Chang

--000000000000d2b86505ce6075eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">&lt;<a href=3D"mailto:frank.chang@sifive.=
com">frank.chang@sifive.com</a>&gt; =E6=96=BC 2021=E5=B9=B410=E6=9C=8815=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:48=E5=AF=AB=E9=81=93=EF=BC=9A=
<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">From: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com"=
 target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
<br>
This patchset implements the vector extension v1.0 for RISC-V on QEMU.<br>
<br>
RVV v1.0 spec is now fronzen for public review:<br>
<a href=3D"https://github.com/riscv/riscv-v-spec/releases/tag/v1.0" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/riscv/riscv-v-spec/release=
s/tag/v1.0</a><br>
<br>
The port is available here:<br>
<a href=3D"https://github.com/sifive/qemu/tree/rvv-1.0-upstream-v8" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/sifive/qemu/tree/rvv-1.0-u=
pstream-v8</a><br>
<br>
RVV v1.0 can be enabled with -cpu option: v=3Dtrue and specify vext_spec<br=
>
option to v1.0 (i.e. vext_spec=3Dv1.0)<br>
<br>
Note: This patchset depends on other patchsets listed in Based-on<br>
=C2=A0 =C2=A0 =C2=A0 section below so it is not able to be built unless tho=
se patchsets<br>
=C2=A0 =C2=A0 =C2=A0 are applied.<br>
<br>
Changelog:<br>
<br>
v8<br>
=C2=A0 * Use {get,dest}_gpr APIs.<br>
=C2=A0 * remove vector AMO instructions.<br>
=C2=A0 * rename vpopc.m to vcpop.m.<br>
=C2=A0 * rename vle1.v and vse1.v to vlm.v and vsm.v.<br>
=C2=A0 * rename <a href=3D"http://vmandnot.mm" rel=3D"noreferrer" target=3D=
"_blank">vmandnot.mm</a> and <a href=3D"http://vmornot.mm" rel=3D"noreferre=
r" target=3D"_blank">vmornot.mm</a> to <a href=3D"http://vmandn.mm" rel=3D"=
noreferrer" target=3D"_blank">vmandn.mm</a> and <a href=3D"http://vmorn.mm"=
 rel=3D"noreferrer" target=3D"_blank">vmorn.mm</a>.<br>
<br>
v7<br>
=C2=A0 * remove hardcoded GDB vector registers list.<br>
=C2=A0 * add vsetivli instruction.<br>
=C2=A0 * add vle1.v and vse1.v instructions.<br>
<br>
v6<br>
=C2=A0 * add vector floating-point reciprocal estimate instruction.<br>
=C2=A0 * add vector floating-point reciprocal square-root estimate instruct=
ion.<br>
=C2=A0 * update check rules for segment register groups, each segment regis=
ter<br>
=C2=A0 =C2=A0 group has to follow overlap rules.<br>
=C2=A0 * update viota.m instruction check rules.<br>
<br>
v5<br>
=C2=A0 * refactor RVV v1.0 check functions.<br>
=C2=A0 =C2=A0 (Thanks to Richard Henderson&#39;s bitwise tricks.)<br>
=C2=A0 * relax RV_VLEN_MAX to 1024-bits.<br>
=C2=A0 * implement vstart CSR&#39;s behaviors.<br>
=C2=A0 * trigger illegal instruction exception if frm is not valid for<br>
=C2=A0 =C2=A0 vector floating-point instructions.<br>
=C2=A0 * rebase on riscv-to-apply.next.<br>
<br>
v4<br>
=C2=A0 * remove explicit float flmul variable in DisasContext.<br>
=C2=A0 * replace floating-point calculations with shift operations to<br>
=C2=A0 =C2=A0 improve performance.<br>
=C2=A0 * relax RV_VLEN_MAX to 512-bits.<br>
<br>
v3<br>
=C2=A0 * apply nan-box helpers from Richard Henderson.<br>
=C2=A0 * remove fp16 api changes as they are sent independently in another<=
br>
=C2=A0 =C2=A0 pathcset by Chih-Min Chao.<br>
=C2=A0 * remove all tail elements clear functions as tail elements can<br>
=C2=A0 =C2=A0 retain unchanged for either VTA set to undisturbed or agnosti=
c.<br>
=C2=A0 * add fp16 nan-box check generator function.<br>
=C2=A0 * add floating-point rounding mode enum.<br>
=C2=A0 * replace flmul arithmetic with shifts to avoid floating-point<br>
=C2=A0 =C2=A0 conversions.<br>
=C2=A0 * add Zvqmac extension.<br>
=C2=A0 * replace gdbstub vector register xml files with dynamic generator.<=
br>
=C2=A0 * bumped to RVV v1.0.<br>
=C2=A0 * RVV v1.0 related changes:<br>
=C2=A0 =C2=A0 * add vl&lt;nf&gt;re&lt;eew&gt;.v and vs&lt;nf&gt;r.v vector =
whole register<br>
=C2=A0 =C2=A0 =C2=A0 load/store instructions<br>
=C2=A0 =C2=A0 * add vrgatherei16 instruction.<br>
=C2=A0 =C2=A0 * rearranged bits in vtype to make vlmul bits into a contiguo=
us<br>
=C2=A0 =C2=A0 =C2=A0 field.<br>
<br>
v2<br>
=C2=A0 * drop v0.7.1 support.<br>
=C2=A0 * replace invisible return check macros with functions.<br>
=C2=A0 * move mark_vs_dirty() to translators.<br>
=C2=A0 * add SSTATUS_VS flag for s-mode.<br>
=C2=A0 * nan-box scalar fp register for floating-point operations.<br>
=C2=A0 * add gdbstub files for vector registers to allow system-mode<br>
=C2=A0 =C2=A0 debugging with GDB.<br>
<br>
Based-on: &lt;<a href=3D"mailto:20211015065500.3850513-1-frank.chang@sifive=
.com" target=3D"_blank">20211015065500.3850513-1-frank.chang@sifive.com</a>=
&gt;<br>
Based-on: &lt;<a href=3D"mailto:20211015070307.3860984-1-frank.chang@sifive=
.com" target=3D"_blank">20211015070307.3860984-1-frank.chang@sifive.com</a>=
&gt;<br>
<br>
Frank Chang (73):<br>
=C2=A0 target/riscv: fix TB_FLAGS bits overlapping bug for rvv/rvh<br>
=C2=A0 target/riscv: drop vector 0.7.1 and add 1.0 support<br>
=C2=A0 target/riscv: Use FIELD_EX32() to extract wd field<br>
=C2=A0 target/riscv: rvv-1.0: introduce writable misa.v field<br>
=C2=A0 target/riscv: rvv-1.0: add translation-time vector context status<br=
>
=C2=A0 target/riscv: rvv-1.0: remove rvv related codes from fcsr registers<=
br>
=C2=A0 target/riscv: rvv-1.0: check MSTATUS_VS when accessing vector csr<br=
>
=C2=A0 =C2=A0 registers<br>
=C2=A0 target/riscv: rvv-1.0: remove MLEN calculations<br>
=C2=A0 target/riscv: rvv-1.0: add fractional LMUL<br>
=C2=A0 target/riscv: rvv-1.0: add VMA and VTA<br>
=C2=A0 target/riscv: rvv-1.0: update check functions<br>
=C2=A0 target/riscv: introduce more imm value modes in translator functions=
<br>
=C2=A0 target/riscv: rvv:1.0: add translation-time nan-box helper function<=
br>
=C2=A0 target/riscv: rvv-1.0: remove amo operations instructions<br>
=C2=A0 target/riscv: rvv-1.0: configure instructions<br>
=C2=A0 target/riscv: rvv-1.0: stride load and store instructions<br>
=C2=A0 target/riscv: rvv-1.0: index load and store instructions<br>
=C2=A0 target/riscv: rvv-1.0: fix address index overflow bug of indexed<br>
=C2=A0 =C2=A0 load/store insns<br>
=C2=A0 target/riscv: rvv-1.0: fault-only-first unit stride load<br>
=C2=A0 target/riscv: rvv-1.0: load/store whole register instructions<br>
=C2=A0 target/riscv: rvv-1.0: update vext_max_elems() for load/store insns<=
br>
=C2=A0 target/riscv: rvv-1.0: take fractional LMUL into vector max elements=
<br>
=C2=A0 =C2=A0 calculation<br>
=C2=A0 target/riscv: rvv-1.0: floating-point square-root instruction<br>
=C2=A0 target/riscv: rvv-1.0: floating-point classify instructions<br>
=C2=A0 target/riscv: rvv-1.0: count population in mask instruction<br>
=C2=A0 target/riscv: rvv-1.0: find-first-set mask bit instruction<br>
=C2=A0 target/riscv: rvv-1.0: set-X-first mask bit instructions<br>
=C2=A0 target/riscv: rvv-1.0: iota instruction<br>
=C2=A0 target/riscv: rvv-1.0: element index instruction<br>
=C2=A0 target/riscv: rvv-1.0: allow load element with sign-extended<br>
=C2=A0 target/riscv: rvv-1.0: register gather instructions<br>
=C2=A0 target/riscv: rvv-1.0: integer scalar move instructions<br>
=C2=A0 target/riscv: rvv-1.0: floating-point move instruction<br>
=C2=A0 target/riscv: rvv-1.0: floating-point scalar move instructions<br>
=C2=A0 target/riscv: rvv-1.0: whole register move instructions<br>
=C2=A0 target/riscv: rvv-1.0: integer extension instructions<br>
=C2=A0 target/riscv: rvv-1.0: single-width averaging add and subtract<br>
=C2=A0 =C2=A0 instructions<br>
=C2=A0 target/riscv: rvv-1.0: single-width bit shift instructions<br>
=C2=A0 target/riscv: rvv-1.0: integer add-with-carry/subtract-with-borrow<b=
r>
=C2=A0 target/riscv: rvv-1.0: narrowing integer right shift instructions<br=
>
=C2=A0 target/riscv: rvv-1.0: widening integer multiply-add instructions<br=
>
=C2=A0 target/riscv: rvv-1.0: single-width saturating add and subtract<br>
=C2=A0 =C2=A0 instructions<br>
=C2=A0 target/riscv: rvv-1.0: integer comparison instructions<br>
=C2=A0 target/riscv: rvv-1.0: floating-point compare instructions<br>
=C2=A0 target/riscv: rvv-1.0: mask-register logical instructions<br>
=C2=A0 target/riscv: rvv-1.0: slide instructions<br>
=C2=A0 target/riscv: rvv-1.0: floating-point slide instructions<br>
=C2=A0 target/riscv: rvv-1.0: narrowing fixed-point clip instructions<br>
=C2=A0 target/riscv: rvv-1.0: single-width floating-point reduction<br>
=C2=A0 target/riscv: rvv-1.0: widening floating-point reduction instruction=
s<br>
=C2=A0 target/riscv: rvv-1.0: single-width scaling shift instructions<br>
=C2=A0 target/riscv: rvv-1.0: remove widening saturating scaled multiply-ad=
d<br>
=C2=A0 target/riscv: rvv-1.0: remove vmford.vv and vmford.vf<br>
=C2=A0 target/riscv: rvv-1.0: remove integer extract instruction<br>
=C2=A0 target/riscv: rvv-1.0: floating-point min/max instructions<br>
=C2=A0 target/riscv: introduce floating-point rounding mode enum<br>
=C2=A0 target/riscv: rvv-1.0: floating-point/integer type-convert<br>
=C2=A0 =C2=A0 instructions<br>
=C2=A0 target/riscv: rvv-1.0: widening floating-point/integer type-convert<=
br>
=C2=A0 target/riscv: add &quot;set round to odd&quot; rounding mode helper =
function<br>
=C2=A0 target/riscv: rvv-1.0: narrowing floating-point/integer type-convert=
<br>
=C2=A0 target/riscv: rvv-1.0: relax RV_VLEN_MAX to 1024-bits<br>
=C2=A0 target/riscv: rvv-1.0: implement vstart CSR<br>
=C2=A0 target/riscv: rvv-1.0: trigger illegal instruction exception if frm =
is<br>
=C2=A0 =C2=A0 not valid<br>
=C2=A0 target/riscv: rvv-1.0: set mstatus.SD bit when writing vector CSRs<b=
r>
=C2=A0 target/riscv: rvv-1.0: floating-point reciprocal square-root estimat=
e<br>
=C2=A0 =C2=A0 instruction<br>
=C2=A0 target/riscv: rvv-1.0: floating-point reciprocal estimate instructio=
n<br>
=C2=A0 target/riscv: set mstatus.SD bit when writing fp CSRs<br>
=C2=A0 target/riscv: rvv-1.0: rename r2_zimm to r2_zimm11<br>
=C2=A0 target/riscv: rvv-1.0: add vsetivli instruction<br>
=C2=A0 target/riscv: rvv-1.0: add evl parameter to vext_ldst_us()<br>
=C2=A0 target/riscv: rvv-1.0: add vector unit-stride mask load/store insns<=
br>
=C2=A0 target/riscv: rvv-1.0: rename <a href=3D"http://vmandnot.mm" rel=3D"=
noreferrer" target=3D"_blank">vmandnot.mm</a> and <a href=3D"http://vmornot=
.mm" rel=3D"noreferrer" target=3D"_blank">vmornot.mm</a> to <a href=3D"http=
://vmandn.mm" rel=3D"noreferrer" target=3D"_blank">vmandn.mm</a><br>
=C2=A0 =C2=A0 and <a href=3D"http://vmorn.mm" rel=3D"noreferrer" target=3D"=
_blank">vmorn.mm</a><br>
=C2=A0 target/riscv: rvv-1.0: update opivv_vadc_check() comment<br>
<br>
Greentime Hu (1):<br>
=C2=A0 target/riscv: rvv-1.0: add vlenb register<br>
<br>
Hsiangkai Wang (1):<br>
=C2=A0 target/riscv: gdb: support vector registers for rv64 &amp; rv32<br>
<br>
LIU Zhiwei (3):<br>
=C2=A0 target/riscv: rvv-1.0: add mstatus VS field<br>
=C2=A0 target/riscv: rvv-1.0: add sstatus VS field<br>
=C2=A0 target/riscv: rvv-1.0: add vcsr register<br>
<br>
=C2=A0target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A012 +-<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A085 +-<br>
=C2=A0target/riscv/cpu_bits.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A010 +<br>
=C2=A0target/riscv/cpu_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A015 +-<br>
=C2=A0target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A092 +-<br>
=C2=A0target/riscv/fpu_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A017 +-<br>
=C2=A0target/riscv/gdbstub.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 184 ++<br>
=C2=A0target/riscv/helper.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 435 ++-<br>
=C2=A0target/riscv/insn32.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 294 +-<br>
=C2=A0target/riscv/insn_trans/trans_rvv.c.inc | 2423 +++++++++------<br>
=C2=A0target/riscv/internals.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A024 +-<br>
=C2=A0target/riscv/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A074 +-<br>
=C2=A0target/riscv/vector_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 3601 ++++++++++++-----------<br>
=C2=A013 files changed, 4176 insertions(+), 3090 deletions(-)<br>
<br>
--<br>
2.25.1<br>
<br>
<br></blockquote><div><br></div><div>I notice that there are couple of unex=
pected patches being incldued in this series:</div><div><br></div><div>* [P=
ATCH 18/76] target/riscv: rvv-1.0: configure instructions<br>* [PATCH 19/76=
] target/riscv: rvv-1.0: stride load and store instructions<br>* [PATCH 20/=
76] target/riscv: rvv-1.0: index load and store instructions<br>* [PATCH 21=
/76] target/riscv: rvv-1.0: fix address index overflow bug of indexed load/=
store insns<br>* [PATCH 22/76] target/riscv: rvv-1.0: fault-only-first unit=
 stride load<br>* [PATCH 23/76] target/riscv: rvv-1.0: amo operations<br></=
div><div><br></div><div>It&#39;s probably because I had dirty content in my=
 directory which I didn&#39;t aware of :(</div><div>Please ignore them.</di=
v><div>Or I can resend the patchset if that&#39;s more convenient to review=
.</div><div>Sorry for the confusion.</div><div><br></div><div>Regards,<br>F=
rank Chang</div></div></div>

--000000000000d2b86505ce6075eb--

