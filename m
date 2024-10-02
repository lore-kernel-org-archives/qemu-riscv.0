Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6269BCF3189
	for <qemu-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 01:04:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1svnmJ-0006tX-4U; Tue, 01 Oct 2024 21:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1svnmG-0006s5-O3
 for qemu-riscv@nongnu.org; Tue, 01 Oct 2024 21:03:41 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1svnmD-0002gs-UZ
 for qemu-riscv@nongnu.org; Tue, 01 Oct 2024 21:03:40 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-20b95359440so22688105ad.0
 for <qemu-riscv@nongnu.org>; Tue, 01 Oct 2024 18:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1727831016; x=1728435816; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N2FlkjWOEsjJoMDEMxy5fL2jBzz/PnyJOUhMSZO37LI=;
 b=Xi9Ou4s9XhgkkB+TcfKZx77uLDbVLjjO0phxUd0QW/g4lT7ESL2AGCC4/AXQd0thCF
 EsekRqUBQ/aslvqgaDNQdOob3iyaCVvcOUoXqX6kIJNip4M7AO0O3eBeigtjGyXTgRMQ
 5bR/64V7WepdrNCrOf8+m17n4S8QlEQU+N8uHT9NmO9XUx4YgkPx7iAKSD6Iqq2zJgih
 CHvfHLGVaMUtMpxgECS/sBvhHXrZwKaUlhnh7BmFeWfACWhYf9eXokl6HuGHGXWkal1z
 Ryy4KUXR6t04GIwLb4qG7Mkqwk13v/vIjsiQDu9laISuflRP0ajwlo5HIoCPlon9RGon
 SjIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727831016; x=1728435816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N2FlkjWOEsjJoMDEMxy5fL2jBzz/PnyJOUhMSZO37LI=;
 b=nyYOOSJpzj9JWKclksNMUiDMbPJJbKF+XxKmTg+QSJwIf5oBb6XJlA9B1TLhJg4VGU
 HUvEWc0z6si4XqevOxEW2sbO/QVYFIL++2We2xxTQq+Nlc6k/HJ7dxzWnbfn0Lf890D4
 3eOrDO+OMicrUdFOAgpO3lP7ifTdiXETpT9+xWlSKN/DJj3Ed3AJYioUAin2dJMKEfjh
 LdhigUw0OQOAwmJgxpTpAVhMu3wrpoC847P6KLum9RjTmx7NttfP5vNhtZLx/E4207ql
 0YqkP8o8c3jhXCsuaE7EtMLjx6WnPlGWbrq6Rc776Hw9IVBle60JGYPQ1LtJ6o5QcE9P
 gBjw==
X-Gm-Message-State: AOJu0Yy2X3D0hv6RCkpuIqHTMYJDKGKT107PkNkx+WtU2ZzB4MfrF6jx
 xartZ7jO0gvaTT1rUIFF/l6rVpfVcB0Ks+628M15hF6C2gbwzG6BtXJAOafNp/g=
X-Google-Smtp-Source: AGHT+IEfkP3lNvpGk9HH11hmO3khitNzUacDkJASLc8x2JVwss+RLqmr5arMjue8Sk/gbqspofQtNA==
X-Received: by 2002:a17:903:234d:b0:20b:7221:ea3d with SMTP id
 d9443c01a7336-20bc5a41cecmr17832705ad.30.1727831016140; 
 Tue, 01 Oct 2024 18:03:36 -0700 (PDT)
Received: from grind.. (200-206-229-93.dsl.telesp.net.br. [200.206.229.93])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20b37d63971sm76061295ad.4.2024.10.01.18.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2024 18:03:35 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 peter.maydell@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v8 04/12] pci-ids.rst: add Red Hat pci-id for RISC-V IOMMU
 device
Date: Tue,  1 Oct 2024 22:02:59 -0300
Message-ID: <20241002010314.1928515-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241002010314.1928515-1-dbarboza@ventanamicro.com>
References: <20241002010314.1928515-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62f.google.com
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


