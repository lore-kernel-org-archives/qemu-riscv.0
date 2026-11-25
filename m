Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763EF606A329
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 02:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=VR/0SZx5
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xW2tL-0000II-Qq; Tue, 24 Nov 2026 21:37:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1xW2t6-0000Ds-Te
 for qemu-riscv@nongnu.org; Tue, 24 Nov 2026 21:37:42 -0500
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1xW2t2-0006s2-Uq
 for qemu-riscv@nongnu.org; Tue, 24 Nov 2026 21:37:35 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-8b503e2a87bso55835117b3.3
 for <qemu-riscv@nongnu.org>; Tue, 24 Nov 2026 18:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1795574250; x=1796179050; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kYa2AclwA2kuchnfYBUVIRflMe9jxQjRykpJmYLEXqw=;
 b=VR/0SZx5Yu3Q/8NZFFX9rF2oiBl6cAqaVWCMUmv40l5F1oNksZcgUnCyVaFYtPIiwh
 aJfuLeJcWcRtDlTpOJ1kjfTM9a1Ql+QeE6D8lqLGe+sFyIkjeUDKI22jtCv0vdNUHkZ1
 HAiMbP/k8M/62/So4x+V2aPxaS4MGRSXD2tx4czkzaN5h8Uj7l+tnamsu3QPxmzBYCgl
 uHG71tzJVd7kHaQPDo3QCYluLfGTBhSYNN4/9Dpojj+DvG12SkuWUg78GBn49Tjs8b9e
 1/QOezw7mdLHiqQ77kfK/Hxej9W6mJU+RBTnjrtcd4hIa35VfpOP6WwupZY3CIkhJ1Mc
 klUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795574250; x=1796179050;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kYa2AclwA2kuchnfYBUVIRflMe9jxQjRykpJmYLEXqw=;
 b=erIUz2h1kwl6OsaW1HnhW5i3EP5QRNAJXN+XLNfq/MsptLLm68xBPD3259O9vptfo4
 5UI1EgG+AJWRzfJqYedWszUflT+T6Q/42xncltalf08KZPLIVONcux/LwpkiFW5r/tcU
 AfwddYpFy3WjCaF2hxP1IR9kWziSWJeG4B9nu8TXHo3IZrLfy/xKjFlJmb9lpQYBpmbg
 +ehYpzYSzlbNhZI9Ds5SZLrwfbSMHG7BwAtQhcTF0fauSwEKF6UVwtp7DBwp6leWCX3n
 QrBAmsRf4lywQ/PW2v8g19GL38jws9wlcVByZBB76L1A1W48LVIJEj+hPGtnkm0qTIeS
 24WQ==
X-Forwarded-Encrypted: i=1;
 AL+hErFelRWQP+vzksFGOjrDiB6E9xRAE+GrLFlZVa+zDnQaEMn5l4lhs81v7kpEwpTAZClAdq5nPWpeLY8R@nongnu.org
X-Gm-Message-State: APuU4Z8IidnJdh9FQuntmWnqKTwPjxNaL438Zw5sHdf6j7DKfZXi4DRG
 ypHj72KrF5S6Ba2r6NwCgURrHGtGeAhmcad48P+IRi8WzRQ4aMrbRqOeh3XPem1kCP0=
X-Gm-Gg: AZFdTZfOvUSWGQ6gxxnyENnSh01KnkM/2euKS0MhLgs2KLNxg370h8xYyCIkMlVJDLg
 Kb500dbdcF1tAiA7903HHt4PPEjs1LiZxorHzjN+rkF0fBIVNMs/fIhT0z9nWbiAzDAyGHgOFa5
 2qM2suy0fefdfR8UuZttq/JMg3HJYSqc+wqQ+YgLiTgklhzS9mKuGxD5mI59jjlbmKiP2H+6LVv
 zF9AO2QJ69Xr6CRYEAcXLAl6tCM8eJ2dvMf4eUkk7bysDyDS6YyagQyDn8BBvJm52T71q2w9MhF
 VfO+KXKwNtfO7Ty/fFK4yzCSbBXfGitszLWkIRvfN2Y3w4OdgHvs4P16ELIgDWOBfbQmHQ6aKCb
 HbDaZv4xklVPd1IkDstsP0H4vGYC3ImfCaOSHKHJRHqyrudlVCONn5B2qiezl5tB+gLLFIGDYaB
 APNfQZoBFK5o/f91mJHv5Qn33WxDfAVvETjQs1JPGG8r7YYcRtTrToxEYPH9ClReNZexqbPUmI8
 6cwzPL12jN1aqMDZ7SATevgtfPLQIpNWz1RBJkzhemko/+hVfGkfcYmTVEO5+ooaCIxWU/pt0o7
 TopeUC66m6zex3QdgcSbCesVe9tWXv3xfbEZOEHhyRLEYOGJcLGOaTE1djCrYhV+/wLlrwfR6JO
 xi6xe+2EteA==
