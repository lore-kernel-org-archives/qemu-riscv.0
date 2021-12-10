Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvaRK-0008Dl-K2
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:35:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaRI-0008CB-2Y
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:35:32 -0500
Received: from [2607:f8b0:4864:20::12b] (port=39664
 helo=mail-il1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaRD-0005XF-M4
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:35:31 -0500
Received: by mail-il1-x12b.google.com with SMTP id a11so7639060ilj.6
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l3+XV/q3bwx73RD7N3hlGZCU0PtbjdPP7uTO2RcvFjk=;
 b=Nj+HuPKChRfERmjMWg+AdRhiC/Z/H8RmFH1deFf9JiDTHOqlTRsTdumigp+/enKoaI
 Uz/ex1/G9nI9YiEytulgip/IJZ+1j2gGqi+lVVfMOaIQCftRbZqsXrcMAgCj4ERR/L0i
 Y+7nfwojVNal4NH/CtVaizccul/wOpSMtU9sNYAry3yGdsyMhbQ9TeSx5ZJ81a1EsJmz
 SpnU9CHZaGi8wF+NOrSrxzQQEU28h741SQFhjcF5xpOAhEL11adGLuoxIkKYHC2ATJ0p
 +l8AWn9lnuLfi/u+055PtTnNleU2B+xyWdO0Iegcmcj+mKFehAvI09MkmI7vWtLOW6xD
 Eg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l3+XV/q3bwx73RD7N3hlGZCU0PtbjdPP7uTO2RcvFjk=;
 b=dFoiHPezz53Zu+jx10ZxRh6DkT6lZlqq9A4i4X/TW2sfxUMGgdabBXZGntFVSH3Jq5
 wmU/A5Miw9ouuHAhjkTStWptIjdQB1DF1GYheIwho98w3IKlf5BRl0x62Sc9txGgeSsn
 B7hJEQobxbKLhQV6u6Azq2lJyr2682SL7kBrGR2HGNEXCdZ9wElUs5kYc8LsAdEaU6HA
 EwZyhSUOHnq1C2kT7+dem9ATeDMbxtJGo0r1UD5Qn3O5Bn11Z1EywiTpsXuQQin12Wf2
 U+Z96zDie7zzE8AZFFw+iJ7gLVhpewtQ66VLz9rQ7TXmpULFiXq/fKoFqqsyy+CJnLAF
 Akbg==
X-Gm-Message-State: AOAM530eHXP0o7GGLdMFjlpfVy8e2bPFn+U2VDe9B0Av3lEEVynL7b69
 UjIccWbMU1WGc4SMD9K0NNBIyRbLW0DzaLiI/80vDzyAJn2AsCrq
X-Google-Smtp-Source: ABdhPJx2FVO9EeddBslNy5UjDZNuwL73cIb7JP6yfBhx6pcRKkzyz2ca/zCAK2oPTWk4BAblSwKz3l5hWvisGDq6R8s=
X-Received: by 2002:a92:c5ad:: with SMTP id r13mr18830130ilt.53.1639121722211; 
 Thu, 09 Dec 2021 23:35:22 -0800 (PST)
MIME-Version: 1.0
References: <20211129030340.429689-1-frank.chang@sifive.com>
 <CAKmqyKPKZ9hkF5cncVf5bOJQ-wrTUA0YcR76xzQ+brxkUb=NiQ@mail.gmail.com>
In-Reply-To: <CAKmqyKPKZ9hkF5cncVf5bOJQ-wrTUA0YcR76xzQ+brxkUb=NiQ@mail.gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Fri, 10 Dec 2021 15:35:11 +0800
Message-ID: <CAE_xrPjKBYqTQyKV2Sss6sQcJE=E5nw9O7ouesmEob4HJfzTAw@mail.gmail.com>
Subject: Re: [PATCH v10 00/77] support vector extension v1.0
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000ff17e005d2c5c308"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=frank.chang@sifive.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
X-List-Received-Date: Fri, 10 Dec 2021 07:35:32 -0000

--000000000000ff17e005d2c5c308
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 8, 2021 at 2:40 PM Alistair Francis <alistair23@gmail.com>
wrote:

> On Mon, Nov 29, 2021 at 1:04 PM <frank.chang@sifive.com> wrote:
> >
> > From: Frank Chang <frank.chang@sifive.com>
> >
> > This patchset implements the vector extension v1.0 for RISC-V on QEMU.
> >
> > RVV v1.0 spec is now fronzen for public review:
> > https://github.com/riscv/riscv-v-spec/releases/tag/v1.0
> >
> > The port is available here:
> > https://github.com/sifive/qemu/tree/rvv-1.0-upstream-v10
> >
> > RVV v1.0 can be enabled with -cpu option: v=true and specify vext_spec
> > option to v1.0 (i.e. vext_spec=v1.0)
> >
> > Note: This patchset depends on other patchsets listed in Based-on
> >       section below so it is not able to be built unless those patchsets
> >       are applied.
>
> I think this is all reviewed now. Once your other patch sets are
> merged just re-send this and I can apply it.
>
> Alistair
>

Hi Alistair,

Thanks for the review.
I think <20211021160847.2748577-1-frank.chang@sifive.com> has already been
applied to your riscv-to-apply.next branch.
I'll rebase <20211021162956.2772656-1-frank.chang@sifive.com> and also this
patchset as well then resend them.

Regards,
Frank Chang


>
> >
> > Changelog:
> >
> > v10
> >   * Add ELEN checks for widening and narrowing instructions.
> >
> > v9
> >   * Remove explicitly set mstatus.SD patches as mstatus.SD is now
> >     set in add_status_sd().
> >   * Rebase on riscv-to-apply.next branch.
> >
> > v8
> >   * Use {get,dest}_gpr APIs.
> >   * remove vector AMO instructions.
> >   * rename vpopc.m to vcpop.m.
> >   * rename vle1.v and vse1.v to vlm.v and vsm.v.
> >   * rename vmandnot.mm and vmornot.mm to vmandn.mm and vmorn.mm.
> >
> > v7
> >   * remove hardcoded GDB vector registers list.
> >   * add vsetivli instruction.
> >   * add vle1.v and vse1.v instructions.
> >
> > v6
> >   * add vector floating-point reciprocal estimate instruction.
> >   * add vector floating-point reciprocal square-root estimate
> instruction.
> >   * update check rules for segment register groups, each segment register
> >     group has to follow overlap rules.
> >   * update viota.m instruction check rules.
> >
> > v5
> >   * refactor RVV v1.0 check functions.
> >     (Thanks to Richard Henderson's bitwise tricks.)
> >   * relax RV_VLEN_MAX to 1024-bits.
> >   * implement vstart CSR's behaviors.
> >   * trigger illegal instruction exception if frm is not valid for
> >     vector floating-point instructions.
> >   * rebase on riscv-to-apply.next.
> >
> > v4
> >   * remove explicit float flmul variable in DisasContext.
> >   * replace floating-point calculations with shift operations to
> >     improve performance.
> >   * relax RV_VLEN_MAX to 512-bits.
> >
> > v3
> >   * apply nan-box helpers from Richard Henderson.
> >   * remove fp16 api changes as they are sent independently in another
> >     pathcset by Chih-Min Chao.
> >   * remove all tail elements clear functions as tail elements can
> >     retain unchanged for either VTA set to undisturbed or agnostic.
> >   * add fp16 nan-box check generator function.
> >   * add floating-point rounding mode enum.
> >   * replace flmul arithmetic with shifts to avoid floating-point
> >     conversions.
> >   * add Zvqmac extension.
> >   * replace gdbstub vector register xml files with dynamic generator.
> >   * bumped to RVV v1.0.
> >   * RVV v1.0 related changes:
> >     * add vl<nf>re<eew>.v and vs<nf>r.v vector whole register
> >       load/store instructions
> >     * add vrgatherei16 instruction.
> >     * rearranged bits in vtype to make vlmul bits into a contiguous
> >       field.
> >
> > v2
> >   * drop v0.7.1 support.
> >   * replace invisible return check macros with functions.
> >   * move mark_vs_dirty() to translators.
> >   * add SSTATUS_VS flag for s-mode.
> >   * nan-box scalar fp register for floating-point operations.
> >   * add gdbstub files for vector registers to allow system-mode
> >     debugging with GDB.
> >
> > Based-on: <20211021160847.2748577-1-frank.chang@sifive.com>
> > Based-on: <20211021162956.2772656-1-frank.chang@sifive.com>
> >
> > Frank Chang (72):
> >   target/riscv: drop vector 0.7.1 and add 1.0 support
> >   target/riscv: Use FIELD_EX32() to extract wd field
> >   target/riscv: rvv-1.0: set mstatus.SD bit if mstatus.VS is dirty
> >   target/riscv: rvv-1.0: introduce writable misa.v field
> >   target/riscv: rvv-1.0: add translation-time vector context status
> >   target/riscv: rvv-1.0: remove rvv related codes from fcsr registers
> >   target/riscv: rvv-1.0: check MSTATUS_VS when accessing vector csr
> >     registers
> >   target/riscv: rvv-1.0: remove MLEN calculations
> >   target/riscv: rvv-1.0: add fractional LMUL
> >   target/riscv: rvv-1.0: add VMA and VTA
> >   target/riscv: rvv-1.0: update check functions
> >   target/riscv: introduce more imm value modes in translator functions
> >   target/riscv: rvv:1.0: add translation-time nan-box helper function
> >   target/riscv: rvv-1.0: remove amo operations instructions
> >   target/riscv: rvv-1.0: configure instructions
> >   target/riscv: rvv-1.0: stride load and store instructions
> >   target/riscv: rvv-1.0: index load and store instructions
> >   target/riscv: rvv-1.0: fix address index overflow bug of indexed
> >     load/store insns
> >   target/riscv: rvv-1.0: fault-only-first unit stride load
> >   target/riscv: rvv-1.0: load/store whole register instructions
> >   target/riscv: rvv-1.0: update vext_max_elems() for load/store insns
> >   target/riscv: rvv-1.0: take fractional LMUL into vector max elements
> >     calculation
> >   target/riscv: rvv-1.0: floating-point square-root instruction
> >   target/riscv: rvv-1.0: floating-point classify instructions
> >   target/riscv: rvv-1.0: count population in mask instruction
> >   target/riscv: rvv-1.0: find-first-set mask bit instruction
> >   target/riscv: rvv-1.0: set-X-first mask bit instructions
> >   target/riscv: rvv-1.0: iota instruction
> >   target/riscv: rvv-1.0: element index instruction
> >   target/riscv: rvv-1.0: allow load element with sign-extended
> >   target/riscv: rvv-1.0: register gather instructions
> >   target/riscv: rvv-1.0: integer scalar move instructions
> >   target/riscv: rvv-1.0: floating-point move instruction
> >   target/riscv: rvv-1.0: floating-point scalar move instructions
> >   target/riscv: rvv-1.0: whole register move instructions
> >   target/riscv: rvv-1.0: integer extension instructions
> >   target/riscv: rvv-1.0: single-width averaging add and subtract
> >     instructions
> >   target/riscv: rvv-1.0: single-width bit shift instructions
> >   target/riscv: rvv-1.0: integer add-with-carry/subtract-with-borrow
> >   target/riscv: rvv-1.0: narrowing integer right shift instructions
> >   target/riscv: rvv-1.0: widening integer multiply-add instructions
> >   target/riscv: rvv-1.0: single-width saturating add and subtract
> >     instructions
> >   target/riscv: rvv-1.0: integer comparison instructions
> >   target/riscv: rvv-1.0: floating-point compare instructions
> >   target/riscv: rvv-1.0: mask-register logical instructions
> >   target/riscv: rvv-1.0: slide instructions
> >   target/riscv: rvv-1.0: floating-point slide instructions
> >   target/riscv: rvv-1.0: narrowing fixed-point clip instructions
> >   target/riscv: rvv-1.0: single-width floating-point reduction
> >   target/riscv: rvv-1.0: widening floating-point reduction instructions
> >   target/riscv: rvv-1.0: single-width scaling shift instructions
> >   target/riscv: rvv-1.0: remove widening saturating scaled multiply-add
> >   target/riscv: rvv-1.0: remove vmford.vv and vmford.vf
> >   target/riscv: rvv-1.0: remove integer extract instruction
> >   target/riscv: rvv-1.0: floating-point min/max instructions
> >   target/riscv: introduce floating-point rounding mode enum
> >   target/riscv: rvv-1.0: floating-point/integer type-convert
> >     instructions
> >   target/riscv: rvv-1.0: widening floating-point/integer type-convert
> >   target/riscv: add "set round to odd" rounding mode helper function
> >   target/riscv: rvv-1.0: narrowing floating-point/integer type-convert
> >   target/riscv: rvv-1.0: relax RV_VLEN_MAX to 1024-bits
> >   target/riscv: rvv-1.0: implement vstart CSR
> >   target/riscv: rvv-1.0: trigger illegal instruction exception if frm is
> >     not valid
> >   target/riscv: rvv-1.0: floating-point reciprocal square-root estimate
> >     instruction
> >   target/riscv: rvv-1.0: floating-point reciprocal estimate instruction
> >   target/riscv: rvv-1.0: rename r2_zimm to r2_zimm11
> >   target/riscv: rvv-1.0: add vsetivli instruction
> >   target/riscv: rvv-1.0: add evl parameter to vext_ldst_us()
> >   target/riscv: rvv-1.0: add vector unit-stride mask load/store insns
> >   target/riscv: rvv-1.0: rename vmandnot.mm and vmornot.mm to vmandn.mm
> >     and vmorn.mm
> >   target/riscv: rvv-1.0: update opivv_vadc_check() comment
> >   target/riscv: rvv-1.0: Add ELEN checks for widening and narrowing
> >     instructions
> >
> > Greentime Hu (1):
> >   target/riscv: rvv-1.0: add vlenb register
> >
> > Hsiangkai Wang (1):
> >   target/riscv: gdb: support vector registers for rv64 & rv32
> >
> > LIU Zhiwei (3):
> >   target/riscv: rvv-1.0: add mstatus VS field
> >   target/riscv: rvv-1.0: add sstatus VS field
> >   target/riscv: rvv-1.0: add vcsr register
> >
> >  target/riscv/cpu.c                      |   18 +-
> >  target/riscv/cpu.h                      |   61 +-
> >  target/riscv/cpu_bits.h                 |   10 +
> >  target/riscv/cpu_helper.c               |   39 +-
> >  target/riscv/csr.c                      |   63 +-
> >  target/riscv/fpu_helper.c               |   17 +-
> >  target/riscv/gdbstub.c                  |  184 ++
> >  target/riscv/helper.h                   |  435 ++-
> >  target/riscv/insn32.decode              |  294 +-
> >  target/riscv/insn_trans/trans_rvv.c.inc | 2429 +++++++++------
> >  target/riscv/internals.h                |   24 +-
> >  target/riscv/translate.c                |   73 +-
> >  target/riscv/vector_helper.c            | 3601 ++++++++++++-----------
> >  13 files changed, 4157 insertions(+), 3091 deletions(-)
> >
> > --
> > 2.25.1
> >
> >
>

--000000000000ff17e005d2c5c308
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Dec 8, 2021 at 2:40 PM Alistair F=
rancis &lt;<a href=3D"mailto:alistair23@gmail.com" target=3D"_blank">alista=
ir23@gmail.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On Mon, Nov 29, 2021 at 1:04 PM &l=
t;<a href=3D"mailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@s=
ifive.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com" target=
=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt;<br>
&gt; This patchset implements the vector extension v1.0 for RISC-V on QEMU.=
<br>
&gt;<br>
&gt; RVV v1.0 spec is now fronzen for public review:<br>
&gt; <a href=3D"https://github.com/riscv/riscv-v-spec/releases/tag/v1.0" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/riscv/riscv-v-spec/re=
leases/tag/v1.0</a><br>
&gt;<br>
&gt; The port is available here:<br>
&gt; <a href=3D"https://github.com/sifive/qemu/tree/rvv-1.0-upstream-v10" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/sifive/qemu/tree/rvv=
-1.0-upstream-v10</a><br>
&gt;<br>
&gt; RVV v1.0 can be enabled with -cpu option: v=3Dtrue and specify vext_sp=
ec<br>
&gt; option to v1.0 (i.e. vext_spec=3Dv1.0)<br>
&gt;<br>
&gt; Note: This patchset depends on other patchsets listed in Based-on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0section below so it is not able to be built =
unless those patchsets<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0are applied.<br>
<br>
I think this is all reviewed now. Once your other patch sets are<br>
merged just re-send this and I can apply it.<br>
<br>
Alistair<br></blockquote><div><br></div><div>Hi Alistair,</div><div><br></d=
iv><div>Thanks for the review.</div><div>I think=C2=A0&lt;<a href=3D"mailto=
:20211021160847.2748577-1-frank.chang@sifive.com">20211021160847.2748577-1-=
frank.chang@sifive.com</a>&gt; has already been applied to your=C2=A0riscv-=
to-apply.next branch.</div><div>I&#39;ll rebase=C2=A0&lt;<a href=3D"mailto:=
20211021162956.2772656-1-frank.chang@sifive.com">20211021162956.2772656-1-f=
rank.chang@sifive.com</a>&gt; and also this patchset as well then resend th=
em.</div><div><br></div><div>Regards,</div><div>Frank Chang</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; Changelog:<br>
&gt;<br>
&gt; v10<br>
&gt;=C2=A0 =C2=A0* Add ELEN checks for widening and narrowing instructions.=
<br>
&gt;<br>
&gt; v9<br>
&gt;=C2=A0 =C2=A0* Remove explicitly set mstatus.SD patches as mstatus.SD i=
s now<br>
&gt;=C2=A0 =C2=A0 =C2=A0set in add_status_sd().<br>
&gt;=C2=A0 =C2=A0* Rebase on riscv-to-apply.next branch.<br>
&gt;<br>
&gt; v8<br>
&gt;=C2=A0 =C2=A0* Use {get,dest}_gpr APIs.<br>
&gt;=C2=A0 =C2=A0* remove vector AMO instructions.<br>
&gt;=C2=A0 =C2=A0* rename vpopc.m to vcpop.m.<br>
&gt;=C2=A0 =C2=A0* rename vle1.v and vse1.v to vlm.v and vsm.v.<br>
&gt;=C2=A0 =C2=A0* rename <a href=3D"http://vmandnot.mm" rel=3D"noreferrer"=
 target=3D"_blank">vmandnot.mm</a> and <a href=3D"http://vmornot.mm" rel=3D=
"noreferrer" target=3D"_blank">vmornot.mm</a> to <a href=3D"http://vmandn.m=
m" rel=3D"noreferrer" target=3D"_blank">vmandn.mm</a> and <a href=3D"http:/=
/vmorn.mm" rel=3D"noreferrer" target=3D"_blank">vmorn.mm</a>.<br>
&gt;<br>
&gt; v7<br>
&gt;=C2=A0 =C2=A0* remove hardcoded GDB vector registers list.<br>
&gt;=C2=A0 =C2=A0* add vsetivli instruction.<br>
&gt;=C2=A0 =C2=A0* add vle1.v and vse1.v instructions.<br>
&gt;<br>
&gt; v6<br>
&gt;=C2=A0 =C2=A0* add vector floating-point reciprocal estimate instructio=
n.<br>
&gt;=C2=A0 =C2=A0* add vector floating-point reciprocal square-root estimat=
e instruction.<br>
&gt;=C2=A0 =C2=A0* update check rules for segment register groups, each seg=
ment register<br>
&gt;=C2=A0 =C2=A0 =C2=A0group has to follow overlap rules.<br>
&gt;=C2=A0 =C2=A0* update viota.m instruction check rules.<br>
&gt;<br>
&gt; v5<br>
&gt;=C2=A0 =C2=A0* refactor RVV v1.0 check functions.<br>
&gt;=C2=A0 =C2=A0 =C2=A0(Thanks to Richard Henderson&#39;s bitwise tricks.)=
<br>
&gt;=C2=A0 =C2=A0* relax RV_VLEN_MAX to 1024-bits.<br>
&gt;=C2=A0 =C2=A0* implement vstart CSR&#39;s behaviors.<br>
&gt;=C2=A0 =C2=A0* trigger illegal instruction exception if frm is not vali=
d for<br>
&gt;=C2=A0 =C2=A0 =C2=A0vector floating-point instructions.<br>
&gt;=C2=A0 =C2=A0* rebase on riscv-to-apply.next.<br>
&gt;<br>
&gt; v4<br>
&gt;=C2=A0 =C2=A0* remove explicit float flmul variable in DisasContext.<br=
>
&gt;=C2=A0 =C2=A0* replace floating-point calculations with shift operation=
s to<br>
&gt;=C2=A0 =C2=A0 =C2=A0improve performance.<br>
&gt;=C2=A0 =C2=A0* relax RV_VLEN_MAX to 512-bits.<br>
&gt;<br>
&gt; v3<br>
&gt;=C2=A0 =C2=A0* apply nan-box helpers from Richard Henderson.<br>
&gt;=C2=A0 =C2=A0* remove fp16 api changes as they are sent independently i=
n another<br>
&gt;=C2=A0 =C2=A0 =C2=A0pathcset by Chih-Min Chao.<br>
&gt;=C2=A0 =C2=A0* remove all tail elements clear functions as tail element=
s can<br>
&gt;=C2=A0 =C2=A0 =C2=A0retain unchanged for either VTA set to undisturbed =
or agnostic.<br>
&gt;=C2=A0 =C2=A0* add fp16 nan-box check generator function.<br>
&gt;=C2=A0 =C2=A0* add floating-point rounding mode enum.<br>
&gt;=C2=A0 =C2=A0* replace flmul arithmetic with shifts to avoid floating-p=
oint<br>
&gt;=C2=A0 =C2=A0 =C2=A0conversions.<br>
&gt;=C2=A0 =C2=A0* add Zvqmac extension.<br>
&gt;=C2=A0 =C2=A0* replace gdbstub vector register xml files with dynamic g=
enerator.<br>
&gt;=C2=A0 =C2=A0* bumped to RVV v1.0.<br>
&gt;=C2=A0 =C2=A0* RVV v1.0 related changes:<br>
&gt;=C2=A0 =C2=A0 =C2=A0* add vl&lt;nf&gt;re&lt;eew&gt;.v and vs&lt;nf&gt;r=
.v vector whole register<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0load/store instructions<br>
&gt;=C2=A0 =C2=A0 =C2=A0* add vrgatherei16 instruction.<br>
&gt;=C2=A0 =C2=A0 =C2=A0* rearranged bits in vtype to make vlmul bits into =
a contiguous<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0field.<br>
&gt;<br>
&gt; v2<br>
&gt;=C2=A0 =C2=A0* drop v0.7.1 support.<br>
&gt;=C2=A0 =C2=A0* replace invisible return check macros with functions.<br=
>
&gt;=C2=A0 =C2=A0* move mark_vs_dirty() to translators.<br>
&gt;=C2=A0 =C2=A0* add SSTATUS_VS flag for s-mode.<br>
&gt;=C2=A0 =C2=A0* nan-box scalar fp register for floating-point operations=
.<br>
&gt;=C2=A0 =C2=A0* add gdbstub files for vector registers to allow system-m=
ode<br>
&gt;=C2=A0 =C2=A0 =C2=A0debugging with GDB.<br>
&gt;<br>
&gt; Based-on: &lt;<a href=3D"mailto:20211021160847.2748577-1-frank.chang@s=
ifive.com" target=3D"_blank">20211021160847.2748577-1-frank.chang@sifive.co=
m</a>&gt;<br>
&gt; Based-on: &lt;<a href=3D"mailto:20211021162956.2772656-1-frank.chang@s=
ifive.com" target=3D"_blank">20211021162956.2772656-1-frank.chang@sifive.co=
m</a>&gt;<br>
&gt;<br>
&gt; Frank Chang (72):<br>
&gt;=C2=A0 =C2=A0target/riscv: drop vector 0.7.1 and add 1.0 support<br>
&gt;=C2=A0 =C2=A0target/riscv: Use FIELD_EX32() to extract wd field<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: set mstatus.SD bit if mstatus.VS is=
 dirty<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: introduce writable misa.v field<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: add translation-time vector context=
 status<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: remove rvv related codes from fcsr =
registers<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: check MSTATUS_VS when accessing vec=
tor csr<br>
&gt;=C2=A0 =C2=A0 =C2=A0registers<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: remove MLEN calculations<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: add fractional LMUL<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: add VMA and VTA<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: update check functions<br>
&gt;=C2=A0 =C2=A0target/riscv: introduce more imm value modes in translator=
 functions<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv:1.0: add translation-time nan-box helper=
 function<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: remove amo operations instructions<=
br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: configure instructions<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: stride load and store instructions<=
br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: index load and store instructions<b=
r>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: fix address index overflow bug of i=
ndexed<br>
&gt;=C2=A0 =C2=A0 =C2=A0load/store insns<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: fault-only-first unit stride load<b=
r>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: load/store whole register instructi=
ons<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: update vext_max_elems() for load/st=
ore insns<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: take fractional LMUL into vector ma=
x elements<br>
&gt;=C2=A0 =C2=A0 =C2=A0calculation<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: floating-point square-root instruct=
ion<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: floating-point classify instruction=
s<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: count population in mask instructio=
n<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: find-first-set mask bit instruction=
<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: set-X-first mask bit instructions<b=
r>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: iota instruction<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: element index instruction<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: allow load element with sign-extend=
ed<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: register gather instructions<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: integer scalar move instructions<br=
>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: floating-point move instruction<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: floating-point scalar move instruct=
ions<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: whole register move instructions<br=
>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: integer extension instructions<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: single-width averaging add and subt=
ract<br>
&gt;=C2=A0 =C2=A0 =C2=A0instructions<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: single-width bit shift instructions=
<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: integer add-with-carry/subtract-wit=
h-borrow<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: narrowing integer right shift instr=
uctions<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: widening integer multiply-add instr=
uctions<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: single-width saturating add and sub=
tract<br>
&gt;=C2=A0 =C2=A0 =C2=A0instructions<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: integer comparison instructions<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: floating-point compare instructions=
<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: mask-register logical instructions<=
br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: slide instructions<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: floating-point slide instructions<b=
r>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: narrowing fixed-point clip instruct=
ions<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: single-width floating-point reducti=
on<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: widening floating-point reduction i=
nstructions<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: single-width scaling shift instruct=
ions<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: remove widening saturating scaled m=
ultiply-add<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: remove vmford.vv and vmford.vf<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: remove integer extract instruction<=
br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: floating-point min/max instructions=
<br>
&gt;=C2=A0 =C2=A0target/riscv: introduce floating-point rounding mode enum<=
br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: floating-point/integer type-convert=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0instructions<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: widening floating-point/integer typ=
e-convert<br>
&gt;=C2=A0 =C2=A0target/riscv: add &quot;set round to odd&quot; rounding mo=
de helper function<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: narrowing floating-point/integer ty=
pe-convert<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: relax RV_VLEN_MAX to 1024-bits<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: implement vstart CSR<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: trigger illegal instruction excepti=
on if frm is<br>
&gt;=C2=A0 =C2=A0 =C2=A0not valid<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: floating-point reciprocal square-ro=
ot estimate<br>
&gt;=C2=A0 =C2=A0 =C2=A0instruction<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: floating-point reciprocal estimate =
instruction<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: rename r2_zimm to r2_zimm11<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: add vsetivli instruction<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: add evl parameter to vext_ldst_us()=
<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: add vector unit-stride mask load/st=
ore insns<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: rename <a href=3D"http://vmandnot.m=
m" rel=3D"noreferrer" target=3D"_blank">vmandnot.mm</a> and <a href=3D"http=
://vmornot.mm" rel=3D"noreferrer" target=3D"_blank">vmornot.mm</a> to <a hr=
ef=3D"http://vmandn.mm" rel=3D"noreferrer" target=3D"_blank">vmandn.mm</a><=
br>
&gt;=C2=A0 =C2=A0 =C2=A0and <a href=3D"http://vmorn.mm" rel=3D"noreferrer" =
target=3D"_blank">vmorn.mm</a><br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: update opivv_vadc_check() comment<b=
r>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: Add ELEN checks for widening and na=
rrowing<br>
&gt;=C2=A0 =C2=A0 =C2=A0instructions<br>
&gt;<br>
&gt; Greentime Hu (1):<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: add vlenb register<br>
&gt;<br>
&gt; Hsiangkai Wang (1):<br>
&gt;=C2=A0 =C2=A0target/riscv: gdb: support vector registers for rv64 &amp;=
 rv32<br>
&gt;<br>
&gt; LIU Zhiwei (3):<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: add mstatus VS field<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: add sstatus VS field<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: add vcsr register<br>
&gt;<br>
&gt;=C2=A0 target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A018 +-<br>
&gt;=C2=A0 target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A061 +-<br>
&gt;=C2=A0 target/riscv/cpu_bits.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A010 +<br>
&gt;=C2=A0 target/riscv/cpu_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A039 +-<br>
&gt;=C2=A0 target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A063 +-<br>
&gt;=C2=A0 target/riscv/fpu_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A017 +-<br>
&gt;=C2=A0 target/riscv/gdbstub.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 184 ++<br>
&gt;=C2=A0 target/riscv/helper.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 435 ++-<br>
&gt;=C2=A0 target/riscv/insn32.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 294 +-<br>
&gt;=C2=A0 target/riscv/insn_trans/trans_rvv.c.inc | 2429 +++++++++------<b=
r>
&gt;=C2=A0 target/riscv/internals.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A024 +-<br>
&gt;=C2=A0 target/riscv/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A073 +-<br>
&gt;=C2=A0 target/riscv/vector_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 3601 ++++++++++++-----------<br>
&gt;=C2=A0 13 files changed, 4157 insertions(+), 3091 deletions(-)<br>
&gt;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
</blockquote></div></div>

--000000000000ff17e005d2c5c308--

