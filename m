Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lOFNI-0000BL-1t
	for mharc-qemu-riscv@gnu.org; Mon, 22 Mar 2021 03:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lOFNG-0000Ai-17; Mon, 22 Mar 2021 03:53:18 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:47022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lOFNE-0000UC-82; Mon, 22 Mar 2021 03:53:17 -0400
Received: by mail-ej1-x631.google.com with SMTP id u21so1662961ejo.13;
 Mon, 22 Mar 2021 00:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cs+Z0fdL1sAHQBPvNReIU5kyz9OmiirPaFx/ufuYLo4=;
 b=Adf9hnkfh+sMQ35wJ9IE92doj1Y1+vJvN6xtf5k+5lChhNdHotqX5nom5p4/ZwArI5
 0fQYiRFChlaA4gRY4SppdS25RPElMYYwRV6H0cuFfVCdfvAqbbRU8Z2QoGt5eU2+qodE
 yGsBgLbnDG8cReSB61IApKszi54wQZZQtXW6IT6nmmg86il4/JzE7R9/p4TpKZvTXVjr
 oTWHw+uxISJ3PpCr4NjIcYKvjUXhscnkFKHe3DxXYQaH+yWgSw5EyLrTb7qj3ceDF5RO
 EjWZnt1zCjNjt7Gkrefa2f5J46Q+IfyXYp+yFF1iTeBYRHvvRZChnhaJeqUaogSTynBT
 KGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cs+Z0fdL1sAHQBPvNReIU5kyz9OmiirPaFx/ufuYLo4=;
 b=BenBR4aP6AytLXS0YA0vSfvAPzcgeD3NSEi+77NHYdMO6H7YkrTwYu0p8rkPW1IQ9d
 gVFiIOZkjgKeJ5BhuVgiP//CrMy/xlaVMbiwWiLqYCwfDNoE1UmONc2/zi0jFZVbdQ9I
 Anu70GgKtAF0luddeB8bhCPBuZ4RBvm1OfxTtsEHhn5XJipiWv2KHmnocqOTonaLxDbM
 JY2QRQhrLHMizOQpw29QvC+iI7FwxuTqgq/n7p9deuwl/+fv75YDNDG0rv8U2cNYG7VI
 E/2+khiWRcJ+R4CFnvjLZ0V0pWeuEzADij6vhTyosEIaNSq1Ok0wjyNNHRBEEgjtWpP0
 k0eQ==
X-Gm-Message-State: AOAM531UMv56UaCdNFqyDw01p7VrSbdpgvGntHevbZE6GXLHpJYB+UK2
 zUlJ/kr+jjwewlRsNa4fLfI=
X-Google-Smtp-Source: ABdhPJx9HHKuq0ghFkTJkR+3hsHZURpuuHrc9YRIA4PdiVbNLq/GhffAFqhFmK9Xs82ThpHumOjJDA==
X-Received: by 2002:a17:906:5495:: with SMTP id
 r21mr18081059ejo.471.1616399593782; 
 Mon, 22 Mar 2021 00:53:13 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id x17sm9193844ejd.68.2021.03.22.00.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 00:53:13 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 1/2] hw/riscv: microchip_pfsoc: Map EMMC/SD mux register
Date: Mon, 22 Mar 2021 15:52:47 +0800
Message-Id: <20210322075248.136255-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x631.google.com
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
X-List-Received-Date: Mon, 22 Mar 2021 07:53:18 -0000

From: Bin Meng <bin.meng@windriver.com>

Since HSS commit c20a89f8dcac, the Icicle Kit reference design has
been updated to use a register mapped at 0x4f000000 instead of a
GPIO to control whether eMMC or SD card is to be used. With this
support the same HSS image can be used for both eMMC and SD card
boot flow, while previously two different board configurations were
used. This is undocumented but one can take a look at the HSS code
HSS_MMCInit() in services/mmc/mmc_api.c.

With this commit, HSS image built from 2020.12 release boots again.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 include/hw/riscv/microchip_pfsoc.h | 1 +
 hw/riscv/microchip_pfsoc.c         | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microchip_pfsoc.h
index d0c666aae0..d30916f45d 100644
--- a/include/hw/riscv/microchip_pfsoc.h
+++ b/include/hw/riscv/microchip_pfsoc.h
@@ -109,6 +109,7 @@ enum {
     MICROCHIP_PFSOC_ENVM_DATA,
     MICROCHIP_PFSOC_QSPI_XIP,
     MICROCHIP_PFSOC_IOSCB,
+    MICROCHIP_PFSOC_EMMC_SD_MUX,
     MICROCHIP_PFSOC_DRAM_LO,
     MICROCHIP_PFSOC_DRAM_LO_ALIAS,
     MICROCHIP_PFSOC_DRAM_HI,
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 266f1c3342..c4146b7a6b 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -122,6 +122,7 @@ static const MemMapEntry microchip_pfsoc_memmap[] = {
     [MICROCHIP_PFSOC_ENVM_DATA] =       { 0x20220000,    0x20000 },
     [MICROCHIP_PFSOC_QSPI_XIP] =        { 0x21000000,  0x1000000 },
     [MICROCHIP_PFSOC_IOSCB] =           { 0x30000000, 0x10000000 },
+    [MICROCHIP_PFSOC_EMMC_SD_MUX] =     { 0x4f000000,        0x4 },
     [MICROCHIP_PFSOC_DRAM_LO] =         { 0x80000000, 0x40000000 },
     [MICROCHIP_PFSOC_DRAM_LO_ALIAS] =   { 0xc0000000, 0x40000000 },
     [MICROCHIP_PFSOC_DRAM_HI] =       { 0x1000000000,        0x0 },
@@ -411,6 +412,11 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->ioscb), 0,
                     memmap[MICROCHIP_PFSOC_IOSCB].base);
 
+    /* eMMC/SD mux */
+    create_unimplemented_device("microchip.pfsoc.emmc_sd_mux",
+        memmap[MICROCHIP_PFSOC_EMMC_SD_MUX].base,
+        memmap[MICROCHIP_PFSOC_EMMC_SD_MUX].size);
+
     /* QSPI Flash */
     memory_region_init_rom(qspi_xip_mem, OBJECT(dev),
                            "microchip.pfsoc.qspi_xip",
-- 
2.25.1