X-Received: by 2002:a05:690c:6a86:b0:87e:2404:6b45 with SMTP id
 00721157ae682-8b5204ecb30mr79003327b3.53.1795574250223; 
 Tue, 24 Nov 2026 18:37:30 -0800 (PST)
Received: from [192.168.2.129] ([2600:1700:220:59e0:ea8f:7897:2f4d:9891])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b52028d628sm65626717b3.8.2026.11.24.18.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2026 18:37:29 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Tue, 24 Nov 2026 20:37:22 -0600
Subject: [PATCH 3/8] hw/ssi: Add Spacemit K3 SPI controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-spacemit_k3-v1-3-e911d6e88542@oss.tenstorrent.com>
References: <20261124-spacemit_k3-v1-0-e911d6e88542@oss.tenstorrent.com>
In-Reply-To: <20261124-spacemit_k3-v1-0-e911d6e88542@oss.tenstorrent.com>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org, 
 Jeuk Kim <jeuk20.kim@samsung.com>, 
 Alistair Francis <alistair@alistair23.me>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
X-Mailer: b4 0.15.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=asrinivasan@tenstorrent.com; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Spacemit K3 SPI controller exposes 2 register regions. The first one
exposes registers for SPI operations, along with a LUT where multiple
operations can be programmed in one go befor execution. The second
region is a AHB memory mapped window into the flash. Only read
operations are implemented for this window.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 MAINTAINERS                      |   2 +
 hw/ssi/meson.build               |   1 +
 hw/ssi/spacemit_k3_spi.c         | 273 +++++++++++++++++++++++++++++++++++++++
 hw/ssi/trace-events              |   5 +
 include/hw/ssi/spacemit_k3_spi.h |  49 +++++++
 5 files changed, 330 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 89e40885a0..52a9ffbb33 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1858,7 +1858,9 @@ Spacemit Machines
 M: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
 L: qemu-riscv@nongnu.org
 S: Supported
+F: hw/ssi/spacemit_*.c
 F: hw/ufs/spacemit_*.c
+F: include/hw/ssi/spacemit_*.h
 F: target/riscv/tcg/spacemit_csr.c
 
 Tenstorrent Machines
diff --git a/hw/ssi/meson.build b/hw/ssi/meson.build
index f334e48e2f..59863ca9f6 100644
--- a/hw/ssi/meson.build
+++ b/hw/ssi/meson.build
@@ -13,3 +13,4 @@ system_ss.add(when: 'CONFIG_IMX_SPI', if_true: files('imx_spi.c'))
 system_ss.add(when: 'CONFIG_IBEX', if_true: files('ibex_spi_host.c'))
 system_ss.add(when: 'CONFIG_BCM2835_SPI', if_true: files('bcm2835_spi.c'))
 system_ss.add(when: 'CONFIG_PNV_SPI', if_true: files('pnv_spi.c'))
