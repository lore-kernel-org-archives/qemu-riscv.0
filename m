Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33718C624D4
	for <qemu-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 05:55:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x20NQ-0006Wy-Ao; Thu, 03 Sep 2026 01:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x20NO-0006Wi-HU
 for qemu-riscv@nongnu.org; Thu, 03 Sep 2026 01:52:42 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x20NM-0006JX-Ps
 for qemu-riscv@nongnu.org; Thu, 03 Sep 2026 01:52:42 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2d6fe26ef1cso22115505ad.2
 for <qemu-riscv@nongnu.org>; Wed, 02 Sep 2026 22:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788414759; x=1789019559; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=3ueueg6h6L/6zGU1+lLrauSFQbJFf5Bkt7eWt6E1w4o=;
 b=sWgtXnNAu+itsNkaCurOfILvKlHxt6oyTKVt+mFzXaOUTRzWtxndUsAQ4YUqPwmfOv
 dKJfvPcroq8r2QGK9OVU0Yq6sNRNG1ILQ7FHyiwoVIiiPkjxF4ak8e30niPIASOXmsDk
 6yZBVruCGHa9MVglMtJ92knvsZBFGyyLkhebNdjanCLiShTkADBLJpoNkAmg43auFBds
 h6kxfNF3bZmWhHtmG+6YrLhyiDRtmC3SiLw0Noq7f/WPLKLJdX0e1gwNMLFGJEIyZMd/
 TYuBlJ0vDv+IcysuCB+DXNmB3jtxLVrdZgn+5nLqcyb3DS2BCV2hZHkSvHcGboZSDKTU
 PkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788414759; x=1789019559;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=3ueueg6h6L/6zGU1+lLrauSFQbJFf5Bkt7eWt6E1w4o=;
 b=oOQywQZ0AntS29AdM4FEbVYX33Bp0Mp5mn4Eni383E/h0P6MXIY5chKFwvgPZiCRxT
 eWHUlsNw9lSGXgAnq89XcGt3McS3VpEqrsXrC8BZcbhIDvdRjz1USelc9hI6T8EtrAyf
 7+CCx/y4R9auM8/hBHsxJFIUSXd91bGcBPR7hu+tM462sUpB09gLgU7MycNJJN30j6Fg
 Nazf8FLCrlLetwHtK9aomr6nom78u/kLdDYA8yRG4+z8zSkBmBO76c7s1xBLhIkbJHGb
 ayHQhGlj4zIOR6sbV4rdJjpQs1MZHktBgzyPG2SInzSmFEYbsu2TQdannNe0x3TswC5G
 v/Kw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzvMCAPLZAmbHUPy/SdOmqXAT1LC4SLTq3hCz7LKjqjGK3enx6tQNOq4Kxux+b9+Q83BChL8xDwtKnK@nongnu.org
X-Gm-Message-State: AFuF++mr73O7uYQGzYjIQF6S/mUG6LmJ5/I6LQvQ1B4+VNO++ylGNMjs
 v/Mtnq+TSoP1Yw1lqcsiYgyAGm5AN8NKQDYBF5VBQub+g1GQVm7beMgScyGu8eYM
X-Gm-Gg: AYBFou2g09pNK5CufohJOPyREoBDsHSgbgkmA7MpY+FIB4kEAUvEfqhxngePsdT5R3t
 tt8N7vm8M2+w+hWF0qS0z0H7Ey0+iQ0BknlRNLS+OonMA+moGXd62xScxdPfQ4/VMaF2MwJPO4p
 wqmUjXedcuhNaygHakZT5y8Y//j5YJFI+lY3bbzlpFj4v+6HDGLvlys+uWuwuL+XcFmVFZ8l0el
 WqaEJkgG4Y9YL82FB+mmHOu1eDgb5a72I92FlJXyG4imiZQcoI9zS8FHLPs+KmxFELwU15K2FWN
 d4CFiZlaUDnR3fsCL4nxb0DrdvKRiEt9U8A2EpqR8oUJ9SLk8fg363d4BuXx3QiAbQRGWOhMjkh
 GF+koj/2bkzNV/5N4x5nDdlODdc7PNbCDlZkthoVRxN1/2L5x81kms4nE7Ye+63sPNTyUNCx+jd
 hTYNls31RT13knxVeS5lebZAlj0QAcyVAcM8PgfgapWqO8Ay1X33W7Q6xcJwSvprXWS4yz0vz/7
 hBz8047HI6SFF7eHIJfiaK8kBp2DM5hCUgHzf6r+Px9Eai4TVmweS46ms10D2oy52jnt7NfiFlD
 Yq3h7OlROc/GNflSlNS19ykNjqdVQ4I=
X-Received: by 2002:a17:90a:c10e:b0:36b:bec8:94c5 with SMTP id
 98e67ed59e1d1-39aedff8438mr15563810a91.10.1788414759254; 
 Wed, 02 Sep 2026 22:52:39 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1431990a39bsm2770619c88.3.2026.09.02.22.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 22:52:38 -0700 (PDT)
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
Subject: [PATCH v3 03/16] hw/intc/riscv_imsic: Take a MemoryRegion for the
 created device
