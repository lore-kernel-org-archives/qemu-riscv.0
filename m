Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E59C46CD3
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 00:18:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rG6lZ-0004ZT-Qi; Wed, 20 Dec 2023 19:18:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rG6lY-0004Yu-JD; Wed, 20 Dec 2023 19:18:20 -0500
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rG6lW-0007eS-N2; Wed, 20 Dec 2023 19:18:20 -0500
Received: by mail-vs1-xe34.google.com with SMTP id
 ada2fe7eead31-466b3a84bc3so141037137.1; 
 Wed, 20 Dec 2023 16:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703117896; x=1703722696; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yZU6zURwAT7SOBImdyaTfu9tQTE4/O9PC1lPYnvKOrU=;
 b=RBsNnVhUsphzxg3SywYHB1AxVfdYplSslev2J+yIcl15rJpivVlkh0awMKgZKZVu4D
 g5Pn8uSpuTVIf1c9wlFvysglv3NHtob9NFZdXilFsjdR3aK/FTdv/gZwwsoxBFDdgvqY
 XPBVKsPLj/Wy5O19iCUj8cE1JGf3Ch5KlQoyhvQeq+ibTruVYEzqtm5q6IJWm9RtmI45
 3bawEnENlmfp2amcFryVUIFcJLcE3tx/sWf8aoSyIMQkOEaaVlDjQ/PrQ0hexZh7KoCb
 PGTJnbNgaZG7CqVYCz+05qadjbkwW2ESUvYVnY38VeliOJR8PtpLLjnkgL2/SwEgYmII
 6+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703117896; x=1703722696;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yZU6zURwAT7SOBImdyaTfu9tQTE4/O9PC1lPYnvKOrU=;
 b=W4uWbpNYWci1EFzRV7sSc+4pc5ZqREhXXkMmBzEgWdvfUF6y6tBcWYCT0WTwxnsYm8
 HmudCIghJlXTkbDpobgbaioUZBSqbATe223LvfHN1hlfXDBxXeDozj03IhzmQXp9nVB6
 inZcCQgl1JqkytLCKSirN4yFWhlVarYvIoa2ch6ucu4rR3n3kb1cne3x9WkfttwDm5uD
 c8sI6s1aqUicDdWKVbSsdhZVchZxS8TyIQQAr3pPfYvZfLXv6FMhKGKt5c5SR+zBFNNm
 aZQTDCg6R1v+g91niIhdHQ4vQ2ajDMS7ixgS+/CroUtnQppz/MCFkXRADBG7xR/FJDae
 qlGg==
X-Gm-Message-State: AOJu0Yxp5Nhv/D1Rg9OiZqNabn4Aw9tPAXp3fYZY0LxZYDXwWYKq2t4G
 FORuR9ZUeqnQzLWCVYMFx/8xzAzCmNuVAVZmlHg=
X-Google-Smtp-Source: AGHT+IEuEnPP8HUU5lwM+MurHQ3zJqmYIsOxMHhFy9SlRDNZCZip9mP2wmq0u11RwggdgASbd14LUW5QXv3YEJiH7Jk=
X-Received: by 2002:a05:6102:dd3:b0:464:7e3c:ccd4 with SMTP id
 e19-20020a0561020dd300b004647e3cccd4mr467320vst.27.1703117896193; Wed, 20 Dec
 2023 16:18:16 -0800 (PST)
MIME-Version: 1.0
References: <20231218150247.466427-1-sunilvl@ventanamicro.com>
In-Reply-To: <20231218150247.466427-1-sunilvl@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Dec 2023 10:17:49 +1000
Message-ID: <CAKmqyKMcbnSNf3A+t99N5L3YywpNwjMB95nLjFz9EGuAa2mv6g@mail.gmail.com>
Subject: Re: [PATCH v8 00/13] RISC-V: ACPI: Enable AIA, PLIC and update RHCT
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, 
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Dec 19, 2023 at 1:03=E2=80=AFAM Sunil V L <sunilvl@ventanamicro.com=
> wrote:
>
> This series primarily enables external interrupt controllers (AIA and PLI=
C)
> in ACPI tables for RISC-V virt platform. It also updates RHCT with CMO an=
d
> MMU related information.
>
> Below ECRs for these changes are approved by ASWG and will be
> available in next ACPI spec release.
>
> 1) MADT (AIA) - https://drive.google.com/file/d/1oMGPyOD58JaPgMl1pKasT-VK=
sIKia7zR/view?usp=3Dsharing
> 2) RHCT - https://drive.google.com/file/d/1sKbOa8m1UZw1JkquZYe3F1zQBN1xXs=
af/view?usp=3Dsharing
>
> First two patches in this series are to migrate a couple of functions fro=
m
> ARM architecture to common code so that RISC-V doesn't need to duplicate
> the same.
>
> The patch set is based on Alistair's riscv-to-apply.next branch.
>
> These changes are also available in  riscv_acpi_b2_v8 branch at:
> https://github.com/vlsunil/qemu/
>
> Changes since v7:
>         1) Prefixed gpex property names with "x-" as per feedback from Mi=
chael Tsirkin.
>         2) Rebased to latest riscv-to-apply.next.
>
> Changes since v6:
>         1) Fixed the qtest failure issue reported by Daniel in PATCH 2.
>
> Changes since v5:
>         1) Fixed the issue in PATCH 2 reported by Daniel found when built=
 with
