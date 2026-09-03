Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32219C624D4
	for <qemu-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 05:54:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x20O5-0006ow-Nm; Thu, 03 Sep 2026 01:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x20Ny-0006kK-1u
 for qemu-riscv@nongnu.org; Thu, 03 Sep 2026 01:53:18 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x20Nw-0006Tn-8s
 for qemu-riscv@nongnu.org; Thu, 03 Sep 2026 01:53:17 -0400
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-ca97d139d5fso1836847a12.0
 for <qemu-riscv@nongnu.org>; Wed, 02 Sep 2026 22:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788414794; x=1789019594; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=qWmn3AlBJiBatFSAGPn5IZB+fcd5zMueThDsc6iFX24=;
 b=BgdSZj+qsMzSqAHAQyWQ2ZXYVDWOO0tKp+73MPjLDnU5Brt4vphI6ZTbGEgdYMxEv/
 VciIGnyy0j2SnxQYUgtUpoi5fxb2Z1Zt2VHQpwr01bCZo4CsrsZDhCpPY65SMnvayuUu
 t6j9FmVJHfFP0zw9yZeF/LgRs0GLm6qIbY7tECcmdYYxEzFtq065nl6LZxAbcEr/kRvg
 G1QLkhpSmsjqOvxDtA08+kX3eIIauxXjNFEBk/uGzxbVInXhm/w2NhqMGDUTng73dLuy
 knPL6iMpnfY6ygP2NiZkWi05yFZuiJf8TPbmUz5E4USKka+wTAFb/4joKpGMrq8A/pFC
 ZC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788414794; x=1789019594;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=qWmn3AlBJiBatFSAGPn5IZB+fcd5zMueThDsc6iFX24=;
 b=YDDAEbJh/RvID77uEAOu9sfnCxknNulgwKFBvX13ThijpG6LUR2fX+2WE+tgncgGT2
 T3BABpzOP8dIiFkdsDkVy30XxsTrcRzmnZUEJR606EokoB4h0b0Mc2UQe7LBaowFgNki
 V6EMl8QT8ANQq4WFVxXqEO9H4ePTgIpsRqk9vVUoVestSWlYqczyhpKPZxlmtm6ZZKbt
 kUaCVMLVP7TdxSuA4wov8ltqLj7bYEPTFnyvPXaeb6zU/Znx6469u1LrHKhVUxOcXSSX
 v1t99BONsGF/7KG41WEkfIQ2egpN7hfS7LbXjBb7mHrLRZUO3JbYFpLbulOyzOkqpoCT
 k5fQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwZDgrDAXyc9VhQchgLWcvO8L1fcVkn4f78Z9jmVAeJagrd4MxhjeBjrbcLy+LGLku7uVI8yMYrUysh@nongnu.org
X-Gm-Message-State: AFuF++m4AcrrL0am3uTChaL/xhcfkZ7cjvZf+PPxaEMMKcPzAChkMPah
 11K+lbB/xJ8BQqtwHbz8Sm5tfmmOh8OG0+seteyNZPwE1u8YtVsFWjW5
X-Gm-Gg: AYBFou3kotIObSliK1p8zXyu4EkDRxcSLn088orCs9Skrz9INoN1rlXqMOaCKp2wRvl
 L1IE/7djYXnWaiw+zz5pVFeOWTTq45M15fDXK4j+ZH9F5BtBxUwFp9Zcuum+6GCFeYMLvcfzbXT
 X77sx2KfoWGqZAfovYyQyQ2WbSFT+T9K1IgG7AK2FuEdHggl3LN4k16WlONGFEecasl3BGP4eQA
 X+cR2A8lsxYhAn829s4TjdR8zQr8HTA7tFJaTw/BrNlAdyk6Lr2gNtWldMHqPtznqOrN7QORI44
 NAsh1OxpX1aDEsxdLSXUUuc9NKZMx3YLExdOI2UhUjYmRHZdodsef7k7NdD6QugtocyLahDncL9
 WqnpPYNX158jHlM+bqM9oWnjBqcKkxPzBg+fP2BSa5PiouhaEv0W90H5ie3iC6U8vi2DSafsGAD
 UQ6+JMgD3Vax5HAQEIfwDWHiIP/lUIHhlQi/cVZkftsCCglHnZF3yYVahU8bG83OBDoN3BieSex
 d9zmaIzCtipQtNyxtZetGsHIVZtsiPxMas7dXcTzMfla9xa+u2bftwSt5qsRZ5gjXOgG/NgNCEL
 OpcZIVDZD3Bls+Rp8QyM
