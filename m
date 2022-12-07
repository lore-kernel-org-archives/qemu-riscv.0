Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p2po6-0004r5-AZ
	for mharc-qemu-riscv@gnu.org; Wed, 07 Dec 2022 03:29:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1p2po4-0004qg-3K; Wed, 07 Dec 2022 03:29:32 -0500
Received: from ams.source.kernel.org ([145.40.68.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1p2po2-0007DK-6O; Wed, 07 Dec 2022 03:29:31 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D9FD1B8074C;
 Wed,  7 Dec 2022 08:29:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 304F9C433B5;
 Wed,  7 Dec 2022 08:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670401763;
 bh=DMcKk6bIK0ql1DMkSVpiC2h+8c892tw+BLBgFJ74zFE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vn0CFnGQaHHxxTrNRZH5mkkzzgjgCUl3fUSGHSuulpoam0R5LYrioudVJrcxwQ1L2
 31lz/xtIN8YYNxbaOUTYPMusQbO36Pnu8zbJUuwRWLwTnRVQSkPspsmwg5IjhIqlcQ
 jy8L/hTQC/hOXK0YyhZhGfnJIqkwlq/xYZ+nNhAkZu8zRrkf5b3L2juuRy3yEQbAHh
 guufuLSG0wymH1uEbPRf+5AuzJASHPIrTXk+cPeb+xVaLGQbMIrXPrDlzekkDOJgeb
 UEorApM4QpJct+n/e+ewiM/xuN3LBnOkmydnaMcWFbdpc4EviFDUfodJJQJUsFJ301
 1dnYVfHqUKsjA==
Date: Wed, 7 Dec 2022 08:29:19 +0000
From: Conor Dooley <conor@kernel.org>
To: Bin Meng <bmeng@tinylab.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: Re: [PATCH 09/15] hw/riscv: microchip_pfsoc: Fix the number of
 interrupt sources of PLIC
Message-ID: <Y5BO39xT91oj+q8c@spud>
References: <20221201140811.142123-1-bmeng@tinylab.org>
 <20221201140811.142123-9-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Ghc8nsIDADhHRmx5"
Content-Disposition: inline
In-Reply-To: <20221201140811.142123-9-bmeng@tinylab.org>
Received-SPF: pass client-ip=145.40.68.75; envelope-from=conor@kernel.org;
 helo=ams.source.kernel.org
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
X-List-Received-Date: Wed, 07 Dec 2022 08:29:32 -0000


--Ghc8nsIDADhHRmx5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 01, 2022 at 10:08:05PM +0800, Bin Meng wrote:
> Per chapter 6.5.2 in [1], the number of interupt sources including
> interrupt source 0 should be 187.
>=20
> [1] PolarFire SoC MSS TRM:
> https://ww1.microchip.com/downloads/aemDocuments/documents/FPGA/ProductDo=
cuments/ReferenceManuals/PolarFire_SoC_FPGA_MSS_Technical_Reference_Manual_=
VC.pdf

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Thanks!

>=20
> Fixes: 56f6e31e7b7e ("hw/riscv: Initial support for Microchip PolarFire S=
oC Icicle Kit board")
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---
>=20
>  include/hw/riscv/microchip_pfsoc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microc=
hip_pfsoc.h
> index a757b240e0..9720bac2d5 100644
> --- a/include/hw/riscv/microchip_pfsoc.h
> +++ b/include/hw/riscv/microchip_pfsoc.h
> @@ -150,7 +150,7 @@ enum {
>  #define MICROCHIP_PFSOC_MANAGEMENT_CPU_COUNT    1
>  #define MICROCHIP_PFSOC_COMPUTE_CPU_COUNT       4
> =20
> -#define MICROCHIP_PFSOC_PLIC_NUM_SOURCES        185
> +#define MICROCHIP_PFSOC_PLIC_NUM_SOURCES        187
>  #define MICROCHIP_PFSOC_PLIC_NUM_PRIORITIES     7
>  #define MICROCHIP_PFSOC_PLIC_PRIORITY_BASE      0x04
>  #define MICROCHIP_PFSOC_PLIC_PENDING_BASE       0x1000
> --=20
> 2.34.1
>=20
>=20
>=20

--Ghc8nsIDADhHRmx5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY5BO3wAKCRB4tDGHoIJi
0lCWAP9JWmovmKE763uJvggq41lOoyfmAz1He32aRYALbRHVBAEAk1s2D3bL1guN
/Otw/Coba0MJZ0QAJvI7UC/8A2nC1AU=
=klRN
-----END PGP SIGNATURE-----

--Ghc8nsIDADhHRmx5--

