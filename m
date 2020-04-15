Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jOcpx-0003Gk-KK
	for mharc-qemu-riscv@gnu.org; Wed, 15 Apr 2020 03:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51654)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1jOcpv-0003B6-Gh
 for qemu-riscv@nongnu.org; Wed, 15 Apr 2020 03:51:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1jOcpt-0008Eu-Vx
 for qemu-riscv@nongnu.org; Wed, 15 Apr 2020 03:51:55 -0400
Received: from 4.mo177.mail-out.ovh.net ([46.105.37.72]:40151)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1jOcpt-0008E0-PL
 for qemu-riscv@nongnu.org; Wed, 15 Apr 2020 03:51:53 -0400
Received: from player718.ha.ovh.net (unknown [10.108.54.34])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 95E5B12A1CD
 for <qemu-riscv@nongnu.org>; Wed, 15 Apr 2020 09:51:52 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player718.ha.ovh.net (Postfix) with ESMTPSA id D0D5411513851;
 Wed, 15 Apr 2020 07:51:00 +0000 (UTC)
Subject: Re: [PATCH-for-5.1 v3 05/24] hw/arm/aspeed_ast2600: Move some code
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
 <20200412223619.11284-6-f4bug@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <7407eb89-2f66-aa01-e1d2-dba410926aca@kaod.org>
Date: Wed, 15 Apr 2020 09:50:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200412223619.11284-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 13625640676116368304
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrfedvgdduvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucffohhmrghinheprghrmhdrtghomhenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejudekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdhrihhstghvsehnohhnghhnuhdrohhrgh
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.37.72
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
X-List-Received-Date: Wed, 15 Apr 2020 07:51:57 -0000

On 4/13/20 12:36 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> Coccinelle reported:
>=20
>   $ spatch ... --timeout 60 --sp-file \
>     scripts/coccinelle/simplify-init-realize-error_propagate.cocci
>   HANDLING: ./hw/arm/aspeed_ast2600.c
>   >>> possible moves from aspeed_soc_ast2600_init() to aspeed_soc_ast26=
00_realize() in ./hw/arm/aspeed_ast2600.c:243
>=20
> Move the calls using &error_fatal which don't depend on input
> updated before realize() to init().
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>



Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

> ---
> v3: Typo 'depend of' -> 'depend on' (eblake)
> ---
>  hw/arm/aspeed_ast2600.c | 41 ++++++++++++++++++++---------------------
>  1 file changed, 20 insertions(+), 21 deletions(-)
>=20
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index a860ab6a35..64512f95c9 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -114,6 +114,16 @@ static qemu_irq aspeed_soc_get_irq(AspeedSoCState =
*s, int ctrl)
>      return qdev_get_gpio_in(DEVICE(&s->a7mpcore), sc->irqmap[ctrl]);
>  }
> =20
> +/*
> + * ASPEED ast2600 has 0xf as cluster ID
> + *
> + * http://infocenter.arm.com/help/index.jsp?topic=3D/com.arm.doc.ddi03=
88e/CIHEBGFG.html
> + */
> +static uint64_t aspeed_calc_affinity(int cpu)
> +{
> +    return (0xf << ARM_AFF1_SHIFT) | cpu;
> +}
> +
>  static void aspeed_soc_ast2600_init(Object *obj)
>  {
>      AspeedSoCState *s =3D ASPEED_SOC(obj);
> @@ -130,6 +140,13 @@ static void aspeed_soc_ast2600_init(Object *obj)
>          object_initialize_child(obj, "cpu[*]", OBJECT(&s->cpu[i]),
>                                  sizeof(s->cpu[i]), sc->cpu_type,
>                                  &error_abort, NULL);
> +        object_property_set_int(OBJECT(&s->cpu[i]), QEMU_PSCI_CONDUIT_=
SMC,
> +                                "psci-conduit", &error_abort);
> +        object_property_set_int(OBJECT(&s->cpu[i]), aspeed_calc_affini=
ty(i),
> +                                "mp-affinity", &error_abort);
> +
> +        object_property_set_int(OBJECT(&s->cpu[i]), 1125000000, "cntfr=
q",
> +                                &error_abort);
>      }
> =20
>      snprintf(typename, sizeof(typename), "aspeed.scu-%s", socname);
> @@ -146,6 +163,9 @@ static void aspeed_soc_ast2600_init(Object *obj)
> =20
>      sysbus_init_child_obj(obj, "a7mpcore", &s->a7mpcore,
>                            sizeof(s->a7mpcore), TYPE_A15MPCORE_PRIV);
> +    object_property_set_int(OBJECT(&s->a7mpcore),
> +                            ASPEED_SOC_AST2600_MAX_IRQ + GIC_INTERNAL,
> +                            "num-irq", &error_abort);
> =20
>      sysbus_init_child_obj(obj, "rtc", OBJECT(&s->rtc), sizeof(s->rtc),
>                            TYPE_ASPEED_RTC);
> @@ -230,16 +250,6 @@ static void aspeed_soc_ast2600_init(Object *obj)
>                            TYPE_SYSBUS_SDHCI);
>  }
> =20
> -/*
> - * ASPEED ast2600 has 0xf as cluster ID
> - *
> - * http://infocenter.arm.com/help/index.jsp?topic=3D/com.arm.doc.ddi03=
88e/CIHEBGFG.html
> - */
> -static uint64_t aspeed_calc_affinity(int cpu)
> -{
> -    return (0xf << ARM_AFF1_SHIFT) | cpu;
> -}
> -
>  static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>  {
>      int i;
> @@ -264,19 +274,11 @@ static void aspeed_soc_ast2600_realize(DeviceStat=
e *dev, Error **errp)
> =20
>      /* CPU */
>      for (i =3D 0; i < s->num_cpus; i++) {
> -        object_property_set_int(OBJECT(&s->cpu[i]), QEMU_PSCI_CONDUIT_=
SMC,
> -                                "psci-conduit", &error_abort);
>          if (s->num_cpus > 1) {
>              object_property_set_int(OBJECT(&s->cpu[i]),
>                                      ASPEED_A7MPCORE_ADDR,
>                                      "reset-cbar", &error_abort);
>          }
> -        object_property_set_int(OBJECT(&s->cpu[i]), aspeed_calc_affini=
ty(i),
> -                                "mp-affinity", &error_abort);
> -
> -        object_property_set_int(OBJECT(&s->cpu[i]), 1125000000, "cntfr=
q",
> -                                &error_abort);
> -
>          /*
>           * TODO: the secondary CPUs are started and a boot helper
>           * is needed when using -kernel
> @@ -292,9 +294,6 @@ static void aspeed_soc_ast2600_realize(DeviceState =
*dev, Error **errp)
>      /* A7MPCORE */
>      object_property_set_int(OBJECT(&s->a7mpcore), s->num_cpus, "num-cp=
u",
>                              &error_abort);
> -    object_property_set_int(OBJECT(&s->a7mpcore),
> -                            ASPEED_SOC_AST2600_MAX_IRQ + GIC_INTERNAL,
> -                            "num-irq", &error_abort);
> =20
>      object_property_set_bool(OBJECT(&s->a7mpcore), true, "realized",
>                               &error_abort);
>=20


