Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA7EAC0018C
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 12:29:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r0LAT-000852-5o; Tue, 07 Nov 2023 07:26:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0L9u-0006VO-Dx
 for qemu-riscv@nongnu.org; Tue, 07 Nov 2023 07:26:18 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0L9l-0005G0-Rw
 for qemu-riscv@nongnu.org; Tue, 07 Nov 2023 07:26:18 -0500
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9db6cf8309cso817838866b.0
 for <qemu-riscv@nongnu.org>; Tue, 07 Nov 2023 04:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699359966; x=1699964766; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jft9oGCgqyG/kQiaCmJITBNqDZ3C+l2CeBQR+HBLqn0=;
 b=UcowPgP/HTxM3Vbu0CeK/G5jByMXPqsFy6ocomp4ketUt9eApDJsA9v/G/b3IQW2AO
 gL/1ZNwc6i2t0BSipnOS78AThuSCNq7jbHQLN7QwLA8Fj1U0Mru8wkuSo97bJwnL/5Rz
 9RUJ+w4zGRnyk2qREmqRXUg8XFJjt3wWXJkks0O2q83mqPTGDaG8++WD6QIHQ0qvWKk5
 ssQzEt3n4t4GPMVA4n3tTxLZ0FjV1l61g3B5DWhtiASZrFQedMKLlQbiXrWk+P7ndm/x
 DpfutJrOzMKAgOtuvfiu80xn4eU3fVoaAmA2O3pA3er4gcflTZErCO1bb0bpeRYFLlYD
 wyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699359966; x=1699964766;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jft9oGCgqyG/kQiaCmJITBNqDZ3C+l2CeBQR+HBLqn0=;
 b=e3Nk76257UcQcOFJqXAhQoCUI4iDbHehlwdxiCbzt4EYH4cd/YT1hmuHa4kh60/FzA
 DNrErnCcfg27rdt5UTNPZXrX+FLWOHX/UY7VygOi6FmWobX1H8i2HEIYnF5UZB3NNeBw
 XjopMiaVQqjo3oyp6s8SvPGZhi1vlzaSaJjP8kup/OkC43DcMFvYmXq68Kt340WvXf0/
 RtA6lPB75jw87Zti6SWdDp/U5dFOAJMvJgJqdXrJkwdEy1aMD9Bpu1HOBSIBoLwYe3nq
 aoqzPd8g1UFPR2s7vCSy+tdCzVYYatq7okAKubwfR9asNn9cKGTbNcqrDljlD07Hewx4
 RWng==
X-Gm-Message-State: AOJu0YwKb3O0pv0o4SUMmg29UcZWk0nWIP+u3R6pHx5l+DXO4661Vu5H
 8yLrLPGYcNs/TFbtOgHpDvorcg==
X-Google-Smtp-Source: AGHT+IFLIxHMjLr/iZek67gx5lWhbT5iuNpNw9fB1473FwcwSj4RPE3c+cu2gcPlPpE5LtOiYUC6VQ==
X-Received: by 2002:a17:907:c784:b0:9da:e694:e6a2 with SMTP id
 tz4-20020a170907c78400b009dae694e6a2mr15534129ejc.4.1699359966525; 
 Tue, 07 Nov 2023 04:26:06 -0800 (PST)
Received: from m1x-phil.lan ([176.187.216.69])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a170906355600b009dd7bc622fbsm992734eja.113.2023.11.07.04.26.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Nov 2023 04:26:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Bin Meng <bin.meng@windriver.com>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>
Subject: [PULL 68/75] hw/sd: Declare QOM types using DEFINE_TYPES() macro
Date: Tue,  7 Nov 2023 13:24:38 +0100
Message-ID: <20231107122442.58674-14-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231107122442.58674-1-philmd@linaro.org>
References: <20231107122442.58674-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62b.google.com
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

When multiple QOM types are registered in the same file,
it is simpler to use the the DEFINE_TYPES() macro. In
particular because type array declared with such macro
are easier to review.

