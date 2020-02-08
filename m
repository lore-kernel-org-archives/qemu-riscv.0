Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j0MNN-0005iO-6e
	for mharc-qemu-riscv@gnu.org; Sat, 08 Feb 2020 04:26:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60414)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j0MNH-0005cY-IE
 for qemu-riscv@nongnu.org; Sat, 08 Feb 2020 04:26:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j0MNF-0000co-W4
 for qemu-riscv@nongnu.org; Sat, 08 Feb 2020 04:26:03 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:51479)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j0MN8-0000AP-2P; Sat, 08 Feb 2020 04:25:54 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48F6Gd14Jmz9sRQ; Sat,  8 Feb 2020 20:25:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1581153945;
 bh=r+blSt+gMTT0l3Fqb80kumKkw0Qr+nw52mxUGcmjdLs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C50/9k/I6XlELynQg1+xs8wT902B6JdfaUN/JvUgAoP8c3ko7fXzbSSlUn7V7v7OD
 36NW5VNoycSuLtkhKk1pTAgjj6setglmyQ+uLzqFTYvCSOYki6JWH9Y2GLAVJo1yiA
 sGaeKVvXIBEyi4yaGjrzB7hKVfzKFJuWkS90QAoc=
Date: Sat, 8 Feb 2020 20:23:12 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, qemu-ppc@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Anthony Green <green@moxielogic.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, qemu-trivial@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-riscv@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Marek Vasut <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Walle <michael@walle.cc>, Halil Pasic <pasic@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-s390x@nongnu.org, Richard Henderson <rth@twiddle.net>,
 Thomas Huth <huth@tuxfamily.org>, Magnus Damm <magnus.damm@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Chris Wulff <crwulff@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Helge Deller <deller@gmx.de>, Alistair Francis <Alistair.Francis@wdc.com>,
 Jia Liu <proljc@gmail.com>
Subject: Re: [PATCH v4 1/3] hw: Do not initialize MachineClass::is_default to 0
Message-ID: <20200208092312.GB219689@umbus.fritz.box>
References: <20200207161948.15972-1-philmd@redhat.com>
 <20200207161948.15972-2-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eAbsdosE1cNLO4uF"
Content-Disposition: inline
In-Reply-To: <20200207161948.15972-2-philmd@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
X-List-Received-Date: Sat, 08 Feb 2020 09:26:05 -0000


--eAbsdosE1cNLO4uF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 07, 2020 at 05:19:46PM +0100, Philippe Mathieu-Daud=E9 wrote:
> The MachineClass is already zeroed on creation.
>=20
> Note: The code setting is_default=3D0 in hw/i386/pc_piix.c is
>       different (related to compat options). When adding a
>       new versioned machine, we want it to be the new default,
>       so we have to mark the previous one as not default.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
> v3: new patch
> ---
>  hw/lm32/lm32_boards.c               | 1 -
>  hw/lm32/milkymist.c                 | 1 -
>  hw/m68k/q800.c                      | 1 -
>  hw/microblaze/petalogix_ml605_mmu.c | 1 -
>  hw/tricore/tricore_testboard.c      | 1 -
>  5 files changed, 5 deletions(-)
>=20
> diff --git a/hw/lm32/lm32_boards.c b/hw/lm32/lm32_boards.c
> index d1894adab8..156b050abc 100644
> --- a/hw/lm32/lm32_boards.c
> +++ b/hw/lm32/lm32_boards.c
> @@ -302,7 +302,6 @@ static void lm32_uclinux_class_init(ObjectClass *oc, =
void *data)
> =20
>      mc->desc =3D "lm32 platform for uClinux and u-boot by Theobroma Syst=
ems";
>      mc->init =3D lm32_uclinux_init;
> -    mc->is_default =3D 0;
>      mc->default_cpu_type =3D LM32_CPU_TYPE_NAME("lm32-full");
>  }
> =20
> diff --git a/hw/lm32/milkymist.c b/hw/lm32/milkymist.c
> index 6d46134232..9fa5fd7050 100644
> --- a/hw/lm32/milkymist.c
> +++ b/hw/lm32/milkymist.c
> @@ -214,7 +214,6 @@ static void milkymist_machine_init(MachineClass *mc)
>  {
>      mc->desc =3D "Milkymist One";
>      mc->init =3D milkymist_init;
> -    mc->is_default =3D 0;
>      mc->default_cpu_type =3D LM32_CPU_TYPE_NAME("lm32-full");
>  }
> =20
> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
> index 1e32363688..788b5d663f 100644
> --- a/hw/m68k/q800.c
> +++ b/hw/m68k/q800.c
> @@ -441,7 +441,6 @@ static void q800_machine_class_init(ObjectClass *oc, =
void *data)
>      mc->init =3D q800_init;
>      mc->default_cpu_type =3D M68K_CPU_TYPE_NAME("m68040");
>      mc->max_cpus =3D 1;
> -    mc->is_default =3D 0;
>      mc->block_default_type =3D IF_SCSI;
>  }
> =20
> diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogi=
x_ml605_mmu.c
> index 09486bc8bf..0a2640c40b 100644
> --- a/hw/microblaze/petalogix_ml605_mmu.c
> +++ b/hw/microblaze/petalogix_ml605_mmu.c
> @@ -216,7 +216,6 @@ static void petalogix_ml605_machine_init(MachineClass=
 *mc)
