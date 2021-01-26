Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l4Hcw-00073i-FJ
	for mharc-qemu-riscv@gnu.org; Tue, 26 Jan 2021 01:14:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1l4Hcu-00072L-7A
 for qemu-riscv@nongnu.org; Tue, 26 Jan 2021 01:14:56 -0500
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31]:38589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1l4Hcr-0006Kx-4e
 for qemu-riscv@nongnu.org; Tue, 26 Jan 2021 01:14:55 -0500
Received: by mail-oo1-xc31.google.com with SMTP id y72so3358991ooa.5
 for <qemu-riscv@nongnu.org>; Mon, 25 Jan 2021 22:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kUtqY5416HDw2loPh4/VqOgZ8sZempoLbyV3FhkmhQc=;
 b=kGtm0v+zAGJ46a0JPXzW8C1jS8wYkJ7nZzX3bNeB/qj0JsU4F+nMQDnMeX6cUBKg1f
 syv9OO0bPnOGnsySkaTC6QlhMx/hMYZp71qTwoxJdYVf/biwJm+dQao5ZOcvI25wteAN
 xg+hjODc4PcQ+w3cArxZEX+AmtHaudvK+btfjavgovyGxYpiax/6VtpQk4z8weQOOx/f
 15jp77FemGZiJMFCoynnllY+eOlQebxx75fOc4Z2PdOFN0PKcvpOsIh94pMmI4J4yF3o
 pbsLFS0ELr8yQfuvgs+t4SY3rKDiTI1tO6LQLx/VbX3bvoGUyrtNKvb3HTfARSQbxazZ
 Q+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kUtqY5416HDw2loPh4/VqOgZ8sZempoLbyV3FhkmhQc=;
 b=EfS+cxmB2dmmI1pvbft2ONRCeMHcO95wuqsl6ZUidxYNzcaktAJgiTdnrabaovCZP+
 wiCUcvlXlufbYZfSnj8mfcxm8Ybq0E0gGOj73AW9SORrN1u6nb9/69lZTMBUAG/2pHjp
 eyJeWOpGwnZzInpIzwEFvpHD7DwXU9D5H8z63/TIXLPccC/fr1DLPl7MQsIRQJNgcdeg
 hbtkmavNBBUTRotkOPThnlizqYlHX8CBe2IZMwQU8GizQz4AKqK2+JtOWq2mz/HnxTZf
 XeC3h78Mm1UlBiTQAcnT6f/DWeePQpj/FPhxfDw/W2rI8pueFcovqQ+4qMCYtK11lujV
 d8mg==
X-Gm-Message-State: AOAM532NUP/vABtG8stsAFqRX1Uk8cQqoXs1ieE2CWM+II7Xsxdhvcw4
 fZBgXTNqolF9gHNkRrgOXvqMYtzFvHFeAK3mq2FhBA==
X-Google-Smtp-Source: ABdhPJxaavTd1RDX0FBWtzYoPSSnR8mXCW/j+2uB8VvBvSJOLTQS/q257Lfo+fulyRaZ1aIpDpGv+nL98kDOa6SVOIY=
X-Received: by 2002:a4a:decb:: with SMTP id w11mr2884273oou.32.1611641691212; 
 Mon, 25 Jan 2021 22:14:51 -0800 (PST)
MIME-Version: 1.0
References: <20210112093950.17530-1-frank.chang@sifive.com>
 <CAKmqyKMZ9CyAV1d5tA0Ww=NOFGYkKMu_EiDJEBs80=Q3mZQD0w@mail.gmail.com>
In-Reply-To: <CAKmqyKMZ9CyAV1d5tA0Ww=NOFGYkKMu_EiDJEBs80=Q3mZQD0w@mail.gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Tue, 26 Jan 2021 14:14:39 +0800
Message-ID: <CAE_xrPgZXfekLTWKJ2+h9_K0HxqpBxT3yti+2BOWD3dwKDf6xA@mail.gmail.com>
Subject: Re: [PATCH v6 00/72] support vector extension v1.0
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000082ac9805b9c792b6"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=frank.chang@sifive.com; helo=mail-oo1-xc31.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL=1.623, URI_HEX=0.1 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 26 Jan 2021 06:14:56 -0000

--00000000000082ac9805b9c792b6
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 20, 2021 at 3:12 AM Alistair Francis <alistair23@gmail.com>
wrote:

> On Tue, Jan 12, 2021 at 1:40 AM <frank.chang@sifive.com> wrote:
> >
> > From: Frank Chang <frank.chang@sifive.com>
> >
> > This patchset implements the vector extension v1.0 for RISC-V on QEMU.
> >
> > As vector extension specification is near to be ratified, this patchset
> is
> > sent as formal patchset for review.
>
> Do you know when the 1.0 spec will be released?
>

