Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638B7C0015E
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 22:48:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qK56F-0004Nf-5i; Thu, 13 Jul 2023 18:47:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1qK567-0004N1-Fu; Thu, 13 Jul 2023 18:47:45 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1qK565-0005Va-8s; Thu, 13 Jul 2023 18:47:43 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 80AA361B5F;
 Thu, 13 Jul 2023 22:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D798C433C8;
 Thu, 13 Jul 2023 22:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689288457;
 bh=UzeSnauLuFYhygMDMp358nav1jPskvc9yOs9rXFQEU0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QgAdrRH/gopv+XZe8yX14rfX3az7/tjpp/wRJ/luDStqdHV4tS55ecwCqK8lLrY4A
 DREIE8wE8UlO1sUKj5ftQEn10KmV5L0TR1m1Ha1qBrPvUD5S5evM4q7x9p04ca1Lfs
 fwtEHP/dCIbe88ciu60JElrwNlpSSk+0q42RmehQdPF0j2RZ19NnLq7Ieaftn+yTzo
 glYBm6adEgTVZOTaHnjze3eDvK9FYwnMsUCrbStFqUTnfWIIAzLEbMBTcAmDG+TvPQ
 Bdn8kbCfXr+ndjGgcCbd8o7ZxGZIlcQ5SwRsId3SIzG0HrusMvhe7wbHxyQdyoX1Ju
 vjzwbtT2JTKSA==
Date: Thu, 13 Jul 2023 23:47:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: Boot failure after QEMU's upgrade to OpenSBI v1.3 (was Re:
 [PATCH for-8.2 6/7] target/riscv: add 'max' CPU type)
Message-ID: <20230713-tank-blubber-2501cf7a0cf1@spud>
References: <20230712190149.424675-7-dbarboza@ventanamicro.com>
 <20230712-stench-happiness-40c2ea831257@spud>
 <3e9b5be8-d3ca-3a17-bef9-4a6a5bdc0ad0@ventanamicro.com>
 <20230712-tulip-replica-0322e71c3e81@spud>
 <744cbde6-7ce5-c327-3c5a-3858e994cc39@ventanamicro.com>
 <20230712-superhero-rabid-578605f52927@spud>
 <5dd3366d-13ba-c7fb-554f-549d97e7d4f9@ventanamicro.com>
 <20230712-fancied-aviator-270f51166407@spud>
 <20230713-craziness-lankiness-8aec3db24993@spud>
 <f5f76a03-411c-fb7e-5c21-f261a0e0b141@ventanamicro.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fhmgjCfwbySN7gf/"
Content-Disposition: inline
In-Reply-To: <f5f76a03-411c-fb7e-5c21-f261a0e0b141@ventanamicro.com>
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


--fhmgjCfwbySN7gf/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2023 at 07:35:01PM -0300, Daniel Henrique Barboza wrote:
> On 7/13/23 19:12, Conor Dooley wrote:

> > And a question for you below Daniel.
> >=20
> > On Wed, Jul 12, 2023 at 11:14:21PM +0100, Conor Dooley wrote:


> >=20
> > > qemu-system-riscv64: warning: disabling zca extension for hart 0x0000=
000000000000 because privilege spec version does not match
> > > qemu-system-riscv64: warning: disabling zca extension for hart 0x0000=
000000000001 because privilege spec version does not match
> > > qemu-system-riscv64: warning: disabling zcd extension for hart 0x0000=
000000000001 because privilege spec version does not match
> > > qemu-system-riscv64: warning: disabling zca extension for hart 0x0000=
000000000002 because privilege spec version does not match
> > > qemu-system-riscv64: warning: disabling zcd extension for hart 0x0000=
000000000002 because privilege spec version does not match
> > > qemu-system-riscv64: warning: disabling zca extension for hart 0x0000=
000000000003 because privilege spec version does not match
> > > qemu-system-riscv64: warning: disabling zcd extension for hart 0x0000=
000000000003 because privilege spec version does not match
> > > qemu-system-riscv64: warning: disabling zca extension for hart 0x0000=
000000000004 because privilege spec version does not match
> > > qemu-system-riscv64: warning: disabling zcd extension for hart 0x0000=
000000000004 because privilege spec version does not match
> >=20
> > Why am I seeing these warnings? Does the mpfs machine type need to
> > disable some things? It only supports rv64imafdc per the DT, and
> > predates things like Zca existing, so emitting warnings does not seem
> > fair at all to me!
>=20
> QEMU will disable extensions that are newer than a priv spec version that=
 is set
> by the CPU. IIUC the icicle board is running a sifive_u54 CPU by default.=
 That
> CPU has a priv spec version 1_10_0. The CPU is also enabling C.
>=20
> We will enable zca if C is enabled. C and D enabled will also enable zcd.=
 But
> then the priv check will disabled both because zca and zcd have priv spec=
 1_12_0.
>=20
> This is a side effect for a change that I did a few months ago. Back then=
 we
> weren't disabling stuff correctly.

Yah, I did check out the blame, hence directing it at you. Thanks for
the explanation.

> The warnings are annoying but are benign.

To be honest, benign or not, this is kind of thing is only going to
lead to grief. Even though only the direct kernel boot works, we do
actually have some customers that are using the icicle target in QEMU.

> And apparently the sifive_u54 CPU is being inconsistent for some time and
> we noticed just now.
> Now, if the icicle board is supposed to have zca and zcd then we have a p=
roblem.

I don't know, this depends on how you see things in QEMU. I would say
that it supports c, and not Zca/Zcf/Zcd, given it predates the
extensions. I have no interest in retrofitting my devicetree stuff with
them, for example.

> We'll need to discuss whether we move sifive_u54 CPU priv spec to 1_12_0 =
(I'm not
> sure how this will affect other boards that uses this CPU) or remove this=
 priv spec
> disable code altogether from QEMU.

I think you should stop warning for this? From my dumb-user perspective,
the warning only "scares" me into thinking something is wrong, when
there isn't. I can see a use case for the warning where someone tries to
enable Zca & Co. in their QEMU incantation for a CPU that does not
have the correct privilege level to support it, but I didn't try to set
any options at all in that way, so the warnings seem unfair?

Cheers,
Conor.

--fhmgjCfwbySN7gf/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLB/BQAKCRB4tDGHoIJi
0nmnAQDenqiXmdydGyMmECmFVPp3TE0rPj1qLoIOl55N4sHpXgD7BitoyeFikT9W
n0N21/G8Jls/mZOQ40GV50ewqg2WQws=
=ZNMv
-----END PGP SIGNATURE-----

--fhmgjCfwbySN7gf/--

