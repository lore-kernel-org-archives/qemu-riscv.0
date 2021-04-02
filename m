Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lSJBw-0005wB-Ru
	for mharc-qemu-riscv@gnu.org; Fri, 02 Apr 2021 08:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSJBv-0005sX-56; Fri, 02 Apr 2021 08:46:23 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:24027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSJBt-00031N-4P; Fri, 02 Apr 2021 08:46:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617367596; x=1648903596;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Os7n+GWnxmVvImN7e3kRWSNXb3qLqU+erXIev5tmqys=;
 b=IQdcLs0Mow91LMzYtCB80FHNDwffOLoXIxcFBGJ9Ru0Rh+CwwAl/p62o
 3yM7pVx/nrDlqR/0wJTK+F4crkUQHT2XSdf2J3s+bGOWqLJ4TKpMxgVbs
 MhZ27kqvF12O6zOkixuCVBYPd+W9o/V7qAvwySsKmKkYsZaw0OteSOuYb
 eFUPZQVTXerb1bpN12/ySRmPkPHWvGrsgW4meXhNfgeoxbs1KsBQm0Se1
 hxZER9KTxK+MfPMaV90Pp8BtizXhNm0Z8u1TPbLqHf8fWcBNLbJWWQY2k
 Zac7BTdYuxMlCAcewzXk2BzFu5LZ7KaZNEIkqGbTyEoyJwFR/iVkRpq7T g==;
IronPort-SDR: rAhXjssUBdoCSagovmHufcf9N17EnbXkruxSKZpgnHjmsldvAIcLRecny3rdsyXDd5cZggZWc1
 sdBt4xUrVkvA/zloGRdPvItJfRbHtPIEGRrAxteGykKESZ/FCgBmkFBU8puwKTvYgXPD47FTz/
 LzeQr+eQFkM1MlZ4XbZpxnKxwBVzTAHpftegU97/vllTOpmrkyoD6YAib74LwOGLubwa2wLbMN
 59VzB3fQ6gi/OQIFFtX+Ajd/BidAaFwv7d4GcdxNB7p4qJSQ/e5wP3w4I6i8X459drAngYb4U2
 VlQ=
X-IronPort-AV: E=Sophos;i="5.81,299,1610380800"; d="scan'208";a="268041631"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 02 Apr 2021 20:46:06 +0800
IronPort-SDR: 5nyhefzxct9oyYZZ+bBbfNV4S0TISFWi9/6syPxGOM4kIPaFSArQkjfKzBh7OieJXiLAywVwgg
 ++lsUU+VEDYQ0bjR+MN2SrML8OS6VTPdRrC2K7f4RaTllt0YbWyIlbggGqbGViqzBTArorAp1f
 QQVBdQKeZ0v8pUlqdQJJKkXaOyuRGw8ClsP1Op+GVHBo6LB9i3PtYIo5y+TU6NSH50KfZwBVX2
 Dz/qiVsuE2hTFcKcR/vEZkYIDVRARorYd9wTelg8S7iGbwmAWgP2H00PaERGKnDYMyJHFR90Xh
 lq2LE9F0Bp2wqi8WR6O5gUkX
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2021 05:27:33 -0700
IronPort-SDR: MEsgrhqFN2v6KYwFJ3G8r8BmAlx1rN1kf4yoksi+7lOhDrKZxIhvp/Gr/hXsCh2JpDvg5C+99y
 gLwE/7G6yXxm6X8S+ag4H/l0SU1glqO+GbXyvZUxeTE043y3uUrdHN4BMb/0YzmlfQgZD5KcLK
 116g3djsJe1CE7V2f1W6BraA1toovDSgFAY/GY6v6jRZ38dpI7FZve9yu45i2Yq+lqTSCejGQ/
 EZ5iWBwR25Yuv6XLWl3BXoMRibPuefABLC68a2sHFuWmqM7mB9yehk8LpzbiQOG2jqECIz/nEV
 2Co=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.78])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 Apr 2021 05:45:51 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, jrestivo@draper.com, aclifford@draper.com,
 astrnad@draper.com
Subject: [PATCH v1 2/2] sifive_u: Connect the SiFive PWM device
Date: Fri,  2 Apr 2021 08:43:56 -0400
Message-Id: <26fc95f280808909616ebb7a1e2a472443377ec1.1617367359.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <cover.1617367359.git.alistair.francis@wdc.com>
References: <cover.1617367359.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=7197bd837=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Apr 2021 12:46:23 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/sifive_u.h | 14 +++++++++++++-
 hw/riscv/sifive_u.c         | 23 ++++++++++++++++++++++-
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index 2656b39808..6e0779562d 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -27,6 +27,7 @@
 #include "hw/misc/sifive_u_otp.h"
 #include "hw/misc/sifive_u_prci.h"
 #include "hw/ssi/sifive_spi.h"
