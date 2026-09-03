Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D773C624D4
	for <qemu-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 05:53:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x20NW-0006YF-6V; Thu, 03 Sep 2026 01:52:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x20NU-0006Xd-Sc
 for qemu-riscv@nongnu.org; Thu, 03 Sep 2026 01:52:48 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x20NT-0006MP-2k
 for qemu-riscv@nongnu.org; Thu, 03 Sep 2026 01:52:48 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2d032846c95so23844655ad.1
 for <qemu-riscv@nongnu.org>; Wed, 02 Sep 2026 22:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788414766; x=1789019566; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=yGXqGOhFINrkzmTDkTgJiKMBSthXsc7AjRv1SKMbF64=;
 b=qx6SXxtuiixzQbW5JzljZLkNhsuDvE/7L+2fCAxi4C6K+LFT0qjN6lSIUS0QTzxRca
 rfyF7Ci8hPnskn/lCJb9QQ4ikI9VxysfR4x36PNj7303FlX6ND9kD/3CG1Phh5rfs3Fn
 aYAFMJ9NJEaXrcY/n7xbMwTt4HnD+eA3kE4WzxKflu2L7OQXZyv5ZCfgWyiXVosWqgUl
 eHnQ6w0ijujkt+mAMvHnMZSCxK/pN6MsEFiqjcpuxgq5EbEVDvcbtVAhy6CQridpKE8m
 FPpmfo9d4T7R7MTjHHLjmhS36v/yDtt3kOr2fgBsRk8sA+wCvBnO5WTepjKVWD+pf2zH
 UKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788414766; x=1789019566;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=yGXqGOhFINrkzmTDkTgJiKMBSthXsc7AjRv1SKMbF64=;
 b=G5XEqhpE8eQVbW+sbICBLsa0LUM+ZLUh4yk0f9+n7SrBbnv/Drzap2AIYHBTicgnow
 5U/N4NhW0K2vaMJSVlEpfLC7Ps/DKLCAk97qfL/H0/+iPeDj2ccnGzEqJrFUlDP0AE72
 iKv3hew11DtyG2OjFwnVyITXqn7Q3ZuYjlMT2e074ggi4Mc09z6xsIvU1h+C3kLGUypJ
 KNuvWdpQPgbxng8SYuiBT/SOJB+pzF1b3DjI6UePmQ/cryLgt2+l1732+r/3kOP1YWN3
 v58MyvdNG6L0+RIpzINokexlfCats52so8MwfyCPF9tn5BpcextVEM4/lyzeCy147eWI
 5RpQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxbKSVPSBqGJd+wWxy9vH+jbcT+oU46cG1vg8ajcIjVD9F2JagHGwYxQ5RArNBZJysB66FmWZUnoOKJ@nongnu.org
X-Gm-Message-State: AFuF++mo68VHdRcKqXCok/rxRKJeniRWyXL3+qWWQWjZqdNPr8MR7I5w
 wouEGOtLN8TijiNxoGyXBi/T299udkdzj+lNeJbh0HAEgx91qrgD2hEO
X-Gm-Gg: AYBFou2usf3lFlztvCcbS9uz6EKdgKCx284JfinxqcC8WAmUMLhazq+6r4F71vl/DxD
 yC7m6v7eqJOxHPVZG41o//JjCb1iZeic5KoAwEaUgbNPHYukGtyFBD10+egXk8E431lG4SPp+QD
 olp23HHtOPHiAzGe8T2WJnISLbzZIU5HxYWswvwh8BFG7W0K6vT4yvP+YuMlK1TaV3jDjlggj/A
 aAesdfUOJj6w+n8MgJWKRWsj3NxZ4/iW/r3scI1qZkkIlQpGAfclViHOy5g4IgLnNJtNNk9cHN7
 2VRSf0R94zCxhEP3D8sLwApvNPdqFO13kPa3YG28HXd18Uo31qFOvcusADDCp/f5iTMuKpaR32A
 Es7e+xh65VX/8VIhtAFTMrqdfEaq7UE2/zPF9ZnuqqXECBZHHx9Y4KA5m2v2oy5DIzfk6GjebWf
 Foc+SElG5dvonNlhaSte0TuCSxRfGEDYx5hyVlMI2xsupuZENTgW0h+y5QG73rrhCyo8NFzm0nf
 4Xxu4cA6/0TNrjumsOaNJzevwY9Iq5hFQTz4xwkrq3lcXqGbpj+tTXqoDEg64ZWeVJ23DnrrTz3
 2aM07RlYee/gMwRNuYxg
