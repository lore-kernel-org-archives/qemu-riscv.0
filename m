Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5158EC77B7D
	for <qemu-riscv@archiver.kernel.org>; Thu, 18 May 2023 11:26:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pzblX-0003KB-CA; Thu, 18 May 2023 07:25:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1pzblV-0003Jn-KF
 for qemu-riscv@nongnu.org; Thu, 18 May 2023 07:25:49 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1pzblT-0000KI-8N
 for qemu-riscv@nongnu.org; Thu, 18 May 2023 07:25:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1684409147; x=1715945147;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KPipI87LRIbP/OpMGuyK3E2LESwrrGgto5bVP90IVRI=;
 b=g6jG8oMsCSVjOtBsi+zsSx/cTS9M9IG6UXG6sMxtiVtXhKSUh4qKRCMN
 x4zZ0X3JsCqxHcDQOf+9XS26U9GThxdCCzZfoP30pFAN8UUz5/4cwRlRS
 DgQBeWYFYUUYl676Kgk+fYPw6NGXFqtGv1pQ7xps0gKFPgu3ese/qXV91
 HJYV80GPjf8A8QQNRj4qoz1kn1oz658RdlMFyiuTDWl6xK1e0JnDmV7be
 3J/YiE7Ty/bko/q19ZJR5WntlUBCwbSycTYxIkCvDeed0LUCnuow/Vz1T
 rxBQDka5JUEp7rahhBk3L38EaXYjO7JTlk1mw4bv7tJT6LS+pJhR2+Pvu g==;
X-IronPort-AV: E=Sophos;i="5.99,285,1677567600"; 
 d="asc'?scan'208";a="216085961"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 May 2023 04:25:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 18 May 2023 04:25:35 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 18 May 2023 04:25:32 -0700
Date: Thu, 18 May 2023 12:25:11 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: <palmer@dabbelt.com>, <conor@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Alistair Francis
 <alistair.francis@wdc.com>, Anup Patel <apatel@ventanamicro.com>, Atish Patra
 <atishp@atishpatra.org>, Jessica Clarke <jrtc27@jrtc27.com>, Rick Chen
 <rick@andestech.com>, Leo <ycliang@andestech.com>,
 <linux-riscv@lists.infradead.org>, <qemu-riscv@nongnu.org>,
 <u-boot@lists.denx.de>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] dt-bindings: riscv: deprecate riscv,isa
Message-ID: <20230518-resurrect-copy-0ecd9eaaca1e@wendy>
References: <20230518-thermos-sanitary-cf3fbc777ea1@wendy>
 <20230518-4050231ca8dbe93c08cf9c9a@orel>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kb7QvTX+biQwTglT"
Content-Disposition: inline
In-Reply-To: <20230518-4050231ca8dbe93c08cf9c9a@orel>
Received-SPF: pass client-ip=68.232.154.123;
 envelope-from=Conor.Dooley@microchip.com; helo=esa.microchip.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--kb7QvTX+biQwTglT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 12:31:51PM +0200, Andrew Jones wrote:
> > +  # Additional Standard Extensions, sorted by category then alphabetic=
ally
>=20
> Can we just do pure alphabetically? And the single-letter extensions above
> don't have a "sorted by" comment above them. I guess they need one, or
> maybe they can also be alphabetical?

Maybe it is just me, but my brain is too used to seeing those ones in
something approaching canonical order. I'd rather keep them that way &
then alphanumerical for everything else?

I also noticed that the CMO stuff wasn't actually in the comment's order
anyway, so needs a re-sort to begin with. A vote in favour of
alphanumerical.

--kb7QvTX+biQwTglT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGYLFwAKCRB4tDGHoIJi
0grUAQCAc20dh6ItbijltjfIQVgSoT3hDJT0l6RFsHHzB6r/XgEA+HoYzGYleux9
54r2MbYTuE0fuZ9acteU6CIgBsX0Fg0=
=8leH
-----END PGP SIGNATURE-----

--kb7QvTX+biQwTglT--