+#include "hw/timer/sifive_u_pwm.h"
 
 #define TYPE_RISCV_U_SOC "riscv.sifive.u.soc"
 #define RISCV_U_SOC(obj) \
@@ -49,6 +50,7 @@ typedef struct SiFiveUSoCState {
     SiFiveSPIState spi0;
     SiFiveSPIState spi2;
     CadenceGEMState gem;
+    SiFiveUPwmState pwm[2];
 
     uint32_t serial;
     char *cpu_type;
@@ -92,7 +94,9 @@ enum {
     SIFIVE_U_DEV_FLASH0,
     SIFIVE_U_DEV_DRAM,
     SIFIVE_U_DEV_GEM,
-    SIFIVE_U_DEV_GEM_MGMT
+    SIFIVE_U_DEV_GEM_MGMT,
+    SIFIVE_U_DEV_PWM0,
+    SIFIVE_U_DEV_PWM1
 };
 
 enum {
@@ -126,6 +130,14 @@ enum {
     SIFIVE_U_PDMA_IRQ5 = 28,
     SIFIVE_U_PDMA_IRQ6 = 29,
     SIFIVE_U_PDMA_IRQ7 = 30,
+    SIFIVE_U_DEV_PWM0_0 = 42,
+    SIFIVE_U_DEV_PWM0_1 = 43,
+    SIFIVE_U_DEV_PWM0_2 = 44,
+    SIFIVE_U_DEV_PWM0_3 = 45,
+    SIFIVE_U_DEV_PWM1_0 = 46,
+    SIFIVE_U_DEV_PWM1_1 = 47,
+    SIFIVE_U_DEV_PWM1_2 = 48,
+    SIFIVE_U_DEV_PWM1_3 = 49,
     SIFIVE_U_QSPI0_IRQ = 51,
     SIFIVE_U_GEM_IRQ = 53
 };
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 7b59942369..ba36a91ef8 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -74,6 +74,8 @@ static const MemMapEntry sifive_u_memmap[] = {
     [SIFIVE_U_DEV_PRCI] =     { 0x10000000,     0x1000 },
     [SIFIVE_U_DEV_UART0] =    { 0x10010000,     0x1000 },
     [SIFIVE_U_DEV_UART1] =    { 0x10011000,     0x1000 },
+    [SIFIVE_U_DEV_PWM0] =     { 0x10020000,     0x1000 },
+    [SIFIVE_U_DEV_PWM1] =     { 0x10021000,     0x1000 },
     [SIFIVE_U_DEV_QSPI0] =    { 0x10040000,     0x1000 },
     [SIFIVE_U_DEV_QSPI2] =    { 0x10050000,     0x1000 },
     [SIFIVE_U_DEV_GPIO] =     { 0x10060000,     0x1000 },
@@ -757,6 +759,8 @@ static void sifive_u_soc_instance_init(Object *obj)
     object_initialize_child(obj, "pdma", &s->dma, TYPE_SIFIVE_PDMA);
     object_initialize_child(obj, "spi0", &s->spi0, TYPE_SIFIVE_SPI);
     object_initialize_child(obj, "spi2", &s->spi2, TYPE_SIFIVE_SPI);
+    object_initialize_child(obj, "pwm0", &s->pwm[0], TYPE_SIFIVE_U_PWM);
+    object_initialize_child(obj, "pwm1", &s->pwm[1], TYPE_SIFIVE_U_PWM);
 }
 
 static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
@@ -769,7 +773,7 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
     MemoryRegion *l2lim_mem = g_new(MemoryRegion, 1);
     char *plic_hart_config;
     size_t plic_hart_config_len;
-    int i;
+    int i, j;
     NICInfo *nd = &nd_table[0];
 
     qdev_prop_set_uint32(DEVICE(&s->u_cpus), "num-harts", ms->smp.cpus - 1);
@@ -896,6 +900,23 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->gem), 0,
                        qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_U_GEM_IRQ));
 
+    /* PWM */
+    for (i = 0; i < 2; i++) {
+        if (!sysbus_realize(SYS_BUS_DEVICE(&s->pwm[i]), errp)) {
+            return;
+        }
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->pwm[i]), 0,
+                                memmap[SIFIVE_U_DEV_PWM0].base + (0x1000 * i));
+
+        /* Connect PWM interrupts to the PLIC */
+        for (j = 0; j < SIFIVE_U_PWM_IRQS; j++) {
+            sysbus_connect_irq(SYS_BUS_DEVICE(&s->pwm[i]), j,
+                               qdev_get_gpio_in(DEVICE(s->plic),
+                                            SIFIVE_U_DEV_PWM0_0 +
+                                                (i * SIFIVE_PDMA_IRQS) + j));
+        }
+    }
+
     create_unimplemented_device("riscv.sifive.u.gem-mgmt",
         memmap[SIFIVE_U_DEV_GEM_MGMT].base, memmap[SIFIVE_U_DEV_GEM_MGMT].size);
 
-- 
2.31.0


