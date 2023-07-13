Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C62AC001B0
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 23:05:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qK5MQ-0007I2-Pa; Thu, 13 Jul 2023 19:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1qK5MP-0007HL-2W; Thu, 13 Jul 2023 19:04:33 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1qK5MM-000189-6X; Thu, 13 Jul 2023 19:04:32 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3238E61031;
 Thu, 13 Jul 2023 23:04:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DEC9C433C8;
 Thu, 13 Jul 2023 23:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689289466;
 bh=1K09ZATDMGtU/Wjlv86yDp6E33jdkTulMGE9HRrTfsw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MNR8dunuk08hN7Q4NS/Y2Db6NSokYmyYKuCO3qTrIQsPCIdnhFL7aeghT5LPUVmlG
 wlEiEmQSnwjGVqwizXyfnlds7KbY7arX8xi7RK2eny7C1AitZBz+QAN3VMf2AqDf2+
 1vm4RcgKkPoUEU3hqTGondHjCTTmsODdhqi0Ich2wvu4myg5cX3ayOHsz5ZM6b5zj9
 0/tLDVowTq+TP3WhmoWX7uzGd66bW6bmmkZRCTyu3QOd8CgOfZplZdfGgr1hFj4xNO
 LhNT9cxF49bXiWkKrqz3CEP0oSpRUvJz+NGtEDFqzpGuItGF0dg2GAp3v7ADpJmvY7
 k7kb2BRuYqKfQ==
Date: Fri, 14 Jul 2023 00:04:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 opensbi@lists.infradead.org
Subject: Re: Boot failure after QEMU's upgrade to OpenSBI v1.3 (was Re:
 [PATCH for-8.2 6/7] target/riscv: add 'max' CPU type)
Message-ID: <20230714-gliding-clinking-f2fdfc92823d@spud>
References: <20230712190149.424675-1-dbarboza@ventanamicro.com>
 <20230712190149.424675-7-dbarboza@ventanamicro.com>
 <20230712-stench-happiness-40c2ea831257@spud>
 <3e9b5be8-d3ca-3a17-bef9-4a6a5bdc0ad0@ventanamicro.com>
 <20230712-tulip-replica-0322e71c3e81@spud>
 <744cbde6-7ce5-c327-3c5a-3858e994cc39@ventanamicro.com>
 <20230712-superhero-rabid-578605f52927@spud>
 <5dd3366d-13ba-c7fb-554f-549d97e7d4f9@ventanamicro.com>
 <20230712-fancied-aviator-270f51166407@spud>
 <20230713-craziness-lankiness-8aec3db24993@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OBy3bzb9J6ndpBIV"
Content-Disposition: inline
In-Reply-To: <20230713-craziness-lankiness-8aec3db24993@spud>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=conor@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


--OBy3bzb9J6ndpBIV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2023 at 11:12:33PM +0100, Conor Dooley wrote:
> +CC OpenSBI Mailing list
>=20
> I've not yet had the chance to bisect this, so adding the OpenSBI folks
> to CC in case they might have an idea for what to try.

NVM this, I bisected it. Logs below.

> And a question for you below Daniel.
>=20
> On Wed, Jul 12, 2023 at 11:14:21PM +0100, Conor Dooley wrote:
> > On Wed, Jul 12, 2023 at 06:39:28PM -0300, Daniel Henrique Barboza wrote:
> > > On 7/12/23 18:35, Conor Dooley wrote:
> > > > On Wed, Jul 12, 2023 at 06:09:10PM -0300, Daniel Henrique Barboza w=
rote:
> > > >=20
> > > > > It is intentional. Those default marchid/mimpid vals were derived=
 from the current
> > > > > QEMU version ID/build and didn't mean much.
> > > > >=20
> > > > > It is still possible to set them via "-cpu rv64,marchid=3DN,mimpi=
d=3DN" if needed when
> > > > > using the generic (rv64,rv32) CPUs. Vendor CPUs can't have their =
machine IDs changed
> > > > > via command line.
> > > >=20
> > > > Sounds good, thanks. I did just now go and check icicle to see what=
 it
