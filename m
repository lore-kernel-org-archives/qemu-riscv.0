Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lbn85-0001RQ-JD
	for mharc-qemu-riscv@gnu.org; Wed, 28 Apr 2021 12:33:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lbn83-0001Pb-Ie
 for qemu-riscv@nongnu.org; Wed, 28 Apr 2021 12:33:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lbn80-0000CL-9E
 for qemu-riscv@nongnu.org; Wed, 28 Apr 2021 12:33:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619627611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NaaL3pZShYuph3XhAb3tj4IZCJjIpT5TogklEYi3w6w=;
 b=ZDHPei7NHN1m+u2Etl60fjed0dTgsrf13aDSez6sLRjsnW/Sjz+l9gxIN5M++gUA5X2QYt
 0kalTl0uwN5g8oXkjjmZWnO0Rhrheg1GTlGHNxjW6d0Bl1NbsLLJtmycoYlmmCFCmz83V5
 aJYqfPITAHVlxsvRhKdr/j2ZjjD8Yq8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-OyTuH6NaMMOgF5hyA49oEA-1; Wed, 28 Apr 2021 12:33:28 -0400
X-MC-Unique: OyTuH6NaMMOgF5hyA49oEA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 421318030DD;
 Wed, 28 Apr 2021 16:33:26 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-114-188.ams2.redhat.com
 [10.36.114.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C2ABD5C224;
 Wed, 28 Apr 2021 16:33:12 +0000 (UTC)
Subject: Re: [PATCH 5/7] hw: Have machines Kconfig-select FW_CFG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 qemu-riscv@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210426193520.4115528-1-philmd@redhat.com>
 <20210426193520.4115528-6-philmd@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <f2768d1f-9031-fa23-dfd0-aa3108d6e04c@redhat.com>
Date: Wed, 28 Apr 2021 18:33:11 +0200
MIME-Version: 1.0
In-Reply-To: <20210426193520.4115528-6-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 28 Apr 2021 16:33:35 -0000

On 04/26/21 21:35, Philippe Mathieu-Daudé wrote:
> Beside the loongson3-virt machine (MIPS), the following machines
> also use the fw_cfg device:
> 
> - ARM: virt & sbsa-ref
> - HPPA: generic machine
> - X86: ACPI based (pc & microvm)

It's correct, but the way this is formulated is confusing, for me
anyway. Can you please write "(pc (i440fx, q35) & microvm)"?

Because, we frequently use "pc" interchangeably with "i440fx", and so I
was missing q35 from the list.

Thanks
Laszlo

> - PPC64: various
> - SPARC: sun4m & sun4u
> 
> Add their FW_CFG Kconfig dependency.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/arm/Kconfig     | 2 ++
>  hw/hppa/Kconfig    | 1 +
>  hw/i386/Kconfig    | 2 ++
>  hw/ppc/Kconfig     | 1 +
>  hw/sparc/Kconfig   | 1 +
>  hw/sparc64/Kconfig | 1 +
>  6 files changed, 8 insertions(+)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 8c37cf00da7..3b2641e39dc 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -8,6 +8,7 @@ config ARM_VIRT
>      imply TPM_TIS_SYSBUS
>      select ARM_GIC
>      select ACPI
> +    select FW_CFG
>      select ARM_SMMUV3
>      select GPIO_KEY
>      select FW_CFG_DMA
> @@ -216,6 +217,7 @@ config SBSA_REF
>      select PL061 # GPIO
>      select USB_EHCI_SYSBUS
>      select WDT_SBSA
> +    select FW_CFG
>  
>  config SABRELITE
>      bool
> diff --git a/hw/hppa/Kconfig b/hw/hppa/Kconfig
> index 22948db0256..45f40e09224 100644
> --- a/hw/hppa/Kconfig
> +++ b/hw/hppa/Kconfig
> @@ -14,3 +14,4 @@ config DINO
>      select LASIPS2
>      select PARALLEL
>      select ARTIST
> +    select FW_CFG
> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
> index 7f91f30877f..9e4039a2dce 100644
> --- a/hw/i386/Kconfig
> +++ b/hw/i386/Kconfig
> @@ -52,6 +52,7 @@ config PC_ACPI
>      select SMBUS_EEPROM
>      select PFLASH_CFI01
>      depends on ACPI_SMBUS
> +    select FW_CFG
>  
>  config I440FX
>      bool
> @@ -106,6 +107,7 @@ config MICROVM
>      select ACPI_HW_REDUCED
>      select PCI_EXPRESS_GENERIC_BRIDGE
>      select USB_XHCI_SYSBUS
> +    select FW_CFG
>  
>  config X86_IOMMU
>      bool
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index d11dc30509d..a7ba8283bf1 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -131,6 +131,7 @@ config VIRTEX
>  # Only used by 64-bit targets
>  config FW_CFG_PPC
>      bool
> +    select FW_CFG
>  
>  config FDT_PPC
>      bool
> diff --git a/hw/sparc/Kconfig b/hw/sparc/Kconfig
> index 8dcb10086fd..267bf45fa21 100644
> --- a/hw/sparc/Kconfig
> +++ b/hw/sparc/Kconfig
> @@ -15,6 +15,7 @@ config SUN4M
>      select STP2000
>      select CHRP_NVRAM
>      select OR_IRQ
> +    select FW_CFG
>  
>  config LEON3
>      bool
> diff --git a/hw/sparc64/Kconfig b/hw/sparc64/Kconfig
> index 980a201bb73..c17b34b9d5b 100644
> --- a/hw/sparc64/Kconfig
> +++ b/hw/sparc64/Kconfig
> @@ -13,6 +13,7 @@ config SUN4U
>      select PCKBD
>      select SIMBA
>      select CHRP_NVRAM
> +    select FW_CFG
>  
>  config NIAGARA
>      bool
> 


