Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l2va0-00059U-QJ
	for mharc-qemu-riscv@gnu.org; Fri, 22 Jan 2021 07:30:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l2vZy-00057K-5w; Fri, 22 Jan 2021 07:30:18 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:39004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l2vZw-0003VH-JN; Fri, 22 Jan 2021 07:30:17 -0500
Received: by mail-pf1-x42b.google.com with SMTP id m6so3582158pfm.6;
 Fri, 22 Jan 2021 04:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3vF8eyBFMlBrbtIRoGw6B+iBvOUwWqxgWUVtRZBW/Xg=;
 b=h1RK5PsuV1w3+Q+mW/rlI9WyKZpCaC/psCGT75DUaMrkbStN3or9S/wn15agMOVxar
 rO7TeKDx/FYXDOh+tAoYrQHlmhe//UUv/JXn9YCBWwNDd7CZwc6WeUVgbsU0RcZuU1+1
 7jCXamyabKgoPPp3AFGRTbgLZKw1z5f088hd3TKMtpBV5GOg+W8F+ZiFcb942iPpOAc+
 V0NS8MTNvr6FDebNpL6RKYWVMCUXCr08VE94tvRFJxFlG4QsRg4Ey6Xio0tw6BIs/I29
 1thOZkEkZ96uviQNOF5o/kHvdh11jWe7P01tuK9oHs5CoG/fAElJAdrtUkLJZWUh160p
 xm2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3vF8eyBFMlBrbtIRoGw6B+iBvOUwWqxgWUVtRZBW/Xg=;
 b=HWzGnj5fauTxL1aOiABdNklcCWFVg/v61x3PCXzf8Knt8KMFLbsavIcYsdGdLHPa/G
 4x3sTtTuRKFN2X5562r9/6TIb0QWUwVY4t2o2rnWQCe/7L3YcIbzdarprac3ffplodBn
 MtKHsZpLzt0M7aju+0pV8RYQyeKwTAlNFiDroJh0GF7MigSfl2HaseFDrI61enAp7oGh
 Frpdl2QW9cLuwD7J21ZnxcAbyFPSToWt99xqgNODKudj35ruVE9hBcCcy4jQCh65Ra75
 9omHPuZqW6oATmqsizN73+fvz9G8KIrOCmwzKQIlEXiwpfM3sJBv8TXEZF8BKMyez7yb
 Bmcg==
X-Gm-Message-State: AOAM533hFSADWZxm1iNQjCdRd+70JJlPZw8mSS4NBXkhF2mDjDn3lVbD
 OY0RcEf+dJR4tiVxGrc9WnRLd2SXi7ngYQ==
X-Google-Smtp-Source: ABdhPJy/DNlznDXvtovCZ8+QcbSJSI7MRzlOBEO1ivXwm+mg7z60VtKZlvs8q1m6nwuOmbkDAy2Lrw==
X-Received: by 2002:a63:704c:: with SMTP id a12mr4399717pgn.360.1611318614761; 
 Fri, 22 Jan 2021 04:30:14 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id 6sm7894996pfd.212.2021.01.22.04.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 04:30:14 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 2/4] hw/riscv: virt: Drop the 'link_up' parameter of
 gpex_pcie_init()
Date: Fri, 22 Jan 2021 20:29:56 +0800
Message-Id: <20210122122958.12311-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210122122958.12311-1-bmeng.cn@gmail.com>
References: <20210122122958.12311-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42b.google.com
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
X-List-Received-Date: Fri, 22 Jan 2021 12:30:18 -0000

From: Bin Meng <bin.meng@windriver.com>

`link_up` is never used in gpex_pcie_init(). Drop it.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

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


