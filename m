Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFe9u-0006qS-3b
	for mharc-qemu-riscv@gnu.org; Wed, 11 Jan 2023 11:41:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>) id 1pFe9s-0006p7-Sa
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 11:41:00 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>) id 1pFe9r-0008Ms-0f
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 11:41:00 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E68F161D54;
 Wed, 11 Jan 2023 16:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7FD6C433F0;
 Wed, 11 Jan 2023 16:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673455250;
 bh=mJ7/OhXpyeQ5K/mRmb5v6laD26dU5T1KftFHjraeFWE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GIcmbO7xasBapmKjxzmIEcEOI2gi48V3dukzry4lLZZT9w1Q6oeN4OE12Yvl2MZEm
 RSXn4XB9PoENVTZjT0XV2oGTYAb68doJeE4w9qkmtFDXIV8uSjR6B3ZvZeDmxnrsMD
 JExZFWGX3XZ+K/198Q+TY04qogm7S9rlX3nahE4h3G3tnzKLsDE89HSjClaMhJ83Fm
 06c8idODsAObYzG45klE39+LQFx88V+ECgu4ctmTAKxAuO0ogO+k0s+Gq2yqC6Y1D8
 KZUhI6s9aMPM6e3rH3AgwoL/eooDmy2S8HpYavCrD728F60a+UfY/HSszznpy18NPP
 lErCpoYP78kcw==
Date: Wed, 11 Jan 2023 16:40:47 +0000
From: Conor Dooley <conor@kernel.org>
To: stage TC <stagethalescristal@gmail.com>
Cc: qemu-riscv@nongnu.org
Subject: Re: qemu icicle kit es
Message-ID: <Y77mjzm4u1V9JXKO@spud>
References: <CAJWvPnt95pOb6-QFxrHMH7NNrtxNHKRLjhVoz5A+BZ2Er-joKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VBWWAWZsjmo5LLEM"
Content-Disposition: inline
In-Reply-To: <CAJWvPnt95pOb6-QFxrHMH7NNrtxNHKRLjhVoz5A+BZ2Er-joKQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 11 Jan 2023 16:41:01 -0000


--VBWWAWZsjmo5LLEM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 11, 2023 at 03:21:26PM +0100, stage TC wrote:
> Hello,
> Sorry in advance if this is not the right way to do it but I'm a student
> and not very used to this kind of stuff (first mailing list).

Don't worry, you are doing fine :)

> I'm trying to run qemu for the Microchip PolarFire SoC Icicle kit but I'm
> facing a few issues and the wiki page about that seems obsolete.

I must admit, it's a long time since I tried to use a v2020.x release of
any MPFS software. Last time I did give the steps in the docs a go,
with a suitably vintage version of QEMU, things worked as expected.
However, using more recent versions of QEMU I ran into some problems
with the sd/mmc emulation & never get into U-Boot.

> I follow almost exactly what the wiki does (except I use a terminal as a
> tty instead of the socket bc it didn't work) but my HSS won't boot on
> versions more recent than 2020.10 or 0.99.12.

What does "my HSS won't boot" mean? E.g:
- Does the MICROCHIP logo banner appear (if it existed back then!)?
  If it didnt, the version string I think was.
- Does the HSS console appear?
- Does it fail to launch the next bootloader stage?

> However I can't find any image compatible for versions older than 2020.10
> or 0.99.12 (mines hang at "starting kernel ...".

By that do you mean you cannot find a pre-built yocto image? I am not
sure that there are any that pre-date the one linked in the wiki that
are still available, as those on GitHub only go back as far as v2021.02

> Is there any newer version of the tutorial ? Or does anyone have an idea on
> how to deal with this issue and use qemu for newer versions of the HSS ?

I do my testing with something like:
$(QEMU)/qemu-system-riscv64 \
	-M microchip-icicle-kit \
	-m 2G -smp 5 \
	-kernel $(vmlinux_bin) \
	-dtb $(devkit).dtb \
	-initrd $(initramfs) \
	-display none \
	-serial null \
	-serial stdio

This loads a kernel directly rather than using the HSS - for recent
versions of the HSS, implementations of some peripherals need to be
added, for example, it checks things like the cache configuration
during boot, which are not emulated in QEMU.

For that reason, I've stuck with doing direct kernel boots. Linux
v6.0.18 (and the associated devicetree) is the most recent combination
that I have booted unmodified using the master branch of QEMU using
this method.

More recent (linux) kernels come with a device tree that will require
changes in QEMU to support & I have unfortunately not had the time
to work on that recently.

Sorry that I am really of no help to you.

Conor.


--VBWWAWZsjmo5LLEM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY77mjwAKCRB4tDGHoIJi
0vaFAP4laZm0bG+8TcWR3f7HYTrNdyDwlZqqvK0Sd81VZrFY1wD/aLBO2ltqYmRo
nKfbtgUx1paHI4QiW4IMBAtzQk3WmwA=
=dx4R
-----END PGP SIGNATURE-----

--VBWWAWZsjmo5LLEM--

