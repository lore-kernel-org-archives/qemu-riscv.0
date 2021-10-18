Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcLqA-0001hq-KN
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 02:09:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mcLq8-0001gk-LH
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 02:09:40 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:33316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mcLq5-0006Re-CG
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 02:09:40 -0400
Received: by mail-io1-xd31.google.com with SMTP id n7so14978133iod.0
 for <qemu-riscv@nongnu.org>; Sun, 17 Oct 2021 23:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oY1zmJUGMV+k6zW8u/A583+W7qjgsIGSgC3SOGdNGlU=;
 b=nH3iHYCyY98Vp/draVeJmn1Ea9PiqW9WzwidJdWwAvZfPz79bviN7LUx1mct2dqR1s
 NnI1ncGp1SwqxDnENsP+yqTJwdoweiVxP8U0mhSIqHyXQiaP1871mQTCK7h2SXoKEtLl
 2ZsfuhVqQWUhA+pSp4wrRS6Y8YsS87E7C6ygl6WZQSWaOBcuNG8tdHpetgLqoJXwJMHA
 4WMoIKsStuOhukRRnB7eCIuK4pO1ggwdkGHWM9Se4QNiuSITcEkpU84rS4KxlaRm1Jqb
 jrzCd3B5df/qKYy/pK7jk66E1+Qdp5FyCTC5yJjaBSQicBlxT11b3aMJXEs1w0SIsGho
 UT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oY1zmJUGMV+k6zW8u/A583+W7qjgsIGSgC3SOGdNGlU=;
 b=zhXQ6tnobzqs1r4MyqUWTlzHi7o6QSn00lH2lRAQSRGn9mnoRUePZChpq+d0KclFzU
 MP/eKBjkroOztCS/bk+iSfBhyKoIyuvkJmsZF1GtZOiYeCY5j5PnvuRA3OckUu/psl2n
 VsdKGgbePqtiEe/LB1a07RI9JElYClikH5VjFPM4h+UjhaSOg5MJvqhYP9D2ESvaKVOt
 bq54YRwm3sMBFY+rwtg1YtoQ54rFH2wpQFJYu4wiM8y6S2UCSltK2J/fyJVmY8moBDoX
 NpOXaqhZq/hXubteJRVYP8e+gWK9L/GMpy+3My6zhNZBPulK81t8MaWEX1c3VMUdNv/+
 P73Q==
X-Gm-Message-State: AOAM533M9x079VNiB0NWkiXDVW9atDagNJESnxnAqnZEb2pKgkIP6PC4
 0lJ2zoxEiQK8YpKQBiGIpMvCBEDeFKFgrDV5TpV/sXo4sRE=
X-Google-Smtp-Source: ABdhPJwTCqYmWNvYnEnfYzUcX4a3Po4wQ2Bgmp2M5ES6X3ACnEw78Cd6vGJJZyR5q+n2PRWJ4LO6uJclanPe845SvlQ=
X-Received: by 2002:a5d:9256:: with SMTP id e22mr13010686iol.152.1634537375898; 
 Sun, 17 Oct 2021 23:09:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211015074627.3957162-1-frank.chang@sifive.com>
 <CAKmqyKMf3QUi9HGK4rx6fJBh6_YvpPYDpf-u5pgrx6VE58ORWw@mail.gmail.com>
In-Reply-To: <CAKmqyKMf3QUi9HGK4rx6fJBh6_YvpPYDpf-u5pgrx6VE58ORWw@mail.gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Mon, 18 Oct 2021 14:09:24 +0800
Message-ID: <CAE_xrPgpgNT2nAsiOsV+z+VT4tRRGK6qs0mqRA13agU=TnJkHg@mail.gmail.com>
Subject: Re: [PATCH v8 00/78] support vector extension v1.0
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000a9b7e705ce9a63b2"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=frank.chang@sifive.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
X-List-Received-Date: Mon, 18 Oct 2021 06:09:40 -0000

--000000000000a9b7e705ce9a63b2
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 18, 2021 at 2:00 PM Alistair Francis <alistair23@gmail.com>
wrote:

> On Fri, Oct 15, 2021 at 5:48 PM <frank.chang@sifive.com> wrote:
> >
> > From: Frank Chang <frank.chang@sifive.com>
> >
> > This patchset implements the vector extension v1.0 for RISC-V on QEMU.
> >
> > RVV v1.0 spec is now fronzen for public review:
> > https://github.com/riscv/riscv-v-spec/releases/tag/v1.0
> >
> > The port is available here:
> > https://github.com/sifive/qemu/tree/rvv-1.0-upstream-v8
> >
> > RVV v1.0 can be enabled with -cpu option: v=true and specify vext_spec
> > option to v1.0 (i.e. vext_spec=v1.0)
>
> It doesn't seem like this series made it to the general QEMU list. You
> might want to check to see what happened there.
>
>
Hi Alistair, what does "general QEMU list" mean here?

Regards,
Frank Chang

