Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406F0EB64DA
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 21:35:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJhUN-0004mz-Nq; Wed, 12 Jul 2023 17:35:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1qJhUK-0004mI-RS; Wed, 12 Jul 2023 17:35:09 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1qJhUJ-000523-9k; Wed, 12 Jul 2023 17:35:08 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 12D1A61927;
 Wed, 12 Jul 2023 21:35:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A01C433C8;
 Wed, 12 Jul 2023 21:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689197704;
 bh=gPj0baPX5VYP/r3GKsB/fuBDkrq+C3tm6Xm3T2h/tsM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=czs4AgDzt9OkDWFEb0I+cEKrcOTW0NkrLU/7JqhRZOkzXPs4hBpm7NtxdKu3rjLXb
 S1s1Iq5W5Fw0GFAK6PaNsLCz5UOj+ZTwg8TDC91Bg9iqdjMOC5XkjiB7/bGox8jWIt
 iGomMCO6EZxDwZyxlLgCT29IXndFX9/UAGVKD8MZ3ZNc9S39YvBtqYoq5XhkL8XMEk
 DVxLiDPm6yJs23rIT/jKQxQegBv/PWwV9v05+CtRSTKHhVU4qOA3/+37ucgQnfTIu4
 Lu9Ezfnhm8q8OL4c7lbQhMcdwo9OVZTnBuxoxuffHKSknTU+v9hRuwkV7+DccZGQ8Q
 lbXPzkKVY5/+w==
Date: Wed, 12 Jul 2023 22:35:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH for-8.2 6/7] target/riscv: add 'max' CPU type
Message-ID: <20230712-superhero-rabid-578605f52927@spud>
References: <20230712190149.424675-1-dbarboza@ventanamicro.com>
 <20230712190149.424675-7-dbarboza@ventanamicro.com>
 <20230712-stench-happiness-40c2ea831257@spud>
 <3e9b5be8-d3ca-3a17-bef9-4a6a5bdc0ad0@ventanamicro.com>
 <20230712-tulip-replica-0322e71c3e81@spud>
 <744cbde6-7ce5-c327-3c5a-3858e994cc39@ventanamicro.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="miIp1PN+tlxmhFI+"
Content-Disposition: inline
In-Reply-To: <744cbde6-7ce5-c327-3c5a-3858e994cc39@ventanamicro.com>
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


--miIp1PN+tlxmhFI+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 12, 2023 at 06:09:10PM -0300, Daniel Henrique Barboza wrote:

> It is intentional. Those default marchid/mimpid vals were derived from th=
e current
> QEMU version ID/build and didn't mean much.
>=20
> It is still possible to set them via "-cpu rv64,marchid=3DN,mimpid=3DN" i=
f needed when
> using the generic (rv64,rv32) CPUs. Vendor CPUs can't have their machine =
IDs changed
> via command line.

Sounds good, thanks. I did just now go and check icicle to see what it
would report & it does not boot. I'll go bisect...

--miIp1PN+tlxmhFI+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZK8cgwAKCRB4tDGHoIJi
0gdzAQCN6XyuaWeJWDiSe+jo63Jci5Ikppv3fZ2rSxBAovKlAAEAjbxitsw29l9q
aztJfojlvmXPY7BfDTOkIwGTQMevFAs=
=eoUf
-----END PGP SIGNATURE-----

--miIp1PN+tlxmhFI+--

