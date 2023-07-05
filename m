Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04FB1EB64DA
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 22:12:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qHAjr-0003kK-1U; Wed, 05 Jul 2023 18:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1qHAjk-0003du-QK; Wed, 05 Jul 2023 18:12:37 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1qHAji-0006AL-Bt; Wed, 05 Jul 2023 18:12:36 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3DAC0615C5;
 Wed,  5 Jul 2023 22:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D9BCC433C8;
 Wed,  5 Jul 2023 22:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688595151;
 bh=NsDWqJBYnoDH3nfiePmOKv7+F471SPVookUbDe1Hbfw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DyH15WT+y0V8Cz1tdXiqyYWSCpsS44mzalDK1/4SaCPWoHaAydrTtr2Ll1FFBJsDv
 OSiSEwV9WWmgM9kD4i4L9NEpoZ6ukZ4KH9cKlvvfsOyrSruqEymlDgpUHplJSsooA4
 Ct9utAMoA7PfkUk/t6L9kNZ7fg+XP0YEPfi2voYV657b61Ai1qtRhlFffg5icu4eD/
 wpbBqlXA2I6rXuZIk3MdCU3XmXtkUfL7h9e/koSbKk2xh7SkCRPMBGnkkpK/aSeJ0x
 8DwP1P+8vqWjpwo4mZ16YkNqtYfKopSlqsBS8iP8yL9VTCdKfqqFly23QRQ3NPXaHp
 HiCYxFCV2Lz6A==
Date: Wed, 5 Jul 2023 23:12:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com, ajones@ventanamicro.com,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v8 02/20] hw/riscv/virt.c: skip 'mmu-type' FDT if satp
 mode not set
Message-ID: <20230705-patchwork-sibling-4827156457bf@spud>
References: <20230705213955.429895-1-dbarboza@ventanamicro.com>
 <20230705213955.429895-3-dbarboza@ventanamicro.com>
 <20230705-gallstone-untitled-1463e43aa33c@spud>
 <c5372b14-b2b8-4664-4357-a7f22c880dcd@ventanamicro.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="P96VPYE46+vtWOU/"
Content-Disposition: inline
In-Reply-To: <c5372b14-b2b8-4664-4357-a7f22c880dcd@ventanamicro.com>
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


--P96VPYE46+vtWOU/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 05, 2023 at 07:00:52PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 7/5/23 18:49, Conor Dooley wrote:
> > On Wed, Jul 05, 2023 at 06:39:37PM -0300, Daniel Henrique Barboza wrote:
> > > The absence of a satp mode in riscv_host_cpu_init() is causing the
> > > following error:
> > >=20
> > > $ ./qemu/build/qemu-system-riscv64  -machine virt,accel=3Dkvm \
> > >      -m 2G -smp 1  -nographic -snapshot \
> > >      -kernel ./guest_imgs/Image \
> > >      -initrd ./guest_imgs/rootfs_kvm_riscv64.img \
> > >      -append "earlycon=3Dsbi root=3D/dev/ram rw" \
> > >      -cpu host
> > > **
> > > ERROR:../target/riscv/cpu.c:320:satp_mode_str: code should not be
> > > reached
> > > Bail out! ERROR:../target/riscv/cpu.c:320:satp_mode_str: code should
> > > not be reached
> > > Aborted
> > >=20
> > > The error is triggered from create_fdt_socket_cpus() in hw/riscv/virt=
=2Ec.
> > > It's trying to get satp_mode_str for a NULL cpu->cfg.satp_mode.map.
> > >=20
> > > For this KVM cpu we would need to inherit the satp supported modes
> > > from the RISC-V host. At this moment this is not possible because the
> > > KVM driver does not support it. And even when it does we can't just l=
et
> > > this broken for every other older kernel.
> > >=20
> > > Since mmu-type is not a required node, according to [1], skip the
> > > 'mmu-type' FDT node if there's no satp_mode set. We'll revisit this
> > > logic when we can get satp information from KVM.
> > >=20
> > > [1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/sc=
hemas/cpu.yaml
> >=20
> > I don't think this is the correct link to reference as backup, as the
> > generic binding sets out no requirements. I think you would want to link
> > to the RISC-V specific cpus binding.
>=20
> You mean this link?
>=20
> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bi=
ndings/riscv/cpus.yaml

Yeah, that's the correct file. Should probably have linked it, sorry
about that. And in case it was not clear, not suggesting that this would
require a resend, since the reasoning is correct.

> > That said, things like FreeBSD and U-Boot appear to require mmu-type
> > https://lore.kernel.org/all/20230705-fondue-bagginess-66c25f1a4135@spud/
> > so I am wondering if we should in fact make the mmu-type a required
> > property in the RISC-V specific binding.
>=20
>=20
> To make it required, as far as QEMU is concerned, we'll need to assume a
> default value for the 'host' CPU type (e.g. sv57). In the future we can r=
ead the
> satp host value directly when/if KVM provides satp_mode via get_one_reg().

I dunno if assuming is the right thing to do, since it could be actively
wrong. Leaving it out, as you are doing here, is, IMO, nicer to those
guests. Once there's an API for it, I think it could then be added and
then the additional guests would be supported.

Thanks,
Conor.

--P96VPYE46+vtWOU/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKXqygAKCRB4tDGHoIJi
0jbPAP9sjIfSx8h5OBalpwNBWN1elH0Eq6l0NGBqHC0+KRQ21QD9ESjxHgi9zmQr
aLvLMWHu16MqNo1fEccDt+4bCfs8FAw=
=bxoh
-----END PGP SIGNATURE-----

--P96VPYE46+vtWOU/--

