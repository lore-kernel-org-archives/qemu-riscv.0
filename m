Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89041C4167B
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 03:19:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qykgZ-0007qg-FH; Thu, 02 Nov 2023 23:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qykgV-0007oz-Gi
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 23:17:23 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qykgT-0003RU-5e
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 23:17:23 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-280351c32afso1525003a91.1
 for <qemu-riscv@nongnu.org>; Thu, 02 Nov 2023 20:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698981438; x=1699586238; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0G4mli43rxQIFAxng87lycqryCrXbuE4wxOKTPRmEvA=;
 b=E8k11OLomR9WLbtIpCy0HiuyVWJmL1EAUc7Zj7XAJA0gmbY8YXwX49AhIZr36xLGPz
 7rLj3HSMwxbGHgQkDxEoLTQpzc4IEyk2J5jVGDDpAcwwVyEUEuOK3p3bryWNj/bUaY7F
 xOt6MnEdLztPF5RTk+ruOGwhnO8uW7IDq3Y4kxkIoPNdDDLKzYdzZZe4Hj5qlAGQj4Z/
 gdK0vYj1R2haP13Tsyftv/y3eLuXdCqmaH/165eTngG4KYC8DLTB0LeCLex4Qbs0dy8I
 mj435Kpr+dA/AB1vvlxwFtUYyIh+10s4XzDKS8E+y7SvI9H66N473AfGsUwDOkmAuRsd
 zKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698981438; x=1699586238;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0G4mli43rxQIFAxng87lycqryCrXbuE4wxOKTPRmEvA=;
 b=isRkIPTiJjpvpWbcchuMwXp4Ni8UHrq1O9GABjtHBL6RGMyujidBE2iCyhx7Va0xxn
 Ouc2DWFs+X2dbf87NHLXv5MD0xvZp1HwFmqoWodRNOwRJ0PAkecI2I3ncp2l8EXfzqSO
 wnAbrhLAEON4DxTxbp3SkI8s5itlgUXx2JnjPBPe3TrpVa1YdLEAZw9cX/P8SGJ42RRl
 boR2J1O4uV1DXCRqQJ5nlrAepgi/AqdP5ar52FkfjAntvgdKg4Y5vclJvWjI7Qx7Fk7r
 3Hqd3lQBPr/e100F25aPpG4ITEFQfG9C8ypMJideZADiCcV/jfqPLQztto150cjH9vMx
 vNBw==
X-Gm-Message-State: AOJu0YwkdexZQjodm0CxkNGQ/zPgfu36ejMVwFbKaw1QPDqMlYvkhXxU
 Mb1+AK/BfvkX/cNzX1HkcX0zUA==
X-Google-Smtp-Source: AGHT+IEPAZXYsYuFjhxXcBf5N/Vts1RQRR0odfQXK1rUjd3CCy+GucmAVvLkPpU0gwjWshpDyrky+A==
X-Received: by 2002:a17:90a:6006:b0:27d:6937:db89 with SMTP id
 y6-20020a17090a600600b0027d6937db89mr19501794pji.43.1698981438115; 
 Thu, 02 Nov 2023 20:17:18 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a17090aca9100b0027cf4c554dasm499971pjt.11.2023.11.02.20.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 20:17:17 -0700 (PDT)
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
Subject: [PATCH v7 03/13] hw/i386/acpi-microvm.c: Use common function to add
 virtio in DSDT
Date: Fri,  3 Nov 2023 08:46:39 +0530
Message-Id: <20231103031649.2769834-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103031649.2769834-1-sunilvl@ventanamicro.com>
References: <20231103031649.2769834-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


