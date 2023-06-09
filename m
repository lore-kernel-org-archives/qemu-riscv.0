Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E63C7EE29
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 14:55:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7cz4-0001yo-Bp; Fri, 09 Jun 2023 10:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1q7cz3-0001yR-2J
 for qemu-riscv@nongnu.org; Fri, 09 Jun 2023 10:20:57 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1q7cz1-0002Sm-8u
 for qemu-riscv@nongnu.org; Fri, 09 Jun 2023 10:20:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1686320455; x=1717856455;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KygAYWp1IXX26i2WNOBztQci6E+XF/eMw6ckvbNgMvI=;
 b=Bqvg+ZRT3w9TgD9v7giq7LHkZCrV80JlVBV7rZebCe06iiE4oPaSwx1o
 0TsyCoZ+uZ/pwmSGpPiV+l26Rj3qMv65Gbw/+zbhFsChnG0d7It6JqxKq
 yLXySQP7U8oizgqx74TTUR9PKgSMmF4EHmUaKVVosZZV3uuSPIhAHXgG0
 UFvolbu3qDjFeNbnmEzjktNyQ1T+LTZCOBe1GX9TtGXMc3MgXzWl2Tqih
 cghK7ZfYTSeq38j/nZWjV29N4nLgqOdhCYZvwc83hO/a3uUVN0lHIh17E
 NbYrYx4A82Wc0s0W4V62akiX8MtiLQuY1TeYlU0ln0n6NJK8ViFIaBCwa A==;
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
 d="asc'?scan'208";a="156290892"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Jun 2023 07:20:40 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 9 Jun 2023 07:20:36 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 9 Jun 2023 07:20:33 -0700
Date: Fri, 9 Jun 2023 15:20:09 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh@kernel.org>
CC: Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Oleksii <oleksii.kurochko@gmail.com>,
 Anup Patel <apatel@ventanamicro.com>, <qemu-riscv@nongnu.org>,
 <u-boot@lists.denx.de>, Andrew Jones <ajones@ventanamicro.com>,
 <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, Jessica Clarke
 <jrtc27@jrtc27.com>, Paul Walmsley <paul.walmsley@sifive.com>, Alistair
 Francis <alistair.francis@wdc.com>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, Rick Chen <rick@andestech.com>,
 <linux-kernel@vger.kernel.org>, Leo <ycliang@andestech.com>
Subject: Re: [PATCH v2] dt-bindings: riscv: deprecate riscv,isa
Message-ID: <20230609-glamour-immovable-4211c564745d@wendy>
References: <20230608-sitting-bath-31eddc03c5a5@spud>
 <168624654839.3085745.9088493205796442132.robh@kernel.org>
 <20230608-unlucky-carpenter-b3a95f269712@spud>
 <CAL_JsqK8pr5itTr8xTOf=h7zOan6giGsQcwQ-zUCbjtpUsosfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NHIeqlNPMBycrKLW"
Content-Disposition: inline
In-Reply-To: <CAL_JsqK8pr5itTr8xTOf=h7zOan6giGsQcwQ-zUCbjtpUsosfw@mail.gmail.com>
Received-SPF: pass client-ip=68.232.154.123;
 envelope-from=Conor.Dooley@microchip.com; helo=esa.microchip.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

--NHIeqlNPMBycrKLW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 09, 2023 at 08:03:44AM -0600, Rob Herring wrote:

> Nope, vendor prefixes don't go in node names. That's not explicit
> anywhere, but goes against using generic node names.

Yeah, that makes sense.

> Also, note that looking at the DT spec, there's already prior art here
> with PPC. See "power-isa-*". Though that appears in .dts files, but no
> kernel code. Maybe you already saw that as your v1 is similar. There's
> not really much advantage to align with it, but also not much reason
> to deviate.

I went back and forth on riscv-isa- versus riscv,isa-, picking the , for
consistency with other properties in the file. I thought that doing it
like power would be frowned upon & that it might've been done like that
for historic reasons, especially given existing properties we have for
riscv ISA related things are vendor properties w/ the comma.

I don't have strong feelings either way though, so if you say s/,/-/
then that's good by me!

Cheers,
Conor.

--NHIeqlNPMBycrKLW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIM1GAAKCRB4tDGHoIJi
0iJ5AQC4YXI2egYa7v+UQPBEhR84/skUnWg8zWRti453CRoG9gEAs/ydmwxka2yf
TYI7LPHSIav0274f4+OcOXgyL+YNXAc=
=XW8B
-----END PGP SIGNATURE-----

--NHIeqlNPMBycrKLW--

