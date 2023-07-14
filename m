Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B16EB64DA
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 12:29:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qKHuv-0006cx-Q1; Fri, 14 Jul 2023 08:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1qKHut-0006bn-8e; Fri, 14 Jul 2023 08:28:59 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1qKHur-0006QK-GQ; Fri, 14 Jul 2023 08:28:59 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F3CB761D01;
 Fri, 14 Jul 2023 12:28:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E457C433C7;
 Fri, 14 Jul 2023 12:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689337734;
 bh=TOb1BpqMY928jii/YOqc3oWB4FMiA1EHC7P8JKRsdOQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wnl6bojwNZtTaHITpQvohpUD8d7jZlCqmatEBd0XTw9lBfEecxtQAQv33Vd3/TvYa
 Dq8SLtGqXiuoPl9jgyo8YxWOLJQDWNNYddHJdop8wkM2hcFCtBBiu9a+ZDjcnN3JC8
 sDZLDroY05bEaChDSXdXfIKbdfclF0I9KuayarmF6QPEgeLYf0s/GRPL7Gjv4f/+jH
 4eLusOeV5SuX7PUGV7A6+xbiJn/3bhZOFgYOtL/Gve4o6Tc1/XXiFJZZz/ANGUs2a5
 Y5wixuVUxJmfdy6lm8kseNpvpxq8cG27MocbTe7rcpPPjRBxGeJHbr9nZGNnfeloD/
 9sCLLbLgWL54w==
Date: Fri, 14 Jul 2023 13:28:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <anup@brainfault.org>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 alistair.francis@wdc.com, bmeng@tinylab.org, liweiwei@iscas.ac.cn,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 opensbi@lists.infradead.org
Subject: Re: Boot failure after QEMU's upgrade to OpenSBI v1.3 (was Re:
 [PATCH for-8.2 6/7] target/riscv: add 'max' CPU type)
Message-ID: <20230714-hash-handwrite-339817b93ba1@spud>
References: <20230712-stench-happiness-40c2ea831257@spud>
 <3e9b5be8-d3ca-3a17-bef9-4a6a5bdc0ad0@ventanamicro.com>
 <20230712-tulip-replica-0322e71c3e81@spud>
 <744cbde6-7ce5-c327-3c5a-3858e994cc39@ventanamicro.com>
 <20230712-superhero-rabid-578605f52927@spud>
 <5dd3366d-13ba-c7fb-554f-549d97e7d4f9@ventanamicro.com>
 <20230712-fancied-aviator-270f51166407@spud>
 <20230713-craziness-lankiness-8aec3db24993@spud>
 <CAAhSdy3J5HUoVP21jo11FBuAFSPSxHNKtuL7amn-5t7n_smoSg@mail.gmail.com>
 <20230714-reoccur-confined-4b37494b1201@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vlW5C8sckzukhKZ+"
Content-Disposition: inline
In-Reply-To: <20230714-reoccur-confined-4b37494b1201@spud>
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


--vlW5C8sckzukhKZ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2023 at 11:19:34AM +0100, Conor Dooley wrote:
> On Fri, Jul 14, 2023 at 10:00:19AM +0530, Anup Patel wrote:
>=20
> > > > OpenSBI v1.3
> > > >    ____                    _____ ____ _____
> > > >   / __ \                  / ____|  _ \_   _|
> > > >  | |  | |_ __   ___ _ __ | (___ | |_) || |
> > > >  | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
> > > >  | |__| | |_) |  __/ | | |____) | |_) || |_
> > > >   \____/| .__/ \___|_| |_|_____/|___/_____|
> > > >         | |
> > > >         |_|
> > > >
> > > > init_coldboot: ipi init failed (error -1009)
> > > >
> > > > Just to note, because we use our own firmware that vendors in OpenS=
BI
> > > > and compiles only a significantly cut down number of files from it,=
 we
> > > > do not use the fw_dynamic etc flow on our hardware. As a result, we=
 have
> > > > not tested v1.3, nor do we have any immediate plans to change our
> > > > platform firmware to vendor v1.3 either.
> > > >
> > > > I unless there's something obvious to you, it sounds like I will ne=
ed to
> > > > go and bisect OpenSBI. That's a job for another day though, given t=
he
> > > > time.
> > > >
> >=20
> > The real issue is some CPU/HART DT nodes marked as disabled in the
> > DT passed to OpenSBI 1.3.
> >=20
> > This issue does not exist in any of the DTs generated by QEMU but some
> > of the DTs in the kernel (such as microchip and SiFive board DTs) have
> > the E-core disabled.
> >=20
> > I had discovered this issue in a totally different context after the Op=
enSBI 1.3
> > release happened. This issue is already fixed in the latest OpenSBI by =
the
> > following commit c6a35733b74aeff612398f274ed19a74f81d1f37 ("lib: utils:
> > Fix sbi_hartid_to_scratch() usage in ACLINT drivers").
>=20
> Great, thanks Anup! I thought I had tested tip-of-tree too, but
> obviously not.
>=20
> > I always assumed that Microchip hss.bin is the preferred BIOS for the
> > QEMU microchip-icicle-kit machine but I guess that's not true.
>=20
> Unfortunately the HSS has not worked in QEMU for a long time, and while
> I would love to fix it, but am pretty stretched for spare time to begin
> with.
> I usually just do direct kernel boots, which use the OpenSBI that comes
> with QEMU, as I am sure you already know :)
>=20
> > At this point, you can either:
> > 1) Use latest OpenSBI on QEMU microchip-icicle-kit machine

I forgot to reply to this point, wondering what should be done with
QEMU. Bumping to v1.3 in QEMU introduces a regression here, regardless
of whether I can go and build a fixed version of OpenSBI.

> > 2) Ensure CPU0 DT node is enabled in DT when booting on QEMU
> >     microchip-icicle-kit machine with OpenSBI 1.3
>=20
> Will OpenSBI disable it? If not, I think option 2) needs to be remove
> the DT node. I'll just use tip-of-tree myself & up to the=20

Clearly didn't finish this comment. It was meant to say "up to the QEMU
maintainers what they want to do on the QEMU side of things".

Thanks,
Conor.

--vlW5C8sckzukhKZ+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLE/bwAKCRB4tDGHoIJi
0qMNAQDy6vdbpcaYG+tt2GiNl7ewKLOvGHCSWCTpR/Z1q2xOJQEA9gnz7cxRbfcC
JG05PyRPCS1lLyCMrUTXLH0AKJXQsAc=
=wDaJ
-----END PGP SIGNATURE-----

--vlW5C8sckzukhKZ+--

