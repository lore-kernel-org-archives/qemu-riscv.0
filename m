Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lcNL0-0000Kk-GM
	for mharc-qemu-riscv@gnu.org; Fri, 30 Apr 2021 03:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lcNKz-0000IO-Ct; Fri, 30 Apr 2021 03:13:21 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:43727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lcNKx-0000SM-KO; Fri, 30 Apr 2021 03:13:21 -0400
Received: by mail-ej1-x62b.google.com with SMTP id l4so103677150ejc.10;
 Fri, 30 Apr 2021 00:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FqVhQqUmVp4jHmg/3gHx517UMt+1pB/Pabk7RhPse+g=;
 b=ewWGhqWCcatMRyXThptjv/r+IAq1PDJR/XZfteO0clO715k8s1zjzmONBsn/btzMDU
 PLLWIY0mnSt7L2TM/kBVMe9EKnkXvvvjNbBKkfLIVWu4UaC6mOoSPPjPoq5zeRQkcm7y
 iOWAuibsDEYrJz5Vc2lQdcUzRnhcnVPs0bzmDXnqSonMeHGV2BYvoxRd5bL5bP41RAkW
 h7Z1z5Pj5J4PdUVUQAVZf8gJwQ3QFJAtNeJAJo/sUa5xEuwBKEF92ZppcR1k/QxqLVrG
 +aN+/DDxziCfoovKVA3evEQfX2widqZG5CodtfM1RD3yRln1LoztOvXRrFcLWhSJkVj8
 do7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FqVhQqUmVp4jHmg/3gHx517UMt+1pB/Pabk7RhPse+g=;
 b=gzRM/2Oqd1+DRJ2MVEqCWDVf5tWc+y18DPFf2B833FoWW3kUUp2NXjsNn2nu1/nP+i
 H8Y2m1lu3CTw3SmoOhSDsRTBymIByhApaOro6nU6WPgvTNus9CspotT1KH118sHNx0IR
 VHyik+08NBdEs/JTT7qcvEKA84q39BCq2CkE2oAQqujUh33wKoI1EwIUsWAIs4jaP3vl
 sTbHqyPH2G2R5ww0XmS/Ft/ML7ASNFbupmUqrQ91SWDsHgeDjGN22D8uOeDi23WVSxMo
 QiF2F37fg0YZ68JvGV4Vl6UV+HKcZDE+0QsRjp3s0DTFN4slhLPaPKhsLP85hIVvESOm
 7HWw==
X-Gm-Message-State: AOAM533uaJaF2QhWbqWZRWCLIaFMfXQloeDztwlPw7HfbirKbpL7pb3e
 OU2cekbAl2gTBwpD2bhWrRg=
X-Google-Smtp-Source: ABdhPJxs8lvELV3qSLY9yLKoC5/HjqAsoRioj9jULS1MzuVpdM4N83mnYMN9V7moY1KTrBDRD+0eQQ==
X-Received: by 2002:a17:906:2746:: with SMTP id
 a6mr2627460ejd.265.1619766798068; 
 Fri, 30 Apr 2021 00:13:18 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id b19sm574462edd.66.2021.04.30.00.13.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 00:13:17 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 5/8] docs/system/riscv: Correct the indentation level of
 supported devices
Date: Fri, 30 Apr 2021 15:12:59 +0800
Message-Id: <20210430071302.1489082-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430071302.1489082-1-bmeng.cn@gmail.com>
References: <20210430071302.1489082-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62b.google.com
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
X-List-Received-Date: Fri, 30 Apr 2021 07:13:21 -0000

From: Bin Meng <bin.meng@windriver.com>

The supported device bullet list has an additional space before each
entry, which makes a wrong indentation level. Correct it.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

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


