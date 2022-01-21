Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nAkCu-0007u3-77
	for mharc-qemu-riscv@gnu.org; Thu, 20 Jan 2022 22:03:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nAkCs-0007tp-2p; Thu, 20 Jan 2022 22:03:18 -0500
Received: from [2607:f8b0:4864:20::131] (port=47087
 helo=mail-il1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nAkCp-0000c9-NM; Thu, 20 Jan 2022 22:03:17 -0500
Received: by mail-il1-x131.google.com with SMTP id e8so6592991ilm.13;
 Thu, 20 Jan 2022 19:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=W7GiRvlM+4WYAFu5ItPKhKpNB7nPEC+FfzMYyNIkeA4=;
 b=QMGu4eGj4ly4b3lk+XuyDmsFpNrNVEQlG2wvXe90GanAnhQK2F/KqaTjo0I2EASilM
 xjk+t5sJdNASvpsdps50UNd4ed7pLrF+pTiL/yYKJsT6T30noFITHLcX6Nbll5VrKQPS
 J8C4e0H2cqKHvh64lCyN3RmZUxeC8P9RsBqa2torHxnREb+wsfopgJZVjGCk9JSt/nXk
 dgg5VEC7GhbDDytn0TJf9G8pNtZ+PBpnxLQC2laOViLwuY37nyowWozbsSmfH/Hr1wxv
 UbX+YRaprX058PECVH4Xc4X6Wh2bcfRO+IHw7er3LLR0IPQmCxn3t3dPeiisC+vJ/SMj
 9gUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=W7GiRvlM+4WYAFu5ItPKhKpNB7nPEC+FfzMYyNIkeA4=;
 b=ihRq3ELzgnJL5EEiTIhdk6Uh3xuoCeiSnlKxsKAc1ykfTt9v/D7YiRQeKzcthoJXGQ
 9thcGTnimYWjvjmbXX4BfSZ/V3Tnp2elZoTQDPwAnMdQ7N8H2716rTFPRsfvj9o/U7hc
 +fFEqDu30aJzI6bsh3yKBEP2ScED1OKsOjwEuqvOZmzt7G/WJaT9GG49h+kxyaft+Q2X
 N1mCOFwcaEKmvlhf5jff7KMDtLZSJP1h+CrPtRXSNFfRIqc4wqllHpPCENgLTpryj2HC
 pRE/Yluymeu8a1irtUqfbIDUagr4AUMaDvYLQSCIKdVZHF/FGyjIi7/TfNsKQMseKltX
 5U/Q==
X-Gm-Message-State: AOAM531k52gskKxWForoQNDpXzT0SGXvTq2x6alCTYdJHuNIUeG2Xxpy
 bh6CEIet6yt6JBaKXlECR5PHWYDmpEKFUfbiOyo=
X-Google-Smtp-Source: ABdhPJzxFR6w6iAFzg2+e7hOrhAwIvtDScsqbinoNMQ2Ye2NCUgQ59tzntQ+0RoMj7kHWMLce8vCgwJPOk8SCua1PMo=
X-Received: by 2002:a05:6e02:6d1:: with SMTP id
 p17mr1032242ils.74.1642734194178; 
 Thu, 20 Jan 2022 19:03:14 -0800 (PST)
MIME-Version: 1.0
References: <20220113202033.3320854-1-philipp.tomsich@vrull.eu>
 <20220113202033.3320854-2-philipp.tomsich@vrull.eu>
 <CAKmqyKOzVi9MiXt+2ESEr28EQ7M6wEyTon+a=h4do9fy4KN=Pw@mail.gmail.com>
 <CAAeLtUBJ4sSZaDqe1Z_431LMDtuQ996OLoE6t_Zh6TLH+_gPHg@mail.gmail.com>
 <CAKmqyKPcYBDJqQ88BZ3TDwiGz6=M3kfB2Bc8YXcQJ=+G0Og4gQ@mail.gmail.com>
 <CAKmqyKMvEft2RxbxB92D7F=dZz0nuEJQYHFvVBnQJrt6d80x6A@mail.gmail.com>
 <CAAeLtUBTGGBdNwNNhJH+VO=Th4+ftz63ttgFvAo=G7m16Tz8CA@mail.gmail.com>
In-Reply-To: <CAAeLtUBTGGBdNwNNhJH+VO=Th4+ftz63ttgFvAo=G7m16Tz8CA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 21 Jan 2022 13:02:47 +1000
Message-ID: <CAKmqyKPdS-oQM20S4gFCxP5Fuf0TcqMmesiudwjnbB76J1UdVw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] target/riscv: Add XVentanaCondOps custom extension
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Greg Favor <gfavor@ventanamicro.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Kito Cheng <kito.cheng@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::131
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x131.google.com
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
X-List-Received-Date: Fri, 21 Jan 2022 03:03:18 -0000