Mechanical transformation using the following comby script:

  [pattern-x1]
  match='''
  static const TypeInfo :[i1~.*_info] = {
      :[body]
  };
  static void :[rt1~.*_register_type.](void)
  {
      type_register_static(&:[i2~.*_info]);
  }
  type_init(:[rt2~.*_register_type.])
  '''
  rewrite='''
  static const TypeInfo :[i1][] = {
      {
      :[body]
      },
  };

  DEFINE_TYPES(:[i1])
  '''
  rule='where :[i1] == :[i2], :[rt1] == :[rt2]'

  [pattern-x2]
  match='''
  static const TypeInfo :[i1a~.*_info] = {
      :[body1]
  };
  ...
  static const TypeInfo :[i2a~.*_info] = {
      :[body2]
  };
  static void :[rt1~.*_register_type.](void)
  {
      type_register_static(&:[i1b~.*_info]);
      type_register_static(&:[i2b~.*_info]);
  }
  type_init(:[rt2~.*_register_type.])
  '''
  rewrite='''
  static const TypeInfo :[i1a][] = {
      {
      :[body1]
      },
      {
      :[body2]
      },
  };

  DEFINE_TYPES(:[i1a])
  '''
  rule='''
  where
  :[i1a] == :[i1b],
  :[i2a] == :[i2b],
  :[rt1] == :[rt2]
  '''

and re-indented manually.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20231031080603.86889-2-philmd@linaro.org>
---
 hw/sd/aspeed_sdhci.c   | 19 ++++++++-----------
 hw/sd/bcm2835_sdhost.c | 33 ++++++++++++++-------------------
 hw/sd/cadence_sdhci.c  | 21 +++++++++------------
 hw/sd/core.c           | 19 ++++++++-----------
 hw/sd/npcm7xx_sdhci.c  | 21 +++++++++------------
 hw/sd/pl181.c          | 35 +++++++++++++++--------------------
 hw/sd/pxa2xx_mmci.c    | 35 +++++++++++++++--------------------
 hw/sd/sd.c             | 37 ++++++++++++++++---------------------
 hw/sd/sdhci-pci.c      | 25 +++++++++++--------------
 hw/sd/ssi-sd.c         | 19 ++++++++-----------
 10 files changed, 113 insertions(+), 151 deletions(-)

diff --git a/hw/sd/aspeed_sdhci.c b/hw/sd/aspeed_sdhci.c
index be8cafd65f..e53206d959 100644
--- a/hw/sd/aspeed_sdhci.c
+++ b/hw/sd/aspeed_sdhci.c
@@ -198,16 +198,13 @@ static void aspeed_sdhci_class_init(ObjectClass *classp, void *data)
     device_class_set_props(dc, aspeed_sdhci_properties);
 }
 
-static const TypeInfo aspeed_sdhci_info = {
-    .name          = TYPE_ASPEED_SDHCI,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(AspeedSDHCIState),
-    .class_init    = aspeed_sdhci_class_init,
+static const TypeInfo aspeed_sdhci_types[] = {
+    {
+        .name           = TYPE_ASPEED_SDHCI,
+        .parent         = TYPE_SYS_BUS_DEVICE,
+        .instance_size  = sizeof(AspeedSDHCIState),
+        .class_init     = aspeed_sdhci_class_init,
+    },
 };
 
-static void aspeed_sdhci_register_types(void)
-{
-    type_register_static(&aspeed_sdhci_info);
-}
-
-type_init(aspeed_sdhci_register_types)
+DEFINE_TYPES(aspeed_sdhci_types)
diff --git a/hw/sd/bcm2835_sdhost.c b/hw/sd/bcm2835_sdhost.c
index 9431c35914..a600cf39e2 100644
--- a/hw/sd/bcm2835_sdhost.c
+++ b/hw/sd/bcm2835_sdhost.c
@@ -436,24 +436,19 @@ static void bcm2835_sdhost_class_init(ObjectClass *klass, void *data)
     dc->vmsd = &vmstate_bcm2835_sdhost;
 }
 
