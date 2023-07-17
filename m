Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270ADEB64DC
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 17:29:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLS1h-0003ZI-IQ; Mon, 17 Jul 2023 13:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1qLS1g-0003Ym-Br; Mon, 17 Jul 2023 13:28:48 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1qLS1e-0007Di-MT; Mon, 17 Jul 2023 13:28:48 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6566461018;
 Mon, 17 Jul 2023 17:28:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28022C433C7;
 Mon, 17 Jul 2023 17:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689614916;
 bh=px33rVYDqeJN3iXdtLbuAArlFaxSnmaBt7gih68dTmI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SvSQZCoqrLBo9k8uBMU95ZcnZ0Aj1YPNy+O3t2e8NARzz6GZbK0qdVsnDo/7Ne28f
 DCN2dJr0e53nhNbzS1IIFva8ei+B86gflCJ7QXhC/fmhEB8caJzg6rrhJYsNiOEWmX
 wFvxfK1dIRpktC86L2zjYghqHb5kDMRsqOqQZ2DiFOv6lBcuBCZVs1tTSTiBmloebI
 oa4z4KASYOpbZAcZzgiSjk4NwHuEDtpp7IAQcqSlgUjcvF/VI9/c5g41wm2cQwtJqY
 WQBs+IhK7WHLBSQv0uZma0dwuY6Sx2skUYzSSUGPObawxJHcsM16W5Jy6MC/gpjcgR
 ZGWyNbln90v2w==
Date: Mon, 17 Jul 2023 18:28:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH] target/riscv/cpu.c: check priv_ver before auto-enable
 zca/zcd/zcf
Message-ID: <20230717-reattach-ungloved-ab5e4a067a4b@spud>
References: <20230717154141.60898-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PRJxtakJMSS2BssI"
Content-Disposition: inline
In-Reply-To: <20230717154141.60898-1-dbarboza@ventanamicro.com>
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


--PRJxtakJMSS2BssI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 17, 2023 at 12:41:41PM -0300, Daniel Henrique Barboza wrote:
> Commit bd30559568 made changes in how we're checking and disabling
> extensions based on env->priv_ver. One of the changes was to move the
> extension disablement code to the end of realize(), being able to
> disable extensions after we've auto-enabled some of them.
>=20
> An unfortunate side effect of this change started to happen with CPUs
> that has an older priv version, like sifive-u54. Starting on commit
> 2288a5ce43e5 we're auto-enabling zca, zcd and zcf if RVC is enabled,
> but these extensions are priv version 1.12.0. When running a cpu that
> has an older priv ver (like sifive-u54) the user is spammed with
> warnings like these:
>=20
> qemu-system-riscv64: warning: disabling zca extension for hart 0x00000000=
00000000 because privilege spec version does not match
> qemu-system-riscv64: warning: disabling zcd extension for hart 0x00000000=
00000000 because privilege spec version does not match
>=20
> The warnings are part of the code that disables the extension, but in this
> case we're throwing user warnings for stuff that we enabled on our own,
> without user intervention. Users are left wondering what they did wrong.
>=20
> A quick 8.1 fix for this nuisance is to check the CPU priv spec before
> auto-enabling zca/zcd/zcf. A more appropriate fix will include a more
> robust framework that will account for both priv_ver and user choice
> when auto-enabling/disabling extensions, but for 8.1 we'll make it do
> with this simple check.
>=20
> It's also worth noticing that this is the only case where we're
> auto-enabling extensions based on a criteria (in this case RVC) that
> doesn't match the priv spec of the extensions we're enabling. There's no
> need for more 8.1 band-aids.
>=20
> Cc: Conor Dooley <conor@kernel.org>

Does the job, thanks for doing this.
Tested-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--PRJxtakJMSS2BssI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLV6QAAKCRB4tDGHoIJi
0sCNAQD/7SgmbqznAXbn1qD9MGrpSU4x5077mgfESjtK0wDtUgD/ermRI0e+j7vT
kgMQEP2AqkivRY0nGYqcvYY+dYXcWwg=
=qfuq
-----END PGP SIGNATURE-----

--PRJxtakJMSS2BssI--

