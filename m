Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pJJtR-0007hW-FP
	for mharc-qemu-riscv@gnu.org; Sat, 21 Jan 2023 14:51:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1pJJtQ-0007h6-Mt; Sat, 21 Jan 2023 14:51:12 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1pJJtO-0007Y8-Mv; Sat, 21 Jan 2023 14:51:12 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5E73D60B07;
 Sat, 21 Jan 2023 19:51:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C04DCC433D2;
 Sat, 21 Jan 2023 19:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674330665;
 bh=5xv3EI3R/s6bgkFlULHWIsu8pYY/Wht1FAiQ/i9EMng=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZYz06FYiO6X0AsPHzQsonkLElutrZLAHMwDFiFmv5f5oiHND5KITEr7xqTAjUbzRr
 Q4StMMVYL0A/7OTIXT5+L6GfIq09HLxwQaO6slZgfyJAQMseX2JvOii8xYp7jWr54V
 4fYOJcjA31+KxV1ANOh42Ooomx6tlrp9mRNx8qyPNNJCa1oYLJ6L/gTQwCpiHsa6GL
 jJsD6Rf2v8yGtFXzK6isyTz2tqdGTGZBK34DNuaLJBex6b/YUgOsvqytGfK5Jf3C+O
 rDizzmJB+TRBY8lk/cSnfslpzdLIww5ps8G+duIQ6SePt839nRQTc+25vddQQikMNE
 odvGPKhtqHl5A==
Date: Sat, 21 Jan 2023 19:51:02 +0000
From: Conor Dooley <conor@kernel.org>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
Subject: Re: [PATCH v3 3/7] hw/riscv/microchip_pfsoc.c: add an Icicle Kit fdt
 address function
Message-ID: <Y8xCJqP9t6FzZ4OH@spud>
References: <20230119191728.622081-1-dbarboza@ventanamicro.com>
 <20230119191728.622081-4-dbarboza@ventanamicro.com>
 <Y8ndFjv9prrRXLnL@spud>
 <385b977b-d15f-6c54-1d05-ab68e122dfe8@ventanamicro.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7/9P0CDH7AfIHltX"
Content-Disposition: inline
In-Reply-To: <385b977b-d15f-6c54-1d05-ab68e122dfe8@ventanamicro.com>
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
X-List-Received-Date: Sat, 21 Jan 2023 19:51:13 -0000


--7/9P0CDH7AfIHltX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 21, 2023 at 02:58:19PM -0300, Daniel Henrique Barboza wrote:
> Conor,
>=20
> Thanks for the Icicle-kit walk-through!

nw chief

> I'll not claim that I fully understood it,
> but I understood enough to handle the situation ATM.

tbf, I struggle to explain/visualise that stuff with the "windows" etc
well. I wrote myself a program to visualise it for a good reason!
Well it was done in Rust, so there were two good reasons ;)

> Without this change, this is where the FDT is being installed in the boar=
d when
> I start it with 8Gb of RAM (retrieved via 'info roms'):
>=20
> addr=3D00000000bfe00000 size=3D0x00a720 mem=3Dram name=3D"fdt"
>=20
> Which surprised me at first because this is almost at the end of the LO a=
rea which has
> 1Gb and I figured it would be in the middle of another RAM area. I took a=
nother read
> at what we're doing in riscv_load_fdt():
>=20
> -----------
> temp =3D (dram_base < 3072 * MiB) ?  MIN(dram_end, 3072 * MiB) : dram_end;
> fdt_addr =3D QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
> -----------
>=20
> This code can be read as "if the starting address of the RAM is lower tha=
n 3Gb, put
> the FDT no further than 3Gb (0xc0000000). Otherwise, put it at the end of=
 dram",
> where "dram_base" is the starting address of the RAM block that the funct=
ion
> receives.
>=20
> For icicle-kit, this is being passed as  memmap[MICROCHIP_PFSOC_DRAM_LO].=
base,
> 0x80000000, which is 2Gb.
>=20
> So, regardless of how much RAM we have (dram_end), the FDT will always be=
 capped at
> 3Gb. At this moment, this fits exactly at the end of the LO area for the =
Icicle Kit.
> Which is funny because this 3Gb restriction was added by commit 1a475d39e=
f54 to fix
> 32 bit guest boot and it happened to also work for the Microchip SoC.

That's hilariously convenient hahah

> So yeah, I thought that I was fixing a bug and in the end I caused one. T=
his patch
> needs to go.
>=20
> Alistair, I believe I should re-send v2, this time explaining why the exi=
sting function
> will not break the Microchip board because we'll never put the FDT out of=
 the LO area
> of the board. Does this work for you?
> Conor, one more thing:
>=20
>=20
> On 1/19/23 21:15, Conor Dooley wrote:
> > Hey Daniel,
> >=20
> > Got through the stuff I wanted to get done tonight faster than
> > expected...
> >=20
> > On Thu, Jan 19, 2023 at 05:17:33PM -0300, Daniel Henrique Barboza wrote:
> > > Are you testing it by using the command line
> > > you mentioned in the "qemu icicle kit es" thread?
> > >=20
> > > $(QEMU)/qemu-system-riscv64 \
> > > 	-M microchip-icicle-kit \
> > > 	-m 2G -smp 5 \
> > > 	-kernel $(vmlinux_bin) \
> > > 	-dtb $(devkit).dtb \
> > > 	-initrd $(initramfs) \
> > > 	-display none \
> > > 	-serial null \
> > > 	-serial stdio
> >=20
> > Yah, effectively. It's not quite that, but near enough as makes no real
> > difference:
> > qemu-icicle:
> > 	$(QEMU)/qemu-system-riscv64 -M microchip-icicle-kit \
> > 		-m 2G -smp 5 \
> > 		-kernel $(vmlinux_bin) \
> > 		-dtb $(wrkdir)/riscvpc.dtb \
> > 		-initrd $(initramfs) \
> > 		-display none -serial null \
> > 		-serial stdio \
> > 		-D qemu.log -d unimp
> >=20
> > I just tried to make things somewhat more intelligible for that thread.
>=20
> I tried it out with kernel v6.0.0 (I saw you mentioning in the other thre=
ad that
> this was the latest kernel you were able to boot this way)

