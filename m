Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198FFC5AD44
	for <qemu-riscv@archiver.kernel.org>; Sat,  8 Aug 2026 18:32:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wslpk-0000A7-BG; Sat, 08 Aug 2026 14:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flamboyant.h.01@gmail.com>)
 id 1wslpc-0008Ve-9M
 for qemu-riscv@nongnu.org; Sat, 08 Aug 2026 14:31:40 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flamboyant.h.01@gmail.com>)
 id 1wslpY-0007eJ-NI
 for qemu-riscv@nongnu.org; Sat, 08 Aug 2026 14:31:39 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2cca0c5799eso5559095ad.0
 for <qemu-riscv@nongnu.org>; Sat, 08 Aug 2026 11:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786213894; x=1786818694; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JIW8yEjgRGY3LIhgF42aY5/+Q15tNsIpPIoYrGqSGZA=;
 b=WkK4VvgbQweQ/ZYPvX7A3FDYO9VF+0ObHcCoCGkZQ3RbFAtPR5YTy6im9rkfqmRdaD
 tzjTMHG9KjcbcOLvNqUV88ki73YxVhVqUjhsOQzcSR14Kwusr7xW9yAmFEo2LPWS+htP
 HZ7h2ElAvoklHH58kElTpx89RqzCDjIvAbku78t+HGhVL5s9vxPFv2MfH/4DiMSfIqhr
 UgetyvKi8zwl0Ss2XKKCAn5agkOAI7Lg3th5n9WzU1yLybuObFJXswgsXBDSP7zN43Kg
 lPZbaj4NX0xnVdTW6ylFtn+N2b50UV3VjRRZjKwAT5k8nqxs6Sbs1eJq/yY2hRwv2WDa
 uIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786213894; x=1786818694;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=JIW8yEjgRGY3LIhgF42aY5/+Q15tNsIpPIoYrGqSGZA=;
 b=EaJpPRdQrnE6FL7/fxxvyFEhl3MKMtpJwTikcVOYLNN/S/VRYXr1VrGVIR+/g/0S4J
 Fnsu3qawHioA1rWudKFBrxqXCZZ33IgPNAuAoY8bfvCbECy8MHJIoLFbn47SAD2/N6RP
 nQjyrWxqR7WMZ59T+GJS6TASbMKFJG7I2qHz45PbqETonTirGCGhGZlz7p00Uw92DlHN
 CUWEhNJKuDxsUV7V7F1ccV1/dxTQAF3iQTTK7ELhaQV55VpuNMr957P88BtWiwoPwDem
 BvMsYIecONW11s3Gcc21dHOfh4xL1TxoExRfuJtr2XeanpasTiqrW53xjGlS6UiWFCjk
 8+1w==
X-Gm-Message-State: AOJu0Yxr9vF87tVLE0Wt1S+tc5X70+lFutXvCrtaO9w75nZWmaiWyr83
 4V6Tn/OqzSn3pC4jQAaiXknAsDHC4NakXRWVKJvIlw1WaWWCVtTRdawr
X-Gm-Gg: AR+sD12wCgKwG+AhRjlWNAgwJN2urfCrtsiTbIe0h8ed9us4Ewilr0tqEkfutsHOBPY
 wRa/1w+IyBdBnLo5/MSKywgMJSe+nfWYVyMftFGaPcpWJ4DYQgl7u579DgWVgmI1o6uBbk/8wnP
 k+8hd9h4B694iMyOteBwwltgWbLfnottFhv7/1Nw87OChWs6WE5HytYUVj+jwUrbms4v5YmR0zL
 F67JNdJtKGSBRZuf2SEJJsTucSkOC/Hjpnzby7utWOJI/ol9JVBao81IkCmLaAmFpwTXuFFqINM
 G8hlVwcNDvE3Nn6BZwkHNYglWnyvzQucIoRJLoyKUl1H1qcX1o1Ehr/1fEUtPQNvInr8HBeyy8B
 s7aY5hRgQfP4QBobHulcxk6d90z8qawlYP2qEYIcqQYAPgOhG/ascCrPXqKtGZCDqXUK2UHLQB0
 elkdjtxbePzGjbiG+bFk2WEfkf3KH9O6HeaZQen2qXKcw/0AxYTXOFIvADwxvAtadWAbjkOF/+v
 Gii82iIsgYDB4vy4JrEjJWqKJLXhw==
