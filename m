Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pG1vK-00066N-KG
	for mharc-qemu-riscv@gnu.org; Thu, 12 Jan 2023 13:03:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>) id 1pG1vI-000642-A1
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 13:03:33 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>) id 1pG1vG-0006Dq-Am
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 13:03:32 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E65A4620ED;
 Thu, 12 Jan 2023 18:03:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8399EC433F0;
 Thu, 12 Jan 2023 18:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673546599;
 bh=qTv8IYJOt8rByIYZ3hMM0xkfeBjOZoM5UrpJJu2JU+E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iteD9gQQarvkFOPGPjov6iJZekX0anWu+jb0TbN9NSB7o2hkXOcI/5Syz2w9VSCN1
 2YtndLfOTFAyPjnRheMX2WnSc8lNQgW4VFuSWwPzUhysHETnR9F2u28d+x2Z5dWHjr
 7OKLS2HGfh1lOd4wKWYnYRk+OfpaLagUUmZzncdIWFTVqfa/kOcAGDk3NxEGnVYstD
 9aQRkf7pWTsWqXMeTIk7OA1MS2+bZ6SyLDMz+1aCWr5CQTv43LKZ8WNDrdis+Ttbxw
 fDGhhY9dVG0Id3qQeVwRztfI1YaJfqD6OdYw/yt3ivzF4BeGV5p7AC8PmnOsnrmCuD
 qrQ9OTdK65vzA==
Date: Thu, 12 Jan 2023 18:03:16 +0000
From: Conor Dooley <conor@kernel.org>
To: stage TC <stagethalescristal@gmail.com>
Cc: qemu-riscv@nongnu.org, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: qemu icicle kit es
Message-ID: <Y8BLZLw6gP4hUpyy@spud>
References: <CAJWvPnt95pOb6-QFxrHMH7NNrtxNHKRLjhVoz5A+BZ2Er-joKQ@mail.gmail.com>
 <Y77mjzm4u1V9JXKO@spud>
 <CAJWvPnst42_HH9VN_BvoFXcSjg_z2Nqm-NN-3A3dgQCMy_iDtA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0pieKFcSjvi0SwLC"
Content-Disposition: inline
In-Reply-To: <CAJWvPnst42_HH9VN_BvoFXcSjg_z2Nqm-NN-3A3dgQCMy_iDtA@mail.gmail.com>
Received-SPF: pass client-ip=139.178.84.217; envelope-from=conor@kernel.org;
 helo=dfw.source.kernel.org
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
X-List-Received-Date: Thu, 12 Jan 2023 18:03:33 -0000


--0pieKFcSjvi0SwLC
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

+CC Bin Meng

On Thu, Jan 12, 2023 at 10:52:39AM +0100, stage TC wrote:
> Le mer. 11 janv. 2023 =E0 17:40, Conor Dooley <conor@kernel.org> a =E9cri=
t :
> >On Wed, Jan 11, 2023 at 03:21:26PM +0100, stage TC wrote:
> >> Hello,
> >> Sorry in advance if this is not the right way to do it but I'm a stude=
nt
> >> and not very used to this kind of stuff (first mailing list).
>=20
> >Don't worry, you are doing fine :)

One thing to note, this mail appears to be in html form. I am not sure
what the QEMU mailing lists stance on html mail is, but on other lists
it is frowned upon.
Just an FYI if you end up using other mailing lists in the future.

> >> I'm trying to run qemu for the Microchip PolarFire SoC Icicle kit but =
I'm
> >> facing a few issues and the wiki page about that seems obsolete.
>=20
> >I must admit, it's a long time since I tried to use a v2020.x release of
> >any MPFS software. Last time I did give the steps in the docs a go,
> >with a suitably vintage version of QEMU, things worked as expected.
> >However, using more recent versions of QEMU I ran into some problems
> >with the sd/mmc emulation & never get into U-Boot.
>=20
> I was using qemu 7.1 and then came back to qemu 5.2 to try using the same
> version as the wiki, does the version of qemu have an impact ?

In theory, it shouldn't. I was just suggesting that you use the version
in the Wiki as it had obviously been tested at some point in time.

> Should I use a more recent one ?

