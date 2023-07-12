Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8216FEB64DD
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 16:42:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJcst-0003jF-0k; Wed, 12 Jul 2023 12:40:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qJcsr-0003hv-1f
 for qemu-riscv@nongnu.org; Wed, 12 Jul 2023 12:40:09 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qJcsp-0004ow-9U
 for qemu-riscv@nongnu.org; Wed, 12 Jul 2023 12:40:08 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1b9e8e5b12dso22544155ad.3
 for <qemu-riscv@nongnu.org>; Wed, 12 Jul 2023 09:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689180006; x=1691772006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xmtJyFO7V0N3GIIPv5b5yYoD9PVz1E+U0tStDXlXmOE=;
 b=HfKXGN38vj576wOmv8V2vj7IaUTncZsrIjuW+RiIBcFb5PrgplsoTLK1ds/TgyFssA
 ZiR7mxi9OX+a0UjpLUGhVRi1QF/zEIi2KRfkBeUTbUJb5qen89N27J1hNM0CKLJTSevI
 ISJyGE+vlO28Sqps4keGkP13MfVl5p3zzJQ+uR6e/Ozb1CHTzOOkZdYnSbXi9N4NUsHM
 QrqCCnen+xhvDbd/6N32rCIrdaTBYn8KS7vZ9AznyFreNRTFxHI+2z9q/nFJ6lzTDTWi
 7UNfxaEcQYeewe2G9I1+Sk7yQH2Mw3urvxNtEH+K/+f3UskYwyax7SGFwltq47a7kuxq
 OGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689180006; x=1691772006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xmtJyFO7V0N3GIIPv5b5yYoD9PVz1E+U0tStDXlXmOE=;
 b=DGI5twJ0Y+claiAo+9TAkGdAQX0ryXmY5gWkhIRnLFkLqq6z479NPtpL5tCBjGSTzf
 YSnlxY3GV7qnCbS8/oX1xnsjEdCczO7SdXBcEJTV4OjnSxyd098IoeaE+XR0EW0gHRlg
 fPSG6I1lfZRPpAHU9rbmB+1yAC+ue5NBWEnr9y2cp2RPRlgGdu3Q9ZW0ixsgR6h+0BYg
 Gj2RNL8nx+wlj2odURYm4cztIjRDa0WdXRGKmUuhGvUvbnIMABIkc17Zq1X7iwCaF8Sm
 UKIYF0zBNTGuCIlVGkL1KuA69xVqTzolT5fj5xC/f9UAZACMOtIahWi/Fe0xRTPsVOPE
 FqHw==
X-Gm-Message-State: ABy/qLYQMVBPInUuYF5FHfQtDX6gpfXNemRi/fz1ab+sm9Wx8VP6jEFc
 U25OkZHhNUMKCel+QH2pxEoTwA==
X-Google-Smtp-Source: APBJJlGFilDpvEtdAzrd6KuSsaYMS9tvd7XCXao2xESqrOgUVlHtZcqeJXKclGm2OjL4u/OwUxAjSg==
X-Received: by 2002:a17:902:d2cd:b0:1b8:6a09:9cf9 with SMTP id
 n13-20020a170902d2cd00b001b86a099cf9mr24724202plc.26.1689180005965; 
 Wed, 12 Jul 2023 09:40:05 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.25])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a1709027d9200b001ac7f583f72sm4172824plm.209.2023.07.12.09.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 09:40:05 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 03/10] hw/riscv: virt: Make few IMSIC macros and functions
 public
Date: Wed, 12 Jul 2023 22:09:36 +0530
Message-Id: <20230712163943.98994-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712163943.98994-1-sunilvl@ventanamicro.com>
References: <20230712163943.98994-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x62e.google.com
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

Some macros and static function related to IMSIC are defined
in virt.c. They are required in virt-acpi-build.c. So, make them
public.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/riscv/virt.c         | 25 +------------------------
 include/hw/riscv/virt.h | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 46d3341113..f6067db8ec 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -37,7 +37,6 @@
 #include "hw/riscv/numa.h"
 #include "hw/intc/riscv_aclint.h"
 #include "hw/intc/riscv_aplic.h"
