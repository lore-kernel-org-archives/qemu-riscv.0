Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lvLjv-00069i-LT
	for mharc-qemu-riscv@gnu.org; Mon, 21 Jun 2021 11:21:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lvLju-00065s-AK
 for qemu-riscv@nongnu.org; Mon, 21 Jun 2021 11:21:30 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:34365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lvLjp-0000Tk-Nw
 for qemu-riscv@nongnu.org; Mon, 21 Jun 2021 11:21:30 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso113638wmc.1
 for <qemu-riscv@nongnu.org>; Mon, 21 Jun 2021 08:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bRXfzHb9Ja1eg0zoC+HYXEXnUyw677YmM0+TU1OM9Y4=;
 b=t8gNoqqVNOoHnicwAnKqDXNC5SQIxAubiS4fUAQJW/HKdAsA79YG9uSCSkU9aI37g3
 C1ZBrZPsmSWkqrmWn3UWFzR3VlJX8bZGk4X2b1KMcsbnCFpp9sAwdoNp3XFeOP5lLuT8
 P/W7avS1t6Q4auYa67utGTfwA1kU3LKm+yWQO/XT8BzvA0LLjgz8wrzvl4Pqo06thW41
 WJC1aX5aaxEpiO4y12K0lkmoT8Jz5e8AvVj/tWGbkvIHSFsrofmYi3WcuefCYWHESEmj
 OWzW70gjtIPBZpa5brc6f7OIdKIcNqqSZcDyRN7WmdTyNPTa5F4N8+Vq1lbvgO1KUP9J
 8TFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bRXfzHb9Ja1eg0zoC+HYXEXnUyw677YmM0+TU1OM9Y4=;
 b=DK95I45SRnn438bQRgY+AEhHdwUzJF4usMi6INrjzl90tU/RT8riB0yHOlvi60RsGa
 u5Yseiom3aLL9JG7v68FC/4lH7Lrs5C7SanZWljY60nacMUUTw78GBX8OrnrhDHwHj0B
 a1RSOVZAJGJpvrbCATWr7AHQd4Qqkiv9SI7P04gSiLw9/0xIUCWFiMiQJZ8Bjmm7gqt3
 hzshSp4YM3slAX8wC+1xjBZegpGzNk2fOq6t7asvvo4oUZCJEt7XkVgvjOyaj66CqaYd
 O/Lh5+9BjBawYDdc/gfkyDDp88ZgMiU2ev1m6mEWTGzfOl4OeseZ4ooQ0adHPdLAwSKR
 og1w==
X-Gm-Message-State: AOAM532OQSli8tjjRIZwjfDaRfEPKlUOYcRHlSOf3tuyfR4aVH14olQM
 7D3nFldaVh2dU5V93vLbCeXqOw==
X-Google-Smtp-Source: ABdhPJxN/E4jvNXrwmW+ghGvMstHI4J9yLCD4R7TPefGQKM93czY450U/PKB1gSXF5GQtPoVve3JzA==
X-Received: by 2002:a7b:c099:: with SMTP id r25mr28087183wmh.144.1624288882929; 
 Mon, 21 Jun 2021 08:21:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 197sm1773881wmb.20.2021.06.21.08.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 08:21:21 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 97AAC1FF87;
 Mon, 21 Jun 2021 16:21:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs),
 qemu-ppc@nongnu.org (open list:PowerPC TCG CPUs),
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 qemu-s390x@nongnu.org (open list:S390 general arch...)
Subject: [PATCH  v1 1/5] meson: Introduce target-specific Kconfig
Date: Mon, 21 Jun 2021 16:21:16 +0100
Message-Id: <20210621152120.4465-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621152120.4465-1-alex.bennee@linaro.org>
References: <20210621152120.4465-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Mon, 21 Jun 2021 15:21:30 -0000

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Add a target-specific Kconfig. We need the definitions in Kconfig so
the minikconf tool can verify they exit. However CONFIG_FOO is only
enabled for target foo via the meson.build rules.

Two architecture have a particularity, ARM and MIPS:
their 64-bit version include the 32-bit subset.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210131111316.232778-6-f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
vajb:
  - removed targets that no longer exist
  - reword commit message to show why we need the Kconfigs
