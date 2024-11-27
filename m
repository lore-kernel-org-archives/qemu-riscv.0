Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45BAD609A0
	for <qemu-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 06:21:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tGBQL-0001Jz-IN; Wed, 27 Nov 2024 01:21:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tGBQK-0001Jh-I7
 for qemu-riscv@nongnu.org; Wed, 27 Nov 2024 01:21:16 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tGBQI-0000sG-J7
 for qemu-riscv@nongnu.org; Wed, 27 Nov 2024 01:21:16 -0500
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2129fd7b1a5so46622025ad.1
 for <qemu-riscv@nongnu.org>; Tue, 26 Nov 2024 22:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1732688473; x=1733293273;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LsOvOmMf3w/SCe2IW/yju1fTZ4Y/TjDGj2IXw5CHGEY=;
 b=Y2WXO61DZAvk8K/oxzSoV9Eicx65QydHZ35+83rQSIE6XtqoTpzoiTVvyp9aFdcpsQ
 6eiiwBPdjnDnEP9jUmuPqj7ropa64/WuZJ8p2nfno/bPfpIOG9lDgHQSNgYNtR5RNuXe
 YOl58vY3+XLqglRGBIqoJlZiQJ6GRCEtyZ5faX6QfxRSk1niJ4oZfO5Z4SyfFFE1qUYo
 HHkFkQGdjDIxc6Qrz7pg3Qh3vHcZP/2xdFfkpzVt47Gv6Jch0K+YjZH1DuEtl0QMCDe4
 VRGnQ1CySlg9WNjfzK5a32UvHyVFbddDmvTUDALIHdXVY7Bs51ekJDU4HcNAX3T6SFjV
 sRiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732688473; x=1733293273;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LsOvOmMf3w/SCe2IW/yju1fTZ4Y/TjDGj2IXw5CHGEY=;
 b=K5cGJpv+QP6KhGf2rBqGvDe9WzvS8/WOIdZ/lB10ICzvL0RElGK8AfhJWguxgJD+/u
 izaL+Kzg1oZJtd4eCvAjIa/Y1mzcy/GWDqkVUkswNeI9SFjRcjKBOyGxXoAUeIIj4uoN
 ICoM6db6ntF5bt+TPULCT7xOQPCnByOtjkdMv1mR03ctPA9BpDCKpMtz+sZqjOMCmMM9
 a03AmCKnyRcoWB2tQAVOuFoNfv0DjZeXpIg00W9/sIvcHIHI9AS7Bw6b5HUm0N7DNCMB
 Jnq44P+2SphaZfRdoufILOH9vyioZ/J9z7M01TrijA4DAmJJv8WqTB6EbTosvOqYG9QM
 LCLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYK9ntCpSGcTvyxhvYNCZp+6ssfQjuGtAD5r791D688UsIAhTt6B9o1wex/khOirGUlCQfhY1y7oyG@nongnu.org
X-Gm-Message-State: AOJu0Yw4TBQKRkk6oC1t89TLCtI1YwhdzmEg/6sKbj8FCdsE7o+Yo1GC
 /wQssirsF5forD9OqUhbDFI+sZxkvoNPebzJgQq85Ua8tqVs8iuKFJSxyLm34Gg=
X-Gm-Gg: ASbGncuniDyUWKXrj8d7BodN0eraFIzsd+pmObA0ab8+NSGobSQg/FxtQeIA5KgaYex
 VS4v2An2YFVRIJAM1+v+5C396XutdOfZKYVDDP+PXiF2aLZUzNX2TXu0DaMqLVzZoUxH92P5rSF
 InuAmWsTDKKaDRuawQlbn5HY7CCl5Ze8fFSPDmESwj7RPLQXPlo7GK+I/5/d1PEq9YJA143wpvO
 JflsRbbz1m2G1mUTOM1/4PE1+7+FgzhyAZGaNWcVC1kW3ezqE8LfTtgAHiYL7k=
X-Google-Smtp-Source: AGHT+IETQNPxqIXvin/YcL4UHwyYkx8gKnib5dUuNPn3VLH319barj0zHJ7OgpOvgY169abvDwmotg==
X-Received: by 2002:a17:902:e948:b0:212:10ff:4b7f with SMTP id
 d9443c01a7336-21501f77c50mr20787315ad.55.1732688473039; 
 Tue, 26 Nov 2024 22:21:13 -0800 (PST)