Date: Thu,  3 Sep 2026 15:21:17 +0930
Message-ID: <20260903055131.257903-4-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260903055131.257903-1-joel@jms.id.au>
References: <20260903055131.257903-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=joel.stan@gmail.com; helo=mail-pl1-x633.google.com
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

riscv_imsic_create() maps the device it creates into system_memory,
which prevents its use by SoCs that map devices into their own memory
container.

Add a MemoryRegion parameter and map the device into it instead of
calling sysbus_mmio_map(). All callers pass system_memory, so there is
no change in behaviour.

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 include/hw/intc/riscv_imsic.h | 3 ++-
 hw/intc/riscv_imsic.c         | 6 ++++--
 hw/riscv/aia.c                | 6 ++++--
 hw/riscv/xiangshan_kmh.c      | 5 +++--
 4 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/include/hw/intc/riscv_imsic.h b/include/hw/intc/riscv_imsic.h
index fae999731dff..0a1df1c2f8d6 100644
--- a/include/hw/intc/riscv_imsic.h
+++ b/include/hw/intc/riscv_imsic.h
@@ -62,7 +62,8 @@ struct RISCVIMSICState {
     uint32_t num_irqs;
 };
 
-DeviceState *riscv_imsic_create(hwaddr addr, uint32_t hartid, bool mmode,
+DeviceState *riscv_imsic_create(MemoryRegion *container, hwaddr addr,
+                                uint32_t hartid, bool mmode,
                                 uint32_t num_pages, uint32_t num_ids);
 
 #endif
diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
index d6b46cdca220..cb9ce9612cff 100644
--- a/hw/intc/riscv_imsic.c
+++ b/hw/intc/riscv_imsic.c
@@ -495,7 +495,8 @@ type_init(riscv_imsic_register_types)
 /*
  * Create IMSIC device.
  */
-DeviceState *riscv_imsic_create(hwaddr addr, uint32_t hartid, bool mmode,
+DeviceState *riscv_imsic_create(MemoryRegion *container, hwaddr addr,
+                                uint32_t hartid, bool mmode,
                                 uint32_t num_pages, uint32_t num_ids)
 {
     DeviceState *dev = qdev_new(TYPE_RISCV_IMSIC);
@@ -518,7 +519,8 @@ DeviceState *riscv_imsic_create(hwaddr addr, uint32_t hartid, bool mmode,
     qdev_prop_set_uint32(dev, "num-irqs", num_ids + 1);
 
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
+    memory_region_add_subregion(container, addr,
+        sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0));
 
     if (!kvm_irqchip_in_kernel()) {
         for (i = 0; i < num_pages; i++) {
diff --git a/hw/riscv/aia.c b/hw/riscv/aia.c
index e11382e512da..eae7638f972b 100644
--- a/hw/riscv/aia.c
+++ b/hw/riscv/aia.c
@@ -53,7 +53,8 @@ DeviceState *riscv_create_aia(MemoryRegion *container,
             /* Per-socket M-level IMSICs */
             addr = imsic_m->base + socket * (1U << IMSIC_MMIO_GROUP_MIN_SHIFT);
             for (i = 0; i < hart_count; i++) {
-                riscv_imsic_create(addr + i * m_imsic_stride,
+                riscv_imsic_create(container,
+                                   addr + i * m_imsic_stride,
                                    base_hartid + i, true, 1,
                                    num_msis);
             }
@@ -62,7 +63,8 @@ DeviceState *riscv_create_aia(MemoryRegion *container,
         /* Per-socket S-level IMSICs */
         addr = imsic_s->base + socket * (1U << IMSIC_MMIO_GROUP_MIN_SHIFT);
         for (i = 0; i < hart_count; i++) {
-            riscv_imsic_create(addr + i * s_imsic_stride,
+            riscv_imsic_create(container,
+                               addr + i * s_imsic_stride,
                                base_hartid + i, false, 1 + aia_guests,
                                num_msis);
         }
diff --git a/hw/riscv/xiangshan_kmh.c b/hw/riscv/xiangshan_kmh.c
index 94f9d02a00b9..9eb608f8c578 100644
--- a/hw/riscv/xiangshan_kmh.c
+++ b/hw/riscv/xiangshan_kmh.c
@@ -65,14 +65,15 @@ static DeviceState *xiangshan_kmh_create_aia(uint32_t num_harts)
     /* M-level IMSICs */
     addr = memmap[XIANGSHAN_KMH_IMSIC_M].base;
     for (i = 0; i < num_harts; i++) {
-        riscv_imsic_create(addr + i * IMSIC_HART_SIZE(0), i, true,
+        riscv_imsic_create(get_system_memory(),
+                           addr + i * IMSIC_HART_SIZE(0), i, true,
                            1, XIANGSHAN_KMH_IMSIC_NUM_IDS);
     }
 
     /* S-level IMSICs */
     addr = memmap[XIANGSHAN_KMH_IMSIC_S].base;
     for (i = 0; i < num_harts; i++) {
-        riscv_imsic_create(addr +
+        riscv_imsic_create(get_system_memory(), addr +
                            i * IMSIC_HART_SIZE(XIANGSHAN_KMH_IMSIC_GUEST_BITS),
                            i, false, 1 + XIANGSHAN_KMH_IMSIC_GUEST_BITS,
                            XIANGSHAN_KMH_IMSIC_NUM_IDS);
-- 
2.47.3