+system_ss.add(when: 'CONFIG_SPACEMIT', if_true: files('spacemit_k3_spi.c'))
diff --git a/hw/ssi/spacemit_k3_spi.c b/hw/ssi/spacemit_k3_spi.c
new file mode 100644
index 0000000000..74bbfa1714
--- /dev/null
+++ b/hw/ssi/spacemit_k3_spi.c
@@ -0,0 +1,273 @@
+/*
+ * Spacemit K3 SPI Controller
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright 2026 Anirudh Srinivasan
+ */
+
+#include "qemu/osdep.h"
+
+#include "hw/core/irq.h"
+#include "hw/core/qdev-properties.h"
+#include "hw/core/registerfields.h"
+#include "hw/ssi/spacemit_k3_spi.h"
+#include "qemu/log.h"
+#include "qemu/units.h"
+#include "trace.h"
+
+REG32(MCR, 0x0)
+    FIELD(MCR, CLR_TXF_MASK, 11, 1)
+    FIELD(MCR, CLR_RXF_MASK, 10, 1)
+
+REG32(IPCR, 0x8)
+
+REG32(SFAR, 0x100)
+
+REG32(TBDR, 0x154)
+
+REG32(FR, 0x160)
+    FIELD(FR, TFF_MASK, 0, 1)
+    FIELD(FR, RBDF, 16, 1)
+
+REG32(RXBUF0, 0x200)
+REG32(RXBUF31, 0x27c)
+
+REG32(LUT1REG0, 0x320)
+REG32(LUT1REG1, 0x324)
+REG32(LUT1REG2, 0x328)
+REG32(LUT1REG3, 0x32C)
+
+static uint64_t spacemit_k3_spi_read(void *opaque, hwaddr addr,
+                                     unsigned int size)
+{
+    SpacemitK3SpiState *s = opaque;
+    uint32_t ret = 0;
+
+    if (addr >= A_RXBUF0 && addr <= A_RXBUF31) {
+        for (int idx = 3; idx >= 0; idx--) {
+            ret |= (s->rxbuf[idx + addr - A_RXBUF0] << (8UL * idx));
+        }
+    } else {
+        switch (addr) {
+        case A_MCR:
+            ret = s->mcr;
+            break;
+        case A_FR:
+            ret = s->fr;
+            break;
+        default:
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: read from invalid offset 0x%" HWADDR_PRIx "\n",
+                          DEVICE(s)->canonical_path, addr);
+            ret = 0;
+        }
+    }
+    trace_spacemit_k3_spi_read(addr, size, ret);
+    return ret;
+}
+
+static void spacemit_k3_spi_write(void *opaque, hwaddr addr, uint64_t val,
+                             unsigned int size)
+{
+    SpacemitK3SpiState *s = opaque;
+
+    trace_spacemit_k3_spi_write(addr, size, val);
+
+    switch (addr) {
+    case A_MCR:
+        s->mcr = val;
+        if (FIELD_EX32(s->mcr, MCR, CLR_RXF_MASK)) {
+            memset(s->rxbuf, 0, SPACEMIT_K3_SPI_RXFIFO_SIZE);
+            s->rxlevel = 0;
+        }
+        if (FIELD_EX32(s->mcr, MCR, CLR_TXF_MASK)) {
+            memset(s->txbuf, 0, SPACEMIT_K3_SPI_TXFIFO_SIZE);
+            s->txlevel = 0;
+        }
+        break;
+    case A_IPCR:
+        qemu_set_irq(s->cs_line, 0);
+        for (int lut_reg = 0; lut_reg < 4; lut_reg++) {
+            for (int slot = 0; slot < 2; slot++) {
+                uint32_t lut_entry = (s->lut1[lut_reg] >> (16 * slot)) & 0xffff;
+                uint32_t inst = lut_entry >> 10;
+
+                switch (inst) {
+                case 1: /* CMD */
+                    ssi_transfer(s->spi, lut_entry & 0xff);
+                    break;
+                case 2: /* ADDR */
+                    uint32_t read_addr = s->sfar - s->ahb_base;
+                    ssi_transfer(s->spi, (read_addr >> 16) & 0xff);
+                    ssi_transfer(s->spi, (read_addr >> 8) & 0xff);
+                    ssi_transfer(s->spi, read_addr & 0xff);
+                    break;
+                case 3: /* DUMMY */
+                  for (uint32_t num_dummy = 0; num_dummy < (lut_reg & 0xff);
+                       num_dummy += 8)
+                    ssi_transfer(s->spi, 0);
+                  break;
+                case 7: /* READ */
+                  uint32_t len = val & 0xffffff;
+                  if (len > sizeof(s->rxbuf)) {
+                    qemu_log_mask(LOG_GUEST_ERROR,
+                                  "%s: read length %u exceeds rxbuf size %zu\n",
+                                  __func__, len, sizeof(s->rxbuf));
+                    len = sizeof(s->rxbuf);
+                  }
+                  for (uint32_t num_bytes = 0; num_bytes < len; num_bytes++) {
+                    s->rxbuf[num_bytes] = ssi_transfer(s->spi, 0);
+                  }
+                  s->fr = FIELD_DP32(s->fr, FR, RBDF, 1);
+                  s->rxlevel = val & 0xffffff;
+                  break;
+                case 8: /* WRITE */
+                  len = val & 0xffffff;
+                  if (len > s->txlevel) {
+                    qemu_log_mask(LOG_GUEST_ERROR,
+                                  "%s: write length %u exceeds txlevel %u\n",
+                                  __func__, len, s->txlevel);
+                    len = MIN(len, s->txlevel);
+                  }
+                  for (uint32_t num_bytes = 0; num_bytes < len; num_bytes++) {
+                    ssi_transfer(s->spi, s->txbuf[num_bytes]);
+                  }
+                  break;
+                }
+            }
+        }
+        s->fr = FIELD_DP32(s->fr, FR, TFF_MASK, 1);
+        qemu_set_irq(s->cs_line, 1);
+        break;
+    case A_SFAR:
+        s->sfar = val;
+        break;
+    case A_TBDR:
+        for (int idx = 0; idx < 4; idx++) {
+            if (s->txlevel >= SPACEMIT_K3_SPI_TXFIFO_SIZE) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                        "%s: TX FIFO full, dropping byte\n", __func__);
+                break;
+            }
+            s->txbuf[s->txlevel++] = val & 0xff;
+            val = val >> 8;
+        }
+        break;
+    case A_FR:
+        s->fr &= ~val;
+        break;
+    case A_LUT1REG0:
+    case A_LUT1REG1:
+    case A_LUT1REG2:
+    case A_LUT1REG3:
+        s->lut1[(addr - A_LUT1REG0) >> 2] = val;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: write to invalid offset 0x%" HWADDR_PRIx "\n",
+                      DEVICE(s)->canonical_path, addr);
+        break;
+    }
+}
+
+static const MemoryRegionOps spacemit_k3_spi_ops = {
+    .read = spacemit_k3_spi_read,
+    .write = spacemit_k3_spi_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+        .unaligned = false,
+    },
+};
+
+static uint64_t spacemit_k3_spi_ahb_read(void *opaque, hwaddr addr,
+                                         unsigned int size)
+{
+    SpacemitK3SpiState *s = opaque;
+    uint64_t ret = 0;
+
+    switch (addr) {
+    default:
+        qemu_set_irq(s->cs_line, 0);
+        ssi_transfer(s->spi, 0x03);
+        ssi_transfer(s->spi, (addr >> 16) & 0xff);
+        ssi_transfer(s->spi, (addr >> 8) & 0xff);
+        ssi_transfer(s->spi, addr & 0xff);
+        for (uint32_t idx = 0; idx < size; idx += 1) {
+            ret |= (uint64_t)ssi_transfer(s->spi, 0) << (8 * idx);
+        }
+        qemu_set_irq(s->cs_line, 1);
+    }
+    trace_spacemit_k3_spi_ahb_read(addr, size, ret);
+    return ret;
+}
+
+static const MemoryRegionOps spacemit_k3_spi_ahb_ops = {
+    .read = spacemit_k3_spi_ahb_read,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 8,
+        .unaligned = false,
+    },
+};
+
+static void spacemit_k3_spi_enter_reset(Object *obj, ResetType type)
+{
+    SpacemitK3SpiState *s = SPACEMIT_K3_SPI(obj);
+
+    s->mcr = 0;
+    s->ipcr = 0;
+    s->sfar = 0;
+    s->fr = 0;
+    memset(s->lut1, 0, 4 * sizeof(uint32_t));
+
+    memset(s->rxbuf, 0, SPACEMIT_K3_SPI_RXFIFO_SIZE);
+    s->rxlevel = 0;
+
+    memset(s->txbuf, 0, SPACEMIT_K3_SPI_TXFIFO_SIZE);
+    s->txlevel = 0;
+}
+
+static void spacemit_k3_spi_realize(DeviceState *dev, Error **errp)
+{
+    SpacemitK3SpiState *s = SPACEMIT_K3_SPI(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+    s->spi = ssi_create_bus(dev, "ssi");
+    memory_region_init_io(&s->mmio, OBJECT(s), &spacemit_k3_spi_ops, s,
+                          "spacemit-k3-spi", 4 * KiB);
+    sysbus_init_mmio(sbd, &s->mmio);
+    memory_region_init_io(&s->ahb, OBJECT(s), &spacemit_k3_spi_ahb_ops, s,
+                          "spacemit-k3-spi-ahb", 0x8000000);
+    sysbus_init_mmio(sbd, &s->ahb);
+    sysbus_init_irq(sbd, &s->irq);
+    qdev_init_gpio_out_named(dev, &s->cs_line, "cs", 1);
+}
+
+static const Property spacemit_k3_spi_properties[] = {
+    DEFINE_PROP_UINT32("ahb-base", SpacemitK3SpiState, ahb_base, 0xb8000000),
+};
+
+static void spacemit_k3_spi_class_init(ObjectClass *klass, const void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "Spacemit K3 SPI controller";
+    dc->realize = spacemit_k3_spi_realize;
+    device_class_set_props(dc, spacemit_k3_spi_properties);
+    rc->phases.enter = spacemit_k3_spi_enter_reset;
+}
+
+static const TypeInfo spacemit_k3_spi_types[] = {
+    {
+        .name = TYPE_SPACEMIT_K3_SPI,
+        .parent = TYPE_SYS_BUS_DEVICE,
+        .instance_size = sizeof(SpacemitK3SpiState),
+        .class_init = spacemit_k3_spi_class_init,
+    },
+};
+DEFINE_TYPES(spacemit_k3_spi_types)
diff --git a/hw/ssi/trace-events b/hw/ssi/trace-events
index b9d8648297..01ec9326f7 100644
--- a/hw/ssi/trace-events
+++ b/hw/ssi/trace-events
@@ -62,3 +62,8 @@ allwinner_a10_spi_tx(uint8_t byte) "write 0x%02x"
 allwinner_a10_spi_rx(uint8_t byte) "read 0x%02x"
 allwinner_a10_spi_read(const char* regname, uint32_t value) "reg[%s] => 0x%08x"
 allwinner_a10_spi_write(const char* regname, uint32_t value) "reg[%s] <= 0x%08x"
+
+# spacemit_k3_spi.c
+spacemit_k3_spi_read(uint64_t offset, uint32_t size, uint64_t data) "offset 0x%" PRIx64 " size %u: data 0x%" PRIx64
+spacemit_k3_spi_write(uint64_t offset, uint32_t size, uint64_t data) "offset 0x%" PRIx64 " size %u: data 0x%" PRIx64
+spacemit_k3_spi_ahb_read(uint64_t offset, uint32_t size, uint64_t data) "offset 0x%" PRIx64 " size %u: data 0x%" PRIx64
diff --git a/include/hw/ssi/spacemit_k3_spi.h b/include/hw/ssi/spacemit_k3_spi.h
new file mode 100644
index 0000000000..00f968aa95
--- /dev/null
+++ b/include/hw/ssi/spacemit_k3_spi.h
@@ -0,0 +1,49 @@
+/*
+ * Spacemit K3 SPI Controller
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright 2026 Anirudh Srinivasan
+ */
+
+#ifndef HW_SSI_SPACEMIT_K3_SPI_H
+#define HW_SSI_SPACEMIT_K3_SPI_H
+
+#include "hw/core/sysbus.h"
+#include "hw/ssi/ssi.h"
+#include "qom/object.h"
+
+#define TYPE_SPACEMIT_K3_SPI "spacemit-k3-spi"
+OBJECT_DECLARE_SIMPLE_TYPE(SpacemitK3SpiState, SPACEMIT_K3_SPI)
+
+#define SPACEMIT_K3_SPI_TXFIFO_SIZE 256
+#define SPACEMIT_K3_SPI_RXFIFO_SIZE 128
+
+struct SpacemitK3SpiState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion mmio;
+    MemoryRegion ahb;
+    SSIBus *spi;
+    qemu_irq irq;
+    qemu_irq cs_line;
+
+    uint32_t mcr;
+    uint32_t ipcr;
+    uint32_t sfar;
+    uint32_t fr;
+
+    uint32_t lut1[4];
+
+    uint8_t rxbuf[SPACEMIT_K3_SPI_RXFIFO_SIZE];
+    uint32_t rxlevel;
+
+    uint8_t txbuf[SPACEMIT_K3_SPI_TXFIFO_SIZE];
+    uint32_t txlevel;
+
+    uint32_t ahb_base;
+};
+
+#endif /* HW_SSI_SPACEMIT_K3_SPI_H */

-- 
2.43.0