X-Received: by 2002:a17:90b:5350:b0:38f:1a2e:6e56 with SMTP id
 98e67ed59e1d1-392822dcc89mr8471971a91.9.1786213894322; 
 Sat, 08 Aug 2026 11:31:34 -0700 (PDT)
Received: from LAPTOP-CS7CB8K1.localdomain
 ([2409:8a00:6035:79d0:50fd:3a6e:508:beb2])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3925fc6c13asm6772393a91.2.2026.08.08.11.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Aug 2026 11:31:33 -0700 (PDT)
From: Kangjie Huang <flamboyant.h.01@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Bin Meng <bmeng.cn@gmail.com>,
 Chao Liu <chao.liu@processmission.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Kangjie Huang <flamboyant.h.01@gmail.com>
Subject: [PATCH v3 2/5] hw/ssi: Add DWC SSI standard interrupt support
Date: Sun,  9 Aug 2026 02:29:53 +0800
Message-ID: <20260808182956.290561-3-flamboyant.h.01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260808182956.290561-1-flamboyant.h.01@gmail.com>
References: <20260808182956.290561-1-flamboyant.h.01@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=flamboyant.h.01@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Implement raw and masked SSI interrupt status, threshold interrupts, and
the documented read-clear registers.

TXE and RXF are derived from FIFO levels. TXO, RXO, and RXU are latched
causes. Expose the model's nine physical interrupt outputs.

TXU, DONE, and AXIE depend on transfer engines outside the Standard PIO
scope and remain deasserted. DONECR and AXIECR are RAZ/WI.

Signed-off-by: Kangjie Huang <flamboyant.h.01@gmail.com>
---
 hw/ssi/dwc_ssi.c         | 129 ++++++++++++++++++++++++++++++++++++++-
 include/hw/ssi/dwc_ssi.h |  18 +++++-
 2 files changed, 145 insertions(+), 2 deletions(-)

diff --git a/hw/ssi/dwc_ssi.c b/hw/ssi/dwc_ssi.c
index c0bcf8b869..43c5c5db88 100644
--- a/hw/ssi/dwc_ssi.c
+++ b/hw/ssi/dwc_ssi.c
@@ -6,7 +6,7 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  *
  * Emulates the DesignWare SSI controller in Standard SPI mode,
- * covering the PIO/FIFO data path and chip selects.
+ * covering the PIO/FIFO data path, interrupt outputs and chip selects.
  */
 
 #include "qemu/osdep.h"
@@ -26,6 +26,9 @@
 #define DWC_SSI_IDR_RESET               0xa1b2c3d5
 #define DWC_SSI_VERSION                 0x3130332a
 #define DWC_SSI_PIO_TX_BATCH            64
