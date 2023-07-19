Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D213EB64DA
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 07:08:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qM1IL-0008GH-7V; Wed, 19 Jul 2023 03:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1qM1II-0008Fv-Om; Wed, 19 Jul 2023 03:08:18 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1qM1IE-0007gw-BZ; Wed, 19 Jul 2023 03:08:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1689750493; x=1721286493;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yqLWY5/didCnSfgddNvN1rauVpdWZpJhQvPq4ZiF58I=;
 b=jMRD2CkCK4aJbUUCYhOHXG73fQ93p0cbp1CFaPVLAFeWMIR9Sa8DTiSR
 eSgl0p9bOv3h3345gHIohlfTi3RxcRRPfj1jK4vuj+e9K2+tyfHYvLDtj
 H3tUKewX2FeiwCQ/SVwBhMp5xqY6dSt8qcUh9Sn0KZDxJx8J3SfzdtRH7
 Wafcv95VKCHguWRqBXXKC+sQh+v19nELarUIme+192thQ7b7CVK1U9Pgv
 LehAC0z6lRT6iI3xamXigwyzEsx5fm98hq2IWH8zwcaOM2wdrhUXfoqsx
 mN6Zrg9mGOjj4OIYH8Qx3nPM2enE9wt4+t+MUBn0JZBPSJeW5bZHaLtXg A==;
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
 d="asc'?scan'208";a="236407626"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 Jul 2023 00:08:06 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 19 Jul 2023 00:08:06 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 19 Jul 2023 00:08:04 -0700
Date: Wed, 19 Jul 2023 08:07:31 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Alistair Francis <alistair23@gmail.com>
CC: Atish Patra <atishp@atishpatra.org>, Anup Patel <apatel@ventanamicro.com>, 
 Conor Dooley <conor@kernel.org>, Anup Patel <anup@brainfault.org>, Daniel
 Henrique Barboza <dbarboza@ventanamicro.com>, <qemu-devel@nongnu.org>,
 <qemu-riscv@nongnu.org>, <alistair.francis@wdc.com>, <bmeng@tinylab.org>,
 <liweiwei@iscas.ac.cn>, <zhiwei_liu@linux.alibaba.com>,
 <palmer@rivosinc.com>, <opensbi@lists.infradead.org>
Subject: Re: Boot failure after QEMU's upgrade to OpenSBI v1.3 (was Re:
 [PATCH for-8.2 6/7] target/riscv: add 'max' CPU type)
Message-ID: <20230719-dioxide-panic-cda48b1d8d1b@wendy>
References: <744cbde6-7ce5-c327-3c5a-3858e994cc39@ventanamicro.com>
 <20230712-superhero-rabid-578605f52927@spud>
 <5dd3366d-13ba-c7fb-554f-549d97e7d4f9@ventanamicro.com>
 <20230712-fancied-aviator-270f51166407@spud>
 <20230713-craziness-lankiness-8aec3db24993@spud>
 <CAAhSdy3J5HUoVP21jo11FBuAFSPSxHNKtuL7amn-5t7n_smoSg@mail.gmail.com>
 <20230714-reoccur-confined-4b37494b1201@spud>
 <20230714-hash-handwrite-339817b93ba1@spud>
 <CAOnJCUL3=G_yV5cP5OjCGQKNvciNgXWnoQGUU4Bqh4iwnx6C4A@mail.gmail.com>
 <CAKmqyKO3O87ETntm7pzMPedKW19ANpEp5nM4jFiHXO76K9saTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jpLmbEAqINLC9njm"
Content-Disposition: inline
In-Reply-To: <CAKmqyKO3O87ETntm7pzMPedKW19ANpEp5nM4jFiHXO76K9saTQ@mail.gmail.com>
Received-SPF: pass client-ip=68.232.153.233;
 envelope-from=Conor.Dooley@microchip.com; helo=esa.microchip.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

--jpLmbEAqINLC9njm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 19, 2023 at 11:32:55AM +1000, Alistair Francis wrote:

> If there is no OpenSBI 1.3.1 release we should add something to the
> release notes. @Conor Dooley are you able to give a clear sentence on
> how the boot fails?

Uhh, I'll give it a shot, but hopefully it is not required :)

In version v1.3, OpenSBI's aclint drivers fail to initialise if they
encounter a disabled CPU node in the devicetree. Attempting to boot
using, for example, the Linux kernel's PolarFire SoC or Freedom U540
devicetrees, will fail with the error:
"init_coldboot: ipi init failed (error -1009)"
Please see OpenSBI commit c6a3573 ("lib: utils: Fix sbi_hartid_to_scratch()
usage in ACLINT drivers")
<https://github.com/riscv-software-src/opensbi/commit/c6a35733b74aeff612398f274ed19a74f81d1f37>
for the fix.


--jpLmbEAqINLC9njm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLeLpgAKCRB4tDGHoIJi
0iJuAQCu7wYto4GmO7ONB0L5004aARr67Ka4KJPPXF5BdOvctgD/TGQV1lKpMS/8
WEee3jdtLeJyEvht5QuFt/fj4XAeyg8=
=0t1t
-----END PGP SIGNATURE-----

--jpLmbEAqINLC9njm--

