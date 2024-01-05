Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452ABC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:58:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmR6-0002mx-2D; Fri, 05 Jan 2024 10:48:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmQI-0007sF-Ok
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:47:53 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmQG-0004lO-Ag
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:47:50 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40e3712d259so10429065e9.3
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469667; x=1705074467; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pzBOft/r+pQ28bPRm3cZUcB0Cj6Ii9RnBaNZcpiqy/g=;
 b=DC9QmywZGIdHeP4Ut5HMMTGn8IGKL3B7RdqJaFqiUeLPUox1E7Hd/jfol0RnJ1MPet
 aFITvVqau9AxgvptyeESL/Q7BfchVxrLQpkURXUk31PpzwSVRnA2YpfDzc8dolkS/9WR
 t6kp50tdnRfhi3w4EZMJPRoxOnX/bpBo1vnd4hsiosjRAsUwTlBgcjampXHdEgZ0GfiJ
 FZICIvyg3jr4JHJkePp7dqzH9CbCVkFORDXpCNpGiCHHlbHueRBCM+0/VzuKhhSG4ALY
 DkVQSZmpJ1WTJo8LX+mYI7VX+z5lGceL7UeKO2NNQowc1KG6R1ARASFfZW0kP7feZynN
 WYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469667; x=1705074467;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pzBOft/r+pQ28bPRm3cZUcB0Cj6Ii9RnBaNZcpiqy/g=;
 b=Ek38RshbD3tM4xJzpi/VRhTZDINbScTdl8XwkUZl9Zabg3PmBQ6uXlcHRBg5F4rayO
 Wtf9sPtNNtm2VzHcYzj8627bnZo50VGvZBZm2vmYmFwhsB+a5JBhSjJmP8of80ODrSrl
 G9KbaGydldu/cJ4wAsW4RZl1NnRDmz3ns1wxCUn4Z8d/9NtXXTgYdOn2dY8YtwCESKS9
 Fr9v/nMg7i1ptTdgpVw5zv5B/LSVnW+/JeJTAT8oOg9aiejc6f5RzygMRFWAdTkECWNc
 xWzRdTpn+C1I+GcfYqCSTwIUUMxDmEuOrIWPgTqKSzq8MfhKYfHvYnWHlv3+NxbGIoIK
 QFdw==
X-Gm-Message-State: AOJu0YyArqf3eURIrLSaAiQpAeNlrpUmwGs2tq4ahBXR5kGIHN2fwlvy
 AaTeJ+Iid2CVveJeZZNHx0rLd1TiE6fZpg==
X-Google-Smtp-Source: AGHT+IEq2dH0mD+4SouSDcOeEkmlMA8U+22hBrUXAhGW/EQH2oulgKBO8Uch2pieq/K24qQT3n23ag==
X-Received: by 2002:a05:600c:c0b:b0:40e:351d:53fd with SMTP id
 fm11-20020a05600c0c0b00b0040e351d53fdmr848618wmb.239.1704469666949; 
 Fri, 05 Jan 2024 07:47:46 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 v1-20020adfe281000000b003365aa39d30sm1617394wri.11.2024.01.05.07.47.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:47:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PULL 43/71] hw/mips: Inline 'bios.h' definitions
Date: Fri,  5 Jan 2024 16:42:36 +0100
Message-ID: <20240105154307.21385-44-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

There is no universal BIOS, each machine needs a specific one.

Move the machine-specific definitions to each machine code and
remove this bogus header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20231122184334.18201-1-philmd@linaro.org>
---
 include/hw/mips/bios.h | 14 --------------
 hw/mips/jazz.c         | 10 +++++++++-
 hw/mips/malta.c        |  9 ++++++++-
 hw/mips/mipssim.c      | 10 +++++++++-
 4 files changed, 26 insertions(+), 17 deletions(-)
 delete mode 100644 include/hw/mips/bios.h

