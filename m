Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11474C25B7A
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 May 2024 17:44:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sACRa-000183-3X; Thu, 23 May 2024 13:41:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sACR8-0000qZ-QZ
 for qemu-riscv@nongnu.org; Thu, 23 May 2024 13:41:08 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sACQz-0001h1-Cq
 for qemu-riscv@nongnu.org; Thu, 23 May 2024 13:41:02 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1ee7963db64so56748665ad.1
 for <qemu-riscv@nongnu.org>; Thu, 23 May 2024 10:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1716486053; x=1717090853; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iLl55/bJh1yHD1iBGVA6rwfYMm2Sf8L3ZBHFooBrgVE=;
 b=WEDsECHkiucykNomLReN8yBY19zAh4yiB19HmwwX59VC9joJdMdUsQ/ylSRbL2OSt+
 hio3Br+Z89/+CbJjasCxzs9GGCgrmjq5vU0Ik4FEuVJ+mc481wdQ6VnDswPLZZ2ezJF8
 zDhNHGLudJimGEo23pdQjuOA2umOJLHKPPgCriCaaZohw2ZiNWy3kUXu+9kOkXI28SeV
 +WCAZwCAh6IUlV9Onxh8HkrMTUbDaeBmI7VnZXcPYiuZUheVwFNHFtZaksIx5Tk/Pl+G
 avzzWoplMz2WaRyUsvYCHniur7dcq8Ms9Xd5kun1LmkwcnU+sIJXMufCYOZ7z9cU2Ozl
 JHVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716486053; x=1717090853;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iLl55/bJh1yHD1iBGVA6rwfYMm2Sf8L3ZBHFooBrgVE=;
 b=nD98M3eMmZqFFM3OwY0nLgWHQmHO9dh3gSEVAOB9VhNQNRgJk08+7y9OxjXQis5rOM
 sqdnIpo2LF+UPfK52yfhjWKJ1shflWolVoMx2+UqWVw2sfUdMB6a2yj8mjGgfvJQajsS
 fb6ra8JrujzjWn6wR3FSqcsZpLPobdk3UDeImLjUTyqYm7EFkZ/Ky8VGpOE0u035AWad
 aSFJP1GDZL0TOhsMrC/8Ujzva7bhBTEVvNSjG6eA5nvFUJ5MZdcDnc90oa3OSnTGe83c
 XCUlDcW1096fM9TWwf8oXVsQYOBgHBNZwBB19DWfRdGFRMEsLM6InJL1hGIjX6taZdmc
 0dcQ==
X-Gm-Message-State: AOJu0YxY9ysa4p9B/zI59j9kujO/oKUMlZW6zTDOFuaFEAIsbLHT1iFF
 rAfxdPlfzHWpHA4AF+D35vwTEPRHpQcGi5D47k0a1NWizMFF0uu7m4KYwWcNyds=
X-Google-Smtp-Source: AGHT+IH8oL/TNaU8XvODq0ci9dxVVS5FtUPn5Hy/5j7wkgMG/q4wmUUSiKnIGkEkmkrJkpEv5HXY/g==
X-Received: by 2002:a17:902:e54e:b0:1f0:9964:c35f with SMTP id
 d9443c01a7336-1f4486f1951mr489765ad.26.1716486053012; 
 Thu, 23 May 2024 10:40:53 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.94.42.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f2fb4ca0ebsm81246535ad.119.2024.05.23.10.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 10:40:52 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 tjeznach@rivosinc.com, ajones@ventanamicro.com, frank.chang@sifive.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 12/13] hw/riscv/riscv-iommu: Add another irq for mrif
 notifications
Date: Thu, 23 May 2024 14:39:53 -0300
Message-ID: <20240523173955.1940072-13-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240523173955.1940072-1-dbarboza@ventanamicro.com>
References: <20240523173955.1940072-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x636.google.com
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

From: Andrew Jones <ajones@ventanamicro.com>

And add mrif notification trace.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 hw/riscv/riscv-iommu-pci.c | 2 +-
 hw/riscv/riscv-iommu.c     | 1 +
 hw/riscv/trace-events      | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/riscv-iommu-pci.c b/hw/riscv/riscv-iommu-pci.c
index 7635cc64ff..ad3df8ffe6 100644
--- a/hw/riscv/riscv-iommu-pci.c
+++ b/hw/riscv/riscv-iommu-pci.c
@@ -80,7 +80,7 @@ static void riscv_iommu_pci_realize(PCIDevice *dev, Error **errp)
     pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY |
                      PCI_BASE_ADDRESS_MEM_TYPE_64, &s->bar0);
 
-    int ret = msix_init(dev, RISCV_IOMMU_INTR_COUNT,
+    int ret = msix_init(dev, RISCV_IOMMU_INTR_COUNT + 1,
                         &s->bar0, 0, RISCV_IOMMU_REG_MSI_CONFIG,
                         &s->bar0, 0, RISCV_IOMMU_REG_MSI_CONFIG + 256, 0, &err);
 
diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
index 52f0851895..a27f56419a 100644
--- a/hw/riscv/riscv-iommu.c
+++ b/hw/riscv/riscv-iommu.c
@@ -623,6 +623,7 @@ static MemTxResult riscv_iommu_msi_write(RISCVIOMMUState *s,
         cause = RISCV_IOMMU_FQ_CAUSE_MSI_WR_FAULT;
         goto err;
     }
+    trace_riscv_iommu_mrif_notification(s->parent_obj.id, n190, addr);
 
     return MEMTX_OK;
 
diff --git a/hw/riscv/trace-events b/hw/riscv/trace-events
index 4b486b6420..d69719a27a 100644
--- a/hw/riscv/trace-events
+++ b/hw/riscv/trace-events
@@ -6,6 +6,7 @@ riscv_iommu_flt(const char *id, unsigned b, unsigned d, unsigned f, uint64_t rea
 riscv_iommu_pri(const char *id, unsigned b, unsigned d, unsigned f, uint64_t iova) "%s: page request %04x:%02x.%u iova: 0x%"PRIx64
 riscv_iommu_dma(const char *id, unsigned b, unsigned d, unsigned f, unsigned pasid, const char *dir, uint64_t iova, uint64_t phys) "%s: translate %04x:%02x.%u #%u %s 0x%"PRIx64" -> 0x%"PRIx64
 riscv_iommu_msi(const char *id, unsigned b, unsigned d, unsigned f, uint64_t iova, uint64_t phys) "%s: translate %04x:%02x.%u MSI 0x%"PRIx64" -> 0x%"PRIx64
+riscv_iommu_mrif_notification(const char *id, uint32_t nid, uint64_t phys) "%s: sent MRIF notification 0x%x to 0x%"PRIx64
 riscv_iommu_cmd(const char *id, uint64_t l, uint64_t u) "%s: command 0x%"PRIx64" 0x%"PRIx64
 riscv_iommu_notifier_add(const char *id) "%s: dev-iotlb notifier added"
 riscv_iommu_notifier_del(const char *id) "%s: dev-iotlb notifier removed"
-- 
2.44.0