+#define DWC_SSI_IRQ_VALID_MASK          0x000009bf
+#define DWC_SSI_IMPLEMENTED_LATCHED_IRQ_MASK \
+    (R_RISR_TXOIR_MASK | R_RISR_RXOIR_MASK | R_RISR_RXUIR_MASK)
 
 enum {
     DWC_SSI_TMOD_TR,
@@ -217,6 +220,22 @@ REG32(XIP_WRITE_CTRL, 0x148)
 #define DWC_SSI_RX_SAMPLE_DELAY_WRITABLE_MASK \
     (R_RX_SAMPLE_DELAY_RSD_MASK | R_RX_SAMPLE_DELAY_SE_MASK)
 
+/*
+ * TXU, DONE and AXIE depend on transfer engines outside Standard PIO.
+ * Their physical outputs are exposed but remain deasserted in this model.
+ */
+static const uint32_t dwc_ssi_irq_status_mask[DWC_SSI_IRQ_COUNT] = {
+    [DWC_SSI_IRQ_TXE] = R_RISR_TXEIR_MASK,
+    [DWC_SSI_IRQ_TXO] = R_RISR_TXOIR_MASK,
+    [DWC_SSI_IRQ_RXF] = R_RISR_RXFIR_MASK,
+    [DWC_SSI_IRQ_RXO] = R_RISR_RXOIR_MASK,
+    [DWC_SSI_IRQ_TXU] = R_RISR_TXUIR_MASK,
+    [DWC_SSI_IRQ_RXU] = R_RISR_RXUIR_MASK,
+    [DWC_SSI_IRQ_MST] = R_RISR_MSTIR_MASK,
+    [DWC_SSI_IRQ_DONE] = R_RISR_DONER_MASK,
+    [DWC_SSI_IRQ_AXIE] = R_RISR_AXIER_MASK,
+};
+
 static bool dwc_ssi_validate_config(DwcSsiState *s, Error **errp)
 {
     DeviceState *dev = DEVICE(s);
@@ -253,6 +272,45 @@ static void dwc_ssi_write_masked(DwcSsiState *s, unsigned int reg,
     s->regs[reg] = (s->regs[reg] & ~mask) | (value & mask);
 }
 
+static uint32_t dwc_ssi_irq_raw_status(DwcSsiState *s)
+{
+    uint32_t status = s->irq_latched;
+    uint32_t tx_used = fifo32_num_used(&s->tx_fifo);
+    uint32_t rx_used = fifo32_num_used(&s->rx_fifo);
+    uint32_t tx_threshold =
+        FIELD_EX32(s->regs[R_TXFTLR], TXFTLR, TFT);
+    uint32_t rx_threshold =
+        FIELD_EX32(s->regs[R_RXFTLR], RXFTLR, RFT);
+
+    if (tx_used <= tx_threshold) {
+        status |= R_RISR_TXEIR_MASK;
+    }
+    if (rx_used > rx_threshold) {
+        status |= R_RISR_RXFIR_MASK;
+    }
+    return status & DWC_SSI_IRQ_VALID_MASK;
+}
+
+static void dwc_ssi_update_irq(DwcSsiState *s)
+{
+    uint32_t status = dwc_ssi_irq_raw_status(s) &
+                      s->regs[R_IMR] & DWC_SSI_IRQ_VALID_MASK;
+
+    for (int i = 0; i < DWC_SSI_IRQ_COUNT; i++) {
+        qemu_set_irq(s->irqs[i], !!(status & dwc_ssi_irq_status_mask[i]));
+    }
+}
+
+static uint32_t dwc_ssi_irq_read_clear(DwcSsiState *s,
+                                       uint32_t clear_mask)
+{
+    uint32_t active = s->irq_latched & clear_mask;
+
+    s->irq_latched &= ~clear_mask;
+    dwc_ssi_update_irq(s);
+    return !!active;
+}
+
 static uint32_t dwc_ssi_frame_masked(DwcSsiState *s)
 {
     unsigned int bits = FIELD_EX32(s->regs[R_CTRLR0], CTRLR0, DFS) + 1;
@@ -322,6 +380,7 @@ static void dwc_ssi_abort_transfer(DwcSsiState *s)
     s->phase = DWC_SSI_PHASE_IDLE;
     s->remaining_frames = 0;
     s->dummy_frame = 0;
+    dwc_ssi_update_irq(s);
 }
 
 static uint32_t dwc_ssi_status(DwcSsiState *s)
@@ -349,6 +408,8 @@ static void dwc_ssi_push_tx(DwcSsiState *s, uint32_t tx)
     }
 
     if (fifo32_is_full(&s->tx_fifo)) {
+        s->irq_latched |= R_RISR_TXOIR_MASK;
+        dwc_ssi_update_irq(s);
         return;
     }
 
@@ -357,6 +418,7 @@ static void dwc_ssi_push_tx(DwcSsiState *s, uint32_t tx)
     if (s->phase != DWC_SSI_PHASE_STANDARD_TX_ONLY) {
         dwc_ssi_run_transfer(s);
     }
+    dwc_ssi_update_irq(s);
 }
 
 static uint32_t dwc_ssi_send_frame(DwcSsiState *s,
@@ -414,6 +476,7 @@ static void dwc_ssi_run_transfer(DwcSsiState *s)
             uint32_t rx = dwc_ssi_send_frame(s, tx);
 
             if (fifo32_is_full(&s->rx_fifo)) {
+                s->irq_latched |= R_RISR_RXOIR_MASK;
                 qemu_log_mask(LOG_GUEST_ERROR,
                               "%s: RX FIFO full, dropping frame\n",
                               DEVICE(s)->canonical_path);
@@ -602,9 +665,11 @@ static uint64_t dwc_ssi_read(void *opaque, hwaddr addr, unsigned int size)
             value = fifo32_pop(&s->rx_fifo) & dwc_ssi_frame_masked(s);
         } else {
             value = 0;
+            s->irq_latched |= R_RISR_RXUIR_MASK;
         }
 
         dwc_ssi_run_transfer(s);
+        dwc_ssi_update_irq(s);
         return value;
     }
 
