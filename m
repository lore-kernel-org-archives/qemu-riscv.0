Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jZdpe-0000sc-HZ
	for mharc-qemu-riscv@gnu.org; Fri, 15 May 2020 13:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZdpc-0000m2-Pu
 for qemu-riscv@nongnu.org; Fri, 15 May 2020 13:09:08 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:46987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZdpb-00033M-R3
 for qemu-riscv@nongnu.org; Fri, 15 May 2020 13:09:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589562547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ZX0QW9DXonbuBshkLSkBrNCbZ8d0l65fGU32CLsfp4=;
 b=E1Ec7NwfRQPdN6S3PcrFdumN0aN0NZjEePERDfRxPa6PNO3IgWa2nG1TMsHPAkQOHiMpkU
 gQW29bBHTW/+E2sob1Sopsx5+XGnwE5ny4ybKi3ILA8+hDslssqyGdbPFjwCzeq8Xx8Ysm
 L8jbma/xsnSMOiK5xBpiWI6xF9HrrYQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-Qs-aG0z-MF6rKkquam3DoQ-1; Fri, 15 May 2020 13:09:05 -0400
X-MC-Unique: Qs-aG0z-MF6rKkquam3DoQ-1
Received: by mail-wm1-f69.google.com with SMTP id a67so1466497wme.6
 for <qemu-riscv@nongnu.org>; Fri, 15 May 2020 10:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1ZX0QW9DXonbuBshkLSkBrNCbZ8d0l65fGU32CLsfp4=;
 b=Q19KDrAPIA98WJR9BxkO2Qm6HuOnPO272bwkHeHcBw0EtSD4gWhfvjCYqQSgz0qZkB
 Z6gxpGatpCUgP/rjwuQPJDcU+y/zOb+iBiKAWzWjVJIssNV2m4Y6l5cqJ4u/i2laJTEi
 bMc/a0pnEen4XuyjQXoRfUFuYanM51R9bhAn1guwPbylbaGXY3Z2tALewpYThiIP1bZq
 w6KLClDm+W8E6iomOFBprCh9kI4MqNKg9gP6P21t3mYJBmcTnRsj/SGy44fQbh2uCpQA
 ywz0S9fV4HfRqXwsx6TOdsc18z7UBoMaus7rjvm8T506a0JXJ3kTvqfG596tw2eptkyA
 vHGA==
X-Gm-Message-State: AOAM532EZ2URcrQTXZ5ITIPXqPHjn6bMVqMDDCaex+3zJkVA0d9t6J7m
 D/Ms+vPwm3pFbfWUtCs5i962sX76U1RVIsXswAJIxoSB8QsSctkTNtirs5DB90KuZQlj6Kv9krB
 OPOqNnuYqbuIA3xw=
X-Received: by 2002:a1c:2502:: with SMTP id l2mr3758336wml.111.1589562544151; 
 Fri, 15 May 2020 10:09:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpNVZbQGG3qsOlZD6eLW7rackHHKqwy520Y9CFVeCGODSF13/8lWF5MSzbh8IfuztKS3HzUA==
X-Received: by 2002:a1c:2502:: with SMTP id l2mr3758311wml.111.1589562543904; 
 Fri, 15 May 2020 10:09:03 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id 5sm4556980wmd.19.2020.05.15.10.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 10:09:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Richard Henderson <rth@twiddle.net>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, qemu-riscv@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Marek Vasut <marex@denx.de>, Michael Walle <michael@walle.cc>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 10/10] hw/semihosting: Make the feature depend of TCG,
 and allow to disable it
Date: Fri, 15 May 2020 19:08:04 +0200
Message-Id: <20200515170804.5707-11-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200515170804.5707-1-philmd@redhat.com>
References: <20200515170804.5707-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/15 00:07:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 15 May 2020 17:09:09 -0000

The semihosting feature is only meaningful when using TCG.

Do not enable it by default, and let the few targets requiring
it to manually select it.
The targets restricted to TCG that previously selected it
(see commit 16932bb761e52c2 'introduce CONFIG_SEMIHOSTING')
are left unmodified; however the selection is moved to the
target Kconfig.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 default-configs/arm-softmmu.mak         | 1 -
 default-configs/lm32-softmmu.mak        | 2 --
 default-configs/m68k-softmmu.mak        | 2 --
 default-configs/mips-softmmu-common.mak | 3 ---
 default-configs/nios2-softmmu.mak       | 2 --
 default-configs/xtensa-softmmu.mak      | 2 --
 hw/semihosting/Kconfig                  | 4 +++-
 target/arm/Kconfig                      | 2 ++
 target/lm32/Kconfig                     | 2 ++
 target/m68k/Kconfig                     | 2 ++
 target/mips/Kconfig                     | 2 ++
 target/nios2/Kconfig                    | 2 ++
 target/riscv/Kconfig                    | 2 ++
 target/xtensa/Kconfig                   | 2 ++
 14 files changed, 17 insertions(+), 13 deletions(-)
 create mode 100644 target/arm/Kconfig
 create mode 100644 target/lm32/Kconfig
 create mode 100644 target/m68k/Kconfig
 create mode 100644 target/mips/Kconfig
 create mode 100644 target/nios2/Kconfig
 create mode 100644 target/riscv/Kconfig
 create mode 100644 target/xtensa/Kconfig

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 8fc09a4a51..f6044f1121 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -40,6 +40,5 @@ CONFIG_MICROBIT=y
 CONFIG_FSL_IMX25=y
 CONFIG_FSL_IMX7=y
 CONFIG_FSL_IMX6UL=y
