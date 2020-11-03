Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kZyHF-0006aD-23
	for mharc-qemu-riscv@gnu.org; Tue, 03 Nov 2020 10:31:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@sifive.com>)
 id 1kZyHD-0006W8-8X
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2020 10:31:15 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:40947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@sifive.com>)
 id 1kZyHB-0000TI-Cq
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2020 10:31:14 -0500
Received: by mail-wr1-x443.google.com with SMTP id 33so8210037wrl.7
 for <qemu-riscv@nongnu.org>; Tue, 03 Nov 2020 07:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XeIP8k/QD/9DtH7hBJJvEdGmMoSBIMWIh9Ng0Z0DB68=;
 b=dh5NrUFUKrvui71fFzlE9yoYPWlqHy+YGZv/gaB/+PIPcUYQQuNHoMfFHZwacTau96
 mK2o0oa5M0c2V1AWao9xyOyHP1XPjILmfQ0aojsB1gQtR40hPiNf0TWDDpLq6+cbxC5C
 QnEerX0U2Muvecx+kz5FXcJd6LXTAiZSt1lxEVWfchFIYqQgV7c5v8RBxASFS3Z80cJu
 OpZH2Kq4obpWX0YMDHkAqHIPLrrIuNwYkXWQWRHhLEj6+fD6oHw3hPRlYKon5hbVFWaG
 G1q+xD9yTtM/qRGoGuh4bACad5SGubmNgqLKyHRac/n6ybq4yjOCu/CS+lFc7TWociKq
 aauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XeIP8k/QD/9DtH7hBJJvEdGmMoSBIMWIh9Ng0Z0DB68=;
 b=moJO4T1W2rmJgbFnAXpl3Qwt5jCD3i+5WGLeITx98+B+9W9U97Y89+SU/lH7PdA4U2
 oxoH31CuF3mm1631JnR7+8czdVp0XdBfxFAedt7XyTDfxBv7+qad96C2G/XMJetjAMGm
 I3De9cvYKPMy8MyQhZUA4ZuK0CvnMW/+/MNvuvOaC4tOR/ASJ5CctrkY2Zesh48AC9NO
 OtqHS7NNuGFbodBMB/pLvTuyPrsDUF9tngR5E+d3uBu83sSt3B3GvjmMaDE9iVy839Pn
 ZDaUB0qPuC9ixjJ4ED+nSFN0L0OlnvnB56QZlkLadbICuf61GjUXP7iDUsHdBH9Bf6fy
 HU+Q==
X-Gm-Message-State: AOAM530WF7QdSRj+IfxkR1Hl/ZC6MRkZRWEK+l6pmVV6A1i/gplQGvZF
 9aOVNXkjRc4k+t/J4nxaYc4loV7GD/8zJ3uH
X-Google-Smtp-Source: ABdhPJxMOnWHmYlgK2yPr+/lxreimi1WQ9rD08Zy8dLCsYZADzxB0BA7aZVWQ3/jrCvj09CGPdJb0g==
X-Received: by 2002:adf:e388:: with SMTP id e8mr18926877wrm.65.1604417471499; 
 Tue, 03 Nov 2020 07:31:11 -0800 (PST)
Received: from thurso.iroazh.eu (net.iroazh.eu. [109.190.73.171])
 by smtp.gmail.com with ESMTPSA id e6sm19443716wrs.7.2020.11.03.07.31.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Nov 2020 07:31:10 -0800 (PST)
From: Emmanuel Blot <emmanuel.blot@sifive.com>
To: qemu-riscv@nongnu.org
Cc: Emmanuel Blot <emmanuel.blot@sifive.com>
Subject: [PATCH 1/2] hw/riscv: plic: Fix highest IRQ source slot
Date: Tue,  3 Nov 2020 16:29:18 +0100
Message-Id: <20201103152920.90957-2-emmanuel.blot@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201103152920.90957-1-emmanuel.blot@sifive.com>
References: <20201103152920.90957-1-emmanuel.blot@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=emmanuel.blot@sifive.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 03 Nov 2020 15:31:15 -0000

