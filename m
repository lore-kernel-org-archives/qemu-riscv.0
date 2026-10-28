Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A986A606A332
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 04:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=akttKAJl
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLvKa-0007Zk-R7; Wed, 28 Oct 2026 00:32:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xLvJx-0007TI-QG
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 00:31:30 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xLvJs-0001c0-UL
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 00:31:29 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-3ab2cb02816so75603a91.0
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 21:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1793161883; x=1793766683; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UdQw4dUn+e73+TidTK7+txv78IY3PStejWj48qw1h1o=;
 b=akttKAJllWc73PmX1spGUuGIXKw62ElZLabPG0gB43jk4Jk27sMmgQ/g7yalhra9KQ
 Vb5YiFl4D7MOLWnAEojxuhzpMiJFemQm9zOeXkIcXHH0tEGDWs/SkmR7YazGTvbzYTQ+
 T6L78BLGCkoqBzZWwezikQbTK6gPf3+ig4KFBF8QA2Ybo8efU1UY2cKhFS2kRMPU+pGT
 jnBY9ek7SQZ1C3dbC+FRtIt//j1kQntAlVhYLduXO8TSKOPR/PjTmBSzdJW258rWKwkG
 il8KbBmKbJbnyE8bwsTmNLMEkEw0nxyY+NFTMwmny1Z7pR7QOvFi7E+Opcy2vHRsah/g
 wl3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793161883; x=1793766683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=UdQw4dUn+e73+TidTK7+txv78IY3PStejWj48qw1h1o=;
 b=GaH6oXDQtnbMP/OtTSJq0Y5GKhhSaSM6MrZ7i4Dp1x3OBod2wuoVxhhGGGk+M3OKn3
 b2d5qDXjqGPkljb1KXZbh0OcrmXMc5NvRul/z+X6HP6GJIaRZUPzVCMyA336IC8ZFV7o
 r3Qo0AibEtytbvuYqAaEBN5LHxmPpuhDzQZxy7pifPVxabjHqvsdjvKDNwUo6nbDQngH
 vm68XT7tcCBDnbqBWLo6T88WzcdApugi5O9D2nj8MzxlyKlq3Un9MiTLF8vIJywRBfbT
 rIc+aecqNsaqCuM2wFp1le/Fctn9/3im/PXVOhurot4RSv0EP8V8UhiLQGmv3CcsR9bE
 kvxQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxuYPuU9P2CnUmq0sgPP9eScsA871ySPic1uVN1ApMN4PFXfoTS5cJBdmYRtos6gtvc/pzdRYDRM+KU@nongnu.org
X-Gm-Message-State: AFq9FYKwLnLZsg4d+4MERBZkq+7AL3Tp1ZWK97C6vnwb52ZUDeOl0mxd
 +2RkUjemat8E0G+HP2/FOnOQvGjub2meBpnF2mQCNedtLXv0DYDr3c1l1bP1gVcgJOg=
X-Gm-Gg: AYBFou1tXEYFZZZRU61+dYedYJ87aY5HgJ/gJYnbb8COfPor5OheM0vb6uk9Bakqgzi
 LwAEbobw6ClLDn4CqjuR8ACF/sjoLSKPElnUp9xw94tQ+Q7pggbQHxKaQF3buvPxUsJrmnIGLwb
 lxLXOsknLrNwVlPkiC+YYO71hZYtH9C93yEhipvJ7aTJ5cztJiXBoGVPWiJL/baZrQHX5tnxper
 NYJfF+jmrXWABR/FruwqF+WVSTK8T1T33S6UG3MPxfiRYKtWSMDrp4wv/I6Gw1b/7KyG9ABxCyw
 Q64RnV8m4zOOX3w8EjFhuEpZDgchY20qbWZ9SqUQX7cOx3TjWxprGMpDjhZWlZcfA7kDs00Fzj1
 OiwCMAC5E0mFn3GVUF3PrIusOiKUsmT4WGMtfxKutlZ4Ch8n+sCL+GzuR8JKD66KzFszffix3A+
 TDhYe3JqHSBZrCDlNLbOBz7NHS88Z9Q2BNXkuKOm5ZUHkNLlO3RyakJtd3ec7XZVRdNtkFE7Wwh
 GS/hxicCu1uu9o3Dosapkcubb3sSUNRMSyy/NvDs23p2fJalvzK+rrWLgIaZGFUhxy3ZCmKIWDW
 5K3R74qDw4/s/JnJB0aHloNr7VGW+iiQh89lMb4ACH6bkNXzbsFB5naJ1h0vavp7mizQ33f0D37
 qwcnVh/n8sP0ocBfVnbY6T4E=
