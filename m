Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E7BC7EE2E
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 21:24:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8p1P-0007Je-73; Mon, 12 Jun 2023 17:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>) id 1q8p1N-0007JI-E8
 for qemu-riscv@nongnu.org; Mon, 12 Jun 2023 17:24:17 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>) id 1q8p1L-0002pU-Qt
 for qemu-riscv@nongnu.org; Mon, 12 Jun 2023 17:24:17 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8C8E261EA8;
 Mon, 12 Jun 2023 21:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DFFEC433EF;
 Mon, 12 Jun 2023 21:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686605037;
 bh=Le3gA2ClE6ECL6WF9fV8Q54wWv/RXKwEzvYFXFKgqDA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JzaWBe097VzKJvl0oBZkVur7A0DKcS4yn5zcvAcJUhnuXNZhfYLv/fpjG1HqJ246k
 o9uvOq5NK6Ex58+pRdpTgDveEEWcqjdmHkPe6soCi+7qyCcs+cx+2z1njQCFAHPRoU
 uffrFY/Oljmq0iF23XmmYHHfJ9J8Nty98dYeJ9625mRzqe3s5pz0DsaoNt3q/Y4T5G
 L1LiDsOYM5vsrmS/jqTEF8Us+X4Xh4w4kkmMTxu5JiMiDLlkNCngJ/+MceOMvDfZVU
 wW9cEVA6nRM2bb8GDSGcdWu10UuDOcdpScFsrgAfLatrZd9q4tLV8mt/oYAR+R7WtJ
 SXMsqLe0lhR2A==
Date: Mon, 12 Jun 2023 22:23:50 +0100
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
Message-ID: <20230612-relic-fetal-1beeae3455aa@spud>
References: <20230518-thermos-sanitary-cf3fbc777ea1@wendy>
 <20230518-4050231ca8dbe93c08cf9c9a@orel>
 <CAAhSdy07Mg_JBF+4ucGFiWdBKh-Ass5G_aUWqBqTnDSFp7S=0A@mail.gmail.com>
 <20230518-hammock-doornail-478e8ea8e6a7@wendy>
 <f7c20090-220c-2805-86ba-b174a89f65b3@seco.com>
 <20230518-monkhood-dispersal-6749b1228b0d@spud>
 <20230530-duller-reset-a34ae111f207@wendy>
 <20230608191537.GA3233857-robh@kernel.org>
 <20230608-cobbler-giving-e0fac2185e11@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RnjcFuwrw0FxHlVc"
Content-Disposition: inline
In-Reply-To: <20230608-cobbler-giving-e0fac2185e11@spud>
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


--RnjcFuwrw0FxHlVc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Rob,
Before I press on with more versions...

On Thu, Jun 08, 2023 at 08:30:28PM +0100, Conor Dooley wrote:
> On Thu, Jun 08, 2023 at 01:15:37PM -0600, Rob Herring wrote:
> > On Tue, May 30, 2023 at 03:12:12PM +0100, Conor Dooley wrote:
> > > On Thu, May 18, 2023 at 10:42:34PM +0100, Conor Dooley wrote:
> > > > On Thu, May 18, 2023 at 02:30:53PM -0400, Sean Anderson wrote:
> > >=20
> > > > >=20
> > > > > Why not just have something like
> > > > >=20
> > > > > mycpu {
> > > > > 	...
> > > > > 	riscv,isa {
> > > > > 		i;
> > > > > 		m;
> > > > > 		a;
> > > > > 		zicsr;
> > > > > 		...
> >=20
> > I prefer property names be globally unique. The tools are geared toward=
s=20
> > that too. That's largely a symptom of having 0 type information in the=
=20
> > DT.
> >=20
> > For example if you had an extension called 'reg', it would be a problem.
>=20
> Per the current ISA rules, that'd not be valid. But then again, I do
> have trust issues & it's not like "reg" is the only property name in DT
> land.

=2E..you say "prefer" here. Is that a NAK, or a "you keep the pieces"?

--RnjcFuwrw0FxHlVc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIeM5gAKCRB4tDGHoIJi
0uzcAQDu/tJVEgDQEG2BFIFoTPaZznrjs1Il4oaLCWo/dTGTigEAtYV2jXPQafdF
DrSPBnySqez+fzXzA9+5KTRu5WWsKg8=
=Olcx
-----END PGP SIGNATURE-----

--RnjcFuwrw0FxHlVc--

