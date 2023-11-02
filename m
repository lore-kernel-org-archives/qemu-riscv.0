Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4F0C4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 01:40:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyMef-0008I3-Rt; Wed, 01 Nov 2023 21:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyMeQ-0006bD-6B; Wed, 01 Nov 2023 21:37:38 -0400
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyMeO-0004O1-35; Wed, 01 Nov 2023 21:37:37 -0400
Received: by mail-vk1-xa36.google.com with SMTP id
 71dfb90a1353d-49d14708479so185337e0c.2; 
 Wed, 01 Nov 2023 18:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698889054; x=1699493854; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wjWRa1Wzmn0jailQulhJtnO/Qew3pE9/7oExw7/ImvA=;
 b=mxSDG/EujA+nTTEecnGh8AXu8ICbMy9I/0xUavvoypz+P8P16jmo5AGpdEKqJuRjyv
 NlRkqlqOgh9W9ox13tf0m2fgdODXHR+14JGgt3aSDta8EEMOoLdLLda5sn9avfPbpb1D
 rkx4TJMDf5JEDoQakZpf+nxJ/sRuG0S13DVp75ZthINK5RFl/S2OwqSxUZ68LoNUNDq8
 9g70SuO69fAgolTw0qtei3FdQd8qKwF+HE+jKvfHQGvasx5NYf6/5x4yawMM9xi9xVy4
 LrSjDu4dAhzzwq3bDtjodUtq/wp+Lsxc1p51LVy+0+aF54bahneRxIAqMrC04xb1vuvQ
 njhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698889054; x=1699493854;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wjWRa1Wzmn0jailQulhJtnO/Qew3pE9/7oExw7/ImvA=;
 b=VhO72l/tu8Xdw7O4IndqNT0edzOS+Q9/xfqNi1jINbpB1dPK7uqy0t56YavVZzM1u/
 mkGXrPNxnjvvdVXLEGEoej2fJmHQZA5Jd/ErkGDxYdyS4wCoLm+RuCVvf56jjVmO5frM
 bstSyf++4y7vuUozhb51HQYcGrl4RTx7VT27jztcDy/ZS7GvINijPBZ8kBMvcxpALwwq
 a7W5/71cd+aMWMxT4ljn+Ugudsw0hq9IgnT8Z/sQH89qDhZk3xAdW4weuXW5/ip/VEMZ
 7kYMJ+HHNqKZStk1MAM4+PREKBz42cDAGyVdVBAsYMhdh3hk/YqyklRlsxm3WKo3gW3r
 3+SA==
X-Gm-Message-State: AOJu0YyPOhr58zce0xAPcpM0e33/bR17brlEWbzviPt2102GzA7QdZEB
 WnMz7MKJyKYSWy8x/m1nJToobRXCdum2vg/DHjI=
X-Google-Smtp-Source: AGHT+IGOonc/JSV98RZo1jkrZU+LtEghGAi+lgwnXNXtVA+veY8zzZAARZEK11V76r88fj5lejZBDiDSXD6gp5btuLE=
X-Received: by 2002:a1f:1c4b:0:b0:49a:56d2:562d with SMTP id
 c72-20020a1f1c4b000000b0049a56d2562dmr16031720vkc.4.1698889053683; Wed, 01
 Nov 2023 18:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <20231030132058.763556-1-sunilvl@ventanamicro.com>
In-Reply-To: <20231030132058.763556-1-sunilvl@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Nov 2023 11:37:07 +1000
Message-ID: <CAKmqyKPdOmQZ_txUEdQbX0z5hbRy993Fep-MQPZMuXHZTzpU3w@mail.gmail.com>
Subject: Re: [PATCH v5 00/13] RISC-V: ACPI: Enable AIA, PLIC and update RHCT
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::a36;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa36.google.com
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

On Mon, Oct 30, 2023 at 11:23=E2=80=AFPM Sunil V L <sunilvl@ventanamicro.co=
m> wrote:
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
> These changes are also available in  riscv_acpi_b2_v5 branch at:
> https://github.com/vlsunil/qemu/
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
>  hw/virtio/virtio-acpi.c         |  32 ++++
>  include/hw/nvram/fw_cfg_acpi.h  |  15 ++
>  include/hw/pci-host/gpex.h      |  28 ++-
>  include/hw/riscv/virt.h         |  26 +++
>  include/hw/virtio/virtio-acpi.h |  16 ++
>  15 files changed, 498 insertions(+), 131 deletions(-)
>  create mode 100644 hw/nvram/fw_cfg-acpi.c
>  create mode 100644 hw/virtio/virtio-acpi.c
>  create mode 100644 include/hw/nvram/fw_cfg_acpi.h
>  create mode 100644 include/hw/virtio/virtio-acpi.h
>
> --
> 2.39.2
>
>

