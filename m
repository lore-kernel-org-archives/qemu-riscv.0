Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBB3C001B0
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 22:13:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qK4YS-0006dY-2G; Thu, 13 Jul 2023 18:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1qK4YL-0006cu-Q9; Thu, 13 Jul 2023 18:12:49 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1qK4YJ-0003pS-Nz; Thu, 13 Jul 2023 18:12:49 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 81B4861B6F;
 Thu, 13 Jul 2023 22:12:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D46D5C433C7;
 Thu, 13 Jul 2023 22:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689286357;
 bh=JWSI52Ys9Z3iESYFAXavGkLEVg9T1qoqVhnYqxndMKM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aArYY3tgbgP3iUMVaAVbHJB2+JsMke9MqdxmbSG+FuuF+PMLib1jwHsMpMcDQMiCq
 YZahnSPeyBjt6iwuRmXtVkuGbhDDz44zhu8GQNy/RHT0OVsTT+1nc+gHnxPHkBXRF5
 cfYrbKzw/GOj/aJ48DvZFxQBPqTCoAD1yAshgnO7kR8ituLA+nD0E71472oTVQLRi4
 lMh+MPmMWKsnWsdeIF/YW/1KYD9wKfSVGKptkQXwgHpCIInra6apZ9gCGeewV0AnOm
 gRnTYLM7Sr71urwF8nK/2PH/+N9nz0CZit+eTYMQ9Re+YrqY5t5imSqzTxMuGtKVP3
 yyA0QgPn40TlQ==
Date: Thu, 13 Jul 2023 23:12:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 opensbi@lists.infradead.org
Subject: Boot failure after QEMU's upgrade to OpenSBI v1.3 (was Re: [PATCH
 for-8.2 6/7] target/riscv: add 'max' CPU type)
Message-ID: <20230713-craziness-lankiness-8aec3db24993@spud>
References: <20230712190149.424675-1-dbarboza@ventanamicro.com>
 <20230712190149.424675-7-dbarboza@ventanamicro.com>
 <20230712-stench-happiness-40c2ea831257@spud>
 <3e9b5be8-d3ca-3a17-bef9-4a6a5bdc0ad0@ventanamicro.com>
 <20230712-tulip-replica-0322e71c3e81@spud>
 <744cbde6-7ce5-c327-3c5a-3858e994cc39@ventanamicro.com>
 <20230712-superhero-rabid-578605f52927@spud>
 <5dd3366d-13ba-c7fb-554f-549d97e7d4f9@ventanamicro.com>
 <20230712-fancied-aviator-270f51166407@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3+Xl0BF39KDqZOo2"
Content-Disposition: inline
In-Reply-To: <20230712-fancied-aviator-270f51166407@spud>
Received-SPF: pass client-ip=139.178.84.217; envelope-from=conor@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org


--3+Xl0BF39KDqZOo2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

+CC OpenSBI Mailing list

I've not yet had the chance to bisect this, so adding the OpenSBI folks
to CC in case they might have an idea for what to try.

And a question for you below Daniel.

