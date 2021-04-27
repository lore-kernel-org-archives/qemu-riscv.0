Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lbCyG-00044j-1h
	for mharc-qemu-riscv@gnu.org; Mon, 26 Apr 2021 21:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lbCy6-0003pZ-M0; Mon, 26 Apr 2021 21:56:54 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:34215 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lbCy2-0000hi-UV; Mon, 26 Apr 2021 21:56:54 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FTlHV6jGPz9sXM; Tue, 27 Apr 2021 11:56:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1619488598;
 bh=OBvWCeppEGuxHgjD5ZlXjdlcD19Qdw1rC4JUuy8jq4A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M3D/u5x0d0qI2wXsW89sm7f7eA6KLyY7ceuiUZjPuy2aQg3PGsMDDMRIEsbHISp5Y
 ruI+caQD1XDqINg5qJWrvRXNCR+1d34FvpRVJOphXZJnfNhFJugpvTYZPHbLsjmiR7
 0sDR+11qwby4J1k5fCfyuUoPjFFpNlL9+wgHd0ng=
Date: Tue, 27 Apr 2021 11:54:58 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-riscv@nongnu.org, Laszlo Ersek <lersek@redhat.com>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: Re: [PATCH 5/7] hw: Have machines Kconfig-select FW_CFG
Message-ID: <YIdu8rBQ/eG8dBSs@yekko.fritz.box>
References: <20210426193520.4115528-1-philmd@redhat.com>
 <20210426193520.4115528-6-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="O55wQVwTlrgyL9RX"
Content-Disposition: inline
In-Reply-To: <20210426193520.4115528-6-philmd@redhat.com>
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
X-List-Received-Date: Tue, 27 Apr 2021 01:56:59 -0000


--O55wQVwTlrgyL9RX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 26, 2021 at 09:35:18PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Beside the loongson3-virt machine (MIPS), the following machines
> also use the fw_cfg device:
>=20
> - ARM: virt & sbsa-ref
> - HPPA: generic machine
> - X86: ACPI based (pc & microvm)
> - PPC64: various
> - SPARC: sun4m & sun4u
>=20
> Add their FW_CFG Kconfig dependency.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

ppc parts
Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/arm/Kconfig     | 2 ++
>  hw/hppa/Kconfig    | 1 +
>  hw/i386/Kconfig    | 2 ++
>  hw/ppc/Kconfig     | 1 +
>  hw/sparc/Kconfig   | 1 +
>  hw/sparc64/Kconfig | 1 +
>  6 files changed, 8 insertions(+)
>=20
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 8c37cf00da7..3b2641e39dc 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -8,6 +8,7 @@ config ARM_VIRT
>      imply TPM_TIS_SYSBUS
>      select ARM_GIC
>      select ACPI
> +    select FW_CFG
>      select ARM_SMMUV3
>      select GPIO_KEY
>      select FW_CFG_DMA
> @@ -216,6 +217,7 @@ config SBSA_REF
>      select PL061 # GPIO
>      select USB_EHCI_SYSBUS
>      select WDT_SBSA
> +    select FW_CFG
> =20
>  config SABRELITE
>      bool
> diff --git a/hw/hppa/Kconfig b/hw/hppa/Kconfig
> index 22948db0256..45f40e09224 100644
> --- a/hw/hppa/Kconfig
> +++ b/hw/hppa/Kconfig
> @@ -14,3 +14,4 @@ config DINO
>      select LASIPS2
>      select PARALLEL
>      select ARTIST
> +    select FW_CFG
> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
> index 7f91f30877f..9e4039a2dce 100644
> --- a/hw/i386/Kconfig
> +++ b/hw/i386/Kconfig
> @@ -52,6 +52,7 @@ config PC_ACPI
>      select SMBUS_EEPROM
>      select PFLASH_CFI01
>      depends on ACPI_SMBUS
> +    select FW_CFG
> =20
>  config I440FX
>      bool
> @@ -106,6 +107,7 @@ config MICROVM
>      select ACPI_HW_REDUCED
>      select PCI_EXPRESS_GENERIC_BRIDGE
>      select USB_XHCI_SYSBUS
> +    select FW_CFG
> =20
>  config X86_IOMMU
>      bool
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index d11dc30509d..a7ba8283bf1 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -131,6 +131,7 @@ config VIRTEX
>  # Only used by 64-bit targets
>  config FW_CFG_PPC
>      bool
> +    select FW_CFG
> =20
>  config FDT_PPC
>      bool
> diff --git a/hw/sparc/Kconfig b/hw/sparc/Kconfig
> index 8dcb10086fd..267bf45fa21 100644
> --- a/hw/sparc/Kconfig
> +++ b/hw/sparc/Kconfig
> @@ -15,6 +15,7 @@ config SUN4M
>      select STP2000
>      select CHRP_NVRAM
>      select OR_IRQ
> +    select FW_CFG
> =20
>  config LEON3
>      bool
> diff --git a/hw/sparc64/Kconfig b/hw/sparc64/Kconfig
> index 980a201bb73..c17b34b9d5b 100644
> --- a/hw/sparc64/Kconfig
> +++ b/hw/sparc64/Kconfig
> @@ -13,6 +13,7 @@ config SUN4U
>      select PCKBD
>      select SIMBA
>      select CHRP_NVRAM
> +    select FW_CFG
> =20
>  config NIAGARA
>      bool

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--O55wQVwTlrgyL9RX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCHbvIACgkQbDjKyiDZ
s5KCOw/+KIWd2NDzDbQgK72oaT4v/Az1pxnmk3zm4GIIg8E1EiiZ3Yyj10oZGLr3
kYoWNwXk7A15+UpXsx2KzzE2x0clHbcEX6QSg3dvrLKXN1iCf3uHM9Ta1eE9DN8A
k/beAYEFthMDPKVvRAx9DvXkSJgv9a37KMmWuPnXwZPeWFMg83eizQl2IEJX9Kaj
Z0D6ajr1QOpE5HcUsG41TXTNFdiGubCE2ZOKvV7PjG8Wf6YvVXK2j4bSyvjjJ04N
v5Xnp7diEHmO0RV5JrLpbgA2oceupURF4fS0OZ6Mq2C1r7qvQm5OmDFpNc24NO6e
26rtWCRdD2EeDt4kwk+wS4ZmbZTsuSu6HSuPuETTW+WVV00Jq3S9JJoykjLJ8ufd
CiVEXMwLzB8NFMTX+X0IVklRjdABtQiPqjn73d8pPHvkYbztXfpZ6jKqeA/b2kOA
sh2imSDfZDCpN3IGANbMFxkD9YsNNLUgzuY4y5WHJ9NFKIOv+HJsh6mDGdka4SEn
WhldhZnCyrBO1WvOCoNhYx7iXrloqbqBgi9CgaSd1Amjp26mNdIjNauuA7mDXnpV
q5Zt0rhWcbmIybEaaVx0UMVsPL2h/JnOQGcqQPCk6Xa3KlFPS1NelB6kQPV9FtGl
UhQ22iierYq0KvXRBLkBsk3kH8GYAejCD9Ox05JMIbzM4V+/moU=
=syxT
-----END PGP SIGNATURE-----

--O55wQVwTlrgyL9RX--

