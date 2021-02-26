Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFcwm-00084F-Nb
	for mharc-qemu-riscv@gnu.org; Fri, 26 Feb 2021 08:14:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFcwl-00081k-6k; Fri, 26 Feb 2021 08:14:19 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFcwh-0004qa-AG; Fri, 26 Feb 2021 08:14:19 -0500
Received: by mail-wr1-x433.google.com with SMTP id u14so8553280wri.3;
 Fri, 26 Feb 2021 05:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lcg6YHwY0vi6q4edqMH5mvI18L4U1/uEX7m4g24yUqA=;
 b=L6XZeUD+9gq0CbemQtXHmUvxXAj4CBcSyZpy42YXDROpxxHipr7eWhFjzKMCHY6onZ
 7TM2iW737x1/of+MZCNZtLHjNT+PqLJQLW9lilFp14PmwwrVg4RJOJkq8ciIKO6MiP1x
 6zyVsPFP8XyUCPRvmIvuZlaHy3df/ri5vIBYXhzfJjAer6SqBM6Xj79GIBgbvMbu8YMO
 1LoCnX2ak1im6BQw+4nYoNZchFiaDA/dWNOQGZUcPIGVMDJoRe2F0YmDSb/jsPbpeHrD
 02Xj3BffIJlLmC/+JbP/phVBFZnC7IYU77jeAZU1IQDgtbps4i3XLFD0IP9yIDVNsGzk
 H3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lcg6YHwY0vi6q4edqMH5mvI18L4U1/uEX7m4g24yUqA=;
 b=OLIzZgBpQ8u098ozNMuwJo76Zs0l8yw5wOgyoPYtu+o/ONgkujKHGY7ulM2uTmjIcW
 XiY0l9+H226s0YQonRLj+Lb2MAUNdy3oYYCcd0NneZk3GKj52M+fxQ7PtxMCxso8JDwT
 k8LQV43hMKDCwgSK5RT8zC4JdMxjIS4AECitywOz6ZwwlyI1C2T2Qwc20AgQz091Qgs/
 4D0W2te36htXPMrNnSHR4TIN8wUqlDN4ENEtDjfBUI3D0T39GvWegktTXXkCNIR+T3Rm
 AFYckY1k2HXPW7XOxmYaVLrqaUncjaPcyDK9HF5SkyXBaSc8InCC9SQV0n+oh/BhM1fc
 tlzQ==
X-Gm-Message-State: AOAM531ghuFUF0M59wPhnBtiIm0UCaqrc54HOnNDK1MMxvaScdVtVXTB
 h0Lr6GCIFguqk8kfPc65MavrgYw+CtU=
X-Google-Smtp-Source: ABdhPJxw/BJLl+x3UpKw1D9kKs2dLZ4Z9AiT8ccG+kJ5jBw8weY+eYw3/J8cAuxzGoD2Hdtkz8LB0g==
X-Received: by 2002:adf:e444:: with SMTP id t4mr3302152wrm.97.1614345252281;
 Fri, 26 Feb 2021 05:14:12 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f2sm10140322wrq.34.2021.02.26.05.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 05:14:11 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>,
 Chris Wulff <crwulff@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-riscv@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Marek Vasut <marex@denx.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 2/2] semihosting: Move hw/semihosting/ -> semihosting/
Date: Fri, 26 Feb 2021 14:13:56 +0100
Message-Id: <20210226131356.3964782-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210226131356.3964782-1-f4bug@amsat.org>
References: <20210226131356.3964782-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
X-List-Received-Date: Fri, 26 Feb 2021 13:14:19 -0000

With the exception of hw/core/, the hw/ directory only contains
device models used in system emulation. Semihosting is also used
by user emulation. As a generic feature, move it out of hw/ directory.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 meson.build                                       | 1 +
 {hw/semihosting => semihosting}/common-semi.h     | 0
 {hw/semihosting => semihosting}/arm-compat-semi.c | 0
 {hw/semihosting => semihosting}/config.c          | 0
 {hw/semihosting => semihosting}/console.c         | 0
 Kconfig                                           | 1 +
 MAINTAINERS                                       | 2 +-
 hw/Kconfig                                        | 1 -
 hw/meson.build                                    | 1 -
 {hw/semihosting => semihosting}/Kconfig           | 0
 {hw/semihosting => semihosting}/meson.build       | 0
 11 files changed, 3 insertions(+), 3 deletions(-)
 rename {hw/semihosting => semihosting}/common-semi.h (100%)
 rename {hw/semihosting => semihosting}/arm-compat-semi.c (100%)
 rename {hw/semihosting => semihosting}/config.c (100%)
 rename {hw/semihosting => semihosting}/console.c (100%)
 rename {hw/semihosting => semihosting}/Kconfig (100%)
 rename {hw/semihosting => semihosting}/meson.build (100%)

diff --git a/meson.build b/meson.build
index 05a67c20d93..f2f9bb92520 100644
--- a/meson.build
+++ b/meson.build
@@ -1934,6 +1934,7 @@
 subdir('monitor')
 subdir('net')
 subdir('replay')
+subdir('semihosting')
 subdir('hw')
 subdir('accel')
 subdir('plugins')
diff --git a/hw/semihosting/common-semi.h b/semihosting/common-semi.h
similarity index 100%
rename from hw/semihosting/common-semi.h
rename to semihosting/common-semi.h
diff --git a/hw/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
similarity index 100%
rename from hw/semihosting/arm-compat-semi.c
rename to semihosting/arm-compat-semi.c
diff --git a/hw/semihosting/config.c b/semihosting/config.c
similarity index 100%
rename from hw/semihosting/config.c
rename to semihosting/config.c
diff --git a/hw/semihosting/console.c b/semihosting/console.c
similarity index 100%
rename from hw/semihosting/console.c
rename to semihosting/console.c
diff --git a/Kconfig b/Kconfig
index bf694c42afe..d52ebd839b3 100644
--- a/Kconfig
+++ b/Kconfig
@@ -2,3 +2,4 @@ source Kconfig.host
 source backends/Kconfig
 source accel/Kconfig
 source hw/Kconfig
+source semihosting/Kconfig
diff --git a/MAINTAINERS b/MAINTAINERS
index aacd4408125..9046b54cb2e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3224,7 +3224,7 @@ F: qapi/rdma.json
 Semihosting
 M: Alex Bennée <alex.bennee@linaro.org>
 S: Maintained
-F: hw/semihosting/
+F: semihosting/
 F: include/semihosting/
 
 Multi-process QEMU
diff --git a/hw/Kconfig b/hw/Kconfig
index 8ea26479c48..ff40bd3f7bb 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -31,7 +31,6 @@ source remote/Kconfig
 source rtc/Kconfig
 source scsi/Kconfig
 source sd/Kconfig
-source semihosting/Kconfig
 source smbios/Kconfig
 source ssi/Kconfig
 source timer/Kconfig
diff --git a/hw/meson.build b/hw/meson.build
index e615d72d4df..8ba79b1a528 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -30,7 +30,6 @@
 subdir('rtc')
 subdir('scsi')
 subdir('sd')
-subdir('semihosting')
 subdir('smbios')
 subdir('ssi')
 subdir('timer')
diff --git a/hw/semihosting/Kconfig b/semihosting/Kconfig
similarity index 100%
rename from hw/semihosting/Kconfig
rename to semihosting/Kconfig
diff --git a/hw/semihosting/meson.build b/semihosting/meson.build
similarity index 100%
rename from hw/semihosting/meson.build
rename to semihosting/meson.build
-- 
2.26.2


