Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lQvNe-000615-BA
	for mharc-qemu-riscv@gnu.org; Mon, 29 Mar 2021 13:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lQvNd-0005z1-BE; Mon, 29 Mar 2021 13:08:45 -0400
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:45801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lQvNX-0004UF-9I; Mon, 29 Mar 2021 13:08:45 -0400
Received: by mail-qv1-xf36.google.com with SMTP id t16so6775364qvr.12;
 Mon, 29 Mar 2021 10:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CzZq3zGrlxWDkyLDfTxKVl+AzpvgJj0bWMsHQiFEoGw=;
 b=Ijg2bo6moq2dxZuPP5jbkBbCsFKif306t4cuaznDqUZ4/AdsEdlQTdF291MpKpxUtt
 /sl44gEDZcC23NwmgSLT6gCgKHeLpp5WH/Zv9jZGWmynfgVqqe9t5Vx6pbwtgeGJUbV9
 Ihi1iLdG5cvxyxFGHwbaD+0dXY6f3ctR0++nhALjM64b3x1G5w4MgeyoGMcxz23i77YR
 0woVq0250F0TzB89dnst95LCQOgWXQ8CUhY/0sDN87iQ44TQDrb7kWQZoz1zsXhOP/uU
 S5MO7A6FqpSlJQr3kmuFBnoW07/9zb7db2WZdCmZ5HFUFxbObYXd5b53/D2iXospeQ7/
 ptiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CzZq3zGrlxWDkyLDfTxKVl+AzpvgJj0bWMsHQiFEoGw=;
 b=PXCsnMtzx+W6ymHLncZc8undEM5wuiAO2DztjUTpgiU8cVmcw4xG/MuIES2gVsgaVI
 XmoafW0VstLugR3eCYfKyQLs/kWmskfqFZjBSf0HB3oD2mqiG+8v5VyUfaTDaJDt2DxH
 LERJ+F9z8umMhfLH1DnPF8H9Slw5v5zR6PKf7LrD1VgqG7iJaXf+tQP78y+vb8PsiIyS
 EnU8NGvhXD48dyJQRhKjyTjy4yQkPtEi/N34G6lrcIGlPyuLfu+V39sPJAuYkJYS+hx9
 6d7JyUjk3xsRuMA5hwj7n/ntIw3pyNU/ZlI9oV9fCa15Lm8ForDPX5q2/4dFzXoR6gfx
 VQnQ==
X-Gm-Message-State: AOAM532WpNQxebw+Y5PIsSjJ9GyhKmSRFxIsvDjIi0d0mYFcZSnjzAIb
 6KbrYPvaqXjh5v3Xpi37yFM=
X-Google-Smtp-Source: ABdhPJwmDMRuenJfC8CDIg28DoLeKSai5QjeVJxTwFuwbLUiRKLUDkgV3kjuNQXT+7xWt1V5pKFnqA==
X-Received: by 2002:ad4:4b6c:: with SMTP id m12mr25794154qvx.21.1617037716748; 
 Mon, 29 Mar 2021 10:08:36 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id i6sm13553981qkf.96.2021.03.29.10.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 10:08:36 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 5/8] docs/system/riscv: Correct the indentation level of
 supported devices
Date: Tue, 30 Mar 2021 01:08:15 +0800
Message-Id: <20210329170818.23139-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210329170818.23139-1-bmeng.cn@gmail.com>
References: <20210329170818.23139-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf36.google.com
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
X-List-Received-Date: Mon, 29 Mar 2021 17:08:45 -0000

From: Bin Meng <bin.meng@windriver.com>

The supported device bullet list has an additional space before each
entry, which makes a wrong indentation level. Correct it.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 docs/system/riscv/microchip-icicle-kit.rst | 20 +++++++--------
 docs/system/riscv/sifive_u.rst             | 30 +++++++++++-----------
 2 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/docs/system/riscv/microchip-icicle-kit.rst b/docs/system/riscv/microchip-icicle-kit.rst
index 4fe97bce3f..e803131763 100644
--- a/docs/system/riscv/microchip-icicle-kit.rst
+++ b/docs/system/riscv/microchip-icicle-kit.rst
@@ -15,16 +15,16 @@ Supported devices
 
 The ``microchip-icicle-kit`` machine supports the following devices:
 
- * 1 E51 core
- * 4 U54 cores
- * Core Level Interruptor (CLINT)
- * Platform-Level Interrupt Controller (PLIC)
- * L2 Loosely Integrated Memory (L2-LIM)
- * DDR memory controller
- * 5 MMUARTs
- * 1 DMA controller
- * 2 GEM Ethernet controllers
- * 1 SDHC storage controller
+* 1 E51 core
+* 4 U54 cores
+* Core Level Interruptor (CLINT)
+* Platform-Level Interrupt Controller (PLIC)
+* L2 Loosely Integrated Memory (L2-LIM)
+* DDR memory controller
+* 5 MMUARTs
+* 1 DMA controller
+* 2 GEM Ethernet controllers
+* 1 SDHC storage controller
 
 Boot options
 ------------
diff --git a/docs/system/riscv/sifive_u.rst b/docs/system/riscv/sifive_u.rst
index 98e7562848..dcdfbda931 100644
--- a/docs/system/riscv/sifive_u.rst
+++ b/docs/system/riscv/sifive_u.rst
@@ -9,21 +9,21 @@ Supported devices
 
 The ``sifive_u`` machine supports the following devices:
 
- * 1 E51 / E31 core
- * Up to 4 U54 / U34 cores
- * Core Level Interruptor (CLINT)
- * Platform-Level Interrupt Controller (PLIC)
- * Power, Reset, Clock, Interrupt (PRCI)
- * L2 Loosely Integrated Memory (L2-LIM)
- * DDR memory controller
- * 2 UARTs
- * 1 GEM Ethernet controller
- * 1 GPIO controller
- * 1 One-Time Programmable (OTP) memory with stored serial number
- * 1 DMA controller
- * 2 QSPI controllers
- * 1 ISSI 25WP256 flash
- * 1 SD card in SPI mode
+* 1 E51 / E31 core
+* Up to 4 U54 / U34 cores
+* Core Level Interruptor (CLINT)
+* Platform-Level Interrupt Controller (PLIC)
+* Power, Reset, Clock, Interrupt (PRCI)
+* L2 Loosely Integrated Memory (L2-LIM)
+* DDR memory controller
+* 2 UARTs
+* 1 GEM Ethernet controller
+* 1 GPIO controller
+* 1 One-Time Programmable (OTP) memory with stored serial number
+* 1 DMA controller
+* 2 QSPI controllers
+* 1 ISSI 25WP256 flash
+* 1 SD card in SPI mode
 
 Please note the real world HiFive Unleashed board has a fixed configuration of
 1 E51 core and 4 U54 core combination and the RISC-V core boots in 64-bit mode.
-- 
2.25.1


