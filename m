Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lBkr4-0007fk-8K
	for mharc-qemu-riscv@gnu.org; Mon, 15 Feb 2021 15:52:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1lBkqz-0007er-64; Mon, 15 Feb 2021 15:52:22 -0500
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:41758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1lBkqv-0001ET-PX; Mon, 15 Feb 2021 15:52:20 -0500
Received: by mail-lf1-x12a.google.com with SMTP id d24so12561091lfs.8;
 Mon, 15 Feb 2021 12:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=REzYk8mt8LPYoROmKkHdnq0I+RdbVFqEzaLOu2U4cIA=;
 b=gqOXwUU6ExZI+m86V3zoly7a7y1+YjUgElsBWAKSNFQZe0LKzxqqjiJFA8dv49x0ns
 m5lcJ59KHauIe2wzN3aDaUdhFPb4EMZglfsrEmrTt22iu565yW7zcaW0GpFzGIGp7ndk
 hK/MZFoFf4B6QDA+rfDwfk09yyWBF0xA3z/Xd/OfdOMQj8nutFvsZPnbGHJhHtahfwma
 VZKpKNRy+6o8PnvJgy3Ievu+eRTAZjtldOOj6wgPLEnxLw4AO8vLtWHjPwIAfmCBADqn
 BXR3AvvRbkW26f/ygJV9VqTkY5hGpFfeidue3sG3ancjEtZnZWbNSD0LcZwevgWeZ/uR
 kGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=REzYk8mt8LPYoROmKkHdnq0I+RdbVFqEzaLOu2U4cIA=;
 b=AgY2SligDeUa13KrNjSyC4fSKIr2VV6iaQzgiEOSXGY/Dz+hnMOQBG+jYwQYBaVCgb
 YDpAgo8VAf5yp8CxBoqJBOwXTxDkR79H0cd/TwJ2Ui5k8deW0dD1YWibajg3qDR8cwYX
 +kRQUvA0YBUFxquhlkQ7h4K5degrKoV195q7jCC2U7BJOmck1Xy4JUYzfRNQkh1EvWe/
 FfGKxnVR63aSKiNfKR36yBQ/8Rf54YKKIxBgQttBAfrxSSoWh429fVGdxWDVbym55X8e
 cJ+xAUIoiS4NeT8kxahQ7nXE92jzvJk7YJmlWvodYufpVQFqwEz3SbxDI0JthbTSZ3yU
 SOXQ==
X-Gm-Message-State: AOAM533y1sOYU1qTWk3UmniT2z9Gm7DCkijQgrtrQwtjvuWAuXJ1lZTv
 puaEzQxOXYvkNdPccBSx1coI6LfVmWqWQWUnU90=
X-Google-Smtp-Source: ABdhPJzZuHbGd8MA5C+erAROXbipy0e1rFGJNLBIst+7uNZT4AN1WJX1PQk9TocnHWngFQH+ZPIC3vmH34ug7HSDEfk=
X-Received: by 2002:ac2:5605:: with SMTP id v5mr2845050lfd.655.1613422335332; 
 Mon, 15 Feb 2021 12:52:15 -0800 (PST)
MIME-Version: 1.0
References: <20210110185109.29841-1-space.monkey.delivers@gmail.com>
 <CAKmqyKP7tig8Lh=qktUnM+HMhZK0__qTgRXDeCayiZ-S0fyGTA@mail.gmail.com>
In-Reply-To: <CAKmqyKP7tig8Lh=qktUnM+HMhZK0__qTgRXDeCayiZ-S0fyGTA@mail.gmail.com>
From: Alexey Baturo <baturo.alexey@gmail.com>
Date: Mon, 15 Feb 2021 23:52:04 +0300
Message-ID: <CAFukJ-DcspptvOzcqHEdXsdXZbu4uSVrOgwjVbc41BpMOtq=+Q@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] RISC-V Pointer Masking implementation
To: Alistair Francis <alistair23@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
 "space.monkey.delivers@gmail.com" <space.monkey.delivers@gmail.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Dave Smith <kupokupokupopo@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: multipart/alternative; boundary="0000000000002b95b705bb662966"
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=baturo.alexey@gmail.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 15 Feb 2021 20:52:23 -0000

--0000000000002b95b705bb662966
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alistair,

