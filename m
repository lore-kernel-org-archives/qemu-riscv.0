Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C15AC0015E
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 21:49:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qHANb-0004lq-AI; Wed, 05 Jul 2023 17:49:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1qHANX-0004kp-L5; Wed, 05 Jul 2023 17:49:39 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1qHANV-0006h6-Ns; Wed, 05 Jul 2023 17:49:39 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8D6AF61572;
 Wed,  5 Jul 2023 21:49:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B961BC433C7;
 Wed,  5 Jul 2023 21:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688593767;
 bh=l17JoI3U3B13kYofOaTUt3nf7zbMoQPT/emzkZwf8jo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=haLRnKAUzXVq2tIpWrDAIfTaNftmo2rAFZHlCDOe7lrVGOvROY7bxx+D+xA8zK7MS
 iY89K5d4ZAUbmlW+4PETEIYSOBhJ+nJ1VC//9g1FyYb0r6eYAclRYoP2SRUtT0hlit
 dqP1Quivn43auLvFwVLCc9LLy3SYFXm0ksVjlNKbI02lWyMlwv3HJDTRMHqmxHVLEt
 jFJbOzJ8XzIoDNKpNGm5FxyxsN6ca3lEUotEu8va/6As1nYfthQhA6rz8MAqouW5cM
 wxLcE5/m6dn1gf1IQ44nKyhhFOACRp/spzx4xIrUyp361xbbYHhjxtwOoDDx/uAbLh
 gqAmshM3aK+yA==
Date: Wed, 5 Jul 2023 22:49:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com, ajones@ventanamicro.com,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v8 02/20] hw/riscv/virt.c: skip 'mmu-type' FDT if satp
 mode not set
Message-ID: <20230705-gallstone-untitled-1463e43aa33c@spud>
References: <20230705213955.429895-1-dbarboza@ventanamicro.com>
 <20230705213955.429895-3-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QoekzvFzFI67pDsB"
Content-Disposition: inline
In-Reply-To: <20230705213955.429895-3-dbarboza@ventanamicro.com>
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


--QoekzvFzFI67pDsB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 05, 2023 at 06:39:37PM -0300, Daniel Henrique Barboza wrote:
> The absence of a satp mode in riscv_host_cpu_init() is causing the
> following error:
>=20
> $ ./qemu/build/qemu-system-riscv64  -machine virt,accel=3Dkvm \
>     -m 2G -smp 1  -nographic -snapshot \
>     -kernel ./guest_imgs/Image \
>     -initrd ./guest_imgs/rootfs_kvm_riscv64.img \
>     -append "earlycon=3Dsbi root=3D/dev/ram rw" \
>     -cpu host
> **
> ERROR:../target/riscv/cpu.c:320:satp_mode_str: code should not be
> reached
> Bail out! ERROR:../target/riscv/cpu.c:320:satp_mode_str: code should
> not be reached
> Aborted
>=20
> The error is triggered from create_fdt_socket_cpus() in hw/riscv/virt.c.
> It's trying to get satp_mode_str for a NULL cpu->cfg.satp_mode.map.
>=20
> For this KVM cpu we would need to inherit the satp supported modes
> from the RISC-V host. At this moment this is not possible because the
> KVM driver does not support it. And even when it does we can't just let
> this broken for every other older kernel.
>=20
> Since mmu-type is not a required node, according to [1], skip the
> 'mmu-type' FDT node if there's no satp_mode set. We'll revisit this
> logic when we can get satp information from KVM.
>=20
> [1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schema=
s/cpu.yaml

I don't think this is the correct link to reference as backup, as the
generic binding sets out no requirements. I think you would want to link
to the RISC-V specific cpus binding.

That said, things like FreeBSD and U-Boot appear to require mmu-type
https://lore.kernel.org/all/20230705-fondue-bagginess-66c25f1a4135@spud/
so I am wondering if we should in fact make the mmu-type a required
property in the RISC-V specific binding.

Since nommu is covered by an mmu type of "riscv,none", I am kinda
struggling to think of a case where it should be left out (while
describing real hardware at least).

Cheers,
Conor.

--QoekzvFzFI67pDsB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKXlYgAKCRB4tDGHoIJi
0vyAAQDir4gJPaYaCjtWHlzYXr61lQdVpYDKam6/CE8VtUazOwD/WpApTTiKR2gG
AD80eWKwZLIe0WngbeWT2Cmd89TT/Ak=
=lEHv
-----END PGP SIGNATURE-----

--QoekzvFzFI67pDsB--