-CONFIG_SEMIHOSTING=y
 CONFIG_ALLWINNER_H3=y
 CONFIG_ACPI_APEI=y
diff --git a/default-configs/lm32-softmmu.mak b/default-configs/lm32-softmmu.mak
index 115b3e34c9..6d259665d6 100644
--- a/default-configs/lm32-softmmu.mak
+++ b/default-configs/lm32-softmmu.mak
@@ -4,8 +4,6 @@
 #
 #CONFIG_MILKYMIST_TMU2=n        # disabling it actually causes compile-time failures
 
-CONFIG_SEMIHOSTING=y
-
 # Boards:
 #
 CONFIG_LM32=y
diff --git a/default-configs/m68k-softmmu.mak b/default-configs/m68k-softmmu.mak
index 6629fd2aa3..4fef4bd731 100644
--- a/default-configs/m68k-softmmu.mak
+++ b/default-configs/m68k-softmmu.mak
@@ -1,7 +1,5 @@
 # Default configuration for m68k-softmmu
 
-CONFIG_SEMIHOSTING=y
-
 # Boards:
 #
 CONFIG_AN5206=y
diff --git a/default-configs/mips-softmmu-common.mak b/default-configs/mips-softmmu-common.mak
index da29c6c0b2..6c0904b200 100644
--- a/default-configs/mips-softmmu-common.mak
+++ b/default-configs/mips-softmmu-common.mak
@@ -1,8 +1,5 @@
 # Common mips*-softmmu CONFIG defines
 
-# CONFIG_SEMIHOSTING is always required on this architecture
-CONFIG_SEMIHOSTING=y
-
 CONFIG_ISA_BUS=y
 CONFIG_PCI=y
 CONFIG_PCI_DEVICES=y
diff --git a/default-configs/nios2-softmmu.mak b/default-configs/nios2-softmmu.mak
index 1bc4082ea9..e130d024e6 100644
--- a/default-configs/nios2-softmmu.mak
+++ b/default-configs/nios2-softmmu.mak
@@ -1,7 +1,5 @@
 # Default configuration for nios2-softmmu
 
-CONFIG_SEMIHOSTING=y
-
 # Boards:
 #
 CONFIG_NIOS2_10M50=y
diff --git a/default-configs/xtensa-softmmu.mak b/default-configs/xtensa-softmmu.mak
index 4fe1bf00c9..49e4c9da88 100644
--- a/default-configs/xtensa-softmmu.mak
+++ b/default-configs/xtensa-softmmu.mak
@@ -1,7 +1,5 @@
 # Default configuration for Xtensa
 
-CONFIG_SEMIHOSTING=y
-
 # Boards:
 #
 CONFIG_XTENSA_SIM=y
diff --git a/hw/semihosting/Kconfig b/hw/semihosting/Kconfig
index efe0a30734..30befcdd21 100644
--- a/hw/semihosting/Kconfig
+++ b/hw/semihosting/Kconfig
@@ -1,3 +1,5 @@
 
+# default is 'n'
 config SEMIHOSTING
-       bool
+    bool
+    depends on TCG
diff --git a/target/arm/Kconfig b/target/arm/Kconfig
new file mode 100644
index 0000000000..3224cac4ad
--- /dev/null
+++ b/target/arm/Kconfig
@@ -0,0 +1,2 @@
+config SEMIHOSTING
+    default y if TCG
diff --git a/target/lm32/Kconfig b/target/lm32/Kconfig
new file mode 100644
index 0000000000..c0a9a9e799
--- /dev/null
+++ b/target/lm32/Kconfig
@@ -0,0 +1,2 @@
+config SEMIHOSTING
+    default y
diff --git a/target/m68k/Kconfig b/target/m68k/Kconfig
new file mode 100644
index 0000000000..c0a9a9e799
--- /dev/null
+++ b/target/m68k/Kconfig
@@ -0,0 +1,2 @@
+config SEMIHOSTING
+    default y
diff --git a/target/mips/Kconfig b/target/mips/Kconfig
new file mode 100644
index 0000000000..3224cac4ad
--- /dev/null
+++ b/target/mips/Kconfig
@@ -0,0 +1,2 @@
+config SEMIHOSTING
+    default y if TCG
diff --git a/target/nios2/Kconfig b/target/nios2/Kconfig
new file mode 100644
index 0000000000..c0a9a9e799
--- /dev/null
+++ b/target/nios2/Kconfig
@@ -0,0 +1,2 @@
+config SEMIHOSTING
+    default y
diff --git a/target/riscv/Kconfig b/target/riscv/Kconfig
new file mode 100644
index 0000000000..3224cac4ad
--- /dev/null
+++ b/target/riscv/Kconfig
@@ -0,0 +1,2 @@
+config SEMIHOSTING
+    default y if TCG
diff --git a/target/xtensa/Kconfig b/target/xtensa/Kconfig
new file mode 100644
index 0000000000..c0a9a9e799
--- /dev/null
+++ b/target/xtensa/Kconfig
@@ -0,0 +1,2 @@
+config SEMIHOSTING
+    default y
-- 
2.21.3