I'm afraid I can't tell the exact date of when 1.0 spec.will be released.
As far as I know, although the community is trying to push 1.0 spec. to be
ratified,
but they are also still adding some new instructions on the fly, e.g.
*vle1.v*/*sel.v* and *vsetivli*.
Hope they can complete it soon.....


> >
> > The port is available here:
> > https://github.com/sifive/qemu/tree/rvv-1.0-upstream-v6
> >
> > You can change the cpu argument: vext_spec to v1.0 (i.e. vext_spec=v1.0)
> > to run with RVV v1.0 instructions.
> >
> > Note: This patchset depends on another patchset listed in Based-on
> >       section below so it might not able to be built unless the patchset
> >           is applied.
>
> Has this been merged?
>

Yes, this one is not merged yet and the latest patchset is:
<1597908641-6293-1-git-send-email-chihmin.chao@sifive.com>
<https://patchew.org/QEMU/1597908641-6293-1-git-send-email-chihmin.chao@sifive.com/>
I've asked Chih-Min about the status of this patchset.
He said he will rebase the codes and send out a new patchset to review.

Thanks,
Frank Chang


>
> Alistair
>
> >
> > Changelog:
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
> > Based-on: <1596102747-20226-1-git-send-email-chihmin.chao@sifive.com/>
> >
> > Frank Chang (66):
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
> >   target/riscv: rvv-1.0: configure instructions
> >   target/riscv: rvv-1.0: stride load and store instructions
> >   target/riscv: rvv-1.0: index load and store instructions
> >   target/riscv: rvv-1.0: fix address index overflow bug of indexed
> >     load/store insns
> >   target/riscv: rvv-1.0: fault-only-first unit stride load
> >   target/riscv: rvv-1.0: amo operations
> >   target/riscv: rvv-1.0: load/store whole register instructions
> >   target/riscv: rvv-1.0: update vext_max_elems() for load/store insns
> >   target/riscv: rvv-1.0: take fractional LMUL into vector max elements
> >     calculation
> >   target/riscv: rvv-1.0: floating-point square-root instruction
> >   target/riscv: rvv-1.0: floating-point classify instructions
> >   target/riscv: rvv-1.0: mask population count instruction
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
> >
> > Greentime Hu (1):
> >   target/riscv: rvv-1.0: add vlenb register
> >
> > Hsiangkai Wang (2):
> >   target/riscv: gdb: modify gdb csr xml file to align with csr register
> >     map
> >   target/riscv: gdb: support vector registers for rv64 & rv32
> >
> > LIU Zhiwei (3):
> >   target/riscv: rvv-1.0: add mstatus VS field
> >   target/riscv: rvv-1.0: add sstatus VS field
> >   target/riscv: rvv-1.0: add vcsr register
> >
> >  gdb-xml/riscv-32bit-csr.xml             |   18 +-
> >  gdb-xml/riscv-64bit-csr.xml             |   18 +-
> >  target/riscv/cpu.c                      |   11 +-
> >  target/riscv/cpu.h                      |   98 +-
> >  target/riscv/cpu_bits.h                 |   10 +
> >  target/riscv/cpu_helper.c               |   15 +-
> >  target/riscv/csr.c                      |   85 +-
> >  target/riscv/fpu_helper.c               |   17 +-
> >  target/riscv/gdbstub.c                  |  177 +-
> >  target/riscv/helper.h                   |  503 ++-
> >  target/riscv/insn32-64.decode           |   18 +-
> >  target/riscv/insn32.decode              |  290 +-
> >  target/riscv/insn_trans/trans_rvv.c.inc | 2475 ++++++++++-----
> >  target/riscv/internals.h                |   24 +-
> >  target/riscv/translate.c                |   72 +-
> >  target/riscv/vector_helper.c            | 3690 ++++++++++++-----------
> >  16 files changed, 4531 insertions(+), 2990 deletions(-)
> >
> > --
> > 2.17.1
> >
> >
>

--00000000000082ac9805b9c792b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Jan 20, 2021 at 3:12 AM Alistair =
Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a=
>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Tue, Jan 12, 2021 at 1:40 AM &lt;<a href=3D"mail=
to:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a>&gt;=
 wrote:<br>
&gt;<br>
&gt; From: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com" target=
=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt;<br>
&gt; This patchset implements the vector extension v1.0 for RISC-V on QEMU.=
<br>
&gt;<br>
&gt; As vector extension specification is near to be ratified, this patchse=
t is<br>
&gt; sent as formal patchset for review.<br>
<br>
Do you know when the 1.0 spec will be released?<br></blockquote><div><br></=
div><div>I&#39;m afraid I can&#39;t tell the exact date of when 1.0 spec.wi=
ll be released.</div><div>As far as I know, although the community is tryin=
g to push 1.0 spec. to be ratified,</div><div>but they are also still addin=
g some new instructions on the fly, e.g. <i>vle1.v</i>/<i>sel.v</i> and <i>=
vsetivli</i>.</div><div>Hope they can complete it soon.....</div><div><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; The port is available here:<br>
&gt; <a href=3D"https://github.com/sifive/qemu/tree/rvv-1.0-upstream-v6" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/sifive/qemu/tree/rvv-=
1.0-upstream-v6</a><br>
&gt;<br>
&gt; You can change the cpu argument: vext_spec to v1.0 (i.e. vext_spec=3Dv=
1.0)<br>
&gt; to run with RVV v1.0 instructions.<br>
&gt;<br>
&gt; Note: This patchset depends on another patchset listed in Based-on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0section below so it might not able to be bui=
lt unless the patchset<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0is applied.<br>
<br>
Has this been merged?<br></blockquote><div><br></div><div>Yes, this one is =
not merged yet and the latest patchset is:</div><div><a href=3D"https://pat=
chew.org/QEMU/1597908641-6293-1-git-send-email-chihmin.chao@sifive.com/">&l=
t;1597908641-6293-1-git-send-email-chihmin.chao@sifive.com&gt;</a></div><di=
v>I&#39;ve asked Chih-Min about the status of this patchset.</div><div>He s=
aid he will rebase the codes and send out a new patchset to review.</div><d=
iv><br></div><div>Thanks,</div><div>Frank Chang</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
Alistair<br>
<br>
&gt;<br>
&gt; Changelog:<br>
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
&gt; Based-on: &lt;<a href=3D"http://1596102747-20226-1-git-send-email-chih=
min.chao@sifive.com/" rel=3D"noreferrer" target=3D"_blank">1596102747-20226=
-1-git-send-email-chihmin.chao@sifive.com/</a>&gt;<br>
&gt;<br>
&gt; Frank Chang (66):<br>
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
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: amo operations<br>
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
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: mask population count instruction<b=
r>
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
&gt;<br>
&gt; Greentime Hu (1):<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: add vlenb register<br>
&gt;<br>
&gt; Hsiangkai Wang (2):<br>
&gt;=C2=A0 =C2=A0target/riscv: gdb: modify gdb csr xml file to align with c=
sr register<br>
&gt;=C2=A0 =C2=A0 =C2=A0map<br>
&gt;=C2=A0 =C2=A0target/riscv: gdb: support vector registers for rv64 &amp;=
 rv32<br>
&gt;<br>
&gt; LIU Zhiwei (3):<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: add mstatus VS field<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: add sstatus VS field<br>
&gt;=C2=A0 =C2=A0target/riscv: rvv-1.0: add vcsr register<br>
&gt;<br>
&gt;=C2=A0 gdb-xml/riscv-32bit-csr.xml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A018 +-<br>
&gt;=C2=A0 gdb-xml/riscv-64bit-csr.xml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A018 +-<br>
&gt;=C2=A0 target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A011 +-<br>
&gt;=C2=A0 target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A098 +-<br>
&gt;=C2=A0 target/riscv/cpu_bits.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A010 +<br>
&gt;=C2=A0 target/riscv/cpu_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A015 +-<br>
&gt;=C2=A0 target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A085 +-<br>
&gt;=C2=A0 target/riscv/fpu_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A017 +-<br>
&gt;=C2=A0 target/riscv/gdbstub.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 177 +-<br>
&gt;=C2=A0 target/riscv/helper.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 503 ++-<br>
&gt;=C2=A0 target/riscv/insn32-64.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A018 +-<br>
&gt;=C2=A0 target/riscv/insn32.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 290 +-<br>
&gt;=C2=A0 target/riscv/insn_trans/trans_rvv.c.inc | 2475 ++++++++++-----<b=
r>
&gt;=C2=A0 target/riscv/internals.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A024 +-<br>
&gt;=C2=A0 target/riscv/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A072 +-<br>
&gt;=C2=A0 target/riscv/vector_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 3690 ++++++++++++-----------<br>
&gt;=C2=A0 16 files changed, 4531 insertions(+), 2990 deletions(-)<br>
&gt;<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt;<br>
</blockquote></div></div>

--00000000000082ac9805b9c792b6--

