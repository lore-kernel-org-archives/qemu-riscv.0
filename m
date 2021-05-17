Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liilm-00042j-Ee
	for mharc-qemu-riscv@gnu.org; Mon, 17 May 2021 15:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1liilj-0003xT-Mo
 for qemu-riscv@nongnu.org; Mon, 17 May 2021 15:19:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1liilb-0007wO-Rl
 for qemu-riscv@nongnu.org; Mon, 17 May 2021 15:19:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621279142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f4efrKdTwB2T0Qp6G5mDacoEPOXYGRWINEGWtQx+gt8=;
 b=Y623WmbUW8Me6eFBufEkHuR2gv8iof0kTwccpgdI2XZms4CAZ1gWJtNImJGCajVjFS7ZqZ
 oLXLR5XObhAaPL/mHDWrxEctp1eX3H5dOfl5S3W1IjzypfBhAv+B45hmzAnipg+Db0nUce
 KgTJ+7W2waf3KjLDbTXIAHsV/M06288=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-dpxDRnv8P-S8M1CmPTdQFw-1; Mon, 17 May 2021 15:19:00 -0400
X-MC-Unique: dpxDRnv8P-S8M1CmPTdQFw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CAFE107ACF6;
 Mon, 17 May 2021 19:18:59 +0000 (UTC)
Received: from localhost (ovpn-114-21.rdu2.redhat.com [10.10.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E5E829692;
 Mon, 17 May 2021 19:18:57 +0000 (UTC)
Date: Mon, 17 May 2021 15:18:56 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Daniel P. Berrange" <berrange@redhat.com>
Subject: Re: [PATCH v2 00/12] hw: Various Kconfig fixes
Message-ID: <20210517191856.enjxmb7v2ai6ecdh@habkost.net>
References: <20210515173716.358295-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210515173716.358295-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
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
X-List-Received-Date: Mon, 17 May 2021 19:19:12 -0000

CCing Build system architecture maintainer (Daniel).

On Sat, May 15, 2021 at 07:37:04PM +0200, Philippe Mathieu-Daudé wrote:
> Various Kconfig fixes when building stand-alone machine binaries.

Who should merge this once it's ready?

> 
> Since v1:
> - Fixed Pegasos2 machine
> - Removed SEMIHOSTING related patches (will repost them later)
> 
> Philippe Mathieu-Daudé (12):
>   hw/mem/nvdimm: Use Kconfig 'imply' instead of 'depends on'
>   hw/ide/Kconfig: Add missing dependency PCI -> IDE_QDEV
>   hw/arm/Kconfig: Add missing dependency NPCM7XX -> SMBUS
>   hw/arm/Kconfig: Remove unused DS1338 symbol from i.MX25 PDK Board
>   hw/arm/Kconfig: Add missing SDHCI symbol to FSL_IMX25
>   hw/riscv/Kconfig: Add missing dependency MICROCHIP_PFSOC -> SERIAL
>   hw/riscv/Kconfig: Restrict NUMA to Virt & Spike machines
>   hw/ppc/Kconfig: Add missing dependency E500 -> DS1338 RTC
>   hw/pci-host/Kconfig: Add missing dependency MV64361 -> I8259
>   hw/isa/vt82c686: Add missing Kconfig dependencies (build error)
>   hw/isa/vt82c686: Add missing Kconfig dependency (runtime error)
>   hw/ppc/Kconfig: Add dependency PEGASOS2 -> ATI_VGA
> 
>  default-configs/devices/ppc-softmmu.mak   | 1 -
>  default-configs/devices/ppc64-softmmu.mak | 1 -
>  hw/arm/Kconfig                            | 4 +++-
>  hw/char/Kconfig                           | 1 +
>  hw/i386/Kconfig                           | 1 +
>  hw/ide/Kconfig                            | 2 +-
>  hw/isa/Kconfig                            | 4 ++++
>  hw/mem/Kconfig                            | 2 --
>  hw/pci-host/Kconfig                       | 1 +
>  hw/ppc/Kconfig                            | 3 +++
>  hw/riscv/Kconfig                          | 5 +++++
>  hw/riscv/meson.build                      | 2 +-
>  12 files changed, 20 insertions(+), 7 deletions(-)
> 
> -- 
> 2.26.3
> 
> 
> 

-- 
Eduardo


