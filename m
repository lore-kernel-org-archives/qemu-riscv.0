Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNecW-0006cy-0b
	for mharc-qemu-riscv@gnu.org; Thu, 02 Feb 2023 13:47:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1pNebu-0006X1-9a; Thu, 02 Feb 2023 13:47:08 -0500
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1pNebs-0006nw-1y; Thu, 02 Feb 2023 13:47:01 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8EE52B82794;
 Thu,  2 Feb 2023 18:46:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 393CFC433D2;
 Thu,  2 Feb 2023 18:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675363616;
 bh=OdHPj/mJNWK/lsXth0+2pascgCwBM86k/dDgCelQW3c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=StJhCB9x+EaYNVeXthtOefhU7KaWO++WYLI4mfH6kPLeitCEL07GSz7AF7t8SV0Rt
 dAISoNVvZIr0xGyCa5eNZuU9hWbuC+TSVKs4ox9sdmdaJ2RSISLaRuytKrTi8xVHHi
 Z/1Ff1GT91NkLCGYMOxPkNBOSPZYstrZAHj8Q/y/T9QAbbwdBAnlCKTf2A34NHTBWm
 K4S21Y3Vh3dtc5wcjzL+xvqWVqvS2b/JaeV3dt9YTxosMz07qO4yqiXrnyu7wy64NL
 PC4/t+nQo1bCCgeculEE8fJ6s4H0Ql9HMKMEVPaw4AlEJI2ICb/Ea51kPxgS13wVGL
 kBSv/JaJteRmw==
Date: Thu, 2 Feb 2023 18:46:52 +0000
From: Conor Dooley <conor@kernel.org>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
Subject: Re: [PATCH v10 0/3] hw/riscv: handle kernel_entry high bits with
 32bit CPUs
Message-ID: <Y9wFHMir5HXPa1Zu@spud>
References: <20230202135810.1657792-1-dbarboza@ventanamicro.com>
 <Y9vyEp8ghrbqssJO@spud>
 <0568610c-e227-b088-c375-5ee769c7cfc6@ventanamicro.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="R9dupd3ybQesRoy+"
Content-Disposition: inline
In-Reply-To: <0568610c-e227-b088-c375-5ee769c7cfc6@ventanamicro.com>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=conor@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 02 Feb 2023 18:47:30 -0000


--R9dupd3ybQesRoy+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 02, 2023 at 03:37:17PM -0300, Daniel Henrique Barboza wrote:
> On 2/2/23 14:25, Conor Dooley wrote:
> > On Thu, Feb 02, 2023 at 10:58:07AM -0300, Daniel Henrique Barboza wrote:
> > > This new version removed the translate_fn() from patch 1 because it
> > > wasn't removing the sign-extension for pentry as we thought it would.
> > > A more detailed explanation is given in the commit msg of patch 1.
> > >=20
> > > We're now retrieving the 'lowaddr' value from load_elf_ram_sym() and
> > > using it when we're running a 32-bit CPU. This worked with 32 bit
> > > 'virt' machine booting with the -kernel option.
> > >=20
> > > If this approach doesn't work for the Xvisor use case, IMO  we should
> > > just filter kernel_load_addr bits directly as we were doing a handful=
 of
> > > versions ago.
> > >=20
> > > Patches are based on current riscv-to-apply.next.
> > >=20
> > > Changes from v9:
> > > - patch 1:
> > >    - removed the translate_fn() callback
> > >    - return 'kernel_low' when running a 32-bit CPU
> > > - v9 link: https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg0=
4509.html
> >=20
> > I think my T-b got lost last time around, but I gave this version a
> > whirl too & things are working for me as they were before on Icicle.
>=20
> That was my bad. I forgot to add the test-by after doing the changes for
> the next version.

Oh, I'm sorry. I saw a new version of the series a few days ago and
noticed the missing tags, and then saw this one today, touching MPFS,
and conflated the two.

> But I don't think this is the series you're talking about. The tested-by =
tag
> you gave was on these patches:
>=20
> "[PATCH v5 0/3] riscv_load_fdt() semantics change"
>=20
> I believe you can add a Tested-by there. And feel free to give it a go - =
the
> patches are on riscv-to-apply.next already.

Tested-by stands here though, I replied to the same message-id that I
shazamed and tried ;)
And I did so on top of the HEAD of riscv-to-apply.next, so I am happy
with the version that got applied too.

Sorry!


--R9dupd3ybQesRoy+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9wFHAAKCRB4tDGHoIJi
0iKhAQDFf4/QJyKFe40iqzCH3IzmCBjY5M3sTh7+vMwyNnKwOgD9E6r58adNKni8
dR/lTredskXMaSpJba2YkywEKT6YKgM=
=vLrT
-----END PGP SIGNATURE-----

--R9dupd3ybQesRoy+--

