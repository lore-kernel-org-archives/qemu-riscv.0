Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D1EC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:59:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmTS-0003Id-NF; Fri, 05 Jan 2024 10:51:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmS8-0007pn-2E
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:49:44 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmS4-0000Zt-TE
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:49:43 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-337520892f7so393078f8f.0
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469775; x=1705074575; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/qHj/5uAdYCvRnDozLLxG4HVXbbh9wIM2eiBwuzcy8E=;
 b=O6thLAWUIs+mpGnt3fcHUY2d+6DiM5HlAlAv/iQ7Fr0KqxtaYdnmgujwU5LX4cOHnI
 TRBPVsIdGacvsdSE4JULGcXZ37MXJyoZMGi2J97hGoOGpnNnppIJbVsShplKGBxtE7K2
 Ro+YfmT04YRZ5Oo4QY4PsWJ8Kxm+KywzbePWYvGxTzFUfJGTqeNtoHhiSg4pJqjGlK7r
 7nTpn/8XYky0sGBDkaOBw2PjzQZUNNgxrcJt5UbWbUrHP6P2MKL0oypX11k2hMpg/VZP
 Z1pOnAzb9gCSA1gVhgFS8HM3IkswqKhqFwK4A7P7Fea/yRPYwZDmcjq2SV8bxaOym+io
 5kFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469775; x=1705074575;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/qHj/5uAdYCvRnDozLLxG4HVXbbh9wIM2eiBwuzcy8E=;
 b=cM8AWAu20Urp8vxCin1FPMePCHlFd1iYT0ucMA5DraS9+v/yagamJFi92vF4aUZh07
 bg8g7pRON2VK/+vVzFfQNniiKVl4tJj7UyD9lSRBPk57ymwTNPYIFmNsuBStMKEZ6JZ8
 Gca4jvt3Mt6fIu06dwatcz53paZmMQAt7kEjzF/Sqn8AYCsvcSeyc6CFBNCg6SeJKZhp
 yTl+jJ6BTdPVlBTHCATW3xHYB49vzFDm2NA9IhlHtGIFmo2AQ7zTRhOgLmPYNA+rUgpn
 3UgodAOA+EwZO4+i07NdbNlP3r6+P2lM8h9xdOoNS3PLuqQZ3xhjte0i6sCGsWx+7adk
 wz2g==
X-Gm-Message-State: AOJu0YxiwVjgF/fyme4rrHuE+6gmAf0oGSMxuLtDdqZOZf3/M9SuhxiS
 gNIj1zmMhVgKaqcetW2czx0NzBP4fk5yIQ==
X-Google-Smtp-Source: AGHT+IE/O2rz6N1tj24/myPE2K2KIstpMZKWm+MxMoFdRGNI2tf3Htgb1gzG1cc6OxiRjPIzmrR1PQ==
X-Received: by 2002:a5d:42cc:0:b0:337:5c9c:2a52 with SMTP id
 t12-20020a5d42cc000000b003375c9c2a52mr361625wrr.20.1704469775442; 
 Fri, 05 Jan 2024 07:49:35 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 cs18-20020a056000089200b00333359b522dsm1615912wrb.77.2024.01.05.07.49.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:49:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Gavin Shan <gshan@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [PULL 63/71] hw: Simplify memory_region_init_ram() calls
Date: Fri,  5 Jan 2024 16:42:56 +0100
Message-ID: <20240105154307.21385-64-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

Mechanical change using the following coccinelle script:

@@
expression mr, owner, arg3, arg4, errp;
@@
-   memory_region_init_ram(mr, owner, arg3, arg4, &errp);
    if (
-       errp
+       !memory_region_init_ram(mr, owner, arg3, arg4, &errp)
    ) {
        ...
        return;
    }

and removing the local Error variable.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au> # aspeed
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-21-philmd@linaro.org>
---
 hw/arm/aspeed_ast2400.c | 6 ++----
 hw/arm/aspeed_ast2600.c | 6 ++----
 hw/arm/fsl-imx25.c      | 6 ++----
 hw/arm/fsl-imx31.c      | 6 ++----
 hw/arm/fsl-imx6.c       | 6 ++----
 hw/arm/integratorcp.c   | 7 ++-----
 hw/arm/nrf51_soc.c      | 7 ++-----
 hw/ppc/rs6000_mc.c      | 7 ++-----
 8 files changed, 16 insertions(+), 35 deletions(-)

diff --git a/hw/arm/aspeed_ast2400.c b/hw/arm/aspeed_ast2400.c
index a4334c81b8..0baa2ff96e 100644
--- a/hw/arm/aspeed_ast2400.c
+++ b/hw/arm/aspeed_ast2400.c
@@ -247,7 +247,6 @@ static void aspeed_ast2400_soc_realize(DeviceState *dev, Error **errp)
     Aspeed2400SoCState *a = ASPEED2400_SOC(dev);
     AspeedSoCState *s = ASPEED_SOC(dev);
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
-    Error *err = NULL;
     g_autofree char *sram_name = NULL;
 
     /* Default boot region (SPI memory or ROMs) */
@@ -276,9 +275,8 @@ static void aspeed_ast2400_soc_realize(DeviceState *dev, Error **errp)
 
     /* SRAM */
     sram_name = g_strdup_printf("aspeed.sram.%d", CPU(&a->cpu[0])->cpu_index);