X-Received: by 2002:a17:90b:4a46:b0:399:ea1:5a82 with SMTP id
 98e67ed59e1d1-39aedf7cc37mr14262163a91.3.1788414765589; 
 Wed, 02 Sep 2026 22:52:45 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1431990a39bsm2770619c88.3.2026.09.02.22.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 22:52:43 -0700 (PDT)
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
Subject: [PATCH v3 04/16] hw/intc/riscv_aplic: Take a MemoryRegion for the
 created device
Date: Thu,  3 Sep 2026 15:21:18 +0930
Message-ID: <20260903055131.257903-5-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260903055131.257903-1-joel@jms.id.au>
References: <20260903055131.257903-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=joel.stan@gmail.com; helo=mail-pl1-x631.google.com
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

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 include/hw/intc/riscv_aplic.h |  7 ++++---
 hw/intc/riscv_aplic.c         | 10 ++++++----
 hw/riscv/aia.c                |  8 ++++----
 hw/riscv/cps.c                |  6 ++++--
 hw/riscv/xiangshan_kmh.c      |  6 ++++--
 5 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/include/hw/intc/riscv_aplic.h b/include/hw/intc/riscv_aplic.h
index c7a4d4ad0172..62d2b33ade61 100644
--- a/include/hw/intc/riscv_aplic.h
+++ b/include/hw/intc/riscv_aplic.h
@@ -80,8 +80,9 @@ bool riscv_is_kvm_aia_aplic_imsic(bool msimode);
 bool riscv_use_emulated_aplic(bool msimode);
 void riscv_aplic_set_kvm_msicfgaddr(RISCVAPLICState *aplic, hwaddr addr);
 
-DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,
-    uint32_t hartid_base, uint32_t num_harts, uint32_t num_sources,
-    uint32_t iprio_bits, bool msimode, bool mmode, DeviceState *parent);
+DeviceState *riscv_aplic_create(MemoryRegion *container,
+    hwaddr addr, hwaddr size, uint32_t hartid_base, uint32_t num_harts,
+    uint32_t num_sources, uint32_t iprio_bits, bool msimode, bool mmode,
+    DeviceState *parent);
 
 #endif
diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
index 84606e9f3d88..d8e25bfda14b 100644
--- a/hw/intc/riscv_aplic.c
+++ b/hw/intc/riscv_aplic.c
@@ -1109,9 +1109,10 @@ void riscv_aplic_add_child(DeviceState *parent, DeviceState *child)
 /*
  * Create APLIC device.
  */
-DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,
-    uint32_t hartid_base, uint32_t num_harts, uint32_t num_sources,
-    uint32_t iprio_bits, bool msimode, bool mmode, DeviceState *parent)
+DeviceState *riscv_aplic_create(MemoryRegion *container,
+    hwaddr addr, hwaddr size, uint32_t hartid_base, uint32_t num_harts,
+    uint32_t num_sources, uint32_t iprio_bits, bool msimode, bool mmode,
+    DeviceState *parent)
 {
     DeviceState *dev = qdev_new(TYPE_RISCV_APLIC);
     uint32_t i;
@@ -1137,7 +1138,8 @@ DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     if (riscv_use_emulated_aplic(msimode)) {
-        sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
+        memory_region_add_subregion(container, addr,
+            sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0));
 
         if (!msimode) {
             for (i = 0; i < num_harts; i++) {
diff --git a/hw/riscv/aia.c b/hw/riscv/aia.c
index eae7638f972b..56fc06453321 100644
--- a/hw/riscv/aia.c
+++ b/hw/riscv/aia.c
@@ -72,8 +72,8 @@ DeviceState *riscv_create_aia(MemoryRegion *container,
 
     if (!kvm_enabled()) {
         /* Per-socket M-level APLIC */
-        aplic_m_dev = riscv_aplic_create(aplic_m->base +
-                                     socket * aplic_m->size,
+        aplic_m_dev = riscv_aplic_create(container,
+                                     aplic_m->base + socket * aplic_m->size,
                                      aplic_m->size,
                                      (msimode) ? 0 : base_hartid,
                                      (msimode) ? 0 : hart_count,
@@ -83,8 +83,8 @@ DeviceState *riscv_create_aia(MemoryRegion *container,
     }
 
     /* Per-socket S-level APLIC */
-    aplic_s_dev = riscv_aplic_create(aplic_s->base +
-                                 socket * aplic_s->size,
+    aplic_s_dev = riscv_aplic_create(container,
+                                 aplic_s->base + socket * aplic_s->size,
                                  aplic_s->size,
                                  (msimode) ? 0 : base_hartid,
                                  (msimode) ? 0 : hart_count,
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


