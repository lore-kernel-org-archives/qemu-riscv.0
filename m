Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F157C7115B
	for <qemu-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 15:28:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uSHBT-0001xZ-3a; Thu, 19 Jun 2025 11:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1uSHBQ-0001wr-TG
 for qemu-riscv@nongnu.org; Thu, 19 Jun 2025 11:28:09 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1uSHBO-00049S-US
 for qemu-riscv@nongnu.org; Thu, 19 Jun 2025 11:28:08 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-748da522e79so496559b3a.1
 for <qemu-riscv@nongnu.org>; Thu, 19 Jun 2025 08:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1750346883; x=1750951683; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=luOWSFgzP/rKccc7s4K9TLiyXYoWyKmChcndNKlURKc=;
 b=ibXa6TRasB+DQJ0ypJInEiuTWJtMzF46i6jWAwrRepoxA3aFxUCkN7mb+zs0Rvms9R
 hy7GBYV1yUiNKrJ+KIJS8HOLYmHjDU3HGSsqjUpmvFvCscIVSkXBXs4lIS8LWj6bArvP
 EAc8eKwVpjrkiVKRnpoWROj1zyFxi64IlNHDK8qNUrJ1K8ncjbyeCDulru6Cn+wfHfqn
 gD0518VEHK5ajQ/IQ5ar9FsucTatEneb0LVysFBfrr35jREdrSi+WQ4XxNjF1w+ESn7R
 xobJOCQ2YiknO1TtDRgZRgV9kLQJCDnOZOO4avE5FwatYNXetn0PVfjd8pFNcFLCCsJw
 6PDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750346883; x=1750951683;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=luOWSFgzP/rKccc7s4K9TLiyXYoWyKmChcndNKlURKc=;
 b=cwiXtKeUqW3suPgio141PicSt7MoweIPuyOOYoaNsyOfHF2mq7wLo6v5iP0Q77B7Nw
 vGGLYJw2zgJbRvf7hzHHa/D8g3I+1/yZ/fVH5I9bAjWYPiiJFvdRKkdWF5xMH6wKGtiC
 0uJsGM+w/BYyk+TZOZPiTjWjZllyPm2Vj+fVErh1bCLKUpy/RlOL9pfBfFOAqualUREh
 j+khpn9F+zSE2jtNLzuaWX24So7e0wnnaDTtmYFmQl2QzOY2V9RfvVE1vea2bvngNsBQ
 w7vpuPXf98aJcR9uawAe5HgUCRnbieMCoUGGVoNQhFd3eGqXPIn+WAud1ZwW3fw3cKhl
 HYqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC2fJIcuYnThOdHdv/CNY3Czm4NTsQeClGBI7/+zEfxUEAl6sd8GQlspDcUTpnzPPtxr/pWgqkaa7P@nongnu.org
X-Gm-Message-State: AOJu0Yykv+pplGX2QbAaBa7iKFrSyGBot353T/KPj61U0grvAFMl+tk+
 HuQ/uOaMTDWRKULHXMWEA2acy5V1Gzf/z/6rpkl0dj0LvesRc3hPsJRXAMGXSmb999w=
X-Gm-Gg: ASbGncs5L1MTPmlAQBIF1O926//vtt/2BDNLLs+hAy5Wd+ZujNtSt1YHUUHkF+CozIK
 F4opaXSB2/Gdfp8eeGPlyLcqW9oT4QZMDB/1GydY4umrUkvNEoQLssEjT4/ja0Er4xMpafzQaZD
 PHxuEyQTLmdeDjtgFc9YeTL5heQSqPxBfed1cEqrtvlh0QcatVEesE30LGQ0/0ateR8EefMQWZM
 zzIuiCNvxCT4ExvH8AWi3N2aKKxP9zCcsRHanEmp+RsB8ritRREBLSeqNBx1DQ1zOVJYhOCZ2bT
 pEuBsMazVy55obJrLWaCH291eWvGHGWtRo4aKRIKT/J5Ltp4HC+k074tHdSaFHGt006qlw==
X-Google-Smtp-Source: AGHT+IF9oYXXshN3eBZ947NClFg9EzZik2AZgCUwk+ajmuz5HHa2UBuAW1wWbOfQsB7E+JbEBsdF+A==
X-Received: by 2002:a05:6a20:9f43:b0:1f5:6f61:a0ac with SMTP id
 adf61e73a8af0-21fbd5591d4mr28267821637.5.1750346883209; 
 Thu, 19 Jun 2025 08:28:03 -0700 (PDT)
Received: from sunil-laptop ([103.97.166.196])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7490a465c40sm148684b3a.17.2025.06.19.08.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jun 2025 08:28:02 -0700 (PDT)
Date: Thu, 19 Jun 2025 20:57:54 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: liu.xuemei1@zte.com.cn
Cc: pbonzini@redhat.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, bjorn@rivosinc.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/riscv/virt: Add acpi ged and powerdown support
Message-ID: <aFQseigG0Wbqx1CC@sunil-laptop>
References: <202506191556260735QxWC8sxRwFURYEvlD24y@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202506191556260735QxWC8sxRwFURYEvlD24y@zte.com.cn>
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hi Xuemei Liu,

Thank you for the patch!

