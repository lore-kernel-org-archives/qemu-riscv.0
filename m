Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D07CD37AC
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 20:18:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1slZxV-0004lD-Ab; Tue, 03 Sep 2024 16:17:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1slZxT-0004eG-8x
 for qemu-riscv@nongnu.org; Tue, 03 Sep 2024 16:16:59 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1slZxQ-0004Q3-Qz
 for qemu-riscv@nongnu.org; Tue, 03 Sep 2024 16:16:59 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2053616fa36so36502395ad.0
 for <qemu-riscv@nongnu.org>; Tue, 03 Sep 2024 13:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1725394615; x=1725999415; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N2FlkjWOEsjJoMDEMxy5fL2jBzz/PnyJOUhMSZO37LI=;
 b=diGtyYaomm/E6kyF37uxHyN9E2De3LPZ/ePvJOlvB00zUWOVIO7ApG1cHECUpAF5Y7
 GnY7g2URtFaVAuio53qSkm4zK9LDXlDBj9SiE4gO0JjLVbdSBFtL5v4pYkrkhOZVZblh
 6JwQzahBOqdHoi5zSyyO9e9Amf8NkuO/zdLAySbp3+VknNtI4L1rIulviAD/0xzoCcn2
 ULVq3IaQlDn65fZPFlO9Qp0LhaV4m+TUdeKSeWmLEykuKtYeI16QgnnZfdQjavKhq/kI
 HOKUZ2hv2RtIXc4FEiO5ldYU4QmBr821eoyBVmWY4VHg5M666hHJNwlrQd8d+q6YkshU
 9LIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725394615; x=1725999415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N2FlkjWOEsjJoMDEMxy5fL2jBzz/PnyJOUhMSZO37LI=;
 b=L7xGopfa4n7ttAWyDwssmDtEO9sOkl+xHfMA1YZd5e3e7vOTZQCH+IAN4r31Gk7oSU
 0F0MWKlyFdpfyfSfFFCOYAmTxf8nWzThSkCB0yCALh9TfUfxJ2QjOERwNlCMTumAFQ42
 iIF87zoElq3klZY8vooea25YTEPRMG2+kS2jt5LVRX6GtxhDW3y99qmK1l9+pzD1E52N
 +0/R9Ja2r3x+/6lMMDPm97w4d4bTGO1+l9HEWuCs36vCLpC3fYpSLxJQzDZ5OVuFqG+o
 8YL45lhQmMcl3j5dWSRsC14xUxmAvrr1e/k212J/1hinW3D0adHoE/5I+S+AaW4E1g5m
 F3dA==
X-Gm-Message-State: AOJu0YzK7s0fwpGGinTTyVm9h4Gvnjntbs9FReQw31Fj6a9YJ2fHV9Ts
 3hv/WhNePyurP6DvAJF8WQ9BwTEJ0KJ+GVzDMaiEvNEkXP3qwA3ebaa5fYfyuAo=
X-Google-Smtp-Source: AGHT+IF5BQ+rFy8L2gqzgvCMv2uoQX26y+Q7Nza/UDZBcW9svrayp+LMQfQWozv/874CQ4fVcAzoRQ==
X-Received: by 2002:a17:902:d4c1:b0:206:9f91:3624 with SMTP id
 d9443c01a7336-2069f913904mr28965815ad.13.1725394615316; 
 Tue, 03 Sep 2024 13:16:55 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.170.227.130])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-206aea531b3sm2189745ad.216.2024.09.03.13.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 13:16:54 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, tjeznach@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v7 04/12] pci-ids.rst: add Red Hat pci-id for RISC-V IOMMU
 device
Date: Tue,  3 Sep 2024 17:16:23 -0300
Message-ID: <20240903201633.93182-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240903201633.93182-1-dbarboza@ventanamicro.com>
References: <20240903201633.93182-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x633.google.com
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

The RISC-V IOMMU PCI device we're going to add next is a reference
implementation of the riscv-iommu spec [1], which predicts that the
IOMMU can be implemented as a PCIe device.

However, RISC-V International (RVI), the entity that ratified the
riscv-iommu spec, didn't bother assigning a PCI ID for this IOMMU PCIe
implementation that the spec predicts. This puts us in an uncommon
situation because we want to add the reference IOMMU PCIe implementation
but we don't have a PCI ID for it.

Given that RVI doesn't provide a PCI ID for it we reached out to Red Hat
and Gerd Hoffman, and they were kind enough to give us a PCI ID for the
RISC-V IOMMU PCI reference device.

Thanks Red Hat and Gerd for this RISC-V IOMMU PCIe device ID.

[1] https://github.com/riscv-non-isa/riscv-iommu/releases/tag/v1.0.0

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
---
 docs/specs/pci-ids.rst | 2 ++
 include/hw/pci/pci.h   | 1 +
 2 files changed, 3 insertions(+)

diff --git a/docs/specs/pci-ids.rst b/docs/specs/pci-ids.rst
index 328ab31fe8..261b0f359f 100644
--- a/docs/specs/pci-ids.rst
+++ b/docs/specs/pci-ids.rst
@@ -98,6 +98,8 @@ PCI devices (other than virtio):
   PCI ACPI ERST device (``-device acpi-erst``)
 1b36:0013
   PCI UFS device (``-device ufs``)
+1b36:0014
+  PCI RISC-V IOMMU device
 
 All these devices are documented in :doc:`index`.
 
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index eb26cac810..35d4fe0bbf 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -116,6 +116,7 @@ extern bool pci_available;
 #define PCI_DEVICE_ID_REDHAT_PVPANIC     0x0011
 #define PCI_DEVICE_ID_REDHAT_ACPI_ERST   0x0012
 #define PCI_DEVICE_ID_REDHAT_UFS         0x0013
+#define PCI_DEVICE_ID_REDHAT_RISCV_IOMMU 0x0014
 #define PCI_DEVICE_ID_REDHAT_QXL         0x0100
 
 #define FMT_PCIBUS                      PRIx64
-- 
2.45.2