On Fri, Jan 21, 2022 at 1:38 AM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> Thanks for taking the time to write this up!
>
> On Wed, 19 Jan 2022 at 02:30, Alistair Francis <alistair23@gmail.com> wro=
te:
> >
> > On Wed, Jan 19, 2022 at 11:19 AM Alistair Francis <alistair23@gmail.com=
> wrote:
> > >
> > > On Wed, Jan 19, 2022 at 9:22 AM Philipp Tomsich
> > > <philipp.tomsich@vrull.eu> wrote:
> > > >
> > > > Alistair,
> > > >
> > > > Some of us (the merit almost exclusively goes to Kito) have been
> > > > working towards a similar policy for GCC/binutils and LLVM.
> > > > This currently lives in:
> > > >    https://github.com/riscv-non-isa/riscv-toolchain-conventions/pul=
l/17
> > >
> > > Ah cool! We can use that as a good starting point.
> > >
> > > >
> > > > A few comments & a question below.
> > > >
> > > > Thanks,
> > > > Philipp.
> > > >
> > > > On Tue, 18 Jan 2022 at 23:53, Alistair Francis <alistair23@gmail.co=
m> wrote:
> > > > >
> > > > > On Fri, Jan 14, 2022 at 6:22 AM Philipp Tomsich
> > > > > <philipp.tomsich@vrull.eu> wrote:
> > > > > >
> > > > > > This adds the decoder and translation for the XVentanaCondOps c=
ustom
> > > > > > extension (vendor-defined by Ventana Micro Systems), which is
> > > > > > documented at https://github.com/ventanamicro/ventana-custom-ex=
tensions/releases/download/v1.0.0/ventana-custom-extensions-v1.0.0.pdf
> > > > > >
> > > > > > This commit then also adds a guard-function (has_XVentanaCondOp=
s_p)
> > > > > > and the decoder function to the table of decoders, enabling the
> > > > > > support for the XVentanaCondOps extension.
> > > > > >
> > > > > > Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> > > > >
> > > > > This looks reasonable to me.
> > > > >
> > > > > I'm going to leave this for a bit in case there are any more comm=
ents.
> > > > >
> > > > > I was a little worried that taking vendor extensions isn't the ri=
ght
> > > > > move, as we might get stuck with a large number of them. But this=
 is
> > > > > pretty self contained and I think with the growing RISC-V interes=
t
> > > > > it's something we will eventually need to support.
> > > > >
> > > > > I'm going to update the QEMU RISC-V wiki page with this to make t=
he
> > > > > position clear (comments very welcome)
> > > > >
> > > > > =3D=3D=3D RISC-V Extensions =3D=3D=3D
> > > > > As RISC-V has a range of possible extensions, QEMU has guidelines=
 for
> > > > > supporting them all.
> > > > >
> > > > > If an extension is frozen or ratified by the RISC-V foundation, i=
t can
> > > > > be supported in QEMU.
> > > > >
> > > > > If an official RISC-V foundation extension is in a reasonable dra=
ft
> > > > > state, that is not too many changes are still expected, it can be
> > > > > supported experimentally by QEMU. Experimental support means it m=
ust
> > > > > be disabled by default and marked with a "x-" in the properties. =
QEMU
> > > > > will only support the latest version of patches submitted for a d=
raft
> > > > > extension. A draft extension can also be removed at any time if i=
t
> > > > > conflicts with other extensions.
> > > > >
> > > > > QEMU will also support vendor extensions. Vendor extensions must =
be
> > > > > disabled by default, but can be enabled for specific vendor CPUs =
and
> > > > > boards. Vendor extensions must be maintained and tested by the ve=
ndor.
> > > >
> > > > I guess I should create a v3 with appropriate paths in the MAINTAIN=
ERS file?
> > >
> > > Hmm... Good point. I don't think you have to if you don't want to.
> > >
> > > My point here was more to just make it clear that upstream QEMU is no=
t
> > > a dumping ground for vendor extensions to get them maintained by
> > > someone else. Obviously we won't purposely break things just for fun.
> > > There is an expectation that the vendor tests their extensions and
> > > responds to bug reports and things like that.
> > >
> > > >
> > > > > Vendor extensions can not interfere with other extensions and can=
 not
> > > > > be obtrusive to the RISC-V target code.
> > > >
> > > > I know that there is some interest to have the XtheadV (the
> > > > instructions previously known as vectors 0.7.1-draft) supported and=
 we
