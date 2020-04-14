Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jOBML-0001eZ-1N
	for mharc-qemu-riscv@gnu.org; Mon, 13 Apr 2020 22:31:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46567)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1jOBMH-0001YW-DP
 for qemu-riscv@nongnu.org; Mon, 13 Apr 2020 22:31:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1jOBMF-0003NA-VY
 for qemu-riscv@nongnu.org; Mon, 13 Apr 2020 22:31:29 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:33649 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1jOBM4-00030w-RZ; Mon, 13 Apr 2020 22:31:17 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 491Tvw2Mxtz9sTv; Tue, 14 Apr 2020 12:26:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1586831372;
 bh=z+ZKS6N1wAGyfVLEACnmrKqjFBePx1Vp+lIM3SeVP6U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e46lssns7GrXbiOHAinFwEZTAsbwbhpeQa3K8t+xcvIEBlJ34blXEgeXKGvUpbsxv
 qhw9bR+kFi2VApTAipF/1zLMiYBhaNdOtfQPbHHOWnOVgF+rhNshx+NgYURnw9+KFI
 eQj1E+OBwH09U8+neeEGTVRI1ubwizuTeBgRUxkQ=
Date: Tue, 14 Apr 2020 12:10:29 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-ppc@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Markus Armbruster <armbru@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-arm@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Peter Chubb <peter.chubb@nicta.com.au>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-riscv@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH-for-5.1 v3 18/24] hw/pci-host/pnv_phb3: Move some code
 from realize() to init()
Message-ID: <20200414021029.GH48061@umbus.fritz.box>
References: <20200412223619.11284-1-f4bug@amsat.org>
 <20200412223619.11284-19-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="G3juXO9GfR42w+sw"
Content-Disposition: inline
In-Reply-To: <20200412223619.11284-19-f4bug@amsat.org>
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
X-List-Received-Date: Tue, 14 Apr 2020 02:31:31 -0000


--G3juXO9GfR42w+sw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2020 at 12:36:13AM +0200, Philippe Mathieu-Daud=E9 wrote:
> Coccinelle reported:
>=20
>   $ spatch ... --timeout 60 --sp-file \
>     scripts/coccinelle/simplify-init-realize-error_propagate.cocci
>   HANDLING: ./hw/pci-host/pnv_phb3.c
>   >>> possible moves from pnv_phb3_instance_init() to pnv_phb3_realize() =
in ./hw/pci-host/pnv_phb3.c:992
>=20
> Move the calls using &error_abort which don't depend on input
> updated before realize() to init().
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
> v3: Typo 'depend of' -> 'depend on' (eblake)
> ---
>  hw/pci-host/pnv_phb3.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index 74618fadf0..57d717ed23 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -970,6 +970,8 @@ static void pnv_phb3_instance_init(Object *obj)
>      /* LSI sources */
>      object_initialize_child(obj, "lsi", &phb->lsis, sizeof(phb->lsis),
>                               TYPE_ICS, &error_abort, NULL);
> +    object_property_set_int(OBJECT(&phb->lsis), PNV_PHB3_NUM_LSI, "nr-ir=
qs",
> +                            &error_abort);
> =20
>      /* Default init ... will be fixed by HW inits */
>      phb->lsis.offset =3D 0;
> @@ -977,6 +979,8 @@ static void pnv_phb3_instance_init(Object *obj)
>      /* MSI sources */
>      object_initialize_child(obj, "msi", &phb->msis, sizeof(phb->msis),
>                              TYPE_PHB3_MSI, &error_abort, NULL);
> +    object_property_set_int(OBJECT(&phb->msis), PHB3_MAX_MSI, "nr-irqs",
> +                            &error_abort);
> =20
>      /* Power Bus Common Queue */
>      object_initialize_child(obj, "pbcq", &phb->pbcq, sizeof(phb->pbcq),
> @@ -1005,8 +1009,6 @@ static void pnv_phb3_realize(DeviceState *dev, Erro=
r **errp)
>      /* LSI sources */
>      object_property_set_link(OBJECT(&phb->lsis), OBJECT(pnv), "xics",
>                                     &error_abort);
> -    object_property_set_int(OBJECT(&phb->lsis), PNV_PHB3_NUM_LSI, "nr-ir=
qs",
> -                            &error_abort);
>      object_property_set_bool(OBJECT(&phb->lsis), true, "realized", &loca=
l_err);
>      if (local_err) {
>          error_propagate(errp, local_err);
> @@ -1024,8 +1026,6 @@ static void pnv_phb3_realize(DeviceState *dev, Erro=
r **errp)
>                                     &error_abort);
>      object_property_set_link(OBJECT(&phb->msis), OBJECT(pnv), "xics",
>                                     &error_abort);
> -    object_property_set_int(OBJECT(&phb->msis), PHB3_MAX_MSI, "nr-irqs",
> -                            &error_abort);
>      object_property_set_bool(OBJECT(&phb->msis), true, "realized", &loca=
l_err);
>      if (local_err) {
>          error_propagate(errp, local_err);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--G3juXO9GfR42w+sw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl6VG5UACgkQbDjKyiDZ
s5KtbA/+Mv4pdUqhOpQqcFoIV3GcQcu+ytXfzeZYa3WuvIGGyDPRFVliSiHz9DHr
uxMGDIZtPKWJ442M9e4jMpF7N4X29+7mcNRg/NlGTX3Het5P2dnz3ETLLCcqoOun
4pe7XMT3pE6GT9ZyhINHLlFmpCZSLJc5jxGS9XDe49Chd+HvgkvYGdwHFr8soI9T
hY9TdLxsG2kW/ETst/QKV5MELhk8xsv18saS3Y7rnvo2R72nvgdGc1Z80QTJKGMT
/1tySYfSrgYaIi0qnWbUk2otd7l2e4cErZBuZA0kVN+Gqp6MjwPxmV90jokZrTL4
9oHBCzTMCW94yAtKUMuXmxqifTmY7pakOjED0tx2uDa19ilhy/X4dIXIH8oBWvgN
6+oG1JorCkndBOL9g0BqzwfRAdIiq+ZbEUE0pkyLartmd4XhJfk6pIIeUHSYzhwx
DeTL/TfZPaSKYBAh7pdJY43S57E6vrvIwvE3MP8BvwhrWBMQ66+tWOcDC8C6xv06
51Jirlqw1uBiXblJbLqhCiIg+DQ/HhwumkyLCzfj6dkX3WeOF40vIdcXYQKUISFC
RkM3EZbzUHTUW2BCs5ktiz45KEVUbDOJQN0Z25zXMDn4DOMteAsnvZXDops8kS3S
oS8U0oet+93OFbqWjGBzbj9OrpkiWMsWVpCkBKGOyeBY0PeVFKg=
=476g
-----END PGP SIGNATURE-----

--G3juXO9GfR42w+sw--

