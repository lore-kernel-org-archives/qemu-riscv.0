Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pL7AU-0008Lt-Vq
	for mharc-qemu-riscv@gnu.org; Thu, 26 Jan 2023 13:40:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1pL7AT-0008Lf-Nd; Thu, 26 Jan 2023 13:40:14 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1pL7AS-0006w1-8R; Thu, 26 Jan 2023 13:40:13 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BE14C61919;
 Thu, 26 Jan 2023 18:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28A44C433D2;
 Thu, 26 Jan 2023 18:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674758408;
 bh=e0C//wuvKVD9zed85QQkWU1A8Ukk9WLALPJMngLmHFs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aO0QRU+/9q8YSpU7lgp2T4lXXHIMP6Xg1bqdhUYbXneYd1E4VMpbDCAeKkM4T92hX
 9NeAW4PxS7sn/Tu14NRJOyZsrEqFoRM0KkHkIV8ZvZXH74YzrtBvnHPkAQvLD3sq21
 pYzUsJYZ/mat39gn7clJggK3gZ/qOkGtCZeCh9COhOE5fDn5p+VKELIG8dMJaPumzk
 5qJH3YOhC/HZORoptVyG7ft0+QyWUh4+j+IAYtCAP7XKrnTow/aQCYzwZ4KgG/vxbt
 5pwJFErZ1M+CeGYcKr5xR071Ooj9kSHoJPnGvNZBGyzKPErWwJl/EMw8UpQefyfVFJ
 SQXUW8MnO/e3w==
Date: Thu, 26 Jan 2023 18:40:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
Subject: Re: [PATCH v4 0/3] riscv_load_fdt() semantics change
Message-ID: <Y9LJBGiOih8jAf9w@spud>
References: <20230126135219.1054658-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8kz61MWQLtsspw2U"
Content-Disposition: inline
In-Reply-To: <20230126135219.1054658-1-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=conor@kernel.org; helo=dfw.source.kernel.org
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
X-List-Received-Date: Thu, 26 Jan 2023 18:40:14 -0000


--8kz61MWQLtsspw2U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 26, 2023 at 10:52:16AM -0300, Daniel Henrique Barboza wrote:
> Hi,
>=20
> After discussions in the previous version, where we ended up discovering
> the details of why the current riscv_load_fdt() works with the Microchip
> Icicle Kit board almost by accident, I decided to change how
> riscv_compute_fdt_addr() (the FDT address calculation from
> riscv_load_fdt()) operates.=20
>=20
> Instead of relying on premises that the Icicle Kit board can't hold
> right from start, since dram_base + mem_size will never be contained in
> a contiguous RAM area, change the FDT address calculation to also
> receive the bondaries of the DRAM block that the board guarantees that
> it's not sparse. With this extra information we're able to make a more
> consistent FDT address calculation that will cover all existing cases we
> have today.

The "test" case that fail before, is now back passing again. Thanks
Daniel!

Tested-by: Conor Dooley <conor.dooley@microchip.com>


--8kz61MWQLtsspw2U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9LJBAAKCRB4tDGHoIJi
0m2zAQC9nF5qddNmQl7znhXV9/SrqYirNcqv641Pk7wmfLzNewEAkBRlfFIDW86H
Yqo5BaQIfs2P2sKsN6TjOQkSpZCbeAw=
=m5N9
-----END PGP SIGNATURE-----

--8kz61MWQLtsspw2U--