-static const TypeInfo bcm2835_sdhost_info = {
-    .name          = TYPE_BCM2835_SDHOST,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(BCM2835SDHostState),
-    .class_init    = bcm2835_sdhost_class_init,
-    .instance_init = bcm2835_sdhost_init,
+static const TypeInfo bcm2835_sdhost_types[] = {
+    {
+        .name           = TYPE_BCM2835_SDHOST,
+        .parent         = TYPE_SYS_BUS_DEVICE,
+        .instance_size  = sizeof(BCM2835SDHostState),
+        .class_init     = bcm2835_sdhost_class_init,
+        .instance_init  = bcm2835_sdhost_init,
+    },
+    {
+        .name           = TYPE_BCM2835_SDHOST_BUS,
+        .parent         = TYPE_SD_BUS,
+        .instance_size  = sizeof(SDBus),
+    },
 };
 
-static const TypeInfo bcm2835_sdhost_bus_info = {
-    .name = TYPE_BCM2835_SDHOST_BUS,
-    .parent = TYPE_SD_BUS,
-    .instance_size = sizeof(SDBus),
-};
-
-static void bcm2835_sdhost_register_types(void)
-{
-    type_register_static(&bcm2835_sdhost_info);
-    type_register_static(&bcm2835_sdhost_bus_info);
-}
-
-type_init(bcm2835_sdhost_register_types)
+DEFINE_TYPES(bcm2835_sdhost_types)
diff --git a/hw/sd/cadence_sdhci.c b/hw/sd/cadence_sdhci.c
index 75db34befe..ef4e0d74e3 100644
--- a/hw/sd/cadence_sdhci.c
+++ b/hw/sd/cadence_sdhci.c
@@ -175,17 +175,14 @@ static void cadence_sdhci_class_init(ObjectClass *classp, void *data)
     dc->vmsd = &vmstate_cadence_sdhci;
 }
 
-static const TypeInfo cadence_sdhci_info = {
-    .name          = TYPE_CADENCE_SDHCI,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(CadenceSDHCIState),
-    .instance_init = cadence_sdhci_instance_init,
-    .class_init    = cadence_sdhci_class_init,
+static const TypeInfo cadence_sdhci_types[] = {
+    {
+        .name           = TYPE_CADENCE_SDHCI,
+        .parent         = TYPE_SYS_BUS_DEVICE,
+        .instance_size  = sizeof(CadenceSDHCIState),
+        .instance_init  = cadence_sdhci_instance_init,
+        .class_init     = cadence_sdhci_class_init,
+    },
 };
 
-static void cadence_sdhci_register_types(void)
-{
-    type_register_static(&cadence_sdhci_info);
-}
-
-type_init(cadence_sdhci_register_types)
+DEFINE_TYPES(cadence_sdhci_types)
diff --git a/hw/sd/core.c b/hw/sd/core.c
index 30ee62c510..52d5d90045 100644
--- a/hw/sd/core.c
+++ b/hw/sd/core.c
@@ -259,16 +259,13 @@ void sdbus_reparent_card(SDBus *from, SDBus *to)
     sdbus_set_readonly(to, readonly);
 }
 
-static const TypeInfo sd_bus_info = {
-    .name = TYPE_SD_BUS,
-    .parent = TYPE_BUS,
-    .instance_size = sizeof(SDBus),
-    .class_size = sizeof(SDBusClass),
+static const TypeInfo sd_bus_types[] = {
+    {
+        .name           = TYPE_SD_BUS,
+        .parent         = TYPE_BUS,
+        .instance_size  = sizeof(SDBus),
+        .class_size     = sizeof(SDBusClass),
+    },
 };
 
-static void sd_bus_register_types(void)
-{
-    type_register_static(&sd_bus_info);
-}
-
-type_init(sd_bus_register_types)
+DEFINE_TYPES(sd_bus_types)
diff --git a/hw/sd/npcm7xx_sdhci.c b/hw/sd/npcm7xx_sdhci.c
index b2f5b4a542..9958680090 100644
--- a/hw/sd/npcm7xx_sdhci.c
+++ b/hw/sd/npcm7xx_sdhci.c
@@ -166,17 +166,14 @@ static void npcm7xx_sdhci_instance_init(Object *obj)
                             TYPE_SYSBUS_SDHCI);
 }
 
