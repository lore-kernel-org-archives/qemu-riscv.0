Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEEEC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:48:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmQG-0007aV-01; Fri, 05 Jan 2024 10:47:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmPQ-0004Kx-TU
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:46:58 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmPE-0003wq-Ln
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:46:54 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40d87df95ddso14926175e9.0
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469602; x=1705074402; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=igqP4AsDHHqLX93X0pavaFsHsYcJ7nUJnv89zKZWOB0=;
 b=QC17MOec52OREMZe7sLa+OQlzzPWdGrwnn2BHI79sZdQg75ddLDVYhdyOkO55H+fqR
 P6I1MwOJT3kTfFqDV4pAyWdJ/HIsWHVnFXhP+2McFPXL9PbXK7lqAcAnVjM+a+LYiSYz
 4pOH90fuXbOorBshUxXXgucOFjS43vnkzIZBaizo2N0y28w0Ji+7fHwkQjUWSbEPZ4pY
 aBN9ekRa4WKi+Rkhb6YNsb8yodjolTCUI6o/lNf/HmnL7KbmhYxf0VxVPWT71VDOiQPl
 dkc10bgW/j2L9aCi1y4rnbFfRxvIIeTS/0dtp3eEp2PCPhn6DVQlOz2P8KKYqBn54ki9
 YhlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469602; x=1705074402;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=igqP4AsDHHqLX93X0pavaFsHsYcJ7nUJnv89zKZWOB0=;
 b=MT1PyUQufaE7kcVIc9NtniA8yXfCQFiMqU+wbzmHDzCtjiFuXpBDnKclLhfU+4JXPW
 Jb1nbZfT1q9VtpJ3zR9LmagFPlcdV+c2Xw0ZItrF8Mmse/nC57LB2cA4o4leBiI14j+v
 Ja/KIvT2oNJXuBCTIluEbbbgf5KWEIHRkVWv0q4MgzYgjuASV9pLNaiQMG4DPVoEr314
 OzqGITNBrGYVrBjtonCHYQpDvAAXytc8ln+FCZVGE/dmhXRMR3JKdmOCOGPEsxwpxfZt
 AIIyGObhLrUDRtPUIzK+JkDOzVJxA53mGsCc9U1d4GJjvki6/2V3nUrvu4DPWFwe3Fb6
 MGng==
X-Gm-Message-State: AOJu0YyTo3cBC8P5lguUvIhtVCuQyk0WLVLYtSEDrQuX/G7SEqz9Hm6R
 UHceVymfw2k8Ou+ChSb+564rulY24d6LhQ==
X-Google-Smtp-Source: AGHT+IHTMgqkL3WkZWOrmm2ZX9vV7noWtpW91jR2J/NgNkouKS0hp0ofZryj55RklowzXmYAOHzLjA==
X-Received: by 2002:a05:600c:3798:b0:40d:81c1:186 with SMTP id
 o24-20020a05600c379800b0040d81c10186mr664385wmr.155.1704469602022; 
 Fri, 05 Jan 2024 07:46:42 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 t11-20020a05600c450b00b0040d724896cbsm1936432wmo.18.2024.01.05.07.46.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:46:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Gavin Shan <gshan@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>
Subject: [PULL 31/71] hw/arm: Check CPU type in machine_run_board_init()
Date: Fri,  5 Jan 2024 16:42:24 +0100
Message-ID: <20240105154307.21385-32-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

From: Gavin Shan <gshan@redhat.com>

Set mc->valid_cpu_types so that the user specified CPU type can
be validated in machine_run_board_init(). We needn't to do it by
ourselves.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231204004726.483558-9-gshan@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/bananapi_m2u.c   | 12 ++++++------
 hw/arm/cubieboard.c     | 12 ++++++------
 hw/arm/mps2-tz.c        | 26 ++++++++++++++++++++------
 hw/arm/mps2.c           | 26 ++++++++++++++++++++------
 hw/arm/msf2-som.c       | 12 ++++++------
 hw/arm/musca.c          | 12 +++++-------
 hw/arm/npcm7xx_boards.c | 12 +++++-------
 hw/arm/orangepi.c       | 12 ++++++------
 8 files changed, 74 insertions(+), 50 deletions(-)

diff --git a/hw/arm/bananapi_m2u.c b/hw/arm/bananapi_m2u.c
index 8f24b18d8c..0a4b6f29b1 100644
--- a/hw/arm/bananapi_m2u.c
+++ b/hw/arm/bananapi_m2u.c
@@ -71,12 +71,6 @@ static void bpim2u_init(MachineState *machine)
         exit(1);
     }
 
