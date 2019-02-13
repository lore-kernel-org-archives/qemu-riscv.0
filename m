Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtk5c-00020q-D3
	for mharc-qemu-riscv@gnu.org; Tue, 12 Feb 2019 21:15:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40083)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtk5Z-00020c-H2
	for qemu-riscv@nongnu.org; Tue, 12 Feb 2019 21:15:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtk5X-0000ZG-0e
	for qemu-riscv@nongnu.org; Tue, 12 Feb 2019 21:15:53 -0500
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:37206)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtk5T-0000Re-Fk
	for qemu-riscv@nongnu.org; Tue, 12 Feb 2019 21:15:49 -0500
Received: by mail-qk1-x741.google.com with SMTP id m9so487387qkl.4
	for <qemu-riscv@nongnu.org>; Tue, 12 Feb 2019 18:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VLwlVz8CievMATCzrthi2Zg6B8fb9ASgan2YKFAgWto=;
	b=LtVf5dSGEMS6nXNo/ZcGIjZsvcyvsJBlCGDqINKZHasn5i3IUmdyP2xGjMmz9sgkXn
	PLrOBUJd26fCjkeQNsJN2j9LoIfQirOMti7iUpnQ9BEb/qTho9zCMTQNiMFFk/3HJ8Ck
	vqHJzw64G3tlJ+uRnM7hvhnUIAwxfrVA3EOrNHLgpUARVUHuxGFNZ6Y3oQeezPoZxN02
	3Gmvh2V4wMm3Dl6PdjFA1krqWncn3DsB1Ptf5H0zoouZJKoUFKAObQ0BiLyKf3rZdK1r
	QkwUFbDvLg4Lc2L2NESp3C7pob0lDxqsuwK9ErffuJJahrM/PhsEznrrIURl8+Ke5o6z
	+GhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VLwlVz8CievMATCzrthi2Zg6B8fb9ASgan2YKFAgWto=;
	b=lHKFbTW1eHrxud9aWXZr7zTPNWRqjckakhl3pxzTOTj8mZi3vEuR+u+mIXMXWRTVJw
	u7W59K5+TI1xyZ41oSkyOMmUdMYjWnXVK5xhNyMJINsSXvDSpHwOrxwS1uiLEbcpgCUO
	1gZe+PcOurCKFwWVu0ByU8XlhdzLpfAHJj/oqKcKaraeIutDVq/QXb/88OcPW92KAQ6B
	C5yLzvVVPuYs5FpbJYI6yNWzNZc1Cws+NILoQiaYsCgAh+l2uao3OFGm05bj9RRjjTn1
	7HKbaivuk3KKp/ezoP1Zs69PCZ9EZodNWzhZWnNlfqrxGyk0gQ3sJE65pbNqne9AQz5I
	wLVA==
X-Gm-Message-State: AHQUAua1kCMzuWrfrKl9wHBwuvw8O9UrLQhr4dtccLLcRnxDon8nAQEe
	Cv33unll9DPeAYRM5xQReAwM+tJTfW4=
X-Google-Smtp-Source: AHgI3IYUO+CxfFxhXK+Xe8w9lq/V4sV0LFM1QdKhKpTdI8ptLT+G5UnBy7Jy5qNTwN8OVIPREXIMlw==
X-Received: by 2002:a37:af04:: with SMTP id y4mr4713229qke.271.1550024139565; 
	Tue, 12 Feb 2019 18:15:39 -0800 (PST)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com.
	[209.85.222.175]) by smtp.gmail.com with ESMTPSA id
	e35sm16796927qte.8.2019.02.12.18.15.38 for <qemu-riscv@nongnu.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Feb 2019 18:15:38 -0800 (PST)
Received: by mail-qk1-f175.google.com with SMTP id w204so494230qka.2
	for <qemu-riscv@nongnu.org>; Tue, 12 Feb 2019 18:15:38 -0800 (PST)
X-Received: by 2002:a37:330c:: with SMTP id z12mr5017584qkz.136.1550024138001; 
	Tue, 12 Feb 2019 18:15:38 -0800 (PST)
MIME-Version: 1.0
References: <20190123092538.8004-1-kbastian@mail.uni-paderborn.de>
	<mhng-0fc7cd00-deda-4e41-abb3-c78657c4f0f1@palmer-si-x1c4>
