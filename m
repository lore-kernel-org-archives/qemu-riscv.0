Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lpCHt-0008AB-Qj
	for mharc-qemu-riscv@gnu.org; Fri, 04 Jun 2021 12:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCHk-0007zL-NL
 for qemu-riscv@nongnu.org; Fri, 04 Jun 2021 12:03:01 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCHX-0005mD-P2
 for qemu-riscv@nongnu.org; Fri, 04 Jun 2021 12:02:59 -0400
Received: by mail-wr1-x435.google.com with SMTP id u7so4384411wrs.10
 for <qemu-riscv@nongnu.org>; Fri, 04 Jun 2021 09:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QeEI4sc2dcuV1npg4L31+R2Mrp6pBAsdJJMzJp4sGcE=;
 b=eeamy+HhDQrUpgVH84rB+qmGjwMURu271d/xyE/eihURSMWrojHNhK9ic0YqaT6WQY
 zBL/B3Y84IsrP05IvsCzv2rRf82cKNtu5awnNsqzk1eotP/Wb1ejksc02qKa3WdOF8jl
 Cc+1z8LbaawVjITEG0E1B0sQzYDEeuNG8KA+yumxqJ19AdWBkPgzWWKNhi903mSWaXoD
 KWLNy8dYo33CppPeNArEWdmf+CfowWChZjeRt+daX+onP9koJe3r7qevC3x/8O65hUh8
 qPRDcgF8RE6Aku8XrEuXQ8nmcXGFXTfpxCJmrDUORS/HPY+2pqgAjC6xHbBSEclRUyPB
 v11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QeEI4sc2dcuV1npg4L31+R2Mrp6pBAsdJJMzJp4sGcE=;
 b=d0NUod+9H8ae/nc6tDXPlMxNWWWEb+/LijjPNJfGolBKzJI9zW9uklGhyq1ih9gIBm
 fvh0usRBS0o+WqLrKHP7ebnYifT0HAVLIPYAh+Bv86ueTKfLbv35uy8yPzp3Fv/Ws+Gv
 sCxUv3rw2XncgS/xl71npyhjImeOz/iNGtKo1obAMRfE/xSl55Mn1JNn5mHhY2BzOWD5
 1g1hCi2K//CbFoooymO87iQtAb4Y1es+vLyV0jBeZnCZ1bV2vpt8YIIYqdL+jZG9RePL
 mY8S2wnv2tHAdI7h9a89jeSyFLznWATgCngeCZ9PVIenhzD0mBVq9/ff86mKgfUhXgNU
 Jm9Q==
X-Gm-Message-State: AOAM532QHCGjuiqkxo+3Aeq3BzElKpKj5UH5TNTApRH1MiCC21OS/Q+2
 o13rzA6gsDk84SS2+FKKxSf+sg==
X-Google-Smtp-Source: ABdhPJy3IOkRSpbL8eFa3ZXtQjudbo1pdxVtFXKrGt0zwpoTWtwW417L8IQdlznYobp/Txu6JAiNIA==
X-Received: by 2002:a5d:414e:: with SMTP id c14mr4484404wrq.81.1622822566165; 
 Fri, 04 Jun 2021 09:02:46 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n9sm8226282wrt.81.2021.06.04.09.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:02:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 50DBB2001C;
 Fri,  4 Jun 2021 16:53:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
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
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org (open list:PowerPC TCG CPUs),
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs)
Subject: [PATCH  v16 93/99] meson: Introduce target-specific Kconfig
Date: Fri,  4 Jun 2021 16:53:06 +0100
Message-Id: <20210604155312.15902-94-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 04 Jun 2021 16:03:01 -0000

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Add a target-specific Kconfig.

Target foo now has CONFIG_FOO defined.

