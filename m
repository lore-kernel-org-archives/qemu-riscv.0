Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1otqPv-0001HK-GA
	for mharc-qemu-riscv@gnu.org; Sat, 12 Nov 2022 08:19:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1otqPr-0001Gs-KS; Sat, 12 Nov 2022 08:19:23 -0500
Received: from ams.source.kernel.org ([145.40.68.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1otqPo-0007Zt-9M; Sat, 12 Nov 2022 08:19:22 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 760EFB80835;
 Sat, 12 Nov 2022 13:19:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4BF3C433C1;
 Sat, 12 Nov 2022 13:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668259156;
 bh=8CbbZTc1dKmRR7XuKYBTS4aTXWD7UoJaTExxqJCRIOM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ndThsmi7UNSHGF6oxbGaG//Jr8ZA0/Z2/JxhBqAIRzxgp8u2ZBLn96XL3Gs1/8j8e
 +XjZ7i8ijf/v8xLEmpCDqeFIgKhaMQVeL4ggOWoXh+x5Vi5I5Qp+SUmIrpfyG6l1aD
 Eq2OdjZGNbThW4qrgGntoTctvpQ3KyZafoUg5Oba7LYOFkh6Mv06d+GBwsgbTjn8fW
 OOqWDTplI5ygQy6lPC3RtxwUFICGL9M0elVq4qrtJeoMT9YtO+ObNix/B5FHD9dF7v
 42AlKqIEFkgyBctxq07bjtH2XkAEVEWcLeInaG/CL3bvSTL+kAV4Zilv5rLLhEtH06
 lA9QQC50iEs1g==
Date: Sat, 12 Nov 2022 13:19:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH] hw/misc/pfsoc: add fabric clocks to ioscb
Message-ID: <Y2+dUCpd8OP52/DJ@spud>
References: <20221109190849.1556711-1-conor@kernel.org>
 <84b8985a-6fab-ff76-7058-f702203474c0@linaro.org>
 <Y27pKpA0jo67Ntlz@spud>
 <CAEUhbmUoken26s8n95fn9jdVkCiz-vPrWzt6G-z7Q23AfZ3gWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEUhbmUoken26s8n95fn9jdVkCiz-vPrWzt6G-z7Q23AfZ3gWw@mail.gmail.com>
Received-SPF: pass client-ip=145.40.68.75; envelope-from=conor@kernel.org;
 helo=ams.source.kernel.org
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
X-List-Received-Date: Sat, 12 Nov 2022 13:19:24 -0000

On Sat, Nov 12, 2022 at 08:37:38AM +0800, Bin Meng wrote:
> Hi Conor,
> 
> On Sat, Nov 12, 2022 at 8:31 AM Conor Dooley <conor@kernel.org> wrote:
> >
> > On Thu, Nov 10, 2022 at 12:18:44AM +0100, Philippe Mathieu-Daudé wrote:
> > > Hi Conor,
> > >
> > > On 9/11/22 20:08, Conor Dooley wrote:
> > > > From: Conor Dooley <conor.dooley@microchip.com>
> > > >
> > > > @@ -168,6 +170,10 @@ static void mchp_pfsoc_ioscb_realize(DeviceState *dev, Error **errp)
> > > >                             "mchp.pfsoc.ioscb.cfg", IOSCB_SUBMOD_REG_SIZE);
> > > >       memory_region_add_subregion(&s->container, IOSCB_CFG_BASE, &s->cfg);
> > > > +    memory_region_init_io(&s->ccc, OBJECT(s), &mchp_pfsoc_dummy_ops, s,
> > > > +                          "mchp.pfsoc.ioscb.ccc", IOSCB_CCC_REG_SIZE);
> > > > +    memory_region_add_subregion(&s->container, IOSCB_CCC_BASE, &s->ccc);
> > >
> > > Unrelated but using the TYPE_UNIMPLEMENTED_DEVICE would ease tracing all
> > > these block accesses, as the block name would appear before the
> > > address/size. See for example aspeed_mmio_map_unimplemented();
> >
> > Certainly looks like a nice idea, and I gave it a go but kept running
> > into issues due to my lack of understanding of QEMU :) I'm going to add
> > this to my todo pile - while I have a v2 of this lined up, I'd rather
> > not hold up adding the regions that prevent booting Linux etc as I
> > fumble around trying to understand the hierarchy of devices required to
> > set up something similar to your aspeed example.
> >
> 
> Do you plan to bring QEMU support to the latest MSS_LINUX configuration [1]

"Yes". Our goal is to merge both the LINUX and BAREMETAL configurations
in an upcoming reference design release. Notably absent from anything
that I have sent here is any changes to the DDR configuration (and that
and how the PCI root port is connected to the MSS are the only real
differences between the two).

Currently, the LINUX one has 2 GiB of DDR at 0x10_0000_0000 & that's
what the vendor kernel uses. None of upstream Linux, U-Boot or QEMU
support that configuration. The baremetal one has 1 GiB at 0x8000_0000
and 1 GiB at 0x10_0000_0000. When the two are merged, it'll be 1 GiB
at 0x8000_0000 and 1 GiB at 0x10_4000_0000 - there's currently a
v2022.10 reference design job file on [1] that's got this configuration
but we are waiting for a corresponding release of Libero to properly
release the tcl scripts etc. We're upstreaming U-Boot and Linux support
for that configuration at the moment - but it's just a dts change there
so no real concern about breaking any backwards compat as the older
devicetrees will continue to work.

> Currently QEMU is supporting the MSS_BAREMETAL configuration. Do you
> think it makes sense to support both?
> [1] https://github.com/polarfire-soc/icicle-kit-reference-design

I was kinda hoping to leave that part of things as-is for now and wait
for the merged configuration. My main question with that is: do the
older reference design configurations need to remain supported?

The PCI root port stuff likely doesn't matter since it's not modelled
(yet) by QEMU anyway but the DDR bit is going to be incompatible.
The addresses at which DDR lies are controlled by the seg registers.
These are briefly documented in the TRM (4.5 Segmentation Blocks) but
IMO pretty badly explained there.
IIUC, for bare metal applications that's set by the HAL from the XML
exported by MSS configurator & for anything started via the HSS, the HSS
does it instead.
I was thinking something like defaulting the DDR configuration to the
new, merged configuration & then if someone writes to the seg registers
(which, IIUC, a bare-metal app does) changing the addresses at which
QEMU places the DDR at runtime.
That's what the hardware does, but I have put approximately zero thought
into how to implement that.
Without something like that, idk how we'd keep both newer and older
reference designs working in QEMU.

> Do you plan to bring QEMU support to the latest MSS_LINUX configuration

Either way, any plans are dependant on me finding the time. I'm mostly
just upstreaming the small changes that I need to make so that QEMU
remains usable as a debugging tool for Linux stuff.

Thanks,
Conor.


