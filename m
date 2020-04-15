Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jOcqT-0004Ko-TC
	for mharc-qemu-riscv@gnu.org; Wed, 15 Apr 2020 03:52:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51734)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1jOcqR-0004E8-PP
 for qemu-riscv@nongnu.org; Wed, 15 Apr 2020 03:52:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1jOcqQ-0008VW-Kb
 for qemu-riscv@nongnu.org; Wed, 15 Apr 2020 03:52:27 -0400
Received: from 4.mo4.mail-out.ovh.net ([178.32.98.131]:49215)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1jOcqQ-0008V8-Ef
 for qemu-riscv@nongnu.org; Wed, 15 Apr 2020 03:52:26 -0400
Received: from player695.ha.ovh.net (unknown [10.108.42.145])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id CC092230D8B
 for <qemu-riscv@nongnu.org>; Wed, 15 Apr 2020 09:52:24 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player695.ha.ovh.net (Postfix) with ESMTPSA id BE71F114BA640;
 Wed, 15 Apr 2020 07:51:47 +0000 (UTC)
Subject: Re: [PATCH-for-5.1 v3 18/24] hw/pci-host/pnv_phb3: Move some code
 from realize() to init()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-ppc@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Markus Armbruster <armbru@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Xie Changlong <xiechanglong.d@gmail.com>, Fam Zheng <fam@euphon.net>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-arm@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Kevin Wolf
 <kwolf@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Jason Wang <jasowang@redhat.com>, Peter Chubb <peter.chubb@nicta.com.au>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-riscv@nongnu.org,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <rth@twiddle.net>
References: <20200412223619.11284-1-f4bug@amsat.org>
 <20200412223619.11284-19-f4bug@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <2e60d4fa-36b0-bc4d-a61b-540cd2e03756@kaod.org>
Date: Wed, 15 Apr 2020 09:51:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200412223619.11284-19-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 13634647873948847024
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrfedvgdduvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheileehrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdhrihhstghvsehnohhnghhnuhdrohhrgh
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.32.98.131
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
X-List-Received-Date: Wed, 15 Apr 2020 07:52:29 -0000

On 4/13/20 12:36 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> Coccinelle reported:
>=20
>   $ spatch ... --timeout 60 --sp-file \
>     scripts/coccinelle/simplify-init-realize-error_propagate.cocci
>   HANDLING: ./hw/pci-host/pnv_phb3.c
>   >>> possible moves from pnv_phb3_instance_init() to pnv_phb3_realize(=
) in ./hw/pci-host/pnv_phb3.c:992
>=20
> Move the calls using &error_abort which don't depend on input
> updated before realize() to init().
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>



Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

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
> +    object_property_set_int(OBJECT(&phb->lsis), PNV_PHB3_NUM_LSI, "nr-=
irqs",
> +                            &error_abort);
> =20
>      /* Default init ... will be fixed by HW inits */
>      phb->lsis.offset =3D 0;
> @@ -977,6 +979,8 @@ static void pnv_phb3_instance_init(Object *obj)
>      /* MSI sources */
>      object_initialize_child(obj, "msi", &phb->msis, sizeof(phb->msis),
>                              TYPE_PHB3_MSI, &error_abort, NULL);
> +    object_property_set_int(OBJECT(&phb->msis), PHB3_MAX_MSI, "nr-irqs=
",
> +                            &error_abort);
> =20
>      /* Power Bus Common Queue */
>      object_initialize_child(obj, "pbcq", &phb->pbcq, sizeof(phb->pbcq)=
,
> @@ -1005,8 +1009,6 @@ static void pnv_phb3_realize(DeviceState *dev, Er=
ror **errp)
>      /* LSI sources */
>      object_property_set_link(OBJECT(&phb->lsis), OBJECT(pnv), "xics",
>                                     &error_abort);
> -    object_property_set_int(OBJECT(&phb->lsis), PNV_PHB3_NUM_LSI, "nr-=
irqs",
> -                            &error_abort);
>      object_property_set_bool(OBJECT(&phb->lsis), true, "realized", &lo=
cal_err);
>      if (local_err) {
>          error_propagate(errp, local_err);
> @@ -1024,8 +1026,6 @@ static void pnv_phb3_realize(DeviceState *dev, Er=
ror **errp)
>                                     &error_abort);
>      object_property_set_link(OBJECT(&phb->msis), OBJECT(pnv), "xics",
>                                     &error_abort);
> -    object_property_set_int(OBJECT(&phb->msis), PHB3_MAX_MSI, "nr-irqs=
",
> -                            &error_abort);
>      object_property_set_bool(OBJECT(&phb->msis), true, "realized", &lo=
cal_err);
>      if (local_err) {
>          error_propagate(errp, local_err);
>=20


