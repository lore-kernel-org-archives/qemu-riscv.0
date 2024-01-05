Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017F9C47077
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 16:01:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmTW-0003hf-KW; Fri, 05 Jan 2024 10:51:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmS9-0007tb-35
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:49:45 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmS6-0000pR-31
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:49:44 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3373a30af67so1326523f8f.0
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469780; x=1705074580; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WY1HVSmMqBvEYUJRh+Ffc8mXYkbCc4MclKwdMWfHMLU=;
 b=mXagiHF54kfdUzGSesLI76REo2QBZplxlc1aW1qLhPd8wePZSbyZ39zD7DLoFUtIYt
 jVuOToy6dQy681AXlDMqJDrRBXTrczgiy6uxzZL6IylVyQyYBUuLn8ZJVNy0riAkrN3M
 BeJNEIj2SA94/Nqsct2y3fcoOVwznwK9JVOUHMooqNLgNRHgtjWERpZLrq+qXgL+q8Sz
 Rv3ORrBQjlLZKmLYwZcvHN8tf6YvXJpB2xBAJH0qC9i9wOnmn7mPgB08i48O7KfoL3dr
 kZSYZBzFoc84yiGT36iUbs/I57/IcUqwe4W0YbLDzGg6oauLsmVUgxKwAYY/TVGuUbXx
 W1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469780; x=1705074580;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WY1HVSmMqBvEYUJRh+Ffc8mXYkbCc4MclKwdMWfHMLU=;
 b=b0BP9g634Pkq2K86iaCT30hlb6NOq0QO/Inc5Mnf81/KxxsY57Co2DoMShiue7BrB6
 l/szo1nx+WyRr3T35wyjo53hxBdmt9Quig/nngMP2V1BBXjbX3R1QlqvNrgZ7YVtb9KW
 0C0jBSp9sZTIepQuUQ15wMvfIv0ptXdH5pjbFQITeQLWxivq39ec5epF0v+AvMm/txDk
 QOgdivbph2jow8TYhZBurNjkahB02IhFxsrN92bFYmRpLrnJiHBjO8eyJDfy0M6QvPrw
 LxKmlr8ro2AcnJ/G+89qHzrQhIn+jzHj7VDBfwk8337LknzMgjmbMdlAi4laauRfS7sC
 gpGQ==
X-Gm-Message-State: AOJu0Yw+anyaurqmVwCX3RQeItJGymwW986BEoanDyyI8s3kE4CP19JH
 ImdTg8AFxYO3d/wndJu7xbGDzicQ7J374A==
X-Google-Smtp-Source: AGHT+IEkMn4lig3/xSwctERMb9JqfN0t33SzjP+XpjfyOru6RJDfaXV1dK3xbGJJqN/PY15TOOWL8g==
X-Received: by 2002:a05:6000:1286:b0:337:39d7:3e16 with SMTP id
 f6-20020a056000128600b0033739d73e16mr810103wrx.76.1704469780660; 
 Fri, 05 Jan 2024 07:49:40 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 q16-20020adfea10000000b003365fcc1846sm1607957wrm.52.2024.01.05.07.49.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:49:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Gavin Shan <gshan@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Subject: [PULL 64/71] hw/arm: Simplify memory_region_init_rom() calls
Date: Fri,  5 Jan 2024 16:42:57 +0100
Message-ID: <20240105154307.21385-65-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

Mechanical change using the following coccinelle script:

@@
expression mr, owner, arg3, arg4, errp;
@@
-   memory_region_init_rom(mr, owner, arg3, arg4, &errp);
    if (
-       errp
+       !memory_region_init_rom(mr, owner, arg3, arg4, &errp)
    ) {
        ...
        return;
    }

and removing the local Error variable.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-22-philmd@linaro.org>
---
 hw/arm/fsl-imx25.c | 13 ++++---------
 hw/arm/fsl-imx31.c | 13 ++++---------
 hw/arm/fsl-imx6.c  | 13 ++++---------
 3 files changed, 12 insertions(+), 27 deletions(-)

diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
index b15435ccaf..9d2fb75a68 100644
--- a/hw/arm/fsl-imx25.c
+++ b/hw/arm/fsl-imx25.c
@@ -81,7 +81,6 @@ static void fsl_imx25_realize(DeviceState *dev, Error **errp)
 {
     FslIMX25State *s = FSL_IMX25(dev);
     uint8_t i;
-    Error *err = NULL;
 
     if (!qdev_realize(DEVICE(&s->cpu), NULL, errp)) {
         return;
@@ -281,18 +280,14 @@ static void fsl_imx25_realize(DeviceState *dev, Error **errp)
                                                        FSL_IMX25_WDT_IRQ));
 
     /* initialize 2 x 16 KB ROM */
