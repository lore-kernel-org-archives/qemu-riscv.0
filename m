Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lbCyD-0003yW-VU
	for mharc-qemu-riscv@gnu.org; Mon, 26 Apr 2021 21:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lbCyA-0003qB-7q; Mon, 26 Apr 2021 21:56:58 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:40323 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lbCy8-0000mV-2v; Mon, 26 Apr 2021 21:56:58 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FTlHW0gWvz9sXh; Tue, 27 Apr 2021 11:56:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1619488599;
 bh=okNU2PQvvx5a3BuImarZUOGHBBU6e7djY5rTkKBRIaQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GzvZwcVKOe2CJOK2T3L+mgLp/YavFHBHBQuArCrU4TtTYRf6IiEhQOhPxnbTNB+wx
 R8HhCDJxh/x35StRUH1uWqWQFk/6ZO6EDgV5MIP2i39HO2SzE/DEqtfVub7jx++xv/
 KnYcNK2bke2eSAf6+jTgohlMj3lCs+9IzNkDeprw=
Date: Tue, 27 Apr 2021 11:56:21 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: Re: [PATCH 5/7] hw: Have machines Kconfig-select FW_CFG
Message-ID: <YIdvRYFr2cViBM9+@yekko.fritz.box>
References: <20210426193520.4115528-1-philmd@redhat.com>
 <20210426193520.4115528-6-philmd@redhat.com>
 <aec5eea-8beb-a59-fda1-4c1ba4374c5@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0jr6VXHBGqaURn2+"
Content-Disposition: inline
In-Reply-To: <aec5eea-8beb-a59-fda1-4c1ba4374c5@eik.bme.hu>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
X-List-Received-Date: Tue, 27 Apr 2021 01:56:59 -0000


--0jr6VXHBGqaURn2+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 27, 2021 at 12:03:42AM +0200, BALATON Zoltan wrote:
> On Mon, 26 Apr 2021, Philippe Mathieu-Daud=E9 wrote:
> > Beside the loongson3-virt machine (MIPS), the following machines
> > also use the fw_cfg device:
> >=20
> > - ARM: virt & sbsa-ref
> > - HPPA: generic machine
> > - X86: ACPI based (pc & microvm)
> > - PPC64: various
> > - SPARC: sun4m & sun4u
> >=20
> > Add their FW_CFG Kconfig dependency.
> >=20
> > Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> > ---
> > hw/arm/Kconfig     | 2 ++
> > hw/hppa/Kconfig    | 1 +
> > hw/i386/Kconfig    | 2 ++
> > hw/ppc/Kconfig     | 1 +
> > hw/sparc/Kconfig   | 1 +
> > hw/sparc64/Kconfig | 1 +
> > 6 files changed, 8 insertions(+)
> >=20
> > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > index 8c37cf00da7..3b2641e39dc 100644
> > --- a/hw/arm/Kconfig
> > +++ b/hw/arm/Kconfig
> > @@ -8,6 +8,7 @@ config ARM_VIRT
> >     imply TPM_TIS_SYSBUS
> >     select ARM_GIC
> >     select ACPI
> > +    select FW_CFG
> >     select ARM_SMMUV3
> >     select GPIO_KEY
> >     select FW_CFG_DMA
> > @@ -216,6 +217,7 @@ config SBSA_REF
> >     select PL061 # GPIO
> >     select USB_EHCI_SYSBUS
> >     select WDT_SBSA
> > +    select FW_CFG
> >=20
> > config SABRELITE
> >     bool
> > diff --git a/hw/hppa/Kconfig b/hw/hppa/Kconfig
> > index 22948db0256..45f40e09224 100644
> > --- a/hw/hppa/Kconfig
> > +++ b/hw/hppa/Kconfig
> > @@ -14,3 +14,4 @@ config DINO
> >     select LASIPS2
> >     select PARALLEL
> >     select ARTIST
> > +    select FW_CFG
> > diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
> > index 7f91f30877f..9e4039a2dce 100644
> > --- a/hw/i386/Kconfig
> > +++ b/hw/i386/Kconfig
> > @@ -52,6 +52,7 @@ config PC_ACPI
> >     select SMBUS_EEPROM
> >     select PFLASH_CFI01
> >     depends on ACPI_SMBUS
> > +    select FW_CFG
> >=20
> > config I440FX
> >     bool
> > @@ -106,6 +107,7 @@ config MICROVM
> >     select ACPI_HW_REDUCED
> >     select PCI_EXPRESS_GENERIC_BRIDGE
> >     select USB_XHCI_SYSBUS
> > +    select FW_CFG
> >=20
> > config X86_IOMMU
> >     bool
> > diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> > index d11dc30509d..a7ba8283bf1 100644
> > --- a/hw/ppc/Kconfig
> > +++ b/hw/ppc/Kconfig
> > @@ -131,6 +131,7 @@ config VIRTEX
> > # Only used by 64-bit targets
> > config FW_CFG_PPC
> >     bool
> > +    select FW_CFG
>=20
> Why do we need a separate config option here if all it does is select FW_=
CFG
> and also in meson.build it only seems to add fw_cfg.c? (Unlike FW_CFG_DMA
> which seems to add other files so another option makes sense for that cas=
e).
> Could we just use FW_CFG directly and drop the PPC specific option like y=
ou
> did for MIPS?
>=20
> Also the comment saying "Only used by 64-bit targets" seems to be wrong as
> it is also selected by MAC_OLDWORLD that's definitely a 32-bit machine (a=
nd
> MAC_NEWWORLD that can be both 32 or 64 bit) so maybe this option used to =
do
> something previously but now seems to be equivalent to just FW_CFG. So co=
uld
> it be dropped and use FW_CFG instead to simplify this or what's the reason
> to keep a PPC specific option for it?