Yah, I said that because I didn't want them to have to mess with DT.
Later kernels do work, but need DT modifications as things are now
configured for the below case.
> > The current Devicetree in Linux & U-Boot corresponds to a configuration
> > like:
> > =E2=A2=B0=E2=A0=92=E2=A0=92=E2=A0=92=E2=A0=92=E2=A1=96=E2=A0=92=E2=A0=
=92=E2=A0=92=E2=A3=B6=E2=A0=920x80000000
> > =E2=A2=B8    =E2=A1=87   =E2=A3=BF =E2=A1=87
> > =E2=A2=B8    =E2=A1=87   =E2=A1=9F =E2=A1=87
> > =E2=A2=B8    =E2=A1=87   =E2=A1=87 =E2=A1=87
> > =E2=A2=B8    =E2=A1=87   =E2=A1=87 =E2=A1=87
> > =E2=A2=B8    =E2=A1=87   =E2=A1=87 =E2=A1=87
> > =E2=A2=B8    =E2=A1=87   =E2=A1=87 =E2=A1=87
> > =E2=A2=B8    =E2=A1=87   =E2=A1=87 =E2=A1=87
> > =E2=A2=B8=E2=A1=96=E2=A0=92=E2=A0=92=E2=A2=B2=E2=A1=87   =E2=A1=87 0x40=
000000
> > =E2=A2=B8=E2=A1=87  =E2=A2=B8=E2=A1=87   =E2=A1=87 =E2=A1=87
> > =E2=A2=B8=E2=A1=87  =E2=A2=B8=E2=A1=87   =E2=A1=87 =E2=A1=87
> > =E2=A2=B8=E2=A1=87  =E2=A2=B8=E2=A1=87   =E2=A1=87 =E2=A1=87
> > =E2=A2=B8=E2=A1=87  =E2=A2=B8=E2=A1=87   =E2=A1=87 =E2=A1=87
> > =E2=A2=B8=E2=A1=87  =E2=A2=B8=E2=A1=87   =E2=A1=87 =E2=A1=87
> > =E2=A2=B8=E2=A1=87  =E2=A2=B8=E2=A1=87   =E2=A1=87 =E2=A1=87
> > =E2=A2=B8=E2=A1=87  =E2=A2=B8=E2=A1=87   =E2=A1=87 =E2=A1=87 <-- 32- & =
64-bit start at 0x0
> > =E2=A0=98=E2=A0=93=E2=A0=920=E2=A0=9A=E2=A0=93=E2=A0=921=E2=A0=92=E2=A0=
=93=E2=A0=920x00000000
> >=20
> > That DT looks like:
> > 	ddrc_cache_lo: memory@80000000 {
> > 		device_type =3D "memory";
> > 		reg =3D <0x0 0x80000000 0x0 0x40000000>;
> > 		status =3D "okay";
> > 	};
> >=20
> > 	ddrc_cache_hi: memory@1040000000 {
> > 		device_type =3D "memory";
> > 		reg =3D <0x10 0x40000000 0x0 0x40000000>;
> > 		status =3D "okay";
> > 	};

This one doesn't work in QEMU, so for those kernels I just delete the
ddrc_cache_hi node, and v6.2-rcN works in that way.

> and it booted up until
> the kernel complained about missing initramfs. Any tips on how I can buil=
d an
> initrd disk for the board?

Ehh, any old initramfs for RISC-V should work, right? I suppose passing
a normal rootfs does either - I just mostly work w/ hardware & use NFS
there, so have nothing scripted to build a rootfs for me, which is why
I've been using initramfs.
I build one using buildroot, with a config like:
https://raw.githubusercontent.com/ConchuOD/riscv-env/dev/conf/lowmem/buildr=
oot_initramfs_config

I then do (ripped from my makefile rule):
		$(linux_srcdir)/usr/gen_initramfs.sh \
		-o initramfs.cpio -u $(shell id -u) -g $(shell id -g) \
		initramfs.txt \
		$(path_to_buildroot_sysroot)

I'm lazy and CBA finding somewhere else to host this, so I put one here:
https://github.com/ConchuOD/riscv-env/releases/download/v2022.03/initramfs.=
cpio.gz

Thanks,
Conor.

--7/9P0CDH7AfIHltX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8xCJgAKCRB4tDGHoIJi
0qSNAP4lhmtV5x7uyEuDWom4NMNJGCxrcpB0Kfms8h9NqiB0VwD+PESebJpDpN0f
u1pYuD8j9MgvbSsHzDwGLt7vV6eTUAo=
=vZg/
-----END PGP SIGNATURE-----

--7/9P0CDH7AfIHltX--

