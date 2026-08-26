Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C545AC61DBE
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 22:07:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzLl6-00059B-Sg; Wed, 26 Aug 2026 18:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzLl5-00058u-2T
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 18:06:11 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzLl3-0004iL-Dn
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 18:06:10 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-3969e82ff8fso310811a91.0
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 15:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787781968; x=1788386768; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kRlIG3jdUXL328hhNzi0eKdNWIgnViBStzI80X+iMs0=;
 b=WLRR4xsFi3G2d1mH/oaGl/ML3kSDxbbEQIthVTkn4OO5vF1b1qQjMkPpFblyttDclu
 lGH8PiXEwWVHpGDDpCZwTEZBNeq03nHq7HRGXRdxNwWIjy/faBICdh/hy1ssY71lyv7e
 Evoph6s2gQkutXBlumZstkxUFp4ZBxQlW4Pp6ZdqO21mUjAnQ1BNqzOHHcV9ELfmFeEH
 iuggKLLFWP8osWO8dWWvFIkNRXZPNiCgogLIPt60dnD7zdWzNdUdmrmhlchYTeyKqDQ/
 jLdB1fUe0cQCyiLxujjI4xJCv8yJVeWdx76wWV/S3+yraoOSz3QXaYXmJ7FuaDlaiUEK
 7BjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787781968; x=1788386768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kRlIG3jdUXL328hhNzi0eKdNWIgnViBStzI80X+iMs0=;
 b=eS1PYl0aM8Id/cTm9wsQtpMz19qvKZVSoO1T/6/nqXGVafV2mjcwfgulPEnCO/7kxB
 9HjZ1nJA4WC/wJHJqUgdGuOdFKnnQDU+pvH7a14aW/IUQwTcOV9lrEZgfYbmTJFo/QmH
 VPI2bZ7YFe0a4b3YqSpUcGiFJXAnONkelD+6fs3ls/ktqW39jbelzrsOeA3E75UOzfbz
 linzg0mjf12ER1XFkO0N2FMLAccaxDL1MP8GNeamAE9RXSl1sfSw2IR0+CNOeNG9wXVP
 tAoPpShWwJH+yFxtFmZjIUqVFluzGF0Tr6wvu8kvR5LmplZst55Ol0zyDsKZCALTAPRg
 AACQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqzrJ3/sx4BuILqwUnrfPW2dkDsOmndrTYuLQxlESj1mUveuW3OJV6cqVXb+H49aQg/cs8zc41BJVnO@nongnu.org
X-Gm-Message-State: AFuF++lqS7BxmqA+klGdhB+kTJujgAFywvb7N/7yRU4bp6b3tJUA4rW7
 mp8G75xanp4aB1sObpTk5wtyfdexR780Yx1xmsnUNZ0b2O9e2MXE7TTZ
X-Gm-Gg: AR+sD109uhL9bC+pG49n3nx05O3sdZhJ4lhnILFZmPdRjGmFwUpzk/KUaQYq72U56qP
 osqcPviQMJHns49H2+rqyEDHNFn4knqYZhw76hR/bCK3797/1SR6OZhYqGiNW89ed4wsv8q0qd0
 flhW6WstGmJIahTjSSOsQ1RnMBB8etsttQjJa3kayI0Mch5qfY1dOxELyGimCIfrW5UEMV0IYib
 zSCQ+yoR9gira7udFounluSsdRGOKxMaMIqv4Yu4qBOOpreP/JU4SuyOTf2sR0HcLIACcfg1yzT
 15RGnaIJ8Ww3wo1m8hMRpg0zqkBNiCWE5LqCBxWHhHN7eTui2DZkdkR6+1JmnQA/LEjM4+XcQuT
 V4lMb+9Ht8eI9AOAedQ+kcq2/MMMfGUl0Z+7Iv8okhs66citP8TKdaTjbSp+sB5rBNFqTYWUyxd
 bBUGfm8XMgg8nK+ClhpsCTiRUpk/kBgGYzPeFa6hipIjk96N5IllqhHPl+rFgoWEC9KB0XEnN53
 ipLmaB0Af4JdxZ8FUwmGt366Ng3KxN/86LCW/Ns5scNxmqb28/xiQhTXec+0Ki0I/nZqyh0phm9
 Efcjcuq6FXB6VQmrxuS7
X-Received: by 2002:a17:90b:4c4a:b0:38e:ad9d:1161 with SMTP id
 98e67ed59e1d1-3966d00a01amr19873764a91.0.1787781967951; 
 Wed, 26 Aug 2026 15:06:07 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39668a573a1sm5789956a91.14.2026.08.26.15.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 15:06:07 -0700 (PDT)
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
Subject: [PATCH 04/16] hw/intc/riscv_aplic: Take a MemoryRegion for the
 created device
Date: Thu, 27 Aug 2026 07:35:14 +0930
Message-ID: <20260826220528.54516-5-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260826220528.54516-1-joel@jms.id.au>
References: <20260826220528.54516-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x102e.google.com
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

riscv_aplic_create() maps the device it creates into system_memory,
which prevents its use by SoCs that map devices into their own memory
container.

Add a MemoryRegion parameter and map the device into it instead of
calling sysbus_mmio_map(). The mapping still only happens when the
APLIC is emulated. All callers pass system_memory, so there is no
change in behaviour.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 include/hw/intc/riscv_aplic.h | 2 +-
 hw/intc/riscv_aplic.c         | 5 +++--
 hw/riscv/aia.c                | 6 ++++--
 hw/riscv/cps.c                | 6 ++++--
 hw/riscv/xiangshan_kmh.c      | 6 ++++--
 5 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/include/hw/intc/riscv_aplic.h b/include/hw/intc/riscv_aplic.h
