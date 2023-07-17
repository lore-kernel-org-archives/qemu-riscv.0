Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF17EB64DC
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 22:34:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLWn8-0003yw-TW; Mon, 17 Jul 2023 18:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1qLWn2-0003yH-Ka; Mon, 17 Jul 2023 18:34:00 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1qLWn0-0007hd-Ni; Mon, 17 Jul 2023 18:34:00 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6AE74612A4;
 Mon, 17 Jul 2023 22:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09EB2C433C8;
 Mon, 17 Jul 2023 22:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689633235;
 bh=Bs8ypfqh+Ld6RbQLLzlxbA2cVmysdZzX9nCkNkOqOQM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SVZMpjIjXp4FwiQjPECzFPuH+Zb2rpF0kpir0j5umgUTSveyYzSY4S7IczcTiZ/wD
 elyeHntg2BevTt7HNn3OvN0QeCTP8e/8YYv+aI/ledDq5H3YH3G9VmfEwrNfcuvcHo
 mSC3E45DCnSWJPjJGY/kyCShNqhgLYw9uek/nIQ2YALYZmDwCKL62CVfAoaQSFwBtr
 mFQCqb5wJ4FORjGLkJD+FQQkU3okHuvUiZbcBP5l+67x5/vrv1BGJ0prlK0Rt/dPxY
 pYz7Kc+DyQDZdNWg7i3EADt36SC2fb5V7WvZhO4+9+Ovm1mUuczsezjYiD6QydWIAi
 jRr1WTap52tQA==
Date: Mon, 17 Jul 2023 23:33:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH for-8.2 0/2] target/riscv: add zicntr and zihpm flags
Message-ID: <20230717-snugly-pencil-98d62b254a74@spud>
References: <20230717215419.124258-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UMOmHF7cXUXLDFq7"
Content-Disposition: inline
In-Reply-To: <20230717215419.124258-1-dbarboza@ventanamicro.com>
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


--UMOmHF7cXUXLDFq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Mon, Jul 17, 2023 at 06:54:17PM -0300, Daniel Henrique Barboza wrote:
> Hi,
>=20
> I decided to include flags for both timer/counter extensions to make it
> easier for us later on when dealing with the RVA22 profile (which
> includes both).=20
>=20
> The features were already implemented by Atish Patra some time ago, but
> back then these 2 extensions weren't introduced yet. This means that,
> aside from extra stuff in riscv,isa FDT no other functional changes were
> made.
>=20
> Both are defaulted to 'true' since QEMU already implements both
> features, but the flag can be disabled if Zicsr isn't present or, in
> the case of zihpm, if pmu_num =3D 0.

Out of curiosity, since you are allowing them to be disabled, how do you
intend to communicate to a guest that zicsr or zihpm are not present?

> This means that,
> aside from extra stuff in riscv,isa FDT no other functional changes were
> made.

This is barely a "functional" change either, as the presence of these
extensions has to be assumed, whether they appear in riscv,isa or not :/

--UMOmHF7cXUXLDFq7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLXBzwAKCRB4tDGHoIJi
0pqQAP0SkoD8JVHbvb71ofqd7bQSgt7E6C4Jh1ipZDzQIpgZMwEAiTEmlbUnlAc5
Adu2ZK8sgvN/m3eqWaKa7SAEw0x40A4=
=SQ8w
-----END PGP SIGNATURE-----

--UMOmHF7cXUXLDFq7--

