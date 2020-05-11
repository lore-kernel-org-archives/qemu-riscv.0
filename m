Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jYFQk-0001Tb-Dh
	for mharc-qemu-riscv@gnu.org; Mon, 11 May 2020 16:53:42 -0400
Received: from [2001:470:142:3::10] (port=35524 helo=eggs.gnu.org)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jYFQh-0001Qh-Gv
 for qemu-riscv@nongnu.org; Mon, 11 May 2020 16:53:41 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:41054
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jYFQC-0005Nc-OR
 for qemu-riscv@nongnu.org; Mon, 11 May 2020 16:53:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589230374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ApfKdlbM1fYSPPea3LqjcLYgAh8qqScfosbbY+F3O8c=;
 b=aXYjzkXOYTGtbqOrdWP4y99d0YqaLrcDIWLHvrMArJrMrgVpdcA7E2k6eTgcDftxINufF5
 /TGtHSyo10vveTotVwyHz2IwU/SvmMQ/0k/7Ve+ioa/bEMQyASBCL9UkY3PNrJOlWdrZij
 NjIk5JBoTmiHf30CC/ehnLCzWO6EvQo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-Wr3Kq-HcM4m1UcR8SdYmYQ-1; Mon, 11 May 2020 16:52:51 -0400
X-MC-Unique: Wr3Kq-HcM4m1UcR8SdYmYQ-1
Received: by mail-wr1-f70.google.com with SMTP id g10so5805929wrr.10
 for <qemu-riscv@nongnu.org>; Mon, 11 May 2020 13:52:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ApfKdlbM1fYSPPea3LqjcLYgAh8qqScfosbbY+F3O8c=;
 b=suRjenqoVVbQZHclnqyvv3B6eJ0xhQUHUC/Wz21HD/XhYH/PR2EsASV7mC72PtjNjz
 uSOmJ0ArRjz9Ak713EqLkadV0bjGQv5NwVGF+SEzf/0+IPsq5+IycDtMDZAPVvwTLrxq
 F4Bl3p6xvPDp6D0II9qsaznthwPFRF+qeuH36UuGaY+R2RCieDJDcmhHsVanpx7m1dRu
 UkMa8c5wKhARlG9CwyueM1hUvqbKy92+ZRUndhkD5ZP2o4GkVFZ0r9djWnRAXQW94hGy
 QvORDXFvgDp8C/ABBQvu58FpgeHas/E50bFK7XxacRgOkFFyW55hbKd6CxhYF6lKdP8X
 roag==
X-Gm-Message-State: AGi0PuZTw6RKQ6pr6w+hG7YMC9Fee6FkDX/g5pMPXX0ns4PQb6n6BMi4
 cQXf7ccmmkoI5AEQCVXpXdOjLMox5cojn1pvbtzuYB8NLQR/2ZQ2YYstTZ5TqMDgVy+UtvLG4Fn
 Q/tXubO7TlPR1b8Y=
X-Received: by 2002:a05:600c:2284:: with SMTP id
 4mr31952887wmf.97.1589230370219; 
 Mon, 11 May 2020 13:52:50 -0700 (PDT)
X-Google-Smtp-Source: APiQypLxklPLpuZTPVF0u2g4c+16ffWLe2GRQPom07O+sxDhg3Ms4hzoQL1zsAT6ViIYBBObWOom9w==
X-Received: by 2002:a05:600c:2284:: with SMTP id
 4mr31952847wmf.97.1589230369854; 
 Mon, 11 May 2020 13:52:49 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id k5sm18146092wrx.16.2020.05.11.13.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 13:52:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-riscv@nongnu.org,
 Leif Lindholm <leif@nuviainc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH] hw: Use QEMU_IS_ALIGNED() on parallel flash block size
Date: Mon, 11 May 2020 22:52:46 +0200
Message-Id: <20200511205246.24621-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 01:43:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 T_DKIM_INVALID=0.01, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 11 May 2020 20:53:41 -0000