Two architecture have a particularity, ARM and MIPS:
their 64-bit version include the 32-bit subset.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210131111316.232778-6-f4bug@amsat.org>
---
 meson.build               |  3 ++-
 Kconfig                   |  1 +
 target/Kconfig            | 23 +++++++++++++++++++++++
 target/alpha/Kconfig      |  2 ++
 target/arm/Kconfig        |  6 ++++++
 target/avr/Kconfig        |  2 ++
 target/cris/Kconfig       |  2 ++
 target/hppa/Kconfig       |  2 ++
 target/i386/Kconfig       |  5 +++++
 target/lm32/Kconfig       |  2 ++
 target/m68k/Kconfig       |  2 ++
 target/microblaze/Kconfig |  2 ++
 target/mips/Kconfig       |  6 ++++++
 target/moxie/Kconfig      |  2 ++
 target/nios2/Kconfig      |  2 ++
 target/openrisc/Kconfig   |  2 ++
 target/ppc/Kconfig        |  5 +++++
 target/riscv/Kconfig      |  5 +++++
 target/rx/Kconfig         |  2 ++
 target/s390x/Kconfig      |  2 ++
 target/sh4/Kconfig        |  2 ++
 target/sparc/Kconfig      |  5 +++++
 target/tilegx/Kconfig     |  2 ++
 target/tricore/Kconfig    |  2 ++
 target/unicore32/Kconfig  |  2 ++
 target/xtensa/Kconfig     |  2 ++
 26 files changed, 92 insertions(+), 1 deletion(-)
 create mode 100644 target/Kconfig
 create mode 100644 target/alpha/Kconfig
 create mode 100644 target/arm/Kconfig
 create mode 100644 target/avr/Kconfig
 create mode 100644 target/cris/Kconfig
 create mode 100644 target/hppa/Kconfig
 create mode 100644 target/i386/Kconfig
 create mode 100644 target/lm32/Kconfig
 create mode 100644 target/m68k/Kconfig
 create mode 100644 target/microblaze/Kconfig
 create mode 100644 target/mips/Kconfig
 create mode 100644 target/moxie/Kconfig
 create mode 100644 target/nios2/Kconfig
 create mode 100644 target/openrisc/Kconfig
 create mode 100644 target/ppc/Kconfig
 create mode 100644 target/riscv/Kconfig
 create mode 100644 target/rx/Kconfig
 create mode 100644 target/s390x/Kconfig
 create mode 100644 target/sh4/Kconfig
 create mode 100644 target/sparc/Kconfig
 create mode 100644 target/tilegx/Kconfig
 create mode 100644 target/tricore/Kconfig
 create mode 100644 target/unicore32/Kconfig
 create mode 100644 target/xtensa/Kconfig

diff --git a/meson.build b/meson.build
index e2a22984b8..09c7809d6b 100644
--- a/meson.build
+++ b/meson.build
@@ -1359,7 +1359,8 @@ foreach target : target_dirs
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
index 0000000000..a6f719f223
--- /dev/null
+++ b/target/Kconfig
@@ -0,0 +1,23 @@
+source alpha/Kconfig
+source arm/Kconfig
+source avr/Kconfig
+source cris/Kconfig
+source hppa/Kconfig
+source i386/Kconfig
+source lm32/Kconfig
+source m68k/Kconfig
+source microblaze/Kconfig
+source mips/Kconfig
+source moxie/Kconfig
+source nios2/Kconfig
+source openrisc/Kconfig
+source ppc/Kconfig
+source riscv/Kconfig
+source rx/Kconfig
+source s390x/Kconfig
+source sh4/Kconfig
+source sparc/Kconfig
+source tilegx/Kconfig
+source tricore/Kconfig
+source unicore32/Kconfig
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
diff --git a/target/lm32/Kconfig b/target/lm32/Kconfig
new file mode 100644
index 0000000000..09de5b703a
--- /dev/null
+++ b/target/lm32/Kconfig
@@ -0,0 +1,2 @@
+config LM32
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
diff --git a/target/moxie/Kconfig b/target/moxie/Kconfig
new file mode 100644
index 0000000000..52391bbd28
--- /dev/null
+++ b/target/moxie/Kconfig
@@ -0,0 +1,2 @@
+config MOXIE
+    bool
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
diff --git a/target/tilegx/Kconfig b/target/tilegx/Kconfig
new file mode 100644
index 0000000000..aad882826a
--- /dev/null
+++ b/target/tilegx/Kconfig
@@ -0,0 +1,2 @@
+config TILEGX
+    bool
diff --git a/target/tricore/Kconfig b/target/tricore/Kconfig
new file mode 100644
index 0000000000..9313409309
--- /dev/null
+++ b/target/tricore/Kconfig
@@ -0,0 +1,2 @@
+config TRICORE
+    bool
diff --git a/target/unicore32/Kconfig b/target/unicore32/Kconfig
new file mode 100644
index 0000000000..62c9d10b38
--- /dev/null
+++ b/target/unicore32/Kconfig
@@ -0,0 +1,2 @@
+config UNICORE32
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


