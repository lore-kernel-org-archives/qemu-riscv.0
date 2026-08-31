Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B040C61DE2
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 02:17:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x0rZE-0003YR-2c; Sun, 30 Aug 2026 22:16:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x0rZC-0003Xp-Kl
 for qemu-riscv@nongnu.org; Sun, 30 Aug 2026 22:16:10 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x0rZB-0007a3-3N
 for qemu-riscv@nongnu.org; Sun, 30 Aug 2026 22:16:10 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-396750cfee6so2310191a91.2
 for <qemu-riscv@nongnu.org>; Sun, 30 Aug 2026 19:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788142567; x=1788747367; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZgJzq+XsYOvtH3xWP7INoFWVb96qT7YPWqEHVflcXbM=;
 b=UfpTiroqkX04HZ3dYHkokjkeh0boLln7jQxkb6U12ZO0OOU46yv5ux5NJYFTDALR0c
 VWY7sSwEddtleLSDMwE/RrZWckWfTyzVKNEE2ODPiwzneWjRaXHeI11TXKTX5CnTIntY
 aBiWf1VgYRcuH+l6V9ji/K78SLa/a5t4IRUjHnNy6usBtLruxd1BRB3uUrwviy8sAHE7
 ugcdcuxcbP+g3o7Uk+Rt8NXdZ5b+Rms3/2QWJkKlz8AzEIUbHeKP/zKBbSileeje/b/r
 lfzHkjDSLrlGo0hgRjVWsTzqKynMUH6KXlbJ9lEtqXf4bWmK7/HhcYrXlLhVTkwxR7tz
 vt2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788142567; x=1788747367;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ZgJzq+XsYOvtH3xWP7INoFWVb96qT7YPWqEHVflcXbM=;
 b=iqZrBxFP7V5aDkQDS9c18CM5ZkcU+jAPaUa0o0decLz17K2/Y1kQcC3Vc25PhWBmjh
 iAhOIA/odsgv/aQIZ0YSCYQn4Ur8YJI0YT+4YYdteFDCUqJPbHZLH1vNYjB8RcWIvnwz
 z8880xdTpix58VJWuNmjqCAothbt5nLEQwT6JeTGlPglo0mRk8r0g+MrMNfvZ5YVwQpp
 +Wc5HpTpGYenr+bWk29NKQ02pJ+n3w+CJoU+L5lsmV2WDNhi21la8Zt8zWh49paUuNwL
 qkangEBgWcEMBznEHg59ktBD8hCRtQmUaf4o3Jy8NwFGjl3jFBOKkImsFe85EUwK51fe
 FE0A==
X-Forwarded-Encrypted: i=1;
 AKwUvBzQ2KQ7l9BTJFxBWcFmcZpCl1FQYumpSFHAg50+dMYGsU2q6xFvUZ0N4idZJ73NnT1IeIVSIEFQ7vD3@nongnu.org
X-Gm-Message-State: AFuF++mG2MNfln+7xyuD2Uwi9G+aLD56lb1YIOTK0HbkSqCFBBorsGmN
 IHAaum18DstW6pqpVBUGjfS7UI2+D5zRoX+UQhJbIAARTzwESVRNmCyh
X-Gm-Gg: AYBFou3yVSJLvFuuefo84icOM1JGjgEWQ0z57GiY1Pa9KW5GbPPNw9jLg1c93FoOzie
 ZB9A3IU4geL9ux+6SAkIKHyf5udcnhonCO0v00IKlETb+zIZrbkx1oxX0eAqB8yetJEKpm7bPhP
 fLPD9uT4rtqEFaUYYtXmBcSFOeBgVu1iBRTV5lnLx8AzkW9lG/b1JQzV2Gb+1rnNEjL7k+wOZEr
 JUpD4LX78Rabbwp1oS43MAQxfpjqtJ8EVkYnbuaR3voqLuONYrfwe/vYMGEWeJDcZ6gQb/i1p3l
 t16o+5SgvI7gR4nMGHhbC1Af4iFtOUCaZpIwblJtDEUGd1ZI5BNligvqvp1mKGpiShi8/LtNGa0
 dEqJIxHAL8PLgM8e4bhr70AdqJkC8oIZc9f+N3v6F9ZyvIFyX+ICtOGfRnfTCtYuwzYgxCvTwob
 Mc4cuuaW6vtuPIdtdjav+hL6TeNbgmbOzbdP21hcrVM4XaJyg3JKLKxKQRngnKLWLD7yvpRaL/3
 6miyG3MvORTdZ6mrryJ9kgUgY1fVyQHrI+OzmiybOKFWzCfgq4phb39+4H4bras1ix3lYMJXMVn
 q9DWmxHe0pc7PC/zwMFB
