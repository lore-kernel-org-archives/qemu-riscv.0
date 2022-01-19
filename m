Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9zoc-0001Pb-Ur
	for mharc-qemu-riscv@gnu.org; Tue, 18 Jan 2022 20:31:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9zoa-0001Mq-5u; Tue, 18 Jan 2022 20:31:08 -0500
Received: from [2607:f8b0:4864:20::135] (port=42742
 helo=mail-il1-x135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9zoR-0001lk-4C; Tue, 18 Jan 2022 20:31:07 -0500
Received: by mail-il1-x135.google.com with SMTP id u5so817695ilq.9;
 Tue, 18 Jan 2022 17:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9W7NkSeX1AsVM06H020ofJkD7tyk1nckWF5a2VbStR4=;
 b=OIgILNBF/6sIeDLYud5mp8A2V8bZkoa1C754dkE51ml3HNSLQDkZ7ankinHbr8O6zH
 SXk9MTxfY8SLLrBzYvtqsvqJ69/eodpFAQfwM3oB9oJjYqxaL3Kj10+wtqjfyJWlE5cA
 9TgpCJgEXb8EypjCR3tgxWqFrWS5SHgSiF4ZcU+BLs2nZwqxXDnkkCDh8147Go8PsRYL
 99XgIwzsM28Kr/cXOZ+nuWDO2Y/plVILWZ0ClYCME+EdFrMyre7v+oS1ID3h2LB88PX5
 NQURwglsbwo3fUHIrn1b6GGUWRxETzf76mJHArs/bVpKSUV4kvmlr0YpZ0rS7JxNwjGd
 9uog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9W7NkSeX1AsVM06H020ofJkD7tyk1nckWF5a2VbStR4=;
 b=FVWAqtEHB5qsW4e4H5ru7AUztpLZtS4UztvPO3cc0lIpH7MJWP7RxcFFIEaRtXhlVK
 erdPLnoSIeaOnP7ZIb1YKW0a/ba7lapbZYgQGtBzaKOOzm6Lc7OUIVWerI3vd/dSWcnq
 NQvFTmCygYXU5kjg/rmvAbxWvb4lFUNLj15LeKb+mJJJv24mIJgYojeYuGNBnVejxfaW
 mDx2jS80GahS2uX5aUwsPADWVcTlDU195xXdVxUkn8Eb574ic4PYPcjnBgGO8W4302R7
 xxC9MGLhgu4PVhL9aVCMSlPXl7YV5g/TKAcO21o2Iuww+qWlbb0/uY9MLabgA7ZgQfHv
 o99A==
X-Gm-Message-State: AOAM5327BzuFul6oeSgtNrCxxrwwqRVooI0+J/i8GCQVYGuH4ysr22WR
 a7tqA5mSoXGcRSbewnFOAVZ0fqlhqiyuNE+EGZ8=
X-Google-Smtp-Source: ABdhPJwMSSYY+dGogHH34Ta7iPIvqFNIJscb+3vyLA6sZfSssZpd6qGscQdTc9ZObGjPAxp7jB6zAaTWIVno1dsblNk=
X-Received: by 2002:a05:6e02:b4c:: with SMTP id
 f12mr15514706ilu.208.1642555857102; 
 Tue, 18 Jan 2022 17:30:57 -0800 (PST)
MIME-Version: 1.0
References: <20220113202033.3320854-1-philipp.tomsich@vrull.eu>
 <20220113202033.3320854-2-philipp.tomsich@vrull.eu>
 <CAKmqyKOzVi9MiXt+2ESEr28EQ7M6wEyTon+a=h4do9fy4KN=Pw@mail.gmail.com>
 <CAAeLtUBJ4sSZaDqe1Z_431LMDtuQ996OLoE6t_Zh6TLH+_gPHg@mail.gmail.com>
 <CAKmqyKPcYBDJqQ88BZ3TDwiGz6=M3kfB2Bc8YXcQJ=+G0Og4gQ@mail.gmail.com>
In-Reply-To: <CAKmqyKPcYBDJqQ88BZ3TDwiGz6=M3kfB2Bc8YXcQJ=+G0Og4gQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 19 Jan 2022 11:30:30 +1000
Message-ID: <CAKmqyKMvEft2RxbxB92D7F=dZz0nuEJQYHFvVBnQJrt6d80x6A@mail.gmail.com>
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
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::135
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x135.google.com
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
X-List-Received-Date: Wed, 19 Jan 2022 01:31:08 -0000

On Wed, Jan 19, 2022 at 11:19 AM Alistair Francis <alistair23@gmail.com> wr=
ote:
>
> On Wed, Jan 19, 2022 at 9:22 AM Philipp Tomsich
> <philipp.tomsich@vrull.eu> wrote:
> >
> > Alistair,
> >
> > Some of us (the merit almost exclusively goes to Kito) have been
> > working towards a similar policy for GCC/binutils and LLVM.
> > This currently lives in:
> >    https://github.com/riscv-non-isa/riscv-toolchain-conventions/pull/17
>
> Ah cool! We can use that as a good starting point.
>
> >
> > A few comments & a question below.
> >
> > Thanks,
> > Philipp.
> >
> > On Tue, 18 Jan 2022 at 23:53, Alistair Francis <alistair23@gmail.com> w=
rote:
> > >
> > > On Fri, Jan 14, 2022 at 6:22 AM Philipp Tomsich
> > > <philipp.tomsich@vrull.eu> wrote:
> > > >
> > > > This adds the decoder and translation for the XVentanaCondOps custo=
m
> > > > extension (vendor-defined by Ventana Micro Systems), which is
> > > > documented at https://github.com/ventanamicro/ventana-custom-extens=
ions/releases/download/v1.0.0/ventana-custom-extensions-v1.0.0.pdf
> > > >
> > > > This commit then also adds a guard-function (has_XVentanaCondOps_p)
> > > > and the decoder function to the table of decoders, enabling the
> > > > support for the XVentanaCondOps extension.
> > > >
> > > > Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> > >
> > > This looks reasonable to me.
> > >
> > > I'm going to leave this for a bit in case there are any more comments=
.
> > >
> > > I was a little worried that taking vendor extensions isn't the right
> > > move, as we might get stuck with a large number of them. But this is
> > > pretty self contained and I think with the growing RISC-V interest
> > > it's something we will eventually need to support.
> > >
> > > I'm going to update the QEMU RISC-V wiki page with this to make the
> > > position clear (comments very welcome)
> > >
> > > =3D=3D=3D RISC-V Extensions =3D=3D=3D
> > > As RISC-V has a range of possible extensions, QEMU has guidelines for
> > > supporting them all.
> > >
> > > If an extension is frozen or ratified by the RISC-V foundation, it ca=
n
> > > be supported in QEMU.
> > >
> > > If an official RISC-V foundation extension is in a reasonable draft
> > > state, that is not too many changes are still expected, it can be
> > > supported experimentally by QEMU. Experimental support means it must
> > > be disabled by default and marked with a "x-" in the properties. QEMU
> > > will only support the latest version of patches submitted for a draft
> > > extension. A draft extension can also be removed at any time if it
> > > conflicts with other extensions.
> > >
> > > QEMU will also support vendor extensions. Vendor extensions must be
> > > disabled by default, but can be enabled for specific vendor CPUs and
> > > boards. Vendor extensions must be maintained and tested by the vendor=
.
> >
> > I guess I should create a v3 with appropriate paths in the MAINTAINERS =
file?
>
> Hmm... Good point. I don't think you have to if you don't want to.
>
> My point here was more to just make it clear that upstream QEMU is not
> a dumping ground for vendor extensions to get them maintained by
> someone else. Obviously we won't purposely break things just for fun.
> There is an expectation that the vendor tests their extensions and
> responds to bug reports and things like that.
>
> >
> > > Vendor extensions can not interfere with other extensions and can not
> > > be obtrusive to the RISC-V target code.
> >
> > I know that there is some interest to have the XtheadV (the
> > instructions previously known as vectors 0.7.1-draft) supported and we
> > have the reality of a deployed base that implements it in hardware.
> > This would conflict with the opcode space used by the standard RISC-V
> > vectors, so it makes for an interesting test case (even if just to
> > clarify our intent)...
> > Personally, I would like to avoid precluding inclusion of something
> > useful (of course, "Vendor extensions must be maintained and tested by
> > the vendor." has to apply!), if a vendor was going to step up and also
> > offers to maintain it.
>
> Yeah... this is unfortunate. I agree that having the 0.7.1-draft
> extensions supported would be great. There is hardware that supports
> it.
>
> I think this point still stands though. IF the XtheadV implementation
> is self contained and doesn't interfere with the vector extensions,
> then that's great and we can support it. If instead it adds a large
> amount of conditionals to the released vector extension code then I
> don't think we can take it.
>
> There is some wiggle room, but the RISC-V tree already has enough
> going on and very little reviewers. If in the future we get more
> reviewers and testers we can re-evaulate what is acceptable, but for
> now I think we need to be a little strict. (Hint to any companies to
> give developers time to review)
>
> >
> > So let's assume such a (very significant) addition were factored out
> > similarly, interfacing just through a hook in decode_op and
> > argument-parsing logic that ensures that the conflicting
> > standard-extension is turned off: would this still be acceptable under
> > this policy =E2=80=94 or would it trip the "obtrusive" condition?
>
> I think that would be acceptable, I wouldn't say that is obtrusive as
> it's self contained.

Ok, take two:

=3D=3D=3D RISC-V Foundation Extensions =3D=3D=3D
As RISC-V has a range of possible extensions, QEMU has guidelines for
supporting them all.

If an extension is frozen or ratified by the RISC-V foundation, it can
be supported in QEMU. Generally we will try to support as many versions
as feasible, following the usual QEMU deprecation policy to remove old
versions.

If an official RISC-V foundation extension is in a reasonable draft
state, that is not too many changes are still expected, it can be
supported experimentally by QEMU. Experimental support means it must
be disabled by default and marked with a "x-" in the CPU/board properties.
Draft extensions can be enabled by specific CPUs or boards if the hardware
supports that extension.

QEMU will only support the latest version of patches submitted for a draft
extension. A draft extension can also be removed at any time and does not
follow QEMU's deprecation policy.

=3D=3D=3D RISC-V Custom Extensions/Instructions =3D=3D=3D
Support for custom instruction set extensions are an important part of RISC=
-V,
with large encoding spaces reserved of vendor extensions.

QEMU follows similar rules to the RISC-V toolchain convention, as described
here: https://github.com/riscv-non-isa/riscv-toolchain-conventions/pull/17

QEMU will support vendor extensions. Vendor extensions must be
disabled by default, but can be enabled for specific vendor CPUs and
boards. The vendor extensions should use prefixes and names as described in
https://github.com/riscv-non-isa/riscv-toolchain-conventions

Vendor extensions must be maintained and tested by the vendor. Upstream wil=
l
take efforts to not break extensions, but testing and bug fixes should be
done by the vendor. Patches to add support for open source toolchains are
unlikely to be accepted without specification documents being made availabl=
e
publicly.

Vendor extensions can not interfere with other extensions and can not
be obtrusive to the core RISC-V target code.

If you are looking to add support for vendor extensions, it is recommended
that you get involved in the QEMU review process. It is also recommended th=
at
you send your patches as early as possible to get community feedback before
they are fully implemented. This is especially important if you are modifyi=
ng
core code.

Alistair

