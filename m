Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C37CC77B73
	for <qemu-riscv@archiver.kernel.org>; Thu, 18 May 2023 21:43:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pzlOf-00027s-Ao; Thu, 18 May 2023 17:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>) id 1pzlOd-000269-Eu
 for qemu-riscv@nongnu.org; Thu, 18 May 2023 17:42:51 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>) id 1pzlOX-0008Hj-Fq
 for qemu-riscv@nongnu.org; Thu, 18 May 2023 17:42:51 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C410D61B04;
 Thu, 18 May 2023 21:42:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85CE6C433EF;
 Thu, 18 May 2023 21:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684446160;
 bh=x5I5mruh7zMCo5Zhys6Y0M8OdmsdgmVH1YsnbP5N0G4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cROkLAXx3D7DzisnvZXbe/RpC7p3ynWO5qtEVZnDCjlMCU8He9ikyvYowyWEEv26a
 K4cdYAfilcdu5lak2CudEIf54yvGchTRFiBmj3sRaqkaHy7mE0nRQeIeAJ567ONzyb
 6oL0iffTiSk9AnFGDcKl1+krpJrPIm2Fq71IfTMujh5KJRk8rCuN4tC5l2YKucAWox
 ExGxWJLBmf3c6gcAPOQEA2rZ3tZxSRT5Pl7VJOzGVKFlw23cN+MgvVX6l7/+rY0HA/
 9mRGiCSxndOnL1qhHTBCcITaadDSpdoAZDDyuyJBk/clylgU/Mkma6LuabyZ8kaHSs
 Ci/0Wmk6nl9YA==
Date: Thu, 18 May 2023 22:42:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Sean Anderson <sean.anderson@seco.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Anup Patel <anup@brainfault.org>,
 Andrew Jones <ajones@ventanamicro.com>, palmer@dabbelt.com,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>,
 Jessica Clarke <jrtc27@jrtc27.com>, Rick Chen <rick@andestech.com>,
 Leo <ycliang@andestech.com>, linux-riscv@lists.infradead.org,
 qemu-riscv@nongnu.org, u-boot@lists.denx.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: riscv: deprecate riscv,isa
Message-ID: <20230518-monkhood-dispersal-6749b1228b0d@spud>
References: <20230518-thermos-sanitary-cf3fbc777ea1@wendy>
 <20230518-4050231ca8dbe93c08cf9c9a@orel>
 <CAAhSdy07Mg_JBF+4ucGFiWdBKh-Ass5G_aUWqBqTnDSFp7S=0A@mail.gmail.com>
 <20230518-hammock-doornail-478e8ea8e6a7@wendy>
 <f7c20090-220c-2805-86ba-b174a89f65b3@seco.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TYryGqRDcYWpb9dy"
Content-Disposition: inline
In-Reply-To: <f7c20090-220c-2805-86ba-b174a89f65b3@seco.com>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=conor@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--TYryGqRDcYWpb9dy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 02:30:53PM -0400, Sean Anderson wrote:
> On 5/18/23 10:06, Conor Dooley wrote:
> > On Thu, May 18, 2023 at 07:13:15PM +0530, Anup Patel wrote:
> >> On Thu, May 18, 2023 at 4:02=E2=80=AFPM Andrew Jones <ajones@ventanami=
cro.com> wrote:
> >> > On Thu, May 18, 2023 at 09:58:30AM +0100, Conor Dooley wrote:
> >=20
> >> > > -  riscv,isa:
> >> > > -    description:
> >> > > -      Identifies the specific RISC-V instruction set architecture
> >> > > -      supported by the hart.  These are documented in the RISC-V
> >> > > -      User-Level ISA document, available from
> >> > > -      https://riscv.org/specifications/
> >> > > -
> >> > > -      Due to revisions of the ISA specification, some deviations
> >> > > -      have arisen over time.
> >> > > -      Notably, riscv,isa was defined prior to the creation of the
> >> > > -      Zicsr and Zifencei extensions and thus "i" implies
> >> > > -      "zicsr_zifencei".
> >> > > -
> >> > > -      While the isa strings in ISA specification are case
> >> > > -      insensitive, letters in the riscv,isa string must be all
> >> > > -      lowercase to simplify parsing.
> >> > > -    $ref: "/schemas/types.yaml#/definitions/string"
> >> > > -    pattern: ^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:[hsxz](?:[a-z]=
)+)?(?:_[hsxz](?:[a-z])+)*$
> >> > > -
> >> > >    # RISC-V requires 'timebase-frequency' in /cpus, so disallow it=
 here
> >> > >    timebase-frequency: false
> >> > >
> >> > > @@ -133,8 +117,13 @@ properties:
> >> > >        DMIPS/MHz, relative to highest capacity-dmips-mhz
> >> > >        in the system.
> >> > >
> >> > > +oneOf:
> >> > > +  - required:
> >> > > +      - riscv,isa
> >> >
> >> > This is the part Anup keeps reminding me about. We can create better=
 ways
