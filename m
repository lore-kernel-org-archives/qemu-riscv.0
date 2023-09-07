Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A6EEE14D6
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 04:50:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qe6xk-0006s1-3C; Thu, 07 Sep 2023 00:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qe6xh-0006rC-Uy; Thu, 07 Sep 2023 00:49:50 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qe6xf-0007mO-5c; Thu, 07 Sep 2023 00:49:49 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id
 ada2fe7eead31-44e84fbaab9so209389137.1; 
 Wed, 06 Sep 2023 21:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694062185; x=1694666985; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lN4jnsOv2w7ZACoJXG0nzAPT4kJdhkNOqI/AZfkM9VA=;
 b=p1VIZmqzArfNyT1crm1GRLDi8GeeBUL+UrQWQFCwtHx52OIVk0Ai+PM2HoLJJF94S3
 woLL9KPZ+Aze7iPKkM/EGPBMDOsg875CpbDYxNM8EHIubVuDYazmfHPAb8ob1V7UN+O6
 FFMgl+CYo9mCXoxkwVQkAGh3hg2TS1H8SMSa7C9H9BvRGDOZktBRgP7XgTQB3tNgRiiW
 4YM+FqNsIMkkXrZ6rtX/qj81BAIPBGMwrYQGBqGM1pT+HrAJ0CQcAssaiU2y3DXkiPzx
 fNLECritn80ZSut21laSlhWNcFqtXnwwqSYNBfbgRpkBv1U19w5Ao/EjPP3ZfkcfFyXr
 v17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694062185; x=1694666985;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lN4jnsOv2w7ZACoJXG0nzAPT4kJdhkNOqI/AZfkM9VA=;
 b=jG6VdfpfgosIQJWAwzDODHuKXB+bLpD/W244O3JpgviS/FJ01NVirgYFXaYe4oR+dK
 D+ckQbAjOVZCf3f8x2hJaAvgrw6s7ok/fm2cw3SlyYaf0bZoLe6nViNoSqCPki4o8iBb
 Ef0UyZyzWi7Ua/MOfBbUswKmaX/hF/HhiwXnOVsKr3uAqDQ1uBzbrzvsnBPDz3xdt3GN
 JrIIfTkmTnrGodT2P3/TRrIUK5Hobo6bKUDap4bKlJuF5G6dg2qfu6kuOX2ce+rvjEWt
 ALTAdEfgeTzFtkSoprikscXTYCTEg/lCZAH5gosgDI8wFlTclkYDhSMoTSWjiCwMpAZQ
 h2bQ==
X-Gm-Message-State: AOJu0YyKowjllGbqJQvkAufeNmVrKPkW9z/5XuzWxUxtLjrVWoBLu9aG
 PvTGNmwIIvNo3XtI7JAK7NpPnRLpzyBjGDvf8nU=
X-Google-Smtp-Source: AGHT+IEPduJ8Y2Wq7JwY5KcJF7CXypwTOzQiAI6yK0/2OBUW4NgFKqn0lzx9qzzaVR0nKBdBrDUeKz7gOUPJYJchUBE=
X-Received: by 2002:a67:f4d6:0:b0:44e:eb7:24e0 with SMTP id
 s22-20020a67f4d6000000b0044e0eb724e0mr5125143vsn.21.1694062185036; Wed, 06
 Sep 2023 21:49:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230824142942.3983650-1-sunilvl@ventanamicro.com>
 <20230824142942.3983650-2-sunilvl@ventanamicro.com>