In-Reply-To: <mhng-0fc7cd00-deda-4e41-abb3-c78657c4f0f1@palmer-si-x1c4>
From: Palmer Dabbelt <palmer@sifive.com>
Date: Tue, 12 Feb 2019 18:15:26 -0800
X-Gmail-Original-Message-ID: <CANs6eMkMKGKVdnWh2CmEz1sOtXEZh6eMUN5NkCwGjna7zEhh9Q@mail.gmail.com>
Message-ID: <CANs6eMkMKGKVdnWh2CmEz1sOtXEZh6eMUN5NkCwGjna7zEhh9Q@mail.gmail.com>
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-riscv@nongnu.org, 
	peer.adelt@hni.uni-paderborn.de, richard.henderson@linaro.org, 
	qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000023a37a0581bd1e34"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::741
Subject: Re: [Qemu-riscv] [PATCH v6 00/35] target/riscv: Convert to
 decodetree
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Feb 2019 02:15:55 -0000

--00000000000023a37a0581bd1e34
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 12, 2019 at 3:21 PM Palmer Dabbelt <palmer@sifive.com> wrote:

> On Wed, 23 Jan 2019 01:25:03 PST (-0800), Bastian Koppelmann wrote:
> > Hi,
> >
> > this patchset converts the RISC-V decoder to decodetree in four major
> steps:
> >
> > 1) Convert 32-bit instructions to decodetree [Patch 1-16]:
> >     Many of the gen_* functions are called by the decode functions for
> 16-bit
> >     and 32-bit functions. If we move translation code from the gen_*
> >     functions to the generated trans_* functions of decode-tree, we get
> a lot of
> >     duplication. Therefore, we mostly generate calls to the old gen_*
> function
> >     which are properly replaced after step 2).
> >
> >     Each of the trans_ functions are grouped into files corresponding to
> their
> >     ISA extension, e.g. addi which is in RV32I is translated in the file
> >     'trans_rvi.inc.c'.
> >
> > 2) Convert 16-bit instructions to decodetree [Patch 17-19]:
> >     All 16 bit instructions have a direct mapping to a 32 bit
> instruction. Thus,
> >     we convert the arguments in the 16 bit trans_ function to the
> arguments of
> >     the corresponding 32 bit instruction and call the 32 bit trans_
> function.
> >
> > 3) Remove old manual decoding in gen_* function [Patch 20-30]:
> >     this move all manual translation code into the trans_* instructions
> of
> >     decode tree, such that we can remove the old decode_* functions.
> >
> > 4) Simplify RVC by reusing as much as possible from the RVG decoder as
> suggested
> >    by Richard. [Patch 31-35]
> >
> > full tree available at
> > https://github.com/bkoppelmann/qemu/tree/riscv-dt-v6
> >
> > Cheers,
> > Bastian
> >
> > v5 -> v6:
> >     - fixed funky indentation
> >
> >
> > Bastian Koppelmann (35):
> >   target/riscv: Move CPURISCVState pointer to DisasContext
> >   target/riscv: Activate decodetree and implemnt LUI & AUIPC
> >   target/riscv: Convert RVXI branch insns to decodetree
> >   target/riscv: Convert RV32I load/store insns to decodetree
> >   target/riscv: Convert RV64I load/store insns to decodetree
> >   target/riscv: Convert RVXI arithmetic insns to decodetree
> >   target/riscv: Convert RVXI fence insns to decodetree
> >   target/riscv: Convert RVXI csr insns to decodetree
> >   target/riscv: Convert RVXM insns to decodetree
> >   target/riscv: Convert RV32A insns to decodetree
> >   target/riscv: Convert RV64A insns to decodetree
> >   target/riscv: Convert RV32F insns to decodetree
> >   target/riscv: Convert RV64F insns to decodetree
> >   target/riscv: Convert RV32D insns to decodetree
> >   target/riscv: Convert RV64D insns to decodetree
> >   target/riscv: Convert RV priv insns to decodetree
> >   target/riscv: Convert quadrant 0 of RVXC insns to decodetree
> >   target/riscv: Convert quadrant 1 of RVXC insns to decodetree
> >   target/riscv: Convert quadrant 2 of RVXC insns to decodetree
> >   target/riscv: Remove gen_jalr()
> >   target/riscv: Remove manual decoding from gen_branch()
> >   target/riscv: Remove manual decoding from gen_load()
> >   target/riscv: Remove manual decoding from gen_store()
> >   target/riscv: Move gen_arith_imm() decoding into trans_* functions
> >   target/riscv: make ADD/SUB/OR/XOR/AND insn use arg lists
> >   target/riscv: Remove shift and slt insn manual decoding
> >   target/riscv: Remove manual decoding of RV32/64M insn
> >   target/riscv: Rename trans_arith to gen_arith
> >   target/riscv: Remove gen_system()
> >   target/riscv: Remove decode_RV32_64G()
> >   target/riscv: Convert @cs_2 insns to share translation functions
> >   target/riscv: Convert @cl_d, @cl_w, @cs_d, @cs_w insns
> >   target/riscv: Splice fsw_sd and flw_ld for riscv32 vs riscv64
> >   target/riscv: Splice remaining compressed insn pairs for riscv32 vs
> >     riscv64
> >   target/riscv: Remaining rvc insn reuse 32 bit translators
> >
> >  target/riscv/Makefile.objs                    |   22 +
> >  target/riscv/insn16-32.decode                 |   31 +
> >  target/riscv/insn16-64.decode                 |   33 +
> >  target/riscv/insn16.decode                    |  114 ++
> >  target/riscv/insn32-64.decode                 |   72 +
> >  target/riscv/insn32.decode                    |  203 ++
> >  .../riscv/insn_trans/trans_privileged.inc.c   |  110 +
> >  target/riscv/insn_trans/trans_rva.inc.c       |  207 ++
> >  target/riscv/insn_trans/trans_rvc.inc.c       |  149 ++
> >  target/riscv/insn_trans/trans_rvd.inc.c       |  388 ++++
> >  target/riscv/insn_trans/trans_rvf.inc.c       |  388 ++++
> >  target/riscv/insn_trans/trans_rvi.inc.c       |  568 ++++++
> >  target/riscv/insn_trans/trans_rvm.inc.c       |  107 +
> >  target/riscv/translate.c                      | 1781 ++---------------
> >  14 files changed, 2611 insertions(+), 1562 deletions(-)
> >  create mode 100644 target/riscv/insn16-32.decode
> >  create mode 100644 target/riscv/insn16-64.decode
> >  create mode 100644 target/riscv/insn16.decode
> >  create mode 100644 target/riscv/insn32-64.decode
> >  create mode 100644 target/riscv/insn32.decode
> >  create mode 100644 target/riscv/insn_trans/trans_privileged.inc.c
> >  create mode 100644 target/riscv/insn_trans/trans_rva.inc.c
> >  create mode 100644 target/riscv/insn_trans/trans_rvc.inc.c
> >  create mode 100644 target/riscv/insn_trans/trans_rvd.inc.c
> >  create mode 100644 target/riscv/insn_trans/trans_rvf.inc.c
> >  create mode 100644 target/riscv/insn_trans/trans_rvi.inc.c
> >  create mode 100644 target/riscv/insn_trans/trans_rvm.inc.c
>
> Do you, by any chance, have a v7?  It looks like there's quite a few merge
> conflicts here, and while I'm OK fixing them I don't want to do it if you
> already have.
>

