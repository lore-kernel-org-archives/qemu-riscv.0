Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC55FC3271E
	for <qemu-riscv@archiver.kernel.org>; Mon,  8 Jul 2024 11:50:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sQmqr-00021b-3r; Mon, 08 Jul 2024 07:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sQmqm-0001jc-KL
 for qemu-riscv@nongnu.org; Mon, 08 Jul 2024 07:48:09 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sQmqk-00010E-OE
 for qemu-riscv@nongnu.org; Mon, 08 Jul 2024 07:48:08 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-70b0ebd1ef9so1477370b3a.2
 for <qemu-riscv@nongnu.org>; Mon, 08 Jul 2024 04:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1720439284; x=1721044084; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zW963OfHAGZhsxxm7NT5xfRi2/UE5cMEXprCk/murZI=;
 b=iABe8DlI3J9sfLKmTaKgxxGmkUXfKFVI+4KNAzFaCa5sbUJjibVEKwh/7RmCwzdb1O
 TpSbPJvc5aB1UwW7hW++NmGqkZJjUtqAkr8z8lz5lF+qq9kuqVnkuqhU/SW3WvPP9vO/
 ajhri5PzhADTTTBc3rIfzX1zXzV22x6BmWBcx6AnuwKb7vmqFUQt3YJXrA9MhQ6CB1JJ
 srasSyMMi/3P7hltxWPs+qwexZjNE8pw5u7dpl8fnNmhiJjpMU8rRc1F5zEPSsosiAya
 I0BQMYeOgZ0cDeACj50utJRb1tgOTroSVx14YzYG9kzyDmGzwJAJjUv7uZL9SphNffKc
 9laA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720439284; x=1721044084;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zW963OfHAGZhsxxm7NT5xfRi2/UE5cMEXprCk/murZI=;
 b=V7WmSTZncplc+0YpLTHwUKP360OENbjULzfCAUrQlYYtxWiLRd/8AkMRR2xGk6aejw
 Oehah3HW9Hax4DgzkCPFpWwSH0ktllWiw2lQd/zuGaX66gWMLJJAP5rj1FQAQngRggQl
 w7BBC3Vq1JX+sddti10IzlERnX89l2Yk4TTKDrzayidzb4PFTqAAn9XxUgqXU7AWPpjk
 3O7cVRMQBV5mnOrg1bqYxsDkby8Mm/ZnNloiawgoL4erh2zpkabr+XP5HX8Ycm7L1tPC
 0bxP8K/m/AKU67OQ8sfe6ecLfyBv6jFNMb5hH4bPTWfAlm4fa4VDHMhOCNKC82gw2woF
 s3SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQYiIc3xxpnwdNT1mw+LtDX3+2YMTOuGKduEhuafBNqkuqoChKbHyrQ4VFr3Bp5DQVGQbDstFmFSZAQcbN6qEsdWoX2Cg=
X-Gm-Message-State: AOJu0YzznSGjGFeAGdFD2M5bedhoGi/RvyJjoGsp+VNKErCJLRo2NSL6
 hUoWOHCM/dOgnv9pFfBi2pqUX+M75ea4tCg2HpMDh3BQgaOmP3uRv/x5kdHykR0=
X-Google-Smtp-Source: AGHT+IEst4kCThUOBw1TxDQvABP9F5OpN76W2cKyU/ujOB/oQN8xicqXvE9FiPC/Xk48Gk+r0O4o1A==
X-Received: by 2002:a05:6a00:189a:b0:70a:fe2d:473a with SMTP id
 d2e1a72fcca58-70b00921341mr9235713b3a.2.1720439284153; 
 Mon, 08 Jul 2024 04:48:04 -0700 (PDT)
Received: from sunil-pc.tail07344b.ts.net ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b2a432ac6sm2769642b3a.94.2024.07.08.04.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 04:48:03 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v2 4/9] acpi/gpex: Create PCI link devices outside PCI root
 bridge
Date: Mon,  8 Jul 2024 17:17:36 +0530
Message-ID: <20240708114741.3499585-5-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240708114741.3499585-1-sunilvl@ventanamicro.com>
References: <20240708114741.3499585-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42f.google.com
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

Currently, PCI link devices (PNP0C0F) are always created within the
scope of the PCI root bridge. However, RISC-V needs these link devices
to be created outside to ensure the probing order in the OS. This
matches the example given in the ACPI specification [1] as well. Hence,
create these link devices directly under _SB instead of under the PCI
root bridge.

To keep these link device names unique for multiple PCI bridges, change
the device name from GSIx to LXXY format where XX is the PCI bus number
and Y is the INTx.

GPEX is currently used by riscv, aarch64/virt and x86/microvm machines.
So, this change will alter the DSDT for those systems.

[1] - ACPI 5.1: 6.2.13.1 Example: Using _PRT to Describe PCI IRQ Routing

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/pci-host/gpex-acpi.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
index f69413ea2c..a93b55c991 100644
--- a/hw/pci-host/gpex-acpi.c
+++ b/hw/pci-host/gpex-acpi.c
@@ -7,7 +7,8 @@
 #include "hw/pci/pcie_host.h"
 #include "hw/acpi/cxl.h"
 
-static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq)
+static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq,
+                                          Aml *scope, uint8_t bus_num)
 {
     Aml *method, *crs;
     int i, slot_no;
@@ -20,7 +21,7 @@ static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq)
             Aml *pkg = aml_package(4);
             aml_append(pkg, aml_int((slot_no << 16) | 0xFFFF));
             aml_append(pkg, aml_int(i));
-            aml_append(pkg, aml_name("GSI%d", gsi));
+            aml_append(pkg, aml_name("L%.02X%d", bus_num, gsi));
             aml_append(pkg, aml_int(0));
             aml_append(rt_pkg, pkg);
         }
@@ -30,7 +31,7 @@ static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq)
     /* Create GSI link device */
     for (i = 0; i < PCI_NUM_PINS; i++) {
         uint32_t irqs = irq + i;
-        Aml *dev_gsi = aml_device("GSI%d", i);
+        Aml *dev_gsi = aml_device("L%.02X%d", bus_num, i);
         aml_append(dev_gsi, aml_name_decl("_HID", aml_string("PNP0C0F")));
         aml_append(dev_gsi, aml_name_decl("_UID", aml_int(i)));
         crs = aml_resource_template();
@@ -45,7 +46,7 @@ static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq)
         aml_append(dev_gsi, aml_name_decl("_CRS", crs));
         method = aml_method("_SRS", 1, AML_NOTSERIALIZED);
         aml_append(dev_gsi, method);
-        aml_append(dev, dev_gsi);
+        aml_append(scope, dev_gsi);
     }
 }
 
@@ -174,7 +175,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
                 aml_append(dev, aml_name_decl("_PXM", aml_int(numa_node)));
             }
 
-            acpi_dsdt_add_pci_route_table(dev, cfg->irq);
+            acpi_dsdt_add_pci_route_table(dev, cfg->irq, scope, bus_num);
 
             /*
              * Resources defined for PXBs are composed of the following parts:
@@ -205,7 +206,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
     aml_append(dev, aml_name_decl("_STR", aml_unicode("PCIe 0 Device")));
     aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
 
-    acpi_dsdt_add_pci_route_table(dev, cfg->irq);
+    acpi_dsdt_add_pci_route_table(dev, cfg->irq, scope, 0);
 
     method = aml_method("_CBA", 0, AML_NOTSERIALIZED);
     aml_append(method, aml_return(aml_int(cfg->ecam.base)));
-- 
2.43.0