-    /* Only allow Cortex-A7 for this board */
-    if (strcmp(machine->cpu_type, ARM_CPU_TYPE_NAME("cortex-a7")) != 0) {
-        error_report("This board can only be used with cortex-a7 CPU");
-        exit(1);
-    }
-
     r40 = AW_R40(object_new(TYPE_AW_R40));
     object_property_add_child(OBJECT(machine), "soc", OBJECT(r40));
     object_unref(OBJECT(r40));
@@ -133,12 +127,18 @@ static void bpim2u_init(MachineState *machine)
 
 static void bpim2u_machine_init(MachineClass *mc)
 {
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-a7"),
+        NULL
+    };
+
     mc->desc = "Bananapi M2U (Cortex-A7)";
     mc->init = bpim2u_init;
     mc->min_cpus = AW_R40_NUM_CPUS;
     mc->max_cpus = AW_R40_NUM_CPUS;
     mc->default_cpus = AW_R40_NUM_CPUS;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a7");
+    mc->valid_cpu_types = valid_cpu_types;
     mc->default_ram_size = 1 * GiB;
     mc->default_ram_id = "bpim2u.ram";
 }
diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
index 29146f5018..b976727eef 100644
--- a/hw/arm/cubieboard.c
+++ b/hw/arm/cubieboard.c
@@ -52,12 +52,6 @@ static void cubieboard_init(MachineState *machine)
         exit(1);
     }
 
-    /* Only allow Cortex-A8 for this board */
-    if (strcmp(machine->cpu_type, ARM_CPU_TYPE_NAME("cortex-a8")) != 0) {
-        error_report("This board can only be used with cortex-a8 CPU");
-        exit(1);
-    }
-
     a10 = AW_A10(object_new(TYPE_AW_A10));
     object_property_add_child(OBJECT(machine), "soc", OBJECT(a10));
     object_unref(OBJECT(a10));
@@ -114,8 +108,14 @@ static void cubieboard_init(MachineState *machine)
 
 static void cubieboard_machine_init(MachineClass *mc)
 {
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-a8"),
+        NULL
+    };
+
     mc->desc = "cubietech cubieboard (Cortex-A8)";
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a8");
+    mc->valid_cpu_types = valid_cpu_types;
     mc->default_ram_size = 1 * GiB;
     mc->init = cubieboard_init;
     mc->block_default_type = IF_IDE;
diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 668db5ed61..5d8cdc1a4c 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -813,12 +813,6 @@ static void mps2tz_common_init(MachineState *machine)
     int num_ppcs;
     int i;
 
-    if (strcmp(machine->cpu_type, mc->default_cpu_type) != 0) {
-        error_report("This board can only be used with CPU %s",
-                     mc->default_cpu_type);
-        exit(1);
-    }
-
     if (machine->ram_size != mc->default_ram_size) {
         char *sz = size_to_str(mc->default_ram_size);
         error_report("Invalid RAM size, should be %s", sz);
@@ -1318,6 +1312,10 @@ static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
     MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_CLASS(oc);
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-m33"),
+        NULL
+    };
 
     mc->desc = "ARM MPS2 with AN505 FPGA image for Cortex-M33";
     mc->default_cpus = 1;
@@ -1325,6 +1323,7 @@ static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = mc->default_cpus;
     mmc->fpga_type = FPGA_AN505;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
+    mc->valid_cpu_types = valid_cpu_types;
     mmc->scc_id = 0x41045050;
     mmc->sysclk_frq = 20 * 1000 * 1000; /* 20MHz */
     mmc->apb_periph_frq = mmc->sysclk_frq;
@@ -1347,6 +1346,10 @@ static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
     MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_CLASS(oc);
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-m33"),
+        NULL
+    };
 
     mc->desc = "ARM MPS2 with AN521 FPGA image for dual Cortex-M33";
     mc->default_cpus = 2;
@@ -1354,6 +1357,7 @@ static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = mc->default_cpus;
     mmc->fpga_type = FPGA_AN521;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
+    mc->valid_cpu_types = valid_cpu_types;
     mmc->scc_id = 0x41045210;
     mmc->sysclk_frq = 20 * 1000 * 1000; /* 20MHz */
     mmc->apb_periph_frq = mmc->sysclk_frq;
@@ -1376,6 +1380,10 @@ static void mps3tz_an524_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
     MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_CLASS(oc);
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-m33"),
+        NULL
+    };
 
     mc->desc = "ARM MPS3 with AN524 FPGA image for dual Cortex-M33";
     mc->default_cpus = 2;
@@ -1383,6 +1391,7 @@ static void mps3tz_an524_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = mc->default_cpus;
     mmc->fpga_type = FPGA_AN524;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
+    mc->valid_cpu_types = valid_cpu_types;
     mmc->scc_id = 0x41045240;
     mmc->sysclk_frq = 32 * 1000 * 1000; /* 32MHz */
     mmc->apb_periph_frq = mmc->sysclk_frq;
