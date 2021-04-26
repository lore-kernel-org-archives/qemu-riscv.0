Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lb9Kk-0005zJ-10
	for mharc-qemu-riscv@gnu.org; Mon, 26 Apr 2021 18:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lb9KY-0005xu-Je; Mon, 26 Apr 2021 18:03:52 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:22741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lb9KU-0002ZI-NW; Mon, 26 Apr 2021 18:03:49 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 53D7B74581E;
 Tue, 27 Apr 2021 00:03:42 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2463574570D; Tue, 27 Apr 2021 00:03:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 21C597456B4;
 Tue, 27 Apr 2021 00:03:42 +0200 (CEST)
Date: Tue, 27 Apr 2021 00:03:42 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org, 
 Eduardo Habkost <ehabkost@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Helge Deller <deller@gmx.de>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, 
 David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 5/7] hw: Have machines Kconfig-select FW_CFG
In-Reply-To: <20210426193520.4115528-6-philmd@redhat.com>
Message-ID: <aec5eea-8beb-a59-fda1-4c1ba4374c5@eik.bme.hu>
References: <20210426193520.4115528-1-philmd@redhat.com>
 <20210426193520.4115528-6-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-991902759-1619474622=:18331"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
X-List-Received-Date: Mon, 26 Apr 2021 22:03:57 -0000

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-991902759-1619474622=:18331
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 26 Apr 2021, Philippe Mathieu-Daudé wrote:
> Beside the loongson3-virt machine (MIPS), the following machines
> also use the fw_cfg device:
>
> - ARM: virt & sbsa-ref
> - HPPA: generic machine
> - X86: ACPI based (pc & microvm)
> - PPC64: various
> - SPARC: sun4m & sun4u
>
> Add their FW_CFG Kconfig dependency.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> hw/arm/Kconfig     | 2 ++
> hw/hppa/Kconfig    | 1 +
> hw/i386/Kconfig    | 2 ++
> hw/ppc/Kconfig     | 1 +
> hw/sparc/Kconfig   | 1 +
> hw/sparc64/Kconfig | 1 +
> 6 files changed, 8 insertions(+)
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 8c37cf00da7..3b2641e39dc 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -8,6 +8,7 @@ config ARM_VIRT
>     imply TPM_TIS_SYSBUS
>     select ARM_GIC
>     select ACPI
> +    select FW_CFG
>     select ARM_SMMUV3
>     select GPIO_KEY
>     select FW_CFG_DMA
> @@ -216,6 +217,7 @@ config SBSA_REF
>     select PL061 # GPIO
>     select USB_EHCI_SYSBUS
>     select WDT_SBSA
> +    select FW_CFG
>
> config SABRELITE
>     bool
> diff --git a/hw/hppa/Kconfig b/hw/hppa/Kconfig
> index 22948db0256..45f40e09224 100644
> --- a/hw/hppa/Kconfig
> +++ b/hw/hppa/Kconfig
> @@ -14,3 +14,4 @@ config DINO
>     select LASIPS2
>     select PARALLEL
>     select ARTIST
> +    select FW_CFG
> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
> index 7f91f30877f..9e4039a2dce 100644
> --- a/hw/i386/Kconfig
> +++ b/hw/i386/Kconfig
> @@ -52,6 +52,7 @@ config PC_ACPI
>     select SMBUS_EEPROM
>     select PFLASH_CFI01
>     depends on ACPI_SMBUS
> +    select FW_CFG
>
> config I440FX
>     bool
> @@ -106,6 +107,7 @@ config MICROVM
>     select ACPI_HW_REDUCED
>     select PCI_EXPRESS_GENERIC_BRIDGE
>     select USB_XHCI_SYSBUS
> +    select FW_CFG
>
> config X86_IOMMU
>     bool
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index d11dc30509d..a7ba8283bf1 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -131,6 +131,7 @@ config VIRTEX
> # Only used by 64-bit targets
> config FW_CFG_PPC
>     bool
> +    select FW_CFG

Why do we need a separate config option here if all it does is select 
FW_CFG and also in meson.build it only seems to add fw_cfg.c? (Unlike 
FW_CFG_DMA which seems to add other files so another option makes sense 
for that case). Could we just use FW_CFG directly and drop the PPC 
specific option like you did for MIPS?

Also the comment saying "Only used by 64-bit targets" seems to be wrong as 
it is also selected by MAC_OLDWORLD that's definitely a 32-bit machine 
(and MAC_NEWWORLD that can be both 32 or 64 bit) so maybe this option used 
to do something previously but now seems to be equivalent to just FW_CFG. 
So could it be dropped and use FW_CFG instead to simplify this or what's 
the reason to keep a PPC specific option for it?

Regards,
BALATON Zoltan

>
> config FDT_PPC
>     bool
> diff --git a/hw/sparc/Kconfig b/hw/sparc/Kconfig
> index 8dcb10086fd..267bf45fa21 100644
> --- a/hw/sparc/Kconfig
> +++ b/hw/sparc/Kconfig
> @@ -15,6 +15,7 @@ config SUN4M
>     select STP2000
>     select CHRP_NVRAM
>     select OR_IRQ
> +    select FW_CFG
>
> config LEON3
>     bool
> diff --git a/hw/sparc64/Kconfig b/hw/sparc64/Kconfig
> index 980a201bb73..c17b34b9d5b 100644
> --- a/hw/sparc64/Kconfig
> +++ b/hw/sparc64/Kconfig
> @@ -13,6 +13,7 @@ config SUN4U
>     select PCKBD
>     select SIMBA
>     select CHRP_NVRAM
> +    select FW_CFG
>
> config NIAGARA
>     bool
>
--3866299591-991902759-1619474622=:18331--