---
 meson.build               |  3 ++-
 Kconfig                   |  1 +
 target/Kconfig            | 19 +++++++++++++++++++
 target/alpha/Kconfig      |  2 ++
 target/arm/Kconfig        |  6 ++++++
 target/avr/Kconfig        |  2 ++
 target/cris/Kconfig       |  2 ++
 target/hppa/Kconfig       |  2 ++
 target/i386/Kconfig       |  5 +++++
 target/m68k/Kconfig       |  2 ++
 target/microblaze/Kconfig |  2 ++
 target/mips/Kconfig       |  6 ++++++
 target/nios2/Kconfig      |  2 ++
 target/openrisc/Kconfig   |  2 ++
 target/ppc/Kconfig        |  5 +++++
 target/riscv/Kconfig      |  5 +++++
 target/rx/Kconfig         |  2 ++
 target/s390x/Kconfig      |  2 ++
 target/sh4/Kconfig        |  2 ++
 target/sparc/Kconfig      |  5 +++++
 target/tricore/Kconfig    |  2 ++
 target/xtensa/Kconfig     |  2 ++
 22 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 target/Kconfig
 create mode 100644 target/alpha/Kconfig
 create mode 100644 target/arm/Kconfig
 create mode 100644 target/avr/Kconfig
 create mode 100644 target/cris/Kconfig
 create mode 100644 target/hppa/Kconfig
 create mode 100644 target/i386/Kconfig
 create mode 100644 target/m68k/Kconfig
 create mode 100644 target/microblaze/Kconfig
 create mode 100644 target/mips/Kconfig
 create mode 100644 target/nios2/Kconfig
 create mode 100644 target/openrisc/Kconfig
 create mode 100644 target/ppc/Kconfig
 create mode 100644 target/riscv/Kconfig
 create mode 100644 target/rx/Kconfig
 create mode 100644 target/s390x/Kconfig
 create mode 100644 target/sh4/Kconfig
 create mode 100644 target/sparc/Kconfig
 create mode 100644 target/tricore/Kconfig
 create mode 100644 target/xtensa/Kconfig

diff --git a/meson.build b/meson.build
index d8a92666fb..3ddd22ab7a 100644
--- a/meson.build
+++ b/meson.build
@@ -1377,7 +1377,8 @@ foreach target : target_dirs
       command: [minikconf,
                 get_option('default_devices') ? '--defconfig' : '--allnoconfig',
                 config_devices_mak, '@DEPFILE@', '@INPUT@',
-                host_kconfig, accel_kconfig])
+                host_kconfig, accel_kconfig,
+                'CONFIG_' + config_target['TARGET_ARCH'].to_upper() + '=y'])
 
     config_devices_data = configuration_data()
     config_devices = keyval.load(config_devices_mak)
diff --git a/Kconfig b/Kconfig
index d52ebd839b..fb6a24a2de 100644
--- a/Kconfig
+++ b/Kconfig
@@ -1,5 +1,6 @@
 source Kconfig.host
 source backends/Kconfig
 source accel/Kconfig
+source target/Kconfig
 source hw/Kconfig
 source semihosting/Kconfig
