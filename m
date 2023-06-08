Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F003C7EE23
	for <qemu-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 19:30:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7LLH-0000rI-8X; Thu, 08 Jun 2023 15:30:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>) id 1q7LLE-0000pk-Jq
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 15:30:41 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>) id 1q7LLA-0002PU-Qr
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 15:30:39 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0CAC464B27;
 Thu,  8 Jun 2023 19:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC148C4339B;
 Thu,  8 Jun 2023 19:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686252634;
 bh=Sn9hAi2Kyf0okzCneZ3amJPSCNVbUHG48YWRl4CGl/M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lfdr8/t7jAH4glSpjV2KYZiJ23pFC02NUTTTkCYlLGOvVOrmDCcRICN1I7ckFGeAQ
 TPGCO5Yx6pvnH5XLP1XTniYRePwwraYyUDpYJqCXzS6uNl5YuDSEtEqzaa6vast+yd
 AMjS+CzLVMzQGuWTQNRSM0Ufd/re+R18iMYOl+Biy/Afeke4T74nR7ID5P7Lx82b2L
 1/KMCBpD/NbyjEYVOdgT3myEqZ9cUkkHXTTjYCo/FHA0ZWQmct3tB4tNdElz8hzlKD
 dMXMAC24mzOI1YV/emxTct+WnhjV22drqsWa8YBbOCsThta5By4dLh6opE8JHBZsev
 ojK/xAa+VBS6A==
Date: Thu, 8 Jun 2023 20:30:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Sean Anderson <sean.anderson@seco.com>, Anup Patel <anup@brainfault.org>,
 Andrew Jones <ajones@ventanamicro.com>, palmer@dabbelt.com,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>,
 Jessica Clarke <jrtc27@jrtc27.com>, Rick Chen <rick@andestech.com>,
 Leo <ycliang@andestech.com>, linux-riscv@lists.infradead.org,
 qemu-riscv@nongnu.org, u-boot@lists.denx.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: riscv: deprecate riscv,isa
Message-ID: <20230608-cobbler-giving-e0fac2185e11@spud>
References: <20230518-thermos-sanitary-cf3fbc777ea1@wendy>
 <20230518-4050231ca8dbe93c08cf9c9a@orel>
 <CAAhSdy07Mg_JBF+4ucGFiWdBKh-Ass5G_aUWqBqTnDSFp7S=0A@mail.gmail.com>
 <20230518-hammock-doornail-478e8ea8e6a7@wendy>
 <f7c20090-220c-2805-86ba-b174a89f65b3@seco.com>
 <20230518-monkhood-dispersal-6749b1228b0d@spud>
 <20230530-duller-reset-a34ae111f207@wendy>
 <20230608191537.GA3233857-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="J8Z0GTvlCQGm2lQj"
Content-Disposition: inline
In-Reply-To: <20230608191537.GA3233857-robh@kernel.org>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=conor@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


--J8Z0GTvlCQGm2lQj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 08, 2023 at 01:15:37PM -0600, Rob Herring wrote:
> On Tue, May 30, 2023 at 03:12:12PM +0100, Conor Dooley wrote:
> > On Thu, May 18, 2023 at 10:42:34PM +0100, Conor Dooley wrote:
> > > On Thu, May 18, 2023 at 02:30:53PM -0400, Sean Anderson wrote:
> >=20
> > > >=20
> > > > Why not just have something like
> > > >=20
> > > > mycpu {
> > > > 	...
> > > > 	riscv,isa {
> > > > 		i;
> > > > 		m;
> > > > 		a;
> > > > 		zicsr;
> > > > 		...
>=20
> I prefer property names be globally unique. The tools are geared towards=
=20
> that too. That's largely a symptom of having 0 type information in the=20
> DT.
>=20
> For example if you had an extension called 'reg', it would be a problem.

Per the current ISA rules, that'd not be valid. But then again, I do
have trust issues & it's not like "reg" is the only property name in DT
land.

> > > Naming of the node aside (perhaps that could be riscv,isa-extensions)
> > > there's not something hitting me immediately as to why that is a no-n=
o.
> > > If the size is a concern, this would certainly be more efficient & not
> > > like the probing would be anything other than trivial more difficult
> > > what I have in my proposal.
> >=20
> > Having started messing around with this, one of the main advantages, to
> > me, of this approach is proper validation.
> > cpus.yaml has additionalProperties: true in it, which would have had to
> > be sorted out, or worked around, but creating a child-node with the
> > properties in it allows setting additionalProperties: false.
>=20
> That's an issue on my radar to fix. I started that for the Arm cpus.yaml=
=20
> a while back. Sadly it involves adding all the misc properties vendors=20
> added. It's not a lot, but still better to get in front of that for=20
> Risc-V.

Yeah, guess I can append that to my todo list.

> > > Rob's AFK at the moment, and I was hoping that he would take a look at
> > > the idea, so I won't respin til he is back, but I'll give this a go in
> > > the interim.
> >=20
> > Mechanically, the conversion of the patch isn't difficult, but I'll sti=
ll
> > wait for Rob to come back before sending a v2. But that v2 will more
> > than likely implement your suggestion.
>=20
> I haven't read the whole thread, but the initial proposal looks okay to=
=20
> me.
>=20
> Another way you could do this is a list of strings:
>=20
> riscv,isa-ext =3D "i", "m", "zicsr";
>=20
> I think we have a helper to test is a string in the list.

Perhaps I should've waited a bit longer than a month for a v2 - I sent
one this afternoon doing what Sean suggested:
https://lore.kernel.org/all/20230608-sitting-bath-31eddc03c5a5@spud/

I'll do some poking at the strings and see what I think of it.

Cheers,
Conor.

--J8Z0GTvlCQGm2lQj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIIsVAAKCRB4tDGHoIJi
0g5YAQC9F/U/qWJxcOhejKFcF7fDmwOe+gCq0sgnacuq/Vu+ZAEAwAZ9EAwNs4oF
aCnC2JOfp//gPzZTwmsYjjFeeLhAkwA=
=KmSP
-----END PGP SIGNATURE-----

--J8Z0GTvlCQGm2lQj--

