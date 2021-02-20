Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lDTYd-00073C-7b
	for mharc-qemu-riscv@gnu.org; Sat, 20 Feb 2021 09:48:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lDTYb-00070C-B6; Sat, 20 Feb 2021 09:48:29 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:39522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lDTYZ-0003Yc-SV; Sat, 20 Feb 2021 09:48:29 -0500
Received: by mail-pg1-x52c.google.com with SMTP id o63so7254040pgo.6;
 Sat, 20 Feb 2021 06:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PZi3soyJQhaWNPEZSj3fBWGFj5Xy0/vFaW0BKIB31GQ=;
 b=FfW/uD8O8qL+6rgWbprLiqI5t5B/qTajYxMEsV8v2Ls/+dBstGwuYt6lf7tZnNffPL
 kS8pjRCAT/P0kXXsLTLwq1XhG0VmkinKKOwHp5UktA1kubWrplj3iTxa7P7A6j9MUydF
 tqDP/R3l7etDtnowiRoyQ7lVLfmsNay0ivKhEuB7DKw/vL5ELYTclwabH2jxJINEFRxv
 x98+2S1kdIeENZcIuJ6Pot2KueVlGecT7iOYUdQoG6yRzTtVQuGPS95iXY+m/zxc1h0W
 3g9+KKdd3MaRsYSQV2aX/FvNAh8mQrSkG2edmwOQQ4htfuVpTrvnMtp8TC4yuyCt2eRu
 NzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PZi3soyJQhaWNPEZSj3fBWGFj5Xy0/vFaW0BKIB31GQ=;
 b=S/AqW00pB9I1jDxZyIGyBOoUOHP8VJ1NFKmGLv7aFV794qdrq5vp2bKJaS02/ef1uw
 NUS9lRTkoAJ0XRTFB28B6b/ajf96+OyXdWoxV8p1rpeMokURYxlfMesM3GSgyl8b4Ray
 8me6MNvGaHASg9g8lTsALGg2fkiucNImpol+iqWu50yPe3mrVt5Ey/bcGpLJXuSsGtr9
 9IZTrGKdX6R18w8CJ4muYiNNKI+LHWolrBv7KVqGNDKKclt8CDY/lnTj9VEYPZg8MJ4X
 vnWTAlFInAUjSAhFon39PQfLJrG9HmYKlDkk2RN+hklFTete4Mmq2qzfOi7hIHv9dwvq
 Tszw==
X-Gm-Message-State: AOAM530idWLJhILNBkK/rEEOirbJsikbmpJp6iPlX4NEvwoWHboocNo0
 h2uGWCNroeU9QUOxP3sJ3Q8=
X-Google-Smtp-Source: ABdhPJzGZX6sh5PNZmkccLUElhk+3HQwjv8bWjE/pVCgoyQyRkTRmCJPrLMaeuLMRfGTGeVbmrXY/Q==
X-Received: by 2002:a65:5643:: with SMTP id m3mr5496157pgs.91.1613832506390;
 Sat, 20 Feb 2021 06:48:26 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id d16sm3100480pgb.12.2021.02.20.06.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Feb 2021 06:48:26 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 2/4] hw/riscv: virt: Drop the 'link_up' parameter of
 gpex_pcie_init()
Date: Sat, 20 Feb 2021 22:48:05 +0800
Message-Id: <20210220144807.819-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210220144807.819-1-bmeng.cn@gmail.com>
References: <20210220144807.819-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52c.google.com
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
X-List-Received-Date: Sat, 20 Feb 2021 14:48:29 -0000

From: Bin Meng <bin.meng@windriver.com>

`link_up` is never used in gpex_pcie_init(). Drop it.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

 hw/riscv/virt.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index cfd52bc59b..1d05bb3ef9 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -449,7 +449,7 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
                                           hwaddr ecam_base, hwaddr ecam_size,
                                           hwaddr mmio_base, hwaddr mmio_size,
                                           hwaddr pio_base,
-                                          DeviceState *plic, bool link_up)
+                                          DeviceState *plic)
 {
     DeviceState *dev;
     MemoryRegion *ecam_alias, *ecam_reg;
@@ -669,12 +669,12 @@ static void virt_machine_init(MachineState *machine)
     }
 
     gpex_pcie_init(system_memory,
-                         memmap[VIRT_PCIE_ECAM].base,
-                         memmap[VIRT_PCIE_ECAM].size,
-                         memmap[VIRT_PCIE_MMIO].base,
-                         memmap[VIRT_PCIE_MMIO].size,
-                         memmap[VIRT_PCIE_PIO].base,
-                         DEVICE(pcie_plic), true);
+                   memmap[VIRT_PCIE_ECAM].base,
+                   memmap[VIRT_PCIE_ECAM].size,
+                   memmap[VIRT_PCIE_MMIO].base,
+                   memmap[VIRT_PCIE_MMIO].size,
+                   memmap[VIRT_PCIE_PIO].base,
+                   DEVICE(pcie_plic));
 
     serial_mm_init(system_memory, memmap[VIRT_UART0].base,
         0, qdev_get_gpio_in(DEVICE(mmio_plic), UART0_IRQ), 399193,
-- 
2.25.1