Actually... good point.  I don't see any reason for this config option eith=
er.

>=20
> Regards,
> BALATON Zoltan
>=20
> >=20
> > config FDT_PPC
> >     bool
> > diff --git a/hw/sparc/Kconfig b/hw/sparc/Kconfig
> > index 8dcb10086fd..267bf45fa21 100644
> > --- a/hw/sparc/Kconfig
> > +++ b/hw/sparc/Kconfig
> > @@ -15,6 +15,7 @@ config SUN4M
> >     select STP2000
> >     select CHRP_NVRAM
> >     select OR_IRQ
> > +    select FW_CFG
> >=20
> > config LEON3
> >     bool
> > diff --git a/hw/sparc64/Kconfig b/hw/sparc64/Kconfig
> > index 980a201bb73..c17b34b9d5b 100644
> > --- a/hw/sparc64/Kconfig
> > +++ b/hw/sparc64/Kconfig
> > @@ -13,6 +13,7 @@ config SUN4U
> >     select PCKBD
> >     select SIMBA
> >     select CHRP_NVRAM
> > +    select FW_CFG
> >=20
> > config NIAGARA
> >     bool
> >=20


--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--0jr6VXHBGqaURn2+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCHb0UACgkQbDjKyiDZ
s5Lc6Q//aOwjsOtxT4hFd1m4RBzYAgXtJGDvM3nKOZFF+CLJXgeVoZNchL5JGykQ
44qeSRq7o5QjJOcF0Rhscw+4O7TOwBsLxhE09BBBPopGcRRPup+iG914ZAkHhnUe
dva9let3FDbSuUAMzhYH4uUZMCbGlwQeKEX/DoryBdZYbFHCTMownvn3Dt7QWk6a
gi6Es0jjzapa3U+XFPwf2Uq9HnrJP7wGFGv73lLHdakiA6yYCtq+0aOcyM9IenvR
m1Y5WaTXTtObqsdTJ0PbRdCgv8mAcI1n5qyXGcjwGG07tMA/BA0LL/ZOmNBq4ORi
OuuNgP2NK7Pbk3+WhyEV+1eR3KIEHRBbmfZiR3UeY3noJX8Kcn/icsKoMDFlXePM
/0G1JKyMwYIchSFXXrMyVTcwDSXlNuO9sveYzc8Iw4F24qqLXnR8zyy9AC4xj6ig
puN4btvbkFvpauoqlM2eifakNZr3Uo9F163d7BsvJ+DulQPTVKGFxsVBcWn7FSqF
Mq/0yNNq/uoaCRy07Gee3z6PNTGh9AH7a4cct5e9kyAeAk0r/KKYiwNvDH0SaBYh
eMlcm5aRSwPbLKkLGYddqbvTYCbbarubZipfDtlwP7weUVtT6ykiR1q5tNwkzn1r
/wXSGP8kd8pGi5niowU+MSySEMqF83tEnozYfKcjzqTyLWi1Ma4=
=OlSS
-----END PGP SIGNATURE-----

--0jr6VXHBGqaURn2+--