>  {
>      mc->desc =3D "PetaLogix linux refdesign for xilinx ml605 little endi=
an";
>      mc->init =3D petalogix_ml605_init;
> -    mc->is_default =3D 0;
>  }
> =20
>  DEFINE_MACHINE("petalogix-ml605", petalogix_ml605_machine_init)
> diff --git a/hw/tricore/tricore_testboard.c b/hw/tricore/tricore_testboar=
d.c
> index 20c9ccb3ce..8ec2b5bddd 100644
> --- a/hw/tricore/tricore_testboard.c
> +++ b/hw/tricore/tricore_testboard.c
> @@ -105,7 +105,6 @@ static void ttb_machine_init(MachineClass *mc)
>  {
>      mc->desc =3D "a minimal TriCore board";
>      mc->init =3D tricoreboard_init;
> -    mc->is_default =3D 0;
>      mc->default_cpu_type =3D TRICORE_CPU_TYPE_NAME("tc1796");
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--eAbsdosE1cNLO4uF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4+ff0ACgkQbDjKyiDZ
s5LESQ//cu63O7zJyFo91eWqY0SwiqaAgIQYRAmUbvpgYYyOiFuMdd0x6n5sDE7k
iw2TM0yEr9sLTIRLZdjwy4fmYOokYtMCMFnj8vUm4OitH5Zh0u3k4l0qSrfql8Bu
//OWFdQ0XgUzekZ6Li+PR3CGfmwGyHw3fF0umwB2kuW82yYX953JKXBEZNMZxC+e
79dzUH0lkuhOA5gubruv7IZVA9q4Ru15CnEBPIcovTzC2aT60mwdaZskIj90gZ/t
OTc6B6dNGEnnMSQTR15ct8xgrTDWQPSso5Pk8Qb0RHJLdeiZl7pe1aEbOtO+03oW
ItPAZroDInxdICfRuBWO6FfdS3KSqkYswuhw3IERXQf3yswtdVtIW6EoXRtUVd5r
yMrdUP7dZRYWm41C8dDJtOaatt5I6UD477q6RhTPnLsstOA2TqgGjKG5CmQyaGAn
hgKgpr4YnIIAI50AHRLusldIB1D8tGJky1kVh6tIf8bGoWnOvCg/Q0Oej5pgdcXN
iuguXTHa0Pi3ZRsrYaY03C5n9GVI2NXc1R/JPqf0KVj+sibKMp6PNpqUnNk7oAdW
LwzKdefVjcN2+2xV8DNswbsyDpMhldKyNWZRgFd5XHbbooMPejLLkJIo49OveAFb
jE4OiAea3K/DizlZYfp29WuQ7Ax2K293KMlVa9DovyyGCPBoI8I=
=fuqq
-----END PGP SIGNATURE-----

--eAbsdosE1cNLO4uF--

