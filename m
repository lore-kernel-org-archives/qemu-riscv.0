Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81FDC61DFD
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 02:17:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x0ra0-0005LR-1z; Sun, 30 Aug 2026 22:17:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x0rZx-0005GC-V0
 for qemu-riscv@nongnu.org; Sun, 30 Aug 2026 22:16:57 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x0rZw-0007kE-Ck
 for qemu-riscv@nongnu.org; Sun, 30 Aug 2026 22:16:57 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-cc1c3d79b9bso2507871a12.3
 for <qemu-riscv@nongnu.org>; Sun, 30 Aug 2026 19:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788142615; x=1788747415; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=n+dEv2CXGdQUWUzHVbk1BheHXV911tV5Sryp6N+Qyq0=;
 b=bSqLAIyamRpKsvyp00JEi9ezzlb3n3wMuUm/Y7qLygiL6/ngPfC4E7jAdumH2jobkG
 YAAPQFE0qpJ2HXwcBSG/Q1+6FDS4esTmGJ9LXklbgkx4oweOzPjXe1tc68XzB94s/Ks1
 IJ1/wBTRKNaVGIVMx+tk6cfuhD2RA4bGfQb6K/D5LUXWQgHL3q1ZL4QVEtln8wwfZXyF
 ZNSbZNF1iOyiZgp3/SLpl9/IZydZ8K5sKONzFpyevWQuU/QmylK3jTuemiZZXe2gzjBV
 MiyusKfi8tmPbADO1QZQanMr6K5r6UG+w5lk9flWOqVY6idlyVQSF2NiupPcF16TSXtg
 agcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788142615; x=1788747415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=n+dEv2CXGdQUWUzHVbk1BheHXV911tV5Sryp6N+Qyq0=;
 b=VKb9iNambADlR88wPRptsMRYQD1PVvfjdbw8BY2veOD28UZkveoYhIF3bUvx/ruDbY
 RDbeLv73uNxOq9fVzC8WJngvS2ONaVAUQlHo/vm48315tzFopjao7J8iE+AdcAKsSa+c
 3XcZXFE7jUrnhG+/BusFMuwrij5aYavMHcTdLBUvZNU5exyQpmAZ8WlQS5xeH+N56AsY
 sYDPDYTO1Z1EnSHjGJeYdAeARv0aScHUTHSel7coVzzYUnf6pw37orwshfuvoKcYZ7x2
 LLbbb0EFfoPyQW8u/ut03VJ39WiBx8UezlUgeEDpBt2K2ho00IlJJkY0545kni2RMOoj
 dRqQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxRPNCizi8Z4J//Ex3l7EA3H83KIP0F9y4SAC5YvrU/6eBmJnoIsKYartIYxuE67yd6qRs9+JazQDDJ@nongnu.org
X-Gm-Message-State: AFuF++mnvbvrPcMYU6lGdrJd8T8XZq5WUwMA9MqzIbgEq3lk0ATqIeXl
 VfGmGP1qXBO2iy7tOFRxynC0QYgwbuTzaBeonv5ojeI+6hy6hG2n87WUbMeS0Q==
X-Gm-Gg: AYBFou0QJc/rPMFz7O9bLUvnXNwH87zRGL6/TWffj/4Tq0IKRfMLCci5TtiBvvrIpik
 G9nFdOB+mqr0S+7GOWZD4yHCbEF0bE2Tr9vHMeQJFiNoayF+s1d+K/JB827F008zYfVnypQYzMf
 ByUhpB/8MEQ2GE7tD9QKMED4p/jLxVDgTOpc+AygZxKVIGkRxuePkBUm7oQK8iPMuf/4O4ChqMO
 iZXKk1PL295fIfx32vD2oL8rEKnsXuiuTlnbDbO2V7QMxcJnYho+cUdbBJrlUqoAiBJ8HiQExGE
 yl74M7L4eyygLfQVMO6iFnaxlfkQZMm219DsWRutQrZLF6WMf7T5L3p/vgrXoMZ9O/DlQh3aF7j
 v0bh9mGJvdeLqXbdymjmxT0AZgY9tknSP7bkQIVItfzEnK2Jg0BHKczaWRRY02rmynTew+pppT0
 cNM79QcYVZmAgqM/rRT03dso+H2ear/6dfzuEgOhzuRcMyNEROwa12AOAlU/Gf9gDr7FTnD99Aq
 EZuPEeWBDxlDgPzDJ9PKL/liPb8f+ug6K4sBIq7Euo1MTJ1hJ6zrqjCCr4nF3mJlQqwsgwV6POa
 FOoOarcRa+2QICldVcSd
