Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lijTs-0002Ja-E7
	for mharc-qemu-riscv@gnu.org; Mon, 17 May 2021 16:04:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lijTl-0002IY-3V
 for qemu-riscv@nongnu.org; Mon, 17 May 2021 16:04:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lijTY-0003sH-Ke
 for qemu-riscv@nongnu.org; Mon, 17 May 2021 16:04:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621281867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uKNftq8yHI0LEWJPm+mfCD8jQGyHIPkpccA4/JpjjXo=;
 b=bXQDqPaXZ9dW/6CIukdeMe4tP3G4OnpkLWZFAh7fWkULgSEyHO+DGmqtAEMRurpTs8gubC
 fR2rMob6w6zVl9iG17/e69h2/ntQI/voeQKixQ8nKEiK3ZUEBxoqmpUvp8bpks9C3VYTdc
 9UWHAX+BvHQaPyxHed33USJ7UVX72KU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-NQOUkcUbOnyZrA10_TatTw-1; Mon, 17 May 2021 16:04:23 -0400
X-MC-Unique: NQOUkcUbOnyZrA10_TatTw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C8D6801107;
 Mon, 17 May 2021 20:04:22 +0000 (UTC)
Received: from localhost (ovpn-114-21.rdu2.redhat.com [10.10.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B84DC5C3E5;
 Mon, 17 May 2021 20:04:16 +0000 (UTC)
Date: Mon, 17 May 2021 16:04:16 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v2 00/12] hw: Various Kconfig fixes
Message-ID: <20210517200416.pt4xghxiuzuwknvn@habkost.net>
References: <20210515173716.358295-1-philmd@redhat.com>
 <20210517191856.enjxmb7v2ai6ecdh@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20210517191856.enjxmb7v2ai6ecdh@habkost.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 17 May 2021 20:04:44 -0000

On Mon, May 17, 2021 at 03:18:56PM -0400, Eduardo Habkost wrote:
> CCing Build system architecture maintainer (Daniel).

Oops, I was misled by the subsection title.  Daniel is
responsible only for the build system documentation.

Do we have any volunteers willing to be listed as reviewers for
build system changes in MAINTAINERS?  meson.build has a
non-trivial amount of code and no maintainers or reviewers at
all.

> 
> On Sat, May 15, 2021 at 07:37:04PM +0200, Philippe Mathieu-Daudé wrote:
> > Various Kconfig fixes when building stand-alone machine binaries.
> 
> Who should merge this once it's ready?
> 
> > 
> > Since v1:
> > - Fixed Pegasos2 machine
> > - Removed SEMIHOSTING related patches (will repost them later)
> > 
> > Philippe Mathieu-Daudé (12):
> >   hw/mem/nvdimm: Use Kconfig 'imply' instead of 'depends on'
> >   hw/ide/Kconfig: Add missing dependency PCI -> IDE_QDEV
> >   hw/arm/Kconfig: Add missing dependency NPCM7XX -> SMBUS
> >   hw/arm/Kconfig: Remove unused DS1338 symbol from i.MX25 PDK Board
> >   hw/arm/Kconfig: Add missing SDHCI symbol to FSL_IMX25
> >   hw/riscv/Kconfig: Add missing dependency MICROCHIP_PFSOC -> SERIAL
> >   hw/riscv/Kconfig: Restrict NUMA to Virt & Spike machines
> >   hw/ppc/Kconfig: Add missing dependency E500 -> DS1338 RTC
> >   hw/pci-host/Kconfig: Add missing dependency MV64361 -> I8259
> >   hw/isa/vt82c686: Add missing Kconfig dependencies (build error)
> >   hw/isa/vt82c686: Add missing Kconfig dependency (runtime error)
> >   hw/ppc/Kconfig: Add dependency PEGASOS2 -> ATI_VGA
> > 
> >  default-configs/devices/ppc-softmmu.mak   | 1 -
> >  default-configs/devices/ppc64-softmmu.mak | 1 -
> >  hw/arm/Kconfig                            | 4 +++-
> >  hw/char/Kconfig                           | 1 +
> >  hw/i386/Kconfig                           | 1 +
> >  hw/ide/Kconfig                            | 2 +-
> >  hw/isa/Kconfig                            | 4 ++++
> >  hw/mem/Kconfig                            | 2 --
> >  hw/pci-host/Kconfig                       | 1 +
> >  hw/ppc/Kconfig                            | 3 +++
> >  hw/riscv/Kconfig                          | 5 +++++
> >  hw/riscv/meson.build                      | 2 +-
> >  12 files changed, 20 insertions(+), 7 deletions(-)
> > 
> > -- 
> > 2.26.3
> > 
> > 
> > 
> 
> -- 
> Eduardo
> 
> 

-- 
Eduardo


