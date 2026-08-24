Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D70C5DF8C
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 03:07:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wyL15-0006ql-TJ; Sun, 23 Aug 2026 23:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wyL10-0006lw-AV
 for qemu-riscv@nongnu.org; Sun, 23 Aug 2026 23:06:26 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wyL0w-00045F-Ku
 for qemu-riscv@nongnu.org; Sun, 23 Aug 2026 23:06:26 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-38dc4553f62so3997131a91.0
 for <qemu-riscv@nongnu.org>; Sun, 23 Aug 2026 20:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787540778; x=1788145578; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=DcfzT0aU/EIF7w1g8DW2uz7HiUfixmqwjnAmnvhVG44=;
 b=sw8ONpnoNXkTPrU/CnIN0JMNZ+dtucI3IL4cELG8LpGSSqmvijIYRE1WCXBGpvbWW0
 xeMzGZmopgxgJgdZWa43T2KigavDPc8yTbdpTKJ4ragkznWq4M/9xA1yIxPl+HTzTBAX
 8JULTbmgJjRQXhHqigLZGhFsJTZhssApMVb8L0g/djRKYTXbVVsrUad/+8ndNs52VUHG
 /d3UVSi70FXcKjx0G9qaLtn7VNqfgAil7Fnnwtrl99MF5q5kzVDh22FbNvjrwDznsaVA
 b334s2x9FV35/T3DOOQMhtL/NiM24OvLDPR3KryhA00tAu9HsvntsfKKdDrhe6dgx56m
 XmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787540778; x=1788145578;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=DcfzT0aU/EIF7w1g8DW2uz7HiUfixmqwjnAmnvhVG44=;
 b=lEFF78J1sOgg9E096/rHQlM1QNN0YH4EdDhya0mQZKwHSWo7fibUwKNW57CJl/gHfr
 WESBj3R7Z3NhbYv4+5vGoo59xgHN3cpvfEa5TnFUSbele77tp9SfnwV8gedR2/i8boXY
 YM1t7/+9JpG+ZB6H9fuooYHjPXKqdiQbg16R5yeyL2NqY0VkVBCtfPsYLGlBIESWq1oZ
 Y9rwO8L4CrNXK8kv9g4adDEyjRi4itCN4q9vsDRZDcTyJ+CMZq9aS8pWI3xjNUh28j+g
 gOv4wYNRLf0u5F8J10JURLpSoSwtmmWLJaQinCPkVmiOZVTezPb8/v6Nea+XiA/t+5jG
 FW+Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RqjxuJRNnNmOy1PImRLyvs7RZhOlHrLPQEXrUR9hyZ8pVgHfafTYcnRvMYqtWg6c9bfMxxzGx4BaZIQ@nongnu.org
X-Gm-Message-State: AFuF++nxuwY+U1fEp6USQqKd5tel1X1QujamWAj9CThiB2OjwYXzyS+d
 nZJrpUwErlBr/eww7KDZa4PZfAWe8CZ04JLj/RRDl8xe16pwj3ZMfxoS
X-Gm-Gg: AR+sD12+LX0LVnnUzg23YJ9SFw3AcauCZyVO/DWUYSccJbf8aua4JH01nRDEixjzH2I
 MV9J7t15Y/Tm23Onyknl/a4xQkycX/rJAD+9MfYFgjJj9msjFwZtolzZG4/Dr14zhmz7yv7Az9b
 fvd71tQo5JpB4yJHStSR/uw3TRiROxNLMLcW1BMPn6AfQ6/z27uikS5VRw34qA6b3WjqjEp1Bue
 Bb1RhP+R16YLeiyPQ/UJM0TYqD3MCYbaENlfefzJN7Z68m1fZiJihA0zMWCBKDiECmJdDQpzgPK
 4fof1LYRdB1aOgUL1VOf3yBQTTl2zawE2+lLpChW57ne+iUrdYq2lxFXxiEqr+TBpeoTR1KuiCI
 MGrOa1/IM4ogeYkp86V+mgJKix8gFAN/fInMMBfjyF4QHvRrdIGD7NGHdAGpYkggP+E9S7zoFu2
 WN85TQNKXWBqcfj3/u6YR+dCTlrnkHHGTfm6MtC8qhOsd2kjMnh9vjA/Hmwx0aPw6JbjQvMGF/P
 K0UByq6P5GgmLmGzVgTDk+XOCTGbHwN6p0U7BJ+v5vs1eOeBaRx11u6tzw+ec2IFQpGujiyqKhf
 7Z26sSmG3B2E58aSB3jrjw==