-    memory_region_init_ram(&s->sram, OBJECT(s), sram_name, sc->sram_size, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!memory_region_init_ram(&s->sram, OBJECT(s), sram_name, sc->sram_size,
+                                errp)) {
         return;
     }
     memory_region_add_subregion(s->memory,
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index b965fbab5e..3a9a303ab8 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -282,7 +282,6 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     Aspeed2600SoCState *a = ASPEED2600_SOC(dev);
     AspeedSoCState *s = ASPEED_SOC(dev);
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
-    Error *err = NULL;
     qemu_irq irq;
     g_autofree char *sram_name = NULL;
 
@@ -355,9 +354,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
 
     /* SRAM */
     sram_name = g_strdup_printf("aspeed.sram.%d", CPU(&a->cpu[0])->cpu_index);
-    memory_region_init_ram(&s->sram, OBJECT(s), sram_name, sc->sram_size, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!memory_region_init_ram(&s->sram, OBJECT(s), sram_name, sc->sram_size,
+                                errp)) {
         return;
     }
     memory_region_add_subregion(s->memory,
diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
index 9aabbf7f58..b15435ccaf 100644
--- a/hw/arm/fsl-imx25.c
+++ b/hw/arm/fsl-imx25.c
@@ -299,10 +299,8 @@ static void fsl_imx25_realize(DeviceState *dev, Error **errp)
                                 &s->rom[1]);
 
     /* initialize internal RAM (128 KB) */
-    memory_region_init_ram(&s->iram, NULL, "imx25.iram", FSL_IMX25_IRAM_SIZE,
-                           &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!memory_region_init_ram(&s->iram, NULL, "imx25.iram",
+                                FSL_IMX25_IRAM_SIZE, errp)) {
         return;
     }
     memory_region_add_subregion(get_system_memory(), FSL_IMX25_IRAM_ADDR,
diff --git a/hw/arm/fsl-imx31.c b/hw/arm/fsl-imx31.c
index def27bb913..1d5dcd51e8 100644
--- a/hw/arm/fsl-imx31.c
+++ b/hw/arm/fsl-imx31.c
@@ -208,10 +208,8 @@ static void fsl_imx31_realize(DeviceState *dev, Error **errp)
                                 &s->rom);
 
     /* initialize internal RAM (16 KB) */
-    memory_region_init_ram(&s->iram, NULL, "imx31.iram", FSL_IMX31_IRAM_SIZE,
-                           &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!memory_region_init_ram(&s->iram, NULL, "imx31.iram",
+                                FSL_IMX31_IRAM_SIZE, errp)) {
         return;
     }
     memory_region_add_subregion(get_system_memory(), FSL_IMX31_IRAM_ADDR,
diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 7dc42cbfe6..58f37e7c11 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -443,10 +443,8 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
                                 &s->caam);
 
     /* OCRAM memory */
-    memory_region_init_ram(&s->ocram, NULL, "imx6.ocram", FSL_IMX6_OCRAM_SIZE,
-                           &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!memory_region_init_ram(&s->ocram, NULL, "imx6.ocram",
+                                FSL_IMX6_OCRAM_SIZE, errp)) {
         return;
     }
     memory_region_add_subregion(get_system_memory(), FSL_IMX6_OCRAM_ADDR,
diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index e602ca5e14..1830e1d785 100644
--- a/hw/arm/integratorcp.c
+++ b/hw/arm/integratorcp.c
@@ -291,12 +291,9 @@ static void integratorcm_realize(DeviceState *d, Error **errp)
 {
     IntegratorCMState *s = INTEGRATOR_CM(d);
     SysBusDevice *dev = SYS_BUS_DEVICE(d);
-    Error *local_err = NULL;
 
-    memory_region_init_ram(&s->flash, OBJECT(d), "integrator.flash", 0x100000,
-                           &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!memory_region_init_ram(&s->flash, OBJECT(d), "integrator.flash",
+                                0x100000, errp)) {
         return;
     }
 
diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index 34da0d62f0..ac53441630 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -58,7 +58,6 @@ static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
 {
     NRF51State *s = NRF51_SOC(dev_soc);
     MemoryRegion *mr;
-    Error *err = NULL;
     uint8_t i = 0;
     hwaddr base_addr = 0;
 
@@ -92,10 +91,8 @@ static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
 
     memory_region_add_subregion_overlap(&s->container, 0, s->board_memory, -1);
 
-    memory_region_init_ram(&s->sram, OBJECT(s), "nrf51.sram", s->sram_size,
-                           &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!memory_region_init_ram(&s->sram, OBJECT(s), "nrf51.sram", s->sram_size,
+                                errp)) {
         return;
     }
     memory_region_add_subregion(&s->container, NRF51_SRAM_BASE, &s->sram);
diff --git a/hw/ppc/rs6000_mc.c b/hw/ppc/rs6000_mc.c
index b35f8ba112..e6ec4b4c40 100644
--- a/hw/ppc/rs6000_mc.c
+++ b/hw/ppc/rs6000_mc.c
@@ -143,7 +143,6 @@ static void rs6000mc_realize(DeviceState *dev, Error **errp)
     RS6000MCState *s = RS6000MC(dev);
     int socket = 0;
     unsigned int ram_size = s->ram_size / MiB;
-    Error *local_err = NULL;
 
     while (socket < 6) {
         if (ram_size >= 64) {
@@ -165,10 +164,8 @@ static void rs6000mc_realize(DeviceState *dev, Error **errp)
         if (s->simm_size[socket]) {
             char name[] = "simm.?";
             name[5] = socket + '0';
-            memory_region_init_ram(&s->simm[socket], OBJECT(dev), name,
-                                   s->simm_size[socket] * MiB, &local_err);
-            if (local_err) {
-                error_propagate(errp, local_err);
+            if (!memory_region_init_ram(&s->simm[socket], OBJECT(dev), name,
+                                        s->simm_size[socket] * MiB, errp)) {
                 return;
             }
             memory_region_add_subregion_overlap(get_system_memory(), 0,
-- 
2.41.0


