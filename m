Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nAZVw-0001K9-VY
	for mharc-qemu-riscv@gnu.org; Thu, 20 Jan 2022 10:38:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nAZVq-0001Ea-LH
 for qemu-riscv@nongnu.org; Thu, 20 Jan 2022 10:38:10 -0500
Received: from [2a00:1450:4864:20::32b] (port=36509
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nAZVn-0005aw-Ip
 for qemu-riscv@nongnu.org; Thu, 20 Jan 2022 10:38:09 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso21366926wma.1
 for <qemu-riscv@nongnu.org>; Thu, 20 Jan 2022 07:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OZYHGtKfvJMX/pPtAOCBBrHQl7PzfcOe74x0Na749qM=;
 b=oIPfVmjFGA8W5kZ5hzphUSqYXw+fke4HuByzLLU6aeBxUML2aIy5HPJEhh54nQspLl
 A7Tjw6/PGx146NLyLUO+/ATDjA2bfF/0EnV3us1qK8T2J2pFVWDCj8rfphaP2EWuxJDH
 xsX6pmglyYuEn9JP7IGAEHz2ltJ63pnk9L5XTgwRNiUDVL22JhvuuaaNlgLo07qSAAGR
 6rZpZ9as9O5WuItLNkJFKJAUAJblZmd24l/IpTYzdl6GDFxN8H3OBdeEs8yq7wtpUtX+
 sxx3yvCUfteknQbZ2G/BeoVa0DtbJ2DzSyjuKGHM9Yg9t7R52uHxdHW6D6mp5HZkFR+K
 5lBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OZYHGtKfvJMX/pPtAOCBBrHQl7PzfcOe74x0Na749qM=;
 b=ZDxFF0kQPTOe2WArWsl1wvqskpUZXbVefWhe0ZKjIfHQtdgX+RwQLlGbzg5ovsQo5V
 1St5QSQps+uRtUUn/Y+hy+Ag36D3onvHTY5WDDAkBQXC6EukgR2K/i0X3bOHy1ukmrP7
 K0wRk0MpeVSgxN54hKMmYRxVaasRF7qrqwzxV9Qao4Lp00foKkrpj35kVl1RXuApobeR
 GzbYyZaiIbTe7yMZvqzaKD37KcJG60SeR8lte1aftImdUBh5+zu5Dp8JxFom7zRzN6FP
 /W9CEyfi4elNc75zc7IECsMdm3VpO+qahgeelgjCcBxG9Sv6ng7+M0y1pZb1BKiB/7z7
 gk4Q==
X-Gm-Message-State: AOAM531SHzo/fLd3ltMEPdeOv0OagQRIAV2jUCEE3Ue9gcih0VRJmZVe
 6dM2LIStYLKyWbmZO122sAEUBgqIX1iwaogYY3h73w==
X-Google-Smtp-Source: ABdhPJwoJ+N4LutRUmS5hqQp0kjLd/k5/0zw6Kkod6SUO6Rk3ng864b1mSplaDVVpOvQcMEOpWodZY01cRuz9F3zXLA=
X-Received: by 2002:a05:600c:2299:: with SMTP id
 25mr9557051wmf.52.1642693085126; 
 Thu, 20 Jan 2022 07:38:05 -0800 (PST)
MIME-Version: 1.0
References: <20220113202033.3320854-1-philipp.tomsich@vrull.eu>
 <20220113202033.3320854-2-philipp.tomsich@vrull.eu>
 <CAKmqyKOzVi9MiXt+2ESEr28EQ7M6wEyTon+a=h4do9fy4KN=Pw@mail.gmail.com>
 <CAAeLtUBJ4sSZaDqe1Z_431LMDtuQ996OLoE6t_Zh6TLH+_gPHg@mail.gmail.com>
 <CAKmqyKPcYBDJqQ88BZ3TDwiGz6=M3kfB2Bc8YXcQJ=+G0Og4gQ@mail.gmail.com>
 <CAKmqyKMvEft2RxbxB92D7F=dZz0nuEJQYHFvVBnQJrt6d80x6A@mail.gmail.com>
In-Reply-To: <CAKmqyKMvEft2RxbxB92D7F=dZz0nuEJQYHFvVBnQJrt6d80x6A@mail.gmail.com>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Thu, 20 Jan 2022 16:37:53 +0100
Message-ID: <CAAeLtUBTGGBdNwNNhJH+VO=Th4+ftz63ttgFvAo=G7m16Tz8CA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] target/riscv: Add XVentanaCondOps custom extension
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Greg Favor <gfavor@ventanamicro.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Kito Cheng <kito.cheng@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 20 Jan 2022 15:38:10 -0000

