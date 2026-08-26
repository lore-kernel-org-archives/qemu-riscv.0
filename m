Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D1DC61DC4
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 22:13:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzLr0-0001nn-Gc; Wed, 26 Aug 2026 18:12:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzLqw-0001nF-Rg
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 18:12:15 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzLqu-0006ZA-K4
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 18:12:14 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2d560775ca2so13099635ad.1
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 15:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787782331; x=1788387131; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OFYmGuYlL+4/TOCTKu3JsnhGO4Hq3PGwlVqkQXuCBNs=;
 b=RNXJNebNOyaMYFRWqSMNupOkf3+Dz2B09RSlOlB83yUqq8mlqXGWZcilXW1Y8PNpWu
 rBt9srSMblTGTthfCuoqug90HxvTiNTYr7iLYyhj1xkijKgTzI5bkLTG/G3Bc0HYV+hd
 ZKdn1xsgH1aKXj8x3V2sWYcVwH7PR9736bce+2mP/z0JJetxLaXKqcsPFcBd3m5g5ODa
 HSGmG/Lhn7YP1A4Ct2wf1c0wYQllsTs8Thp4ZR6FEZOvO1huR4/rtCGN6FuuIpj9KtBL
 p9wUhArMvgxDU46clRwUhR9jtSi9f1LU2Jc/zH/tlNqc6zom2diJDkMfqCOT+3RMTx/2
 leWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787782331; x=1788387131;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=OFYmGuYlL+4/TOCTKu3JsnhGO4Hq3PGwlVqkQXuCBNs=;
 b=mGnsK/XGs3MlSPOHawAUTQr8wnU3fHs5QY7e3vEm0rf5o34q+GFmhFvuNaC+aLUFrz
 NSBjP1mZxiDWINkh9Kuzyw31eUxThOrssIwMLZEsPRyAS2IQGUujYbIP1mYM4f4dvhpd
 3eNUGh+6BJ2wiyWSzB+qb2XNFXpBbGu/kSAcE1bR0c9FZ8e7+7IFZPhVyu7Pb/ZPEuz6
 4KYKV0QNp+vE0aoDP8MJ+6RklLuwOugJxdM+ru/qjEEFdwwe2bCoh73N6oqJtbRP4m5p
 RpQn9YYki4OAO7bTeuwh8ByxaQePtIATqJ6Yl0Jbyxz+X5Z7JjuAxm+E/NUOd/E61i1q
 I+Lg==
X-Forwarded-Encrypted: i=1;
 AHgh+RputQYjTNXigxGl+cIgHiDJeh1tAEmPvIotqc8jH1b/2/PXI+XJIeRoxcPXE3coQ0CdDbNWYSPuZOh3@nongnu.org
X-Gm-Message-State: AFuF++k8PPHVatFtM2Bm/u8o0LPSXr6J3bNWpa+z2GjT4GUuWsgKZ8Db
 xeeiSlRMwJRyR6rxI+gqthQDRVpNuS4CFKVULax8TovJmOMpZalm772r
X-Gm-Gg: AR+sD104EU8xaSUFHES2yY7Lg0h7cY9hio4fuWlBXg96r+mMfzhb7AKLOOAQm8HsDMQ
 gAH+k0TEkQhC409mkUZ8UykF1JhCof+uow4ZDQEu9Lxzr7NMt9y9hLCzrjCR4tfCjeDJKa9k/eg
 UvK2oxwKRTCg3sMOAGrrSYmaqfhkx1Sw/Esa2zEr4tiFO1BluDDewsMWXoku7/lj4QKdonfceID
 jJdJoq7BN/tzpQfs3Y5nYccej7TNLghxdQAUsBhnDCTw+Kj5+NvoivlUYqfLs8+K/r15hTOEc+M
 2q2oYj8lri1o3zpboQoEE9jKXefPlbQJYVD2qG//e3+FsogjXwld499JLCa9DTNEnXzLIyX+TtB
 ccUPfcAWsCcCcO9K2Uzd2EzB5ekIK5chs5ieAUy1GLUm5BKw+8xA2a6s2TGB0LyAYMnd98XPHBx
 HEBM+1Snc0SH/+BnRRFBJzpvQTsNJGydSRCVuLFkUsA5aXflccwBB8Gd+y5JqCUlkfYgw3Fgsif
 ntHHs50HyUbzuiHQj1ckCmZ5g63Xrs1Hf+DMAvWOBs3eZOjza0ESYIN3Wl5ev/WsuB2DL2cSwEq
 6zjSeUpLyf+Erqko2fzN