diff --git a/include/hw/mips/bios.h b/include/hw/mips/bios.h
deleted file mode 100644
index 44acb6815b..0000000000
--- a/include/hw/mips/bios.h
+++ /dev/null
@@ -1,14 +0,0 @@
-#ifndef HW_MIPS_BIOS_H
-#define HW_MIPS_BIOS_H
-
-#include "qemu/units.h"
-#include "cpu.h"
-
-#define BIOS_SIZE (4 * MiB)
-#if TARGET_BIG_ENDIAN
-#define BIOS_FILENAME "mips_bios.bin"
-#else
-#define BIOS_FILENAME "mipsel_bios.bin"
-#endif
-
-#endif
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index d33a76ad4d..0d2348aa5a 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -36,7 +36,6 @@
 #include "hw/boards.h"
 #include "net/net.h"
 #include "hw/scsi/esp.h"
-#include "hw/mips/bios.h"
 #include "hw/loader.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "hw/timer/i8254.h"
@@ -53,12 +52,19 @@
 #ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
 #endif /* CONFIG_TCG */
+#include "cpu.h"
 
 enum jazz_model_e {
     JAZZ_MAGNUM,
     JAZZ_PICA61,
 };
 
+#if TARGET_BIG_ENDIAN
+#define BIOS_FILENAME "mips_bios.bin"
+#else
+#define BIOS_FILENAME "mipsel_bios.bin"
+#endif
+
 static void main_cpu_reset(void *opaque)
 {
     MIPSCPU *cpu = opaque;
@@ -147,6 +153,8 @@ static void mips_jazz_init_net(NICInfo *nd, IOMMUMemoryRegion *rc4030_dma_mr,
     prom[7] = 0xff - checksum;
 }
 
+#define BIOS_SIZE (4 * MiB)
+
 #define MAGNUM_BIOS_SIZE_MAX 0x7e000
 #define MAGNUM_BIOS_SIZE                                                       \
         (BIOS_SIZE < MAGNUM_BIOS_SIZE_MAX ? BIOS_SIZE : MAGNUM_BIOS_SIZE_MAX)
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 049de46a9e..d22bb1edef 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -40,7 +40,6 @@
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bus.h"
 #include "qemu/log.h"
-#include "hw/mips/bios.h"
 #include "hw/ide/pci.h"
 #include "hw/irq.h"
 #include "hw/loader.h"
@@ -59,6 +58,7 @@
 #include "hw/qdev-clock.h"
 #include "target/mips/internal.h"
 #include "trace.h"
+#include "cpu.h"
 
 #define ENVP_PADDR          0x2000
 #define ENVP_VADDR          cpu_mips_phys_to_kseg0(NULL, ENVP_PADDR)
@@ -71,6 +71,7 @@
 #define RESET_ADDRESS       0x1fc00000ULL
 
 #define FLASH_SIZE          0x400000
+#define BIOS_SIZE           (4 * MiB)
 
 #define PIIX4_PCI_DEVFN     PCI_DEVFN(10, 0)
 
@@ -91,6 +92,12 @@ typedef struct {
     bool display_inited;
 } MaltaFPGAState;
 
+#if TARGET_BIG_ENDIAN
+#define BIOS_FILENAME "mips_bios.bin"
+#else
+#define BIOS_FILENAME "mipsel_bios.bin"
+#endif
+
 #define TYPE_MIPS_MALTA "mips-malta"
 OBJECT_DECLARE_SIMPLE_TYPE(MaltaState, MIPS_MALTA)
 
diff --git a/hw/mips/mipssim.c b/hw/mips/mipssim.c
index 4f743f37eb..01e323904d 100644
--- a/hw/mips/mipssim.c
+++ b/hw/mips/mipssim.c
@@ -35,7 +35,6 @@
 #include "net/net.h"
 #include "sysemu/sysemu.h"
 #include "hw/boards.h"
-#include "hw/mips/bios.h"
 #include "hw/loader.h"
 #include "elf.h"
 #include "hw/sysbus.h"
@@ -43,6 +42,15 @@
 #include "qemu/error-report.h"
 #include "sysemu/qtest.h"
 #include "sysemu/reset.h"
+#include "cpu.h"
+
+#define BIOS_SIZE (4 * MiB)
+
+#if TARGET_BIG_ENDIAN
+#define BIOS_FILENAME "mips_bios.bin"
+#else
+#define BIOS_FILENAME "mipsel_bios.bin"
+#endif
 
 static struct _loaderparams {
     int ram_size;
-- 
2.41.0


