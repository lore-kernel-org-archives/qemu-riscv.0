Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C22EB64DA
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Jul 2023 08:24:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLg09-0003ry-2l; Tue, 18 Jul 2023 04:24:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1qLg07-0003ri-GO; Tue, 18 Jul 2023 04:24:07 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1qLg05-0004vI-RF; Tue, 18 Jul 2023 04:24:07 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9517C61341;
 Tue, 18 Jul 2023 08:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56C69C433C8;
 Tue, 18 Jul 2023 08:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689668643;
 bh=e+jLmT7QNeeriktU/tIBKhPQlwHBu/kJoAe12vTjtCI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FlTjKF4nHtPk0WzpLbOWKs+T/piiib6wAVX2TVriQjQbWVlwwMH0wOdKO//CUNAwI
 AGpypCCcqsiMWhOlnXnQtd39tvoT/R31ZTLkyAQ7ULX3PMQ6/nz6R4gmBY8n744fz+
 OO8SuST9d1TBY63FMzjKnfW5fTiAnXsAxIH+76UP+8frB27Wq5dY7jVpSju8Ux1CgA
 vU68RIQLgX4/iIl0WNmJ6mvJ0tpgaVgYwR5bqCluo6Zm9c3qpbVfII6WNrNQtpDTaB
 KZm5R27ViwMvDy0saXQprnSXnW9Lrb4SPrKvR9EjcR8j3NwA+ARDj8o19K1q+lZeSI
 H5Ttv3HYsiJwA==
Date: Tue, 18 Jul 2023 09:23:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH for-8.2 0/2] target/riscv: add zicntr and zihpm flags
Message-ID: <20230718-freedom-subway-0b5d2083b474@spud>
References: <20230717215419.124258-1-dbarboza@ventanamicro.com>
 <20230717-snugly-pencil-98d62b254a74@spud>
 <2f123883-3064-28af-649f-2bbc8c52a60a@ventanamicro.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tm2idzwlOWRcHRMG"
Content-Disposition: inline
In-Reply-To: <2f123883-3064-28af-649f-2bbc8c52a60a@ventanamicro.com>
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


--tm2idzwlOWRcHRMG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 17, 2023 at 08:11:09PM -0300, Daniel Henrique Barboza wrote:
> On 7/17/23 19:33, Conor Dooley wrote:

> > On Mon, Jul 17, 2023 at 06:54:17PM -0300, Daniel Henrique Barboza wrote:
> > > Hi,
> > >=20
> > > I decided to include flags for both timer/counter extensions to make =
it
> > > easier for us later on when dealing with the RVA22 profile (which
> > > includes both).
> > >=20
> > > The features were already implemented by Atish Patra some time ago, b=
ut
> > > back then these 2 extensions weren't introduced yet. This means that,
> > > aside from extra stuff in riscv,isa FDT no other functional changes w=
ere
> > > made.
> > >=20
> > > Both are defaulted to 'true' since QEMU already implements both
> > > features, but the flag can be disabled if Zicsr isn't present or, in
> > > the case of zihpm, if pmu_num =3D 0.
> >=20
> > Out of curiosity, since you are allowing them to be disabled, how do you
> > intend to communicate to a guest that zicsr or zihpm are not present?
>=20
> At this point I'd say that existing guests are using other ways of checki=
ng
> if these timers and counters are available.

Or they just assume they're there as part of their baseline requirements
;)

> After this patches OSes can confirm
> if these timers are available via riscv,isa, but they can't assume that
> they are not available if riscv,isa doesn't display them.
>=20
> There's a chance that guests will continue ignoring these 2 extensions re=
gardless
> of whether the platform exposes them or not.
>=20
> >=20
> > > This means that,
> > > aside from extra stuff in riscv,isa FDT no other functional changes w=
ere
> > > made.
> >=20
> > This is barely a "functional" change either, as the presence of these
> > extensions has to be assumed, whether they appear in riscv,isa or not :/
>=20
> It's more of an organizational change for the sake of QEMU internals beca=
use the
> RVA22 profile happens to include zicntr and zihpm as mandatory extensions=
=2E It's
> easier to add the flags than to document why we're claiming RVA22 support=
 but
> aren't displaying these 2 in riscv,isa.

Possibly you should call out ACPI here too, since that does not suffer
=66rom the same issues as riscv,isa in DT, and putting zicntr/zihpm et al
in the ISA string there is needed.

--tm2idzwlOWRcHRMG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLZMHgAKCRB4tDGHoIJi
0o/TAQD18ERkZ7TKDHmu1TjNd0ztBLoIIzWuKSfyyVXlMwweNAD/UA+z+r+tor+T
VNFgDg4PQrPgldYTqBu1bgUu6gym7gI=
=0J0e
-----END PGP SIGNATURE-----

--tm2idzwlOWRcHRMG--

