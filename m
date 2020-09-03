Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kDmfk-0005kh-AL
	for mharc-qemu-riscv@gnu.org; Thu, 03 Sep 2020 06:40:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kDmfi-0005ff-6f; Thu, 03 Sep 2020 06:40:50 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:44698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kDmfg-0002EK-94; Thu, 03 Sep 2020 06:40:49 -0400
Received: by mail-pf1-x444.google.com with SMTP id o20so1981375pfp.11;
 Thu, 03 Sep 2020 03:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UwDaAVEiFSZ9mLDfhLuxqgfHtEhiPD/jjAdGrjSJZeM=;
 b=MUJOZ5EkSuzdSHnunCuf5vMZ9Zij4XlZmFWBqs/Cpe0Y8PwLvzpiK7lwEYNc5guKzX
 SFAwi2gF7BLR01tYb7VRdSod6OZ7ONeheIA/yRKQHGZKX93VH4352geQsgSSbUt00lo6
 AITjWNwX347UMB4hoJOgBFEADb4GWGAc8pgT83AG+5DN3S9XJZOpX5/vm8Iru1ycDVSr
 zLC44udY/gBfb+6bYaOQZTrOnD4p4L0fOcZPEPF6cO5ZNQYdOlVbCg4PktWn75dkUoom
 Kt9ZTExf3ZA3sOdGYcNvDEWYrwFhevqGU8uB9yOP3ozoPRIZvvi8OK21Tf/WzJwTH/j9
 srxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UwDaAVEiFSZ9mLDfhLuxqgfHtEhiPD/jjAdGrjSJZeM=;
 b=Wh3Y2mrcfifkXYXFF5pyNbGkcWu5VADb6wQ0qNZ6b6boFYv02PwtQp0NV3/j0W5Hei
 sG6QVamJ4gXsYxkmQs+bh0FAlpgwY9egVgaaAw5Vg74MPz0EQkG3MxRbamKcvONcgvTW
 xBmHOpaDs05FUQLTZMfvjGduq87HfulhU4CNtqhyqZVSx1nI6T2VYQmDi/BHBNgFxVMK
 2swe/qYVG1763O08jWOGQ7w+DaWHOdAAPEM9RdqDmkB0k1JTx8UyYU4GRf9+3Nj1Oeil
 Es+cpj1c1dWfzChXoPKUEsCHWqknZeUorLc3qiorXiob+6Q9oFvhoihYD4cpaLULHuX+
 1qbw==
X-Gm-Message-State: AOAM532eYXvJ4hfV/OCUHgbOy2umMKey+3T5BAI3KlC76NUXZysgCFy3
 /E/90D1ld2ZHaFOnOkE3eZc=
X-Google-Smtp-Source: ABdhPJwE+YW1cApRQ1X0cI4T4yjYdV5t8GsN7v7Er02oDQpSQOloAngYX78gXhSxx+TZy7RDIy+gkw==
X-Received: by 2002:a17:902:ed13:b029:d0:89f1:9e32 with SMTP id
 b19-20020a170902ed13b02900d089f19e32mr1798757pld.14.1599129646795; 
 Thu, 03 Sep 2020 03:40:46 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-146-144.windriver.com.
 [147.11.146.144])
 by smtp.gmail.com with ESMTPSA id b18sm2137098pjq.3.2020.09.03.03.40.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Sep 2020 03:40:46 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 03/12] hw/riscv: Move sifive_u_otp model to hw/misc
Date: Thu,  3 Sep 2020 18:40:14 +0800
Message-Id: <1599129623-68957-4-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599129623-68957-1-git-send-email-bmeng.cn@gmail.com>
References: <1599129623-68957-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x444.google.com
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
X-List-Received-Date: Thu, 03 Sep 2020 10:40:50 -0000

From: Bin Meng <bin.meng@windriver.com>

