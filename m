Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIb2C-00049U-UE
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 14:57:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1pIb2B-00048v-G5; Thu, 19 Jan 2023 14:57:15 -0500
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1pIb25-0000Th-5H; Thu, 19 Jan 2023 14:57:14 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 21DDDB82699;
 Thu, 19 Jan 2023 19:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF8D3C433D2;
 Thu, 19 Jan 2023 19:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674158217;
 bh=BmWTeRUIusd8OEFXHTJuzYETV+qmAT4J8HYVZub7ViY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K8lhsd7alaACglghdd1I9y4yPe7IvAzSXQc8QssGw+5JOfnkzpORBDCy5bC52DQAc
 69W0intb65QhW2B/5J7r/jEqnhMwUK6jhTGpjRtWrL4gDkY0tFU52+lymQtyIBx2QI
 X1v32S/jnwu9qHXpN6mkMtRXpCOdHtoopItBnYTNV1Ogal3Pb85qwKI3uzXIcb/VKB
 s5FXSd7b0gtvXTsI7ghyBPKQ4jAuK5S0Z3xkl5Y0CfNQ8tN0q2vJ0f4F1sRlAZm+ht
 d33NOLgp4j+uLVBfAA6WGHDAz+QiwTdsstvyZROwpivhPMRv4Kxzm00wlIfvRW1Z0e
 z6meFC+wZZqlw==
Date: Thu, 19 Jan 2023 19:56:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
Subject: Re: [PATCH v3 3/7] hw/riscv/microchip_pfsoc.c: add an Icicle Kit fdt
 address function
Message-ID: <Y8mghghac5Bintsl@spud>
References: <20230119191728.622081-1-dbarboza@ventanamicro.com>
 <20230119191728.622081-4-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="K/ySGvJLhH//+QXY"
Content-Disposition: inline
In-Reply-To: <20230119191728.622081-4-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=conor@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jan 2023 19:57:15 -0000


--K/ySGvJLhH//+QXY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey!

On Thu, Jan 19, 2023 at 04:17:24PM -0300, Daniel Henrique Barboza wrote:
> The Icicle Kit board works with 2 distinct RAM banks that are separated
> by a gap. We have a lower bank with 1GiB size, a gap follows,
> then at 64GiB the high memory starts.
>=20
> MachineClass::default_ram_size is set to 1.5Gb and machine_init() is
> enforcing it as minimal RAM size, meaning that there we'll always have
> at least 512 MiB in the Hi RAM area, and that the FDT will be located
> there all the time.
>=20
> riscv_compute_fdt_addr() can't handle this setup because it assumes that
> the RAM is always contiguous. It's also returning an uint32_t because
> it's enforcing that fdt address is sitting on an area that is addressable
> to 32 bit CPUs, but 32 bits won't be enough to point to the Hi area of
> the Icicle Kit RAM (and to its FDT itself).
>=20
> Create a new function called microchip_compute_fdt_addr() that is able
> to deal with all these details that are particular to the Icicle Kit.
> Ditch riscv_compute_fdt_addr() and use it instead.

Hmm, this breaks boot for me in what is a valid configuration for
Icicle/PolarFire SoC which was previously functional in QEMU.

I'll try and write another email explaining things in more detail, but
in case I do not have time to get that done in the next day or two I
figured I should let you know.

Thanks,
Conor.


--K/ySGvJLhH//+QXY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8mghgAKCRB4tDGHoIJi
0qEoAP0YFV+8XdaBNd18juhI/NqNzhfVrN0PBsbJ0lsKIEEEpgEAmDvrLApoVrZA
hERQ/0xWHHE+1sn/epqZVHWbJPctdgc=
=lSRT
-----END PGP SIGNATURE-----

--K/ySGvJLhH//+QXY--