Sorry for the late reply.

>Do you know the current state of the spec?
As far as I can tell, the spec for PointerMasking is quite frozen: it has
not been updated for quite some time, but some of the clarifications have
not been included in the actual spec.
I'll ask the J workgroup if they could do draft release v0.1, while I'll
address the fixed you proposed in this patch series.
Meanwhile could you please tell, if it's ok to push several series of
patches to claim the support of i.e. v0.1 or it's mandatory to push all the
patches at once?

Thanks!

=D1=81=D1=80, 3 =D1=84=D0=B5=D0=B2=D1=80. 2021 =D0=B3. =D0=B2 22:22, Alista=
ir Francis <alistair23@gmail.com>:

> On Sun, Jan 10, 2021 at 10:54 AM Alexey Baturo <baturo.alexey@gmail.com>
> wrote:
> >
> > Hi folks,
> >
> > Sorry it took me almost 3 month to provide the reply and fixes: it was =
a
> really busy EOY.
> > This series contains fixed @Alistair suggestion on enabling J-ext.
> >
> > As for @Richard comments:
> > - Indeed I've missed appending review-by to the approved commits. Now
> I've restored them except for the fourth commit. @Richard could you pleas=
e
> tell if you think it's still ok to commit it as is, or should I support
> masking mem ops for RVV first?
> > - These patches don't have any support for load/store masking for RVV
> and RVH extensions, so no support for special load/store for Hypervisor i=
n
> particular.
> >
> > If this patch series would be accepted, I think my further attention
> would be to:
> > - Support pm for memory operations for RVV
> > - Add proper csr and support pm for memory operations for Hypervisor mo=
de
> > - Support address wrapping on unaligned accesses as @Richard mentioned
> previously
>
> Overall this looks fine.
>
> Unfortunately it doesn't look like there is a release of the pointer
> masking spec. Until there is a release (a draft release counts) we
> can't accept it. We need a version to point to so that we can say "we
> support v0.1 of the RISC-V pointer masking spec". Otherwise we are
> chasing a moving target and users don't know what version we do/don't
> support.
>
> Do you know the current state of the spec?
>
> Alistair
>
> >
> > Thanks!
> >
> > Alexey Baturo (5):
> >   [RISCV_PM] Add J-extension into RISC-V
> >   [RISCV_PM] Support CSRs required for RISC-V PM extension except for
> >     the ones required for hypervisor mode
> >   [RISCV_PM] Print new PM CSRs in QEMU logs
> >   [RISCV_PM] Support pointer masking for RISC-V for i/c/f/d/a types of
> >     instructions
> >   [RISCV_PM] Allow experimental J-ext to be turned on
> >
> > Anatoly Parshintsev (1):
> >   [RISCV_PM] Implement address masking functions required for RISC-V
> >     Pointer Masking extension
> >
> >  target/riscv/cpu.c                      |  30 +++
> >  target/riscv/cpu.h                      |  33 +++
> >  target/riscv/cpu_bits.h                 |  66 ++++++
> >  target/riscv/csr.c                      | 271 ++++++++++++++++++++++++
> >  target/riscv/insn_trans/trans_rva.c.inc |   3 +
> >  target/riscv/insn_trans/trans_rvd.c.inc |   2 +
> >  target/riscv/insn_trans/trans_rvf.c.inc |   2 +
> >  target/riscv/insn_trans/trans_rvi.c.inc |   2 +
> >  target/riscv/translate.c                |  44 ++++
> >  9 files changed, 453 insertions(+)
> >
> > --
> > 2.20.1
> >
> >
>

--0000000000002b95b705bb662966
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Alistair,<div><br></div><div>Sorry for the late reply.<=
/div><div><br></div><div>&gt;Do you know the current state of the spec?</di=
v><div>As far as I can tell, the spec for PointerMasking is quite frozen: i=
t has not been updated for quite some time, but some of the clarifications =
have not been included in the actual spec.</div><div>I&#39;ll ask the J wor=
kgroup if they could do draft release v0.1, while I&#39;ll address the fixe=
d you proposed in this patch series.</div><div>Meanwhile could you please t=
ell, if it&#39;s ok to push several series of patches to claim the support =
of i.e. v0.1 or it&#39;s mandatory to push all the patches at once?</div><d=
iv><br></div><div>Thanks!</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">=D1=81=D1=80, 3 =D1=84=D0=B5=D0=B2=D1=80. 20=
21 =D0=B3. =D0=B2 22:22, Alistair Francis &lt;<a href=3D"mailto:alistair23@=
gmail.com">alistair23@gmail.com</a>&gt;:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Sun, Jan 10, 2021 at 10:54 AM Alexey Baturo &lt=
;<a href=3D"mailto:baturo.alexey@gmail.com" target=3D"_blank">baturo.alexey=
@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi folks,<br>
&gt;<br>
&gt; Sorry it took me almost 3 month to provide the reply and fixes: it was=
 a really busy EOY.<br>
