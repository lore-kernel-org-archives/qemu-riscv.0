Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC46C61DD3
	for <qemu-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 05:54:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x20OD-0007LF-R6; Thu, 03 Sep 2026 01:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x20O7-0006tX-MA
 for qemu-riscv@nongnu.org; Thu, 03 Sep 2026 01:53:28 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x20O5-0006Uc-QV
 for qemu-riscv@nongnu.org; Thu, 03 Sep 2026 01:53:27 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-3964e480f76so2661868a91.1
 for <qemu-riscv@nongnu.org>; Wed, 02 Sep 2026 22:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788414804; x=1789019604; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bYttDmg2r4bFrMHv9SJAbeD+cu8jH7R+zt2RRkb6f7M=;
 b=jAp9lRF+hS+KnO/RoR7vz7e9JaDlMMZruGyNYvbH6tiO6d1kMJzJppsD0sQr4c012j
 jHRG0HixzC7WtujL3QhSSIivO8mXUu3FjO7Y7Thulo1gkf0Lb219mpwD85s+6I55TXqa
 BzhuFW+owTmvzaeUn1GividQqe0dB1NpLWG6xuo4SQDaINjMW313OK8Mw8C0ZDiVxyEO
 mBAMX3OL1cJsExGJeBje//o6Pgi98XC1WMz4EysOKD5jQOatVYPWHHNWmTaU87b8KsuF
 vvs9FyaHWI1DDpsQouJ+widk3u/gQ2xqHJfffsfIRjTaDdq2eBct5pDJyrPZ3OhKyLyS
 6AqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788414804; x=1789019604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=bYttDmg2r4bFrMHv9SJAbeD+cu8jH7R+zt2RRkb6f7M=;
 b=Je1rrmrnkS+glvisbWrEDazCrb6RJTvukpXecrqUdxCaA3sPbURaS/bopnqscxV8ap
 ivXIAPj5rXAW+SPIytQjUAnMRLv1pTT52KbjBXfM9hyfali7QaDSwMfrw5KyvGOqa09n
 VPkvpohtXkye/5AGQTARtm8607dCq0uOwdwC2Lqbdk6soPF6SYsDaHrTqqGnuA9EvioH
 f7z8jvhgoilkeDleDDO7XrSLiXyQs00NoDzRR1gWBsoPNau3fXo3RT/yoBuSLdBcyKw1
 ztvm47tsMdMifWIfbAdRq3xl9THNjcrMlO/F3wFGbcbTLld+JsEOKSb3WDOrAPdHb4y9
 iIfw==
X-Forwarded-Encrypted: i=1;
 AKwUvBx2aO/X+l9c31rM49dEsOw+++A13a6VvIzOm21chacYJ9bHdsZ4Yox1BfWqNm1u2hcq0EqEqw2lrJBi@nongnu.org
X-Gm-Message-State: AFuF++mx/70gInjf+NzjCm/9VMPKh4uDN3NqT1/kSUByOTay7Xf5eBU+
 M7388YDYyFimyhfrP8cLOaHH67vrF4rF0CUtkuOSVQaT/w3a5lPupNEQ
X-Gm-Gg: AYBFou0RNuPzaZRjkvpmg99vGYZCeo/8gEQ8OQw+4vMgXjH/VkLvdlyWjlMcR3vu3Je
 5ZBw67NkaV+pMA4Cdu86Mla9vHJlZv3s/KVrRLBNDj5ZbIuxiRcDORC9J39rFDY8SLdN/BNkxtd
 JPaidZhtMcWDKxxRDA1KSw1jh6Lp9Zp09LrwF1iHG477ZN0gYD8q/6tMln6h6sPIHbEVJKm9K6I
 2NWDxNBgJKeNBoimsQpzxAJ16mH2TKjIQ27SIhf4t8lwVJ/xqnsy8NImDn4UNSlM8IXHWXRczA+
 ObV/X5vVMg2y3a5hDLFV2I+8teS6FV3xtZhd85sPnBEbMKPb6JOLEFXoQIhlSZ3Vj5uNfKIRxBp
 HGNE+fgRM4lOGI676xz+yZXWxbTfpfFCQSk7HN9v7dVUH5v5VByzd9n68yOvwRYbvK3Fbjgfu6Y
 OXzEEFDAsVYws2aTSlkNXymAIw75DOU06bz/mNiSMMc9BJc+FvXmQwsmO6YTc7Mr8WJLNu3Gs8P
 86a+pldHEf+TRoyRoGhk1JBfiMm0MxnGcBWWlWkcvGNpOb/qsq/l5TQVk4FDl5llJg17m0NXcj+
 v5TVSHCsnBOZYFmbWzrF
X-Received: by 2002:a17:90b:2f04:b0:380:fead:448d with SMTP id
 98e67ed59e1d1-39aee165cf5mr16401208a91.13.1788414804409; 
 Wed, 02 Sep 2026 22:53:24 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1431990a39bsm2770619c88.3.2026.09.02.22.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 22:53:23 -0700 (PDT)
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
Subject: [PATCH v3 11/16] hw/riscv/atlantis: Use local reference for system
 memory
Date: Thu,  3 Sep 2026 15:21:25 +0930
Message-ID: <20260903055131.257903-12-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260903055131.257903-1-joel@jms.id.au>
References: <20260903055131.257903-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x1033.google.com
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