-static const TypeInfo npcm7xx_sdhci_info = {
-    .name = TYPE_NPCM7XX_SDHCI,
-    .parent = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(NPCM7xxSDHCIState),
-    .instance_init = npcm7xx_sdhci_instance_init,
-    .class_init = npcm7xx_sdhci_class_init,
+static const TypeInfo npcm7xx_sdhci_types[] = {
+    {
+        .name           = TYPE_NPCM7XX_SDHCI,
+        .parent         = TYPE_SYS_BUS_DEVICE,
+        .instance_size  = sizeof(NPCM7xxSDHCIState),
+        .instance_init  = npcm7xx_sdhci_instance_init,
+        .class_init     = npcm7xx_sdhci_class_init,
+    },
 };
 
-static void npcm7xx_sdhci_register_types(void)
-{
-    type_register_static(&npcm7xx_sdhci_info);
-}
-
-type_init(npcm7xx_sdhci_register_types)
+DEFINE_TYPES(npcm7xx_sdhci_types)
diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
index 5e554bd467..2b33814d83 100644
--- a/hw/sd/pl181.c
+++ b/hw/sd/pl181.c
@@ -519,14 +519,6 @@ static void pl181_class_init(ObjectClass *klass, void *data)
     k->user_creatable = false;
 }
 
-static const TypeInfo pl181_info = {
-    .name          = TYPE_PL181,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(PL181State),
-    .instance_init = pl181_init,
-    .class_init    = pl181_class_init,
-};
-
 static void pl181_bus_class_init(ObjectClass *klass, void *data)
 {
     SDBusClass *sbc = SD_BUS_CLASS(klass);
@@ -535,17 +527,20 @@ static void pl181_bus_class_init(ObjectClass *klass, void *data)
     sbc->set_readonly = pl181_set_readonly;
 }
 
-static const TypeInfo pl181_bus_info = {
-    .name = TYPE_PL181_BUS,
-    .parent = TYPE_SD_BUS,
-    .instance_size = sizeof(SDBus),
-    .class_init = pl181_bus_class_init,
+static const TypeInfo pl181_info[] = {
+    {
+        .name           = TYPE_PL181,
+        .parent         = TYPE_SYS_BUS_DEVICE,
+        .instance_size  = sizeof(PL181State),
+        .instance_init  = pl181_init,
+        .class_init     = pl181_class_init,
+    },
+    {
+        .name           = TYPE_PL181_BUS,
+        .parent         = TYPE_SD_BUS,
+        .instance_size  = sizeof(SDBus),
+        .class_init     = pl181_bus_class_init,
+    },
 };
 
-static void pl181_register_types(void)
-{
-    type_register_static(&pl181_info);
-    type_register_static(&pl181_bus_info);
-}
-
-type_init(pl181_register_types)
+DEFINE_TYPES(pl181_info)
diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index 4749e935d8..5e8ea69188 100644
--- a/hw/sd/pxa2xx_mmci.c
+++ b/hw/sd/pxa2xx_mmci.c
@@ -575,25 +575,20 @@ static void pxa2xx_mmci_bus_class_init(ObjectClass *klass, void *data)
     sbc->set_readonly = pxa2xx_mmci_set_readonly;
 }
 
-static const TypeInfo pxa2xx_mmci_info = {
-    .name = TYPE_PXA2XX_MMCI,
-    .parent = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(PXA2xxMMCIState),
-    .instance_init = pxa2xx_mmci_instance_init,
-    .class_init = pxa2xx_mmci_class_init,
+static const TypeInfo pxa2xx_mmci_types[] = {
+    {
+        .name           = TYPE_PXA2XX_MMCI,
+        .parent         = TYPE_SYS_BUS_DEVICE,
+        .instance_size  = sizeof(PXA2xxMMCIState),
+        .instance_init  = pxa2xx_mmci_instance_init,
+        .class_init     = pxa2xx_mmci_class_init,
+    },
+    {
+        .name           = TYPE_PXA2XX_MMCI_BUS,
+        .parent         = TYPE_SD_BUS,
+        .instance_size  = sizeof(SDBus),
+        .class_init     = pxa2xx_mmci_bus_class_init,
+    },
 };
 
-static const TypeInfo pxa2xx_mmci_bus_info = {
-    .name = TYPE_PXA2XX_MMCI_BUS,
-    .parent = TYPE_SD_BUS,
-    .instance_size = sizeof(SDBus),
-    .class_init = pxa2xx_mmci_bus_class_init,
-};
-
-static void pxa2xx_mmci_register_types(void)
-{
-    type_register_static(&pxa2xx_mmci_info);
-    type_register_static(&pxa2xx_mmci_bus_info);
-}
-
-type_init(pxa2xx_mmci_register_types)
+DEFINE_TYPES(pxa2xx_mmci_types)
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 4823befdef..1106ff7d78 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -2278,16 +2278,6 @@ static void sd_class_init(ObjectClass *klass, void *data)
     sc->proto = &sd_proto_sd;
 }
 
