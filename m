Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3467EC47079
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:56:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmTa-00041W-2b; Fri, 05 Jan 2024 10:51:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmSE-0008HS-AQ
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:49:54 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmSB-0000xX-Cu
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:49:50 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40e3712d259so10457335e9.3
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469786; x=1705074586; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PoxGR8z2iD4/dV7vlDevdlyqaz6yGMvGSLHUDaB/+Ko=;
 b=lS7mHqvQydw9G3Y95Kh+xSnAHmZcPK6Yh8lO6Q5C9+RCv/1NWXRQ4A55nbW9oDf4oQ
 9aSJuVas4MVrsgWiIyEyzqfq+nyNySZfOtIC5N9GM+HXAHyfV/1Lho4v7IPKzpQkYaqr
 egKqoEs5pBlK1/60ZWAnVsBN2S0ysVpzIxlnweC/UHHMq7PIPpCNsERY2FDaavfUtJtP
 4fTGLJ+fesB/gcydoGNKFrRiX3rH8XYdKuDJUZWh43hwFe66wwqDN7QzUPVMpt3zpFZ2
 2kIM3RYtJYkES9osuoVYSZzPSHx2XaQg0UtO6rJ4wRa1uL157YP0fxCdqjJ2TwPoMP1L
 PcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469786; x=1705074586;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PoxGR8z2iD4/dV7vlDevdlyqaz6yGMvGSLHUDaB/+Ko=;
 b=ryQ9R4Gn6nqDBSTFv5A0CTqO6oY9fxs9agsoQtVM1CjM2T06eTuFYO4ood/UK/Inkr
 orMHPLjwFBHKWH6mUVss/Zu04lXGzRkro7VO/y1nh2PteFA0uLQhqWpoR6IPNIYOwA6t
 n7xNVhVS+uOhYSMKJONXPnZgPxWyQ3WAqnK2QBOuWBSpDaOT5qRoEq3rbN1JmOP1jVCq
 ydCqVPaRqh9qtJ0RYIZ5rSrNwxnM0lZMRHv9zcMNPeCu2UQiL4OXwtekpNIQwnpY0X5Z
 l1R2Fkyoya1BRQMZWZXu8dG29aLUwTNPMCd5cfq0dIKB3YSKQPMXw1oCfX1nlZevNwLZ
 xwrA==
X-Gm-Message-State: AOJu0YyYkHAC1kOu+MAUeHOq2rQ1tMTZRovtWmGwk0RMvJX3qWNYh7uM
 oYRRqb57c2Q55B3aWz+qnzIoUVzDTRJdDA==
X-Google-Smtp-Source: AGHT+IFwrMeMDJP4oO+XGA1BUGpUIY1yT52Wd8pHgBQFLKSV3AS0DpLDcrNG8K6y3OFW3EgRTkVmXA==
X-Received: by 2002:a05:600c:22d6:b0:40d:5d07:55d3 with SMTP id
 22-20020a05600c22d600b0040d5d0755d3mr819881wmg.177.1704469785886; 
 Fri, 05 Jan 2024 07:49:45 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 b14-20020adff90e000000b003375c072fbcsm896486wrr.100.2024.01.05.07.49.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:49:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gavin Shan <gshan@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PULL 65/71] hw/sparc: Simplify memory_region_init_ram_nomigrate()
 calls
Date: Fri,  5 Jan 2024 16:42:58 +0100
Message-ID: <20240105154307.21385-66-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
-   memory_region_init_ram_nomigrate(mr, owner, arg3, arg4, &errp);
    if (
-       errp
+       !memory_region_init_ram_nomigrate(mr, owner, arg3, arg4, &errp)
    ) {
        ...
        return;
    }

and removing the local Error variable.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-23-philmd@linaro.org>
---
 hw/sparc/sun4m.c   | 21 ++++++---------------
 hw/sparc64/sun4u.c |  7 ++-----
 2 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 64895aebe3..550af01690 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -577,12 +577,9 @@ static void idreg_realize(DeviceState *ds, Error **errp)
 {
     IDRegState *s = MACIO_ID_REGISTER(ds);
     SysBusDevice *dev = SYS_BUS_DEVICE(ds);
-    Error *local_err = NULL;
 
-    memory_region_init_ram_nomigrate(&s->mem, OBJECT(ds), "sun4m.idreg",
-                                     sizeof(idreg_data), &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!memory_region_init_ram_nomigrate(&s->mem, OBJECT(ds), "sun4m.idreg",
+                                          sizeof(idreg_data), errp)) {
         return;
     }
 
@@ -631,12 +628,9 @@ static void afx_realize(DeviceState *ds, Error **errp)
 {
     AFXState *s = TCX_AFX(ds);
     SysBusDevice *dev = SYS_BUS_DEVICE(ds);
-    Error *local_err = NULL;
 
-    memory_region_init_ram_nomigrate(&s->mem, OBJECT(ds), "sun4m.afx", 4,
-                                     &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!memory_region_init_ram_nomigrate(&s->mem, OBJECT(ds), "sun4m.afx",
+                                          4, errp)) {
         return;
     }
 
@@ -715,12 +709,9 @@ static void prom_realize(DeviceState *ds, Error **errp)
 {
     PROMState *s = OPENPROM(ds);
     SysBusDevice *dev = SYS_BUS_DEVICE(ds);
-    Error *local_err = NULL;
 
-    memory_region_init_ram_nomigrate(&s->prom, OBJECT(ds), "sun4m.prom",
-                                     PROM_SIZE_MAX, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!memory_region_init_ram_nomigrate(&s->prom, OBJECT(ds), "sun4m.prom",
+                                          PROM_SIZE_MAX, errp)) {
         return;
     }
 
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index c871170378..24d53bf5fd 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -454,12 +454,9 @@ static void prom_realize(DeviceState *ds, Error **errp)
 {
     PROMState *s = OPENPROM(ds);
     SysBusDevice *dev = SYS_BUS_DEVICE(ds);
-    Error *local_err = NULL;
 
-    memory_region_init_ram_nomigrate(&s->prom, OBJECT(ds), "sun4u.prom",
-                                     PROM_SIZE_MAX, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!memory_region_init_ram_nomigrate(&s->prom, OBJECT(ds), "sun4u.prom",
+                                          PROM_SIZE_MAX, errp)) {
         return;
     }
 
-- 
2.41.0