index c7a4d4ad0172..baeec76e4c3e 100644
--- a/include/hw/intc/riscv_aplic.h
+++ b/include/hw/intc/riscv_aplic.h
@@ -80,7 +80,7 @@ bool riscv_is_kvm_aia_aplic_imsic(bool msimode);
 bool riscv_use_emulated_aplic(bool msimode);
 void riscv_aplic_set_kvm_msicfgaddr(RISCVAPLICState *aplic, hwaddr addr);
 
-DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,
+DeviceState *riscv_aplic_create(MemoryRegion *mr, hwaddr addr, hwaddr size,
     uint32_t hartid_base, uint32_t num_harts, uint32_t num_sources,
     uint32_t iprio_bits, bool msimode, bool mmode, DeviceState *parent);
 
diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
index 84606e9f3d88..87d7d9e49cdd 100644
--- a/hw/intc/riscv_aplic.c
+++ b/hw/intc/riscv_aplic.c
@@ -1109,7 +1109,7 @@ void riscv_aplic_add_child(DeviceState *parent, DeviceState *child)
 /*
  * Create APLIC device.
  */
-DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,
+DeviceState *riscv_aplic_create(MemoryRegion *mr, hwaddr addr, hwaddr size,
     uint32_t hartid_base, uint32_t num_harts, uint32_t num_sources,
     uint32_t iprio_bits, bool msimode, bool mmode, DeviceState *parent)
 {
@@ -1137,7 +1137,8 @@ DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     if (riscv_use_emulated_aplic(msimode)) {
-        sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
+        memory_region_add_subregion(mr, addr,
+            sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0));
 
         if (!msimode) {
             for (i = 0; i < num_harts; i++) {
diff --git a/hw/riscv/aia.c b/hw/riscv/aia.c
index 49cb14349f00..974806c425e2 100644
--- a/hw/riscv/aia.c
+++ b/hw/riscv/aia.c
@@ -71,7 +71,8 @@ DeviceState *riscv_create_aia(MemoryRegion *mr, bool msimode, int aia_guests,
 
     if (!kvm_enabled()) {
         /* Per-socket M-level APLIC */
-        aplic_m_dev = riscv_aplic_create(aplic_m->base +
+        aplic_m_dev = riscv_aplic_create(mr,
+                                     aplic_m->base +
                                      socket * aplic_m->size,
                                      aplic_m->size,
                                      (msimode) ? 0 : base_hartid,
@@ -82,7 +83,8 @@ DeviceState *riscv_create_aia(MemoryRegion *mr, bool msimode, int aia_guests,
     }
 
     /* Per-socket S-level APLIC */
-    aplic_s_dev = riscv_aplic_create(aplic_s->base +
+    aplic_s_dev = riscv_aplic_create(mr,
+                                 aplic_s->base +
                                  socket * aplic_s->size,
                                  aplic_s->size,
                                  (msimode) ? 0 : base_hartid,
diff --git a/hw/riscv/cps.c b/hw/riscv/cps.c
index 5cfb54aa27d2..d2fd9638a08d 100644
--- a/hw/riscv/cps.c
+++ b/hw/riscv/cps.c
@@ -135,14 +135,16 @@ static void riscv_cps_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < num_of_clusters; i++) {
         uint64_t cm_base = GLOBAL_CM_BASE + (CM_SIZE * i);
         uint32_t hartid_base = i << MHARTID_CLUSTER_SHIFT;
-        s->aplic = riscv_aplic_create(cm_base + AIA_PLIC_M_OFFSET,
+        s->aplic = riscv_aplic_create(get_system_memory(),
+                                      cm_base + AIA_PLIC_M_OFFSET,
                                       AIA_PLIC_M_SIZE,
                                       hartid_base, /* hartid_base */
                                       MAX_HARTS, /* num_harts */
                                       APLIC_NUM_SOURCES,
                                       APLIC_NUM_PRIO_BITS,
                                       false, true, NULL);
-        riscv_aplic_create(cm_base + AIA_PLIC_S_OFFSET,
+        riscv_aplic_create(get_system_memory(),
+                           cm_base + AIA_PLIC_S_OFFSET,
                            AIA_PLIC_S_SIZE,
                            hartid_base, /* hartid_base */
                            MAX_HARTS, /* num_harts */
diff --git a/hw/riscv/xiangshan_kmh.c b/hw/riscv/xiangshan_kmh.c
index 9eb608f8c578..c5a654ab417d 100644
--- a/hw/riscv/xiangshan_kmh.c
+++ b/hw/riscv/xiangshan_kmh.c
@@ -80,13 +80,15 @@ static DeviceState *xiangshan_kmh_create_aia(uint32_t num_harts)
     }
 
     /* M-level APLIC */
-    aplic_m = riscv_aplic_create(memmap[XIANGSHAN_KMH_APLIC_M].base,
+    aplic_m = riscv_aplic_create(get_system_memory(),
+                                 memmap[XIANGSHAN_KMH_APLIC_M].base,
                                  memmap[XIANGSHAN_KMH_APLIC_M].size,
                                  0, 0, XIANGSHAN_KMH_APLIC_NUM_SOURCES,
                                  1, true, true, NULL);
 
     /* S-level APLIC */
-    riscv_aplic_create(memmap[XIANGSHAN_KMH_APLIC_S].base,
+    riscv_aplic_create(get_system_memory(),
+                       memmap[XIANGSHAN_KMH_APLIC_S].base,
                        memmap[XIANGSHAN_KMH_APLIC_S].size,
                        0, 0, XIANGSHAN_KMH_APLIC_NUM_SOURCES,
                        1, true, false, aplic_m);
-- 
2.47.3