-static const TypeInfo sd_info = {
-    .name = TYPE_SD_CARD,
-    .parent = TYPE_DEVICE,
-    .instance_size = sizeof(SDState),
-    .class_size = sizeof(SDCardClass),
-    .class_init = sd_class_init,
-    .instance_init = sd_instance_init,
-    .instance_finalize = sd_instance_finalize,
-};
-
 /*
  * We do not model the chip select pin, so allow the board to select
  * whether card should be in SSI or MMC/SD mode.  It is also up to the
@@ -2303,16 +2293,21 @@ static void sd_spi_class_init(ObjectClass *klass, void *data)
     sc->proto = &sd_proto_spi;
 }
 
-static const TypeInfo sd_spi_info = {
-    .name = TYPE_SD_CARD_SPI,
-    .parent = TYPE_SD_CARD,
-    .class_init = sd_spi_class_init,
+static const TypeInfo sd_types[] = {
+    {
+        .name           = TYPE_SD_CARD,
+        .parent         = TYPE_DEVICE,
+        .instance_size  = sizeof(SDState),
+        .class_size     = sizeof(SDCardClass),
+        .class_init     = sd_class_init,
+        .instance_init  = sd_instance_init,
+        .instance_finalize = sd_instance_finalize,
+    },
+    {
+        .name           = TYPE_SD_CARD_SPI,
+        .parent         = TYPE_SD_CARD,
+        .class_init     = sd_spi_class_init,
+    },
 };
 
-static void sd_register_types(void)
-{
-    type_register_static(&sd_info);
-    type_register_static(&sd_spi_info);
-}
-
-type_init(sd_register_types)
+DEFINE_TYPES(sd_types)
diff --git a/hw/sd/sdhci-pci.c b/hw/sd/sdhci-pci.c
index c737c8b930..9b7bee8b3f 100644
--- a/hw/sd/sdhci-pci.c
+++ b/hw/sd/sdhci-pci.c
@@ -68,20 +68,17 @@ static void sdhci_pci_class_init(ObjectClass *klass, void *data)
     sdhci_common_class_init(klass, data);
 }
 
-static const TypeInfo sdhci_pci_info = {
-    .name = TYPE_PCI_SDHCI,
-    .parent = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(SDHCIState),
-    .class_init = sdhci_pci_class_init,
-    .interfaces = (InterfaceInfo[]) {
-        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-        { },
+static const TypeInfo sdhci_pci_types[] = {
+    {
+        .name           = TYPE_PCI_SDHCI,
+        .parent         = TYPE_PCI_DEVICE,
+        .instance_size  = sizeof(SDHCIState),
+        .class_init     = sdhci_pci_class_init,
+        .interfaces     = (InterfaceInfo[]) {
+            { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+            { },
+        },
     },
 };
 
-static void sdhci_pci_register_type(void)
-{
-    type_register_static(&sdhci_pci_info);
-}
-
-type_init(sdhci_pci_register_type)
+DEFINE_TYPES(sdhci_pci_types)
diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 167c03b780..a6cc1ad6c8 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -403,16 +403,13 @@ static void ssi_sd_class_init(ObjectClass *klass, void *data)
     dc->user_creatable = false;
 }
 
-static const TypeInfo ssi_sd_info = {
-    .name          = TYPE_SSI_SD,
-    .parent        = TYPE_SSI_PERIPHERAL,
-    .instance_size = sizeof(ssi_sd_state),
-    .class_init    = ssi_sd_class_init,
+static const TypeInfo ssi_sd_types[] = {
+    {
+        .name           = TYPE_SSI_SD,
+        .parent         = TYPE_SSI_PERIPHERAL,
+        .instance_size  = sizeof(ssi_sd_state),
+        .class_init     = ssi_sd_class_init,
+    },
 };
 
-static void ssi_sd_register_types(void)
-{
-    type_register_static(&ssi_sd_info);
-}
-
-type_init(ssi_sd_register_types)
+DEFINE_TYPES(ssi_sd_types)
-- 
2.41.0


