Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0976C46CD3
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 15:03:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rFF97-0000y6-MD; Mon, 18 Dec 2023 10:03:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rFF94-0000sf-4G
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 10:03:02 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rFF91-00077m-Pn
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 10:03:01 -0500
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6d0a679fca7so1424640b3a.2
 for <qemu-riscv@nongnu.org>; Mon, 18 Dec 2023 07:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702911777; x=1703516577; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IS1D2FDYimeVTg+BnkZ8lK6JJAp7oUKJVZsCLLH9PCk=;
 b=cdq8bWb0IJe77a6gsQtq9EMy+lfEsS4eAGxFXPpTPp2i39Jq10tY/NxuIji1Qn6dC5
 hLpt3jQVaOYc2nvcjxT8ccQosJE5ErT/9QDaV798O+zAK8hgUVWXmdwhXnxUJU20LFMB
 06fAWAEKOXxPjLOEJz7jxe9aLbldi5CCUGJU3xqgcD+7FRn7eKwnvAjPc2RDllpKbB6J
 JcdL/BP4w9KwvPBx0MJPEb/UAOBtHzGS8i39meqDJPGbEgba3m4wxmxBXz6KyH/qx98N
 btyr4r6L5QM34VWhbWW5xkFlmdzv4HY+FbcU2PphlgSUcKymKf6QD8ZViukHOuEXEBPU
 lX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702911777; x=1703516577;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IS1D2FDYimeVTg+BnkZ8lK6JJAp7oUKJVZsCLLH9PCk=;
 b=CeVHOTgSWL9nleHGVEaGvWLoZgXvr2YwuD6k2dP71+NP0lZHan76KVh4apvRQSqgmb
 tSTZiItvBKWRHhOlQjx5epleWdYyNBIIQoJNRlcNfLERNDKPnJDxfRc/Osoyw04325C3
 e0KVyjtK1PpjE9+VefcogVVpABbwJMsnKHajM+uGbI5xq3b3VGifXQ7TInEHhoo0qNgU
 UkKilUil/9tDKCURh1PoHAJBCtvT+ciAwWQM2vw3S4vsfbL9wgtKYXgvnUOtzdjjoiWV
 FFmCv1vMgsq4zyjKTbjIuWCpf3Ov6plB3e61WEwHwNW08hu7h0Y/bNSmw+4kPBx+ukES
 /UoA==
X-Gm-Message-State: AOJu0YzICPm5PXdfEJ6h4z4KMmtfJQ04ArPneEKB+kVRDbzff0Myv7AY
 GTlzYoRiujOVZEAIDCyiAaPO3A==
X-Google-Smtp-Source: AGHT+IH7EInAr+EcXwzy9g8j/vhBhXW4lKSsnKIOT7/ZhqJS1WW0EXZw2Ahg7svKe2qYc4xBRyWYBw==
X-Received: by 2002:a05:6a00:4643:b0:6cb:ccea:e2ed with SMTP id
 kp3-20020a056a00464300b006cbcceae2edmr8259442pfb.13.1702911776952; 
 Mon, 18 Dec 2023 07:02:56 -0800 (PST)
Received: from sunil-pc.Dlink ([106.51.188.200])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a056a000a0100b006c06779e593sm18975505pfh.16.2023.12.18.07.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 07:02:56 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v8 00/13] RISC-V: ACPI: Enable AIA, PLIC and update RHCT
Date: Mon, 18 Dec 2023 20:32:34 +0530
Message-Id: <20231218150247.466427-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

This series primarily enables external interrupt controllers (AIA and PLIC)
in ACPI tables for RISC-V virt platform. It also updates RHCT with CMO and
MMU related information.

Below ECRs for these changes are approved by ASWG and will be
available in next ACPI spec release.

1) MADT (AIA) - https://drive.google.com/file/d/1oMGPyOD58JaPgMl1pKasT-VKsIKia7zR/view?usp=sharing
2) RHCT - https://drive.google.com/file/d/1sKbOa8m1UZw1JkquZYe3F1zQBN1xXsaf/view?usp=sharing

First two patches in this series are to migrate a couple of functions from
ARM architecture to common code so that RISC-V doesn't need to duplicate
the same.

