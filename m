Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0467DEB64D8
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 19:00:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qCPX7-00052E-6o; Thu, 22 Jun 2023 14:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>) id 1qCPX6-000526-7E
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 14:59:52 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>) id 1qCPX4-000800-N4
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 14:59:51 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5B69F618CD;
 Thu, 22 Jun 2023 18:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E127C433C0;
 Thu, 22 Jun 2023 18:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687460378;
 bh=NV9aTfcB04hyaA/wBUYwR/eWp1snE1/lwhMpdPWU8zE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DJDv0M49XxR7xapPfqyDpyau9GCb+JU7gfceKdSrjxnku2eDn6Yi10Rdm7RbTgGJp
 kZ/GA5PD8qX492Qf9yQ4FG3JiymJ5omsdksYTg3Lv3tuPkV4TivY3Up00cBanE/IvZ
 VVcBqY7VZXd03W/yLJqos7ps1HijN1ZQAXFiuWUggdwx9dVVuRI8td3MzYRC0EraZn
 ddQxdMsljEv3T7nAu3kh5spV2aCgwicGzwmsDyrcY1QrsGzDN1f9FDsDkmzuxJLk30
 8RZG8gqMOB8HSFmLHDK960sBCoBuN7kcaok7FVd/AyT8MwdBmls5iBW+U96BaeA6Ku
 29wqvCkpK3vTQ==
Date: Thu, 22 Jun 2023 19:59:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 ajones@ventanamicro.com, apatel@ventanamicro.com,
 atishp@atishpatra.org, jrtc27@jrtc27.com, rick@andestech.com,
 ycliang@andestech.com, oleksii.kurochko@gmail.com,
 linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org,
 u-boot@lists.denx.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: riscv: deprecate riscv,isa
Message-ID: <20230622-stipend-flashily-97917469f39b@spud>
References: <20230608-sitting-bath-31eddc03c5a5@spud>
 <mhng-aa00c037-6201-4548-9036-1d6dbbfc9343@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zHw74JTtVBfhm0Fq"
Content-Disposition: inline
In-Reply-To: <mhng-aa00c037-6201-4548-9036-1d6dbbfc9343@palmer-ri-x1c9a>
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


--zHw74JTtVBfhm0Fq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 22, 2023 at 11:25:35AM -0700, Palmer Dabbelt wrote:

> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>=20
> I'm not wed to any particular encoding for the properties, IMO that's more
> of a decision for the DT folks.  IMO the important bit is to just get away
> from ISA strings and move towards some tightly-specified properties that
> indicate how the HW actually behaves.

I'm going to resubmit with Rob's list of strings. I'll keep your tags,
since the spirit of the patch will be the same, with enforced meanings
for each extension.

Cheers,
Conor.


--zHw74JTtVBfhm0Fq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJSaFAAKCRB4tDGHoIJi
0nLsAP9kIuB4WQ2zaDQIzZJDUmQQv0dwtsHhgVoBlQDxIsLhOwD/RSmCg2YNJLDn
bReL/deUbjlXqTBNq+D6jzJQm7r6VQ8=
=eP0v
-----END PGP SIGNATURE-----

--zHw74JTtVBfhm0Fq--

