Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kDmg6-0006YG-EF
	for mharc-qemu-riscv@gnu.org; Thu, 03 Sep 2020 06:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kDmg4-0006UI-K6; Thu, 03 Sep 2020 06:41:12 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:52938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kDmg2-0002Ij-N8; Thu, 03 Sep 2020 06:41:12 -0400
Received: by mail-pj1-x1043.google.com with SMTP id o16so1325376pjr.2;
 Thu, 03 Sep 2020 03:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BAoSl8WTSMSqpJyU/pVpg7WKQMPGwvLFY7+i9UUWwnw=;
 b=U6Czt9PXu9J0Hk9PJMa/vOnhxlTRBTw4YmF0DtwG+CJCaTjTla7ZeWQ2CKzKEfIf/M
 wYjrPUixtjHph4uyOcqUKg0NOueYDiK4xStryBLLt20opQckMKXDYwCoxCpsFeOUUeyY
 Fo6gQhItEuClOfj06dDq0n0NDlBP1vvkR6LUF6S4T6USkZAr8IzWxiDOuDcgmoGGMURc
 LDSqgOhnyYcDK/6LEF0Kuh+acTtmb57B325gotZSW/JWrhklLa6ug0QlMF59KXllscYA
 DNpbz4gHP0wScWxb9N7FR4w3y49xGhkSNJ1bMWoeORabGLvVhd+oCA9FNpoUkSLrfzOi
 ZGvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=BAoSl8WTSMSqpJyU/pVpg7WKQMPGwvLFY7+i9UUWwnw=;
 b=buAXHipUJBs3OQ6wxoY5pwETzM8CrmYcv++KwelS+9HIZ4GzWilTBXtxNGWxQ4Pl/1
 8ktSInUMdoxznIbsBm6jvHSm7xblGJ3fAN/eTGnLmI3tmSBJwmKU+vzS4eC+XVPfjjEx
 /iPjBhH+9PCqQMgksJvczo0DONtDE6gMvfwRxY0mmS7Ph6YZHKJSriOkpN5OvqIs2IqV
 fs3WfBbFPcj8JSkzzAXIEY8qx5g58iTQ7z0fsTJfETIv+A1a5/rdwIH7u9DI79NzvjCN
 /UQ/p3BF0luHyB2JvEXbr1N/LeWCqo1RinsKeW/SNX0Qc95CD/4z/tnX044Gax8l/noU
 pG0Q==
X-Gm-Message-State: AOAM530Wsvdm6IMTbEUOb0GZ2mfssWfYIB9VFQNGP1ipTte23dWhPs1+
 FoFFyCC/67XwH6MayIK+wRU=
X-Google-Smtp-Source: ABdhPJzlDiOK+Yjy8tz6Ce0rsIIaGfx6IsLk5Xmq0bP974cTh2uLg4CSgr58yVuplnf/TS2DvVEsJQ==
X-Received: by 2002:a17:90a:764d:: with SMTP id
 s13mr2667427pjl.58.1599129669297; 
 Thu, 03 Sep 2020 03:41:09 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-146-144.windriver.com.
 [147.11.146.144])
 by smtp.gmail.com with ESMTPSA id b18sm2137098pjq.3.2020.09.03.03.41.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Sep 2020 03:41:08 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 12/12] hw/riscv: Sort the Kconfig options in alphabetical order
Date: Thu,  3 Sep 2020 18:40:23 +0800
Message-Id: <1599129623-68957-13-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599129623-68957-1-git-send-email-bmeng.cn@gmail.com>
References: <1599129623-68957-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Thu, 03 Sep 2020 10:41:13 -0000

From: Bin Meng <bin.meng@windriver.com>

At present the Kconfig file is in disorder. Let's sort the options.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

 hw/riscv/Kconfig | 58 ++++++++++++++++++++++++++++----------------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index e152fdc..2df978f 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -1,36 +1,16 @@
 config IBEX
     bool
 
-config SIFIVE_E
-    bool
-    select MSI_NONBROKEN
-    select SIFIVE_CLINT
-    select SIFIVE_GPIO
-    select SIFIVE_PLIC
-    select SIFIVE_UART
-    select SIFIVE_E_PRCI
-    select UNIMP
-
-config SIFIVE_U
+config MICROCHIP_PFSOC
     bool
-    select CADENCE
+    select CADENCE_SDHCI
+    select MCHP_PFSOC_MMUART
     select MSI_NONBROKEN
     select SIFIVE_CLINT
-    select SIFIVE_GPIO
     select SIFIVE_PDMA
     select SIFIVE_PLIC
-    select SIFIVE_UART
-    select SIFIVE_U_OTP
-    select SIFIVE_U_PRCI
     select UNIMP
 
-config SPIKE
-    bool
-    select HTIF
-    select MSI_NONBROKEN
-    select SIFIVE_CLINT
-    select SIFIVE_PLIC
-
 config OPENTITAN
     bool
     select IBEX
@@ -40,23 +20,43 @@ config RISCV_VIRT
     bool
     imply PCI_DEVICES
     imply TEST_DEVICES
+    select GOLDFISH_RTC
     select MSI_NONBROKEN
     select PCI
-    select SERIAL
-    select GOLDFISH_RTC
-    select VIRTIO_MMIO
     select PCI_EXPRESS_GENERIC_BRIDGE
     select PFLASH_CFI01
+    select SERIAL
     select SIFIVE_CLINT
     select SIFIVE_PLIC
     select SIFIVE_TEST
+    select VIRTIO_MMIO
 
-config MICROCHIP_PFSOC
+config SIFIVE_E
     bool
     select MSI_NONBROKEN
     select SIFIVE_CLINT
+    select SIFIVE_GPIO
+    select SIFIVE_PLIC
+    select SIFIVE_UART
+    select SIFIVE_E_PRCI
     select UNIMP
-    select MCHP_PFSOC_MMUART
+
+config SIFIVE_U
+    bool
+    select CADENCE
+    select MSI_NONBROKEN
+    select SIFIVE_CLINT
+    select SIFIVE_GPIO
     select SIFIVE_PDMA
     select SIFIVE_PLIC
-    select CADENCE_SDHCI
+    select SIFIVE_UART
+    select SIFIVE_U_OTP
+    select SIFIVE_U_PRCI
+    select UNIMP
+
+config SPIKE
+    bool
+    select HTIF
+    select MSI_NONBROKEN
+    select SIFIVE_CLINT
+    select SIFIVE_PLIC
-- 
2.7.4