-#include "hw/intc/riscv_imsic.h"
 #include "hw/intc/sifive_plic.h"
 #include "hw/misc/sifive_test.h"
 #include "hw/platform-bus.h"
@@ -53,28 +52,6 @@
 #include "hw/acpi/aml-build.h"
 #include "qapi/qapi-visit-common.h"
 
-/*
- * The virt machine physical address space used by some of the devices
- * namely ACLINT, PLIC, APLIC, and IMSIC depend on number of Sockets,
- * number of CPUs, and number of IMSIC guest files.
- *
- * Various limits defined by VIRT_SOCKETS_MAX_BITS, VIRT_CPUS_MAX_BITS,
- * and VIRT_IRQCHIP_MAX_GUESTS_BITS are tuned for maximum utilization
- * of virt machine physical address space.
- */
-
-#define VIRT_IMSIC_GROUP_MAX_SIZE      (1U << IMSIC_MMIO_GROUP_MIN_SHIFT)
-#if VIRT_IMSIC_GROUP_MAX_SIZE < \
-    IMSIC_GROUP_SIZE(VIRT_CPUS_MAX_BITS, VIRT_IRQCHIP_MAX_GUESTS_BITS)
-#error "Can't accomodate single IMSIC group in address space"
-#endif
-
-#define VIRT_IMSIC_MAX_SIZE            (VIRT_SOCKETS_MAX * \
-                                        VIRT_IMSIC_GROUP_MAX_SIZE)
-#if 0x4000000 < VIRT_IMSIC_MAX_SIZE
-#error "Can't accomodate all IMSIC groups in address space"
-#endif
-
 static const MemMapEntry virt_memmap[] = {
     [VIRT_DEBUG] =        {        0x0,         0x100 },
     [VIRT_MROM] =         {     0x1000,        0xf000 },
@@ -505,7 +482,7 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
     g_free(plic_cells);
 }
 
-static uint32_t imsic_num_bits(uint32_t count)
+uint32_t imsic_num_bits(uint32_t count)
 {
     uint32_t ret = 0;
 
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 4ef1f660ab..00c22492a7 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -23,6 +23,7 @@
 #include "hw/riscv/riscv_hart.h"
 #include "hw/sysbus.h"
 #include "hw/block/flash.h"
+#include "hw/intc/riscv_imsic.h"
 
 #define VIRT_CPUS_MAX_BITS             9
 #define VIRT_CPUS_MAX                  (1 << VIRT_CPUS_MAX_BITS)
@@ -128,4 +129,28 @@ enum {
 
 bool virt_is_acpi_enabled(RISCVVirtState *s);
 void virt_acpi_setup(RISCVVirtState *vms);
+uint32_t imsic_num_bits(uint32_t count);
+
+/*
+ * The virt machine physical address space used by some of the devices
+ * namely ACLINT, PLIC, APLIC, and IMSIC depend on number of Sockets,
+ * number of CPUs, and number of IMSIC guest files.
+ *
+ * Various limits defined by VIRT_SOCKETS_MAX_BITS, VIRT_CPUS_MAX_BITS,
+ * and VIRT_IRQCHIP_MAX_GUESTS_BITS are tuned for maximum utilization
+ * of virt machine physical address space.
+ */
+
+#define VIRT_IMSIC_GROUP_MAX_SIZE      (1U << IMSIC_MMIO_GROUP_MIN_SHIFT)
+#if VIRT_IMSIC_GROUP_MAX_SIZE < \
+    IMSIC_GROUP_SIZE(VIRT_CPUS_MAX_BITS, VIRT_IRQCHIP_MAX_GUESTS_BITS)
+#error "Can't accomodate single IMSIC group in address space"
+#endif
+
+#define VIRT_IMSIC_MAX_SIZE            (VIRT_SOCKETS_MAX * \
+                                        VIRT_IMSIC_GROUP_MAX_SIZE)
+#if 0x4000000 < VIRT_IMSIC_MAX_SIZE
+#error "Can't accomodate all IMSIC groups in address space"
+#endif
+
 #endif
-- 
2.39.2


