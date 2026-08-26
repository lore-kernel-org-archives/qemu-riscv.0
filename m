Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3719C61DC6
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 22:13:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzLrD-0001qY-Fd; Wed, 26 Aug 2026 18:12:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzLrB-0001qI-Im
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 18:12:29 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzLr9-0006bN-V3
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 18:12:29 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-38e041ea211so39885a91.0
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 15:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787782345; x=1788387145; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=nRdr9+gRC0JbR6btxUltpf7akCd8aKY2gzcWzpEXK0g=;
 b=KOZKKDuVZT/GAzaEbHVF47h1rlgNHXlGcbTrj5Xet2w2/2UDLEdT4kzqOsS12Hda5H
 DCxkDkHof+p2+pWAm+mw7wGAF2PMKgtECATZ5qOt22WsjXXVHh/NVFkAAwljelW6qhqv
 +YDOzNZGz83TdznTqntvi3TFnP66HIvcSApt26+LD4vY6EzcQi2ZgKB7scY+z4v8sJPB
 LlJwuTKdXnOjBICZr2oA3nt6FOwAL/nzw93RBUX2IOGT+tpj/IpRA2L5I1VUq8zhOO7Q
 AFJRAxfLylyDRTADWz3b2Ha3sV+OAmkvcinFhiE3pGT0k5Ed5XmBwIeQCNLBWW4Vw283
 vZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787782345; x=1788387145;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=nRdr9+gRC0JbR6btxUltpf7akCd8aKY2gzcWzpEXK0g=;
 b=lhssHvvBVU9gi78XGZBzSWK7WgUyeDSvUzlrUWXMH7vdpm1Tj05IeP8T3DhEYbFIMf
 wTpSQehaETKKJmJcR4znIT12PFnvK6QN+Cw66e7cTWJnvD/LOA4jWVzPSXd3VIVhTTaU
 82m+PGh8VBJh3v5naztMzfAn3IEZuzP7odHm0PAr9kh48fZ6oZPNAsPuVuujKq4cdGue
 W6AvImuonwpiQNdzF1PcZnEKCf5M3ZilSV6X5Rz3qIiKFm1+aR9u9OYFICQl61w6ImMV
 AEyCgGnmwWjD9QmTBlBdPH0ik9tdBZyj8g9fDJ25/M8u7Vs/6fFG8+fi6uGKhL7mhiL3
 qLEQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqeOsgmPLBX5KohNKvUCZ9zTC50MwXEOWegA0oLbvaXS3q8B4oUzXz094/gFETxM6lSbHou5tB8N3U2@nongnu.org
X-Gm-Message-State: AFuF++lRMqHUUZXuHJhIX3cfXxb7k328LQ1zdW1MIoB0I6xqEttkRwDK
 vbgLJpii3cjW8C7hvfVd0a044R7bIQjVpynqyjMiEbxBlZ6KpW548laj
X-Gm-Gg: AR+sD10pdpo3XgNDs9pdHlP6l57aJsYVvFroE5rsP11V4m1eaebOUtd3BoeSzgQ9q++
 TUanlg03HsjOWe+U6RnzeFJ+9j+uLdwsHZKkCUiWjTWUT4hSWCj6DLpcCBlS3B9PCbQAFT180wA
 ANCPq2gvh0n9LnmjrZufe9bgrh9fYxLr56qiz0zdR9wzrOFLFRWWow+wF8724MGWBDTLGQ9YCll
 zQn9C3gwp4aewAfTSUWXLXVQlv8RfeN8KZMfJxkU01DutQLhlXzcUes+MYXydJBuLXA5rPUu/C9
 AQi2o17fFuSmd4ahoApsbKPY5Ekl0o6RRKkJwBM+elF21OKrtrvuokZ4ykV1jFUlGVvfCltol47
 6UQsmGI5kTQtEmCRPpmJbjBx1/EvUGaMpnYm0bsXhbWMuepr1obU9LSNTZ/Ng0PdxvEgrZ1lpLS
 faXvxAaLX+1e+IfW5KPVm+BUTIh1aukhS4gUFaKFp3/7jkDReRK5dq7PzQspEUDdVw5z+MnZOeT
 Xg+iP8PoxXqvtlGYSzF1+1x+nO98rjJHQ4w4aV99Pby4fPtfIdmpaPw+dE0JI3wUFGWp4GHd0fT
 vCNwGlR+qFQku4SAJ5Lo