@@ -634,6 +699,7 @@ static uint64_t dwc_ssi_read(void *opaque, hwaddr addr, unsigned int size)
         value = fifo32_num_used(&s->tx_fifo);
         if (s->phase == DWC_SSI_PHASE_STANDARD_TX_ONLY) {
             dwc_ssi_run_transfer(s);
+            dwc_ssi_update_irq(s);
         }
         break;
     case A_RXFLR:
@@ -643,8 +709,35 @@ static uint64_t dwc_ssi_read(void *opaque, hwaddr addr, unsigned int size)
         value = dwc_ssi_status(s);
         if (s->phase == DWC_SSI_PHASE_STANDARD_TX_ONLY) {
             dwc_ssi_run_transfer(s);
+            dwc_ssi_update_irq(s);
         }
         break;
+    case A_ISR:
+        value = dwc_ssi_irq_raw_status(s) & s->regs[R_IMR] &
+                DWC_SSI_IRQ_VALID_MASK;
+        break;
+    case A_RISR:
+        value = dwc_ssi_irq_raw_status(s);
+        break;
+    case A_TXEICR:
+        value = dwc_ssi_irq_read_clear(
+            s, R_RISR_TXOIR_MASK | R_RISR_TXUIR_MASK);
+        break;
+    case A_RXOICR:
+        value = dwc_ssi_irq_read_clear(s, R_RISR_RXOIR_MASK);
+        break;
+    case A_RXUICR:
+        value = dwc_ssi_irq_read_clear(s, R_RISR_RXUIR_MASK);
+        break;
+    case A_MSTICR:
+        value = dwc_ssi_irq_read_clear(s, R_RISR_MSTIR_MASK);
+        break;
+    case A_ICR:
+        value = dwc_ssi_irq_read_clear(
+            s, R_RISR_TXOIR_MASK | R_RISR_RXUIR_MASK |
+               R_RISR_RXOIR_MASK | R_RISR_MSTIR_MASK);
+        break;
+
     default:
         if (addr >= DWC_SSI_REGS_SIZE || (addr & 0x3) != 0) {
             qemu_log_mask(LOG_GUEST_ERROR,
@@ -708,6 +801,7 @@ static void dwc_ssi_write(void *opaque, hwaddr addr,
 
         dwc_ssi_update_cs(s);
         dwc_ssi_run_transfer(s);
+        dwc_ssi_update_irq(s);
         break;
     }
     case A_MWCR:
@@ -731,6 +825,7 @@ static void dwc_ssi_write(void *opaque, hwaddr addr,
 
         dwc_ssi_update_cs(s);
         dwc_ssi_run_transfer(s);
+        dwc_ssi_update_irq(s);
         break;
     }
     case A_BAUDR:
@@ -750,6 +845,7 @@ static void dwc_ssi_write(void *opaque, hwaddr addr,
         dwc_ssi_write_masked(s, R_TXFTLR, value,
                              DWC_SSI_TXFTLR_WRITABLE_MASK);
         dwc_ssi_run_transfer(s);
+        dwc_ssi_update_irq(s);
         break;
     case A_RXFTLR:
         if (!dwc_ssi_fifo_threshold_valid(
@@ -761,6 +857,7 @@ static void dwc_ssi_write(void *opaque, hwaddr addr,
         }
         dwc_ssi_write_masked(s, R_RXFTLR, value,
                              DWC_SSI_RXFTLR_WRITABLE_MASK);
+        dwc_ssi_update_irq(s);
         break;
     case A_TXFLR:
     case A_RXFLR:
@@ -769,6 +866,16 @@ static void dwc_ssi_write(void *opaque, hwaddr addr,
     case A_IMR:
         dwc_ssi_write_masked(s, R_IMR, value,
                              DWC_SSI_IMR_WRITABLE_MASK);
+        dwc_ssi_update_irq(s);
+        break;
+    case A_ISR:
+    case A_RISR:
+        break;
+    case A_TXEICR:
+    case A_RXOICR:
+    case A_RXUICR:
+    case A_MSTICR:
+    case A_ICR:
         break;
     case A_IDR:
     case A_SSIC_VERSION_ID:
@@ -809,12 +916,15 @@ static void dwc_ssi_enter_reset(Object *obj, ResetType type)
     s->phase = DWC_SSI_PHASE_IDLE;
     s->remaining_frames = 0;
     s->dummy_frame = 0;
+    s->irq_latched = 0;
 
     s->regs[R_CTRLR0] = DWC_SSI_CTRLR0_RESET;
     s->regs[R_SR] = DWC_SSI_SR_RESET;
     s->regs[R_IMR] = s->cfg.imr_reset & DWC_SSI_IMR_WRITABLE_MASK;
     s->regs[R_IDR] = DWC_SSI_IDR_RESET;
     s->regs[R_SSIC_VERSION_ID] = DWC_SSI_VERSION;
+
+    dwc_ssi_update_irq(s);
 }
 
 static void dwc_ssi_hold_reset(Object *obj, ResetType type)
@@ -829,6 +939,13 @@ static void dwc_ssi_hold_reset(Object *obj, ResetType type)
     }
 }
 
+static void dwc_ssi_exit_reset(Object *obj, ResetType type)
+{
+    DwcSsiState *s = DWC_SSI(obj);
+
+    dwc_ssi_update_irq(s);
+}
+
 static bool dwc_ssi_fifo_valid(const Fifo32 *fifo, uint32_t depth)
 {
     const Fifo8 *fifo8 = &fifo->fifo;
@@ -850,6 +967,9 @@ static int dwc_ssi_post_load(void *opaque, int version_id)
     if (s->active_cs < -1 || s->active_cs >= (int)s->cfg.num_cs) {
         return -EINVAL;
     }
+    if (s->irq_latched & ~DWC_SSI_IMPLEMENTED_LATCHED_IRQ_MASK) {
+        return -EINVAL;
+    }
     if (!dwc_ssi_fifo_valid(&s->tx_fifo, s->cfg.fifo_depth) ||
         !dwc_ssi_fifo_valid(&s->rx_fifo, s->cfg.fifo_depth)) {
         return -EINVAL;
@@ -878,6 +998,7 @@ static int dwc_ssi_post_load(void *opaque, int version_id)
         qemu_irq_lower(s->cs_lines[s->active_cs]);
     }
 
+    dwc_ssi_update_irq(s);
     return 0;
 }
 
@@ -893,6 +1014,7 @@ static const VMStateDescription vmstate_dwc_ssi = {
         VMSTATE_UINT32_ARRAY(regs, DwcSsiState, DWC_SSI_NUM_REGS),
         VMSTATE_FIFO32(tx_fifo, DwcSsiState),
         VMSTATE_FIFO32(rx_fifo, DwcSsiState),
+        VMSTATE_UINT32(irq_latched, DwcSsiState),
         VMSTATE_UINT32(phase, DwcSsiState),
         VMSTATE_UINT32(remaining_frames, DwcSsiState),
         VMSTATE_UINT32(dummy_frame, DwcSsiState),
@@ -913,6 +1035,10 @@ static void dwc_ssi_init(Object *obj)
                           TYPE_DWC_SSI, DWC_SSI_MMIO_SIZE);
     sysbus_init_mmio(sbd, &s->mmio);
 
+    for (int i = 0; i < DWC_SSI_IRQ_COUNT; i++) {
+        sysbus_init_irq(sbd, &s->irqs[i]);
+    }
+
     s->active_cs = -1;
 }
 
@@ -957,6 +1083,7 @@ static void dwc_ssi_class_init(ObjectClass *klass, const void *data)
     device_class_set_props(dc, dwc_ssi_properties);
     rc->phases.enter = dwc_ssi_enter_reset;
     rc->phases.hold = dwc_ssi_hold_reset;
+    rc->phases.exit = dwc_ssi_exit_reset;
 }
 
 static const TypeInfo dwc_ssi_info = {
diff --git a/include/hw/ssi/dwc_ssi.h b/include/hw/ssi/dwc_ssi.h
index 6e4f8ea7bb..19499789af 100644
--- a/include/hw/ssi/dwc_ssi.h
+++ b/include/hw/ssi/dwc_ssi.h
@@ -6,7 +6,7 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  *
  * Emulates the DesignWare SSI controller in Standard SPI mode,
- * covering the PIO/FIFO data path and chip selects.
+ * covering the PIO/FIFO data path, interrupt outputs and chip selects.
  */
 
 #ifndef HW_SSI_DWC_SSI_H
@@ -25,6 +25,20 @@ OBJECT_DECLARE_SIMPLE_TYPE(DwcSsiState, DWC_SSI)
 #define DWC_SSI_NUM_REGS \
     (DWC_SSI_REGS_SIZE / sizeof(uint32_t))
 
+/* SSI GPIO output ordering differs from RISR/ISR bit ordering. */
+typedef enum DwcSsiIrq {
+    DWC_SSI_IRQ_TXE,
+    DWC_SSI_IRQ_TXO,
+    DWC_SSI_IRQ_RXF,
+    DWC_SSI_IRQ_RXO,
+    DWC_SSI_IRQ_TXU,
+    DWC_SSI_IRQ_RXU,
+    DWC_SSI_IRQ_MST,
+    DWC_SSI_IRQ_DONE,
+    DWC_SSI_IRQ_AXIE,
+    DWC_SSI_IRQ_COUNT,
+} DwcSsiIrq;
+
 typedef enum DwcSsiPhase {
     DWC_SSI_PHASE_IDLE,
     DWC_SSI_PHASE_STANDARD_TX_ONLY,
@@ -47,6 +61,7 @@ struct DwcSsiState {
     SSIBus *spi;
 
     qemu_irq *cs_lines;
+    qemu_irq irqs[DWC_SSI_IRQ_COUNT];
 
     Fifo32 tx_fifo;
     Fifo32 rx_fifo;
@@ -54,6 +69,7 @@ struct DwcSsiState {
 
     DwcSsiConfig cfg;
 
+    uint32_t irq_latched;
     uint32_t phase;
     uint32_t remaining_frames;
     uint32_t dummy_frame;
-- 
2.43.0