> > > > would report & it does not boot. I'll go bisect...
> > >=20
> > > BTW how are you booting the icicle board nowadays? I remember you men=
tioning about
> > > some changes in the FDT being required to boot and whatnot.
> >=20
> > I do direct kernel boots, as the HSS doesn't work anymore, and just lie
> > a bit to QEMU about how much DDR we have.
> > .PHONY: qemu-icicle
> > qemu-icicle:
> > 	$(qemu) -M microchip-icicle-kit \
> > 		-m 3G -smp 5 \
> > 		-kernel $(vmlinux_bin) \
> > 		-dtb $(icicle_dtb) \
> > 		-initrd $(initramfs) \
> > 		-display none -serial null \
> > 		-serial stdio \
> > 		-D qemu.log -d unimp
> >=20
> > The platform only supports 2 GiB of DDR, not 3, but if I pass 2 to QEMU
> > it thinks there's 1 GiB at 0x8000_0000 and 1 GiB at 0x10_0000_0000. The
> > upstream devicetree (and current FPGA reference design) expects there to
> > be 1 GiB at 0x8000_0000 and 1 GiB at 0x10_4000_0000. If I lie to QEMU,
> > it thinks there is 1 GiB at 0x8000_0000 and 2 GiB at 0x10_0000_0000, and
> > things just work. I prefer doing it this way than having to modify the
> > DT, it is a lot easier to explain to people this way.
> >=20
> > I've been meaning to work the support for the icicle & mpfs in QEMU, but
> > it just gets shunted down the priority list. I'd really like if a proper
> > boot flow would run in QEMU, which means fixing whatever broke the HSS,
> > but I've recently picked up maintainership of dt-binding stuff in Linux,
> > so I've unfortunately got even less time to try and work on it. Maybe
> > we'll get some new graduate in and I can make them suffer in my stead...
> >=20
> > > If it's not too hard I'll add it in my test scripts to keep it under =
check. Perhaps
> > > we can even add it to QEMU testsuite.
> >=20
> > I don't think it really should be that bad, at least for the direct
> > kernel boot, which is what I mainly care about, since I use it fairly
> > often for debugging boot stuff in Linux.
> >=20
> > Anyways, aa903cf31391dd505b399627158f1292a6d19896 is the first bad comm=
it:
> > commit aa903cf31391dd505b399627158f1292a6d19896
> > Author: Bin Meng <bmeng@tinylab.org>
> > Date:   Fri Jun 30 23:36:04 2023 +0800
> >=20
> >     roms/opensbi: Upgrade from v1.2 to v1.3
> >    =20
> >     Upgrade OpenSBI from v1.2 to v1.3 and the pre-built bios images.
> >=20
> > And I see something like:
> > qemu//build/qemu-system-riscv64 -M microchip-icicle-kit \
> >         -m 3G -smp 5 \
> >         -kernel vmlinux.bin \
> >         -dtb icicle.dtb \
> >         -initrd initramfs.cpio.gz \
> >         -display none -serial null \
> >         -serial stdio \
> >         -D qemu.log -d unimp
>=20
> > qemu-system-riscv64: warning: disabling zca extension for hart 0x000000=
0000000000 because privilege spec version does not match
> > qemu-system-riscv64: warning: disabling zca extension for hart 0x000000=
0000000001 because privilege spec version does not match
> > qemu-system-riscv64: warning: disabling zcd extension for hart 0x000000=
0000000001 because privilege spec version does not match
> > qemu-system-riscv64: warning: disabling zca extension for hart 0x000000=
0000000002 because privilege spec version does not match
> > qemu-system-riscv64: warning: disabling zcd extension for hart 0x000000=
0000000002 because privilege spec version does not match
> > qemu-system-riscv64: warning: disabling zca extension for hart 0x000000=
0000000003 because privilege spec version does not match
> > qemu-system-riscv64: warning: disabling zcd extension for hart 0x000000=
0000000003 because privilege spec version does not match
> > qemu-system-riscv64: warning: disabling zca extension for hart 0x000000=
0000000004 because privilege spec version does not match
> > qemu-system-riscv64: warning: disabling zcd extension for hart 0x000000=
0000000004 because privilege spec version does not match
>=20
> Why am I seeing these warnings? Does the mpfs machine type need to
> disable some things? It only supports rv64imafdc per the DT, and
> predates things like Zca existing, so emitting warnings does not seem
> fair at all to me!

> > OpenSBI v1.3
> >    ____                    _____ ____ _____
> >   / __ \                  / ____|  _ \_   _|
> >  | |  | |_ __   ___ _ __ | (___ | |_) || |
> >  | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
> >  | |__| | |_) |  __/ | | |____) | |_) || |_
> >   \____/| .__/ \___|_| |_|_____/|___/_____|
> >         | |
> >         |_|
> >=20
> > init_coldboot: ipi init failed (error -1009)

