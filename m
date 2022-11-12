Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oteQ7-000235-9J
	for mharc-qemu-riscv@gnu.org; Fri, 11 Nov 2022 19:30:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1oteQ6-00022c-0L; Fri, 11 Nov 2022 19:30:50 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1oteQ4-0006LV-F6; Fri, 11 Nov 2022 19:30:49 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BF7946207F;
 Sat, 12 Nov 2022 00:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDFB6C433C1;
 Sat, 12 Nov 2022 00:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668213038;
 bh=Bobewhob7Y6yBIdyZoVN/5apWyqNcarCmngd+a1WDP8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bNcsnP5MdTql8ot50o0S9k09GyjaLFgZm1D3Om6m9pT8u0IWXOcY85g5nWEtGxfla
 UokSfv8qgFInRIKBVbst0lu77UjARkvtaGh+hvxFjp8HQcQfU+/vUh0W2IkXXave1L
 jr4QJV0nt/9ZpLJ2AJDPzO0+yZZyx1XQ/XAbgoVf9szwozu8ggSqXdFb8WNo+M73sc
 O3/r3luW60DdvxYOHaEOvF54R2RDmpUm1WWp6K/kaiVh0p9TDbFR+5hkXURNPr1Iq2
 uKqidueMOYQSwNnTilVsKTcEvJmt83Uz9abHWX2iq6KTHRvIKj2O999Vvh00Y31tQm
 LWYM3tdjs1RFA==
Date: Sat, 12 Nov 2022 00:30:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH] hw/misc/pfsoc: add fabric clocks to ioscb
Message-ID: <Y27pKpA0jo67Ntlz@spud>
References: <20221109190849.1556711-1-conor@kernel.org>
 <84b8985a-6fab-ff76-7058-f702203474c0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <84b8985a-6fab-ff76-7058-f702203474c0@linaro.org>
Received-SPF: pass client-ip=139.178.84.217; envelope-from=conor@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 12 Nov 2022 00:30:50 -0000

On Thu, Nov 10, 2022 at 12:18:44AM +0100, Philippe Mathieu-Daudé wrote:
> Hi Conor,
> 
> On 9/11/22 20:08, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > @@ -168,6 +170,10 @@ static void mchp_pfsoc_ioscb_realize(DeviceState *dev, Error **errp)
> >                             "mchp.pfsoc.ioscb.cfg", IOSCB_SUBMOD_REG_SIZE);
> >       memory_region_add_subregion(&s->container, IOSCB_CFG_BASE, &s->cfg);
> > +    memory_region_init_io(&s->ccc, OBJECT(s), &mchp_pfsoc_dummy_ops, s,
> > +                          "mchp.pfsoc.ioscb.ccc", IOSCB_CCC_REG_SIZE);
> > +    memory_region_add_subregion(&s->container, IOSCB_CCC_BASE, &s->ccc);
> 
> Unrelated but using the TYPE_UNIMPLEMENTED_DEVICE would ease tracing all
> these block accesses, as the block name would appear before the
> address/size. See for example aspeed_mmio_map_unimplemented();

Certainly looks like a nice idea, and I gave it a go but kept running
into issues due to my lack of understanding of QEMU :) I'm going to add
this to my todo pile - while I have a v2 of this lined up, I'd rather
not hold up adding the regions that prevent booting Linux etc as I
fumble around trying to understand the hierarchy of devices required to
set up something similar to your aspeed example.

Thanks,
Conor.