This is an effort to clean up the hw/riscv directory. Ideally it
should only contain the RISC-V SoC / machine codes plus generic
codes. Let's move sifive_u_otp model to hw/misc directory.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 include/hw/{riscv => misc}/sifive_u_otp.h | 0
 include/hw/riscv/sifive_u.h               | 2 +-
 hw/{riscv => misc}/sifive_u_otp.c         | 2 +-
 hw/misc/Kconfig                           | 3 +++
 hw/misc/meson.build                       | 1 +
 hw/riscv/Kconfig                          | 1 +
 hw/riscv/meson.build                      | 1 -
 7 files changed, 7 insertions(+), 3 deletions(-)
 rename include/hw/{riscv => misc}/sifive_u_otp.h (100%)
 rename hw/{riscv => misc}/sifive_u_otp.c (99%)

diff --git a/include/hw/riscv/sifive_u_otp.h b/include/hw/misc/sifive_u_otp.h
similarity index 100%
rename from include/hw/riscv/sifive_u_otp.h
rename to include/hw/misc/sifive_u_otp.h
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index cbeb228..936a3bd 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -24,7 +24,7 @@
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/sifive_cpu.h"
 #include "hw/riscv/sifive_gpio.h"
-#include "hw/riscv/sifive_u_otp.h"
+#include "hw/misc/sifive_u_otp.h"
 #include "hw/misc/sifive_u_prci.h"
 
 #define TYPE_RISCV_U_SOC "riscv.sifive.u.soc"
diff --git a/hw/riscv/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
similarity index 99%
rename from hw/riscv/sifive_u_otp.c
rename to hw/misc/sifive_u_otp.c
index f6ecbaa..c2f3c8e 100644
--- a/hw/riscv/sifive_u_otp.c
+++ b/hw/misc/sifive_u_otp.c
@@ -23,7 +23,7 @@
 #include "hw/sysbus.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
-#include "hw/riscv/sifive_u_otp.h"
+#include "hw/misc/sifive_u_otp.h"
 
 static uint64_t sifive_u_otp_read(void *opaque, hwaddr addr, unsigned int size)
 {
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 65f3fdd..fa3d0f4 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -137,6 +137,9 @@ config AVR_POWER
 config SIFIVE_E_PRCI
     bool
 
+config SIFIVE_U_OTP
+    bool
+
 config SIFIVE_U_PRCI
     bool
 
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 9e9550e..018a88c 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -23,6 +23,7 @@ softmmu_ss.add(when: 'CONFIG_MOS6522', if_true: files('mos6522.c'))
 
 # RISC-V devices
 softmmu_ss.add(when: 'CONFIG_SIFIVE_E_PRCI', if_true: files('sifive_e_prci.c'))
+softmmu_ss.add(when: 'CONFIG_SIFIVE_U_OTP', if_true: files('sifive_u_otp.c'))
 softmmu_ss.add(when: 'CONFIG_SIFIVE_U_PRCI', if_true: files('sifive_u_prci.c'))
 
 # PKUnity SoC devices
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 109364b..76eaf77 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -24,6 +24,7 @@ config SIFIVE_U
     select HART
     select SIFIVE
     select SIFIVE_PDMA
+    select SIFIVE_U_OTP
     select SIFIVE_U_PRCI
     select UNIMP
 
diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
index e6c8af0..2ba4757 100644
--- a/hw/riscv/meson.build
+++ b/hw/riscv/meson.build
@@ -11,7 +11,6 @@ riscv_ss.add(when: 'CONFIG_SIFIVE', if_true: files('sifive_test.c'))
 riscv_ss.add(when: 'CONFIG_SIFIVE', if_true: files('sifive_uart.c'))
 riscv_ss.add(when: 'CONFIG_SIFIVE_E', if_true: files('sifive_e.c'))
 riscv_ss.add(when: 'CONFIG_SIFIVE_U', if_true: files('sifive_u.c'))
-riscv_ss.add(when: 'CONFIG_SIFIVE_U', if_true: files('sifive_u_otp.c'))
 riscv_ss.add(when: 'CONFIG_SPIKE', if_true: files('riscv_htif.c'))
 riscv_ss.add(when: 'CONFIG_SPIKE', if_true: files('spike.c'))
 riscv_ss.add(when: 'CONFIG_MICROCHIP_PFSOC', if_true: files('microchip_pfsoc.c'))
-- 
2.7.4