Use the QEMU_IS_ALIGNED() macro to verify the flash block size
is properly aligned. It is quicker to process when reviewing.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/sbsa-ref.c       | 2 +-
 hw/arm/virt.c           | 2 +-
 hw/block/pflash_cfi01.c | 2 +-
 hw/block/pflash_cfi02.c | 2 +-
 hw/i386/pc_sysfw.c      | 2 +-
 hw/riscv/virt.c         | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 8409ba853d..b379e4a76a 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -241,7 +241,7 @@ static void sbsa_flash_map1(PFlashCFI01 *flash,
 {
     DeviceState *dev = DEVICE(flash);
 
-    assert(size % SBSA_FLASH_SECTOR_SIZE == 0);
+    assert(QEMU_IS_ALIGNED(size, SBSA_FLASH_SECTOR_SIZE));
     assert(size / SBSA_FLASH_SECTOR_SIZE <= UINT32_MAX);
     qdev_prop_set_uint32(dev, "num-blocks", size / SBSA_FLASH_SECTOR_SIZE);
     qdev_init_nofail(dev);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 634db0cfe9..0a99fddb3d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -978,7 +978,7 @@ static void virt_flash_map1(PFlashCFI01 *flash,
 {
     DeviceState *dev = DEVICE(flash);
 
-    assert(size % VIRT_FLASH_SECTOR_SIZE == 0);
+    assert(QEMU_IS_ALIGNED(size, VIRT_FLASH_SECTOR_SIZE));
     assert(size / VIRT_FLASH_SECTOR_SIZE <= UINT32_MAX);
     qdev_prop_set_uint32(dev, "num-blocks", size / VIRT_FLASH_SECTOR_SIZE);
     qdev_init_nofail(dev);
diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index f586bac269..11922c0f96 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -964,7 +964,7 @@ PFlashCFI01 *pflash_cfi01_register(hwaddr base,
     if (blk) {
         qdev_prop_set_drive(dev, "drive", blk, &error_abort);
     }
-    assert(size % sector_len == 0);
+    assert(QEMU_IS_ALIGNED(size, sector_len));
     qdev_prop_set_uint32(dev, "num-blocks", size / sector_len);
     qdev_prop_set_uint64(dev, "sector-length", sector_len);
     qdev_prop_set_uint8(dev, "width", bank_width);
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index c6b6f2d082..895f7daee3 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -1003,7 +1003,7 @@ PFlashCFI02 *pflash_cfi02_register(hwaddr base,
     if (blk) {
         qdev_prop_set_drive(dev, "drive", blk, &error_abort);
     }
-    assert(size % sector_len == 0);
+    assert(QEMU_IS_ALIGNED(size, sector_len));
     qdev_prop_set_uint32(dev, "num-blocks", size / sector_len);
     qdev_prop_set_uint32(dev, "sector-length", sector_len);
     qdev_prop_set_uint8(dev, "width", width);
diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index f5f3f466b0..fad41f0e73 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -168,7 +168,7 @@ static void pc_system_flash_map(PCMachineState *pcms,
                          blk_name(blk), strerror(-size));
             exit(1);
         }
-        if (size == 0 || size % FLASH_SECTOR_SIZE != 0) {
+        if (size == 0 || !QEMU_IS_ALIGNED(size, FLASH_SECTOR_SIZE)) {
             error_report("system firmware block device %s has invalid size "
                          "%" PRId64,
                          blk_name(blk), size);
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index daae3ebdbb..71481d59c2 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -112,7 +112,7 @@ static void virt_flash_map1(PFlashCFI01 *flash,
 {
     DeviceState *dev = DEVICE(flash);
 
-    assert(size % VIRT_FLASH_SECTOR_SIZE == 0);
+    assert(QEMU_IS_ALIGNED(size, VIRT_FLASH_SECTOR_SIZE));
     assert(size / VIRT_FLASH_SECTOR_SIZE <= UINT32_MAX);
     qdev_prop_set_uint32(dev, "num-blocks", size / VIRT_FLASH_SECTOR_SIZE);
     qdev_init_nofail(dev);
-- 
2.21.3


