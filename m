Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CFCEB64D7
	for <qemu-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 17:51:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qDqMe-000884-D5; Mon, 26 Jun 2023 13:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>) id 1qDqM3-00084U-IN
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 13:50:27 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>) id 1qDqM0-0006vA-PZ
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 13:50:22 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AF68660F0F;
 Mon, 26 Jun 2023 17:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80599C433C8;
 Mon, 26 Jun 2023 17:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687801817;
 bh=s4nqEhUfqmqOPxDNx5EU+3Otzr9YMuFYasx7vWRTl7E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BUi3o0EUGax7OuYJDS2t1keD6ocU7m+LNpkHxmMX6C+bs9JlOACvcRkXqAxfYgb7P
 JK7UHHt8lcVq+ADNCujsH5eo4qhfWCQufbWhtJW7Zojw7WrQbZIt9Zzw7RT4CIpCl2
 sa1IN70Xv9F8Qpl2Gdw9U7ZfsE3dNjRtCe3tZx9XnBWI2eZQI0F4Gdy9DvIbS80RGd
 HKBUm4qzDoUr0JvVZey1UqzJgF4czdWf33ArnasCpYhtNp0V9Uh1ZnM5YHh63tDdE7
 oEFqynFE7kHhsW1acYcfSxYSa1jT8fZZA+WTziE89DucFONUqEwsBuCt5mqwVnhR0V
 0sx0FDWtERGfQ==
Date: Mon, 26 Jun 2023 18:50:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, palmer@dabbelt.com,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Atish Patra <atishp@atishpatra.org>,
 Jessica Clarke <jrtc27@jrtc27.com>, Rick Chen <rick@andestech.com>,
 Leo <ycliang@andestech.com>, Oleksii <oleksii.kurochko@gmail.com>,
 linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org,
 u-boot@lists.denx.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v3] dt-bindings: riscv: deprecate riscv,isa
Message-ID: <20230626-eliminate-grimy-b229724dc830@spud>
References: <20230626-unmarked-atom-70b4d624a386@wendy>
 <CAK9=C2UesoUCeb8k0DSCHi7Zr+B5U26KQ9oCs9map3a2zzYqAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="m57Jtotn9Env+EUp"
Content-Disposition: inline
In-Reply-To: <CAK9=C2UesoUCeb8k0DSCHi7Zr+B5U26KQ9oCs9map3a2zzYqAw@mail.gmail.com>
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


--m57Jtotn9Env+EUp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 26, 2023 at 11:08:43PM +0530, Anup Patel wrote:
> On Mon, Jun 26, 2023 at 3:42=E2=80=AFPM Conor Dooley <conor.dooley@microc=
hip.com> wrote:

> > acpi
> > =3D=3D=3D=3D
> >
> > The current ACPI ECR is based on having a single ISA string unfortunate=
ly,
> > but ideally ACPI will move to another method, perhaps GUIDs, that give
> > explicit meaning to extensions.
>=20
> Drop this paragraph on ACPI.

Sure.

--m57Jtotn9Env+EUp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJnP0wAKCRB4tDGHoIJi
0s8VAQCUTZ2Haqv+3bKnIWj5oQn4AdHRibKGwI2p8ygrlmJ+1gD8CvNs5ZjWLL3X
2Qo1nAeXl/D8F50sG29i3UXpjYBj5wM=
=7wbM
-----END PGP SIGNATURE-----

--m57Jtotn9Env+EUp--

