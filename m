Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4728EC5AC7C
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 10:23:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wsHir-0002dQ-AK; Fri, 07 Aug 2026 06:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <caojunze424@gmail.com>)
 id 1wsHiq-0002cw-7n
 for qemu-riscv@nongnu.org; Fri, 07 Aug 2026 06:22:40 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <caojunze424@gmail.com>)
 id 1wsHio-0006hR-JH
 for qemu-riscv@nongnu.org; Fri, 07 Aug 2026 06:22:39 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2cecdc24b1cso3768425ad.1
 for <qemu-riscv@nongnu.org>; Fri, 07 Aug 2026 03:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786098157; x=1786702957; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZN5jp+bb/UoI7I0sY1cKfqGk82YmhPmpHjZV2tsLJIo=;
 b=lHRSMWHXLXqweDchvE5Zp4AzZWPrU0MawCEksb5ndUdEsCAcKxvTitc/5gcOvsmUxx
 /8duZaVPQNqO5cRM3GVBZsQqkP/lIYGkR8G7TL4yGz1B/kmiwkyyGECku8dg3ps6vveZ
 8VkC8XYmrzVtpis04A6Dd+OHfWUk0NghevLJ0pb39IyDVlwnz91jPSxeE+VymlPqNNB1
 vBE8rP4MRuMPHvQX2FNedxantCtXTlrHJG7ZBQc3M+UZFL8tzr3Ry4DLn3lFQCyMXuLm
 tqvGpyhYlUC2kxhIWvxG7zDU5itFRteRYc4f3TZHaOe96xhnyobMvyCRR863st8BNIdi
 HQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786098157; x=1786702957;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ZN5jp+bb/UoI7I0sY1cKfqGk82YmhPmpHjZV2tsLJIo=;
 b=koX9rX7lRR5DwGp053QyOVXCK2qInAjFBqUORC7gk79c0GPeiUJCHYNEFNtK+wq1ru
 4umg5dwHN2ThypKnUiqgscExTGp5b0t9mKJe/cZKCNNmTlSqWqYgrX93jaStF9fWPM8l
 ES/EkjcwGJlQY2d1KU+b+m8DGETv6fwejXiy1S6KkwhAILijwhuQqtz+7s9svxAtJIAf
 EzvlCStDzXVjnb4xCxZz5hJeTqUynl/Z+//HERmzHX8g8AxrWdgcoZbE3N+2jmj9cKxy
 GA46B4j/9oj2tKiBlIxtbC/le/QCpSlCfim4v6wAbp75p0GTb8lsvZWuRaevby6+RZwp
 Fa6A==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqea6SyIltUO1qqfRfgJtvV04CLs6pV286xAm/Yvpr5iAK9FdfGjpNVEqwNYXKSJVwNLXdcqS4EU6da@nongnu.org
X-Gm-Message-State: AOJu0Yz2S4OFxcq1kdoMSdYU8Y+qEscQ1+vZy5uf4cCEuNbDtKlbbOKh
 C9sie2p/zv+16OxmfeMHXP6zk1Lrj0mzHGUbSZc0GxowCyEOIaRRyqQP
X-Gm-Gg: AR+sD11eEyXcDjBDgv9P/KSDnCswJiS5IdHbFToRm3SXRI/H6Ssa7/iMr89psktpKPe
 0InWRws4DL6+a+maTio9JnzlRDOdWXkZrVbtdDHB/HcLgXTo2mc6CGqxTtc0nqp1l1ZlilRKwPb
 +pGWYD7+dfxpN00k6pOOuIqw0VF/hSdEVRyFWopAk+4QInt21uYzltEi3zff+zc7ENMd1jMZJIE
 V8gjJ+48yrCD0j3ba1dy5JBVzYArlIdwtNNcep/raoJMIHOtDsMH5oZev6UGod1lUQSZHMUvFel
 m4HTbbdWErXpq4p1Gxg05/nmx5RcEMpVAP+HA8acwceQhZ1M0IRmY3py1TrmA7u1tSk+EPxT/9u
 wEgFFqRI7mEgDJ5NWTi588fryEcmX0wDkZ3Vk6iPhBVEGHOkdlHYSdqjTTqr3Gh+NDeS/CGkwkW
 ti/aLFrlQid7JmKn5ru4g6yoJKJCgThBmiw7C5HEeT8SxuOaJrGHZtcFv+VQ==
X-Received: by 2002:a17:903:1b2b:b0:2ca:ecf6:9115 with SMTP id
 d9443c01a7336-2d0caa9bb8bmr183156455ad.2.1786098157187; 
 Fri, 07 Aug 2026 03:22:37 -0700 (PDT)