This can be reproduced using OpenSBI built using `make PLATFORM=3Dgeneric`
and the QEMU incantation linked above with a -bios argument added to the
incantation.

Thanks,
Conor.

acbd8fce9e5d92f07d344388a3b046f1722ce072 is the first bad commit
commit acbd8fce9e5d92f07d344388a3b046f1722ce072
Author: Anup Patel <apatel@ventanamicro.com>
Date:   Wed Apr 19 21:23:53 2023 +0530

    lib: utils/ipi: Use scratch space to save per-HART MSWI pointer
   =20
    Instead of using a global array indexed by hartid, we should use
    scratch space to save per-HART MSWI pointer.
   =20
    Signed-off-by: Anup Patel <apatel@ventanamicro.com>
    Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

 lib/utils/ipi/aclint_mswi.c | 43 +++++++++++++++++++++++++++++++++--------=
--
 1 file changed, 33 insertions(+), 10 deletions(-)
git bisect start
# status: waiting for both good and bad commits
# bad: [2552799a1df30a3dcd2321a8b75d61d06f5fb9fc] include: Bump-up version =
to 1.3
git bisect bad 2552799a1df30a3dcd2321a8b75d61d06f5fb9fc
# status: waiting for good commit(s), bad commit known
# good: [6b5188ca14e59ce7bf71afe4e7d3d557c3d31bf8] include: Bump-up version=
 to 1.2
git bisect good 6b5188ca14e59ce7bf71afe4e7d3d557c3d31bf8
# good: [6b5188ca14e59ce7bf71afe4e7d3d557c3d31bf8] include: Bump-up version=
 to 1.2
git bisect good 6b5188ca14e59ce7bf71afe4e7d3d557c3d31bf8
# good: [908be1b85c8ff0695ea226fbbf0ff24a779cdece] gpio/starfive: add gpio =
driver and support gpio reset
git bisect good 908be1b85c8ff0695ea226fbbf0ff24a779cdece
# good: [6bc02dede86c47f87e65293b7099e9caf3b22c29] lib: sbi: Simplify sbi_i=
pi_process remove goto
git bisect good 6bc02dede86c47f87e65293b7099e9caf3b22c29
# good: [bbff53fe3b6cdd3c9bc084d489640d7ee2a3f831] lib: sbi_pmu: Use heap f=
or per-HART PMU state
git bisect good bbff53fe3b6cdd3c9bc084d489640d7ee2a3f831
# bad: [f0516beae068ffce0d5a79f09a96904a661a25ba] lib: utils/timer: Use scr=
atch space to save per-HART MTIMER pointer
git bisect bad f0516beae068ffce0d5a79f09a96904a661a25ba
# good: [5a8cfcdf19d98b8dc5dd5a087a2eceb7f5b185fb] lib: utils/ipi: Use heap=
 in ACLINT MSWI driver
git bisect good 5a8cfcdf19d98b8dc5dd5a087a2eceb7f5b185fb
# good: [7e5636ac3788451991a65791c5adcc7798dcc22a] lib: utils/timer: Use he=
ap in ACLINT MTIMER driver
git bisect good 7e5636ac3788451991a65791c5adcc7798dcc22a
# bad: [acbd8fce9e5d92f07d344388a3b046f1722ce072] lib: utils/ipi: Use scrat=
ch space to save per-HART MSWI pointer
git bisect bad acbd8fce9e5d92f07d344388a3b046f1722ce072
# good: [3c1c972cb69d670ddc309391c4db76f1f19fd77e] lib: utils/fdt: Use heap=
 in FDT domain parsing
git bisect good 3c1c972cb69d670ddc309391c4db76f1f19fd77e
# first bad commit: [acbd8fce9e5d92f07d344388a3b046f1722ce072] lib: utils/i=
pi: Use scratch space to save per-HART MSWI pointer


--OBy3bzb9J6ndpBIV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLCC9gAKCRB4tDGHoIJi
0kG7AQC3zmEmqXtoodXUe6YiHv29dzcKfuM896hcDRxnEcFTBwD/V+mqhRKO786+
pufkSwbRWJFownHycfma5JaP3GFoxQg=
=T2KC
-----END PGP SIGNATURE-----

--OBy3bzb9J6ndpBIV--