The patch set is based on Alistair's riscv-to-apply.next branch.

These changes are also available in  riscv_acpi_b2_v8 branch at:
https://github.com/vlsunil/qemu/

Changes since v7:
	1) Prefixed gpex property names with "x-" as per feedback from Michael Tsirkin.
	2) Rebased to latest riscv-to-apply.next.

Changes since v6:
	1) Fixed the qtest failure issue reported by Daniel in PATCH 2.

Changes since v5:
	1) Fixed the issue in PATCH 2 reported by Daniel found when built with
	   clang + --enable-debug.

Changes since v4:
	1) Updated copyright for new files as per SPDX format suggested by Drew.
	2) Updated RINTC patch to avoid code duplication as suggested by Drew.
	3) Moved mmu offset below cmo in MMU patch as suggested by Drew.
	4) Updated tags.

Changes since v3:
	1) Addressed comments from Daniel and Drew.
	2) Added a new patch in microvm to use common function for virtio in DSDT.
	3) Rebased to latest riscv-to-apply.next branch and added tags.

Changes since v2:
        1) Rebased to latest riscv-to-apply.next branch which needed
           changing ext_icboz to ext_zicboz in CMO patch.
        2) Fixed node type in MMU node.
        3) Added latest tags.

Changes since v1:
        1) As per Igor's suggestion, migrated fw_cfg and virtio creation
           functions to device specific file instead of generic aml-build.c.
           Since ACPI is optional, new files are created and enabled for
           build only when CONFIG_ACPI is enabled.
        2) As per Igor's suggestion, properties are added to the GPEX PCI
           host to indicate MMIO ranges. The platform fw can initialize
           these to appropriate values and the DSDT generator can fetch
           the information from the host bus itself. This makes the code
           generic instead of machine specific.
        3) Added PLIC patch from Haibo.
        4) Rebased to latest riscv-to-apply.next and added RB tags as
           appropriate.

Sunil V L (13):
  hw/arm/virt-acpi-build.c: Migrate fw_cfg creation to common location
  hw/arm/virt-acpi-build.c: Migrate virtio creation to common location
  hw/i386/acpi-microvm.c: Use common function to add virtio in DSDT
  hw/riscv: virt: Make few IMSIC macros and functions public
  hw/riscv/virt-acpi-build.c: Add AIA support in RINTC
  hw/riscv/virt-acpi-build.c: Add IMSIC in the MADT
  hw/riscv/virt-acpi-build.c: Add APLIC in the MADT
  hw/riscv/virt-acpi-build.c: Add CMO information in RHCT
  hw/riscv/virt-acpi-build.c: Add MMU node in RHCT
  hw/pci-host/gpex: Define properties for MMIO ranges
  hw/riscv/virt: Update GPEX MMIO related properties
  hw/riscv/virt-acpi-build.c: Add IO controllers and devices
  hw/riscv/virt-acpi-build.c: Add PLIC in MADT

 hw/arm/virt-acpi-build.c        |  51 +----
 hw/i386/acpi-microvm.c          |  15 +-
 hw/nvram/fw_cfg-acpi.c          |  23 +++
 hw/nvram/meson.build            |   1 +
 hw/pci-host/gpex-acpi.c         |  13 ++
 hw/pci-host/gpex.c              |  12 ++
 hw/riscv/Kconfig                |   1 +
 hw/riscv/virt-acpi-build.c      | 323 +++++++++++++++++++++++++++++---
 hw/riscv/virt.c                 |  72 ++++---
 hw/virtio/meson.build           |   1 +
 hw/virtio/virtio-acpi.c         |  33 ++++
 include/hw/nvram/fw_cfg_acpi.h  |  15 ++
 include/hw/pci-host/gpex.h      |  28 ++-
 include/hw/riscv/virt.h         |  26 +++
 include/hw/virtio/virtio-acpi.h |  16 ++
 15 files changed, 499 insertions(+), 131 deletions(-)
 create mode 100644 hw/nvram/fw_cfg-acpi.c
 create mode 100644 hw/virtio/virtio-acpi.c
 create mode 100644 include/hw/nvram/fw_cfg_acpi.h
 create mode 100644 include/hw/virtio/virtio-acpi.h

-- 
2.39.2