&gt; This series contains fixed @Alistair suggestion on enabling J-ext.<br>
&gt;<br>
&gt; As for @Richard comments:<br>
&gt; - Indeed I&#39;ve missed appending review-by to the approved commits. =
Now I&#39;ve restored them except for the fourth commit. @Richard could you=
 please tell if you think it&#39;s still ok to commit it as is, or should I=
 support masking mem ops for RVV first?<br>
&gt; - These patches don&#39;t have any support for load/store masking for =
RVV and RVH extensions, so no support for special load/store for Hypervisor=
 in particular.<br>
&gt;<br>
&gt; If this patch series would be accepted, I think my further attention w=
ould be to:<br>
&gt; - Support pm for memory operations for RVV<br>
&gt; - Add proper csr and support pm for memory operations for Hypervisor m=
ode<br>
&gt; - Support address wrapping on unaligned accesses as @Richard mentioned=
 previously<br>
<br>
Overall this looks fine.<br>
<br>
Unfortunately it doesn&#39;t look like there is a release of the pointer<br=
>
masking spec. Until there is a release (a draft release counts) we<br>
can&#39;t accept it. We need a version to point to so that we can say &quot=
;we<br>
support v0.1 of the RISC-V pointer masking spec&quot;. Otherwise we are<br>
chasing a moving target and users don&#39;t know what version we do/don&#39=
;t<br>
support.<br>
<br>
Do you know the current state of the spec?<br>
<br>
Alistair<br>
<br>
&gt;<br>
&gt; Thanks!<br>
&gt;<br>
&gt; Alexey Baturo (5):<br>
&gt;=C2=A0 =C2=A0[RISCV_PM] Add J-extension into RISC-V<br>
&gt;=C2=A0 =C2=A0[RISCV_PM] Support CSRs required for RISC-V PM extension e=
xcept for<br>
&gt;=C2=A0 =C2=A0 =C2=A0the ones required for hypervisor mode<br>
&gt;=C2=A0 =C2=A0[RISCV_PM] Print new PM CSRs in QEMU logs<br>
&gt;=C2=A0 =C2=A0[RISCV_PM] Support pointer masking for RISC-V for i/c/f/d/=
a types of<br>
&gt;=C2=A0 =C2=A0 =C2=A0instructions<br>
&gt;=C2=A0 =C2=A0[RISCV_PM] Allow experimental J-ext to be turned on<br>
&gt;<br>
&gt; Anatoly Parshintsev (1):<br>
&gt;=C2=A0 =C2=A0[RISCV_PM] Implement address masking functions required fo=
r RISC-V<br>
&gt;=C2=A0 =C2=A0 =C2=A0Pointer Masking extension<br>
&gt;<br>
&gt;=C2=A0 target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 30 +++<br>
&gt;=C2=A0 target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 33 +++<br>
&gt;=C2=A0 target/riscv/cpu_bits.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 66 ++++++<br>
&gt;=C2=A0 target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 271 ++++++++++++++++++++++++<br>
&gt;=C2=A0 target/riscv/insn_trans/trans_rva.c.inc |=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 target/riscv/insn_trans/trans_rvd.c.inc |=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 target/riscv/insn_trans/trans_rvf.c.inc |=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 target/riscv/insn_trans/trans_rvi.c.inc |=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 target/riscv/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 44 ++++<br>
&gt;=C2=A0 9 files changed, 453 insertions(+)<br>
&gt;<br>
&gt; --<br>
&gt; 2.20.1<br>
&gt;<br>
&gt;<br>
</blockquote></div>

--0000000000002b95b705bb662966--

