Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jHGXY-0004Cu-17
	for mharc-qemu-riscv@gnu.org; Wed, 25 Mar 2020 20:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43910)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1jHGXT-00041T-Ul
 for qemu-riscv@nongnu.org; Wed, 25 Mar 2020 20:38:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1jHGXS-0002Ul-Fk
 for qemu-riscv@nongnu.org; Wed, 25 Mar 2020 20:38:27 -0400
Received: from ozlabs.org ([203.11.71.1]:47609)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1jHGXI-0002AZ-1q; Wed, 25 Mar 2020 20:38:17 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48nmL764zfz9sSJ; Thu, 26 Mar 2020 11:38:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1585183087;
 bh=rnbisUE0+51ZDSwwrAFBRyx55pg8YOyD7931PC3jY+M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L7RyjwFuRdBd5mV/IcT43yhdylnT1POOaqXGQNRULPIx0mWazJMZ9oZPelM7MAodw
 zufWfEgzmO4aWK1f0mhVKuSlrpi6juYWoZM6JIafmlyke+rZQ17v5PPs6E1m47Axx3
 dkQSpgL2vk++0ODRqx+88TKFtUCN0OQsbaKpg4tk=
Date: Thu, 26 Mar 2020 10:55:16 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Paul Burton <pburton@wavecomp.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 Jason Wang <jasowang@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Richard Henderson <rth@twiddle.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH-for-5.0 10/12] hw/misc/macio/macio: Add missing
 error-propagation code
Message-ID: <20200325235516.GG36889@umbus.fritz.box>
References: <20200325191830.16553-1-f4bug@amsat.org>
 <20200325191830.16553-11-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cz6wLo+OExbGG7q/"
Content-Disposition: inline
In-Reply-To: <20200325191830.16553-11-f4bug@amsat.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
X-List-Received-Date: Thu, 26 Mar 2020 00:38:29 -0000