Received: from [157.82.207.167] ([157.82.207.167])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2129dc176b3sm94994095ad.220.2024.11.26.22.21.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 22:21:12 -0800 (PST)
Message-ID: <dbeffb16-70d8-4a4c-8518-649edaec534a@daynix.com>
Date: Wed, 27 Nov 2024 15:21:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 03/15] hw/display/apple-gfx: Adds PCI implementation
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, stefanha@redhat.com,
 mst@redhat.com, slp@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, gaosong@loongson.cn,
 jiaxun.yang@flygoat.com, chenhuacai@kernel.org, kwolf@redhat.com,
 hreitz@redhat.com, philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org, balaton@eik.bme.hu
References: <20241113142343.40832-1-phil@philjordan.eu>
 <20241113142343.40832-4-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241113142343.40832-4-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 2024/11/13 23:23, Phil Dennis-Jordan wrote:
> This change wires up the PCI variant of the paravirtualised
> graphics device, mainly useful for x86-64 macOS guests, implemented
> by macOS's ParavirtualizedGraphics.framework. It builds on code
> shared with the vmapple/mmio variant of the PVG device.
> 
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> ---
> 
> v4:
> 
>   * Threading improvements analogous to those in common apple-gfx code
>     and mmio device variant.
>   * Smaller code review issues addressed.
> 
> v5:
> 
>   * Minor error handling improvement.
> 
> v6:
> 
>   * Removed an unused function parameter.
> 
> v9:
> 
>   * Fixup of changed common call.
>   * Whitespace and comment formatting tweaks.
> 
>   hw/display/Kconfig         |   4 +
>   hw/display/apple-gfx-pci.m | 150 +++++++++++++++++++++++++++++++++++++
>   hw/display/meson.build     |   1 +
>   3 files changed, 155 insertions(+)
>   create mode 100644 hw/display/apple-gfx-pci.m
> 
> diff --git a/hw/display/Kconfig b/hw/display/Kconfig
> index 6a9b7b19ada..2b53dfd7d26 100644
> --- a/hw/display/Kconfig
> +++ b/hw/display/Kconfig
> @@ -149,3 +149,7 @@ config MAC_PVG_MMIO
>       bool
>       depends on MAC_PVG && AARCH64
>   
> +config MAC_PVG_PCI
> +    bool
> +    depends on MAC_PVG && PCI
> +    default y if PCI_DEVICES
> diff --git a/hw/display/apple-gfx-pci.m b/hw/display/apple-gfx-pci.m
> new file mode 100644
> index 00000000000..5a27b95ac79
> --- /dev/null
> +++ b/hw/display/apple-gfx-pci.m
> @@ -0,0 +1,150 @@
> +/*
> + * QEMU Apple ParavirtualizedGraphics.framework device, PCI variant
> + *
> + * Copyright © 2023-2024 Phil Dennis-Jordan
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * ParavirtualizedGraphics.framework is a set of libraries that macOS provides
> + * which implements 3d graphics passthrough to the host as well as a
> + * proprietary guest communication channel to drive it. This device model
> + * implements support to drive that library from within QEMU as a PCI device
> + * aimed primarily at x86-64 macOS VMs.
> + */
> +
> +#include "apple-gfx.h"
> +#include "hw/pci/pci_device.h"
> +#include "hw/pci/msi.h"
> +#include "qapi/error.h"
> +#include "trace.h"
> +#import <ParavirtualizedGraphics/ParavirtualizedGraphics.h>
> +
> +OBJECT_DECLARE_SIMPLE_TYPE(AppleGFXPCIState, APPLE_GFX_PCI)
> +
> +struct AppleGFXPCIState {
> +    PCIDevice parent_obj;
> +
> +    AppleGFXState common;
> +};
> +
> +static const char* apple_gfx_pci_option_rom_path = NULL;
> +
> +static void apple_gfx_init_option_rom_path(void)
> +{
> +    NSURL *option_rom_url = PGCopyOptionROMURL();
> +    const char *option_rom_path = option_rom_url.fileSystemRepresentation;
> +    apple_gfx_pci_option_rom_path = g_strdup(option_rom_path);
> +    [option_rom_url release];
> +}
> +
> +static void apple_gfx_pci_init(Object *obj)
> +{
> +    AppleGFXPCIState *s = APPLE_GFX_PCI(obj);
> +
> +    if (!apple_gfx_pci_option_rom_path) {
> +        /*
> +         * The following is done on device not class init to avoid running
> +         * ObjC code before fork() in -daemonize mode.
> +         */
> +        PCIDeviceClass *pci = PCI_DEVICE_CLASS(object_get_class(obj));
> +        apple_gfx_init_option_rom_path();
> +        pci->romfile = apple_gfx_pci_option_rom_path;
> +    }
> +
> +    apple_gfx_common_init(obj, &s->common, TYPE_APPLE_GFX_PCI);
> +}
> +
> +typedef struct AppleGFXPCIInterruptJob {
> +    PCIDevice *device;
> +    uint32_t vector;
> +} AppleGFXPCIInterruptJob;
> +
> +static void apple_gfx_pci_raise_interrupt(void *opaque)
> +{
> +    AppleGFXPCIInterruptJob *job = opaque;
> +
> +    if (msi_enabled(job->device)) {
> +        msi_notify(job->device, job->vector);
> +    }
> +    g_free(job);
> +}
> +
> +static void apple_gfx_pci_interrupt(PCIDevice *dev, uint32_t vector)
> +{
> +    AppleGFXPCIInterruptJob *job;
> +
> +    trace_apple_gfx_raise_irq(vector);
> +    job = g_malloc0(sizeof(*job));
> +    job->device = dev;
> +    job->vector = vector;
> +    aio_bh_schedule_oneshot(qemu_get_aio_context(),
> +                            apple_gfx_pci_raise_interrupt, job);
> +}
> +
> +static void apple_gfx_pci_realize(PCIDevice *dev, Error **errp)
> +{
> +    AppleGFXPCIState *s = APPLE_GFX_PCI(dev);
> +    int ret;
> +
> +    pci_register_bar(dev, PG_PCI_BAR_MMIO,
> +                     PCI_BASE_ADDRESS_SPACE_MEMORY, &s->common.iomem_gfx);
> +
> +    ret = msi_init(dev, 0x0 /* config offset; 0 = find space */,
> +                   PG_PCI_MAX_MSI_VECTORS, true /* msi64bit */,
> +                   false /* msi_per_vector_mask */, errp);
> +    if (ret != 0) {
> +        return;
> +    }
> +
> +    @autoreleasepool {
> +        PGDeviceDescriptor *desc = [PGDeviceDescriptor new];
> +        desc.raiseInterrupt = ^(uint32_t vector) {
> +            apple_gfx_pci_interrupt(dev, vector);
> +        };
> +
> +        apple_gfx_common_realize(&s->common, DEVICE(dev), desc, errp);
> +        [desc release];
> +        desc = nil;
> +    }
> +}
> +
> +static void apple_gfx_pci_reset(Object *obj, ResetType type)
> +{
> +    AppleGFXPCIState *s = APPLE_GFX_PCI(obj);
> +    [s->common.pgdev reset];
> +}
> +
> +static void apple_gfx_pci_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    PCIDeviceClass *pci = PCI_DEVICE_CLASS(klass);
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
> +
> +    rc->phases.hold = apple_gfx_pci_reset;
> +    dc->desc = "macOS Paravirtualized Graphics PCI Display Controller";
> +    dc->hotpluggable = false;
> +    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
> +
> +    pci->vendor_id = PG_PCI_VENDOR_ID;
> +    pci->device_id = PG_PCI_DEVICE_ID;
> +    pci->class_id = PCI_CLASS_DISPLAY_OTHER;
> +    pci->realize = apple_gfx_pci_realize;
> +
> +    // TODO: Property for setting mode list

