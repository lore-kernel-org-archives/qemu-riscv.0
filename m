Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E052BC001B0
	for <qemu-riscv@archiver.kernel.org>; Sat,  1 Jul 2023 11:26:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qFYjp-0004Kl-LD; Sat, 01 Jul 2023 07:26:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>) id 1qFYjp-0004Kd-4i
 for qemu-riscv@nongnu.org; Sat, 01 Jul 2023 07:26:01 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>) id 1qFYjn-0007DU-En
 for qemu-riscv@nongnu.org; Sat, 01 Jul 2023 07:26:00 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A398D60B52;
 Sat,  1 Jul 2023 11:25:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 544AAC433C7;
 Sat,  1 Jul 2023 11:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688210757;
 bh=+x6m0cvYRRqSFpoP4GprjYx6gT0lhtmBKoDo81qBycI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FBK724BgCd2zXxc/AehUnet8tsxSUevHDljuSP6RqlyOah1mwVAsBIgpd4gl9LohU
 V/FgZq6n7w8DqXsKF+gY/tw3kIOVJvas5IlP8luOeBh5FkgoydwsQZdeZZcrT8PqJX
 qE4NOatGq0h9Mz5AixVFslEWhf/mOeM4Nda+UQs4V+8PPVq9bmDZwhrmz04k/XQNTA
 FtBnebK7EKccBOEbw0/JkkqhYQcJwpopOdJlRKRXuF1mAz3qHIN8S6Yblssf1Aamdl
 QiVOCVwE0bNK3E9ePX/vwKS0IPA88ZU3hshWQaNQljdYzkjakCKWmy7pgKY4/EzqIf
 NK88rPFtI+kQA==
Date: Sat, 1 Jul 2023 12:25:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: palmer@dabbelt.com, Conor Dooley <conor.dooley@microchip.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>,
 Jessica Clarke <jrtc27@jrtc27.com>, Rick Chen <rick@andestech.com>,
 Leo <ycliang@andestech.com>, Oleksii <oleksii.kurochko@gmail.com>,
 linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org,
 u-boot@lists.denx.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
 Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4] dt-bindings: riscv: deprecate riscv,isa
Message-ID: <20230701-pencil-predefine-3f8a2bc2b889@spud>
References: <20230630-very-greedless-16522d7b7830@spud>
 <20230701-b348653e432924f090c513db@orel>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+9VGfXQGZ6FfDNJx"
Content-Disposition: inline
In-Reply-To: <20230701-b348653e432924f090c513db@orel>
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


--+9VGfXQGZ6FfDNJx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 01, 2023 at 01:01:40PM +0200, Andrew Jones wrote:
> On Fri, Jun 30, 2023 at 07:04:04PM +0100, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> ...
> > +oneOf:
> > +  - required:
> > +      - riscv,isa
> > +  - required:
> > +      - riscv,isa-base
> > +
>=20
> I guess this means a DT must have either isa or isa-base, but not both.
> What should QEMU and other platforms which want to provide DTs that work
> for older kernels, but also start using the new schema do? I'd guess
> they'd like to provide both, where they'd expect isa-base to be used by
> newer kernels and isa by the old.

Sure, is just s/oneOf/anyOf/.

--+9VGfXQGZ6FfDNJx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKANPgAKCRB4tDGHoIJi
0kSxAP0c3x3Cd0SVAM/6s3YkdDjlEZuy4M3AWjQUW+T9v+oGOQD/ZF2BeCgQo9tN
OlycxibdtZ5wGfZzEsJ7zuE42+qwNAE=
=iqnd
-----END PGP SIGNATURE-----

--+9VGfXQGZ6FfDNJx--

