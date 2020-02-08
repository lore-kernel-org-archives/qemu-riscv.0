Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j0MNI-0005fX-V0
	for mharc-qemu-riscv@gnu.org; Sat, 08 Feb 2020 04:26:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60400)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j0MNG-0005aC-LP
 for qemu-riscv@nongnu.org; Sat, 08 Feb 2020 04:26:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j0MNF-0000cP-Ek
 for qemu-riscv@nongnu.org; Sat, 08 Feb 2020 04:26:02 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:54295 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j0MN8-0000A0-2O; Sat, 08 Feb 2020 04:25:54 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48F6Gd20KLz9sPK; Sat,  8 Feb 2020 20:25:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1581153945;
 bh=6RR1AqCdojKlRABvWytA0f8y/htSmvLgvdjGZEwETaE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ijcn8Lloc36esWOFlceEhewFluWObCk8bzULPpfjAzT76Qr+B2MjivWp+5nF0KosD
 o+b+Fv0ErKZQ1zcQggp2UMFT13b1F2Tjf20xc7l7I/k7bBxIxguF3yZtGWUI0nEeCo
 2hoa8PGCObleLRkvV7PHHpMpMjJCUAG/te9F4MBw=
Date: Sat, 8 Feb 2020 20:25:36 +1100
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
 Jia Liu <proljc@gmail.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v4 3/3] vl: Abort if multiple machines are registered as
 default
Message-ID: <20200208092536.GD219689@umbus.fritz.box>
References: <20200207161948.15972-1-philmd@redhat.com>
 <20200207161948.15972-4-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2iBwrppp/7QCDedR"
Content-Disposition: inline
In-Reply-To: <20200207161948.15972-4-philmd@redhat.com>
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
X-List-Received-Date: Sat, 08 Feb 2020 09:26:04 -0000


--2iBwrppp/7QCDedR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 07, 2020 at 05:19:48PM +0100, Philippe Mathieu-Daud=E9 wrote:
> It would be confusing to have multiple default machines.
> Abort if this ever occurs.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
> v2: Use assert() instead of human friendly message (Marc-Andr=E9)
> v3: Move the check to find_machine() (Michael)
>=20
> Cc: Marc-Andr=E9 Lureau <marcandre.lureau@gmail.com>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> ---
>  vl.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/vl.c b/vl.c
> index 7dcb0879c4..ebc203af0d 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -1184,16 +1184,18 @@ static MachineClass *find_machine(const char *nam=
e, GSList *machines)
>  static MachineClass *find_default_machine(GSList *machines)
>  {
>      GSList *el;
> +    MachineClass *default_machineclass =3D NULL;
> =20
>      for (el =3D machines; el; el =3D el->next) {
>          MachineClass *mc =3D el->data;
> =20
>          if (mc->is_default) {
> -            return mc;
> +            assert(default_machineclass =3D=3D NULL && "Multiple default=
 machines");
> +            default_machineclass =3D mc;
>          }
>      }
> =20
> -    return NULL;
> +    return default_machineclass;
>  }
> =20
>  static int machine_help_func(QemuOpts *opts, MachineState *machine)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--2iBwrppp/7QCDedR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4+fpAACgkQbDjKyiDZ
s5KqoQ//b5icTjA+cBYQdVG7nS2yLMmcdrJyAOdFBPIEZ4DTV94zEbZMriYCZTfQ
YdDEIjK6vBFxaD98Br+VqXDuBCj4UuR+EUgiRtEmeRZQ5bIN/T1Bf85imSNBzwiP
/2b/wLoVOt0I0f15qC0fPZejL91/XXtrut9jbSzPb82H6qvNJMfGWHQg20ZensOV
cNJ9dsPIrKCJGuYCk9KHUnDdeuT+jNfcjaBg19zlZHWB9LuYJi3y1ulI0s15akcW
EptBKiQ+KicBfyXoHsa5SCYIa31tL9GR0sBgbDMCvE6TfbGILUzF5g8rJ924gnQu
nD4Ae+OAZNP5HVPsNKbwTrCPDc+bQTGxKIZeK8Yq95I1OTzJYFCQVaF0VBeLP6jm
JwIWNOSWHAjUtUW0+LLEsKx/f+1+xMOq9BdeI/9IajymvhusNL4S38FcGd/T8iRV
sQ1bqXm3ZuB/XcEbXeIttksC1XZyBF5tA4Ds6qCR4gzYNkspEzVLffe4lpE4Flkp
ePzhYeANFx7nc/uvi7OBD2hZjUIQXGFpnXFa/bSP5Nnle5EmUvZdtU8JSAAktjHr
pn2BsaTifAn4bvhdBaLekQEyhdlG67zRtO3Y3h5isKSmSrnw3POnEJ1PIA7GPOM6
dLAtEDZOzOh2a2d6OrlS+VQC6n2JPgiIAR5EuXSqnWYuFwhVBqU=
=rtQm
-----END PGP SIGNATURE-----

--2iBwrppp/7QCDedR--

