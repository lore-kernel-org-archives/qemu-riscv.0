Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l6Agb-0003u0-K1
	for mharc-qemu-riscv@gnu.org; Sun, 31 Jan 2021 06:14:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6AgZ-0003nG-2o; Sun, 31 Jan 2021 06:14:31 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6AgX-0006qG-Ad; Sun, 31 Jan 2021 06:14:30 -0500
Received: by mail-wr1-x42d.google.com with SMTP id 7so13472851wrz.0;
 Sun, 31 Jan 2021 03:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G4MEjoHCumEr6ZmgdVDdQeeb4uA9ELO8JMQqAxzVyEA=;
 b=kGMjQPgg+PuwWLXGyfFpAH63DQkfaoEntKmcDz1/HZ9D/AtSihntOewrXVzp7HFMPn
 FkoHU+MLckF0Mbzyocu5SZqX+nDDx2bn4b1AKSWcAs9tmxWmoA36iMin6KW+E1QhmA7R
 Wnh2f8X5qRZ+R+KHroUdSn+8wJoL2v4Ku33SP2lMN37u6T+KWIOdR0Cwus3wEKO746jR
 RM4GWWLBT/DrZlNHWoVUqMFzu9ZkEmlX/CEkHQltWE/jRPJjcHnN5Vxe6tDdSe4vmYpV
 S9Yu/uB8iH3boeEwvSLm4lLnBzSmoXvAO90kaD3drrLDEU56y4FHpyHwUN5BIdKSEYzh
 UbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=G4MEjoHCumEr6ZmgdVDdQeeb4uA9ELO8JMQqAxzVyEA=;
 b=W70u+igidiT5zzFC3mMP5WBBg9ERvXaRWjEc8oTnYRexxQJr1qgzZBpIYbpTLS7g1B
 4ixjY4zUniY/osrCtf3Yp4l7wJLKivqxpugqGpsHEomYhjsRSnRkBMKrleOZZXB+354l
 h84jdzyfjvcbW5EWvXXctpCRHRyvbvasHgX69B+M6SUd6KVgCAkjHUAacNt6Ku8G6DCt
 iuuJbzkCZel/6MCcJGsM0a0j6Bc25sCpphxtVRBxiephBx/KUuBFwn377tVEYm4LQNe3
 90GMAhliuRS3FSom9OrTz87v4+NcZrchgAS7ixahs2VPS8/BnvHxpBiBqgCuPAlenKJh
 6dQw==
X-Gm-Message-State: AOAM533Tvrnq17rkOAKUzgWg3iBjmyCbiJuWP4tfGFnMKN5ErcIYf0jb
 jNbyZSf+qBoT5bEeGA4QTiJtwYPTKKc=
X-Google-Smtp-Source: ABdhPJzivnxdg4uwYTO9s34IycaEKC0liscUg/7SHIKGsTpDu0hLg9F4T5rLfBlKWXqlg0yGSirx9g==
X-Received: by 2002:a5d:6847:: with SMTP id o7mr13249603wrw.216.1612091666004; 
 Sun, 31 Jan 2021 03:14:26 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id 36sm23685585wrj.97.2021.01.31.03.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 03:14:25 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Anthony Green <green@moxielogic.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Walle <michael@walle.cc>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Marek Vasut <marex@denx.de>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Michael Rolnik <mrolnik@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 10/10] target: Move SEMIHOSTING feature to target Kconfig
Date: Sun, 31 Jan 2021 12:13:16 +0100
Message-Id: <20210131111316.232778-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131111316.232778-1-f4bug@amsat.org>
References: <20210131111316.232778-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 31 Jan 2021 11:14:32 -0000

SEMIHOSTING is an architecture feature, move its declaration to
each target/ARCH/.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 default-configs/devices/lm32-softmmu.mak        | 2 --
 default-configs/devices/m68k-softmmu.mak        | 2 --
 default-configs/devices/mips-softmmu-common.mak | 3 ---
 default-configs/devices/nios2-softmmu.mak       | 2 --
 default-configs/devices/unicore32-softmmu.mak   | 1 -
 default-configs/devices/xtensa-softmmu.mak      | 2 --
 target/lm32/Kconfig                             | 1 +
 target/m68k/Kconfig                             | 1 +
 target/mips/Kconfig                             | 1 +
 target/nios2/Kconfig                            | 1 +
 target/unicore32/Kconfig                        | 1 +
 target/xtensa/Kconfig                           | 1 +
 12 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/default-configs/devices/lm32-softmmu.mak b/default-configs/devices/lm32-softmmu.mak
index 1bce3f6e8b6..1f69795b749 100644
--- a/default-configs/devices/lm32-softmmu.mak
+++ b/default-configs/devices/lm32-softmmu.mak
@@ -4,8 +4,6 @@
 #
 #CONFIG_MILKYMIST_TMU2=n        # disabling it actually causes compile-time failures
 
