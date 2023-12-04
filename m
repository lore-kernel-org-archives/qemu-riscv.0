Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197D9C4167B
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 00:49:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r9x9F-0006YF-Dj; Sun, 03 Dec 2023 19:49:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r9x95-0006MY-5a
 for qemu-riscv@nongnu.org; Sun, 03 Dec 2023 19:49:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r9x8t-0001rh-Dl
 for qemu-riscv@nongnu.org; Sun, 03 Dec 2023 19:49:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701650938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:mime-version: content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JLiUCgwXtj6Utf2Ug+t9g0+q+oyiiqO7qitdLg4LXlw=;
 b=RW1tfbLJau2bbPi4NW5bJPi+ImUqn8SC4Ly7YRKgxIF4kAv3BVL/ACcuIUBraFrcK4dRFT
 n1LcLjZ2cyK3kCWqz7ny9h2AuM8lSIx1LhURMbXUGxnPvJzO89sx381AIlS3hRqgulOefO
 154mB37o8JvLITC0R9q9oDhCYaKEMLM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-606-knXx8Z2TOsmwHYaWdMAIKg-1; Sun,
 03 Dec 2023 19:48:56 -0500
X-MC-Unique: knXx8Z2TOsmwHYaWdMAIKg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BDF11C060EA;
 Mon,  4 Dec 2023 00:48:55 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 517DD492BE0;
 Mon,  4 Dec 2023 00:48:47 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, imammedo@redhat.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 armbru@redhat.com, wangyanan55@huawei.com, vijai@behindbytes.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
Subject: [PATCH v9 8/9] hw/arm: Check CPU type in machine_run_board_init()
Date: Mon,  4 Dec 2023 10:47:25 +1000
Message-ID: <20231204004726.483558-9-gshan@redhat.com>
In-Reply-To: <20231204004726.483558-1-gshan@redhat.com>
References: <20231204004726.483558-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Set mc->valid_cpu_types so that the user specified CPU type can
be validated in machine_run_board_init(). We needn't to do it by
ourselves.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
2.42.0