Received: from [127.0.0.1] ([38.34.7.236]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-315be86d3fcsm6158337eec.4.2026.08.07.03.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2026 03:22:36 -0700 (PDT)
From: Junze Cao <caojunze424@gmail.com>
Date: Fri, 07 Aug 2026 18:21:17 +0800
Subject: [PATCH v2 2/3] hw/riscv: Connect K230 DDR controller and PHY
 models
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-k230-ddr-v2-v2-2-c531308ae819@gmail.com>
References: <20260807-k230-ddr-v2-v2-0-c531308ae819@gmail.com>
In-Reply-To: <20260807-k230-ddr-v2-v2-0-c531308ae819@gmail.com>
To: qemu-devel@nongnu.org
Cc: Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Junze Cao <caojunze424@gmail.com>
X-Mailer: b4 0.15.2
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=caojunze424@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Replace the unimplemented K230 DDR configuration region with the DDRC
model and map the PHY model at 0x9a000000.

Connect the controller to the PHY so DFI status reflects PHY training and
initialization state.

Suggested-by: Chao Liu <chao.liu@processmission.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Signed-off-by: Junze Cao <caojunze424@gmail.com>
---
 docs/system/riscv/k230.rst |  4 ++++
 hw/riscv/k230.c            | 19 ++++++++++++++++---
 include/hw/riscv/k230.h    |  4 ++++
 3 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/docs/system/riscv/k230.rst b/docs/system/riscv/k230.rst
index cea8202e55..06a819fbdb 100644
--- a/docs/system/riscv/k230.rst
+++ b/docs/system/riscv/k230.rst
@@ -20,12 +20,16 @@ The ``k230`` machine supports the following devices:
 * Platform-Level Interrupt Controller (PLIC)
 * 2 K230 Watchdog Timer
 * 5 UART
+* K230 DDRC CFG and DDR PHY
 
 Boot options
 ------------
 The ``k230`` machine supports K230 SDK boot through M-mode U-Boot, which then
 starts OpenSBI/Linux with ``bootm``. It also supports direct Linux boot.
 
+The DDRC CFG and DDR PHY models allow the K230 SDK U-Boot SPL to complete DDR
+initialization before loading the next boot stage.
+
 K230 SDK Linux kernels use T-HEAD C9xx private MAEE page table attributes. QEMU
 does not implement MAEE in the generic RISC-V MMU, so such kernels need to be
 built with standard RISC-V PTE bits before they can boot under QEMU.
diff --git a/hw/riscv/k230.c b/hw/riscv/k230.c
index 656f28190c..627150b463 100644
--- a/hw/riscv/k230.c
+++ b/hw/riscv/k230.c
@@ -97,6 +97,7 @@ static const MemMapEntry memmap[] = {
     [K230_DEV_SPI] =          { 0x91584000,  0x00001000 },
     [K230_DEV_HI_SYS_CFG] =   { 0x91585000,  0x00000400 },
     [K230_DEV_DDRC_CFG] =     { 0x98000000,  0x02000000 },
+    [K230_DEV_DDR_PHY] =      { 0x9A000000,  0x00400000 },
     [K230_DEV_FLASH] =        { 0xC0000000,  0x08000000 },
     [K230_DEV_PLIC] =         { 0xF00000000, 0x00400000 },
     [K230_DEV_CLINT] =        { 0xF04000000, 0x00400000 },
@@ -108,6 +109,11 @@ static void k230_soc_init(Object *obj)
     RISCVHartArrayState *cpu0 = &s->c908_cpu;
 
     object_initialize_child(obj, "c908-cpu", cpu0, TYPE_RISCV_HART_ARRAY);
+    object_initialize_child(obj, "ddr-cfg", &s->ddr_cfg,
+                            TYPE_K230_DDR_CFG);
+    object_initialize_child(obj, "ddr-phy", &s->ddr_phy,
+                            TYPE_K230_DDR_PHY);
+    s->ddr_cfg.phy = &s->ddr_phy;
     object_initialize_child(obj, "k230-wdt0", &s->wdt[0], TYPE_K230_WDT);
     object_initialize_child(obj, "k230-wdt1", &s->wdt[1], TYPE_K230_WDT);
 
@@ -158,6 +164,16 @@ static void k230_soc_realize(DeviceState *dev, Error **errp)
     int c908_cpus;
 
     sysbus_realize(SYS_BUS_DEVICE(&s->c908_cpu), &error_fatal);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->ddr_cfg), errp)) {
+        return;
+    }
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->ddr_phy), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->ddr_cfg), 0,
+                    memmap[K230_DEV_DDRC_CFG].base);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->ddr_phy), 0,
+                    memmap[K230_DEV_DDR_PHY].base);
 
     c908_cpus = s->c908_cpu.num_harts;
 
@@ -361,9 +377,6 @@ static void k230_soc_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("hi_sys_cfg", memmap[K230_DEV_HI_SYS_CFG].base,
                                 memmap[K230_DEV_HI_SYS_CFG].size);
 
-    create_unimplemented_device("ddrc_cfg", memmap[K230_DEV_DDRC_CFG].base,
-                                memmap[K230_DEV_DDRC_CFG].size);
-
     create_unimplemented_device("flash", memmap[K230_DEV_FLASH].base,
                                 memmap[K230_DEV_FLASH].size);
 }
diff --git a/include/hw/riscv/k230.h b/include/hw/riscv/k230.h
index 592e1c26bf..80ca16338c 100644
--- a/include/hw/riscv/k230.h
+++ b/include/hw/riscv/k230.h
@@ -16,6 +16,7 @@
 #define HW_K230_H
 
 #include "hw/core/boards.h"
+#include "hw/misc/k230_ddr.h"
 #include "hw/riscv/riscv_hart.h"
 #include "hw/watchdog/k230_wdt.h"
 
@@ -32,6 +33,8 @@ typedef struct K230SoCState {
     /*< public >*/
     RISCVHartArrayState c908_cpu; /* Small core */
 
+    K230DDRCfgState ddr_cfg;
+    K230DDRPhyState ddr_phy;
     K230WdtState wdt[2];
     MemoryRegion sram;
     MemoryRegion bootrom;
@@ -112,6 +115,7 @@ enum {
     K230_DEV_SPI,
     K230_DEV_HI_SYS_CFG,
     K230_DEV_DDRC_CFG,
+    K230_DEV_DDR_PHY,
     K230_DEV_FLASH,
     K230_DEV_PLIC,
     K230_DEV_CLINT,

-- 
2.53.0


