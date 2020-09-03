Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kDmfi-0005gO-M6
	for mharc-qemu-riscv@gnu.org; Thu, 03 Sep 2020 06:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kDmfg-0005dO-NF; Thu, 03 Sep 2020 06:40:48 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:37789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kDmff-00029k-1A; Thu, 03 Sep 2020 06:40:48 -0400
Received: by mail-pg1-x543.google.com with SMTP id 5so1808622pgl.4;
 Thu, 03 Sep 2020 03:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=f9xPWqK/SJaS8qAyoj5c6x49mf3bnJcQ9LW5OzQOSD0=;
 b=nonh+PiGReuSWRymd3lFRozWZXkix+l5P5P5aWFpez/GU7ZIFY1OY57XqWFWuXIzM9
 98jfneisEVo+8lFbbldgStYm8cFLDWP15zwQbiPcPm95/tSFNqKQzESGkOC+IVGab2C+
 xhj4u2k+NVDo+cXm3GFIfeiDlovRB/+1oGdW2oqCFFOud/497qUR2Ap40fxkANzpZMZP
 VWTFEweSk0TGFSOPZJH9urbMLHgiZIEDs2qBmxDH6xV71p/AI64aFi2aqJt0gWJdu6MZ
 Q+xv2jPfUBZK3igNnAno8k8hWLEbB6v8xYedojDLKNiwkPE86UejnEBUbuUb2nUm2ahb
 v/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=f9xPWqK/SJaS8qAyoj5c6x49mf3bnJcQ9LW5OzQOSD0=;
 b=CK2D8xZ0qkkUVfZDF2A1kCnl6NjpeAFEmFsBiA/2a24LPa8Hzyq1UiEAwQZzyb/l3u
 yubc2iEOQDlqsSh/jO5EhjQRrvM/9e4aF8oUs7ci98E2IBERnN8U7ogQPlL7eS+8yhd1
 inOQMq3gOJaE+5CzYZYQAJQGQFS47WGAx7zyJFAJ1G/xNK2DXXL/KMJ1P/JhHZd/leJP
 4FIOuS/TP9fDS5dh1BqFjgUlobfu/FGxCuurvJ+5Ymn9jknsLChoWCjpMoVY2PY3aFxz
 JayGggMWuu8Lqs8rPlvgeWAu5AsLtWQyrQHBJURZhEBCTmbrR4eymh1VYOtoCKBRqEnM
 R/zg==
X-Gm-Message-State: AOAM532gTznLILcNCDHI5BPwfTDbuNnggX5elvVJdnomvqR4akCl4wPM
 cEYjzCw8fP/fRCUSQ9qNK+g=
X-Google-Smtp-Source: ABdhPJyINGEjWpyWidqwfLsdiSUshWJe/hSO7swIoCy7m2uT6pGbVvQVGrvhCxIudf68WTd9MiJALg==
X-Received: by 2002:a62:fb05:: with SMTP id x5mr3246869pfm.121.1599129641855; 
 Thu, 03 Sep 2020 03:40:41 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-146-144.windriver.com.
 [147.11.146.144])
 by smtp.gmail.com with ESMTPSA id b18sm2137098pjq.3.2020.09.03.03.40.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Sep 2020 03:40:41 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 01/12] hw/riscv: Move sifive_e_prci model to hw/misc
Date: Thu,  3 Sep 2020 18:40:12 +0800
Message-Id: <1599129623-68957-2-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599129623-68957-1-git-send-email-bmeng.cn@gmail.com>
References: <1599129623-68957-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x543.google.com
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
X-List-Received-Date: Thu, 03 Sep 2020 10:40:49 -0000

From: Bin Meng <bin.meng@windriver.com>