docs/devel/style.rst says:
 > We use traditional C-style /``*`` ``*``/ comments and avoid
 > // comments.

> +}
> +
> +static TypeInfo apple_gfx_pci_types[] = {
> +    {
> +        .name          = TYPE_APPLE_GFX_PCI,
> +        .parent        = TYPE_PCI_DEVICE,
> +        .instance_size = sizeof(AppleGFXPCIState),
> +        .class_init    = apple_gfx_pci_class_init,
> +        .instance_init = apple_gfx_pci_init,
> +        .interfaces = (InterfaceInfo[]) {
> +            { INTERFACE_PCIE_DEVICE },
> +            { },
> +        },
> +    }
> +};
> +DEFINE_TYPES(apple_gfx_pci_types)
> +
> diff --git a/hw/display/meson.build b/hw/display/meson.build
> index cf9e6dd35d2..94f4f05d36f 100644
> --- a/hw/display/meson.build
> +++ b/hw/display/meson.build
> @@ -63,6 +63,7 @@ system_ss.add(when: 'CONFIG_ATI_VGA', if_true: [files('ati.c', 'ati_2d.c', 'ati_
>   
>   if host_os == 'darwin'
>     system_ss.add(when: 'CONFIG_MAC_PVG',         if_true: [files('apple-gfx.m'), pvg, metal])
> +  system_ss.add(when: 'CONFIG_MAC_PVG_PCI',     if_true: [files('apple-gfx-pci.m'), pvg, metal])
>     if cpu == 'aarch64'
>       system_ss.add(when: 'CONFIG_MAC_PVG_MMIO',  if_true: [files('apple-gfx-mmio.m'), pvg, metal])
>     endif


