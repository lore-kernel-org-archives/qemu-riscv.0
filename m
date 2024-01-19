Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F83AC47DAF
	for <qemu-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 11:44:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rQnBn-0007NX-4z; Fri, 19 Jan 2024 06:37:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnBl-0007Go-2B
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:37:33 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnBh-00034Y-Mv
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:37:32 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3376555b756so389737f8f.0
 for <qemu-riscv@nongnu.org>; Fri, 19 Jan 2024 03:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664248; x=1706269048; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ODpPk4V4L74xrCSwXIUijjl6fJH0n8xXoj2+PFNQbhs=;
 b=eIXZ1Tks3W8nIRyoK4sHzQw0RHEZji/9FUeQC8Qsy/N4NAp9hCQOp/w05MccHJ+bZo
 g8TnlT/q8GFE+LwuEWlQAPYX+svvvoa1iohVpBTIgiqMOfTbY93S3NnYLPJX2Av8/pUF
 W1GRN/b5qkuGXmlzBE+zo927o7ij/RfxmjX8dnXfia0NDa0NuCcJtcb6qMOTWPfMUx1y
 cJ+92ucdBkVXxKoSZUNSEeSvoWBVSJrYRn0oB+1KrpH44Pl2R54Ecdg1XqQGVfiNGS5R
 Xzg5wIvP6KSX9cwZ2dFz5JoAWJoJ9h4pfXQUsq/1dirfqxaYGdAUfDH6ThhvUKV2IcW2
 JEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664248; x=1706269048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ODpPk4V4L74xrCSwXIUijjl6fJH0n8xXoj2+PFNQbhs=;
 b=dtD7meSFc/Yuv4AJNIf3+q7BGswlpbMcJPk4IzdKpkjp8CDtMoEyixX2Fv0DsBtBev
 gHxK88xLWPdoYmwCF9YyiBbnuU8E/L0Tbk7r2zrGT32aSusP4GJ3u8C4RJLOTpgz+nF9
 +msWLWUtfI1+Yg9/Uw8pdwiakVOByxxlgFlMvx8mXFDS7m1blJLNevEdmxBbRNvgSMRw
 8rViHJs5eLZOgcjdBJJhbXA7FADm1JAEAB13YbX6DRI3/sgxoWt6MwZE2pEh0dVaPslI
 eLRbjf8dSTfOLO4CQ+69O0TbvY3iNZGdXQjVhn3C1n9V29631/g+3L3ZDuwtoBy7/OO3
 RVnw==
X-Gm-Message-State: AOJu0YzQkCpwOfGVLRwGFax4Pxbtuj2jYNCdV3ddzEBSt23WIkuC5UYm
 Ag5iukMR7X3GZNO0Qc+l8+0M1glyAZ/5gnsRS13NJo3ufQAF4PA2BjEQHB990KE=
X-Google-Smtp-Source: AGHT+IEIrX/z6IwaxDIYnTkkVa92cOwMdnkJU9aX6lQnqOf1mTPLbyTPg1auGFz61Q1hUZ14flsswQ==
X-Received: by 2002:a5d:698b:0:b0:336:8b2f:2ae5 with SMTP id
 g11-20020a5d698b000000b003368b2f2ae5mr589450wru.24.1705664248288; 
 Fri, 19 Jan 2024 03:37:28 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 n13-20020a5d51cd000000b0033673ddd81csm6238840wrv.112.2024.01.19.03.37.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:37:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [PULL 31/36] hw/scsi/esp-pci: synchronise setting of DMA_STAT_DONE
 with ESP completion interrupt
Date: Fri, 19 Jan 2024 12:35:00 +0100
Message-ID: <20240119113507.31951-32-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

The setting of DMA_STAT_DONE at the end of a DMA transfer can be configured to
generate an interrupt, however the Linux driver manually checks for DMA_STAT_DONE
being set and if it is, considers that a DMA transfer has completed.

If DMA_STAT_DONE is set but the ESP device isn't indicating an interrupt then
the Linux driver considers this to be a spurious interrupt. However this can
occur in QEMU as there is a delay between the end of DMA transfer where
DMA_STAT_DONE is set, and the ESP device raising its completion interrupt.

This appears to be an incorrect assumption in the Linux driver as the ESP and
PCI DMA interrupt sources are separate (and may not be raised exactly
together), however we can work around this by synchronising the setting of
DMA_STAT_DONE at the end of a DMA transfer with the ESP completion interrupt.

In conjunction with the previous commit Linux is now able to correctly boot
from an am53c974 PCI SCSI device on the hppa C3700 machine without emitting
"iget: checksum invalid" and "Spurious irq, sreg=10" errors.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Message-ID: <20240112131529.515642-4-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/scsi/esp-pci.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c
index 15dc3c004d..875a49199d 100644
--- a/hw/scsi/esp-pci.c
+++ b/hw/scsi/esp-pci.c
@@ -93,6 +93,18 @@ static void esp_irq_handler(void *opaque, int irq_num, int level)
 
     if (level) {
         pci->dma_regs[DMA_STAT] |= DMA_STAT_SCSIINT;
+
+        /*
+         * If raising the ESP IRQ to indicate end of DMA transfer, set
+         * DMA_STAT_DONE at the same time. In theory this should be done in
+         * esp_pci_dma_memory_rw(), however there is a delay between setting
+         * DMA_STAT_DONE and the ESP IRQ arriving which is visible to the
+         * guest that can cause confusion e.g. Linux
+         */
+        if ((pci->dma_regs[DMA_CMD] & DMA_CMD_MASK) == 0x3 &&
+            pci->dma_regs[DMA_WBC] == 0) {
+                pci->dma_regs[DMA_STAT] |= DMA_STAT_DONE;
+        }
     } else {
         pci->dma_regs[DMA_STAT] &= ~DMA_STAT_SCSIINT;
     }
@@ -306,9 +318,6 @@ static void esp_pci_dma_memory_rw(PCIESPState *pci, uint8_t *buf, int len,
     /* update status registers */
     pci->dma_regs[DMA_WBC] -= len;
     pci->dma_regs[DMA_WAC] += len;
-    if (pci->dma_regs[DMA_WBC] == 0) {
-        pci->dma_regs[DMA_STAT] |= DMA_STAT_DONE;
-    }
 }
 
 static void esp_pci_dma_memory_read(void *opaque, uint8_t *buf, int len)
@@ -363,24 +372,13 @@ static const VMStateDescription vmstate_esp_pci_scsi = {
     }
 };
 
-static void esp_pci_command_complete(SCSIRequest *req, size_t resid)
-{
-    ESPState *s = req->hba_private;
-    PCIESPState *pci = container_of(s, PCIESPState, esp);
-
-    esp_command_complete(req, resid);
-    pci->dma_regs[DMA_WBC] = 0;
-    pci->dma_regs[DMA_STAT] |= DMA_STAT_DONE;
-    esp_pci_update_irq(pci);
-}
-
 static const struct SCSIBusInfo esp_pci_scsi_info = {
     .tcq = false,
     .max_target = ESP_MAX_DEVS,
     .max_lun = 7,
 
     .transfer_data = esp_transfer_data,
-    .complete = esp_pci_command_complete,
+    .complete = esp_command_complete,
     .cancel = esp_request_cancelled,
 };
 
-- 
2.41.0


