Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3GMv-0003j5-Ss
	for mharc-qemu-riscv@gnu.org; Sat, 23 Jan 2021 05:42:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GM6-0003Rm-LO; Sat, 23 Jan 2021 05:41:27 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:38667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GM0-0003C1-FN; Sat, 23 Jan 2021 05:41:22 -0500
Received: by mail-pl1-x62f.google.com with SMTP id d4so4732272plh.5;
 Sat, 23 Jan 2021 02:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pRs6fw4syraDIfWHfkirOfF/LqfuKed1GwSHTU6tXmM=;
 b=TvPtMMAdT78IV8pwruzP8+XlqRihVM46eePgAsWGkGAu1L+84LbRdD0fZEhYSAaUwK
 slD5CgkuwnGePZn/ntes2JSjvu0vuaSbUS6l7VAwH+NsvwoZXNUiJyhPi6786mFhSjmu
 d7PyGAdfAV2KKLVgUPjgnvZDomDSOBZxvBoYIdYmQENQ8S/wvM6UvC5PE8IXpBo6h5wl
 9qekMdre4xQDE/kRTDvEG6K5B+kLc1zlNLzqXzJjr4P5/StcNcPObfeNJuadZ7Obhs+X
 CIch49EprF34o7rdhWYZfGUs32FBfyrx+xExeoMDyMg2dpTcx4qDSCsLIlY/YiDM3ir3
 UsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pRs6fw4syraDIfWHfkirOfF/LqfuKed1GwSHTU6tXmM=;
 b=tvD9VW4y/cVUJVkCpVpku48QtL9MZ1W+YxVOmqafhFTlz1uJBIQ60noCBDeIWUkveI
 T0ccgqcJk8cqSafps+LtcxmTboAgfuoqFHAmEJznY3FYHOb2pK3OsdJPp6v7BsMGtG2w
 yXYt+3tt6+/XVNT1Jl1IVapjgFxb+mEt1I9Am01LN2Rdsn+gvdUp3c5cY7hlEU3+ev9X
 5UGrrJxttQPdDi2hfsrJwG8DYXK3sBJyacLjYJVA9XLGNV8lyUzi5c5ir+GYWdwa926R
 QtKNpRpKabtTuA/e4LCPqFJPjXfb7H5T1JWYARRXAFGEW0z/q+Vd0ln9IlzQwZ6z0TTt
 fP2A==
X-Gm-Message-State: AOAM532lzk5a2UE5N6Ysv1ZeAFqNE8DOieBFbFXMNIJUJh0347ydtwfO
 NQDiqq9k4rdNsU1F07ViFsA=
X-Google-Smtp-Source: ABdhPJxmKZdm9BmmQxznWpECv0woLSwhSWWT6zP1A3cMwjxYth0kGpj0C5olmpFy9/InF8spZ1RAxg==
X-Received: by 2002:a17:90a:5b06:: with SMTP id
 o6mr10748800pji.49.1611398474089; 
 Sat, 23 Jan 2021 02:41:14 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id a5sm10575463pgl.41.2021.01.23.02.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 02:41:13 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 19/25] hw/ssi: Add SiFive SPI controller support
Date: Sat, 23 Jan 2021 18:40:10 +0800
Message-Id: <20210123104016.17485-20-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210123104016.17485-1-bmeng.cn@gmail.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Sat, 23 Jan 2021 10:41:45 -0000

From: Bin Meng <bin.meng@windriver.com>

This adds the SiFive SPI controller model for the FU540 SoC.
The direct memory-mapped SPI flash mode is unsupported.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- Log guest error when trying to write reserved registers
- Log guest error when trying to access out-of-bounds registers
- log guest error when writing to reserved bits for chip select
  registers and watermark registers
- Log unimplemented warning when trying to write direct-map flash
  interface registers
- Add test tx fifo full logic in sifive_spi_read(), hence remove
  setting the tx fifo full flag in sifive_spi_write().
- Populate register with their default value

 include/hw/ssi/sifive_spi.h |  47 +++++
 hw/ssi/sifive_spi.c         | 367 ++++++++++++++++++++++++++++++++++++
 hw/ssi/Kconfig              |   4 +
 hw/ssi/meson.build          |   1 +
 4 files changed, 419 insertions(+)
 create mode 100644 include/hw/ssi/sifive_spi.h
 create mode 100644 hw/ssi/sifive_spi.c