In-Reply-To: <20230824142942.3983650-2-sunilvl@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 7 Sep 2023 14:49:18 +1000
Message-ID: <CAKmqyKMROSR_9YaZe4TbDXtbV6apeL-4f7uXCF0wLwPWSKuozA@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] hw/arm/virt-acpi-build.c: Migrate fw_cfg
 creation to common location
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Fri, Aug 25, 2023 at 12:30=E2=80=AFAM Sunil V L <sunilvl@ventanamicro.co=
m> wrote:
>
> RISC-V also needs to use the same code to create fw_cfg in DSDT. So, avoi=
d
> code duplication by moving the code in arm and riscv to a device specific
> file.
>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/virt-acpi-build.c       | 19 ++-----------------
>  hw/nvram/fw_cfg-acpi.c         | 17 +++++++++++++++++
>  hw/nvram/meson.build           |  1 +
>  hw/riscv/virt-acpi-build.c     | 19 ++-----------------
>  include/hw/nvram/fw_cfg_acpi.h |  9 +++++++++
>  5 files changed, 31 insertions(+), 34 deletions(-)
>  create mode 100644 hw/nvram/fw_cfg-acpi.c
>  create mode 100644 include/hw/nvram/fw_cfg_acpi.h
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 6b674231c2..b8e725d953 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -35,7 +35,7 @@
>  #include "target/arm/cpu.h"
>  #include "hw/acpi/acpi-defs.h"
>  #include "hw/acpi/acpi.h"
> -#include "hw/nvram/fw_cfg.h"
> +#include "hw/nvram/fw_cfg_acpi.h"
>  #include "hw/acpi/bios-linker-loader.h"
>  #include "hw/acpi/aml-build.h"
>  #include "hw/acpi/utils.h"
> @@ -94,21 +94,6 @@ static void acpi_dsdt_add_uart(Aml *scope, const MemMa=
pEntry *uart_memmap,
>      aml_append(scope, dev);
>  }
>
> -static void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_m=
emmap)
> -{
> -    Aml *dev =3D aml_device("FWCF");
> -    aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0002")));
> -    /* device present, functioning, decoding, not shown in UI */
> -    aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
> -    aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> -
> -    Aml *crs =3D aml_resource_template();
> -    aml_append(crs, aml_memory32_fixed(fw_cfg_memmap->base,
> -                                       fw_cfg_memmap->size, AML_READ_WRI=
TE));
> -    aml_append(dev, aml_name_decl("_CRS", crs));
> -    aml_append(scope, dev);
> -}
> -
>  static void acpi_dsdt_add_flash(Aml *scope, const MemMapEntry *flash_mem=
map)
>  {
>      Aml *dev, *crs;
> @@ -864,7 +849,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, Vi=
rtMachineState *vms)
>      if (vmc->acpi_expose_flash) {
>          acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
>      }
> -    acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
> +    fw_cfg_acpi_dsdt_add(scope, &memmap[VIRT_FW_CFG]);
>      acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
>                      (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANS=
PORTS);
>      acpi_dsdt_add_pci(scope, memmap, irqmap[VIRT_PCIE] + ARM_SPI_BASE, v=
ms);
> diff --git a/hw/nvram/fw_cfg-acpi.c b/hw/nvram/fw_cfg-acpi.c
> new file mode 100644
> index 0000000000..4eeb81bc36
> --- /dev/null
> +++ b/hw/nvram/fw_cfg-acpi.c
> @@ -0,0 +1,17 @@
> +#include "hw/nvram/fw_cfg_acpi.h"
> +#include "hw/acpi/aml-build.h"
> +
> +void fw_cfg_acpi_dsdt_add(Aml *scope, const MemMapEntry *fw_cfg_memmap)
> +{
> +    Aml *dev =3D aml_device("FWCF");
> +    aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0002")));
> +    /* device present, functioning, decoding, not shown in UI */
> +    aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
> +    aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> +
> +    Aml *crs =3D aml_resource_template();
> +    aml_append(crs, aml_memory32_fixed(fw_cfg_memmap->base,
> +                                       fw_cfg_memmap->size, AML_READ_WRI=
TE));
> +    aml_append(dev, aml_name_decl("_CRS", crs));
> +    aml_append(scope, dev);
> +}
> diff --git a/hw/nvram/meson.build b/hw/nvram/meson.build
> index 988dff6f8e..69e6df5aac 100644
> --- a/hw/nvram/meson.build
> +++ b/hw/nvram/meson.build
> @@ -21,3 +21,4 @@ system_ss.add(when: 'CONFIG_XLNX_EFUSE_ZYNQMP', if_true=
: files(
>  system_ss.add(when: 'CONFIG_XLNX_BBRAM', if_true: files('xlnx-bbram.c'))
>
>  specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('spapr_nvram.c'))
> +specific_ss.add(when: 'CONFIG_ACPI', if_true: files('fw_cfg-acpi.c'))
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 7331248f59..d8772c2821 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -28,6 +28,7 @@
>  #include "hw/acpi/acpi.h"
>  #include "hw/acpi/aml-build.h"
>  #include "hw/acpi/utils.h"
> +#include "hw/nvram/fw_cfg_acpi.h"
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
>  #include "sysemu/reset.h"
> @@ -97,22 +98,6 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtSt=
ate *s)
>      }
>  }
>
> -static void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_m=
emmap)
> -{
> -    Aml *dev =3D aml_device("FWCF");
> -    aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0002")));
> -
> -    /* device present, functioning, decoding, not shown in UI */
> -    aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
> -    aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> -
> -    Aml *crs =3D aml_resource_template();
> -    aml_append(crs, aml_memory32_fixed(fw_cfg_memmap->base,
> -                                       fw_cfg_memmap->size, AML_READ_WRI=
TE));
> -    aml_append(dev, aml_name_decl("_CRS", crs));
> -    aml_append(scope, dev);
> -}
> -
>  /* RHCT Node[N] starts at offset 56 */
>  #define RHCT_NODE_ARRAY_OFFSET 56
>
> @@ -226,7 +211,7 @@ static void build_dsdt(GArray *table_data,
>      scope =3D aml_scope("\\_SB");
>      acpi_dsdt_add_cpus(scope, s);
>
> -    acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
> +    fw_cfg_acpi_dsdt_add(scope, &memmap[VIRT_FW_CFG]);
>
>      aml_append(dsdt, scope);
>
> diff --git a/include/hw/nvram/fw_cfg_acpi.h b/include/hw/nvram/fw_cfg_acp=
i.h
> new file mode 100644
> index 0000000000..6e2c5f04b7
> --- /dev/null
> +++ b/include/hw/nvram/fw_cfg_acpi.h
> @@ -0,0 +1,9 @@
> +#ifndef FW_CFG_ACPI_H
> +#define FW_CFG_ACPI_H
> +
> +#include "qemu/osdep.h"
> +#include "exec/hwaddr.h"
> +
> +void fw_cfg_acpi_dsdt_add(Aml *scope, const MemMapEntry *fw_cfg_memmap);
> +
> +#endif
> --
> 2.39.2
>
>