I made it through my rebase, so unless you want to send out a v7 I will.
There were some meaningful changes so I'd like to get a round of review
just so everyone is on the same page.

--00000000000023a37a0581bd1e34
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Feb 12, 2019 at 3:21 PM Palmer Da=
bbelt &lt;<a href=3D"mailto:palmer@sifive.com">palmer@sifive.com</a>&gt; wr=
ote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On Wed, 23 Jan 2019 01:25:03 PST (-0800), Bastian Koppelman=
n wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; this patchset converts the RISC-V decoder to decodetree in four major =
steps:<br>
&gt;<br>
&gt; 1) Convert 32-bit instructions to decodetree [Patch 1-16]:<br>
&gt;=C2=A0 =C2=A0 =C2=A0Many of the gen_* functions are called by the decod=
e functions for 16-bit<br>
&gt;=C2=A0 =C2=A0 =C2=A0and 32-bit functions. If we move translation code f=
rom the gen_*<br>
&gt;=C2=A0 =C2=A0 =C2=A0functions to the generated trans_* functions of dec=
ode-tree, we get a lot of<br>
&gt;=C2=A0 =C2=A0 =C2=A0duplication. Therefore, we mostly generate calls to=
 the old gen_* function<br>
&gt;=C2=A0 =C2=A0 =C2=A0which are properly replaced after step 2).<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Each of the trans_ functions are grouped into files=
 corresponding to their<br>
