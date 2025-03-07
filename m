Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4E7C28B28
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Mar 2025 20:41:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tqeV6-0004dB-4N; Fri, 07 Mar 2025 15:40:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tqeUh-0004Qz-MZ
 for qemu-riscv@nongnu.org; Fri, 07 Mar 2025 15:40:31 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tqeUd-0001w0-7g
 for qemu-riscv@nongnu.org; Fri, 07 Mar 2025 15:40:31 -0500
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-223fd89d036so48534835ad.1
 for <qemu-riscv@nongnu.org>; Fri, 07 Mar 2025 12:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1741380025; x=1741984825; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iEe0rHIOQ6h9LxkKOZ8XIB5DeqYtbj0ptb/VSdm22+8=;
 b=kxG4EkqHzhmHO7OPZul21m9dQpQDu1e6uEJQdr0o53cjRZAT3H+sMrLyxHsonLzfJF
 8c0jxadHgpstBFnquSfBkiAMNUZ1qbc+maEu4XFzdKHjVHxHE6IB68AEyMf1SiwGQAwE
 oKzbjl2XwH3fP+7a7QpjVGPjGXJ5iWOk3kj/gZsQWhBYZz29hpDwc0HJxNfdLuk+4cgF
 R6mkLQySUbxzEzW1Baqueyck8oOFa2QsgKGl9FYGHYvZiqdTMLW/0WokDR9Hnx+Dt8ZV
 XDRej60c765/MR4VCejCRcbzO9Id4Jlkfsua3yiEP80z3FL1D+Ej3Ij4UTo1NL2Pr0VF
 L5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741380025; x=1741984825;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iEe0rHIOQ6h9LxkKOZ8XIB5DeqYtbj0ptb/VSdm22+8=;
 b=WhJDUoHndqN4A9lpThMCN77WHSWep2bKVdl6v1bkoWdIsgtkVjautJ5TYdD8eLdXHr
 ZbnhLXx9a8IDIV5zFMcVGhX6p5XN0D9IddO58Rk+n8L9xjslHKvol1GhI/IPuz/0weYn
 0KStiBpv4DkpmlXhqISI1YI3FsnLyBTWYSIcbLVmM8zxRvYCGaCFbnRnfyu+1Y6dajAX
 ZEsXxSjx7CSYY0P/N6g+fLENi2YM3Ih6PZ/dwEpHJv+0ieiwEB99CcbMQYuTIptcbNrl
 E9I65SSAhYZlOU065hshNBXPhY3mXv/nE4MqvGygbm8CjapWhcen+WBUktWlE1bDtCwi
 ss6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKEYkyyqfgJI4kSirrw27Fk/MeunAd0+hMCbxDIvtUTCkmX8C+7eOx355tW5EjTeZUnLsqlbefsm1+@nongnu.org
X-Gm-Message-State: AOJu0Yx479kOvxg0A/iLAN3w7Q1c6U9MernVvsy/2WtST0NqLBwN80L+
 XKLXyBCJ456/nC0JEWHhzGFRFgLltRZ5KpSfiE5KSG7KkSLMfHaZSD6D+Zok0EA=
X-Gm-Gg: ASbGncttZYsqlkj4YFyBkWhtx14F/1D/b+4PWnF2Yl87Xx4pfb6iWBb1v8HYfCb1N6b
 eYlEy7llGxQOVKPodZCGDahn8LleWKt9ohaU0Wl9i7PbLLEhEqBefQdfRymksUh64d6v+zaW2s/
 pyRetyR6KNn9N3Ih/Dmw4YWvAdpQFRj2UzhiFtiuIsgE8tV63Oz10Jyvsxr6SMHzh2NeeUCmZyR
 wzaxCnAfcci/vHYaoZwV2smmTuLj3h5dJ0NEGOGevCAYVMB9M7sep2ZAHsQOrMrIc9Sjpi6J7ia
 bOCUvxxOupQpKdSk/0Yl0dpL/9BEefsajOqjk58OW9fXwKOLT0g6BvPu1NIEwxZcM6mV4xAE
X-Google-Smtp-Source: AGHT+IG65DhcZ6NOEcgAJVNYS1w8Ue3XFFy1z6qQdUW9LusIsKYog4R+2hqXfrBlL8f1odQoXupXyg==
X-Received: by 2002:a17:902:e5d2:b0:224:160d:3f5b with SMTP id
 d9443c01a7336-22428c1169cmr79400585ad.49.1741380025111; 
 Fri, 07 Mar 2025 12:40:25 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff5aa3d3ccsm3270900a91.0.2025.03.07.12.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 12:40:24 -0800 (PST)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-arm@nongnu.org (open list:MCIMX7D SABRE / i...),
 Jason Chien <jason.chien@sifive.com>
Subject: [PATCH 2/4] hw/pci: Introduce an API to set PCI host downstream mr
 for IOMMU integration
Date: Sat,  8 Mar 2025 04:39:35 +0800
Message-ID: <20250307203952.13871-3-jason.chien@sifive.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20250307203952.13871-1-jason.chien@sifive.com>
References: <20250307203952.13871-1-jason.chien@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=jason.chien@sifive.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

When an IOMMU detects that a PCI host has registered struct PCIIOMMUOps,
it should call pci_setup_iommu_downstream_mr(), which invokes
PCIIOMMUOps.set_downstream_mr() to configure the PCI host's downstream
memory region, directing inbound transactions to the IOMMU.

Signed-off-by: Jason Chien <jason.chien@sifive.com>
---
 hw/pci/pci.c         | 8 ++++++++
 include/hw/pci/pci.h | 9 +++++++++
 2 files changed, 17 insertions(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 1d42847ef0..983290ef0b 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2858,6 +2858,14 @@ void pci_device_unset_iommu_device(PCIDevice *dev)
     }
 }
 
+void pci_setup_iommu_downstream_mr(PCIBus *bus, MemoryRegion *mr)
+{
+    assert(bus->iommu_ops);
+    assert(bus->iommu_ops->set_downstream_mr);
+
+    bus->iommu_ops->set_downstream_mr(bus->iommu_opaque, mr);
+}
+
 void pci_setup_iommu(PCIBus *bus, const PCIIOMMUOps *ops, void *opaque)
 {
     /*
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index fcf648da19..1ad5dc7d9d 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -442,6 +442,15 @@ bool pci_device_set_iommu_device(PCIDevice *dev, HostIOMMUDevice *hiod,
                                  Error **errp);
 void pci_device_unset_iommu_device(PCIDevice *dev);
 
+/**
+ * pci_setup_iommu_downstream_mr: Designate a downstream memory region
+ * for a PCIBus
+ *
+ * @bus: the #PCIBus being updated.
+ * @mr: the designated memory region.
+ */
+void pci_setup_iommu_downstream_mr(PCIBus *bus, MemoryRegion *mr);
+
 /**
  * pci_setup_iommu: Initialize specific IOMMU handlers for a PCIBus
  *
-- 
2.43.2


