Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liTir-00024O-SY
	for mharc-qemu-riscv@gnu.org; Sun, 16 May 2021 23:15:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1liTim-00020U-AK; Sun, 16 May 2021 23:15:08 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:54941 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1liTik-0007KS-Fo; Sun, 16 May 2021 23:15:08 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fk44k575zz9sSn; Mon, 17 May 2021 13:15:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621221302;
 bh=eiDrXPm4IHYAISxs9UtFBtljxgwihKw1TuRwK3w/kuU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hgpq3x9F+NuyXlnJEDlJ6SDzujIrijBGeGPpdfqtL76GB8GWmjpcxG/UWqvl+o5fs
 XkCGS77D3HfitlYyPOhhIOvZ/RK8KEz5zTCPNFvGqUaMfD+YiP3dk20rd4BMye1MYY
 z3129RWBcvqdFxMwqSyzzbuWBAVQP47rsRR5otZg=
Date: Mon, 17 May 2021 13:14:52 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2 12/12] hw/ppc/Kconfig: Add dependency PEGASOS2 ->
 ATI_VGA
Message-ID: <YKHfrLI4SHAcXy6c@yekko>
References: <20210515173716.358295-1-philmd@redhat.com>
 <20210515173716.358295-13-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="b4ECZyMNrk5Dz1Dc"
Content-Disposition: inline
In-Reply-To: <20210515173716.358295-13-philmd@redhat.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 17 May 2021 03:15:11 -0000


--b4ECZyMNrk5Dz1Dc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 15, 2021 at 07:37:16PM +0200, Philippe Mathieu-Daud=E9 wrote:
> From: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>=20
> While the ATI VGA device isn't a requisite (no crash without it):
>=20
>   $ qemu-system-ppc -M pegasos2
>   qemu-system-ppc: standard VGA not available
>=20
> it is useful to have it with the Pegasos2 machine:
>=20
>   $ qemu-system-ppc -M pegasos2 -vga none -bios pegasos2.rom -device ati-=
vga,romfile=3D
>   qemu-system-ppc: -device ati-vga,romfile=3D: 'ati-vga' is not a valid d=
evice model name
>=20
> Add it as an implicit Kconfig dependency.
>=20
> Fixes: ba7e5ac18e7 ("hw/ppc: Add emulation of Genesi/bPlan Pegasos II")
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index 2e4c56eb770..e36db08665a 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -77,6 +77,7 @@ config PEGASOS2
>      select SMBUS_EEPROM
>  # This should come with VT82C686
>      select ACPI_X86
> +    imply ATI_VGA
> =20
>  config PREP
>      bool

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--b4ECZyMNrk5Dz1Dc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCh36wACgkQbDjKyiDZ
s5Kzxg/9E/inCikE/YSNJ0qdL6YVCdCX4MvLXtZnkT7VO3FLdK8nSpzHKTKOf9Ft
qmMRpEtfx3t4WGon0vRH85OS/3MiOB6VL1Kih5eZmJydA1Gy/dAFeDkx8Mdd7ycx
92Eg11d6pYmEpwvIAgEuTBM2clcBJG5UH50LbOeBPp9znKaACoFDWkj8oSHk4+0F
/oo4AaUmAPbGY8KC1E0Q8rtWGTkzoA0TNDZ0mOIMGtxmoBalANRzDogOXN5MZI1C
9kq63YC4NTdpZCoI5qNNClztHMVjxsUDnfdl/W+9qHl8MqRUe0Q4jDZuGrMfwsGB
5Ce/sDlbVyDArh4dVBpz6IFg9LbRD5Tf8SL+OQLoWpJbUS/liD5VNKg46HxrCZas
ZdxGfwfbDqsjuqv3/O/GO3GhWyg1o6bkvkzzKCd1T66PWnbLp38ogdbveY6UzNqM
lWoWRGd0ksMrbEwtFI/UKYl1rUsPGX1dfFbnB1D4g5113E7VZ0CxcyFx06D6gGJc
AbuhJvh0+qCUlrEEYE19GUOvZg2/8f4xfATujuETrhj5qCIwOZetyHaoP3M8dcpo
nsGI7IvrcDvGJpRw+s4D43ZhpBp0JSslaqVBgXGNVjUEzJp8LVfuKy9nYNe0sY8f
mgVYRTEHXjhkloyLkFWLxsSyTl8FttODtI/3i9yTYUAJv9ssOXs=
=tUaj
-----END PGP SIGNATURE-----

--b4ECZyMNrk5Dz1Dc--