PLIC IRQ 0 is defined as non-existent (special case to signal no interrupt).
As PLIC IRQ arrays and bitfields are defined for N = num_sources channels but indexed from 1..N and not 0..N-1, N+1 slots should be allocated.

Fix the fix source_priority buffer overflows and the last IRQ slot handling that was discarded.

Signed-off-by: Emmanuel Blot <emmanuel.blot@sifive.com>
---
 hw/intc/sifive_plic.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index f42fd695d8..e2e3d0b4c8 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -178,6 +178,9 @@ static uint32_t sifive_plic_claim(SiFivePLICState *plic, uint32_t addrid)
         }
         for (j = 0; j < 32; j++) {
             int irq = (i << 5) + j;
+            if (irq > plic->num_sources) {
+                break;
+            }
             uint32_t prio = plic->source_priority[irq];
             int enabled = pending_enabled_not_claimed & (1 << j);
             if (enabled && prio > max_prio) {
@@ -213,7 +216,7 @@ static uint64_t sifive_plic_read(void *opaque, hwaddr addr, unsigned size)
         }
         return plic->source_priority[irq];
     } else if (addr >= plic->pending_base && /* 1 bit per source */
-               addr < plic->pending_base + (plic->num_sources >> 3))
+               addr < plic->pending_base + ((plic->num_sources + 1) >> 3))
     {
         uint32_t word = (addr - plic->pending_base) >> 2;
         if (RISCV_DEBUG_PLIC) {
@@ -290,7 +293,7 @@ static void sifive_plic_write(void *opaque, hwaddr addr, uint64_t value,
         sifive_plic_update(plic);
         return;
     } else if (addr >= plic->pending_base && /* 1 bit per source */
-               addr < plic->pending_base + (plic->num_sources >> 3))
+               addr < plic->pending_base + ((plic->num_sources + 1) >> 3))
     {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid pending write: 0x%" HWADDR_PRIx "",
@@ -335,7 +338,7 @@ static void sifive_plic_write(void *opaque, hwaddr addr, uint64_t value,
                     mode_to_char(plic->addr_config[addrid].mode),
                     (uint32_t)value);
             }
-            if (value < plic->num_sources) {
+            if (value && value < (plic->num_sources + 1)) {
                 sifive_plic_set_claimed(plic, value, false);
                 sifive_plic_update(plic);
             }
@@ -447,14 +450,14 @@ static void sifive_plic_realize(DeviceState *dev, Error **errp)
     memory_region_init_io(&plic->mmio, OBJECT(dev), &sifive_plic_ops, plic,
                           TYPE_SIFIVE_PLIC, plic->aperture_size);
     parse_hart_config(plic);
-    plic->bitfield_words = (plic->num_sources + 31) >> 5;
-    plic->source_priority = g_new0(uint32_t, plic->num_sources);
+    plic->bitfield_words = (plic->num_sources + 1 + 31) >> 5;
+    plic->source_priority = g_new0(uint32_t, plic->num_sources + 1);
     plic->target_priority = g_new(uint32_t, plic->num_addrs);
     plic->pending = g_new0(uint32_t, plic->bitfield_words);
     plic->claimed = g_new0(uint32_t, plic->bitfield_words);
     plic->enable = g_new0(uint32_t, plic->bitfield_words * plic->num_addrs);
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &plic->mmio);
-    qdev_init_gpio_in(dev, sifive_plic_irq_request, plic->num_sources);
+    qdev_init_gpio_in(dev, sifive_plic_irq_request, plic->num_sources + 1);
 
     /* We can't allow the supervisor to control SEIP as this would allow the
      * supervisor to clear a pending external interrupt which will result in
-- 
2.28.0