X-Received: by 2002:a17:90b:180d:b0:38e:2524:724f with SMTP id
 98e67ed59e1d1-395c3733e65mr40722704a91.12.1787540778373; 
 Sun, 23 Aug 2026 20:06:18 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-395e4a4e5ecsm8299699a91.16.2026.08.23.20.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2026 20:06:17 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/riscv: Make s-mode IMSIC stride explicit
Date: Mon, 24 Aug 2026 12:35:06 +0930
Message-ID: <20260824030509.18078-2-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260824030509.18078-1-joel@jms.id.au>
References: <20260824030509.18078-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

Existing machines tightly coupled s-mode IMSIC stride with the guest
bits value. There need to be enough bits to describe the guest in
GEILEN, but that's a minimum bound and machines may choose to use a
larger stride. This change decouples the two and updates Atlantis and
Virt to use the new API.

AIA guest count used by the Atlantis machine was not correct. It looks
like a placeholder value was chosen in order to size the stride to
0x40000, but this gives the wrong guest count. From the (currently
internal) docs, the guest count is 5:

> |NUM_GEILEN|5 (0 - 64)|Number of supported guest index from the S-mode interrupt domain|

Add that value to a define, and add a separate define for the stride, to
reduce the opportunity for future confusion.

Fixes: 7778f4b27bb1 ("hw/riscv: Add Tenstorrent Atlantis machine")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/riscv/aia.h         |  1 +
 hw/riscv/aia.c         |  5 ++---
 hw/riscv/tt_atlantis.c | 19 +++++++++++--------
 hw/riscv/virt.c        |  2 ++
 4 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/hw/riscv/aia.h b/hw/riscv/aia.h
