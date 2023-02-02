Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNdLQ-0003ft-HQ
	for mharc-qemu-riscv@gnu.org; Thu, 02 Feb 2023 12:25:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1pNdLI-0003bT-Gu; Thu, 02 Feb 2023 12:25:48 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1pNdLG-0004ra-Ch; Thu, 02 Feb 2023 12:25:47 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6630561A02;
 Thu,  2 Feb 2023 17:25:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCCF6C433EF;
 Thu,  2 Feb 2023 17:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675358741;
 bh=X5DP7u3+sximFj2iHjts/49g7CXyDYTvEh9oALT1iSY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ebXltQMmsqiw16u7UhfMXpLpJuhbsLkWmh39ZKp2icld3lS6ZmpsBVgm5UeNBQ0r0
 PM7f7hxJfTTuTUDIZt6iZzElMsa2Xw1Xl6ZJP2DLWzpsXpduewyZs6E72QY1/nkJ1R
 SsMFxKUYFJ1lOSUkqgLNe2MTXGNxuVqJDJB/UyDSyrCzKOcLORK3NFEfoZDxuC7RN+
 G5m/sSHTn+2BLGlqJeOBeLsW+ziTVeubJo/BGPoZPBS0k6TsTD+JLAnR7kNBSeULIJ
 nmVsaGAYp5/izVWVvqLuiamrbu0063Fa5YTEZ4+m3Laq7JXo94HQfHx4W0SoGf4dlh
 TKHSXDfp72Qmg==
Date: Thu, 2 Feb 2023 17:25:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
Subject: Re: [PATCH v10 0/3] hw/riscv: handle kernel_entry high bits with
 32bit CPUs
Message-ID: <Y9vyEp8ghrbqssJO@spud>
References: <20230202135810.1657792-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3zvu0ipAdxYHGifO"
Content-Disposition: inline
In-Reply-To: <20230202135810.1657792-1-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=139.178.84.217; envelope-from=conor@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 02 Feb 2023 17:25:53 -0000


--3zvu0ipAdxYHGifO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 02, 2023 at 10:58:07AM -0300, Daniel Henrique Barboza wrote:
> Hi,
>=20
> This new version removed the translate_fn() from patch 1 because it
> wasn't removing the sign-extension for pentry as we thought it would.
> A more detailed explanation is given in the commit msg of patch 1.
>=20
> We're now retrieving the 'lowaddr' value from load_elf_ram_sym() and
> using it when we're running a 32-bit CPU. This worked with 32 bit
> 'virt' machine booting with the -kernel option.
>=20
> If this approach doesn't work for the Xvisor use case, IMO  we should
> just filter kernel_load_addr bits directly as we were doing a handful of
> versions ago.
>=20
> Patches are based on current riscv-to-apply.next.=20
>=20
> Changes from v9:
> - patch 1:
>   - removed the translate_fn() callback
>   - return 'kernel_low' when running a 32-bit CPU
> - v9 link: https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg04509=
=2Ehtml

I think my T-b got lost last time around, but I gave this version a
whirl too & things are working for me as they were before on Icicle.
For the series:
Tested-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>=20
> Daniel Henrique Barboza (3):
>   hw/riscv: handle 32 bit CPUs kernel_addr in riscv_load_kernel()
>   hw/riscv/boot.c: consolidate all kernel init in riscv_load_kernel()
>   hw/riscv/boot.c: make riscv_load_initrd() static
>=20
>  hw/riscv/boot.c            | 96 +++++++++++++++++++++++---------------
>  hw/riscv/microchip_pfsoc.c | 12 +----
>  hw/riscv/opentitan.c       |  4 +-
>  hw/riscv/sifive_e.c        |  4 +-
>  hw/riscv/sifive_u.c        | 12 +----
>  hw/riscv/spike.c           | 14 ++----
>  hw/riscv/virt.c            | 12 +----
>  include/hw/riscv/boot.h    |  3 +-
>  8 files changed, 76 insertions(+), 81 deletions(-)
>=20
> --=20
> 2.39.1
>=20
>=20

--3zvu0ipAdxYHGifO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9vyDgAKCRB4tDGHoIJi
0nonAP4m3U9ASVSJsW8dWMKhJ5SH+QqyiBQI+fcrZBNwQ3CzRwEAm/f5wca1FSkC
oShRfY022F6soY9oun+Q6yLEmmu5Iw0=
=yao7
-----END PGP SIGNATURE-----

--3zvu0ipAdxYHGifO--