diff --git a/include/hw/ssi/sifive_spi.h b/include/hw/ssi/sifive_spi.h
new file mode 100644
index 0000000000..47d0d6a47c
--- /dev/null
+++ b/include/hw/ssi/sifive_spi.h
@@ -0,0 +1,47 @@
+/*
+ * QEMU model of the SiFive SPI Controller
+ *
+ * Copyright (c) 2021 Wind River Systems, Inc.
+ *
+ * Author:
+ *   Bin Meng <bin.meng@windriver.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_SIFIVE_SPI_H
+#define HW_SIFIVE_SPI_H
+
+#define SIFIVE_SPI_REG_NUM  (0x78 / 4)
+
+#define TYPE_SIFIVE_SPI "sifive.spi"
+#define SIFIVE_SPI(obj) OBJECT_CHECK(SiFiveSPIState, (obj), TYPE_SIFIVE_SPI)
+
+typedef struct SiFiveSPIState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion mmio;
+    qemu_irq irq;
+
+    uint32_t num_cs;
+    qemu_irq *cs_lines;
+
+    SSIBus *spi;
+
+    Fifo8 tx_fifo;
+    Fifo8 rx_fifo;
+
+    uint32_t regs[SIFIVE_SPI_REG_NUM];
+} SiFiveSPIState;
+
+#endif /* HW_SIFIVE_SPI_H */
diff --git a/hw/ssi/sifive_spi.c b/hw/ssi/sifive_spi.c
new file mode 100644
index 0000000000..61504336ad
--- /dev/null
+++ b/hw/ssi/sifive_spi.c
@@ -0,0 +1,367 @@
+/*
+ * QEMU model of the SiFive SPI Controller
+ *
+ * Copyright (c) 2021 Wind River Systems, Inc.
+ *
+ * Author:
+ *   Bin Meng <bin.meng@windriver.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "hw/sysbus.h"
+#include "hw/ssi/ssi.h"
+#include "sysemu/sysemu.h"
+#include "qemu/fifo8.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "hw/ssi/sifive_spi.h"
+
+#define R_SCKDIV        (0x00 / 4)
+#define R_SCKMODE       (0x04 / 4)
+#define R_CSID          (0x10 / 4)
+#define R_CSDEF         (0x14 / 4)
+#define R_CSMODE        (0x18 / 4)
+#define R_DELAY0        (0x28 / 4)
+#define R_DELAY1        (0x2C / 4)
+#define R_FMT           (0x40 / 4)
+#define R_TXDATA        (0x48 / 4)
+#define R_RXDATA        (0x4C / 4)
+#define R_TXMARK        (0x50 / 4)
+#define R_RXMARK        (0x54 / 4)
+#define R_FCTRL         (0x60 / 4)
+#define R_FFMT          (0x64 / 4)
+#define R_IE            (0x70 / 4)
+#define R_IP            (0x74 / 4)
+
+#define FMT_DIR         (1 << 3)
+
+#define TXDATA_FULL     (1 << 31)
+#define RXDATA_EMPTY    (1 << 31)
+
+#define IE_TXWM         (1 << 0)
+#define IE_RXWM         (1 << 1)
+
+#define IP_TXWM         (1 << 0)
+#define IP_RXWM         (1 << 1)
+
+#define FIFO_CAPACITY   8
+
+static void sifive_spi_txfifo_reset(SiFiveSPIState *s)
+{
+    fifo8_reset(&s->tx_fifo);
+
+    s->regs[R_TXDATA] &= ~TXDATA_FULL;
+    s->regs[R_IP] &= ~IP_TXWM;
+}
+
+static void sifive_spi_rxfifo_reset(SiFiveSPIState *s)
+{
+    fifo8_reset(&s->rx_fifo);
+
+    s->regs[R_RXDATA] |= RXDATA_EMPTY;
+    s->regs[R_IP] &= ~IP_RXWM;
+}
+
+static void sifive_spi_update_cs(SiFiveSPIState *s)
+{
+    int i;
+
+    for (i = 0; i < s->num_cs; i++) {
+        if (s->regs[R_CSDEF] & (1 << i)) {
+            qemu_set_irq(s->cs_lines[i], !(s->regs[R_CSMODE]));
+        }
+    }
+}
+
+static void sifive_spi_update_irq(SiFiveSPIState *s)
+{
+    int level;
+
+    if (fifo8_num_used(&s->tx_fifo) < s->regs[R_TXMARK]) {
+        s->regs[R_IP] |= IP_TXWM;
+    } else {
+        s->regs[R_IP] &= ~IP_TXWM;
+    }
+
+    if (fifo8_num_used(&s->rx_fifo) > s->regs[R_RXMARK]) {
+        s->regs[R_IP] |= IP_RXWM;
+    } else {
+        s->regs[R_IP] &= ~IP_RXWM;
+    }
+
+    level = s->regs[R_IP] & s->regs[R_IE] ? 1 : 0;
+    qemu_set_irq(s->irq, level);
+}
+
+static void sifive_spi_reset(DeviceState *d)
+{
+    SiFiveSPIState *s = SIFIVE_SPI(d);
+
+    memset(s->regs, 0, sizeof(s->regs));
+
+    /* The reset value is high for all implemented CS pins */
+    s->regs[R_CSDEF] = (1 << s->num_cs) - 1;
+
+    /* Populate register with their default value */
+    s->regs[R_SCKDIV] = 0x03;
+    s->regs[R_DELAY0] = 0x1001;
+    s->regs[R_DELAY1] = 0x01;
+
+    sifive_spi_txfifo_reset(s);
+    sifive_spi_rxfifo_reset(s);
+
+    sifive_spi_update_cs(s);
+    sifive_spi_update_irq(s);
+}
+
+static void sifive_spi_flush_txfifo(SiFiveSPIState *s)
+{
+    uint8_t tx;
+    uint8_t rx;
+
+    while (!fifo8_is_empty(&s->tx_fifo)) {
+        tx = fifo8_pop(&s->tx_fifo);
+        s->regs[R_TXDATA] &= ~TXDATA_FULL;
+
+        rx = ssi_transfer(s->spi, tx);
+
+        if (fifo8_is_full(&s->rx_fifo)) {
+            s->regs[R_IP] |= IP_RXWM;
+        } else {
+            if (!(s->regs[R_FMT] & FMT_DIR)) {
+                fifo8_push(&s->rx_fifo, rx);
+                s->regs[R_RXDATA] &= ~RXDATA_EMPTY;
+
+                if (fifo8_is_full(&s->rx_fifo)) {
+                    s->regs[R_IP] |= IP_RXWM;
+                }
+            }
+        }
+    }
+}
+
+static bool sifive_spi_is_bad_reg(hwaddr addr, bool allow_reserved)
+{
+    bool bad;
+
+    switch (addr) {
+    /* reserved offsets */
+    case 0x08:
+    case 0x0C:
+    case 0x1C:
+    case 0x20:
+    case 0x24:
+    case 0x30:
+    case 0x34:
+    case 0x38:
+    case 0x3C:
+    case 0x44:
+    case 0x58:
+    case 0x5C:
+    case 0x68:
+    case 0x6C:
+        bad = allow_reserved ? false : true;
+        break;
+    default:
+        bad = false;
+    }
+
+    if (addr >= (SIFIVE_SPI_REG_NUM << 2)) {
+        bad = true;
+    }
+
+    return bad;
+}
+
+static uint64_t sifive_spi_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    SiFiveSPIState *s = opaque;
+    uint32_t r;
+
+    if (sifive_spi_is_bad_reg(addr, true)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad read at address 0x%"
+                      HWADDR_PRIx "\n", __func__, addr);
+        return 0;
+    }
+
+    addr >>= 2;
+    switch (addr) {
+    case R_TXDATA:
+        if (fifo8_is_full(&s->tx_fifo)) {
+            return TXDATA_FULL;
+        }
+        r = 0;
+        break;
+
+    case R_RXDATA:
+        if (fifo8_is_empty(&s->rx_fifo)) {
+            return RXDATA_EMPTY;
+        }
+        r = fifo8_pop(&s->rx_fifo);
+        break;
+
+    default:
+        r = s->regs[addr];
+        break;
+    }
+
+    sifive_spi_update_irq(s);
+
+    return r;
+}
+
+static void sifive_spi_write(void *opaque, hwaddr addr,
+                             uint64_t val64, unsigned int size)
+{
+    SiFiveSPIState *s = opaque;
+    uint32_t value = val64;
+
+    if (sifive_spi_is_bad_reg(addr, false)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad write at addr=0x%"
+                      HWADDR_PRIx " value=0x%x\n", __func__, addr, value);
+        return;
+    }
+
+    addr >>= 2;
+    switch (addr) {
+    case R_CSID:
+        if (value >= s->num_cs) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid csid %d\n",
+                          __func__, value);
+        } else {
+            s->regs[R_CSID] = value;
+            sifive_spi_update_cs(s);
+        }
+        break;
+
+    case R_CSDEF:
+        if (value >= (1 << s->num_cs)) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid csdef %x\n",
+                          __func__, value);
+        } else {
+            s->regs[R_CSDEF] = value;
+        }
+        break;
+
+    case R_CSMODE:
+        if (value > 3) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid csmode %x\n",
+                          __func__, value);
+        } else {
+            s->regs[R_CSMODE] = value;
+            sifive_spi_update_cs(s);
+        }
+        break;
+
+    case R_TXDATA:
+        if (!fifo8_is_full(&s->tx_fifo)) {
+            fifo8_push(&s->tx_fifo, (uint8_t)value);
+            sifive_spi_flush_txfifo(s);
+        }
+        break;
+
+    case R_RXDATA:
+    case R_IP:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid write to read-only reigster 0x%"
+                      HWADDR_PRIx " with 0x%x\n", __func__, addr << 2, value);
+        break;
+
+    case R_TXMARK:
+    case R_RXMARK:
+        if (value >= FIFO_CAPACITY) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid watermark %d\n",
+                          __func__, value);
+        } else {
+            s->regs[addr] = value;
+        }
+        break;
+
+    case R_FCTRL:
+    case R_FFMT:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: direct-map flash interface unimplemented\n",
+                      __func__);
+        break;
+
+    default:
+        s->regs[addr] = value;
+        break;
+    }
+
+    sifive_spi_update_irq(s);
+}
+
+static const MemoryRegionOps sifive_spi_ops = {
+    .read = sifive_spi_read,
+    .write = sifive_spi_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4
+    }
+};
+
+static void sifive_spi_realize(DeviceState *dev, Error **errp)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    SiFiveSPIState *s = SIFIVE_SPI(dev);
+    int i;
+
+    s->spi = ssi_create_bus(dev, "spi");
+    sysbus_init_irq(sbd, &s->irq);
+
+    s->cs_lines = g_new0(qemu_irq, s->num_cs);
+    for (i = 0; i < s->num_cs; i++) {
+        sysbus_init_irq(sbd, &s->cs_lines[i]);
+    }
+
+    memory_region_init_io(&s->mmio, OBJECT(s), &sifive_spi_ops, s,
+                          TYPE_SIFIVE_SPI, 0x1000);
+    sysbus_init_mmio(sbd, &s->mmio);
+
+    fifo8_create(&s->tx_fifo, FIFO_CAPACITY);
+    fifo8_create(&s->rx_fifo, FIFO_CAPACITY);
+}
+
+static Property sifive_spi_properties[] = {
+    DEFINE_PROP_UINT32("num-cs", SiFiveSPIState, num_cs, 1),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void sifive_spi_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, sifive_spi_properties);
+    dc->reset = sifive_spi_reset;
+    dc->realize = sifive_spi_realize;
+}
+
+static const TypeInfo sifive_spi_info = {
+    .name           = TYPE_SIFIVE_SPI,
+    .parent         = TYPE_SYS_BUS_DEVICE,
+    .instance_size  = sizeof(SiFiveSPIState),
+    .class_init     = sifive_spi_class_init,
+};
+
+static void sifive_spi_register_types(void)
+{
+    type_register_static(&sifive_spi_info);
+}
+
+type_init(sifive_spi_register_types)
diff --git a/hw/ssi/Kconfig b/hw/ssi/Kconfig
index 9e54a0c8dd..7d90a02181 100644
--- a/hw/ssi/Kconfig
+++ b/hw/ssi/Kconfig
@@ -2,6 +2,10 @@ config PL022
     bool
     select SSI
 
+config SIFIVE_SPI
+    bool
+    select SSI
+
 config SSI
     bool
 
diff --git a/hw/ssi/meson.build b/hw/ssi/meson.build
index dee00c0da6..3d6bc82ab1 100644
--- a/hw/ssi/meson.build
+++ b/hw/ssi/meson.build
@@ -2,6 +2,7 @@ softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_smc.c'))
 softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('mss-spi.c'))
 softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_fiu.c'))
 softmmu_ss.add(when: 'CONFIG_PL022', if_true: files('pl022.c'))
+softmmu_ss.add(when: 'CONFIG_SIFIVE_SPI', if_true: files('sifive_spi.c'))
 softmmu_ss.add(when: 'CONFIG_SSI', if_true: files('ssi.c'))
 softmmu_ss.add(when: 'CONFIG_STM32F2XX_SPI', if_true: files('stm32f2xx_spi.c'))
 softmmu_ss.add(when: 'CONFIG_XILINX_SPI', if_true: files('xilinx_spi.c'))
-- 
2.25.1