--cz6wLo+OExbGG7q/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2020 at 08:18:28PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Running the coccinelle script produced:
>=20
>   $ spatch \
>     --macro-file scripts/cocci-macro-file.h --include-headers \
>     --sp-file scripts/coccinelle/object_property_missing_error_propagate.=
cocci \
>     --keep-comments --smpl-spacing --dir hw
>=20
>   [[manual check required: error_propagate() might be missing in object_p=
roperty_set_bool() hw/misc/macio/macio.c:350:8]]
>=20
> Add the missing error_propagate() after manual review.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/misc/macio/macio.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
> index 79222192e8..fffb64a7d5 100644
> --- a/hw/misc/macio/macio.c
> +++ b/hw/misc/macio/macio.c
> @@ -292,98 +292,102 @@ static const MemoryRegionOps timer_ops =3D {
>  static void macio_newworld_realize(PCIDevice *d, Error **errp)
>  {
>      MacIOState *s =3D MACIO(d);
>      NewWorldMacIOState *ns =3D NEWWORLD_MACIO(d);
>      DeviceState *pic_dev =3D DEVICE(ns->pic);
>      Error *err =3D NULL;
>      SysBusDevice *sysbus_dev;
>      MemoryRegion *timer_memory =3D NULL;
> =20
>      macio_common_realize(d, &err);
>      if (err) {
>          error_propagate(errp, err);
>          return;
>      }
> =20
>      sysbus_dev =3D SYS_BUS_DEVICE(&s->escc);
>      sysbus_connect_irq(sysbus_dev, 0, qdev_get_gpio_in(pic_dev,
>                                                         NEWWORLD_ESCCB_IR=
Q));
>      sysbus_connect_irq(sysbus_dev, 1, qdev_get_gpio_in(pic_dev,
>                                                         NEWWORLD_ESCCA_IR=
Q));
> =20
>      /* OpenPIC */
>      sysbus_dev =3D SYS_BUS_DEVICE(ns->pic);
>      memory_region_add_subregion(&s->bar, 0x40000,
>                                  sysbus_mmio_get_region(sysbus_dev, 0));
> =20
>      /* IDE buses */
>      macio_realize_ide(s, &ns->ide[0],
>                        qdev_get_gpio_in(pic_dev, NEWWORLD_IDE0_IRQ),
>                        qdev_get_gpio_in(pic_dev, NEWWORLD_IDE0_DMA_IRQ),
>                        0x16, &err);
>      if (err) {
>          error_propagate(errp, err);
>          return;
>      }
> =20
>      macio_realize_ide(s, &ns->ide[1],
>                        qdev_get_gpio_in(pic_dev, NEWWORLD_IDE1_IRQ),
>                        qdev_get_gpio_in(pic_dev, NEWWORLD_IDE1_DMA_IRQ),
>                        0x1a, &err);
>      if (err) {
>          error_propagate(errp, err);
>          return;
>      }
> =20
>      /* Timer */
>      timer_memory =3D g_new(MemoryRegion, 1);
>      memory_region_init_io(timer_memory, OBJECT(s), &timer_ops, NULL, "ti=
mer",
>                            0x1000);
>      memory_region_add_subregion(&s->bar, 0x15000, timer_memory);
> =20
>      if (ns->has_pmu) {
>          /* GPIOs */
>          sysbus_dev =3D SYS_BUS_DEVICE(&ns->gpio);
>          object_property_set_link(OBJECT(&ns->gpio), OBJECT(pic_dev), "pi=
c",
>                                   &error_abort);
>          memory_region_add_subregion(&s->bar, 0x50,
>                                      sysbus_mmio_get_region(sysbus_dev, 0=
));
>          object_property_set_bool(OBJECT(&ns->gpio), true, "realized", &e=
rr);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
> =20
>          /* PMU */
>          object_initialize_child(OBJECT(s), "pmu", &s->pmu, sizeof(s->pmu=
),
>                                  TYPE_VIA_PMU, &error_abort, NULL);
>          object_property_set_link(OBJECT(&s->pmu), OBJECT(sysbus_dev), "g=
pio",
>                                   &error_abort);
>          qdev_prop_set_bit(DEVICE(&s->pmu), "has-adb", ns->has_adb);
>          qdev_set_parent_bus(DEVICE(&s->pmu), BUS(&s->macio_bus));
> =20
>          object_property_set_bool(OBJECT(&s->pmu), true, "realized", &err=
);
>          if (err) {
>              error_propagate(errp, err);
>              return;
>          }
>          sysbus_dev =3D SYS_BUS_DEVICE(&s->pmu);
>          sysbus_connect_irq(sysbus_dev, 0, qdev_get_gpio_in(pic_dev,
>                                                             NEWWORLD_PMU_=
IRQ));
>          memory_region_add_subregion(&s->bar, 0x16000,
>                                      sysbus_mmio_get_region(sysbus_dev, 0=
));
>      } else {
>          /* CUDA */
>          object_initialize_child(OBJECT(s), "cuda", &s->cuda, sizeof(s->c=
uda),
>                                  TYPE_CUDA, &error_abort, NULL);
>          qdev_set_parent_bus(DEVICE(&s->cuda), BUS(&s->macio_bus));
>          qdev_prop_set_uint64(DEVICE(&s->cuda), "timebase-frequency",
>                               s->frequency);
> =20
>          object_property_set_bool(OBJECT(&s->cuda), true, "realized", &er=
r);
>          if (err) {
>              error_propagate(errp, err);
>              return;
>          }
>          sysbus_dev =3D SYS_BUS_DEVICE(&s->cuda);
>          sysbus_connect_irq(sysbus_dev, 0, qdev_get_gpio_in(pic_dev,
>                                                             NEWWORLD_CUDA=
_IRQ));
>          memory_region_add_subregion(&s->bar, 0x16000,
>                                      sysbus_mmio_get_region(sysbus_dev, 0=
));
>      }
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--cz6wLo+OExbGG7q/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5772QACgkQbDjKyiDZ
s5KdnA//Yc0jQHpDJOUKajuu0KFnO7KibNeOn6+mg8yZLdMu2aGV7QNeZeMpDli8
dhrVLhk5I3dKtaIB/08e0HquG7bknaHlBMd4ioljg8FBvprdR5th/GBnCxzWvHDI
/GCZ7B3jLPXLIldXphoiVDSWHs2BN9Du2ds1DqngsXxk7smBHLOY9OyCnZ1kONH4
7YUo0hvJQp+73M5YZf4xzLEAb7qhHQ/jtNoaXaDiXEXJUzEdN7szRPeQrW1PJhyR
yb4wwkEYVrS0AmoQN4nJ8sAK40PEnSPo/pgbdrg6sJ8Gn2IsgHOYDeOi/bgC+8OT
Ukmv2ZIPY8YGV+0mpuhKq9pDpOu4F4vP/Q50L46eFJfNqF/dYDUmJq2E2OVVCGIi
Uso2fNChSMzP0OYWjfJ5Vbh4ydcrf+JptBdf7dcxxsZYX8/4qXorjYHVz6R+cY08
N19r5T51hVQqkf65nKgeJiJiodo1wsjS5Z7TNPXUcQhiAwhdUPeL+oouIT3DqHyc
uce+iPPdatSwpFkW2CM6mzJwrPE1PP1dFdCAqSft+PHhHuxyjjPoiExS1Lw60KUX
wP68051Ma54P46KBkMlBxowbMgUm7mZdYElEUXam26LWNP5NboQpdqB9gwMBvr6q
UhRa8/VIc9P6VxtIF0EsS0o0Ct0XMoFMlQiBS9btmw3NeC33ZOM=
=O4J9
-----END PGP SIGNATURE-----

--cz6wLo+OExbGG7q/--

