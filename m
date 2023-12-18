Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05572C35274
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 15:06:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rFF9M-0001QZ-Vx; Mon, 18 Dec 2023 10:03:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rFF9L-0001Nt-Ic
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 10:03:19 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rFF9J-0007Aj-UF
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 10:03:19 -0500
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6d3cb1ccccbso841123b3a.0
 for <qemu-riscv@nongnu.org>; Mon, 18 Dec 2023 07:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702911796; x=1703516596; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0G4mli43rxQIFAxng87lycqryCrXbuE4wxOKTPRmEvA=;
 b=dAO799UbSSA2mWbptf0SzEeJ8j34GT0NTRQJBp+Axk49wKoCJmtIwkoTQ3iXowWxrY
 6mhJOVZ8KFa2IaKYPvAFBFMfTAVccY9QDtJDZRTDRwtHBiknB49eoOi7lDs+BhTZrIVA
 qTut6iIP2R3DY6v9OLsLOzjSEWuFrzYgl1mMewL/+RDUBcHJfXP1w+ryKrAWyCC1hZ74
 USPhMJjJ9v1mSnK56M/43sUeSMyypuNCWfw0UHltBHdwDhjAQs/wes6mX/bwYGvx5Cdz
 pEKTPykMBq7nUlgAAPJK5a+JzKUm9l62CMffJB9SNQ8hHVaJbwxxzpAbJpZJHtu8pdMo
 7Kfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702911796; x=1703516596;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0G4mli43rxQIFAxng87lycqryCrXbuE4wxOKTPRmEvA=;
 b=o4kr6krwg8WBheLxJZ8CKkTJgKuxaizMeUZzMXN4Eg7M85hwqVDFPcH25N8+DSAswm
 3tZvlx/BFLTOtsKZvKNOv83xj3DrmyHZEctG6swtb0VZgO4fqOKhLujIPZ+7TQolaLWG
 UwgtOTqxbeIO5IHRh9Qn9+3wwwT10r//5I+eduRGNz3tL7lyRX3na5kUfzTv249txcXu
 WNadAPr7MlSC6QjCmOj0ELD2EFtwOuCHxNlNqyREQrSNaZwZDdaFsPNYYy6VBb54JdU6
 Un/WER1qoJKoJiygOrJkEg1Fd+Hx3vWsdKtt5XNGARYHh+Mx8HRvEaElxrfxDs0Atdyh
 ETOQ==
X-Gm-Message-State: AOJu0YzeY9L+jUnG+7bYHZrzo31rRRgIvsurmWFNeLUUEfPqVIpXs8og
 4wlfcIyC69tYf/NlMKntPrbUgg==
X-Google-Smtp-Source: AGHT+IGajGrfD3V1TKmfeEVW/mORzMSbUZMnugq3IQ5B4jO7osJjN5c9fUPcpDAaEQpYdJbSVFkxWA==
X-Received: by 2002:aa7:8c42:0:b0:6d6:3a0:ae34 with SMTP id
 e2-20020aa78c42000000b006d603a0ae34mr809312pfd.16.1702911796452; 
 Mon, 18 Dec 2023 07:03:16 -0800 (PST)
Received: from sunil-pc.Dlink ([106.51.188.200])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a056a000a0100b006c06779e593sm18975505pfh.16.2023.12.18.07.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 07:03:16 -0800 (PST)
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
 Sunil V L <sunilvl@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v8 03/13] hw/i386/acpi-microvm.c: Use common function to add
 virtio in DSDT
Date: Mon, 18 Dec 2023 20:32:37 +0530
Message-Id: <20231218150247.466427-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231218150247.466427-1-sunilvl@ventanamicro.com>
References: <20231218150247.466427-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42a.google.com
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

With common function to add virtio in DSDT created now, update microvm
code also to use it instead of duplicate code.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-microvm.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index 2909a73933..279da6b4aa 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -37,6 +37,7 @@
 #include "hw/pci/pci.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/usb/xhci.h"
+#include "hw/virtio/virtio-acpi.h"
 #include "hw/virtio/virtio-mmio.h"
 #include "hw/input/i8042.h"
 
@@ -77,19 +78,7 @@ static void acpi_dsdt_add_virtio(Aml *scope,
             uint32_t irq = mms->virtio_irq_base + index;
             hwaddr base = VIRTIO_MMIO_BASE + index * 512;
             hwaddr size = 512;
-
-            Aml *dev = aml_device("VR%02u", (unsigned)index);
-            aml_append(dev, aml_name_decl("_HID", aml_string("LNRO0005")));
-            aml_append(dev, aml_name_decl("_UID", aml_int(index)));
-            aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
-
-            Aml *crs = aml_resource_template();
-            aml_append(crs, aml_memory32_fixed(base, size, AML_READ_WRITE));
-            aml_append(crs,
-                       aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
-                                     AML_EXCLUSIVE, &irq, 1));
-            aml_append(dev, aml_name_decl("_CRS", crs));
-            aml_append(scope, dev);
+            virtio_acpi_dsdt_add(scope, base, size, irq, index, 1);
         }
     }
 }
-- 
2.39.2


