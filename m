Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B779EC47DDF
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 12:29:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rVWBS-0007rL-HR; Thu, 01 Feb 2024 07:28:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rVWBQ-0007qA-KM
 for qemu-riscv@nongnu.org; Thu, 01 Feb 2024 07:28:44 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rVWBO-0002Bg-Pm
 for qemu-riscv@nongnu.org; Thu, 01 Feb 2024 07:28:44 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-55a8fd60af0so1193226a12.1
 for <qemu-riscv@nongnu.org>; Thu, 01 Feb 2024 04:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706790521; x=1707395321; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j3+17aNm4Vprn5dUFdZGH0//LOKhFu0gJMaab5yZQOU=;
 b=xIioCV5/4kypAF5I4N0sFp48lHBk+K1/3Zf1HiT7ZoZ5tddrTcYIMiJUB8etzGz1D0
 U2VaIHAlWSEIpr5IGjwBze7BDCn5Op6HdZQZ63vCkXKN93fRAjqxeWEtNI9ua79sikTY
 p2EqCUJBaWVSGwHnQMtSN7xcN9ZPHVWLzgfo4Cb45vOIZeF8vcldvMSHlO13EL9ZuHW/
 vefVcwolh8CCVDzP3uXBp9da4jp8XB9MT934LS1nJ90E3LWPMuX8BX+t1sKnvoG8zaqU
 Vfg5abR1uSov1Af7MJUWNFEHOh0uPWcHqfxYj2tt56v70Ne9oZh9Nj3EllI4Ivdw76bf
 BTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706790521; x=1707395321;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j3+17aNm4Vprn5dUFdZGH0//LOKhFu0gJMaab5yZQOU=;
 b=nMeI9K+juHcemDuljiSje7EQO5KxNlZ9BZW6MpQquEBaWPYW7xfFyjTjWV9htAo5d8
 +z1wLYoat1U7cC0p+JGD0cQfw2FagVgQOyF66qiQ9S2ewHaIFOFXDHTUaDyFx6f1IvU7
 BVrjEgkizgqinKhfG6GLjwBC4fr82GGPL0ahUT7I0f7Yvvu4LznO5FZEcSxVsjiC3N9y
 JxRkHNt9e6gzcdPlu7S3ZkAoOa0hvy3ISMbmIwM+pj2K4WS315Xq6OWe3Z9LJi0SQ3tC
 +dXl94xvOoV21g8iCjjz3igvWAelhgFTvxBlEX7vofjXtHol8ev6jslO0hLsRTR/l83j
 bh9w==
X-Gm-Message-State: AOJu0YzcSbDucRAAcxg1vywZ1kH13SwstwycK7Tqif/8fnsDESQHGsg4
 kdcSB/Pu+KswwmabBo92iY5An4xxtbIIsECNDT4LGEUPEs+yVapnnXTd1ZXdcIk=
X-Google-Smtp-Source: AGHT+IE518aY9Zg+eW0NfNaa71Yqv2oSN/GwSxcHSYmRth6EnOr9d0+vlls0ehMypywlOjfWcp9eSA==
X-Received: by 2002:a05:6402:4584:b0:55f:a534:cac9 with SMTP id
 ig4-20020a056402458400b0055fa534cac9mr2654210edb.5.1706790521395; 
 Thu, 01 Feb 2024 04:28:41 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUnNVDM+JdlDDIQig7S6oprTdpmYSyTZijeGzcAI+jkLqJ1FqUcmr3lHzWTvaWs6+7pIaS0izkUppDkh2b5xcrOJwjXMar9S3OKr4SIIFh73tWmBrh6fX16mTRi1qGNADIFwHOjBCGcHRR/cRU0gwlhVOxJEnrgCYIQJjX2WvLkssMTzFC23h5XguiqGhzVffzcYqf6qp2+lEH/GtgZIBeyxtF1HZxqdWlJjWKMjs6ZaQNhg9ZbEvZEFFFkzCseUNIIAgsj2a7Z43uIy6vIRCUjx1dySRh21n0t133gnT9WZU+PQMxjCM8Hn5hcyhfK4yB7XgSG3NotnX8uKH4IUN4vBUPBswWwzcDGRx/Jm15pMUx/f+N3px1QajvMd+3jPz3mtL+NFm/EGQAbpoylSknRrbJyxQiPjTwVFS7mjUpdAh2UGS8KLNeAoLLfH0WaMQ6+YU7ML9ureVgUs09wHFmsa7vzskLpOnt2BKMecUwKwavtJdDKvVId/w0Gdwfy4bSKZfHCNEO5goCFJzswkNmiXfDaJEhVLTyXumJfFl+1TsgGDbFcCf5JWPnaUlI7unvtrQshkLZLPzhy5pJe+cTQLNqhNP0zP5yRcgLfhCm8KuPWdA9YX9GwxyOSx+xOK8HHkCds6LA=
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 p14-20020a056402500e00b0055c67e6454asm6815985eda.70.2024.02.01.04.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 04:28:39 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id C67425F9DD;
 Thu,  1 Feb 2024 12:28:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Bin Meng <bin.meng@windriver.com>,
 Laurent Vivier <laurent@vivier.eu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, devel@lists.libvirt.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Marek Vasut <marex@denx.de>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Thomas Huth <thuth@redhat.com>,
 qemu-riscv@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Chris Wulff <crwulff@gmail.com>