X-Received: by 2002:a17:90b:264d:b0:398:dcf6:d40e with SMTP id
 98e67ed59e1d1-398f86d88a2mr380104a91.17.1788142615014; 
 Sun, 30 Aug 2026 19:16:55 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-396b186807bsm20071240a91.12.2026.08.30.19.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Aug 2026 19:16:54 -0700 (PDT)
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
Subject: [PATCH v2 16/16] hw/riscv/atlantis: Map the SoC through a memory
 container
Date: Mon, 31 Aug 2026 11:44:57 +0930
Message-ID: <20260831021500.82565-17-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260831021500.82565-1-joel@jms.id.au>
References: <20260831021500.82565-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=joel.stan@gmail.com; helo=mail-pg1-x52b.google.com
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

Give the Atlantis SoC a 'memory' link property. The machine creates a
container MemoryRegion, maps it at address 0 of system memory, and
passes it to the SoC together with the machine RAM. The SoC maps devices
into the 'memory' container instead of system memory, allowing
TTAtlantisSoCState to be composed together with other SoCs in the
future.

This prepares the machine for adding other microcontrollers that share
the memory bus with the Ascalon complex (aka the Atlantis SoC), but with
their own view of the address map.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 include/hw/riscv/tt_atlantis.h |  1 +
 hw/riscv/tt_atlantis.c         | 17 +++++++++++++++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/include/hw/riscv/tt_atlantis.h b/include/hw/riscv/tt_atlantis.h
index 5d4e4d133bd9..3923308b7c89 100644
--- a/include/hw/riscv/tt_atlantis.h
+++ b/include/hw/riscv/tt_atlantis.h
@@ -53,6 +53,7 @@ struct TTAtlantisState {
     /*< public >*/
     Notifier machine_done;
 
+    MemoryRegion soc_memory;
     TTAtlantisSoCState soc;
 };
 
diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
index d2b29ff1a477..b78b4a5ea31e 100644
--- a/hw/riscv/tt_atlantis.c
+++ b/hw/riscv/tt_atlantis.c
@@ -503,8 +503,10 @@ static void tt_atlantis_soc_realize(DeviceState *dev, Error **errp)
     ram_addr_t lo_ram_size, ram_size;
     int hart_count = s->num_harts;
 
-    s->memory = get_system_memory();
-
+    if (!s->memory) {
+        error_setg(errp, "'memory' link is not set");
+        return;
+    }
     if (!s->dram) {
         error_setg(errp, "'dram' link is not set");
         return;
@@ -523,6 +525,8 @@ static void tt_atlantis_soc_realize(DeviceState *dev, Error **errp)
     object_property_set_int(OBJECT(&s->cpus), "resetvec",
                             s->memmap[TT_ATL_BOOTROM].base,
                             &error_abort);
+    object_property_set_link(OBJECT(&s->cpus), "memory", OBJECT(s->memory),
+                             &error_abort);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->cpus), errp)) {
         return;
     }
@@ -614,6 +618,8 @@ static void tt_atlantis_soc_realize(DeviceState *dev, Error **errp)
 static const Property tt_atlantis_soc_props[] = {
     DEFINE_PROP_STRING("cpu-type", TTAtlantisSoCState, cpu_type),
     DEFINE_PROP_UINT32("num-harts", TTAtlantisSoCState, num_harts, 8),
+    DEFINE_PROP_LINK("memory", TTAtlantisSoCState, memory,
+                     TYPE_MEMORY_REGION, MemoryRegion *),
     DEFINE_PROP_LINK("dram", TTAtlantisSoCState, dram,
                      TYPE_MEMORY_REGION, MemoryRegion *),
 };
@@ -633,12 +639,19 @@ static void tt_atlantis_machine_init(MachineState *machine)
     TTAtlantisState *ams = TT_ATLANTIS_MACHINE(machine);
     TTAtlantisSoCState *s = &ams->soc;
 
+    memory_region_init(&ams->soc_memory, OBJECT(machine),
+                       "tt-atlantis.soc-memory", UINT64_MAX);
+    memory_region_add_subregion(get_system_memory(), 0, &ams->soc_memory);
+
     object_initialize_child(OBJECT(machine), "soc", &ams->soc,
                             TYPE_TT_ATLANTIS_SOC);
     object_property_set_str(OBJECT(&ams->soc), "cpu-type", machine->cpu_type,
                             &error_abort);
     object_property_set_int(OBJECT(&ams->soc), "num-harts", machine->smp.cpus,
                             &error_abort);
+
+    object_property_set_link(OBJECT(&ams->soc), "memory",
+                             OBJECT(&ams->soc_memory), &error_abort);
     object_property_set_link(OBJECT(&ams->soc), "dram", OBJECT(machine->ram),
                              &error_abort);
     qdev_realize(DEVICE(&ams->soc), NULL, &error_fatal);
-- 
2.47.3