&gt;=C2=A0 =C2=A0 =C2=A0ISA extension, e.g. addi which is in RV32I is trans=
lated in the file<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;trans_rvi.inc.c&#39;.<br>
&gt;<br>
&gt; 2) Convert 16-bit instructions to decodetree [Patch 17-19]:<br>
&gt;=C2=A0 =C2=A0 =C2=A0All 16 bit instructions have a direct mapping to a =
32 bit instruction. Thus,<br>
&gt;=C2=A0 =C2=A0 =C2=A0we convert the arguments in the 16 bit trans_ funct=
ion to the arguments of<br>
&gt;=C2=A0 =C2=A0 =C2=A0the corresponding 32 bit instruction and call the 3=
2 bit trans_ function.<br>
&gt;<br>
&gt; 3) Remove old manual decoding in gen_* function [Patch 20-30]:<br>
&gt;=C2=A0 =C2=A0 =C2=A0this move all manual translation code into the tran=
s_* instructions of<br>
&gt;=C2=A0 =C2=A0 =C2=A0decode tree, such that we can remove the old decode=
_* functions.<br>
&gt;<br>
&gt; 4) Simplify RVC by reusing as much as possible from the RVG decoder as=
 suggested<br>
&gt;=C2=A0 =C2=A0 by Richard. [Patch 31-35]<br>
&gt;<br>
&gt; full tree available at<br>
&gt; <a href=3D"https://github.com/bkoppelmann/qemu/tree/riscv-dt-v6" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/bkoppelmann/qemu/tree/=
riscv-dt-v6</a><br>
&gt;<br>
&gt; Cheers,<br>
&gt; Bastian<br>
&gt;<br>
&gt; v5 -&gt; v6:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- fixed funky indentation<br>
&gt;<br>
&gt;<br>
&gt; Bastian Koppelmann (35):<br>
&gt;=C2=A0 =C2=A0target/riscv: Move CPURISCVState pointer to DisasContext<b=
r>
&gt;=C2=A0 =C2=A0target/riscv: Activate decodetree and implemnt LUI &amp; A=
UIPC<br>
&gt;=C2=A0 =C2=A0target/riscv: Convert RVXI branch insns to decodetree<br>
&gt;=C2=A0 =C2=A0target/riscv: Convert RV32I load/store insns to decodetree=
<br>
&gt;=C2=A0 =C2=A0target/riscv: Convert RV64I load/store insns to decodetree=
<br>
&gt;=C2=A0 =C2=A0target/riscv: Convert RVXI arithmetic insns to decodetree<=
br>
&gt;=C2=A0 =C2=A0target/riscv: Convert RVXI fence insns to decodetree<br>
&gt;=C2=A0 =C2=A0target/riscv: Convert RVXI csr insns to decodetree<br>
&gt;=C2=A0 =C2=A0target/riscv: Convert RVXM insns to decodetree<br>
&gt;=C2=A0 =C2=A0target/riscv: Convert RV32A insns to decodetree<br>
&gt;=C2=A0 =C2=A0target/riscv: Convert RV64A insns to decodetree<br>
&gt;=C2=A0 =C2=A0target/riscv: Convert RV32F insns to decodetree<br>
&gt;=C2=A0 =C2=A0target/riscv: Convert RV64F insns to decodetree<br>
&gt;=C2=A0 =C2=A0target/riscv: Convert RV32D insns to decodetree<br>
&gt;=C2=A0 =C2=A0target/riscv: Convert RV64D insns to decodetree<br>
&gt;=C2=A0 =C2=A0target/riscv: Convert RV priv insns to decodetree<br>
&gt;=C2=A0 =C2=A0target/riscv: Convert quadrant 0 of RVXC insns to decodetr=
ee<br>
&gt;=C2=A0 =C2=A0target/riscv: Convert quadrant 1 of RVXC insns to decodetr=
ee<br>
&gt;=C2=A0 =C2=A0target/riscv: Convert quadrant 2 of RVXC insns to decodetr=
ee<br>
&gt;=C2=A0 =C2=A0target/riscv: Remove gen_jalr()<br>
&gt;=C2=A0 =C2=A0target/riscv: Remove manual decoding from gen_branch()<br>
&gt;=C2=A0 =C2=A0target/riscv: Remove manual decoding from gen_load()<br>
&gt;=C2=A0 =C2=A0target/riscv: Remove manual decoding from gen_store()<br>
&gt;=C2=A0 =C2=A0target/riscv: Move gen_arith_imm() decoding into trans_* f=
unctions<br>
&gt;=C2=A0 =C2=A0target/riscv: make ADD/SUB/OR/XOR/AND insn use arg lists<b=
r>
&gt;=C2=A0 =C2=A0target/riscv: Remove shift and slt insn manual decoding<br=
>
&gt;=C2=A0 =C2=A0target/riscv: Remove manual decoding of RV32/64M insn<br>
&gt;=C2=A0 =C2=A0target/riscv: Rename trans_arith to gen_arith<br>
&gt;=C2=A0 =C2=A0target/riscv: Remove gen_system()<br>
&gt;=C2=A0 =C2=A0target/riscv: Remove decode_RV32_64G()<br>
&gt;=C2=A0 =C2=A0target/riscv: Convert @cs_2 insns to share translation fun=
ctions<br>
&gt;=C2=A0 =C2=A0target/riscv: Convert @cl_d, @cl_w, @cs_d, @cs_w insns<br>
&gt;=C2=A0 =C2=A0target/riscv: Splice fsw_sd and flw_ld for riscv32 vs risc=
v64<br>
&gt;=C2=A0 =C2=A0target/riscv: Splice remaining compressed insn pairs for r=
iscv32 vs<br>
&gt;=C2=A0 =C2=A0 =C2=A0riscv64<br>
&gt;=C2=A0 =C2=A0target/riscv: Remaining rvc insn reuse 32 bit translators<=
br>
&gt;<br>
&gt;=C2=A0 target/riscv/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A022 +<br>
&gt;=C2=A0 target/riscv/insn16-32.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A031 +<br>
&gt;=C2=A0 target/riscv/insn16-64.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A033 +<br>
&gt;=C2=A0 target/riscv/insn16.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 114 ++<br>
&gt;=C2=A0 target/riscv/insn32-64.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A072 +<br>
&gt;=C2=A0 target/riscv/insn32.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 203 ++<br>
&gt;=C2=A0 .../riscv/insn_trans/trans_privileged.inc.c=C2=A0 =C2=A0|=C2=A0 =
110 +<br>
&gt;=C2=A0 target/riscv/insn_trans/trans_rva.inc.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 207 ++<br>
&gt;=C2=A0 target/riscv/insn_trans/trans_rvc.inc.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 149 ++<br>
&gt;=C2=A0 target/riscv/insn_trans/trans_rvd.inc.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 388 ++++<br>
&gt;=C2=A0 target/riscv/insn_trans/trans_rvf.inc.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 388 ++++<br>
&gt;=C2=A0 target/riscv/insn_trans/trans_rvi.inc.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 568 ++++++<br>
&gt;=C2=A0 target/riscv/insn_trans/trans_rvm.inc.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 107 +<br>
&gt;=C2=A0 target/riscv/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1781 ++---------------<br>
&gt;=C2=A0 14 files changed, 2611 insertions(+), 1562 deletions(-)<br>
&gt;=C2=A0 create mode 100644 target/riscv/insn16-32.decode<br>
&gt;=C2=A0 create mode 100644 target/riscv/insn16-64.decode<br>
&gt;=C2=A0 create mode 100644 target/riscv/insn16.decode<br>
&gt;=C2=A0 create mode 100644 target/riscv/insn32-64.decode<br>
&gt;=C2=A0 create mode 100644 target/riscv/insn32.decode<br>
&gt;=C2=A0 create mode 100644 target/riscv/insn_trans/trans_privileged.inc.=
c<br>
&gt;=C2=A0 create mode 100644 target/riscv/insn_trans/trans_rva.inc.c<br>
&gt;=C2=A0 create mode 100644 target/riscv/insn_trans/trans_rvc.inc.c<br>
&gt;=C2=A0 create mode 100644 target/riscv/insn_trans/trans_rvd.inc.c<br>
&gt;=C2=A0 create mode 100644 target/riscv/insn_trans/trans_rvf.inc.c<br>
&gt;=C2=A0 create mode 100644 target/riscv/insn_trans/trans_rvi.inc.c<br>
&gt;=C2=A0 create mode 100644 target/riscv/insn_trans/trans_rvm.inc.c<br>
<br>
Do you, by any chance, have a v7?=C2=A0 It looks like there&#39;s quite a f=
ew merge <br>
conflicts here, and while I&#39;m OK fixing them I don&#39;t want to do it =
if you <br>
already have.<br></blockquote><div><br></div><div>I made it through my reba=
se, so unless you want to send out a v7 I will.=C2=A0 There were some meani=
ngful changes so I&#39;d like to get a round of review just so everyone is =
on the same page.=C2=A0</div></div></div>

--00000000000023a37a0581bd1e34--