X-Received: by 2002:a17:90b:4e88:b0:37d:f983:7b5 with SMTP id
 98e67ed59e1d1-3966d3e1aa7mr23327682a91.9.1787782331001; 
 Wed, 26 Aug 2026 15:12:11 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-396b0d3d7fbsm17459a91.3.2026.08.26.15.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 15:12:10 -0700 (PDT)
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
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 09/16] hw/riscv/atlantis: Rename hart array 'soc' to 'cpus'
Date: Thu, 27 Aug 2026 07:41:45 +0930
Message-ID: <20260826221154.54577-1-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260826220528.54516-1-joel@jms.id.au>
References: <20260826220528.54516-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=joel.stan@gmail.com; helo=mail-pl1-x62b.google.com
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
index 127c89be4f60..35b3be072a06 100644
--- a/hw/riscv/tt_atlantis.c
+++ b/hw/riscv/tt_atlantis.c
@@ -112,13 +112,13 @@ static void create_fdt_aclint(TTAtlantisState *s, uint32_t *intc_phandles)
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
 
@@ -210,7 +210,7 @@ static void create_fdt_pmu(TTAtlantisState *s)
 {
     char pmu_name[] = "/pmu";
     void *fdt = MACHINE(s)->fdt;
-    RISCVCPU *hart = &s->soc.harts[0];
+    RISCVCPU *hart = &s->cpus.harts[0];
 
     qemu_fdt_add_subnode(fdt, pmu_name);
     qemu_fdt_setprop_string(fdt, pmu_name, "compatible", "riscv,pmu");
@@ -227,8 +227,8 @@ static void create_fdt_cpu(TTAtlantisState *s, const MemMapEntry *memmap,
 
     fdt_create_cpu_socket_subnode(fdt, TT_ACLINT_TIMEBASE_FREQ);
 
-    create_fdt_socket_cpus(fdt, s->soc.harts, 0, s->soc.num_harts,
-                           s->soc.hartid_base, &fdt_phandle, intc_phandles,
+    create_fdt_socket_cpus(fdt, s->cpus.harts, 0, s->cpus.num_harts,
+                           s->cpus.hartid_base, &fdt_phandle, intc_phandles,
                            false, false);
 
     create_fdt_memory(s);
@@ -252,13 +252,13 @@ static void create_fdt_cpu(TTAtlantisState *s, const MemMapEntry *memmap,
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
@@ -429,7 +429,7 @@ static void tt_atlantis_machine_done(Notifier *notifier, void *data)
     hwaddr start_addr = s->memmap[TT_ATL_DDR_LO].base;
     hwaddr mem_size;
     target_ulong firmware_end_addr, kernel_start_addr;
-    const char *firmware_name = riscv_default_firmware_name(&s->soc);
+    const char *firmware_name = riscv_default_firmware_name(&s->cpus);
     uint64_t fdt_load_addr;
     uint64_t kernel_entry;
     RISCVBootInfo boot_info;
@@ -446,7 +446,7 @@ static void tt_atlantis_machine_done(Notifier *notifier, void *data)
     if (mem_size > s->memmap[TT_ATL_DDR_LO].size) {
         mem_size = s->memmap[TT_ATL_DDR_LO].size;
     }
-    riscv_boot_info_init_discontig_mem(&boot_info, &s->soc,
+    riscv_boot_info_init_discontig_mem(&boot_info, &s->cpus,
                                        s->memmap[TT_ATL_DDR_LO].base,
                                        mem_size);
 
@@ -476,7 +476,7 @@ static void tt_atlantis_machine_done(Notifier *notifier, void *data)
     riscv_load_fdt(fdt_load_addr, machine->fdt);
 
     /* load the reset vector */
-    riscv_setup_rom_reset_vec(machine, &s->soc, start_addr,
+    riscv_setup_rom_reset_vec(machine, &s->cpus, start_addr,
                               s->memmap[TT_ATL_BOOTROM].base,
                               s->memmap[TT_ATL_BOOTROM].size,
                               kernel_entry,
@@ -496,18 +496,18 @@ static void tt_atlantis_machine_init(MachineState *machine)
 
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