X-Received: by 2002:a17:90b:5107:b0:37f:fb1d:63fa with SMTP id
 98e67ed59e1d1-3966d9e5ecfmr21498328a91.15.1787782345377; 
 Wed, 26 Aug 2026 15:12:25 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-396b0d3d7fbsm17459a91.3.2026.08.26.15.12.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 15:12:24 -0700 (PDT)
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
Subject: [PATCH 12/16] hw/riscv/atlantis: Decouple RAM size from MachineState
Date: Thu, 27 Aug 2026 07:41:48 +0930
Message-ID: <20260826221154.54577-4-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260826221154.54577-1-joel@jms.id.au>
References: <20260826220528.54516-1-joel@jms.id.au>
 <20260826221154.54577-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x102d.google.com
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

Keep a reference to the machine's RAM MemoryRegion in TTAtlantisState,
and get the MemoryRegion's size where the configured RAM size is
required.

This allows reading the RAM size without needing a pointer to
MachineState, decoupling the memory layout setup from the machine.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 include/hw/riscv/tt_atlantis.h |  1 +
 hw/riscv/tt_atlantis.c         | 20 ++++++++++++--------
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/include/hw/riscv/tt_atlantis.h b/include/hw/riscv/tt_atlantis.h
index a29c67c1cfcf..2ec283d0fd7b 100644
--- a/include/hw/riscv/tt_atlantis.h
+++ b/include/hw/riscv/tt_atlantis.h
@@ -30,6 +30,7 @@ struct TTAtlantisState {
     const MemMapEntry *memmap;
 
     MemoryRegion *memory;
+    MemoryRegion *dram;
     RISCVHartArrayState cpus;
     DeviceState *irqchip;
     DesignWareI2CState i2c[TT_ATL_NUM_I2C];
diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
index 1c75fb5d8d57..7a9f5872c7c0 100644
--- a/hw/riscv/tt_atlantis.c
+++ b/hw/riscv/tt_atlantis.c
@@ -82,12 +82,13 @@ static uint32_t next_phandle(void)
 
 static void create_fdt_memory(void *fdt, TTAtlantisState *s)
 {
-    hwaddr size_lo = MACHINE(s)->ram_size;
+    hwaddr ram_size = memory_region_size(s->dram);
+    hwaddr size_lo = ram_size;
     hwaddr size_hi = 0;
 
     if (size_lo > s->memmap[TT_ATL_DDR_LO].size) {
         size_lo = s->memmap[TT_ATL_DDR_LO].size;
-        size_hi = MACHINE(s)->ram_size - size_lo;
+        size_hi = ram_size - size_lo;
     }
 
     create_fdt_socket_memory(fdt, s->memmap[TT_ATL_DDR_LO].base, size_lo,
@@ -485,11 +486,14 @@ static void tt_atlantis_machine_init(MachineState *machine)
     MemoryRegion *ram_hi = g_new(MemoryRegion, 1);
     MemoryRegion *ram_lo = g_new(MemoryRegion, 1);
     MemoryRegion *bootrom = g_new(MemoryRegion, 1);
-    ram_addr_t lo_ram_size;
+    ram_addr_t lo_ram_size, ram_size;
     int hart_count = machine->smp.cpus;
 
     s->memory = get_system_memory();
 
+    s->dram = machine->ram;
+    ram_size = memory_region_size(s->dram);
+
     s->memmap = tt_atlantis_memmap;
 
     object_initialize_child(OBJECT(machine), "soc", &s->cpus,
@@ -532,20 +536,20 @@ static void tt_atlantis_machine_init(MachineState *machine)
      * The high address is where RAM lives. It is always present and may be
      * up to 64GB. The low address is an alias of the first 2GB of that RAM.
      */
-    if (machine->ram_size > s->memmap[TT_ATL_DDR_HI].size) {
+    if (ram_size > s->memmap[TT_ATL_DDR_HI].size) {
         char *sz = size_to_str(s->memmap[TT_ATL_DDR_HI].size);
         error_report("RAM size is too large, maximum is %s", sz);
         g_free(sz);
         exit(EXIT_FAILURE);
     }
 
-    memory_region_init_alias(ram_hi, OBJECT(machine), "ram.high", machine->ram,
-                             0, machine->ram_size);
+    memory_region_init_alias(ram_hi, OBJECT(machine), "ram.high", s->dram,
+                             0, ram_size);
     memory_region_add_subregion(s->memory,
                                 s->memmap[TT_ATL_DDR_HI].base, ram_hi);
 
-    lo_ram_size = MIN(machine->ram_size, s->memmap[TT_ATL_DDR_LO].size);
-    memory_region_init_alias(ram_lo, OBJECT(machine), "ram.low", machine->ram,
+    lo_ram_size = MIN(ram_size, s->memmap[TT_ATL_DDR_LO].size);
+    memory_region_init_alias(ram_lo, OBJECT(machine), "ram.low", s->dram,
                              0, lo_ram_size);
     memory_region_add_subregion(s->memory,
                                 s->memmap[TT_ATL_DDR_LO].base, ram_lo);
-- 
2.47.3