> > > > have the reality of a deployed base that implements it in hardware.
> > > > This would conflict with the opcode space used by the standard RISC=
-V
> > > > vectors, so it makes for an interesting test case (even if just to
> > > > clarify our intent)...
> > > > Personally, I would like to avoid precluding inclusion of something
> > > > useful (of course, "Vendor extensions must be maintained and tested=
 by
> > > > the vendor." has to apply!), if a vendor was going to step up and a=
lso
> > > > offers to maintain it.
> > >
> > > Yeah... this is unfortunate. I agree that having the 0.7.1-draft
> > > extensions supported would be great. There is hardware that supports
> > > it.
> > >
> > > I think this point still stands though. IF the XtheadV implementation
> > > is self contained and doesn't interfere with the vector extensions,
> > > then that's great and we can support it. If instead it adds a large
> > > amount of conditionals to the released vector extension code then I
> > > don't think we can take it.
> > >
> > > There is some wiggle room, but the RISC-V tree already has enough
> > > going on and very little reviewers. If in the future we get more
> > > reviewers and testers we can re-evaulate what is acceptable, but for
> > > now I think we need to be a little strict. (Hint to any companies to
> > > give developers time to review)
> > >
> > > >
> > > > So let's assume such a (very significant) addition were factored ou=
t
> > > > similarly, interfacing just through a hook in decode_op and
> > > > argument-parsing logic that ensures that the conflicting
> > > > standard-extension is turned off: would this still be acceptable un=
der
> > > > this policy =E2=80=94 or would it trip the "obtrusive" condition?
> > >
> > > I think that would be acceptable, I wouldn't say that is obtrusive as
> > > it's self contained.
> >
> > Ok, take two:
> >
> > =3D=3D=3D RISC-V Foundation Extensions =3D=3D=3D
> > As RISC-V has a range of possible extensions, QEMU has guidelines for
> > supporting them all.
> >
> > If an extension is frozen or ratified by the RISC-V foundation, it can
> > be supported in QEMU. Generally we will try to support as many versions
> > as feasible, following the usual QEMU deprecation policy to remove old
> > versions.
> >
> > If an official RISC-V foundation extension is in a reasonable draft
> > state, that is not too many changes are still expected, it can be
> > supported experimentally by QEMU. Experimental support means it must
> > be disabled by default and marked with a "x-" in the CPU/board properti=
es.
> > Draft extensions can be enabled by specific CPUs or boards if the hardw=
are
> > supports that extension.
>
> Should we include a version number on experimental versions?
>
> LLVM requires users to fully specify the version, when using
> experimental versions.
> This may be a useful stereotype also for QEmu, as it ensures that
> users are aware that the underlying specification version has changed
> (e.g., when someone requests x-zbb-0p92 and our implementation moves
> to x-zbb-0p93 (there was a difference in encoding of the
> minimum/maximum operations in-between)), an error will be raised early
> instead of having a computation go wrong later.

We traditionally haven't and it's up to anyone using an experimental
extension to check the version.

It's probably worth including though, I have added a sentence there.

Thanks for the feedback, I have added that to the wiki

Alistair

>
> > QEMU will only support the latest version of patches submitted for a dr=
aft
> > extension. A draft extension can also be removed at any time and does n=
ot
> > follow QEMU's deprecation policy.
> >
> > =3D=3D=3D RISC-V Custom Extensions/Instructions =3D=3D=3D
> > Support for custom instruction set extensions are an important part of =
RISC-V,
> > with large encoding spaces reserved of vendor extensions.
> >
> > QEMU follows similar rules to the RISC-V toolchain convention, as descr=
ibed
> > here: https://github.com/riscv-non-isa/riscv-toolchain-conventions/pull=
/17
> >
> > QEMU will support vendor extensions. Vendor extensions must be
> > disabled by default, but can be enabled for specific vendor CPUs and
> > boards. The vendor extensions should use prefixes and names as describe=
d in
> > https://github.com/riscv-non-isa/riscv-toolchain-conventions
> >
> > Vendor extensions must be maintained and tested by the vendor. Upstream=
 will
> > take efforts to not break extensions, but testing and bug fixes should =
be
> > done by the vendor. Patches to add support for open source toolchains a=
re
> > unlikely to be accepted without specification documents being made avai=
lable
> > publicly.
> >
> > Vendor extensions can not interfere with other extensions and can not
> > be obtrusive to the core RISC-V target code.
> >
> > If you are looking to add support for vendor extensions, it is recommen=
ded
> > that you get involved in the QEMU review process. It is also recommende=
d that
> > you send your patches as early as possible to get community feedback be=
fore
> > they are fully implemented. This is especially important if you are mod=
ifying
> > core code.
> >
> > Alistair

