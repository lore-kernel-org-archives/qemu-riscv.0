Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7EEC19F32
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Mar 2025 20:41:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tqeV7-0004gI-Dt; Fri, 07 Mar 2025 15:40:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tqeUn-0004Rd-D7
 for qemu-riscv@nongnu.org; Fri, 07 Mar 2025 15:40:42 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tqeUk-0001xU-Kh
 for qemu-riscv@nongnu.org; Fri, 07 Mar 2025 15:40:36 -0500
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-22401f4d35aso44558475ad.2
 for <qemu-riscv@nongnu.org>; Fri, 07 Mar 2025 12:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1741380033; x=1741984833; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zxx0WY85eWS+nBxEymR5IyPvpq7FG/RiNFvCALVpVjI=;
 b=E5gsurGMhY0d06ODdfufhBqGF5+UXLsXCe3G4vRT+1qemLV+EuZVGIrLdFQWGF0GIP
 q3U5S8cdUcQXz1P4XSofdbB2HYb7n01QGCoQtdw8CKY93cKYORSt/5msXscvMb6j4fQX
 hQvvq9TVp/8h1yiR96Q5Q4ChdL5IYvxbSCFlyExumHduVEtJJWdI4bIh0TCk8UlwXQsw
 y5VKQKaAKLk9Kvam0XCCLzfUbNmDgxJBMIHh35nK9mxy9ySScyDGaF7j9aHinipeGjKR
 PUGFs4s2h3ctBDGuUlm4vZooOzAwzu76AyBT5A1DwRvEFMn16/1COMLJcq9w8508RSmd
 M90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741380033; x=1741984833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zxx0WY85eWS+nBxEymR5IyPvpq7FG/RiNFvCALVpVjI=;
 b=TlhOXfFho//Qc4B6bYRSVY9E/Xj6mQH612APYfEecOz/3YG06HQuiUz+tCaybcByi2
 thAtGOoTfdSoT/B/Wi/5jRanXS77Go4amHuvDpt4cfbjKSIwzsoIYlvdEKXaRm0iOAc/
 58ZFXN24fDDFwwnTUaB0ztLALD1X/CcQWNU5K3YxM++HleJYmxhGUvo4SXAkdHmKNDTE
 yBZD62cbvjj13WBJkD35qmYW4JHZ5H6vlowGkIXgXejclAD0cj+l/36/BQ58egS/129M
 dVvB1L3ShBszbprwEiBm6Ir2GyBoCk1ll5Q95j/Jt9uulNLjgLwASxWULVKKe6sfWDDu
 7PuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEmveKMpjs7g6puPSRp2FMnerxd3Si53MFzpMqvfvuC0OTLuoBNu8cs5+QKla+tffu/GN8XE3HZ8Pv@nongnu.org
X-Gm-Message-State: AOJu0YxsVTCkB/kuVphNBvJDE4t1Qo97tU5lXPT4r1r7NY9BtALDRc4T
 RuKOIhLb6gwvm5sWkUJXlr981H95OlxkERaMjg15hOquSosKCE4ctppF7hkwNKk=
X-Gm-Gg: ASbGncvCDHMN50JkVDBRORX72NKqCqmxSTAofGPI3RO6AKs0wDZt7m3VtbP7WSZ7Bv6
 uMpTZbXDvAzVWhvirla8bf81QV0Ad3TGNGe9Dc2xipEMg32uY8clcNLhqK5FEQOooxqlWkvmCQx
 wBeaZGmEhUxvKn9tO9Q6MscPjl2t09elMstF5USHHAgPOv5Jhm92xr/xXmStdw6NEahSfJ6SZbV
 Z1jmXSPY7mzcKPFFbISaQQM8vltfDvF5UQXx+YX0leAA3HGDeiOpScmnSqELL5zrAuFo+6MTdgo
 59AbjPE8vjtavejjHxiQrF3vsP9RH0SnxanYuLqfir+p5QVkTaIb4mbea1CmOaWGqdkTTFFo
X-Google-Smtp-Source: AGHT+IFP2xDuJmgSrLNezd3U8sP613KFfJX3JBGDkCmeFeZwiKr8wlqkcz87Rn1Od9Rhxb81Df4JcA==
X-Received: by 2002:a17:90a:d44c:b0:2ee:d433:7c50 with SMTP id
 98e67ed59e1d1-2ff7cef6419mr6211011a91.23.1741380033200; 
 Fri, 07 Mar 2025 12:40:33 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff5aa3d3ccsm3270900a91.0.2025.03.07.12.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 12:40:32 -0800 (PST)
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
Subject: [PATCH 4/4] hw/riscv/riscv-iommu: Connect the IOMMU with PCI hosts
 that have ATUs
Date: Sat,  8 Mar 2025 04:39:37 +0800
Message-ID: <20250307203952.13871-5-jason.chien@sifive.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20250307203952.13871-1-jason.chien@sifive.com>
References: <20250307203952.13871-1-jason.chien@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=jason.chien@sifive.com; helo=mail-pl1-x62c.google.com
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

When the IOMMU detects that bus->iommu_ops has been registered, indicating
the presence of an ATU, it sets the bus's downstream memory region to ensure
transactions are directed to the IOMMU.

Signed-off-by: Jason Chien <jason.chien@sifive.com>
---
 hw/riscv/riscv-iommu.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
index d46beb2d64..9701fe3831 100644
--- a/hw/riscv/riscv-iommu.c
+++ b/hw/riscv/riscv-iommu.c
@@ -2628,11 +2628,16 @@ static const PCIIOMMUOps riscv_iommu_ops = {
 void riscv_iommu_pci_setup_iommu(RISCVIOMMUState *iommu, PCIBus *bus,
         Error **errp)
 {
-    if (bus->iommu_ops &&
-        bus->iommu_ops->get_address_space == riscv_iommu_find_as) {
-        /* Allow multiple IOMMUs on the same PCIe bus, link known devices */
-        RISCVIOMMUState *last = (RISCVIOMMUState *)bus->iommu_opaque;
-        QLIST_INSERT_AFTER(last, iommu, iommus);
+    if (bus->iommu_ops) {
+        if (bus->iommu_ops->get_address_space == riscv_iommu_find_as) {
+            /* Allow multiple IOMMUs on the same PCIe bus, link known devices */
+            RISCVIOMMUState *last = (RISCVIOMMUState *)bus->iommu_opaque;
+            QLIST_INSERT_AFTER(last, iommu, iommus);
+        } else {
+            /* The bus has an ATU. Set its downsteam memory region. */
+            AddressSpace *as = riscv_iommu_space(iommu, 0);
+            pci_setup_iommu_downstream_mr(bus, as->root);
+        }
     } else if (!bus->iommu_ops && !bus->iommu_opaque) {
         pci_setup_iommu(bus, &riscv_iommu_ops, iommu);
     } else {
-- 
2.43.2


