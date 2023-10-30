Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23E3C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 13:22:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxSD2-0006kA-95; Mon, 30 Oct 2023 09:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qxSCy-0006hr-Ac
 for qemu-riscv@nongnu.org; Mon, 30 Oct 2023 09:21:32 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qxSCt-0002qI-Qp
 for qemu-riscv@nongnu.org; Mon, 30 Oct 2023 09:21:31 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2800229592aso2742618a91.2
 for <qemu-riscv@nongnu.org>; Mon, 30 Oct 2023 06:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698672086; x=1699276886; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gj3Rp2NxdAvXLBlpU2SKgm21Lwc0GSM72ztmmw3HKvQ=;
 b=Z4tcBdnhGYzNgp2PWTWmFWhN7XqqWnymztnqBzUgR8wBpUw1rBn1X8lIPRfFtVmN8E
 avwRx+wuZeeNb8N44GKoUHSKvEzzqv7L8rxLDI2TJOVYnQKR95//Pmj6SceP9jxzWXZ9
 cADrSKl/9kAeOHvKl9xSWE7UKw8j/InkqUh/Mf+oOTWVq8UL/4nA+DJcOmiSVM+qlEnl
 ds/dtH5ZEks7Uv1dEfm22I9HLyN0ApriMgNwGuXZCEbnQqrIKm9E2rXWT99GNOydnlC4
 2YqzcrBy9ZRbuy8SRTxznxSimzY4I8f7SgCza3fgJJws0DWrY/DhM5b7lp+ckpNWWtwY
 TUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698672086; x=1699276886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gj3Rp2NxdAvXLBlpU2SKgm21Lwc0GSM72ztmmw3HKvQ=;
 b=MJKMkjCNE3PnfDeXT7FPklcz1GMu/sZVlsek6M054zdNuE4RUS3FsYUhcsR200D3RN
 /T2TQp8cGiaHDPo3tOls1ombCVN3BLYE3zgvUvoIZhf6ikJ3ARhnLUzIDO8gEbUVRxLo
 8f6+98WyiUQorV9ISBGMbzoeXS1PD2mtiP09G6Yfk5MXeWzd5jUKb/uxWcs+gruD1PZi
 pnZAsgfQ/qZehriPlUPKPuvq7e4oir9BMJCdR5U5akMgWT/PUmJVm78LoCepHqoCrJNw
 4oajhFCYXRVmTAHSHLcqsBMvMJwe+SP9t85cfm19S2DUF21eKaoVN32e8iygc0J0x/18
 KaEQ==
X-Gm-Message-State: AOJu0YziuV/WKUuYmds9ygYVqIo4Bi5FhsLVgQ810d5L/UizYnhdKUp6
 c/AJIgZAXwC0ErFkOzrD28sdPA==
X-Google-Smtp-Source: AGHT+IHsyE+kY2OM78NC+lmK0fUqEDT7Rk+sOEyzlKG6O2ydwvXA8VxaJZ4hpsb0oEYw2bngxddfYw==
X-Received: by 2002:a17:90a:199e:b0:280:9073:c474 with SMTP id
 30-20020a17090a199e00b002809073c474mr335428pji.38.1698672086384; 
 Mon, 30 Oct 2023 06:21:26 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 15-20020a17090a000f00b0027ced921e80sm8122412pja.38.2023.10.30.06.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 06:21:25 -0700 (PDT)
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
Subject: [PATCH v5 03/13] hw/i386/acpi-microvm.c: Use common function to add
 virtio in DSDT
Date: Mon, 30 Oct 2023 18:50:48 +0530
Message-Id: <20231030132058.763556-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231030132058.763556-1-sunilvl@ventanamicro.com>
References: <20231030132058.763556-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1034.google.com
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

With common function to add virtio in DSDT created now, update microvm
code also to use it instead of duplicate code.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
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


