Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kcJ6M-0005Eh-MD
	for mharc-qemu-riscv@gnu.org; Mon, 09 Nov 2020 21:09:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kcJ6K-0005DU-GJ
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2020 21:09:41 -0500
Received: from mail-oo1-xc43.google.com ([2607:f8b0:4864:20::c43]:46886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kcJ6G-00058w-T3
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2020 21:09:40 -0500
Received: by mail-oo1-xc43.google.com with SMTP id c25so2726431ooe.13
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2020 18:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=F0qboTfVfaq/K5RrQV9ipKoGzFoIdqr+xSluElfaDes=;
 b=JZweGDxtParg+un/dC4DawWywa8evOxdvc0XlQHf1vENy5XDkmAANIn+bWzcxPiyhN
 ILlUbjHMt4A3TrnZsmv5DUMz2h7oUaj9orZ7NTdl/6RYCnfyDkoLBklLk9DCQbtnRlff
 YR3dZC7nWky0gBGGh8Hre2L68B4jc7F9bNRqsDaBHmG2RvPZxgbR3XpYfvnNQPJ8Z7Di
 qWXRZ8g05slYlAz3bhubunDFRSF7fylJ5o1wfTLRA8gu2XJld4eSwvFS7Zupah/cvZK3
 zOLB/a6q6fJHduAt5OllYIdCcbKJzSCkBdqIUDbnMdYCWcSXUl+vq922ag4ZBxYBuDwM
 FZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=F0qboTfVfaq/K5RrQV9ipKoGzFoIdqr+xSluElfaDes=;
 b=A627gYPAnSwodvgzO6QFI1Cu86befM3raJnepW70t/9N/B6WQnXbNjkiivFxlUSzMe
 +/KNUBUb+nlbPf/Bg+2Rel/KtuNFwoLWmvRJ8DA5yuNVbajee9v0gYsFsjRaHLzX/8Gp
 Q8Zeudsy4MJZ4i+Sn/DLNdtFb11K4lybpo+1nM53HSdwed0T+ZSRUL7TDUWJj5r2sAhP
 8apBKDcrwk6qew93N4SZdWh/yzO602jRcQASU5P/cZZhEHdoLzznT8rksydJJ3OZyEvO
 205rIdx7zhserIgLdb9aE1+D8uxvYXhJY2/d/xfMCfM0FTSI4NVSq1ZVkYo/Fsu/2vJ6
 DORA==
X-Gm-Message-State: AOAM530lZU+lB42cgXyW8wWoBbfcw+hOWNIpyBwiqU/6tU2ukxq/IItM
 4E/mIzWbmPZXZaohQdMYBvp+12oajhMVXSZI7NwgBA==
X-Google-Smtp-Source: ABdhPJyzCf7nX2v3TqZ3XIVz5Hd7DmLPQtSq2AD79juNiSwNAsfG1nvKgvjK78+MK0bN+AAZxf38nGwPY5m0C3WY154=
X-Received: by 2002:a4a:8c4f:: with SMTP id v15mr12314880ooj.52.1604974175334; 
 Mon, 09 Nov 2020 18:09:35 -0800 (PST)
MIME-Version: 1.0
References: <20200929190448.31116-1-frank.chang@sifive.com>
 <CAE_xrPgMu=o5ArbRW1t-YFnZMDo0zGmwvPARB-HtpXHiLqvawQ@mail.gmail.com>
In-Reply-To: <CAE_xrPgMu=o5ArbRW1t-YFnZMDo0zGmwvPARB-HtpXHiLqvawQ@mail.gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Tue, 10 Nov 2020 10:09:24 +0800
Message-ID: <CAE_xrPjOSpsgPBALLmPjJDN1F+6SfDE_fZgkkASivV7X32dSTA@mail.gmail.com>
Subject: Re: [RFC v5 00/68] support vector extension v1.0
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000098501905b3b72b6d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c43;
 envelope-from=frank.chang@sifive.com; helo=mail-oo1-xc43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URI_HEX=0.1 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 10 Nov 2020 02:09:41 -0000

--00000000000098501905b3b72b6d
Content-Type: text/plain; charset="UTF-8"

ping 2nd~

On Tue, Oct 20, 2020 at 3:42 PM Frank Chang <frank.chang@sifive.com> wrote:

> On Wed, Sep 30, 2020 at 3:04 AM <frank.chang@sifive.com> wrote:
>
>> From: Frank Chang <frank.chang@sifive.com>
>>
>> This patchset implements the vector extension v1.0 for RISC-V on QEMU.
>>
>> This patchset is sent as RFC because RVV v1.0 is still in draft state.
>> v2 patchset was sent for RVV v0.9 and bumped to RVV v1.0 since v3
>> patchset.
>>
>> The port is available here:
>> https://github.com/sifive/qemu/tree/rvv-1.0-upstream-v5
>>
>> You can change the cpu argument: vext_spec to v1.0 (i.e. vext_spec=v1.0)
>> to run with RVV v1.0 instructions.
>>
>> Note: This patchset depends on two other patchsets listed in Based-on
>>       section below so it might not able to be built unless those two
>>       patchsets are applied.
>>
>> Changelog:
>>
>> v5
>>   * refactor RVV v1.0 check functions.
>>     (Thanks to Richard Henderson's bitwise tricks.)
>>   * relax RV_VLEN_MAX to 1024-bits.
>>   * implement vstart CSR's behaviors.
>>   * trigger illegal instruction exception if frm is not valid for
>>     vector floating-point instructions.
>>   * rebase on riscv-to-apply.next.
>>
>> v4
>>   * remove explicit float flmul variable in DisasContext.
>>   * replace floating-point calculations with shift operations to
>>     improve performance.
>>   * relax RV_VLEN_MAX to 512-bits.
>>
>> v3
>>   * apply nan-box helpers from Richard Henderson.
>>   * remove fp16 api changes as they are sent independently in another
>>     pathcset by Chih-Min Chao.
>>   * remove all tail elements clear functions as tail elements can
>>     retain unchanged for either VTA set to undisturbed or agnostic.
>>   * add fp16 nan-box check generator function.
>>   * add floating-point rounding mode enum.
>>   * replace flmul arithmetic with shifts to avoid floating-point
>>     conversions.
>>   * add Zvqmac extension.
>>   * replace gdbstub vector register xml files with dynamic generator.
>>   * bumped to RVV v1.0.
>>   * RVV v1.0 related changes:
>>     * add vl<nf>re<eew>.v and vs<nf>r.v vector whole register
>>       load/store instructions
>>     * add vrgatherei16 instruction.
>>     * rearranged bits in vtype to make vlmul bits into a contiguous
>>       field.
>>
>> v2
>>   * drop v0.7.1 support.
>>   * replace invisible return check macros with functions.
>>   * move mark_vs_dirty() to translators.
>>   * add SSTATUS_VS flag for s-mode.
>>   * nan-box scalar fp register for floating-point operations.
>>   * add gdbstub files for vector registers to allow system-mode
>>     debugging with GDB.
>>
>> Based-on: <20200909001647.532249-1-richard.henderson@linaro.org/>
>> Based-on: <1596102747-20226-1-git-send-email-chihmin.chao@sifive.com/>
>>
>> Frank Chang (62):
>>   target/riscv: drop vector 0.7.1 and add 1.0 support
>>   target/riscv: Use FIELD_EX32() to extract wd field
>>   target/riscv: rvv-1.0: introduce writable misa.v field
>>   target/riscv: rvv-1.0: add translation-time vector context status
>>   target/riscv: rvv-1.0: remove rvv related codes from fcsr registers
>>   target/riscv: rvv-1.0: check MSTATUS_VS when accessing vector csr
>>     registers
>>   target/riscv: rvv-1.0: remove MLEN calculations
>>   target/riscv: rvv-1.0: add fractional LMUL
>>   target/riscv: rvv-1.0: add VMA and VTA
>>   target/riscv: rvv-1.0: update check functions
>>   target/riscv: introduce more imm value modes in translator functions
>>   target/riscv: rvv:1.0: add translation-time nan-box helper function
>>   target/riscv: rvv-1.0: configure instructions
>>   target/riscv: rvv-1.0: stride load and store instructions
>>   target/riscv: rvv-1.0: index load and store instructions
>>   target/riscv: rvv-1.0: fix address index overflow bug of indexed
>>     load/store insns
>>   target/riscv: rvv-1.0: fault-only-first unit stride load
>>   target/riscv: rvv-1.0: amo operations
>>   target/riscv: rvv-1.0: load/store whole register instructions
>>   target/riscv: rvv-1.0: update vext_max_elems() for load/store insns
>>   target/riscv: rvv-1.0: take fractional LMUL into vector max elements
>>     calculation
>>   target/riscv: rvv-1.0: floating-point square-root instruction
>>   target/riscv: rvv-1.0: floating-point classify instructions
>>   target/riscv: rvv-1.0: mask population count instruction
>>   target/riscv: rvv-1.0: find-first-set mask bit instruction
>>   target/riscv: rvv-1.0: set-X-first mask bit instructions
>>   target/riscv: rvv-1.0: iota instruction
>>   target/riscv: rvv-1.0: element index instruction
>>   target/riscv: rvv-1.0: allow load element with sign-extended
>>   target/riscv: rvv-1.0: register gather instructions
>>   target/riscv: rvv-1.0: integer scalar move instructions
>>   target/riscv: rvv-1.0: floating-point move instruction
>>   target/riscv: rvv-1.0: floating-point scalar move instructions
>>   target/riscv: rvv-1.0: whole register move instructions
>>   target/riscv: rvv-1.0: integer extension instructions
>>   target/riscv: rvv-1.0: single-width averaging add and subtract
>>     instructions
>>   target/riscv: rvv-1.0: single-width bit shift instructions
>>   target/riscv: rvv-1.0: integer add-with-carry/subtract-with-borrow
>>   target/riscv: rvv-1.0: narrowing integer right shift instructions
>>   target/riscv: rvv-1.0: widening integer multiply-add instructions
>>   target/riscv: rvv-1.0: single-width saturating add and subtract
>>     instructions
>>   target/riscv: rvv-1.0: integer comparison instructions
>>   target/riscv: rvv-1.0: floating-point compare instructions
>>   target/riscv: rvv-1.0: mask-register logical instructions
>>   target/riscv: rvv-1.0: slide instructions
>>   target/riscv: rvv-1.0: floating-point slide instructions
>>   target/riscv: rvv-1.0: narrowing fixed-point clip instructions
>>   target/riscv: rvv-1.0: single-width floating-point reduction
>>   target/riscv: rvv-1.0: widening floating-point reduction instructions
>>   target/riscv: rvv-1.0: single-width scaling shift instructions
>>   target/riscv: rvv-1.0: remove widening saturating scaled multiply-add
>>   target/riscv: rvv-1.0: remove vmford.vv and vmford.vf
>>   target/riscv: rvv-1.0: remove integer extract instruction
>>   target/riscv: rvv-1.0: floating-point min/max instructions
>>   target/riscv: introduce floating-point rounding mode enum
>>   target/riscv: rvv-1.0: floating-point/integer type-convert
>>     instructions
>>   target/riscv: rvv-1.0: widening floating-point/integer type-convert
>>   target/riscv: add "set round to odd" rounding mode helper function
>>   target/riscv: rvv-1.0: narrowing floating-point/integer type-convert
>>   target/riscv: rvv-1.0: relax RV_VLEN_MAX to 1024-bits
>>   target/riscv: implement vstart CSR
>>   target/riscv: trigger illegal instruction exception if frm is not
>>     valid
>>
>> Greentime Hu (1):
>>   target/riscv: rvv-1.0: add vlenb register
>>
>> Hsiangkai Wang (2):
>>   target/riscv: gdb: modify gdb csr xml file to align with csr register
>>     map
>>   target/riscv: gdb: support vector registers for rv64 & rv32
>>
>> LIU Zhiwei (3):
>>   target/riscv: rvv-1.0: add mstatus VS field
>>   target/riscv: rvv-1.0: add sstatus VS field
>>   target/riscv: rvv-1.0: add vcsr register
>>
>>  gdb-xml/riscv-32bit-csr.xml             |   18 +-
>>  gdb-xml/riscv-64bit-csr.xml             |   18 +-
>>  target/riscv/cpu.c                      |   11 +-
>>  target/riscv/cpu.h                      |   95 +-
>>  target/riscv/cpu_bits.h                 |   10 +
>>  target/riscv/cpu_helper.c               |   16 +-
>>  target/riscv/csr.c                      |   79 +-
>>  target/riscv/fpu_helper.c               |   17 +-
>>  target/riscv/gdbstub.c                  |  172 +-
>>  target/riscv/helper.h                   |  495 ++--
>>  target/riscv/insn32-64.decode           |   18 +-
>>  target/riscv/insn32.decode              |  288 +-
>>  target/riscv/insn_trans/trans_rvv.c.inc | 2430 +++++++++++------
>>  target/riscv/internals.h                |   22 +-
>>  target/riscv/translate.c                |   72 +-
>>  target/riscv/vector_helper.c            | 3316 +++++++++++------------
>>  16 files changed, 4118 insertions(+), 2959 deletions(-)
>>
>> --
>> 2.17.1
>>
>>
> ping~
>

--00000000000098501905b3b72b6d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping 2nd~</div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Tue, Oct 20, 2020 at 3:42 PM Frank Chang &lt;<=
a href=3D"mailto:frank.chang@sifive.com">frank.chang@sifive.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"=
ltr"><div dir=3D"ltr">On Wed, Sep 30, 2020 at 3:04 AM &lt;<a href=3D"mailto=
:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a>&gt; w=
rote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">From: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive=
.com" target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
<br>
This patchset implements the vector extension v1.0 for RISC-V on QEMU.<br>
<br>
This patchset is sent as RFC because RVV v1.0 is still in draft state.<br>
v2 patchset was sent for RVV v0.9 and bumped to RVV v1.0 since v3 patchset.=
<br>
<br>
The port is available here:<br>
<a href=3D"https://github.com/sifive/qemu/tree/rvv-1.0-upstream-v5" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/sifive/qemu/tree/rvv-1.0-u=
pstream-v5</a><br>
<br>
You can change the cpu argument: vext_spec to v1.0 (i.e. vext_spec=3Dv1.0)<=
br>
to run with RVV v1.0 instructions.<br>
<br>
Note: This patchset depends on two other patchsets listed in Based-on<br>
=C2=A0 =C2=A0 =C2=A0 section below so it might not able to be built unless =
those two<br>
=C2=A0 =C2=A0 =C2=A0 patchsets are applied.<br>
<br>
Changelog:<br>
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
Based-on: &lt;<a href=3D"http://20200909001647.532249-1-richard.henderson@l=
inaro.org/" rel=3D"noreferrer" target=3D"_blank">20200909001647.532249-1-ri=
chard.henderson@linaro.org/</a>&gt;<br>
Based-on: &lt;<a href=3D"http://1596102747-20226-1-git-send-email-chihmin.c=
hao@sifive.com/" rel=3D"noreferrer" target=3D"_blank">1596102747-20226-1-gi=
t-send-email-chihmin.chao@sifive.com/</a>&gt;<br>
<br>
Frank Chang (62):<br>
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
=C2=A0 target/riscv: rvv-1.0: configure instructions<br>
=C2=A0 target/riscv: rvv-1.0: stride load and store instructions<br>
=C2=A0 target/riscv: rvv-1.0: index load and store instructions<br>
=C2=A0 target/riscv: rvv-1.0: fix address index overflow bug of indexed<br>
=C2=A0 =C2=A0 load/store insns<br>
=C2=A0 target/riscv: rvv-1.0: fault-only-first unit stride load<br>
=C2=A0 target/riscv: rvv-1.0: amo operations<br>
=C2=A0 target/riscv: rvv-1.0: load/store whole register instructions<br>
=C2=A0 target/riscv: rvv-1.0: update vext_max_elems() for load/store insns<=
br>
=C2=A0 target/riscv: rvv-1.0: take fractional LMUL into vector max elements=
<br>
=C2=A0 =C2=A0 calculation<br>
=C2=A0 target/riscv: rvv-1.0: floating-point square-root instruction<br>
=C2=A0 target/riscv: rvv-1.0: floating-point classify instructions<br>
=C2=A0 target/riscv: rvv-1.0: mask population count instruction<br>
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
=C2=A0 target/riscv: implement vstart CSR<br>
=C2=A0 target/riscv: trigger illegal instruction exception if frm is not<br=
>
=C2=A0 =C2=A0 valid<br>
<br>
Greentime Hu (1):<br>
=C2=A0 target/riscv: rvv-1.0: add vlenb register<br>
<br>
Hsiangkai Wang (2):<br>
=C2=A0 target/riscv: gdb: modify gdb csr xml file to align with csr registe=
r<br>
=C2=A0 =C2=A0 map<br>
=C2=A0 target/riscv: gdb: support vector registers for rv64 &amp; rv32<br>
<br>
LIU Zhiwei (3):<br>
=C2=A0 target/riscv: rvv-1.0: add mstatus VS field<br>
=C2=A0 target/riscv: rvv-1.0: add sstatus VS field<br>
=C2=A0 target/riscv: rvv-1.0: add vcsr register<br>
<br>
=C2=A0gdb-xml/riscv-32bit-csr.xml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A018 +-<br>
=C2=A0gdb-xml/riscv-64bit-csr.xml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A018 +-<br>
=C2=A0target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A011 +-<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A095 +-<br>
=C2=A0target/riscv/cpu_bits.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A010 +<br>
=C2=A0target/riscv/cpu_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A016 +-<br>
=C2=A0target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A079 +-<br>
=C2=A0target/riscv/fpu_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A017 +-<br>
=C2=A0target/riscv/gdbstub.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 172 +-<br>
=C2=A0target/riscv/helper.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 495 ++--<br>
=C2=A0target/riscv/insn32-64.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A018 +-<br>
=C2=A0target/riscv/insn32.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 288 +-<br>
=C2=A0target/riscv/insn_trans/trans_rvv.c.inc | 2430 +++++++++++------<br>
=C2=A0target/riscv/internals.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A022 +-<br>
=C2=A0target/riscv/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A072 +-<br>
=C2=A0target/riscv/vector_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 3316 +++++++++++------------<br>
=C2=A016 files changed, 4118 insertions(+), 2959 deletions(-)<br>
<br>
--<br>
2.17.1<br>
<br></blockquote><div><br></div><div>ping~=C2=A0</div></div></div>
</blockquote></div>

--00000000000098501905b3b72b6d--