@@ -1410,6 +1419,10 @@ static void mps3tz_an547_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
     MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_CLASS(oc);
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-m55"),
+        NULL
+    };
 
     mc->desc = "ARM MPS3 with AN547 FPGA image for Cortex-M55";
     mc->default_cpus = 1;
@@ -1417,6 +1430,7 @@ static void mps3tz_an547_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = mc->default_cpus;
     mmc->fpga_type = FPGA_AN547;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m55");
+    mc->valid_cpu_types = valid_cpu_types;
     mmc->scc_id = 0x41055470;
     mmc->sysclk_frq = 32 * 1000 * 1000; /* 32MHz */
     mmc->apb_periph_frq = 25 * 1000 * 1000; /* 25MHz */
diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 292a180ad2..bd873cc5de 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -142,12 +142,6 @@ static void mps2_common_init(MachineState *machine)
     QList *oscclk;
     int i;
 
-    if (strcmp(machine->cpu_type, mc->default_cpu_type) != 0) {
-        error_report("This board can only be used with CPU %s",
-                     mc->default_cpu_type);
-        exit(1);
-    }
-
     if (machine->ram_size != mc->default_ram_size) {
         char *sz = size_to_str(mc->default_ram_size);
         error_report("Invalid RAM size, should be %s", sz);
@@ -484,10 +478,15 @@ static void mps2_an385_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
     MPS2MachineClass *mmc = MPS2_MACHINE_CLASS(oc);
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-m3"),
+        NULL
+    };
 
     mc->desc = "ARM MPS2 with AN385 FPGA image for Cortex-M3";
     mmc->fpga_type = FPGA_AN385;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m3");
+    mc->valid_cpu_types = valid_cpu_types;
     mmc->scc_id = 0x41043850;
     mmc->psram_base = 0x21000000;
     mmc->ethernet_base = 0x40200000;
@@ -498,10 +497,15 @@ static void mps2_an386_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
     MPS2MachineClass *mmc = MPS2_MACHINE_CLASS(oc);
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-m4"),
+        NULL
+    };
 
     mc->desc = "ARM MPS2 with AN386 FPGA image for Cortex-M4";
     mmc->fpga_type = FPGA_AN386;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m4");
+    mc->valid_cpu_types = valid_cpu_types;
     mmc->scc_id = 0x41043860;
     mmc->psram_base = 0x21000000;
     mmc->ethernet_base = 0x40200000;
@@ -512,10 +516,15 @@ static void mps2_an500_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
     MPS2MachineClass *mmc = MPS2_MACHINE_CLASS(oc);
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-m7"),
+        NULL
+    };
 
     mc->desc = "ARM MPS2 with AN500 FPGA image for Cortex-M7";
     mmc->fpga_type = FPGA_AN500;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m7");
+    mc->valid_cpu_types = valid_cpu_types;
     mmc->scc_id = 0x41045000;
     mmc->psram_base = 0x60000000;
     mmc->ethernet_base = 0xa0000000;
@@ -526,10 +535,15 @@ static void mps2_an511_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
     MPS2MachineClass *mmc = MPS2_MACHINE_CLASS(oc);
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-m3"),
+        NULL
+    };
 
     mc->desc = "ARM MPS2 with AN511 DesignStart FPGA image for Cortex-M3";
     mmc->fpga_type = FPGA_AN511;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m3");
+    mc->valid_cpu_types = valid_cpu_types;
     mmc->scc_id = 0x41045110;
     mmc->psram_base = 0x21000000;
     mmc->ethernet_base = 0x40200000;
diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
index 7b3106c790..eb74b23797 100644
--- a/hw/arm/msf2-som.c
+++ b/hw/arm/msf2-som.c
@@ -55,12 +55,6 @@ static void emcraft_sf2_s2s010_init(MachineState *machine)
     MemoryRegion *ddr = g_new(MemoryRegion, 1);
     Clock *m3clk;
 
-    if (strcmp(machine->cpu_type, mc->default_cpu_type) != 0) {
-        error_report("This board can only be used with CPU %s",
-                     mc->default_cpu_type);
-        exit(1);
-    }
-
     memory_region_init_ram(ddr, NULL, "ddr-ram", DDR_SIZE,
                            &error_fatal);
     memory_region_add_subregion(sysmem, DDR_BASE_ADDRESS, ddr);
@@ -106,9 +100,15 @@ static void emcraft_sf2_s2s010_init(MachineState *machine)
 
 static void emcraft_sf2_machine_init(MachineClass *mc)
 {
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-m3"),
+        NULL
+    };
+
     mc->desc = "SmartFusion2 SOM kit from Emcraft (M2S010)";
     mc->init = emcraft_sf2_s2s010_init;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m3");