diff --git a/target/Kconfig b/target/Kconfig
new file mode 100644
index 0000000000..ae7f24fc66
--- /dev/null
+++ b/target/Kconfig
@@ -0,0 +1,19 @@
+source alpha/Kconfig
+source arm/Kconfig
+source avr/Kconfig
+source cris/Kconfig
+source hppa/Kconfig
+source i386/Kconfig
+source m68k/Kconfig
+source microblaze/Kconfig
+source mips/Kconfig
+source nios2/Kconfig
+source openrisc/Kconfig
+source ppc/Kconfig
+source riscv/Kconfig
+source rx/Kconfig
+source s390x/Kconfig
+source sh4/Kconfig
+source sparc/Kconfig
+source tricore/Kconfig
+source xtensa/Kconfig
diff --git a/target/alpha/Kconfig b/target/alpha/Kconfig
new file mode 100644
index 0000000000..267222c05b
--- /dev/null
+++ b/target/alpha/Kconfig
@@ -0,0 +1,2 @@
+config ALPHA
+    bool
diff --git a/target/arm/Kconfig b/target/arm/Kconfig
new file mode 100644
index 0000000000..3f3394a22b
--- /dev/null
+++ b/target/arm/Kconfig
@@ -0,0 +1,6 @@
+config ARM
+    bool
+
+config AARCH64
+    bool
+    select ARM
diff --git a/target/avr/Kconfig b/target/avr/Kconfig
new file mode 100644
index 0000000000..155592d353
--- /dev/null
+++ b/target/avr/Kconfig
@@ -0,0 +1,2 @@
+config AVR
+    bool
diff --git a/target/cris/Kconfig b/target/cris/Kconfig
new file mode 100644
index 0000000000..3fdc309fbb
--- /dev/null
+++ b/target/cris/Kconfig
@@ -0,0 +1,2 @@
+config CRIS
+    bool
diff --git a/target/hppa/Kconfig b/target/hppa/Kconfig
new file mode 100644
index 0000000000..395a35d799
--- /dev/null
+++ b/target/hppa/Kconfig
@@ -0,0 +1,2 @@
+config HPPA
+    bool
diff --git a/target/i386/Kconfig b/target/i386/Kconfig
new file mode 100644
index 0000000000..ce6968906e
--- /dev/null
+++ b/target/i386/Kconfig
@@ -0,0 +1,5 @@
+config I386
+    bool
+
+config X86_64
+    bool
diff --git a/target/m68k/Kconfig b/target/m68k/Kconfig
new file mode 100644
index 0000000000..23debad519
--- /dev/null
+++ b/target/m68k/Kconfig
@@ -0,0 +1,2 @@
+config M68K
+    bool
diff --git a/target/microblaze/Kconfig b/target/microblaze/Kconfig
new file mode 100644
index 0000000000..a5410d9218
--- /dev/null
+++ b/target/microblaze/Kconfig
@@ -0,0 +1,2 @@
+config MICROBLAZE
+    bool
diff --git a/target/mips/Kconfig b/target/mips/Kconfig
new file mode 100644
index 0000000000..6adf145354
--- /dev/null
+++ b/target/mips/Kconfig
@@ -0,0 +1,6 @@
+config MIPS
+    bool
+
+config MIPS64
+    bool
+    select MIPS
diff --git a/target/nios2/Kconfig b/target/nios2/Kconfig
new file mode 100644
index 0000000000..1529ab8950
--- /dev/null
+++ b/target/nios2/Kconfig
@@ -0,0 +1,2 @@
+config NIOS2
+    bool
diff --git a/target/openrisc/Kconfig b/target/openrisc/Kconfig
new file mode 100644
index 0000000000..e0da4ac1df
--- /dev/null
+++ b/target/openrisc/Kconfig
@@ -0,0 +1,2 @@
+config OPENRISC
+    bool
diff --git a/target/ppc/Kconfig b/target/ppc/Kconfig
new file mode 100644
index 0000000000..3ff152051a
--- /dev/null
+++ b/target/ppc/Kconfig
@@ -0,0 +1,5 @@
+config PPC
+    bool
+
+config PPC64
+    bool
diff --git a/target/riscv/Kconfig b/target/riscv/Kconfig
new file mode 100644
index 0000000000..b9e5932f13
--- /dev/null
+++ b/target/riscv/Kconfig
@@ -0,0 +1,5 @@
+config RISCV32
+    bool
+
+config RISCV64
+    bool
diff --git a/target/rx/Kconfig b/target/rx/Kconfig
new file mode 100644
index 0000000000..aceb5ed28f
--- /dev/null
+++ b/target/rx/Kconfig
@@ -0,0 +1,2 @@
+config RX
+    bool
diff --git a/target/s390x/Kconfig b/target/s390x/Kconfig
new file mode 100644
index 0000000000..72da48136c
--- /dev/null
+++ b/target/s390x/Kconfig
@@ -0,0 +1,2 @@
+config S390X
+    bool
diff --git a/target/sh4/Kconfig b/target/sh4/Kconfig
new file mode 100644
index 0000000000..2397c86028
--- /dev/null
+++ b/target/sh4/Kconfig
@@ -0,0 +1,2 @@
+config SH4
+    bool
diff --git a/target/sparc/Kconfig b/target/sparc/Kconfig
new file mode 100644
index 0000000000..70cc0f3a21
--- /dev/null
+++ b/target/sparc/Kconfig
@@ -0,0 +1,5 @@
+config SPARC
+    bool
+
+config SPARC64
+    bool
diff --git a/target/tricore/Kconfig b/target/tricore/Kconfig
new file mode 100644
index 0000000000..9313409309
--- /dev/null
+++ b/target/tricore/Kconfig
@@ -0,0 +1,2 @@
+config TRICORE
+    bool
diff --git a/target/xtensa/Kconfig b/target/xtensa/Kconfig
new file mode 100644
index 0000000000..a3c8dc7f6d
--- /dev/null
+++ b/target/xtensa/Kconfig
@@ -0,0 +1,2 @@
+config XTENSA
+    bool
-- 
2.20.1


