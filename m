Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F5AC7EE25
	for <qemu-riscv@archiver.kernel.org>; Thu, 18 May 2023 14:06:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pzeHM-0003e6-RP; Thu, 18 May 2023 10:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1pzeHL-0003dJ-Lo
 for qemu-riscv@nongnu.org; Thu, 18 May 2023 10:06:51 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1pzeHI-0004I7-UJ
 for qemu-riscv@nongnu.org; Thu, 18 May 2023 10:06:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1684418808; x=1715954808;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+Ql81PbdPYsst1Egf8I5nhPuh1Xe/UW0zjJnF/GxGws=;
 b=AqcKiBIcAp0FGQsDRZi4k5sioQE3SFD9piVQHJBwIF+YkuRltEk6N4w7
 8a+9OW8+xwlvFW5jX5tvMIioa7iNihezGDRfGIzzqpVfdfep+4Z1/bW3b
 /3cxhQ86N2wwTG/xxzR+5UzlRnl7wVqB/ZNTZlseAn9i1YFfL3ENYfvYc
 o04tkv9qD/2SCaiIXKXUuaBp1FJquB8EU8yOJ89FsJY+vWm0k6gX9a1Z7
 d9LyncnwxTUbH30E+b71XLLl2n62fgcdZGo40fwDrPi2AusjR0mygReef
 n1VAUahK/hB0+ZUjxU60f4b9DKivK8OZemHdGpaLWpNKaLiIqZ87wEja9 A==;
X-IronPort-AV: E=Sophos;i="5.99,285,1677567600"; 
 d="asc'?scan'208";a="216119339"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 May 2023 07:06:41 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 18 May 2023 07:06:41 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 18 May 2023 07:06:38 -0700
Date: Thu, 18 May 2023 15:06:17 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Anup Patel <anup@brainfault.org>
CC: Andrew Jones <ajones@ventanamicro.com>, <palmer@dabbelt.com>,
 <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Alistair Francis
 <alistair.francis@wdc.com>, Anup Patel <apatel@ventanamicro.com>, Atish Patra
 <atishp@atishpatra.org>, Jessica Clarke <jrtc27@jrtc27.com>, Rick Chen
 <rick@andestech.com>, Leo <ycliang@andestech.com>,
 <linux-riscv@lists.infradead.org>, <qemu-riscv@nongnu.org>,
 <u-boot@lists.denx.de>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] dt-bindings: riscv: deprecate riscv,isa
Message-ID: <20230518-hammock-doornail-478e8ea8e6a7@wendy>
References: <20230518-thermos-sanitary-cf3fbc777ea1@wendy>
 <20230518-4050231ca8dbe93c08cf9c9a@orel>
 <CAAhSdy07Mg_JBF+4ucGFiWdBKh-Ass5G_aUWqBqTnDSFp7S=0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="inIwqqp4mBpjB1FE"
Content-Disposition: inline
In-Reply-To: <CAAhSdy07Mg_JBF+4ucGFiWdBKh-Ass5G_aUWqBqTnDSFp7S=0A@mail.gmail.com>
Received-SPF: pass client-ip=68.232.154.123;
 envelope-from=Conor.Dooley@microchip.com; helo=esa.microchip.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

--inIwqqp4mBpjB1FE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 07:13:15PM +0530, Anup Patel wrote:
> On Thu, May 18, 2023 at 4:02=E2=80=AFPM Andrew Jones <ajones@ventanamicro=
=2Ecom> wrote:
> > On Thu, May 18, 2023 at 09:58:30AM +0100, Conor Dooley wrote:

> > > -  riscv,isa:
> > > -    description:
> > > -      Identifies the specific RISC-V instruction set architecture
> > > -      supported by the hart.  These are documented in the RISC-V
> > > -      User-Level ISA document, available from
> > > -      https://riscv.org/specifications/
> > > -
> > > -      Due to revisions of the ISA specification, some deviations
> > > -      have arisen over time.
> > > -      Notably, riscv,isa was defined prior to the creation of the
> > > -      Zicsr and Zifencei extensions and thus "i" implies
> > > -      "zicsr_zifencei".
> > > -
> > > -      While the isa strings in ISA specification are case
> > > -      insensitive, letters in the riscv,isa string must be all
> > > -      lowercase to simplify parsing.
> > > -    $ref: "/schemas/types.yaml#/definitions/string"
> > > -    pattern: ^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:[hsxz](?:[a-z])+)=
?(?:_[hsxz](?:[a-z])+)*$
> > > -
> > >    # RISC-V requires 'timebase-frequency' in /cpus, so disallow it he=
re
> > >    timebase-frequency: false
> > >
> > > @@ -133,8 +117,13 @@ properties:
> > >        DMIPS/MHz, relative to highest capacity-dmips-mhz
> > >        in the system.
> > >
> > > +oneOf:
> > > +  - required:
> > > +      - riscv,isa
> >
> > This is the part Anup keeps reminding me about. We can create better wa=
ys
> > to handle extensions in DT and ACPI, but we'll still need to parse ISA
> > strings to handle legacy DTs and holdouts that keep creating ISA string=
s,
> > at least during the deprecation period, since ISA strings are still "the
> > way to do it" according to the spec.
>=20
> Coming up with an alternate way in DT is fine but we can't deprecate
> ISA strings since ISA strings are widely used:
> 1) Various bootloaders

Aye, for the reason, as I mentioned earlier and in the RFC thread,
removing existing parsers isn't a good idea.

> 2) It is part of /proc/cpuinfo

That is irrelevant.

> 3) Hypervisors use it to communicate HW features to Guest/VM.
> Hypervisors can't get away from generating ISA strings because
> Hypervisors don't know what is running inside Guest/VM.

Generate both :) As things stand, your guests could interpret what you
communicate to them via riscv,isa differently!

> In the case of ACPI, it is a very different situation. Like Sunil mention=
ed,
> ACPI will always follow mechanisms defined by RVI (such as ISA string).
> Other ACPI approaches such as GUID for ISA extension are simply not
> scalable and will take a lot more memory for ACPI tables compared to
> ISA strings.

My proposal should actually suit ACPI, at least for Linux, as it would
be a chance to align currently misaligned definitions. I won't speak to
GUIDs or whatever as that's someone else's problem :)

> > Also, if we assume the wording in the spec does get shored up, then,
> > unless I'm missing something, the list of advantages for this boolean
> > proposal from your commit message would be
>=20
> IMO, we should try our best to have the wordings changed in RVI spec.

Yes, doing so is beneficial for all of us regardless of what happens
here. I do think that it is partially orthogonal - it allows us to not
design an interface that needs to be capable of communicating a wide
variety of versions, but I don't think it solves some of the issues
that riscv,isa has. If I thought it did, I would not have gone to the
trouble of respinning this patch out of the other approach.

> > * More character choices for name -- probably not a huge gain for ratif=
ied
> >   extensions, since the boolean properties will likely still use the sa=
me
> >   name as the ISA string (riscv,isa-extension-<name>). But, for vendor
> >   extensions, this is indeed a major improvement, since vendor extension
> >   boolean property names may need to be extended in unambiguous ways to
> >   handle changes in the extension.
> >
> > * Simpler, more complete DT validation (but we still need a best effort
> >   for legacy ISA strings)
> >
> > * Simpler DT parsing (but we still need the current parser for legacy I=
SA
> >   strings)
> >
> > > +  - required:
> > > +      - riscv,isa-base
> > > +
> > >  required:
> > > -  - riscv,isa
> > >    - interrupt-controller
> > >
> > >  additionalProperties: true
> > > @@ -177,7 +166,13 @@ examples:
> > >                  i-tlb-size =3D <32>;
> > >                  mmu-type =3D "riscv,sv39";
> > >                  reg =3D <1>;
> > > -                riscv,isa =3D "rv64imafdc";
> > > +                riscv,isa-base =3D "rv64i";
> > > +                riscv,isa-extension-i;
> > > +                riscv,isa-extension-m;
> > > +                riscv,isa-extension-a;
> > > +                riscv,isa-extension-f;
> > > +                riscv,isa-extension-d;
> > > +                riscv,isa-extension-c;
>=20
> One downside of this new approach is it will increase the size of DTB.
> Imaging 50 such DT properties in 46 CPU DT nodes.

I should do a comparison between 50 extensions in riscv,isa and doing
this 50 times and see what the sizes are.

--inIwqqp4mBpjB1FE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGYw2QAKCRB4tDGHoIJi
0hSeAP9jzSAva+PzLu6ehqVimB0Aoyoav0gV6v8bchdyV0ETdgEA0jVTNEscUYpu
ogN+UZoE7KVethG+zRAi1/oDPc87rgo=
=HFE9
-----END PGP SIGNATURE-----

--inIwqqp4mBpjB1FE--