+    mc->valid_cpu_types = valid_cpu_types;
 }
 
 DEFINE_MACHINE("emcraft-sf2", emcraft_sf2_machine_init)
diff --git a/hw/arm/musca.c b/hw/arm/musca.c
index 6eeee57c9d..770ec1a15c 100644
--- a/hw/arm/musca.c
+++ b/hw/arm/musca.c
@@ -355,7 +355,6 @@ static void musca_init(MachineState *machine)
 {
     MuscaMachineState *mms = MUSCA_MACHINE(machine);
     MuscaMachineClass *mmc = MUSCA_MACHINE_GET_CLASS(mms);
-    MachineClass *mc = MACHINE_GET_CLASS(machine);
     MemoryRegion *system_memory = get_system_memory();
     DeviceState *ssedev;
     DeviceState *dev_splitter;
@@ -366,12 +365,6 @@ static void musca_init(MachineState *machine)
     assert(mmc->num_irqs <= MUSCA_NUMIRQ_MAX);
     assert(mmc->num_mpcs <= MUSCA_MPC_MAX);
 
-    if (strcmp(machine->cpu_type, mc->default_cpu_type) != 0) {
-        error_report("This board can only be used with CPU %s",
-                     mc->default_cpu_type);
-        exit(1);
-    }
-
     mms->sysclk = clock_new(OBJECT(machine), "SYSCLK");
     clock_set_hz(mms->sysclk, SYSCLK_FRQ);
     mms->s32kclk = clock_new(OBJECT(machine), "S32KCLK");
@@ -604,11 +597,16 @@ static void musca_init(MachineState *machine)
 static void musca_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-m33"),
+        NULL
+    };
 
     mc->default_cpus = 2;
     mc->min_cpus = mc->default_cpus;
     mc->max_cpus = mc->default_cpus;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
+    mc->valid_cpu_types = valid_cpu_types;
     mc->init = musca_init;
 }
 
diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 2aef579aac..2999b8b96d 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -121,15 +121,8 @@ static NPCM7xxState *npcm7xx_create_soc(MachineState *machine,
                                         uint32_t hw_straps)
 {
     NPCM7xxMachineClass *nmc = NPCM7XX_MACHINE_GET_CLASS(machine);
-    MachineClass *mc = MACHINE_CLASS(nmc);
     Object *obj;
 
-    if (strcmp(machine->cpu_type, mc->default_cpu_type) != 0) {
-        error_report("This board can only be used with %s",
-                     mc->default_cpu_type);
-        exit(1);
-    }
-
     obj = object_new_with_props(nmc->soc_type, OBJECT(machine), "soc",
                                 &error_abort, NULL);
     object_property_set_uint(obj, "power-on-straps", hw_straps, &error_abort);
@@ -463,12 +456,17 @@ static void npcm7xx_set_soc_type(NPCM7xxMachineClass *nmc, const char *type)
 static void npcm7xx_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-a9"),
+        NULL
+    };
 
     mc->no_floppy = 1;
     mc->no_cdrom = 1;
     mc->no_parallel = 1;
     mc->default_ram_id = "ram";
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a9");
+    mc->valid_cpu_types = valid_cpu_types;
 }
 
 /*
diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
index f3784d45ca..77e328191d 100644
--- a/hw/arm/orangepi.c
+++ b/hw/arm/orangepi.c
@@ -49,12 +49,6 @@ static void orangepi_init(MachineState *machine)
         exit(1);
     }
 
-    /* Only allow Cortex-A7 for this board */
-    if (strcmp(machine->cpu_type, ARM_CPU_TYPE_NAME("cortex-a7")) != 0) {
-        error_report("This board can only be used with cortex-a7 CPU");
-        exit(1);
-    }
-
     h3 = AW_H3(object_new(TYPE_AW_H3));
     object_property_add_child(OBJECT(machine), "soc", OBJECT(h3));
     object_unref(OBJECT(h3));
@@ -111,6 +105,11 @@ static void orangepi_init(MachineState *machine)
 
 static void orangepi_machine_init(MachineClass *mc)
 {
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-a7"),
+        NULL
+    };
+
     mc->desc = "Orange Pi PC (Cortex-A7)";
     mc->init = orangepi_init;
     mc->block_default_type = IF_SD;
@@ -119,6 +118,7 @@ static void orangepi_machine_init(MachineClass *mc)
     mc->max_cpus = AW_H3_NUM_CPUS;
     mc->default_cpus = AW_H3_NUM_CPUS;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a7");
+    mc->valid_cpu_types = valid_cpu_types;
     mc->default_ram_size = 1 * GiB;
     mc->default_ram_id = "orangepi.ram";
 }
-- 
2.41.0


