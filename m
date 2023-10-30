Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47889C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 14:14:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxT1o-0001RI-Jf; Mon, 30 Oct 2023 10:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qxT1n-0001PZ-4D
 for qemu-riscv@nongnu.org; Mon, 30 Oct 2023 10:14:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qxT1k-0004vZ-45
 for qemu-riscv@nongnu.org; Mon, 30 Oct 2023 10:14:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698675238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WpgIXu9F0YZoR6UhZGb6IiyYms/3VLhSFs02Fgz0SuM=;
 b=J0r2iS8FQeOg11qYzVkttmERAkxXjURwi6sJZsBfcg8Zn9+0s1I+zUwiTX1D3rJO1J2XW9
 uNsiJ+xITRvqDMLcIYmSe5AFkPEDKhTXZQMUC3bElLEL6Ivfixu86Jn2ESYUD0Z3h43uVZ
 f4tFqptRqsreHu0ebOeR2wZoztWxZ1Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154-nUGIEkiBPs-N5x6pPHc1zQ-1; Mon, 30 Oct 2023 10:13:57 -0400
X-MC-Unique: nUGIEkiBPs-N5x6pPHc1zQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-32dc767e619so2384197f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 30 Oct 2023 07:13:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698675233; x=1699280033;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WpgIXu9F0YZoR6UhZGb6IiyYms/3VLhSFs02Fgz0SuM=;
 b=VTqrYV2S72dOhalKj/PciiEPEzFDwXXgPU/5yzdN6vKr58BZAjMIil+f8S1Fee7Ye5
 terwwmmdfaRm1yu089Qy/AApVD13TOFzIAn8xsev5H0HjJr1hNjFETdWUncR/1DMfeBn
 skZ5M1T0fIu7u/WXmfgIfceCK9rZpWXxGWpyKm5z2yRgLU8S+K6t9Q1L/g0a7w58Fquw
 WstGPMEIrTLBi5MuRnb3wTWorirzSu+KKraFPPa3Wix+Mkiu0mbM9y/7EmSbTtNShJjA
 xF0xtCJOlpgXsvqOFerwyS9GMnmW/GsoUnDm085vHitQc1zW/jHK9Ii7BMA2JZ4XAdy4
 wNTg==
X-Gm-Message-State: AOJu0Ywan/SoJxrmVvrkxcIuacW8Lcnn6meGAGVZBY5gIWedZEYuWq16
 CIUIrlS1+mXW4CrHgocrWkdx9C5Vqn9G3S7kIAl6icO4N6vlg/vHHdsU5VOlX35Z6UIhYTJMqKx
 OftVaMgZHwXj83u4=
X-Received: by 2002:a5d:48c8:0:b0:32d:aa62:a8c3 with SMTP id
 p8-20020a5d48c8000000b0032daa62a8c3mr6295964wrs.41.1698675233054; 
 Mon, 30 Oct 2023 07:13:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrmlmnk9n4jFmd72NEXmi8JjvmLS6o8UCcXjicoAdXzsfSmcUZhesSUyhmf0sVJL7XQIPrgQ==
X-Received: by 2002:a5d:48c8:0:b0:32d:aa62:a8c3 with SMTP id
 p8-20020a5d48c8000000b0032daa62a8c3mr6295942wrs.41.1698675232490; 
 Mon, 30 Oct 2023 07:13:52 -0700 (PDT)
Received: from redhat.com ([31.187.78.246]) by smtp.gmail.com with ESMTPSA id
 q12-20020adffecc000000b0032dc1fc84f2sm8443927wrs.46.2023.10.30.07.13.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 07:13:51 -0700 (PDT)
Date: Mon, 30 Oct 2023 10:13:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>
Subject: Re: [PATCH v5 00/13] RISC-V: ACPI: Enable AIA, PLIC and update RHCT
Message-ID: <20231030101332-mutt-send-email-mst@kernel.org>
References: <20231030132058.763556-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20231030132058.763556-1-sunilvl@ventanamicro.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.483,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Oct 30, 2023 at 06:50:45PM +0530, Sunil V L wrote:
> This series primarily enables external interrupt controllers (AIA and PLIC)
> in ACPI tables for RISC-V virt platform. It also updates RHCT with CMO and
> MMU related information.
> 
> Below ECRs for these changes are approved by ASWG and will be
> available in next ACPI spec release.


pci, acpi things look ok

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> 1) MADT (AIA) - https://drive.google.com/file/d/1oMGPyOD58JaPgMl1pKasT-VKsIKia7zR/view?usp=sharing
> 2) RHCT - https://drive.google.com/file/d/1sKbOa8m1UZw1JkquZYe3F1zQBN1xXsaf/view?usp=sharing
> 
> First two patches in this series are to migrate a couple of functions from
> ARM architecture to common code so that RISC-V doesn't need to duplicate
> the same.
> 
> The patch set is based on Alistair's riscv-to-apply.next branch.
> 
> These changes are also available in  riscv_acpi_b2_v5 branch at:
> https://github.com/vlsunil/qemu/
> 
> Changes since v4:
> 	1) Updated copyright for new files as per SPDX format suggested by Drew.
> 	2) Updated RINTC patch to avoid code duplication as suggested by Drew.
> 	3) Moved mmu offset below cmo in MMU patch as suggested by Drew.
> 	4) Updated tags.
> 
> Changes since v3:
> 	1) Addressed comments from Daniel and Drew.
> 	2) Added a new patch in microvm to use common function for virtio in DSDT.
> 	3) Rebased to latest riscv-to-apply.next branch and added tags.
> 
> Changes since v2:
>         1) Rebased to latest riscv-to-apply.next branch which needed
>            changing ext_icboz to ext_zicboz in CMO patch.
>         2) Fixed node type in MMU node.
>         3) Added latest tags.
> 
> Changes since v1:
>         1) As per Igor's suggestion, migrated fw_cfg and virtio creation
>            functions to device specific file instead of generic aml-build.c.
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


