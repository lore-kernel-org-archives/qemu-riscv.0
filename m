Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A539C5DF97
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 22:13:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzLr8-0001pe-W6; Wed, 26 Aug 2026 18:12:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzLr5-0001oi-Hz
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 18:12:24 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzLr3-0006a5-Rc
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 18:12:23 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-cc1cbb64a1fso1026829a12.1
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 15:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787782340; x=1788387140; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mQBiGju903XJawObkTSJlI2w6oNi2YYpQ1UlpzmMJzE=;
 b=FqgH8j2dkEyFnGRpoiFmzEErzsll0M0QYtIAb1TtlnhTHqPhBmpxQ6YJ629HBB6d+V
 n2zlCi+hTDbggecQYP3NB//wvuBVz11oYQt+rcPiVgnTFkd12fYnrkMLrh3r/2RtfcYV
 erDbNveQ9Qo5DupJ6hJvMVe5M6swp8p26mLOWfoOxDb+UmHt3VwO0a/gqA2eouQ62efO
 PPguOw15dJf156ElOFnYtdMa9OTadkbklCkUHCV29lMMBjkYc5rggmKxWq5KNjrDUUs5
 5hS8TXrKSJTUaakDC+Q8Oud/gqU6QbgggDLMdSW7CQ/nunbqDB1EeXn4bT2gVnnP3o3g
 a4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787782340; x=1788387140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=mQBiGju903XJawObkTSJlI2w6oNi2YYpQ1UlpzmMJzE=;
 b=avIy9REjlBIPdWYUNQR4uQ+vLXPF2AfWfLubzK8O0qg7pmR9VahsoN79Zoxw9HWWkr
 W1Cgi/2agXuSJy4R4sFsYJmSaUj059zDb9kpNNhiwITBf+waNj07f75IJQl8sLuZDjj+
 eV9EVTj2ByKBZdCVluy1ddbuw6O1kz7NXBbXF9liNnA67j69yg7Ejk5hv9O8hY+Xco7K
 x3vR3jp9mJWGSGUm0Nl5zAodVgrOFPEz5hEhO+R+MW3VLXIG4fP/Q6+GoKtCukOI8RSn
 HVjnKuOxO/OsGvUFHE1gKtXJds195T6Qa9QRXE6DLDweHrZAcBuuoQ1h5smayOatafuP
 vGVg==
X-Forwarded-Encrypted: i=1;
 AHgh+RodezGdwrNNw198+kmEB3ms5PG1DoIp6z3xVIv+dXZ3dii3yPI+f+7DSoE9bu52Kyzr+Nmd8tIGuk7O@nongnu.org
X-Gm-Message-State: AFuF++nkedbiBrnbBjy1eP8WSsvDuI80KJRVdx+zOuAVZN9gh1r1MIDL
 i1/jDuI6ogjOl/ZgoduRWmdw6FtCJdSBCMNHTlYOWlVGZP/0GgYFjneB
X-Gm-Gg: AR+sD11mRPakaLl9Xj4z2U3RZ3bftwya3Z11o6ryIMmqo5gBclwg3eAuJ29BzvNJgHT
 oPflGTvUo0YZl6d3Gi9etT0R1WM5EsT5bdFTuPxAT2T20m/RDs0sH0X2bez1OEZvEc+SOxvUkVP
 Vh50XKMimAQrQnNSI3AIYgEIJvbYfL+fQcOLT9jEXzgDzr+FuvTImIdU0GMCzroh+yCRXtIrTIE
 E7QYC4yaOh2Q9YGjJoApOv0erycaNHztgHeCNmwH9GYq+nEILaOzf7xR3lTseFGxO0KPGtE44YC
 RJHh5w3rXW+sYRx8Acy+RTnvB14+mNAJZO1FL0K2VemmPsGZ8KTG7BO9zQ2PR5b0SVxxKA6a16N
 EhS3eoNU0qC4+Kr3ImiBMMnSg4koO8ckEjP1FYZWjGc7FfejAVd4pC3qzVW2fSLRqI0aIa6BjxU
 L4U+Dc4ua3XG3RuBsNTEf5kL3wMonO0KFNAbHm63m4qoqFHgza5ui7D7TwK5w3OoDQYh+KT6VIC
 v1eMB4c5yx/Jevpw/v6Xf/1+GEs3b4iJf1n5wJ6zhA+T9Q77w/+19/1gulYEGtP52E6PMYrDbGV
 jlL4bzqp/WQbomZkUIUlrfVfKseiIooe
X-Received: by 2002:a17:90a:d2cb:b0:36a:5d1f:7b6 with SMTP id
 98e67ed59e1d1-3966d36df78mr21195647a91.2.1787782340499; 
 Wed, 26 Aug 2026 15:12:20 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-396b0d3d7fbsm17459a91.3.2026.08.26.15.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 15:12:20 -0700 (PDT)
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
Subject: [PATCH 11/16] hw/riscv/atlantis: Use local reference for system memory
Date: Thu, 27 Aug 2026 07:41:47 +0930
Message-ID: <20260826221154.54577-3-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260826221154.54577-1-joel@jms.id.au>
References: <20260826220528.54516-1-joel@jms.id.au>
 <20260826221154.54577-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=joel.stan@gmail.com; helo=mail-pg1-x52f.google.com
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
index c471c7cebf12..1c75fb5d8d57 100644
--- a/hw/riscv/tt_atlantis.c
+++ b/hw/riscv/tt_atlantis.c
@@ -482,13 +482,14 @@ static void tt_atlantis_machine_init(MachineState *machine)
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
@@ -504,7 +505,7 @@ static void tt_atlantis_machine_init(MachineState *machine)
                             &error_abort);
     sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_fatal);
 
-    s->irqchip = riscv_create_aia(system_memory,
+    s->irqchip = riscv_create_aia(s->memory,
                                   true, TT_IMSIC_GUESTS,
                                   TT_IMSIC_STRIDE,
                                   TT_IMSIC_STRIDE,
@@ -517,7 +518,7 @@ static void tt_atlantis_machine_init(MachineState *machine)
                                   TT_IRQCHIP_NUM_MSIS,
                                   TT_IRQCHIP_NUM_PRIO_BITS);
 
-    riscv_aclint_mtimer_create(system_memory,
+    riscv_aclint_mtimer_create(s->memory,
             s->memmap[TT_ATL_ACLINT].base,
             TT_ACLINT_MTIME_SIZE,
             0, hart_count,
@@ -540,23 +541,23 @@ static void tt_atlantis_machine_init(MachineState *machine)
 
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
@@ -570,7 +571,7 @@ static void tt_atlantis_machine_init(MachineState *machine)
      */
     object_initialize_child(OBJECT(s), "uart1", &s->uart1,
                             TYPE_UNIMPLEMENTED_DEVICE);
-    mmio_map_unimplemented(system_memory, SYS_BUS_DEVICE(&s->uart1),
+    mmio_map_unimplemented(s->memory, SYS_BUS_DEVICE(&s->uart1),
                            "tt-atlantis.uart1", s->memmap[TT_ATL_UART1].base,
                            s->memmap[TT_ATL_UART1].size);
 
@@ -582,7 +583,7 @@ static void tt_atlantis_machine_init(MachineState *machine)
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