On Thu, Jun 19, 2025 at 03:56:26PM +0800, liu.xuemei1@zte.com.cn wrote:
> From: Xuemei Liu <liu.xuemei1@zte.com.cn>
> 
> This adds powerdown support by implementing the ACPI GED.
> 
> Signed-off-by: Xuemei Liu <liu.xuemei1@zte.com.cn>
> Co-authored-by: Björn Töpel <bjorn@rivosinc.com>
> ---
>  hw/riscv/Kconfig           |  1 +
>  hw/riscv/virt-acpi-build.c | 12 ++++++++++++
>  hw/riscv/virt.c            | 32 ++++++++++++++++++++++++++++++++
>  include/hw/riscv/virt.h    |  4 ++++
>  4 files changed, 49 insertions(+)
> 
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index e6a0ac1fa1..16837e0e8f 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -68,6 +68,7 @@ config RISCV_VIRT
>      select PLATFORM_BUS
>      select ACPI
>      select ACPI_PCI
> +    select ACPI_HW_REDUCED
> 
>  config SHAKTI_C
>      bool
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 8b5683dbde..89365c40b4 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -29,6 +29,7 @@
>  #include "hw/acpi/aml-build.h"
>  #include "hw/acpi/pci.h"
>  #include "hw/acpi/utils.h"
> +#include "hw/acpi/generic_event_device.h"
>
NIT: Could you include this after aml-build.h to keep it sorted?

>  #include "hw/intc/riscv_aclint.h"
>  #include "hw/nvram/fw_cfg_acpi.h"
>  #include "hw/pci-host/gpex.h"
> @@ -224,6 +225,16 @@ static void acpi_dsdt_add_iommu_sys(Aml *scope, const MemMapEntry *iommu_memmap,
>      aml_append(scope, dev);
>  }
> 
> +static void acpi_dsdt_add_ged(Aml *scope, RISCVVirtState *s)
> +{
> +    build_ged_aml(scope, "\\_SB."GED_DEVICE,
> +                  HOTPLUG_HANDLER(s->acpi_ged),
> +                  ACPI_GED_IRQ, AML_SYSTEM_MEMORY,
> +                  s->memmap[VIRT_ACPI_GED].base);
> +
> +    acpi_dsdt_add_power_button(scope);
>
Instead of this wrapper function to create both ged and power button,
please call them directly below where you are calling
acpi_dsdt_add_ged(). It will help in future to add some other eventing
mechanism to the power button.

> +}
> +
>  /*
>   * Serial Port Console Redirection Table (SPCR)
>   * Rev: 1.10
> @@ -497,6 +508,7 @@ static void build_dsdt(GArray *table_data,
>                               VIRTIO_COUNT);
>          acpi_dsdt_add_gpex_host(scope, PCIE_IRQ + VIRT_IRQCHIP_NUM_SOURCES * 2);
>      }
> +    acpi_dsdt_add_ged(scope, s);
> 
This should be conditional - only if s->acpi_ged is set.

>      aml_append(dsdt, scope);
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index cf280a92e5..aaa33b9740 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -51,10 +51,12 @@
>  #include "system/kvm.h"
>  #include "system/tpm.h"
>  #include "system/qtest.h"
> +#include "system/runstate.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci-host/gpex.h"
>  #include "hw/display/ramfb.h"
>  #include "hw/acpi/aml-build.h"
> +#include "hw/acpi/generic_event_device.h"
>  #include "qapi/qapi-visit-common.h"
>  #include "hw/virtio/virtio-iommu.h"
>  #include "hw/uefi/var-service-api.h"
> @@ -95,6 +97,7 @@ static const MemMapEntry virt_memmap[] = {
>      [VIRT_UART0] =        { 0x10000000,         0x100 },
>      [VIRT_VIRTIO] =       { 0x10001000,        0x1000 },
>      [VIRT_FW_CFG] =       { 0x10100000,          0x18 },
> +    [VIRT_ACPI_GED] =     { 0x10200000, ACPI_GED_EVT_SEL_LEN },
Do we need to align the base address at 1MB? It can create a larger hole
unnecessarily.

>      [VIRT_FLASH] =        { 0x20000000,     0x4000000 },
>      [VIRT_IMSIC_M] =      { 0x24000000, VIRT_IMSIC_MAX_SIZE },
>      [VIRT_IMSIC_S] =      { 0x28000000, VIRT_IMSIC_MAX_SIZE },
> @@ -1272,6 +1275,21 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
>      return dev;
>  }
> 
> +static DeviceState *create_acpi_ged(RISCVVirtState *s, DeviceState *irqchip)
> +{
> +    DeviceState *dev;
> +    uint32_t event = ACPI_GED_PWR_DOWN_EVT;
> +
> +    dev = qdev_new(TYPE_ACPI_GED);
> +    qdev_prop_set_uint32(dev, "ged-event", event);
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +
> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, s->memmap[VIRT_ACPI_GED].base);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, qdev_get_gpio_in(irqchip, ACPI_GED_IRQ));
> +
> +    return dev;
> +}
> +
>  static FWCfgState *create_fw_cfg(const MachineState *ms, hwaddr base)
>  {
>      FWCfgState *fw_cfg;
> @@ -1430,6 +1448,14 @@ static void virt_build_smbios(RISCVVirtState *s)
>      }
>  }
> 
> +static void virt_powerdown_req(Notifier *notifier, void *opaque)
> +{
> +    RISCVVirtState *s;
> +
> +    s = container_of(notifier, RISCVVirtState, powerdown_notifier);
> +    acpi_send_event(s->acpi_ged, ACPI_POWER_DOWN_STATUS);
Check for s->acpi_ged here. 

> +}
> +
>  static void virt_machine_done(Notifier *notifier, void *data)
>  {
>      RISCVVirtState *s = container_of(notifier, RISCVVirtState,
> @@ -1703,6 +1729,9 @@ static void virt_machine_init(MachineState *machine)
> 
>      create_platform_bus(s, mmio_irqchip);
> 
> +    /* acpi ged */
> +    s->acpi_ged = create_acpi_ged(s, mmio_irqchip);
> +
>
I think we should create GED only if ACPI is enabled.

Thanks!
Sunil