On Wed, Jul 12, 2023 at 11:14:21PM +0100, Conor Dooley wrote:
> On Wed, Jul 12, 2023 at 06:39:28PM -0300, Daniel Henrique Barboza wrote:
> > On 7/12/23 18:35, Conor Dooley wrote:
> > > On Wed, Jul 12, 2023 at 06:09:10PM -0300, Daniel Henrique Barboza wro=
te:
> > >=20
> > > > It is intentional. Those default marchid/mimpid vals were derived f=
rom the current
> > > > QEMU version ID/build and didn't mean much.
> > > >=20
> > > > It is still possible to set them via "-cpu rv64,marchid=3DN,mimpid=
=3DN" if needed when
> > > > using the generic (rv64,rv32) CPUs. Vendor CPUs can't have their ma=
chine IDs changed
> > > > via command line.
> > >=20
> > > Sounds good, thanks. I did just now go and check icicle to see what it
> > > would report & it does not boot. I'll go bisect...
> >=20
> > BTW how are you booting the icicle board nowadays? I remember you menti=
oning about
> > some changes in the FDT being required to boot and whatnot.
>=20
> I do direct kernel boots, as the HSS doesn't work anymore, and just lie
> a bit to QEMU about how much DDR we have.
> .PHONY: qemu-icicle
> qemu-icicle:
> 	$(qemu) -M microchip-icicle-kit \
> 		-m 3G -smp 5 \
> 		-kernel $(vmlinux_bin) \
> 		-dtb $(icicle_dtb) \
> 		-initrd $(initramfs) \
> 		-display none -serial null \
> 		-serial stdio \
> 		-D qemu.log -d unimp
>=20
> The platform only supports 2 GiB of DDR, not 3, but if I pass 2 to QEMU
> it thinks there's 1 GiB at 0x8000_0000 and 1 GiB at 0x10_0000_0000. The
> upstream devicetree (and current FPGA reference design) expects there to
> be 1 GiB at 0x8000_0000 and 1 GiB at 0x10_4000_0000. If I lie to QEMU,
> it thinks there is 1 GiB at 0x8000_0000 and 2 GiB at 0x10_0000_0000, and
> things just work. I prefer doing it this way than having to modify the
> DT, it is a lot easier to explain to people this way.
>=20
> I've been meaning to work the support for the icicle & mpfs in QEMU, but
> it just gets shunted down the priority list. I'd really like if a proper
> boot flow would run in QEMU, which means fixing whatever broke the HSS,
> but I've recently picked up maintainership of dt-binding stuff in Linux,
> so I've unfortunately got even less time to try and work on it. Maybe
> we'll get some new graduate in and I can make them suffer in my stead...
>=20
> > If it's not too hard I'll add it in my test scripts to keep it under ch=
eck. Perhaps
> > we can even add it to QEMU testsuite.
>=20
> I don't think it really should be that bad, at least for the direct
> kernel boot, which is what I mainly care about, since I use it fairly
> often for debugging boot stuff in Linux.
>=20
> Anyways, aa903cf31391dd505b399627158f1292a6d19896 is the first bad commit:
> commit aa903cf31391dd505b399627158f1292a6d19896
> Author: Bin Meng <bmeng@tinylab.org>
> Date:   Fri Jun 30 23:36:04 2023 +0800
>=20
>     roms/opensbi: Upgrade from v1.2 to v1.3
>    =20
>     Upgrade OpenSBI from v1.2 to v1.3 and the pre-built bios images.
>=20
> And I see something like:
> qemu//build/qemu-system-riscv64 -M microchip-icicle-kit \
>         -m 3G -smp 5 \
>         -kernel vmlinux.bin \
>         -dtb icicle.dtb \
>         -initrd initramfs.cpio.gz \
>         -display none -serial null \
>         -serial stdio \
>         -D qemu.log -d unimp

> qemu-system-riscv64: warning: disabling zca extension for hart 0x00000000=
00000000 because privilege spec version does not match
> qemu-system-riscv64: warning: disabling zca extension for hart 0x00000000=
00000001 because privilege spec version does not match
> qemu-system-riscv64: warning: disabling zcd extension for hart 0x00000000=
00000001 because privilege spec version does not match
> qemu-system-riscv64: warning: disabling zca extension for hart 0x00000000=
00000002 because privilege spec version does not match
> qemu-system-riscv64: warning: disabling zcd extension for hart 0x00000000=
00000002 because privilege spec version does not match
> qemu-system-riscv64: warning: disabling zca extension for hart 0x00000000=
00000003 because privilege spec version does not match
> qemu-system-riscv64: warning: disabling zcd extension for hart 0x00000000=
00000003 because privilege spec version does not match
> qemu-system-riscv64: warning: disabling zca extension for hart 0x00000000=
00000004 because privilege spec version does not match
> qemu-system-riscv64: warning: disabling zcd extension for hart 0x00000000=
00000004 because privilege spec version does not match

Why am I seeing these warnings? Does the mpfs machine type need to
disable some things? It only supports rv64imafdc per the DT, and
predates things like Zca existing, so emitting warnings does not seem
fair at all to me!

>=20
> OpenSBI v1.3
>    ____                    _____ ____ _____
>   / __ \                  / ____|  _ \_   _|
>  | |  | |_ __   ___ _ __ | (___ | |_) || |
>  | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
>  | |__| | |_) |  __/ | | |____) | |_) || |_
>   \____/| .__/ \___|_| |_|_____/|___/_____|
>         | |
>         |_|
>=20
> init_coldboot: ipi init failed (error -1009)
>=20
> Just to note, because we use our own firmware that vendors in OpenSBI
> and compiles only a significantly cut down number of files from it, we
> do not use the fw_dynamic etc flow on our hardware. As a result, we have
> not tested v1.3, nor do we have any immediate plans to change our
> platform firmware to vendor v1.3 either.
>=20
> I unless there's something obvious to you, it sounds like I will need to
> go and bisect OpenSBI. That's a job for another day though, given the
> time.
>=20
> Cheers,
> Conor.



--3+Xl0BF39KDqZOo2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLB20QAKCRB4tDGHoIJi
0lh5AP9EHKVWMWWHUNeuQUhzx5sU7p5FP2DxKvo4ZHZRoJrxvAEA3F4uytBQib7K
GTMuCxEnVsJxGlTtmwsSQ/+fsLfSvgg=
=vnIF
-----END PGP SIGNATURE-----

--3+Xl0BF39KDqZOo2--

