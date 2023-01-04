Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDBtE-0000Na-LG
	for mharc-qemu-riscv@gnu.org; Wed, 04 Jan 2023 17:05:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBtC-0000HA-Fb
 for qemu-riscv@nongnu.org; Wed, 04 Jan 2023 17:05:38 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBtA-0005Bu-MM
 for qemu-riscv@nongnu.org; Wed, 04 Jan 2023 17:05:38 -0500
Received: by mail-ej1-x636.google.com with SMTP id x22so85912636ejs.11
 for <qemu-riscv@nongnu.org>; Wed, 04 Jan 2023 14:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Yfck/dkEQ1qiQRqZ2doov1ZobzOuy108Vmk2yEOlvU=;
 b=a2p5k6oBfHIIcb9Uw1m2zAqimXZm+gdGar5jbK8cQ26Amd7fVl7cxi0GM0EIfzCWnd
 2AGsY7wwodH2MSr4W0+FfmwTZmKjU3yfjK6bcczpgCG3Pyp99DRqAT7xiZKIy6wsdhNJ
 nQ23jF+yj00wW66C/4odJ9g8tq8mySZ/lY0Hxxb+vNkz21NA7pCuwoYFqWfygeyRrpec
 WDCntx851w9pjiA1kKdSmZZFd6M/1VXeUafv7g6C7sTQAePzQ4jbukY5tAOy9Ptdadz7
 S6xvuwTIosDwQp9hdJip2cOj4nGKOKLZqCDH0xsW/QiDCxvWJeNvU+svZhCVs2gXZUeb
 y9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Yfck/dkEQ1qiQRqZ2doov1ZobzOuy108Vmk2yEOlvU=;
 b=jurENwDm2b9qgJC18FstGE57vzA7DqZXwVG6NaUzEhH3xc5ymsU7BVWyRfTU319Vfx
 sj2v35RIQfsALfxLjM4fvNUlrzg2C1jV60vJRbsRxn1mLPNfOBOF5UohFP4dMWWzc4Fr
 rLyaCwf1PPjyJ/Jwc9YsnfTN9iDT7/RDR3EZJAg0ydkpl8s7MzL3zVx1bP8SLyXN0ss5
 FantT1EAwiPDEmHj0VJYWUj8XqEF3alXPT5fHCDow9PIMLzzJs6Nalhh9kmnol/qye9b
 N5i9WEAhryl9WrdpO02s3W4lponT+TmaQaBztl3yiU1cZJXjAD4gGhsKnYYHvFcBY9wl
 hS/A==
X-Gm-Message-State: AFqh2kr6LWD6PxRIXtmknUleh6/6oKpsFDc05r188bZWBlaIHwcH8Wfp
 Xnd71GhUPMlJe2Vw3x6CzN/OSg==
X-Google-Smtp-Source: AMrXdXuJhY2ilLZ7JEub0KMh8iCKA1cr7XDA14f+0MQOeAydGCbmE7lmqRfA2T3Z73IqwVT5+socjw==
X-Received: by 2002:a17:907:76cc:b0:842:cd68:4943 with SMTP id
 kf12-20020a17090776cc00b00842cd684943mr43315948ejc.11.1672869935936; 
 Wed, 04 Jan 2023 14:05:35 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ue3-20020a170907c68300b0084c7f96d023sm9207905ejc.147.2023.01.04.14.05.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Jan 2023 14:05:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Mark Burton <mburton@qti.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>, Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 05/20] hw/loongarch: Use generic DeviceState instead of
 PFlashCFI01
Date: Wed,  4 Jan 2023 23:04:34 +0100
Message-Id: <20230104220449.41337-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104220449.41337-1-philmd@linaro.org>
References: <20230104220449.41337-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 04 Jan 2023 22:05:38 -0000

Nothing here requires access to PFlashCFI01 internal fields:
use the inherited generic DeviceState.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/loongarch/virt.c         | 9 ++++-----
 include/hw/loongarch/virt.h | 3 +--
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index c8a495ea30..cd5aa26f49 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -45,7 +45,7 @@
 #include "sysemu/block-backend.h"
 #include "hw/block/flash.h"
 
-static void virt_flash_create(LoongArchMachineState *lams)
+static DeviceState *virt_flash_create(LoongArchMachineState *lams)
 {
     DeviceState *dev = qdev_new(TYPE_PFLASH_CFI01);
 
@@ -62,14 +62,13 @@ static void virt_flash_create(LoongArchMachineState *lams)
     object_property_add_alias(OBJECT(lams), "pflash",
                               OBJECT(dev), "drive");
 
-    lams->flash = PFLASH_CFI01(dev);
+    return dev;
 }
 
 static void virt_flash_map(LoongArchMachineState *lams,
                            MemoryRegion *sysmem)
 {
-    PFlashCFI01 *flash = lams->flash;
-    DeviceState *dev = DEVICE(flash);
+    DeviceState *dev = lams->flash;
     hwaddr base = VIRT_FLASH_BASE;
     hwaddr size = VIRT_FLASH_SIZE;
 
@@ -899,7 +898,7 @@ static void loongarch_machine_initfn(Object *obj)
     lams->acpi = ON_OFF_AUTO_AUTO;
     lams->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     lams->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
-    virt_flash_create(lams);
+    lams->flash = virt_flash_create(lams);
 }
 
 static bool memhp_type_supported(DeviceState *dev)
diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
index f5f818894e..519b25c722 100644
--- a/include/hw/loongarch/virt.h
+++ b/include/hw/loongarch/virt.h
@@ -12,7 +12,6 @@
 #include "hw/boards.h"
 #include "qemu/queue.h"
 #include "hw/intc/loongarch_ipi.h"
-#include "hw/block/flash.h"
 
 #define LOONGARCH_MAX_VCPUS     4
 
@@ -52,7 +51,7 @@ struct LoongArchMachineState {
     int          fdt_size;
     DeviceState *platform_bus_dev;
     PCIBus       *pci_bus;
-    PFlashCFI01  *flash;
+    DeviceState  *flash;
 };
 
 #define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("virt")
-- 
2.38.1


