Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F56C001DC
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 14:33:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qP1Wo-000592-6W; Thu, 27 Jul 2023 09:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1qP1Wl-00055A-Bb; Thu, 27 Jul 2023 09:59:39 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1qP1Wj-0006Y0-Nw; Thu, 27 Jul 2023 09:59:39 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 198F660695;
 Thu, 27 Jul 2023 13:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D200AC433C7;
 Thu, 27 Jul 2023 13:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690466368;
 bh=ZzDSIlJCwse1xnbgVm6j02bD6rHDKIR4AehVqHegf3s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TKj1RCXzEA6cODr/OVmx8LaFwnVKzrRTK/XACqnecgaEkNhuMDP3vMMnVHkNtzVGK
 4GgGKLz3gsgrStWPB7wq0L5bQ3EEnBqodxfArjwgRJLYH72MIlLZNgxmEjtl43QN5R
 kr2/IQEyZX2KxHo2Dfu5t/hk2DKGSJu0x4qJ8LrZh/+anVzeIJymLDm7auLEE7dau+
 yB+M7zCXt9RlR3ihrFaG4c7+AMxRivAJOwOLva3KsKgwrEaH44XI2cYgKlpAa2/HfG
 XwuIl4RE+ZMSz5Gr7FWPXcdLXPPjzfp7QEaMxBtHg8JhTfrfgXpCUd0Q3fdA+og/Fp
 Qi0Mm01vU4yAg==
Date: Thu, 27 Jul 2023 14:59:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH for-8.2 v5 09/11] target/riscv: add 'max' CPU type
Message-ID: <20230727-armful-french-e572d80fcac1@spud>
References: <20230720171933.404398-1-dbarboza@ventanamicro.com>
 <20230720171933.404398-10-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TQTLQ3T5Ey+fZbus"
Content-Disposition: inline
In-Reply-To: <20230720171933.404398-10-dbarboza@ventanamicro.com>
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


--TQTLQ3T5Ey+fZbus
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Daniel,

On Thu, Jul 20, 2023 at 02:19:31PM -0300, Daniel Henrique Barboza wrote:
> The 'max' CPU type is used by tooling to determine what's the most
> capable CPU a current QEMU version implements. Other archs such as ARM
> implements this type. Let's add it to RISC-V.
>=20
> What we consider "most capable CPU" in this context are related to
> ratified, non-vendor extensions. This means that we want the 'max' CPU
> to enable all (possible) ratified extensions by default. The reasoning
> behind this design is (1) vendor extensions can conflict with each other
> and we won't play favorities deciding which one is default or not and
> (2) non-ratified extensions are always prone to changes, not being
> stable enough to be enabled by default.
>=20
> All this said, we're still not able to enable all ratified extensions
> due to conflicts between them. Zfinx and all its dependencies aren't
> enabled because of a conflict with RVF. zce, zcmp and zcmt are also
> disabled due to RVD conflicts. When running with 64 bits we're also
> disabling zcf.
>=20
> MISA bits RVG, RVJ and RVV are also being set manually since they're
> default disabled.
>=20
> This is the resulting 'riscv,isa' DT for this new CPU:
>=20
> rv64imafdcvh_zicbom_zicboz_zicsr_zifencei_zihintpause_zawrs_zfa_
> zfh_zfhmin_zca_zcb_zcd_zba_zbb_zbc_zbkb_zbkc_zbkx_zbs_zk_zkn_zknd_
> zkne_zknh_zkr_zks_zksed_zksh_zkt_zve32f_zve64f_zve64d_
> smstateen_sscofpmf_sstc_svadu_svinval_svnapot_svpbmt
>=20
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

I was giving this another go today, like so
$(qemu) -smp 4 -M virt,aia=3Daplic,dumpdtb=3Dqemu.dtb -cpu max -m 1G
which lead to a few
vector version is not specified, use the default value v1.0
printed. Should the max cpu set a vector version w/o user input
being required?

Cheers,
Conor.

--TQTLQ3T5Ey+fZbus
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMJ4PAAKCRB4tDGHoIJi
0uMQAP0cyH+MmoYDq0bYqc1tDH4XJx8aqF7Nnl51fyCgkhswTQD+IGEtJb1Kpfwn
bn0tQDipAdeNStQ35ykLjoCpsinO0gU=
=1IdJ
-----END PGP SIGNATURE-----

--TQTLQ3T5Ey+fZbus--