X-Received: by 2002:a17:90b:1e05:b0:398:9bd5:490c with SMTP id
 98e67ed59e1d1-3989bd54c4emr18003924a91.19.1788142567592; 
 Sun, 30 Aug 2026 19:16:07 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-396b186807bsm20071240a91.12.2026.08.30.19.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Aug 2026 19:16:07 -0700 (PDT)
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
Subject: [PATCH v2 07/16] hw/riscv/atlantis: Make UART unimp region a SoC
 device
Date: Mon, 31 Aug 2026 11:44:48 +0930
Message-ID: <20260831021500.82565-8-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260831021500.82565-1-joel@jms.id.au>
References: <20260831021500.82565-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x1029.google.com
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

Make the unimplemented region covering the remainder of the console
UART's register space a SoC child device, mapped using a helper. This
makes it easier to map it into the SoC's memory container along with
the other devices in the future.

While here, rename the region from uart0 to uart1. The uart0 name was
a leftover from an earlier revision that used a different device for
the console.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 include/hw/riscv/tt_atlantis.h |  2 ++
 hw/riscv/tt_atlantis.c         | 19 ++++++++++++++++---
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/include/hw/riscv/tt_atlantis.h b/include/hw/riscv/tt_atlantis.h
index 7f7d4a5a5905..c9308aa57017 100644
--- a/include/hw/riscv/tt_atlantis.h
+++ b/include/hw/riscv/tt_atlantis.h
@@ -13,6 +13,7 @@
 #include "hw/core/sysbus.h"
 #include "hw/i2c/designware_i2c.h"
 #include "hw/intc/riscv_imsic.h"
+#include "hw/misc/unimp.h"
 #include "hw/riscv/riscv_hart.h"
 
 #define TYPE_TT_ATLANTIS_MACHINE MACHINE_TYPE_NAME("tt-atlantis")
@@ -31,6 +32,7 @@ struct TTAtlantisState {
     RISCVHartArrayState soc;
     DeviceState *irqchip;
     DesignWareI2CState i2c[TT_ATL_NUM_I2C];
+    UnimplementedDeviceState uart1;
 
     int fdt_size;
 };
diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
index 3f183db5c302..acfd0d31b368 100644
--- a/hw/riscv/tt_atlantis.c
+++ b/hw/riscv/tt_atlantis.c
@@ -409,6 +409,17 @@ static void load_fdt(TTAtlantisState *s)
     create_fdt_memory(s);
 }
 
+static void mmio_map_unimplemented(MemoryRegion *memory, SysBusDevice *dev,
+                                   const char *name, hwaddr addr, uint64_t size)
+{
+    qdev_prop_set_string(DEVICE(dev), "name", name);
+    qdev_prop_set_uint64(DEVICE(dev), "size", size);
+    sysbus_realize(dev, &error_abort);
+
+    memory_region_add_subregion_overlap(memory, addr,
+                                        sysbus_mmio_get_region(dev, 0), -1000);
+}
+
 static void tt_atlantis_machine_done(Notifier *notifier, void *data)
 {
     TTAtlantisState *s = container_of(notifier, TTAtlantisState, machine_done);
@@ -560,9 +571,11 @@ static void tt_atlantis_machine_init(MachineState *machine)
      * Create an unimplemented device region so writes don't fault
      * and reads return zero, which keeps Linux happy.
      */
-    create_unimplemented_device("tt-atlantis.uart0",
-                                s->memmap[TT_ATL_UART1].base,
-                                s->memmap[TT_ATL_UART1].size);
+    object_initialize_child(OBJECT(s), "uart1", &s->uart1,
+                            TYPE_UNIMPLEMENTED_DEVICE);
+    mmio_map_unimplemented(system_memory, SYS_BUS_DEVICE(&s->uart1),
+                           "tt-atlantis.uart1", s->memmap[TT_ATL_UART1].base,
+                           s->memmap[TT_ATL_UART1].size);
 
     /* I2C */
     for (int i = 0; i < TT_ATL_NUM_I2C; i++) {
-- 
2.47.3