-CONFIG_SEMIHOSTING=y
-
 # Boards:
 #
 CONFIG_LM32_EVR=y
diff --git a/default-configs/devices/m68k-softmmu.mak b/default-configs/devices/m68k-softmmu.mak
index 6629fd2aa33..4fef4bd731d 100644
--- a/default-configs/devices/m68k-softmmu.mak
+++ b/default-configs/devices/m68k-softmmu.mak
@@ -1,7 +1,5 @@
 # Default configuration for m68k-softmmu
 
-CONFIG_SEMIHOSTING=y
-
 # Boards:
 #
 CONFIG_AN5206=y
diff --git a/default-configs/devices/mips-softmmu-common.mak b/default-configs/devices/mips-softmmu-common.mak
index ea78fe72759..af652ec7bdd 100644
--- a/default-configs/devices/mips-softmmu-common.mak
+++ b/default-configs/devices/mips-softmmu-common.mak
@@ -1,8 +1,5 @@
 # Common mips*-softmmu CONFIG defines
 
-# CONFIG_SEMIHOSTING is always required on this architecture
-CONFIG_SEMIHOSTING=y
-
 CONFIG_ISA_BUS=y
 CONFIG_PCI=y
 CONFIG_PCI_DEVICES=y
diff --git a/default-configs/devices/nios2-softmmu.mak b/default-configs/devices/nios2-softmmu.mak
index 1bc4082ea99..e130d024e62 100644
--- a/default-configs/devices/nios2-softmmu.mak
+++ b/default-configs/devices/nios2-softmmu.mak
@@ -1,7 +1,5 @@
 # Default configuration for nios2-softmmu
 
-CONFIG_SEMIHOSTING=y
-
 # Boards:
 #
 CONFIG_NIOS2_10M50=y
diff --git a/default-configs/devices/unicore32-softmmu.mak b/default-configs/devices/unicore32-softmmu.mak
index 899288e3d71..0bfce48c6da 100644
--- a/default-configs/devices/unicore32-softmmu.mak
+++ b/default-configs/devices/unicore32-softmmu.mak
@@ -3,4 +3,3 @@
 # Boards:
 #
 CONFIG_PUV3=y
-CONFIG_SEMIHOSTING=y
diff --git a/default-configs/devices/xtensa-softmmu.mak b/default-configs/devices/xtensa-softmmu.mak
index 4fe1bf00c94..49e4c9da88c 100644
--- a/default-configs/devices/xtensa-softmmu.mak
+++ b/default-configs/devices/xtensa-softmmu.mak
@@ -1,7 +1,5 @@
 # Default configuration for Xtensa
 
-CONFIG_SEMIHOSTING=y
-
 # Boards:
 #
 CONFIG_XTENSA_SIM=y
diff --git a/target/lm32/Kconfig b/target/lm32/Kconfig
index 09de5b703a3..286710fd47b 100644
--- a/target/lm32/Kconfig
+++ b/target/lm32/Kconfig
@@ -1,2 +1,3 @@
 config LM32
     bool
+    select SEMIHOSTING
diff --git a/target/m68k/Kconfig b/target/m68k/Kconfig
index 23debad519a..9eae71486ff 100644
--- a/target/m68k/Kconfig
+++ b/target/m68k/Kconfig
@@ -1,2 +1,3 @@
 config M68K
     bool
+    select SEMIHOSTING
diff --git a/target/mips/Kconfig b/target/mips/Kconfig
index 6adf1453548..eb19c94c7d4 100644
--- a/target/mips/Kconfig
+++ b/target/mips/Kconfig
@@ -1,5 +1,6 @@
 config MIPS
     bool
+    select SEMIHOSTING
 
 config MIPS64
     bool
diff --git a/target/nios2/Kconfig b/target/nios2/Kconfig
index 1529ab8950d..c65550c861a 100644
--- a/target/nios2/Kconfig
+++ b/target/nios2/Kconfig
@@ -1,2 +1,3 @@
 config NIOS2
     bool
+    select SEMIHOSTING
diff --git a/target/unicore32/Kconfig b/target/unicore32/Kconfig
index 62c9d10b38f..c699d5238ea 100644
--- a/target/unicore32/Kconfig
+++ b/target/unicore32/Kconfig
@@ -1,2 +1,3 @@
 config UNICORE32
     bool
+    select SEMIHOSTING
diff --git a/target/xtensa/Kconfig b/target/xtensa/Kconfig
index a3c8dc7f6d7..5e46049262d 100644
--- a/target/xtensa/Kconfig
+++ b/target/xtensa/Kconfig
@@ -1,2 +1,3 @@
 config XTENSA
     bool
+    select SEMIHOSTING
-- 
2.26.2