> >> > to handle extensions in DT and ACPI, but we'll still need to parse I=
SA
> >> > strings to handle legacy DTs and holdouts that keep creating ISA str=
ings,
> >> > at least during the deprecation period, since ISA strings are still =
"the
> >> > way to do it" according to the spec.
> >>=20
> >> Coming up with an alternate way in DT is fine but we can't deprecate
> >> ISA strings since ISA strings are widely used:
> >> 1) Various bootloaders
> >=20
> > Aye, for the reason, as I mentioned earlier and in the RFC thread,
> > removing existing parsers isn't a good idea.
> >=20
> >> 2) It is part of /proc/cpuinfo
> >=20
> > That is irrelevant.
> >=20
> >> 3) Hypervisors use it to communicate HW features to Guest/VM.
> >> Hypervisors can't get away from generating ISA strings because
> >> Hypervisors don't know what is running inside Guest/VM.
> >=20
> > Generate both :) As things stand, your guests could interpret what you
> > communicate to them via riscv,isa differently!
> >=20
> >> In the case of ACPI, it is a very different situation. Like Sunil ment=
ioned,
> >> ACPI will always follow mechanisms defined by RVI (such as ISA string).
> >> Other ACPI approaches such as GUID for ISA extension are simply not
> >> scalable and will take a lot more memory for ACPI tables compared to
> >> ISA strings.
> >=20
> > My proposal should actually suit ACPI, at least for Linux, as it would
> > be a chance to align currently misaligned definitions. I won't speak to
> > GUIDs or whatever as that's someone else's problem :)
> >=20
> >> > Also, if we assume the wording in the spec does get shored up, then,
> >> > unless I'm missing something, the list of advantages for this boolean
> >> > proposal from your commit message would be
> >>=20
> >> IMO, we should try our best to have the wordings changed in RVI spec.
> >=20
> > Yes, doing so is beneficial for all of us regardless of what happens
> > here. I do think that it is partially orthogonal - it allows us to not
> > design an interface that needs to be capable of communicating a wide
> > variety of versions, but I don't think it solves some of the issues
> > that riscv,isa has. If I thought it did, I would not have gone to the
> > trouble of respinning this patch out of the other approach.
> >=20
> >> > * More character choices for name -- probably not a huge gain for ra=
tified
> >> >   extensions, since the boolean properties will likely still use the=
 same
> >> >   name as the ISA string (riscv,isa-extension-<name>). But, for vend=
or
> >> >   extensions, this is indeed a major improvement, since vendor exten=
sion
> >> >   boolean property names may need to be extended in unambiguous ways=
 to
> >> >   handle changes in the extension.
> >> >
> >> > * Simpler, more complete DT validation (but we still need a best eff=
ort
> >> >   for legacy ISA strings)
> >> >
> >> > * Simpler DT parsing (but we still need the current parser for legac=
y ISA
> >> >   strings)
> >> >
> >> > > +  - required:
> >> > > +      - riscv,isa-base
> >> > > +
> >> > >  required:
> >> > > -  - riscv,isa
> >> > >    - interrupt-controller
> >> > >
> >> > >  additionalProperties: true
> >> > > @@ -177,7 +166,13 @@ examples:
> >> > >                  i-tlb-size =3D <32>;
> >> > >                  mmu-type =3D "riscv,sv39";
> >> > >                  reg =3D <1>;
> >> > > -                riscv,isa =3D "rv64imafdc";
> >> > > +                riscv,isa-base =3D "rv64i";
> >> > > +                riscv,isa-extension-i;
> >> > > +                riscv,isa-extension-m;
> >> > > +                riscv,isa-extension-a;
> >> > > +                riscv,isa-extension-f;
> >> > > +                riscv,isa-extension-d;
> >> > > +                riscv,isa-extension-c;
> >>=20
> >> One downside of this new approach is it will increase the size of DTB.
> >> Imaging 50 such DT properties in 46 CPU DT nodes.
> >=20
> > I should do a comparison between 50 extensions in riscv,isa and doing
> > this 50 times and see what the sizes are.
>=20
> Why not just have something like
>=20
> mycpu {
> 	...
> 	riscv,isa {
> 		i;
> 		m;
> 		a;
> 		zicsr;
> 		...
> 	};
> };

Naming of the node aside (perhaps that could be riscv,isa-extensions)
there's not something hitting me immediately as to why that is a no-no.
If the size is a concern, this would certainly be more efficient & not
like the probing would be anything other than trivial more difficult
what I have in my proposal.

Rob's AFK at the moment, and I was hoping that he would take a look at
the idea, so I won't respin til he is back, but I'll give this a go in
the interim.

Cheers,
Conor.

--TYryGqRDcYWpb9dy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGabyQAKCRB4tDGHoIJi
0tqeAQCpsTIUwavLKPVNiJd1cmmE4LJnnxMRlq2sxMTP8zSOpQD/arxRvhO4QzlJ
1itR13j6MTL60roBmM//fn7DprVxnwI=
=YkDr
-----END PGP SIGNATURE-----

--TYryGqRDcYWpb9dy--