Thanks for taking the time to write this up!

On Wed, 19 Jan 2022 at 02:30, Alistair Francis <alistair23@gmail.com> wrote=
:
>
> On Wed, Jan 19, 2022 at 11:19 AM Alistair Francis <alistair23@gmail.com> =
wrote:
> >
> > On Wed, Jan 19, 2022 at 9:22 AM Philipp Tomsich
> > <philipp.tomsich@vrull.eu> wrote:
> > >
> > > Alistair,
> > >
> > > Some of us (the merit almost exclusively goes to Kito) have been
> > > working towards a similar policy for GCC/binutils and LLVM.
> > > This currently lives in:
> > >    https://github.com/riscv-non-isa/riscv-toolchain-conventions/pull/=
17
> >
> > Ah cool! We can use that as a good starting point.
> >
> > >
> > > A few comments & a question below.
> > >
> > > Thanks,
> > > Philipp.
> > >
> > > On Tue, 18 Jan 2022 at 23:53, Alistair Francis <alistair23@gmail.com>=
 wrote:
> > > >
> > > > On Fri, Jan 14, 2022 at 6:22 AM Philipp Tomsich
> > > > <philipp.tomsich@vrull.eu> wrote:
> > > > >
> > > > > This adds the decoder and translation for the XVentanaCondOps cus=
tom
> > > > > extension (vendor-defined by Ventana Micro Systems), which is
> > > > > documented at https://github.com/ventanamicro/ventana-custom-exte=
nsions/releases/download/v1.0.0/ventana-custom-extensions-v1.0.0.pdf
> > > > >
> > > > > This commit then also adds a guard-function (has_XVentanaCondOps_=
p)
> > > > > and the decoder function to the table of decoders, enabling the
> > > > > support for the XVentanaCondOps extension.
> > > > >
> > > > > Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> > > >
> > > > This looks reasonable to me.
> > > >
> > > > I'm going to leave this for a bit in case there are any more commen=
ts.
> > > >
> > > > I was a little worried that taking vendor extensions isn't the righ=
t
> > > > move, as we might get stuck with a large number of them. But this i=
s
> > > > pretty self contained and I think with the growing RISC-V interest
> > > > it's something we will eventually need to support.
> > > >
> > > > I'm going to update the QEMU RISC-V wiki page with this to make the
> > > > position clear (comments very welcome)
> > > >
> > > > =3D=3D=3D RISC-V Extensions =3D=3D=3D
> > > > As RISC-V has a range of possible extensions, QEMU has guidelines f=
or
> > > > supporting them all.
> > > >
> > > > If an extension is frozen or ratified by the RISC-V foundation, it =
can
> > > > be supported in QEMU.
> > > >
> > > > If an official RISC-V foundation extension is in a reasonable draft
> > > > state, that is not too many changes are still expected, it can be
> > > > supported experimentally by QEMU. Experimental support means it mus=
t
> > > > be disabled by default and marked with a "x-" in the properties. QE=
MU
> > > > will only support the latest version of patches submitted for a dra=
ft
> > > > extension. A draft extension can also be removed at any time if it
> > > > conflicts with other extensions.
> > > >
> > > > QEMU will also support vendor extensions. Vendor extensions must be
> > > > disabled by default, but can be enabled for specific vendor CPUs an=
d
> > > > boards. Vendor extensions must be maintained and tested by the vend=
or.
> > >
> > > I guess I should create a v3 with appropriate paths in the MAINTAINER=
S file?
> >
> > Hmm... Good point. I don't think you have to if you don't want to.
> >
> > My point here was more to just make it clear that upstream QEMU is not
> > a dumping ground for vendor extensions to get them maintained by
> > someone else. Obviously we won't purposely break things just for fun.
> > There is an expectation that the vendor tests their extensions and
> > responds to bug reports and things like that.
> >
> > >
> > > > Vendor extensions can not interfere with other extensions and can n=
ot
> > > > be obtrusive to the RISC-V target code.
> > >
> > > I know that there is some interest to have the XtheadV (the
> > > instructions previously known as vectors 0.7.1-draft) supported and w=
e
> > > have the reality of a deployed base that implements it in hardware.
> > > This would conflict with the opcode space used by the standard RISC-V
> > > vectors, so it makes for an interesting test case (even if just to
> > > clarify our intent)...
> > > Personally, I would like to avoid precluding inclusion of something
> > > useful (of course, "Vendor extensions must be maintained and tested b=
y
> > > the vendor." has to apply!), if a vendor was going to step up and als=
o
> > > offers to maintain it.
> >
> > Yeah... this is unfortunate. I agree that having the 0.7.1-draft
> > extensions supported would be great. There is hardware that supports
> > it.
> >
> > I think this point still stands though. IF the XtheadV implementation
> > is self contained and doesn't interfere with the vector extensions,
> > then that's great and we can support it. If instead it adds a large
> > amount of conditionals to the released vector extension code then I
> > don't think we can take it.
> >
> > There is some wiggle room, but the RISC-V tree already has enough
> > going on and very little reviewers. If in the future we get more
> > reviewers and testers we can re-evaulate what is acceptable, but for
> > now I think we need to be a little strict. (Hint to any companies to
> > give developers time to review)
> >
> > >
> > > So let's assume such a (very significant) addition were factored out
> > > similarly, interfacing just through a hook in decode_op and
> > > argument-parsing logic that ensures that the conflicting
> > > standard-extension is turned off: would this still be acceptable unde=
r
> > > this policy =E2=80=94 or would it trip the "obtrusive" condition?
> >
> > I think that would be acceptable, I wouldn't say that is obtrusive as
> > it's self contained.
>
> Ok, take two:
>
> =3D=3D=3D RISC-V Foundation Extensions =3D=3D=3D
> As RISC-V has a range of possible extensions, QEMU has guidelines for
> supporting them all.
>
> If an extension is frozen or ratified by the RISC-V foundation, it can
> be supported in QEMU. Generally we will try to support as many versions
> as feasible, following the usual QEMU deprecation policy to remove old
> versions.
>
> If an official RISC-V foundation extension is in a reasonable draft
> state, that is not too many changes are still expected, it can be
> supported experimentally by QEMU. Experimental support means it must
> be disabled by default and marked with a "x-" in the CPU/board properties=
.
> Draft extensions can be enabled by specific CPUs or boards if the hardwar=
e
> supports that extension.

Should we include a version number on experimental versions?

LLVM requires users to fully specify the version, when using
experimental versions.
This may be a useful stereotype also for QEmu, as it ensures that
users are aware that the underlying specification version has changed
(e.g., when someone requests x-zbb-0p92 and our implementation moves
to x-zbb-0p93 (there was a difference in encoding of the
minimum/maximum operations in-between)), an error will be raised early
instead of having a computation go wrong later.

> QEMU will only support the latest version of patches submitted for a draf=
t
> extension. A draft extension can also be removed at any time and does not
> follow QEMU's deprecation policy.
>
> =3D=3D=3D RISC-V Custom Extensions/Instructions =3D=3D=3D
> Support for custom instruction set extensions are an important part of RI=
SC-V,
> with large encoding spaces reserved of vendor extensions.
>
> QEMU follows similar rules to the RISC-V toolchain convention, as describ=
ed
> here: https://github.com/riscv-non-isa/riscv-toolchain-conventions/pull/1=
7
>
> QEMU will support vendor extensions. Vendor extensions must be
> disabled by default, but can be enabled for specific vendor CPUs and
> boards. The vendor extensions should use prefixes and names as described =
in
> https://github.com/riscv-non-isa/riscv-toolchain-conventions
>
> Vendor extensions must be maintained and tested by the vendor. Upstream w=
ill
> take efforts to not break extensions, but testing and bug fixes should be
> done by the vendor. Patches to add support for open source toolchains are
> unlikely to be accepted without specification documents being made availa=
ble
> publicly.
>
> Vendor extensions can not interfere with other extensions and can not
> be obtrusive to the core RISC-V target code.
>
> If you are looking to add support for vendor extensions, it is recommende=
d
> that you get involved in the QEMU review process. It is also recommended =
that
> you send your patches as early as possible to get community feedback befo=
re
> they are fully implemented. This is especially important if you are modif=
ying
> core code.
>
> Alistair