Alistair
>
> >
> > Note: This patchset depends on other patchsets listed in Based-on
> >       section below so it is not able to be built unless those patchsets
> >       are applied.
> >
> > Changelog:
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
> > Based-on: <20211015065500.3850513-1-frank.chang@sifive.com>
> > Based-on: <20211015070307.3860984-1-frank.chang@sifive.com>
> >
> > Frank Chang (73):
> >   target/riscv: fix TB_FLAGS bits overlapping bug for rvv/rvh
> >   target/riscv: drop vector 0.7.1 and add 1.0 support
> >   target/riscv: Use FIELD_EX32() to extract wd field
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
> >   target/riscv: rvv-1.0: set mstatus.SD bit when writing vector CSRs
> >   target/riscv: rvv-1.0: floating-point reciprocal square-root estimate
> >     instruction
> >   target/riscv: rvv-1.0: floating-point reciprocal estimate instruction
> >   target/riscv: set mstatus.SD bit when writing fp CSRs
> >   target/riscv: rvv-1.0: rename r2_zimm to r2_zimm11
> >   target/riscv: rvv-1.0: add vsetivli instruction
> >   target/riscv: rvv-1.0: add evl parameter to vext_ldst_us()
> >   target/riscv: rvv-1.0: add vector unit-stride mask load/store insns
> >   target/riscv: rvv-1.0: rename vmandnot.mm and vmornot.mm to vmandn.mm
> >     and vmorn.mm
> >   target/riscv: rvv-1.0: update opivv_vadc_check() comment
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
> >  target/riscv/cpu.c                      |   12 +-
> >  target/riscv/cpu.h                      |   85 +-
> >  target/riscv/cpu_bits.h                 |   10 +
> >  target/riscv/cpu_helper.c               |   15 +-
> >  target/riscv/csr.c                      |   92 +-
> >  target/riscv/fpu_helper.c               |   17 +-
> >  target/riscv/gdbstub.c                  |  184 ++
> >  target/riscv/helper.h                   |  435 ++-
> >  target/riscv/insn32.decode              |  294 +-
> >  target/riscv/insn_trans/trans_rvv.c.inc | 2423 +++++++++------
> >  target/riscv/internals.h                |   24 +-
> >  target/riscv/translate.c                |   74 +-
> >  target/riscv/vector_helper.c            | 3601 ++++++++++++-----------
> >  13 files changed, 4176 insertions(+), 3090 deletions(-)
> >
> > --
> > 2.25.1
> >
> >
>

--000000000000a9b7e705ce9a63b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Oct 18, 2021 at 2:00 PM Alistair =
Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a=
>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Fri, Oct 15, 2021 at 5:48 PM &lt;<a href=3D"mail=
to:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a>&gt;=
 wrote:<br>
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
&gt; <a href=3D"https://github.com/sifive/qemu/tree/rvv-1.0-upstream-v8" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/sifive/qemu/tree/rvv-=
1.0-upstream-v8</a><br>
&gt;<br>
&gt; RVV v1.0 can be enabled with -cpu option: v=3Dtrue and specify vext_sp=
ec<br>
&gt; option to v1.0 (i.e. vext_spec=3Dv1.0)<br>
<br>
It doesn&#39;t seem like this series made it to the general QEMU list. You<=
br>
might want to check to see what happened there.<br>
<br></blockquote><div><br></div><div>Hi Alistair, what does &quot;general Q=
EMU list&quot; mean here?</div><div><br></div><div>Regards,</div><div>Frank=
 Chang</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
Alistair<br>
<br>
&gt;<br>
&gt; Note: This patchset depends on other patchsets listed in Based-on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0section below so it is not able to be built =
unless those patchsets<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0are applied.<br>
&gt;<br>
&gt; Changelog:<br>
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
&gt; Based-on: &lt;<a href=3D"mailto:20211015065500.3850513-1-frank.chang@s=
ifive.com" target=3D"_blank">20211015065500.3850513-1-frank.chang@sifive.co=
m</a>&gt;<br>
&gt; Based-on: &lt;<a href=3D"mailto:20211015070307.3860984-1-frank.chang@s=
ifive.com" target=3D"_blank">20211015070307.3860984-1-frank.chang@sifive.co=
m</a>&gt;<br>
&gt;<br>
&gt; Frank Chang (73):<br>
&gt;=C2=A0 =C2=A0target/riscv: fix TB_FLAGS bits overlapping bug for rvv/rv=
h<br>
&gt;=C2=A0 =C2=A0target/riscv: drop vector 0.7.1 and add 1.0 support<br>
&gt;=C2=A0 =C2=A0target/riscv: Use FIELD_EX32() to extract wd field<br>
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
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: set mstatus.SD bit when writing vec=
tor CSRs<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: floating-point reciprocal square-ro=
ot estimate<br>
&gt;=C2=A0 =C2=A0 =C2=A0instruction<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: floating-point reciprocal estimate =
instruction<br>
&gt;=C2=A0 =C2=A0target/riscv: set mstatus.SD bit when writing fp CSRs<br>
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
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A012 +-<br>
&gt;=C2=A0 target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A085 +-<br>
&gt;=C2=A0 target/riscv/cpu_bits.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A010 +<br>
&gt;=C2=A0 target/riscv/cpu_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A015 +-<br>
&gt;=C2=A0 target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A092 +-<br>
&gt;=C2=A0 target/riscv/fpu_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A017 +-<br>
&gt;=C2=A0 target/riscv/gdbstub.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 184 ++<br>
&gt;=C2=A0 target/riscv/helper.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 435 ++-<br>
&gt;=C2=A0 target/riscv/insn32.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 294 +-<br>
&gt;=C2=A0 target/riscv/insn_trans/trans_rvv.c.inc | 2423 +++++++++------<b=
r>
&gt;=C2=A0 target/riscv/internals.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A024 +-<br>
&gt;=C2=A0 target/riscv/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A074 +-<br>
&gt;=C2=A0 target/riscv/vector_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 3601 ++++++++++++-----------<br>
&gt;=C2=A0 13 files changed, 4176 insertions(+), 3090 deletions(-)<br>
&gt;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
</blockquote></div></div>

--000000000000a9b7e705ce9a63b2--