index 565f91accc09..3b6d7f962506 100644
--- a/hw/riscv/aia.h
+++ b/hw/riscv/aia.h
@@ -15,6 +15,7 @@ uint32_t imsic_num_bits(uint32_t count);
 
 DeviceState *riscv_create_aia(bool msimode, int aia_guests,
                              uint32_t m_imsic_stride,
+                             uint32_t s_imsic_stride,
                              uint16_t num_sources,
                              const MemMapEntry *aplic_m,
                              const MemMapEntry *aplic_s,
diff --git a/hw/riscv/aia.c b/hw/riscv/aia.c
index ed8916002945..c33a3b32bd45 100644
--- a/hw/riscv/aia.c
+++ b/hw/riscv/aia.c
@@ -26,6 +26,7 @@ uint32_t imsic_num_bits(uint32_t count)
 
 DeviceState *riscv_create_aia(bool msimode, int aia_guests,
                              uint32_t m_imsic_stride,
+                             uint32_t s_imsic_stride,
                              uint16_t num_sources,
                              const MemMapEntry *aplic_m,
                              const MemMapEntry *aplic_s,
@@ -36,7 +37,6 @@ DeviceState *riscv_create_aia(bool msimode, int aia_guests,
 {
     int i;
     hwaddr addr = 0;
-    uint32_t guest_bits;
     DeviceState *aplic_s_dev = NULL;
     DeviceState *aplic_m_dev = NULL;
 
@@ -55,10 +55,9 @@ DeviceState *riscv_create_aia(bool msimode, int aia_guests,
         }
 
         /* Per-socket S-level IMSICs */
-        guest_bits = imsic_num_bits(aia_guests + 1);
         addr = imsic_s->base + socket * (1U << IMSIC_MMIO_GROUP_MIN_SHIFT);
         for (i = 0; i < hart_count; i++) {
-            riscv_imsic_create(addr + i * IMSIC_HART_SIZE(guest_bits),
+            riscv_imsic_create(addr + i * s_imsic_stride,
                                base_hartid + i, false, 1 + aia_guests,
                                num_msis);
         }
diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
index d808bcc11c34..88c375684412 100644
--- a/hw/riscv/tt_atlantis.c
+++ b/hw/riscv/tt_atlantis.c
@@ -37,8 +37,12 @@
 #define TT_IRQCHIP_NUM_MSIS       255
 #define TT_IRQCHIP_NUM_SOURCES    128
 #define TT_IRQCHIP_NUM_PRIO_BITS  3
-#define TT_IRQCHIP_GUESTS         63 /* aia_guests, gives guest_index_bits=6 */
-#define TT_IRQCHIP_MIMSIC_STRIDE  0x40000
+#define TT_IMSIC_GUESTS           5
+#define TT_IMSIC_STRIDE           0x40000 /* Same stride for M and S */
+#define TT_IMSIC_GUEST_BITS       6
+
+/* Stride is fixed by hardware, check it's consistent with guest bits. */
+QEMU_BUILD_BUG_ON(TT_IMSIC_STRIDE != (0x1000 << TT_IMSIC_GUEST_BITS));
 
 #define TT_ACLINT_MTIME_SIZE    0x8050
 #define TT_ACLINT_MTIME         0x0
@@ -231,18 +235,16 @@ static void create_fdt_cpu(TTAtlantisState *s, const MemMapEntry *memmap,
 
     create_fdt_aclint(s, intc_phandles);
 
-    uint32_t imsic_guest_bits = imsic_num_bits(TT_IRQCHIP_GUESTS + 1);
-
     /* M-level IMSIC node */
     uint32_t msi_m_phandle = next_phandle();
     create_fdt_one_imsic(fdt, &s->memmap[TT_ATL_MIMSIC], ms->smp.cpus,
                          intc_phandles, msi_m_phandle,
-                         IRQ_M_EXT, imsic_guest_bits);
+                         IRQ_M_EXT, TT_IMSIC_GUEST_BITS);
 
     /* S-level IMSIC node */
     create_fdt_one_imsic(fdt, &s->memmap[TT_ATL_SIMSIC], ms->smp.cpus,
                          intc_phandles, imsic_s_phandle,
-                         IRQ_S_EXT, imsic_guest_bits);
+                         IRQ_S_EXT, TT_IMSIC_GUEST_BITS);
 
     uint32_t aplic_m_phandle = next_phandle();
 
@@ -493,8 +495,9 @@ static void tt_atlantis_machine_init(MachineState *machine)
                             &error_abort);
     sysbus_realize(SYS_BUS_DEVICE(&s->soc), &error_fatal);
 
-    s->irqchip = riscv_create_aia(true, TT_IRQCHIP_GUESTS,
-                                  TT_IRQCHIP_MIMSIC_STRIDE,
+    s->irqchip = riscv_create_aia(true, TT_IMSIC_GUESTS,
+                                  TT_IMSIC_STRIDE,
+                                  TT_IMSIC_STRIDE,
                                   TT_IRQCHIP_NUM_SOURCES,
                                   &s->memmap[TT_ATL_MAPLIC],
                                   &s->memmap[TT_ATL_SAPLIC],
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index d58656f70d1b..42d28f4f5a02 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1410,9 +1410,11 @@ static void virt_machine_init(MachineState *machine)
             s->irqchip[i] = virt_create_plic(s->memmap, i,
                                              base_hartid, hart_count);
         } else {
+            int imsic_bits = imsic_num_bits(s->aia_guests + 1);
             s->irqchip[i] = riscv_create_aia(s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC,
                                              s->aia_guests,
                                              IMSIC_HART_SIZE(0),
+                                             IMSIC_HART_SIZE(imsic_bits),
                                              s->num_sources,
                                              &s->memmap[VIRT_APLIC_M],
                                              &s->memmap[VIRT_APLIC_S],
-- 
2.47.3