Instead of system_memory, attach devices to TTAtlantisState::memory in
preparation for the ->memory becoming a container.

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 include/hw/riscv/tt_atlantis.h |  1 +
 hw/riscv/tt_atlantis.c         | 19 ++++++++++---------
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/include/hw/riscv/tt_atlantis.h b/include/hw/riscv/tt_atlantis.h
index 642490d21743..a29c67c1cfcf 100644
--- a/include/hw/riscv/tt_atlantis.h
+++ b/include/hw/riscv/tt_atlantis.h
@@ -29,6 +29,7 @@ struct TTAtlantisState {
     Notifier machine_done;
     const MemMapEntry *memmap;
 
+    MemoryRegion *memory;
     RISCVHartArrayState cpus;
     DeviceState *irqchip;
     DesignWareI2CState i2c[TT_ATL_NUM_I2C];
diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
index f2a4a051d1f6..2a70119c2c6b 100644
--- a/hw/riscv/tt_atlantis.c
+++ b/hw/riscv/tt_atlantis.c
@@ -483,13 +483,14 @@ static void tt_atlantis_machine_init(MachineState *machine)
 {
     TTAtlantisState *s = TT_ATLANTIS_MACHINE(machine);
 
-    MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *ram_hi = g_new(MemoryRegion, 1);
     MemoryRegion *ram_lo = g_new(MemoryRegion, 1);
     MemoryRegion *bootrom = g_new(MemoryRegion, 1);
     ram_addr_t lo_ram_size;
     int hart_count = machine->smp.cpus;
 
+    s->memory = get_system_memory();
+
     s->memmap = tt_atlantis_memmap;
 
     object_initialize_child(OBJECT(machine), "soc", &s->cpus,
@@ -505,7 +506,7 @@ static void tt_atlantis_machine_init(MachineState *machine)
                             &error_abort);
     sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_fatal);
 
-    s->irqchip = riscv_create_aia(system_memory,
+    s->irqchip = riscv_create_aia(s->memory,
                                   true, TT_IMSIC_GUESTS,
                                   TT_IMSIC_STRIDE,
                                   TT_IMSIC_STRIDE,
@@ -518,7 +519,7 @@ static void tt_atlantis_machine_init(MachineState *machine)
                                   TT_IRQCHIP_NUM_MSIS,
                                   TT_IRQCHIP_NUM_PRIO_BITS);
 
-    riscv_aclint_mtimer_create(system_memory,
+    riscv_aclint_mtimer_create(s->memory,
             s->memmap[TT_ATL_ACLINT].base,
             TT_ACLINT_MTIME_SIZE,
             0, hart_count,
@@ -541,23 +542,23 @@ static void tt_atlantis_machine_init(MachineState *machine)
 
     memory_region_init_alias(ram_hi, OBJECT(machine), "ram.high", machine->ram,
                              0, machine->ram_size);
-    memory_region_add_subregion(system_memory,
+    memory_region_add_subregion(s->memory,
                                 s->memmap[TT_ATL_DDR_HI].base, ram_hi);
 
     lo_ram_size = MIN(machine->ram_size, s->memmap[TT_ATL_DDR_LO].size);
     memory_region_init_alias(ram_lo, OBJECT(machine), "ram.low", machine->ram,
                              0, lo_ram_size);
-    memory_region_add_subregion(system_memory,
+    memory_region_add_subregion(s->memory,
                                 s->memmap[TT_ATL_DDR_LO].base, ram_lo);
 
     /* Boot ROM */
     memory_region_init_rom(bootrom, NULL, "tt-atlantis.bootrom",
                            s->memmap[TT_ATL_BOOTROM].size, &error_fatal);
-    memory_region_add_subregion(system_memory, s->memmap[TT_ATL_BOOTROM].base,
+    memory_region_add_subregion(s->memory, s->memmap[TT_ATL_BOOTROM].base,
                                 bootrom);
 
     /* UART1, the soc console (UART0 is for the boot microcontroller) */
-    serial_mm_init(system_memory, s->memmap[TT_ATL_UART1].base, 2,
+    serial_mm_init(s->memory, s->memmap[TT_ATL_UART1].base, 2,
                    qdev_get_gpio_in(s->irqchip, TT_ATL_UART1_IRQ),
                    115200, serial_hd(0), DEVICE_LITTLE_ENDIAN);
     /*
@@ -571,7 +572,7 @@ static void tt_atlantis_machine_init(MachineState *machine)
      */
     object_initialize_child(OBJECT(s), "uart1", &s->uart1,
                             TYPE_UNIMPLEMENTED_DEVICE);
-    mmio_map_unimplemented(system_memory, SYS_BUS_DEVICE(&s->uart1),
+    mmio_map_unimplemented(s->memory, SYS_BUS_DEVICE(&s->uart1),
                            "tt-atlantis.uart1", s->memmap[TT_ATL_UART1].base,
                            s->memmap[TT_ATL_UART1].size);
 
@@ -583,7 +584,7 @@ static void tt_atlantis_machine_init(MachineState *machine)
                                 TYPE_DESIGNWARE_I2C);
         sbd = SYS_BUS_DEVICE(&s->i2c[i]);
         sysbus_realize(sbd, &error_fatal);
-        memory_region_add_subregion(system_memory,
+        memory_region_add_subregion(s->memory,
                                     s->memmap[TT_ATL_I2C0 + i].base,
                                     sysbus_mmio_get_region(sbd, 0));
         sysbus_connect_irq(sbd, 0,
-- 
2.47.3