This is an effort to clean up the hw/riscv directory. Ideally it
should only contain the RISC-V SoC / machine codes plus generic
codes. Let's move sifive_e_prci model to hw/misc directory.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 include/hw/{riscv => misc}/sifive_e_prci.h | 0
 hw/{riscv => misc}/sifive_e_prci.c         | 2 +-
 hw/riscv/sifive_e.c                        | 2 +-
 hw/misc/Kconfig                            | 3 +++
 hw/misc/meson.build                        | 3 +++
 hw/riscv/Kconfig                           | 1 +
 hw/riscv/meson.build                       | 1 -
 7 files changed, 9 insertions(+), 3 deletions(-)
 rename include/hw/{riscv => misc}/sifive_e_prci.h (100%)
 rename hw/{riscv => misc}/sifive_e_prci.c (99%)

diff --git a/include/hw/riscv/sifive_e_prci.h b/include/hw/misc/sifive_e_prci.h
similarity index 100%
rename from include/hw/riscv/sifive_e_prci.h
rename to include/hw/misc/sifive_e_prci.h
diff --git a/hw/riscv/sifive_e_prci.c b/hw/misc/sifive_e_prci.c
similarity index 99%
rename from hw/riscv/sifive_e_prci.c
rename to hw/misc/sifive_e_prci.c
index 17dfa74..8ec4ee4 100644
--- a/hw/riscv/sifive_e_prci.c
+++ b/hw/misc/sifive_e_prci.c
@@ -24,7 +24,7 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "hw/hw.h"
-#include "hw/riscv/sifive_e_prci.h"
+#include "hw/misc/sifive_e_prci.h"
 
 static uint64_t sifive_e_prci_read(void *opaque, hwaddr addr, unsigned int size)
 {
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 36ccfb2..7f43ed9 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -43,8 +43,8 @@
 #include "hw/riscv/sifive_clint.h"
 #include "hw/riscv/sifive_uart.h"
 #include "hw/riscv/sifive_e.h"
-#include "hw/riscv/sifive_e_prci.h"
 #include "hw/riscv/boot.h"
+#include "hw/misc/sifive_e_prci.h"
 #include "chardev/char.h"
 #include "sysemu/arch_init.h"
 #include "sysemu/sysemu.h"
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 92c397c..5073986 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -134,4 +134,7 @@ config MAC_VIA
 config AVR_POWER
     bool
 
+config SIFIVE_E_PRCI
+    bool
+
 source macio/Kconfig
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index e1576b8..b6b2e57 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -21,6 +21,9 @@ softmmu_ss.add(when: 'CONFIG_ARM11SCU', if_true: files('arm11scu.c'))
 # Mac devices
 softmmu_ss.add(when: 'CONFIG_MOS6522', if_true: files('mos6522.c'))
 
+# RISC-V devices
+softmmu_ss.add(when: 'CONFIG_SIFIVE_E_PRCI', if_true: files('sifive_e_prci.c'))
+
 # PKUnity SoC devices
 softmmu_ss.add(when: 'CONFIG_PUV3', if_true: files('puv3_pm.c'))
 
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index e53ab1e..5855e99 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -15,6 +15,7 @@ config SIFIVE_E
     bool
     select HART
     select SIFIVE
+    select SIFIVE_E_PRCI
     select UNIMP
 
 config SIFIVE_U
diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
index cf1aa99..d73ea99 100644
--- a/hw/riscv/meson.build
+++ b/hw/riscv/meson.build
@@ -10,7 +10,6 @@ riscv_ss.add(when: 'CONFIG_SIFIVE', if_true: files('sifive_plic.c'))
 riscv_ss.add(when: 'CONFIG_SIFIVE', if_true: files('sifive_test.c'))
 riscv_ss.add(when: 'CONFIG_SIFIVE', if_true: files('sifive_uart.c'))
 riscv_ss.add(when: 'CONFIG_SIFIVE_E', if_true: files('sifive_e.c'))
-riscv_ss.add(when: 'CONFIG_SIFIVE_E', if_true: files('sifive_e_prci.c'))
 riscv_ss.add(when: 'CONFIG_SIFIVE_U', if_true: files('sifive_u.c'))
 riscv_ss.add(when: 'CONFIG_SIFIVE_U', if_true: files('sifive_u_otp.c'))
 riscv_ss.add(when: 'CONFIG_SIFIVE_U', if_true: files('sifive_u_prci.c'))
-- 
2.7.4