-    memory_region_init_rom(&s->rom[0], OBJECT(dev), "imx25.rom0",
-                           FSL_IMX25_ROM0_SIZE, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!memory_region_init_rom(&s->rom[0], OBJECT(dev), "imx25.rom0",
+                                FSL_IMX25_ROM0_SIZE, errp)) {
         return;
     }
     memory_region_add_subregion(get_system_memory(), FSL_IMX25_ROM0_ADDR,
                                 &s->rom[0]);
-    memory_region_init_rom(&s->rom[1], OBJECT(dev), "imx25.rom1",
-                           FSL_IMX25_ROM1_SIZE, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!memory_region_init_rom(&s->rom[1], OBJECT(dev), "imx25.rom1",
+                                FSL_IMX25_ROM1_SIZE, errp)) {
         return;
     }
     memory_region_add_subregion(get_system_memory(), FSL_IMX25_ROM1_ADDR,
diff --git a/hw/arm/fsl-imx31.c b/hw/arm/fsl-imx31.c
index 1d5dcd51e8..c0584e4dfc 100644
--- a/hw/arm/fsl-imx31.c
+++ b/hw/arm/fsl-imx31.c
@@ -63,7 +63,6 @@ static void fsl_imx31_realize(DeviceState *dev, Error **errp)
 {
     FslIMX31State *s = FSL_IMX31(dev);
     uint16_t i;
-    Error *err = NULL;
 
     if (!qdev_realize(DEVICE(&s->cpu), NULL, errp)) {
         return;
@@ -188,20 +187,16 @@ static void fsl_imx31_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt), 0, FSL_IMX31_WDT_ADDR);
 
     /* On a real system, the first 16k is a `secure boot rom' */
-    memory_region_init_rom(&s->secure_rom, OBJECT(dev), "imx31.secure_rom",
-                           FSL_IMX31_SECURE_ROM_SIZE, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!memory_region_init_rom(&s->secure_rom, OBJECT(dev), "imx31.secure_rom",
+                                FSL_IMX31_SECURE_ROM_SIZE, errp)) {
         return;
     }
     memory_region_add_subregion(get_system_memory(), FSL_IMX31_SECURE_ROM_ADDR,
                                 &s->secure_rom);
 
     /* There is also a 16k ROM */
-    memory_region_init_rom(&s->rom, OBJECT(dev), "imx31.rom",
-                           FSL_IMX31_ROM_SIZE, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!memory_region_init_rom(&s->rom, OBJECT(dev), "imx31.rom",
+                                FSL_IMX31_ROM_SIZE, errp)) {
         return;
     }
     memory_region_add_subregion(get_system_memory(), FSL_IMX31_ROM_ADDR,
diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 58f37e7c11..b2153022c0 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -109,7 +109,6 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
     MachineState *ms = MACHINE(qdev_get_machine());
     FslIMX6State *s = FSL_IMX6(dev);
     uint16_t i;
-    Error *err = NULL;
     unsigned int smp_cpus = ms->smp.cpus;
 
     if (smp_cpus > FSL_IMX6_NUM_CPUS) {
@@ -423,20 +422,16 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
     }
 
     /* ROM memory */
-    memory_region_init_rom(&s->rom, OBJECT(dev), "imx6.rom",
-                           FSL_IMX6_ROM_SIZE, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!memory_region_init_rom(&s->rom, OBJECT(dev), "imx6.rom",
+                                FSL_IMX6_ROM_SIZE, errp)) {
         return;
     }
     memory_region_add_subregion(get_system_memory(), FSL_IMX6_ROM_ADDR,
                                 &s->rom);
 
     /* CAAM memory */
-    memory_region_init_rom(&s->caam, OBJECT(dev), "imx6.caam",
-                           FSL_IMX6_CAAM_MEM_SIZE, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!memory_region_init_rom(&s->caam, OBJECT(dev), "imx6.caam",
+                                FSL_IMX6_CAAM_MEM_SIZE, errp)) {
         return;
     }
     memory_region_add_subregion(get_system_memory(), FSL_IMX6_CAAM_MEM_ADDR,
-- 
2.41.0


