Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6O1c-0001DD-BC
	for mharc-qemu-riscv@gnu.org; Mon, 24 Feb 2020 19:24:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52533)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j6O1Z-00015p-7P
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 19:24:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j6O1Y-0000Po-4R
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2020 19:24:33 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:36027 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j6O1N-0000Iv-L5; Mon, 24 Feb 2020 19:24:21 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48RKS00vBDz9sPk; Tue, 25 Feb 2020 11:24:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1582590256;
 bh=cun3UG0RH1Z9pqffGg41V0R5H4abPrUo0JHVCdwl8DM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d6NhK1hYXytACCdz50B0nIeq/pqkhsGd9Cf4y/mFfwuua8B8tNulEvn1q6IHWfhkx
 h6uWw/oUL++nq3fSHxWM/g9cH3oKEBM8m8G+uNe1FFyjYknckA5CcLy38hzzMnIMtn
 Y+aT9dz84IxlX7OLrT9CbyTe8PBYED7vp2S5MasQ=
Date: Tue, 25 Feb 2020 11:23:23 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-block@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Joel Stanley <joel@jms.id.au>, qemu-ppc@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Magnus Damm <magnus.damm@gmail.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Jason Wang <jasowang@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Chubb <peter.chubb@nicta.com.au>, Max Reitz <mreitz@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 qemu-arm@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Michael Walle <michael@walle.cc>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-riscv@nongnu.org, Fabien Chouteau <chouteau@adacore.com>
Subject: Re: [PATCH RESEND v2 10/32] hw/pci-host: Use
 memory_region_init_rom() with read-only regions
Message-ID: <20200225002323.GB41629@umbus.fritz.box>
References: <20200224205533.23798-1-philmd@redhat.com>
 <20200224205533.23798-11-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PmA2V3Z32TCmWXqI"
Content-Disposition: inline
In-Reply-To: <20200224205533.23798-11-philmd@redhat.com>
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
X-List-Received-Date: Tue, 25 Feb 2020 00:24:34 -0000


--PmA2V3Z32TCmWXqI
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2020 at 09:55:11PM +0100, Philippe Mathieu-Daud=E9 wrote:
> This commit was produced with the Coccinelle script
> scripts/coccinelle/memory-region-housekeeping.cocci.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/pci-host/prep.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
> index 1aff72bec6..1a02e9a670 100644
> --- a/hw/pci-host/prep.c
> +++ b/hw/pci-host/prep.c
> @@ -325,9 +325,8 @@ static void raven_realize(PCIDevice *d, Error **errp)
>      d->config[0x0D] =3D 0x10; // latency_timer
>      d->config[0x34] =3D 0x00; // capabilities_pointer
> =20
> -    memory_region_init_ram_nomigrate(&s->bios, OBJECT(s), "bios", BIOS_S=
IZE,
> -                           &error_fatal);
> -    memory_region_set_readonly(&s->bios, true);
> +    memory_region_init_rom_nomigrate(&s->bios, OBJECT(s), "bios", BIOS_S=
IZE,
> +                                     &error_fatal);
>      memory_region_add_subregion(get_system_memory(), (uint32_t)(-BIOS_SI=
ZE),
>                                  &s->bios);
>      if (s->bios_name) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PmA2V3Z32TCmWXqI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5UaPsACgkQbDjKyiDZ
s5Jz/BAAyL0YcNW8OyEoEcaBBOAUlpAd/mqoO8OMFJMygGZtJ4Sgqi7l2Z6uC0I7
G22idvtISCYsuylCjvkVJg96QHuXGdnMyBR+g8CvU4lZcYkBKAD2d0mK2LYzq32q
89TdYgtkHZl5fQQf2zLkdqJqzfBIjFQ7/v5tEAvirPgdfX0Vpj7r/AEIxTgfXmh3
6RojUYtqB1iWjLF7AJi4LY0ZPdR5d+Ia2+Uz7tTQPnc6bPKeYS+dWmHkkQV8IWrH
TLfAnmtOQ+hH1RBXTb0TvPhYP0AIjcdaG9ZKyE1X/JLmvnjZcSU5okOv2RMY26D5
RhyJf0Z6V7rN6Y/FFapF6hML0hE9zqJMm11s3yq1IG3LH8ZmFrBJu8YB8+nDbtuk
p/vhuFjoGHuKwadYD4Q63iYvCJIJIQZkgXB0I1m32sMF16M8Y4DM8N1Tticaa37E
f4EWX0Sn/Jadxah62JUNPrHpqHLo4MaS2YWpR4+mc/MlAhVOyony5viRqQeuLlKq
apJILrBlbOsZ73Fd/zdwwgyYLAwuZ1TC2DxxJayjBKDdc5aAAtmnrD+aQnZQSnum
qu2AGC53z2+bpNQ5gKJz4IjXYi/DrOGEw42VPArpa+B366Sbn0g0DNiE2bGsoUXl
KgWAg1Q31OLCf4Rb1RGJvLd8mes5SNwiHdSmqISZE9nBs5L7Wp8=
=g5T0
-----END PGP SIGNATURE-----

--PmA2V3Z32TCmWXqI--

