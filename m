Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8949C7EE23
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 May 2023 14:13:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q4062-0005yJ-AH; Tue, 30 May 2023 10:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1q405p-0005tP-5v
 for qemu-riscv@nongnu.org; Tue, 30 May 2023 10:12:57 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1q405k-0006ko-I5
 for qemu-riscv@nongnu.org; Tue, 30 May 2023 10:12:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1685455973; x=1716991973;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WEVu+mlvG0A1jNh0gMO3FS1zwOln0/CKg69F1Wt0HZ4=;
 b=Vufodk7xB+i0J647HNgyc31NWXmZ9f2DJy4H0bRO62qr18c4ngEY62uN
 qR5r18Bspr3PA/LkGf5W29v4dHJDphpp/EWbBzoXwky37P3OrBe1dlUH6
 HUWRgjGAj+a6eyaORzQ8hprIIOLDPHj0HNK+7Z5C0U8QXDoeZrrrRhueu
 gowQSvZZ8Nle5lkmNechRN6In9wJExI3wv9kqQhOifhorqTKKHIJN7rb4
 k0a704wqQbcjFVkpj0qTtsI754u66suL+iD7nRBZk+2xYMvXuISQxsg4q
 VFxjAVpn/dO4uSQZeWNFOdpJtgZbefifCbvBsqtBXMFPYCeiJp37AM1oS Q==;
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
 d="asc'?scan'208";a="213732970"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 May 2023 07:12:41 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 30 May 2023 07:12:38 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 30 May 2023 07:12:35 -0700
Date: Tue, 30 May 2023 15:12:12 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor@kernel.org>
CC: Sean Anderson <sean.anderson@seco.com>, Anup Patel <anup@brainfault.org>, 
 Andrew Jones <ajones@ventanamicro.com>, <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Alistair Francis
 <alistair.francis@wdc.com>, Anup Patel <apatel@ventanamicro.com>, Atish Patra
 <atishp@atishpatra.org>, Jessica Clarke <jrtc27@jrtc27.com>, Rick Chen
 <rick@andestech.com>, Leo <ycliang@andestech.com>,
 <linux-riscv@lists.infradead.org>, <qemu-riscv@nongnu.org>,
 <u-boot@lists.denx.de>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] dt-bindings: riscv: deprecate riscv,isa
Message-ID: <20230530-duller-reset-a34ae111f207@wendy>
References: <20230518-thermos-sanitary-cf3fbc777ea1@wendy>
 <20230518-4050231ca8dbe93c08cf9c9a@orel>
 <CAAhSdy07Mg_JBF+4ucGFiWdBKh-Ass5G_aUWqBqTnDSFp7S=0A@mail.gmail.com>
 <20230518-hammock-doornail-478e8ea8e6a7@wendy>
 <f7c20090-220c-2805-86ba-b174a89f65b3@seco.com>
 <20230518-monkhood-dispersal-6749b1228b0d@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ljjWyKcHLn9dJQRC"
Content-Disposition: inline
In-Reply-To: <20230518-monkhood-dispersal-6749b1228b0d@spud>
Received-SPF: pass client-ip=68.232.154.123;
 envelope-from=Conor.Dooley@microchip.com; helo=esa.microchip.iphmx.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

--ljjWyKcHLn9dJQRC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 10:42:34PM +0100, Conor Dooley wrote:
> On Thu, May 18, 2023 at 02:30:53PM -0400, Sean Anderson wrote:

> >=20
> > Why not just have something like
> >=20
> > mycpu {
> > 	...
> > 	riscv,isa {
> > 		i;
> > 		m;
> > 		a;
> > 		zicsr;
> > 		...
> > 	};
> > };
>
> Naming of the node aside (perhaps that could be riscv,isa-extensions)
> there's not something hitting me immediately as to why that is a no-no.
> If the size is a concern, this would certainly be more efficient & not
> like the probing would be anything other than trivial more difficult
> what I have in my proposal.

Having started messing around with this, one of the main advantages, to
me, of this approach is proper validation.
cpus.yaml has additionalProperties: true in it, which would have had to
be sorted out, or worked around, but creating a child-node with the
properties in it allows setting additionalProperties: false.

> Rob's AFK at the moment, and I was hoping that he would take a look at
> the idea, so I won't respin til he is back, but I'll give this a go in
> the interim.

Mechanically, the conversion of the patch isn't difficult, but I'll still
wait for Rob to come back before sending a v2. But that v2 will more
than likely implement your suggestion.

Cheers,
Conor.

--ljjWyKcHLn9dJQRC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHYEPAAKCRB4tDGHoIJi
0gU0AQC4+rB11CsvWYlWy1TRnq5jU9IikN+9XHIPda7SYYnZMQEAo6jPRTwwWFo7
hJxgKpYYRrcYOdotg5wYkneWq4yBCQs=
=BG8u
-----END PGP SIGNATURE-----

--ljjWyKcHLn9dJQRC--

