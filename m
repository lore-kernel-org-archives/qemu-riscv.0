Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1osuWm-0005qa-K6
	for mharc-qemu-riscv@gnu.org; Wed, 09 Nov 2022 18:30:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1osuWj-0005qB-46; Wed, 09 Nov 2022 18:30:37 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1osuWh-00021x-7n; Wed, 09 Nov 2022 18:30:36 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6E9BE61D22;
 Wed,  9 Nov 2022 23:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B1EAC433D6;
 Wed,  9 Nov 2022 23:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668036631;
 bh=ExRzSHy55vSQc7H7NEGr4HN/FkfFIhRcSib8XYzZx2Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nkN+kI+GtEa6PZgqJrHGesS1KLlngdMDlrZrSZNeijc9z2TdnRUJpMDNsTUZHkjcq
 iDinuJluofHQkacPhNuJGPLXEhuxRtWKY7xPSRRwhdOiziqUbEdcyuSUUvT/W96vPu
 b3rOdEVCWrR/Dd63vrMgnJNFrOuogdatDhztC0ptmFKPoqs1CRMof/vGTTu/ZvnFFx
 0qIPhfypb7BayFzn3n1kLpNrlBn6zvtqkWdlXSgEx++/mfFNB9rsUmNlzhjc858pTh
 7tjNAhWmaDidoPsvsvnpQp2DVarF9ZGKp0oLOJ6gOUQJRmicU8HDI46pzMtt0fzBNC
 UGeApalMMY93A==
Date: Wed, 9 Nov 2022 23:30:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH] hw/misc/pfsoc: add fabric clocks to ioscb
Message-ID: <Y2w4FOfeLnHqNkd2@spud>
References: <20221109190849.1556711-1-conor@kernel.org>
 <84b8985a-6fab-ff76-7058-f702203474c0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <84b8985a-6fab-ff76-7058-f702203474c0@linaro.org>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=conor@kernel.org; helo=dfw.source.kernel.org
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
X-List-Received-Date: Wed, 09 Nov 2022 23:30:37 -0000

On Thu, Nov 10, 2022 at 12:18:44AM +0100, Philippe Mathieu-Daudé wrote:
> On 9/11/22 20:08, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > On PolarFire SoC, some peripherals (eg the PCI root port) are clocked by
> > "Clock Conditioning Circuitry" in the FPGA. The specific clock depends
> > on the FPGA bitstream & can be locked to one particular {D,P}LL - in the
> > Icicle Kit Reference Design v2022.09 or later this is/will be the case.
> > 
> > Linux v6.1+ will have a driver for this peripheral and devicetrees that
> > previously relied on "fixed-frequency" clock nodes have been switched
> > over to clock-controller nodes. The IOSCB region is represented in QEMU,
> > but the specific region of it that the CCCs occupy has not so v6.1-rcN
> > kernels fail to boot in QEMU.
> > 
> > Add the regions as unimplemented so that the status-quo in terms of boot
> > is maintained.
> > 
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> > The last line there is a white lie. v6.1-rcN has both v2022.09 and
> > v2022.10 reference design changes. This patch only accounts for the
> > v2022.09 changes. The FPGA design is a moving target and I am not
> > really sure how to handle that in QEMU. For v2022.10 a bunch of stuff
> > got changed, including the addresses that DDR lies at which I am not
> > sure how to handle yet.
> > 
> > That puts my todo list of broken things to:
> > - MMC (only direct kernel boot works), pre v2022.09 reference issue
> 
> How do you start without 'direct kernel boot'?

You used to be able to load the "bios" etc and follow the boot flow [0].
This no longer works, and has not for at least a year. I assume it still
works if you check out the (fossilised) versions mentioned in that doc.
Think I said it last time I sent patches, but we had some floating around
internally that I know /did/ work at some point about this time last year
but I was never able to figure out the correct alignment of the stars to
get working myself. It required pretty decent changes to the sdhci driver,
which, I'm hoping cease to be required with the v2022.10 reference
design that I mentioned else where in this patch.
But one problem at a time ;)

0 - https://www.qemu.org/docs/master/system/riscv/microchip-icicle-kit.html

> > - PCI root port address, address changed in v2022.09 but from a cursory
> >    check, I didn't see any PCI support in the first place. It's connected
> >    to a FIC, so I think it can just be made into an unimplemented region.
> > - DDR address changes, 2022.10 issue. Looks like a straightforward
> >    change to hw/riscv/pfsoc.c but I don't think it'll be backwards
> >    compatible.
> > - hwrng breaks boot. Tipping away at this one, hopefully I'll have a fix
> >    for it soon. Need to implement the irq side of the mailbox for it.
> > 
> > I'll send some more patches as I work through them.
> > 
> >   hw/misc/mchp_pfsoc_ioscb.c         | 6 ++++++
> >   include/hw/misc/mchp_pfsoc_ioscb.h | 1 +
> >   2 files changed, 7 insertions(+)
> > 
> > diff --git a/hw/misc/mchp_pfsoc_ioscb.c b/hw/misc/mchp_pfsoc_ioscb.c
> > index f4fd55a0e5..f976e42f72 100644
> > --- a/hw/misc/mchp_pfsoc_ioscb.c
> > +++ b/hw/misc/mchp_pfsoc_ioscb.c
> > @@ -33,6 +33,7 @@
> >    */
> >   #define IOSCB_WHOLE_REG_SIZE        0x10000000
> >   #define IOSCB_SUBMOD_REG_SIZE       0x1000
> > +#define IOSCB_CCC_REG_SIZE          0x2000000
> >   /*
> >    * There are many sub-modules in the IOSCB module.
> > @@ -45,6 +46,7 @@
> >   #define IOSCB_LANE23_BASE           0x06510000
> >   #define IOSCB_CTRL_BASE             0x07020000
> >   #define IOSCB_CFG_BASE              0x07080000
> > +#define IOSCB_CCC_BASE              0x08000000
> >   #define IOSCB_PLL_MSS_BASE          0x0E001000
> >   #define IOSCB_CFM_MSS_BASE          0x0E002000
> >   #define IOSCB_PLL_DDR_BASE          0x0E010000
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

I just copy pasted what was already here. Follow on patch for the
conversions since most of what's in this file is effectively
unimplemented?

> >       memory_region_init_io(&s->pll_mss, OBJECT(s), &mchp_pfsoc_pll_ops, s,
> >                             "mchp.pfsoc.ioscb.pll_mss", IOSCB_SUBMOD_REG_SIZE);
> >       memory_region_add_subregion(&s->container, IOSCB_PLL_MSS_BASE, &s->pll_mss);
> > diff --git a/include/hw/misc/mchp_pfsoc_ioscb.h b/include/hw/misc/mchp_pfsoc_ioscb.h
> > index 9235523e33..687b213742 100644
> > --- a/include/hw/misc/mchp_pfsoc_ioscb.h
> > +++ b/include/hw/misc/mchp_pfsoc_ioscb.h
> > @@ -30,6 +30,7 @@ typedef struct MchpPfSoCIoscbState {
> >       MemoryRegion lane23;
> >       MemoryRegion ctrl;
> >       MemoryRegion cfg;
> > +    MemoryRegion ccc;
> >       MemoryRegion pll_mss;
> >       MemoryRegion cfm_mss;
> >       MemoryRegion pll_ddr;
> 