Subject: [PATCH 5/5] kconfig: use "select" to enable semihosting
Date: Thu,  1 Feb 2024 12:28:35 +0000
Message-Id: <20240201122835.1712347-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240201122835.1712347-1-alex.bennee@linaro.org>
References: <20240201122835.1712347-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Paolo Bonzini <pbonzini@redhat.com>

Just like all other dependencies, these can be expressed in Kconfig
files rather than in the default configurations.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20240129115809.1039924-1-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configs/devices/m68k-softmmu/default.mak    | 2 --
 configs/devices/mips-softmmu/common.mak     | 3 ---
 configs/devices/nios2-softmmu/default.mak   | 2 --
 configs/devices/riscv32-softmmu/default.mak | 2 --
 configs/devices/riscv64-softmmu/default.mak | 2 --
 configs/devices/xtensa-softmmu/default.mak  | 2 --
 target/m68k/Kconfig                         | 1 +
 target/mips/Kconfig                         | 1 +
 target/nios2/Kconfig                        | 1 +
 target/riscv/Kconfig                        | 2 ++
 target/xtensa/Kconfig                       | 1 +
 11 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/configs/devices/m68k-softmmu/default.mak b/configs/devices/m68k-softmmu/default.mak
index 7f8619e4278..8dcaa28ed38 100644
--- a/configs/devices/m68k-softmmu/default.mak
+++ b/configs/devices/m68k-softmmu/default.mak
@@ -1,7 +1,5 @@
 # Default configuration for m68k-softmmu
 
-CONFIG_SEMIHOSTING=y
-
 # Boards:
 #
 CONFIG_AN5206=y
diff --git a/configs/devices/mips-softmmu/common.mak b/configs/devices/mips-softmmu/common.mak
index 7da99327a77..1a853841b27 100644
--- a/configs/devices/mips-softmmu/common.mak
+++ b/configs/devices/mips-softmmu/common.mak
@@ -1,8 +1,5 @@
 # Common mips*-softmmu CONFIG defines
 
-# CONFIG_SEMIHOSTING is always required on this architecture
-CONFIG_SEMIHOSTING=y
-
 CONFIG_ISA_BUS=y
 CONFIG_PCI=y
 CONFIG_PCI_DEVICES=y
diff --git a/configs/devices/nios2-softmmu/default.mak b/configs/devices/nios2-softmmu/default.mak
index 1bc4082ea99..e130d024e62 100644
--- a/configs/devices/nios2-softmmu/default.mak
+++ b/configs/devices/nios2-softmmu/default.mak
@@ -1,7 +1,5 @@
 # Default configuration for nios2-softmmu
 
-CONFIG_SEMIHOSTING=y
-
 # Boards:
 #
 CONFIG_NIOS2_10M50=y
diff --git a/configs/devices/riscv32-softmmu/default.mak b/configs/devices/riscv32-softmmu/default.mak
index d847bd5692e..94a236c9c25 100644
--- a/configs/devices/riscv32-softmmu/default.mak
+++ b/configs/devices/riscv32-softmmu/default.mak
@@ -3,8 +3,6 @@
 # Uncomment the following lines to disable these optional devices:
 #
 #CONFIG_PCI_DEVICES=n
-CONFIG_SEMIHOSTING=y
-CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
 
 # Boards:
 #
diff --git a/configs/devices/riscv64-softmmu/default.mak b/configs/devices/riscv64-softmmu/default.mak
index bc69301fa4a..3f680594484 100644
--- a/configs/devices/riscv64-softmmu/default.mak
+++ b/configs/devices/riscv64-softmmu/default.mak
@@ -3,8 +3,6 @@
 # Uncomment the following lines to disable these optional devices:
 #
 #CONFIG_PCI_DEVICES=n
-CONFIG_SEMIHOSTING=y
-CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
 
 # Boards:
 #
diff --git a/configs/devices/xtensa-softmmu/default.mak b/configs/devices/xtensa-softmmu/default.mak
index 4fe1bf00c94..49e4c9da88c 100644
--- a/configs/devices/xtensa-softmmu/default.mak
+++ b/configs/devices/xtensa-softmmu/default.mak
@@ -1,7 +1,5 @@
 # Default configuration for Xtensa
 
-CONFIG_SEMIHOSTING=y
-
 # Boards:
 #
 CONFIG_XTENSA_SIM=y
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
diff --git a/target/riscv/Kconfig b/target/riscv/Kconfig
index b9e5932f13f..adb7de3f37d 100644
--- a/target/riscv/Kconfig
+++ b/target/riscv/Kconfig
@@ -1,5 +1,7 @@
 config RISCV32
     bool
+    select ARM_COMPATIBLE_SEMIHOSTING # for do_common_semihosting()
 
 config RISCV64
     bool
+    select ARM_COMPATIBLE_SEMIHOSTING # for do_common_semihosting()
diff --git a/target/xtensa/Kconfig b/target/xtensa/Kconfig
index a3c8dc7f6d7..5e46049262d 100644
--- a/target/xtensa/Kconfig
+++ b/target/xtensa/Kconfig
@@ -1,2 +1,3 @@
 config XTENSA
     bool
+    select SEMIHOSTING
-- 
2.39.2


