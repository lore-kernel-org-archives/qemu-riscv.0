Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F3BEB64DA
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 21:00:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJgwv-0005Ea-Dk; Wed, 12 Jul 2023 17:00:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1qJgwq-0004Rl-9Q; Wed, 12 Jul 2023 17:00:32 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1qJgwn-0006A6-1N; Wed, 12 Jul 2023 17:00:31 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D12ED6177D;
 Wed, 12 Jul 2023 21:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D634C433C9;
 Wed, 12 Jul 2023 21:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689195626;
 bh=MzU4JaHWLVqRPEFUoJWgN2SPPFG1UIJj4o+UvO3WvZs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dvkHmb/V0xUg+UPhu5vdTofahmijMyUi6Q4L0o8UF1bofGeAi2SY5gicdnBeY2Bax
 UVO7ndJfPd5vAmlzdHgB63Fy8Txg+yZ15vYrcNaN+vCIbsyKbBmd+B7N1liDjWWNJL
 CTCBZOV8WeD0CCLxTweC6eXUp/vsxgmyUXX1UJD40NTfnweSzRe2LtzoE5yfo0O9fG
 pFIXJ4E6Ny/kRKcVN6dPbDBFqVKkj47fYRnK5XQDlmzLShMD1RzLXU5EfreZLlZKTr
 HsVw4xVAGWG5aBwpykswHxvFGsp7M5TT52OmWEoM9OD2Q5ll9n+UT3BRRXE1xpz3R+
 /gj/4fWWROFlw==
Date: Wed, 12 Jul 2023 22:00:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH for-8.2 6/7] target/riscv: add 'max' CPU type
Message-ID: <20230712-tulip-replica-0322e71c3e81@spud>
References: <20230712190149.424675-1-dbarboza@ventanamicro.com>
 <20230712190149.424675-7-dbarboza@ventanamicro.com>
 <20230712-stench-happiness-40c2ea831257@spud>
 <3e9b5be8-d3ca-3a17-bef9-4a6a5bdc0ad0@ventanamicro.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qvnpB1X8LNpbMcS+"
Content-Disposition: inline
In-Reply-To: <3e9b5be8-d3ca-3a17-bef9-4a6a5bdc0ad0@ventanamicro.com>
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


--qvnpB1X8LNpbMcS+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 12, 2023 at 05:30:41PM -0300, Daniel Henrique Barboza wrote:
> On 7/12/23 16:22, Conor Dooley wrote:
> > On Wed, Jul 12, 2023 at 04:01:48PM -0300, Daniel Henrique Barboza wrote:
> > > The 'max' CPU type is used by tooling to determine what's the most
> > > capable CPU a current QEMU version implements. Other archs such as ARM
> > > implements this type. Let's add it to RISC-V.
> > >=20
> > > What we consider "most capable CPU" in this context are related to
> > > ratified, non-vendor extensions. This means that we want the 'max' CPU
> > > to enable all (possible) ratified extensions by default. The reasoning
> > > behind this design is (1) vendor extensions can conflict with each ot=
her
> > > and we won't play favorities deciding which one is default or not and
> > > (2) non-ratified extensions are always prone to changes, not being
> > > stable enough to be enabled by default.
> > >=20
> > > All this said, we're still not able to enable all ratified extensions
> > > due to conflicts between them. Zfinx and all its dependencies aren't
> > > enabled because of a conflict with RVF. zce, zcmp and zcmt are also
> > > disabled due to RVD conflicts. When running with 64 bits we're also
> > > disabling zcf.
> > >=20
> > > Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> >=20
> > This seems like it will be super helpful for CI stuff etc, thanks for
> > doing it.
>=20
> And Linux actually boots on it, which was remarkable to see. I was expect=
ing something
> to blow up I guess.
>=20
> This is the riscv,isa DT generated:
>=20
> # cat /proc/device-tree/cpus/cpu@0/riscv,isa
> rv64imafdch_zicbom_zicboz_zicsr_zifencei_zihintpause_zawrs_zfa_zfh_zfhmin=
_zca_zcb_zcd_
> zba_zbb_zbc_zbkb_zbkc_zbkx_zbs_zk_zkn_zknd_zkne_zknh_zkr_zks_zksed_zksh_z=
kt_
> zve32f_zve64f_zve64d_smstateen_sscofpmf_sstc_svadu_svinval_svnapot_svpbmt#

Of which an upstream Linux kernel, building using something close to
defconfig, accepts only
rv64imafdch_zicbom_zicboz_zicntr_zicsr_zifencei_zihintpause_zihpm_zba_zbb_z=
bs_sscofpmf_sstc_svinval_svnapot_svpbmt
so the set of possible things that break could break it has been reduced
somewhat.

btw, I noticed that the default marchid/mimpid have changed. Previously I
used to see something like:
processor       : 15
hart            : 15
isa             : rv64imafdcvh_zicbom_zicboz_zicntr_zicsr_zifencei_zihintpa=
use_zihpm_zba_zbb_zbs_sscofpmf_sstc
mmu             : sv57
mvendorid       : 0x0
marchid         : 0x80032
mimpid          : 0x80032
in /proc/cpuinfo, but "now" I see 0x0 for marchid & mimpid. Is this
change to the default behaviour intentional? I saw "now" in "s because
I applied your patches on top of Alistair's next branch, which contains
the changes to m*id stuff.

Cheers,
Conor.

--qvnpB1X8LNpbMcS+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZK8UZQAKCRB4tDGHoIJi
0jNaAQDkxbC1CxOq2DksBA/h5xFhi5Mh1O1gO9otwjPB6giTIAEA/P2PfN9Wcudz
eRoiagbvq92dX7BgvxHqOORaFrpBVQ8=
=Xu19
-----END PGP SIGNATURE-----

--qvnpB1X8LNpbMcS+--

