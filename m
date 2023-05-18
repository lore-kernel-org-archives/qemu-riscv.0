Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F915C7EE23
	for <qemu-riscv@archiver.kernel.org>; Thu, 18 May 2023 17:06:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pzh5L-0003je-6q; Thu, 18 May 2023 13:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>) id 1pzh5J-0003jC-1x
 for qemu-riscv@nongnu.org; Thu, 18 May 2023 13:06:37 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>) id 1pzh5G-0007Ra-9q
 for qemu-riscv@nongnu.org; Thu, 18 May 2023 13:06:36 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6AAD560EFA;
 Thu, 18 May 2023 17:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2548DC433D2;
 Thu, 18 May 2023 17:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684429590;
 bh=XL8Q8LxpeG+xUSW+d2Fhz16+YABT67r3plx3O+Y35ag=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SYDwNwjeRfNEkfoyIRyJq3Fohsc3ZIt3WbvX+OQ++ceTWjibgZ24NbiSU4vfGEufv
 E7/MG8tjVbYn8mfTzAqH4bsSYhCAPy4wioXysSz9c9jyKzRIwkWR4YFCfxF+QkoWHa
 SjilsAYEF5gzcKD+jg9x90stMTD6SLJsxPxhPjJZW0StGE3IfSLuaGFwHOy8eBK4OM
 i59muo8WKsAEN4/0QTZOrGqA5Hx1JqDnrSJpknH+axhqo4xWAcFso0ezUz0FDXuSnL
 xP1/Z3FypEnI8MGE/wgMHsOmzfJ6SUoZ43dLzibDtQNclaBobAMq0a6Jey31YekcNb
 7Uu1mISU27XeQ==
Date: Thu, 18 May 2023 18:06:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, anup@brainfault.org,
 ajones@ventanamicro.com, Paul Walmsley <paul.walmsley@sifive.com>,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 apatel@ventanamicro.com, atishp@atishpatra.org, jrtc27@jrtc27.com,
 rick@andestech.com, ycliang@andestech.com,
 linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org,
 u-boot@lists.denx.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: riscv: deprecate riscv,isa
Message-ID: <20230518-elective-mossy-1bf147f5e9b8@spud>
References: <20230518-hammock-doornail-478e8ea8e6a7@wendy>
 <mhng-95b99ff5-9024-4672-bb84-7599f7a05129@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TKxZvzqyNscVPD5H"
Content-Disposition: inline
In-Reply-To: <mhng-95b99ff5-9024-4672-bb84-7599f7a05129@palmer-ri-x1c9>
Received-SPF: pass client-ip=139.178.84.217; envelope-from=conor@kernel.org;
 helo=dfw.source.kernel.org
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


--TKxZvzqyNscVPD5H
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 07:41:17AM -0700, Palmer Dabbelt wrote:
> On Thu, 18 May 2023 07:06:17 PDT (-0700), Conor Dooley wrote:
> > On Thu, May 18, 2023 at 07:13:15PM +0530, Anup Patel wrote:
> > > On Thu, May 18, 2023 at 4:02=E2=80=AFPM Andrew Jones <ajones@ventanam=
icro.com> wrote:
> > > > On Thu, May 18, 2023 at 09:58:30AM +0100, Conor Dooley wrote:

> > > One downside of this new approach is it will increase the size of DTB.
> > > Imaging 50 such DT properties in 46 CPU DT nodes.
> >=20
> > I should do a comparison between 50 extensions in riscv,isa and doing
> > this 50 times and see what the sizes are.
>=20
> I'm not sure how sensitive people are to DT size (presumably it'd be DTB
> size)?
>=20
> It's also not clear what we can do about it: RISC-V has lots of extension=
s,
> that's going to take encoding space.  Sticking with an ambiguous encoding
> because it's smaller seems like a way to get burned in the long run.

I did actually go an look at this. I cheated a little and renamed the
properties to "riscv,isa-ext-foo", which is about as communicative IMO
as the longer name I currently have, but may seem more agreeable to the
size conscious.
I added 30 cpu nodes to mpfs.dtsi, each with 100 extensions of 6 chars
long. With just the string, containing "rv64imafdc_zabcde_...", it was
unreadable, but "only" took up 46k.
I then removed the multiletter extensions from riscv,isa & switched to
riscv,isa-base & 100 booleans. IMO it was more readable (although still
quite bad!), but took up 62k.
Removing all of the boolean properties, leaving me with 30 addtional harts
with "rv64imafdc" only, was 26k.

I think the generic limit for dtb files is 2 MiB? To me the size
increase doesn't sound like a bit problem.

--TKxZvzqyNscVPD5H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGZbEAAKCRB4tDGHoIJi
0s2UAQC3dbtneTDqOvEpuMHz7vzTT/qCO/nEAhYVxRjH0MasoQD+IWeuh0pZj7Y/
NPtfbaq3ryBkiGdWFoAC2ls1S9xcNAo=
=0mwD
-----END PGP SIGNATURE-----

--TKxZvzqyNscVPD5H--