Ideally yes, but, like you, I wasn't able to get the example to boot on
recent versions. We had some patches internally that supposedly got
things working for later versions of QEMU but I never got them to work
unfortunately.

Bin Meng, you're listed as a supporter (in master anyway) but is that
still accurate? I figure there's a good chance it isn't anymore?
Have you tested the platform from HSS init at all lately?

> >> I follow almost exactly what the wiki does (except I use a terminal as=
 a
> >> tty instead of the socket bc it didn't work) but my HSS won't boot on
> >> versions more recent than 2020.10 or 0.99.12.
>=20
> >What does "my HSS won't boot" mean? E.g:
> >- Does the MICROCHIP logo banner appear (if it existed back then!)?
> >   If it didnt, the version string I think was.
> >- Does the HSS console appear?
> >- Does it fail to launch the next bootloader stage?
>=20
> With the 0.99.12 and the v2021.02 image the MICROCHIP logo banner appears
> with the HSS console and the next bootloader stage seems to launch
> correctly (see the logs in the attachment).

There is no attachment :(

> With the 0.99.15 the MICROCHIP logo banner appears but the HSS console is
> stuck at "Selecting SD Card ..."
> With a more recent one nothing appends.

Right. I think this one is because a change was made to the FPGA
bitstream around this time so that the eMMC and SD card are muxxed using
a register in the FPGA fabric rather than a GPIO.

Which version of QEMU is this? I can try and see if the emulation is
missing (or broken). That sort of thing I do have time for (anything I
do for QEMU is in my spare time).

> >> However I can't find any image compatible for versions older than 2020=
=2E10
> >> or 0.99.12 (mines hang at "starting kernel ...".
>=20
> >By that do you mean you cannot find a pre-built yocto image? I am not
> >sure that there are any that pre-date the one linked in the wiki that
> >are still available, as those on GitHub only go back as far as v2021.02
>=20
> Yes, that is what I was talking about. The link in the wiki is obsolete a=
nd
> the v2021.2 (the only one left with an sdcard specific version) looks to
> have been tested on HSS 0.99.15.

I'm not sure if there's much point trying an older version of the image
than that that was mentioned in the wiki anyway.

Because it's an FPGA, changes can (*and have been*) be made to the
bitstream that made it incompatible with the emulation of the SoC in
QEMU - memory layout, etc - so I'd likely not suggest using newer
versions either!

> >> Is there any newer version of the tutorial ? Or does anyone have an id=
ea
> on
> >> how to deal with this issue and use qemu for newer versions of the HSS=
 ?
>=20
> >I do my testing with something like:
> >$(QEMU)/qemu-system-riscv64 \
> >        -M microchip-icicle-kit \
> >        -m 2G -smp 5 \
> >        -kernel $(vmlinux_bin) \
> >        -dtb $(devkit).dtb \
> >        -initrd $(initramfs) \
> >        -display none \
> >        -serial null \
> >        -serial stdio
>=20
> >This loads a kernel directly rather than using the HSS - for recent
> >versions of the HSS, implementations of some peripherals need to be
> >added, for example, it checks things like the cache configuration
> >during boot, which are not emulated in QEMU.
>=20
> >For that reason, I've stuck with doing direct kernel boots. Linux
> >v6.0.18 (and the associated devicetree) is the most recent combination
> >that I have booted unmodified using the master branch of QEMU using
> >this method.
>=20
> Thanks, I will try to study and use this method, it may be useful.
>=20
> >More recent (linux) kernels come with a device tree that will require
> >changes in QEMU to support & I have unfortunately not had the time
> >to work on that recently.
> >Sorry that I am really of no help to you.
>=20
> It helps me at least to know that this is not just something easy that I'm
> not able to do for no reason. Thanks.

Yeah, I am sorry :/

Conor.


--0pieKFcSjvi0SwLC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8BLYwAKCRB4tDGHoIJi
0g0/AP94GwR8wLhQYRkVJRsmEg4DqsHEx48aMUgcEKr11gIVBQD8CgRgXM2nbhpE
lX3wQNLBLaw3ztOqevppbQViX3MItQE=
=Rd5q
-----END PGP SIGNATURE-----

--0pieKFcSjvi0SwLC--