X-Received: by 2002:a17:90b:6d0:b0:3a6:e1d1:e511 with SMTP id
 98e67ed59e1d1-3ae581402edmr1522500a91.4.1793161883520; 
 Tue, 27 Oct 2026 21:31:23 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([159.196.41.205])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3ae5a5d45a8sm1024470a91.17.2026.10.27.21.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 21:31:23 -0700 (PDT)
From: Portia Stephens <portias@oss.tenstorrent.com>
To: qemu-devel@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Chao Liu <chao.liu@processmission.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Michael Ellerman <mpe@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 Portia Stephens <portias@oss.tenstorrent.com>,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 02/10] hw/riscv/atlantis: Move Ascalon into cluster struct
Date: Wed, 28 Oct 2026 14:30:51 +1000
Message-ID: <20261028043059.600498-3-portias@oss.tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028043059.600498-1-portias@oss.tenstorrent.com>
References: <20261028043059.600498-1-portias@oss.tenstorrent.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=portias@tenstorrent.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Atlantis SoC has 3 CPU clusters of different CPU types and with
different memory views of the system; Ascalon, RCPU, and CPL. In preparation
for adding additional CPU clusters, move the Ascalon state information
into it's own device.

Signed-off-by: Portia Stephens <portias@oss.tenstorrent.com>
---
 hw/riscv/tt_atlantis.c         | 191 ++++++++++++++++++++-------------
 include/hw/riscv/tt_atlantis.h |  25 +++--
 2 files changed, 137 insertions(+), 79 deletions(-)

diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
index 25745998ad..7f9231e6ff 100644
--- a/hw/riscv/tt_atlantis.c
+++ b/hw/riscv/tt_atlantis.c
@@ -431,6 +431,7 @@ static void finalize_fdt(void *fdt, RISCVHartArrayState *harts,
 static void create_fdt(TTAtlantisState *ams)
 {
     MachineState *ms = MACHINE(ams);
+    TTAscalonClusterState *ac = &ams->soc.ascalon;
     int fdt_size = 0;
 
     ms->fdt = riscv_create_board_device_tree("Tenstorrent Atlantis RISC-V Machine",
@@ -442,12 +443,13 @@ static void create_fdt(TTAtlantisState *ams)
 
     qemu_fdt_add_subnode(ms->fdt, "/aliases");
 
-    create_fdt_pmu(ms->fdt, &ams->soc.cpus);
+    create_fdt_pmu(ms->fdt, &ac->cpus);
 }
 
 static void load_fdt(TTAtlantisState *ams)
 {
     MachineState *ms = MACHINE(ams);
+    TTAscalonClusterState *ac = &ams->soc.ascalon;
     char **node_path;
     Error *err = NULL;
     int fdt_size = 0;
@@ -473,18 +475,19 @@ static void load_fdt(TTAtlantisState *ams)
         g_strfreev(node_path);
     }
 
-    create_fdt_memory(ms->fdt, ams->soc.memmap, ms->ram_size);
+    create_fdt_memory(ms->fdt, ac->memmap, ms->ram_size);
 }
 
 static void tt_atlantis_machine_done(Notifier *n, void *data)
 {
     TTAtlantisState *ams = container_of(n, TTAtlantisState, machine_done);
     TTAtlantisSoCState *s = &ams->soc;
+    TTAscalonClusterState *ac = &s->ascalon;
     MachineState *machine = MACHINE(ams);
-    hwaddr start_addr = s->memmap[TT_ATL_DDR_LO].base;
+    hwaddr start_addr = ac->memmap[TT_ATL_DDR_LO].base;
     hwaddr mem_size;
     target_ulong firmware_end_addr, kernel_start_addr;
-    const char *firmware_name = riscv_default_firmware_name(&s->cpus);
+    const char *firmware_name = riscv_default_firmware_name(&ac->cpus);
     uint64_t fdt_load_addr;
     uint64_t kernel_entry;
     RISCVBootInfo boot_info;
@@ -494,15 +497,16 @@ static void tt_atlantis_machine_done(Notifier *n, void *data)
      * dynamic sysbus devices. Our FDT needs to be finalized.
      */
     if (machine->dtb == NULL) {
-        finalize_fdt(machine->fdt, &s->cpus, s->memmap, machine->ram_size);
+        finalize_fdt(machine->fdt, &ac->cpus, ac->memmap,
+                     machine->ram_size);
     }
 
     mem_size = machine->ram_size;
-    if (mem_size > s->memmap[TT_ATL_DDR_LO].size) {
-        mem_size = s->memmap[TT_ATL_DDR_LO].size;
+    if (mem_size > ac->memmap[TT_ATL_DDR_LO].size) {
+        mem_size = ac->memmap[TT_ATL_DDR_LO].size;
     }
-    riscv_boot_info_init_discontig_mem(&boot_info, &s->cpus,
-                                       s->memmap[TT_ATL_DDR_LO].base,
+    riscv_boot_info_init_discontig_mem(&boot_info, &ac->cpus,
+                                       ac->memmap[TT_ATL_DDR_LO].base,
                                        mem_size);
 
     firmware_end_addr = riscv_find_and_load_firmware(machine, &boot_info,
@@ -525,15 +529,15 @@ static void tt_atlantis_machine_done(Notifier *n, void *data)
         kernel_entry = kernel_start_addr;
     }
 
-    fdt_load_addr = riscv_compute_fdt_addr(s->memmap[TT_ATL_DDR_LO].base,
-                                           s->memmap[TT_ATL_DDR_LO].size,
+    fdt_load_addr = riscv_compute_fdt_addr(ac->memmap[TT_ATL_DDR_LO].base,
+                                           ac->memmap[TT_ATL_DDR_LO].size,
                                            machine, &boot_info);
     riscv_load_fdt(fdt_load_addr, machine->fdt);
 
     /* load the reset vector */
-    riscv_setup_rom_reset_vec(machine, &s->cpus, start_addr,
-                              s->memmap[TT_ATL_BOOTROM].base,
-                              s->memmap[TT_ATL_BOOTROM].size,
+    riscv_setup_rom_reset_vec(machine, &ac->cpus, start_addr,
+                              ac->memmap[TT_ATL_BOOTROM].base,
+                              ac->memmap[TT_ATL_BOOTROM].size,
                               kernel_entry,
                               fdt_load_addr);
 }
@@ -543,11 +547,69 @@ static inline int tt_atlantis_uart_index(int uart_dev)
     return uart_dev - TT_ATL_UART0;
 }
 
+static void tt_ascalon_cluster_init(Object *obj)
+{
+    TTAscalonClusterState *ac = TT_ASCALON_CLUSTER(obj);
+
+    object_initialize_child(obj, "cpus", &ac->cpus, TYPE_RISCV_HART_ARRAY);
+}
+
+static void tt_ascalon_cluster_realize(DeviceState *dev, Error **errp)
+{
+    TTAscalonClusterState *ac = TT_ASCALON_CLUSTER(dev);
+
+    if (!ac->memory) {
+        error_setg(errp, "'memory' link is not set");
+        return;
+    }
+    ac->memmap = tt_atlantis_memmap;
+
+    /* Boot ROM */
+    if (!memory_region_init_rom(&ac->bootrom, OBJECT(ac), "tt-atlantis.bootrom",
+                                ac->memmap[TT_ATL_BOOTROM].size, errp)) {
+        return;
+    }
+    memory_region_add_subregion(ac->memory, ac->memmap[TT_ATL_BOOTROM].base,
+                                &ac->bootrom);
+
+    /* CPUs */
+    object_property_set_str(OBJECT(&ac->cpus), "cpu-type", ac->cpu_type,
+                            &error_abort);
+    object_property_set_int(OBJECT(&ac->cpus), "hartid-base", 0,
+                            &error_abort);
+    object_property_set_int(OBJECT(&ac->cpus), "num-harts", ac->num_harts,
+                            &error_abort);
+    object_property_set_int(OBJECT(&ac->cpus), "resetvec",
+                            ac->memmap[TT_ATL_BOOTROM].base,
+                            &error_abort);
+    object_property_set_link(OBJECT(&ac->cpus), "memory",
+                             OBJECT(ac->memory),
+                             &error_abort);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&ac->cpus), errp)) {
+        return;
+    }
+}
+
+static const Property tt_ascalon_cluster_props[] = {
+    DEFINE_PROP_STRING("cpu-type", TTAscalonClusterState, cpu_type),
+    DEFINE_PROP_UINT32("num-harts", TTAscalonClusterState, num_harts, 8),
+    DEFINE_PROP_LINK("memory", TTAscalonClusterState, memory,
+                     TYPE_MEMORY_REGION, MemoryRegion *),
+};
+
+static void tt_ascalon_cluster_class_init(ObjectClass *oc, const void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = tt_ascalon_cluster_realize;
+    device_class_set_props(dc, tt_ascalon_cluster_props);
+}
+
 static void tt_atlantis_soc_init(Object *obj)
 {
     TTAtlantisSoCState *s = TT_ATLANTIS_SOC(obj);
 
-    object_initialize_child(obj, "cpus", &s->cpus, TYPE_RISCV_HART_ARRAY);
+    object_initialize_child(obj, "ascalon", &s->ascalon, TYPE_TT_ASCALON_CLUSTER);
 
     for (int i = 0; i < TT_ATL_NUM_UARTS; i++) {
         object_initialize_child(obj, "uart[*]", &s->uart[i],
@@ -576,52 +638,36 @@ static void tt_atlantis_soc_init(Object *obj)
 static void tt_atlantis_soc_realize(DeviceState *dev, Error **errp)
 {
     TTAtlantisSoCState *s = TT_ATLANTIS_SOC(dev);
+    TTAscalonClusterState *ac = &s->ascalon;
     ram_addr_t lo_ram_size, ram_size;
-    int hart_count = s->num_harts;
+    int hart_count = ac->num_harts;
 
-    if (!s->memory) {
-        error_setg(errp, "'memory' link is not set");
-        return;
-    }
     if (!s->dram) {
         error_setg(errp, "'dram' link is not set");
         return;
     }
-    ram_size = memory_region_size(s->dram);
-
-    s->memmap = tt_atlantis_memmap;
 
-    /* CPUs */
-    object_property_set_str(OBJECT(&s->cpus), "cpu-type", s->cpu_type,
-                            &error_abort);
-    object_property_set_int(OBJECT(&s->cpus), "hartid-base", 0,
-                            &error_abort);
-    object_property_set_int(OBJECT(&s->cpus), "num-harts", hart_count,
-                            &error_abort);
-    object_property_set_int(OBJECT(&s->cpus), "resetvec",
-                            s->memmap[TT_ATL_BOOTROM].base,
-                            &error_abort);
-    object_property_set_link(OBJECT(&s->cpus), "memory", OBJECT(s->memory),
-                             &error_abort);
-    if (!sysbus_realize(SYS_BUS_DEVICE(&s->cpus), errp)) {
+    if (!qdev_realize(DEVICE(&s->ascalon), NULL, errp)) {
         return;
     }
 
-    s->irqchip = riscv_create_aia(s->memory,
+    ram_size = memory_region_size(s->dram);
+
+    s->irqchip = riscv_create_aia(ac->memory,
                                   true, TT_IMSIC_GUESTS,
                                   TT_IMSIC_STRIDE,
                                   TT_IMSIC_STRIDE,
                                   TT_IRQCHIP_NUM_SOURCES,
-                                  &s->memmap[TT_ATL_MAPLIC],
-                                  &s->memmap[TT_ATL_SAPLIC],
-                                  &s->memmap[TT_ATL_MIMSIC],
-                                  &s->memmap[TT_ATL_SIMSIC],
+                                  &ac->memmap[TT_ATL_MAPLIC],
+                                  &ac->memmap[TT_ATL_SAPLIC],
+                                  &ac->memmap[TT_ATL_MIMSIC],
+                                  &ac->memmap[TT_ATL_SIMSIC],
                                   0, 0, hart_count,
                                   TT_IRQCHIP_NUM_MSIS,
                                   TT_IRQCHIP_NUM_PRIO_BITS);
 
-    riscv_aclint_mtimer_create(s->memory,
-            s->memmap[TT_ATL_ACLINT].base,
+    riscv_aclint_mtimer_create(ac->memory,
+            ac->memmap[TT_ATL_ACLINT].base,
             TT_ACLINT_MTIME_SIZE,
             0, hart_count,
             TT_ACLINT_MTIMECMP,
@@ -634,30 +680,22 @@ static void tt_atlantis_soc_realize(DeviceState *dev, Error **errp)
      * The high address is where RAM lives. It is always present and may be
      * up to 64GB. The low address is an alias of the first 2GB of that RAM.
      */
-    if (ram_size > s->memmap[TT_ATL_DDR_HI].size) {
-        g_autofree char *sz = size_to_str(s->memmap[TT_ATL_DDR_HI].size);
+    if (ram_size > ac->memmap[TT_ATL_DDR_HI].size) {
+        g_autofree char *sz = size_to_str(ac->memmap[TT_ATL_DDR_HI].size);
         error_setg(errp, "RAM size is too large, maximum is %s", sz);
         return;
     }
 
     memory_region_init_alias(&s->ram_hi, OBJECT(s), "ram.high", s->dram,
                              0, ram_size);
-    memory_region_add_subregion(s->memory,
-                                s->memmap[TT_ATL_DDR_HI].base, &s->ram_hi);
+    memory_region_add_subregion(ac->memory,
+                                ac->memmap[TT_ATL_DDR_HI].base, &s->ram_hi);
 
-    lo_ram_size = MIN(ram_size, s->memmap[TT_ATL_DDR_LO].size);
+    lo_ram_size = MIN(ram_size, ac->memmap[TT_ATL_DDR_LO].size);
     memory_region_init_alias(&s->ram_lo, OBJECT(s), "ram.low", s->dram,
                              0, lo_ram_size);
-    memory_region_add_subregion(s->memory,
-                                s->memmap[TT_ATL_DDR_LO].base, &s->ram_lo);
-
-    /* Boot ROM */
-    if (!memory_region_init_rom(&s->bootrom, OBJECT(s), "tt-atlantis.bootrom",
-                                s->memmap[TT_ATL_BOOTROM].size, errp)) {
-        return;
-    }
-    memory_region_add_subregion(s->memory, s->memmap[TT_ATL_BOOTROM].base,
-                                &s->bootrom);
+    memory_region_add_subregion(ac->memory,
+                                ac->memmap[TT_ATL_DDR_LO].base, &s->ram_lo);
 
     /* 4 PRCM blocks */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->prcm[TT_ATLANTIS_PRCM_DOMAIN_RCPU]),
@@ -665,7 +703,7 @@ static void tt_atlantis_soc_realize(DeviceState *dev, Error **errp)
         return;
     }
     memory_region_add_subregion(
-        s->memory, s->memmap[TT_ATL_PRCM_RCPU].base,
+        ac->memory, ac->memmap[TT_ATL_PRCM_RCPU].base,
         sysbus_mmio_get_region(
             SYS_BUS_DEVICE(&s->prcm[TT_ATLANTIS_PRCM_DOMAIN_RCPU]), 0));
 
@@ -674,7 +712,7 @@ static void tt_atlantis_soc_realize(DeviceState *dev, Error **errp)
         return;
     }
     memory_region_add_subregion(
-        s->memory, s->memmap[TT_ATL_PRCM_HSIO].base,
+        ac->memory, ac->memmap[TT_ATL_PRCM_HSIO].base,
         sysbus_mmio_get_region(
             SYS_BUS_DEVICE(&s->prcm[TT_ATLANTIS_PRCM_DOMAIN_HSIO]), 0));
 
@@ -683,7 +721,7 @@ static void tt_atlantis_soc_realize(DeviceState *dev, Error **errp)
         return;
     }
     memory_region_add_subregion(
-        s->memory, s->memmap[TT_ATL_PRCM_PCIE].base,
+        ac->memory, ac->memmap[TT_ATL_PRCM_PCIE].base,
         sysbus_mmio_get_region(
             SYS_BUS_DEVICE(&s->prcm[TT_ATLANTIS_PRCM_DOMAIN_PCIE]), 0));
 
@@ -692,7 +730,7 @@ static void tt_atlantis_soc_realize(DeviceState *dev, Error **errp)
         return;
     }
     memory_region_add_subregion(
-        s->memory, s->memmap[TT_ATL_PRCM_MM].base,
+        ac->memory, ac->memmap[TT_ATL_PRCM_MM].base,
         sysbus_mmio_get_region(
             SYS_BUS_DEVICE(&s->prcm[TT_ATLANTIS_PRCM_DOMAIN_MM]), 0));
 
@@ -706,8 +744,8 @@ static void tt_atlantis_soc_realize(DeviceState *dev, Error **errp)
             return;
         }
 
-        memory_region_add_subregion(s->memory,
-                                    s->memmap[TT_ATL_UART0 + i].base,
+        memory_region_add_subregion(ac->memory,
+                                    ac->memmap[TT_ATL_UART0 + i].base,
                                     sysbus_mmio_get_region(sbd, 0));
         sysbus_connect_irq(sbd, 0,
                            qdev_get_gpio_in(s->irqchip, TT_ATL_UART0_IRQ + i));
@@ -720,8 +758,8 @@ static void tt_atlantis_soc_realize(DeviceState *dev, Error **errp)
         if (!sysbus_realize(sbd, errp)) {
             return;
         }
-        memory_region_add_subregion(s->memory,
-                                    s->memmap[TT_ATL_I2C0 + i].base,
+        memory_region_add_subregion(ac->memory,
+                                    ac->memmap[TT_ATL_I2C0 + i].base,
                                     sysbus_mmio_get_region(sbd, 0));
         sysbus_connect_irq(sbd, 0,
                            qdev_get_gpio_in(s->irqchip, TT_ATL_I2C0_IRQ + i));
@@ -729,10 +767,6 @@ static void tt_atlantis_soc_realize(DeviceState *dev, Error **errp)
 }
 
 static const Property tt_atlantis_soc_props[] = {
-    DEFINE_PROP_STRING("cpu-type", TTAtlantisSoCState, cpu_type),
-    DEFINE_PROP_UINT32("num-harts", TTAtlantisSoCState, num_harts, 8),
-    DEFINE_PROP_LINK("memory", TTAtlantisSoCState, memory,
-                     TYPE_MEMORY_REGION, MemoryRegion *),
     DEFINE_PROP_LINK("dram", TTAtlantisSoCState, dram,
                      TYPE_MEMORY_REGION, MemoryRegion *),
 };
@@ -751,6 +785,7 @@ static void tt_atlantis_machine_init(MachineState *machine)
 {
     TTAtlantisState *ams = TT_ATLANTIS_MACHINE(machine);
     TTAtlantisSoCState *s = &ams->soc;
+    TTAscalonClusterState *ac = &s->ascalon;
 
     memory_region_init(&ams->soc_memory, OBJECT(machine),
                        "tt-atlantis.soc-memory", UINT64_MAX);
@@ -758,12 +793,16 @@ static void tt_atlantis_machine_init(MachineState *machine)
 
     object_initialize_child(OBJECT(machine), "soc", &ams->soc,
                             TYPE_TT_ATLANTIS_SOC);
-    object_property_set_str(OBJECT(&ams->soc), "cpu-type", machine->cpu_type,
+
+    /* User input machine properties, cpu_type and smp.cpus apply to Ascalon */
+    object_property_set_str(OBJECT(ac), "cpu-type",
+                            machine->cpu_type,
                             &error_abort);
-    object_property_set_int(OBJECT(&ams->soc), "num-harts", machine->smp.cpus,
+    object_property_set_int(OBJECT(ac), "num-harts",
+                            machine->smp.cpus,
                             &error_abort);
 
-    object_property_set_link(OBJECT(&ams->soc), "memory",
+    object_property_set_link(OBJECT(ac), "memory",
                              OBJECT(&ams->soc_memory), &error_abort);
     object_property_set_link(OBJECT(&ams->soc), "dram", OBJECT(machine->ram),
                              &error_abort);
@@ -802,6 +841,12 @@ static void tt_atlantis_machine_class_init(ObjectClass *oc, const void *data)
 
 static const TypeInfo tt_atlantis_types[] = {
     {
+        .name       = TYPE_TT_ASCALON_CLUSTER,
+        .parent     = TYPE_DEVICE,
+        .instance_size = sizeof(TTAscalonClusterState),
+        .instance_init = tt_ascalon_cluster_init,
+        .class_init = tt_ascalon_cluster_class_init,
+    }, {
         .name       = TYPE_TT_ATLANTIS_SOC,
         .parent     = TYPE_DEVICE,
         .instance_size = sizeof(TTAtlantisSoCState),
diff --git a/include/hw/riscv/tt_atlantis.h b/include/hw/riscv/tt_atlantis.h
index f965bf23fc..4e3d5d4b5f 100644
--- a/include/hw/riscv/tt_atlantis.h
+++ b/include/hw/riscv/tt_atlantis.h
@@ -23,11 +23,14 @@ OBJECT_DECLARE_SIMPLE_TYPE(TTAtlantisState, TT_ATLANTIS_MACHINE)
 #define TYPE_TT_ATLANTIS_SOC "tt-atlantis-soc"
 OBJECT_DECLARE_SIMPLE_TYPE(TTAtlantisSoCState, TT_ATLANTIS_SOC)
 
+#define TYPE_TT_ASCALON_CLUSTER "riscv.tt-ascalon-cluster"
+OBJECT_DECLARE_SIMPLE_TYPE(TTAscalonClusterState, TT_ASCALON_CLUSTER)
+
 #define TT_ATL_NUM_I2C 5
 #define TT_ATL_NUM_PRCM 4
 #define TT_ATL_NUM_UARTS 5
 
-struct TTAtlantisSoCState {
+struct TTAscalonClusterState {
     /*< private >*/
     DeviceState parent;
 
@@ -35,19 +38,29 @@ struct TTAtlantisSoCState {
     const MemMapEntry *memmap;
 
     MemoryRegion *memory;
+
+    RISCVHartArrayState cpus;
+    MemoryRegion bootrom;
+
+    uint32_t num_harts;
+    char *cpu_type;
+};
+
+struct TTAtlantisSoCState {
+    /*< private >*/
+    DeviceState parent;
+
+    /*< public >*/
+    TTAscalonClusterState ascalon;
+
     MemoryRegion *dram;
     MemoryRegion ram_hi;
     MemoryRegion ram_lo;
 
-    RISCVHartArrayState cpus;
     DeviceState *irqchip;
     DesignWareI2CState i2c[TT_ATL_NUM_I2C];
     DW8250State uart[TT_ATL_NUM_UARTS];
-    MemoryRegion bootrom;
     TTAtlantisPRCMState prcm[TT_ATL_NUM_PRCM];
-
-    uint32_t num_harts;
-    char *cpu_type;
 };
 
 struct TTAtlantisState {
-- 
2.43.0