X-Received: by 2002:a05:6a20:e211:b0:3d0:9164:98a7 with SMTP id
 adf61e73a8af0-3d9ae0cbe20mr13604980637.11.1788414793907; 
 Wed, 02 Sep 2026 22:53:13 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1431990a39bsm2770619c88.3.2026.09.02.22.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 22:53:12 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 09/16] hw/riscv/atlantis: Rename hart array 'soc' to 'cpus'
Date: Thu,  3 Sep 2026 15:21:23 +0930
Message-ID: <20260903055131.257903-10-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260903055131.257903-1-joel@jms.id.au>
References: <20260903055131.257903-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=joel.stan@gmail.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The RISCVHartArrayState member is named soc, but it's an array of cpus,
not the entire SoC. Use cpus instead as an accurate description of the
hart array.

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 include/hw/riscv/tt_atlantis.h |  2 +-
 hw/riscv/tt_atlantis.c         | 34 +++++++++++++++++-----------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/include/hw/riscv/tt_atlantis.h b/include/hw/riscv/tt_atlantis.h
index d0cca3b02424..642490d21743 100644
--- a/include/hw/riscv/tt_atlantis.h
+++ b/include/hw/riscv/tt_atlantis.h
@@ -29,7 +29,7 @@ struct TTAtlantisState {
     Notifier machine_done;
     const MemMapEntry *memmap;
 
-    RISCVHartArrayState soc;
+    RISCVHartArrayState cpus;
     DeviceState *irqchip;
     DesignWareI2CState i2c[TT_ATL_NUM_I2C];
     UnimplementedDeviceState uart1;
diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
index 7d31294ea1fb..80300a18a4ab 100644
--- a/hw/riscv/tt_atlantis.c
+++ b/hw/riscv/tt_atlantis.c
@@ -113,13 +113,13 @@ static void create_fdt_aclint(TTAtlantisState *s, uint32_t *intc_phandles)
     uint32_t aclint_cells_size;
     hwaddr addr;
 
-    aclint_mtimer_cells = g_new0(uint32_t, s->soc.num_harts * 2);
+    aclint_mtimer_cells = g_new0(uint32_t, s->cpus.num_harts * 2);
 
-    for (int cpu = 0; cpu < s->soc.num_harts; cpu++) {
+    for (int cpu = 0; cpu < s->cpus.num_harts; cpu++) {
         aclint_mtimer_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
         aclint_mtimer_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_TIMER);
     }
-    aclint_cells_size = s->soc.num_harts * sizeof(uint32_t) * 2;
+    aclint_cells_size = s->cpus.num_harts * sizeof(uint32_t) * 2;
 
     addr = s->memmap[TT_ATL_ACLINT].base;
 
@@ -211,7 +211,7 @@ static void create_fdt_pmu(TTAtlantisState *s)
 {
     char pmu_name[] = "/pmu";
     void *fdt = MACHINE(s)->fdt;
-    RISCVCPU *hart = &s->soc.harts[0];
+    RISCVCPU *hart = &s->cpus.harts[0];
 
     qemu_fdt_add_subnode(fdt, pmu_name);
     qemu_fdt_setprop_string(fdt, pmu_name, "compatible", "riscv,pmu");
@@ -228,8 +228,8 @@ static void create_fdt_cpu(TTAtlantisState *s, const MemMapEntry *memmap,
 
     riscv_fdt_create_cpu_socket_subnode(fdt, TT_ACLINT_TIMEBASE_FREQ);
 
-    riscv_create_fdt_socket_cpus(fdt, s->soc.harts, 0, s->soc.num_harts,
-                                 s->soc.hartid_base, &fdt_phandle,
+    riscv_create_fdt_socket_cpus(fdt, s->cpus.harts, 0, s->cpus.num_harts,
+                                 s->cpus.hartid_base, &fdt_phandle,
                                  intc_phandles, false, false);
 
     create_fdt_memory(s);
@@ -253,13 +253,13 @@ static void create_fdt_cpu(TTAtlantisState *s, const MemMapEntry *memmap,
     create_fdt_one_aplic(fdt, &s->memmap[TT_ATL_MAPLIC],
                          msi_m_phandle, intc_phandles,
                          aplic_m_phandle, aplic_s_phandle,
-                         IRQ_M_EXT, s->soc.num_harts);
+                         IRQ_M_EXT, s->cpus.num_harts);
 
     /* S-level APLIC node */
     create_fdt_one_aplic(fdt, &s->memmap[TT_ATL_SAPLIC],
                          imsic_s_phandle, intc_phandles,
                          aplic_s_phandle, 0,
-                         IRQ_S_EXT, s->soc.num_harts);
+                         IRQ_S_EXT, s->cpus.num_harts);
 }
 
 static void create_fdt_uart(void *fdt, const MemMapEntry *mem, int irq,
@@ -430,7 +430,7 @@ static void tt_atlantis_machine_done(Notifier *notifier, void *data)
     hwaddr start_addr = s->memmap[TT_ATL_DDR_LO].base;
     hwaddr mem_size;
     target_ulong firmware_end_addr, kernel_start_addr;
-    const char *firmware_name = riscv_default_firmware_name(&s->soc);
+    const char *firmware_name = riscv_default_firmware_name(&s->cpus);
     uint64_t fdt_load_addr;
     uint64_t kernel_entry;
     RISCVBootInfo boot_info;
@@ -447,7 +447,7 @@ static void tt_atlantis_machine_done(Notifier *notifier, void *data)
     if (mem_size > s->memmap[TT_ATL_DDR_LO].size) {
         mem_size = s->memmap[TT_ATL_DDR_LO].size;
     }
-    riscv_boot_info_init_discontig_mem(&boot_info, &s->soc,
+    riscv_boot_info_init_discontig_mem(&boot_info, &s->cpus,
                                        s->memmap[TT_ATL_DDR_LO].base,
                                        mem_size);
 
@@ -477,7 +477,7 @@ static void tt_atlantis_machine_done(Notifier *notifier, void *data)
     riscv_load_fdt(fdt_load_addr, machine->fdt);
 
     /* load the reset vector */
-    riscv_setup_rom_reset_vec(machine, &s->soc, start_addr,
+    riscv_setup_rom_reset_vec(machine, &s->cpus, start_addr,
                               s->memmap[TT_ATL_BOOTROM].base,
                               s->memmap[TT_ATL_BOOTROM].size,
                               kernel_entry,
@@ -497,18 +497,18 @@ static void tt_atlantis_machine_init(MachineState *machine)
 
     s->memmap = tt_atlantis_memmap;
 
-    object_initialize_child(OBJECT(machine), "soc", &s->soc,
+    object_initialize_child(OBJECT(machine), "soc", &s->cpus,
                             TYPE_RISCV_HART_ARRAY);
-    object_property_set_str(OBJECT(&s->soc), "cpu-type", machine->cpu_type,
+    object_property_set_str(OBJECT(&s->cpus), "cpu-type", machine->cpu_type,
                             &error_abort);
-    object_property_set_int(OBJECT(&s->soc), "hartid-base", 0,
+    object_property_set_int(OBJECT(&s->cpus), "hartid-base", 0,
                             &error_abort);
-    object_property_set_int(OBJECT(&s->soc), "num-harts", hart_count,
+    object_property_set_int(OBJECT(&s->cpus), "num-harts", hart_count,
                             &error_abort);
-    object_property_set_int(OBJECT(&s->soc), "resetvec",
+    object_property_set_int(OBJECT(&s->cpus), "resetvec",
                             s->memmap[TT_ATL_BOOTROM].base,
                             &error_abort);
-    sysbus_realize(SYS_BUS_DEVICE(&s->soc), &error_fatal);
+    sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_fatal);
 
     s->irqchip = riscv_create_aia(system_memory,
                                   true, TT_IMSIC_GUESTS,
-- 
2.47.3


