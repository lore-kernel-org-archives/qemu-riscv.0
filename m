Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29049D206B6
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 20:42:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t1ApU-0004Ff-Kh; Wed, 16 Oct 2024 16:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1t1ApO-0004EU-IZ
 for qemu-riscv@nongnu.org; Wed, 16 Oct 2024 16:41:06 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1t1ApJ-0004dU-1g
 for qemu-riscv@nongnu.org; Wed, 16 Oct 2024 16:41:04 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-7ea0ff74b15so161037a12.3
 for <qemu-riscv@nongnu.org>; Wed, 16 Oct 2024 13:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1729111259; x=1729716059; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N2FlkjWOEsjJoMDEMxy5fL2jBzz/PnyJOUhMSZO37LI=;
 b=aocKtk9PRepdg4zl7whSE0apnlsKe5MEzAMqMa0pxty/57//VIRayOGL97WZ0Pl3sc
 xWLKTQTAhFw1x8zZtXQvdgWnkx1zlRDHVL+b3ejhi9hKPMGGQqOnlYFDOWpxuDO/MZwF
 Lea+8a95CRs7NMi657QE8BW3rWjqlEoGdy4nNTYw333Ui78A5qsk4Gffk75ZzwAoZQab
 NiwL13y7jfe4FoR4eJ1l0fO1e+NXgjTEjYQ+wxqpVBIAG5GRxiSUINdVp1dXdMnksanF
 jjwo/getswZGjZZgmUBtfYl7mUKGe1B698/Zm3s3/a5JnOOE6TMpIdcnOMy7lWexH5g8
 hiWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729111259; x=1729716059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N2FlkjWOEsjJoMDEMxy5fL2jBzz/PnyJOUhMSZO37LI=;
 b=B4Dj/ITmeeQiv/yx5g7tv/pHLHkgRnYbfwtx//XdI9JY5azl4BAhEVuTvhkpGETxvf
 Pb+2ANNHruehRexgN6ulzaOIkdo652IO2zbDpVGU82BbFaSShWDZZGC6nK1mZF/9xCrD
 xgYv2maZC6VkmKtIs1htrtzj307E8cOvx6SZGxdqTj0SVHohfrnH4czmbDi6pcaZWyCQ
 ZphmWF82z8dYo1uPsyQcrmpD6biR+ihVnEorPdbcdX/bHq4Sl3QBilLW0OE1Rko3Nkds
 Kz45caI4EXn2LVZhEgOm8EV/D3YswhhNhUrjC7fcgFTMCXO7XTc6dX7gASXGkjGShZwc
 WwoA==
X-Gm-Message-State: AOJu0Yzb64a06zVQkYhuZILeujVelHOdavQO67RY5BIoXrcor5qze62s
 wTBmrmS62nYs5kQbS0mkvAUJ2kmhpEGVXpl8uLAAnId67GfZk4LAIDx4ysWnxa8=
X-Google-Smtp-Source: AGHT+IGZ0BQimgk06TrnLytY0+hm2lsdcOKH8MDN3eLA/2Tg+s2xXX8391D/j7nCtVvuU5yC684mVQ==
X-Received: by 2002:a17:90a:eb05:b0:2e0:d957:1b9d with SMTP id
 98e67ed59e1d1-2e3ab7fed6fmr6185783a91.13.1729111259244; 
 Wed, 16 Oct 2024 13:40:59 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.188.133.9])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e3e09085cfsm242158a91.54.2024.10.16.13.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 13:40:58 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v10 04/12] pci-ids.rst: add Red Hat pci-id for RISC-V IOMMU
 device
Date: Wed, 16 Oct 2024 17:40:28 -0300
Message-ID: <20241016204038.649340-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241016204038.649340-1-dbarboza@ventanamicro.com>
References: <20241016204038.649340-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x52a.google.com
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