>            clang + --enable-debug.
>
> Changes since v4:
>         1) Updated copyright for new files as per SPDX format suggested b=
y Drew.
>         2) Updated RINTC patch to avoid code duplication as suggested by =
Drew.
>         3) Moved mmu offset below cmo in MMU patch as suggested by Drew.
>         4) Updated tags.
>
> Changes since v3:
>         1) Addressed comments from Daniel and Drew.
>         2) Added a new patch in microvm to use common function for virtio=
 in DSDT.
>         3) Rebased to latest riscv-to-apply.next branch and added tags.
>
> Changes since v2:
>         1) Rebased to latest riscv-to-apply.next branch which needed
>            changing ext_icboz to ext_zicboz in CMO patch.
>         2) Fixed node type in MMU node.
>         3) Added latest tags.
>
> Changes since v1:
>         1) As per Igor's suggestion, migrated fw_cfg and virtio creation
>            functions to device specific file instead of generic aml-build=
.c.
>            Since ACPI is optional, new files are created and enabled for
>            build only when CONFIG_ACPI is enabled.
>         2) As per Igor's suggestion, properties are added to the GPEX PCI
>            host to indicate MMIO ranges. The platform fw can initialize
>            these to appropriate values and the DSDT generator can fetch
>            the information from the host bus itself. This makes the code
>            generic instead of machine specific.
>         3) Added PLIC patch from Haibo.
>         4) Rebased to latest riscv-to-apply.next and added RB tags as
>            appropriate.
>
> Sunil V L (13):
>   hw/arm/virt-acpi-build.c: Migrate fw_cfg creation to common location
>   hw/arm/virt-acpi-build.c: Migrate virtio creation to common location
>   hw/i386/acpi-microvm.c: Use common function to add virtio in DSDT
>   hw/riscv: virt: Make few IMSIC macros and functions public
>   hw/riscv/virt-acpi-build.c: Add AIA support in RINTC
>   hw/riscv/virt-acpi-build.c: Add IMSIC in the MADT
>   hw/riscv/virt-acpi-build.c: Add APLIC in the MADT
>   hw/riscv/virt-acpi-build.c: Add CMO information in RHCT
>   hw/riscv/virt-acpi-build.c: Add MMU node in RHCT
>   hw/pci-host/gpex: Define properties for MMIO ranges
>   hw/riscv/virt: Update GPEX MMIO related properties
>   hw/riscv/virt-acpi-build.c: Add IO controllers and devices
>   hw/riscv/virt-acpi-build.c: Add PLIC in MADT

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  hw/arm/virt-acpi-build.c        |  51 +----
>  hw/i386/acpi-microvm.c          |  15 +-
>  hw/nvram/fw_cfg-acpi.c          |  23 +++
>  hw/nvram/meson.build            |   1 +
>  hw/pci-host/gpex-acpi.c         |  13 ++
>  hw/pci-host/gpex.c              |  12 ++
>  hw/riscv/Kconfig                |   1 +
>  hw/riscv/virt-acpi-build.c      | 323 +++++++++++++++++++++++++++++---
>  hw/riscv/virt.c                 |  72 ++++---
>  hw/virtio/meson.build           |   1 +
>  hw/virtio/virtio-acpi.c         |  33 ++++
>  include/hw/nvram/fw_cfg_acpi.h  |  15 ++
>  include/hw/pci-host/gpex.h      |  28 ++-
>  include/hw/riscv/virt.h         |  26 +++
>  include/hw/virtio/virtio-acpi.h |  16 ++
>  15 files changed, 499 insertions(+), 131 deletions(-)
>  create mode 100644 hw/nvram/fw_cfg-acpi.c
>  create mode 100644 hw/virtio/virtio-acpi.c
>  create mode 100644 include/hw/nvram/fw_cfg_acpi.h
>  create mode 100644 include/hw/virtio/virtio-acpi.h
>
> --
> 2.39.2
>
>

