Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ouKOo-0003CD-Qr
	for mharc-qemu-riscv@gnu.org; Sun, 13 Nov 2022 16:20:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1ouKOn-0003Bt-R0; Sun, 13 Nov 2022 16:20:17 -0500
Received: from ams.source.kernel.org ([145.40.68.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1ouKOm-0007dj-3i; Sun, 13 Nov 2022 16:20:17 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E465CB80CAC;
 Sun, 13 Nov 2022 21:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAE98C433D6;
 Sun, 13 Nov 2022 21:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668374403;
 bh=H0qUQK1f78qfV8xrWBHn4cZRqhXPbDntHAsiGRfLiec=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B0eFsGmmqWLyutT57128wHndGVH/IH1ttep8neCPYrZP0yvI/Db561Re05CFX2nUG
 mofmQKG82JXMvqT32oxjt2rBZvRgxWlzcvHfiwoBmh/tkrgBdSA7Imo37J7pYKAsBj
 LfhjzxL9VqZoo6LE8i4rZKJd3h/MdSi86V4eXX/xzypdbUJwwZfIoESwlA5hNw0VwL
 ePEaehTz4EShEBUgXNnmvKQttPSaMYbeWg/+2j3IsV8701c248qe2E4RnmAxlQKGvK
 0mDhd6LEhgt05YyaYsnRL9EW3BkXnbobV7LcM9yrrtoq3TS2WFBObdvsIcqmAn1yAm
 8UDrpwt5EOORQ==
Date: Sun, 13 Nov 2022 21:19:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 3/3] hw/{misc, riscv}: pfsoc: add system controller as
 unimplemented
Message-ID: <Y3Fff6710GfvPrgc@spud>
References: <20221112133414.262448-1-conor@kernel.org>
 <20221112133414.262448-4-conor@kernel.org>
 <ded28709-24c7-0e41-f507-277fccfbfecf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ded28709-24c7-0e41-f507-277fccfbfecf@linaro.org>
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
X-List-Received-Date: Sun, 13 Nov 2022 21:20:18 -0000

On Sun, Nov 13, 2022 at 08:30:42PM +0100, Philippe Mathieu-Daudé wrote:
> Hi Conor,
> 
> On 12/11/22 14:34, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > The system controller on PolarFire SoC is access via a mailbox. The
> > control registers for this mailbox lie in the "IOSCB" region & the
> > interrupt is cleared via write to the "SYSREG" region. It also has a
> > QSPI controller, usually connected to a flash chip, that is used for
> > storing FPGA bitstreams and used for In-Application Programming (IAP).
> > 
> > Linux has an implementation of the system controller, through which the
> > hwrng is accessed, leading to load/store access faults.
> > 
> > Add the QSPI as unimplemented and a very basic (effectively
> > unimplemented) version of the system controller's mailbox. Rather than
> > purely marking the regions as unimplemented, service the mailbox
> > requests by reporting failures and raising the interrupt so a guest can
> > better handle the lack of support.
> > 
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >   hw/misc/mchp_pfsoc_ioscb.c          | 59 ++++++++++++++++++++++++++++-
> >   hw/misc/mchp_pfsoc_sysreg.c         | 19 ++++++++--
> >   hw/riscv/microchip_pfsoc.c          |  6 +++
> >   include/hw/misc/mchp_pfsoc_ioscb.h  |  3 ++
> >   include/hw/misc/mchp_pfsoc_sysreg.h |  1 +
> >   include/hw/riscv/microchip_pfsoc.h  |  1 +
> >   6 files changed, 83 insertions(+), 6 deletions(-)
> 
> > @@ -52,10 +54,18 @@ static uint64_t mchp_pfsoc_sysreg_read(void *opaque, hwaddr offset,
> >   static void mchp_pfsoc_sysreg_write(void *opaque, hwaddr offset,
> >                                       uint64_t value, unsigned size)
> >   {
> > -    qemu_log_mask(LOG_UNIMP, "%s: unimplemented device write "
> > -                  "(size %d, value 0x%" PRIx64
> > -                  ", offset 0x%" HWADDR_PRIx ")\n",
> > -                  __func__, size, value, offset);
> > +    MchpPfSoCSysregState *s = opaque;
> > +    qemu_irq_lower(s->irq);
> 
> Is this always lowered IRQ line wanted? ...
> 
> > +    switch (offset) {
> > +    case MESSAGE_INT:
> > +        qemu_irq_lower(s->irq);
> 
> ... since we do it here.

Probably just me pressing the y key instead of the d one.
I'll sort that out for v3, thanks!

> > +        break;
> > +    default:
> > +        qemu_log_mask(LOG_UNIMP, "%s: unimplemented device write "
> > +                      "(size %d, value 0x%" PRIx64
> > +                      ", offset 0x%" HWADDR_PRIx ")\n",
> > +                      __func__, size, value, offset);
> > +    }
> >   }
> 
> 

